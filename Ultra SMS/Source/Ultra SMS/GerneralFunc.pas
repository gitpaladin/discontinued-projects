{*******************************************************}
{                                                       }
{       Ultra SMS 标准函数                              }
{                                                       }
{       版权所有 (C) 2007 Alexander Software Studio     }
{                                                       }
{*******************************************************}

unit GerneralFunc;

interface

uses
  ADODB, Classes, Graphics, Forms, ComCtrls, Registry, ExtCtrls, Windows;

const
  VPOneHour: Integer = 11;
  VPThreeHours: Integer = 29;
  VPSixHours: Integer = 71;
  VPTwelveHours: Integer = 143;
  VPOneDay: Integer = 167;
  VPOneWeek: Integer = 196;
  VPMaximum: Integer = 255;

  STPortDelimiter: String = '/';

  ProductVer: Integer = 20080703;

  IDI_SMAINFORM = 101;
  IDI_BMAINFORM = 102;
  IDI_SWRITE = 103;
  IDI_BWRITE = 104;
  IDI_SREAD = 105;
  IDI_BREAD = 106;
  IDI_SPREVIEW = 107;
  IDI_BPREVIEW = 108;
  IDI_STIME = 109;
  IDI_BTIME = 110;
  IDI_SCLEANUP = 111;
  IDI_BCLEANUP = 112;
  IDI_SSYNCPB = 113;
  IDI_BSYNCPB = 114;

  // 用于表示当前的状态
type
  TCurrentView = (cvReceive, cvSend, cvFinish, cvDraft, cvNone);

{
    Public Enum ENUM_TP_VALID_PERIOD
        OneHour = 11 '0 to 143:(TP-VP+1)*5Min
        ThreeHours = 29
        SixHours = 71
        TwelveHours = 143
        OneDay = 167
        OneWeek = 196
        Maximum = 255
    End Enum
}
  // 用于检测返回状态的结构
  TLastActionResultType = (lartSuccess, lartError, lartCMSError, lartTimeout);

  TLastActionResult = record
    case ResultType: TLastActionResultType of
     lartSuccess: ();
     lartError: (ErrorNumer: Integer);
     lartCMSError: (CMSErrorNumer: Integer);
     lartTimeout: (TimeOutcounter: Integer);
  end;

    // 用于 VirtualTreeView 的条目数据
  TShortMessageEntry = record
    InternalID: Integer;
    DateTime: TDateTime;
    Sender: String;
    PhoneNumber: String;
    Content: String;
    Replied: Boolean;
    Read: Boolean;
    Transmitted: Boolean;
    MessageCount: Integer;
    PhoneClient: Boolean;
  end;

  TPortList = record
    Index: Cardinal;
    PortList: TStrings;
  end;

  PShortMessageEntry = ^TShortMessageEntry;

function AppendPath(Path1, Path2: String): String;
function CombineSQL(Conditions: TStringList): String;
function CountText(ASource, ASubStr: String): Cardinal;
function DeleteEnterChar(const S: String): String;
function EllipsisText(S: WideString; ACount: Integer): String;
function EncodePassword(const Original: String): String;
function ExtractParameter(S: String; Index: Integer = 0): String;
function ExtractParameterRev(S: String; Index: Integer = 0): String;
function ExtractAllParameter(S: String; DeleteAtHeader: Boolean = True): TStringList;
function ExtractPhoneNumber(S: String): String;
function FormatContactsStr(slName, slPhone: TStringList; ShowNumber: Boolean = True): String;
function GetProperty(DB: TADOTable; Name: String; Default: String = ''): String;
function GetPropertyFont(DB: TADOTable; Name: String): TFont;
function GetQuotedCommaText(AList: TStrings): String;
function GetSpecialFolderDir(mFolder: Integer): string;
function GetSQLStr(AInternalID: Integer; ABox: TCurrentView): String;
function GetTempFile: String;
function IsFullScreen: Boolean;
function IsStringsIntersection(const SList1, SList2: TStringList): Boolean; overload;
function IsStringsIntersection(const SList: TStringList; SString: String): Boolean; overload;
function PhoneNumberSimilar(S1, S2: String): Boolean;
function SplitString(Source, Deli: string; Count: Cardinal = 0; ToTrim: Boolean = False): TStringList;
function JoinStrings(AStrings: TStrings; Deli: String): string;
function UpdateIntroPage(const DB: TADOConnection): string;
procedure CreateLink(ProgramPath, ProgramArg, LinkPath, Descr: String);
procedure SetProperty(DB: TADOTable; Name: String; Value: String);
procedure SetPropertyFont(DB: TADOTable; Name: String; Value: TFont);
function SetNumeric(Key: Char): Char;
function IsTopMostWndExist: Boolean;
function RunAppTillEnd(const CmdLine: String): Boolean;
procedure SetCollectionItemIndex(AContainer: TCollection; AItem: TCollectionItem; NewIndex: Integer); overload;
procedure SetCollectionItemIndex(AContainer: TListItems; AItem: TListItem; NewIndex: Integer); overload;
{$IFDEF REGISTERED}
procedure ChangeIMEI(const IMEI: string; tmrExit: TTimer = nil);
procedure SetTodayTime;

procedure WriteRegInfo(const PeriodDate: TDateTime; const ReaminSecond: Cardinal;
  const LastUse: TDateTime; const TodaySecond: Cardinal; const EncryptKey: String);
procedure ReadRegInfo(var PeriodDate: TDateTime; var ReaminSecond: Cardinal;
  var LastUse: TDateTime; var TodaySecond: Cardinal; const EncryptKey: String);
procedure CreateRegInfo(const EncryptKey: String);
function ExistReginfo: Boolean;
procedure DeleteRegInfo;
{$ENDIF}
function GetAllCount(AdoCon: TADOConnection): Integer;
procedure SetWindowIcon(hWindow: HWnd; resBig: Integer; resSmall: Integer);
function GBKToSpellIndex(S: AnsiString): string;
function GBKToSpell(S: AnsiString): string;
function IsCorrespondingSimplifiedPinyin(S: AnsiString; PinYin: AnsiString): Boolean;

procedure SetListViewStyleVista(AListView: TListView);

const
  HotKeyNumber: SmallInt = 9;

{$IFDEF REGISTERED}
  // 试用期限制
  REG_TRIAL_DAY: Integer = 15;
  REG_TRIAL_TOTAL_SECOND: Integer = 54000;
  REG_DAILY_SECOND: Integer = 600;
  REG_BOX_LIMIT: Integer = 400;
{$ENDIF}  

var
  // OS 版本
  IsWinNT: Boolean;
  IsWin2K: Boolean;
  IsWinXP: Boolean;
  IsWinVistaOrAbove: Boolean;

  IntroPath: String;
  sPath: String;
  MessageReference: Byte;
  PortList: TPortList;

  // 选项
  opAutoReconnect: Boolean;
  opStartConnect: Boolean;
  opConnnectTimeout: Integer;
  opTaskInterval: Integer;
  opCallbackInterval: Integer;
  opConnectWating: Integer;
  opAutoRead: Integer;
  opGlobalHotKey: Boolean;
  opDelMessage: Boolean;
  opDelDraft: Boolean;
  opValidityPeriod: Integer;
  opFromPhonebook: Boolean;
  opQueryNewModel: Integer;
  opLocalTime: Boolean;
  opReceiveReportOnlyNew: Boolean;
  opDeleteReport: Boolean;
  opRepliedReceive: Boolean;

  // 提示系统
  opShowNewMSG: Boolean;
  opShowNoFullScreen: Boolean;
  opShowReg: Boolean;
  opShowFocus: Boolean;
  opShowTrayIcon: Boolean;
  opNWAlphaBlend: Boolean;
  opNWAlphaValue: Byte;

  // 整理短信设置
  opRMKeepType: Integer;
  opRMKeepNumber: Integer;
  opRMKeepPercent: Integer;
  opRMKeepDay: Integer;
  opRMKeepDate: TDateTime;
  opRMHandleUNREAD: Boolean;
  opRMHandleREAD: Boolean;
  opRMHandleDraft: Boolean;
  opRMHandleSent: Boolean;

  // 热键系统
  HotKeyList: array[0..10] of TShortCut;

  // 模板文件夹
  TemplateFolder: String;

{$IFDEF REGISTERED}
  // 注册状态
  GlobalRegStatus: String;
  LastTickCount: Cardinal;
  TodaySecond: Cardinal;
{$ENDIF}  

  // 分页视图
  opSplittedPage: Boolean;
  opSPSortAsc: Boolean;
  opSPSortType: Integer;
  opSPItemCount: Integer;

  // 查询状态
  opQSAutoQueryState: Boolean;
  opQSInterval: Integer;
  opQSAutoDisconnect: Boolean;
  opQSBattery: Boolean;
  opQSSignal: Boolean;
  opQSAlert: Integer;

  // 重新连接
  opDCReconnect: Boolean;
  opDCReconTime: Integer;
  opDCReconInterval: Integer;
  opDCRestart: Boolean;

  // 高级设置
  opIScmgl: Integer;

  // 存储相关设置
  msWriteSMS: TMemoryStream;
  msReadSMS: TMemoryStream;
  msPrintDlg: TMemoryStream;
//  msWriteDocking: TMemoryStream;

  // 撰写短信的一些设置
  wsWindowLeft: Integer;
  wsWindowWidth: Integer;
  wsWindowTop: Integer;
  wsWindowHeight: Integer;
  wsWsMaximized: Boolean;
  wsReport: Boolean;
  wsAutoPrefix: Boolean;
  WndPercent: Real;
  rsWindowLeft: Integer;
  rsWindowWidth: Integer;
  rsWindowTop: Integer;
  rsWindowHeight: Integer;
  rsWsMaximized: Boolean;
  spWindowLeft: Integer;
  spWindowWidth: Integer;
  spWindowTop: Integer;
  spWindowHeight: Integer;
  spWsMaximized: Boolean;

  // 长短信设置
  opLongSMS: Boolean;

  // 关于Sony Ericsson的一些设置
  opSEPhoneBookUCS2: Boolean;
  opSEPhoneBookSuffix: Boolean;
  opWritePhoneMemoy: Boolean;

  // 消息报告设置
  opReceiveAsReportTime: Boolean;

const
  sNullPassword: String = '1(l-$:*51O43,n';
  iBeginBit: Integer = 7;
  iPassLength: Integer = 10;

{$IFDEF REGISTERED}
  GRS_UNKNOWN: String = 'dWx0cmFzbXMucmVnc3RhdHVzLnVua25vd24=';
  GRS_UNREGISTERED: String = 'dWx0cmFzbXMucmVnc3RhdHVzLnVucmVnaXN0ZXJlZA==';
  GRS_EXCEEDED: String = 'dWx0cmFzbXMucmVnc3RhdHVzLmV4Y2VlZGVk';
  GRS_REGISTERED: string = 'dWx0cmFzbXMucmVnc3RhdHVzLnJlZ2lzdGVyZWQ=';
{$ENDIF}  

implementation

uses StrUtils, SysUtils, ComObj, ActiveX, ShlObj, CryptoAPI, HotKeyManager, SMSJob,
  AES, DES, DateUtils, Messages, GetGBKPY_imp;

// **********************************************************
//      添加路径的函数，因为某些时候会有斜杠，但是有些时候没
// 有斜杠所以需要分析。
// [in]Path1 要连接的左边路径
// [in]Path2 要连接的右边路径
// [return] 连接后的值
// **********************************************************
function AppendPath(Path1, Path2: String): String;
begin
  if RightStr(Path1, 1) <> '\' then Path1 := Path1 + '\';
  Result := Path1 + Path2;
end;


// **********************************************************
//      添加路径的函数，因为某些时候会有斜杠，但是有些时候没
// 有斜杠所以需要分析。
// [in]Path1 要连接的左边路径
// [in]Path2 要连接的右边路径
// [return] 连接后的值
// **********************************************************
function SplitString(Source, Deli: string; Count: Cardinal = 0; ToTrim: Boolean = False): TStringList;
var
  EndOfCurrentString: byte;
  StringList:TStringList;
begin
  StringList:=TStringList.Create;
  if ToTrim then
    if Count = 0 then
      while Pos(Deli, Source)>0 do
      begin
        EndOfCurrentString := Pos(Deli, Source);
        StringList.add(Copy(Source, 1, EndOfCurrentString - 1));
        Source := Trim(Copy(Source, EndOfCurrentString + length(Deli), length(Source) - EndOfCurrentString));
      end
    else
      while (Pos(Deli, Source)>0) and (Count > 1) do
      begin
        EndOfCurrentString := Pos(Deli, Source);
        StringList.add(Copy(Source, 1, EndOfCurrentString - 1));
        Source := Trim(Copy(Source, EndOfCurrentString + length(Deli), length(Source) - EndOfCurrentString));
        Dec(Count);
      end
  else
    if Count = 0 then
      while Pos(Deli, Source)>0 do
      begin
        EndOfCurrentString := Pos(Deli, Source);
        StringList.add(Copy(Source, 1, EndOfCurrentString - 1));
        Source := Copy(Source, EndOfCurrentString + length(Deli), length(Source) - EndOfCurrentString);
      end
    else
      while (Pos(Deli, Source)>0) and (Count > 1) do
      begin
        EndOfCurrentString := Pos(Deli, Source);
        StringList.add(Copy(Source, 1, EndOfCurrentString - 1));
        Source := Copy(Source, EndOfCurrentString + length(Deli), length(Source) - EndOfCurrentString);
        Dec(Count);
      end;

  if ToTrim then
    StringList.Add(Trim(source))
  else
    StringList.Add(source);

  if Length(StringList[StringList.Count - 1]) = 0 then
    StringList.Delete(StringList.Count - 1);

  Result := StringList;
end;

function JoinStrings(AStrings: TStrings; Deli: String): string;
var
  i: Cardinal;
begin
  Result := '';
  for i := 0 to AStrings.Count - 1 do
    if i = 0 then
      Result := AStrings[0]
    else
      Result := Result + Deli + AStrings[i];
end;

// **********************************************************
//      从 GSM 字符串中提取电话号码
// [in]S GSM 字符串
// [return] 电话号码的字符串
// **********************************************************
function ExtractPhoneNumber(S: String): String;
var
  i: Integer;
begin
  S := ReverseString(S);
  if Pos(',', S) > 0 then
    S := RightStr(S, Length(S) - Pos(',', S));

  for i := 1 to Length(S) do
    if not ((S[i] = #43) or ((S[i] >= #48) and (S[i] <= #57))) then break;

  Result := ReverseString(LeftStr(S, i - 1));
end;

// **********************************************************
//      将属性保存到数据库中。
// [in]DB    数据库记录集
// [in]Name  名字
// [in]Value 值
// **********************************************************
procedure SetProperty(DB: TADOTable; Name: String; Value: String);
begin
  if DB.Locate('Name', Name, []) then
  begin
    DB.Edit;
    DB.FieldByName('Value').AsString := Value;
  end
  else
  begin
    DB.Append;
    DB.FieldByName('Name').AsString := Name;
    DB.FieldByName('Value').AsString := Value;
  end;

  DB.Post;
end;

// **********************************************************
//      从数据库中获得属性。
// [in]DB      数据库记录集
// [in]Name    名字
// [in]Default 默认数据
// [return] 返回的属性值
// **********************************************************
function GetProperty(DB: TADOTable; Name: String; Default: String = ''): String;
begin
  if DB.Locate('Name', Name, []) then
    Result :=  DB.FieldByName('Value').AsString
  else
    Result := Default;
end;

// **********************************************************
//      将字体属性保存到数据库中。
// [in]DB    数据库记录集
// [in]Name  名字
// [in]Value 值
// **********************************************************
procedure SetPropertyFont(DB: TADOTable; Name: String; Value: TFont);
begin
  SetProperty(DB, Name + 'FontName', Value.Name);
  SetProperty(DB, Name + 'FontSize', IntToStr(Value.Size));
  SetProperty(DB, Name + 'FontColor', IntToStr(Value.Color));
  SetProperty(DB, Name + 'FontBold', BoolToStr(fsBold in Value.Style));
  SetProperty(DB, Name + 'FontItalic', BoolToStr(fsItalic in Value.Style));
  SetProperty(DB, Name + 'FontUnderline', BoolToStr(fsUnderline in Value.Style));
  SetProperty(DB, Name + 'FontStrikeout', BoolToStr(fsStrikeOut in Value.Style));
end;

// **********************************************************
//      从数据库中获得字体属性。
// [in]DB      数据库记录集
// [in]Name    名字
// [in]Default 默认数据
// [return] 返回的属性值
// **********************************************************
function GetPropertyFont(DB: TADOTable; Name: String): TFont;
begin
  Result := TFont.Create;
  Result.Name := GetProperty(DB, Name + 'FontName', '宋体');
  Result.Size := StrToInt(GetProperty(DB, Name + 'FontSize', '12'));
  Result.Color := TColor(Integer(GetProperty(DB, 'FontColor', '0')));
  Result.Style := [];
  if StrToBool(GetProperty(DB, Name + 'FontBold', '0')) then Result.Style := Result.Style + [fsBold];
  if StrToBool(GetProperty(DB, Name + 'FontItalic', '0')) then Result.Style := Result.Style + [fsItalic];
  if StrToBool(GetProperty(DB, Name + 'FontUnderline', '0')) then Result.Style := Result.Style + [fsUnderline];
  if StrToBool(GetProperty(DB, Name + 'FontStrikeout', '0')) then Result.Style := Result.Style + [fsStrikeOut];
end;

// **********************************************************
//      看两个电话号码是否是一样的。
// [in]DB      数据库记录集
// [in]Name    名字
// [in]Default 默认数据
// [return] 返回的属性值
// **********************************************************
function PhoneNumberSimilar(S1, S2: String): Boolean;
begin
  if (Length(S1) = 0) or (Length(S2) = 0) then
    Result := False
  else
    Result := AnsiEndsText(S1, S2) or AnsiEndsText(S2, S1);
end;

// **********************************************************
//      查找字符串中子字符串个数。
// [in]DB      数据库记录集
// [in]Name    名字
// [return] 返回的属性值
// **********************************************************
function CountText(ASource, ASubStr: String): Cardinal;
var
  iPos: Integer;
begin
  Result := 0;

  repeat
    iPos := Pos(ASubStr, ASource);
    Inc(Result);

    if iPos > 0 then
      Delete(ASource, 1, iPos + 1 + Length(ASubStr));
  until iPos = 0;
end;

function FormatContactsStr(slName, slPhone: TStringList; ShowNumber: Boolean = True): String;
var
  i: Integer;
begin
  Result := '';

  for i := slName.Count to slPhone.Count - 1 do
    slName.Add('');

  if ShowNumber then
  begin
    for i := 0 to slPhone.Count - 1 do
      if Length(slPhone[i]) > 0 then
        Result := Result + IfThen(Length(slName[i]) > 0, slName[i], '<未知>')
           + #40 + slPhone[i] + #41#44#32;
  end
  else
  begin
    for i := 0 to slPhone.Count - 1 do
      if Length(slPhone[i]) > 0 then
        Result := Result + IfThen(Length(slName[i]) > 0, slName[i], slPhone[i])
           + #44#32;
  end;

  if AnsiEndsText(#44#32, Result) then
    Delete(Result, Length(Result) - 1, 1);
end;

// 判断两个列表是否有交集
function IsStringsIntersection(const SList1, SList2: TStringList): Boolean; overload;
var
  i: Integer;
begin
  for i := 0 to SList1.Count - 1 do
    if SList2.IndexOf(SList1[i]) > 0 then
    begin
      Result := True;
      Exit;
    end;

  Result := False;
end;

function IsStringsIntersection(const SList: TStringList; SString: String): Boolean; overload;
var
  i: Integer;
begin
  SString := #13#10 + SString + #13#10;

  for i := 0 to SList.Count - 1 do
    if Pos(#13#10 + SList[i] + #13#10, SString) > 0 then
    begin
      Result := True;
      Exit;
    end;

  Result := False;
end;

function DeleteEnterChar(const S: String): String;
begin
  if AnsiEndsStr(#13#10, S) then
    Result := LeftStr(S, Length(S) - 2)
  else
    Result := S;
end;

function ExtractParameter(S: String; Index: Integer = 0): String;
var
  tmpSL: TStringList;
begin
  // 获得参数的函数
  tmpSL := ExtractAllParameter(S);
  if Index>=tmpSL.Count then Index := tmpSL.Count - 1;
  S := tmpSL[Index];
  S := Trim(S);
  if AnsiEndsText(#$22, S) or AnsiEndsText(#$27, S) then Delete(S, Length(S), 1);
  if AnsiStartsText(#$22, S) or AnsiStartsText(#$27, S) then Delete(S, 1, 1);
  Result := S;
  tmpSL.Free;
end;

function ExtractParameterRev(S: String; Index: Integer = 0): String;
var
  tmpSL: TStringList;
begin
  // 获得参数的函数
  tmpSL := ExtractAllParameter(S);
  if Index>=tmpSL.Count then Index := tmpSL.Count - 1;
  S := tmpSL[tmpSL.Count - Index - 1];
  S := Trim(S);
  if AnsiEndsText(#$22, S) or AnsiEndsText(#$27, S) then Delete(S, Length(S), 1);
  if AnsiStartsText(#$22, S) or AnsiStartsText(#$27, S) then Delete(S, 1, 1);
  Result := S;
  tmpSL.Free;
end;

function ExtractAllParameter(S: String; DeleteAtHeader: Boolean = True): TStringList;
var
  len: Integer;
  i: Integer;
  a: Integer;
  mutex: Integer;
  quoted: Boolean;
begin
  // 获得参数的函数
  if DeleteAtHeader then
    S := Trim(RightStr(S, Length(S) - Pos(#$3A, S)));

  Result := TStringList.Create;
  len := Length(S);
  mutex := 0;
  quoted := True;
  a := 1;

  for i := 1 to len do
    if (S[i] = ',') and (mutex = 0) and quoted then
    begin
      Result.Add(Trim(MidStr(S, a, i - a)));
      a := i + 1;
    end
    else if S[i] = '(' then
      Inc(mutex)
    else if S[i] = ')' then
      Dec(mutex)
    else if S[i] = '"' then
      quoted := not quoted;

  Result.Add(Trim(RightStr(S, len - a + 1)));
end;

procedure CreateLink(ProgramPath, ProgramArg, LinkPath, Descr: String);
var
  AnObj: IUnknown;
  ShellLink: IShellLink;
  AFile: IPersistFile;
  FileName: WideString;
begin
  if UpperCase(ExtractFileExt(LinkPath)) <> '.LNK' then //检查扩展名是否正确
  begin
    raise Exception.Create('快捷方式的扩展名必须是"LNK"!');//若不是则产生异常
  end;

  try
    OleInitialize(nil);//初始化OLE库，在使用OLE函数前必须调用初始化
    AnObj := CreateComObject(CLSID_ShellLink);//根据给定的ClassID生成一个COM对象，此处是快捷方式
    ShellLink := AnObj as IShellLink;//强制转换为快捷方式接口
    AFile := AnObj as IPersistFile;//强制转换为文件接口

    //设置快捷方式属性，此处只设置了几个常用的属性
    ShellLink.SetPath(PChar(ProgramPath)); // 快捷方式的目标文件，一般为可执行文件
    ShellLink.SetArguments(PChar(ProgramArg));// 目标文件参数
    ShellLink.SetWorkingDirectory(PChar(ExtractFilePath(ProgramPath)));//目标文件的工作目录
    ShellLink.SetDescription(PChar(Descr));// 对目标文件的描述
    FileName := LinkPath;//把文件名转换为WideString类型
    AFile.Save(PWideChar(FileName), False);//保存快捷方式

  finally
    OleUninitialize;//关闭OLE库，此函数必须与OleInitialize成对调用
  end;
end;

function GetSpecialFolderDir(mFolder: Integer): string;
{  返回获取系统文件或系统目录  }
(*
    CSIDL_BITBUCKET          *    回收站
    CSIDL_CONTROLS           *    控制面板
    CSIDL_DESKTOP            *    桌面目录        //如C:\WINDOWS\Desktop
    CSIDL_DRIVES             *    我的电脑
    CSIDL_FONTS                  字体            //如C:\WINDOWS\FONTS
    CSIDL_NETHOOD                网上邻居目录    //如C:\WINDOWS\NetHood
    CSIDL_NETWORK            *    网上邻居
    CSIDL_PERSONAL               我的文档        //如C:\My  Documents
    CSIDL_PRINTERS           *    打印机
    CSIDL_PROGRAMS               程序组          //如C:\WINDOWS\Start  Menu\Programs
    CSIDL_RECENT                 最近文档        //如C:\WINDOWS\Recent
    CSIDL_SENDTO                 发送到          //如C:\WINDOWS\SentTo
    CSIDL_STARTMENU              开始菜单        //如C:\WINDOWS\Start  Menu
    CSIDL_STARTUP                启动            //如C:\WINDOWS\启动
    CSIDL_TEMPLATES              模版            //如C:\WINDOWS\ShellNew
*)
var
  vItemIDList: PItemIDList;
  vBuffer: array[0..500] of Char;
begin
  SHGetSpecialFolderLocation(0, mFolder, vItemIDList);
  SHGetPathFromIDList(vItemIDList, vBuffer);  //转换成文件系统的路径
  Result := vBuffer;           
end;  {  GetSpecialFolderDir  }

// 判断是不是全屏幕
function IsFullScreen: Boolean;
var
  hFront: HWND;
  ARect: TRECT;
begin
  hFront := GetForegroundWindow;
  GetWindowRect(hFront, ARect);

  if ((ARect.Right - ARect.Left) = Screen.DesktopWidth)
    and ((ARect.Bottom - ARect.Top) = Screen.DesktopHeight) then
    Result := True
  else
    Result := False;
end;

// 获得引用且分隔字符
function GetQuotedCommaText(AList: TStrings): String;
var
  i: Integer;
begin
  for i := 0 to AList.Count - 1 do
    Result := Result + ', ' + QuotedStr(AList[i]);

  Delete(Result, 1, 2);

  if Length(Result) = 0 then Result := '""'; 
end;

function GetSQLStr(AInternalID: Integer; ABox: TCurrentView): String;
begin
  case ABOX of
    cvReceive:
      Result := 'SELECT [receive].[sender] AS [name], ' +
        '[receive].[sendernumber] AS [number], [receive].[content], ' +
        '[receive].[receivedate] AS [date], [receive].[replied], [receive].[read], ' +
        '[receive].[transmitted], [receive].[id]' +
        'FROM [receive] ' +
        'WHERE [receive].[internalid]=' +  IntToStr(AInternalID) +
        ' ORDER BY [receivedate] DESC;';
    cvSend:
      Result := 'SELECT [send].[addressee] AS [name], [send].[number], ' +
        '[send].[senderdate] AS [date], [send].[content] ' +
        'FROM [send]' +
        'WHERE [send].[internalid]=' +  IntToStr(AInternalID) +
        ' ORDER BY [senderdate] DESC;';
    cvFinish:
      Result := 'SELECT [finish_item].[name], [finish_item].[number], ' +
        '[finish].[senderdate] AS [date], [finish].[content], [finish].[transmitted] ' +
        'FROM [finish] INNER JOIN [finish_item] ON [finish].[internalid] ' +
        '= [finish_item].[associatedid] ' +
        'WHERE [finish].[internalid]=' +  IntToStr(AInternalID) +
        ' ORDER BY [senderdate] DESC;';
    cvDraft:
      Result := 'SELECT [draft_item].[name], [draft_item].[number], ' +
        '[draft].[date], [draft].[content] ' +
        'FROM [draft] INNER JOIN [draft_item] ON [draft].[internalid] ' +
        '= [draft_item].[associatedid] ' +
        'WHERE [draft].[internalid]=' +  IntToStr(AInternalID) + 
        ' ORDER BY [date] DESC;';
  end;
end;

function CombineSQL(Conditions: TStringList): String;
var
  i: Integer;
begin
  for i := 0 to Conditions.Count - 1 do
    if i = 0 then
      Result := '(' + Conditions[i] + ')'
    else
      Result := Result + ' AND (' + Conditions[i] + ')';
end;

function GetTempFile: String;
var
  sTmpPath: array of Char;
  sTmpName: array of Char;
  rtl: Integer;
begin
  SetLength(sTmpPath, MAX_PATH);
  SetLength(sTmpName, MAX_PATH);

  rtl := GetTempPath(MAX_PATH, PChar(sTmpPath));

  if rtl > 0 then
    Result := LeftStr(PChar(sTmpPath), rtl)
  else
    Result := sPath;

  GetTempFileName(PChar(sTmpPath), 'ultrasms', 0, PChar(sTmpName));

  Result := PChar(sTmpName);
end;

function EllipsisText(S: WideString; ACount: Integer): String;
begin
  if Length(S) > ACount then
    Result := LeftStr(S, ACount - 2) + '...'
  else
    Result := S;
end;

function UpdateIntroPage(const DB: TADOConnection): string;
const
  STR_RECEIVE_BEGIN: string = '<!--RECEIVE BOX INFO BEGIN-->';
  STR_RECEIVE_END: string   = '<!--RECEIVE BOX INFO END-->';
  STR_SEND_BEGIN: string    = '<!--SEND BOX INFO BEGIN-->';
  STR_SEND_END: string      = '<!--SEND BOX INFO END-->';
  STR_FINISH_BEGIN: string  = '<!--FINISH BOX INFO BEGIN-->';
  STR_FINISH_END: string    = '<!--FINISH BOX INFO END-->';
  STR_DRAFT_BEGIN: string   = '<!--DRAFT BOX INFO BEGIN-->';
  STR_DRAFT_END: string     = '<!--DRAFT BOX INFO END-->';
var
  iBegin: Integer;
  iEnd: Integer;
  fTemplate: TFileStream;
  sTemplate: TStringStream;
  sFile: String;
  sResult: String;
  sRepeat: string;
  sResultOne: String;
  SQL: TADOQuery;
begin
  // 获得临时文件夹的位置
  if Length(IntroPath) = 0 then
    IntroPath := GetTempFile;

  // 复制文件
  if not CopyFile(PChar(AppendPath(sPath, 'intro.htm')), PChar(IntroPath), False) then
  begin
    Result := 'about:blank';
    Exit;
  end;

  // 修改内容
  fTemplate := TFileStream.Create(IntroPath, fmOpenRead);
  sTemplate := TStringStream.Create('');
  sTemplate.CopyFrom(fTemplate, 0);
  sFile := sTemplate.DataString;
  sTemplate.Free;
  fTemplate.Free;

  SQL := TADOQuery.Create(nil);
  SQL.Connection := DB;

  // 添加收到的信息
  iBegin := AnsiPos(STR_RECEIVE_BEGIN, sFile);
  iEnd := AnsiPos(STR_RECEIVE_END, sFile);

  if (iEnd > iBegin) and (iBegin > 0) then
  begin
    iBegin := iBegin + Length(STR_RECEIVE_BEGIN);
    sRepeat := MidBStr(sFile, iBegin , iEnd - iBegin);
    Delete(sFile, iBegin, iEnd - iBegin);

    SQL.SQL.Text := 'SELECT TOP 5 receive.internalid, receive.sender ' +
      'AS [name], receive.receivedate AS [date], receive.content ' +
      'FROM receive ORDER BY receive.receivedate DESC;';
    SQL.Open;

    if SQL.Eof and SQL.Bof then
      sResult := '没有任何记录'
    else
      while not SQL.Eof do
      begin
        sResultOne := AnsiReplaceText(sRepeat, '%index%', IntToStr(SQL.FieldByName('internalid').AsInteger));
        sResultOne := AnsiReplaceText(sResultOne, '%name%', SQL.FieldByName('name').AsString);
        sResultOne := AnsiReplaceText(sResultOne, '%content%', EllipsisText(SQL.FieldByName('content').AsString, 25));
        sResultOne := AnsiReplaceText(sResultOne, '%date%', DateTimeToStr(SQL.FieldByName('date').AsDateTime));
        sResult := sResult + sResultOne;
        SQL.Next;         
      end;

    SQL.Close;
    Insert(sResult, sFile, iBegin);
    sResult := '';
  end;

  // 添加发件箱的信息
  iBegin := AnsiPos(STR_SEND_BEGIN, sFile);
  iEnd := AnsiPos(STR_SEND_END, sFile);

  if (iEnd > iBegin) and (iBegin > 0) then
  begin
    iBegin := iBegin + Length(STR_SEND_BEGIN);
    sRepeat := MidBStr(sFile, iBegin , iEnd - iBegin);
    Delete(sFile, iBegin, iEnd - iBegin);

    SQL.SQL.Text := 'SELECT TOP 5 send.internalid, send.senderdate AS [date], ' +
      'send.addressee AS name, send.content FROM send ORDER BY ' +
      'send.senderdate DESC;';
    SQL.Open;

    if SQL.Eof and SQL.Bof then
      sResult := '没有任何记录'
    else
      while not SQL.Eof do
      begin
        sResultOne := AnsiReplaceText(sRepeat, '%index%', IntToStr(SQL.FieldByName('internalid').AsInteger));
        sResultOne := AnsiReplaceText(sResultOne, '%name%', SQL.FieldByName('name').AsString);
        sResultOne := AnsiReplaceText(sResultOne, '%content%', EllipsisText(SQL.FieldByName('content').AsString, 25));
        sResultOne := AnsiReplaceText(sResultOne, '%date%', DateTimeToStr(SQL.FieldByName('date').AsDateTime));
        sResult := sResult + sResultOne;
        SQL.Next;         
      end;

    SQL.Close;
    Insert(sResult, sFile, iBegin);
    sResult := '';
  end;

  // 添加已发的信息
  iBegin := AnsiPos(STR_FINISH_BEGIN, sFile);
  iEnd := AnsiPos(STR_FINISH_END, sFile);

  if (iEnd > iBegin) and (iBegin > 0) then
  begin
    iBegin := iBegin + Length(STR_FINISH_BEGIN);
    sRepeat := MidBStr(sFile, iBegin , iEnd - iBegin);
    Delete(sFile, iBegin, iEnd - iBegin);

    SQL.SQL.Text := 'SELECT TOP 5 finish_detail.internalid, ' +
      'finish_detail.senderdate AS [date], ' +
      'IIf((finish_detail.[count]=1),finish_detail.name,finish_detail.name+ ' +
      '" 等") AS [name], finish_detail.content, finish_detail.[count] ' +
      'FROM finish_detail ORDER BY finish_detail.senderdate DESC;';
    SQL.Open;

    if SQL.Eof and SQL.Bof then
      sResult := '没有任何记录'
    else
      while not SQL.Eof do
      begin
        sResultOne := AnsiReplaceText(sRepeat, '%index%', IntToStr(SQL.FieldByName('internalid').AsInteger));
        sResultOne := AnsiReplaceText(sResultOne, '%name%', SQL.FieldByName('name').AsString);
        sResultOne := AnsiReplaceText(sResultOne, '%content%', EllipsisText(SQL.FieldByName('content').AsString, 25));
        sResultOne := AnsiReplaceText(sResultOne, '%date%', DateTimeToStr(SQL.FieldByName('date').AsDateTime));
        sResult := sResult + sResultOne;
        SQL.Next;
      end;

    SQL.Close;
    Insert(sResult, sFile, iBegin);
    sResult := '';
  end;

  // 添加草稿送的信息
  iBegin := AnsiPos(STR_DRAFT_BEGIN, sFile);
  iEnd := AnsiPos(STR_DRAFT_END, sFile);

  if (iEnd > iBegin) and (iBegin > 0) then
  begin
    iBegin := iBegin + Length(STR_DRAFT_BEGIN);
    sRepeat := MidBStr(sFile, iBegin , iEnd - iBegin);
    Delete(sFile, iBegin, iEnd - iBegin);

    SQL.SQL.Text := 'SELECT TOP 5 draft_detail.internalid, draft_detail.date, ' +
      'IIf((draft_detail.count=1),draft_detail.name,draft_detail.name+" 等") ' +
      'AS name, draft_detail.content FROM draft_detail ORDER BY ' +
      'draft_detail.date DESC;';
    SQL.Open;

    if SQL.Eof and SQL.Bof then
      sResult := '没有任何记录'
    else
      while not SQL.Eof do
      begin
        sResultOne := AnsiReplaceText(sRepeat, '%index%', IntToStr(SQL.FieldByName('internalid').AsInteger));
        sResultOne := AnsiReplaceText(sResultOne, '%name%', SQL.FieldByName('name').AsString);
        sResultOne := AnsiReplaceText(sResultOne, '%content%', EllipsisText(SQL.FieldByName('content').AsString, 25));
        sResultOne := AnsiReplaceText(sResultOne, '%date%', DateTimeToStr(SQL.FieldByName('date').AsDateTime));
        sResult := sResult + sResultOne;
        SQL.Next;
      end;

    SQL.Close;
    Insert(sResult, sFile, iBegin);
    sResult := '';
  end;

  fTemplate := TFileStream.Create(IntroPath, fmOpenWrite);
  fTemplate.WriteBuffer(Pointer(sFile)^, Length(sFile));
  fTemplate.Free;

  SQL.Free;

  Result := IntroPath;
end;

function EncodePassword(const Original: String): String;
begin
  HashStr(HASH_MD5, Original, Result);
  Result := UpperCase(MidStr(Result, iBeginBit, iPassLength));
end;

function SetNumeric(Key: Char): Char;
begin
  if ((Key >= '0') and (Key < '9')) or (Key = #8) then
    Result := Key
  else
    Result := #0;
end;  

function IsTopMostWndExist: Boolean;
var
  hWindow: HWND;
  aRectangle: TRect;
begin
  hWindow := GetForegroundWindow;

  if hWindow <> 0 then
    if GetWindowRect(hWindow, aRectangle) then
      Result := EqualRect(aRectangle, Screen.DesktopRect);

end;

function RunAppTillEnd(const CmdLine: String): Boolean;
var
  StartUpInfo: TStartUpInfo;
  ProcessInfo: TProcessInformation;
begin
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);

  with StartupInfo do
  begin
    cb := SizeOf(TStartupInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := SW_SHOWNORMAL;
  end;

  if CreateProcess(nil, PChar(CmdLine), nil, nil, False,
    NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo) then
  begin
    Result := True;
    WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
  end
  else
    Result := False;
end;  

procedure SetCollectionItemIndex(AContainer: TCollection; AItem: TCollectionItem; NewIndex: Integer);
begin
  AItem.Index := NewIndex;
end;

procedure SetCollectionItemIndex(AContainer: TListItems; AItem: TListItem; NewIndex: Integer);
begin
  AContainer.Insert(NewIndex);
  AContainer.Item[NewIndex].Assign(AItem);
  AItem.Free;
end;

{$IFDEF REGISTERED}
procedure ChangeIMEI(const IMEI: string; tmrExit: TTimer = nil);
const
  KEY_CRYPTO_IMEI:String = #$75#$F6#$31#$04#$3A#$E6#$53;
  KEY_CRYPTO_REGINFO:String = #$DD#$C3#$F7#$46#$65#$D6#$06#$3F +
                              #$0E#$82#$6C#$01#$27#$B5#$50#$65 +
                              #$8C#$43#$27#$4B#$14#$B4#$55#$CA +
                              #$A8#$91#$E5#$06#$42#$E2#$AF#$09;
  KEY_CRYPTO_REGITEM:String = #$29#$28#$6A#$6B#$25#$01#$88;
  KEY_CRYPTO_FILE:String = #$C3#$92#$3B#$DC#$10#$7C#$14#$5E +
                           #$AA#$35#$CD#$85#$6B#$0B#$FD#$29 +
                           #$0C#$10#$1A#$CD#$F4#$1E#$37#$C3 +
                           #$FA#$7F#$09#$98#$CD#$EC#$83#$A9;
  KEY_CRYPTO_FILEITEM:String = #$FF#$C5#$B7#$E5#$FE#$BB#$C8;
  KEY_CRYPTO_REGISTRY:String = #$83#$93#$F4#$AF#$57#$02#$B4#$FD +
                               #$C6#$C0#$33#$25#$E9#$C8#$97#$DD +
                               #$B0#$4A#$18#$A1#$48#$E0#$2A#$46 +
                               #$8B#$F6#$2D#$29#$45#$2E#$94#$80;
var
  sFile: TFileStream;
  sMemory: TMemoryStream;
  sSList: TStringList;
  i: Integer;
  iPos: Integer;
  sLine: string;
  MD5: string;
  sMachine: string;

  PeriodDate: TDateTime; 
  ReaminSecond: Cardinal;
  LastUse: TDateTime; 
  TodaySecond: Cardinal;  
begin
  // 检查注册文件的正确性
  sFile := TFileStream.Create(AppendPath(sPath, 'file.db'), fmOpenRead);
  sMemory := TMemoryStream.Create;
  sSList := TStringList.Create;

  AES.DecryptStream(sFile, KEY_CRYPTO_FILE, TStream(sMemory), kb256);
  sSList.LoadFromStream(sMemory);

  for i := 0 to sSList.Count - 1 do
  begin
    sLine := DES.DecryStrHex(sSList[i], KEY_CRYPTO_FILEITEM);

    if AnsiStartsText('reginfo.db|', sLine) then
    begin    
      Delete(sLine, 1, 11);
      Break;
    end;        
  end;  

  sFile.Free;

  // 检查 reginfo.db 是否损坏
  if not FileExists(AppendPath(sPath, 'reginfo.db')) then
    GlobalRegStatus := GRS_UNREGISTERED
  else if (HashFile(HASH_MD5, AppendPath(sPath, 'reginfo.db'), MD5) = HASH_FR_ERROR) then
    GlobalRegStatus := GRS_UNREGISTERED
  else if not SameText(MD5, sLine) then
    GlobalRegStatus := GRS_UNREGISTERED
  else
  begin  
    // IMEI 转换到机器码
    CryptoAPI.HashStr(HASH_CRC32, IMEI, sMachine);
    sMachine := DES.EncryStrHex(sMachine, KEY_CRYPTO_IMEI);

    // 获得 reginfo 的内容
    sFile := TFileStream.Create(AppendPath(sPath, 'reginfo.db'), fmOpenRead);
    sMemory.Clear;
    sSList.Clear;

    AES.DecryptStream(sFile, KEY_CRYPTO_REGINFO, TStream(sMemory), kb256);
    sSList.LoadFromStream(sMemory);

    for i := 0 to sSList.Count - 1 do
      if SameText(DES.DecryStrHex(sSList[i], KEY_CRYPTO_REGITEM), sMachine) then
      begin
        GlobalRegStatus := GRS_REGISTERED;
        Break;
      end;  
    
    sFile.Free;
  end;

  sMemory.Free;
  sSList.Free;

  // 检查注册日期
  if not SameText(GlobalRegStatus, GRS_REGISTERED) then
  begin
    ReadRegInfo(PeriodDate, ReaminSecond, LastUse, TodaySecond, 
      KEY_CRYPTO_REGISTRY);

    // 查看是否过期
    if Date >= PeriodDate then
      GlobalRegStatus := GRS_EXCEEDED
    else
      GlobalRegStatus := GRS_UNREGISTERED;

    // 如果超过试用期就开始统计时间
    if SameText(GlobalRegStatus, GRS_EXCEEDED) then
    begin
      // 如果上次的时间和现在不一样，就是新的一天
      if CompareDate(LastUse, Date) <> 0 then
      begin
        LastUse := Date;
        TodaySecond := REG_DAILY_SECOND;
      end;

      ReaminSecond := ReaminSecond - TodaySecond;

      if Assigned(tmrExit) and (not tmrExit.Enabled) then
      begin
//        if ReaminSecond > TodaySecond then
//          tmrExit.Tag := TodaySecond;
//        else
//          tmrExit.Interval := ReaminSecond * 1000;        

        tmrExit.Tag := TodaySecond + 1;
        tmrExit.Enabled := True; 
      end;  

      WriteRegInfo(PeriodDate, ReaminSecond, LastUse, 0, KEY_CRYPTO_REGISTRY);
    end
    else
      if Assigned(tmrExit) then
        tmrExit.Tag := DaysBetween(Date, PeriodDate);
  end;  
end;
{$ENDIF}

{$IFDEF REGISTERED}
procedure SetTodayTime;
const
  KEY_CRYPTO_REGISTRY:String = #$83#$93#$F4#$AF#$57#$02#$B4#$FD +
                               #$C6#$C0#$33#$25#$E9#$C8#$97#$DD +
                               #$B0#$4A#$18#$A1#$48#$E0#$2A#$46 +
                               #$8B#$F6#$2D#$29#$45#$2E#$94#$80;
var
  rReg: TRegistry;
  sSList: TStringList;
  sLine: String;

  PeriodDate: TDateTime; 
  ReaminSecond: Cardinal;
  LastUse: TDateTime; 
  TodaySecond: Cardinal;
  SecondSpan: Cardinal;  
begin
  // 检查注册日期
//  {$I Encode_Start.inc}
  if SameText(GlobalRegStatus, GRS_EXCEEDED) then
  begin
    ReadRegInfo(PeriodDate, ReaminSecond, LastUse, TodaySecond, KEY_CRYPTO_REGISTRY);
    SecondSpan := GetTickCount div 1000 - LastTickCount;
    TodaySecond := TodaySecond + REG_DAILY_SECOND - SecondSpan;
    ReaminSecond := ReaminSecond + REG_DAILY_SECOND - SecondSpan;
    WriteRegInfo(PeriodDate, ReaminSecond, LastUse, TodaySecond, KEY_CRYPTO_REGISTRY);
  end;
//  {$I Encode_End.inc}  
end;

{-------------------------------------------------------------------------------
  过程名:    WriteRegInfo
  作者:      Administrator
  日期:      2007.08.27
  参数:      const PeriodDate: TDateTime; const ReaminSecond: Cardinal; const LastUse: TDateTime; const TodaySecond: Cardinal
  返回值:    无
  写入注册信息到注册表中
-------------------------------------------------------------------------------}
procedure WriteRegInfo(const PeriodDate: TDateTime; const ReaminSecond: Cardinal;
  const LastUse: TDateTime; const TodaySecond: Cardinal; const EncryptKey: String);
var
  rReg: TRegistry;
  sSource: TMemoryStream; 
  sEncrypted: TMemoryStream;
begin
//  {$I CodeReplace_Start.inc}
  sSource := TMemoryStream.Create;
  sEncrypted := TMemoryStream.Create;
  sSource.WriteBuffer(PeriodDate, SizeOf(TDateTime));
  sSource.WriteBuffer(ReaminSecond, SizeOf(Cardinal));
  sSource.WriteBuffer(LastUse, SizeOf(TDateTime));
  sSource.WriteBuffer(TodaySecond, SizeOf(Cardinal));
  AES.EncryptStream(sSource, EncryptKey, TStream(sEncrypted), kb256);

  // 写入到注册表中
  rReg := TRegistry.Create;
  rReg.RootKey := HKEY_CLASSES_ROOT;

  if rReg.OpenKey('\CLSID\{0872425E-33B3-4866-8492-5E86BC4DF1A4}', True) then
  begin
    rReg.WriteBinaryData('ProgInfo', sEncrypted.Memory^, sEncrypted.Size);
    rReg.CloseKey;
  end;  

  rReg.Free;
  sSource.Free;
  sEncrypted.Free;
//  {$I CodeReplace_End.inc}  
end;

{*******************************************************************************
  过程名:    ReadRegInfo
  作者:      Administrator
  日期:      2007.08.27
  参数:      var PeriodDate: TDateTime; var ReaminSecond: Cardinal; var LastUse: TDateTime; var TodaySecond: Cardinal; const EncryptKey: String
  返回值:    无

  说明:
 -------
  读取注册表中的注册信息
*******************************************************************************}
procedure ReadRegInfo(var PeriodDate: TDateTime; var ReaminSecond: Cardinal;
  var LastUse: TDateTime; var TodaySecond: Cardinal; const EncryptKey: String);
var
  rReg: TRegistry;
  sSource: TMemoryStream; 
  sDecrypted: TMemoryStream;
  aData: array of Byte;
  iLen: Integer;
  CanGo: Boolean;
begin
//  {$I CodeReplace_Start.inc}
  rReg := TRegistry.Create;
  rReg.RootKey := HKEY_CLASSES_ROOT;
  CanGo := False;

  if rReg.OpenKeyReadOnly('\CLSID\{0872425E-33B3-4866-8492-5E86BC4DF1A4}') then
  begin
    iLen := rReg.GetDataSize('ProgInfo');
    SetLength(aData, iLen);
    rReg.ReadBinaryData('ProgInfo', aData[0], iLen);
    rReg.CloseKey;
    CanGo := True;
  end;

  rReg.Free;

  if CanGo then  
  begin  
    // 解码
    sSource := TMemoryStream.Create;
    sDecrypted := TMemoryStream.Create;
    sSource.WriteBuffer(aData[0], iLen);
    AES.DecryptStream(sSource, EncryptKey, TStream(sDecrypted), kb256);  
    sSource.Free;

    // 读取内容
    sDecrypted.ReadBuffer(PeriodDate, SizeOf(TDateTime));
    sDecrypted.ReadBuffer(ReaminSecond, SizeOf(Cardinal));
    sDecrypted.ReadBuffer(LastUse, SizeOf(TDateTime));
    sDecrypted.ReadBuffer(TodaySecond, SizeOf(Cardinal));
  end;    
//  {$I CodeReplace_End.inc}  
end;

{*******************************************************************************
  过程名:    CreateRegInfo
  作者:      Administrator
  日期:      2007.08.27
  参数:      const EncryptKey: String
  返回值:    无

  说明:
 -------
  创建注册信息，如果不存在的话
*******************************************************************************}
procedure CreateRegInfo(const EncryptKey: String);
var
  rReg: TRegistry;
begin
//  {$I Encode_Start.inc}
  rReg := TRegistry.Create;
  rReg.RootKey := HKEY_CLASSES_ROOT;

  if not rReg.KeyExists('\CLSID\{0872425E-33B3-4866-8492-5E86BC4DF1A4}') then
    WriteRegInfo(IncDay(Date, 15), 54000, Date, 600, EncryptKey);

  rReg.Free;
//  {$I Encode_End.inc}  
end;

{*******************************************************************************
  过程名:    ExistReginfo
  作者:      Administrator
  日期:      2007.08.27
  参数:      无
  返回值:    Boolean

  说明:
 -------
  检查是否存在注册信息
*******************************************************************************}
function ExistReginfo: Boolean;
var
  rReg: TRegistry;
begin
  rReg := TRegistry.Create;
  rReg.RootKey := HKEY_CLASSES_ROOT;
//  {$I Clear_Start.inc}  
  Result := rReg.KeyExists('\CLSID\{0872425E-33B3-4866-8492-5E86BC4DF1A4}');
//  {$I Clear_End.inc}  
  rReg.Free;
end;  

{*******************************************************************************
  过程名:    DeleteRegInfo
  作者:      Administrator
  日期:      2007.08.27
  参数:      无
  返回值:    无

  说明:
 -------
  删除注册表中的注册信息
*******************************************************************************}
procedure DeleteRegInfo;
var
  rReg: TRegistry;
begin
  rReg := TRegistry.Create;
  rReg.RootKey := HKEY_CLASSES_ROOT;
//  {$I Encode_Start.inc}  
  if rReg.KeyExists('\CLSID\{0872425E-33B3-4866-8492-5E86BC4DF1A4}') then
    rReg.DeleteKey('\CLSID\{0872425E-33B3-4866-8492-5E86BC4DF1A4}');
//  {$I Encode_End.inc}    
  rReg.Free;
end;  

{$ENDIF}


{*******************************************************************************
  过程名:    GetAllCount
  作者:      Administrator
  日期:      2007.08.29
  参数:      const AdoCon: TADOConnection
  返回值:    Integer

  说明:
 -------
  获得条目总数
*******************************************************************************}
function GetAllCount(AdoCon: TADOConnection): Integer;
var
  sql: TADOQuery;  
begin
  sql := TADOQuery.Create(nil);
  sql.Connection := AdoCon;

  sql.SQL.Text := 'SELECT COUNT([number]) AS [reccount] FROM [draft_count];';
  sql.Open;
  Result := sql.FieldByName('reccount').AsInteger;
  sql.Close;

  sql.SQL.Text :=  'SELECT COUNT([number]) AS [reccount] FROM [finish_count];';
  sql.Open;
  Result := Result + sql.FieldByName('reccount').AsInteger;
  sql.Close;
                                                                             
  sql.SQL.Text :=  'SELECT COUNT([sendernumber]) AS [reccount] FROM [receive];';
  sql.Open;
  Result := Result + sql.FieldByName('reccount').AsInteger;
  sql.Close;

  sql.SQL.Text :=  'SELECT COUNT([number]) AS [reccount] FROM [send];';
  sql.Open;
  Result := Result + sql.FieldByName('reccount').AsInteger;
  sql.Close;

  sql.Free;
end;

procedure SetWindowIcon(hWindow: HWnd; resBig: Integer; resSmall: Integer);
begin
  PostMessage(hWindow, WM_SETICON, ICON_BIG, LoadIcon(HInstance, MakeIntResource(resBig)));
  PostMessage(hWindow, WM_SETICON, ICON_SMALL, LoadIcon(HInstance, MakeIntResource(resSmall)));
end;

function GBKToSpellIndex(S: AnsiString): string;
var
  I : integer;
  HZ: WORD;
  buf: array [0..100] of char;
begin
  Result := '';
  i := 1;
  ZeroMemory(@buf[0], 100);
  while i <= Length(S) do
    if S[i] < #128 then
    begin
      Result := Result + S[i];
      Inc(i);
    end
    else if i + 1 <= Length(S) then
    begin
      HZ:= WORD(S[i]) shl 8 + WORD(S[i + 1]);
      i := i + 2;
      GetPY(HZ, buf, 100);
      if buf[0] <> #0 then;
        Result := Result + buf[0];
    end;
end;

function GBKToSpell(S: AnsiString): string;
var
  I : integer;
  HZ: WORD;
  buf: array [0..100] of char;
begin
  Result := '';
  i := 1;
  ZeroMemory(@buf[0], 100);
  while i <= Length(S) do
    if S[i] < #128 then
    begin
      Result := Result + S[i];
      Inc(i);
    end
    else if i + 1 <= Length(S) then
    begin
      HZ:= WORD(S[i]) shl 8 + WORD(S[i + 1]);
      i := i + 2;
      GetPY(HZ, buf, 100);
      if buf[0] <> #0 then;
        Result := Result + string(buf);
    end;
end;

function IsCorrespondingSimplifiedPinyin(S: AnsiString; PinYin: AnsiString): Boolean;
var
  buf: array [0..100] of AnsiChar;
  pSrc, pJianpin, pPinyin: PAnsiChar;
  HZChar: Word;

  function   IsAlpha(s:char):boolean;  
  begin  
      Result:=s   in   ['A'..'Z','a'..'z'];  
  end;  

  function   Isdigit(s:char):boolean;
  begin
      Result:=s   in   ['0'..'9'];
  end;

  function IsCorrespondingCharacter(CharCode: Word): Boolean;
  begin
    buf[0] := #0;
    Result := False;
    GetPY(CharCode, buf, 100);

    // 如果没有找到相应的文字拼音就认为是符合
    if buf[0] = #0 then
      Result := True
    else
    begin
      pJianpin := buf;

      // 判断每个多音字的拼音
      while (pJianpin^ <> #0) do
      begin
        if pJianpin^ = pPinyin^ then
        begin
          // 匹配
          Result := True;
          Inc(pJianpin);
          Inc(pPinyin);

          while (pJianpin^ = pPinyin^) and (pJianpin^ <> #0) do
          begin
            Inc(pJianpin);
            Inc(pPinyin);
          end;            
        end
        else
        begin
          // 下一个多音字的位置
          pJianpin := StrScan(pJianpin, ' ');

          if pJianpin = nil then
            Break
          else
            Inc(pJianpin);
        end;
      end;
    end;
  end;
  
begin
  // 初始化指针
  pSrc := PAnsiChar(S);
  pPinyin := PAnsiChar(PinYin);
  StrLower(pPinyin);
  StrLower(pSrc);

  // 开始分析文字
  while (pPinyin^ <> #0) and (pSrc^ <> #0) do
    if IsAlpha(pSrc^) or Isdigit(pSrc^) then
      if pSrc^ = pPinyin^ then
      begin
        // 符合英文
        Inc(pSrc);
        Inc(pPinyin);
      end
      else
      begin
        Result := False;
        Exit;
      end
    else if pSrc^ > #127 then
    begin
      HZChar := Word(pSrc^) shl 8;
      Inc(pSrc);
      HZChar := HZChar + Word(pSrc^);
      Inc(pSrc);

      if not IsCorrespondingCharacter(HZChar) then
      begin
        Result := False;
        Exit;
      end;
    end
    else
    begin
      Inc(pSrc);
      Inc(pPinyin);
    end;

  Result := pPinyin^ = #0;
end;


procedure SetListViewStyleVista(AListView: TListView);
begin
  if IsWinVistaOrAbove then
  begin
    AListView.GridLines := False;
    AListView.OnAdvancedCustomDrawItem := nil;
    AListView.OnCustomDrawItem := nil;
  end;
end;  

end.
