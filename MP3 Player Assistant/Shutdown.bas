Attribute VB_Name = "Shutdown"
'In a module
Private Const EWX_LOGOFF = 0
Private Const EWX_SHUTDOWN = 1
Private Const EWX_REBOOT = 2
Private Const EWX_FORCE = 4
Private Const TOKEN_ADJUST_PRIVILEGES = &H20
Private Const TOKEN_QUERY = &H8
Private Const SE_PRIVILEGE_ENABLED = &H2
Private Const ANYSIZE_ARRAY = 1
Private Const VER_PLATFORM_WIN32_NT = 2
Type OSVERSIONINFO
    dwOSVersionInfoSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * 128
End Type
Type LUID
    LowPart As Long
    HighPart As Long
End Type
Type LUID_AND_ATTRIBUTES
    pLuid As LUID
    Attributes As Long
End Type
Type TOKEN_PRIVILEGES
    PrivilegeCount As Long
    Privileges(ANYSIZE_ARRAY) As LUID_AND_ATTRIBUTES
End Type
Private Declare Function GetCurrentProcess Lib "kernel32" () As Long
Private Declare Function OpenProcessToken Lib "advapi32" (ByVal ProcessHandle As Long, ByVal DesiredAccess As Long, TokenHandle As Long) As Long
Private Declare Function LookupPrivilegeValue Lib "advapi32" Alias "LookupPrivilegeValueA" (ByVal lpSystemName As String, ByVal lpName As String, lpLuid As LUID) As Long
Private Declare Function AdjustTokenPrivileges Lib "advapi32" (ByVal TokenHandle As Long, ByVal DisableAllPrivileges As Long, NewState As TOKEN_PRIVILEGES, ByVal BufferLength As Long, PreviousState As TOKEN_PRIVILEGES, ReturnLength As Long) As Long
Private Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (ByRef lpVersionInformation As OSVERSIONINFO) As Long
'Detect if the program is running under Windows NT
Public Function IsWinNT() As Boolean
    Dim myOS As OSVERSIONINFO
    myOS.dwOSVersionInfoSize = Len(myOS)
    GetVersionEx myOS
    IsWinNT = (myOS.dwPlatformId = VER_PLATFORM_WIN32_NT)
End Function
'set the shut down privilege for the current application
Private Sub EnableShutDown()
    Dim hProc As Long
    Dim hToken As Long
    Dim mLUID As LUID
    Dim mPriv As TOKEN_PRIVILEGES
    Dim mNewPriv As TOKEN_PRIVILEGES
    hProc = GetCurrentProcess()
    OpenProcessToken hProc, TOKEN_ADJUST_PRIVILEGES + TOKEN_QUERY, hToken
    LookupPrivilegeValue "", "SeShutdownPrivilege", mLUID
    mPriv.PrivilegeCount = 1
    mPriv.Privileges(0).Attributes = SE_PRIVILEGE_ENABLED
    mPriv.Privileges(0).pLuid = mLUID
    ' enable shutdown privilege for the current application
    AdjustTokenPrivileges hToken, False, mPriv, 4 + (12 * mPriv.PrivilegeCount), mNewPriv, 4 + (12 * mNewPriv.PrivilegeCount)
End Sub
' Shut Down NT
Public Sub ShutDownNT(Force As Boolean)
    Dim ret As Long
    Dim Flags As Long
    Flags = EWX_SHUTDOWN
    If Force Then Flags = Flags + EWX_FORCE
    If IsWinNT Then EnableShutDown
    ExitWindowsEx Flags, 0
End Sub
'Restart NT
Public Sub RebootNT(Force As Boolean)
    Dim ret As Long
    Dim Flags As Long
    Flags = EWX_REBOOT
    If Force Then Flags = Flags + EWX_FORCE
    If IsWinNT Then EnableShutDown
    ExitWindowsEx Flags, 0
End Sub
'Log off the current user
Public Sub LogOffNT(Force As Boolean)
    Dim ret As Long
    Dim Flags As Long
    Flags = EWX_LOGOFF
    If Force Then Flags = Flags + EWX_FORCE
    ExitWindowsEx Flags, 0
End Sub

