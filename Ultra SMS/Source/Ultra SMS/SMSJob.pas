unit SMSJob;

// SMS Job 单元，包含短信的一些使用的东西的动态存储

//{$DEFINE SNYC}

// ************
// * 接口部分 *
// ************
interface

uses
  Classes, ADODB, Windows, SysUtils, DateUtils, DGL_Integer;          // 用于定义 TCollection 和 TCollectionItem 类

type
  // ----- TJobKind 枚举：表示每个作业的类型 ----
  TJobKind = (
    jkSend,                          // 发送短消息
    jkReceive,                       // 收取短消息
    jkReadPhoneBook,                 // 读取电话本
    jkQueryNew,                      // 查询新短信
    jkSetCALLBACK,                   // 设置自动接收
    jkClearSMS,                      // 清空手机中的短信
    jkQueryInfo,                     // 查询手机的状态
    jkQueryTime,
    jkSetTime,
    jkCycleQuery,
    jkRemoveSMS
  );

  TRemoveSMSKind = (
    rskKeepPercent,                   // 保持百分比
    rskKeepNumber,                    // 保持固定条数
    rskKeepRecentDay,                 // 保持最近日期
    rskKeepDay                        // 保持到天数
  );

  TJobExtraInfo = packed record
  private
    case JobKind: TJobKind of
      jkQueryTime: (
        PPCTime: PDateTime;
        PPhoneTime: PDateTime;
        PRequestResult: PBoolean;
        hWindow: HWND);
      jkRemoveSMS: (
        RemoveUNREAD: Boolean;
        RemoveREAD: Boolean;
        RemoveDraft: Boolean;
        RemoveSent: Boolean;
        case KeepKind: TRemoveSMSKind of
          rskKeepPercent: (KPPercent: Real);
          rskKeepNumber: (KPNumber: Integer);
          rskKeepRecentDay: (KPRDay: Integer);
          rskKeepDay: (KPDDate: TDateTime);
        );
  end;

  TNotificationInfo = record
    WindowType: Integer;
    InternalID: Integer;
    ReceiveDate: TDateTime;
    SenderString: String;
  end;

  TMsgContent = record
    ID: Integer;
    Number: TStringList;
    Content: String;
    DateTime: TDateTime;
    IsReport: Boolean;
  end;

  //---- TSMSJob 类：表示每一个作业的具体内容 ----
  TSMSJob = class(TCollectionItem)
  public
    JobKind: TJobKind;
    FinishID: Integer;
    QueryID: Integer;
    Destination: string;
    Content: string;
    Name: String;
    Deletion: Boolean;
    RequireReport: Boolean;

    ExtraInfo: TJobExtraInfo;
  end;

  //---- TSMSJobQueue 类：表示每一个作业的集合 ----
  TSMSJobQueue = class(TCollection)
  // 定义私有成员
  private                     
    function FGetCount: Integer;
    function FGetLastMember: TSMSJob;
    function FGetFirstMember: TSMSJob;
    function FGetItem(Index: Integer): TSMSJob;
    procedure FSetItem(Index: Integer; Value: TSMSJob);

  // 共有成员
  public
    function AddTop(AJobKind: TJobKind = jkSend): TSMSJob; virtual;
    function Add(AJobKind: TJobKind = jkSend): TSMSJob; virtual;
    function AddSendJob(sDest, sContent, sName: string; iFinishID: Integer = 0): TSMSJob; virtual;
    function AddReceiveJob: TSMSJob; virtual;
    function AddReadPhonebBook: TSMSJob; virtual;
    property Count: integer read FGetCount;
    property LastItem: TSMSJob read FGetLastMember;
    property FirstItem: TSMSJob read FGetFirstMember;
    property Items[Index: Integer]: TSMSJob read FGetItem write FSetItem;
//    procedure Delete(Index: Integer);
  end;

  //----- TJobs 类： 线程相关的集合 --------
  TJobs =  Class(TSMSJobQueue)
  private
    procedure FAddListViewItem(Job: TSMSJob; IsTop: Boolean = False);
  public
    MaxRecord: Integer;
    function Add(AJobKind: TJobKind = jkSend): TSMSJob; override;
    function AddTop(AJobKind: TJobKind = jkSend): TSMSJob; override; 
    function AddSendJob(sDest, sContent, sName: string; iFinishID: Integer = 0): TSMSJob; override;
    function AddReceiveJob: TSMSJob; override;
    function AddReadPhonebBook: TSMSJob; override;
    procedure ClearAll;
    //procedure Delete(Index: Integer);
    procedure ChangeState;
    procedure RemoveFirst;
  end;

  //---- TJobThread 类：进行多线程操作 ----
  TJobThread = class(TThread)
  private
    { Private declarations }
    CurrentJobKind: TJobKind;
    CurrentNewNW: TNotificationInfo;
    function FSendSMS(ADestination, AMessage, AReceiver: string; Report: Boolean): Boolean;
    procedure QueryTime(APhoneTime: PDateTime; APCTime: PDateTime; Result: PBoolean; hWindow: HWND);
    function EnumerateSMSId(var slRecRead: TStringList; var slRecUnread: TStringList; var slStoSend: TStringList; var slStoUnsend: TStringList; bNewMessage: Boolean = False): Boolean;
    procedure FSetAnimation;
    function TestPort: Boolean;
    procedure FOpenNotificationWnd;
  protected
    procedure Execute; override;
    procedure Synchronize(Method: TThreadMethod; SyncMainThread: Boolean = False); overload;
  public
    JobContent: TJobs;
    InfoCenter: String;
    Abortion: Boolean;
    CycleQuery: Boolean;
    TimeZone: String;
    constructor Create(CreateSuspended: Boolean);
    function QuestName(dbContact: TADOTable; sSender: String; var Folder: String): String; overload;
    function QuestName(dbContact: TADOTable; sSender: TStringList): TStringList; overload;
    procedure ReadPhoneBook;
    procedure ReadSMS;
    procedure SendSMS;
    procedure QueryNew;
    procedure SetQueryCALLBACK;
    procedure ClearSMS;
    procedure QueryState;
    procedure FQueryTime;
    procedure SetPhoneTime;
    procedure QueryMessage;
    procedure RemoveSMS;
  end;

  //---- TJobThread 类：进行多线程操作 ----
  TRunCmd = class(TThread)
  protected
    procedure Execute; override;
  public
    Cmd: String;
  end;

  //---- EUserAbortion 类：用户取消操作 -----
  EUserAbortion = class(Exception)
  end;

//  EConnectionLost = class(Exception)
//  end;

  ECNMIUnsupported = class(Exception)
  end;

  // 一些常用的函数
  type
    TSMSCharset = (GSM, UCS2);

  function IsShowPopup: Boolean;
  function SetCharset(ACharset: TSMSCharset = UCS2): Boolean;
  function GetMemoryLocation(LocType: Integer = 0): TStringList;
  function ReadOneMessage(var slMsgList: TStringList; var messageContent: TMsgContent;
    PDUMode: Boolean; SendCommandRequired: Boolean = False): Boolean;

var
  defaultCNMI: String;
  CMTIBuffers: TStringList;
  MsgRefIDMap: TIntMap;
  
// ************
// * 实现部分 *
// ************

implementation

uses
  UserInterfaces, Messages, ComCtrls, DB, GerneralFunc, StrUtils,
  GSMChar, Variants, Forms, uFrmNotification, dxStatusBar, CryptoAPI,
  DGL_String, MultiSMS, Math;

function IsShowPopup: Boolean;
var
  bFullScreen: Boolean;
begin
  bFullScreen := IsFullScreen;
  Result := opShowNewMSG and ((not opShowNoFullScreen) or (opShowNoFullScreen and (not bFullScreen)));
end;

//  TSMSJobQueue 类
// -----------------
// [私有成员]
// 获得作业的个数
function TSMSJobQueue.FGetCount: Integer;
begin
  Result := inherited Count;
end;

// 获得最后一个作业
function TSMSJobQueue.FGetLastMember: TSMSJob;
var
  iCount: integer;
begin
  iCount := FGetCount;

  if iCount > 0 then
    Result := TSMSJob(inherited GetItem(iCount))
  else
    Result := nil;
end;

// 获得第一个作业
function TSMSJobQueue.FGetFirstMember: TSMSJob;
var
  iCount: integer;
begin
  iCount := FGetCount;

  if iCount > 0 then
    Result := TSMSJob(inherited GetItem(1))
  else
    Result := nil;
end;

function TSMSJobQueue.FGetItem(Index: Integer): TSMSJob;
begin
  Result := TSMSJob(inherited GetItem(Index));
end;

procedure TSMSJobQueue.FSetItem(Index: Integer; Value: TSMSJob);
begin
  inherited SetItem(Index, Value);
end;

// [公有函数]
// 添加一个东西
function TSMSJobQueue.Add(AJobKind: TJobKind = jkSend): TSMSJob;
begin
  Result := TSMSJob(inherited Add);
end;

function TSMSJobQueue.AddTop(AJobKind: TJobKind = jkSend): TSMSJob;
begin
  if Count >= 2 then
    Result := TSMSJob(inherited Insert(1))
  else
    Result := TSMSJob(inherited Add);
end;

// 添加一个读取电话本的作业
function TSMSJobQueue.AddReadPhonebBook: TSMSJob;
begin
  Result := TSMSJob(inherited Add);
  Result.JobKind := jkReadPhoneBook;
end;

// 添加一个读取电话本的作业
function TSMSJobQueue.AddReceiveJob: TSMSJob;
begin
  Result := TSMSJob(inherited Add);
  Result.JobKind := jkReceive;
end;

// 添加一个发送电话的作业
function TSMSJobQueue.AddSendJob(sDest, sContent, sName: string; iFinishID: Integer = 0): TSMSJob;
begin
  Result := TSMSJob(inherited Add);
  Result.JobKind := jkSend;
  Result.Destination := sDest;
  Result.Content := sContent;
  Result.FinishID := iFinishID;
  Result.Name := sName;
end;

function TJobs.Add(AJobKind: TJobKind = jkSend): TSMSJob;
begin
  Result := inherited Add;
  Result.JobKind := AJobKind;
  FAddListViewItem(Result);
end;

function TJobs.AddTop(AJobKind: TJobKind = jkSend): TSMSJob;
begin
  Result := inherited AddTop;
  Result.JobKind := AJobKind;
  FAddListViewItem(Result);
end;

function TJobs.AddSendJob(sDest, sContent, sName: string; iFinishID: Integer = 0): TSMSJob;
begin
  Result := inherited AddSendJob(sDest, sContent, sName, iFinishID);
  Result.RequireReport := wsReport;
  FAddListViewItem(Result);
end;

function TJobs.AddReceiveJob: TSMSJob;
begin
  Result := inherited AddReceiveJob;
  FAddListViewItem(Result);
end;

function TJobs.AddReadPhonebBook: TSMSJob;
begin
  Result := inherited AddReadPhonebBook;
  FAddListViewItem(Result);
end;

procedure TJobs.ClearAll;
begin
  inherited Clear;
end;

procedure TJobs.ChangeState;
begin
  if Count > 0 then
  begin
    frmMain.lvwJob.Items[0].ImageIndex := 1;
    frmMain.lvwJob.Items[0].SubItems[0] := '正在执行';
    frmMain.stbMain.Panels[1].Text := frmMain.lvwJob.Items[0].SubItems[1];
  end;
  frmMain.RefreshJobMenuState;
end;

procedure TJobs.RemoveFirst;
var
  i: Integer;
begin
  if Count > 0 then
  begin
    Delete(0);
    frmMain.lvwJob.Items.Delete(0);

    for i := 0 to frmMain.lvwJob.Items.Count - 1 do
      frmMain.lvwJob.Items[i].Caption := IntToStr(i + 1);

    frmMain.stbMain.Panels[1].Text := '(空闲)';
    frmMain.RefreshJobMenuState;
    frmMain.ShowTrayAnimation;
  end;
end;

procedure TJobs.FAddListViewItem(Job: TSMSJob; IsTop: Boolean = False);
var
  xItem: TListItem;
  Dest: String;
begin
  if frmMain.lvwJob.Items.Count > MaxRecord then
    frmMain.lvwJob.Items.Clear; 

  if (not IsTop) or (frmMain.lvwJob.Items.Count < 2) then
    xItem := frmMain.lvwJob.Items.Add
  else
    xItem := frmMain.lvwJob.Items.Insert(1);

  xItem.Caption := IntToStr(xItem.Index + 1);
  xItem.SubItems.Add('等待');

  if Length(Job.Name) > 0 then
    Dest := Job.Name + ' (' + Job.Destination + ')'
  else
    Dest := Job.Destination;

  case Job.JobKind of
    jkSend: xItem.SubItems.Add('发送短信至' + Dest);
    jkReceive: xItem.SubItems.Add('接收移动电话中的短信');
    jkReadPhoneBook: xItem.SubItems.Add('更新电话簿');
    jkQueryNew: xItem.SubItems.Add('接收新信息');
    jkSetCALLBACK: xItem.SubItems.Add('设置自动接收');
    jkClearSMS: xItem.SubItems.Add('清空手机中的短信');
    jkQueryInfo: xItem.SubItems.Add('查询手机状态');
    jkQueryTime: xItem.SubItems.Add('查询手机日期时间');
    jkSetTime: xItem.SubItems.Add('设置手机日期时间');
    jkCycleQuery: xItem.SubItems.Add('轮询新消息');
    jkRemoveSMS: xItem.SubItems.Add('清理手机中的短信');
  end;

  frmMain.RefreshJobMenuState;
end;

// 开始执行新的线程
constructor TJobThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  JobContent := TJobs.Create(TSMSJob);
  JobContent.MaxRecord := 2000;
end;

procedure TJobThread.Synchronize(Method: TThreadMethod; SyncMainThread: Boolean = False);
begin
{$IFDEF SNYC}
  inherited Synchronize(Method);
{$ELSE}
  if SyncMainThread then
    inherited Synchronize(Method)
  else
    Method;
{$ENDIF}
end;

procedure TJobThread.Execute;
begin
  { Place thread code here }
  while not Terminated do
  begin
    if JobContent.Count > 0 then
    begin
//      Synchronize(DisableTimer);
      try
        Abortion := False;
        CurrentJobKind := JobContent.Items[0].JobKind;
        Synchronize(FSetAnimation);
        Synchronize(JobContent.ChangeState);
        case JobContent.Items[0].JobKind of
          jkReadPhoneBook: Synchronize(ReadPhoneBook);
          jkReceive: Synchronize(ReadSMS);
          jkSend: Synchronize(SendSMS);
          jkQueryNew:
          begin
            Sleep(opCallbackInterval);
            Synchronize(QueryNew);
          end;
          jkSetCALLBACK: Synchronize(SetQueryCALLBACK);
          jkClearSMS: Synchronize(ClearSMS);
          jkQueryInfo: Synchronize(QueryState);
          jkQueryTime: Synchronize(FQueryTime);
          jkSetTime: Synchronize(SetPhoneTime);
          jkCycleQuery: Synchronize(QueryMessage);
          jkRemoveSMS: Synchronize(RemoveSMS);
        end;
        frmMain.stbMain.Panels[1].Text := '(空闲)';

        if varLastCommResult.ResultType = lartTimeout  then
        begin
          AddModemStaus(tsInfo, '与手机连接已断开。');
          frmMain.ShowPopHit('连接断开', 'Ultra SMS 与您的手机连接已经断开，' +
            '请确认您的数据线是否连接正确，或者您的手机是否超出了蓝牙的范围。', True);
          sBuffers.Clear;
          ClosePort(False);
          if opDCReconnect then
          begin
            Sleep(opDCReconInterval);
            frmMain.tmrReconnect.Tag := 0;
            frmMain.tmrReconnect.Enabled := True;
          end;
          Suspended := True;
          Continue;
        end;
      except
//        on E: EConnectionLost do
//        begin
//          AddModemStaus(tsInfo, '与手机连接已断开。');
//          frmMain.ShowPopHit('连接断开', 'Ultra SMS 与您的手机连接已经断开，' +
//            '请确认您的数据线是否连接正确，或者您的手机是否超出了蓝牙的范围。', True);
//          sBuffers.Clear;
//          ClosePort(False);
//          if opDCReconnect then
//          begin
//            Sleep(opDCReconInterval);
//            frmMain.tmrReconnect.Tag := 0;
//            frmMain.tmrReconnect.Enabled := True;
//          end;
//          Suspended := True;
//          Continue;
//        end;
        on E: Exception do AddModemStaus(tsError, E.Message);
      end;

      // 删除作业
      try
        if JobContent.Count > 1 then
        begin
          AddModemStaus(tsInfo, '等待 ' + IntToStr(opTaskInterval)  + ' ms');
          Sleep(opTaskInterval);
        end;
      except
         on E: Exception do AddModemStaus(tsError, E.Message);
      end;

      if Connected then JobContent.RemoveFirst;
    end
    else
    begin
      Suspended := True;
    end;
  end;
end;

// 读取电话簿
procedure TJobThread.ReadPhoneBook;
var
  tbPhoneBook: TADOTable;
  lBound, uBound: Integer;
  x, y: Integer;
  tmp: TStringList;
  tmpStr: String;
  tmpInt: Integer;
  InternationalIdentifier: String;
  slFaciliy: TStringList;
  i: Integer;
label
  OccurError, DBOccurError;
begin
  AddModemStaus(tsInfo, '开始读取电话簿');

  // 停止回响
  sBuffers.Clear;
  SendCommand('ATE0');
  if not WaitingForReturn then goto OccurError;
  sBuffers.Clear;
  if Abortion then raise EUserAbortion.Create('用户中断操作');

  // 设置字符集为 GSM
  if not SetCharset(GSM) then goto OccurError;
  sBuffers.Clear;
  if Abortion then raise EUserAbortion.Create('用户中断操作');

  // 查询可用的设备
  slFaciliy := TStringList.Create;

  SendCommand('AT+CPBS=?');
  if WaitingForMessage(2) then
    if Pos('MT', sBuffers[0]) > 0 then
      slFaciliy.Add('MT')
    else
    begin
      tmpStr := ExtractParameter(sBuffers[0]);
      if tmpStr[1] = '(' then Delete(tmpStr, 1, 1);
      if tmpStr[Length(tmpStr)] = ')' then Delete(tmpStr, Length(tmpStr), 1);
      tmp := ExtractAllParameter(tmpStr);

      for i := 0 to tmp.Count - 1 do
      begin
        tmp[i] := AnsiDequotedStr(tmp[i], '"');
        if  tmp[i] = 'ME' then
          slFaciliy.Add('ME')
        else if AnsiStartsText(tmp[i], 'SM') then
          slFaciliy.Add(tmp[i]);
      end;
    end;

  for i := 0 to slFaciliy.Count - 1 do
  begin
    // 切换储存类型
    sBuffers.Clear;
    SendCommand('AT+CPBS="' + slFaciliy[i] + '"');
    if not WaitingForReturn then
      Continue;
    sBuffers.Clear;

    if not SetCharset(UCS2) then goto OccurError;
    sBuffers.Clear;

    // 读取电话簿条目数目
    SendCommand('AT+CPBR=?');
    if not WaitingForReturn then goto OccurError;
    tmpStr := sBuffers[0];
    x :=  Pos(#40, tmpStr);
    tmpStr := MidStr(tmpStr, x + 1, Pos(#41, tmpStr) - x - 1);
    tmp := SplitString(tmpStr, '-');
    lBound := StrToInt(tmp[0]);
    uBound := StrToInt(tmp[1]);
    sBuffers.Clear;

    // 读取电话簿
    x := lBound;
    tbPhoneBook := TADOTable.Create(nil);
    tbPhoneBook.Connection := frmMain.adoContacts;
    tbPhoneBook.TableName := 'contact';
    tbPhoneBook.Open;
    repeat
      // 读取 10 个条目
      y := 0;
      if x + 9 > uBound then
        SendCommand(Format('AT+CPBR=%d,%d', [x, uBound]))
      else
        SendCommand(Format('AT+CPBR=%d,%d', [x, x + 9]));

      // 分析获得的数据
      if not WaitingForReturn(2000) then goto DBOccurError;
      while (sBuffers[y] <> 'OK') and (sBuffers[y] <> 'ERROR') do
      begin
        tmp := ExtractAllParameter(sBuffers[y]);
        tmpInt := StrToInt(ExtractPhoneNumber(tmp[0]));

        if opSEPhoneBookUCS2 then
          tmpStr := DecodeUnicodeBE(AnsiDequotedStr(tmp[1], '"'))
        else
          tmpStr := ConvertUCS2PhoneNumber(AnsiDequotedStr(tmp[1], '"'));

        InternationalIdentifier := ExtractParameter(tmp[2]);

        if ((StrToInt(InternationalIdentifier) and $70) = $10) and (tmpStr[1] <> '+') then
          tmpStr := '+' + tmpStr;

        if tbPhoneBook.Locate('phonenumber', tmpStr, []) then
          tbPhoneBook.Edit
        else
        begin
          tbPhoneBook.Append;
          tbPhoneBook.FieldByName('phonenumber').AsString := tmpStr;
        end;

        tbPhoneBook.FieldByName('id').AsInteger := tmpInt;
        if tmp.Count > 3 then
        begin
          tmpStr := DecodeUnicodeBE(AnsiDequotedStr(tmp[3], '"'));

          // 去除 Sony Ericsson 的斜杠
          if opSEPhoneBookSuffix then
          begin
            tmpInt := LastDelimiter('/' ,tmpStr);
            if tmpInt > 0 then
              tmpStr := Copy(tmpStr, 1, tmpInt - 1);
          end;

          tbPhoneBook.FieldByName('name').AsString := tmpStr;
        end;
        tbPhoneBook.Post;
        Inc(y);
      end;

      Inc(x, 10);
      sBuffers.Clear;

      // 取消操作
      if Abortion then
      begin
        tbPhoneBook.Close;
        tbPhoneBook.Free;
        slFaciliy.Free;
        raise EUserAbortion.Create('用户中断操作');
      end;
    until x > uBound;

    if not SetCharset(GSM) then goto OccurError;
    sBuffers.Clear;
  end;

  // 更新显示
  AddModemStaus(tsInfo, '电话簿已更新', True, '电话簿同步');
  PostMessage(frmMain.Handle, WM_UPDATE_PHONEBOOK, 0, 0);

  Exit;
DBOccurError:
  tbPhoneBook.Free;
  slFaciliy.Free;
OccurError:
  AddModemStaus(tsError, '有错误发生', True, '电话簿同步');
end;

function TJobThread.QuestName(dbContact: TADOTable; sSender: String; var Folder: String): String;
begin
  Result := '';
  Folder := '';
  if dbContact.RecordCount > 0 then
  begin
    dbContact.First;
    while not dbContact.Eof do
    begin
      if PhoneNumberSimilar(sSender, dbContact.FieldByName('phonenumber').AsString) then
      begin
        Result := dbContact.FieldByName('name').AsString;
        Folder := dbContact.FieldByName('folder').AsString;
        break;
      end;
      dbContact.Next;
    end;
  end;
end;

function TJobThread.QuestName(dbContact: TADOTable; sSender: TStringList): TStringList;
var
  i: Integer;
  strtmp: String;
begin
  Result := TStringList.Create;
  for i := 0 to sSender.Count - 1 do
    Result.Add(QuestName(dbContact, sSender[i], strtmp));
end;

// 读取全部短消息
procedure TJobThread.ReadSMS;
label
  OccurError, FreeObjects;
var
  dbSMS: TADOTable;
  dbSMSItem: TADOTable;
  dbContact: TADOTable;
  qryHashset: TADOQuery;
  i, j, k: Integer;
  InternalId: Integer;
  pdu: String;
  sFolder: String;
  slRecRead: TStringList;
  slRecUnread: TStringList;
  slStoSend: TStringList;
  slStoUnsend: TStringList;
  slTmp: TStringList;
  slHashSet: TStringList;
  hash: String;
  slStroageDevice: TStringList;
  msg: TMsgContent;

  function SearchForSame(sPhone: TStringList; sMsg: String): Boolean;
  var
    tItemList: TStringList;
  begin
    tItemList := TStringList.Create;
    tItemList.Assign(sPhone);
    tItemList.Sort;
    tItemList.Add(sMsg);
    HashStr(HASH_MD5, tItemList.Text, hash);
    tItemList.Free;

    Result := (slHashSet.IndexOf(hash) > -1);

  end;

begin
  // 添加信息
  AddModemStaus(tsInfo, '读取所有短信条目');

  // 停止回想
  sBuffers.Clear;
  SendCommand('ATE0');
  if not WaitingForReturn then goto OccurError;
  sBuffers.Clear;

  // 开始读取未读信息
  slRecRead := TStringList.Create;
  slRecUnread := TStringList.Create;
  slStoSend := TStringList.Create;
  slStoUnsend := TStringList.Create;
  slTmp := TStringList.Create;

  // 读取设备项目
  SetCharset(GSM);
  slStroageDevice := GetMemoryLocation;

  for k := 0 to slStroageDevice.Count - 1 do
  begin
    // 设置存储装置
    if k > 0 then
      SetCharset(GSM);

    sBuffers.Clear;
    SendCommand('AT+CPMS=' + slStroageDevice[k]);
    WaitingForReturn;

    // 设置字符集为 Unicode Big Endian
    if not SetCharset(UCS2) then goto OccurError;
    sBuffers.Clear;

    // 读取编号
    try
      if not EnumerateSMSId(slRecRead, slRecUnread, slStoSend, slStoUnsend) then
        raise Exception.Create('获取短信编号的时候发生错误。');

      if Abortion then raise EUserAbortion.Create('用户中断操作');
    except
      on EUserAbortion do
      begin
        dbSMS.Free;
        dbSMSItem.Free;
        dbContact.Free;
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        AddModemStaus(tsError, '用户中断操作');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '在读取短信序号的时候发生错误。');
      end;
    end;

    // 设置信息的编码方式
    if Abortion then raise EUserAbortion.Create('用户中断操作');

    // 打开电话簿
    try
      dbContact := TADOTable.Create(nil);
      dbContact.Connection := frmMain.adoContacts;
      dbContact.TableName := 'contact';
      dbContact.Open;
    except
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '在打开电话簿的时候发生错误。');
      end;
    end;

    // 读取已读的消息
    try
      sBuffers.Clear;
      dbSMS := TADOTable.Create(nil);
      dbSMS.Connection := frmMain.adoSMS;
      dbSMS.TableName := 'receive';
      dbSMS.Open;

      while ReadOneMessage(slRecRead, msg, opIScmgl = 1) do
      begin
        if not (msg.IsReport and opReceiveReportOnlyNew) then
        begin
          // 计算 hash
          slTmp.Clear;
          slTmp.Add(msg.Number[0]);
          slTmp.Add(msg.Content);
          HashStr(HASH_MD5, slTmp.Text, hash);

          if not dbSMS.Locate('receivedate;hash', VarArrayOf([msg.DateTime,
            hash]), []) then
          begin
            dbSMS.Append;
            dbSMS.FieldByName('receivedate').AsDateTime := msg.DateTime;
            dbSMS.FieldByName('sender').AsString := QuestName(dbContact, msg.Number[0], sFolder);
            dbSMS.FieldByName('sendernumber').AsString := msg.Number[0];
            dbSMS.FieldByName('read').AsBoolean := True;
            dbSMS.FieldByName('replied').AsBoolean := opRepliedReceive;
            if not msg.IsReport then
              dbSMS.FieldByName('content').AsString := msg.Content;
            dbSMS.FieldByName('id').AsInteger := msg.ID;
            if Length(sFolder) > 0 then dbSMS.FieldByName('folder').AsString := sFolder;
            dbSMS.FieldByName('hash').AsString := hash;
            dbSMS.Post;
          end;
        end;

        if Abortion then raise EUserAbortion.Create('用户中断操作');
      end;

      dbSMS.Close;
    except
      on EUserAbortion do
      begin
        dbSMS.Free;
        dbSMSItem.Free;
        dbContact.Free;
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        AddModemStaus(tsError, '用户中断操作');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '在接收已读取的消息时候发生错误。');
      end;
    end;

    // 读取未读的消息
    try
      dbSMS.Open;
      sBuffers.Clear;

      while ReadOneMessage(slRecUnread, msg, opIScmgl = 1) do
      begin
        if not (msg.IsReport and opReceiveReportOnlyNew) then
        begin
          // 计算 hash
          slTmp.Clear;
          slTmp.Add(msg.Number[0]);
          slTmp.Add(msg.Content);
          HashStr(HASH_MD5, slTmp.Text, hash);

          if not dbSMS.Locate('receivedate;hash', VarArrayOf([msg.DateTime,
            hash]), []) then
          begin
            dbSMS.Append;
            dbSMS.FieldByName('receivedate').AsDateTime := msg.DateTime;
            dbSMS.FieldByName('sender').AsString := QuestName(dbContact, msg.Number[0], sFolder);
            dbSMS.FieldByName('sendernumber').AsString := msg.Number[0];
            dbSMS.FieldByName('read').AsBoolean := False;
            if not msg.IsReport then
              dbSMS.FieldByName('content').AsString := msg.Content;
            dbSMS.FieldByName('id').AsInteger := msg.ID;
            if Length(sFolder) > 0 then dbSMS.FieldByName('folder').AsString := sFolder;
            dbSMS.FieldByName('hash').AsString := hash;
            dbSMS.Post;
          end;
        end;

        if Abortion then raise EUserAbortion.Create('用户中断操作');
      end;

      dbSMS.Close;
    except
      on EUserAbortion do
      begin
        dbSMS.Free;
        dbSMSItem.Free;
        dbContact.Free;
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        AddModemStaus(tsError, '用户中断操作');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '在接收未读取的消息时候发生错误。');
      end;
    end;

    // 读取草稿
    try
      sBuffers.Clear;
      dbSMSItem := TADOTable.Create(nil);
      dbSMSItem.Connection := frmMain.adoSMS;
      dbSMS.TableName := 'draft';
      dbSMSItem.TableName := 'draft_item';
      dbSMSItem.Open;
      dbSMS.Open;
      dbSMS.Sort := 'date DESC';

      // 填充 HashSet
      slHashSet := TStringList.Create;
      slHashSet.Sorted := True;

      if slStoUnsend.Count <> 0 then
      begin
        qryHashset := TADOQuery.Create(nil);
        qryHashset.Connection := frmMain.adoSMS;
        qryHashset.SQL.Text := 'SELECT TOP ' + IntToStr(slStoUnsend.Count) + ' [hash] FROM [draft] WHERE [id]<>0 ORDER BY [date] DESC;';
        qryHashset.Open;

        while not qryHashset.Eof do
        begin
          slHashSet.Add(qryHashset.FieldByName('hash').AsString);
          qryHashset.Next;
        end;

        qryHashset.Close;
        qryHashset.Free;
      end;

      while ReadOneMessage(slStoUnsend, msg, opIScmgl = 1) do
      begin
        if not SearchForSame(msg.Number, msg.Content) then
        begin
          dbSMS.Append;
          dbSMS.FieldByName('id').AsInteger := msg.ID;
          dbSMS.FieldByName('content').AsString := msg.Content;
          dbSMS.FieldByName('hash').AsString := hash;
          dbSMS.FieldByName('date').AsDateTime := msg.DateTime;
          dbSMS.Post;
          InternalId := dbSMS.FieldByName('internalid').AsInteger;

          slTmp := QuestName(dbContact, msg.Number);

          for j := 0 to msg.Number.Count - 1 do
          begin
            dbSMSItem.Append;
            dbSMSItem.FieldByName('associatedid').AsInteger := InternalId;
            dbSMSItem.FieldByName('name').AsString := slTmp[j];
            if Length(msg.Number[j]) > 0 then
              dbSMSItem.FieldByName('number').AsString := msg.Number[j]
            else
              dbSMSItem.FieldByName('number').Clear;
            dbSMSItem.Post;
          end;
        end;

        sBuffers.Clear;
        if Abortion then raise EUserAbortion.Create('用户中断操作');
      end;

      slHashSet.Free;
      dbSMS.Close;
      dbSMSItem.Close;
    except
      on EUserAbortion do
      begin
        dbSMS.Free;
        dbSMSItem.Free;
        dbContact.Free;
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        slHashSet.Free;
        AddModemStaus(tsError, '用户中断操作');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '在接收草稿时候发生错误。');
      end;
    end;

    // 读取已发邮件
    try
      sBuffers.Clear;
      dbSMS.TableName := 'finish';
      dbSMS.Open;
      dbSMS.Sort := 'senderdate DESC';
      dbSMS.Filter := 'id > 0';
      dbSMS.Filtered := True;

      dbSMSItem.TableName := 'finish_item';
      dbSMSItem.Open;

      // 填充 HashSet
      slHashSet := TStringList.Create;

      if slStoSend.Count <> 0 then
      begin
        qryHashset := TADOQuery.Create(nil);
        qryHashset.Connection := frmMain.adoSMS;
        qryHashset.SQL.Text := 'SELECT TOP ' + IntToStr(slStoSend.Count * 4) + ' [hash] FROM [finish] '{'WHERE [id]>0'} + ' ORDER BY [senderdate] DESC;';
        qryHashset.Open;

        while not qryHashset.Eof do
        begin
          slHashSet.Add(qryHashset.FieldByName('hash').AsString);
          qryHashset.Next;
        end;

        qryHashset.Close;
        qryHashset.Free;
      end;

      while ReadOneMessage(slStoSend, msg, opIScmgl = 1) do
      begin
        if not SearchForSame(msg.Number, msg.Content) then
        begin
          dbSMS.Append;
          dbSMS.FieldByName('id').AsInteger := msg.ID;
          dbSMS.FieldByName('content').AsString := msg.Content;
          dbSMS.FieldByName('senderdate').AsDateTime := msg.DateTime;
          dbSMS.FieldByName('hash').AsString := hash;
          dbSMS.Post;
          InternalId := dbSMS.FieldByName('internalid').AsInteger;

          slTmp := QuestName(dbContact, msg.Number);

          for j := 0 to msg.Number.Count - 1 do
          begin
            dbSMSItem.Append;
            dbSMSItem.FieldByName('associatedid').AsInteger := InternalId;
            dbSMSItem.FieldByName('name').AsString := slTmp[j];
            dbSMSItem.FieldByName('number').AsString := msg.Number[j];
            dbSMSItem.Post;
          end;
        end;

        sBuffers.Clear;
        if Abortion then raise EUserAbortion.Create('用户中断操作');
      end;

      slHashSet.Free;
      dbSMS.Close;
      dbSMSItem.Close;
      dbSMSItem.Free;
    except
      on EUserAbortion do
      begin
        dbSMS.Free;
        dbSMSItem.Free;
        dbContact.Free;
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        AddModemStaus(tsError, '用户中断操作');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '在接收已发送的消息时候发生错误。');
      end;
    end;

    // 删除收取的短信
    if opDelMessage then
      try
        slTmp.Clear;
        slTmp.AddStrings(slRecRead);
        slTmp.AddStrings(slRecUnread);
        slTmp.AddStrings(slStoSend);
        if opDelDraft then slTmp.AddStrings(slStoUnsend);

        for i := 0 to slTmp.Count - 1 do
        begin
          sBuffers.Clear;
          SendCommand('AT+CMGD=' + slTmp[i]);
          WaitingForReturn;
        end;  
      except
        on EUserAbortion do
        begin
          dbSMS.Free;
          dbSMSItem.Free;
          dbContact.Free;
          slTmp.Free;
          slRecRead.Free;
          slRecUnread.Free;
          slStoSend.Free;
          slStoUnsend.Free;
          AddModemStaus(tsError, '用户中断操作');
          Exit;
        end;
        on E: Exception do
        begin
          AddModemStaus(tsError, E.Message);
          AddModemStaus(tsError, '在删除消息时候发生错误。');
        end;
      end;
  end;

  AddModemStaus(tsInfo,'全部短信接收完成', True, '接收信息');
  dbContact.Close;

FreeObjects:
  dbSMS.Free;
  dbContact.Free;
  slTmp.Free;
  slRecRead.Free;
  slRecUnread.Free;
  slStoSend.Free;
  slStoUnsend.Free;

  if opShowTrayIcon then
    frmMain.RefreshNewTray;

  if frmMain.CurrentView <> cvSend then
    frmMain.RefreshView;
    
  Exit;
OccurError:
  AddModemStaus(tsError, '有错误发生', True, '接收信息');
end;

procedure TJobThread.ClearSMS;
label
  OccurError;
var
  i, k: Integer;
  slRecRead: TStringList;
  slRecUnread: TStringList;
  slStoSend: TStringList;
  slStoUnsend: TStringList;
  slTmp: TStringList;
  slStroageDevice: TStringList;
  msg: TMsgContent;
begin
  // 添加信息
  AddModemStaus(tsInfo, '删除手机中所有短信条目');

  // 停止回想
  sBuffers.Clear;
  SendCommand('ATE0');
  if not WaitingForReturn then goto OccurError;
  sBuffers.Clear;

  // 设置字符集为 GSM
  SetCharset(GSM);
  slStroageDevice := GetMemoryLocation;

  slRecRead := TStringList.Create;
  slRecUnread := TStringList.Create;
  slStoSend := TStringList.Create;
  slStoUnsend := TStringList.Create;
  slTmp := TStringList.Create;
  
  // 读取编号
  for k := 0 to slStroageDevice.Count - 1 do
  begin
    sBuffers.Clear;
    SendCommand('AT+CPMS=' + slStroageDevice[k]);
    WaitingForReturn;

    try
      if not EnumerateSMSId(slRecRead, slRecUnread, slStoSend, slStoUnsend) then
        raise Exception.Create('获取短信编号的时候发生错误。');
      
      if Abortion then raise EUserAbortion.Create('用户中断操作');
    except
      on EUserAbortion do
      begin
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        AddModemStaus(tsError, '用户中断操作');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '在读取短信序号的时候发生错误。');
      end;
    end;

    // 删除手机中的短信
    try
      slTmp.Clear;
      slTmp.AddStrings(slRecRead);
      slTmp.AddStrings(slRecUnread);
      slTmp.AddStrings(slStoSend);
      if opDelDraft then slTmp.AddStrings(slStoUnsend);

      for i := 0 to slTmp.Count - 1 do
      begin
        sBuffers.Clear;
        SendCommand('AT+CMGD=' + slTmp[i]);
        WaitingForReturn;
      end;
    except
      on EUserAbortion do
      begin
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        AddModemStaus(tsError, '用户中断操作');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '在删除消息时候发生错误。');
      end;
    end;
  end;

  AddModemStaus(tsInfo,'所有短信已经清空', True, '清空手机短信');
  slTmp.Free;
  slRecRead.Free;
  slRecUnread.Free;
  slStoSend.Free;
  slStoUnsend.Free;

  Exit;
OccurError:
  AddModemStaus(tsError, '有错误发生', True, '清空手机短信');
end;

// 发送短消息
function TJobThread.FSendSMS(ADestination, AMessage, AReceiver: string; Report: Boolean): Boolean;
var
  sCmd: String;
  iMaxChar: Integer;
  iPdu: Integer;
  bUnicode: Boolean;
  bLongSMS: Boolean;
  slSeparated: TStringList;
  i, j: Integer;
  iSMSReferenceNumber: Integer;
  iStorageNumber: Integer;
  sMsg: WideString;
  slLocation: TStringList;
const
  slAvailableStorage: array[0..3] of string
    = ('"ME"', '"004D0045"',
       '"MT"', '"004D0054"');
begin
  // 准备一些事情
  Result := False;
  bUnicode := IsSpecificTest(AMessage);
  sMsg := WideString(AMessage);
  sBuffers.Clear;

  if Length(AReceiver) > 0 then
    AReceiver := AReceiver + ' (' + ADestination + ')'
  else
    AReceiver := ADestination;

  if bUnicode then
    iMaxChar := 70
  else
    iMaxChar := 160;

  // 长短信分割方式
  if opLongSMS and (Length(sMsg) > iMaxChar) then
  begin
    if bUnicode then
      iMaxChar := 67
    else
      iMaxChar := 153;

    bLongSMS := True;
    Randomize;
    iSMSReferenceNumber := Trunc(Random(256));
  end
  else
    bLongSMS := False;

  // 停止回想
  SendCommand('ATE0');
  if not WaitingForReturn then Exit;
  sBuffers.Clear;

  // 切换为 GSM 字符集
  AddModemStaus(tsInfo, '发送消息到' + AReceiver);
  if not SetCharset(UCS2) then Exit;
  sBuffers.Clear;

  // 切换为 PDU 模式
  SendCommand('AT+CMGF=0');
  if not WaitingForReturn then Exit;
  sBuffers.Clear;

  if Abortion then
  begin
    sBuffers.Clear;
    AddModemStaus(tsError, '发送短信被取消', True, '发信息');
    Exit;
  end;

  // 设置短信存储地方
  slLocation := GetMemoryLocation(1);
  j := -1;

  for i := 0 to 4 - 1 do
  begin
    j := slLocation.IndexOf(slAvailableStorage[i]);

    if (j >= 0) then
    begin
      sBuffer := slAvailableStorage[i];
      Break;
    end;
  end;

  slLocation.Free;

  if (j >= 0) then
  begin
    sBuffers.Clear;
    SendCommand(Format('AT+CPMS=%s,%s', [sBuffer, sBuffer]));
    if not WaitingForReturn then Exit;
  end;

  // 分割发送
  slSeparated := TStringList.Create;

  while Length(sMsg) > 0 do
  begin
    if Length(sMsg) > iMaxChar then
    begin
      slSeparated.Add(LeftStr(sMsg, iMaxChar));
      Delete(sMsg, 1, iMaxChar);
    end
    else
    begin
      slSeparated.Add(sMsg);
      sMsg := '';
    end;
  end;

  for i := 0 to slSeparated.Count - 1 do
  begin
    // PDU 编码
    sBuffer := '';
    Inc(MessageReference);
    
    if Report then
      sCmd := PDUSendString(iPdu, InfoCenter, ADestination, slSeparated[i], bUnicode, 17 + 32, MessageReference, 0, bLongSMS, slSeparated.Count, i, iSMSReferenceNumber)
    else
      sCmd := PDUSendString(iPdu, InfoCenter, ADestination, slSeparated[i], bUnicode, 17, MessageReference, 0, bLongSMS, slSeparated.Count, i, iSMSReferenceNumber);  // +32 发送报告
      
    sBuffer := '';
    sBuffers.Clear;

    // 发送还是存储
    if opWritePhoneMemoy then
      SendCommand(Format('AT+CMGW=%d',[iPdu]))
    else
      SendCommand(Format('AT+CMGS=%d',[iPdu]));

    // 输入确认
    if not WaitingForInput then
    begin
      // 取消发送
      SendCommand(#$1B);
      slSeparated.Free;
      Exit;
    end;

    // 用户取消
    if Abortion then
    begin
      // 取消发送
      SendCommand(#$1B);
      sBuffers.Clear;
      AddModemStaus(tsError, '发送短信被取消', True, '发信息');
      slSeparated.Free;
      Exit;
    end;  

    // 写入PDU
    SendCommand(sCmd + #$1A);

    if opWritePhoneMemoy then
    begin
      // 如果是直接写入存储器
      if not WaitingForReturnValue('+CMGW:', sBuffer) then
        Exit;

      // 发送信息
      sBuffers.Clear;
      SendCommand(Format('AT+CMSS=%s', [sBuffer]));

      // 获得结果
      if not WaitingForReturnValue('+CMSS:', sBuffer, 30000) then
        Exit;

      MessageReference := StrToInt(sBuffer);
    end
    else
    begin
      // 如果 是直接发送
      if not WaitingForReturn(30000) then Exit;
      if Pos('+CMGS:', sBuffers.Text) = 0 then
        Exit
      else
      begin
        for j := 0 to sBuffers.Count - 1 do
          if AnsiStartsStr('+CMGS:', sBuffers[j]) then
          begin
            sBuffer := sBuffers[j];
            Break;
          end;

        sBuffer := ExtractParameter(sBuffer);
        MessageReference := StrToInt(sBuffer);
      end;
    end;

    sBuffers.Clear;
  end;

  AddModemStaus(tsInfo, '发送短信成功至' + AReceiver, True, '发信息');
  Result := True;
  slSeparated.Free;
end;

// 发送信息
procedure TJobThread.SendSMS;
var
//  dbFinish: TADOTable;
  dbOutbox: TADOTable;
//  sOriPhone: String;
//  sOriName: String;
  SQL: TADOQuery;
  AJob: TSMSJob;
  slHash: TStringList;
  hash: String;
//  noticewnd: TNotice;
  InternalID: Integer;
begin
  AJob := JobContent.Items[0];
  SQL := TADOQuery.Create(nil);
  SQL.Connection := frmMain.adoSMS;
  AJob.Content := AnsiReplaceText(AJob.Content, #$D#$A, #$D);

  if FSendSMS(AJob.Destination, AJob.Content, AJob.Name , AJob.RequireReport) then
  // 发送成功
  begin
    // 添加 Message Reference 和数据库ID 的映射
    MsgRefIDMap.Insert(MessageReference, AJob.FinishID);

    // 更新发送事件的时间
    SQL.SQL.Add(Format('UPDATE finish SET finish.senderdate = "%s"', [DateTimeToStr(Now)]));
    SQL.SQL.Add(Format('WHERE finish.internalid = %s;', [IntToStr(AJob.FinishID)]));
    SQL.ExecSQL;

    // 添加发送信息
    SQL.SQL.Clear;
    SQL.SQL.Add('INSERT INTO finish_item (associatedid, name, [number])');
    SQL.SQL.Add(Format('VALUES (%d, "%s", "%s");', [AJob.FinishID, AJob.Name, AJob.Destination]));
    SQL.ExecSQL;

    // 重新计算 Hash
    SQL.SQL.Clear;
    SQL.SQL.Add('SELECT finish_item.number');
    SQL.SQL.Add('FROM finish_item');
    SQL.SQL.Add(Format('WHERE (((finish_item.associatedid)=%d))', [AJob.FinishID]));
    SQL.SQL.Add('ORDER BY finish_item.number;');
    SQL.Open;

    slHash := TStringList.Create;

    while not SQL.Eof do
    begin
      slHash.Add(SQL.FieldByName('number').AsString);
      SQL.Next;
    end;

    SQL.Close;

    slHash.Add(AJob.Content);
    HashStr(HASH_MD5, slHash.Text, hash);
    slHash.Free;

    // 更新发送的内容的 HASH
    SQL.SQL.Clear;
    SQL.SQL.Add(Format('UPDATE finish SET finish.hash = "%s"', [hash]));
    SQL.SQL.Add(Format('WHERE finish.internalid = %d;', [AJob.FinishID]));
    SQL.ExecSQL;

    if (frmMain.CurrentView = cvFinish) or (frmMain.CurrentView = cvNone) then
      frmMain.RefreshView(AJob.FinishID);
  end
  // 发送失败，添加到发件箱
  else
  begin
    AddModemStaus(tsError, '发送失败，保存至发件箱', True, '发信息');
    dbOutbox := TADOTable.Create(nil);
    dbOutbox.Connection := frmMain.adoSMS;
    dbOutbox.TableName := 'send';
    dbOutbox.Open;
    dbOutbox.Append;
    dbOutbox.FieldByName('senderdate').AsDateTime := Now;
    dbOutbox.FieldByName('addressee').AsString := AJob.Name;
    dbOutbox.FieldByName('number').AsString := AJob.Destination;
    dbOutbox.FieldByName('content').AsString := AJob.Content;
    dbOutbox.FieldByName('finishid').AsInteger := AJob.FinishID;
    dbOutbox.Post;
    InternalID := dbOutbox.FieldByName('internalid').AsInteger;
    dbOutbox.Close;
    dbOutbox.Free;

    if opAutoReconnect and (not Abortion) then
    begin
      Sleep(opTaskInterval);
      ClosePort(False);
      Sleep(opTaskInterval);
      OpenPortDef;
    end;      

    // 显示提示窗口
    if IsShowPopup then
      try
        CurrentNewNW.WindowType := Integer(ntMsgError);
        CurrentNewNW.InternalID := InternalID;
        CurrentNewNW.ReceiveDate := Now;
        CurrentNewNW.SenderString := AJob.Name;
        Synchronize(FOpenNotificationWnd, True);
      finally
        ;
      end;

    if (frmMain.CurrentView = cvSend) or (frmMain.CurrentView = cvNone) then
      frmMain.RefreshView;
  end;

  SQL.Free;
end;

// 查询新消息
procedure TJobThread.QueryMessage;
var
//  pdu: String;
  i: Integer;
  slRecUnread: TStringList;
  dbSMS: TADOTable;
  dbContact: TADOTable;
  sFolder: String;
  slTmp: TStringList;
  hash: string;
//  noticewnd: TNotice;
  bUpdated: Boolean;
  msg: TMsgContent;
begin
  // 添加信息
  AddModemStaus(tsInfo, '读取所有短信条目');

  // 停止回想
  sBuffers.Clear;
  SendCommand('ATE0');
  if not WaitingForReturn then
  begin
    AddModemStaus(tsError, '有错误发生', True, '接收信息');
//    if ConnectionLost then
//      raise EConnectionLost.Create('连接丢失');
    Exit;
  end;
  sBuffers.Clear;

  // 设置存储器
  sBuffers.Clear;
  SendCommand('AT+CPMS?');
  WaitingForReturn;
  slTmp := ExtractAllParameter(sBuffers[0]);
  if slTmp.Count >=9 then
  begin
    if (StrToIntDef(slTmp[8], 1000) - StrToIntDef(slTmp[7], 0) < 4) then
      frmMain.ShowPopHit('手机空间不足', '您的短信存储器容量已经不足，' +
      '请从手机中删除某些短信。', True);

    sBuffers.Clear;
    SendCommand('AT+CPMS=' + slTmp[6]);
    WaitingForReturn;
  end;  

  slRecUnread := TStringList.Create;
  i := 0;
  bUpdated := False;

  if not EnumerateSMSId(slRecUnread, slRecUnread, slRecUnread, slRecUnread, True) then
  begin
    slRecUnread.Free;
    if CycleQuery then
      UserInterfaces.JobThread.JobContent.Add(jkCycleQuery);
    Exit;
  end;

  if slRecUnread.Count = 0 then
  begin
    slRecUnread.Free;
    if CycleQuery then
      UserInterfaces.JobThread.JobContent.Add(jkCycleQuery);
    Exit;
  end;

  // 显示托盘图标的动画效果
  frmMain.ShowTrayAnimation(True, jkQueryNew);

  // 打开电话簿
  try
    dbContact := TADOTable.Create(nil);
    dbContact.Connection := frmMain.adoContacts;
    dbContact.TableName := 'contact';
    dbContact.Open;
  except
    on E: Exception do
    begin
      AddModemStaus(tsError, E.Message);
      AddModemStaus(tsError, '在打开电话簿的时候发生错误。');
    end;
  end;

  // 读取新短信
  try
    dbSMS := TADOTable.Create(nil);
    dbSMS.Connection := frmMain.adoSMS;
    dbSMS.TableName := 'receive';
    dbSMS.Open;
    sBuffers.Clear;

    while ReadOneMessage(slRecUnread, msg, opIScmgl = 1) do
    begin
      // 计算 hash
      slTmp.Clear;
      slTmp.Add(msg.Number[0]);
      slTmp.Add(msg.Content);
      HashStr(HASH_MD5, slTmp.Text, hash);

      if not dbSMS.Locate('receivedate;hash', VarArrayOf([msg.DateTime,
        hash]), []) then
        if (opQueryNewModel = 3) or ((opQueryNewModel = 1) and msg.IsReport) or ((opQueryNewModel = 2) and (not msg.IsReport)) then
        begin
          dbSMS.Append;
          dbSMS.FieldByName('receivedate').AsDateTime := msg.DateTime;
          dbSMS.FieldByName('sender').AsString := QuestName(dbContact, msg.Number[0], sFolder);
          dbSMS.FieldByName('sendernumber').AsString := msg.Number[0];
          dbSMS.FieldByName('read').AsBoolean := False;
          if not msg.IsReport then
            dbSMS.FieldByName('content').AsString := msg.Content;
          dbSMS.FieldByName('id').AsInteger := 0;
          if Length(sFolder) > 0 then dbSMS.FieldByName('folder').AsString := sFolder;
          dbSMS.FieldByName('hash').AsString := hash;
          dbSMS.Post;

          bUpdated := True;

          if IsShowPopup then
            try
              if msg.IsReport then
                CurrentNewNW.WindowType := Integer(ntMsgReport)
              else
                CurrentNewNW.WindowType := Integer(ntNewMsg);

              CurrentNewNW.InternalID := dbSMS.FieldByName('internalid').AsInteger;
              CurrentNewNW.ReceiveDate := msg.DateTime;
              CurrentNewNW.SenderString := dbSMS.FieldByName('sender').AsString;
              Synchronize(FOpenNotificationWnd, True);
            finally
              ;
            end;
        end;

        // 删除信息
        if opDelMessage or (opDeleteReport and msg.IsReport) then
        begin
          sBuffers.Clear;
          SendCommand('AT+CMGD=' + slRecUnread[i]);
          WaitingForReturn;
        end;

        sBuffers.Clear;
      if Abortion then raise EUserAbortion.Create('用户中断操作');
    end;
  except
    on EUserAbortion do
    begin
      dbSMS.Free;
      dbContact.Free;
      slTmp.Free;
      slRecUnread.Free;
      AddModemStaus(tsError, '用户中断操作');
      Exit;
    end;
    on E: Exception do
    begin
      AddModemStaus(tsError, E.Message);
      AddModemStaus(tsError, '在接收未读取的消息时候发生错误。');
    end;
  end;

  AddModemStaus(tsInfo,'轮询新短信完成');
  dbSMS.Close;
  dbContact.Close;

  dbSMS.Free;
  dbContact.Free;

  if bUpdated and opShowTrayIcon then
    frmMain.RefreshNewTray;

  if bUpdated and (frmMain.CurrentView = cvReceive) then
    frmMain.RefreshView;

  slRecUnread.Free;

//  if CycleQuery then
//    JobThread.JobContent.Add(jkCycleQuery);

  Exit;


end;

// 查询新短信
procedure TJobThread.QueryNew;
label
  OccurError;
var
  dbSMS: TADOTable;
  dbContact: TADOTable;
  dbOrigin: TADOQuery;
  sFolder: String;
  msg: TMsgContent;
  slSender: TStringList;
  slRecUnread: TStringList;
  slTmp: TStringList;
  DisplayStr: String;
  MsgReport: Boolean;
  hash: String;
  bUpdated: Boolean;
begin
  // 添加信息
  AddModemStaus(tsInfo, '接收新的短信');
  MsgReport := False;
  bUpdated := False;

  // 停止回想
  sBuffers.Clear;
  SendCommand('ATE0');
  if not WaitingForReturn(10000) then goto OccurError;
  sBuffers.Clear;
  if Abortion then raise EUserAbortion.Create('用户中断操作');

  // 设置存储装置
  SendCommand('AT+CPMS=' + JobContent.Items[0].Destination);
  WaitingForReturn;
  sBuffers.Clear;

  // 设置字符集为 Unicode Big Endian
  if not SetCharset(UCS2) then goto OccurError;
  sBuffers.Clear;
  if Abortion then raise EUserAbortion.Create('用户中断操作');

  // 设置信息的编码方式
  if opIScmgl = 1 then
    SendCommand('AT+CMGF=0')
  else
    SendCommand('AT+CMGF=1');
    
  if (not WaitingForReturn(10000)) then goto OccurError;
  sBuffers.Clear;
  if Abortion then raise EUserAbortion.Create('用户中断操作');

  // 打开电话簿
  if JobContent.Items[0].QueryID > 0 then
  begin
    sBuffers.Clear;
    dbSMS := TADOTable.Create(nil);
    dbSMS.Connection := frmMain.adoSMS;
    dbSMS.TableName := 'receive';
    dbSMS.Open;
    dbContact := TADOTable.Create(nil);
    dbContact.Connection := frmMain.adoContacts;
    dbContact.TableName := 'contact';
    dbContact.Open;
    slTmp := TStringList.Create;

    if not Assigned(CMTIBuffers) then
      CMTIBuffers := TStringList.Create;

    CMTIBuffers.Add(IntToStr(JobContent.Items[0].QueryID));

    // 读取未读的消息
    while ReadOneMessage(CMTIBuffers, msg, opIScmgl = 1, True) do
    begin
      slTmp.Clear;
      slTmp.Add(msg.Number[0]);
      slTmp.Add(msg.Content);
      HashStr(HASH_MD5, slTmp.Text, hash);

      if not dbSMS.Locate('receivedate;hash', VarArrayOf([msg.DateTime,
        hash]), []) then
      begin
        dbSMS.Append;
        dbSMS.FieldByName('receivedate').AsDateTime := msg.DateTime;
        dbSMS.FieldByName('sender').AsString := QuestName(dbContact, msg.Number[0], sFolder);
        dbSMS.FieldByName('sendernumber').AsString := msg.Number[0];
        dbSMS.FieldByName('read').AsBoolean := False;
        dbSMS.FieldByName('hash').AsString := hash;
        if not MsgReport then
          dbSMS.FieldByName('content').AsString := msg.Content;
        if Length(sFolder) > 0 then dbSMS.FieldByName('folder').AsString := sFolder;
        dbSMS.Post;

        msg.ID := dbSMS.FieldByName('internalid').AsInteger;

        if Length(dbSMS.FieldByName('sender').AsString) = 0 then
          DisplayStr := msg.Number[0]
        else
          DisplayStr := dbSMS.FieldByName('sender').AsString;

        bUpdated := True;
      end;

      sBuffers.Clear;
    end;

    dbSMS.Close;
    dbContact.Close;
    dbSMS.Free;
    dbContact.Free;
    slTmp.Free;
  end;

  // 删除信息
  if opDelMessage or (opDeleteReport and MsgReport) then
  begin
    sBuffers.Clear;
    SendCommand('AT+CMGD=' + IntToStr(JobContent.Items[0].QueryID));
    WaitingForReturn;
  end;

  AddModemStaus(tsInfo,'查询完成');
  slSender.Free;
  slRecUnread.Free;

  if bUpdated then
  begin
    if opShowTrayIcon then
      frmMain.RefreshNewTray;

    if (frmMain.CurrentView = cvReceive) or (frmMain.CurrentView = cvNone) then
      frmMain.RefreshView(msg.ID);

    // 显示提示窗口
    if IsShowPopup then
      try
        if MsgReport then
          CurrentNewNW.WindowType := Integer(ntMsgReport)
        else
          CurrentNewNW.WindowType := Integer(ntNewMsg);

        CurrentNewNW.InternalID := msg.ID;
        CurrentNewNW.ReceiveDate := msg.DateTime;
        CurrentNewNW.SenderString := DisplayStr;
        Synchronize(FOpenNotificationWnd, True);
      finally
        ;
      end;
  end;      

//  CMTIBuffers.Free;
  Exit;

OccurError:
  AddModemStaus(tsError, '查询完成, 但有错误发生');
end;

// 设置 Modem 回调
procedure TJobThread.SetQueryCALLBACK;
var
  CMD: String;
  Params: TStringList;
  Result: TIntSet;

  function ParseNumberList(Parameter: String): TIntSet;
  var
    sPart: TStringList;
    i: Integer;
    iPos : Integer;
    a, b, c: Integer;
  begin
    if Parameter[1] = '(' then
      Delete(Parameter, 1, 1);

    if Parameter[Length(Parameter)] = ')' then
      Delete(Parameter, Length(Parameter), 1);

    Result := TIntSet.Create;
    sPart := SplitString(Parameter, ',');

    for i := 0 to sPart.Count - 1 do
    begin
      iPos := Pos('-', sPart[i]);

      if iPos = 0 then
        Result.Insert(StrToIntDef(sPart[i], 0))
      else
      begin
        a := StrToIntDef(LeftStr(sPart[i], iPos - 1), 0);
        b := StrToIntDef(RightStr(sPart[i], Length(sPart[i]) - iPos), 0);

        for c := a to b do
          Result.Insert(c); 
      end;
    end;
  end;

//短消息类(class)的概念：根据指定储存的位置，短消息分为class 0 – 3四个类。也可以不指定类(no class)，由ME按默认设置进行处理，存储到内存或者SIM卡中。在TPDU的TP-DCS字节中，当bit7-bit4为00x1, 01x1, 1111时，bit1-bit0指出消息所属类：
//00 – class 0：只显示，不储存
//01 – class 1：储存在ME内存中
//02 – class 2：储存在SIM卡中
//03 – class 3：直接传输到TE
//GSM Modem一般都支持一条“AT+CNMI”指令，可用于设定当有某类短消息到达时，如何处置它：只储存在指定的内存(易失的/非易失的)中，先储存后通知TE，还是直接转发到TE，等等。
//
//“AT+CNMI”指令语法为
//
//AT+CNMI=[<mode>[,<mt>[,<bm>[,<ds>[,<bfr>]]]]]
//mode - 通知方式：
//
//0 – 不通知TE。
//1 – 只在数据线空闲的情况下，通知TE；否则不通知TE。
//2 – 通知TE。在数据线被占用的情况下，先缓冲起来，待数据线空闲，再行通知。
//3 – 通知TE。在数据线被占用的情况下，通知混合在数据中一起传输。
//mt - 消息储存或直接转发到TE：
//
//0 – 储存到默认的内存位置(包括class 3)
//1 – 储存到默认的内存位置，并且向TE发出通知(包括class 3)
//2 – 对于class 2，储存到SIM卡，并且向TE发出通知；对于其它class，直接将消息转发到 TE
//3 – 对于class 3，直接将消息转发到 TE；对于其它class，同mt=1
//bm, ds, bfr的含义，请参考相关标准文档。一般不需要去关心它们。

begin
  // 停止回想
  sBuffers.Clear;
  SendCommand('ATE0');
  if not WaitingForReturn then Exit;
  sBuffers.Clear;

  if AutoReceive then
  begin
    AddModemStaus(tsInfo, '启动自动接收新信息');

    try
      // 检查原来的模式
      SendCommand('AT+CNMI?');
      if WaitingForReturn then
      begin
        CMD := sBuffers[0];
        defaultCNMI := Trim(RightStr(CMD, Length(CMD) - Pos(#$3A, CMD)));
      end
      else
        defaultCNMI := '0';

      // 检测手机支持的模式
      sBuffers.Clear;
      SendCommand('AT+CNMI=?');
      if WaitingForReturn then
      begin
        Params := ExtractAllParameter(sBuffers[0]);

        // 分析 mode 字段
        Result := ParseNumberList(Params[0]);
        if not Result.Find(2).IsEqual(Result.ItEnd) then
          CMD := '2'
        else if not Result.Find(3).IsEqual(Result.ItEnd) then
          CMD := '3'
        else
          CMD := '0';

        // 分析 mt 字段
        if (opQueryNewModel = 0) or (opQueryNewModel = 1) then
        begin
          Result := ParseNumberList(Params[1]);

          if not Result.Find(1).IsEqual(Result.ItEnd) then
            CMD := CMD + ',1'
          else
            CMD := CMD + ',0';
        end  
        else
          CMD := CMD + ',0';

        // 分析 bm 字段
        CMD := CMD + ',0';

        // 分析 ds 字段
        if (opQueryNewModel = 0) or (opQueryNewModel = 2) then
        begin
          Result := ParseNumberList(Params[3]);

          if not Result.Find(1).IsEqual(Result.ItEnd) then
            CMD := CMD + ',1'
          else
            CMD := CMD + ',0';
        end
        else
          CMD := CMD + ',0';
      end
      else
        raise ECNMIUnsupported.Create('不支持 AT+CNMI');

      if opQueryNewModel <> 0 then
        frmMain.tmrQueryNewSMS.Enabled := True;

      // 启动
      sBuffers.Clear;
      SendCommand('AT+CNMI=' + CMD);
      if WaitingForReturn then
        AddModemStaus(tsInfo, '自动接收新信息已启动')
      else
        raise ECNMIUnsupported.Create('返回 ERROR 或超时');
    except
      on E: ECNMIUnsupported do
      begin
        AddModemStaus(tsError, '自动接收新信息启动失败（手机不支持）: ' + E.Message, True, '自动接收');
        frmMain.dxbtnAutoReceive.Down := False;
        frmMain.dxmnuSMSAutoReceive.Down := False;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, '自动接收新信息启动失败: ' + E.Message, True, '自动接收');
        frmMain.dxbtnAutoReceive.Down := False;
        frmMain.dxmnuSMSAutoReceive.Down := False;
      end;
    end;
  end
  else
  begin
    AddModemStaus(tsInfo, '关闭自动接收新信息');
    SendCommand('AT+CNMI=' + defaultCNMI);
    AddModemStaus(tsInfo, '自动接收新信息已关闭', True, '自动接收');
  end;

  sBuffers.Clear;
end;

procedure TJobThread.FSetAnimation;
begin
  frmMain.ShowTrayAnimation(True, CurrentJobKind);
end;

procedure TRunCmd.Execute;
begin
  Self.FreeOnTerminate := True;
  WinExec(PChar(Cmd), 0);
end;

procedure TJobThread.QueryState;
var
  iBMode: Integer;
  iBCapacity: Integer;
  iBImageIndex: Integer;
  iSRSSI: Integer;
  iSFer: Integer;
  iSImageIndex: Integer;
begin
  // 停止回想
  sBuffers.Clear;
  SendCommand('ATE0');
  if not WaitingForReturn then
  begin
//    if ConnectionLost then
//      raise EConnectionLost.Create('连接丢失');
    Exit;
  end;
  sBuffers.Clear;
                            
  // 查询手机的状态
  if opQSBattery then
  begin
    sBuffers.Clear;
    SendCommand('AT+CBC');
    if WaitingForReturn and AnsiStartsText('+CBC:', sBuffers[0]) then
    begin
      iBMode := StrToInt(ExtractParameter(sBuffers[0], 0));
      iBCapacity := StrToInt(ExtractParameter(sBuffers[0], 1));

      // 电池状态文字
      if iBMode = 0 then
        frmMain.stbMain.Panels[3].Text := '放电: '
      else if iBMode = 1 then
        frmMain.stbMain.Panels[3].Text := '充电: '
      else
        frmMain.stbMain.Panels[3].Text := '电池状态未知';

      // 电池状态图标
      if iBMode < 2 then
      begin
        frmMain.stbMain.Panels[3].Text := frmMain.stbMain.Panels[3].Text +
          IntToStr(iBCapacity) + '%';
        iBImageIndex := Min(iBCapacity div 20, 4) + 12;
        if iBMode = 1 then iBImageIndex := iBImageIndex + 5;
      end
      else
        iBImageIndex := 11;

      (frmMain.stbMain.Panels[3].PanelStyle as
        TdxStatusBarTextPanelStyle).ImageIndex := iBImageIndex;

      // 如果电量低显示提示信息
      if iBCapacity < opQSAlert then
      begin
        AddModemStaus(tsInfo, '电池电量低，请及时充电', True, '电量低');
        frmMain.ShowPopHit('电池电量低', 'Ultra SMS 监测到您的手机的电池电量低，' +
          '请您及时充电，或者使用 USB 连接。', True);
      end;
    end;
  end;

  // 查询手机信号状态
  if opQSSignal then
  begin
    sBuffers.Clear;
    SendCommand('AT+CSQ');
    if WaitingForReturn and AnsiStartsText('+CSQ:', sBuffers[0]) then 
    begin
      iSRSSI := StrToInt(ExtractParameter(sBuffers[0], 0));
      iSFer := StrToInt(ExtractParameter(sBuffers[0], 1));

      // 信号状态文字
      if iSFer <> 99 then
        frmMain.stbMain.Panels[4].Text := '信号未知';

      // 电池状态图标
      if iSFer = 99 then
      begin
        frmMain.stbMain.Panels[4].Text := '信号强度: ' +
          IntToStr(Trunc(iSRSSI / 0.31)) + '%';
        iSImageIndex := iSRSSI div 8 + 24;
        if iSRSSI = 0 then iSImageIndex := 23;
      end
      else
        iSImageIndex := 22;

      (frmMain.stbMain.Panels[4].PanelStyle as
        TdxStatusBarTextPanelStyle).ImageIndex := iSImageIndex;

      // 如果电量低显示提示信息
      if iSImageIndex = 0 then
      begin
        AddModemStaus(tsError, '手机现在正处于无信号状态', True, '无信号');
        frmMain.ShowPopHit('无信号', 'Ultra SMS 监测到您的手机的无信号或信号很弱，' +
          '请您移动您的手机到有信号区域。', True);
      end;
    end;
  end;

  AddModemStaus(tsInfo, '手机状态查询完成');
end;

function TJobThread.TestPort: Boolean;
begin
  sBuffers.Clear;
  SendCommand('ATE0');
  Result := WaitingForReturn;
  sBuffers.Clear;
end;  

// 列出短信的编号
function TJobThread.EnumerateSMSId(var slRecRead: TStringList;
  var slRecUnread: TStringList; var slStoSend: TStringList;
  var slStoUnsend: TStringList; bNewMessage: Boolean = False): Boolean;
label
  OccurError;
const
  sFormat: array[0..2] of string = ('AT+CMGF=1', 'AT+CMGF=0', 'AT+CMGF=1');
  sCommander: array[0..2] of string = ('AT+CMGL="ALL"', 'AT+CMGL=4', 'AT+MMGL="HEADER ONLY"');
  sNewMsg: array[0..2] of string = ('AT+CMGL="REC UNREAD"', 'AT+CMGL=0', 'AT+MMGL="REC UNREAD"');
  sCmdHeader: array[0..2] of string = ('+CMGL:', '+CMGL:', '+MMGL:');
  sRecUnead: array[0..2] of string = ('REC UNREAD', '0', 'REC UNREAD');
  sRecRead: array[0..2] of string = ('REC READ', '1', 'REC READ');  
  sStoUnsend: array[0..2] of string = ('STO UNSENT', '2', 'STO UNSENT');  
  sStoSend: array[0..2] of string = ('STO SENT', '3', 'STO SENT');  
var
  i: Integer;
  id: string;
  msgtype: string;

  function IsHex(S: String): Boolean;
  var
    i: Integer;
    ch: Char;
  begin
    Result := True;
    for ch in S do
      if not (((ch >= '0') and (ch <= '9')) or ((ch >= 'A') and (ch <= 'F'))) then
      begin
        Result := False;
        Exit;
      end;  
  end;
  
begin
  // 设置信息的编码方式
  sBuffers.Clear;
  SendCommand(sFormat[opIScmgl]);
  if (not WaitingForReturn) then goto OccurError;
  sBuffers.Clear;

  // 开始读取未读信息
  if bNewMessage then
    SendCommand(sNewMsg[opIScmgl])
  else
    SendCommand(sCommander[opIScmgl]);

  if (not WaitingForReturn(30000)) then goto OccurError;

  // 列取信息
  i := 0;

  slRecUnread.Clear;
  slRecRead.Clear;
  slStoSend.Clear;
  slStoUnsend.Clear;

  while sBuffers.Count > i do
  begin
    if AnsiStartsText(sCmdHeader[opIScmgl], sBuffers[i]) then
    begin
      id := ExtractParameter(sBuffers[i], 0);
      msgtype := ExtractParameter(sBuffers[i], 1);

      if msgtype = sRecUnead[opIScmgl] then
        slRecUnread.Add(id)
      else if msgtype = sRecRead[opIScmgl] then
        slRecread.Add(id)
      else if msgtype = sStoUnsend[opIScmgl] then
        slStoUnsend.Insert(0, id)
      else if msgtype = sStoSend[opIScmgl] then
        slStoSend.Insert(0, id);
    end
    else
    if IsHex(sBuffers[i]) then
    begin
      if msgtype = sRecUnead[opIScmgl] then
        slRecUnread.Objects[slRecUnread.Count - 1] := TObject(sBuffers[i])
      else if msgtype = sRecRead[opIScmgl] then
        slRecread.Objects[slRecread.Count - 1] := TObject(sBuffers[i])
      else if msgtype = sStoUnsend[opIScmgl] then
        slStoUnsend.Objects[0] := TObject(sBuffers[i])
      else if msgtype = sStoSend[opIScmgl] then
        slStoSend.Objects[0] := TObject(sBuffers[i]);
    end;

    Inc(i);
  end;

  Result := True;

  Exit;  

  // 有错误返回
OccurError:
  Result := False;
end;  

procedure TJobThread.QueryTime(APhoneTime: PDateTime; APCTime: PDateTime; Result: PBoolean; hWindow: HWND);
const
  WM_QUERY_SUCCESSFUL = WM_USER + 471;
var
  ReturnVal: string;
begin
  // 查询时间的过程
  AddModemStaus(tsInfo, '查询手机日期时间');

  Result^ := False;
  SetCharset(GSM);
  sBuffers.Clear;
  SendCommand('AT+CCLK?');
  APCTime^ := RecodeDateTime(Now, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, 0);
  if WaitingForReturn then
  begin
    ReturnVal := sBuffers[0];
    if AnsiStartsText('+CCLK', ReturnVal) then
    begin
      Delete(ReturnVal, 1, Pos(#34, ReturnVal));
      Delete(ReturnVal, Pos(#34, ReturnVal), 1);
      TimeZone := RightStr(ReturnVal, Length(ReturnVal) - LastDelimiter('+', ReturnVal) + 1);
      APhoneTime^ := ParseDateTime(ReturnVal);
      Result^ := True;
    end;  
  end;

  // 返回结果
  if Result^ then
    AddModemStaus(tsInfo, '查询手机日期时间成功')
  else
    AddModemStaus(tsError, '查询手机日期时间失败');

  if IsWindow(hWindow) then
    PostMessage(hWindow, WM_QUERY_SUCCESSFUL, 0, 0)
end;

procedure TJobThread.FQueryTime;
var
  AJob: TSMSJob;
begin
  AJob := JobContent.Items[0];
  QueryTime(AJob.ExtraInfo.PPhoneTime, AJob.ExtraInfo.PPCTime,
    AJob.ExtraInfo.PRequestResult, AJob.ExtraInfo.hWindow);
end;

procedure TJobThread.SetPhoneTime;
var
  sTime: String;
begin
  AddModemStaus(tsInfo, '设置手机日期时间');

  sTime := Format('AT+CCLK="%2.2d/%2.2d/%2.2d,%2.2d:%2.2d:%2.2d%s"',
    [YearOf(Date) mod 100,
    MonthOf(Date),
    DayOf(Date),
    HourOf(Time),
    MinuteOf(Time),
    SecondOf(Time),
    TimeZone]);

  sBuffers.Clear;
  SendCommand(sTime);
  if WaitingForReturn then
    AddModemStaus(tsInfo, '设置手机日期时间成功')
  else
    AddModemStaus(tsError, '设置手机日期时间失败');

end;

procedure TJobThread.RemoveSMS;
label
  OccurError;
type TIDDatePair = record
  AID: string;
  ADate: TDateTime;
end;
type PIDDatePair = ^TIDDatePair;

var
  i, k: Integer;
  slRecRead: TStringList;
  slRecUnread: TStringList;
  slStoSend: TStringList;
  slStoUnsend: TStringList;
  slTmp: TStringList;
  slStorageDevice: TStringList;
  pdu: string;
  AJob: TSMSJob;
  lSortList: TList;

  // 类型的比较函数
  function CompareIDDatePair(Item1, Item2: Pointer): Integer;
  begin
    Result := CompareDateTime(PIDDatePair(Item1).ADate, PIDDatePair(Item2).ADate);
  end;

  // 填充都列表中
  procedure FillList(var slSrc: TStringList; var lDest: TList);
  var
    PItem: PIDDatePair;
    i: Integer;
    slTmp: TStringList;
    sSender: String;
  begin
    for i := slSrc.Count -1 downto 0 do
    begin
      New(PItem);
      PItem.AID := slSrc[i];
      sBuffers.Clear;
      SendCommand('AT+CMGR=' + PItem.AID);
      if WaitingForReturn then
      if opIScmgl = 1 then
        PItem.ADate := PDUReceiveDate(sBuffers[1])
      else
      begin
        slTmp := SplitString(sBuffers[0], ',', 3, True);
        if (slTmp.Count > 2) then
          PItem.ADate := ParseDateTime(MidStr(slTmp[2], 2, Length(slTmp[2]) - 2))
        else
          PItem.ADate := Now;
      end;
      lDest.Add(PItem);
    end;
  end;

  procedure FilterID(var slIDList: TStringList; var slDest: TStringList);
  var
    lSortList: TList;
    i: Integer;
    iTotal: Integer;
    dExpireDate: TDateTime;
  begin
    lSortList := TList.Create;
    FillList(slIDList, lSortList);
    lSortList.Sort(@CompareIDDatePair);
    iTotal := slIDList.Count;

    case AJob.ExtraInfo.KeepKind of
    rskKeepPercent:
      begin
        iTotal := Trunc((1 - AJob.ExtraInfo.KPPercent) * iTotal);
        for i := 0 to iTotal - 1 do
          slDest.Add(PIDDatePair(lSortList[i]).AID);
      end;
    rskKeepNumber:
      begin
        iTotal := iTotal - AJob.ExtraInfo.KPNumber;
        for i := 0 to iTotal - 1 do
          slDest.Add(PIDDatePair(lSortList[i]).AID);
      end;
    rskKeepRecentDay:
      begin
        dExpireDate := Now() - AJob.ExtraInfo.KPRDay;
        i := 0;
        while (i < iTotal) and (PIDDatePair(lSortList[i]).ADate >= dExpireDate) do
        begin
          slDest.Add(PIDDatePair(lSortList[i]).AID);
          Inc(i);
        end;
      end;
    rskKeepDay:
      begin
        dExpireDate := AJob.ExtraInfo.KPDDate;
        i := 0;
        while (i < iTotal) and (PIDDatePair(lSortList[i]).ADate >= dExpireDate) do
        begin
          slDest.Add(PIDDatePair(lSortList[i]).AID);
          Inc(i);
        end;
      end;
    end;

    lSortList.Clear;
    lSortList.Free;
  end;

begin
  AJob := JobContent.Items[0];

  slRecRead := TStringList.Create;
  slRecUnread := TStringList.Create;
  slStoSend := TStringList.Create;
  slStoUnsend := TStringList.Create;
  slTmp := TStringList.Create;

  // 添加信息
  AddModemStaus(tsInfo, '清理手机中的短信');

  // 停止回想
  sBuffers.Clear;
  SendCommand('ATE0');
  if not WaitingForReturn then goto OccurError;
  sBuffers.Clear;

  // 或者设备存储器
  SetCharset(GSM);
  slStorageDevice := GetMemoryLocation;

  for k := 0 to slStorageDevice.Count - 1 do
  begin
    // 设置存储装置
    if k > 0 then
      SetCharset(GSM);

    sBuffers.Clear;
    SendCommand('AT+CPMS=' + slStorageDevice[k]);
    WaitingForReturn;

    // 设置字符集为 Unicode Big Endian
    if not SetCharset(UCS2) then goto OccurError;
    sBuffers.Clear;

    // 读取编号
    try
      if not EnumerateSMSId(slRecRead, slRecUnread, slStoSend, slStoUnsend) then
        raise Exception.Create('获取短信编号的时候发生错误。');

      if Abortion then raise EUserAbortion.Create('用户中断操作');
    except
      on EUserAbortion do
      begin
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        AddModemStaus(tsError, '用户中断操作');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '在读取短信序号的时候发生错误。');
      end;
    end;

    if AJob.ExtraInfo.RemoveUNREAD then FilterID(slRecUnread, slTmp);
    if AJob.ExtraInfo.RemoveREAD then FilterID(slRecRead, slTmp);
    if AJob.ExtraInfo.RemoveDraft then FilterID(slStoUnsend, slTmp);
    if AJob.ExtraInfo.RemoveSent then FilterID(slStoSend, slTmp);

    // 删除手机中的短信
    try
      for i := 0 to slTmp.Count - 1 do
      begin
        sBuffers.Clear;
        SendCommand('AT+CMGD=' + slTmp[i]);
        WaitingForReturn;
      end;
    except
      on EUserAbortion do
      begin
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        AddModemStaus(tsError, '用户中断操作');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '在删除消息时候发生错误。');
      end;
    end;

    slTmp.Clear;
  end;

  AddModemStaus(tsInfo,'一些短信已经清空', True, '清空手机短信');
  slTmp.Free;
  slRecRead.Free;
  slRecUnread.Free;
  slStoSend.Free;
  slStoUnsend.Free;

  Exit;
OccurError:
  AddModemStaus(tsError, '有错误发生', True, '清空手机短信');
end;

procedure TJobThread.FOpenNotificationWnd;
var
  noticewnd: TNotice;
begin
  // 添加一个提示窗口
  noticewnd := MessageWnd.Add;
  noticewnd.FormItem.WndType := TNoticeType(CurrentNewNW.WindowType);
  noticewnd.FormItem.InternalID := CurrentNewNW.InternalID;
  noticewnd.FormItem.ReceiveDate := CurrentNewNW.ReceiveDate;
  noticewnd.FormItem.SenderString := CurrentNewNW.SenderString;
  noticewnd.FormItem.ShowWindow;
end;

function SetCharset(ACharset: TSMSCharset = UCS2): Boolean;
var
  CharsetList: TStringList;
  params: string;
begin
  sBuffers.Clear;
  Result := False;

  // 查询支持的标准
  SendCommand('AT+CSCS=?');
  if not WaitingForReturn then Exit;
  params := sBuffers[0];
  params := Trim(RightStr(params, Length(params) - Pos(#$3A, params)));
  if params[1] = '(' then Delete(params, 1, 1);
  if params[Length(params)] = ')' then Delete(params, Length(params), 1);
  CharsetList := ExtractAllParameter(params, False);

  // 设置
  case ACharset of
  GSM:
    if CharsetList.IndexOf('"GSM"') > -1 then
      params := '"GSM"'
    else if CharsetList.IndexOf('"00470053004D"') > -1 then
      params := '"00470053004D"'
    else
      Exit;

  UCS2:
    if CharsetList.IndexOf('"UCS2"') > -1 then
      params := '"UCS2"'
    else if CharsetList.IndexOf('"0055004300530032"') > -1 then
      params := '"0055004300530032"'
    else
      Exit;

  end;

  sBuffers.Clear;
  SendCommand('AT+CSCS=' + params);
  Result := WaitingForReturn;
  sBuffers.Clear;
end;

function GetMemoryLocation(LocType: Integer = 0): TStringList;
var
  CMD: string;
begin
  sBuffers.Clear;
  SendCommand('AT+CPMS=?');
  WaitingForReturn;

  CMD := sBuffers[0];
  CMD := ExtractParameter(CMD, LocType);
  if CMD[1] = '(' then Delete(CMD, 1, 1);
  if CMD[Length(CMD)] = ')' then Delete(CMD, Length(CMD), 1);

  Result := ExtractAllParameter(CMD, False);

  if Result.IndexOf('"MT"') <> -1 then
  begin
    Result.Clear;
    Result.Add('"MT"');
  end
  else if Result.IndexOf('"004D0054"') <> -1 then
  begin
    Result.Clear;
    Result.Text := '"004D0054"';
  end;
end;

function ReadOneMessage(var slMsgList: TStringList; var messageContent: TMsgContent;
  PDUMode: Boolean; SendCommandRequired: Boolean = False): Boolean;
label
  beginning;
var
  msgCode: string;
  params: TStringList;
  sICN: string;
  bMoreMsg: Boolean;
  sNumber: string;
  bMultiSMS: Boolean;
  oMultiSMS: TMultiSection;
  dTemp: TDateTime;
  pdu: String;
begin
beginning:
  // 如果没有更多内容了，返回 False;
  if slMsgList.Count = 0 then
  begin
    Result := False;
    Exit;
  end;

  Result := True;
  msgCode := slMsgList[slMsgList.Count - 1];
  pdu := string(slMsgList.Objects[slMsgList.Count - 1]);
  slMsgList.Delete(slMsgList.Count - 1);
  messageContent.ID := StrToIntDef(msgCode, 0);

  if SendCommandRequired or not PDUMode then
  begin
    // 发送读取指令
    sBuffers.Clear;
    SendCommand('AT+CMGR=' + msgCode);
    if not WaitingForReturn then goto beginning;
    params := ExtractAllParameter(sBuffers[0]);

    if sBuffers.Count > 2 then
      pdu := sBuffers[1];
  end;

  // 开始解码
  if PDUMode then
  begin
    // 分析PDU编码
    PDUReceiveString(pdu, sICN, bMoreMsg, sNumber,
      dTemp, messageContent.Content,
      bMultiSMS, oMultiSMS);
    if Assigned(messageContent.Number) then
      messageContent.Number.Clear
    else
      messageContent.Number := TStringList.Create;
    messageContent.Number.Add(sNumber);

    // 处理日期
//    if (not bMultiSMS) or (oMultiSMS.Index = 0) then
      messageContent.DateTime := dTemp; 

    // 级联短信
    if bMultiSMS then
      Result := AMultiSMSStorage.AddMessagePiece(oMultiSMS.Reference,
        oMultiSMS.Total, oMultiSMS.Index, messageContent.Content,
        messageContent.Content);

    if not Result then
      goto beginning;
  end
  else
  begin
    // 分析内容
    messageContent.Number.Free;
    messageContent.Number := SplitString(AnsiDequotedStr(Trim(params[1]), '"'), ' ');

    // 解码 UCS2
    messageContent.IsReport := False;

    if AnsiStartsStr(sBuffers[1], 'OK') then
      messageContent.Content := ''
    else if AnsiSameStr(sBuffers[1], '0020') then
    begin
      messageContent.Content := '';
      messageContent.IsReport := True;
    end
    else
      messageContent.Content := DecodeUnicodeBE(sBuffers[1]);

    // 分析时间字段
    if params.Count >= 3 then
      messageContent.DateTime := ParseDateTime(AnsiDequotedStr(params[2], '"'))
    else
      messageContent.DateTime := Now;
  end;
end;

{ TJobExtraInfo }


end.
