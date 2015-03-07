unit uDlgExport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, ComCtrls, Buttons, cxShellBrowserDialog,
  ExtCtrls, FileCtrl, DB, ADODB;

type
  TNextSMSEvent = function(var ADate: TDate; var ATime: TTime; var AContent: String; var AName: String; var NewDay: Boolean): Boolean of object;

type
  TdlgExport = class(TForm)
    grpModel: TGroupBox;
    lblLocation: TLabel;
    txtLocation: TEdit;
    btnLocation: TBitBtn;
    lblFilter: TLabel;
    icbFilter: TComboBoxEx;
    lblTemplate: TLabel;
    lvwTemplate: TListView;
    iltTemplate: TImageList;
    tsbdLocation: TcxShellBrowserDialog;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    pbExport: TProgressBar;
    rgScope: TRadioGroup;
    grpDataScope: TGroupBox;
    iltFolder: TImageList;
    icbLocation: TComboBoxEx;
    lblBox: TLabel;
    lblTimeAfter: TLabel;
    dtpTimeAfter: TDateTimePicker;
    lblTimeBefore: TLabel;
    dtpTimeBefore: TDateTimePicker;
    flstFolder: TFileListBox;
    tblSMSItem: TADOTable;
    dlgSaveExport: TSaveDialog;
    tblSMS: TADOQuery;
    procedure txtLocationChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLocationClick(Sender: TObject);
    procedure icbFilterChange(Sender: TObject);
    procedure lvwTemplateChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgScopeClick(Sender: TObject);
  private
    { Private declarations }
    FIELD_PHONE: String;
    FIELD_DATETIME: String;
    FIELD_NAME: String;
    FDefaultFilter: Integer;
    FCurIndex: Integer;
    procedure FEnableAllControls(Enabled, TemplateLocation: Boolean);
    procedure FOpenDatebase;
    function FGetNextSMSItemSingle(var ADate: TDate; var ATime: TTime; var AContent: String; var AName: String; var NewDay: Boolean): Boolean;
    function FGetNextSMSItemMultiname(var ADate: TDate; var ATime: TTime; var AContent: String; var AName: String; var NewDay: Boolean): Boolean;
    procedure FSaveDOC(const Template: String; const Destination: String);
    procedure FSaveText(const Template: String; const Destination: String);
  public
    { Public declarations }
    SelInternalIDs: TList;
    AllInternalIDs: TList;
    constructor Create(AOwner: TComponent; FilterType: Integer);
  end;

implementation

{$R *.dfm}
uses
  GerneralFunc, UserInterfaces, StrUtils, DateUtils, SMSJob, ShellAPI, ShlObj;

var
  NextSMS: TNextSMSEvent;
  InitialDir: String;
  TempPath : array[0..MAX_PATH] of char;

const
  MARK_SECTION_BEGIN: String = '<!--SECTION BEGIN-->';
  MARK_SECTION_END: String = '<!--SECTION END-->';
  MARK_MESSAGE_BEGIN: String = '<!--MESSAGE BEGIN-->';
  MARK_MESSAGE_END: String = '<!--MESSAGE END-->';
  MARK_DATE: String = '%DATE%';
  MARK_TIME: String = '%TIME%';
  MARK_NAME: String = '%NAME%';
  MARK_CONTENT: String = '%MESSAGE_CONTENT%';

  FIELD_CONTENT: String = 'content';

function SHBFCallBack(Handle: HWND; Msg: Cardinal; lp: Integer; pData: Integer): BOOL; stdcall;
var
  ret: LongBool;
begin
  case Msg of
  BFFM_INITIALIZED:
    SendMessage(Handle, BFFM_SETSELECTION, 1, Integer(@InitialDir[1]));

  BFFM_SELCHANGED:
  begin
    ret := SHGetPathFromIDList(PItemIDList(lp), TempPath);
    if ret then
      SendMessage(Handle, BFFM_SETSTATUSTEXT, 0, Integer(@TempPath[1]))
  end;  
  end;
  Result := False;
end;

procedure TdlgExport.FOpenDatebase;
var
  SFilterForm, SFilterTo: string;
begin
  if ((rgScope.ItemIndex = 2) and (icbLocation.ItemIndex = 0)) or
    ((rgScope.ItemIndex < 2) and (frmMain.CurrentView = cvReceive)) then
  begin
    tblSMS.SQL.Text := 'SELECT * FROM [receive] ORDER BY [receivedate] ASC;';
    tblSMS.Open;
    NextSMS := FGetNextSMSItemSingle;

    FIELD_NAME := 'sender';
    FIELD_PHONE := 'sendernumber';
    FIELD_DATETIME := 'receivedate';
  end
  else if ((rgScope.ItemIndex = 2) and (icbLocation.ItemIndex = 1)) or
    ((rgScope.ItemIndex < 2) and (frmMain.CurrentView = cvSend)) then
  begin
    tblSMS.SQL.Text := 'SELECT * FROM [send] ORDER BY [senderdate] ASC;';
    tblSMS.Open;
    NextSMS := FGetNextSMSItemSingle;

    FIELD_NAME := 'addressee';
    FIELD_PHONE := 'number';
    FIELD_DATETIME := 'senderdate';
  end
  else if ((rgScope.ItemIndex = 2) and (icbLocation.ItemIndex = 2)) or
    ((rgScope.ItemIndex < 2) and (frmMain.CurrentView = cvFinish)) then
  begin
    tblSMS.SQL.Text := 'SELECT * FROM [finish] ORDER BY [senderdate] ASC;';
    tblSMS.Open;
    tblSMSItem.TableName := 'finish_item';
    tblSMSItem.Open;
    NextSMS := FGetNextSMSItemMultiname;

    FIELD_NAME := 'name';
    FIELD_PHONE := 'number';
    FIELD_DATETIME := 'senderdate';
  end
  else if ((rgScope.ItemIndex = 2) and (icbLocation.ItemIndex = 3)) or
    ((rgScope.ItemIndex < 2) and (frmMain.CurrentView = cvDraft)) then
  begin
    tblSMS.SQL.Text := 'SELECT * FROM [draft] ORDER BY [date] ASC;';
    tblSMS.Open;
    tblSMSItem.TableName := 'draft_item';
    tblSMSItem.Open;
    NextSMS := FGetNextSMSItemMultiname;

    FIELD_NAME := 'name';
    FIELD_PHONE := 'number';
    FIELD_DATETIME := 'date';
  end;

  // 调整过滤器
  if rgScope.ItemIndex = 2 then
  begin
    tblSMS.Filtered := False;

    SFilterForm := FormatDateTime('yyyy-MM-dd', dtpTimeAfter.Date) + ' 00:00:00';
    SFilterTo := FormatDateTime('yyyy-MM-dd', dtpTimeBefore.Date) + ' 23:59:59';

    if dtpTimeAfter.Checked and dtpTimeBefore.Checked then
      tblSMS.Filter := Format('(%s >= #%s#) and (%s <= #%s#)'
        , [FIELD_DATETIME, SFilterForm, FIELD_DATETIME, SFilterTo])
    else if dtpTimeAfter.Checked then
      tblSMS.Filter := Format('(%s >= #%s#)', [FIELD_DATETIME, SFilterForm])
    else if dtpTimeBefore.Checked then
      tblSMS.Filter := Format('(%s <= #%s#)', [FIELD_DATETIME, SFilterTo]);

    tblSMS.Filtered := dtpTimeBefore.Checked or dtpTimeAfter.Checked;
  end;    

  FCurIndex := 0;

  case rgScope.ItemIndex of
    0: pbExport.Max := AllInternalIDs.Count;
    1: pbExport.Max := SelInternalIDs.Count;
  else pbExport.Max := tblSMS.RecordCount;
  end;

  pbExport.Position := 0;
  pbExport.Step := 1;
end;

function TdlgExport.FGetNextSMSItemSingle(var ADate: TDate; var ATime: TTime; var AContent: String; var AName: String; var NewDay: Boolean): Boolean;
var
  DBDate: TDateTime;
begin
  // 看看是不是最后一个
  if rgScope.ItemIndex = 0 then
    Result := (AllInternalIDs.Count) = FCurIndex
  else if rgScope.ItemIndex = 1 then
    Result := (SelInternalIDs.Count) = FCurIndex
  else
    Result := tblSMS.Eof;

  if Result then
    Exit;

  // 查找记录
  if rgScope.ItemIndex = 0 then
    tblSMS.Locate('internalid', Integer(AllInternalIDs.Items[FCurIndex]), [])
  else if rgScope.ItemIndex = 1 then
    tblSMS.Locate('internalid', Integer(SelInternalIDs.Items[FCurIndex]), []);

  Inc(FCurIndex);

  // 打开数据库 读取数据
  DBDate := tblSMS.FieldByName(FIELD_DATETIME).AsDateTime;
  NewDay := CompareDate(DBDate, ADate) <> 0;

  ADate := DBDate;
  ATime := DBDate;
  AContent := tblSMS.FieldByName(FIELD_CONTENT).AsString;

  if tblSMS.FieldByName(FIELD_NAME).AsString = '' then
    AName := tblSMS.FieldByName(FIELD_PHONE).AsString
  else
    AName := tblSMS.FieldByName(FIELD_NAME).AsString;

  tblSMS.Next;
end;

function TdlgExport.FGetNextSMSItemMultiname(var ADate: TDate; var ATime: TTime; var AContent: String; var AName: String; var NewDay: Boolean): Boolean;
var
  DBDate: TDateTime;
begin
  // 查找记录
  if rgScope.ItemIndex = 0 then
    tblSMS.Locate('internalid', Integer(AllInternalIDs.Items[FCurIndex]), [])
  else if rgScope.ItemIndex = 1 then
    tblSMS.Locate('internalid', Integer(SelInternalIDs.Items[FCurIndex]), []);

  Inc(FCurIndex);

  // 打开数据库 多姓名
  DBDate := tblSMS.FieldByName(FIELD_DATETIME).AsDateTime;
  NewDay := CompareDate(DBDate, ADate) <> 0;

  ADate := DBDate;
  ATime := DBDate;
  AContent := tblSMS.FieldByName(FIELD_CONTENT).AsString;

  // 读取多个用户
  tblSMSItem.Filtered := False;
  tblSMSItem.Filter := '[associatedid] = ' + tblSMS.FieldByName('internalid').AsString;
  tblSMSItem.Filtered := True;

  AName := '';

  if not (tblSMSItem.Eof and tblSMSItem.Bof) then
  begin
    tblSMSItem.First;

    while not tblSMSItem.Eof do
    begin
      if tblSMSItem.FieldByName(FIELD_NAME).AsString = '' then
        AName := AName + ', ' + tblSMSItem.FieldByName(FIELD_PHONE).AsString
      else
        AName := AName + ', ' + tblSMSItem.FieldByName(FIELD_NAME).AsString;

      tblSMSItem.Next;
    end;

    Delete(AName, 1, 2);
  end;

  tblSMS.Next;

  if rgScope.ItemIndex = 0 then
    Result := (AllInternalIDs.Count - 1) = FCurIndex
  else if rgScope.ItemIndex = 1 then
    Result := (SelInternalIDs.Count - 1) = FCurIndex
  else
    Result := tblSMS.Eof;
end;

constructor TdlgExport.Create(AOwner: TComponent; FilterType: Integer);
begin
  inherited Create(AOwner);
  FDefaultFilter := FilterType;
  SelInternalIDs := TList.Create;
  AllInternalIDs := TList.Create;
end;  

procedure TdlgExport.FEnableAllControls(Enabled, TemplateLocation: Boolean);
begin
  lblFilter.Enabled := Enabled;
  icbFilter.Enabled := Enabled;
  lblTemplate.Enabled := Enabled;
  lvwTemplate.Enabled := Enabled;
  grpDataScope.Enabled := Enabled;

  lblBox.Enabled := Enabled and (rgScope.ItemIndex = 2);
  icbLocation.Enabled := Enabled and (rgScope.ItemIndex = 2);
  lblTimeAfter.Enabled := Enabled and (rgScope.ItemIndex = 2);
  dtpTimeAfter.Enabled := Enabled and (rgScope.ItemIndex = 2);
  lblTimeBefore.Enabled := Enabled and (rgScope.ItemIndex = 2);
  dtpTimeBefore.Enabled := Enabled and (rgScope.ItemIndex = 2);

  btnCancel.Enabled := Enabled;

  if TemplateLocation then
  begin
    grpModel.Enabled := Enabled;
    lblLocation.Enabled := Enabled;
    txtLocation.Enabled := Enabled;
    btnLocation.Enabled := Enabled;
    btnSave.Enabled := Enabled;
  end;  
end;

procedure TdlgExport.txtLocationChange(Sender: TObject);
begin
  if DirectoryExists(txtLocation.Text) then
  begin
    FEnableAllControls(True, False);
    flstFolder.Directory := txtLocation.Text;
    icbFilterChange(nil);
  end
  else
    FEnableAllControls(False, False);
end;

procedure TdlgExport.FormCreate(Sender: TObject);
begin
  // 添加一些项目并选择他们
  icbFilter.ItemsEx.AddItem('所有支持的文件类型', 3, 3, -1, -1, nil);
  icbFilter.ItemsEx.AddItem('TXT - 文本文件', 0, 0, -1, -1, nil);
  icbFilter.ItemsEx.AddItem('DOT - Microsoft Word 模板', 1, 1, -1, -1, nil);
  icbFilter.ItemsEx.AddItem('HTT - HTML 模板', 2, 2, -1, -1, nil);

  icbLocation.ItemIndex := 0;
  txtLocation.Text := TemplateFolder;

  tblSMS.Connection := frmMain.adoSMS;
  tblSMSItem.Connection := frmMain.adoSMS;

  // 判断是否 Enabled
  if frmMain.CurrentView = cvNone then
  begin
    rgScope.ItemIndex := 2;
    rgScope.Enabled := False;
  end;

{$IFDEF REGISTERED}
  // 检查注册状态
  {$I Encode_Start.inc}
  if SameText(GlobalRegStatus, GRS_EXCEEDED) then
  begin
    MessageBox(Handle, '您的 Ultra SMS 的程序试用期已过，不能导出短信。',
      PChar(Caption), MB_OK + MB_ICONWARNING);
    Close;
  end
  else if not SameText(GlobalRegStatus, GRS_REGISTERED) then
  begin
    icbFilter.Enabled := False;
    lblFilter.Enabled := False;
    if FDefaultFilter <> 1 then
      MessageBox(Handle,
        '您的 Ultra SMS 的程序是使用期，只能导出为 TXT 文件。',
        PChar(Caption), MB_OK + MB_ICONWARNING);
    FDefaultFilter := 1;
  end;
  {$I Encode_End.inc}
{$ENDIF}  

  icbFilter.ItemIndex := FDefaultFilter;
end;

procedure TdlgExport.btnLocationClick(Sender: TObject);
var
  TitleName : string;
  lpItemID : PItemIDList;
  BrowseInfo : TBrowseInfo;
  DisplayName : array[0..MAX_PATH] of char;
  TempPath : array[0..MAX_PATH] of char;
begin
  FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
  if DirectoryExists(txtLocation.Text) then
  begin
    BrowseInfo.lpfn := @SHBFCallBack;
    InitialDir := txtLocation.Text;
  end;
  BrowseInfo.hwndOwner := Handle;
  BrowseInfo.pszDisplayName := @DisplayName;
  TitleName := '选择模板存放的文件夹';
  BrowseInfo.lpszTitle := PChar(TitleName);
  BrowseInfo.ulFlags := BIF_RETURNONLYFSDIRS or BIF_EDITBOX or BIF_NEWDIALOGSTYLE
    or BIF_STATUSTEXT;
  lpItemID := SHBrowseForFolder(BrowseInfo);

  if lpItemId <> nil then
  begin
    SHGetPathFromIDList(lpItemID, TempPath);
    GlobalFreePtr(lpItemID);
    txtLocation.Text := TempPath;
  end;
end;

procedure TdlgExport.icbFilterChange(Sender: TObject);
var
  i: Integer;
  xItem: TListItem;
begin
  // 更新内容显示
  case icbFilter.ItemIndex of
    0: flstFolder.Mask := '*.TXT;*.DOT;*.HTT';
    1: flstFolder.Mask := '*.TXT';
    2: flstFolder.Mask := '*.DOT';
    else flstFolder.Mask := '*.HTT';
  end;

  // 更新到列表
  lvwTemplate.Clear;

  for i := 0 to flstFolder.Items.Count - 1 do
  begin
    xItem := lvwTemplate.Items.Add;
    xItem.Caption := ExtractFileName(flstFolder.Items[i]);
    xItem.SubItems.Add(UpperCase(ExtractFileExt(flstFolder.Items[i])));

    if xItem.SubItems[0] = '.TXT' then
    begin
      xItem.SubItems.Add('文本文件');
      xItem.ImageIndex := 0;
    end
    else if xItem.SubItems[0] = '.DOT' then
    begin
      xItem.SubItems.Add('Microsoft Word 模板');
      xItem.ImageIndex := 1;
    end
    else
    begin
      xItem.SubItems.Add('HTML 模板');
      xItem.ImageIndex := 2;
    end;
  end;

  btnSave.Enabled := lvwTemplate.Items.Count > 0;

  if lvwTemplate.Items.Count > 0 then
    lvwTemplate.ItemIndex := 0;  
end;

procedure TdlgExport.lvwTemplateChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  btnSave.Enabled := lvwTemplate.SelCount > 0;
end;

procedure TdlgExport.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TdlgExport.btnSaveClick(Sender: TObject);
var
  TemplateFile: string;
begin
  // 打开保存文件对话框
  case lvwTemplate.Selected.ImageIndex of
    0: dlgSaveExport.Filter := 'TXT - 文本文件|*.txt';
    1: dlgSaveExport.Filter := 'DOC - Microsoft Word 文档|*.doc';
    else dlgSaveExport.Filter := 'HTM - HTML 文档|*.htm';
  end;

  dlgSaveExport.DefaultExt := LeftStr(dlgSaveExport.Filter, 3);
  TemplateFile := AppendPath(txtLocation.Text, lvwTemplate.Selected.Caption);

  if dlgSaveExport.Execute then
    case lvwTemplate.Selected.ImageIndex of
    1: FSaveDOC(TemplateFile, dlgSaveExport.FileName);
    else FSaveText(TemplateFile, dlgSaveExport.FileName);
  end;
end;

procedure TdlgExport.FSaveDOC(const Template: String; const Destination: String);
var
  {WordApp: TWordApplication;
  WordDoc: TWordDocument;
  TemplateDoc: TWordDocument;
  EditorDoc: TWordDocument;}

  {DocHeaderStart, DocHeaderEnd: Integer;
  DocTailStart, DocTailEnd: Integer;
  SecHeaderStart, SecHeaderEnd: Integer;
  SecTailStart, SecTailEnd: Integer;
  MessageStart, MessageEnd: Integer;}

  {TMPSectionBegin: Integer;
  TMPSectionEnd: Integer;
  TMPMessageBegin: Integer;
  TMPMessageEnd: Integer;

  i: Integer;
  OVTemplate, OVBooleanFalse: OleVariant;
  OVBooeanTrue, OVInteger: OleVariant;}

  ADate: TDate;
  ATime: TTime;
  AContent: String;
  AName: String;
  VNewDay: Boolean;

  BinFile: TFileStream;
  i: Cardinal;
  b: Byte;

  Cmd: String;
  ARunThread: TRunCmd;
  TmpFile: string;
begin
{  OVTemplate := Template;
  OVBooleanFalse := False;
  OVBooeanTrue := True;
  OVInteger := wdNewBlankDocument;

  WordApp := TWordApplication.Create(Self);
  WordDoc := TWordDocument.Create(Self);
  TemplateDoc := TWordDocument.Create(Self);
  WordApp.Connect;
  WordDoc.ConnectTo(WordApp.Documents.Add(OVTemplate, EmptyParam,
    EmptyParam, EmptyParam));
  EditorDoc.ConnectTo(WordApp.Documents.Add(EmptyParam, EmptyParam,
    EmptyParam, EmptyParam));
  TemplateDoc.ConnectTo(WordApp.Documents.Open(OVTemplate, EmptyParam,
    EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
    EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
    EmptyParam, EmptyParam, EmptyParam));

  // 检查模板中的节开头的结尾
  for i := 1 to TemplateDoc.Paragraphs.Count  do
    if TemplateDoc.Paragraphs.Item(i).Range.Text = MARK_SECTION_BEGIN then
      TMPSectionBegin := i
    else if TemplateDoc.Paragraphs.Item(i).Range.Text = MARK_SECTION_END then
      TMPSectionEnd := i
    else if TemplateDoc.Paragraphs.Item(i).Range.Text = MARK_MESSAGE_BEGIN then
      TMPMessageBegin := i
    else if TemplateDoc.Paragraphs.Item(i).Range.Text = MARK_MESSAGE_END then
      TMPMessageEnd := i;



  // 删除文件中的内容
  WordDoc.Range.Delete(EmptyParam, EmptyParam);

  // 复制开头的部分
  TemplateDoc.Range(OleVariant(TemplateDoc.Range.Start),
    OleVariant(TemplateDoc.Paragraphs.Item(TMPSectionBegin).Range.Start)).Copy;
  WordDoc.Range(1).Paste;}

  // 打开数据库
  FOpenDatebase;

  // 打开文件
  TmpFile := GetTempFile;
  BinFile := TFileStream.Create(TmpFile, fmOpenWrite);
  pbExport.Visible := True;

  // 读取数据
  while not NextSMS(ADate, ATime, AContent, AName, VNewDay) do
  begin
    // 写入数据到文件
    BinFile.Write(ADate, SizeOf(ADate));

    i := Length(AName);
    BinFile.WriteBuffer(i, SizeOf(Cardinal));
    BinFile.WriteBuffer(Pointer(AName)^, Length(AName));
    b := 0;
    BinFile.Write(b, SizeOf(Byte));

    i := Length(AContent);
    BinFile.WriteBuffer(i, SizeOf(Cardinal));
    BinFile.WriteBuffer(Pointer(AContent)^, Length(AContent));
    b := 0;
    BinFile.Write(b, SizeOf(Byte));

    pbExport.StepIt;
  end;

  BinFile.Free;

  // 执行程序
  Cmd := '"' + AppendPath(sPath, 'bin2doc.exe') + '" ';
  Cmd := Cmd + '"' + TmpFile + '" "' + Template +'" "' + Destination + '"';
//    CreateProcess(nil, PChar(Cmd), nil, nil, False, 0, nil, PChar(sPath), sinfo, tmp);
  ARunThread := TRunCmd.Create(True);
  ARunThread.Cmd := Cmd;
  ARunThread.Suspended := False;
  Sleep(500);
  Close;
end;

procedure TdlgExport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SelInternalIDs.Free;
  AllInternalIDs.Free;
end;

procedure TdlgExport.rgScopeClick(Sender: TObject);
begin
  FEnableAllControls(True, False);
end;

procedure TdlgExport.FSaveText(const Template: String; const Destination: String);
var
  BeforeSection: String;
  AfterSection: String;
  BeforeMessage: String;
  AfterMessage: String;
  MessageMain: String;

  TempDate: String;
  iBegin: Integer;
  iEnd: Integer;

  SDest: TStringStream;
  FDest: TFileStream;

  FirstHeader: Boolean;

  ADate: TDate;
  ATime: TTime;
  AContent: String;
  AName: String;
  VNewDay: Boolean;
begin
  // 打开模板文件
  FDest := TFileStream.Create(Template, fmOpenRead);
  SDest := TStringStream.Create('');
  SDest.CopyFrom(FDest, 0);
  TempDate := SDest.DataString;
  SDest.Free;
  FDest.Free;

  // 分析模板文件 节头部
  iBegin := AnsiPos(MARK_SECTION_BEGIN, TempDate);
  if iBegin > 0 then
    BeforeSection := LeftBStr(TempDate, iBegin - 1);

  // 消息头部
  iBegin := iBegin + Length(MARK_SECTION_BEGIN);
  iEnd := AnsiPos(MARK_MESSAGE_BEGIN, TempDate);

  if iEnd > iBegin then
    BeforeMessage := MidBStr(TempDate, iBegin, iEnd - iBegin);

  // 消息正文
  iBegin := iEnd + Length(MARK_MESSAGE_BEGIN);
  iEnd := AnsiPos(MARK_MESSAGE_END, TempDate);

  if iEnd > iBegin then
    MessageMain := MidBStr(TempDate, iBegin, iEnd - iBegin);

  // 消息尾部
  iBegin := iEnd + Length(MARK_MESSAGE_END);
  iEnd := AnsiPos(MARK_SECTION_END, TempDate);

  if iEnd > iBegin then
    AfterMessage := MidBStr(TempDate, iBegin, iEnd - iBegin);

  // 节尾部
  iBegin := iEnd + Length(MARK_SECTION_END);
  iEnd := Length(TempDate);

  if iEnd > iBegin then
    AfterSection := MidBStr(TempDate, iBegin, iEnd - iBegin);

  // 开始写入
  SDest := TStringStream.Create('');
  SDest.WriteString(BeforeSection);
  FirstHeader := True;
  pbExport.Visible := True;

  // 读取数据
  FOpenDatebase;

  while not NextSMS(ADate, ATime, AContent, AName, VNewDay) do
  begin
    // 写入上一个节的末尾
    if VNewDay and (not FirstHeader) then
      SDest.WriteString(StringReplace(AfterMessage, MARK_DATE,
        DateToStr(ADate), [rfReplaceAll]));

    // 写入节头部
    if VNewDay then
      SDest.WriteString(StringReplace(BeforeMessage, MARK_DATE,
        DateToStr(ADate), [rfReplaceAll]));

    // 开始写入消息实体
    TempDate := StringReplace(MessageMain, MARK_TIME, TimeToStr(ATime), [rfReplaceAll]);
    TempDate := StringReplace(TempDate, MARK_NAME, AName, [rfReplaceAll]);
    TempDate := StringReplace(TempDate, MARK_CONTENT, AContent, [rfReplaceAll]);
    SDest.WriteString(TempDate);

    // 更新进度
    pbExport.StepIt;
    Application.ProcessMessages;
  end;

  SDest.WriteString(AfterSection);

  // 写入到文件中
  FDest := TFileStream.Create(Destination, fmCreate);
  FDest.CopyFrom(SDest, 0);
  FDest.Free;

  // 打开文件
  ShellExecute(Handle, 'open', PChar(Destination), nil, nil, SW_SHOWDEFAULT);

  Close;
end;

end.
