program ultrasms;



{$RESOURCE FormIcons.res}

uses
  Forms,
  Windows,
  SysUtils,
  TlHelp32,
  Messages,
  UserInterfaces in 'UserInterfaces.pas' {frmMain},
  AES in 'AES.pas',
  DES in 'DES.pas',
  GerneralFunc in 'GerneralFunc.pas',
  GSMChar in 'GSMChar.pas',
  HTMLHELP_Decl in 'HTMLHELP_Decl.pas',
  SMSFind in 'SMSFind.pas',
  SMSJob in 'SMSJob.pas',
  uDlgAbout in 'uDlgAbout.pas' {dlgAbout},
  uDlgAddContact in 'uDlgAddContact.pas' {dlgAddContact},
  uDlgAddFolder in 'uDlgAddFolder.pas' {dlgAddFolder},
  uDlgCategory in 'uDlgCategory.pas' {dlgCategory},
  uDlgConnect in 'uDlgConnect.pas' {dlgConnect},
  uDlgContactInfo in 'uDlgContactInfo.pas' {dlgContactInfo},
  uDlgExport in 'uDlgExport.pas' {dlgExport},
  uDlgFolderProperty in 'uDlgFolderProperty.pas' {dlgFolderProperty},
  uDlgHotKey in 'uDlgHotKey.pas' {dlgHotKey},
  uDlgMoveSMS in 'uDlgMoveSMS.pas' {dlgMoveSMS},
  uDlgOptions in 'uDlgOptions.pas' {dlgOption},
  uDlgPassword in 'uDlgPassword.pas' {PasswordDlg},
  uDlgPrint in 'uDlgPrint.pas' {dlgPrint},
  uDlgRegister in 'uDlgRegister.pas' {dlgRegister},
  uDlgSelContacts in 'uDlgSelContacts.pas' {dlgSelContacts},
  uFfmContact in 'uFfmContact.pas' {ffmContact},
  uFraContact in 'uFraContact.pas' {fraContact: TFrame},
  uFraFilter in 'uFraFilter.pas' {fraFilter: TFrame},
  uFraFind in 'uFraFind.pas' {fraFind: TFrame},
  uFraInfoPreview in 'uFraInfoPreview.pas' {fraInfoPreview: TFrame},
  uFrmNotification in 'uFrmNotification.pas' {frmNotification},
  uFrmReadSMS in 'uFrmReadSMS.pas' {frmReadSMS},
  uFrmSplash in 'uFrmSplash.pas' {frmSplash},
  uFrmWriteSMS in 'uFrmWriteSMS.pas' {frmWriteSMS},
  uniwizAddition in 'uniwizAddition.pas' {fraAdditionTask: TFrame},
  untConnect in 'untConnect.pas' {wizConnect},
  untSelModem in 'untSelModem.pas' {fraSelectModem: TFrame},
  untTestPort in 'untTestPort.pas' {fraTestPort: TFrame},
  untwizOption in 'untwizOption.pas' {frawizOption: TFrame},
  uFrmTime in 'uFrmTime.pas' {frmTime},
  uDragDropOLE in 'uDragDropOLE.pas',
  uVersion in 'uVersion.pas',
  uFrmRemoveSMS in 'uFrmRemoveSMS.pas' {frmRemoveSMS},
  MultiSMS in 'MultiSMS.pas',
  Configuration in 'Configuration.pas',
  uFrmSyncPhonebook in 'uFrmSyncPhonebook.pas' {frmSyncPhonebook},
  uDlgTest in 'uDlgTest.pas' {dlgTest},
  GetGBKPY_imp in 'GetGBKPY_imp.pas',
  WindowsRegistry in 'WindowsRegistry.pas';

{$R *.res}

var
  dwExStyle : DWORD;
  hMutex: Cardinal;

  procedure ActivateUltraSMSMainWindow(dwProcessID: DWORD); overload;
  var
    hThreadTL: THandle;
    uThread: THREADENTRY32;
    r: LongBool;

    function EnumThreadWndProc(hWnd: THandle; lParam: LPARAM):LongBool; stdcall;
    var
      ps: array[0..254] of Char;
    const
      WM_ACTIVATE_MAINWND = WM_USER + 463;
    begin
      GetClassName(hWnd, ps, 255);
      if lstrcmp(ps, 'TfrmMain') = 0 then
        SendMessage(hWnd, WM_ACTIVATE_MAINWND, 0, 0);

      Result := True;
    end;  

  begin
    // 查找相关的线程
    hThreadTL := CreateToolhelp32Snapshot(TH32CS_SNAPTHREAD, 0);
    uThread.dwSize := SizeOf(uThread);
    r := Thread32First(hThreadTL, uThread);

    while r do
    begin
      if uThread.th32OwnerProcessID = dwProcessID then
      begin
        EnumThreadWindows(uThread.th32ThreadID, @EnumThreadWndProc, 0);
        Break;
      end;

      r := Thread32Next(hThreadTL, uThread);
    end;

    CloseHandle(hThreadTL);
  end;

  procedure ActivateUltraSMSMainWindow; overload;
  var
    hProsTL: THandle;
    uProcess: PROCESSENTRY32;
    r: LongBool;
  begin
    // 查找窗口句柄
    hProsTL := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    uProcess.dwSize := SizeOf(uProcess);
    r := Process32First(hProsTL, uProcess);

    while r do
    begin
      if AnsiSameText(ExtractFileName(uProcess.szExeFile), 'ultrasms.exe') then
      begin
        ActivateUltraSMSMainWindow(uProcess.th32ProcessID);  
        Break;
      end;  

      r := Process32Next(hProsTL, uProcess);
    end;  

    CloseHandle(hProsTL);
  end;

begin
  // 创建互斥体
  hMutex := CreateMutex(nil, True, 'ultrasms.mainapp');
  
  If (GetLastError = ERROR_ALREADY_EXISTS) Then
  begin

    ReleaseMutex(hMutex);
    CloseHandle(hMutex);

    // More than one instance detected
    ActivateUltraSMSMainWindow;
  end
  else
  begin
    MultiSMS.AMultiSMSStorage := TMultiSMSStorage.Create;
    // There is a bug in Win95 and WinME (and potentially in Win98 too) regarding GetDCEx which causes sometimes
    // serious trouble within GDI (see method WMNCPaint).
    IsWinNT := (Win32Platform and VER_PLATFORM_WIN32_NT) <> 0;
    IsWin2K := (Win32MajorVersion = 5) and (Win32MinorVersion = 0);
    IsWinXP := (Win32MajorVersion = 5) and (Win32MinorVersion = 1);
    IsWinVistaOrAbove := (Win32MajorVersion >= 6);

//    dwExStyle := GetWindowLong(Application.Handle, GWL_EXSTYLE);
//    dwExStyle := dwExStyle or WS_EX_TOOLWINDOW;
//    SetWindowLong(Application.Handle, GWL_EXSTYLE, dwExStyle);

    Application.Initialize;
    Application.Title := 'Ultra SMS';
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TffmContact, ffmContact);
  Application.CreateForm(TfrmSyncPhonebook, frmSyncPhonebook);
  Application.CreateForm(TdlgTest, dlgTest);
  dwExStyle := GetWindowLong(ffmContact.Handle, GWL_EXSTYLE);
    dwExStyle := dwExStyle or WS_EX_TOOLWINDOW;
    SetWindowLong(ffmContact.Handle, GWL_EXSTYLE, dwExStyle);

    Application.Run;
  end;
end.
