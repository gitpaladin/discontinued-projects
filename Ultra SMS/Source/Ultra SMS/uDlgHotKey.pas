unit uDlgHotKey;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ImgList;

type
  TdlgHotKey = class(TForm)
    chkEnabled: TCheckBox;
    grpHotKey: TGroupBox;
    lvwHotKey: TListView;
    lblHotKey: TLabel;
    hkGlobal: THotKey;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    iltHotKey: TImageList;
    btnSetKey: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkEnabledClick(Sender: TObject);
    procedure lvwHotKeyChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure btnSetKeyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  GerneralFunc, HotKeyManager, Math, UserInterfaces;

{$R *.dfm}

procedure TdlgHotKey.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TdlgHotKey.FormCreate(Sender: TObject);
begin
  // 加载方案
  chkEnabled.Checked := opGlobalHotKey;
  chkEnabledClick(Self);
end;

procedure TdlgHotKey.chkEnabledClick(Sender: TObject);
begin
  grpHotKey.Enabled := chkEnabled.Checked;
  lvwHotKey.Enabled := chkEnabled.Checked;
  lblHotKey.Enabled := chkEnabled.Checked;
  hkGlobal.Enabled := chkEnabled.Checked;
  btnSetKey.Enabled := chkEnabled.Checked;
  lvwHotKey.Color := IfThen(chkEnabled.Checked, clWindow, clBtnFace);
  //hkGlobal.Color := IfThen(chkEnabled.Checked, clWindow, clBtnFace);

  if chkEnabled.Checked then
    lvwHotKeyChange(chkEnabled, nil, ctState);
end;

procedure TdlgHotKey.lvwHotKeyChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if Change = ctState then
    if Assigned(lvwHotKey.Selected) then
    begin
      hkGlobal.Enabled := True;
      btnSetKey.Enabled := True;
      //hkGlobal.Color := clWindow;
      hkGlobal.HotKey := Integer(Item.Data);
    end
    else
    begin
      hkGlobal.Enabled := False;
      btnSetKey.Enabled := False;
      //hkGlobal.Color := clBtnFace;
      hkGlobal.HotKey := 0;
    end;
end;

procedure TdlgHotKey.btnSetKeyClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to HotKeyNumber do
    if i <> lvwHotKey.Selected.Index then
      if (HotKeyList[i] <> 0) and (HotKeyList[i] = hkGlobal.HotKey) then
      begin
        MessageBox(Handle,
          PChar(Format('“%s”已经被设置为“%s”，请使用其他热键。', [HotKeyToText(hkGlobal.HotKey, True), lvwHotKey.Items[i].Caption])),
          PChar(Caption), MB_OK + MB_ICONSTOP);
        Windows.SetFocus(hkGlobal.Handle);
        Exit;
      end;

  lvwHotKey.Selected.SubItems[0] := HotKeyToText(hkGlobal.HotKey, True);
  lvwHotKey.Selected.Data := Pointer(hkGlobal.HotKey);
  lvwHotKey.Selected.SubItemImages[0] := IfThen(hkGlobal.HotKey = 0, -1, 1);
end;

procedure TdlgHotKey.btnOKClick(Sender: TObject);
var
  i: Integer;
begin
  opGlobalHotKey := chkEnabled.Checked;
  for i := 0 to lvwHotKey.Items.Count - 1 do
    HotKeyList[i] :=  Integer(lvwHotKey.Items[i].Data);

  frmMain.RefreshHotKey;
  Close;
end;

procedure TdlgHotKey.FormShow(Sender: TObject);
var
  i: Integer;
begin
  if Self.Tag = 0 then
  begin
    for i := 0 to HotKeyNumber do
    begin
      lvwHotKey.Items[i].SubItemImages[0] := IfThen(HotKeyList[i] = 0, Integer(-1), Integer(1));
      lvwHotKey.Items[i].SubItems[0] := HotKeyToText(HotKeyList[i], True);
      lvwHotKey.Items[i].Data := Pointer(HotKeyList[i]);
    end;

    Self.Tag := 1;
  end;    
end;

end.
