VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form dlgAddFavourite 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "添加到收藏夹"
   ClientHeight    =   6630
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5670
   Icon            =   "dlgAddFavourite.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6630
   ScaleWidth      =   5670
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '屏幕中心
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin VB.PictureBox picPage 
      BorderStyle     =   0  'None
      Height          =   5295
      Index           =   1
      Left            =   240
      ScaleHeight     =   5295
      ScaleWidth      =   5175
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   600
      Width           =   5175
      Begin MSComctlLib.TreeView tvwDirectory 
         Height          =   3135
         Left            =   0
         TabIndex        =   31
         Top             =   540
         Width           =   5175
         _ExtentX        =   9128
         _ExtentY        =   5530
         _Version        =   393217
         HideSelection   =   0   'False
         Indentation     =   441
         LabelEdit       =   1
         Style           =   7
         ImageList       =   "iltFavourite"
         Appearance      =   1
      End
      Begin VB.Frame fraType 
         Caption         =   "关于目录类型"
         ForeColor       =   &H00D54600&
         Height          =   1575
         Left            =   3120
         TabIndex        =   41
         Top             =   3720
         Width           =   2055
         Begin VB.Label ldtInfo 
            Height          =   900
            Left            =   120
            TabIndex        =   43
            Top             =   555
            Width           =   1815
         End
         Begin VB.Label lblInfo 
            AutoSize        =   -1  'True
            Caption         =   "音乐文件目录"
            Height          =   180
            Left            =   420
            TabIndex        =   42
            Top             =   270
            Width           =   1080
         End
         Begin VB.Image imgInfo 
            Height          =   240
            Left            =   120
            Picture         =   "dlgAddFavourite.frx":058A
            Top             =   240
            Width           =   240
         End
      End
      Begin VB.Frame fraInfo 
         Caption         =   "收藏夹目录信息"
         ForeColor       =   &H00D54600&
         Height          =   1575
         Left            =   0
         TabIndex        =   32
         Top             =   3720
         Width           =   3015
         Begin VB.Image imgType 
            Height          =   240
            Left            =   120
            Picture         =   "dlgAddFavourite.frx":0B14
            Top             =   1200
            Width           =   240
         End
         Begin VB.Label ldtType 
            AutoSize        =   -1  'True
            Height          =   180
            Left            =   1560
            TabIndex        =   40
            Top             =   1230
            Width           =   90
         End
         Begin VB.Label lblType 
            AutoSize        =   -1  'True
            Caption         =   "目录类型:"
            Height          =   180
            Left            =   480
            TabIndex        =   39
            Top             =   1230
            Width           =   810
         End
         Begin VB.Image imgParent 
            Height          =   240
            Left            =   120
            Picture         =   "dlgAddFavourite.frx":109E
            Top             =   880
            Width           =   240
         End
         Begin VB.Label ldtParent 
            AutoSize        =   -1  'True
            Height          =   180
            Left            =   1560
            TabIndex        =   38
            Top             =   915
            Width           =   90
         End
         Begin VB.Label lblParent 
            AutoSize        =   -1  'True
            Caption         =   "父目录:"
            Height          =   180
            Left            =   480
            TabIndex        =   37
            Top             =   910
            Width           =   630
         End
         Begin VB.Image imgSubFile 
            Height          =   240
            Left            =   120
            Picture         =   "dlgAddFavourite.frx":1628
            Top             =   560
            Width           =   240
         End
         Begin VB.Label ldtSubFile 
            AutoSize        =   -1  'True
            Height          =   180
            Left            =   1560
            TabIndex        =   36
            Top             =   585
            Width           =   90
         End
         Begin VB.Label lblSubFile 
            AutoSize        =   -1  'True
            Caption         =   "文件数目:"
            Height          =   180
            Left            =   480
            TabIndex        =   35
            Top             =   590
            Width           =   810
         End
         Begin VB.Image imgSubFolder 
            Height          =   240
            Left            =   120
            Picture         =   "dlgAddFavourite.frx":1BB2
            Top             =   240
            Width           =   240
         End
         Begin VB.Label ldtSubFolder 
            AutoSize        =   -1  'True
            Height          =   180
            Left            =   1560
            TabIndex        =   34
            Top             =   270
            Width           =   90
         End
         Begin VB.Label lblSubFolder 
            AutoSize        =   -1  'True
            Caption         =   "子目录数目:"
            Height          =   180
            Left            =   480
            TabIndex        =   33
            Top             =   270
            Width           =   990
         End
      End
      Begin VB.TextBox txtDirectory 
         Height          =   270
         Left            =   0
         Locked          =   -1  'True
         TabIndex        =   30
         Top             =   240
         Width           =   5175
      End
      Begin VB.Label lblDirectory 
         AutoSize        =   -1  'True
         Caption         =   "收藏夹目录(&D):"
         Height          =   180
         Left            =   0
         TabIndex        =   29
         Top             =   0
         Width           =   1260
      End
   End
   Begin MSComctlLib.ImageList iltTabs 
      Left            =   120
      Top             =   6120
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483633
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgAddFavourite.frx":213C
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgAddFavourite.frx":26D6
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   4320
      TabIndex        =   2
      Top             =   6120
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "确定"
      Default         =   -1  'True
      Height          =   375
      Left            =   3000
      TabIndex        =   1
      Top             =   6120
      Width           =   1215
   End
   Begin MSComctlLib.TabStrip tbsMain 
      Height          =   5895
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5415
      _ExtentX        =   9551
      _ExtentY        =   10398
      HotTracking     =   -1  'True
      ImageList       =   "iltTabs"
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   2
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "收藏夹目录"
            ImageVarType    =   2
            ImageIndex      =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "要添加的文件"
            ImageVarType    =   2
            ImageIndex      =   1
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList iltFavourite 
      Left            =   720
      Top             =   6120
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   3
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgAddFavourite.frx":2C70
            Key             =   "FAV_ROOT"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgAddFavourite.frx":320A
            Key             =   "FAV_MUSIC"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgAddFavourite.frx":37A4
            Key             =   "FAV_NORMAL"
         EndProperty
      EndProperty
   End
   Begin VB.PictureBox picPage 
      BorderStyle     =   0  'None
      Height          =   5295
      Index           =   2
      Left            =   240
      ScaleHeight     =   5295
      ScaleWidth      =   5175
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   600
      Width           =   5175
      Begin VB.Frame fraData 
         Caption         =   "收藏夹附加的数据"
         ForeColor       =   &H00D54600&
         Height          =   2415
         Left            =   0
         TabIndex        =   7
         Top             =   2880
         Width           =   5175
         Begin VB.PictureBox picNormalFolder 
            BorderStyle     =   0  'None
            Height          =   2070
            Left            =   120
            ScaleHeight     =   2070
            ScaleWidth      =   4935
            TabIndex        =   26
            TabStop         =   0   'False
            Top             =   240
            Width           =   4935
            Begin VB.TextBox txtNComment 
               Height          =   1755
               Left            =   0
               MultiLine       =   -1  'True
               ScrollBars      =   2  'Vertical
               TabIndex        =   28
               Top             =   300
               Width           =   4935
            End
            Begin VB.Image imgNComment 
               Height          =   240
               Left            =   0
               Picture         =   "dlgAddFavourite.frx":3D3E
               Top             =   15
               Width           =   240
            End
            Begin VB.Label lblNComment 
               AutoSize        =   -1  'True
               Caption         =   "注释(&C):"
               Height          =   180
               Left            =   360
               TabIndex        =   27
               Top             =   45
               Width           =   720
            End
         End
         Begin VB.PictureBox picMusicFolder 
            BorderStyle     =   0  'None
            Height          =   2070
            Left            =   120
            ScaleHeight     =   2070
            ScaleWidth      =   4935
            TabIndex        =   8
            TabStop         =   0   'False
            Top             =   240
            Width           =   4935
            Begin VB.TextBox txtComment 
               Height          =   270
               Left            =   1320
               TabIndex        =   24
               Top             =   1800
               Width           =   3615
            End
            Begin VB.TextBox txtGenre 
               Height          =   270
               Left            =   3480
               TabIndex        =   18
               Top             =   1080
               Width           =   1455
            End
            Begin VB.TextBox txtDuration 
               BackColor       =   &H8000000F&
               Height          =   270
               Left            =   3480
               Locked          =   -1  'True
               TabIndex        =   22
               Top             =   1440
               Width           =   1455
            End
            Begin VB.TextBox txtYear 
               Height          =   270
               Left            =   1320
               TabIndex        =   20
               Top             =   1440
               Width           =   975
            End
            Begin VB.TextBox txtTrack 
               Height          =   270
               Left            =   1320
               TabIndex        =   16
               Top             =   1080
               Width           =   975
            End
            Begin VB.TextBox txtAlbum 
               Height          =   270
               Left            =   1320
               TabIndex        =   14
               Top             =   720
               Width           =   3615
            End
            Begin VB.TextBox txtTitle 
               Height          =   270
               Left            =   1320
               TabIndex        =   12
               Top             =   360
               Width           =   3615
            End
            Begin VB.TextBox txtArtist 
               Height          =   270
               Left            =   1320
               TabIndex        =   10
               Top             =   0
               Width           =   3615
            End
            Begin VB.Image imgComment 
               Height          =   240
               Left            =   0
               Picture         =   "dlgAddFavourite.frx":42C8
               Top             =   1815
               Width           =   240
            End
            Begin VB.Label lblComment 
               AutoSize        =   -1  'True
               Caption         =   "注释(&C):"
               Height          =   180
               Left            =   360
               TabIndex        =   23
               Top             =   1845
               Width           =   720
            End
            Begin VB.Image imgGenre 
               Height          =   240
               Left            =   2400
               Picture         =   "dlgAddFavourite.frx":4852
               Top             =   1095
               Width           =   240
            End
            Begin VB.Label lblGenre 
               AutoSize        =   -1  'True
               Caption         =   "流派(&G):"
               Height          =   180
               Left            =   2760
               TabIndex        =   17
               Top             =   1125
               Width           =   720
            End
            Begin VB.Image imgDuration 
               Height          =   240
               Left            =   2400
               Picture         =   "dlgAddFavourite.frx":4DDC
               Top             =   1455
               Width           =   240
            End
            Begin VB.Label lblDuration 
               AutoSize        =   -1  'True
               Caption         =   "长度:"
               Height          =   180
               Left            =   2760
               TabIndex        =   21
               Top             =   1485
               Width           =   450
            End
            Begin VB.Image imgYear 
               Height          =   240
               Left            =   0
               Picture         =   "dlgAddFavourite.frx":5366
               Top             =   1455
               Width           =   240
            End
            Begin VB.Label lblYear 
               AutoSize        =   -1  'True
               Caption         =   "年代(&Y):"
               Height          =   180
               Left            =   360
               TabIndex        =   19
               Top             =   1485
               Width           =   720
            End
            Begin VB.Image imgTrack 
               Height          =   240
               Left            =   0
               Picture         =   "dlgAddFavourite.frx":58F0
               Top             =   1095
               Width           =   240
            End
            Begin VB.Label lblTrack 
               AutoSize        =   -1  'True
               Caption         =   "音轨(&R):"
               Height          =   180
               Left            =   360
               TabIndex        =   15
               Top             =   1125
               Width           =   720
            End
            Begin VB.Image imgAblum 
               Height          =   240
               Left            =   0
               Picture         =   "dlgAddFavourite.frx":5E7A
               Top             =   735
               Width           =   240
            End
            Begin VB.Label lblAlbum 
               AutoSize        =   -1  'True
               Caption         =   "专辑(&L):"
               Height          =   180
               Left            =   360
               TabIndex        =   13
               Top             =   765
               Width           =   720
            End
            Begin VB.Image imgTitle 
               Height          =   240
               Left            =   0
               Picture         =   "dlgAddFavourite.frx":6404
               Top             =   375
               Width           =   240
            End
            Begin VB.Label lblTitle 
               AutoSize        =   -1  'True
               Caption         =   "标题(&T):"
               Height          =   180
               Left            =   360
               TabIndex        =   11
               Top             =   405
               Width           =   720
            End
            Begin VB.Image imgArtist 
               Height          =   240
               Left            =   0
               Picture         =   "dlgAddFavourite.frx":698E
               Top             =   15
               Width           =   240
            End
            Begin VB.Label lblArtist 
               AutoSize        =   -1  'True
               Caption         =   "艺术家(&A):"
               Height          =   180
               Left            =   360
               TabIndex        =   9
               Top             =   45
               Width           =   900
            End
         End
      End
      Begin MSComctlLib.ListView lvwFiles 
         Height          =   2535
         Left            =   0
         TabIndex        =   6
         Top             =   240
         Width           =   5175
         _ExtentX        =   9128
         _ExtentY        =   4471
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         Checkboxes      =   -1  'True
         FullRowSelect   =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         Appearance      =   1
         NumItems        =   2
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "文件名"
            Object.Width           =   6174
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "路径"
            Object.Width           =   2469
         EndProperty
      End
      Begin VB.Label lblFiles 
         AutoSize        =   -1  'True
         Caption         =   "要添加到收藏夹的文件(&F):"
         Height          =   180
         Left            =   0
         TabIndex        =   5
         Top             =   0
         Width           =   2160
      End
   End
   Begin VB.Label lblCount 
      AutoSize        =   -1  'True
      Caption         =   "共 %FileNum% 个文件, 共 %TotalSize%"
      Height          =   180
      Left            =   120
      TabIndex        =   25
      Top             =   6210
      Width           =   3150
   End
End
Attribute VB_Name = "dlgAddFavourite"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'一些信息
Private Const INFO_DIR_MUSIC As String = "音乐文件收藏夹可以储存一些音乐的信息到库中，这样可以很方便地查看艺术家、标题、专辑等信息。"
Private Const INFO_DIR_NORMAL As String = "普通目录适用于非音乐文件，它可以在查看到时候显示文件类型，修改时间等信息。也可以为它添加一些注释。"

'新文件标签
Private nFI() As MP3PA.FAVItem

Private Sub CancelButton_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  Dim nND As MSComctlLib.Node
  Dim nNS As MSComctlLib.Node
  
  '刷新文件夹信息
  tvwDirectory.Nodes.Clear
  SetHeaderStyle lvwFiles.hWnd
  tvwDirectory.Nodes.Add , , "Favourite", "收藏夹", 1
  tvwDirectory.Nodes(1).Selected = True
  tvwDirectory.Nodes(1).Expanded = True
  
  For i = 2 To frmMain.tvwFavourite.Nodes.Count
    Set nNS = frmMain.tvwFavourite.Nodes(i)
    Set nND = tvwDirectory.Nodes.Add(nNS.Parent.Key, tvwChild, nNS.Key, nNS.Text, nNS.Image)
    nND.Expanded = True
  Next i
End Sub

Private Sub lvwFiles_ItemClick(ByVal Item As MSComctlLib.ListItem)
  '设置信息
  Dim oFI As MP3PA.FAVItem
  
  Set oFI = nFI(Item.Tag)
  
  txtArtist.Text = oFI.Artist
  txtTitle.Text = oFI.Title
  txtAlbum.Text = oFI.Album
  txtTrack.Text = oFI.Track
  txtGenre.Text = oFI.Genre
  txtYear.Text = oFI.Year
  txtComment.Text = oFI.Comment
  txtNComment.Text = oFI.Comment
  txtDuration.Text = oFI.Duration
End Sub

Private Sub OKButton_Click()
  '添加到收藏夹
  Dim oFF As MP3PA.FAVFolder
  Dim oFI As MP3PA.FAVItem
  Dim oFIS As MP3PA.FAVItems
  Dim sF As String
  Dim cSel As New VBA.Collection
  
  Set oFF = oFavCol(txtDirectory.Text)
  Set oFIS = oFF.FavouriteItems
  
  '设置
  For i = 1 To lvwFiles.ListItems.Count
    sF = nFI(lvwFiles.ListItems(i).Tag).FileName
    
    If Not oFIS.Exist(sF) Then
      '如果没有就添加
      If Len(sF) Then
        cSel.Add sF
        
        If oFF.MusicType Then
          Set oFI = oFF.FavouriteItems.Add(sF, sF)
          oFI.Album = nFI(i).Album
          oFI.Artist = nFI(i).Artist
          oFI.Comment = nFI(i).Comment
          oFI.Duration = nFI(i).Duration
          oFI.FileName = nFI(i).FileName
          oFI.Genre = nFI(i).Genre
          oFI.Title = nFI(i).Title
          oFI.Track = nFI(i).Track
          oFI.Year = nFI(i).Year
        Else
          Set oFI = oFF.FavouriteItems.Add(sF, sF)
          oFI.Comment = nFI(i).Comment
          oFI.FileName = nFI(i).FileName
        End If
      End If
    End If
  Next i
  
  '刷新
  Call frmMain.tvwFavourite_NodeClick(frmMain.tvwFavourite.selectedItem)
  DoEvents
  
  '选择项目
  On Error Resume Next
  Set frmMain.lvwFavourite.selectedItem = Nothing
  
  For i = 1 To cSel.Count
    frmMain.lvwFavourite.ListItems(cSel(i)).Selected = True
  Next i
  
  frmMain.lvwFavourite.selectedItem.EnsureVisible
  On Error GoTo 0
  
  '转道页面
  frmMain.tbsFileBrowser.Tabs(3).Selected = True
  frmMain.tbsFileBrowser_Click
  
  '卸载窗体
  Unload Me
End Sub

Private Sub tbsMain_Click()
  picPage(1).Visible = False
  picPage(2).Visible = False
  picPage(tbsMain.selectedItem.Index).Visible = True
  picPage(tbsMain.selectedItem.Index).ZOrder 0
End Sub

Public Sub ShowAddFavourite(ByVal Files As VBA.Collection, Optional ByVal CurrentDir As String = "Favourite", Optional ByVal ShowWindow As Boolean = True)
  '打开对话框
  Dim oLI As MSComctlLib.ListItem
  Dim oMedia As WMPLibCtl.IWMPMedia
  Dim oInfo As Object
  Dim dSZ As Double
  Dim sF As String
  
  If Files.Count = 0 Then Exit Sub
  
  Load Me
  frmMain.MousePointer = 11
  frmMain.ShowProgress True, "正在获取信息..."
  frmMain.pbeDefault.Max = Files.Count
  frmMain.pbeDefault.Value = 0
  
  '统计文件
  ReDim nFI(1 To Files.Count) As MP3PA.FAVItem
  
  For i = 1 To Files.Count
    sF = Files(i)
    Set nFI(i) = New MP3PA.FAVItem
    
    If (FS.FileExists(sF)) And (Not ItemExistOBJ(sF, lvwFiles.ListItems)) Then
      Set oLI = lvwFiles.ListItems.Add(, sF, FS.GetFileName(sF))
      oLI.SubItems(1) = FS.GetParentFolderName(sF)
      oLI.Checked = True
      oLI.Tag = i
      nFI(i).FileName = sF
      
      dSZ = dSZ + FileLen(sF)
      
      '获得相关信息
      Select Case UCase(FS.GetExtensionName(sF))
      Case "MP3"
        '获得 MP3 文件信息
        For j = 0 To 2
          Set oInfo = InfoReadObj(j)
          
          oInfo.LoadInfo sF
          
          If oInfo.Exist Then
            nFI(i).Artist = oInfo.Artist
            nFI(i).Title = oInfo.Title
            nFI(i).Album = oInfo.Album
            nFI(i).Genre = oInfo.Genre
            nFI(i).Track = CLng(Val(oInfo.Track))
            nFI(i).Year = oInfo.Year
            nFI(i).Comment = oInfo.Comment
            Exit For
          End If
        Next j
        
        '获得文件长度
        Set oMedia = ffmVideo.WMP.newMedia(sF)
        nFI(i).Duration = CLng(oMedia.Duration)
      Case "WMA", "WMV"
        Set oMedia = ffmVideo.WMP.newMedia(sF)
            
        On Error Resume Next
        nFI(i).Title = oMedia.getItemInfo("Title")
        nFI(i).Artist = oMedia.getItemInfo("Author")
        nFI(i).Album = oMedia.getItemInfo("WM/AlbumTitle")
        nFI(i).Year = oMedia.getItemInfo("WM/Year")
        nFI(i).Track = CInt(oMedia.getItemInfo("WM/TrackNumber"))
        nFI(i).Genre = oMedia.getItemInfo("WM/Genre")
        nFI(i).Comment = oMedia.getItemInfo("Description")
        On Error GoTo 0
            
        '获得文件长度
        nFI(i).Duration = CLng(oMedia.Duration)
      End Select
    
      frmMain.pbeDefault.Value = i
      DoEvents
    End If
  Next i
  
  If lvwFiles.ListItems.Count = 0 Then
    frmMain.MousePointer = 0
    frmMain.ShowProgress False, ""
    Unload Me
    Exit Sub
  End If
  
  '打开对话框
  frmMain.MousePointer = 0
  frmMain.ShowProgress False, ""
  
  '选择文件夹
  If ShowWindow Then
    lblCount.Caption = Replace(lblCount.Caption, "%FileNum%", lvwFiles.ListItems.Count)
    lblCount.Caption = Replace(lblCount.Caption, "%TotalSize%", DisplaySize(dSZ))
    tvwDirectory.Nodes(CurrentDir).Selected = True
    tvwDirectory_NodeClick tvwDirectory.selectedItem
    tbsMain_Click
    lvwFiles.ListItems(1).Selected = True
    lvwFiles_ItemClick lvwFiles.selectedItem
    Me.Show 1
  Else
    txtDirectory.Text = CurrentDir
    OKButton_Click
  End If
End Sub

Private Sub tvwDirectory_NodeClick(ByVal Node As MSComctlLib.Node)
  '设置项目
  Dim oFF As MP3PA.FAVFolder
  
  Set oFF = oFavCol(Node.Key)
  txtDirectory.Text = Node.Key
  ldtSubFile.Caption = oFF.FavouriteItems.Count
  ldtSubFolder.Caption = oFF.FavouriteSubFolders.Count
  If Node.Index = 1 Then ldtParent.Caption = vbNullString Else ldtParent.Caption = Node.Parent.Text
  
  If oFF.MusicType Then
    ldtType.Caption = "音乐文件目录"
    lblInfo.Caption = "音乐文件目录"
    ldtInfo.Caption = INFO_DIR_MUSIC
    picMusicFolder.Visible = True
    picNormalFolder.Visible = False
    picMusicFolder.ZOrder 0
  Else
    ldtType.Caption = "普通目录"
    lblInfo.Caption = "普通目录"
    ldtInfo.Caption = INFO_DIR_NORMAL
    picMusicFolder.Visible = False
    picNormalFolder.Visible = True
    picNormalFolder.ZOrder 0
  End If
End Sub

Private Sub Update()
  '更新信息
  Dim oFI As MP3PA.FAVItem
  
  Set oFI = nFI(lvwFiles.selectedItem.Tag)
  
  oFI.Artist = txtArtist.Text
  oFI.Title = txtTitle.Text
  oFI.Album = txtAlbum.Text
  oFI.Track = txtTrack.Text
  oFI.Genre = txtGenre.Text
  oFI.Year = txtYear.Text
  oFI.Comment = txtComment.Text
End Sub

Private Sub txtAlbum_Validate(Cancel As Boolean)
  Update
End Sub

Private Sub txtArtist_Validate(Cancel As Boolean)
  Update
End Sub

Private Sub txtComment_Validate(Cancel As Boolean)
  Update
End Sub

Private Sub txtGenre_Validate(Cancel As Boolean)
  Update
End Sub

Private Sub txtNComment_Validate(Cancel As Boolean)
  Replace txtNComment.Text, vbCrLf, Space(1)
  txtComment.Text = txtNComment.Text
  Update
End Sub

Private Sub txtTitle_Validate(Cancel As Boolean)
  Update
End Sub

Private Sub txtTrack_Validate(Cancel As Boolean)
  If IsNumeric(txtTrack.Text) Then
    If CLng(txtTrack.Text) = Val(txtTrack.Text) Then
      Update
      Exit Sub
    End If
  End If
  
  Cancel = True
End Sub

Private Sub txtYear_Validate(Cancel As Boolean)
  Update
End Sub
