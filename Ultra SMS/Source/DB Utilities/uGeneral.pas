unit uGeneral;

interface

uses
  ADODB;

const
  sNullPassword: String = '1(l-$:*51O43,n';
  iBeginBit: Integer = 7;
  iPassLength: Integer = 10;

function FEncodePassword(const Original: String): String;
function AppendPath(Path1, Path2: String): String;
function GetConnectionStr(FileName, Password: String; EncodePass: Boolean = True): String;
function GetTableRecCount(var ADB: TADOTable; Name: String): Integer;

// ¥” dbsprt.dll µº»Î
procedure DBCompress(lpSrc, lpDest, lpPassword: PChar); stdcall; external 'dbsprt.dll';
procedure DBCreate(lpSrcPath: PChar); stdcall; external 'dbsprt.dll';

implementation

uses
  CryptoAPI, SysUtils, StrUtils;

function FEncodePassword(const Original: String): String;
begin
  HashStr(HASH_MD5, Original, Result);
  Result := UpperCase(MidStr(Result, iBeginBit, iPassLength));
end;

function AppendPath(Path1, Path2: String): String;
begin
  if RightStr(Path1, 1) <> '\' then Path1 := Path1 + '\';
  Result := Path1 + Path2;
end;

function GetConnectionStr(FileName, Password: String; EncodePass: Boolean = True): String;
var
  sPass: String;
begin
  if EncodePass then
  begin
    if Length(Password) = 0 then
      {$IFDEF NULLDEFAULTPASS}
      sPass := ''
      {$ELSE}
      sPass := FEncodePassword(sNullPassword)
      {$ENDIF}
    else
      sPass := FEncodePassword(Password);
  end
  else
    sPass := Password;      

  Result :=
    'Provider=Microsoft.Jet.OLEDB.4.0;' +
    'Data Source=' + FileName +
    ';Persist Security Info=False';

  if Length(sPass) <> 0 then
    Result := Result
      + ';Jet OLEDB:Database Password=' + sPass;
end;

function GetTableRecCount(var ADB: TADOTable; Name: String): Integer;
begin
  ADB.TableName := Name;
  ADB.Open;
  Result := ADB.RecordCount;
  ADB.Close;
end;

end.
