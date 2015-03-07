unit uDlgRestore;

//{$DEFINE NULLDEFAULTPASS}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ImgList, ADODB,
  OBRARCompress, DB;

type
  TdlgRestore = class(TForm)
    bvlBottom: TBevel;
    bvlTop: TBevel;
    shpTopBack: TShape;
    imgTitle: TImage;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    lblTitle: TLabel;
    lblTitleInfo: TLabel;
    lblBackup: TLabel;
    lvwBackup: TListView;
    rgSms: TRadioGroup;
    rgContact: TRadioGroup;
    rgSettings: TRadioGroup;
    iltBackup: TImageList;
    btnDelete: TBitBtn;
    pbProgress: TProgressBar;
    lblProgress: TLabel;
    lblTarget: TLabel;
    txtCurrent: TEdit;
    txtBackup: TEdit;
    lblBackupPass: TLabel;
    rarDecompress: TOBRARCompress;
    qryFinder: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure lvwBackupChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure lvwBackupCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    procedure FMergeSMS(const ASrc, ATtg: string);
    procedure FMergeContact(const ASrc, ATtg: string);
    procedure FMergeTable(var ASrc, ATtg: TADOTable; const Name, PrimaryKey: String);
    function FFindRecord(ADateField, AHashField: String; ADate: TDateTime;
      AHash: String; var tDest: TADOTable): Boolean;
  public
    { Public declarations }
  end;

var
  dlgRestore: TdlgRestore;

implementation

{$R *.dfm}

uses
  DateUtils,
  uGeneral,
  DGL_Integer;

procedure TdlgRestore.FormCreate(Sender: TObject);
var
  sf: TSearchRec;
  sp: String;
  sa: Integer;
  xItem: TListItem;
  st: SYSTEMTIME;
  ft: FILETIME;
begin
  // 查找可用的备份文件
  sa := faAnyFile;
  sp := AppendPath(ExtractFilePath(ParamStr(0)), '\Backup\*.RAR');

  if FindFirst(sp, sa, sf) = 0 then
  begin
    repeat
      if not (sf.Attr and faDirectory = faDirectory) then
      begin
        xItem := lvwBackup.Items.Add;
        xItem.Caption := ExtractFileName(sf.Name);
        FileTimeToLocalFileTime(sf.FindData.ftCreationTime, ft);
        if FileTimeToSystemTime(ft, st) then
          xItem.SubItems.Add(FormatDateTime('yyyy-mm-dd hh:mm:ss',
            SystemTimeToDateTime(st)));

        xItem.ImageIndex := 0;
      end;
    until FindNext(sf) <> 0;
    FindClose(sf);
    lvwBackup.AlphaSort;
    lvwBackup.Items[0].Selected := True;
  end;

end;

procedure TdlgRestore.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TdlgRestore.lvwBackupChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if (lvwBackup.SelCount > 0) then
  begin
    rgSms.Enabled := True;
    rgSettings.Enabled := True;
    rgContact.Enabled := True;
    btnOK.Enabled := True;
    btnDelete.Enabled := True;
  end
  else
  begin
    rgSms.Enabled := False;
    rgSettings.Enabled := False;
    rgContact.Enabled := False;
    btnOK.Enabled := False;
    btnDelete.Enabled := False;
  end;
end;

procedure TdlgRestore.lvwBackupCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  Compare := -CompareDateTime(StrToDateTime(Item1.SubItems[0]), StrToDateTime(Item2.SubItems[0]))
end;

procedure TdlgRestore.btnDeleteClick(Sender: TObject);
var
  fn: String;
begin
  // 删除文件
  fn := AppendPath(ExtractFilePath(ParamStr(0)), 'Backup');
  fn := AppendPath(fn, lvwBackup.Selected.Caption);

  if MessageBox(Handle, PChar('是否要删除以下备份文件，该操作无法恢复。' + #13#10#13#10 + fn),
    PChar(Application.Title), MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    DeleteFile(fn);
    lvwBackup.DeleteSelected;
  end;

end;

procedure TdlgRestore.FMergeSMS(const ASrc, ATtg: string);
const
  DebugSkipCheck: Boolean = False;
var
  tSrc, tTtg: TADOTable;
  tSri, tTti: TADOTable;
  iMax: Integer;
  iPos: Integer;
  internalid: Integer;
  finMap: TIntMap;
  recMap: TIntMap;
begin
  // 打开数据库
  tSrc := TADOTable.Create(nil);
  tTtg := TADOTable.Create(nil);
  tSri := TADOTable.Create(nil);
  tTti := TADOTable.Create(nil);
  tSrc.ConnectionString := GetConnectionStr(ASrc, txtBackup.Text);
  tTtg.ConnectionString := GetConnectionStr(ATtg, txtCurrent.Text);
  tSri.ConnectionString := GetConnectionStr(ASrc, txtBackup.Text);
  tTti.ConnectionString := GetConnectionStr(ATtg, txtCurrent.Text);
  qryFinder.ConnectionString := tTtg.ConnectionString;

  // 统计记录总数
  iMax := 0;
  Inc(iMax, GetTableRecCount(tSrc, 'draft'));
  Inc(iMax, GetTableRecCount(tSrc, 'finish'));
  Inc(iMax, GetTableRecCount(tSrc, 'folder'));
  Inc(iMax, GetTableRecCount(tSrc, 'receive'));
  Inc(iMax, GetTableRecCount(tSrc, 'send'));
  pbProgress.Position := 0;
  pbProgress.Max := iMax;
  lblProgress.Caption := '正在合并 sms.mdb...';
  lblProgress.Visible := True;
  pbProgress.Visible := True;

  // 开始合并表格
  FMergeTable(tSrc, tTtg, 'folder', 'folder');
//  FMergeTable(tSrc, tTtg, 'draft', 'internalid');
//  FMergeTable(tSrc, tTtg, 'draft_item', 'internalid');
//  FMergeTable(tSrc, tTtg, 'finish', 'internalid');
//  FMergeTable(tSrc, tTtg, 'finish_item', 'internalid');
//  FMergeTable(tSrc, tTtg, 'receive', 'internalid');
//  FMergeTable(tSrc, tTtg, 'send', 'internalid');

  // 合并 finish 和 finish_item 表
  finMap := TIntMap.Create;

  tSrc.TableName := 'finish';
  tTtg.TableName := 'finish';
  tSri.TableName := 'finish_item';
  tTti.TableName := 'finish_item';
  tSrc.Open;
  tTtg.Open;
  tSri.Open;
  tTti.Open;
  tSrc.Sort := 'senderdate ASC';

  while not tSrc.Eof do
  begin
    if DebugSkipCheck or (not FFindRecord('senderdate', 'hash',
      tSrc.FieldByName('senderdate').AsDateTime,
      tSrc.FieldByName('hash').AsString, tTtg)) then
    begin
      tTtg.Append;
      tTtg.FieldByName('id').AsInteger := tSrc.FieldByName('id').AsInteger;
      tTtg.FieldByName('content').AsString := tSrc.FieldByName('content').AsString;
      tTtg.FieldByName('senderdate').AsDateTime := tSrc.FieldByName('senderdate').AsDateTime;
      tTtg.FieldByName('transmitted').AsBoolean := tSrc.FieldByName('transmitted').AsBoolean;
      if not DebugSkipCheck then tTtg.FieldByName('hash').AsString := tSrc.FieldByName('hash').AsString;
      tTtg.Post;

      internalid := tTtg.FieldByName('internalid').AsInteger;
      finMap.Insert(tSrc.FieldByName('internalid').AsInteger, internalid);

      tSri.Filtered := False;
      tSri.Filter := 'associatedid = ' + IntToStr(tSrc.FieldByName('internalid').AsInteger);
      tSri.Filtered := True;

      while not tSri.Eof do
      begin
        tTti.Append;
        tTti.FieldByName('associatedid').AsInteger := internalid;
        tTti.FieldByName('name').AsString := tSri.FieldByName('name').AsString;
        tTti.FieldByName('number').AsString := tSri.FieldByName('number').AsString;
        tTti.Post;
        tSri.Next;
      end;
    end;

    pbProgress.StepIt;
    Application.ProcessMessages;
    tSrc.Next;
  end;

  tSrc.Close;
  tTtg.Close;
  tSri.Close;
  tTti.Close;

  // 合并 receive 表
  recMap := TIntMap.Create;

  tSrc.TableName := 'receive';
  tTtg.TableName := 'receive';
  tSrc.Open;
  tTtg.Open;
  tSrc.Sort := 'receivedate ASC';

  while not tSrc.Eof do
  begin
//    if DebugSkipCheck or (not tTtg.Locate('receivedate;hash',
//      VarArrayOf([tSrc.FieldByName('receivedate').AsDateTime, tSrc.FieldByName('hash').AsString]), [])) then
    if not FFindRecord('receivedate', 'hash',
      tSrc.FieldByName('receivedate').AsDateTime,
      tSrc.FieldByName('hash').AsString, tTtg) then
    begin
      tTtg.Append;
      tTtg.FieldByName('id').AsInteger := tSrc.FieldByName('id').AsInteger;
      tTtg.FieldByName('receivedate').AsDateTime := tSrc.FieldByName('receivedate').AsDateTime;
      tTtg.FieldByName('sender').AsString := tSrc.FieldByName('sender').AsString;
      tTtg.FieldByName('sendernumber').AsString := tSrc.FieldByName('sendernumber').AsString;
      tTtg.FieldByName('replied').AsBoolean := tSrc.FieldByName('replied').AsBoolean;
      tTtg.FieldByName('read').AsBoolean := tSrc.FieldByName('read').AsBoolean;
      tTtg.FieldByName('transmitted').AsBoolean := tSrc.FieldByName('transmitted').AsBoolean;
      tTtg.FieldByName('content').AsString := tSrc.FieldByName('content').AsString;
      tTtg.FieldByName('folder').AsString := tSrc.FieldByName('folder').AsString;
      if not DebugSkipCheck then tTtg.FieldByName('hash').AsString := tSrc.FieldByName('hash').AsString;
      tTtg.Post;

      internalid := tTtg.FieldByName('internalid').AsInteger;
      recMap.Insert(tSrc.FieldByName('internalid').AsInteger, internalid);
    end;

    pbProgress.StepIt;
    Application.ProcessMessages;

    tSrc.Next;
  end;

  tSrc.Close;
  tTtg.Close;

  // 合并 draft 和 draft_item
  tSrc.TableName := 'draft';
  tTtg.TableName := 'draft';
  tSri.TableName := 'draft_item';
  tTti.TableName := 'draft_item';
  tSrc.Open;
  tTtg.Open;
  tSri.Open;
  tTti.Open;
  tSrc.Sort := 'date ASC';

  while not tSrc.Eof do
  begin
//    if DebugSkipCheck or (not tTtg.Locate('date;hash',
//      VarArrayOf([tSrc.FieldByName('date').AsDateTime, tSrc.FieldByName('hash').AsString]), [])) then
    if not FFindRecord('date', 'hash',
      tSrc.FieldByName('date').AsDateTime,
      tSrc.FieldByName('hash').AsString, tTtg) then
    begin
      tTtg.Append;
      tTtg.FieldByName('id').AsInteger := tSrc.FieldByName('id').AsInteger;
      tTtg.FieldByName('content').AsString := tSrc.FieldByName('content').AsString;
      tTtg.FieldByName('date').AsDateTime := tSrc.FieldByName('date').AsDateTime;
      tTtg.FieldByName('drafttype').AsInteger := tSrc.FieldByName('drafttype').AsInteger;
      tTtg.FieldByName('associatedbox').AsString := tSrc.FieldByName('associatedbox').AsString;
      //tTtg.FieldByName('associatedid').AsInteger := tSrc.FieldByName('associatedid').AsInteger;
      if tTtg.FieldByName('associatedbox').AsString = 'receive' then
        tTtg.FieldByName('associatedid').AsInteger := recMap.GetItemValue(tSrc.FieldByName('associatedid').AsInteger)
      else if tTtg.FieldByName('associatedbox').AsString = 'finish' then
        tTtg.FieldByName('associatedid').AsInteger := finMap.GetItemValue(tSrc.FieldByName('associatedid').AsInteger);

      if not DebugSkipCheck then tTtg.FieldByName('hash').AsString := tSrc.FieldByName('hash').AsString;
      tTtg.Post;

      internalid := tTtg.FieldByName('internalid').AsInteger;

      tSri.Filtered := False;
      tSri.Filter := 'associatedid = ' + IntToStr(tSrc.FieldByName('internalid').AsInteger);
      tSri.Filtered := True;

      while not tSri.Eof do
      begin
        tTti.Append;
        tTti.FieldByName('associatedid').AsInteger := internalid;
        tTti.FieldByName('name').AsString := tSri.FieldByName('name').AsString;
        tTti.FieldByName('number').AsString := tSri.FieldByName('number').AsString;
        tTti.Post;
        tSri.Next;
      end;

    end;

    tSrc.Next;
    pbProgress.StepIt;
    Application.ProcessMessages;
  end;

  tSrc.Close;
  tTtg.Close;
  tSri.Close;
  tTti.Close;

  // 合并 send 表
  tSrc.TableName := 'send';
  tTtg.TableName := 'send';
  tSrc.Open;
  tTtg.Open;
  TSrc.Sort := 'senderdate ASC';

  while not tSrc.Eof do
  begin
//    if DebugSkipCheck or (not tTtg.Locate('senderdate;hash',
//      VarArrayOf([tSrc.FieldByName('senderdate').AsDateTime, tSrc.FieldByName('hash').AsString]), [])) then
    if not FFindRecord('senderdate', 'hash',
      tSrc.FieldByName('senderdate').AsDateTime,
      tSrc.FieldByName('hash').AsString, tTtg) then
    begin
      tTtg.Append;
      tTtg.FieldByName('id').AsInteger := tSrc.FieldByName('id').AsInteger;
      tTtg.FieldByName('senderdate').AsDateTime := tSrc.FieldByName('senderdate').AsDateTime;
      tTtg.FieldByName('addressee').AsString := tSrc.FieldByName('addressee').AsString;
      tTtg.FieldByName('number').AsString := tSrc.FieldByName('number').AsString;
      tTtg.FieldByName('content').AsString := tSrc.FieldByName('content').AsString;
      tTtg.FieldByName('finishid').AsInteger := tSrc.FieldByName('finishid').AsInteger;
      if not DebugSkipCheck then tTtg.FieldByName('hash').AsString := tSrc.FieldByName('hash').AsString;
      tTtg.FieldByName('finishid').AsInteger := finMap.GetItemValue(tSrc.FieldByName('finishid').AsInteger);
      tTtg.Post;

      internalid := tTtg.FieldByName('internalid').AsInteger;
    end;

    pbProgress.StepIt;
    Application.ProcessMessages;
    tSrc.Next;
  end;

  tSrc.Close;
  tTtg.Close;

  finMap.Free;
  recMap.Free;

  lblProgress.Visible := False;
  pbProgress.Visible := False;
end;

procedure TdlgRestore.FMergeContact(const ASrc, ATtg: string);
var
  tSrc, tTtg: TADOTable;
  iMax: Integer;
  iPos: Integer;
begin
  // 打开数据库
  tSrc := TADOTable.Create(nil);
  tTtg := TADOTable.Create(nil);
  tSrc.ConnectionString := GetConnectionStr(ASrc, txtBackup.Text);
  tTtg.ConnectionString := GetConnectionStr(ATtg, txtCurrent.Text);

  // 统计记录总数
  iMax := 0;
  Inc(iMax, GetTableRecCount(tSrc, 'category'));
  Inc(iMax, GetTableRecCount(tSrc, 'contact'));
  pbProgress.Position := 0;
  pbProgress.Max := iMax;
  lblProgress.Caption := '正在合并 contact.mdb...';
  pbProgress.Visible := True;
  lblProgress.Visible := True;

  // 开始合并表格
  FMergeTable(tSrc, tTtg, 'category', 'category');
  FMergeTable(tSrc, tTtg, 'contact', 'phonenumber');

  lblProgress.Visible := False;
  pbProgress.Visible := False;

  tSrc.Free;
  tTtg.Free;
end;

procedure TdlgRestore.FMergeTable(var ASrc, ATtg: TADOTable; const Name, PrimaryKey: String);
var
  i: Integer;
begin
  ASrc.TableName := Name;
  ATtg.TableName := Name;
  ASrc.Open;
  ATtg.Open;

  while not ASrc.Eof do
  begin
    if ATtg.Locate(PrimaryKey, ASrc.FieldByName(PrimaryKey).AsVariant, []) then
      ATtg.Edit
    else
      ATtg.Append;

    for i := 0 to ATtg.FieldCount - 1 do
      if ATtg.Fields[i].CanModify then
        ATtg.Fields[i].Value := ASrc.Fields[i].Value;

    pbProgress.StepIt;
    Application.ProcessMessages;
    ATtg.Post;
    ASrc.Next;
  end;

  ASrc.Close;
  ATtg.Close;
end;  

procedure TdlgRestore.btnOKClick(Sender: TObject);
var
  sTmpPath: String;
  fn: String;
  curdir: String;
begin
  // 界面禁止
  lblBackup.Enabled := False;
  lvwBackup.Enabled := False;
  rgSms.Enabled := False;
  rgContact.Enabled := False;
  rgSettings.Enabled := False;
  lblBackupPass.Enabled := False;
  txtCurrent.Enabled := False;
  lblTarget.Enabled := False;
  txtBackup.Enabled := False;
  btnOK.Enabled := False;
  btnCancel.Enabled := False;
  btnDelete.Enabled := False;
  Application.ProcessMessages;

  // 恢复数据库
  SetLength(sTmpPath, MAX_PATH);
  GetTempPath(MAX_PATH, PChar(sTmpPath));
  Delete(sTmpPath, Pos(#0, sTmpPath), MAX_PATH);
  sTmpPath := AppendPath(sTmpPath, 'USRESTORE');
  if not DirectoryExists(sTmpPath) then
    MkDir(sTmpPath);
  rarDecompress.UnPath := '"' + sTmpPath + '"';
  curdir := ExtractFilePath(ParamStr(0));
  rarDecompress.RARFileName := AppendPath(curdir, 'Backup');
  rarDecompress.RARFileName := '"' + AppendPath(rarDecompress.RARFileName, lvwBackup.Selected.Caption) + '"';

  // 解压缩
  if rarDecompress.UNCompress then
  begin
    // 恢复 sms.mdb
    fn := AppendPath(sTmpPath, 'sms.mdb');
    if rgSms.ItemIndex <> 0 then
    begin
      if FileExists(fn) then
      begin
        if rgSms.ItemIndex = 1 then
          CopyFile(PChar(fn), PChar(AppendPath(curdir, 'sms.mdb')), False)
        else if rgSms.ItemIndex = 2 then
          FMergeSMS(fn, AppendPath(curdir, 'sms.mdb'));
      end
      else
        MessageBox(Handle,
          '无法恢复短信数据库，因为在备份文件中没有找到 sms.mdb。',
          PChar(Application.Title), MB_OK + MB_ICONWARNING);
    end;

    // 恢复 contact.mdb
    fn := AppendPath(sTmpPath, 'contact.mdb');
    if rgContact.ItemIndex <> 0 then
    begin
      if FileExists(fn) then
      begin
        if rgContact.ItemIndex = 1 then
          CopyFile(PChar(fn), PChar(AppendPath(curdir, 'contact.mdb')), False)
        else if rgContact.ItemIndex = 2 then
          FMergeContact(fn, AppendPath(curdir, 'contact.mdb'));
      end
      else
        MessageBox(Handle,
          '无法恢复联系人数据库，因为在备份文件中没有找到 contact.mdb。',
          PChar(Application.Title), MB_OK + MB_ICONWARNING);
    end;

    // 恢复 settings.mdb
    fn := AppendPath(sTmpPath, 'settings.mdb');
    if rgContact.ItemIndex <> 0 then
    begin
      if FileExists(fn) then
      begin
        CopyFile(PChar(fn), PChar(AppendPath(curdir, 'settings.mdb')), False)
      end
      else
        MessageBox(Handle,
          '无法恢复设置数据库，因为在备份文件中没有找到 settings.mdb。',
          PChar(Application.Title), MB_OK + MB_ICONWARNING);
    end;
  end;

  // 删除临时文件
  DeleteFile(AppendPath(sTmpPath, '*.*'));
  RemoveDir(sTmpPath);

  MessageBox(Handle, '恢复工作已经完成。', PChar(Application.Title),
    MB_OK + MB_ICONINFORMATION);

  Close;
end;

function TdlgRestore.FFindRecord(ADateField, AHashField: String;
  ADate: TDateTime; AHash: String; var tDest: TADOTable): Boolean;
begin
//  Result := tDest.Locate(ADateField + ';' + AHashField,
//    VarArrayOf([ADate, AHash]), []);
  try
    qryFinder.SQL.Text := Format('SELECT Count(*) AS Existance FROM %s WHERE (hash="%s" AND DateDiff("s",senderdate,#%s#)<1);',
      [tDest.TableName, AHash, DateTimeToStr(ADate)]);
    qryFinder.Open;
    Result := qryFinder.Fields[0].AsInteger > 0;
    qryFinder.Close;
  except
    Result := False;
  end;
end;

end.
