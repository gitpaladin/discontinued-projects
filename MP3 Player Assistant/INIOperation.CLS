VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "INIOperation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "INI 文件的 API 操作通道，它封装了 6 个 API 函数。使用它可以方便地访问、写入 INI 文件。"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'**********************************************************************
'                                                          INIAPI 对象
'                                                         -------------
'    用于通过 API 简单地访问 INI 文件。
'**********************************************************************
Option Explicit

Private vFileName As String
Private cSection As VBA.Collection
Private cSecName As VBA.Collection

'======================================================================
'FileName 属性
'--------------
'设置要操作的 INI 文件的名字。
'======================================================================
Public Property Get FileName() As String
Attribute FileName.VB_Description = "返回、设置要操作的文件名，如果设置一个不存在的文件名则发生一个运行时错误。"
Attribute FileName.VB_UserMemId = 0
  FileName = vFileName
End Property

Public Property Let FileName(ByVal vNewValue As String)
  Dim cValue As New VBA.Collection
  Dim CurrentSection As String
  Dim sLine As String
  Dim sKey As String
  Dim iFl As Integer
  Dim lPos As Long
  
  If vNewValue <> vFileName Then
    vFileName = vNewValue
    
    Set cSection = New VBA.Collection
    Set cSecName = New VBA.Collection
  
    If FS.FileExists(vFileName) Then
      '需要读取文件
      Set cSection = New VBA.Collection
      Set cSecName = New VBA.Collection
      
      '打开文件
      iFl = FreeFile
      Open vNewValue For Input As iFl
      
      '分析文件
      Do Until EOF(iFl)
        '读取文件
        Line Input #iFl, sLine
        
        sLine = Trim(sLine)
        
        If Len(sLine) Then
          If Left(sLine, 1) <> ";" Then
            If CBool(InStr(1, sLine, "]")) And (Left(sLine, 1) = "[") Then
              '表示是一个节的开始
              '存储上一个节的内容
              If Len(CurrentSection) Then
                cSecName.Add CurrentSection, CurrentSection
                cSection.Add cValue, CurrentSection
                Set cValue = New VBA.Collection
              End If
              
              '创建下一个集合
              CurrentSection = GetSectionName(sLine)
            ElseIf Len(CurrentSection) Then
              '表示是其中的数据
              '去掉其中的注释
              lPos = InStr(1, sLine, " ;")
              
              If lPos Then
                sLine = Left(sLine, lPos - 1)
              End If
              
              '获得 Key
              lPos = InStr(1, sLine, "=")
              
              If lPos > 1 Then
                '是合法的数据
                sKey = Left(sLine, lPos - 1)
                cValue.Add sLine, sKey
              End If
            End If
          End If
        End If
      Loop
      
      '添加最后的节
      If Len(CurrentSection) Then
        cSecName.Add CurrentSection, CurrentSection
        cSection.Add cValue, CurrentSection
        Set cValue = New VBA.Collection
      End If
      
      '关闭文件
      Close iFl
    End If
  End If
End Property

'======================================================================
'GetIniString 方法
'------------------
'获得制定的词条
'======================================================================
Public Function GetIniString(ByVal Section As String, ByVal Key As String, Optional Default As String = vbNullString) As String
  Dim cValue As Collection
  
  On Error GoTo ReturnDefault
  
  Set cValue = cSection(Section)
  GetIniString = cValue(Key)
  GetIniString = Right(GetIniString, Len(GetIniString) - InStr(1, GetIniString, "="))
  
  Exit Function
ReturnDefault:
  GetIniString = Default
End Function

'======================================================================
'GetIniInteger 方法
'------------------
'获得制定的词条的数值
'======================================================================
Public Function GetIniInteger(ByVal Section As String, ByVal Key As String, Optional Default As Long = 0) As Long
  Dim cValue As Collection
  Dim sTmp
  
  On Error GoTo ReturnDefault
  
  Set cValue = cSection(Section)
  sTmp = cValue(Key)
  sTmp = Right(sTmp, Len(sTmp) - InStr(1, sTmp, "="))
  GetIniInteger = CLng(sTmp)
  
  Exit Function
ReturnDefault:
  GetIniInteger = Default
End Function

'======================================================================
'SetIniString 方法
'------------------
'写入属性
'======================================================================
Public Function SetIniString(ByVal Section As String, ByVal Key As String, ByVal Value As String) As Boolean
  Dim cValue As Collection
  
  On Error GoTo NoSuchSection
  Set cValue = cSection(Section)
  
  On Error Resume Next
  cValue.Remove Key
  
  '没有键就添加一个键
  cValue.Add Key & "=" & Value, Key
  
  On Error GoTo 0
  Exit Function

NoSuchSection:
  '没有节就添加一个节
  cSection.Add New VBA.Collection, Section
  cSecName.Add Section, Section
  Resume
  
End Function

'======================================================================
'Update 方法
'------------------
'更新文件
'======================================================================
Public Sub Update()
  '写入到文件
  Dim F As Integer
  Dim i As Long
  Dim j As Long
  Dim cValue As VBA.Collection
  
  F = FreeFile
  Open vFileName For Output Access Write As F
  
  '写入文件
  For i = 1 To cSection.Count
    '写入节头
    Print #F, "[" & cSecName(i) & "]"
    
    '写入数据
    Set cValue = cSection(i)
    
    For j = 1 To cValue.Count
      Print #F, cValue(j)
    Next j
    
    '写入空白
    Print #F,
  Next i
  
  Close #F
End Sub

Private Sub Class_Initialize()
  Set cSection = New VBA.Collection
End Sub

Private Sub Class_Terminate()
  Set cSection = Nothing
End Sub

Private Function GetSectionName(ByVal szLine As String) As String
  '获得名字的函数
  Dim lPos As Long
  
  lPos = InStr(1, szLine, "]")
  
  If lPos Then GetSectionName = Mid(szLine, 2, lPos - 2)
End Function

