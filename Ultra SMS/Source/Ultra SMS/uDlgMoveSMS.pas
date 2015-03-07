unit uDlgMoveSMS;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, ComCtrls, ImgList;

type
  TdlgMoveSMS = class(TForm)
    lvwFolder: TListView;
    lblInfo: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    iltFolder: TImageList;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lvwFolderChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure btnOKClick(Sender: TObject);
  private
    FFolder: String;
    FCanceled: Boolean;
    { Private declarations }
  public
    function ShowBox(const SelSMS: array of Integer): String;
    { Public declarations }
  end;

implementation

{$R *.dfm}
uses
  ADODB, UserInterfaces;

function TdlgMoveSMS.ShowBox(const SelSMS: array of Integer): String;
var
  tb: TADOTable;
  i: Integer;
begin
  ShowModal;

  if not FCanceled then
  begin
    tb := TADOTable.Create(nil);
    tb.Connection := frmMain.adoSMS;
    tb.TableName := 'receive';
    tb.Open;

    for i := Low(SelSMS) to High(SelSMS) do
      if tb.Locate('internalid', SelSMS[i], []) then
      begin
        tb.Edit;
        tb.FieldByName('folder').AsString := FFolder;
        tb.Post;
      end;

    tb.Close;
    tb.Free;
    Result := FFolder;
  end
  else
    Result := '#CANCLED#';
end;

procedure TdlgMoveSMS.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TdlgMoveSMS.FormCreate(Sender: TObject);
var
  sql: TADOQuery;
  xitem: TListItem;
begin
  // 添加项目
  sql := TADOQuery.Create(nil);
  sql.Connection := frmMain.adoSMS;
  sql.SQL.Text := 'SELECT * FROM [folder] ORDER BY [folder].[folder] ASC;';
  sql.Open;

  // 添加没有的节点
  xitem := lvwFolder.Items.Add;
  xitem.Caption := '<无文件夹>';
  xitem.ImageIndex := 0;
  xitem.Selected := True;

  while not sql.Eof do
  begin
    xitem := lvwFolder.Items.Add;
    xitem.Caption := sql.FieldByName('folder').AsString;
    xitem.ImageIndex := 1;
    sql.Next;
  end;

  sql.Close;
  sql.Free;

  FCanceled := True;
end;

procedure TdlgMoveSMS.lvwFolderChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  btnOK.Enabled := lvwFolder.SelCount > 0; 
end;

procedure TdlgMoveSMS.btnOKClick(Sender: TObject);
begin
  if lvwFolder.Selected.ImageIndex = 1 then
    FFolder := lvwFolder.Selected.Caption
  else
    FFolder := '';

  FCanceled := False;
  Close;
end;

end.
