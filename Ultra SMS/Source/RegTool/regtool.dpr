program regtool;

uses
  Forms,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  AES in 'AES.pas',
  DES in 'DES.pas',
  ElAES in 'ElAES.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ultra SMS Registration Tool';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
