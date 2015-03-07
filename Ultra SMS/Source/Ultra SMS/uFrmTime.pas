unit uFrmTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, CnAAFont, CnAACtrls;

const
  WM_QUERY_SUCCESSFUL = WM_USER + 471;

type
  TfrmTime = class(TForm)
    lblInfo: TLabel;
    bvlTop: TBevel;
    lblTitle: TLabel;
    imgTitle: TImage;
    btnCancel: TBitBtn;
    bvlBottom: TBevel;
    shpTitle: TShape;
    lblPCTimeInfo: TLabel;
    lblPhoneTimeInfo: TLabel;
    btnQuery: TBitBtn;
    btnToPhone: TBitBtn;
    btnToPC: TBitBtn;
    btnInternet: TBitBtn;
    lblResult: TLabel;
    tmrShowTime: TTimer;
    lblPCTime: TCnAALabel;
    lblPhoneTime: TCnAALabel;
    procedure CreateParams(var Params: TCreateParams);override;
    procedure btnQueryClick(Sender: TObject);
    procedure FReturnValue(var Message: TMessage); message WM_QUERY_SUCCESSFUL;
//    procedure FAPICloseWindow(var Message: TMessage); message WM_MSG_CLOSEWND;
    procedure tmrShowTimeTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnToPCClick(Sender: TObject);
    procedure btnToPhoneClick(Sender: TObject);
    procedure btnInternetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dPC: TDateTime;
    dPhone: TDateTime;
    bRequestResult: Boolean;
  end;

var
  frmTime: TfrmTime;

implementation

uses
  UserInterfaces, SMSJob, GerneralFunc;

{$R *.dfm}

procedure TfrmTime.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
end;

procedure TfrmTime.btnQueryClick(Sender: TObject);
var
  AJob: TSMSJob;
begin
  // 查询时间
  AJob := JobThread.JobContent.Add(jkQueryTime);
  AJob.ExtraInfo.JobKind := jkQueryTime;
  AJob.ExtraInfo.PPCTime := @dPC;
  AJob.ExtraInfo.PPhoneTime := @dPhone;
  AJob.ExtraInfo.PRequestResult := @bRequestResult;
  AJob.ExtraInfo.hWindow := Handle;
  if JobThread.Suspended then JobThread.Suspended := False;

  lblResult.Caption := '正在查询手机时间...';
  btnToPhone.Enabled := False;
  btnToPC.Enabled := False;
  btnQuery.Enabled := False;
end;

procedure TfrmTime.FReturnValue(var Message: TMessage);
begin
  if bRequestResult then
  begin
    tmrShowTimeTimer(nil);
    btnToPhone.Enabled := True;
    btnToPC.Enabled := True;
    btnQuery.Enabled := True;
    lblResult.Caption := '获取手机时间成功。';
    tmrShowTime.Enabled := True;
  end
  else
  begin
    btnQuery.Enabled := True;
    lblResult.Caption := '获取手机时间失败。';
    tmrShowTime.Enabled := False;
    lblPCTime.Caption := '';
    lblPhoneTime.Caption := '';
  end;
end;  
procedure TfrmTime.tmrShowTimeTimer(Sender: TObject);
var
  IntervaTime: Double;
begin
  // 显示时间
  IntervaTime := dPhone - dPC;
  lblPCTime.Caption := FormatDateTime('yyyy-mm-dd hh:mm:ss', Now);
  lblPhoneTime.Caption := FormatDateTime('yyyy-mm-dd hh:mm:ss', Now + IntervaTime);
end;

procedure TfrmTime.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    frmMain.DeleteWnd(Handle);
  finally
    Self.Release;
  end;
end;

procedure TfrmTime.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTime.FormCreate(Sender: TObject);
begin
  SetWindowIcon(Handle, IDI_BTIME, IDI_STIME);
  btnQuery.Click;
end;

procedure TfrmTime.btnToPCClick(Sender: TObject);
var
  dNewDate: TDateTime;
  dSysDate: TSystemTime;
begin
  // 同步到电脑
  dNewDate := dPhone - dPC + Now;
  DateTimeToSystemTime(dNewDate, dSysDate);
  if SetLocalTime(dSysDate) then
    lblResult.Caption := '设置系统时间成功。'
  else
    lblResult.Caption := '设置系统时间失败。';
end;

procedure TfrmTime.btnToPhoneClick(Sender: TObject);
begin
  JobThread.JobContent.Add(jkSetTime);
  if JobThread.Suspended then JobThread.Suspended := False;
end;

procedure TfrmTime.btnInternetClick(Sender: TObject);
var
  ARunThread: TRunCmd;
  Cmd: string;
begin
  Cmd := '"' + AppendPath(sPath, 'TimeFairy.exe') + '"';
  ARunThread := TRunCmd.Create(True);
  ARunThread.Cmd := Cmd;
  ARunThread.Suspended := False;
end;

end.
