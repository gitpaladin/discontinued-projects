{Import unit for GetGBKPY.Dll}

unit GetGBKPY_imp;

interface
uses
  Types, Windows;

function GetPY(const HZ: WORD; const buf: pchar; const count:integer): DWORD; stdcall;
function GetCharacterPinyin(const lpInput: PAnsiChar; lpBuffer: PAnsiChar; lLength: DWORD): DWORD; stdcall;
function IsSimpleSpellingMatch(const lpString: PAnsiChar; const lpSimpleSpelling: PAnsiChar): DWORD; stdcall;
function IsSimpleSpellingMatchCaseInsensitive(const lpString: PAnsiChar; const lpSimpleSpelling: PAnsiChar): DWORD; stdcall;


implementation
  function GetPY(const HZ: WORD; const buf: pchar; const count:integer): DWORD;	external 'GetGBKPY' index 1;
  function GetCharacterPinyin(const lpInput: PAnsiChar; lpBuffer: PAnsiChar; lLength: DWORD): DWORD; external 'pinyinex' name 'PYEX_GetCharacterPinyinA';
  function IsSimpleSpellingMatch(const lpString: PAnsiChar; const lpSimpleSpelling: PAnsiChar): DWORD; external 'pinyinex' name 'PYEX_IsSimpleSpellingMatchA';
  function IsSimpleSpellingMatchCaseInsensitive(const lpString: PAnsiChar; const lpSimpleSpelling: PAnsiChar): DWORD; external 'pinyinex' name 'PYEX_IsSimpleSpellingMatchCaseInsensitiveA';
end.
