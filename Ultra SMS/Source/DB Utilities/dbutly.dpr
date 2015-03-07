program dbutly;

uses
  Forms,
  uFrmIntroPage in 'uFrmIntroPage.pas' {frmIntroPage},
  uDlgSetPassword in 'uDlgSetPassword.pas' {dlgSetPassword},
  uGeneral in 'uGeneral.pas',
  uDlgPassword in 'uDlgPassword.pas' {PasswordDlg},
  uDlgRestore in 'uDlgRestore.pas' {dlgRestore},
  uDlgCreateDB in 'uDlgCreateDB.pas' {dlgCreateDatabase},
  uDlgUpdateDB in 'uDlgUpdateDB.pas' {dlgUpdateDB};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Database Utilities';
  Application.CreateForm(TfrmIntroPage, frmIntroPage);
  Application.Run;
end.
