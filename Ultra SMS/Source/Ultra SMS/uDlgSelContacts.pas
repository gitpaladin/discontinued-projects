unit uDlgSelContacts;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, ComCtrls, Buttons, ImgList, uFraContact;

type
  TdlgSelContacts = class(TForm)
    iltPhoneBook: TImageList;
    lblCategory: TLabel;
    lvwCategory: TListView;
    lvwContacts: TListView;
    lblContacts: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    fraContact: TfraContact;
    procedure FormCreate(Sender: TObject);
    procedure lvwCategorySelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure lvwContactsInfoTip(Sender: TObject; Item: TListItem;
      var InfoTip: String);
    procedure FormPaint(Sender: TObject);
    procedure lvwContactsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  public
    Canceled: Boolean;
    SelNames: TStringList;
    ExcludeList: TStringList;
  private
    FCurIndex: Integer;
  end;

implementation

{$R *.DFM}
uses
  ADODB, UserInterfaces, uFfmContact;

procedure TdlgSelContacts.FormCreate(Sender: TObject);
var
  tbTable: TADOTable;
begin
  ExcludeList := TStringList.Create;
  
  // 读取类别
  tbTable := TADOTable.Create(nil);
  tbTable.Connection := frmMain.adoContacts;
  tbTable.TableName := 'category';
  tbTable.Open;

  FCurIndex := -1;
  lvwCategory.Items.Add;
  lvwCategory.Items[0].Caption := '<无类别>';
  lvwCategory.Items[0].ImageIndex := 1;

  while not tbTable.Eof do
  begin
    if tbTable.FieldByName('category').AsString <> '' then
      with lvwCategory.Items.Add do
      begin
        Caption := tbTable.FieldByName('category').AsString;
        ImageIndex := 0;
      end;
    tbTable.Next;
  end;
  tbTable.Close;

  // 更新条目
end;

procedure TdlgSelContacts.lvwCategorySelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  dQuery: TADOQuery;
  xItem: TListItem;
  sName: String;
begin
  if FCurIndex = Item.Index then exit;
  Canceled := True;

  // 打开电话簿
  lvwContacts.Clear;
  dQuery := TADOQuery.Create(nil);
  dQuery.Connection := frmMain.adoContacts;
  dQuery.SQL.Add('SELECT [contact].[name], [contact].[phonenumber]');
  dQuery.SQL.Add('FROM [contact]');

  if Item.ImageIndex = 1 then
    dQuery.SQL.Add('WHERE ((([contact].[category]) IS NULL))')
  else
    dQuery.SQL.Add(Format('WHERE ((([contact].[category])=%s))',
      [QuotedStr(Item.Caption)]));

  dQuery.SQL.Add('ORDER BY [name] ASC;');
  dQuery.Open;

  while not dQuery.Eof do
  begin
    sName := dQuery.FieldByName('name').AsString;

    xItem := lvwContacts.Items.Add;
    xItem.Caption := sName;
    xItem.SubItems.Add(dQuery.FieldByName('phonenumber').AsString);
    xItem.ImageIndex := 2;
    xItem.Cut := ExcludeList.IndexOf(sName) > -1;
    dQuery.Next;
  end;

  dQuery.Close;
  dQuery.Free;

  FCurIndex := Item.Index;
end;

procedure TdlgSelContacts.btnOKClick(Sender: TObject);
var
  i: Integer;
begin
  // 添加到项目
  SelNames := TStringList.Create;

  for i := 0 to lvwContacts.Items.Count - 1 do
    if (lvwContacts.Items[i].Selected) and (not lvwContacts.Items[i].Cut) then
      SelNames.Add(lvwContacts.Items[i].Caption);

  Close;
  Application.ProcessMessages;
  Canceled := False;
end;

procedure TdlgSelContacts.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TdlgSelContacts.lvwContactsInfoTip(Sender: TObject;
  Item: TListItem; var InfoTip: String);
begin
  // 显示联系人信息
  InfoTip := '';
  ffmContact.ShowContactInfo(Item.Caption);
end;

procedure TdlgSelContacts.FormPaint(Sender: TObject);
begin
  fraContact.Repaint;
end;

procedure TdlgSelContacts.lvwContactsSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Selected then
  begin
    fraContact.RefreshContact(Item.Caption);
    fraContact.Repaint;
  end;
end;

end.
