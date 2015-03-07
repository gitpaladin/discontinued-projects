unit uFrmReadSMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxDockControl, dxDockPanel, dxBar, dxBarExtItems, ImgList,
  cxGraphics, cxControls, dxStatusBar, SynEdit, SynMemo, SynEditor,
  SynEditActions, ActnList, Contnrs, ExtCtrls, GerneralFunc, ComCtrls,
  ToolWin, UxTheme, StdCtrls, DateUtils, cxClasses;

const
  WM_MSG_CLOSEWND = WM_USER + 461;

type
  TBox = (bReceive, bSend, bFinish);

  TContactInfo = record
    Name: String;
    Phone: String;
  end;

  TfrmReadSMS = class(TForm)
    dxbmMain: TdxBarManager;
    mnuSMS: TdxBarSubItem;
    mnuSMSSave: TdxBarButton;
    mnuSMSDelete: TdxBarButton;
    mnuSMSRelpy: TdxBarButton;
    mnuSMSTransmit: TdxBarButton;
    mnuSMSResend: TdxBarButton;
    mnuSMSPreview: TdxBarButton;
    mnuSMSPrint: TdxBarButton;
    mnuSMSClose: TdxBarButton;
    mnuEdit: TdxBarSubItem;
    mnuEditCopyEntire: TdxBarButton;
    mnuEditCopy: TdxBarButton;
    mnuEditFind: TdxBarButton;
    mnuEditFindNext: TdxBarButton;
    mnuSMSSend: TdxBarButton;
    mnuView: TdxBarSubItem;
    mnuViewToolbar: TdxBarButton;
    mnuViewAddress: TdxBarButton;
    mnuViewStatusbar: TdxBarButton;
    mnuViewNext: TdxBarButton;
    mnuViewPrevious: TdxBarButton;
    mnuTool: TdxBarSubItem;
    mnuOption: TdxBarSubItem;
    mnuOptionAutoWarp: TdxBarButton;
    dxlbSend: TdxBarLargeButton;
    dxlbReply: TdxBarLargeButton;
    dxlbTransmit: TdxBarLargeButton;
    dxlbResend: TdxBarLargeButton;
    dxlbDelete: TdxBarLargeButton;
    dxlbCopyEntire: TdxBarLargeButton;
    dxlbFind: TdxBarLargeButton;
    dxlbFindNext: TdxBarLargeButton;
    dxlbPrevious: TdxBarLargeButton;
    dxlbNext: TdxBarLargeButton;
    iltToolbar: TImageList;
    dxlbPreview: TdxBarLargeButton;
    dxlbPrint: TdxBarLargeButton;
    dxsDate: TdxBarStatic;
    iltMenu: TImageList;
    dxeDate: TdxBarEdit;
    dxsAddress: TdxBarStatic;
    stbMain: TdxStatusBar;
    txtSMS: TSynEditor;
    atlTextBox: TActionList;
    aSynFind: TaSynFind;
    aSynFindNext: TaSynFindNext;
    aSynCopy: TaSynCopy;
    aSynExporter: TaSynExporter;
    iltStatusBar: TImageList;
    mnuEditRead: TdxBarButton;
    mnuEditReplied: TdxBarButton;
    mnuEditTransmitted: TdxBarButton;
    tmrReadStatus: TTimer;
    iltStatus: TImageList;
    stbMainContainer3: TdxStatusBarContainerControl;
    tlbStatus: TToolBar;
    btnRead: TToolButton;
    btnReply: TToolButton;
    btnTransmit: TToolButton;
    pnlMsgReport: TPanel;
    lblMessageReport: TLabel;
    imgMsgReport: TImage;
    imgRepDate: TImage;
    lblDate: TLabel;
    lblRepAddressee: TLabel;
    imgRepAddressee: TImage;
    dxmnuCreateContact: TdxBarButton;
    dxmnuReplaceContact: TdxBarButton;
    dxmnuCopyToClipboard: TdxBarButton;
    dxmnuCreateSMS: TdxBarButton;
    popContact: TdxBarPopupMenu;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuViewToolbarClick(Sender: TObject);
    procedure mnuViewAddressClick(Sender: TObject);
    procedure mnuViewStatusbarClick(Sender: TObject);
    procedure mnuSMSCloseClick(Sender: TObject);
    procedure mnuOptionAutoWarpClick(Sender: TObject);
    procedure mnuSMSDeleteClick(Sender: TObject);
    procedure mnuSMSSendClick(Sender: TObject);
    procedure mnuSMSRelpyClick(Sender: TObject);
    procedure mnuSMSTransmitClick(Sender: TObject);
    procedure mnuEditCopyEntireClick(Sender: TObject);
    procedure mnuEditReadClick(Sender: TObject);
    procedure mnuEditRepliedClick(Sender: TObject);
    procedure mnuEditTransmittedClick(Sender: TObject);
    procedure mnuViewPreviousClick(Sender: TObject);
    procedure mnuViewNextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrReadStatusTimer(Sender: TObject);
    procedure mnuSMSPreviewClick(Sender: TObject);
    procedure mnuSMSPrintClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure btnReplyClick(Sender: TObject);
    procedure btnTransmitClick(Sender: TObject);
    procedure dxeDateChange(Sender: TObject);
    procedure mnuSMSResendClick(Sender: TObject);
    procedure dxmnuCreateContactClick(Sender: TObject);
    procedure dxmnuCopyToClipboardClick(Sender: TObject);
    procedure dxmnuCreateSMSClick(Sender: TObject);
    procedure dxmnuReplaceContactClick(Sender: TObject);
    procedure RefreshContent;
  private
    id: Integer;
    FTableName: String;
    FDateField: String;
    FContants: TObjectList;
    FSMSPhone: String;
    FSMSName: String;
    slPhones: TStringList;
    slNames: TStringList;
    FContactInfo: array of TContactInfo;
    procedure FDeleteBars;
    { Private declarations }
    procedure FAPICloseWindow(var Message: TMessage); message WM_MSG_CLOSEWND;
  public
    InternalID: Integer;
    IDBox: TBox;
    procedure RefreshClient(ADate: TDateTime;
      AContent: String; BReceive: Boolean = True; RedrawBar: Boolean = True);
    procedure ContactItemClick(Sender: TObject);
    procedure OpenSMS(ABOX: TBox; AInternalID: Integer; RedrawBar: Boolean = True);
    function MinimizedPhone(sSrc: String): String;
    { Public declarations }
  end;

implementation

{$R *.dfm}
uses
  DB, ADODB, UserInterfaces, uFrmWriteSMS, Clipbrd, StrUtils, uDlgPrint;

procedure TfrmReadSMS.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
end;

// 刷新栏
procedure TfrmReadSMS.RefreshClient(ADate:
  TDateTime; AContent: String; BReceive: Boolean = True; RedrawBar: Boolean = True);
var
  i: Integer;
  btnContactItem: TdxBarButton;
  bErrorOccur: Boolean;
begin
  if BReceive then
  begin
    mnuTool.Caption := '发件人(&S)';
    dxsAddress.Caption := '发件人:';
  end
  else
  begin
    mnuTool.Caption := '收件人(&S)';
    dxsAddress.Caption := '收件人:';
  end;

  dxeDate.Tag := 1;   // 防止刷新
  dxeDate.Text := DateTimeToStr(ADate);
  dxeDate.Tag := 0;
  AContent := AnsiReplaceText(AContent, #$D#$A, #$D);
  stbMain.Panels[0].Text := Format('共 %d 个字符', [Length(WideString(AContent))]);
  txtSMS.Text := AContent;

  for i := slNames.Count to slPhones.Count - 1 do
    slNames.Add('');

  // 更新工具栏
//  dxbmMain.BarByOldName('Address').Visible := False;

  FDeleteBars;

  // 设置数据内容
  SetLength(FContactInfo, slPhones.Count);

  for i := 0 to slPhones.Count - 1 do
  begin
    // dxbmMain
    btnContactItem := TdxBarButton.Create(nil);
    btnContactItem.Visible := ivAlways;
    btnContactItem.Tag := i;
    FContants.Add(btnContactItem);

    if Length(slNames[i]) > 0 then
      btnContactItem.Caption := slNames[i] + #40 + slPhones[i] + #41
    else
      btnContactItem.Caption := '<未知>' + #40 + slPhones[i] + #41;

    btnContactItem.OnClick := ContactItemClick;

    FContactInfo[i].Name := slNames[i];
    FContactInfo[i].Phone := slPhones[i];

    // 添加到菜单和工具栏中
    mnuTool.ItemLinks.Add.Item := btnContactItem;
    dxbmMain.BarByOldName('Address').ItemLinks.Add.Item := btnContactItem;
  end;

//  dxbmMain.BarByOldName('Address').Visible := mnuViewAddress.Down;
end;

procedure TfrmReadSMS.RefreshContent;
begin
  // 更新界面内容
end;

procedure TfrmReadSMS.ContactItemClick(Sender: TObject);
begin
  // 分析对象
  if Sender is TdxBarButton then
  begin
    popContact.Tag := (Sender as TdxBarButton).Tag;
    popContact.PopupFromCursorPos;
  end;
end;

procedure TfrmReadSMS.FAPICloseWindow(var Message: TMessage);
begin
  Close;
end;

procedure TfrmReadSMS.OpenSMS(ABOX: TBox; AInternalID: Integer; RedrawBar: Boolean = True);
var
  dbRecord: TADOQuery;
  dbOrigin: TADOQuery;
  dbSMS: TADOQuery;
  sSender: String;
  dDate: TDateTime;
  MsgReport: Boolean;
  RepMessage: String;
begin
  mnuEditRead.Enabled := ABOX = bReceive;
  mnuEditReplied.Enabled := ABOX = bReceive;
  mnuEditTransmitted.Enabled := ABOX in [bReceive, bSend];
  btnRead.Enabled := ABOX = bReceive;
  btnReply.Enabled := ABOX = bReceive;
  btnTransmit.Enabled := ABOX in [bReceive, bSend];
  tmrReadStatus.Enabled := False;

  dbRecord := TADOQuery.Create(nil);
  dbRecord.Connection := frmMain.adoSMS;

  InternalID := AInternalID;
  IDBox := ABOX;

  // 读取数据库数据
  case ABOX of
    bReceive:
    begin
      dbRecord.SQL.Text := GetSQLStr(AInternalID,cvReceive);
      dbRecord.Open;
      mnuEditRead.Down := dbRecord.FieldByName('read').AsBoolean;
      mnuEditReplied.Down := dbRecord.FieldByName('replied').AsBoolean;
      mnuEditTransmitted.Down := dbRecord.FieldByName('transmitted').AsBoolean;
      sSender := dbRecord.FieldByName('number').AsString;
      tmrReadStatus.Enabled := not mnuEditRead.Down;
      mnuSMSSend.Enabled := False;
      mnuSMSRelpy.Enabled := True;
      mnuSMSTransmit.Enabled := True;
      mnuSMSResend.Enabled := False;
      dxlbSend.Enabled := False;
      dxlbReply.Enabled := True;
      dxlbTransmit.Enabled := True;
      dxlbResend.Enabled := False;
      FTableName := 'receive';
      FDateField := 'receivedate';

      // 关于消息报告的若干事宜
      if dbRecord.FieldByName('content').IsNull then
      begin
        MsgReport := True;

        // 查询最可能的源发送信息
        id := 0;
        dbOrigin := TADOQuery.Create(nil);
        dbOrigin.Connection := frmMain.adoSMS;
        if dbRecord.FieldByName('id').AsInteger = 0 then
        begin
          dbOrigin.SQL.Add('SELECT TOP 1 finish.internalid, finish.senderdate, finish.content, finish_item.number, finish_item.name');
          dbOrigin.SQL.Add('FROM finish LEFT JOIN finish_item ON finish.internalid = finish_item.associatedid');
          dbOrigin.SQL.Add(Format('WHERE (((finish.senderdate)<CDate("%s")) AND ((finish_item.number) LIKE "%%%s"))', [DateTimeToStr(IncMinute(dbRecord.FieldByName('date').AsDateTime, 1)), MinimizedPhone(dbRecord.FieldByName('number').AsString)]));
          dbOrigin.SQL.Add('ORDER BY finish.senderdate DESC;');
        end
        else
        begin
          dbOrigin.SQL.Add('SELECT finish.internalid, finish.senderdate, finish.content, finish_item.number, finish_item.name');
          dbOrigin.SQL.Add('FROM finish LEFT JOIN finish_item ON finish.internalid = finish_item.associatedid');
          dbOrigin.SQL.Add(Format('WHERE (finish.internalid=%d);', [-dbRecord.FieldByName('id').AsInteger]));
        end;
        dbOrigin.Open;

        if not dbOrigin.Eof then
        begin
          id := dbOrigin.FieldByName('internalid').AsInteger;
          RepMessage := dbOrigin.FieldByName('content').AsString;
          lblDate.Caption := '发送时间: ' + DateTimeToStr(dbOrigin.FieldByName('senderdate').AsDateTime);

          if dbOrigin.FieldByName('name').AsString = '' then
            lblRepAddressee.Caption := '收件人: ' + dbOrigin.FieldByName('number').AsString
          else
            lblRepAddressee.Caption := '收件人: ' + dbOrigin.FieldByName('name').AsString + ' ' + #40 + dbOrigin.FieldByName('number').AsString + #41;
        end
        else
        begin
          lblDate.Caption := '发送时间: <未找到源信息>';
          lblRepAddressee.Caption := '收件人: <未找到源信息>';
        end;

        dbOrigin.Close;
        dbOrigin.Free;
      end;
    end;
    bSend:
    begin
      dbRecord.SQL.Text := GetSQLStr(AInternalID,cvSend);
      dbRecord.Open;
      mnuEditRead.Down := False;
      mnuEditReplied.Down := False;
      mnuEditTransmitted.Down := False;
      mnuSMSSend.Enabled := True;
      mnuSMSRelpy.Enabled := False;
      mnuSMSTransmit.Enabled := False;
      mnuSMSResend.Enabled := False;
      dxlbSend.Enabled := True;
      dxlbReply.Enabled := False;
      dxlbTransmit.Enabled := False;
      dxlbResend.Enabled := False;
      FTableName := 'send';
      FDateField := 'senderdate';
    end;
    bFinish:
    begin
      dbRecord.SQL.Text := GetSQLStr(AInternalID, cvFinish);
      dbRecord.Open;
      mnuEditRead.Down := False;
      mnuEditReplied.Down := False;
      mnuEditTransmitted.Down := dbRecord.FieldByName('transmitted').AsBoolean;
      mnuEditRead.Enabled := False;
      mnuEditReplied.Enabled := False;
      mnuEditTransmitted.Enabled := True;
      mnuSMSSend.Enabled := False;
      mnuSMSRelpy.Enabled := False;
      mnuSMSTransmit.Enabled := True;
      mnuSMSResend.Enabled := True;
      dxlbSend.Enabled := False;
      dxlbReply.Enabled := False;
      dxlbTransmit.Enabled := True;
      dxlbResend.Enabled := True;
      FTableName := 'finish';
      FDateField := 'senderdate';
    end;
  end;

  slNames.Clear;
  slPhones.Clear;

  while not dbRecord.Eof do
  begin
    slNames.Add(dbRecord.FieldByName('name').AsString);
    slPhones.Add(dbRecord.FieldByName('number').AsString);
    dbRecord.Next;
  end;

  dbSMS := TADOQuery.Create(nil);
  dbSMS.Connection := frmMain.adoSMS;
  dbSMS.SQL.Text := Format('SELECT [internalid],[%s] FROM [%s] ORDER BY [%s] DESC;',
    [FDateField, FTableName, FDateField]);
  dbSMS.Open;

  if dbSMS.Locate('internalid', InternalID, []) then
  begin
    dbSMS.Next;
    mnuViewPrevious.Enabled := not dbSMS.Eof;
    dxlbPrevious.Enabled := not dbSMS.Eof;
    if not dbSMS.Eof then dbSMS.Prior;
    dbSMS.Prior;
    mnuViewNext.Enabled := not dbSMS.Bof;
    dxlbNext.Enabled := not dbSMS.Bof;
  end;

  dbSMS.Close;
  dbSMS.Free;


  FSMSPhone := slPhones.Text;
  FSMSName := slNames.Text;

  if MsgReport then
  begin
    RefreshClient(dbRecord.FieldByName('date').AsDateTime,
      RepMessage, ABOX = bReceive, RedrawBar);
    pnlMsgReport.Visible := True;
    txtSMS.Color := $00E6FFE6;
    txtSMS.Gutter.GradientEndColor := $00E6FFE6;
    txtSMS.Font.Color := clGreen;
  end
  else
  begin
    RefreshClient(dbRecord.FieldByName('date').AsDateTime,
      dbRecord.FieldByName('content').AsString, ABOX = bReceive,
      RedrawBar);
    pnlMsgReport.Visible := False;
    txtSMS.Color := clBtnFace;
    txtSMS.Gutter.GradientEndColor := clBtnFace;
    txtSMS.Font.Color := clWindowText;
  end;

  btnRead.Down := mnuEditRead.Down;
  btnReply.Down := mnuEditReplied.Down;
  btnTransmit.Down := mnuEditTransmitted.Down;

  dbRecord.Close;
  dbRecord.Free;
end;

procedure TfrmReadSMS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  rsWsMaximized := WindowState = wsMaximized;

  if not rsWsMaximized then
  begin
    rsWindowLeft := Left;
    rsWindowWidth := Width;
    rsWindowTop := Top;
    rsWindowHeight := Height;
  end;  

//  CloseWindow(Self.Handle);
//  dxbmMain.SaveToIniFile(AppendPath(sPath, 'readsms.bar'));
  msReadSMS.Seek(0, soFromBeginning);
  dxbmMain.SaveToStream(msReadSMS);
  frmMain.DeleteWnd(Handle);
//  FContants.Free;
  slPhones.Free;
  slNames.Free;
  Self.Release;
end;

procedure TfrmReadSMS.mnuViewToolbarClick(Sender: TObject);
begin
  dxbmMain.BarByOldName('Toolbar').Visible := mnuViewToolbar.Down;
end;

procedure TfrmReadSMS.mnuViewAddressClick(Sender: TObject);
begin
  dxbmMain.BarByOldName('Address').Visible := mnuViewAddress.Down;
end;

procedure TfrmReadSMS.mnuViewStatusbarClick(Sender: TObject);
begin
  stbMain.Visible := mnuViewStatusbar.Down;
end;

procedure TfrmReadSMS.mnuSMSCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReadSMS.mnuOptionAutoWarpClick(Sender: TObject);
begin
  txtSMS.WordWrap.Enabled := mnuOptionAutoWarp.Down;
end;

procedure TfrmReadSMS.mnuSMSDeleteClick(Sender: TObject);
var
  dbSMS: TADOTable;
  dbRelative: TADOQuery;
  iFinishID: Integer;
begin
  // 删除短信
  if MessageBox(Handle, '您是否要删除这条短信？该操作无法撤销。',
    PChar(Application.Title), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2)
    = IDNO then
    Exit;

  // 打开数据库
  dbSMS := TADOTable.Create(nil);
  dbSMS.Connection := frmMain.adoSMS;
  dbSMS.TableName := FTableName;
  dbSMS.Open;

  // 删除条目
  if dbSMS.Locate('internalid', InternalID, []) then
  begin
    if IDBox = bSend then
      iFinishID := dbSMS.FieldByName('finishid').AsInteger;

    dbSMS.Delete;
  end;

  dbSMS.Close;

  // 删除相关的条目
  if IDBox = bSend then
  begin
    dbSMS.TableName := 'finish';

    if dbSMS.Locate('internalid',iFinishID, []) then
      dbSMS.Delete;
  end
  else if IDBox = bFinish then
  begin
    dbRelative := TADOQuery.Create(nil);
    dbRelative.SQL.Text :=
      'DELETE *' + #13#10 +
      'FROM [finish_item]' + #13#10 +
      'WHERE [finish_item].[associatedid]= ' + IntToStr(InternalID)  + ';';
    dbRelative.ExecSQL;
    dbRelative.Free;
  end;

  dbSMS.Free;

  // 更新图表
  if (Integer(IDBox) = Integer(frmMain.CurrentView)) or (frmMain.CurrentView = cvNone) then
    frmMain.RefreshView(InternalID);

  // 关闭窗体
  Close;
end;

procedure TfrmReadSMS.mnuSMSSendClick(Sender: TObject);
var
  dbSMS: TADOTable;
begin
  // 立刻发送
  if IDBox <> bSend then Exit;

  // 打开数据库
  dbSMS := TADOTable.Create(nil);
  dbSMS.Connection := frmMain.adoSMS;
  dbSMS.TableName := 'send';
  dbSMS.Open;

  // 删除条目
  if dbSMS.Locate('internalid', InternalID, []) then
  begin
    JobThread.JobContent.AddSendJob(
      dbSMS.FieldByName('number').AsString,
      dbSMS.FieldByName('content').AsString,
      dbSMS.FieldByName('addressee').AsString,
      dbSMS.FieldByName('finishid').AsInteger);
    dbSMS.Delete;
  end;

  dbSMS.Close;

  // 更新图表
  if frmMain.CurrentView = cvSend then
    frmMain.RefreshView(InternalID);

  // 关闭窗体 开始做事
  Close;
  JobThread.Suspended := False;
end;

procedure TfrmReadSMS.mnuSMSRelpyClick(Sender: TObject);
var
  wWriteSMSWnd: TfrmWriteSMS;
  xItem: TListItem;
begin
  // 回复短信
  wWriteSMSWnd := TfrmWriteSMS.Create(nil);
  xItem := frmMain.lvwWindow.Items.Add;
  xItem.ImageIndex := 1;
  xItem.Data := Pointer(wWriteSMSWnd.Handle);
  xItem.Caption := '回复短信';

  // 填充一些信息
  wWriteSMSWnd.NewReply(InternalID);
  xItem.SubItems.Add('draft');
  xItem.SubItems.Add(IntToStr(0));

  // 关闭窗口
  Close;
end;

procedure TfrmReadSMS.mnuSMSTransmitClick(Sender: TObject);
var
  wWriteSMSWnd: TfrmWriteSMS;
  xItem: TListItem;
begin
  // 打开特定的窗口
  case IDBox of
    bReceive:
    begin
      // 打开草稿箱
      wWriteSMSWnd := TfrmWriteSMS.Create(nil);
      xItem := frmMain.lvwWindow.Items.Add;
      xItem.ImageIndex := 1;
      xItem.Data := Pointer(wWriteSMSWnd.Handle);
      xItem.Caption := '转发短信';

      // 填充一些信息
      wWriteSMSWnd.NewTransmit(InternalID, 'receive');
      xItem.SubItems.Add('draft');
      xItem.SubItems.Add(IntToStr(0));
    end;
    bFinish:
    begin
      // 打开草稿箱
      wWriteSMSWnd := TfrmWriteSMS.Create(nil);
      xItem := frmMain.lvwWindow.Items.Add;
      xItem.ImageIndex := 1;
      xItem.Data := Pointer(wWriteSMSWnd.Handle);
      xItem.Caption := '转发短信';

      // 填充一些信息
      wWriteSMSWnd.NewTransmit(InternalID, 'finish');
      xItem.SubItems.Add('draft');
      xItem.SubItems.Add(IntToStr(0));
    end;
  end;

end;

procedure TfrmReadSMS.mnuEditCopyEntireClick(Sender: TObject);
var
  bdCopy: TClipboard;
begin
  // 复制所有
  bdCopy := Clipboard;
  bdCopy.AsText := txtSMS.Text;
end;

procedure TfrmReadSMS.mnuEditReadClick(Sender: TObject);
var
  aItem: TIntegerDynArray;
begin
  // 编辑已读
  SetLength(aItem, 1);
  aItem[0] := InternalID;

  if mnuEditRead.Down then
    frmMain.UpdateMark(aItem, tbTrue, tbUnchange, tbUnchange, True)
  else
    frmMain.UpdateMark(aItem, tbFalse, tbUnchange, tbUnchange, True);

  if Assigned(Sender) then
    btnRead.Down := not btnRead.Down;

  // 更新图表
  if Integer(IDBox) = Integer(frmMain.CurrentView) then
    frmMain.RefreshView(InternalID);

end;

procedure TfrmReadSMS.mnuEditRepliedClick(Sender: TObject);
var
  aItem: TIntegerDynArray;
begin
  // 编辑已读
  SetLength(aItem, 1);
  aItem[0] := InternalID;

  if mnuEditReplied.Down then
    frmMain.UpdateMark(aItem, tbUnchange, tbTrue, tbUnchange, True)
  else
    frmMain.UpdateMark(aItem, tbUnchange, tbFalse, tbUnchange, True);

  if Assigned(Sender) then
    btnReply.Down := not btnReply.Down;

  // 更新图表
  if Integer(IDBox) = Integer(frmMain.CurrentView) then
    frmMain.RefreshView(InternalID);
end;

procedure TfrmReadSMS.mnuEditTransmittedClick(Sender: TObject);
var
  aItem: TIntegerDynArray;
begin
  // 编辑已读
  SetLength(aItem, 1);
  aItem[0] := InternalID;

  if mnuEditTransmitted.Down then
    frmMain.UpdateMark(aItem, tbUnchange, tbUnchange, tbTrue, IDBox = bReceive)
  else
    frmMain.UpdateMark(aItem, tbUnchange, tbUnchange, tbFalse, IDBox = bReceive);

  if Assigned(Sender) then
    btnTransmit.Down := not btnTransmit.Down;

  // 更新图表
  if Integer(IDBox) = Integer(frmMain.CurrentView) then
    frmMain.RefreshView(InternalID);
end;

procedure TfrmReadSMS.mnuViewPreviousClick(Sender: TObject);
var
  dbSMS: TADOQuery;
  iInternal: Integer;
begin
  // 上一条短信
  dbSMS := TADOQuery.Create(nil);
  dbSMS.Connection := frmMain.adoSMS;
  dbSMS.SQL.Text := Format('SELECT [internalid],[%s] FROM [%s] ORDER BY [%s] DESC;',
    [FDateField, FTableName, FDateField]);
  dbSMS.Open;

  if dbSMS.Locate('internalid', InternalID, []) then
  begin
    dbSMS.Next;
    if not dbSMS.Eof then
      iInternal := dbSMS.FieldByName('internalid').AsInteger;
  end;

  dbSMS.Close;
  dbSMS.Free;

  if iInternal > 0 then
    OpenSMS(IDBox, iInternal, False);
end;

procedure TfrmReadSMS.mnuViewNextClick(Sender: TObject);
var
  dbSMS: TADOQuery;
  iInternal: Integer;
begin
  // 上一条短信
  dbSMS := TADOQuery.Create(nil);
  dbSMS.Connection := frmMain.adoSMS;
  dbSMS.SQL.Text := Format('SELECT [internalid],[%s] FROM [%s] ORDER BY [%s] DESC;',
    [FDateField, FTableName, FDateField]);
  dbSMS.Open;

  if dbSMS.Locate('internalid', InternalID, []) then
  begin
    dbSMS.Prior;
    if not dbSMS.Bof then
      iInternal := dbSMS.FieldByName('internalid').AsInteger;
  end;

  dbSMS.Close;
  dbSMS.Free;

  if iInternal > 0 then
    OpenSMS(IDBox, iInternal, False);
end;

procedure TfrmReadSMS.FormCreate(Sender: TObject);
begin
  SetWindowIcon(Handle, IDI_BREAD, IDI_SREAD);
  msReadSMS.Seek(0, soFromBeginning);
  dxbmMain.LoadFromStream(msReadSMS);
  FContants := TObjectList.Create;
  slPhones := TStringList.Create;
  slNames := TStringList.Create;
  tmrReadStatus.Interval := opAutoRead;
//  FContants.Assign();

  Windows.MoveWindow(Handle, rsWindowLeft, rsWindowTop, rsWindowWidth, rsWindowHeight, True);
  if rsWsMaximized then WindowState := wsMaximized;

end;

procedure TfrmReadSMS.FDeleteBars;
var
  i: Integer;
begin
//  for i := 0 to FContants.Count - 1 do
//    FContants.Items[i].Free;

  FContants.Clear;
end;

procedure TfrmReadSMS.tmrReadStatusTimer(Sender: TObject);
begin
  if(mnuEditRead.Down = False) and mnuEditRead.Enabled then
  begin
    mnuEditRead.Click;
    tmrReadStatus.Enabled := False;
  end;
end;

procedure TfrmReadSMS.mnuSMSPreviewClick(Sender: TObject);
var
  wPrintWnd: TDlgPrint;
  xPrintItem: TSMSEntry;
  xItem: TListItem;
begin
  // 回复短信
  wPrintWnd := TDlgPrint.Create(nil);
  xItem := frmMain.lvwWindow.Items.Add;
  xItem.ImageIndex := 3;
  xItem.Caption := '打印预览';
  xItem.Data := Pointer(wPrintWnd.Handle);

  // 填充一些信息
  xPrintItem := TSMSEntry.Create;
  xPrintItem.DateTime := StrToDateTime(dxeDate.Text);
  xPrintItem.Name.Text := FSMSName;
  xPrintItem.Phone.Text := FSMSPhone;
  xPrintItem.Receive := True;
  xPrintItem.Content := txtSMS.Text;

  xItem.SubItems.Add('preview');
  xItem.SubItems.Add(IntToStr(0));

  // 打开窗口
  wPrintWnd.MsgContent.Add(xPrintItem);
  wPrintWnd.SplitMsgMode := True;
  wPrintWnd.RefreshPreview;
  wPrintWnd.Show;
end;

procedure TfrmReadSMS.mnuSMSPrintClick(Sender: TObject);
var
  wPrintWnd: TDlgPrint;
  xPrintItem: TSMSEntry;
  xItem: TListItem;
begin
  // 回复短信
  wPrintWnd := TDlgPrint.Create(nil);
  xItem := frmMain.lvwWindow.Items.Add;
  xItem.ImageIndex := 3;
  xItem.Caption := '打印预览';
  xItem.Data := Pointer(wPrintWnd.Handle);

  // 填充一些信息
  xPrintItem := TSMSEntry.Create;
  xPrintItem.DateTime := StrToDateTime(dxeDate.Text);
  xPrintItem.Name.Text := FSMSName;
  xPrintItem.Phone.Text := FSMSPhone;
  xPrintItem.Receive := True;
  xPrintItem.Content := txtSMS.Text;

  xItem.SubItems.Add('preview');
  xItem.SubItems.Add(IntToStr(0));

  // 打开窗口
  wPrintWnd.MsgContent.Add(xPrintItem);
  wPrintWnd.SplitMsgMode := True;
  wPrintWnd.RefreshPreview;
  wPrintWnd.PrintDoc;
  wPrintWnd.Close;
end;

procedure TfrmReadSMS.btnReadClick(Sender: TObject);
begin
  mnuEditRead.Down := not mnuEditRead.Down;
  mnuEditReadClick(nil);
end;

procedure TfrmReadSMS.btnReplyClick(Sender: TObject);
begin
  mnuEditReplied.Down := not mnuEditReplied.Down;
  mnuEditRepliedClick(nil);
end;

procedure TfrmReadSMS.btnTransmitClick(Sender: TObject);
begin
  mnuEditTransmitted.Down := not mnuEditTransmitted.Down;
  mnuEditTransmittedClick(nil);
end;

procedure TfrmReadSMS.dxeDateChange(Sender: TObject);
var
  dbRecord: TADOQuery;
  dDate: TDateTime;
begin
  if dxeDate.Tag = 1 then Exit;

  try
    dDate := StrToDateTime(dxeDate.Text);

    dbRecord := TADOQuery.Create(nil);
    dbRecord.Connection := frmMain.adoSMS;
    dbRecord.SQL.Text := Format('SELECT TOP 1 [%s] FROM [%s] WHERE [internalid]=%d;',
      [FDateField, FTableName, InternalID]);
    dbRecord.Open;

    if not dbRecord.Eof then
    begin
      dbRecord.Edit;
      dbRecord.FieldByName(FDateField).AsDateTime := dDate;
      dbRecord.Post;
    end;

    dbRecord.Close;
    dbRecord.Free;

    frmMain.RefreshView(InternalID);
  except
    ;
  end;

end;

procedure TfrmReadSMS.mnuSMSResendClick(Sender: TObject);
var
  dbFinish: TADOTable;
  iIndex: Integer;
  i: Integer;
begin
  if not Connected then
  begin
    MessageBox(Handle, PChar('请连接移动电话。'), PChar(Application.Title), MB_ICONEXCLAMATION);
    Exit;
  end;

  // 重新发送短信
  dbFinish := TADOTable.Create(nil);
  dbFinish.Connection := frmMain.adoSMS;
  dbFinish.TableName := 'finish';
  dbFinish.Open;
  dbFinish.Append;
  dbFinish.FieldByName('transmitted').AsBoolean := False;
  dbFinish.FieldByName('content').AsString := txtSMS.Text;
  dbFinish.Post;
  iIndex := dbFinish.FieldByName('internalid').AsInteger;

  for i := 0 to slPhones.Count - 1 do
    JobThread.JobContent.AddSendJob(slPhones[i], txtSMS.Text, slNames[i], iIndex).RequireReport := wsReport;

  JobThread.Suspended := False;

  dbFinish.Close;
  dbFinish.Free;
end;

function TfrmReadSMS.MinimizedPhone(sSrc: String): String;
begin
  if LeftStr(sSrc, 3) = '+86' then
    Result := RightStr(sSrc, Length(sSrc) - 3)
  else
    Result := sSrc;

end;

procedure TfrmReadSMS.dxmnuCreateContactClick(Sender: TObject);
begin
  // 创建联系人
  frmMain.AddContact(FContactInfo[popContact.Tag].Phone);
  OpenSMS(IDBox, InternalID, False);
end;

procedure TfrmReadSMS.dxmnuCopyToClipboardClick(Sender: TObject);
begin
  Clipboard.AsText := FContactInfo[popContact.Tag].Phone;
end;

procedure TfrmReadSMS.dxmnuCreateSMSClick(Sender: TObject);
var
  PhoneNumber: WideString;
  Name: WideString;
  wWriteSMSWnd: TfrmWriteSMS;
  xItem: TListItem;
begin
  PhoneNumber := FContactInfo[popContact.Tag].Phone;
  Name := FContactInfo[popContact.Tag].Name;

  // 窗口撰写短信窗口    
  wWriteSMSWnd := TfrmWriteSMS.Create(nil);
  xItem := frmMain.lvwWindow.Items.Add;
  xItem.ImageIndex := 1;
  xItem.Data := Pointer(wWriteSMSWnd.Handle);
  xItem.SubItems.Add('draft');
  xItem.SubItems.Add('0');
  wWriteSMSWnd.NewSMS;
  wWriteSMSWnd.AppendContact(Name, PhoneNumber);
  wWriteSMSWnd.Modified := False; 
end;

procedure TfrmReadSMS.dxmnuReplaceContactClick(Sender: TObject);
begin
  frmMain.ReplaceContact(FContactInfo[popContact.Tag].Phone);
  OpenSMS(IDBox, InternalID, False);
end;

end.
