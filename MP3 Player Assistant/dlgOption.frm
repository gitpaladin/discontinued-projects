VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form dlgOption 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "选项"
   ClientHeight    =   6375
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7935
   Icon            =   "dlgOption.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6375
   ScaleWidth      =   7935
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin MP3PA.UISerchKey uiSerchKey 
      Height          =   5055
      Left            =   2160
      TabIndex        =   12
      Top             =   600
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   8916
   End
   Begin MP3PA.UIRename uiRename 
      Height          =   5055
      Left            =   2160
      TabIndex        =   11
      Top             =   600
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   8916
   End
   Begin MP3PA.UILyric uiLyric 
      Height          =   5055
      Left            =   2160
      TabIndex        =   3
      Top             =   600
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   8916
      Enabled         =   0   'False
   End
   Begin MP3PA.UIApp uiApp 
      Height          =   5055
      Left            =   2160
      TabIndex        =   10
      Top             =   600
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   8916
   End
   Begin MP3PA.UIShell uiShell 
      Height          =   5055
      Left            =   2160
      TabIndex        =   6
      Top             =   600
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   8916
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   6360
      TabIndex        =   9
      Top             =   5880
      Width           =   1455
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "确定"
      Default         =   -1  'True
      Height          =   375
      Left            =   4800
      TabIndex        =   8
      Top             =   5880
      Width           =   1455
   End
   Begin VB.Frame fraSeparator 
      Height          =   15
      Left            =   0
      TabIndex        =   7
      Top             =   5760
      Width           =   7935
   End
   Begin VB.PictureBox picTitle 
      BorderStyle     =   0  'None
      Height          =   375
      Left            =   2160
      Picture         =   "dlgOption.frx":058A
      ScaleHeight     =   375
      ScaleWidth      =   5655
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   120
      Width           =   5655
      Begin VB.Label lblTitle 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "歌词"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   75
         TabIndex        =   2
         Top             =   75
         UseMnemonic     =   0   'False
         Width           =   450
      End
      Begin VB.Image imgTitle 
         Height          =   255
         Left            =   5340
         Top             =   60
         Width           =   255
      End
   End
   Begin MSComctlLib.ImageList iltOptBIG 
      Left            =   720
      Top             =   5880
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   7
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgOption.frx":872C
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgOption.frx":9006
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgOption.frx":98E0
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgOption.frx":A1BA
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgOption.frx":AA94
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgOption.frx":B36E
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgOption.frx":BC48
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList iltOptSMG 
      Left            =   120
      Top             =   5880
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   7
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgOption.frx":C522
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgOption.frx":CABC
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgOption.frx":D056
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgOption.frx":D5F0
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgOption.frx":DB8A
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgOption.frx":E124
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgOption.frx":E6BE
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvwOptions 
      Height          =   5535
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1935
      _ExtentX        =   3413
      _ExtentY        =   9763
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      HideColumnHeaders=   -1  'True
      FullRowSelect   =   -1  'True
      _Version        =   393217
      SmallIcons      =   "iltOptBIG"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "内容"
         Object.Width           =   3254
      EndProperty
   End
   Begin MP3PA.UIFilter uiFilter 
      Height          =   5055
      Left            =   2160
      TabIndex        =   4
      Top             =   600
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   8916
   End
   Begin MP3PA.UISortKey uiSortKey 
      Height          =   5055
      Left            =   2160
      TabIndex        =   5
      Top             =   600
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   8916
   End
End
Attribute VB_Name = "dlgOption"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Option Base 1

Private ItemName(7) As String
Private ItemPage(7) As Object

Private Sub cmdCancel_Click()
  Unload Me
  Set dlgOption = Nothing
End Sub

Private Sub cmdOK_Click()
  '更新
  uiLyric.Update
  uiFilter.Update
  uiSortKey.Update
  uiShell.Update
  uiApp.Update
  uiRename.Update
  uiSerchKey.Update
  
  Unload Me
End Sub

Private Sub Form_Load()
  '添加项目
  ItemName(1) = "歌词"
  ItemName(2) = "过滤器"
  ItemName(3) = "排序关键字"
  ItemName(4) = "核心"
  ItemName(5) = "外部程序"
  ItemName(6) = "重命名模板"
  ItemName(7) = "搜索历史"
  
  Set ItemPage(1) = uiLyric
  Set ItemPage(2) = uiFilter
  Set ItemPage(3) = uiSortKey
  Set ItemPage(4) = uiShell
  Set ItemPage(5) = uiApp
  Set ItemPage(6) = uiRename
  Set ItemPage(7) = uiSerchKey
  
  ItemPage(1).Init
  ItemPage(2).Init
  ItemPage(3).Init
  ItemPage(4).Init
  ItemPage(5).Init
  ItemPage(6).Init
  ItemPage(7).Init
  
  For i = 1 To 7
    lvwOptions.ListItems.Add , , ItemName(i), , i
  Next i
  
End Sub

Public Sub ShowPage(Optional ByVal Page As Integer = 1)
  '显示页面
  Load Me
  lvwOptions.ListItems(Page).Selected = True
  lvwOptions_ItemClick lvwOptions.selectedItem
  Me.Show 1
End Sub

Private Sub lvwOptions_ItemClick(ByVal Item As MSComctlLib.ListItem)
  lblTitle.Caption = ItemName(Item.Index)
  Set imgTitle.Picture = iltOptSMG.ListImages(Item.Index).Picture
  
  ItemPage(1).Enabled = False
  ItemPage(2).Enabled = False
  ItemPage(3).Enabled = False
  ItemPage(4).Enabled = False
  ItemPage(5).Enabled = False
  ItemPage(6).Enabled = False
  ItemPage(7).Enabled = False
  ItemPage(Item.Index).Enabled = True

  ItemPage(1).Visible = False
  ItemPage(2).Visible = False
  ItemPage(3).Visible = False
  ItemPage(4).Visible = False
  ItemPage(5).Visible = False
  ItemPage(6).Visible = False
  ItemPage(7).Visible = False
  ItemPage(Item.Index).Visible = True
  
  ItemPage(Item.Index).ZOrder 0
End Sub
