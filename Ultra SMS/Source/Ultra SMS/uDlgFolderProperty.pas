unit uDlgFolderProperty;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, ComCtrls, ImgList;

type
  TdlgFolderProperty = class(TForm)
    lblNewName: TLabel;
    txtFolder: TEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    iltNames: TImageList;
    pgFolder: TPageControl;
    pgtsInfo: TTabSheet;
    pgtsContact: TTabSheet;
    btnNameAdd: TBitBtn;
    btnNameDel: TBitBtn;
    btnNameClear: TBitBtn;
    lvwContants: TListView;
    lblType: TLabel;
    txtType: TLabel;
    lblSMS: TLabel;
    txtSMS: TLabel;
    lblContact: TLabel;
    txtContact: TLabel;
    txtBeginDate: TLabel;
    lblBeginDate: TLabel;
    lblEndDate: TLabel;
    txtEndDate: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnNameAddClick(Sender: TObject);
    procedure lvwContantsChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure btnNameDelClick(Sender: TObject);
    procedure btnNameClearClick(Sender: TObject);
    procedure txtFolderChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure lvwContantsInfoTip(Sender: TObject; Item: TListItem;
      var InfoTip: String);
  private
    { Private declarations }
    FOriName: String;
    FConactChanged: Boolean;
  public
    { Public declarations }
    procedure ShowSysFolder(FolderName: String; SMSCount: Integer;
      BeginDate, EndDate: TDateTime);
    procedure ShowCustomFolder(FolderName: String; SMSCount: Integer;
      BeginDate, EndDate: TDateTime; ActiveContact: Boolean);
  end;

implementation

{$R *.dfm}

uses
  ADODB, UserInterfaces, uDlgSelContacts, uFfmContact;

procedure TdlgFolderProperty.ShowSysFolder(FolderName: String; SMSCount: Integer;
  BeginDate, EndDate: TDateTime);
begin
  txtFolder.Text := FolderName;
  txtFolder.ReadOnly := True;
  txtFolder.Color := clBtnFace;
  txtType.Caption := '系统文件夹';
  txtSMS.Caption := IntToStr(SMSCount);
  txtContact.Caption := 'N/A';
  txtBeginDate.Caption := DateTimeToStr(BeginDate);
  txtEndDate.Caption := DateTimeToStr(EndDate);
  pgtsContact.Free;
  btnOK.Enabled := False;
  btnCancel.Caption := '关闭';
  btnOK.Visible := False;
  ShowModal;
end;

procedure TdlgFolderProperty.ShowCustomFolder(FolderName: String; SMSCount: Integer;
  BeginDate, EndDate: TDateTime; ActiveContact: Boolean);
var
  dbQuery: TADOQuery;
  xItem: TListItem;
begin
  FOriName := FolderName;
  txtFolder.Text := FolderName;
  txtType.Caption := '自定义文件夹';
  txtSMS.Caption := IntToStr(SMSCount);
  txtBeginDate.Caption := DateTimeToStr(BeginDate);
  txtEndDate.Caption := DateTimeToStr(EndDate);

  // 填充项目
  dbQuery := TADOQuery.Create(nil);
  dbQuery.Connection := frmMain.adoContacts;
  dbQuery.SQL.Text := Format('SELECT [contact].[name] FROM [contact] WHERE ([contact].[folder] = %s)', [QuotedStr(FolderName)]);
  dbQuery.Open;

  while not dbQuery.Eof do
  begin
    xItem := lvwContants.Items.Add;
    xItem.ImageIndex := 0;
    xItem.Caption := dbQuery.FieldByName('name').AsString;
    dbQuery.Next;
  end;

  txtContact.Caption := IntToStr(lvwContants.Items.Count);
  dbQuery.Close;
  dbQuery.Free;
  btnOK.Enabled := False;

  if ActiveContact then
    pgFolder.ActivePageIndex := 1;

  ShowModal;
end;

procedure TdlgFolderProperty.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TdlgFolderProperty.btnNameAddClick(Sender: TObject);
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

      Self.btnOK.Enabled := True;
      FConactChanged := True;
    end;

    Free;
  end;

  AQuery.Close;
  AQuery.Free;
end;

procedure TdlgFolderProperty.lvwContantsChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  btnNameDel.Enabled := (lvwContants.SelCount > 0);
  btnNameClear.Enabled := (lvwContants.Items.Count > 0);
end;

procedure TdlgFolderProperty.btnNameDelClick(Sender: TObject);
begin
  lvwContants.DeleteSelected;
  btnOK.Enabled := True;
  FConactChanged := True;
end;

procedure TdlgFolderProperty.btnNameClearClick(Sender: TObject);
begin
  lvwContants.Clear;
  btnOK.Enabled := True;
  FConactChanged := True;
end;

procedure TdlgFolderProperty.txtFolderChange(Sender: TObject);
begin
  if (txtFolder.Text <> FOriName) then
    btnOK.Enabled := True
  else if FConactChanged = False then
    btnOK.Enabled := False;
end;

procedure TdlgFolderProperty.btnOKClick(Sender: TObject);
var
  sql: TADOQuery;
  tb: TADOTable;
  FNewName: String;
  i: Integer;
begin
  // 更新文件夹属性
  FNewName := txtFolder.Text;

  // 更新 SMS.Folder 表
  tb := TADOTable.Create(nil);

  if FOriName <> FNewName then
  begin
    // 检查新文件夹是否存在
    tb.Connection := frmMain.adoSMS;
    tb.TableName := 'folder';
    tb.Open;

    if tb.Locate('folder', FNewName, []) then
    begin
      MessageBox(Handle, PChar(FNewName + ' 这个文件夹已存在'),
        PChar(Application.Title), MB_ICONEXCLAMATION);
      tb.Close;
      tb.Free;
      Windows.SetFocus(txtFolder.Handle);
      Exit;
    end;

    tb.Close;

    // 文件夹的名字改变了
    sql := TADOQuery.Create(nil);
    sql.Connection := frmMain.adoContacts;
    sql.SQL.Add('UPDATE [contact] SET [contact].[folder] = ' + QuotedStr(FNewName));
    sql.SQL.Add('WHERE ([contact].[folder] = ' + QuotedStr(FOriName) + ');');
    sql.ExecSQL;

    sql.Connection := frmMain.adoSMS;
    sql.SQL.Clear;
    sql.SQL.Add('UPDATE [folder] SET [folder].[folder] = ' + QuotedStr(FNewName));
    sql.SQL.Add('WHERE ([folder].[folder] = ' + QuotedStr(FOriName) + ');');
    sql.ExecSQL;

    sql.SQL.Clear;
    sql.SQL.Add('UPDATE [receive] SET [receive].[folder] = ' + QuotedStr(FNewName));
    sql.SQL.Add('WHERE ([receive].[folder] = ' + QuotedStr(FOriName) + ');');
    sql.ExecSQL;
    sql.Free;

    // 界面中的名字也要改变
    frmMain.tvwFolder.Selected.Text := FNewName;
  end;

  if FConactChanged then
  begin
    // 更新关联列表
    sql := TADOQuery.Create(nil);
    sql.Connection := frmMain.adoContacts;
    sql.SQL.Clear;
    sql.SQL.Add('UPDATE [contact] SET [contact].[folder] = NULL');
    sql.SQL.Add('WHERE ([contact].[folder] = ' + QuotedStr(FOriName) + ');');
    sql.ExecSQL;
    sql.Free;

    tb.Connection := frmMain.adoContacts;
    tb.TableName := 'contact';
    tb.Open;

    for i := 0 to lvwContants.Items.Count - 1 do
      if tb.Locate('name', lvwContants.Items[i].Caption, []) then
      begin
        tb.Edit;
        tb.FieldByName('folder').AsString := txtFolder.Text;
        tb.Post;
      end;

    tb.Close;
  end;

  tb.Free;
  Close;
end;

procedure TdlgFolderProperty.lvwContantsInfoTip(Sender: TObject;
  Item: TListItem; var InfoTip: String);
begin
  // 显示联系人信息
  InfoTip := '';
  ffmContact.ShowContactInfo(Item.Caption);
  Refresh;
end;

end.
