unit uFraContact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, Buttons, CnAAFont, CnAACtrls;

type
  TfraContact = class(TFrame)
    imgContact: TImage;
    shpSeparator: TShape;
    lblCategory: TLabel;
    imgCategory: TImage;
    txtCategory: TLabel;
    lblFolder: TLabel;
    imgFolder: TImage;
    txtFolder: TLabel;
    lblRecCount: TLabel;
    imgRecCount: TImage;
    txtRecCount: TLabel;
    lblRecLast: TLabel;
    imgRecLast: TImage;
    txtRecLast: TLabel;
    lblRecSpan: TLabel;
    imgRecSpan: TImage;
    txtRecSpan: TLabel;
    lblRecReply: TLabel;
    imgRecReply: TImage;
    txtRecReply: TLabel;
    lblSndCount: TLabel;
    imgSndCount: TImage;
    txtSndCount: TLabel;
    lblSndLast: TLabel;
    imgSndLast: TImage;
    txtSndLast: TLabel;
    lblSndSpan: TLabel;
    imgSndSpan: TImage;
    txtSndSpan: TLabel;
    lblSndRec: TLabel;
    imgSndRec: TImage;
    txtSndRec: TLabel;
    lblReplyRate: TLabel;
    imgReplyRate: TImage;
    txtReplyRate: TLabel;
    lblTmtRate: TLabel;
    imgTmtRate: TImage;
    txtTmtRate: TLabel;
    lblBoxCount: TLabel;
    imgBoxCount: TImage;
    txtBoxCount: TLabel;
    lblDraftCount: TLabel;
    imgDraftCount: TImage;
    txtDraftCount: TLabel;
    shpSeparatorBottom: TShape;
    btnNewSMS: TBitBtn;
    btnReadLast: TBitBtn;
    btnReply: TBitBtn;
    lblName: TCnAALabel;
    lblPhone: TCnAALabel;
    procedure btnNewSMSClick(Sender: TObject);
    procedure btnReadLastClick(Sender: TObject);
    procedure btnReplyClick(Sender: TObject);
  private
    { Private declarations }
    FReceiveID: Integer;
    function GetDateTimeSpan(ANow, AThen: TDateTime): String;
  public
    { Public declarations }
    procedure RefreshContact(sName: String);
  end;

implementation

{$R *.dfm}

uses
  ADODB, UserInterfaces, DateUtils, DB, uFrmWriteSMS, uFrmReadSMS, ComCtrls;

function TfraContact.GetDateTimeSpan(ANow, AThen: TDateTime): String;
begin
  {Result := Format('%d-%d-%d %d:%d:%d',
    [YearsBetween(ANow, AThen), MonthsBetween(ANow, AThen),
    DaysBetween(ANow, AThen), HoursBetween(ANow, AThen),
    MinutesBetween(ANow, AThen), SecondsBetween(ANow, AThen)]);
    }
  if DaysBetween(ANow, AThen) > 0 then
    Result := IntToStr(DaysBetween(ANow, AThen)) + ' 天'
  else if HoursBetween(ANow, AThen) > 0 then
    Result := IntToStr(HoursBetween(ANow, AThen)) + ' 小时'
  else if MinutesBetween(ANow, AThen) > 0 then
    Result := IntToStr(MinutesBetween(ANow, AThen)) + ' 分钟'
  else
    Result := IntToStr(SecondsBetween(ANow, AThen)) + ' 秒';
end;

procedure TfraContact.RefreshContact(sName: String);
var
  db: TADOQuery;
  sPhone: String;
  dReceive: TDateTime;
  iReceive: Integer;
  iTmp: Integer;
begin
  // 打开数据库
  db := TADOQuery.Create(nil);
  db.Connection := frmMain.adoContacts;
  lblName.Caption := sName;

  // 查询基本信息
  db.SQL.Text := Format(
  'SELECT * FROM [contact]' + #13#10 +
  'WHERE [contact].[Name] = "%s"' + #13#10 +
  'ORDER BY [contact].[phonenumber];'
  , [sName]);
  db.Open;

  while not db.Eof do
  begin
    sPhone := db.FieldByName('phonenumber').AsString + ', ';
    txtCategory.Caption := db.FieldByName('category').AsString;
    txtFolder.Caption := db.FieldByName('folder').AsString;
    db.Next;
  end;

  Delete(sPhone, Length(sPhone) - 1, 2);
  lblPhone.Caption := sPhone;

  db.Close;

  // 查询短信数据库
  db.Connection := frmMain.adoSMS;

  db.SQL.Text := Format(
  'SELECT [receive].[receivedate] AS [date], [receive].[replied] AS [replied], [receive].[internalid]' + #13#10 +
  'FROM [receive]' + #13#10 + 
  'WHERE [receive].[sender]="%s"' + #13#10 +
  'ORDER BY [receive].[receivedate] DESC;'
  , [sName]);
  db.Open;
  iReceive := db.RecordCount;
  txtRecCount.Caption := IntToStr(iReceive);

  if iReceive > 0 then
  begin
    dReceive := db.FieldByName('date').AsDateTime;
    FReceiveID := db.FieldByName('internalid').AsInteger;
    txtRecLast.Caption := DateTimeToStr(dReceive);
    txtRecSpan.Caption := GetDateTimeSpan(Now, dReceive);
    txtRecReply.Caption := BoolToStr(db.FieldByName('replied').AsBoolean, True);
  end
  else
  begin
    txtRecLast.Caption := 'N/A';
    txtRecSpan.Caption := 'N/A';
    txtRecReply.Caption := 'N/A';
  end;

  db.Close;

  // 发送内容
  db.SQL.Text :=  Format(
  'SELECT [finish].[senderdate] as [date]' + #13#10 +
  'FROM finish LEFT JOIN finish_item ON finish.internalid = finish_item.associatedid' + #13#10 +
  'WHERE (((finish_item.name)="%s"))' + #13#10 +
  'ORDER BY finish.senderdate DESC;'
  , [sName]);

  db.Open;

  txtSndCount.Caption := IntToStr(db.RecordCount);

  if db.RecordCount > 0 then
  begin
    txtSndLast.Caption := DateTimeToStr(db.FieldByName('date').AsDateTime);
    txtSndSpan.Caption := GetDateTimeSpan(Now, db.FieldByName('date').AsDateTime);
    btnReply.Enabled := True;
    btnReadLast.Enabled := True;

    if (iReceive > 0) and (db.FieldByName('date').AsDateTime < dReceive) then
      txtSndRec.Caption := GetDateTimeSpan(dReceive ,db.FieldByName('date').AsDateTime)
    else
      txtSndRec.Caption := 'N/A';
  end
  else
  begin
    txtSndLast.Caption := 'N/A';
    txtSndSpan.Caption := 'N/A';
    txtSndRec.Caption := 'N/A';
    btnReply.Enabled := False;
    btnReadLast.Enabled := False;
  end;

  db.Close;

  // 发件箱内容
  db.SQL.Text := Format('SELECT COUNT(*) as [count] FROM [send] WHERE [send].[addressee]="%s";', [sName]);
  db.Open;
  txtBoxCount.Caption := IntToStr(db.FieldByName('count').AsInteger);
  db.Close;

  // 草稿内容
  db.SQL.Text := Format('SELECT COUNT(*) As [count] FROM [draft_item] WHERE [draft_item].[name] = "%s";', [sName]);
  db.Open;
  txtDraftCount.Caption := IntToStr(db.FieldByName('count').AsInteger);
  db.Close;

  // 回复率和转发率
  if iReceive > 0 then
  begin
    db.SQL.Text := Format('SELECT COUNT(*) AS [count] FROM receive WHERE (((receive.replied)=True) AND ((receive.sender)="%s"));', [sName]);
    db.Open;
    iTmp := db.FieldByName('count').AsInteger;
    txtReplyRate.Caption := Format('%.2f%% (%d/%d)', [iTmp/iReceive * 100, iTmp, iReceive]);
    db.Close;

    db.SQL.Text := Format('SELECT COUNT(*) AS [count] FROM receive WHERE (((receive.transmitted)=True) AND ((receive.sender)="%s"));', [sName]);
    db.Open;
    iTmp := db.FieldByName('count').AsInteger;
    txtTmtRate.Caption := Format('%.2f%% (%d/%d)', [iTmp/iReceive * 100, iTmp, iReceive]);
    db.Close;
  end
  else
  begin
    txtReplyRate.Caption := 'N/A';
    txtTmtRate.Caption := 'N/A';
  end;

  db.Free;
end;

procedure TfraContact.btnNewSMSClick(Sender: TObject);
var
  wWriteSMSWnd: TfrmWriteSMS;
  xItem: TListItem;
begin
  // 窗口撰写短信窗口
  wWriteSMSWnd := TfrmWriteSMS.Create(nil);
  xItem := frmMain.lvwWindow.Items.Add;
  xItem.ImageIndex := 1;
  xItem.Data := Pointer(wWriteSMSWnd.Handle);
  xItem.SubItems.Add('draft');
  xItem.SubItems.Add('0');
  wWriteSMSWnd.NewSMS;
  wWriteSMSWnd.AppendContact(lblName.Caption, lblPhone.Caption);
  wWriteSMSWnd.Modified := False;
end;

procedure TfraContact.btnReadLastClick(Sender: TObject);
var
//  wWriteSMSWnd: TfrmWriteSMS;
  wReadSMSWnd: TfrmReadSMS;
  xItem: TListItem;
begin
  // 打开信息
  if frmMain.QueryWindow('receive', IntToStr(FReceiveID)) then Exit;

  // 打开草稿箱
  wReadSMSWnd := TfrmReadSMS.Create(nil);
  xItem := frmMain.lvwWindow.Items.Add;
  xItem.ImageIndex := 2;
  xItem.Data := Pointer(wReadSMSWnd.Handle);
  xItem.Caption := '阅读短信 (收件箱)';

  // 填充一些信息
  wReadSMSWnd.OpenSMS(bReceive, FReceiveID);
  wReadSMSWnd.Show;
  xItem.SubItems.Add('receive');
  xItem.SubItems.Add(IntToStr(FReceiveID));
end;

procedure TfraContact.btnReplyClick(Sender: TObject);
var
  wWriteSMSWnd: TfrmWriteSMS;
  xItem: TListItem;
begin
  // 打开草稿箱
  wWriteSMSWnd := TfrmWriteSMS.Create(nil);
  xItem := frmMain.lvwWindow.Items.Add;
  xItem.ImageIndex := 1;
  xItem.Data := Pointer(wWriteSMSWnd.Handle);
  xItem.Caption := '回复短信';

  // 填充一些信息
  wWriteSMSWnd.NewReply(FReceiveID);
  xItem.SubItems.Add('draft');
  xItem.SubItems.Add(IntToStr(0));
end;

end.
