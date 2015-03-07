VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl UILyric 
   ClientHeight    =   5055
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5655
   ScaleHeight     =   5055
   ScaleWidth      =   5655
   Begin VB.Frame fraFromFile 
      Caption         =   "从 MP3 文件中获得歌词"
      Height          =   615
      Left            =   0
      TabIndex        =   11
      Top             =   4080
      Width           =   5655
      Begin VB.CheckBox chkFromFile 
         Caption         =   "从 MP3 文件中获得歌词(&L)"
         Height          =   300
         Left            =   120
         TabIndex        =   12
         Top             =   240
         Width           =   5415
      End
   End
   Begin VB.Frame fraLyricII 
      Caption         =   "Lyrics II 支持"
      ForeColor       =   &H00D54600&
      Height          =   1095
      Left            =   0
      TabIndex        =   7
      Top             =   2880
      Width           =   5655
      Begin VB.CheckBox chkUseLyricsFolder 
         Caption         =   "使用 Lyrics II 搜索目录(&S)"
         Height          =   255
         Left            =   960
         TabIndex        =   10
         Top             =   720
         Width           =   4575
      End
      Begin VB.CheckBox chkSearchDownload 
         Caption         =   "搜索 Lyrics II 下载目录(&W)"
         Height          =   255
         Left            =   960
         TabIndex        =   9
         Top             =   480
         Width           =   4575
      End
      Begin VB.CheckBox chkAssociateList 
         Caption         =   "使用 Lyrics II 关联列表(&O)"
         Height          =   255
         Left            =   960
         TabIndex        =   8
         Top             =   240
         Width           =   4575
      End
      Begin VB.Image imgLyricsII 
         Height          =   720
         Left            =   120
         Picture         =   "UILyric.ctx":0000
         Top             =   240
         Width           =   720
      End
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "清空(&C)"
      Height          =   375
      Left            =   2160
      TabIndex        =   6
      Top             =   2400
      Width           =   975
   End
   Begin VB.CommandButton cmdDel 
      Caption         =   "删除(&D)"
      Height          =   375
      Left            =   1080
      TabIndex        =   5
      Top             =   2400
      Width           =   975
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "添加(&A)"
      Height          =   375
      Left            =   0
      TabIndex        =   4
      Top             =   2400
      Width           =   975
   End
   Begin MSComctlLib.ImageList iltDir 
      Left            =   5040
      Top             =   360
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UILyric.ctx":0967
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UILyric.ctx":0F01
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvwDir 
      Height          =   1455
      Left            =   0
      TabIndex        =   3
      Top             =   840
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   2566
      View            =   3
      LabelEdit       =   1
      Sorted          =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      _Version        =   393217
      SmallIcons      =   "iltDir"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "歌词文件夹"
         Object.Width           =   9269
      EndProperty
   End
   Begin VB.CheckBox chkFindInSongDir 
      Caption         =   "在歌曲文件夹中查找歌词(&F)"
      Height          =   255
      Left            =   0
      TabIndex        =   1
      Top             =   240
      Width           =   5655
   End
   Begin VB.CheckBox chkCopyLyric 
      Caption         =   "复制歌词(&C)"
      Height          =   255
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   5655
   End
   Begin VB.Label lblInfo 
      Caption         =   "* 本页的设置必须重新添加歌曲文件才能生效."
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   0
      TabIndex        =   13
      Top             =   4800
      Width           =   5655
   End
   Begin VB.Label lblDir 
      AutoSize        =   -1  'True
      Caption         =   "歌词文件夹(&L):"
      Height          =   180
      Left            =   0
      TabIndex        =   2
      Top             =   600
      Width           =   1260
   End
End
Attribute VB_Name = "UILyric"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private vNewLycdir As VBA.Collection

'注意！不要删除或修改下列被注释的行！
'MappingInfo=UserControl,UserControl,-1,Enabled
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "返回/设置一个值，决定一个对象是否响应用户生成事件。"
  Enabled = UserControl.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  UserControl.Enabled() = New_Enabled
  PropertyChanged "Enabled"
End Property

Private Sub cmdAdd_Click()
  '添加文件夹
  Dim AddFolder As String
  Dim nItem As MSComctlLib.ListItem
  
  AddFolder = BrowseFolder.BrowseForFolder(UserControl.hWnd, "选择含有歌词文件的文件夹。", sMyDocPath)
  
  If Len(AddFolder) = 0 Then Exit Sub
  
  Set lvwDir.selectedItem = Nothing
  
  For i = 1 To vNewLycdir.Count
    If UCase(AddFolder) = UCase(vNewLycdir.Item(i)) Then
      lvwDir.ListItems(i).Selected = True
      Exit Sub
    End If
  Next
  
  vNewLycdir.Add AddFolder
  
  Set nItem = lvwDir.ListItems.Add(, , AddFolder, , 1)
  nItem.EnsureVisible
  nItem.Selected = True
  
  cmdDel.Enabled = True
  cmdClear.Enabled = True
End Sub


Private Sub cmdClear_Click()
  '清空
  cmdDel.Enabled = False
  cmdClear.Enabled = False
  
  lvwDir.ListItems.Clear
  Set vNewLycdir = New VBA.Collection
End Sub

Private Sub cmdDel_Click()
  '删除一个项目
  Dim SelInx As Long
  
  SelInx = lvwDir.selectedItem.Index
  
  vNewLycdir.Remove SelInx
  lvwDir.ListItems.Remove SelInx
  
  If lvwDir.ListItems.Count Then
    If vNewLycdir.Count < SelInx Then SelInx = SelInx - 1
    lvwDir.ListItems(SelInx).Selected = True
  Else
    cmdDel.Enabled = False
    cmdClear.Enabled = False
  End If
End Sub

'从存贮器中加载属性值
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  UserControl.Enabled = PropBag.ReadProperty("Enabled", True)
End Sub

'将属性值写到存储器
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("Enabled", UserControl.Enabled, True)
End Sub

Public Sub Init()
  '填充
  Set vNewLycdir = New VBA.Collection
  
  lvwDir.ListItems.Clear
  SetHeaderStyle lvwDir.hWnd
  
  For i = 1 To LyricDir.Count
    vNewLycdir.Add LyricDir(i)
    lvwDir.ListItems.Add , , LyricDir(i), , 1
  Next i
  
  chkCopyLyric.Value = Abs(frmMain.mnuCopyLyrics.Checked)
  chkFindInSongDir.Value = Abs(General.FindLyricInSongDir)
  
  If vNewLycdir.Count = 0 Then
    cmdDel.Enabled = False
    cmdClear.Enabled = False
  Else
    lvwDir.ListItems(1).Selected = True
  End If
  
  If Len(LyricsIIFolder) > 0 Then
    chkAssociateList.Value = Abs(bLYCIIAssociationList)
    chkSearchDownload.Value = Abs(bLYCIIDownDir)
    chkUseLyricsFolder.Value = Abs(bLYCIISearchDir)
  Else
    chkAssociateList.Enabled = False
    chkSearchDownload.Enabled = False
    chkUseLyricsFolder.Enabled = False
  End If
  
  chkFromFile.Value = Abs(bLyricFromFile)
End Sub

Public Sub Update()
  '更新
  Set LyricDir = vNewLycdir

  FindLyricInSongDir = CBool(chkFindInSongDir.Value)
  
  If CBool(chkCopyLyric.Value) <> frmMain.mnuCopyLyrics.Checked Then
    frmMain.mnuCopyLyrics_Click
  End If
  
  bLYCIIAssociationList = chkAssociateList.Value
  bLYCIIDownDir = chkSearchDownload.Value
  bLYCIISearchDir = chkUseLyricsFolder.Value
  bLyricFromFile = chkFromFile.Value
  
  InitLyricsIIDir
End Sub
