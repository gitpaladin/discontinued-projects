VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "WMPTAG"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'**************************************************************
'MP3 Windows Media ��ȡ��ģ��
'-----------------------------
'BY Alexander Chen
'**************************************************************

Public Exist As Boolean                           '���� ID3v1
Public Title As String                            '����
Public Artist As String                           '������
Public Album As String                            'ר��
Public Year As String                             '���
Public Comment As String                          'ע��
Public Track As Integer                           '����
Public Genre As String                            '����

Private oWMP As WMPLibCtl.WindowsMediaPlayer

Private Const IML_KEY As String = ">WMP"
Private Const LST_TEXT As String = "WMP ��ǩ"
Private Const LST_COLOR As Long = 2194316

Public Property Get idImlKey() As String
  idImlKey = IML_KEY
End Property

Public Property Get idLstText() As String
  idLstText = LST_TEXT
End Property

Public Property Get idCellColor() As OLE_COLOR
  idCellColor = LST_COLOR
End Property

'============
' ��ȡ ID3v1
'============
Public Function LoadInfo(ByVal FileName As String) As Boolean
  Dim oMedia As WMPLibCtl.IWMPMedia
  
  InitProperties
  
  Set oMedia = oWMP.newMedia(FileName)
  
  '��ȡ��Ϣ
  On Error Resume Next
  Title = oMedia.getItemInfo("Title")
  Artist = oMedia.getItemInfo("Author")
  Album = oMedia.getItemInfo("WM/AlbumTitle")
  Year = oMedia.getItemInfo("WM/Year")
  Comment = oMedia.getItemInfo("Description")
  Track = CInt(oMedia.getItemInfo("WM/TrackNumber"))
  Genre = oMedia.getItemInfo("WM/Genre")
  On Error GoTo 0
  
  If (Len(Title) = 0) And (Len(Artist) = 0) And (Len(Album) = 0) And (Len(Year) = 0) And (Len(Comment) = 0) And (Track = -1) And (Genre = vbNullString) Then
    Exist = False
  Else
    Exist = True
  End If
End Function

'============
' ��ʼ������
'============
Private Sub InitProperties()
  Exist = False
  Title = vbNullString
  Artist = vbNullString
  Album = vbNullString
  Year = vbNullString
  Comment = vbNullString
  Track = -1
  Genre = -1
End Sub

Public Sub InitClass(ByVal vWMP As WMPLibCtl.WindowsMediaPlayer)
  Set oWMP = vWMP
End Sub

Private Sub Class_Initialize()
  Set oWMP = Nothing
End Sub

Private Sub Class_Terminate()
  Set oWMP = Nothing
End Sub