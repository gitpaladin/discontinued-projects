unit uFrmRemoveSMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Spin, CommCtrl;

type
  TfrmRemoveSMS = class(TForm)
    shpTitle: TShape;
    bvlTop: TBevel;
    lblTitle: TLabel;
    imgTitle: TImage;
    bvlBottom: TBevel;
    lblInfo: TLabel;
    btnCancel: TBitBtn;
    btnFinish: TBitBtn;
    grpMethod: TGroupBox;
    rbKeepPercent: TRadioButton;
    sldKeepPercent: TTrackBar;
    rbKeepNumber: TRadioButton;
    sldKeepNumber: TTrackBar;
    rbKeepDate: TRadioButton;
    dtpKeepDate: TDateTimePicker;
    rbKeepDay: TRadioButton;
    udKeepday: TUpDown;
    txtKeepDay: TEdit;
    grpLocation: TGroupBox;
    chkUnread: TCheckBox;
    chkRead: TCheckBox;
    chkSent: TCheckBox;
    chkDraft: TCheckBox;
    lblKeepPercent: TLabel;
    lblKeepNumber: TLabel;
    procedure CreateParams(var Params: TCreateParams);override;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbKeepPercentClick(Sender: TObject);
    procedure btnFinishClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sldKeepNumberChange(Sender: TObject);
    procedure sldKeepPercentChange(Sender: TObject);
  private
    { Private declarations }
    procedure FDisableTrackBarSetRange(var ATrackBar: TTrackBar);
  public
    { Public declarations }
  end;

implementation

uses
  GerneralFunc, SMSJob, UserInterfaces;

{$R *.dfm}

procedure TfrmRemoveSMS.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
end;

procedure TfrmRemoveSMS.FDisableTrackBarSetRange(var ATrackBar: TTrackBar);
var
  lOldStyle: Integer;
begin
  lOldStyle := GetWindowLong(ATrackBar.Handle, GWL_STYLE);
  lOldStyle := lOldStyle and not TBS_ENABLESELRANGE;
  SetWindowLong(ATrackBar.Handle, GWL_STYLE, lOldStyle);
end;  

procedure TfrmRemoveSMS.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRemoveSMS.FormCreate(Sender: TObject);
var
  lStyle: Integer;
begin
  SetWindowIcon(Handle, IDI_BCLEANUP, IDI_SCLEANUP);

  FDisableTrackBarSetRange(sldKeepPercent);
  FDisableTrackBarSetRange(sldKeepNumber);

  lStyle := GetWindowLong(txtKeepDay.Handle, GWL_STYLE);
  lStyle := lStyle or ES_NUMBER or ES_RIGHT;
  SetWindowLong(txtKeepDay.Handle, GWL_STYLE, lStyle);

  lStyle := GetWindowLong(udKeepday.Handle, GWL_STYLE);
  lStyle := lStyle or UDS_ALIGNRIGHT or UDS_HOTTRACK or UDS_WRAP;
  SetWindowLong(udKeepday.Handle, GWL_STYLE, lStyle);

  case opRMKeepType of
  0: rbKeepPercent.Checked := True;
  1: rbKeepNumber.Checked := True;
  2: rbKeepDate.Checked := True;
  3: rbKeepDay.Checked := True;
  end;

  sldKeepPercent.Position := opRMKeepPercent;
  sldKeepNumber.Position := opRMKeepNumber;
  dtpKeepDate.Date := opRMKeepDate;
  txtKeepDay.Text := IntToStr(opRMKeepDay);
  chkRead.Checked := opRMHandleREAD;
  chkUnread.Checked := opRMHandleUNREAD;
  chkSent.Checked := opRMHandleSent;
  chkDraft.Checked := opRMHandleDraft;

  rbKeepPercentClick(nil);
  sldKeepNumberChange(nil);
  sldKeepPercentChange(nil);

end;

procedure TfrmRemoveSMS.rbKeepPercentClick(Sender: TObject);
begin
  rbKeepDate.Enabled := not (chkSent.Checked or chkDraft.Checked);
  rbKeepDay.Enabled := not (chkSent.Checked or chkDraft.Checked);

  if (not rbKeepDate.Enabled) and (rbKeepDate.Checked) then rbKeepNumber.Checked := True;
  if (not rbKeepDay.Enabled) and (rbKeepDay.Checked) then rbKeepNumber.Checked := True;

  sldKeepPercent.Enabled := rbKeepPercent.Checked;
  sldKeepNumber.Enabled :=  rbKeepNumber.Checked;
  dtpKeepDate.Enabled := rbKeepDate.Checked;
  txtKeepDay.Enabled := rbKeepDay.Checked;
  udKeepday.Enabled := rbKeepDay.Checked;

  btnFinish.Enabled := chkUnread.Checked or chkRead.Checked or chkSent.Checked or chkDraft.Checked;

end;

procedure TfrmRemoveSMS.btnFinishClick(Sender: TObject);
var
  ANewJob: TSMSJob;
begin
  ANewJob := JobThread.JobContent.Add(jkRemoveSMS);

  ANewJob.ExtraInfo.JobKind := jkRemoveSMS;
  ANewJob.ExtraInfo.RemoveUNREAD := chkUnread.Checked;
  ANewJob.ExtraInfo.RemoveREAD := chkRead.Checked;
  ANewJob.ExtraInfo.RemoveDraft := chkDraft.Checked;
  ANewJob.ExtraInfo.RemoveSent := chkSent.Checked;
  ANewJob.ExtraInfo.KPDDate := dtpKeepDate.Date;

  opRMHandleREAD := chkRead.Checked;
  opRMHandleUNREAD := chkUnread.Checked;
  opRMHandleSent := chkSent.Checked;
  opRMHandleDraft := chkDraft.Checked;

  if rbKeepPercent.Checked then
  begin
    ANewJob.ExtraInfo.KeepKind := rskKeepPercent;
    ANewJob.ExtraInfo.KPPercent := sldKeepPercent.Position / 100.0;
    opRMKeepPercent := sldKeepPercent.Position;
    opRMKeepType := 0;
  end
  else if rbKeepNumber.Checked then
  begin
    ANewJob.ExtraInfo.KeepKind := rskKeepNumber;
    ANewJob.ExtraInfo.KPNumber := sldKeepNumber.Position;
    opRMKeepNumber := sldKeepNumber.Position;
    opRMKeepType := 1;
  end
  else if rbKeepDate.Checked then
  begin
    ANewJob.ExtraInfo.KeepKind := rskKeepRecentDay;
    ANewJob.ExtraInfo.KPDDate := dtpKeepDate.Date;
    opRMKeepDate := dtpKeepDate.Date;
    opRMKeepType := 2;
  end
  else
  begin
    ANewJob.ExtraInfo.KeepKind := rskKeepDay;
    ANewJob.ExtraInfo.KPRDay := udKeepday.Position;
    opRMKeepDay := udKeepday.Position;
    opRMKeepType := 3;
  end;

  if JobThread.Suspended then JobThread.Suspended := False;

  Close;
end;

procedure TfrmRemoveSMS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    frmMain.DeleteWnd(Handle);
  finally
    Self.Release;
  end;
end;

procedure TfrmRemoveSMS.sldKeepNumberChange(Sender: TObject);
begin
  lblKeepNumber.Caption := IntToStr(sldKeepNumber.Position);
end;

procedure TfrmRemoveSMS.sldKeepPercentChange(Sender: TObject);
begin
  lblKeepPercent.Caption := IntToStr(sldKeepPercent.Position) + '%';
end;

end.
