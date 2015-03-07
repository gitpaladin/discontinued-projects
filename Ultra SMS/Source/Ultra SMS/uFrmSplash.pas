unit uFrmSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, CnAAFont, CnAACtrls;

type
  TfrmSplash = class(TForm)
    imgSplash: TImage;
    lblProgress: TLabel;
    tmrClose: TTimer;
    lblSubVersion: TLabel;
    alblVse: TCnAALabel;
    procedure imgSplashClick(Sender: TObject);
    procedure tmrCloseTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(const AParent: TForm; LastTime: Cardinal = 1000);
    procedure UpdateProgress(const ATest: String);
    procedure Done;
  end;

implementation

{$R *.dfm}

constructor TfrmSplash.Create(const AParent: TForm; LastTime: Cardinal = 1000);
begin
  inherited Create(nil);
  MoveWindow(Handle, (Screen.Width - imgSplash.Width) div 2,
    (Screen.Height - imgSplash.Height) div 2,
    imgSplash.Width, imgSplash.Height, True);
  SetWindowLong(Handle, -8, AParent.Handle);
  tmrClose.Interval := LastTime;
  tmrClose.Enabled := False;
end;

procedure TfrmSplash.UpdateProgress(const ATest: String);
begin
  lblProgress.Caption := ATest;
  Application.ProcessMessages;
end;

procedure TfrmSplash.Done;
begin
  lblProgress.Caption := 'Íê³É';
  tmrClose.Enabled := True;
end;

procedure TfrmSplash.imgSplashClick(Sender: TObject);
begin
  if tmrClose.Enabled then tmrCloseTimer(nil);
end;  

procedure TfrmSplash.tmrCloseTimer(Sender: TObject);
begin
  Close;
  Free;
end;

end.
