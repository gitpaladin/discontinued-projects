unit uDlgCreateDB;

//{$DEFINE NULLDEFAULTPASS}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TdlgCreateDatabase = class(TForm)
    shpTopBack: TShape;
    bvlTop: TBevel;
    lblNew: TLabel;
    lblConfirm: TLabel;
    bvlBottom: TBevel;
    lblTitle: TLabel;
    lblTitleInfo: TLabel;
    imgTitle: TImage;
    lblDescription: TLabel;
    lblInfo2: TLabel;
    txtNew: TEdit;
    txtConfirm: TEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    lblOk: TLabel;
    txtOK: TEdit;
    procedure txtOKChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
uses
  uGeneral, ADODB, uFrmIntroPage;

procedure TdlgCreateDatabase.txtOKChange(Sender: TObject);
begin
  btnOK.Enabled := txtOK.Text = 'OK';
end;

procedure TdlgCreateDatabase.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TdlgCreateDatabase.btnOKClick(Sender: TObject);
var
  conn: TADOConnection;
  sPass: String;
  i: Integer;
begin
  // 检查密码的正确性
  if txtNew.Text <> txtConfirm.Text then
  begin
    MessageBox(Handle, '新密码和确认的新密码不相同，请重新输入。', 
      PChar(Application.Title), MB_OK + MB_ICONWARNING);
    txtConfirm.SetFocus;
    Exit;
  end;

  DBCreate(PChar(ExtractFilePath(ParamStr(0))));

  // 修改密码
  if Length(txtNew.Text) <> 0 then
    sPass := FEncodePassword(txtNew.Text);

{$IFNDEF NULLDEFAULTPASS}
  if Length(txtNew.Text) = 0 then
    sPass := FEncodePassword(sNullPassword);
{$ENDIF}

  if Length(sPass) > 0 then
    for i := 0 to DBPaths.Count - 1 do
    begin
      conn := TADOConnection.Create(nil);
      conn.Mode := cmShareExclusive;
      conn.ConnectionString :=
        'Provider=Microsoft.Jet.OLEDB.4.0;' +
        'Data Source=' + DBPaths[i] +
        ';Persist Security Info=False';
      conn.Open;
      conn.Execute('ALTER DATABASE PASSWORD [' + sPass + '] NULL;');
      conn.Close;
      conn.Free;
    end;

  if not frmIntroPage.QuietMode then
    MessageBox(Handle, '创建数据库成功。', PChar(Application.Title), MB_OK +
      MB_ICONINFORMATION);

  Close;  
end;

procedure TdlgCreateDatabase.FormCreate(Sender: TObject);
begin
  if frmIntroPage.QuietMode then
    btnOKClick(nil);
end;

end.
