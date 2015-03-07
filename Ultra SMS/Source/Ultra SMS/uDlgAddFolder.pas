unit uDlgAddFolder;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, dximctrl, ImgList, ComCtrls;

type
  TdlgAddFolder = class(TForm)
    lblNewName: TLabel;
    txtFolder: TEdit;
    gbContants: TGroupBox;
    btnNameAdd: TBitBtn;
    btnNameDel: TBitBtn;
    btnNameClear: TBitBtn;
    lblInfo: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    lvwContants: TListView;
    iltNames: TImageList;
    procedure btnNameAddClick(Sender: TObject);
    procedure btnNameDelClick(Sender: TObject);
    procedure btnNameClearClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure lvwContantsChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure btnOKClick(Sender: TObject);
    procedure txtFolderChange(Sender: TObject);
    procedure lvwContantsInfoTip(Sender: TObject; Item: TListItem;
      var InfoTip: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  ADODB, UserInterfaces, uDlgSelContacts, uFfmContact;

{$R *.dfm}

procedure TdlgAddFolder.btnNameAddClick(Sender: TObject);
var
  AQuery: TADOQuery;
  xItem: TListItem;
  i: Integer;
begin
  // 打开添加联系人的对话框
  AQuery := TADOQuery.Create(nil);
  AQuery.Connection := frmMain.adoContacts;
  AQuery.SQL.Add('SELECT [contact].[name] FROM [contact]');
  AQuery.SQL.Add('WHERE [contact].[folder] IS NOT NULL');
  AQuery.SQL.Add('ORDER BY [contact].[name]');
  AQuery.Open;

  // 打开选择文件的对话框
  with TdlgSelContacts.Create(nil) do
  begin
    while not AQuery.Eof do
    begin
      ExcludeList.Add(AQuery.FieldByName('name').AsString);
      AQuery.Next; 
    end;

    for i := 0 to Self.lvwContants.Items.Count - 1 do
      ExcludeList.Add(Self.lvwContants.Items[i].Caption);

    lvwCategory.Items[0].Selected := True;
    ShowModal;

    if not Canceled then
    begin
      Self.lvwContants.ClearSelection;

      for i := 0 to SelNames.Count - 1 do
      begin
        xItem := Self.lvwContants.Items.Add;
        xItem.Caption := SelNames[i];
        xItem.ImageIndex :=0;
        xItem.Selected := True;
      end;
    end;

    Free;
  end;

  AQuery.Close;
  AQuery.Free;
end;

procedure TdlgAddFolder.btnNameDelClick(Sender: TObject);
begin
  lvwContants.DeleteSelected;
end;

procedure TdlgAddFolder.btnNameClearClick(Sender: TObject);
begin
  lvwContants.Clear;
  btnNameClear.Enabled := False;
end;

procedure TdlgAddFolder.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TdlgAddFolder.lvwContantsChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  btnNameDel.Enabled := (lvwContants.SelCount > 0);
  btnNameClear.Enabled := (lvwContants.Items.Count > 0);
end;

procedure TdlgAddFolder.btnOKClick(Sender: TObject);
var
  ATB: TADOTable;
  ASQL: TADOQuery;
  i: Integer;
begin
  // 更新 SMS.Folder 表
  ATB := TADOTable.Create(nil);
  ATB.Connection := frmMain.adoSMS;
  ATB.TableName := 'folder';
  ATB.Open;

  // 检查这个文件夹是否存在
  if ATB.Locate('folder', txtFolder.Text, []) then
  begin
    MessageBox(Handle, PChar(txtFolder.Text + ' 这个文件夹已存在'),
      PChar(Application.Title), MB_ICONEXCLAMATION);
    ATB.Close;
    ATB.Free;
    Windows.SetFocus(txtFolder.Handle);
    Exit;
  end;

  // 更新文件夹
  Cursor := crHourGlass;
  ATB.Append;
  ATB.FieldByName('folder').AsString := txtFolder.Text;
  ATB.Post;
  ATB.Close;

  // 连级更新短消息的位置
  if MessageBox(Handle, '是否移动所有关联的短信到这个新文件夹中？',
    PChar(Application.Title), MB_YESNO + MB_ICONQUESTION) = IDYES	then
  begin
    ASQL := TADOQuery.Create(nil);
    ASQL.Connection := frmMain.adoSMS;

    for i := 0 to lvwContants.Items.Count - 1 do
    begin
      ASQL.SQL.Clear;
      ASQL.SQL.Add('UPDATE receive SET receive.folder = ' + QuotedStr(txtFolder.Text));
      ASQL.SQL.Add('WHERE (((receive.sender)=' + QuotedStr(lvwContants.Items[i].Caption)  +') AND ((receive.folder) Is Null));');
      ASQL.ExecSQL;
    end;

    ASQL.Close;
    ASQL.Free;
  end;

  // 更新联系人的对应关系
  ATB.Connection := frmMain.adoContacts;
  ATB.TableName := 'contact';
  ATB.Open;

  for i := 0 to lvwContants.Items.Count - 1 do
    if ATB.Locate('name', lvwContants.Items[i].Caption, []) then
    begin
      ATB.Edit;
      ATB.FieldByName('folder').AsString := txtFolder.Text;
      ATB.Post;
    end;

  ATB.Close;
  ATB.Free;

  // 添加界面元素
  frmMain.tvwFolder.Items.AddChild(frmMain.tvwFolder.Items[5], txtFolder.Text).Selected := True;

  // 关闭窗口
  Cursor := crDefault;
  Close;
end;

procedure TdlgAddFolder.txtFolderChange(Sender: TObject);
begin
  btnOK.Enabled := Length(txtFolder.Text) > 0;
end;

procedure TdlgAddFolder.lvwContantsInfoTip(Sender: TObject;
  Item: TListItem; var InfoTip: String);
begin
  // 显示联系人信息
  InfoTip := '';
  ffmContact.ShowContactInfo(Item.Caption);
end;

end.
