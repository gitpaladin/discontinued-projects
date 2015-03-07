unit uDlgCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ImgList;

type
  TdlgCategory = class(TForm)
    lblName: TLabel;
    txtName: TEdit;
    lvwMember: TListView;
    lblMember: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    iltPhoneBook: TImageList;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure txtNameChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FOriName: string;
    FCanceled: Boolean;
    procedure FAddCategory;
    procedure FDelOriCategory;
  public
    { Public declarations }
    function ShowNewCategory: Boolean;
    function ShowEditCategory(ACategory: String): Boolean;
  end;

implementation

{$R *.dfm}

uses
  UserInterfaces, ADODB;

procedure TdlgCategory.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TdlgCategory.FormCreate(Sender: TObject);
var
  tbPBook: TADOTable;
  xItem: TListItem;
begin
  // 读取现有的电话簿
  tbPBook := TADOTable.Create(nil);
  tbPBook.Connection := frmMain.adoContacts;
  tbPBook.TableName := 'contact';
  tbPBook.Open;
  tbPBook.Sort := 'name ASC';

  while not tbPBook.Eof do
  begin
    xItem := lvwMember.Items.Add;
    xItem.ImageIndex := 0;
    xItem.Caption := tbPBook.FieldByName('name').AsString;
    xItem.SubItems.Add(tbPBook.FieldByName('phonenumber').AsString);
    xItem.SubItems.Add(tbPBook.FieldByName('category').AsString);
    tbPBook.Next;
  end;

  tbPBook.Close;
  tbPBook.Free;
  FCanceled := True;
end;

function TdlgCategory.ShowEditCategory(ACategory: String): Boolean;
var
  i: Integer;
begin
  FOriName := ACategory;
  Caption := '编辑类别(' + ACategory + ')';
  txtName.Text := ACategory;

  for i := 0 to lvwMember.Items.Count - 1 do
    if lvwMember.Items[i].SubItems[1] = ACategory then
      lvwMember.Items[i].Checked := True;

  ShowModal;
  Result := FCanceled;

  if not FCanceled then
  begin
    FDelOriCategory;
    FAddCategory;
    frmMain.RefreshCategory(txtName.Text);
  end;
end;


function TdlgCategory.ShowNewCategory: Boolean;
begin
  Caption := '添加类别';
  ShowModal;
  Result := FCanceled;

  if not FCanceled then
  begin
    FAddCategory;
    frmMain.RefreshCategory(txtName.Text);
  end;
end;

procedure TdlgCategory.FAddCategory;
var
  tbPBook: TADOTable;
  i: Integer;
begin
  tbPBook := TADOTable.Create(nil);
  tbPBook.Connection := frmMain.adoContacts;
  tbPBook.TableName := 'category';
  tbPBook.Open;
  tbPBook.Append;
  tbPBook.FieldByName('category').AsString := txtName.Text;
  tbPBook.Post;
  tbPBook.Close;

  tbPBook.TableName := 'contact';
  tbPBook.Open;

  for i := 0 to lvwMember.Items.Count - 1 do
    if lvwMember.Items[i].Checked then
      if tbPBook.Locate('phonenumber', lvwMember.Items[i].SubItems[0], []) then
      begin
        tbPBook.Edit;
        tbPBook.FieldByName('category').AsString := txtName.Text;
        tbPBook.Post;
      end;

  tbPBook.Close;
  tbPBook.Free;
end;  

procedure TdlgCategory.FDelOriCategory;
var
  sql: TADOQuery;
begin
  sql := TADOQuery.Create(nil);
  sql.Connection := frmMain.adoContacts;
  sql.SQL.Add('DELETE FROM [category] WHERE [category].[category] = ' + QuotedStr(FOriName) + ';');
  sql.ExecSQL;

  sql.SQL.Clear;
  sql.SQL.Add('UPDATE [contact] SET [category] = NULL WHERE [category] = ' + QuotedStr(FOriName) + ';');
  sql.ExecSQL;
  sql.Free;
end;

procedure TdlgCategory.txtNameChange(Sender: TObject);
begin
  btnOK.Enabled := Length(txtName.Text) > 0
end;

procedure TdlgCategory.btnOKClick(Sender: TObject);
var
  tbPBook: TADOTable;
begin
  // 检查是否重复
  if txtName.Text = FOriName then
  begin
    FCanceled := False;
    Close;
    Exit;
  end;

  tbPBook := TADOTable.Create(nil);
  tbPBook.Connection := frmMain.adoContacts;
  tbPBook.TableName := 'category';
  tbPBook.Open;

  if tbPBook.Locate('category', txtName.Text, []) then
  begin
    MessageBox(Handle, PChar(txtName.Text + '已经存在，请使用其他的类别名字。'),
      PChar(Application.Title), MB_OK + MB_ICONWARNING + MB_DEFBUTTON2);
    SetFocusedControl(txtName);
  end
  else
  begin
    FCanceled := False;
    Close;
  end;
end;

end.
