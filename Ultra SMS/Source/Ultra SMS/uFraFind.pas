unit uFraFind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ImgList, StdCtrls, ComCtrls, Buttons;

type
  TfraFind = class(TFrame)
    lblLocation: TLabel;
    icbLocation: TComboBoxEx;
    iltFolder: TImageList;
    chkContact: TCheckBox;
    mmoContact: TMemo;
    lblInfo: TLabel;
    chkContent: TCheckBox;
    mmoContent: TMemo;
    lblInfo2: TLabel;
    dtpTimeAfter: TDateTimePicker;
    lblTimeAfter: TLabel;
    dtpTimeBefore: TDateTimePicker;
    lblTimeBefore: TLabel;
    chkReaded: TCheckBox;
    chkTransmitted: TCheckBox;
    chkReplied: TCheckBox;
    btnFind: TBitBtn;
    btnStop: TBitBtn;
    pbFind: TProgressBar;
    procedure chkContactClick(Sender: TObject);
    procedure chkContentClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SMSFindStateChanged(Total, Current: Integer);
    procedure SMSFindCompleted;
  end;

implementation

uses
  UserInterfaces, GerneralFunc;

{$R *.dfm}

procedure TfraFind.chkContactClick(Sender: TObject);
begin
  mmoContact.Enabled := chkContact.Checked;
  lblInfo.Enabled := chkContact.Checked;

  if not chkContact.Checked then
    mmoContact.Color := clBtnFace
  else
    mmoContact.Color := clWindow;
end;

procedure TfraFind.chkContentClick(Sender: TObject);
begin
  mmoContent.Enabled := chkContent.Checked;
  lblInfo2.Enabled := chkContent.Checked;

  if not chkContent.Checked then
    mmoContent.Color := clBtnFace
  else
    mmoContent.Color := clWindow;
end;

procedure TfraFind.btnFindClick(Sender: TObject);
begin
  AFindSession.Box := TCurrentView(icbLocation.ItemIndex);
  AFindSession.DataSource := frmMain.adoSMS;

  if chkContact.Checked then
    AFindSession.Contact := SplitString(mmoContact.Text, '|')
  else
    AFindSession.Contact.Clear;

  if chkContent.Checked then
    AFindSession.Content := SplitString(mmoContent.Text, '|')
  else
    AFindSession.Content.Clear;

  AFindSession.EnableTimeBefore := dtpTimeBefore.Checked;
  AFindSession.EnableTimeAfter := dtpTimeAfter.Checked;
  AFindSession.TimeBefore := dtpTimeBefore.Date;
  AFindSession.TimeAfter := dtpTimeAfter.Date;
  AFindSession.Read := chkReaded.State;
  AFindSession.Replied := chkReplied.State;
  AFindSession.Transmitted := chkTransmitted.State;
  AFindSession.Suspended := False;
  AFindSession.OnProgressUpdated := SMSFindStateChanged;
  AFindSession.OnProgressCompleted := SMSFindCompleted;
  btnFind.Enabled := False;
  btnStop.Enabled := True; 
end;

procedure TfraFind.SMSFindStateChanged(Total, Current: Integer);
begin
  pbFind.Max := Total;
  pbFind.Position := Current;
end;

procedure TfraFind.SMSFindCompleted;
begin
  btnFind.Enabled := True;
  btnStop.Enabled := False;

  if Assigned(frmMain.tvwFolder.Selected) and
    (frmMain.tvwFolder.Selected.ImageIndex = 7) then
  begin
    frmMain.RefreshView;

    if frmMain.vstSMS.TotalCount > 0 then
    begin
      frmMain.vstSMS.Selected[frmMain.vstSMS.GetFirst] := True;
      frmMain.vstSMS.FocusedNode := frmMain.vstSMS.GetFirst;
    end;
  end;
end;

procedure TfraFind.btnStopClick(Sender: TObject);
begin
  AFindSession.Canceled := True;
end;

end.
