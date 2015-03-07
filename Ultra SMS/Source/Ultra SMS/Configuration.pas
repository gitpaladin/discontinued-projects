unit Configuration;

interface

uses
  Classes, StrUtils;

type
  TConfig = class
  private
    sPresetPath: String;
  public
    constructor Create;
    function EnumCategory: TStringList;
    function EnumModel(const ACategory: string): TStringList;
    procedure LoadConfiguration(const ACategory: string; const AModel: String);
    procedure SaveConfiguration(const ACategory: string; const AModel: String);
  end;

implementation

{ TConfig }

uses
  SysUtils, GerneralFunc, IniFiles;

constructor TConfig.Create;
begin
  inherited Create;

  sPresetPath := AppendPath(sPath, 'Presets');

  if not DirectoryExists(sPresetPath) then
    MkDir(sPresetPath);
end;

function TConfig.EnumCategory: TStringList;
var
  sr: TSearchRec;
  sName: String;
begin
  Result := TStringList.Create;

  if FindFirst(AppendPath(sPresetPath, '*.INI'), faAnyFile, sr) = 0 then
  begin
    repeat
      sName := ExtractFileName(sr.Name);
      Result.Add(LeftStr(sName, Length(sName) - 4));
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

function TConfig.EnumModel(const ACategory: string): TStringList;
var
  ini: TIniFile;
  sCateFile: String;
begin
  Result := TStringList.Create;
  sCateFile := AppendPath(sPresetPath, ACategory + '.INI');

  if FileExists(sCateFile) then
  begin
    ini := TIniFile.Create(sCateFile);
    ini.ReadSections(Result);
    ini.Free;
  end;
end;

procedure TConfig.LoadConfiguration(const ACategory, AModel: String);
var
  ini: TIniFile;
  sCateFile: String;
begin
  sCateFile := AppendPath(sPresetPath, ACategory + '.INI');

  if FileExists(sCateFile) then
  begin
    ini := TIniFile.Create(sCateFile);

    if ini.SectionExists(AModel) then
    begin
      opCallbackInterval := ini.ReadInteger(AModel, 'CallbackInterval', opCallbackInterval);
      opConnnectTimeout := ini.ReadInteger(AModel, 'ConnnectTimeout', opConnnectTimeout);
      opStartConnect := ini.ReadBool(AModel, 'StartConnect', opStartConnect);
      opTaskInterval := ini.ReadInteger(AModel, 'TaskInterval', opTaskInterval);
      opAutoRead := ini.ReadInteger(AModel, 'AutoRead', opAutoRead);
      opShowNewMSG := ini.ReadBool(AModel, 'ShowNewMSG', opShowNewMSG);
      opShowFocus := ini.ReadBool(AModel, 'ShowFocus', opShowFocus);
      opShowNoFullScreen := ini.ReadBool(AModel, 'ShowNoFullScreen', opShowNoFullScreen);
      opDelMessage := ini.ReadBool(AModel, 'DelMessage', opDelMessage);
      opDelDraft := ini.ReadBool(AModel, 'DelDraft', opDelDraft);
      opQSAutoDisconnect := ini.ReadBool(AModel, 'QSAutoDisconnect', opQSAutoDisconnect);
      opQSBattery := ini.ReadBool(AModel, 'QSBattery', opQSBattery);
      opQSSignal := ini.ReadBool(AModel, 'QSSignal', opQSSignal);
      opQSInterval := ini.ReadInteger(AModel, 'QSInterval', opQSInterval);
      opQSAutoQueryState := ini.ReadBool(AModel, 'QSAutoQueryState', opQSAutoQueryState);
      opDCReconnect := ini.ReadBool(AModel, 'DCReconnect', opDCReconnect);
      opDCReconTime := ini.ReadInteger(AModel, 'DCReconTime', opDCReconTime);
      opDCReconInterval := ini.ReadInteger(AModel, 'DCReconInterval', opDCReconInterval);
      opDCRestart := ini.ReadBool(AModel, 'DCRestart', opDCRestart);
      opShowTrayIcon := ini.ReadBool(AModel, 'ShowTrayIcon', opShowTrayIcon);
      opFromPhonebook := ini.ReadBool(AModel, 'FromPhonebook', opFromPhonebook);
      wsReport := ini.ReadBool(AModel, 'Report', wsReport);
      opQueryNewModel := ini.ReadInteger(AModel, 'QueryNewModel', opQueryNewModel);
      opLocalTime := ini.ReadBool(AModel, 'LocalTime', opLocalTime);
      opReceiveReportOnlyNew := ini.ReadBool(AModel, 'ReceiveReportOnlyNew', opReceiveReportOnlyNew);
      opDeleteReport := ini.ReadBool(AModel, 'DeleteReport', opDeleteReport);
      opRepliedReceive := ini.ReadBool(AModel, 'RepliedReceive', opRepliedReceive);
      opIScmgl := ini.ReadInteger(AModel, 'IScmgl', opIScmgl);
      opValidityPeriod := ini.ReadInteger(AModel, 'ValidityPeriod', opValidityPeriod);
      opLongSMS := ini.ReadBool(AModel, 'LongSMS', opLongSMS);
      opSEPhoneBookUCS2 := ini.ReadBool(AModel, 'SEPhoneBookUCS2', opSEPhoneBookUCS2);
      opSEPhoneBookSuffix := ini.ReadBool(AModel, 'SEPhoneBookSuffix', opSEPhoneBookSuffix);
      opWritePhoneMemoy := ini.ReadBool(AModel, 'WritePhoneMemory', opWritePhoneMemoy);
    end;

    ini.Free;
  end;
end;


procedure TConfig.SaveConfiguration(const ACategory, AModel: String);
var
  ini: TIniFile;
  sCateFile: String;
begin
  sCateFile := AppendPath(sPresetPath, ACategory + '.INI');
  ini := TIniFile.Create(sCateFile);

  // …Ë÷√ Ù–‘
  ini.WriteInteger(AModel, 'CallbackInterval', opCallbackInterval);
  ini.WriteInteger(AModel, 'ConnnectTimeout', opConnnectTimeout);
  ini.WriteBool(AModel, 'StartConnect', opStartConnect);
  ini.WriteInteger(AModel, 'TaskInterval', opTaskInterval);
  ini.WriteInteger(AModel, 'AutoRead', opAutoRead);
  ini.WriteBool(AModel, 'ShowNewMSG', opShowNewMSG);
  ini.WriteBool(AModel, 'ShowFocus', opShowFocus);
  ini.WriteBool(AModel, 'ShowNoFullScreen', opShowNoFullScreen);
  ini.WriteBool(AModel, 'DelMessage', opDelMessage);
  ini.WriteBool(AModel, 'DelDraft', opDelDraft);
  ini.WriteBool(AModel, 'QSAutoDisconnect', opQSAutoDisconnect);
  ini.WriteBool(AModel, 'QSBattery', opQSBattery);
  ini.WriteBool(AModel, 'QSSignal', opQSSignal);
  ini.WriteInteger(AModel, 'QSInterval', opQSInterval);
  ini.WriteBool(AModel, 'QSAutoQueryState', opQSAutoQueryState);
  ini.WriteBool(AModel, 'DCReconnect', opDCReconnect);
  ini.WriteInteger(AModel, 'DCReconTime', opDCReconTime);
  ini.WriteInteger(AModel, 'DCReconInterval', opDCReconInterval);
  ini.WriteBool(AModel, 'DCRestart', opDCRestart);
  ini.WriteBool(AModel, 'ShowTrayIcon', opShowTrayIcon);
  ini.WriteBool(AModel, 'FromPhonebook', opFromPhonebook);
  ini.WriteBool(AModel, 'Report', wsReport);
  ini.WriteInteger(AModel, 'QueryNewModel', opQueryNewModel);
  ini.WriteBool(AModel, 'LocalTime', opLocalTime);
  ini.WriteBool(AModel, 'ReceiveReportOnlyNew', opReceiveReportOnlyNew);
  ini.WriteBool(AModel, 'DeleteReport', opDeleteReport);
  ini.WriteBool(AModel, 'RepliedReceive', opRepliedReceive);
  ini.WriteInteger(AModel, 'IScmgl', opIScmgl);
  ini.WriteInteger(AModel, 'ValidityPeriod', opValidityPeriod);
  ini.WriteBool(AModel, 'LongSMS', opLongSMS);
  ini.WriteBool(AModel, 'SEPhoneBookSuffix', opSEPhoneBookSuffix);
  ini.WriteBool(AModel, 'SEPhoneBookUCS2', opSEPhoneBookUCS2);
  ini.WriteBool(AModel, 'WritePhoneMemory', opWritePhoneMemoy);

  ini.UpdateFile;
  ini.Free;
end;

end.
