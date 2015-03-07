VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "APETAG"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'**************************************************************
'MP3 APETAG 读取类模块
'----------------------
'BY Alexander Chen
'**************************************************************

Option Explicit

Public Exist As Boolean                           '存在 APETAG

Public Title As String                            '标题
Public Artist As String                           '艺术家
Public Album As String                            '专辑
Public Year As String                             '年代
Public Comment As String                          '注释
Public Track As Integer                           '音轨
Public Genre As String                            '流派
Public OtherField As New Collection               '其他字段
Public OtherName As New Collection                '其他字段名称

Private Enum CurrentProcess
  GetLength = 0                                   '读取长度
  FindName = 1                                    '查找名称
  ReadName = 2                                    '读取名称
  FindValue = 3                                   '查找值
  ReadValue = 4                                   '读取值
  SkipAnalysis = -1                               '完成
End Enum

Private Const IML_KEY As String = ">APETAG"
Private Const LST_TEXT As String = "APETAG"
Private Const LST_COLOR As Long = 32768

Public Property Get idImlKey() As String
  idImlKey = IML_KEY
End Property

Public Property Get idLstText() As String
  idLstText = LST_TEXT
End Property

Public Property Get idCellColor() As OLE_COLOR
  idCellColor = LST_COLOR
End Property

'=============
' 读取 APETAG
'=============
Public Function LoadInfo(ByVal FileName As String) As Boolean
  Const lReadLen As Long = 32768
  Const lTagMarkLen As Long = 8

  Dim bTagStart(11) As Byte
  Dim bTagContent() As Byte
  Dim bBufName() As Byte
  Dim bBufValue() As Byte
  Dim sName As String
  Dim sValue As String
  Dim lPosStart As Long
  Dim lPosEnd As Long
  Dim iFile As Integer
  Dim lCurPos As Long
  Dim lSize As Long
  Dim coProcess As CurrentProcess
  Dim iCounter As Long
  Dim i As Long
  Dim bTagTest(11) As Byte

  '初始化属性
  InitProperties
  
  '查找 APETAG
  '信息标志:
  '41 50 45 54 41 47 45 58 D0 07 00 00    APETAGEX...
  bTagStart(0) = &H41
  bTagStart(1) = &H50
  bTagStart(2) = &H45
  bTagStart(3) = &H54
  bTagStart(4) = &H41
  bTagStart(5) = &H47
  bTagStart(6) = &H45
  bTagStart(7) = &H58
  bTagStart(8) = &HD0
  bTagStart(9) = &H7
  bTagStart(10) = &H0
  bTagStart(11) = &H0

  '打开文件查找 TAG 位置
  Reset
  iFile = FreeFile
  Open FileName For Binary Access Read Lock Write As #iFile
  
  lPosStart = SeekByte(iFile, bTagStart)
  
  Exist = Not (lPosStart = -1)
  If Exist = False Then Exit Function
  
  On Error Resume Next
  
ReadTagInfo:
  '读取 TAG 信息
  lPosStart = lPosStart + 12
  
  Get #iFile, lPosStart, lSize
  
  '分析嵌套格式
  If lSize > 20 Then
    Get #iFile, lPosStart + 20, bTagTest
    
    If ArrayEquivalency(bTagTest, bTagStart) Then
      lPosStart = lPosStart + 20
      GoTo ReadTagInfo
    End If
  End If
  
GoNext:
  ReDim bTagContent(lSize - 33)
  lPosStart = lPosStart + 20
  
  Get #iFile, lPosStart, bTagContent
  
  Close #iFile
  
  '分析 TAG
  For iCounter = 0 To UBound(bTagContent)
    Select Case coProcess
    Case CurrentProcess.GetLength
      '读取字段值的长度
      lSize = bTagContent(iCounter + 1) * 256 + bTagContent(iCounter) - 1
      coProcess = SkipAnalysis
    Case CurrentProcess.SkipAnalysis
      '跳过长度
      coProcess = FindName
    Case CurrentProcess.FindName
      '查找名称
      If bTagContent(iCounter) > 0 Then
        '开始名称
        ReDim bBufName(0) As Byte
        bBufName(0) = bTagContent(iCounter)
        coProcess = ReadName
      End If
    Case CurrentProcess.ReadName
      '读取名称
      If bTagContent(iCounter) = 0 Then
        '名称结束
        coProcess = FindValue
      Else
        ReDim Preserve bBufName(UBound(bBufName) + 1) As Byte
        bBufName(UBound(bBufName)) = bTagContent(iCounter)
      End If
    Case CurrentProcess.FindValue
      '查找值
      If bTagContent(iCounter) > 0 Then
        '开始写入值
        ReDim bBufValue(lSize) As Byte
        bBufValue(lCurPos) = bTagContent(iCounter)
        lCurPos = lCurPos + 1
        coProcess = ReadValue
      
        If Not CBool(lSize) Then
          '只有一个字段
          sName = UTF8Conv.UTF8_Decode(bBufName)
          sValue = UTF8Conv.UTF8_Decode(bBufValue)
          OtherField.Add sValue, sName
          OtherName.Add sName, sName
          lCurPos = 0
        
          '最后一次读取值
          coProcess = GetLength
        End If
      End If
    Case CurrentProcess.ReadValue
      '读取值
      If lSize Then
        bBufValue(lCurPos) = bTagContent(iCounter)
        lCurPos = lCurPos + 1
        
        If lCurPos = lSize + 1 Then
          '最后一次读取值
          coProcess = GetLength
          
          '添加到集合中
          sName = UTF8Conv.UTF8_Decode(bBufName)
          sValue = UTF8Conv.UTF8_Decode(bBufValue)
          OtherField.Add sValue, sName
          OtherName.Add sName, sName
          lCurPos = 0
        End If
      End If
    End Select
  Next iCounter
  
  On Error GoTo 0
  
  '解读信息
  If ItemExist("Title", OtherField) Then
    Title = OtherField("Title")
    OtherField.Remove "Title"
    OtherName.Remove "Title"
  End If
  
  If ItemExist("Album", OtherField) Then
    Album = OtherField("Album")
    OtherField.Remove "Album"
    OtherName.Remove "Album"
  End If

  If ItemExist("Artist", OtherField) Then
    Artist = OtherField("Artist")
    OtherField.Remove "Artist"
    OtherName.Remove "Artist"
  End If

  If ItemExist("Comment", OtherField) Then
    Comment = OtherField("Comment")
    OtherField.Remove "Comment"
    OtherName.Remove "Comment"
  End If

  If ItemExist("Genre", OtherField) Then
    Genre = OtherField("Genre")
    OtherField.Remove "Genre"
    OtherName.Remove "Genre"
  End If

  If ItemExist("Track", OtherField) Then
    Track = CInt(Val(OtherField("Track")))
    OtherField.Remove "Track"
    OtherName.Remove "Track"
  End If

  If ItemExist("Year", OtherField) Then
    Year = OtherField("Year")
    OtherField.Remove "Year"
    OtherName.Remove "Year"
  End If
End Function

'============
' 初始化属性
'============
Private Sub InitProperties()
  Exist = False
  Title = vbNullString
  Artist = vbNullString
  Album = vbNullString
  Year = vbNullString
  Comment = vbNullString
  Track = -1
  Genre = vbNullString
  
  Set OtherField = New VBA.Collection
  Set OtherName = New VBA.Collection
End Sub

'==============
' 查找特定字符
'==============
Private Function SeekByte(ByVal iFile As Integer, ByRef bSeek() As Byte) As Long
  Dim lLength As Long
  Dim bRead() As Byte
  Dim ci As Long
  Dim cj As Long
  
  '设置文件长度
  lLength = LOF(iFile)
  
  If lLength = 0 Then
    SeekByte = -1
    Exit Function
  End If
  
  If lLength <= 32768 Then
    '文件很小
    ReDim bRead(lLength - 1) As Byte
    Get #iFile, 1, bRead
  Else
    '文件很大
    ReDim bRead(32767)
    Get #iFile, lLength - 32767, bRead
  End If
  
  '查找
  For ci = 0 To UBound(bRead)
    For cj = 0 To UBound(bSeek)
      If bRead(ci + cj) <> bSeek(cj) Then
        '不匹配
        GoTo NextByte
      End If
    Next cj
    
    '匹配
    SeekByte = lLength + ci - 32767
    Exit Function
NextByte:
  Next ci
  
  '没有找到
  SeekByte = -1
End Function

'===========================
' 将 LPSTR 转化为 VB String
'---------------------------
' Item - LPSTR 字符串
'===========================
Private Function StripNulls(sz As String) As String
    If InStr(sz, vbNullChar) Then
        StripNulls = Left$(sz, InStr(sz, vbNullChar) - 1)
    Else
        ' If sz had no null char, the Left$ function
        ' above would return a zero length string ("").
        StripNulls = sz
    End If
End Function

'====================================
' 判断一个元素是否在一个集合中
'------------------------------
' Item - Long(索引) 或 String(关键字)
' Collection - Object 集合对象
'====================================
Public Function ItemExist(Item, Collection) As Boolean
  Dim Test As Variant
  
  On Error GoTo NotFound
  Test = Collection(Item)
  ItemExist = True
  On Error GoTo 0
  Exit Function
NotFound:
  ItemExist = False
End Function

'====================================
' 判断两个数组是否等价
'------------------------------
' Array1 - 数组1
' Array2 - 数组2
'====================================
Public Function ArrayEquivalency(Array1() As Byte, Array2() As Byte) As Boolean
  Dim i As Long
  
  If LBound(Array1) <> LBound(Array2) Then Exit Function
  If UBound(Array1) <> UBound(Array2) Then Exit Function
  
  For i = LBound(Array1) To UBound(Array1)
    If Array1(i) <> Array2(i) Then
      Exit Function
    End If
  Next i
  
  ArrayEquivalency = True
End Function

