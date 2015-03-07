unit untSelModem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ImgList, Buttons, Registry;

type
  TfraSelectModem = class(TFrame)
    stModem: TStaticText;
    lvwModem: TListView;
    iltModem: TImageList;
    btnOpenControlPanel: TBitBtn;
    btnRefresh: TBitBtn;
    btnNewModem: TBitBtn;
    procedure btnOpenControlPanelClick(Sender: TObject);
//    procedure lvwModemSelectItem(Sender: TObject; Item: TListItem;
//      Selected: Boolean);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnNewModemClick(Sender: TObject);
    procedure lvwModemCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure lvwModemColumnClick(Sender: TObject; Column: TListColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    SelCom: String ;
  end;

implementation

uses 
  GerneralFunc, StrUtils, DGL_Integer, WindowsRegistry, Math;
  
{$R *.dfm}
const
  sKey: string = 'SYSTEM\CurrentControlSet\Control\Class\{4D36E96D-E325-11CE-BFC1-08002BE10318}\%4.4d';
  sKeyRoot: string = 'SYSTEM\CurrentControlSet\Control\Class\{4D36E96D-E325-11CE-BFC1-08002BE10318}';
  sPort: string = 'SYSTEM\CurrentControlSet\Enum\Root\PORTS\%4.4d';
  sPortDev: string = 'SYSTEM\CurrentControlSet\Enum\Root\PORTS\%4.4d\Device Parameters';
  sUSBRoot: string = 'SYSTEM\CurrentControlSet\Enum\USB';

procedure TfraSelectModem.btnOpenControlPanelClick(Sender: TObject);
begin
  WinExec(PChar('rundll32.exe shell32.dll,Control_RunDLL telephon.cpl'), 0);
end;

//procedure TfraSelectModem.lvwModemSelectItem(Sender: TObject;
//  Item: TListItem; Selected: Boolean);
//var
//  rModem: TRegistry;
//begin
//  // 读取更详细的内容
//  rModem := TRegistry.Create;
//  try
//    rModem.RootKey := HKEY_LOCAL_MACHINE;
//    if Item.ImageIndex = 0 then
//    begin      
//      if rModem.OpenKeyReadOnly(Format(sKey, [Integer(Item.Data)])) then
//      begin
//        txtName.Text := rModem.ReadString('FriendlyName');
//        txtPort.Text := rModem.ReadString('AttachedTo');
//        txtDeviceID.Text := rModem.ReadString('MatchingDeviceId');
//        txtCompany.Text := rModem.ReadString('ProviderName');
//        txtDriver.Text := rModem.ReadString('DriverVersion');
//        txtReset.Text := rModem.ReadString('Reset');
//      end;
//
//      rModem.CloseKey;
//    end
//    else
//    begin
//      if rModem.OpenKeyReadOnly(Format(sPort, [Integer(Item.Data)])) then
//      begin
//        txtName.Text := rModem.ReadString('FriendlyName');
//        txtPort.Text := Item.SubItems[0];
//        txtDeviceID.Text := rModem.ReadString('ClassGUID');
//        txtCompany.Text := rModem.ReadString('Mfg');
//        txtDriver.Text := rModem.ReadString('Driver');
//        txtReset.Text := 'N/A';
//      end;
//
//      rModem.CloseKey;
//    end;
//  finally
//    rModem.Free;
//  end;
//end;

procedure TfraSelectModem.btnRefreshClick(Sender: TObject);
var
  rModem: TRegistry;
  rPort: TRegistry;
  xItem: TListItem;
  slSubItem: TStringList;
  slSubItem2: TStringList;
  sSubItem: string;
  viNumbers: TIntVector;
  i, j: Cardinal;
  sKeyPath: String;
  sSubKey: String;
  sRegBuffer: string;
begin
  // 添加相关的信息
  rModem := TRegistry.Create;
  slSubItem := TStringList.Create;
  viNumbers := TIntVector.Create;
  lvwModem.Items.Clear;

  // Modem 相关信息
  try
    rModem.RootKey := HKEY_LOCAL_MACHINE;

    if rModem.OpenKeyReadOnly(sKeyRoot) then
    begin;
      rModem.GetKeyNames(slSubItem);
      rModem.CloseKey;

      for i := 0 to slSubItem.Count - 1 do
        if StrToIntDef(slSubItem[i], -1) >= 0 then
          viNumbers.PushBack(StrToInt(slSubItem[i]));
    end;

    for i := 0 to viNumbers.Size - 1 do
      if rModem.OpenKeyReadOnly(Format(sKey, [viNumbers.Items[i]]))then
      begin
        xItem := lvwModem.Items.Add;
        xItem.ImageIndex := 0;
        xItem.Caption := '调制解调器';
        xItem.SubItems.Add(rModem.ReadString('AttachedTo'));
        xItem.SubItems.Add(rModem.ReadString('FriendlyName'));
        if i=0 then xItem.Selected := True;
        rModem.CloseKey;
      end;
  finally
    rModem.Free;
    slSubItem.Free;
    viNumbers.Free;
  end;

  // 端口相关信息
  rModem := TRegistry.Create;
  rPort := TRegistry.Create;
  try
    rModem.RootKey := HKEY_LOCAL_MACHINE;
    rPort.RootKey := HKEY_LOCAL_MACHINE;
    i:=0;

    while rModem.OpenKeyReadOnly(Format(sPort, [i])) and 
      rPort.OpenKeyReadOnly(Format(sPortDev, [i])) do
    begin
      xItem := lvwModem.Items.Add;
      xItem.ImageIndex := 1;
      xItem.Caption := '端口';
      xItem.SubItems.Add(rPort.ReadString('PortName'));
      xItem.SubItems.Add(rModem.ReadString('FriendlyName'));
      Inc(i);
      rModem.CloseKey;
      rPort.CloseKey;
    end;
  finally
    rModem.Free;
    rPort.Free;
  end;

  // USB 设备
  if RegEnumKeys(HKEY_LOCAL_MACHINE, sUSBRoot, sSubItem) then
  begin
    slSubItem := TStringList.Create;
    slSubItem2 := TStringList.Create;
    slSubItem.Text := sSubItem;

    for i := 0 to slSubItem.Count - 1 do
    begin
      sKeyPath := AppendPath(sUSBRoot, slSubItem[i]);

      if RegEnumKeys(HKEY_LOCAL_MACHINE, sKeyPath, sSubItem) then
      begin
        slSubItem2.Clear;
        slSubItem2.Text := sSubItem;
        j := 0;

        while j < slSubItem2.Count do
        begin
//          try
            sSubKey := AppendPath(sKeyPath, slSubItem2[j]);
            RegGetString(HKEY_LOCAL_MACHINE, AppendPath(sSubKey, 'Class'), sRegBuffer);

            if sRegBuffer = 'Ports' then
            begin
              xItem := lvwModem.Items.Add;
              xItem.ImageIndex := 2;
              xItem.Caption := 'USB 设备';
              RegGetString(HKEY_LOCAL_MACHINE, AppendPath(sSubKey, 'Device Parameters\PortName'), sRegBuffer);
              xItem.SubItems.Add(sRegBuffer);
              RegGetString(HKEY_LOCAL_MACHINE, AppendPath(sSubKey, 'FriendlyName'), sRegBuffer);
              xItem.SubItems.Add(sRegBuffer);
            end;
//          except
//            ;
//          end;
            Inc(j);
        end;

      end;
    end;

    slSubItem.Free;
    slSubItem2.Free;
  end;

//  lvwModem.AlphaSort;
//  lvwModem.Clear;
end;

procedure TfraSelectModem.btnNewModemClick(Sender: TObject);
begin
  WinExec(PAnsiChar('rundll32.exe shell32.dll,Control_RunDLL modem.cpl,,add'), 0);
end;

procedure TfraSelectModem.lvwModemColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  if Column.Index + 1 = Abs(lvwModem.Tag) then
    lvwModem.Tag := -lvwModem.Tag
  else
    lvwModem.Tag := Column.Index + 1;

  lvwModem.AlphaSort;
end;

procedure TfraSelectModem.lvwModemCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
var
  TextPart: array[0..1] of string;
  NumPart: array[0..1] of Integer;
  NumStr: array[0..1] of string;
begin
  case Abs(lvwModem.Tag) of
    1: Compare := StrComp(PAnsiChar(Item1.Caption), PAnsiChar(Item2.Caption));
    2:
      begin
        NumStr[0] := ExtractPhoneNumber(Item1.SubItems[0]);
        NumStr[1] := ExtractPhoneNumber(Item2.SubItems[0]);

        NumPart[0] := StrToIntDef(NumStr[0], 0);
        NumPart[1] := StrToIntDef(NumStr[1], 0);

        TextPart[0] := AnsiLeftStr(Item1.SubItems[1], Length(Item1.SubItems[0]) - Length(NumStr[0]));
        TextPart[1] := AnsiLeftStr(Item2.SubItems[1], Length(Item2.SubItems[0]) - Length(NumStr[1]));

        if AnsiSameText(TextPart[0], TextPart[1]) then
          Compare := NumPart[0] - NumPart[1]
        else
          Compare := CompareText(TextPart[0], TextPart[1]);
      end;
    3: Compare := StrComp(PAnsiChar(Item1.SubItems[1]), PAnsiChar(Item2.SubItems[1]));
  end;

  Compare := Sign(lvwModem.Tag) * Compare;
end;

end.
