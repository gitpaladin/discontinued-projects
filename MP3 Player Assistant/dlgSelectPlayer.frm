VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form dlgSelectPlayer 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "选择 MP3 驱动器"
   ClientHeight    =   6615
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6735
   Icon            =   "dlgSelectPlayer.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6615
   ScaleWidth      =   6735
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '屏幕中心
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin MSComctlLib.ImageList iltComboBox 
      Left            =   0
      Top             =   1440
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgSelectPlayer.frx":058A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgSelectPlayer.frx":0B24
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgSelectPlayer.frx":10BE
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgSelectPlayer.frx":1658
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgSelectPlayer.frx":1BF2
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Frame fraFolderSettings 
      Caption         =   "自动创建文件夹"
      Height          =   1575
      Left            =   720
      TabIndex        =   32
      Top             =   4440
      Width           =   5895
      Begin VB.PictureBox picCreate 
         BorderStyle     =   0  'None
         Height          =   1215
         Left            =   120
         ScaleHeight     =   1215
         ScaleWidth      =   5655
         TabIndex        =   33
         TabStop         =   0   'False
         Top             =   240
         Width           =   5655
         Begin VB.CheckBox chkPreserveOriginal 
            Caption         =   "保留原始的文件夹(&P)"
            Height          =   255
            Left            =   0
            TabIndex        =   34
            Top             =   0
            Width           =   2175
         End
         Begin VB.CheckBox chkAutoFolder 
            Caption         =   "使用自动创建文件夹(&A)"
            Height          =   255
            Left            =   0
            TabIndex        =   35
            Top             =   435
            Width           =   2175
         End
         Begin VB.CheckBox chkTemplateFolder 
            Caption         =   "使用文件夹模板(&T)"
            Height          =   255
            Left            =   0
            TabIndex        =   37
            Top             =   870
            Width           =   2175
         End
         Begin MSComctlLib.ImageCombo icbTemplate 
            Height          =   315
            Left            =   2280
            TabIndex        =   38
            Top             =   825
            Width           =   3375
            _ExtentX        =   5953
            _ExtentY        =   556
            _Version        =   393216
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            Enabled         =   0   'False
            Locked          =   -1  'True
            ImageList       =   "iltComboBox"
         End
         Begin MSComctlLib.ImageCombo icbAutoCreate 
            Height          =   315
            Left            =   2280
            TabIndex        =   36
            Top             =   390
            Width           =   3375
            _ExtentX        =   5953
            _ExtentY        =   556
            _Version        =   393216
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            Enabled         =   0   'False
            Locked          =   -1  'True
            ImageList       =   "iltComboBox"
         End
      End
   End
   Begin VB.PictureBox picPage 
      BorderStyle     =   0  'None
      Height          =   3615
      Index           =   0
      Left            =   840
      ScaleHeight     =   3615
      ScaleWidth      =   5655
      TabIndex        =   4
      Top             =   600
      Width           =   5655
      Begin MSComctlLib.ListView lvwDriver 
         Height          =   1215
         Left            =   0
         TabIndex        =   6
         Top             =   240
         WhatsThisHelpID =   1004
         Width           =   5655
         _ExtentX        =   9975
         _ExtentY        =   2143
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         FullRowSelect   =   -1  'True
         _Version        =   393217
         SmallIcons      =   "iltDriver"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         Appearance      =   1
         NumItems        =   3
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "驱动器"
            Object.Width           =   3387
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            SubItemIndex    =   1
            Text            =   "总空间"
            Object.Width           =   3253
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            SubItemIndex    =   2
            Text            =   "可用空间"
            Object.Width           =   2776
         EndProperty
      End
      Begin VB.Frame fraDetail 
         Caption         =   "驱动器详细资料"
         ForeColor       =   &H00D54600&
         Height          =   2055
         Left            =   0
         TabIndex        =   5
         Top             =   1560
         WhatsThisHelpID =   1003
         Width           =   5655
         Begin VB.Label ldtSongNo 
            AutoSize        =   -1  'True
            Caption         =   "可容歌曲:"
            Height          =   180
            Index           =   1
            Left            =   1350
            TabIndex        =   31
            Top             =   1770
            Width           =   810
         End
         Begin VB.Label ldtTotal 
            AutoSize        =   -1  'True
            Caption         =   "总容量:"
            Height          =   180
            Left            =   1350
            TabIndex        =   30
            Top             =   270
            Width           =   630
         End
         Begin VB.Label ldtUsed 
            AutoSize        =   -1  'True
            Caption         =   "已用空间:"
            Height          =   180
            Left            =   1350
            TabIndex        =   29
            Top             =   570
            Width           =   810
         End
         Begin VB.Label ldtFree 
            AutoSize        =   -1  'True
            Caption         =   "剩余空间:"
            Height          =   180
            Left            =   1350
            TabIndex        =   28
            Top             =   900
            Width           =   810
         End
         Begin VB.Label ldtSN 
            AutoSize        =   -1  'True
            Caption         =   "编号:"
            Height          =   180
            Left            =   1350
            TabIndex        =   27
            Top             =   1200
            Width           =   450
         End
         Begin VB.Label ldtSongNo 
            AutoSize        =   -1  'True
            Caption         =   "可容歌曲:"
            Height          =   180
            Index           =   0
            Left            =   1350
            TabIndex        =   26
            Top             =   1500
            Width           =   810
         End
         Begin VB.Image imgSongNo 
            Height          =   240
            Left            =   120
            Picture         =   "dlgSelectPlayer.frx":218C
            Top             =   1455
            Width           =   240
         End
         Begin VB.Image imgSN 
            Height          =   240
            Left            =   120
            Picture         =   "dlgSelectPlayer.frx":2716
            Top             =   1155
            Width           =   240
         End
         Begin VB.Image imgFree 
            Height          =   240
            Left            =   120
            Picture         =   "dlgSelectPlayer.frx":2CA0
            Top             =   855
            Width           =   240
         End
         Begin VB.Image imgUsed 
            Height          =   240
            Left            =   120
            Picture         =   "dlgSelectPlayer.frx":322A
            Top             =   540
            Width           =   240
         End
         Begin VB.Image imgTotal 
            Height          =   240
            Left            =   120
            Picture         =   "dlgSelectPlayer.frx":3C2C
            Top             =   240
            Width           =   240
         End
         Begin VB.Label lblSongNo 
            AutoSize        =   -1  'True
            Caption         =   "可容歌曲:"
            Height          =   180
            Left            =   435
            TabIndex        =   25
            Top             =   1500
            Width           =   810
         End
         Begin VB.Label lblSN 
            AutoSize        =   -1  'True
            Caption         =   "编号:"
            Height          =   180
            Left            =   435
            TabIndex        =   24
            Top             =   1200
            Width           =   450
         End
         Begin VB.Label lblFree 
            AutoSize        =   -1  'True
            Caption         =   "剩余空间:"
            Height          =   180
            Left            =   435
            TabIndex        =   23
            Top             =   900
            Width           =   810
         End
         Begin VB.Label lblUsed 
            AutoSize        =   -1  'True
            Caption         =   "已用空间:"
            Height          =   180
            Left            =   435
            TabIndex        =   22
            Top             =   570
            Width           =   810
         End
         Begin VB.Label lblTotal 
            AutoSize        =   -1  'True
            Caption         =   "总容量:"
            Height          =   180
            Left            =   435
            TabIndex        =   21
            Top             =   270
            Width           =   630
         End
      End
      Begin VB.Label lblDriver 
         AutoSize        =   -1  'True
         Caption         =   "可用的驱动器(&D):"
         Height          =   180
         Left            =   0
         TabIndex        =   7
         Top             =   0
         WhatsThisHelpID =   1004
         Width           =   1440
      End
   End
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "刷新(&E)"
      Height          =   375
      Left            =   2760
      TabIndex        =   40
      Top             =   6120
      Width           =   1215
   End
   Begin MSComctlLib.ImageList iltDriver 
      Left            =   0
      Top             =   840
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   16777214
      _Version        =   393216
   End
   Begin VB.CheckBox chkClearDisk 
      Caption         =   "首先格式化(&C)"
      Height          =   375
      Left            =   840
      TabIndex        =   39
      Top             =   6120
      WhatsThisHelpID =   1002
      Width           =   1455
   End
   Begin MSComctlLib.ImageList iltTab 
      Left            =   0
      Top             =   240
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
            Picture         =   "dlgSelectPlayer.frx":41B6
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgSelectPlayer.frx":4750
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TabStrip tbsMain 
      Height          =   4215
      Left            =   720
      TabIndex        =   3
      Top             =   120
      Width           =   5895
      _ExtentX        =   10398
      _ExtentY        =   7435
      HotTracking     =   -1  'True
      ImageList       =   "iltTab"
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   2
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "物理驱动器"
            ImageVarType    =   2
            ImageIndex      =   1
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "虚拟驱动器"
            ImageVarType    =   2
            ImageIndex      =   2
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   5400
      TabIndex        =   2
      Top             =   6120
      Width           =   1215
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "确定"
      Default         =   -1  'True
      Height          =   375
      Left            =   4080
      TabIndex        =   1
      Top             =   6120
      Width           =   1215
   End
   Begin MP3PA.Cubagor cubDriver 
      Height          =   6375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      WhatsThisHelpID =   1001
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   11245
      Value           =   50
      Max             =   100
      Original        =   0
      BackColor       =   -2147483633
   End
   Begin VB.PictureBox picPage 
      BorderStyle     =   0  'None
      Height          =   3615
      Index           =   1
      Left            =   840
      ScaleHeight     =   3615
      ScaleWidth      =   5655
      TabIndex        =   8
      Top             =   600
      Width           =   5655
      Begin MSComctlLib.Slider sldPercent 
         Height          =   375
         Left            =   2520
         TabIndex        =   20
         Top             =   2640
         Width           =   3135
         _ExtentX        =   5530
         _ExtentY        =   661
         _Version        =   393216
      End
      Begin VB.TextBox txtRemain 
         Alignment       =   1  'Right Justify
         Height          =   270
         Left            =   0
         TabIndex        =   16
         Text            =   "0"
         Top             =   2700
         Width           =   1965
      End
      Begin VB.TextBox txtVolumn 
         Alignment       =   1  'Right Justify
         Height          =   315
         Left            =   2280
         TabIndex        =   13
         Text            =   "0"
         Top             =   2040
         Width           =   2865
      End
      Begin VB.ComboBox cboVolumn 
         Height          =   300
         Left            =   0
         Style           =   2  'Dropdown List
         TabIndex        =   12
         Top             =   2040
         Width           =   2175
      End
      Begin VB.ComboBox cboVDriver 
         Height          =   300
         Left            =   0
         Style           =   2  'Dropdown List
         TabIndex        =   10
         Top             =   1320
         Width           =   5655
      End
      Begin VB.Label lblInfo 
         Caption         =   "当您开始复制文件的时候，它会提示您将 MP3 播放器插入到您的计算机上。然后开始复制文件。"
         Height          =   375
         Index           =   3
         Left            =   0
         TabIndex        =   19
         Top             =   600
         Width           =   5655
      End
      Begin VB.Label lblInfo 
         Caption         =   "如果您不希望现在就和电脑连接上您的 MP3 播放器，您可以设置一个“虚拟驱动器”，这个驱动器可以在添加文件的时候指示是否超过了容量。"
         Height          =   615
         Index           =   2
         Left            =   0
         TabIndex        =   18
         Top             =   0
         Width           =   5655
      End
      Begin VB.Label lblInfo 
         AutoSize        =   -1  'True
         Caption         =   "字节"
         Height          =   180
         Index           =   1
         Left            =   2040
         TabIndex        =   17
         Top             =   2745
         Width           =   360
      End
      Begin VB.Label lblRemain 
         AutoSize        =   -1  'True
         Caption         =   "保留空间(&R):"
         Height          =   180
         Left            =   0
         TabIndex        =   15
         Top             =   2475
         Width           =   1080
      End
      Begin VB.Label lblInfo 
         AutoSize        =   -1  'True
         Caption         =   "字节"
         Height          =   180
         Index           =   0
         Left            =   5265
         TabIndex        =   14
         Top             =   2100
         Width           =   360
      End
      Begin VB.Label lblVolumn 
         AutoSize        =   -1  'True
         Caption         =   "容量(&V):"
         Height          =   180
         Left            =   0
         TabIndex        =   11
         Top             =   1815
         Width           =   720
      End
      Begin VB.Label lblVDriver 
         AutoSize        =   -1  'True
         Caption         =   "驱动器盘符(&D):"
         Height          =   180
         Left            =   0
         TabIndex        =   9
         Top             =   1080
         Width           =   1260
      End
   End
End
Attribute VB_Name = "dlgSelectPlayer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private VolumnConst(7) As Double

Public bStarting As Boolean

Private Sub cboVolumn_Change()
  cboVolumn_Click
End Sub

Private Sub cboVolumn_Click()
  '设置
  If cboVolumn.ListIndex = cboVolumn.ListCount - 1 Then
    txtVolumn.Enabled = True
    txtVolumn.BackColor = &H80000005
  Else
    txtVolumn.Enabled = False
    txtVolumn.BackColor = &H8000000F
    txtVolumn.Text = VolumnConst(cboVolumn.ListIndex)
  End If
  
  RefreshChart
End Sub

Private Sub chkAutoFolder_Click()
  icbAutoCreate.Enabled = (chkAutoFolder.value = 1)
End Sub

Private Sub chkClearDisk_Click()
  If (tbsMain.selectedItem.Index = 1) And (Me.Visible) Then Call lvwDriver_ItemClick(lvwDriver.selectedItem)
End Sub

Private Sub chkTemplateFolder_Click()
  icbTemplate.Enabled = (chkTemplateFolder.value = 1)
End Sub

Private Sub cmdCancel_Click()
  If Not bStarting Then
    bStarting = False
    Unload Me
  Else
    Unload frmMain
    Unload Me
    End
  End If
End Sub

Private Sub cmdOK_Click()
  Dim nSpaceTotal As Double
  Dim nSpaceFact As Double
  Dim nSpace As Double
  Dim FD As Scripting.Folder
  
  If tbsMain.selectedItem.Index = 1 Then
    Call DiskInfo.GetDiskSpace(lvwDriver.selectedItem.tag, nSpaceTotal, nSpaceFact)
    nSpaceFact = nSpaceTotal - nSpaceFact
  Else
    nSpaceTotal = Val(txtVolumn.Text)
    nSpaceFact = Val(txtRemain.Text)
  End If
  
  If (chkClearDisk.value) Then
    nSpace = nSpaceTotal
  Else
    nSpace = nSpaceTotal - nSpaceFact
  End If
  
  If frmMain.CheckDiskSize(nSpace) = False Then Exit Sub
    
  '设置 MP3 数据
  SpaceTotal = nSpaceTotal
  SpaceFact = nSpaceFact
  
  If tbsMain.selectedItem.Index = 1 Then
    frmMain.stbDefault.Panels(3).Text = Left(lvwDriver.selectedItem.tag, 1) & ":\"
    frmMain.stbDefault.Panels(3).ToolTipText = "物理驱动器"
    Set frmMain.stbDefault.Panels(3).Picture = iltTab.ListImages(1).Picture
  Else
    frmMain.stbDefault.Panels(3).Text = cboVDriver.List(cboVDriver.ListIndex) & "\"
    frmMain.stbDefault.Panels(3).ToolTipText = "虚拟驱动器"
    Set frmMain.stbDefault.Panels(3).Picture = iltTab.ListImages(2).Picture
  End If
  
  With frmMain
    .mnuDeleteBefore.Checked = CBool(chkClearDisk.value)
    .tbrDefault.Buttons(2).value = chkClearDisk.value
    SpaceUsed = IIf(chkClearDisk.value, 0, SpaceFact)
    .Form_Resize
  End With
  
  '设置目录树
  With frmMain
    .tvwList.Nodes.Clear
    .tvwList.Nodes.Add , , "ROOT", "ROOT", tbsMain.selectedItem.Index
    .tvwList.Nodes(1).Selected = True
    .tvwList.Nodes(1).Expanded = True
    .tvwList.Nodes(1).Sorted = True
    
    Set .RootListFolder = New ListFolder
    Set .tvwList.Nodes(1).tag = .RootListFolder
    Set .CurrentListFolder = .RootListFolder
    
    Me.Hide
    
    If bStarting Then
      frmSplash.SetInfo "正在递归查找目录..."
    Else
      frmMain.tvwList.Enabled = False
      frmMain.MousePointer = 11
      frmMain.ShowProgress True, "正在递归查找目录...", False
      DoEvents
    End If
    
    '递归添加目录树
    If (chkPreserveOriginal.value = 1) And (tbsMain.selectedItem.Index = 1) Then
      Set FD = FS.GetFolder(Left(lvwDriver.selectedItem.tag, 1) & ":\")
      AddFolder .tvwList.Nodes.Item(1), FD, .tvwList, frmMain.RootListFolder
    End If
    
    If Not bStarting Then
      frmMain.MousePointer = 0
      frmMain.ShowProgress False, "正在递归查找目录...", False
      frmMain.tvwList.Enabled = True
    End If
    
    '设置目录模板
    If chkTemplateFolder.value Then
      Template.ApplyTemplate icbTemplate.selectedItem.Text
    End If
    
    '更新数据
    .RecalcSize
    .RefreshChart
  End With
  
  '设置数据
  PS_CustomVolumn = Val(txtVolumn.Text)
  PS_Remained = Val(txtRemain.Text)
  PS_Drive = Choose(tbsMain.selectedItem.Index, Left(lvwDriver.selectedItem.tag, 2), cboVDriver.List(cboVDriver.ListIndex))
  PS_Volumn = cboVolumn.ListIndex
  PS_PreserveFolderTree = CBool(IIf(tbsMain.selectedItem.Index = 2, chkPreserveOriginal.tag, chkPreserveOriginal.value))
  PS_AutoFolderTree = CBool(chkAutoFolder.value)
  PS_TemplateFolder = CBool(chkTemplateFolder.value)
  PS_AutoFolderIndex = icbAutoCreate.selectedItem.Index
  PS_TemplateName = icbTemplate.Text
  frmMain.SwitchAutoFolder
  
  Unload Me
End Sub

Private Sub cmdRefresh_Click()
  '刷新数据
  Dim d As Scripting.Drive
  Dim nItem As MSComctlLib.ListItem
  Dim LastLetter As String
  Dim dDiskSpace As Double
  Dim dFreeSpace As Double
  
  '重新填充列表
  Set lvwDriver.SmallIcons = Nothing
  lvwDriver.ListItems.Clear
  iltDriver.ListImages.Clear
    
  On Error GoTo AssociateImageList
  
  For Each d In FS.Drives
    If (Asc(UCase(d.DriveLetter)) > 66) And ((d.DriveType = Fixed) Or (d.DriveType = Removable)) Then
      If d.IsReady Then
        iltDriver.ListImages.Add , d.Path, frmMain.iltFolder.ListImages("?DISKIMG_" & d.Path).Picture
        Set nItem = lvwDriver.ListItems.Add(, d.Path, GetDriveString(d.Path & "\", d))
        GetDiskSpace d.DriveLetter, dDiskSpace, dFreeSpace
        nItem.SubItems(1) = FormatNumber(CDec(dDiskSpace) / 1024, 0, vbTrue, vbTrue, vbTrue) & " KB"
        nItem.SubItems(2) = FormatNumber(dFreeSpace / 1024, 0, vbTrue, vbTrue, vbTrue) & " KB"
        nItem.SmallIcon = d.Path
        nItem.tag = d.Path
      End If
    End If
  
    LastLetter = d.DriveLetter
  Next d
  
  On Error GoTo 0
  
  '重新填充列表
  cboVDriver.Clear
  
  For i = (Asc(UCase(LastLetter)) + 1) To 90
    cboVDriver.AddItem Chr(i) & ":"
  Next i
  
  '读取项目
  If Not (Len(PS_Drive) = 2) Then
    PS_Drive = Left(lvwDriver.ListItems(lvwDriver.ListItems.Count).tag, 2)
  End If
  
  txtVolumn.Text = PS_CustomVolumn
  txtRemain.Text = PS_Remained
  If cboVDriver.ListCount > 0 Then cboVDriver.ListIndex = 0
  cboVolumn.ListIndex = IIf(PS_Volumn < 0, 0, PS_Volumn)
  
  If StrComp(Left(lvwDriver.ListItems(lvwDriver.ListItems.Count).tag, 1), Left(PS_Drive, 1), vbTextCompare) = -1 Then
    For i = 0 To cboVDriver.ListCount - 1
      If StrComp(cboVDriver.List(i), PS_Drive, vbTextCompare) Then
        cboVDriver.ListIndex = i - 1
        Exit For
      End If
    Next i
    
    tbsMain.Tabs(2).Selected = True
    lvwDriver.ListItems(lvwDriver.ListItems.Count).Selected = True
  Else
    For i = 1 To lvwDriver.ListItems.Count
      If StrComp(Left(lvwDriver.ListItems(i).tag, 1), Left(PS_Drive, 1), vbTextCompare) = 0 Then
        lvwDriver.ListItems(i).Selected = True
        Exit For
      End If
    Next i
  
    tbsMain.Tabs(1).Selected = True
  End If
    
  lvwDriver.selectedItem.EnsureVisible
  lvwDriver_ItemClick lvwDriver.selectedItem
  tbsMain_Click
  
  Exit Sub
AssociateImageList:
  Set lvwDriver.SmallIcons = iltDriver
  Resume
End Sub

Private Sub Form_Load()
  '添加数据
  Dim d As Drive
  Dim nItem As MSComctlLib.ListItem
  Dim LastLetter As String
  Dim LastSelect As String
  
  SetHeaderStyle lvwDriver.hWnd
  chkClearDisk.value = Abs(frmMain.mnuDeleteBefore.Checked)
  
  VolumnConst(0) = 32596992
  VolumnConst(1) = 65193984
  VolumnConst(2) = 127512576
  VolumnConst(3) = 255025152
  VolumnConst(4) = 536870912
  VolumnConst(5) = 1073741824
  VolumnConst(6) = 4294967296#
  VolumnConst(7) = 12884901888#
  
  cboVolumn.AddItem "32 MB(32,596,992)"
  cboVolumn.AddItem "64 MB(65,193,984)"
  cboVolumn.AddItem "128 MB(127,512,576)"
  cboVolumn.AddItem "256 MB(255,025,152)"
  cboVolumn.AddItem "512 MB(536,870,912)"
  cboVolumn.AddItem "1 GB(1,073,741,824)"
  cboVolumn.AddItem "4 GB(4,294,967,296)"
  cboVolumn.AddItem "12 GB(12,884,901,888)"
  cboVolumn.AddItem "自定义"
  
  '添加内容
  icbAutoCreate.ComboItems.Add , "ARTIST", "按照艺术家自动创建", , 1
  icbAutoCreate.ComboItems.Add , "ALBUM", "按照专辑自动创建", , 2
  icbAutoCreate.ComboItems.Add , "DATECREATED", "按照日期自动创建", , 3
  icbAutoCreate.ComboItems.Add , "GENRE", "按照流派自动创建", , 4
  icbAutoCreate.ComboItems(1).Selected = True
  
  '添加文件夹模板
  If oTemplates.Count Then
    For i = 1 To oNames.Count
      icbTemplate.ComboItems.Add , oNames(i), oNames(i), , 5
    Next i
    
    chkTemplateFolder.value = Abs(PS_TemplateFolder)
    
    If Template.TemplateExist(PS_TemplateName) Then
      icbTemplate.ComboItems(PS_TemplateName).Selected = True
    Else
      icbTemplate.ComboItems(1).Selected = True
    End If
  Else
    chkTemplateFolder.Enabled = False
    chkTemplateFolder.value = 0
  End If
  
  cmdRefresh_Click
  
  '读取关于文件夹的数据
  If PS_AutoFolderIndex = 0 Then PS_AutoFolderIndex = 1
  chkPreserveOriginal.value = Abs(PS_PreserveFolderTree)
  chkAutoFolder.value = Abs(PS_AutoFolderTree)
  icbAutoCreate.ComboItems(PS_AutoFolderIndex).Selected = True
End Sub

Private Sub Form_Paint()
  '刷新一些东西
  icbAutoCreate.Refresh
  icbTemplate.Refresh
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If UnloadMode <> 1 Then cmdCancel_Click
End Sub

Private Sub lvwDriver_DblClick()
  '打开文件夹
  If Not lvwDriver.selectedItem Is Nothing Then
    SHOpenFolder lvwDriver.tag
  End If
End Sub

Private Sub lvwDriver_ItemClick(ByVal Item As MSComctlLib.ListItem)
  '更新显示
  Dim d As Scripting.Drive
  Dim TotalSpac As Double
  Dim FreeSpac As Double
  
  Set d = FS.GetDrive(Item.tag)
  FreeSpac = d.FreeSpace
  TotalSpac = d.TotalSize
  
  ldtTotal.Caption = FormatNumber(TotalSpac, 0, vbTrue, vbTrue, vbTrue)
  ldtUsed.Caption = FormatNumber(TotalSpac - FreeSpac, 0, vbTrue, vbTrue, vbTrue)
  ldtFree.Caption = FormatNumber(FreeSpac, 0, vbTrue, vbTrue, vbTrue)
  ldtSN.Caption = Left(Hex(d.SerialNumber), 4) & "-" & Right(Hex(d.SerialNumber), 4)
  
  If chkClearDisk.value = 1 Then FreeSpac = TotalSpac
  
  ldtSongNo(0).Caption = "高品质: " & FormatNumber(Int(FreeSpac / 9961472), 0, vbTrue) & " 首 - " & FormatNumber(Int(FreeSpac / 6815744), 0, vbTrue) & " 首"
  ldtSongNo(1).Caption = "低品质: " & FormatNumber(Int(FreeSpac / 3984588), 0, vbTrue) & " 首 - " & FormatNumber(Int(FreeSpac / 2726297), 0, vbTrue) & " 首"
  
  cubDriver.value = 0
  cubDriver.Max = TotalSpac
  cubDriver.value = TotalSpac - FreeSpac
End Sub

Private Sub sldPercent_Change()
  txtRemain.Text = Int(CDbl(txtVolumn.Text) * sldPercent.value / 10)
  RefreshChart
End Sub

Private Sub sldPercent_Scroll()
  txtRemain.Text = Int(CDbl(txtVolumn.Text) * sldPercent.value / 10)
  RefreshChart
End Sub

Private Sub tbsMain_Click()
  '切换页面
  Dim CurrentPage As Integer
  
  CurrentPage = tbsMain.selectedItem.Index - 1
  
  picPage(0).Enabled = False
  picPage(1).Enabled = False
  picPage(CurrentPage).ZOrder 0
  picPage(CurrentPage).Enabled = True
  
  If CurrentPage Then RefreshChart Else Call lvwDriver_ItemClick(lvwDriver.selectedItem)
  chkPreserveOriginal.Enabled = (CurrentPage = 0)
    
  If CurrentPage = 0 Then
    chkPreserveOriginal.value = Val(chkPreserveOriginal.tag)
  Else
    chkPreserveOriginal.tag = chkPreserveOriginal.value
    chkPreserveOriginal.value = 0
  End If
End Sub

Private Sub txtRemain_GotFocus()
  txtRemain.SelStart = 0
  txtRemain.SelLength = Len(txtRemain.Text)
End Sub

Private Sub txtRemain_KeyDown(KeyCode As Integer, Shift As Integer)
  If Not ((KeyCode = 8) Or ((KeyCode > 47) And (KeyCode < 58))) Then
    KeyCode = 0
  End If
End Sub

Private Sub txtRemain_Validate(Cancel As Boolean)
  RefreshChart
End Sub

Private Sub txtVolumn_GotFocus()
  txtVolumn.SelStart = 0
  txtVolumn.SelLength = Len(txtVolumn.Text)
End Sub

Private Sub txtVolumn_KeyDown(KeyCode As Integer, Shift As Integer)
  If Not ((KeyCode = 8) Or ((KeyCode > 47) And (KeyCode < 58))) Then
    KeyCode = 0
  End If
End Sub

Private Sub RefreshChart()
  If CDbl(txtVolumn.Text) < CDbl(txtRemain.Text) Then
    txtRemain.Text = txtVolumn.Text
  End If
  
  sldPercent.value = Round(CDbl(txtRemain.Text) / CDbl(txtVolumn.Text) * 10)
  cubDriver.value = 0
  cubDriver.Max = CDbl(txtVolumn.Text)
  cubDriver.value = CDbl(txtRemain.Text)
End Sub

Private Sub txtVolumn_Validate(Cancel As Boolean)
  lvwDriver_ItemClick lvwDriver.selectedItem
End Sub

Private Sub AddFolder(ByVal Node As MSComctlLib.Node, ByVal Folder As Scripting.Folder, ByVal TreeView As MSComctlLib.TreeView, ByRef CurListFolder As ListFolder)
  '递归添加目录树
  Dim FD As Scripting.Folder
  Dim FDS As Scripting.Folders
  Dim nND As MSComctlLib.Node
  Dim nLF As MP3PA.ListFolder
  
  Set FDS = Folder.SubFolders
  
  '添加自目录
  On Error Resume Next
  For Each FD In FDS
    Select Case FD.Name
    Case "Recycled", "_Restore", "System Volume Information"
    Case Else
      Set nND = TreeView.Nodes.Add(Node.Key, tvwChild, AppendPath(Node.Key, FD.Name), FD.Name, 3)
      Set nLF = CurListFolder.SubFolders.Add(CurListFolder, FD.Name)
      Set nND.tag = nLF
      Let nND.SelectedImage = 4
      Let nND.Sorted = True
      Call AddFolder(nND, FD, TreeView, nLF)
      frmSplash.lblInfo = "正在递归查找目录..." & nND.FullPath
    End Select
  Next FD
  On Error GoTo 0
End Sub
