VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ListInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"

Public Index As Long
Public Lyric As Boolean
Public LyricSize As Long
Public LyricFile As String
Public FileName As String
Public Artist As String
Public Title As String
Public Album As String
Public Genre As String
Public Length As Long
Public LengthString As String
Public Track As Integer
Public Year As String
Public Size As Long
Public CreateDate As Date
Public CreateDateW As String
Public IconIndex As String

Public Tag As String
Public Selected As Boolean
Public AudioFile As Boolean

Public TagImlKey As String
Public TagColor As OLE_COLOR
Public TagText As String
Public TagExist As Boolean

Public NewName As String
Public Folder As String

Public Destination As String
