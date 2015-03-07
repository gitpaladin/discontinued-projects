unit uFrmSyncPhonebook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxClasses, dxBar, cxControls, dxStatusBar, dxBarExtItems,
  ImgList, VirtualTrees, ExtCtrls, StdCtrls, ComCtrls, Grids, ValEdit;

const
  WM_MSG_CLOSEWND = WM_USER + 461;

type
  TSyncItemExistence = (Left, Right);
  TSyncItemExistences = set of TSyncItemExistence;

  TSyncPhoneItem = class(TCollectionItem)
  public
    Name: array[Left..Right] of String;
    Phone: array[Left..Right] of String;
    VirtualNodes: array[Left..Right] of PVirtualNode;
    InternalID: Integer;
    Exists: TSyncItemExistences;
  end;

  TSyncPhoneItems = class(TCollection)
  protected
    function GetItem(Index: Integer): TSyncPhoneItem;
    procedure SetItem(Index: Integer; Value: TSyncPhoneItem);
    function BinSearch(var ResultItem: TSyncPhoneItem; Name: string; Position: TSyncItemExistence): Boolean;
  public
    VirtualTree: array[Left..Right] of TVirtualStringTree;
    property Item[Index: Integer]: TSyncPhoneItem read GetItem write SetItem; default;
    constructor Create(var LeftView, RightView: TVirtualStringTree);
    procedure AddPBItem(Name: string; Phone: string; Position: TSyncItemExistence; ID: Integer = -1);
  end;

  TfrmSyncPhonebook = class(TForm)
    dxbmPBook: TdxBarManager;
    dxsbPBook: TdxStatusBar;
    dxbrMainMenu: TdxBar;
    dxmnuOpenPhone: TdxBarSubItem;
    dxmnuLeftFile: TdxBarButton;
    dxmnuOpenRight: TdxBarSubItem;
    dxmnuRAllCategory: TdxBarButton;
    dxmnuRNoCategory: TdxBarButton;
    dxmnuOperation: TdxBarSubItem;
    dxmnuRuleName: TdxBarButton;
    dxmnuRulePhone: TdxBarButton;
    dxmnuRefresh: TdxBarButton;
    dxmnuSyncToRight: TdxBarButton;
    dxmnuSyncToLeft: TdxBarButton;
    dxmnuCopyToRight: TdxBarButton;
    dxmnuCopyToLeft: TdxBarButton;
    dxmnuSyncBoth: TdxBarButton;
    dxmnuSelection: TdxBarSubItem;
    dxmnuSelLeftOrphan: TdxBarButton;
    dxmnuSelRightOrphan: TdxBarButton;
    dxmnuSelDiff: TdxBarButton;
    dxmnuSelOperation: TdxBarSubItem;
    dxmnuSelAll: TdxBarButton;
    dxmnuSelNone: TdxBarButton;
    dxmnuSelRev: TdxBarButton;
    dxmnuDelFromLeft: TdxBarButton;
    dxmnuDelFromRight: TdxBarButton;
    dxmnuDelBoth: TdxBarButton;
    dxmnuCopySelLeft: TdxBarButton;
    dxmnuCopySelRight: TdxBarButton;
    dxbrMainToolbar: TdxBar;
    dxpopLeftside: TdxBarPopupMenu;
    dxlbRefresh: TdxBarLargeButton;
    iltToolbar: TImageList;
    pnlLayout: TGridPanel;
    cbbLeft: TComboBoxEx;
    cbbRight: TComboBoxEx;
    vstLeft: TVirtualStringTree;
    vstRight: TVirtualStringTree;
    vleLeft: TValueListEditor;
    vleRight: TValueListEditor;
    iltPhoneBook: TImageList;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure FAPICloseWindow(var Message: TMessage); message WM_MSG_CLOSEWND;
  public
    { Public declarations }

  end;

var
  frmSyncPhonebook: TfrmSyncPhonebook;

implementation

uses
  GerneralFunc, UserInterfaces, ADODB;

{$R *.dfm}

{ TfrmSyncPhonebook }

procedure TfrmSyncPhonebook.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
end;

procedure TfrmSyncPhonebook.FAPICloseWindow(var Message: TMessage);
begin
  Close;
end;

procedure TfrmSyncPhonebook.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  spWsMaximized := WindowState = wsMaximized;

  if not wsWsMaximized then
  begin
    spWindowLeft := Left;
    spWindowWidth := Width;
    spWindowTop := Top;
    spWindowHeight := Height;
  end;  

  frmMain.DeleteWnd(Handle);
end;

procedure TfrmSyncPhonebook.FormCreate(Sender: TObject);
var
  tbTable: TADOTable;
begin
  SetWindowIcon(Handle, IDI_BSYNCPB, IDI_SSYNCPB);

  Windows.MoveWindow(Handle, spWindowLeft, spWindowTop, spWindowWidth, spWindowHeight, True);
  if spWsMaximized then WindowState := wsMaximized;

  // 打开类别
  tbTable := TADOTable.Create(nil);
  tbTable.Connection := frmMain.adoContacts;
  tbTable.TableName := 'category';
  tbTable.Open;

  cbbRight.Clear;
  cbbRight.AddItem('<所有联系人>', nil);
  cbbRight.AddItem('<无类别>', nil);
  cbbRight.ItemsEx[0].ImageIndex := 2;
  cbbRight.ItemsEx[1].ImageIndex := 1;
  while not tbTable.Eof do
  begin
    if tbTable.FieldByName('category').AsString <> '' then
      with cbbRight.ItemsEx.Add do
      begin
        Caption := tbTable.FieldByName('category').AsString;
        ImageIndex := 0;
      end;
    tbTable.Next;
  end;
  tbTable.Close;
  tbTable.Free;

//  cbeCategorySelect(nil);
end;

{ TSyncPhoneItems }

procedure TSyncPhoneItems.AddPBItem(Name, Phone: string;
  Position: TSyncItemExistence; ID: Integer);
var
  spiFindResult, spiNewItem: TSyncPhoneItem;
  pNode: array[Left..Right] of PVirtualNode;
  iItem: array[Left..Right] of TSyncPhoneItem;
begin
  // 添加一个项目
  if BinSearch(spiFindResult, Name, Position) then
  begin
    // 判断要添加的这一边是不是存在
    if not (Position in spiFindResult.Exists) then
    begin
      // 如果这一边不存在，仅仅只是修改值
      spiFindResult.Name[Position] := Name;
      spiFindResult.Phone[Position] := Phone;
      spiFindResult.Exists := spiFindResult.Exists + [Position];
      if ID > -1 then spiFindResult.InternalID := ID;

      // 更新树
      VirtualTree[Position].RepaintNode(spiFindResult.VirtualNodes[Position]);

      Exit;
    end;
  end;

  // 如果这边没有相同的项目，则要进行添加
  VirtualTree[Left].BeginUpdate;
  VirtualTree[Right].BeginUpdate;

  if (Assigned(spiFindResult)) then
  begin
    spiNewItem := TSyncPhoneItem(inherited Insert(spiFindResult.Index));
    spiNewItem.VirtualNodes[Left] := VirtualTree[Left].InsertNode(
      spiFindResult.VirtualNodes[Left], amInsertBefore, @spiNewItem);
    spiNewItem.VirtualNodes[Right] := VirtualTree[Right].InsertNode(
      spiFindResult.VirtualNodes[Right], amInsertBefore, @spiNewItem);
  end
  else
  begin
    spiNewItem := TSyncPhoneItem(inherited Add);
    spiNewItem.VirtualNodes[Left] := VirtualTree[Left].AddChild(nil, @spiNewItem);
    spiNewItem.VirtualNodes[Right] := VirtualTree[Right].AddChild(nil, @spiNewItem);
  end;

  // 设置新项目属性
  spiNewItem.Name[Left] := Name;
  spiNewItem.Name[Right] := Name;
  spiNewItem.Phone[Position] := Name;
  spiNewItem.InternalID := 0;
  spiNewItem.Exists := [Position];

  VirtualTree[Left].EndUpdate;
  VirtualTree[Right].EndUpdate;
end;

function TSyncPhoneItems.BinSearch(var ResultItem: TSyncPhoneItem; Name: string;
  Position: TSyncItemExistence): Boolean;
var
  max, min, mid: Integer;
  compresult: Integer;
begin
  // 二分查找
  max := (inherited Count) - 1;
  min := 0;

  // 如果没有项目则查找失败
  if max = -1 then
  begin
    ResultItem := nil;
    Result := False;
    Exit;
  end;  

  // 二分查找相关的项目
  repeat
    mid := (min + max) div 2;
    ResultItem := Item[mid];
    compresult := CompareStr(Name, ResultItem.Name[Position]);

    if compresult > 0 then
      min := mid + 1
    else
      max := mid - 1;
  until (compresult = 0) or (min > max);

  Result := compresult = 0;

  // 如果找到了 还需要定位到第一个项目
  if Result then
  begin
    Dec(mid);
    while (mid >= 0) and (CompareStr(Name, Item[mid].Name[Position]) = 0) do
      Dec(mid);
    ResultItem := Item[mid + 1];
  end;
    
end;

constructor TSyncPhoneItems.Create(var LeftView, RightView: TVirtualStringTree);
begin
  inherited Create(TSyncPhoneItem);
  VirtualTree[Left] := LeftView;
  VirtualTree[Right] := RightView;
end;

function TSyncPhoneItems.GetItem(Index: Integer): TSyncPhoneItem;
begin
  Result := TSyncPhoneItem(inherited GetItem(Index));
end;

procedure TSyncPhoneItems.SetItem(Index: Integer; Value: TSyncPhoneItem);
begin
  inherited SetItem(Index, Value);
end;

end.
