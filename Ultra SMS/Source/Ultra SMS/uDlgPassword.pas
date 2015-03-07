unit uDlgPassword;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons;

type
  TPasswordDlg = class(TForm)
    lblPassword: TLabel;
    txtPassword: TEdit;
    btnOKBtn: TBitBtn;
    btnCancelBtn: TBitBtn;
    procedure btnOKBtnClick(Sender: TObject);
    procedure btnCancelBtnClick(Sender: TObject);
  private
    { Private declarations }
    FFinalPass: string;
    FCanceled: Boolean;
  public
    { Public declarations }
    function GetPassword(var APassword: String): Boolean;
  end;

implementation

{$R *.dfm}

uses
  CryptoAPI, GerneralFunc, StrUtils;

function TPasswordDlg.GetPassword(var APassword: String): Boolean;
begin
  FFinalPass := '';
  FCanceled := True;
  ShowModal;

  if not FCanceled then
  begin
    APassword := EncodePassword(FFinalPass);
    Result := True;
  end
  else
  begin
    APassword := '';
    Result := False;
  end
end;


procedure TPasswordDlg.btnOKBtnClick(Sender: TObject);
begin
  FFinalPass := txtPassword.Text;
  FCanceled := False;
  Close;
end;

procedure TPasswordDlg.btnCancelBtnClick(Sender: TObject);
begin
  Close;
end;

end.
 
