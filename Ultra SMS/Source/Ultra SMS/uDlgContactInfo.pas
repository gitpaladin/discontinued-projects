unit uDlgContactInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VirtualTrees, StdCtrls, Buttons, ComCtrls, GerneralFunc;

const
  WM_STARTEDITING = WM_USER + 176;

type
  TContactItem = record
    Phone: string;
    Name: TStringList;
    NewName: string;
  end;

  PContactItem = ^TContactItem;

  TdlgContactInfo = class(TForm)
    vstContact: TVirtualStringTree;
    btnAutoMatch: TBitBtn;
    btnUpdate: TBitBtn;
    btnCancel: TBitBtn;
    chkSelect: TCheckBox;
    cboNewContact: TComboBox;
    procedure btnCancelClick(Sender: TObject);
    procedure vstContactGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure vstContactChecked(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure chkSelectClick(Sender: TObject);
    procedure vstContactEditing(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
    procedure vstContactCreateEditor(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; out EditLink: IVTEditLink);
    procedure vstContactChange(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure WMStartEditing(var Message: TMessage); message WM_STARTEDITING;
    procedure btnAutoMatchClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
  private
    { Private declarations }
    FInternalIDs: TStringList;
    FBOX: TCurrentView;
    FInternalOpera: Boolean;
  public
    { Public declarations }
    function ShowContactInfo(InternalIDs: TStringList; BOX: TCurrentView): Boolean;
  end;

  TPropertyEditLink = class(TInterfacedObject, IVTEditLink)
  private
    FTree: TVirtualStringTree; // A back reference to the tree calling.
    FNode: PVirtualNode;       // The node being edited.
    FColumn: Integer;          // The column of the node being edited.
  protected
    procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditExit(Sender: TObject);
  public
    FEdit: TComboBox;        // One of the property editor classes.
    function BeginEdit: Boolean; stdcall;
    function CancelEdit: Boolean; stdcall;
    function EndEdit: Boolean; stdcall;
    function GetBounds: TRect; stdcall;
    function PrepareEdit(Tree: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex): Boolean; stdcall;
    procedure ProcessMessage(var Message: TMessage); stdcall;
    procedure SetBounds(R: TRect); stdcall;
  end;

implementation

{$R *.dfm}

uses
  ADODB, DB, UserInterfaces, StrUtils, UxTheme;

procedure TdlgContactInfo.btnCancelClick(Sender: TObject);
begin
  Close;
end;

function TdlgContactInfo.ShowContactInfo(InternalIDs: TStringList; BOX: TCurrentView): Boolean;
var
  db: TADOQuery;
  i: Integer;
  IDList: String;
  sPhone: String;
  iIndex: Integer;
  slPhones: TStringList;
  slNames: TStringList;
  pNode: PVirtualNode;
  pItem: PContactItem;
begin
  // 准备要查询的列表
  FInternalIDs := InternalIDs;
  FBOX := BOX;
  
  for i := 0 to InternalIDs.Count - 1 do
    if i = 0 then
      IDList := '(' + InternalIDs[i]
    else
      IDList := IDList + ', ' + InternalIDs[i];

  IDList := IDList + ')';

  case BOX of
    cvReceive:
    begin
      db := TADOQuery.Create(nil);
      db.Connection := frmMain.adoSMS;
      db.SQL.Add('SELECT [receive].[sendernumber] AS [number], [receive].[sender] AS [name]');
      db.SQL.Add('FROM [receive]');
      db.SQL.Add('WHERE [receive].[internalid] IN ' + IDList);
      db.SQL.Add('GROUP BY [receive].[sendernumber], [receive].[sender];');
      db.Open;
    end;
    cvSend:
    begin
      db := TADOQuery.Create(nil);
      db.Connection := frmMain.adoSMS;
      db.SQL.Add('SELECT [send].[number], [send].[addressee] AS [name]');
      db.SQL.Add('FROM [send]');
      db.SQL.Add('WHERE [send].[internalid] IN ' + IDList);
      db.SQL.Add('GROUP BY [send].[number], [send].[addressee];');
      db.Open;
    end;
    cvFinish:
    begin
      db := TADOQuery.Create(nil);
      db.Connection := frmMain.adoSMS;
      db.SQL.Add('SELECT [finish_item].[number], [finish_item].[name]');
      db.SQL.Add('FROM [finish_item]');
      db.SQL.Add('WHERE [finish_item].[associatedid] IN ' + IDList);
      db.SQL.Add('GROUP BY [finish_item].[number], [finish_item].[name];');
      db.Open;
    end;
  else
  begin
    Result := False;
    Exit;
  end;
  end;

  // 添加到列表中
  slPhones := TStringList.Create;

  while not db.Eof do
  begin
    sPhone := db.FieldByName('number').AsString;
    iIndex := slPhones.IndexOf(sPhone);

    if iIndex = -1 then
    begin
      slNames := TStringList.Create;
      slPhones.AddObject(sPhone, slNames);
    end
    else
      slNames := TStringList(slPhones.Objects[iIndex]);

    slNames.Add(db.FieldByName('name').AsString);

    db.Next;
  end;

  db.Close;

  // 添加到列表视图中
  Loaded;
  vstContact.Clear;
  vstContact.NodeDataSize := SizeOf(TContactItem);

  for i := 0 to slPhones.Count - 1 do
  begin
    pNode := vstContact.AddChild(nil);
    vstContact.CheckType[pNode] := ctCheckBox;
    vstContact.CheckState[pNode] := csUncheckedNormal; 
    pItem := vstContact.GetNodeData(pNode);
    pItem.Phone := slPhones[i];
    pItem.Name := TStringList.Create;
    pItem.Name.AddStrings(TStrings(slPhones.Objects[i]));

    if pItem.Name.Count = 1 then
      pItem.NewName := pItem.Name[0];
  end;

  // 释放内存
  slPhones.Free;
//  vstContact.Refresh;

  // 读取相关所有的联系人
  db.Connection := frmMain.adoContacts;
  db.SQL.Text := 'SELECT DISTINCT [contact].[name] FROM [contact] ORDER BY [name] ASC;';
  db.Open;

  while not db.Eof do
  begin
    cboNewContact.AddItem(db.FieldByName('name').AsString, nil);
    db.Next;
  end;

  ShowModal;
  Result := True;
end;

procedure TdlgContactInfo.vstContactGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
  pData: PContactItem;
begin
  pData := vstContact.GetNodeData(Node);

  case Column of
    0: CellText := pData.Phone;
    1: CellText := pData.Name.CommaText;
    2: CellText := pData.NewName;
  end;
end;

procedure TdlgContactInfo.vstContactChecked(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  AllChecked: Boolean;
  AllUnchecked: Boolean;
  pNode: PVirtualNode;
begin
  // 检查选择
  if FInternalOpera then Exit;

  pNode := vstContact.GetFirstVisible;

  AllChecked := True;
  AllUnchecked := False;

  while Assigned(pNode) do
  begin
    if pNode.CheckState = csUncheckedNormal then
      AllChecked := False
    else if pNode.CheckState = csCheckedNormal then
      AllUnchecked := False;

    pNode := pNode.NextSibling;
  end;

  FInternalOpera := True;
  if AllChecked then
    chkSelect.State := cbChecked
  else if AllUnchecked then
    chkSelect.State := cbUnchecked
  else
    chkSelect.State := cbGrayed;

  FInternalOpera := False;
end;

procedure TdlgContactInfo.chkSelectClick(Sender: TObject);
var
  pNode: PVirtualNode;
begin
  // 检查选择
  if FInternalOpera then Exit;

  pNode := vstContact.GetFirstVisible;

  FInternalOpera := True;

  while Assigned(pNode) do
  begin
    if chkSelect.Checked then
      vstContact.CheckState[pNode] := csCheckedNormal
    else
      vstContact.CheckState[pNode] := csUncheckedNormal;

    pNode := pNode.NextSibling;
  end;

  FInternalOpera := False;
end;

procedure TdlgContactInfo.vstContactChange(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
begin
  with Sender do
  begin
    // Start immediate editing as soon as another node gets focused.
    if Assigned(Node) and not (tsIncrementalSearching in TreeStates) then
    begin
      // We want to start editing the currently selected node. However it might well happen that this change event
      // here is caused by the node editor if another node is currently being edited. It causes trouble
      // to start a new edit operation if the last one is still in progress. So we post us a special message and
      // in the message handler we then can start editing the new node. This works because the posted message
      // is first executed *after* this event and the message, which triggered it is finished.
      PostMessage(Self.Handle, WM_STARTEDITING, Integer(Node), 0);
    end;
  end;
end;

procedure TdlgContactInfo.WMStartEditing(var Message: TMessage);

// This message was posted by ourselves from the node change handler above to decouple that change event and our
// intention to start editing a node. This is necessary to avoid interferences between nodes editors potentially created
// for an old edit action and the new one we start here.

var
  Node: PVirtualNode;
begin
  Node := Pointer(Message.WParam);
  // Note: the test whether a node can really be edited is done in the OnEditing event.
  vstContact.EditNode(Node, 2);
end;

function TPropertyEditLink.PrepareEdit(Tree: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex): Boolean;
var
  Data: PContactItem;
begin
  Result := True;
  FTree := Tree as TVirtualStringTree;
  FNode := Node;
  FColumn := Column;

  // determine what edit type actually is needed
  Data := FTree.GetNodeData(Node);
  FEdit.Visible := False;
  FEdit.Parent := Tree;
  FEdit.Text := AnsiString(Data.NewName);
  FEdit.OnKeyDown := EditKeyDown;
  FEdit.OnExit := EditExit;
end;

procedure TPropertyEditLink.EditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        FTree.CancelEditNode;
        Key := 0;
      end;
    VK_RETURN:
      begin
        FTree.EndEditNode;
        Key := 0;
      end;
    VK_UP,
    VK_DOWN:
      begin
          PostMessage(FTree.Handle, WM_KEYDOWN, Key, 0);
          Key := 0;
      end;
  end;
end;

procedure TPropertyEditLink.EditExit(Sender: TObject);
begin
  FTree.EndEditNode;
end;

function TPropertyEditLink.BeginEdit: Boolean;
begin
  Result := True;
  FEdit.Show;
  FEdit.SetFocus;
end;

function TPropertyEditLink.CancelEdit: Boolean;
begin
  Result := True;
  FEdit.Hide;
end;

function TPropertyEditLink.EndEdit: Boolean;
var
  Data: PContactItem;
begin
  Result := True;

  Data := FTree.GetNodeData(FNode);
  Data.NewName := FEdit.Text;
  FEdit.Hide;
  FTree.SetFocus;
end;

function TPropertyEditLink.GetBounds: TRect;
begin
  Result := FEdit.BoundsRect;
end;

procedure TPropertyEditLink.ProcessMessage(var Message: TMessage);
begin
  FEdit.WindowProc(Message);
end;

procedure TPropertyEditLink.SetBounds(R: TRect);
var
  Dummy: Integer;
begin
  // Since we don't want to activate grid extensions in the tree (this would influence how the selection is drawn)
  // we have to set the edit's width explicitly to the width of the column.
  FTree.Header.Columns.GetColumnBounds(FColumn, Dummy, R.Right);
  FEdit.BoundsRect := R;
end;

procedure TdlgContactInfo.vstContactEditing(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
begin
  Allowed := Column = 2;
end;

procedure TdlgContactInfo.vstContactCreateEditor(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; out EditLink: IVTEditLink);
var
  ANewEditor: TPropertyEditLink;
begin
  ANewEditor := TPropertyEditLink.Create;
  ANewEditor.FEdit := Self.cboNewContact;
  EditLink := ANewEditor;
end;

procedure TdlgContactInfo.btnAutoMatchClick(Sender: TObject);
var
  ADB: TADOTable;
  pNode: PVirtualNode;
  pData: PContactItem;
  sPhone: String;
begin
  // 自动根据电话簿搜索
  ADB := TADOTable.Create(nil);
  ADB.Connection := frmMain.adoContacts;
  ADB.TableName := 'contact';
  ADB.Open;

  pNode := vstContact.GetFirstVisible;

  while Assigned(pNode) do
  begin
    pData := vstContact.GetNodeData(pNode);
    sPhone := pData.Phone;

    if AnsiStartsText('+86', sPhone) then Delete(sPhone, 1, 3)
    else if AnsiStartsText('106', sPhone) then Delete(sPhone, 1, 3);

    if ADB.Locate('phonenumber', sPhone, [loPartialKey]) then
    begin
      pData.NewName := ADB.FieldByName('name').AsString;
      pNode.CheckState := csCheckedNormal;
    end;

    pNode := vstContact.GetNextVisible(pNode);
  end;

  vstContact.Refresh;
  vstContactChecked(vstContact, vstContact.GetFirst);

  ADB.Close;
  ADB.Free;
end;

procedure TdlgContactInfo.btnUpdateClick(Sender: TObject);
var
  db: TADOQuery;
  i: Integer;
  IDList: String;
  pNode: PVirtualNode;
  pData: PContactItem;
begin
  // 准备要查询的列表
  for i := 0 to FInternalIDs.Count - 1 do
    if i = 0 then
      IDList := '(' + FInternalIDs[i]
    else
      IDList := IDList + ', ' + FInternalIDs[i];

  IDList := IDList + ')';

  // 更新查询
  db := TADOQuery.Create(nil);
  db.Connection := frmMain.adoSMS;

  pNode := vstContact.GetFirstChecked(csCheckedNormal);

  while Assigned(pNode) do
  begin
    pData := vstContact.GetNodeData(pNode);
    db.SQL.Clear;

    case FBOX of
    cvReceive:
      begin
        db.SQL.Add('UPDATE [receive] SET [sender] = ' + QuotedStr(pData.NewName));
        db.SQL.Add('WHERE [receive].[internalid] IN ' + IDList + ' AND [receive].[sendernumber] = ' + QuotedStr(pData.Phone) + ';');
        db.ExecSQL;
      end;
    cvSend:
      begin
        db.SQL.Add('UPDATE [send] SET [send].[addressee] = ' + QuotedStr(pData.NewName));
        db.SQL.Add('WHERE [send].[internalid] IN ' + IDList + ' AND [send].[number] = ' + QuotedStr(pData.Phone) + ';');
        db.ExecSQL;
      end;
    cvFinish:
      begin
        db.SQL.Add('UPDATE [finish_item] SET [finish_item].[name] = ' + QuotedStr(pData.NewName));
        db.SQL.Add('WHERE [finish_item].[associatedid] IN ' + IDList + ' AND [finish_item].[number] = ' + QuotedStr(pData.Phone) + ';');
        db.ExecSQL;
      end;
    end;

    pNode := vstContact.GetNextChecked(pNode, csCheckedNormal);
  end;

  Close;
  if chkSelect.State <> cbUnchecked then
    frmMain.RefreshView;
end;

end.
