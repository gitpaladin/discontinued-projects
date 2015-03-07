Attribute VB_Name = "General"
Option Explicit

Public FS As New Scripting.FileSystemObject

Public LyricDir As New VBA.Collection
Public LyricIIDirs As New VBA.Collection
Public LyricIIAssociationList As New VBA.Collection
Public FilterSet As New VBA.Collection
Public FilterKey As New VBA.Collection
Public SortKeySet As New VBA.Collection
Public RenameKey As New VBA.Collection
Public RenameCurrent As Long
Public RenameEnabled As Boolean

Public IniSet As New MP3PA.INIOperation
Public iniFav As New MP3PA.INIOperation
Public INIAPI As New MP3PA.INIAPI

Public oReaderNone As New MP3PA.NOTAG
Public oReaderID3v1 As New MP3PA.ID3v1
Public oReaderID3v2 As New MP3PA.ID3v2
Public oReaderAPETAG As New MP3PA.APETAG
Public oReaderWMPTAG As New MP3PA.WMPTAG

Public SysRoot As String
Public WinRoot As String
Public CurrentFilter As String

Public SpaceTotal As Double
Public SpaceUsed As Double
Public SpaceAdded As Double
Public DriveLetter As String
Public SpaceFact As Double

Public FindLyricInSongDir As Boolean
Public LyricsIIDownDir As String
Public LyricsIIFolder As String
Public bLYCIIAssociationList As Boolean
Public bLYCIISearchDir As Boolean
Public bLYCIIDownDir As Boolean
Public bLyricFromFile As Boolean
Public InfoReadObj(2) As Object
Public InfoReadIdx(2) As Integer

Public AppWmp As Boolean
Public AppWinamp As String
Public AppFoobar As String
Public AppTTPlayer As String
Public AppFoobar9 As String

Public sMyDocPath As String

Public LastSortKey As String
Public LastAscending As Boolean
Public InheritInfo As Boolean
Public NoTime As Boolean
Public NoDuration As Boolean

Public TagDelID3v1 As Boolean
Public TagDelID3v2 As Boolean
Public TagWriteID3v1 As Boolean
Public TagWriteID3v2 As Boolean
Public TagUseUnicode As Boolean
Public NumberStart As Long

Public i As Long
Public j As Long
Public r As Long

'Ini Data
Public PS_Drive As String
Public PS_CustomVolumn As Double
Public PS_Volumn As Integer
Public PS_Remained As Double
Public PS_PreserveFolderTree As Boolean
Public PS_AutoFolderTree As Boolean
Public PS_TemplateFolder As Boolean
Public PS_AutoFolderIndex As Integer
Public PS_TemplateName As String

'悬浮窗相关
Public Enum FLOAT_POSITION
  fpLeftTop = 1
  fpMiddleTop = 2
  fpRightTop = 3
  fpLeftMiddle = 4
  fpCenter = 5
  fpRightMiddle = 6
  fpLeftBottom = 7
  fpMiddleBottom = 8
  fpRightBottom = 9
End Enum

Public Type FLOAT_BLACKET
  cfpPosition As FLOAT_POSITION
  lAnchorHorizon As Long
  lAnchorVertical As Long
  bTransparency As Byte
  bShowInfo As Boolean
  lAddInfoDelay As Long
End Type

Public FloatWindowProperty As FLOAT_BLACKET

'App LVW
Public lLVWFoobarWidth(1 To 12) As Long
Public lLVWWMPWidth(1 To 9) As Long
Public lLVWWinampWidth(1 To 3) As Long

Private Declare Function PutFocus Lib "user32" Alias "SetFocus" (ByVal hWnd As Long) As Long
Private Declare Function lstrcmp Lib "kernel32.dll" Alias "lstrcmpA" (ByVal lpString1 As String, ByVal lpString2 As String) As Long
Private Declare Function lstrcmpi Lib "kernel32.dll" Alias "lstrcmpiA" (ByVal lpString1 As String, ByVal lpString2 As String) As Long

'文件信息
Public Declare Function ImageList_Draw Lib "comctl32.dll" (ByVal himl&, ByVal i&, ByVal hDCDest&, ByVal X&, ByVal Y&, ByVal Flags&) As Long
Public Declare Function SHGetFileInfo Lib "shell32.dll" Alias "SHGetFileInfoA" (ByVal pszPath As String, ByVal dwFileAttributes As Long, psfi As SHFILEINFO, ByVal cbFileInfo As Long, ByVal uFlags As Long) As Long

Public Const MAX_PATH = 260

Public Const SHGFI_ATTRIBUTES = &H800
Public Const SHGFI_DISPLAYNAME = &H200
Public Const SHGFI_EXETYPE = &H2000
Public Const SHGFI_ICON = &H100
Public Const SHGFI_ICONLOCATION = &H1000
Public Const SHGFI_LARGEICON = &H0
Public Const SHGFI_LINKOVERLAY = &H8000
Public Const SHGFI_OPENICON = &H2
Public Const SHGFI_PIDL = &H8
Public Const SHGFI_SELECTED = &H10000
Public Const SHGFI_SHELLICONSIZE = &H4
Public Const SHGFI_SMALLICON = &H1
Public Const SHGFI_SYSICONINDEX = &H4000
Public Const SHGFI_TYPENAME = &H400
Public Const SHGFI_USEFILEATTRIBUTES = &H10
Public Const BASIC_SHGFI_FLAGS = SHGFI_TYPENAME Or SHGFI_SHELLICONSIZE Or SHGFI_SYSICONINDEX Or SHGFI_DISPLAYNAME Or SHGFI_EXETYPE
Public Const ILD_TRANSPARENT = &H1        'display transparent

Public Type SHFILEINFO
   hIcon          As Long
   iIcon          As Long
   dwAttributes   As Long
   szDisplayName  As String * MAX_PATH
   szTypeName     As String * 80
End Type

Private Type tagInitCommonControlsEx
   lngSize As Long
   lngICC As Long
End Type

Private Declare Function InitCommonControlsEx Lib "comctl32.dll" _
   (iccex As tagInitCommonControlsEx) As Boolean
Private Const ICC_USEREX_CLASSES = &H200

'****** 控制 ListView 的 API *******
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function SendMessageAny Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal MSG As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

Private Const LVM_FIRST = &H1000
Private Const LVM_GETHEADER = (LVM_FIRST + 31)
Private Const HDS_BUTTONS = &H2
Private Const HDI_IMAGE = &H20
Private Const HDI_FORMAT = &H4
Private Const HDF_LEFT = 0
Private Const HDF_RIGHT As Long = 1
Private Const HDF_STRING = &H4000
Private Const HDF_BITMAP_ON_RIGHT = &H1000
Private Const HDF_IMAGE = &H800
Private Const HDM_FIRST = &H1200
Private Const HDM_SETITEM = (HDM_FIRST + 4)
Public Const GWL_STYLE = (-16)

Private Type HD_ITEM
   mask        As Long
   cxy         As Long
   pszText     As String
   hbm         As Long
   cchTextMax  As Long
   fmt         As Long
   lParam      As Long
   iImage      As Long
   iOrder      As Long
End Type

Public Const HH_DISPLAY_TOPIC = &H0
Public Const HH_SET_WIN_TYPE = &H4
Public Const HH_GET_WIN_TYPE = &H5
Public Const HH_GET_WIN_HANDLE = &H6
Public Const HH_DISPLAY_SEARCH As Long = &H3
Public Const HH_DISPLAY_TOC As Long = &H1
Public Const HH_DISPLAY_TEXT_POPUP = &HE   ' Display string resource ID or text in a pop-up window.
Public Const HH_HELP_CONTEXT = &HF         ' Display mapped numeric value in  dwData.
Public Const HH_TP_HELP_CONTEXTMENU = &H10 ' Text pop-up help, similar to WinHelp's HELP_CONTEXTMENU.
Public Const HH_TP_HELP_WM_HELP = &H11     ' text pop-up help, similar to WinHelp's HELP_WM_HELP.
Public Const HH_CLOSE_ALL = &H12
Private Declare Function HtmlHelp Lib "hhctrl.ocx" Alias "HtmlHelpA" (ByVal hwndCaller As Long, ByVal pszFile As String, ByVal uCommand As Long, ByVal dwData As Long) As Long
'***********************************

Public Function StripNulls(Item As String) As String
  Dim pos As Integer
  pos = InStr(Item, Chr$(0))
  If pos Then Item = Left$(Item, pos - 1)
  StripNulls = Item
End Function

Public Function ExpandPath(ByVal sPath As String) As String
  Dim sParts() As String
  Dim ii As Long
  Dim sTmp As String
  
  sParts = Split(sPath, "%")
  
  If UBound(sParts) = 0 Then
    ExpandPath = sPath
  Else
    For ii = 1 To UBound(sParts) Step 2
      sParts(ii) = Environ$(sParts(ii))
    Next ii
  End If
  
  sPath = Join(sParts, "")
  
  '分析路径的可靠性
  If (FS.FileExists(sPath)) Or (FS.FolderExists(sPath)) Then
    ExpandPath = sPath
  Else
    sTmp = AppendPath(FS.GetSpecialfolder(1), sPath)
    
    If FS.FileExists(sTmp) Then
      ExpandPath = sTmp
    Else
      sTmp = AppendPath(FS.GetSpecialfolder(0), sPath)
      
      If FS.FileExists(sTmp) Then
        ExpandPath = sTmp
      End If
    End If
  End If
End Function

Public Sub SetHeaderStyle(ByVal hListView As Long)

  Dim hHeader As Long, lStyle As Long
  
  hHeader = SendMessage(hListView, LVM_GETHEADER, 0, ByVal 0&)
  lStyle = GetWindowLong(hHeader, GWL_STYLE)
  SetWindowLong hHeader, GWL_STYLE, lStyle Xor HDS_BUTTONS

End Sub

Public Sub SetHeaderImage(ByVal hListView As Long, ColumnCount As Long, ImageCount As Long, ColumnText As String, Optional ByVal Arrangement As Integer = HDF_LEFT)
  Dim hHeader As Long
  Dim Result As Long
  Dim HeaderData As HD_ITEM
  
  hHeader = SendMessageLong(hListView, LVM_GETHEADER, 0, 0)
  
  With HeaderData
  .mask = HDI_IMAGE Or HDI_FORMAT
  .fmt = HDF_STRING Or HDF_BITMAP_ON_RIGHT Or HDF_IMAGE Or Arrangement
  .pszText = ColumnText
  .iImage = ImageCount - 1
  End With
  
  Result = SendMessageAny(hHeader, HDM_SETITEM, ColumnCount - 1, HeaderData)
End Sub

Public Sub SetHeaderNoImage(ByVal hListView As Long, ColumnCount As Long, ColumnText As String, Optional ByVal Arrangement As Integer = HDF_LEFT)
  Dim hHeader As Long
  Dim Result As Long
  Dim HeaderData As HD_ITEM
  
  hHeader = SendMessageLong(hListView, LVM_GETHEADER, 0, 0)
    
  With HeaderData
  .mask = HDI_FORMAT
  .fmt = HDF_STRING Or Arrangement
  .pszText = ColumnText
  End With
  
  Result = SendMessageAny(hHeader, HDM_SETITEM, ColumnCount - 1, HeaderData)
    
End Sub

Public Sub SortListView(ByVal ListView As ListView, ByVal SortKey As Integer, ByVal SortOrder As MSComctlLib.ListSortOrderConstants)
  '给 ListView 排序
  Dim i As Long
  Dim nHeader As MSComctlLib.ColumnHeader
  Dim sOriginal As String
  Dim sNew As String

  Set ListView.ColumnHeaderIcons = frmMain.iltColHeader
  
  For i = 1 To ListView.ColumnHeaders.Count
    SetHeaderNoImage ListView.hWnd, i, ListView.ColumnHeaders(i).Text, ListView.ColumnHeaders(i).Alignment
  Next

  ListView.Sorted = True
  ListView.SortKey = SortKey
  ListView.SortOrder = SortOrder

  SetHeaderImage ListView.hWnd, SortKey + 1, SortOrder + 1, ListView.ColumnHeaders(SortKey + 1).Text, ListView.ColumnHeaders(SortKey + 1).Alignment
End Sub

Public Function ItemExist(Item, Collection As Object) As Boolean
  Dim Test As Variant
  
  On Error GoTo NotFound
  Test = Collection.Item(Item)
  ItemExist = True
  On Error GoTo 0
  Exit Function
NotFound:
  ItemExist = False
End Function

Public Function ItemExistOBJ(Item, Collection As Object) As Boolean
  Dim Test As Variant
  
  On Error GoTo NotFound
  Set Test = Collection.Item(Item)
  ItemExistOBJ = True
  On Error GoTo 0
  Exit Function
NotFound:
  ItemExistOBJ = False
End Function

Public Sub Test()
'  Dim TestOBJ As New MP3PA.APETAG
'
'  TestOBJ.LoadInfo "F:\MP3\SONGS\光良 - 童话.mp3"
  PlaylistReader.ReadFplInfo "F:\Program Files\foobar2000\playlists\000000018 - 精选歌曲(2).fpl"
  
End Sub

Public Function DisplaySize(ByRef Size As Variant) As String
  '转化为大小
  Select Case (Len(Size) - 1) \ 3
  Case 0
    '表示只能用字节表示
    DisplaySize = Format(Size, "##0") & " 字节"
  Case 1
    '使用 KB 表示
    DisplaySize = FormatNumber(Size / 1024) & " KB"
  Case 2
    '使用 MB 表示
    DisplaySize = FormatNumber(Size / 1048576) & " MB"
  Case 3
    '使用 GB 表示
    DisplaySize = FormatNumber(Size / 1073741824) & " GB"
  Case 4
    '使用 TB 表示
    DisplaySize = FormatNumber(Size / 1099511627776#) & " TB"
  End Select
End Function

Public Sub SetObjectFocus(ByVal hWnd As Long)
  PutFocus hWnd
End Sub

Public Function GetMyDocPath() As String
  '获得我的文档的未知
  Dim sPath As String
  
  sPath = Registry.GetStringValue("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders", "Personal")
  GetMyDocPath = ExpandPath(sPath)
End Function

Public Sub ExpandFolder(ByVal TV As TreeView, ByVal Path As String)
  '选择路径
  If ItemExistOBJ(Path, TV.Nodes) Then
    TV.Nodes(Path).Expanded = True
  Else
    '递归一直到找到
    ExpandFolder TV, FS.GetParentFolderName(Path)
  End If
End Sub

Public Function CompareString(ByVal String1 As String, ByVal String2 As String) As Boolean
  '比较字符串的大小
  '如果字符串 1 小于字符串 2 就返回 True, 否则返回 False
  CompareString = (lstrcmpi(String1, String2) <= 0)
End Function

Public Function GetDriveString(ByVal DriveLetter As String, ByVal d As Scripting.Drive)
  '获得文字
  Dim r As Long
  Dim FINFO As SHFILEINFO
  Dim Volume As String
  
  If d.IsReady Then
    '如果有卷标
    If Len(d.VolumeName) = 0 Then GoTo NoVolume
GeneralHanding:
    GetDriveString = d.VolumeName & " (" & Left(DriveLetter, 1) & ":)"
  Else
NoVolume:
    '如果没有卷标
    r = SHGetFileInfo(DriveLetter, 0&, FINFO, Len(FINFO), BASIC_SHGFI_FLAGS Or SHGFI_SMALLICON)
    
    If r Then
      Volume = StripNulls(FINFO.szTypeName)
      GetDriveString = Volume & " (" & Left(DriveLetter, 1) & ":)"
    Else
      GoTo GeneralHanding
    End If
  End If
End Function

Public Sub SelAllText(ByVal TextBox As VB.TextBox)
  '全选文本
  TextBox.SelStart = 0
  TextBox.SelLength = Len(TextBox.Text)
End Sub

Public Function AppendPath(ByVal P1 As String, P2 As String) As String
  If Len(P1) = 0 Then AppendPath = P2: Exit Function
  
  If Right(P1, 1) = "\" Then
    AppendPath = P1 & P2
  Else
    AppendPath = P1 & "\" & P2
  End If
End Function

Public Function InitCommonControlsVB() As Boolean
   On Error Resume Next
   Dim iccex As tagInitCommonControlsEx
   ' Ensure CC available:
   With iccex
       .lngSize = LenB(iccex)
       .lngICC = ICC_USEREX_CLASSES
   End With
   InitCommonControlsEx iccex
   InitCommonControlsVB = (Err.Number = 0)
   On Error GoTo 0
End Function

Public Sub Main()
  InitCommonControlsVB
  frmMain.Show
End Sub

Public Function IsLyricsII(ByRef LyricsIIDir As String) As Boolean
  '获得 LyricsII 目录
  Dim RegDir As String
  
  RegDir = Registry.GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\Lyrics II", "Folder")
  
  If RegDir = ("Error") Then
    IsLyricsII = False
  Else
    IsLyricsII = True
    LyricsIIDir = RegDir
  End If
End Function

Public Sub InitLyricsIIDir()
  '初始化 LyricsII 的文件
  Dim LyricsIIExist As Boolean
  Dim FileName As String
  Dim lFile As Long
  Dim sLine As String
  Dim sData() As String
  Dim Counter As Long
  
  LyricsIIExist = (Len(LyricsIIFolder) > 0)
  
  '关联文件列表
  If bLYCIIAssociationList And LyricsIIExist Then
    Set LyricIIAssociationList = New VBA.Collection
    
    '打开文件
    lFile = FreeFile
    FileName = AppendPath(LyricsIIFolder, "LyricsII.lst")
    
    If FS.FileExists(FileName) Then
      Open FileName For Input Access Read Shared As lFile
      
      Do Until EOF(lFile)
        Line Input #lFile, sLine
        
        '分离字符串
        sData = Split(sLine, "|")
        ReDim Preserve sData(2) As String
        
        '添加到集合中
        LyricIIAssociationList.Add sData(2), LCase(sData(1))
      Loop
    End If
  Else
    Set LyricIIAssociationList = Nothing
  End If
  
  '查找的文件夹
  If bLYCIISearchDir And LyricsIIExist Then
    Set LyricIIDirs = New VBA.Collection
    
    '获得 Ini 文件
    FileName = AppendPath(LyricsIIFolder, "LyricsII.ini")
    
    '循环读取
    INIAPI.FileName = FileName
    Counter = 1
    
    Do
      sLine = INIAPI.GetIniString("LrcPath", Counter)
      
      If Len(sLine) = 0 Then
        Exit Do
      Else
        '添加项目
        sData = Split(sLine, "|")
        LyricIIDirs.Add sData(2)
        Counter = Counter + 1
      End If
    Loop
  Else
    Set LyricIIDirs = Nothing
  End If
  
  '下载文件夹
  If bLYCIIDownDir And LyricsIIExist Then
    '获得 Ini 文件
    FileName = AppendPath(LyricsIIFolder, "LyricsII.ini")
    sLine = INIAPI.GetIniString("SaveToFile", "CustomPath")
    
    If Len(sLine) Then
      LyricsIIDownDir = sLine
    End If
  End If
End Sub

Public Sub CallHelp(ByVal hWnd As Long, Optional ByVal ContextID As Long = 0, Optional ByVal Mothed As Long = HH_DISPLAY_TOPIC)
  HtmlHelp hWnd, AppendPath(App.Path, "MP3PA.CHM"), Mothed, ContextID
End Sub

Public Function IsFileName(ByVal NewVal As String) As Boolean
  '判断文件名是否正确
  If Not InStr(NewVal, "/") = 0 Then Exit Function
  If Not InStr(NewVal, "\") = 0 Then Exit Function
  If Not InStr(NewVal, "?") = 0 Then Exit Function
  If Not InStr(NewVal, "<") = 0 Then Exit Function
  If Not InStr(NewVal, ">") = 0 Then Exit Function
  If Not InStr(NewVal, ":") = 0 Then Exit Function
  If Not InStr(NewVal, "*") = 0 Then Exit Function
  If Not InStr(NewVal, Chr(34)) = 0 Then Exit Function
  
  '判文件名是否含有非法字符
  If StrComp(NewVal, "CON", vbTextCompare) = 0 Then Exit Function
  If StrComp(NewVal, "AUX", vbTextCompare) = 0 Then Exit Function
  If StrComp(NewVal, "COM1", vbTextCompare) = 0 Then Exit Function
  If StrComp(NewVal, "COM2", vbTextCompare) = 0 Then Exit Function
  If StrComp(NewVal, "COM3", vbTextCompare) = 0 Then Exit Function
  If StrComp(NewVal, "COM4", vbTextCompare) = 0 Then Exit Function
  If StrComp(NewVal, "LPT1", vbTextCompare) = 0 Then Exit Function
  If StrComp(NewVal, "LPT2", vbTextCompare) = 0 Then Exit Function
  If StrComp(NewVal, "LPT3", vbTextCompare) = 0 Then Exit Function
  If StrComp(NewVal, "PRN", vbTextCompare) = 0 Then Exit Function
  If StrComp(NewVal, "NUL", vbTextCompare) = 0 Then Exit Function
  
  '文件名正确
  IsFileName = True
End Function

Public Function ExractLyric(ByVal FileName As String) As String
  '从文件中获得歌词并把它放置在文件中
  Dim iFile As Integer
  Dim sID3v1 As String * 3
  Dim sHeader As String * 30
  Dim sEnder As String * 15
  Dim lBeginOffset As Long
  Dim lLyricLen As Long
  Dim bLyric() As Byte
  
  '打开指定的文件
  Reset
  iFile = FreeFile
  Open FileName For Binary Access Read Shared As iFile
  
  '判断是否有 ID3v1
  '因为歌词信息是放在 ID3v1 之前
  Seek #iFile, LOF(iFile) - 127
  Get #iFile, , sID3v1
  
  '跳到结束的位置
  If sID3v1 = "TAG" Then
    Seek #iFile, Seek(iFile) - 18
  Else
    Seek #iFile, LOF(iFile) - 15
  End If
  
  '读取结束标识
  '例如: 001374LYRICS200
  On Error GoTo NoLyric
  Get #iFile, , sEnder
  
  '分析开始的位置
  lBeginOffset = CLng(Left(sEnder, 6))
  
  '读取开始的标识
  '例如: LYRICSBEGININD00003110LYR01344
  Seek #iFile, Seek(iFile) - lBeginOffset - 15
  Get #iFile, , sHeader
  lLyricLen = CLng(Right(sHeader, 5))
  
  '读取歌词信息
  ReDim bLyric(lLyricLen - 1) As Byte
  Get #iFile, , bLyric
  
  '关闭文件写入信息
  Close #iFile
  
  '创建新的临时文件
  FileName = GetTempFile("EXTLRC")
  iFile = FreeFile
  Open FileName For Binary Access Write Lock Write As iFile
  Put #iFile, , bLyric
  Close #iFile
  
  '返回临时文件的名称
  ExractLyric = FileName
  
  '如果发生错误就表示没有歌词
  On Error GoTo 0
  Exit Function
NoLyric:
  On Error GoTo 0
  ExractLyric = vbNullString
End Function

Public Sub Testing(FN As String)
  '测试模块
  Debug.Print ReadTTPLInfo(FN)
End Sub



