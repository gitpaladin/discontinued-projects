unit untConnect;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, untSelModem, Registry, ComCtrls, untTestPort,
  untwizOption, uniwizAddition, SPComm, ShellAPI, GerneralFunc;

type
  TwizConnect = class(TForm)
    btnPrevious: TBitBtn;
    btnNext: TBitBtn;
    btnFinish: TBitBtn;
    btnCancel: TBitBtn;
    btnHelp: TBitBtn;
    shpTitle: TShape;
    bvlBottom: TBevel;
    bvlTop: TBevel;
    lblTitle: TLabel;
    lblInfo: TLabel;
    imgTitle: TImage;
    fraSelectModem: TfraSelectModem;
    fraTestPort: TfraTestPort;
    fraOption: TfrawizOption;
    fraAdditionTask: TfraAdditionTask;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnFinishClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnHelpClick(Sender: TObject);
    procedure fraSelectModemlvwModemChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    { Private declarations }
    CurrentPage: Integer;
    Titles: array[1..4] of String;
    Hits: array[1..4] of String;
    FOnClosing: Boolean;
    FOriPortList: TPortList;
    FOriByteSize: TByteSize;
    FOriSpeed: Cardinal;
    FOriStopBits: TStopBits;
    FOriParity: TParity;
    Ok: Boolean;
    procedure ShowPage;
    procedure CheckPage;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
uses
  UserInterfaces, Configuration, DGL_String;

procedure TwizConnect.btnCancelClick(Sender: TObject);
begin
  FOnClosing := True;
  Close; 
end;

procedure TwizConnect.FormCreate(Sender: TObject);
begin
  // 标题初始化
  Titles[1] := '选择调制解调器';
  Titles[2] := '测试调制解调器';
  Titles[3] := '配置您的调制解调器';
  Titles[4] := '其它附加的任务';

  // 提示初始化
  Hits[1] := '当您的您的移动电话和电脑连接的时候，电脑会提示您找到一个新硬件，它一般是一个调制解调器，您需要安装这个调制解调器的驱动程序。如果您是使用蓝牙调制解调器，还必须安装蓝牙附送的软件。';
  Hits[2] := '现在对您的调制解调器进行测试，测试内容主要就是看时候您的手机支持使用 GSM 标准，是否可以与电脑通信。';
  Hits[3] := '这个界面是用来配置您的调制解调器的，如果您不懂是什么东西，您完全可以不用配置，因为使用默认的设置，程序都可以工作得很好。';
  Hits[4] := '当您配置好设置之后，可以通过一下附加的功能来立刻从移动电话中读取信息。';

  // 添加相关的信息
  fraSelectModem.btnRefreshClick(nil);
  fraAdditionTask.RefreshCategory;

  // 存储数据
  FOriPortList.Index := PortList.Index;
  FOriPortList.PortList := TStringList.Create;
  FOriPortList.PortList.Assign(PortList.PortList);

  FOriSpeed := frmMain.cmModem.BaudRate;
  FOriByteSize := frmMain.cmModem.ByteSize;
  FOriStopBits := frmMain.cmModem.StopBits;
  FOriParity := frmMain.cmModem.Parity;

  // 显示页面
  CurrentPage := 1;
  ShowPage;

  SetListViewStyleVista(fraTestPort.lvwResult);
end;

procedure TwizConnect.fraSelectModemlvwModemChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  if Change = ctState then
    if not FOnClosing then
      CheckPage;
end;

procedure TwizConnect.ShowPage;
begin
  fraSelectModem.Visible := False;
  fraTestPort.Visible := False;
  fraOption.Visible := False;
  fraAdditionTask.Visible := False;
  lblTitle.Caption := Titles[CurrentPage];
  lblInfo.Caption := Hits[CurrentPage];

  case CurrentPage of
    1: fraSelectModem.Visible := True;
    2: fraTestPort.Visible := True;
    3: fraOption.Visible := True;
    4: fraAdditionTask.Visible := True;
  end;

  Application.ProcessMessages;
  CheckPage;
end;

procedure TwizConnect.CheckPage;
  function IsChecked(AListView: TListView): Boolean;
  var
    i: Cardinal;
  begin
    if AListView.Items.Count = 0 then
    begin
      Result := False;
      Exit;
    end;

    for i := 0 to AListView.Items.Count - 1 do
      if AListView.Items[i].Checked then
      begin
        Result := True;
        Exit;
      end;

      Result := False;
  end;

begin
  btnPrevious.Enabled := (CurrentPage > 1);
  btnNext.Enabled := (CurrentPage < High(Titles));
  btnFinish.Enabled := (CurrentPage = High(Titles));

  case CurrentPage of
    1:  btnNext.Enabled := IsChecked(fraSelectModem.lvwModem);
    2:
    begin
      btnNext.Enabled := False;
      btnNext.Enabled := fraTestPort.DoMultipleTest;
    end;
  end;

end;

procedure TwizConnect.btnNextClick(Sender: TObject);

  function GetAllPorts: string;
  var
    ssPortNames: TStrSet;
    i: Cardinal;
    itr: _IIterator;
  begin
    ssPortNames := TStrSet.Create;
    Result := '';

    for i := 0 to fraSelectModem.lvwModem.Items.Count - 1 do
      if fraSelectModem.lvwModem.Items[i].Checked then
        ssPortNames.Insert(fraSelectModem.lvwModem.Items[i].SubItems[0]);

    itr := ssPortNames.ItBegin;

    while not itr.IsEqual(ssPortNames.ItEnd) do
    begin
      if Result = '' then
        Result := itr.GetValue
      else
        Result := Result + STPortDelimiter + itr.GetValue;
      itr.Next;
    end;
  end;

begin
  case CurrentPage of
    1:
    begin
      fraTestPort.Port := GetAllPorts;

      if fraTestPort.Port = '' then
      begin
        MessageBox(Handle,
          '您未选择一个端口，如果要测试连接，您必须选中至少一个端口。',
          '选择端口', MB_OK + MB_ICONSTOP);
        Exit;
      end;
    end;
    2: fraOption.SetBaudrateList(fraTestPort.BaudRates);
  end;

  Inc(CurrentPage);
  ShowPage;
end;

procedure TwizConnect.btnPreviousClick(Sender: TObject);
begin
  // 上一步
  if CurrentPage = 3 then Dec(CurrentPage);
  Dec(CurrentPage);
  ShowPage; 
end;

procedure TwizConnect.btnFinishClick(Sender: TObject);
var
  config: TConfig;
begin
  // 读取配置文件
  if fraAdditionTask.chkEnablePreset.Checked then
  begin
    config := TConfig.Create;
    config.LoadConfiguration(
      fraAdditionTask.cboCategory.Text,
      fraAdditionTask.cboModel.Text);
    config.Free;
  end;

  // 完成任务
  frmMain.lvwPhoneInfo.Items[0].SubItems[0] := fraTestPort.IMEI;
  frmMain.lvwPhoneInfo.Items[1].SubItems[0] := fraTestPort.IMSI;
  frmMain.lvwPhoneInfo.Items[2].SubItems[0] := fraTestPort.PhoneSoft;
  frmMain.lvwPhoneInfo.Items[3].SubItems[0] := fraTestPort.InfoCentre;
  frmMain.lvwPhoneInfo.Items[4].SubItems[0] := fraTestPort.PhoneNumber;
  frmMain.cmModem.BaudRate := StrToInt(fraOption.lvwBaudRate.Selected.Caption);
  frmMain.cmModem.ByteSize := TByteSize(fraOption.rgByteSize.ItemIndex);
  frmMain.cmModem.Parity := TParity(fraOption.rgParityCheck.ItemIndex);
  frmMain.cmModem.ParityCheck := (fraOption.rgByteSize.ItemIndex > 0);
  frmMain.cmModem.StopBits := TStopBits(fraOption.rgStopBits.ItemIndex);
  PortList.Index := 0;
  PortList.PortList := SplitString(fraTestPort.Port, STPortDelimiter);
  OpenPortDef;
  FOnClosing := True;

  // 添加附加任务
  JobThread.InfoCenter := fraTestPort.InfoCentre;

  if fraAdditionTask.chkPhoneBook.State = cbChecked then
    JobThread.JobContent.AddReadPhonebBook;

  if fraAdditionTask.chkSMS.State = cbChecked then
    JobThread.JobContent.AddReceiveJob;

  // 保存本机设置
  if fraOption.chkSaveToLocal.Checked then
    frmMain.SaveConnectionSettings;

  // 关闭对话框
  Ok := True;
  Close;

  if JobThread.JobContent.Count > 0 then
    JobThread.Suspended := False;


end;

procedure TwizConnect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not OK then
  begin
    frmMain.cmModem.ByteSize := FOriByteSize;
    PortList.Index := FOriPortList.Index;
    PortList.PortList.Clear;
    PortList.PortList.AddStrings(FOriPortList.PortList);

    frmMain.cmModem.Parity := FOriParity;
    frmMain.cmModem.ParityCheck := FOriParity <> None;
    frmMain.cmModem.BaudRate := FOriSpeed;
    frmMain.cmModem.StopBits := FOriStopBits;
    frmMain.stbMain.Panels[2].Text := frmMain.cmModem.CommName + ' 已关闭';
  end;

  FOriPortList.PortList.Free;
end;

procedure TwizConnect.btnHelpClick(Sender: TObject);
var
  FileName: String;
begin
  // 给作者发邮件
  FileName := AppendPath(sPath, 'connect.pdf');

  if FileExists(FileName) then
    ShellExecute(Handle, 'open', PChar(FileName), nil, nil, SW_SHOW);
end;

end.
