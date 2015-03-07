VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "NOTAG"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Public Exist As Boolean

Private Const IML_KEY As String = ">NOTAG"
Private Const LST_TEXT As String = "√ª”–±Í«©"
Private Const LST_COLOR As Long = 8360346

Public Property Get idImlKey() As String
  idImlKey = IML_KEY
End Property

Public Property Get idLstText() As String
  idLstText = LST_TEXT
End Property

Public Property Get idCellColor() As OLE_COLOR
  idCellColor = LST_COLOR
End Property

Public Function LoadInfo(ByVal FileName As String) As Boolean
  Exist = False
  LoadInfo = False
End Function


