unit uFrmWriteSMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, dxBar, cxControls, dxStatusBar, dxBarExtItems,
  ImgList, ExtCtrls, dxDockControl, dxDockPanel, VirtualTrees, SynEdit,
  SynMemo, Buttons, ComCtrls, StdCtrls, SynEditActions, ActnList, SynEditor,
  uFraInfoPreview, Menus, GerneralFunc, cxClasses;

const
  // Helper message to decouple node change handling from edit handling.
  WM_STARTEDITING = WM_USER + 778;
  WM_MSG_CLOSEWND = WM_USER + 461;

type
  TNewSMSType = (nstNew, nstReply, nstTransmit);

  TfrmWriteSMS = class(TForm)                                                
    stbMain: TdxStatusBar;
    dxbmMain: TdxBarManager;
    mnuSMS: TdxBarSubItem;
    mnuSMSSend: TdxBarButton;
    mnuSMSSaveDraft: TdxBarButton;
    mnuSMSSaveOutbox: TdxBarButton;
    mnuSMSSaveAs: TdxBarButton;
    mnuSMSImport: TdxBarButton;
    mnuSMSExit: TdxBarButton;
    mnuEdit: TdxBarSubItem;
    mnuEditUndo: TdxBarButton;
    mnuEditRedo: TdxBarButton;
    mnuEditCut: TdxBarButton;
    mnuEditCopy: TdxBarButton;
    mnuEditPaste: TdxBarButton;
    mnuEditDelete: TdxBarButton;
    mnuEditFind: TdxBarButton;
    mnuEditFindNext: TdxBarButton;
    mnuEditReplace: TdxBarButton;
    mnuView: TdxBarSubItem;
    mnuViewToolbar: TdxBarButton;
    mnuViewStatusBar: TdxBarButton;
    mnuViewAddressee: TdxBarButton;
    mnuInsert: TdxBarSubItem;
    mnuInsertDate: TdxBarButton;
    mnuInsertTime: TdxBarButton;
    mnuInsertDateTime: TdxBarButton;
    mnuInsertPhoneBook: TdxBarButton;
    mnuOption: TdxBarSubItem;
    mnuOptionIns: TdxBarButton;
    mnuOptionWordWrap: TdxBarButton;
    iltToolbar: TImageList;
    dxlbSend: TdxBarLargeButton;
    dxlbOutbox: TdxBarLargeButton;
    dxlbDraft: TdxBarLargeButton;
    dxlbCut: TdxBarLargeButton;
    dxlbCopy: TdxBarLargeButton;
    dxlbPaste: TdxBarLargeButton;
    dxlbPhonebook: TdxBarLargeButton;
    iltStatusBar: TImageList;
    iltHeader: TImageList;
    actEdit: TActionList;
    aSynSaveAs: TaSynSaveAs;
    aSynFind: TaSynFind;
    aSynFindNext: TaSynFindNext;
    aSynFindLast: TaSynFindLast;
    aSynReplace: TaSynReplace;
    aSynUndo: TaSynUndo;
    aSynRedo: TaSynRedo;
    aSynCut: TaSynCut;
    aSynCopy: TaSynCopy;
    aSynPaste: TaSynPaste;
    aSynInsertFile: TaSynInsertFile;
    pnlAddressee: TPanel;
    splAddressee: TSplitter;
    pnlButtons: TPanel;
    btnAddAll: TSpeedButton;
    btnAddSel: TSpeedButton;
    btnDelete: TSpeedButton;
    btnDelAll: TSpeedButton;
    vstPhoneBook: TVirtualStringTree;
    vstAddressee: TVirtualStringTree;
    aSynClearAll: TaSynClearAll;
    dxbrAddressee: TdxBarButton;
    fraInfoPreview: TfraInfoPreview;
    iltMenu: TImageList;
    dxlbUndo: TdxBarLargeButton;
    dxllbRedo: TdxBarLargeButton;
    mnuSMSPrint: TdxBarButton;
    mnuSMSPrintPreivew: TdxBarButton;
    dxlbPrint: TdxBarLargeButton;
    dxlbPrintPreview: TdxBarLargeButton;
    dxlbReport: TdxBarLargeButton;
    dxmnuOptionReport: TdxBarButton;
    dxmnuOptionAutoPrefix: TdxBarButton;
    dmWriteSMS: TdxDockingManager;
    dxdsWriteSMS: TdxDockSite;
    dxdpSMS: TdxDockPanel;
    txtSMS: TSynEditor;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dxdpAddressee: TdxDockPanel;
    dxLayoutDockSite2: TdxLayoutDockSite;
    dxdpOriginalInfo: TdxDockPanel;
    dxmnuViewOriginal: TdxBarButton;
    dxLayoutDockSite3: TdxLayoutDockSite;
    bdcSearchArea: TdxBarDockControl;
    dxbrIncrementalSearch: TdxBar;
    dxtxtName: TdxBarEdit;
    dxlblFind: TdxBarStatic;
    dxlblFilter: TdxBarStatic;
    dxtxtSpelling: TdxBarEdit;
    procedure CreateParams(var Params: TCreateParams);override;
    procedure pnlAddresseeResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure splAddresseeMoved(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure vstPhoneBookGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure vstPhoneBookGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer);
    procedure vstPhoneBookCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure btnAddAllClick(Sender: TObject);
    procedure vstAddresseeDblClick(Sender: TObject);
    procedure btnAddSelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnDelAllClick(Sender: TObject);
    procedure vstAddresseeNewText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; NewText: WideString);
    procedure txtNameChange(Sender: TObject);
    procedure txtNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtSMSChange(Sender: TObject);
    procedure vstAddresseeKeyAction(Sender: TBaseVirtualTree;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure mnuEditUndoClick(Sender: TObject);
    procedure dxbrAddresseeClick(Sender: TObject);
    procedure mnuSMSSaveDraftClick(Sender: TObject);
    procedure mnuSMSExitClick(Sender: TObject);
    procedure mnuSMSSaveOutboxClick(Sender: TObject);
    procedure mnuSMSSendClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mnuInsertDateClick(Sender: TObject);
    procedure mnuInsertTimeClick(Sender: TObject);
    procedure mnuInsertDateTimeClick(Sender: TObject);
    procedure mnuInsertPhoneBookClick(Sender: TObject);
    procedure mnuViewToolbarClick(Sender: TObject);
    procedure mnuViewAddresseeClick(Sender: TObject);
    procedure mnuViewStatusBarClick(Sender: TObject);
    procedure mnuOptionInsClick(Sender: TObject);
    procedure mnuOptionWordWrapClick(Sender: TObject);
    procedure mnuSMSPrintPreivewClick(Sender: TObject);
    procedure mnuSMSPrintClick(Sender: TObject);
    procedure vstPhoneBookGetHint(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex;
      var LineBreakStyle: TVTTooltipLineBreakStyle;
      var HintText: WideString);
    procedure dxmnuOptionReportClick(Sender: TObject);
    procedure dxmnuOptionAutoPrefixClick(Sender: TObject);
    procedure vstPhoneBookKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure vstAddresseeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxmnuViewOriginalClick(Sender: TObject);
    procedure dxdpOriginalInfoClose(Sender: TdxCustomDockControl);
    procedure dxdpAddresseeClose(Sender: TdxCustomDockControl);
    procedure FormResize(Sender: TObject);
    procedure dxtxtSpellingKeyPress(Sender: TObject; var Key: Char);
    procedure dxtxtSpellingKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxtxtSpellingCurChange(Sender: TObject);
    procedure vstPhoneBookHeaderClick(Sender: TVTHeader;
      HitInfo: TVTHeaderHitInfo);
  private
    { Private declarations }
    procedure WMStartEditing(var Message: TMessage); message WM_STARTEDITING;
    procedure FAPICloseWindow(var Message: TMessage); message WM_MSG_CLOSEWND;
    procedure SortListView(Target: TVirtualStringTree);
    function PrefixNumber(Number: String): String;
    function CanSend: Boolean;
    procedure FInsertText(AText: String);
  public
    { Public declarations }
    NewSMSType: TNewSMSType;
    AssociatedBox: String;
    AssociatedID: Integer;
    Modified: Boolean;
    AutoPrefix: Boolean;
    UCS2: Boolean;
    AddresseeCount: Integer;
    SeparationCount: Integer;
    DraftIndex: Integer;
    SMSReport: Boolean;
    procedure CheckCharset;
    procedure CheckAddressee;
    procedure CheckSeparation;
    procedure AppendContact(sNames, sPhones: String);
    procedure AppendOneContact(sNames, sPhones: String);
    procedure ShowDraft(InternalID: Integer);
    procedure NewSMS;
    procedure NewReply(AssociatedID: Integer);
    procedure NewTransmit(AssociatedID: Integer; AssociatedBox: String = 'receive');
    function CheckPhDulp(const Phone: String): Boolean;
    function GetSMSText: String;
  end;

  // 条目的数据类型
  TContactItem = record
    Name: String;
    Phone: String;
    Category: String;
  end;

  PContactItem = ^TContactItem;

{var
  frmWriteSMS: TfrmWriteSMS;}

implementation

{$R *.dfm}

uses
  UserInterfaces, DB, ADODB, StrUtils, Math, GSMChar, uDlgPrint,
  uFfmContact, CryptoAPI, GetGBKPY_imp;

procedure TfrmWriteSMS.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
end;

procedure TfrmWriteSMS.pnlAddresseeResize(Sender: TObject);
var
  NewWidth: Real;
  Space: Real;
begin
  // 按照空间大小调整控件
  Space := (pnlAddressee.Width - 45) / 1;
  NewWidth := Space * WndPercent;
  vstPhoneBook.Width := Max(Trunc(NewWidth), 200);
end;

procedure TfrmWriteSMS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  wsAutoPrefix := AutoPrefix;
  dxmnuOptionAutoPrefix.Down := AutoPrefix;
  wsWsMaximized := WindowState = wsMaximized;

  if not wsWsMaximized then
  begin
    wsWindowLeft := Left;
    wsWindowWidth := Width;
    wsWindowTop := Top;
    wsWindowHeight := Height;
  end;

//  msWriteDocking.Seek(0, soFromBeginning);
//  dmWriteSMS.SaveLayoutToStream(msWriteDocking);

  try
    msWriteSMS.Seek(0, soFromBeginning);
    dxbmMain.SaveToStream(msWriteSMS);
    frmMain.DeleteWnd(Handle);
  finally
    Self.Release;
  end;
end;

procedure TfrmWriteSMS.splAddresseeMoved(Sender: TObject);
begin
  WndPercent := vstPhoneBook.Width / (vstPhoneBook.Width + vstAddressee.Width);
end;

procedure TfrmWriteSMS.FormCreate(Sender: TObject);
var
  dbContacts: TADOTable;
  pContact: PContactItem;
  pNode: PVirtualNode;
begin
  SetWindowIcon(Handle, IDI_BWRITE, IDI_SWRITE);
  msWriteSMS.Seek(0, soFromBeginning);
  dxbmMain.LoadFromStream(msWriteSMS);

  dxbrIncrementalSearch.Visible := True;

  // 调整宽度
  AutoPrefix := wsAutoPrefix;
  dxmnuOptionReport.Down := AutoPrefix;

  SMSReport := wsReport;
  dxlbReport.Down := SMSReport;
  dxmnuOptionReport.Down := SMSReport;
  vstPhoneBook.NodeDataSize := SizeOf(TContactItem);
  vstAddressee.NodeDataSize := SizeOf(TContactItem);

  // 填充 LreeView
  dbContacts := TADOTable.Create(nil);
  try
    dbContacts.Connection := frmMain.adoContacts;
    dbContacts.TableName := 'contact';
    dbContacts.Open;

    while not dbContacts.Eof do
    begin
      pNode := vstPhoneBook.AddChild(nil);
      pContact := vstPhoneBook.GetNodeData(pNode);
      pContact.Name := dbContacts.FieldByName('name').AsString;
      pContact.Phone := dbContacts.FieldByName('phonenumber').AsString;
      pContact.Category := dbContacts.FieldByName('category').AsString;
      dbContacts.Next;
    end;
  finally
    dbContacts.Free;
    SortListView(vstPhoneBook);
  end;

  vstPhoneBook.Header.AutoFitColumns(False);
  Modified := False;

//  msWriteDocking.Seek(0, soFromBeginning);
//  dmWriteSMS.LoadLayoutFromStream(msWriteDocking);

  Windows.MoveWindow(Handle, wsWindowLeft, wsWindowTop, wsWindowWidth, wsWindowHeight, True);
  if wsWsMaximized then WindowState := wsMaximized;
end;

procedure TfrmWriteSMS.FormResize(Sender: TObject);
begin
  dxtxtName.Width := Width - 256;
end;

function TfrmWriteSMS.GetSMSText: String;
begin
  Result := txtSMS.Lines.Text;

  if AnsiEndsStr(' ', Result) then
    Result := LeftStr(Result, Length(Result) - 1);

end;

procedure TfrmWriteSMS.vstPhoneBookGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
  pContact: PContactItem;
begin
  pContact := Sender.GetNodeData(Node);

  case Column of
    0: CellText := pContact.Name;
    1: CellText := pContact.Phone;
    2: CellText := pContact.Category;
  end;
end;

procedure TfrmWriteSMS.vstPhoneBookHeaderClick(Sender: TVTHeader;
  HitInfo: TVTHeaderHitInfo);
begin
  // 排序
  if (hhiOnColumn in HitInfo.HitPosition) and (HitInfo.Column > -1) then
  begin
    if vstPhoneBook.Header.SortColumn = HitInfo.Column then
      if vstPhoneBook.Header.SortDirection = sdAscending then
        vstPhoneBook.Header.SortDirection := sdDescending
      else
        vstPhoneBook.Header.SortDirection := sdAscending
    else
      vstPhoneBook.Header.SortColumn := HitInfo.Column;

    SortListView(vstPhoneBook);
  end;
end;

procedure TfrmWriteSMS.SortListView(Target: TVirtualStringTree);
var
  i: Integer;
  Column: Integer;
  Direction: TSortDirection;
begin
  Column := Target.Header.SortColumn;
  Direction := Target.Header.SortDirection;

  if Column = -1 then Exit;

  for i := 0 to Target.Header.Columns.Count - 1 do
  begin
    Target.Header.Columns[i].Color := clWindow;
    Target.Header.Columns[i].ImageIndex := -1;
  end;

  Target.Header.Columns[Column].Color := $00F7F7F7;

  if Direction = sdAscending then
    Target.Header.Columns[Column].ImageIndex := 0
  else
    Target.Header.Columns[Column].ImageIndex := 1;

  Target.SortTree(Column, Direction, False);
end;

procedure TfrmWriteSMS.vstPhoneBookGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: Integer);
begin
  if Column = 0 then
    ImageIndex := 0
  else
    ImageIndex := -1;
end;

procedure TfrmWriteSMS.vstPhoneBookCompareNodes(Sender: TBaseVirtualTree;
  Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
  pData1: PContactItem;
  pData2: PContactItem;
begin
  pData1 := Sender.GetNodeData(Node1);
  pData2 := Sender.GetNodeData(Node2);

  case Column of
    0: Result := CompareText(pData1.Name, pData2.Name);
    1: Result := CompareText(pData1.Phone, pData2.Phone);
    2: Result := CompareText(pData1.Category, pData2.Category);
  end;
end;

procedure TfrmWriteSMS.btnAddAllClick(Sender: TObject);
var
  pNode1, pNode2: PVirtualNode;
  pData1, pData2: PContactItem;
begin
  // 添加所有
  pNode1 := vstPhoneBook.GetFirst;

  while not (pNode1 = nil) do
  begin
    pData1 := vstAddressee.GetNodeData(pNode1);

    if (not CheckPhDulp(pData1.Phone)) or (
      MessageBox(Handle, 
      PChar(Format('电话号码“%s”已经添加到发送人，您是否还是要添加。',
      [pData1.Phone])), PChar(Caption), MB_YESNO 
      + MB_ICONQUESTION + 
      MB_DEFBUTTON2) = IDYES) then
    begin
      pNode2 := vstAddressee.AddChild(nil);
      pData2 := vstAddressee.GetNodeData(pNode2);
      pData2.Name := pData1.Name;
      pData2.Phone := PrefixNumber(pData1.Phone);
    end;

    pNode1 := pNode1.NextSibling;
  end;
  CheckAddressee;
end;

procedure TfrmWriteSMS.vstAddresseeDblClick(Sender: TObject);
var
  pNode: PVirtualNode;
  pData: PContactItem;
begin
  // 添加一个条目
  pNode := vstAddressee.AddChild(nil);
  pData := vstAddressee.GetNodeData(pNode);
  pData.Phone := '在此输入电话号码';
  vstAddressee.FocusedNode := pNode;
  vstAddressee.FocusedColumn := 1;
  PostMessage(Self.Handle, WM_STARTEDITING, Integer(pNode), 0);
end;

procedure TfrmWriteSMS.btnAddSelClick(Sender: TObject);
var
  pNode1, pNode2: PVirtualNode;
  pData1, pData2: PContactItem;
begin
  // 添加选择
  pNode1 := vstPhoneBook.GetFirst;

  while not (pNode1 = nil) do
  begin
    if vstPhoneBook.Selected[pNode1] then
    begin
      pData1 := vstPhoneBook.GetNodeData(pNode1);

      if (not CheckPhDulp(pData1.Phone)) or (
        MessageBox(Handle, 
        PChar(Format('电话号码“%s”已经添加到发送人，您是否还是要添加。',
        [pData1.Phone])), PChar(Caption), MB_YESNO 
        + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES) then
      begin
        pNode2 := vstAddressee.AddChild(nil);
        pData2 := vstAddressee.GetNodeData(pNode2);
        pData2.Name := pData1.Name;
        pData2.Phone := PrefixNumber(pData1.Phone);
      end;
    end;
      
    pNode1 := pNode1.NextSibling;
  end;
  CheckAddressee;
end;

procedure TfrmWriteSMS.btnDeleteClick(Sender: TObject);
begin
  // 删除所选
  vstAddressee.DeleteSelectedNodes;
  CheckAddressee;
end;

procedure TfrmWriteSMS.btnDelAllClick(Sender: TObject);
begin
  // 删除所有
  vstAddressee.Clear;
  CheckAddressee;
end;

function TfrmWriteSMS.PrefixNumber(Number: String): String;
begin
  Result := Number;
  if AutoPrefix and (not AnsiStartsText('106', Number)) then
    if AnsiStartsText('0', Number) then
      Result := '106' + Result
    else if not AnsiStartsText('+86', Number) then
      Result := '+86' + Result;
end;

procedure TfrmWriteSMS.vstAddresseeNewText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; NewText: WideString);
var
  pData: PContactItem;
begin
  // 设置新的值
  pData := Sender.GetNodeData(Node);

  case Column of
    0: pData.Name := NewText;
    1:
    begin
      if (Length(NewText) > 1) and (ExtractPhoneNumber(NewText) = NewText) then
        pData.Phone := NewText
      else
      begin
        MessageBox(Handle, PChar('无效的电话号码。'), PChar(Caption), MB_ICONWARNING);
        PostMessage(Self.Handle, WM_STARTEDITING, Integer(Node), 0);
      end;
    end;
  end;

  CheckAddressee;
end;

procedure TfrmWriteSMS.txtNameChange(Sender: TObject);
var
  pData: PContactItem;
  pNode: PVirtualNode;
  Text: AnsiString;
  Source: AnsiString;
begin
  // 增量查询
  Text := dxtxtName.CurText;

  if Length(Text) = 0 then Exit;

  vstPhoneBook.ClearSelection;
  pNode := vstPhoneBook.GetFirst;
  while pNode <> nil do
  begin
    pData := vstPhoneBook.GetNodeData(pNode);
    Source := pData.Name;

    if AnsiStartsText(Text, Source) then
    begin
      vstPhoneBook.Selected[pNode] := True;
      vstPhoneBook.FullyVisible[pNode] := True;
      vstPhoneBook.FocusedNode := pNode;
      Break;
    end;

    pNode := pNode.NextSibling;
  end;
end;

procedure TfrmWriteSMS.txtNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if not dxtxtName. then Exit;
  case Key of
    VK_RETURN: btnAddSel.Click;
    VK_UP:
      // 选择上一个
      begin
        if not Assigned(vstPhoneBook.FocusedNode) then
          vstPhoneBook.FocusedNode := vstPhoneBook.GetFirst;

        if (vstPhoneBook.FocusedNode <> vstPhoneBook.GetFirst) then
        begin
          vstPhoneBook.FocusedNode := vstPhoneBook.GetPrevious(vstPhoneBook.FocusedNode);
          vstPhoneBook.ClearSelection;
          vstPhoneBook.Selected[vstPhoneBook.FocusedNode] := True;
        end;
      end;
    VK_DOWN:
      // 选择下一个
      begin
        if not Assigned(vstPhoneBook.FocusedNode) then
          vstPhoneBook.FocusedNode := vstPhoneBook.GetFirst;

        if (vstPhoneBook.FocusedNode <> vstPhoneBook.GetLast) then
        begin
          vstPhoneBook.FocusedNode := vstPhoneBook.GetNext(vstPhoneBook.FocusedNode);
          vstPhoneBook.ClearSelection;
          vstPhoneBook.Selected[vstPhoneBook.FocusedNode] := True;
        end;
      end;        
  end;
end;

procedure TfrmWriteSMS.CheckCharset;
begin
  UCS2 := IsSpecificTest(GetSMSText);

  if UCS2 then
    stbMain.Panels[4].Text := 'UCS2 字符集'
  else
    stbMain.Panels[4].Text := 'GSM 字符集';
end;

procedure TfrmWriteSMS.CheckAddressee;
var
  pData: PContactItem;
begin
  AddresseeCount := vstAddressee.TotalCount;
  stbMain.Panels[0].Text := Format('共 %d 个收件人', [AddresseeCount]);
  stbMain.Panels[2].Text := Format('合计 %d 条短信', [AddresseeCount * SeparationCount]);

  case NewSMSType of
    nstNew: Caption := '撰写短信';
    nstReply: Caption := '回复短信';
    nstTransmit: Caption := '转发短信';
  end;

  case AddresseeCount of
    0: ;
    1:
    begin
      pData := vstAddressee.GetNodeData(vstAddressee.GetFirst);
      if Length(pData.Name) = 0 then
        Caption := Caption + Format(' (%s)', [pData.Phone])
      else
        Caption := Caption + Format(' (%s)', [pData.Name]);
    end;
  else
    Caption := Caption + ' (多方发送)';
  end;

  frmMain.UpdateWndCaption(Handle);
  Modified := True;
end;

procedure TfrmWriteSMS.CheckSeparation;
var
  TextLen: Integer;
  TotalLen: Integer;
  CrTest: string;
begin
  CheckCharset;
  CrTest := AnsiReplaceText(GetSMSText, #$D#$A, #$D);
  TextLen := Length(WideString(CrTest));

  if UCS2 then
  begin
    SeparationCount := (TextLen - 1) div 70 + 1;
    TotalLen := 70 * SeparationCount;
  end
  else
  begin
    SeparationCount := (TextLen - 1) div 160 + 1;
    TotalLen := 160 * SeparationCount;
  end;

  if (SeparationCount > 1) and (opLongSMS) then
    if UCS2 then
    begin
      SeparationCount := (TextLen - 1) div (70 - 3) + 1;
      TotalLen := (70 - 3) * SeparationCount;
    end
    else
    begin
      SeparationCount := (TextLen - 1) div 154 + 1;
      TotalLen := 153 * SeparationCount;
    end;


  stbMain.Panels[1].Text := Format('分割 %d 条短信', [SeparationCount]);
  stbMain.Panels[2].Text := Format('合计 %d 条短信', [AddresseeCount * SeparationCount]);
  stbMain.Panels[3].Text := Format('%d/%d', [TextLen, TotalLen]);
  Modified := True;
end;

procedure TfrmWriteSMS.txtSMSChange(Sender: TObject);
begin
  CheckSeparation;
end;

procedure TfrmWriteSMS.WMStartEditing(var Message: TMessage);

// This message was posted by ourselves from the node change handler above to decouple that change event and our
// intention to start editing a node. This is necessary to avoid interferences between nodes editors potentially created
// for an old edit action and the new one we start here.

var
  Node: PVirtualNode;

begin
  Node := Pointer(Message.WParam);
  // Note: the test whether a node can really be edited is done in the OnEditing event.
  vstAddressee.EditNode(Node, 1);
end;

procedure TfrmWriteSMS.FAPICloseWindow(var Message: TMessage);
begin
  Close;
end;

procedure TfrmWriteSMS.vstAddresseeKeyAction(Sender: TBaseVirtualTree;
  var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
begin
  if CharCode = VK_DELETE then
    vstPhoneBook.ClearSelection;
end;

procedure TfrmWriteSMS.mnuEditUndoClick(Sender: TObject);
begin
  txtSMS.Undo;
end;

procedure TfrmWriteSMS.dxbrAddresseeClick(Sender: TObject);
begin
  // 选择收件人
  if txtSMS.Focused then
    dxtxtName.SetFocus(False)
  else
    Windows.SetFocus(txtSMS.Handle);
end;

procedure TfrmWriteSMS.dxdpAddresseeClose(Sender: TdxCustomDockControl);
begin
  mnuViewAddressee.Down := False;
end;

procedure TfrmWriteSMS.dxdpOriginalInfoClose(Sender: TdxCustomDockControl);
begin
  dxmnuViewOriginal.Down := False;
end;

procedure TfrmWriteSMS.mnuSMSSaveDraftClick(Sender: TObject);
var
  dbDraft: TADOTable;
  slNames: TStringList;
  slNumbers: TStringList;
  pRec: PVirtualNode;
  pData: PContactItem;
  i: Integer;
  bExiting: Boolean;
begin
  bExiting := False;
  // 检查草稿箱的容量
{$IFDEF REGISTERED}
  {$I Encode_Start.inc}
  if SameText(GlobalRegStatus, GRS_EXCEEDED) or SameText(GlobalRegStatus, GRS_UNREGISTERED) then
    if GetAllCount(frmMain.adoSMS) > REG_BOX_LIMIT then
    begin
      MessageBox(Handle,
        '您的 Ultra SMS 的程序是试用期版本或者已经过期，草稿箱容量限制为100条短信。',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      bExiting := True;
    end;
  {$I Encode_End.inc}

  if bExiting then
    Exit;
{$ENDIF}    

  slNames := TStringList.Create;
  slNumbers := TStringList.Create;
  pRec := vstAddressee.GetFirst;

  while Assigned(pRec) do
  begin
    pData := vstAddressee.GetNodeData(pRec);
    slNames.Add(pData.Name);
    slNumbers.Add(pData.Phone);
    pRec := pRec.NextSibling;
  end;

  // 保存到草稿
  dbDraft := TADOTable.Create(nil);
  dbDraft.Connection := frmMain.adoSMS;
  dbDraft.TableName := 'draft';
  dbDraft.Open;

  if dbDraft.Locate('internalid', DraftIndex, []) then
    dbDraft.Edit
  else
    dbDraft.Append;

  dbDraft.FieldByName('date').AsDateTime := Now;
  dbDraft.FieldByName('content').AsString := GetSMSText;
//  dbDraft.FieldByName('number').AsString := slNumbers.Text;
//  dbDraft.FieldByName('addressee').AsString := slNames.Text;
  dbDraft.FieldByName('drafttype').AsInteger := Integer(NewSMSType);
  dbDraft.FieldByName('associatedbox').AsString := AssociatedBox;
  dbDraft.FieldByName('associatedid').AsInteger := AssociatedID;
  dbDraft.Post;

  DraftIndex := dbDraft.FieldByName('internalid').AsInteger;
  frmMain.UpdateWndID(Handle, DraftIndex);

  dbDraft.Close;

  // 保存号码和姓名
  dbDraft.TableName := 'draft_item';
  dbDraft.Open;

  while dbDraft.Locate('associatedid', DraftIndex, []) do
    dbDraft.Delete;

  if slNumbers.Count > 0 then
    for i := 0 to slNumbers.Count - 1 do
    begin
      dbDraft.Append;
      dbDraft.FieldByName('name').AsString := slNames[i];
      dbDraft.FieldByName('number').AsString := slNumbers[i];
      dbDraft.FieldByName('associatedid').AsInteger := DraftIndex;
      dbDraft.Post;
    end
  else
  begin
    dbDraft.Append;
    dbDraft.FieldByName('number').Clear;
    dbDraft.FieldByName('associatedid').AsInteger := DraftIndex;
    dbDraft.Post;
  end;

  // 释放对象
  dbDraft.free;
  slNames.Free;
  slNumbers.Free;

  // 刷新
  if frmMain.CurrentView = cvDraft then
    frmMain.RefreshView(DraftIndex);
  Modified := False;
end;

procedure TfrmWriteSMS.mnuSMSExitClick(Sender: TObject);
begin
  Close;
end;

function TfrmWriteSMS.CanSend: Boolean;
begin
  Result := (vstAddressee.TotalCount > 0) and (GetSMSText <> '');
end;

procedure TfrmWriteSMS.mnuSMSSaveOutboxClick(Sender: TObject);
var
  dbFinish: TADOTable;
  dbOutbox: TADOTable;
  slNames: TStringList;
  slNumbers: TStringList;
  pRec: PVirtualNode;
  pData: PContactItem;
  iIndex: Integer;
  i: Integer;
  bExiting: Boolean;
begin
{$IFDEF REGISTERED}
  bExiting := False;
  // 检查草稿箱的容量
  {$I Encode_Start.inc}
  if SameText(GlobalRegStatus, GRS_EXCEEDED) or SameText(GlobalRegStatus, GRS_UNREGISTERED) then
    if GetAllCount(frmMain.adoSMS) > REG_BOX_LIMIT then
    begin
      MessageBox(Handle,
        '您的 Ultra SMS 的程序是试用期版本或者已经过期，数据库容量为400条。',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      bExiting := True;
    end
  else if SeparationCount > 5 then
  begin
    MessageBox(Handle,
      '您的 Ultra SMS 的程序是试用期版本的，不能发送分隔超过 5 条短信。',
      PChar(Caption), MB_OK + MB_ICONWARNING);
    bExiting := True;  
  end
  else if vstAddressee.TotalCount > 2 then
  begin
    MessageBox(Handle,
      '您的 Ultra SMS 的程序是试用期版本的，不能群发超过两个人。',
      PChar(Caption), MB_OK + MB_ICONWARNING);
    bExiting := True;
  end;    

  {$I Encode_End.inc}

  if bExiting then
    Exit;
{$ENDIF}    

  // 保存到发件箱
  if not CanSend then
  begin
    MessageBox(Handle, '请输入收件人电话号码和消息内容。', PChar(Application.Title), MB_ICONEXCLAMATION);
    Exit;
  end;

  // 开始分析内容
  slNames := TStringList.Create;
  slNumbers := TStringList.Create;
  pRec := vstAddressee.GetFirst;

  while Assigned(pRec) do
  begin
    pData := vstAddressee.GetNodeData(pRec);
    slNames.Add(pData.Name);
    slNumbers.Add(pData.Phone);
    pRec := pRec.NextSibling;
  end;

  dbFinish := TADOTable.Create(nil);
  dbFinish.Connection := frmMain.adoSMS;

  // 删除草稿
  if DraftIndex > 0 then
  begin
    dbFinish.TableName := 'draft';
    dbFinish.Open;
    if dbFinish.Locate('internalid', DraftIndex, []) then
      dbFinish.Delete;
    dbFinish.Close;
    if (frmMain.CurrentView = cvDraft) then
      frmMain.RefreshView(DraftIndex);
  end;

  // 为发送成功作准备
  dbFinish.TableName := 'finish';
  dbFinish.Open;
  dbFinish.Append;
  dbFinish.FieldByName('transmitted').AsBoolean := False;
  dbFinish.FieldByName('content').AsString := GetSMSText;
  dbFinish.Post;
  iIndex := dbFinish.FieldByName('internalid').AsInteger;
  dbFinish.Close;
  dbFinish.Free;

  // 逐份添加到发件箱
  dbOutbox := TADOTable.Create(nil);
  dbOutbox.Connection := frmMain.adoSMS;
  dbOutbox.TableName := 'send';
  dbOutbox.Open;

  for i := 0 to slNumbers.Count - 1 do
  begin
    dbOutbox.Append;
    dbOutbox.FieldByName('senderdate').AsDateTime := Now;
    dbOutbox.FieldByName('addressee').AsString := slNames[i];
    dbOutbox.FieldByName('number').AsString := slNumbers[i];
    dbOutbox.FieldByName('content').AsString := GetSMSText;
    dbOutbox.FieldByName('finishid').AsInteger := iIndex;
    dbOutbox.Post;
  end;

  // 设置回复或转发标志
  case NewSMSType of
    nstReply:
    begin
      dbOutbox.Close;
      dbOutbox.Connection := frmMain.adoSMS;
      dbOutbox.TableName := 'receive';
      dbOutbox.Open;

      if dbOutbox.Locate('internalid', AssociatedID, []) then
      begin
        dbOutbox.Edit;
        dbOutbox.FieldByName('replied').AsBoolean := True;
        dbOutbox.FieldByName('read').AsBoolean := True;
        dbOutbox.Post;
      end;

      if opShowTrayIcon then
        frmMain.RefreshNewTray;

      if (frmMain.CurrentView = cvReceive) then
        frmMain.RefreshView(AssociatedID);
    end;
    nstTransmit:
    begin
      dbOutbox.Close;
      dbOutbox.Connection := frmMain.adoSMS;
      dbOutbox.TableName := AssociatedBox;
      dbOutbox.Open;

      if dbOutbox.Locate('internalid', AssociatedID, []) then
      begin
        dbOutbox.Edit;
        dbOutbox.FieldByName('transmitted').AsBoolean := True;
        dbOutbox.Post;
      end;

      if (frmMain.CurrentView = cvReceive) or (frmMain.CurrentView =
        cvFinish) then
        frmMain.RefreshView(AssociatedID);
    end;
  end;

  dbOutbox.Close;
  dbOutbox.Free;
  slNames.Free;
  slNumbers.Free;
  Modified := False;

  if (frmMain.CurrentView = cvSend) then
    frmMain.RefreshView;

  Close;
end;

procedure TfrmWriteSMS.mnuSMSSendClick(Sender: TObject);
var
  dbFinish: TADOTable;
  slNames: TStringList;
  slNumbers: TStringList;
  pRec: PVirtualNode;
  pData: PContactItem;
  iIndex: Integer;
  i: Integer;
  bExiting: Boolean;
  SMSContent: String;
begin
  // 发送短信
  if not Connected then
  begin
    MessageBox(Handle, PChar('请连接移动电话。'), PChar(Application.Title), MB_ICONEXCLAMATION);
    Exit;
  end;

  if not CanSend then
  begin
    MessageBox(Handle, '请输入收件人电话号码和消息内容。', PChar(Application.Title), MB_ICONEXCLAMATION);
    Exit;
  end;

{$IFDEF REGISTERED}
  // 检查注册用户的权限
  bExiting := False;

  {$I Encode_Start.inc}
  if SameText(GlobalRegStatus, GRS_EXCEEDED) then
  begin
    MessageBox(Handle,
      '您的 Ultra SMS 的程序已经超过了使用期的，不能发短信。', PChar(Caption),
      MB_OK + MB_ICONWARNING);
    bExiting := True;
  end
  else if SameText(GlobalRegStatus, GRS_UNREGISTERED) then
    if SeparationCount > 5 then
    begin
      MessageBox(Handle,
        '您的 Ultra SMS 的程序是试用期版本的，不能发送分隔超过 5 ' + #13#10 +
        '条短信。', PChar(Caption), MB_OK + MB_ICONWARNING);
      bExiting := True;  
    end
    else if vstAddressee.TotalCount > 2 then
    begin
      MessageBox(Handle, 
        '您的 Ultra SMS 的程序是试用期版本的，不能群发超过两个人。',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      bExiting := True;  
    end;    
  {$I Encode_End.inc}

  if bExiting then
    Exit;
{$ENDIF}    

  // 开始分析内容
  SMSContent := GetSMSText;
  CloseWindow(Self.Handle);
  
  slNames := TStringList.Create;
  slNumbers := TStringList.Create;
  pRec := vstAddressee.GetFirst;

  dbFinish := TADOTable.Create(nil);
  dbFinish.Connection := frmMain.adoSMS;

  // 删除草稿
  if DraftIndex > 0 then
  begin
    dbFinish.TableName := 'draft';
    dbFinish.Open;
    if dbFinish.Locate('internalid', DraftIndex, []) then
      dbFinish.Delete;
    if frmMain.CurrentView = cvDraft then
      frmMain.RefreshView(DraftIndex);
    dbFinish.Close;
  end;

  while Assigned(pRec) do
  begin
    pData := vstAddressee.GetNodeData(pRec);
    slNames.Add(pData.Name);
    slNumbers.Add(pData.Phone);
    pRec := pRec.NextSibling;
  end;

  // 为发送成功作准备
  dbFinish.TableName := 'finish';
  dbFinish.Open;
  dbFinish.Append;
  dbFinish.FieldByName('transmitted').AsBoolean := False;
  dbFinish.FieldByName('content').AsString := SMSContent;
  dbFinish.Post;
  iIndex := dbFinish.FieldByName('internalid').AsInteger;

  // 设置回复或转发标志
  case NewSMSType of
    nstReply:
    begin
      dbFinish.Close;
      dbFinish.Connection := frmMain.adoSMS;
      dbFinish.TableName := 'receive';
      dbFinish.Open;

      if dbFinish.Locate('internalid', AssociatedID, []) then
      begin
        dbFinish.Edit;
        dbFinish.FieldByName('replied').AsBoolean := True;
        dbFinish.FieldByName('read').AsBoolean := True;
        dbFinish.Post;
      end;

      if opShowTrayIcon then
        frmMain.RefreshNewTray;

      if frmMain.CurrentView = cvReceive then
        frmMain.RefreshView(AssociatedID);
    end;
    nstTransmit:
    begin
      dbFinish.Close;
      dbFinish.Connection := frmMain.adoSMS;
      dbFinish.TableName := AssociatedBox;
      dbFinish.Open;

      if dbFinish.Locate('internalid', AssociatedID, []) then
      begin
        dbFinish.Edit;
        dbFinish.FieldByName('transmitted').AsBoolean := True;
        dbFinish.Post;
      end;

      if (frmMain.CurrentView = cvReceive) or (frmMain.CurrentView =
        cvFinish) then
        frmMain.RefreshView(AssociatedID);
    end;
  end;

  // 逐份发送
  for i := 0 to slNumbers.Count - 1 do
    JobThread.JobContent.AddSendJob(slNumbers[i], SMSContent, slNames[i], iIndex).RequireReport := SMSReport;

  JobThread.Suspended := False;

  dbFinish.Close;
  dbFinish.Free;
  Modified := False;
  Close;
end;

procedure TfrmWriteSMS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  rlt: Integer;
begin
  CanClose := True;

  if Modified then
  begin
    rlt := MessageBox(Handle, '内容已经更改，是否要保存？',
      PChar(Application.Title), MB_YESNOCANCEL or MB_ICONQUESTION);
    case rlt of
      IDYES: mnuSMSSaveDraftClick(nil);
      IDNO: CanClose := True;
      IDCANCEL: CanClose := False;
    end;
  end;
end;

procedure TfrmWriteSMS.AppendContact(sNames, sPhones: String);
var
  slNames, slPhones: TStringList;
  i: Integer;
  pNode: PVirtualNode;
  pData: PContactItem;
begin
  slNames := TStringList.Create;
  slPhones := TStringList.Create;

  slNames.Text := sNames;
  slPhones.Text := sPhones;

  for i := slNames.Count to slPhones.Count - 1 do
    slNames.Add('');

  for i := 0 to slPhones.Count - 1 do
  begin
    pNode := vstAddressee.AddChild(nil);
    pData := vstAddressee.GetNodeData(pNode);
    pData.Name := slNames[i];
    pData.Phone := PrefixNumber(slPhones[i]);
  end;
  CheckAddressee;
  slNames.Free;
  slPhones.Free;
end;

procedure TfrmWriteSMS.AppendOneContact(sNames, sPhones: String);
var
  pNode: PVirtualNode;
  pData: PContactItem;
begin
  pNode := vstAddressee.AddChild(nil);
  pData := vstAddressee.GetNodeData(pNode);
  pData.Name := sNames;
  pData.Phone := PrefixNumber(sPhones);
end;

procedure TfrmWriteSMS.mnuInsertDateClick(Sender: TObject);
begin
  // 插入日期
  FInsertText(DateToStr(Date));
end;

procedure TfrmWriteSMS.FInsertText(AText: String);
var
  sText: String;
  iSelStart: Integer;
begin
  iSelStart := txtSMS.SelStart;
  sText := GetSMSText;
  Insert(AText, sText, iSelStart + 1);
  txtSMS.Text := sText;
  txtSMS.SelStart := iSelStart + Length(AText);
end;

procedure TfrmWriteSMS.mnuInsertTimeClick(Sender: TObject);
begin
  FInsertText(TimeToStr(Time));
end;

procedure TfrmWriteSMS.mnuInsertDateTimeClick(Sender: TObject);
begin
  FInsertText(DateTimeToStr(Now));
end;

procedure TfrmWriteSMS.mnuInsertPhoneBookClick(Sender: TObject);
var
  pNode: PVirtualNode;
  pData: PContactItem;
  sText: String;
begin
  // 插入电话簿
  pNode := vstPhoneBook.GetFirstSelected;
  sText := #$20;

  while Assigned(pNode) do
  begin
    pData := vstPhoneBook.GetNodeData(pNode);
    sText := sText + pData.Name + #40 + pData.Phone + #41#32;
    pNode := vstPhoneBook.GetNextSelected(pNode);
  end;

  if Length(sText) > 1 then
    FInsertText(sText);
end;

procedure TfrmWriteSMS.mnuViewToolbarClick(Sender: TObject);
begin
  dxbmMain.BarByOldName('GeneralToolbar').Visible := mnuViewToolbar.Down;
end;

procedure TfrmWriteSMS.mnuViewAddresseeClick(Sender: TObject);
begin
  dxdpAddressee.Visible := mnuViewAddressee.Down;
  bdcSearchArea.Visible := mnuViewAddressee.Down;
end;

procedure TfrmWriteSMS.mnuViewStatusBarClick(Sender: TObject);
begin
  stbMain.Visible := mnuViewStatusBar.Down;
end;

procedure TfrmWriteSMS.mnuOptionInsClick(Sender: TObject);
begin
  // txtSMS.InsertMode := mnuOptionIns.Down;
  keybd_event(VK_INSERT, $45, KEYEVENTF_EXTENDEDKEY or 0, 0);
  keybd_event(VK_INSERT, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  if not txtSMS.Focused then txtSMS.InsertMode := mnuOptionIns.Down;
end;

procedure TfrmWriteSMS.mnuOptionWordWrapClick(Sender: TObject);
begin
  txtSMS.WordWrap.Enabled := mnuOptionWordWrap.Down;
end;

// 显示撰写过的短信
procedure TfrmWriteSMS.ShowDraft(InternalID: Integer);
var
  dbDraft: TADOTable;
begin
  dbDraft := TADOTable.Create(nil);
  dbDraft.Connection := frmMain.adoSMS;
  dbDraft.TableName := 'draft';
  dbDraft.Open;

  if dbDraft.Locate('internalid', InternalID, []) then
  begin
    NewSMSType := TNewSMSType(dbDraft.FieldByName('drafttype').AsInteger);
    AssociatedBox := dbDraft.FieldByName('associatedbox').AsString;
    AssociatedID := dbDraft.FieldByName('associatedid').AsInteger;
    DraftIndex := dbDraft.FieldByName('internalid').AsInteger;
    txtSMS.Text := dbDraft.FieldByName('content').AsString;

    case NewSMSType of
      nstNew: NewSMS;
      nstReply: NewReply(AssociatedID);
      nstTransmit: NewTransmit(AssociatedID, AssociatedBox);
    end;

    vstAddressee.Clear;

    dbDraft.Close;
    dbDraft.TableName := 'draft_item';
    dbDraft.Filter := 'number <> NULL AND associatedid = ' + IntToStr(InternalID);
    dbDraft.Filtered := True;
    dbDraft.Open;

    while not dbDraft.Eof do
    begin
      AppendOneContact(dbDraft.FieldByName('name').AsString,
        dbDraft.FieldByName('number').AsString);
      dbDraft.Next;
    end;
  end
  else
    NewSMS;

  CheckAddressee;
  Modified := False;
  dbDraft.Close;
  dbDraft.Free;
end;

// 创建新的信息
procedure TfrmWriteSMS.NewSMS;
begin
  NewSMSType := nstNew;
  dxdpOriginalInfo.Visible := False;
  dxmnuViewOriginal.Visible := ivNever;
  Caption := '撰写短信';
  Show;
end;

// 创建新的回复
procedure TfrmWriteSMS.NewReply(AssociatedID: Integer);
var
  dbReceive: TADOTable;
  dbPBook: TADOQuery;
  sPhone, sName: String;
begin
  dbReceive := TADOTable.Create(nil);
  dbReceive.Connection := frmMain.adoSMS;
  dbReceive.TableName := 'receive';
  dbReceive.Open;

  if dbReceive.Locate('internalid', AssociatedID, []) then
  begin
    NewSMSType := nstReply;
    Self.AssociatedBox := 'receive';
    Self.AssociatedID := AssociatedID;
    Caption := '回复短信';

    sName := dbReceive.FieldByName('sender').AsString;

    if opFromPhonebook and (Length(sName) > 0) then
    begin
      dbPBook := TADOQuery.Create(nil);
      dbPBook.Connection := frmMain.adoContacts;
      dbPBook.SQL.Text := 'SELECT [phonenumber] FROM [contact] WHERE [name] = '
        + QuotedStr(sName) + ';';
      dbPBook.Open;

      if dbPBook.Eof then
        sPhone := dbReceive.FieldByName('sender').AsString
      else
        sPhone := dbPBook.FieldByName('phonenumber').AsString;

      dbPBook.Close;
      dbPBook.Free;
    end
    else
      sPhone := dbReceive.FieldByName('sendernumber').AsString;

    fraInfoPreview.ShowMessageDetail(AssociatedID, cvReceive);
    AppendContact(sName, sPhone);
    dxdpOriginalInfo.Visible := True;
    dxmnuViewOriginal.Visible := ivAlways;
  end
  else
  begin
    dxdpOriginalInfo.Visible := False;
    dxmnuViewOriginal.Visible := ivNever;
    NewSMSType := nstNew;
    Caption := '撰写短信';
  end;

  dbReceive.Close;
  dbReceive.Free;

  Modified := False;
  Show;
end;

// 创建新的转发
procedure TfrmWriteSMS.NewTransmit(AssociatedID: Integer; AssociatedBox:
  String = 'receive');
var
  dbReceive: TADOTable;
begin
  dbReceive := TADOTable.Create(nil);
  dbReceive.Connection := frmMain.adoSMS;
  dbReceive.TableName := AssociatedBox;
  dbReceive.Open;

  if dbReceive.Locate('internalid', AssociatedID, []) then
  begin
    NewSMSType := nstTransmit;
    Caption := '转发短信';
    Self.AssociatedID := AssociatedID;

    if AssociatedBox = 'receive' then
    begin
      fraInfoPreview.ShowMessageDetail(AssociatedID, cvReceive);
      Self.AssociatedBox := 'receive';
    end
    else
    begin
      fraInfoPreview.ShowMessageDetail(AssociatedID, cvFinish);
      Self.AssociatedBox := 'finish';
    end;

    txtSMS.Text := dbReceive.FieldByName('content').AsString;
    dxdpOriginalInfo.Visible := True;
    dxmnuViewOriginal.Visible := ivAlways;
  end
  else
  begin
    dxdpOriginalInfo.Visible := False;
    dxmnuViewOriginal.Visible := ivNever;
    NewSMSType := nstNew;
    Caption := '撰写短信';
  end;

  dbReceive.Close;
  dbReceive.Free;

  Modified := False;
  Show;
end;
procedure TfrmWriteSMS.mnuSMSPrintPreivewClick(Sender: TObject);
var
  wPrintWnd: TDlgPrint;
  xPrintItem: TSMSEntry;
  xItem: TListItem;
  pNode: PVirtualNode;
  pEntry: PContactItem;
begin
  // 回复短信
  wPrintWnd := TDlgPrint.Create(nil);
  xItem := frmMain.lvwWindow.Items.Add;
  xItem.ImageIndex := 3;
  xItem.Caption := '打印预览';
  xItem.Data := Pointer(wPrintWnd.Handle);

  // 填充一些信息
  xPrintItem := TSMSEntry.Create;
  xPrintItem.DateTime := Now;
  xPrintItem.Receive := False;
  xPrintItem.Content := GetSMSText;

  // 获得姓名列表
  pNode := vstAddressee.GetFirst;

  while Assigned(pNode) do
  begin
    pEntry := vstAddressee.GetNodeData(pNode);
    xPrintItem.Name.Add(pEntry.Name);
    xPrintItem.Phone.Add(pEntry.Phone);
    pNode := pNode.NextSibling;
  end;

  xItem.SubItems.Add('preview');
  xItem.SubItems.Add(IntToStr(0));

  // 打开窗口
  wPrintWnd.MsgContent.Add(xPrintItem);
  wPrintWnd.SplitMsgMode := True;
  wPrintWnd.RefreshPreview;
  wPrintWnd.Show;
end;

procedure TfrmWriteSMS.mnuSMSPrintClick(Sender: TObject);
var
  wPrintWnd: TDlgPrint;
  xPrintItem: TSMSEntry;
  xItem: TListItem;
  pNode: PVirtualNode;
  pEntry: PContactItem;
begin
  // 回复短信
  wPrintWnd := TDlgPrint.Create(nil);
  xItem := frmMain.lvwWindow.Items.Add;
  xItem.ImageIndex := 3;
  xItem.Caption := '打印预览';
  xItem.Data := Pointer(wPrintWnd.Handle);

  // 填充一些信息
  xPrintItem := TSMSEntry.Create;
  xPrintItem.DateTime := Now;
  xPrintItem.Receive := False;
  xPrintItem.Content := GetSMSText;

  // 获得姓名列表
  pNode := vstAddressee.GetFirst;

  while Assigned(pNode) do
  begin
    pEntry := vstAddressee.GetNodeData(pNode);
    xPrintItem.Name.Add(pEntry.Name);
    xPrintItem.Phone.Add(pEntry.Phone);
    pNode := pNode.NextSibling;
  end;

  xItem.SubItems.Add('preview');
  xItem.SubItems.Add(IntToStr(0));

  // 打开窗口
  wPrintWnd.MsgContent.Add(xPrintItem);
  wPrintWnd.SplitMsgMode := True;
  wPrintWnd.RefreshPreview;
  wPrintWnd.PrintDoc;
  wPrintWnd.Close;
end;

procedure TfrmWriteSMS.vstPhoneBookGetHint(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex;
  var LineBreakStyle: TVTTooltipLineBreakStyle; var HintText: WideString);
var
  pEntry: PContactItem;
begin
  // 显示联系人信息
  HintText := '';
  pEntry := Sender.GetNodeData(Node);
  ffmContact.ShowContactInfo(pEntry.Name);
end;

function TfrmWriteSMS.CheckPhDulp(const Phone: String): Boolean;
var
  pData: PContactItem;
  pNode: PVirtualNode;
begin
  pNode := vstAddressee.GetFirst;
  Result := False;

  while Assigned(pNode) do
  begin
    pData := vstAddressee.GetNodeData(pNode);

    if PhoneNumberSimilar(Phone, pData.Phone) then
    begin
      Result := True;
      Break;
    end;

    pNode := vstAddressee.GetNext(pNode);
  end;
end;

procedure TfrmWriteSMS.dxmnuOptionReportClick(Sender: TObject);
begin
  SMSReport := not SMSReport;
  dxlbReport.Down := SMSReport;
  dxmnuOptionReport.Down := SMSReport;
end;

procedure TfrmWriteSMS.dxmnuViewOriginalClick(Sender: TObject);
begin
  dxdpOriginalInfo.Visible := dxmnuViewOriginal.Down;
end;

procedure TfrmWriteSMS.dxtxtSpellingCurChange(Sender: TObject);
var
  pContact: PContactItem;
  pNode: PVirtualNode;
  bPinyinEnabled: Boolean;
  sPinyin: string;
begin
  // 更新过滤信息
  vstPhoneBook.BeginUpdate;

  pNode := vstPhoneBook.GetFirst;
  sPinyin := dxtxtSpelling.CurText;
  bPinyinEnabled := Length(sPinyin) <> 0;

  while Assigned(pNode) do
  begin
    pContact := vstPhoneBook.GetNodeData(pNode);
    vstPhoneBook.IsVisible[pNode] := (not bPinyinEnabled) or
{      AnsiStartsText(sPinyin, pContact.Name) or
      AnsiStartsText(sPinyin, GBKToSpellIndex(pContact.Name)) or
      AnsiStartsText(sPinyin, GBKToSpell(pContact.Name)}
      (IsSimpleSpellingMatchCaseInsensitive(
      PAnsiChar(pContact.Name), PAnsiChar(sPinyin)) <> 0);
    pNode := vstPhoneBook.GetNext(pNode);
  end;

  vstPhoneBook.EndUpdate;

  pNode := vstPhoneBook.GetFirstVisible;
  vstPhoneBook.ClearSelection;

  if Assigned(pNode) then
  begin
    vstPhoneBook.FocusedNode := pNode;
    vstPhoneBook.Selected[pNode] := True;
  end;    
end;

procedure TfrmWriteSMS.dxtxtSpellingKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  pNode: PVirtualNode;
begin
  if Key = VK_ESCAPE then
  begin
     dxtxtSpelling.Text := '';

     pNode := vstPhoneBook.GetFirst;
     vstPhoneBook.BeginUpdate;

     while Assigned(pNode) do
     begin
       vstPhoneBook.IsVisible[pNode] := True;
       pNode := vstPhoneBook.GetNext(pNode);
     end;

     vstPhoneBook.EndUpdate;
     Exit;
  end;

  if Key = VK_RETURN then
  begin
    btnAddSel.Click;
    Exit;
  end;

  if (not (Char(Key) in ['a'..'z', 'A'..'Z'])) and (Key <> VK_DELETE) then
    PostMessage(vstPhoneBook.Handle, WM_KEYDOWN, Key, 0);
end;

procedure TfrmWriteSMS.dxtxtSpellingKeyPress(Sender: TObject; var Key: Char);
begin
  // 只允许输入字符
  case Key of
  'a'..'z': Inc(Key, - Ord('a') + Ord('A'));
  'A'..'Z': ;
  #8: ;
  else
    Key := #0;
  end;
end;

procedure TfrmWriteSMS.dxmnuOptionAutoPrefixClick(Sender: TObject);
begin
  AutoPrefix := not AutoPrefix;
  dxmnuOptionAutoPrefix.Down := AutoPrefix;
end;

procedure TfrmWriteSMS.vstPhoneBookKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not vstPhoneBook.Focused then Exit;
  case Key of
    VK_RETURN: btnAddSel.Click;
  end;
end;

procedure TfrmWriteSMS.vstAddresseeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not vstAddressee.Focused then Exit;
  case Key of
    VK_DELETE: btnDelete.Click;
  end;
end;

end.
