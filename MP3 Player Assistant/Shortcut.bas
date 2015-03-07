Attribute VB_Name = "Shortcut"
Option Explicit

'创建快捷方式的 API
Private Declare Function fCreateShellLink Lib "vb6stkit.dll" (ByVal lpstrFolderName As String, ByVal lpstrLinkName As String, ByVal lpstrLinkPath As String, ByVal lpstrLinkArguments As String, ByVal fPrivate As Long, ByVal sParent As String) As Long
Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO) As Long
Private Type OSVERSIONINFO
    dwOSVersionInfoSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * 128
End Type

Const CSIDL_DESKTOP = &H0
Const CSIDL_PROGRAMS = &H2
Const CSIDL_CONTROLS = &H3
Const CSIDL_PRINTERS = &H4
Const CSIDL_PERSONAL = &H5
Const CSIDL_FAVORITES = &H6
Const CSIDL_STARTUP = &H7
Const CSIDL_RECENT = &H8
Const CSIDL_SENDTO = &H9
Const CSIDL_BITBUCKET = &HA
Const CSIDL_STARTMENU = &HB
Const CSIDL_DESKTOPDIRECTORY = &H10
Const CSIDL_DRIVES = &H11
Const CSIDL_NETWORK = &H12
Const CSIDL_NETHOOD = &H13
Const CSIDL_FONTS = &H14
Const CSIDL_TEMPLATES = &H15
Const MAX_PATH = 260
Private Type SHITEMID
    cb As Long
    abID As Byte
End Type
Private Type ITEMIDLIST
    mkid As SHITEMID
End Type
Private Declare Function ShellAbout Lib "shell32.dll" Alias "ShellAboutA" (ByVal hWnd As Long, ByVal szApp As String, ByVal szOtherStuff As String, ByVal hIcon As Long) As Long
Private Declare Function SHGetSpecialFolderLocation Lib "shell32.dll" (ByVal hwndOwner As Long, ByVal nFolder As Long, pidl As ITEMIDLIST) As Long
Private Declare Function SHGetPathFromIDList Lib "shell32.dll" Alias "SHGetPathFromIDListA" (ByVal pidl As Long, ByVal pszPath As String) As Long
Private Const VER_PLATFORM_WIN32_NT As Long = 2

'判断是否是 Windows NT
Private Function IsWinNT() As Boolean
  Dim myOS As OSVERSIONINFO
  myOS.dwOSVersionInfoSize = Len(myOS)
  GetVersionEx myOS
  IsWinNT = (myOS.dwPlatformId = VER_PLATFORM_WIN32_NT)
End Function

'获得特殊文件夹
Private Function GetSpecialfolder(CSIDL As Long) As String
    Dim r As Long
    Dim IDL As ITEMIDLIST
    Dim Path As String
    'Get the special folder
    r = SHGetSpecialFolderLocation(100, CSIDL, IDL)
    If r > 0 Then
        'Create a buffer
        Path$ = Space$(512)
        'Get the path from the IDList
        r = SHGetPathFromIDList(ByVal IDL.mkid.cb, ByVal Path$)
        'Remove the unnecessary chr$(0)'s
        GetSpecialfolder = Left$(Path, InStr(Path, Chr$(0)) - 1)
        Exit Function
    End If
    GetSpecialfolder = ""
End Function

Public Function CreateShortcutDesktop(ByVal Name As String, ByVal Path As String) As Boolean
  '创建快捷方式
  Dim strGroupName As String, strLinkName As String
  Dim strLinkPath As String, strLinkArguments As String
  Dim fPrivate As Boolean, sParent As String
  Dim fSuccess As Boolean
  strLinkName = Name
  strLinkPath = Path
  strLinkArguments = ""
  fPrivate = True                              ' Add shortcut to desktop.
  
  If IsWinNT Then
    strGroupName = "..\..\桌面"
  Else
    strGroupName = "..\..\Desktop"
  End If
  
  sParent = "$(Programs)"
  fSuccess = fCreateShellLink(strGroupName & vbNullChar, strLinkName, strLinkPath, strLinkArguments & vbNullChar, fPrivate, sParent)
  CreateShortcutDesktop = fSuccess
End Function

Public Function CreateShortcutStartMenu(ByVal Name As String, ByVal Path As String) As Boolean
  '创建快捷方式
  Dim strGroupName As String, strLinkName As String
  Dim strLinkPath As String, strLinkArguments As String
  Dim fPrivate As Boolean, sParent As String
  Dim fSuccess As Boolean
  strLinkName = Name
  strLinkPath = Path
  strLinkArguments = ""
  fPrivate = True                              ' Add shortcut to desktop.
  strGroupName = "$(Programs)"
  sParent = "$(Programs)"
  fSuccess = fCreateShellLink(strGroupName & vbNullChar, strLinkName, strLinkPath, strLinkArguments & vbNullChar, fPrivate, sParent)
  CreateShortcutStartMenu = fSuccess
End Function

Public Function CreateShortcutQuickLaunch(ByVal Name As String, ByVal Path As String) As Boolean
  '创建快捷方式
  Dim strGroupName As String, strLinkName As String
  Dim strLinkPath As String, strLinkArguments As String
  Dim fPrivate As Boolean, sParent As String
  Dim fSuccess As Boolean
  strLinkName = Name
  strLinkPath = Path
  strLinkArguments = ""
  fPrivate = True                              ' Add shortcut to desktop.
  
  If IsWinNT Then
    strGroupName = "..\..\Application Data\Microsoft\Internet Explorer\Quick Launch"
  Else
    strGroupName = "..\..\Quick Launch"
  End If
  
  sParent = "$(Programs)"
  fSuccess = fCreateShellLink(strGroupName & vbNullChar, strLinkName, strLinkPath, strLinkArguments & vbNullChar, fPrivate, sParent)
  CreateShortcutQuickLaunch = fSuccess
End Function

Public Function CreateShortcutStartSubMenu(ByVal Name As String, ByVal Path As String, ByVal SubFolder As String) As Boolean
  '创建快捷方式
  Dim strGroupName As String, strLinkName As String
  Dim strLinkPath As String, strLinkArguments As String
  Dim fPrivate As Boolean, sParent As String
  Dim fSuccess As Boolean
  On Error Resume Next
  MkDir AppendPath(GetSpecialfolder(CSIDL_PROGRAMS), SubFolder)
  On Error GoTo 0
  strLinkName = Name
  strLinkPath = Path
  strLinkArguments = ""
  fPrivate = True                              ' Add shortcut to desktop.
  strGroupName = "$(Programs)\" & SubFolder
  sParent = "$(Programs)"
  fSuccess = fCreateShellLink(strGroupName & vbNullChar, strLinkName, strLinkPath, strLinkArguments & vbNullChar, fPrivate, sParent)
  CreateShortcutStartSubMenu = fSuccess
End Function

Public Function CreateShortcutStartRootMenu(ByVal Name As String, ByVal Path As String) As Boolean
  '创建快捷方式
  Dim strGroupName As String, strLinkName As String
  Dim strLinkPath As String, strLinkArguments As String
  Dim fPrivate As Boolean, sParent As String
  Dim fSuccess As Boolean
  strLinkName = Name
  strLinkPath = Path
  strLinkArguments = ""
  fPrivate = True                              ' Add shortcut to desktop.
  strGroupName = ".."
  sParent = "$(Programs)"
  fSuccess = fCreateShellLink(strGroupName & vbNullChar, strLinkName, strLinkPath, strLinkArguments & vbNullChar, fPrivate, sParent)
  CreateShortcutStartRootMenu = fSuccess
End Function

