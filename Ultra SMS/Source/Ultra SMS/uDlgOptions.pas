unit uDlgOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Configuration;

type
  TdlgOption = class(TForm)
    btnOKBtn: TBitBtn;
    btnCancelBtn: TBitBtn;
    grpNewSMG: TGroupBox;
    chkShowNewMSG: TCheckBox;
    chkNoShowFull: TCheckBox;
    tabOption: TPageControl;
    tsGeneral: TTabSheet;
    tsNewSMS: TTabSheet;
    chkShowFocus: TCheckBox;
    grpQueryState: TGroupBox;
    chkAutoQuery: TCheckBox;
    lblQueryInterval: TLabel;
    txtAutoInterval: TEdit;
    udAutoInterval: TUpDown;
    chkAutoDisconnect: TCheckBox;
    grpGeneral: TGroupBox;
    lblValidityPeriod: TLabel;
    lblPageItems: TLabel;
    chkStartConn: TCheckBox;
    chkErrorReconnect: TCheckBox;
    chkDelphone: TCheckBox;
    chkDelDraft: TCheckBox;
    cboValidityPeriod: TComboBox;
    cboPageItems: TComboBox;
    grpTimeInterval: TGroupBox;
    lblConnTimeout: TLabel;
    lblTaskInterval: TLabel;
    lblCallbackInterval: TLabel;
    lblConnectWait: TLabel;
    lblAutoRead: TLabel;
    txtConnTimeout: TEdit;
    txtTaskInterval: TEdit;
    txtCallbackInterval: TEdit;
    txtConnectWait: TEdit;
    txtAutoRead: TEdit;
    udAutoRead: TUpDown;
    udTaskInterval: TUpDown;
    udConnTimeout: TUpDown;
    udConnectWait: TUpDown;
    udCallbackInterval: TUpDown;
    chkBattery: TCheckBox;
    chkSignal: TCheckBox;
    grpDisconnect: TGroupBox;
    lblTrailTime: TLabel;
    txtTrailTime: TEdit;
    udTrailTime: TUpDown;
    chkRestart: TCheckBox;
    lblReconInterval: TLabel;
    txtReconInterval: TEdit;
    udReconInterval: TUpDown;
    chkReconnect: TCheckBox;
    chkShowTrayIcon: TCheckBox;
    chkFromPhonebook: TCheckBox;
    tsInstructionset: TTabSheet;
    grpInstructionSet: TGroupBox;
    rbISMMGL: TRadioButton;
    rbISCMGLPDU: TRadioButton;
    rbISCMGLTEXT: TRadioButton;
    lblcmgltxt: TLabel;
    lblcmglpdu: TLabel;
    lblmmgl: TLabel;
    chkMSGReport: TCheckBox;
    rgQueryMode: TRadioGroup;
    chkLocalTime: TCheckBox;
    chkIgnoreReport: TCheckBox;
    chkDeleteReport: TCheckBox;
    grpLongSMS: TGroupBox;
    chkLongSMS: TCheckBox;
    lblLongSMS: TLabel;
    chkRepliedReceive: TCheckBox;
    chkPhoneBookUCS2: TCheckBox;
    grpPreset: TGroupBox;
    lblCategory: TLabel;
    cboCategory: TComboBox;
    cboModel: TComboBox;
    lblModel: TLabel;
    btnLoadPreset: TBitBtn;
    btnSavePreset: TBitBtn;
    lblAlert: TLabel;
    txtAlert: TEdit;
    udAlert: TUpDown;
    chkSEPhoneBook: TCheckBox;
    chkAlphaNew: TCheckBox;
    sldAlphaBlendValue: TTrackBar;
    chkWritePhoneMemory: TCheckBox;
    procedure txtConnTimeoutKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelBtnClick(Sender: TObject);
    procedure btnOKBtnClick(Sender: TObject);
    procedure chkShowNewMSGClick(Sender: TObject);
    procedure chkDelphoneClick(Sender: TObject);
    procedure cboPageItemsKeyPress(Sender: TObject; var Key: Char);
    procedure chkAutoQueryClick(Sender: TObject);
    procedure chkReconnectClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cboCategorySelect(Sender: TObject);
    procedure btnLoadPresetClick(Sender: TObject);
    procedure btnSavePresetClick(Sender: TObject);
    procedure chkBatteryClick(Sender: TObject);
    procedure chkAlphaNewClick(Sender: TObject);
  private
    { Private declarations }
    config: TConfig;
    procedure ReadOptions;
    procedure SaveOptions;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  GerneralFunc, UserInterfaces;


procedure TdlgOption.txtConnTimeoutKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := SetNumeric(Key);
end;


procedure TdlgOption.FormCreate(Sender: TObject);
begin
  // 读取预设配置
  config := TConfig.Create;
  config.SaveConfiguration('(Internal)', '(Current)');
  cboCategory.Items.Assign(config.EnumCategory);

  if cboCategory.Items.Count > 0 then
  begin
    cboCategory.ItemIndex := 0;
    cboCategorySelect(nil);
  end;

  ReadOptions;
  tabOption.ActivePageIndex := 0;
end;

procedure TdlgOption.btnCancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TdlgOption.btnOKBtnClick(Sender: TObject);
begin
  SaveOptions;
  Close;
end;

procedure TdlgOption.chkShowNewMSGClick(Sender: TObject);
begin
  chkNoShowFull.Enabled := chkShowNewMSG.Checked;
  chkShowFocus.Enabled := chkShowNewMSG.Checked;
end;

procedure TdlgOption.chkDelphoneClick(Sender: TObject);
begin
  chkDelDraft.Enabled := chkDelphone.Checked;
end;

procedure TdlgOption.cboPageItemsKeyPress(Sender: TObject; var Key: Char);
begin
  if not ((Key = #8) or ((key >= #48) and (key <= #57))) then
    Key := #0;
end;

procedure TdlgOption.chkAlphaNewClick(Sender: TObject);
begin
  sldAlphaBlendValue.Enabled := chkAlphaNew.Checked;
end;

procedure TdlgOption.chkAutoQueryClick(Sender: TObject);
begin
  lblQueryInterval.Enabled := chkAutoQuery.Checked;
  txtAutoInterval.Enabled := chkAutoQuery.Checked;
  udAutoInterval.Enabled := chkAutoQuery.Checked;
end;

procedure TdlgOption.chkReconnectClick(Sender: TObject);
begin
  lblTrailTime.Enabled := chkReconnect.Checked;
  txtTrailTime.Enabled := chkReconnect.Checked;
  udTrailTime.Enabled := chkReconnect.Checked;
  chkRestart.Enabled := chkReconnect.Checked;
  lblReconInterval.Enabled := chkReconnect.Checked;
  txtReconInterval.Enabled := chkReconnect.Checked;
  udReconInterval.Enabled := chkReconnect.Checked;
end;

procedure TdlgOption.ReadOptions;
begin
  chkErrorReconnect.Checked := opAutoReconnect;
  chkStartConn.Checked := opStartConnect;
  udCallbackInterval.Position := opCallbackInterval;
  udConnectWait.Position := opConnnectTimeout;
  udConnTimeout.Position := opConnnectTimeout;
  udTaskInterval.Position := opTaskInterval;
  udAutoRead.Position := opAutoRead;
  chkShowNewMSG.Checked := opShowNewMSG;
  chkShowFocus.Checked := opShowFocus;
  chkNoShowFull.Checked := opShowNoFullScreen;
  chkDelphone.Checked := opDelMessage;
  chkDelDraft.Checked := opDelDraft;
  cboPageItems.Text := IntToStr(opSPItemCount);
  chkAutoDisconnect.Checked := opQSAutoDisconnect;
  chkBattery.Checked := opQSBattery;
  chkSignal.Checked := opQSSignal;
  udAutoInterval.Position := opQSInterval;
  udAlert.Position := opQSAlert;
  chkAutoQuery.Checked := opQSAutoQueryState;
  chkReconnect.Checked := opDCReconnect;
  udTrailTime.Position := opDCReconTime;
  udReconInterval.Position := opDCReconInterval;
  chkRestart.Checked := opDCRestart;
  chkShowTrayIcon.Checked := opShowTrayIcon;
  chkFromPhonebook.Checked := opFromPhonebook;
  chkDeleteReport.Checked := opDeleteReport;
  chkRepliedReceive.Checked := opRepliedReceive; 

  chkMSGReport.Checked := wsReport;

  rbISCMGLTEXT.Checked := opIScmgl = 0;
  rbISCMGLPDU.Checked := opIScmgl = 1;
  rbISMMGL.Checked := opIScmgl = 2;

  rgQueryMode.ItemIndex := opQueryNewModel;

  chkLocalTime.Checked := opLocalTime;
  chkIgnoreReport.Checked := opReceiveReportOnlyNew;

  chkDelphoneClick(nil);
  chkShowNewMSGClick(nil);
  chkAutoQueryClick(nil);
  chkBatteryClick(nil);
  chkReconnectClick(nil);

  case opValidityPeriod of
    11: cboValidityPeriod.ItemIndex := 0;
    29: cboValidityPeriod.ItemIndex := 1;
    71: cboValidityPeriod.ItemIndex := 2;
    143: cboValidityPeriod.ItemIndex := 3;
    167: cboValidityPeriod.ItemIndex := 4;
    196: cboValidityPeriod.ItemIndex := 5;
  else cboValidityPeriod.ItemIndex := 6;
  end;

  chkLongSMS.Checked := opLongSMS;
  chkPhoneBookUCS2.Checked := opSEPhoneBookUCS2;
  chkSEPhoneBook.Checked := opSEPhoneBookSuffix;
  chkWritePhoneMemory.Checked := opWritePhoneMemoy;

  chkAlphaNew.Checked := opNWAlphaBlend;
  sldAlphaBlendValue.Position := opNWAlphaValue;

  chkAlphaNewClick(nil);

end;

procedure TdlgOption.FormDestroy(Sender: TObject);
begin
  config.Free;
end;

procedure TdlgOption.cboCategorySelect(Sender: TObject);
begin
  cboModel.Items.Assign(config.EnumModel(cboCategory.Text));
  if cboModel.Items.Count > 0 then
    cboModel.ItemIndex := 0;
end;

procedure TdlgOption.btnLoadPresetClick(Sender: TObject);
begin
  config.LoadConfiguration(cboCategory.Text, cboModel.Text);
  ReadOptions;
  config.LoadConfiguration('(Internal)', '(Current)');
end;

procedure TdlgOption.btnSavePresetClick(Sender: TObject);
var
  index: Integer;
begin
  if (cboCategory.Items.IndexOf(cboCategory.Text) >= 0)
    and (cboModel.Items.IndexOf(cboModel.Text) >= 0) then
    if MessageBox(Handle,
      PChar(Format('类型为“%s”型号为“%s”的预设已经存在，即将覆盖该预设。',
      [cboCategory.Text, cboModel.Text ])), '保存预设',
      MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) =
      IDCANCEL then
      Exit;

  SaveOptions;
  config.SaveConfiguration(cboCategory.Text,cboModel.Text);
  config.LoadConfiguration('(Internal)', '(Current)');

  // 选择项目
  cboCategory.Items.Assign(config.EnumCategory);
  cboCategory.ItemIndex := cboCategory.Items.IndexOf(cboCategory.Text);
  cboModel.Items.Assign(config.EnumModel(cboCategory.Text));
  cboModel.ItemIndex := cboModel.Items.IndexOf(cboModel.Text);
end;

procedure TdlgOption.chkBatteryClick(Sender: TObject);
begin
  lblAlert.Enabled := chkBattery.Checked;
  txtAlert.Enabled := chkBattery.Checked;
  udAlert.Enabled := chkBattery.Checked;
end;

procedure TdlgOption.SaveOptions;
begin
  opAutoReconnect := chkErrorReconnect.Checked;
  opCallbackInterval := udCallbackInterval.Position;
  opConnnectTimeout := udConnectWait.Position;
  opConnnectTimeout := udConnTimeout.Position;
  opStartConnect := chkStartConn.Checked;
  opTaskInterval := udTaskInterval.Position;
  opAutoRead := udAutoRead.Position;
  opShowNewMSG := chkShowNewMSG.Checked;
  opShowFocus := chkShowFocus.Checked;
  opShowNoFullScreen := chkNoShowFull.Checked;
  opDelMessage := chkDelphone.Checked;
  opDelDraft := chkDelDraft.Checked;
  opQSAutoDisconnect := chkAutoDisconnect.Checked;
  opQSBattery := chkBattery.Checked;
  opQSSignal := chkSignal.Checked;
  opQSInterval := udAutoInterval.Position;
  opQSAlert := udAlert.Position;
  opQSAutoQueryState := chkAutoQuery.Checked;
  opDCReconnect := chkReconnect.Checked;
  opDCReconTime := udTrailTime.Position;
  opDCReconInterval := udReconInterval.Position;
  opDCRestart := chkRestart.Checked;
  opShowTrayIcon := chkShowTrayIcon.Checked;
  opFromPhonebook := chkFromPhonebook.Checked;
  wsReport := chkMSGReport.Checked;
  opQueryNewModel := rgQueryMode.ItemIndex;
  opLocalTime := chkLocalTime.Checked;
  opReceiveReportOnlyNew := chkIgnoreReport.Checked;
  opDeleteReport := chkDeleteReport.Checked;
  opRepliedReceive := chkRepliedReceive.Checked;

  frmMain.tmrReconnect.Interval := udReconInterval.Position;
  frmMain.tmrQueryState.Enabled := chkAutoQuery.Checked;

  if IntToStr(opSPItemCount) <> cboPageItems.Text then
  begin  
    opSPItemCount := StrToIntDef(cboPageItems.Text, 100);
    frmMain.RefreshView;
  end;    

  if rbISCMGLTEXT.Checked then opIScmgl := 0
  else if rbISCMGLPDU.Checked then opIScmgl := 1
  else opIScmgl := 2;

  case cboValidityPeriod.ItemIndex of
    0: opValidityPeriod := 11;
    1: opValidityPeriod := 29;
    2: opValidityPeriod := 71;
    3: opValidityPeriod := 143;
    4: opValidityPeriod := 167;
    5: opValidityPeriod := 196;
  else opValidityPeriod := 255;
  end;

  opLongSMS := chkLongSMS.Checked;
  opSEPhoneBookUCS2 := chkPhoneBookUCS2.Checked;
  opSEPhoneBookSuffix := chkSEPhoneBook.Checked;
  opWritePhoneMemoy := chkWritePhoneMemory.Checked;
  opNWAlphaBlend := chkAlphaNew.Checked;
  opNWAlphaValue := sldAlphaBlendValue.Position;
end;

end.


