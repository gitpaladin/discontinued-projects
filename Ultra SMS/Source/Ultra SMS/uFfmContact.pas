unit uFfmContact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFraContact, ExtCtrls;

type
  TffmContact = class(TForm)
    fraContact: TfraContact;
    tmrHide: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure tmrHideTimer(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowContactInfo(sName: String);
  end;

var
  ffmContact: TffmContact;

implementation

{$R *.dfm}
uses
  UserInterfaces;

procedure TffmContact.ShowContactInfo(sName: String);
var
  pos: TPoint;
begin
  GetCursorPos(pos);
  pos.X := pos.X + 32;
  pos.Y := pos.Y + 32;
  if pos.X + Width > Screen.WorkAreaWidth then pos.X := Screen.WorkAreaWidth - Width;
  if pos.Y + Height > Screen.WorkAreaHeight then pos.Y := Screen.WorkAreaHeight - Height;
  Left := pos.X;
  Top := pos.Y;
  Show;
  fraContact.RefreshContact(sName);
  fraContact.Repaint;
  tmrHide.Enabled := True;
end;

procedure TffmContact.FormCreate(Sender: TObject);
begin
  SetWindowLong(Handle, -8, frmMain.Handle);
end;

procedure TffmContact.tmrHideTimer(Sender: TObject);
begin
  Hide;
end;

procedure TffmContact.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (X > 0) and (Y > 0) and (X < Width) and (Y < Height) then
  begin
    SetCapture(Handle);
    tmrHide.Enabled := False;
  end
  else
  begin
    ReleaseCapture;
    tmrHide.Enabled := False;
    Hide;
  end;

end;

end.
