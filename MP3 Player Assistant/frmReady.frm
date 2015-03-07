VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form frmReady 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "准备复制文件"
   ClientHeight    =   4455
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4935
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmReady.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4455
   ScaleWidth      =   4935
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  '所有者中心
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin VB.Timer tmrChkDevice 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   720
      Top             =   3960
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3480
      TabIndex        =   11
      Top             =   3960
      Width           =   1335
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "开始复制(&C)"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2040
      TabIndex        =   10
      Top             =   3960
      Width           =   1335
   End
   Begin MSComctlLib.ImageList iltEconde 
      Left            =   120
      Top             =   3960
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
            Picture         =   "frmReady.frx":058A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmReady.frx":0B24
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Frame fraCopyOption 
      Caption         =   "复制选项"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   120
      TabIndex        =   7
      Top             =   2520
      Width           =   4695
      Begin MSComCtl2.UpDown udNumberStart 
         Height          =   285
         Left            =   4081
         TabIndex        =   14
         Top             =   960
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         _Version        =   393216
         Value           =   1
         AutoBuddy       =   -1  'True
         BuddyControl    =   "txtNumberStart"
         BuddyDispid     =   196624
         OrigLeft        =   4320
         OrigTop         =   960
         OrigRight       =   4575
         OrigBottom      =   1215
         Max             =   100000
         Min             =   1
         SyncBuddy       =   -1  'True
         BuddyProperty   =   65547
         Enabled         =   -1  'True
      End
      Begin VB.TextBox txtNumberStart 
         Height          =   285
         Left            =   1920
         TabIndex        =   13
         Top             =   960
         Width           =   2160
      End
      Begin VB.CheckBox chkCopyLyrics 
         Caption         =   "复制歌词(&L)"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   600
         Width           =   4455
      End
      Begin VB.CheckBox chkClearDisk 
         Caption         =   "复制之前先格式化磁盘(&F)"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   240
         Width           =   4455
      End
      Begin VB.Label lblNumberStart 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "清单起始编号(&S):"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   180
         Left            =   120
         TabIndex        =   12
         Top             =   990
         Width           =   1440
      End
   End
   Begin VB.Frame fraTag 
      Caption         =   "重写标签 (仅对 MP3 文件有效)"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2295
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4695
      Begin MSComctlLib.ImageCombo icbEncode 
         Height          =   330
         Left            =   1560
         TabIndex        =   6
         Top             =   1800
         Width           =   3015
         _ExtentX        =   5318
         _ExtentY        =   582
         _Version        =   393216
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         Locked          =   -1  'True
         Text            =   "ImageCombo1"
         ImageList       =   "iltEconde"
      End
      Begin VB.CheckBox chkRewriteID3v2 
         Caption         =   "重新写入 ID3v2(&W)"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   1440
         Width           =   4455
      End
      Begin VB.CheckBox chkDelID3v2 
         Caption         =   "删除原来的 ID3v2(&E)"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   1080
         Width           =   4455
      End
      Begin VB.CheckBox chkRewriteID3v1 
         Caption         =   "重新写入 ID3v1(&R)"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   600
         Width           =   4455
      End
      Begin VB.CheckBox chkDelID3v1 
         Caption         =   "删除原来 ID3v1(&D)"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   4455
      End
      Begin VB.Label lblEncode 
         AutoSize        =   -1  'True
         Caption         =   "串流编码(&O):"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   180
         Left            =   360
         TabIndex        =   5
         Top             =   1875
         Width           =   1080
      End
   End
End
Attribute VB_Name = "frmReady"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public bCanceled As Boolean

Private Sub chkClearDisk_Click()
  If frmMain.mnuDeleteBefore.Checked <> CBool(chkClearDisk.value) Then frmMain.mnuDeleteBefore_Click
End Sub

Private Sub chkCopyLyrics_Click()
  If frmMain.mnuCopyLyrics.Checked <> CBool(chkCopyLyrics.value) Then frmMain.mnuCopyLyrics_Click
End Sub

Private Sub chkDelID3v1_Click()
  chkRewriteID3v1.Enabled = chkDelID3v1.value
End Sub

Private Sub chkDelID3v2_Click()
  chkRewriteID3v2.Enabled = chkDelID3v2.value
  chkRewriteID3v2_Click
End Sub

Private Sub chkRewriteID3v2_Click()
  lblEncode.Enabled = chkRewriteID3v2.value And chkDelID3v2.value
  icbEncode.Enabled = chkRewriteID3v2.value And chkDelID3v2.value
End Sub

Private Sub cmdCancel_Click()
  bCanceled = True
  Unload Me
End Sub

Private Sub cmdOK_Click()
  bCanceled = False
  TagDelID3v1 = chkDelID3v1.value
  TagDelID3v2 = chkDelID3v2.value
  TagWriteID3v1 = chkRewriteID3v1.value
  TagWriteID3v2 = chkRewriteID3v2.value
  TagUseUnicode = (icbEncode.selectedItem.Index = 2)
  NumberStart = udNumberStart.value
  Unload Me
End Sub

Private Sub Form_Load()
  '添加一些必要的项目
  icbEncode.ComboItems.Add , , "ISO 8859-1", 1
  icbEncode.ComboItems.Add , , "Unicode (UTF-16)", 2
  
  '读取上一次的内容
  chkCopyLyrics.value = Abs(frmMain.mnuCopyLyrics.Checked)
  chkClearDisk.value = Abs(frmMain.mnuDeleteBefore.Checked)
  chkDelID3v1.value = Abs(TagDelID3v1)
  chkDelID3v2.value = Abs(TagDelID3v2)
  chkRewriteID3v2.value = Abs(TagWriteID3v2)
  chkRewriteID3v1.value = Abs(TagWriteID3v1)
  udNumberStart.value = NumberStart
  
  If TagUseUnicode Then
    icbEncode.ComboItems(2).Selected = True
  Else
    icbEncode.ComboItems(1).Selected = True
  End If
  
  chkDelID3v1_Click
  chkDelID3v2_Click
  chkRewriteID3v2_Click
  
  '检查驱动器
  tmrChkDevice.Enabled = True
End Sub

Private Sub tmrChkDevice_Timer()
  '检查驱动器是否准备好
  Dim DirveLetter As String
  Dim DestPath As String
  
  DestPath = frmMain.stbDefault.Panels(3).Text
  DirveLetter = Left(DestPath, 3)
  
  If FS.DriveExists(DirveLetter) Then
    If FS.GetDrive(DirveLetter).IsReady Then
      cmdOK.Enabled = True
      cmdCancel.Default = False
      Exit Sub
    End If
  End If
  
  cmdOK.Enabled = False
  cmdCancel.Default = True
End Sub

Private Sub txtNumberStart_Validate(Cancel As Boolean)
  udNumberStart.value = CLng(Val(txtNumberStart.Text))
End Sub
