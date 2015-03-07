Attribute VB_Name = "ShellOpera"
Option Explicit

Private Declare Function GetTempFileName Lib "kernel32" Alias "GetTempFileNameA" (ByVal lpszPath As String, ByVal lpPrefixString As String, ByVal wUnique As Long, ByVal lpTempFileName As String) As Long
Private Declare Function GetTempPath Lib "kernel32" Alias "GetTempPathA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
Private Const MAX_PATH = 260
Private Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As String) As Long

'Example by Joel (crashcode6@hotmail.com)
'This example requires a command button (Command1)
Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Const SW_SHOWNORMAL = 1
Const SE_ERR_NOASSOC = 31
Const SW_SHOW As Long = 5
Const sOperation As String = "open"     ' Constants for shell operations
Const sRun As String = "RUNDLL32.EXE"
Const sParameters As String = "shell32.dll,OpenAs_RunDLL "

Const SEE_MASK_INVOKEIDLIST = &HC
Const SEE_MASK_NOCLOSEPROCESS = &H40
Const SEE_MASK_FLAG_NO_UI = &H400
Private Type SHELLEXECUTEINFO
    cbSize As Long
    fMask As Long
    hWnd As Long
    lpVerb As String
    lpFile As String
    lpParameters As String
    lpDirectory As String
    nShow As Long
    hInstApp As Long
    lpIDList As Long
    lpClass As String
    hkeyClass As Long
    dwHotKey As Long
    hIcon As Long
    hProcess As Long
End Type

Private Declare Function ShellExecuteEx Lib "shell32.dll" (SEI As SHELLEXECUTEINFO) As Long

Public Function shelldoc(sfile As String)
    Dim sPath As String, RetVal As Long, _
    lRet As Long
    lRet = ShellExecute(GetDesktopWindow(), sOperation, sfile, _
                        vbNullString, vbNullString, SW_SHOWNORMAL)
    If lRet = SE_ERR_NOASSOC Then ' No association exists
        'Create a buffer
        sPath = Space(255)
        'Get the system directory
        RetVal = GetSystemDirectory(sPath, 255)
        'Remove all unnecessary chr$(0)'s
        'and move on the stack
        sPath = Left$(sPath, RetVal)
    
        lRet = ShellExecute(GetDesktopWindow(), "open", sRun, _
                            sParameters + sfile, sPath, SW_SHOWNORMAL)
    End If
End Function

Public Sub SHShowProperty(ByVal szPath As String, Optional ByVal hWnd As Long = 0)
    Dim SEI As SHELLEXECUTEINFO
    Dim r As Long
    With SEI
        'Set the structure's size
        .cbSize = Len(SEI)
        'Seet the mask
        .fMask = SEE_MASK_NOCLOSEPROCESS Or _
         SEE_MASK_INVOKEIDLIST Or SEE_MASK_FLAG_NO_UI
        'Set the owner window
        .hWnd = hWnd
        'Show the properties
        .lpVerb = "properties"
        'Set the filename
        .lpFile = szPath
        .lpParameters = vbNullChar
        .lpDirectory = vbNullChar
        .nShow = 0
        .hInstApp = 0
        .lpIDList = 0
    End With
    r = ShellExecuteEx(SEI)
End Sub

Public Sub SHWriteEmail(ByVal EAddress As String, ByVal Subject As String, Optional ByVal hWnd As Long = 0)
  If hWnd = 0 Then hWnd = GetDesktopWindow
  EAddress = "mailto:" & EAddress
  EAddress = EAddress & "?subject=" & Subject
  ShellExecute hWnd, vbNullString, EAddress, vbNullString, vbNullString, SW_SHOWNORMAL
End Sub

Public Sub SHOpenLink(ByVal URL As String, Optional ByVal hWnd As Long = 0)
  If hWnd = 0 Then hWnd = GetDesktopWindow
  ShellExecute hWnd, vbNullString, URL, vbNullString, vbNullString, SW_SHOWNORMAL
End Sub

Public Sub SHOpenFolder(ByVal Folder As String, Optional ByVal hWnd As Long = 0)
  If hWnd = 0 Then hWnd = GetDesktopWindow
  ShellExecute hWnd, vbNullString, Folder, vbNullString, vbNullString, SW_SHOWNORMAL
End Sub

Public Function GetTempFile(Optional Prefix As String) As String
Dim PathName As String
Dim sRet As String

    If Prefix = "" Then Prefix = ""
    PathName = GetTempDir
    
    sRet = String(MAX_PATH, 0)
    GetTempFileName PathName, Prefix, 0, sRet
    GetTempFile = StrZToStr(sRet)
    
End Function

Private Function GetTempDir() As String
Dim sRet As String, c As Long
    sRet = String(MAX_PATH, 0)
    c = GetTempPath(MAX_PATH, sRet)
    If c = 0 Then
        GetTempDir = App.Path
    Else
        GetTempDir = Left$(sRet, c)
    End If
End Function

Private Function StrZToStr(S As String) As String
    StrZToStr = Left$(S, lstrlen(S))
End Function

