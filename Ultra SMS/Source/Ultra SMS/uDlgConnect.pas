unit uDlgConnect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AppEvnts, untTestPort, StdCtrls, Buttons, SPComm, GerneralFunc;

type
  TdlgConnect = class(TForm)
    fraTestPort: TfraTestPort;
    lblPort: TLabel;
    grpHardware: TGroupBox;
    lblSpeed: TLabel;
    cboSpeed: TComboBox;
    lblDataBit: TLabel;
    cboDatabit: TComboBox;
    lblStopBit: TLabel;
    cboStopBit: TComboBox;
    lblDataVerify: TLabel;
    cboDataVerify: TComboBox;
    btnOKBtn: TBitBtn;
    btnCancelBtn: TBitBtn;
    txtPort: TEdit;
    chkSkipTest: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelBtnClick(Sender: TObject);
    procedure btnOKBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FOriPortList: TPortList;
    FOriByteSize: TByteSize;
    FOriSpeed: Cardinal;
    FOriStopBits: TStopBits;
    FOriParity: TParity;
    Ok: Boolean;
  public
    { Public declarations }
  end;

var
  dlgConnect: TdlgConnect;

implementation

{$R *.dfm}
uses
  UserInterfaces;

procedure TdlgConnect.FormCreate(Sender: TObject);
begin
  // 加载数据
  FOriPortList.Index := PortList.Index;
  FOriPortList.PortList := TStringList.Create;
  FOriPortList.PortList.Assign(PortList.PortList);
  FOriSpeed := frmMain.cmModem.BaudRate;
  FOriByteSize := frmMain.cmModem.ByteSize;
  FOriStopBits := frmMain.cmModem.StopBits;
  FOriParity := frmMain.cmModem.Parity;

  txtPort.Text := JoinStrings(PortList.PortList, STPortDelimiter);
  cboSpeed.ItemIndex := cboSpeed.Items.IndexOf(IntToStr(FOriSpeed));
  cboDatabit.ItemIndex := Ord(FOriByteSize);
  cboStopBit.ItemIndex := Ord(FOriStopBits);
  cboDataVerify.ItemIndex := Ord(FOriParity);

  SetListViewStyleVista(fraTestPort.lvwResult);
  Height := 202;
end;

procedure TdlgConnect.btnCancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TdlgConnect.btnOKBtnClick(Sender: TObject);
begin
  if chkSkipTest.Checked then
  begin
    PortList.Index := 0;
    PortList.PortList := SplitString(txtPort.Text, STPortDelimiter);
    frmMain.cmModem.ByteSize := TByteSize(cboDatabit.ItemIndex);
    frmMain.cmModem.CommName := txtPort.Text;
    frmMain.cmModem.Parity := TParity(cboDataVerify.ItemIndex);
    frmMain.cmModem.ParityCheck := cboDataVerify.ItemIndex <> 0;
    frmMain.cmModem.BaudRate := StrToInt(cboSpeed.Text);
    frmMain.cmModem.StopBits := TStopBits(cboStopBit.ItemIndex);
    Ok := True;
    Close;
  end
  else
  begin
    Height := 402;

    fraTestPort.lblInfo.Caption := '请稍后，程序正在测试您的调制解调器...';
    fraTestPort.lblInfo.Color := clBtnFace;
    fraTestPort.Visible := True;
    fraTestPort.Port := txtPort.Text;
    Application.ProcessMessages;

    frmMain.cmModem.ByteSize := TByteSize(cboDatabit.ItemIndex);
//    frmMain.cmModem.CommName := txtPort.Text;
    frmMain.cmModem.Parity := TParity(cboDataVerify.ItemIndex);
    frmMain.cmModem.ParityCheck := cboDataVerify.ItemIndex <> 0;
    frmMain.cmModem.BaudRate := StrToInt(cboSpeed.Text);
    frmMain.cmModem.StopBits := TStopBits(cboStopBit.ItemIndex);

    if fraTestPort.DoMultipleTest(False) then
    begin
      fraTestPort.lblInfo.Caption := '测试成功';
      fraTestPort.lblInfo.Color := clGreen;

      if MessageBox(Handle, '连接测试成功，你是否要应用这些设置到程序中？',
        PChar(Application.Title), MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        PortList.Index := 0;
        PortList.PortList := SplitString(fraTestPort.Port, STPortDelimiter);
        frmMain.lvwPhoneInfo.Items[0].SubItems[0] := fraTestPort.IMEI;
        frmMain.lvwPhoneInfo.Items[1].SubItems[0] := fraTestPort.IMSI;
        frmMain.lvwPhoneInfo.Items[2].SubItems[0] := fraTestPort.PhoneSoft;
        frmMain.lvwPhoneInfo.Items[3].SubItems[0] := fraTestPort.InfoCentre;
        frmMain.lvwPhoneInfo.Items[4].SubItems[0] := fraTestPort.PhoneNumber;
        Ok := True;
        Close;
      end;
    end
    else
    begin
      fraTestPort.lblInfo.Caption := '测试失败';
      fraTestPort.lblInfo.Color := clRed;
      MessageBox(Handle,
        '连接测试失败，您可能要查阅您的硬件资料，然后再试一次。',
        PChar(Application.Title), MB_OK + MB_ICONWARNING);
    end;
  end;    

end;

procedure TdlgConnect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not OK then
  begin
    PortList.Index := FOriPortList.Index;
    PortList.PortList.Clear;
    PortList.PortList.AddStrings(FOriPortList.PortList);

    frmMain.cmModem.ByteSize := FOriByteSize;
    frmMain.cmModem.CommName := FOriPortList.PortList[FOriPortList.Index];
    frmMain.cmModem.Parity := FOriParity;
    frmMain.cmModem.ParityCheck := FOriParity <> None;
    frmMain.cmModem.BaudRate := FOriSpeed;
    frmMain.cmModem.StopBits := FOriStopBits;
    frmMain.stbMain.Panels[2].Text := frmMain.cmModem.CommName + ' 已关闭';
  end;

  FOriPortList.PortList.Free;
end;

end.
