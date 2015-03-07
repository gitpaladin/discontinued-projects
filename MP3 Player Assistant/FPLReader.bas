Attribute VB_Name = "PlaylistReader"
'**************************************************************
'Foobar2000 播放列表(*.FPL)读取模块
'-----------------------------------
'BY Alexander Chen
'**************************************************************

Option Explicit

'头数据
Private Type FPL_HEADER
  Identifier(1 To 20) As Byte
  Number As Long
End Type

'项目信息
Public Type FPL_ITEM_INFO
  FileName As String
  Title As String
  Artist As String
  Album As String
  TrackNumber As Long
  Bitrate As Long
  VBR As Boolean
  Channels As Integer
  SampleRate As Long
  Mp3StereoMode As String
  Codec As String
  PlayCounter As Long
  DateYear As String
  Genre As String
  FileSize As Long
End Type

'项目信息
Public Type M3U_ITEM_INFO
  FileName As String
  DispTitle As String
  Length As Long
End Type

Private FPLAudioList() As FPL_ITEM_INFO
Private M3UAudioList() As M3U_ITEM_INFO

Public Function ReadFplInfo(ByVal FileName As String) As Boolean
  '返回数组
  Dim AudioItem As New VBA.Collection
  Dim AudioSeek As FPL_ITEM_INFO
  Dim FileHeader As FPL_HEADER
  Dim F As Integer
  Dim lIdentifier As Long
  Dim lLength As Long
  Dim bData() As Byte
  Dim sField As String
  Dim sValue As String
  Dim e As Long               '计时器变量
  Dim d As Long               '计时器变量
  Dim lCounter As Long        '循环变量
  Dim lFileSize As Long       '文件大小
  
  '打开文件
  F = FreeFile
  Open FileName For Binary Access Read Shared As F
  
  '读取头信息
  Get #F, , FileHeader
  
  '判断是否是 FPL 文件
  '8268 D0E3 4B87 E343 9825 4E42 020A F543 0000 0000       .h..K..C.%NB...C....
  If FileHeader.Identifier(1) <> &H82 Then Exit Function
  If FileHeader.Identifier(2) <> &H68 Then Exit Function
  If FileHeader.Identifier(3) <> &HD0 Then Exit Function
  If FileHeader.Identifier(4) <> &HE3 Then Exit Function
  If FileHeader.Identifier(5) <> &H4B Then Exit Function
  If FileHeader.Identifier(6) <> &H87 Then Exit Function
  If FileHeader.Identifier(7) <> &HE3 Then Exit Function
  If FileHeader.Identifier(8) <> &H43 Then Exit Function
  If FileHeader.Identifier(9) <> &H98 Then Exit Function
  If FileHeader.Identifier(10) <> &H25 Then Exit Function
  If FileHeader.Identifier(11) <> &H4E Then Exit Function
  If FileHeader.Identifier(12) <> &H42 Then Exit Function
  If FileHeader.Identifier(13) <> &H2 Then Exit Function
  If FileHeader.Identifier(14) <> &HA Then Exit Function
  If FileHeader.Identifier(15) <> &HF5 Then Exit Function
  If FileHeader.Identifier(16) <> &H43 Then Exit Function
  If FileHeader.Identifier(17) <> &H0 Then Exit Function
  If FileHeader.Identifier(18) <> &H0 Then Exit Function
  If FileHeader.Identifier(19) <> &H0 Then Exit Function
  If FileHeader.Identifier(20) <> &H0 Then Exit Function
  
  '读取列表数目
  On Error Resume Next
  
  ReDim FPLAudioList(1 To FileHeader.Number) As FPL_ITEM_INFO
  
  For e = 1 To FileHeader.Number
    '读取文件名
    Get #F, , lIdentifier
    Get #F, , lLength
    ReDim bData(lLength - 1) As Byte
    Get #F, , bData
    
    sValue = UTF8Conv.UTF8_Decode(bData, True)
    FPLAudioList(e).FileName = sValue
    sField = ""
    sValue = ""
    
    If lIdentifier = 13 Then
      '获得文件大小
      Get #F, , lFileSize
      Get #F, , lFileSize
      
      FPLAudioList(e).FileSize = lFileSize
      
      '跳过无效的内容
      Seek #F, Seek(F) + 20
      
      '获得基本信息的个数
      Get #F, , lCounter
      
      For d = 1 To lCounter
        '获得字段名称
        Get #F, , lLength
        ReDim bData(lLength - 1) As Byte
        Get #F, , bData
        sField = UTF8Conv.UTF8_Decode(bData, True)
        
        '获得值
        Get #F, , lLength
        ReDim bData(lLength - 1) As Byte
        Get #F, , bData
        sValue = UTF8Conv.UTF8_Decode(bData, True)
        
        '分析字段
        Select Case UCase(sField)
        Case "TITLE": FPLAudioList(e).Title = sValue
        Case "ARTIST": FPLAudioList(e).Artist = sValue
        Case "ALBUM": FPLAudioList(e).Album = sValue
        Case "TRACKNUMBER": FPLAudioList(e).TrackNumber = CLng(sValue)
        Case "DATE": FPLAudioList(e).DateYear = sValue
        Case "GENRE": FPLAudioList(e).Genre = sValue
        Case "PLAY_COUNTER": FPLAudioList(e).PlayCounter = CLng(sValue)
        End Select
      Next d
      
      '获得技术信息
      Get #F, , lCounter
      
      For d = 1 To lCounter
        '获得字段名称
        Get #F, , lLength
        ReDim bData(lLength - 1) As Byte
        Get #F, , bData
        sField = UTF8Conv.UTF8_Decode(bData, True)
        
        '获得值
        Get #F, , lLength
        ReDim bData(lLength - 1) As Byte
        Get #F, , bData
        sValue = UTF8Conv.UTF8_Decode(bData, True)
        
        '分析字段
        Select Case UCase(sField)
        Case "BITRATE": FPLAudioList(e).Bitrate = CLng(sValue)
        Case "CHANNELS": FPLAudioList(e).Channels = CInt(sValue)
        Case "SAMPLERATE": FPLAudioList(e).SampleRate = CLng(sValue)
        Case "EXTRAINFO": FPLAudioList(e).VBR = Not CBool(StrComp(sValue, "VBR", vbTextCompare))
        Case "MP3_STEREO_MODE": FPLAudioList(e).Mp3StereoMode = sValue
        Case "CODEC": FPLAudioList(e).Codec = sValue
        End Select
      Next d
      
      '添加到索引
      AudioItem.Add e, FPLAudioList(e).FileName
    ElseIf lIdentifier = 12 Then
      '跳过无效的字符
      Seek #F, Seek(F) + 20
      
      '查询信息
      sValue = FPLAudioList(e).FileName
      
      For d = 1 To UBound(FPLAudioList)
        If FPLAudioList(d).FileName = sValue Then
          AudioSeek = FPLAudioList(d)
          Exit For
        End If
      Next d
      
      FPLAudioList(e) = AudioSeek
    ElseIf lIdentifier = 0 Then
      '跳过无效的字符
      Seek #F, Seek(F) + 4
    End If
  Next e
  On Error GoTo 0
  
  Close #F
  
  ReadFplInfo = True
End Function

Public Function ReadM3UInfo(ByVal FileName As String) As Boolean
  '读取 M3U 信息
  Dim F As Integer
  Dim sLine As String
  Dim sTmp() As String
  Dim bExtended As Boolean
  Dim lCounter As Long
  
  '打开文件
  F = FreeFile
  Open FileName For Input Access Read Shared As #F
  
  '获得首行
  Line Input #F, sLine
  
  bExtended = (UCase(sLine) = "#EXTM3U")
  
  '首先添加
  If (Not bExtended) And (Left(sLine, 1) <> "#") Then
    lCounter = 1
    ReDim M3UAudioList(1 To lCounter) As M3U_ITEM_INFO
    M3UAudioList(lCounter).FileName = sLine
  End If
  
  '读取其他项目
  Do Until EOF(F)
    '计数加 1
    lCounter = lCounter + 1
    ReDim Preserve M3UAudioList(1 To lCounter) As M3U_ITEM_INFO
    
    '获得行
    Line Input #F, sLine
    
    If (Left(sLine, 8) = "#EXTINF:") Then
      '附加信息
      sLine = Right(sLine, Len(sLine) - 8)
      
      '分割信息
      sTmp = Split(sLine, ",", 2)
      
      '分析
      M3UAudioList(lCounter).Length = Val(sTmp(0))
      M3UAudioList(lCounter).DispTitle = sTmp(1)
      
      '获得下一行
      Line Input #F, sLine
    End If
    
    M3UAudioList(lCounter).FileName = sLine
  Loop
  
  '关闭文件
  Close #F
  
  ReadM3UInfo = True
End Function

Public Function FplListCount() As Long
  On Error Resume Next
  FplListCount = UBound(FPLAudioList)
  On Error GoTo 0
End Function

Public Function GetFplInfoItem(ByVal Index As Long) As FPL_ITEM_INFO
  GetFplInfoItem = FPLAudioList(Index)
End Function

Public Function M3UListCount() As Long
  On Error Resume Next
  M3UListCount = UBound(M3UAudioList)
  On Error GoTo 0
End Function

Public Function GetM3UInfoItem(ByVal Index As Long) As M3U_ITEM_INFO
  GetM3UInfoItem = M3UAudioList(Index)
End Function

'读取文件 CUE
Public Function CUE_GetItems(ByVal FileName As String) As VBA.Collection
  '获得 CUE 内容的
  Dim F As Integer
  Dim Files As New VBA.Collection
  Dim sLine As String
  Dim lLen As Long
  
  F = FreeFile
  Open FileName For Input Access Read Shared As #F
  
  '读取文件
  On Error GoTo NextLine
  Do Until EOF(F)
    Line Input #1, sLine
    
    If Left(sLine, 4) = "FILE" Then
      sLine = Right(sLine, Len(sLine) - InStr(1, sLine, Chr(34)))
      sLine = Left(sLine, InStrRev(sLine, Chr(34)) - 1)
      Files.Add sLine
    End If
NextLine:
  Loop
  On Error GoTo 0
  
  Close #F
  
  Set CUE_GetItems = Files
End Function

'读取文件 PLS
Public Function PLS_GetItems(ByVal FileName As String) As VBA.Collection
  Dim Count As Long
  Dim IniPls As New MP3PA.INIAPI
  Dim sfile As String
  Dim e As Long
  
  Set PLS_GetItems = New VBA.Collection
  
  '获得文件数目
  IniPls.FileName = FileName
  Count = IniPls.GetIniInteger("playlist", "NumberOfEntries", 0)
  
  '分别读取
  For e = 1 To Count
    sfile = IniPls.GetIniString("playlist", "File" & e)
    PLS_GetItems.Add sfile
  Next e
End Function

'读取文件 M3U8
Public Function M3U8_GetItems(ByVal FileName As String) As VBA.Collection
  Dim sStr() As Byte
  Dim sByte As Byte
  Dim sNLine As Byte
  Dim sString As String
  Dim lFile As Long
  Dim lPos As Long
  Dim iBound As Integer
  Dim F As Integer
  
  Set M3U8_GetItems = New VBA.Collection
  
  '打开文件
  F = FreeFile
  Open FileName For Binary Access Read Shared As #F
  lFile = LOF(F)
  
  lPos = 4
  iBound = 0
  
  Do Until lPos > lFile
    '读取字符
    Get #F, lPos, sByte
    
    '判断是否是换行符
    If (sByte = 13) And (lPos < lFile) Then
      Get #F, lPos + 1, sNLine
      
      If sNLine = 10 Then
        '是新的一行
        sString = UTF8_Decode(sStr, True)
        'sString = UTF8_DecodeAlt(sStr)
        M3U8_GetItems.Add sString
        
        '下一个记录点
        ReDim sStr(0) As Byte
        iBound = 0
        lPos = lPos + 2
        GoTo NextChar
      End If
    End If
    
    '读取数据
    ReDim Preserve sStr(iBound) As Byte
    sStr(iBound) = sByte
    iBound = iBound + 1
    lPos = lPos + 1
    
    '下一步
NextChar:
  Loop
  
  Close #F
End Function

'读取文件 WPL
Public Function WPL_GetItems(ByVal FileName As String, ByVal WMP As WMPLibCtl.WindowsMediaPlayer) As VBA.Collection
  '读取播放列表
  Dim oList As WMPLibCtl.IWMPPlaylist
  Dim oItem As WMPLibCtl.IWMPMedia
  Dim e As Long
  
  '打开列表
  Set oList = WMP.newPlaylist("WPL_File", FileName)
  Set WPL_GetItems = New VBA.Collection
  
  For e = 0 To oList.Count - 1
    Set oItem = oList.Item(e)
    
    WPL_GetItems.Add oItem.sourceURL
  Next e
End Function

'读取文件 ASX
Public Function ASX_GetItems(ByVal FileName As String, ByVal WMP As WMPLibCtl.WindowsMediaPlayer) As VBA.Collection
  '读取播放列表
  Dim oList As WMPLibCtl.IWMPPlaylist
  Dim oItem As WMPLibCtl.IWMPMedia
  Dim e As Long
  
  '打开列表
  Set oList = WMP.newPlaylist("ASX_File", FileName)
  Set ASX_GetItems = New VBA.Collection
  
  For e = 0 To oList.Count - 1
    Set oItem = oList.Item(e)
    
    ASX_GetItems.Add oItem.sourceURL
  Next e
End Function

'读取 M3U
Public Function M3U_GetItems(ByVal FileName As String) As VBA.Collection
  '读取 M3U 信息
  Dim F As Integer
  Dim sLine As String
  Dim sTmp() As String
  Dim bExtended As Boolean
  Dim lCounter As Long
  
  Set M3U_GetItems = New VBA.Collection
  
  '打开文件
  F = FreeFile
  Open FileName For Input Access Read Shared As #F
  
  '读取其他项目
  Do Until EOF(F)
    '获得行
    Line Input #F, sLine
    
    If Not (Left(sLine, 1) = "#") Then
      M3U_GetItems.Add sLine
    End If
  Loop
  
  '关闭文件
  Close #F
End Function

'读取千千静听的文件
Public Function ReadTTPLInfo(ByVal FileName As String, Optional ByVal OnlyReadTitle As Boolean = False) As String
  '读取千千的列表
  Dim F As Integer
  Dim bHeader(3) As Byte
  Dim lVersion As Long
  Dim lNull As Long
  Dim lLastPlay As Long
  Dim iJunkByte As Integer
  
  Dim lStrLength As Long
  Dim bStrBuffer() As Byte
  Dim sReader As String
  Dim i As Long
  
  '打开文件
  F = FreeFile
  Open FileName For Binary Access Read As #F
  
  '读取头数据
  Get #F, , bHeader
  Get #F, , lVersion
  Get #F, , lNull
  Get #F, , lLastPlay
  
  '检查是否是需要的版本
  If StrConv(bHeader, vbUnicode) = "TTBL" And lVersion = 3 And lNull = -1 Then
    '读取标题
    Get #F, , lStrLength
    ReDim bStrBuffer(lStrLength - 1) As Byte
    Get #F, , bStrBuffer
    sReader = CStr(bStrBuffer)
    ReadTTPLInfo = sReader
    
    If OnlyReadTitle Then Exit Function
  Else
    ReadTTPLInfo = vbNullString
    Close #F
    Exit Function
  End If
  
  i = 0
    
  '读取其中的数据
  Do Until EOF(F)
    '获得文件的位置
    Get #F, , lStrLength
    
    If lStrLength = 0 Then Exit Do
    
    ReDim bStrBuffer(lStrLength - 1) As Byte
    Get #F, , bStrBuffer
    sReader = CStr(bStrBuffer)
    ReDim Preserve M3UAudioList(i) As M3U_ITEM_INFO
    M3UAudioList(i).FileName = sReader
    
    '获得文件的显示的名称
    Get #F, , iJunkByte
    
    If iJunkByte Then
      '已经读取文件数据
      Get #F, , lStrLength
      ReDim bStrBuffer(lStrLength - 1) As Byte
      Get #F, , bStrBuffer
      sReader = CStr(bStrBuffer)
      M3UAudioList(i).DispTitle = sReader
      
      '获得文件的长度
      If iJunkByte = 6 Then
        Get #F, , lStrLength
        M3UAudioList(i).Length = Int(lStrLength \ 1000)
      End If
    Else
      '还没有读取文件数据
      M3UAudioList(i).DispTitle = FS.GetBaseName(sReader)
    End If
      
    '下一个文件
    i = i + 1
  Loop
  
  Close #F
End Function


'读取 Foobar2000 0.9.x 的播放列表
Public Function ReadFPL9Info(ByVal FileName As String) As Boolean
  
End Function
