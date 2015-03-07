unit uDlgAddContact;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, Math, ComCtrls;

type
  TContactItem = class(TObject)
  public
    ID: Integer;
    Name: String;
    PhoneNumber: String;
    Category: String;
    Folder: String;
    constructor Create(const ID: Integer; const Name: String;
      const PhoneNumber: String; const Category: String;
      const Folder: String);
  end;

  TdlgAddContact = class(TForm)
    lblName: TLabel;
    lblPhoneNumber: TLabel;
    txtPhoneNumber: TEdit;
    lblCategory: TLabel;
    cboCategory: TComboBox;
    lblFolder: TLabel;
    cboFolder: TComboBox;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    chkUpdateOther: TCheckBox;
    cboName: TComboBox;
    pbUpdate: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure txtPhoneNumberChange(Sender: TObject);
    procedure txtPhoneNumberExit(Sender: TObject);
    procedure cboNameClick(Sender: TObject);
  private
    { Private declarations }
    FOriName: String;
    FOriPhone: String;
    FOriCategory: String;
    FOriFolder: String;
    FCanceled: Boolean;
  public
    { Public declarations }
    function ShowAddContact(var Name: String; var Number: String;
      var Category: String): Boolean;
    function ShowEditContact(var Name: String; var Number: String;
      var Category: string): Boolean;
    function ShowReplaceContact(var Name: String; var Number: String;
      var Category: string): Boolean;
  end;

implementation

{$R *.dfm}

uses
  UserInterfaces, ADODB, GerneralFunc, StrUtils;

procedure TdlgAddContact.FormCreate(Sender: TObject);
var
  sql: TADOQuery;
begin
  FCanceled := True;
  // 填充文件夹组合框
  sql := TADOQuery.Create(nil);
  sql.Connection := frmMain.adoSMS;
  sql.SQL.Text := 'SELECT * FROM [folder] ORDER BY [folder].[folder] ASC;';
  sql.Open;

  cboFolder.AddItem('<无>', nil);

  while not sql.Eof do
  begin
    cboFolder.AddItem(sql.FieldByName('folder').AsString, nil);
    sql.Next;
  end;

  sql.Close;

  // 填充类别组合框
  sql.Connection := frmMain.adoContacts;
  sql.SQL.Text := 'SELECT * FROM [category] ORDER BY [category].[category] ASC;';
  sql.Open;

  cboCategory.AddItem('<无类别>', nil);

  while not sql.Eof do
  begin
    cboCategory.AddItem(sql.FieldByName('category').AsString, nil);
    sql.Next;
  end;

  sql.Close;

  // 填充姓名
  sql.SQL.Text := 'SELECT * FROM [contact]';
  sql.Open;

  while not sql.Eof do
  begin
    cboName.AddItem(sql.FieldByName('name').AsString,
      TContactItem.Create(sql.FieldByName('id').AsInteger,
      sql.FieldByName('name').AsString,
      sql.FieldByName('phonenumber').AsString,
      sql.FieldByName('category').AsString,
      sql.FieldByName('folder').AsString));
    sql.Next;
  end;

  sql.Close;
  sql.Free;

  cboCategory.ItemIndex := 0;
  cboFolder.ItemIndex := 0;

  Height := Height - pbUpdate.Height;
  pbUpdate.Visible := False;
end;

function TdlgAddContact.ShowAddContact(var Name: String; var Number: String;
  var Category: String): Boolean;
var
  TB: TADOTable;
begin
  Caption := '添加联系人';
  cboName.Text := Name;
  txtPhoneNumber.Text := Number;
  cboCategory.Text := Category;
  ShowModal;
  Result := not FCanceled;

  if Result then
  begin
    Name := cboName.Text;
    Number := txtPhoneNumber.Text;

    if cboCategory.ItemIndex = 0 then
      Category := ''
    else
      Category := cboCategory.Items[cboCategory.ItemIndex];

    // 添加到数据库
    TB := TADOTable.Create(nil);
    TB.Connection := frmMain.adoContacts;
    TB.TableName := 'contact';
    TB.Open;
    TB.Append;
    TB.FieldByName('id').AsInteger := 0;
    TB.FieldByName('name').AsString := Name;
    TB.FieldByName('phonenumber').AsString := Number;
    if cboCategory.ItemIndex > 0 then
      TB.FieldByName('category').AsString := Category;
    if cboFolder.ItemIndex > 0 then
      TB.FieldByName('folder').AsString := cboFolder.Items[cboFolder.ItemIndex];
    TB.Post;
    TB.Close;
    TB.Free;
  end;
end;

function TdlgAddContact.ShowEditContact(var Name: String; var Number: String;
  var Category: string): Boolean;
var
  TB: TADOTable;
begin
  Caption := '编辑联系人';
  cboName.Text := Name;
  txtPhoneNumber.Text := Number;
  FOriPhone := Number;

  TB := TADOTable.Create(nil);
  TB.Connection := frmMain.adoContacts;
  TB.TableName := 'contact';
  TB.Open;

  if TB.Locate('phonenumber', Number, []) then
  begin
    Category := TB.FieldByName('category').AsString;

    if Length(Category) = 0 then
      cboCategory.ItemIndex := 0
    else
      cboCategory.ItemIndex := cboCategory.Items.IndexOf(Category);

    if Length(TB.FieldByName('folder').AsString) = 0 then
      cboFolder.ItemIndex := 0
    else
      cboFolder.ItemIndex := cboFolder.Items.IndexOf(TB.FieldByName('folder').AsString);
  end;

  TB.Close;
  TB.Free;

  ShowModal;
  Result := not FCanceled;

  if Result then
  begin
    Name := cboName.Text;
    Number := txtPhoneNumber.Text;

    if cboCategory.ItemIndex = 0 then
      Category := ''
    else
      Category := cboCategory.Items[cboCategory.ItemIndex];

    // 添加到数据库
    TB := TADOTable.Create(nil);
    TB.Connection := frmMain.adoContacts;
    TB.TableName := 'contact';
    TB.Open;
    if TB.Locate('phonenumber', FOriPhone, []) then
    begin
      TB.Edit;
      TB.FieldByName('name').AsString := Name;
      TB.FieldByName('phonenumber').AsString := Number;

      if cboCategory.ItemIndex > 0 then
        TB.FieldByName('category').AsString := Category
      else
        TB.FieldByName('category').Clear;

      if cboFolder.ItemIndex > 0 then
        TB.FieldByName('folder').AsString := cboFolder.Items[cboFolder.ItemIndex]
      else
        TB.FieldByName('folder').Clear;

      TB.Post;
      TB.Close;
    end;
    TB.Free;
  end;
end;


procedure TdlgAddContact.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TdlgAddContact.btnOKClick(Sender: TObject);
var
  // 检查是否重复
  LiteNumber, Name, Folder: String;
  sql: TADOQuery;
  db: TADOTable;
begin
  LiteNumber := txtPhoneNumber.Text;

  sql := TADOQuery.Create(nil);
  sql.Connection := frmMain.adoContacts;
  sql.SQL.Add(Format('SELECT * FROM contact WHERE phonenumber <> "%s";', [FOriPhone]));
  sql.Open;

  while not sql.Eof do
  begin
    if PhoneNumberSimilar(sql.FieldByName('phonenumber').AsString, LiteNumber) then
    begin
      MessageBox(Handle, PChar(Format('在数据库中找到相同的电话号码。'+
        #13#10#13#10 + '姓名: %s' + #13#10 +
        '号码: %s' + #13#10 + '类别: %s' + #13#10 + '位置排序: %d',
        [sql.FieldByName('name').AsString,
        sql.FieldByName('phonenumber').AsString,
        sql.FieldByName('category').AsString,
        sql.FieldByName('id').AsInteger])), PChar(Application.Title),
        MB_ICONEXCLAMATION);
      Windows.SetFocus(txtPhoneNumber.Handle);
      sql.Close;
      sql.Free;
      exit;
    end;

    sql.Next;
  end;

  sql.Close;

  if chkUpdateOther.Checked then
  begin
    // 更新短信数据库中的内容
    Height := Height + pbUpdate.Height;
    pbUpdate.Visible := True;

    // 获得所有条目的数目
    sql.Connection := frmMain.adoSMS;
    sql.SQL.Text :=
      'SELECT draft_item.number FROM draft_item' + #13#10 + 
      'UNION ALL' + #13#10 + 
      'SELECT finish_item.number FROM finish_item' + #13#10 + 
      'UNION ALL' + #13#10 + 
      'SELECT receive.sendernumber FROM receive' + #13#10 + 
      'UNION ALL' + #13#10 + 
      'SELECT send.number FROM send;';
    sql.Open;
    sql.Last;
    pbUpdate.Max := sql.RecordCount;
    sql.Close;

    if pbUpdate.Max > 0 then
    begin
      db := TADOTable.Create(nil);
      db.Connection := frmMain.adoSMS;
      db.TableDirect := True;

      Name := cboName.Text;

      if cboFolder.ItemIndex > 0 then
        Folder := cboFolder.Items[cboFolder.ItemIndex]
      else
        Folder := '';

      // 草稿
      db.TableName := 'draft_item';
      db.Open;

      while not db.Eof do
      begin
        if PhoneNumberSimilar(db.FieldByName('number').AsString, LiteNumber) then
        begin
          db.Edit;

          if Length(Name) = 0 then
            db.FieldByName('name').Clear
          else
            db.FieldByName('name').AsString := Name;

          db.Post;
        end;

        db.Next;
        pbUpdate.StepIt;
        Application.ProcessMessages;
      end;

      db.Close;

      // 已发送
      db.TableName := 'finish_item';
      db.Open;

      while not db.Eof do
      begin
        if PhoneNumberSimilar(db.FieldByName('number').AsString, LiteNumber) then
        begin
          db.Edit;

          if Length(Name) = 0 then
            db.FieldByName('name').Clear
          else
            db.FieldByName('name').AsString := Name;

          db.Post;
        end;

        db.Next;
        pbUpdate.StepIt;
        Application.ProcessMessages;
      end;

      db.Close;

      // 收件箱
      db.TableName := 'receive';
      db.Open;

      while not db.Eof do
      begin
        if PhoneNumberSimilar(db.FieldByName('sendernumber').AsString, LiteNumber) then
        begin
          db.Edit;

          if Length(Name) = 0 then
            db.FieldByName('sender').Clear
          else
            db.FieldByName('sender').AsString := Name;

          if Length(Folder) = 0 then
            db.FieldByName('folder').Clear
          else
            db.FieldByName('folder').AsString := Folder;

          db.Post;
        end;

        db.Next;
        pbUpdate.StepIt;
        Application.ProcessMessages;
      end;

      db.Close;

      // 发件箱
      db.TableName := 'send';
      db.Open;

      while not db.Eof do
      begin
        if PhoneNumberSimilar(db.FieldByName('number').AsString, LiteNumber) then
        begin
          db.Edit;

          if Length(Name) = 0 then
            db.FieldByName('addressee').Clear
          else
            db.FieldByName('addressee').AsString := Name;

          db.Post;
        end;

        db.Next;
        pbUpdate.StepIt;
        Application.ProcessMessages;
      end;

      db.Close;
      db.Free;
    end;

    frmMain.RefreshView;
  end;    

  sql.Free;
  FCanceled := False;
  Close;
end;

procedure TdlgAddContact.txtPhoneNumberChange(Sender: TObject);
begin
  btnOK.Enabled := Length(cboName.Text) > 0;
end;

procedure TdlgAddContact.txtPhoneNumberExit(Sender: TObject);
begin
  if ExtractPhoneNumber(txtPhoneNumber.Text) <> txtPhoneNumber.Text then
  begin
    MessageBox(Handle, '您输入的电话号码无效！', PChar(Application.Title), MB_ICONEXCLAMATION);
    Windows.SetFocus(txtPhoneNumber.Handle);
  end;
end;

function TdlgAddContact.ShowReplaceContact(var Name, Number,
  Category: string): Boolean;
var
  TB: TADOTable;
  CI: TContactItem;
begin
  if cboName.Items.Count = 0 then
    Exit;

  Caption := '替换联系人';
  cboName.Style := csDropDownList;
  cboName.ItemIndex := -1;
  txtPhoneNumber.Text := Number;
  cboCategory.Enabled := False;
  cboFolder.Enabled := False;

  ShowModal;
  Result := not FCanceled;

  if Result then
  begin
    Number := txtPhoneNumber.Text;

    CI := TContactItem(cboName.Items.Objects[cboName.ItemIndex]);
    FOriPhone := CI.PhoneNumber;
    Name := CI.Name;
    Number := txtPhoneNumber.Text;
    Category := CI.Category;

    // 添加到数据库
    TB := TADOTable.Create(nil);
    TB.Connection := frmMain.adoContacts;
    TB.TableName := 'contact';
    TB.Open;
    if TB.Locate('phonenumber', FOriPhone, []) then
    begin
      TB.Edit;
      TB.FieldByName('phonenumber').AsString := Number;
      TB.Post;
      TB.Close;
    end;
    TB.Free;
  end;
end;

{ TContactItem }

constructor TContactItem.Create(const ID: Integer; const Name, PhoneNumber,
  Category, Folder: String);
begin
  inherited Create;
  Self.ID := ID;
  Self.Name := Name;
  Self.PhoneNumber := PhoneNumber;
  Self.Category := Category;
  Self.Folder := Folder;
end;

procedure TdlgAddContact.cboNameClick(Sender: TObject);
var
  CI: TContactItem;
begin
  CI := TContactItem(cboName.Items.Objects[cboName.ItemIndex]);
  cboCategory.ItemIndex := Max(cboCategory.Items.IndexOf(CI.Category), 0);
  cboFolder.ItemIndex := Max(cboFolder.Items.IndexOf(CI.Folder), 0);
  btnOK.Enabled := cboFolder.ItemIndex >= 0;
end;

end.
