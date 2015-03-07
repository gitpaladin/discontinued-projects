VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "FAVFolder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"No"
Attribute VB_Ext_KEY = "Member0" ,"FAVItems"
Option Explicit

Public Key As String
Public MusicType As Boolean

Private mvarFAVItems As FAVItems
Private mvarFAVFolders As FAVFolders

Public Property Get FavouriteItems() As FAVItems
    If mvarFAVItems Is Nothing Then
        Set mvarFAVItems = New FAVItems
    End If


    Set FavouriteItems = mvarFAVItems
End Property

Public Property Set FavouriteItems(vData As FAVItems)
    Set mvarFAVItems = vData
End Property

Private Sub Class_Terminate()
    Set mvarFAVItems = Nothing
    Set mvarFAVFolders = Nothing
End Sub

Public Property Get FavouriteSubFolders() As FAVFolders
  If mvarFAVFolders Is Nothing Then
    Set mvarFAVFolders = New FAVFolders
  End If


  Set FavouriteSubFolders = mvarFAVFolders
End Property

Public Property Let FavouriteSubFolders(ByVal vData As FAVFolders)
  Set mvarFAVFolders = vData
End Property
