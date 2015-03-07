VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "FPLReader"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
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

Private AudioList As VBA.Collection
Public Event ProgressChanged(ByVal Current As Long, Total As Long)

Public Function ReadFplInfo(ByVal FileName As String) As Boolean
  '返回数组
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
  Dim AudioItem As AudioInfo
  
  Set AudioList = New VBA.Collection
  
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
  
  For e = 1 To FileHeader.Number
    '读取文件名
    Set AudioItem = New MP3PA.ListInfo
    
    Get #F, , lIdentifier
    Get #F, , lLength
    ReDim bData(lLength - 1) As Byte
    Get #F, , bData
    
    sValue = UTF8Conv.UTF8_Decode(bData, True)
    AudioItem.FileName = sValue
    sField = vbNullString
    sValue = vbNullString
    
    If lIdentifier = 13 Then
      '跳过无效的内容
      Seek #F, Seek(F) + 28
      
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
        Case "TITLE": AudioItem.Title = sValue
        Case "ARTIST": AudioItem.Artist = sValue
        Case "ALBUM": AudioItem.Album = sValue
        Case "TRACKNUMBER": AudioItem.TrackNumber = CLng(sValue)
        Case "DATE": AudioItem.DateYear = sValue
        Case "GENRE": AudioItem.Genre = sValue
        Case "PLAY_COUNTER": AudioItem.PlayCounter = CLng(sValue)
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
        Case "BITRATE": AudioItem.Bitrate = CLng(sValue)
        Case "CHANNELS": AudioItem.Channels = CInt(sValue)
        Case "SAMPLERATE": AudioItem.SampleRate = CLng(sValue)
        Case "EXTRAINFO": AudioItem.VBR = Not CBool(StrComp(sValue, "VBR", vbTextCompare))
        Case "MP3_STEREO_MODE": AudioItem.Mp3StereoMode = sValue
        Case "CODEC": AudioItem.Codec = sValue
        End Select
      Next d
      
      '添加到索引
      AudioList.add AudioItem, AudioItem.FileName
    ElseIf lIdentifier = 12 Then
      '跳过无效的字符
      Seek #F, Seek(F) + 20
      
      AudioList.add AudioItem
      
      '查询信息
      Set AudioItem = New AudioInfo
      Set AudioItem = AudioList(AudioList(e).FileName)
      
      '填充
      AudioList(e).Album = AudioItem.Album
      AudioList(e).Artist = AudioItem.Artist
      AudioList(e).Bitrate = AudioItem.Bitrate
      AudioList(e).Channels = AudioItem.Channels
      AudioList(e).Codec = AudioItem.Codec
      AudioList(e).Mp3StereoMode = AudioItem.Mp3StereoMode
      AudioList(e).PlayCounter = AudioItem.PlayCounter
      AudioList(e).SampleRate = AudioItem.SampleRate
      AudioList(e).Title = AudioItem.Title
      AudioList(e).TrackNumber = AudioItem.TrackNumber
      AudioList(e).VBR = AudioItem.VBR
    Else
      '跳过无效的字符
      Seek #F, Seek(F) + 20
    End If
    
    RaiseEvent ProgressChanged(e, FileHeader.Number)
  Next e
  On Error GoTo 0
  
  Close #F
  
  ReadFplInfo = True
End Function

Public Function Count() As Long
  Count = AudioList.Count
End Function

Public Function GetInfoItem(ByVal Index As Long) As AudioInfo
  Set GetInfoItem = AudioList(Index)
End Function


