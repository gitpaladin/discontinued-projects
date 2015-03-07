unit uVersion;

interface

procedure VersionRoutine;

const
  VERSION_LEGACY: Integer = 20080202;
  VERSION_103: Integer =    20080629;
  
var
  SettingFileVersion: Integer;

implementation


uses
  UserInterfaces, Classes, SysUtils, GerneralFunc, ADODB;

{*******************************************************************************
  过程名:    GetLastProductVersion
  作者:      Administrator
  日期:      2007.08.27
  参数:      无
  返回值:    Integer

  说明:
 -------
  获得这个产品的版本，以便升级
*******************************************************************************}
function GetLastProductVersion: Integer;
var
  fsFile: TFileStream;
  sFileName: string;
begin
  sFileName := AppendPath(sPath, 'ultrasms.ver');

  // 如果没有找到就表示是最老的版本的
  if not FileExists(sFileName) then
    Result := VERSION_LEGACY
  else
  begin
    fsFile := TFileStream.Create(sFileName, fmOpenRead);
    fsFile.ReadBuffer(Result, SizeOf(Integer));
    fsFile.Free;
  end;

  // 如果版本号不是当前的就要重新写入
  if Result <> ProductVer then
  begin
    fsFile := TFileStream.Create(sFileName, fmCreate);
    fsFile.WriteBuffer(ProductVer, SizeOf(Integer));
    fsFile.Free; 
  end;  
end;  

procedure Upgrade20080703;
begin
  frmMain.dxbmMain.BarByOldName('MenuBar').Reset;
  SettingFileVersion := ProductVer;
end;  

procedure Upgrade20070601;
var
  dbQry: TADOQuery;
begin
  frmMain.dxbmMain.BarByOldName('MenuBar').Reset;
  frmMain.dxbmMain.BarByOldName('ModemToolbar').Reset;
  frmMain.dxbmMain.BarByOldName('ModemCmd').Reset;

  // 添加字段
  dbQry := TADOQuery.Create(nil);
  dbQry.Connection := frmMain.adoSMS;

  try
    dbQry.SQL.Add('ALTER TABLE [receive] ADD COLUMN [folder] VARCHAR(50);');
    dbQry.ExecSQL;
  except
    ;
  end;   

  dbQry.Free;

  SettingFileVersion := VERSION_103;
end;  

procedure VersionRoutine;
begin
  SettingFileVersion := GetLastProductVersion;

  while SettingFileVersion < ProductVer do
    case SettingFileVersion of
    20080202: Upgrade20070601;
    20080629: Upgrade20080703;
    end;
end;


end.
