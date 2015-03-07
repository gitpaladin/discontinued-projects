unit SMSFind;

interface

uses
  Classes, ADODB, StdCtrls, GerneralFunc;

type
  TSMSProgUpdated = procedure(Total, Current: Integer) of object;
  TSMSProgComplete = procedure of object;

  TSMSFind = class(TThread)
  private
    { Private declarations }
    FTotalCount: Integer;
    FCurrent: Integer;
    procedure FSearchReceive;
    procedure FSearchSend;
    procedure FSearchFinish;
    procedure FSearchDraft;
    procedure FEventNotify;
    function FSearchContact(AStr: String): Boolean; overload;
    function FSearchContact(dbItem: TADOTable; InteralID: Integer): Boolean; overload;
    function FSearchContent(AStr: String): Boolean;
  protected
    procedure Execute; override;
  public
    OnProgressUpdated: TSMSProgUpdated;
    OnProgressCompleted: TSMSProgComplete;
    DataSource: TADOConnection;
    Box: TCurrentView;
    Contact: TStringList;
    Content: TStringList;
    EnableTimeBefore: Boolean;
    EnableTimeAfter: Boolean;
    TimeBefore: TDateTime;
    TimeAfter: TDateTime;
    Read: TCheckBoxState;
    Replied:  TCheckBoxState;
    Transmitted: TCheckBoxState;
    Finished: Boolean;
    Result: TList;
    Canceled: Boolean;
    procedure Free;
    constructor Create(CreateSuspended: Boolean);
  end;

implementation

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TSMSFind.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

uses
  DateUtils, SysUtils, Windows, Dialogs;

{ TSMSFind }
constructor TSMSFind.Create(CreateSuspended: Boolean);
begin
  Contact := TStringList.Create;
  Content := TStringList.Create;
  Result := TList.Create;
  inherited Create(CreateSuspended);
end;

procedure TSMSFind.Free;
begin
  Terminate;
  Contact.Free;
  Content.Free;
  Result.Clear;
  Result.Free;
  inherited;
end;

procedure TSMSFind.FEventNotify;
begin
  OnProgressUpdated(FTotalCount, FCurrent);
end;

procedure TSMSFind.Execute;
begin
  // 查找内容
  while not Terminated do
  begin
    if not Assigned(DataSource) then
      Suspended := True;

    case Box of
      cvReceive: FSearchReceive;
      cvSend: FSearchSend;
      cvFinish: FSearchFinish;
      cvDraft: FSearchDraft;
    end;

    Suspended := True;
  end;
end;

// 查找匹配的联系人
function TSMSFind.FSearchContact(AStr: String): Boolean;
var
  i: Integer;
begin
  Result := Contact.Count = 0;

  for i := 0 to Contact.Count - 1 do
    if Pos(Contact[i], AStr) <> 0 then
    begin
      Result := True;
      Exit;
    end;
end;

// 查找匹配的联系人多个联系人
function TSMSFind.FSearchContact(dbItem: TADOTable; InteralID: Integer): Boolean;
begin
  Result := Contact.Count = 0;
  if Result then Exit;

  // 逐个查找
  dbItem.Filtered := False;
  dbItem.Filter := 'associatedid = ' + IntToStr(InteralID);
  dbItem.Filtered := True;

  if dbItem.RecordCount = 0 then
    Exit
  else
  begin
    dbItem.First;

    while not dbItem.Eof do
      if FSearchContact(dbItem.FieldByName('name').AsString) then
      begin
        Result := True;
        Exit;
      end
      else
        dbItem.Next;
  end;

end;

// 查找匹配的内容字符串
function TSMSFind.FSearchContent(AStr: String): Boolean;
var
  i: Integer;
begin
  Result := Content.Count = 0;
  for i := 0 to Content.Count - 1 do
    if Pos(Content[i], AStr) <> 0 then
    begin
      Result := True;
      Exit;
    end;
end;

// 查找收到的信息
procedure TSMSFind.FSearchReceive;
label
  NextRec;
var
  db: TADOTable;
  pData: PShortMessageEntry;
  AFilter: TStringList;
begin
  // 数据库过滤
  AFilter := TStringList.Create;
  if EnableTimeBefore then AFilter.Add('receivedate <= #'+ DateToStr(TimeBefore) + '#');
  if EnableTimeAfter then AFilter.Add('receivedate >= #'+ DateToStr(TimeAfter) + '#');
  if (Read <> cbGrayed) then AFilter.Add('read = ' + BoolToStr(Read = cbChecked, True));
  if (Replied <> cbGrayed) then AFilter.Add('replied = ' + BoolToStr(Replied = cbChecked, True));
  if (Transmitted <> cbGrayed) then AFilter.Add('transmitted = ' + BoolToStr(Transmitted = cbChecked, True));

  db := TADOTable.Create(nil);
  db.Connection := DataSource;
  db.TableName := 'receive';
  db.Filter := CombineSQL(AFilter);
  db.Filtered := AFilter.Count > 0;
  db.Open;

  FTotalCount := db.RecordCount;
  FCurrent := 0;
  Result.Clear;

  while not db.Eof do
  begin
    // 激活事件
    Inc(FCurrent);
    if Assigned(OnProgressUpdated) then Synchronize(FEventNotify);

    // 判断信息
    if not FSearchContact(db.FieldByName('sender').AsString) then goto NextRec;
    if not FSearchContent(db.FieldByName('content').AsString) then goto NextRec;
//    if EnableTimeBefore and (CompareDate(db.FieldByName('receivedate').AsDateTime, TimeBefore) = 1) then goto NextRec;
//    if EnableTimeAfter and (CompareDate(db.FieldByName('receivedate').AsDateTime, TimeAfter) = -1) then goto NextRec;
//    if (Read <> cbGrayed) and (db.FieldByName('read').AsBoolean <> Boolean(Read)) then goto NextRec;
//    if (Replied <> cbGrayed) and (db.FieldByName('replied').AsBoolean <> Boolean(Replied)) then goto NextRec;
//    if (Transmitted <> cbGrayed) and (db.FieldByName('transmitted').AsBoolean <> Boolean(Transmitted)) then goto NextRec;

    // 添加到列表中
    New(pData);
    pData.InternalID := db.FieldByName('internalid').AsInteger;
    pData.DateTime := db.FieldByName('receivedate').AsDateTime;
    pData.Sender := db.FieldByName('sender').AsString;
    pData.PhoneNumber := db.FieldByName('sendernumber').AsString;
    pData.Content := db.FieldByName('content').AsString;
    pData.Replied := db.FieldByName('replied').AsBoolean;
    pData.Read := db.FieldByName('read').AsBoolean;
    pData.Transmitted := db.FieldByName('transmitted').AsBoolean;
    pData.PhoneClient := db.FieldByName('id').AsInteger > 0;
    pData.MessageCount := 1;
    Result.Add(pData);

NextRec:
    db.Next;

    // 是否中止
    if Canceled then
    begin
      Canceled := False;
      FCurrent := FTotalCount;
      Synchronize(FEventNotify);
      Break;
    end;      
  end;

  db.Close;
  db.Free;
  AFilter.Free;

  if Assigned(OnProgressCompleted) then
    OnProgressCompleted;
end;

// 查找发件箱的消息
procedure TSMSFind.FSearchSend;
label
  NextRec;
var
  db: TADOTable;
  pData: PShortMessageEntry;
  AFilter: TStringList;
begin
  // 数据库过滤
  AFilter := TStringList.Create;
  if EnableTimeBefore then AFilter.Add('senderdate <= #'+ DateToStr(TimeBefore) + '#');
  if EnableTimeAfter then AFilter.Add('senderdate >= #'+ DateToStr(TimeAfter) + '#');

  db := TADOTable.Create(nil);
  db.Connection := DataSource;
  db.TableName := 'send';
  db.Filter := CombineSQL(AFilter);
  db.Filtered := AFilter.Count > 0;
  db.Open;

  FTotalCount := db.RecordCount;
  FCurrent := 0;
  Result.Clear;

  while not db.Eof do
  begin
    // 激活事件
    Inc(FCurrent);
    if Assigned(OnProgressUpdated) then Synchronize(FEventNotify);

    // 判断信息
    if not FSearchContact(db.FieldByName('addressee').AsString) then goto NextRec;
    if not FSearchContent(db.FieldByName('content').AsString) then goto NextRec;

    // 添加到列表中
    New(pData);
    pData.DateTime := db.FieldByName('senderdate').AsDateTime;
    pData.Sender := db.FieldByName('addressee').AsString;
    pData.PhoneNumber := db.FieldByName('number').AsString;
    pData.Content := db.FieldByName('content').AsString;
    pData.InternalID := db.FieldByName('internalid').AsInteger;
    pData.Read := True;
    pData.Transmitted := False;
    pData.PhoneClient := False;
    pData.MessageCount := 1;
    Result.Add(pData);

NextRec:
    db.Next;

    // 是否中止
    if Canceled then
    begin
      Canceled := False;
      FCurrent := FTotalCount;
      Synchronize(FEventNotify);
      Break;
    end;      
  end;

  db.Close;
  db.Free;
  AFilter.Free;

  if Assigned(OnProgressCompleted) then
    OnProgressCompleted;
end;

// 查找已发短信的消息
procedure TSMSFind.FSearchFinish;
label
  NextRec;
var
  db: TADOTable;
  dbItem: TADOTable;
  pData: PShortMessageEntry;
  AFilter: TStringList;
begin
  // 数据库过滤
  AFilter := TStringList.Create;
  if EnableTimeBefore then AFilter.Add('senderdate <= #'+ DateToStr(TimeBefore) + '#');
  if EnableTimeAfter then AFilter.Add('senderdate >= #'+ DateToStr(TimeAfter) + '#');
  if (Transmitted <> cbGrayed) then AFilter.Add('transmitted = ' + BoolToStr(Transmitted = cbChecked, True));

  db := TADOTable.Create(nil);
  db.Connection := DataSource;
  db.TableName := 'finish_detail';
  db.Filter := CombineSQL(AFilter);
  db.Filtered := AFilter.Count > 0;
  db.Open;

  dbItem := TADOTable.Create(nil);
  dbItem.Connection := DataSource;
  dbItem.TableName := 'finish_item';
  dbItem.Open;

  FTotalCount := db.RecordCount;
  FCurrent := 0;
  Result.Clear;

  while not db.Eof do
  begin
    // 激活事件
    Inc(FCurrent);
    if Assigned(OnProgressUpdated) then Synchronize(FEventNotify);

    // 判断信息
    if not FSearchContact(dbItem, db.FieldByName('internalid').AsInteger) then goto NextRec;
    if not FSearchContent(db.FieldByName('content').AsString) then goto NextRec;

    // 添加到列表中
    New(pData);
    pData.InternalID := db.FieldByName('internalid').AsInteger;
    pData.DateTime := db.FieldByName('senderdate').AsDateTime;
    pData.Sender := db.FieldByName('name').AsString;;
    pData.PhoneNumber := db.FieldByName('number').AsString;
    pData.Content := db.FieldByName('content').AsString;
    pData.Read := True;
    pData.Transmitted := db.FieldByName('transmitted').AsBoolean;
    pData.MessageCount := db.FieldByName('count').AsInteger;
    pData.PhoneClient := db.FieldByName('id').AsInteger > 0;
    Result.Add(pData);

NextRec:
    db.Next;

    // 是否中止
    if Canceled then
    begin
      Canceled := False;
      FCurrent := FTotalCount;
      Synchronize(FEventNotify);
      Break;
    end;      
  end;

  db.Close;
  db.Free;
  dbItem.Close;
  dbItem.Free;
  AFilter.Free;

  if Assigned(OnProgressCompleted) then
    OnProgressCompleted;
end;

// 查找草稿中的消息
procedure TSMSFind.FSearchDraft;
label
  NextRec;
var
  db: TADOTable;
  dbItem: TADOTable;
  pData: PShortMessageEntry;
  AFilter: TStringList;
begin
  // 数据库过滤
  AFilter := TStringList.Create;
  if EnableTimeBefore then AFilter.Add('date <= #'+ DateToStr(TimeBefore) + '#');
  if EnableTimeAfter then AFilter.Add('date >= #'+ DateToStr(TimeAfter) + '#');

  db := TADOTable.Create(nil);
  db.Connection := DataSource;
  db.TableName := 'draft_detail';
  db.Filter := CombineSQL(AFilter);
  db.Filtered := AFilter.Count > 0;
  db.Open;

  dbItem := TADOTable.Create(nil);
  dbItem.Connection := DataSource;
  dbItem.TableName := 'draft_item';
  dbItem.Open;

  FTotalCount := db.RecordCount;
  FCurrent := 0;
  Result.Clear;

  while not db.Eof do
  begin
    // 激活事件
    Inc(FCurrent);
    if Assigned(OnProgressUpdated) then Synchronize(FEventNotify);

    // 判断信息
    if not FSearchContact(dbItem, db.FieldByName('internalid').AsInteger) then goto NextRec;
    if not FSearchContent(db.FieldByName('content').AsString) then goto NextRec;

    // 添加到列表中
    New(pData);
    pData.DateTime := db.FieldByName('date').AsDateTime;
    pData.Sender := db.FieldByName('name').AsString;
    pData.PhoneNumber := db.FieldByName('number').AsString;
    pData.Content := db.FieldByName('content').AsString;
    pData.InternalID := db.FieldByName('internalid').AsInteger;
    pData.MessageCount := db.FieldByName('count').AsInteger;
    pData.Read := True;
    pData.PhoneClient := db.FieldByName('id').AsInteger > 0;
    Result.Add(pData);

NextRec:
    db.Next;

    // 是否中止
    if Canceled then
    begin
      Canceled := False;
      FCurrent := FTotalCount;
      Synchronize(FEventNotify);
      Break;
    end;      
  end;

  db.Close;
  db.Free;
  dbItem.Close;
  dbItem.Free;
  AFilter.Free;

  if Assigned(OnProgressCompleted) then
    OnProgressCompleted;
end;

end.
