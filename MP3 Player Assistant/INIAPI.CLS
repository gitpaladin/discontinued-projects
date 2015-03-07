VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "INIAPI"
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
Private Declare Function GetPrivateProfileInt Lib "kernel32" Alias "GetPrivateProfileIntA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal nDefault As Long, ByVal lpFileName As String) As Long
Private Declare Function GetPrivateProfileSection Lib "kernel32" Alias "GetPrivateProfileSectionA" (ByVal lpAppName As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Private Declare Function GetPrivateProfileSectionNames Lib "kernel32" Alias "GetPrivateProfileSectionNamesA" (ByVal lpszReturnBuffer As String, ByVal nSize As Long, ByVal lpFileName As String) As Long

Private Declare Function WritePrivateProfileSection Lib "kernel32" Alias "WritePrivateProfileSectionA" (ByVal lpAppName As String, ByVal lpString As String, ByVal lpFileName As String) As Long
Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long

Private vFileName As String

'======================================================================
'FileName 属性
'--------------
'设置要操作 API 的 INI 文件的名字。
'======================================================================
Public Property Get FileName() As String
Attribute FileName.VB_Description = "返回、设置要操作的文件名，如果设置一个不存在的文件名则发生一个运行时错误。"
Attribute FileName.VB_UserMemId = 0
  FileName = vFileName
End Property

Public Property Let FileName(ByVal vNewValue As String)
  vFileName = vNewValue
End Property

'======================================================================
'GetIniInteger 方法
'-------------------
'为初始化文件中指定的条目获取一个整数值。
'======================================================================
Public Function GetIniInteger(ByVal Section As String, ByVal Key As String, Optional ByVal Default As Long = 0) As Long
Attribute GetIniInteger.VB_Description = "返回一个长整数(Long)，它是由 API 从 INI 文件中读取的数据。如果错误则返回 0。"
  Dim Result As Long
  
  Result = GetPrivateProfileInt(Section, Key, Default, vFileName)
  
  GetIniInteger = Result
End Function

'======================================================================
'GetIniKeys 方法
'----------------
'获取指定小节所有项名和值的一个列表。
'======================================================================
Public Function GetIniKeys(ByVal Section As String) As Collection
Attribute GetIniKeys.VB_Description = "返回一个集合对象(Collection 对象)，它是由 API 从 INI 文件中读取的节中键的名称，每一个名称都记录在返回的集合对象中。如果错误则返回 Nothing。"
  Dim Result As Long
  Dim Keys As String
  Dim KeyList() As String
  Dim i As Long
  Dim Returen As New Collection
  
  Keys = Space(32767)
  
  Result = GetPrivateProfileSection(Section, Keys, 32767, vFileName)
  
  Keys = Trim(Keys)
  
  If Len(Keys) > 2 Then
    Keys = Left(Keys, Len(Keys) - 2)
  End If
  
  KeyList = Split(Keys, Chr(0))
  
  For i = 0 To UBound(KeyList)
    Returen.Add KeyList(i)
  Next i
  
  Set GetIniKeys = Returen
End Function

'======================================================================
'GetIniString 方法
'------------------
'为初始化文件中指定的条目取得字串。
'======================================================================
Public Function GetIniString(ByVal Section As String, ByVal Key As String, Optional ByVal Default As String = vbNullString) As String
Attribute GetIniString.VB_Description = "返回一个字符串(String)，它是由 API 从 INI 文件中读取的字符串数据。如果错误则返回 vbNullString。"
  Dim Result As Long
  Dim StrItem As String
  
  StrItem = Space(32767)
  Result = GetPrivateProfileString(Section, Key, Default, StrItem, 32767, vFileName)
  
  If Result Then
    StrItem = Left(StrItem, InStr(1, StrItem, Chr(0), vbTextCompare) - 1)
    GetIniString = StrItem
  Else
    GetIniString = vbNullString
  End If
End Function

'======================================================================
'GetIniString 方法
'------------------
'为初始化文件中指定的条目取得字串。
'======================================================================
Public Function GetIniSections() As Collection
Attribute GetIniSections.VB_Description = "返回一个集合对象(Collection 对象)，它是由 API 从 INI 文件中读取的节的名称，每一个节的名称都记录在返回的集合对象中。如果错误则返回 Nothing。"
  Dim Result As Long
  Dim Sections As String
  Dim SectionList() As String
  Dim i As Long
  Dim ReturnCol As New Collection
  
  Sections = Space(32767)
  Result = GetPrivateProfileSectionNames(Sections, 32767, vFileName)
  Sections = Trim(Sections)
  If Len(Sections) > 2 Then Sections = Left(Sections, Len(Sections) - 2)
  SectionList = Split(Sections, Chr(0))
  
  For i = 0 To UBound(SectionList)
    ReturnCol.Add SectionList(i)
  Next i
  
  Set GetIniSections = ReturnCol
End Function

'======================================================================
'SetIniSection 方法
'-------------------
'为一个初始化文件（.ini）中指定的小节设置所有项名和值。
'======================================================================
Public Function SetIniKeys(ByVal Section As String, ByVal KeyList As Collection) As Boolean
Attribute SetIniKeys.VB_Description = "指定一个集合对象(Collection 对象)，用 API 把每一键的内容写入到指定的 INI 文件中。失败会设置 GetLastError。"
  Dim Result As Long
  Dim KeyData As String
  Dim i As Long
  
  For i = 1 To KeyList.Count
    KeyData = KeyList(i) & Chr(0)
  Next i
  
  KeyData = KeyData & Chr(0)
  
  Result = WritePrivateProfileSection(Section, KeyData, vFileName)
  
  SetIniKeys = IIf(Result = 0, False, True)
End Function

'======================================================================
'SetIniString 方法
'------------------
'在初始化文件指定小节内设置一个字串。
'======================================================================
Public Function SetIniString(ByVal Section As String, ByVal Key As String, ByVal Value As String) As Boolean
Attribute SetIniString.VB_Description = "指定一个字符串(String)，用 API 把每该字符串的内容写入到指定的 INI 的指定节的指定键中。失败会设置 GetLastError。"
  Dim Result As Long
  
  Result = WritePrivateProfileString(Section, Key, Value, vFileName)
  
  SetIniString = IIf(Result = 0, False, True)
End Function
