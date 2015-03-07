unit uDlgPassword;

//{$DEFINE NULLDEFAULTPASS}

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons;

type
  TPasswordDlg = class(TForm)
    lblPassword: TLabel;
    txtPassword: TEdit;
    btnOKBtn: TButton;
    btnCancelBtn: TButton;
    procedure btnOKBtnClick(Sender: TObject);
    procedure btnCancelBtnClick(Sender: TObject);
  private
    { Private declarations }
    FDBName: string;
    FFinalPass: string;
    FCanceled: Boolean;
  public
    { Public declarations }
    function GetPassword(var APassword: String; DBName: String): Boolean;
  end;                                                   

implementation

{$R *.dfm}

uses
  CryptoAPI, StrUtils, uGeneral, ADODB, ComObj;

function TPasswordDlg.GetPassword(var APassword: String; DBName: String): Boolean;
begin
  FFinalPass := '';
  FDBName := DBName;
  FCanceled := True;
  btnOKBtnClick(nil);

  if not FCanceled then
  begin
    APassword := FFinalPass;
    Result := True;
  end
  else
  begin
    APassword := '';
    Result := False;
  end
end;


procedure TPasswordDlg.btnOKBtnClick(Sender: TObject);
var
  conn: TADOConnection;
  sMSG: String;
begin
  if Length(txtPassword.Text) = 0 then
  {$IFDEF NULLDEFAULTPASS}
    FFinalPass := ''
  {$ELSE}
    FFinalPass := FEncodePassword(sNullPassword)
  {$ENDIF}
  else
    FFinalPass := FEncodePassword(txtPassword.Text);

  try
    conn := TADOConnection.Create(nil);
    conn.ConnectionString :=
      'Provider=Microsoft.Jet.OLEDB.4.0;' +
      'Data Source=' + FDBName +
      ';Persist Security Info=False';
    if Length(FFinalPass) > 0 then
      conn.ConnectionString := conn.ConnectionString
        + ';Jet OLEDB:Database Password=' + FFinalPass;
    conn.Open;
    conn.Close;
    conn.Free;
  except
    on E: Exception do
    begin
      if E is EOleException then
        if (E as EOleException).ErrorCode = -2147217843 then
        begin
          if not Visible then
            MessageBox(Handle,
              PChar('您输入你密码无效，请重新输入。'),
              PChar(Application.Title), MB_OK + MB_ICONSTOP);
          conn.Free;
          Show;
          txtPassword.SetFocus;
          Exit;
        end;

      conn.Free;
      sMSG := Format('无法连接数据库，请确认该数据库存在并且没有被其他程序所使用。%s%s', [#10#13, FDBName]);
      MessageBox(Handle, PChar(sMSG), PChar(self.Caption), MB_ICONSTOP);
      Show;
      Exit;
    end;
  end;

  FCanceled := False;
  Close;
end;

procedure TPasswordDlg.btnCancelBtnClick(Sender: TObject);
begin
  Close;
end;

end.

