VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "关于 MP3 Player Assistant"
   ClientHeight    =   6630
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5670
   Icon            =   "frmAbout.frx":0000
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
      HasDC           =   0   'False
      Height          =   4095
      Left            =   240
      ScaleHeight     =   4095
      ScaleWidth      =   5175
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   1800
      Width           =   5175
      Begin VB.Frame fraAuthor 
         Caption         =   "作者"
         ForeColor       =   &H00D54600&
         Height          =   615
         Left            =   0
         TabIndex        =   23
         Top             =   960
         Width           =   5175
         Begin VB.Label lblVersion 
            AutoSize        =   -1  'True
            Caption         =   "陈明龙 (Alexander Chen)"
            Height          =   180
            Index           =   6
            Left            =   120
            TabIndex        =   24
            Top             =   240
            Width           =   2070
         End
      End
      Begin VB.Frame fraDevelopment 
         Caption         =   "开发环境"
         ForeColor       =   &H00D54600&
         Height          =   1215
         Left            =   0
         TabIndex        =   18
         Top             =   1680
         Width           =   5175
         Begin VB.Label lblVersion 
            AutoSize        =   -1  'True
            Caption         =   "开发语言: Basic"
            Height          =   180
            Index           =   2
            Left            =   120
            TabIndex        =   22
            Top             =   240
            Width           =   1350
         End
         Begin VB.Label lblVersion 
            AutoSize        =   -1  'True
            Caption         =   "编译器: Microsoft Visual Basic 6.0 Enterprise Edition"
            Height          =   180
            Index           =   3
            Left            =   120
            TabIndex        =   21
            Top             =   480
            Width           =   4770
         End
         Begin VB.Label lblVersion 
            AutoSize        =   -1  'True
            Caption         =   "Service Pack 6 (6.00.9782)"
            Height          =   180
            Index           =   4
            Left            =   840
            TabIndex        =   20
            Top             =   720
            Width           =   2340
         End
         Begin VB.Label lblVersion 
            AutoSize        =   -1  'True
            Caption         =   "编译日期: 2007-4-7"
            Height          =   180
            Index           =   5
            Left            =   120
            TabIndex        =   19
            Top             =   960
            Width           =   1620
         End
      End
      Begin VB.Frame fraWarning 
         Caption         =   "警告"
         ForeColor       =   &H00D54600&
         Height          =   1095
         Left            =   0
         TabIndex        =   7
         Top             =   3000
         Width           =   5175
         Begin VB.Label lblWarning 
            Caption         =   $"frmAbout.frx":058A
            Height          =   735
            Left            =   120
            TabIndex        =   8
            Top             =   240
            Width           =   4935
         End
      End
      Begin VB.Label lblVersion 
         AutoSize        =   -1  'True
         Caption         =   "发行: Release (正式版)"
         Height          =   195
         Index           =   8
         Left            =   0
         TabIndex        =   17
         Top             =   480
         Width           =   1710
      End
      Begin VB.Label lblVersion 
         AutoSize        =   -1  'True
         Caption         =   "代码页: Unicode (1200)"
         Height          =   180
         Index           =   0
         Left            =   0
         TabIndex        =   6
         Top             =   720
         Width           =   1980
      End
      Begin VB.Label lblVersion 
         AutoSize        =   -1  'True
         Caption         =   "版本: 2.00.741"
         Height          =   180
         Index           =   1
         Left            =   0
         TabIndex        =   5
         Top             =   240
         Width           =   1260
      End
      Begin VB.Label lblAppName 
         AutoSize        =   -1  'True
         Caption         =   "MP3 Player Assistant (MP3 播放器助手)"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   180
         Index           =   0
         Left            =   0
         TabIndex        =   4
         Top             =   0
         Width           =   3810
      End
   End
   Begin VB.PictureBox picDonate 
      BorderStyle     =   0  'None
      Height          =   4095
      Left            =   240
      ScaleHeight     =   4095
      ScaleWidth      =   5175
      TabIndex        =   40
      TabStop         =   0   'False
      Top             =   1800
      Width           =   5175
      Begin VB.Label lblDonateInfo 
         AutoSize        =   -1  'True
         Caption         =   "使用快钱。您可以随意捐助金额。"
         Height          =   180
         Index           =   1
         Left            =   2400
         TabIndex        =   43
         Top             =   2640
         Width           =   2700
      End
      Begin VB.Image imgDonate 
         Height          =   420
         Index           =   0
         Left            =   600
         MouseIcon       =   "frmAbout.frx":0634
         MousePointer    =   99  'Custom
         Picture         =   "frmAbout.frx":0786
         Tag             =   "https://www.99bill.com/webapp/donateAction.do?mac=EB2318380B147E4BACF2E10CEE25C907&ad=88990607153808395&buttonid=13584"
         Top             =   2520
         Width           =   1650
      End
      Begin VB.Image imgDonate 
         Height          =   600
         Index           =   1
         Left            =   0
         MouseIcon       =   "frmAbout.frx":0DA0
         MousePointer    =   99  'Custom
         Picture         =   "frmAbout.frx":0EF2
         Tag             =   $"frmAbout.frx":1FCE
         Top             =   3240
         Width           =   2250
      End
      Begin VB.Label lblDonateInfo 
         Caption         =   "使用腾讯财付通，您可以一次捐助 19.9 元"
         Height          =   420
         Index           =   0
         Left            =   2400
         TabIndex        =   42
         Top             =   3360
         Width           =   2580
      End
      Begin VB.Label lblThankful 
         BackColor       =   &H00FFFFFF&
         BackStyle       =   0  'Transparent
         Caption         =   $"frmAbout.frx":249A
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2295
         Left            =   0
         TabIndex        =   41
         Top             =   0
         Width           =   5175
      End
   End
   Begin VB.PictureBox picContact 
      BorderStyle     =   0  'None
      Height          =   4095
      Left            =   240
      ScaleHeight     =   4095
      ScaleWidth      =   5175
      TabIndex        =   25
      Top             =   1800
      Width           =   5175
      Begin VB.Frame fraEmail 
         Caption         =   "邮件联系"
         ForeColor       =   &H00D54600&
         Height          =   4095
         Left            =   3120
         TabIndex        =   28
         Top             =   0
         Width           =   2055
         Begin VB.Label lblEmailHint 
            Caption         =   "如果，您觉得这个软件很好，可以将他收录在安装光盘中。我可以为您包装一个安装版本，可以在程序中替换您想要的广告。"
            Height          =   1095
            Index           =   2
            Left            =   120
            TabIndex        =   34
            Top             =   2880
            Width           =   1815
         End
         Begin VB.Label lblEmail 
            AutoSize        =   -1  'True
            Caption         =   "OEM"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   9
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00D54600&
            Height          =   180
            Index           =   2
            Left            =   120
            MouseIcon       =   "frmAbout.frx":25C2
            MousePointer    =   99  'Custom
            TabIndex        =   33
            Top             =   2640
            Width           =   315
         End
         Begin VB.Label lblEmailHint 
            Caption         =   "任何软件都不可能是完美的，有可能最简单的位置有最指名的错误。谢您提出任何意见和建议。"
            Height          =   975
            Index           =   1
            Left            =   120
            TabIndex        =   32
            Top             =   1560
            Width           =   1815
         End
         Begin VB.Label lblEmail 
            AutoSize        =   -1  'True
            Caption         =   "意见和建议"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   9
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00D54600&
            Height          =   180
            Index           =   1
            Left            =   120
            MouseIcon       =   "frmAbout.frx":2714
            MousePointer    =   99  'Custom
            TabIndex        =   31
            Top             =   1320
            Width           =   975
         End
         Begin VB.Label lblEmailHint 
            Caption         =   "如果您对本软件有任何疑问，或者在您的机器上运行出现了问题，请发邮件给我。"
            Height          =   735
            Index           =   0
            Left            =   120
            TabIndex        =   30
            Top             =   480
            Width           =   1815
         End
         Begin VB.Label lblEmail 
            AutoSize        =   -1  'True
            Caption         =   "问题"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   9
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00D54600&
            Height          =   180
            Index           =   0
            Left            =   120
            MouseIcon       =   "frmAbout.frx":2866
            MousePointer    =   99  'Custom
            TabIndex        =   29
            Top             =   240
            Width           =   390
         End
      End
      Begin VB.Frame fraFlydragon 
         Caption         =   "其他相关站点"
         ForeColor       =   &H00D54600&
         Height          =   2055
         Left            =   0
         TabIndex        =   27
         Top             =   2040
         Width           =   3015
         Begin VB.Label lblSite 
            Caption         =   "腾龙阁留言板 - 如果您不希望去论坛，留言板是个好地方"
            ForeColor       =   &H00D54600&
            Height          =   375
            Index           =   3
            Left            =   120
            TabIndex        =   39
            Tag             =   "http://www.jiaozi.net/mylyb/index.asp?user=flydragon"
            Top             =   1440
            Width           =   2775
         End
         Begin VB.Label lblSite 
            Caption         =   "腾龙阁论坛 - 可以在这里讨论问题或者提出建议"
            ForeColor       =   &H00D54600&
            Height          =   375
            Index           =   2
            Left            =   120
            TabIndex        =   38
            Tag             =   "http://mp3pa.dd.topzj.com"
            Top             =   960
            Width           =   2775
         End
         Begin VB.Label lblSite 
            Caption         =   "腾龙阁软件发布网络硬盘 - 软件最新的发布地"
            ForeColor       =   &H00D54600&
            Height          =   375
            Index           =   1
            Left            =   120
            TabIndex        =   37
            Tag             =   "http://alexanderchen.ys168.com"
            Top             =   480
            Width           =   2775
         End
         Begin VB.Label lblSite 
            Caption         =   "腾龙阁 - 关于作者及他的软件"
            ForeColor       =   &H00D54600&
            Height          =   255
            Index           =   0
            Left            =   120
            TabIndex        =   36
            Tag             =   "http://alexch.go3.icpcn.com/flydragon/"
            Top             =   240
            Width           =   2775
         End
      End
      Begin VB.Frame fraWebsite 
         Caption         =   "MP3 Player Assistant 官方网站"
         ForeColor       =   &H00D54600&
         Height          =   1935
         Left            =   0
         TabIndex        =   26
         Top             =   0
         Width           =   3015
         Begin VB.Image picWebsite 
            Height          =   1500
            Left            =   120
            MouseIcon       =   "frmAbout.frx":29B8
            MousePointer    =   99  'Custom
            Picture         =   "frmAbout.frx":2B0A
            Top             =   240
            Width           =   2700
         End
      End
   End
   Begin RichTextLib.RichTextBox rtbAuthor 
      Height          =   4095
      Left            =   240
      TabIndex        =   16
      Top             =   1800
      Width           =   5175
      _ExtentX        =   9128
      _ExtentY        =   7223
      _Version        =   393217
      BorderStyle     =   0
      ReadOnly        =   -1  'True
      ScrollBars      =   2
      FileName        =   "D:\My Documents\!VB Projects\MP3 Player Assistant\_Document\author.rtf"
      TextRTF         =   $"frmAbout.frx":52E6
   End
   Begin VB.PictureBox picTitle 
      BackColor       =   &H00FFFFFF&
      HasDC           =   0   'False
      Height          =   1095
      Left            =   120
      Picture         =   "frmAbout.frx":16D82
      ScaleHeight     =   1035
      ScaleWidth      =   5355
      TabIndex        =   2
      Top             =   120
      Width           =   5415
   End
   Begin MSComctlLib.ImageList iltTab 
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
         NumListImages   =   6
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAbout.frx":17DE6
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAbout.frx":18380
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAbout.frx":1891A
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAbout.frx":18EB4
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAbout.frx":1944E
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmAbout.frx":199E8
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdClose 
      Cancel          =   -1  'True
      Caption         =   "关闭"
      Height          =   375
      Left            =   3960
      TabIndex        =   1
      Top             =   6120
      Width           =   1575
   End
   Begin MSComctlLib.TabStrip tbsMain 
      Height          =   4695
      Left            =   120
      TabIndex        =   0
      Top             =   1320
      Width           =   5415
      _ExtentX        =   9551
      _ExtentY        =   8281
      HotTracking     =   -1  'True
      ImageList       =   "iltTab"
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   6
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "软件"
            ImageVarType    =   2
            ImageIndex      =   1
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "作者"
            ImageVarType    =   2
            ImageIndex      =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "感谢"
            ImageVarType    =   2
            ImageIndex      =   3
         EndProperty
         BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "历史"
            ImageVarType    =   2
            ImageIndex      =   4
         EndProperty
         BeginProperty Tab5 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "联系"
            ImageVarType    =   2
            ImageIndex      =   5
         EndProperty
         BeginProperty Tab6 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "捐助"
            ImageVarType    =   2
            ImageIndex      =   6
         EndProperty
      EndProperty
   End
   Begin RichTextLib.RichTextBox txtHistory 
      Height          =   4095
      Left            =   240
      TabIndex        =   35
      Top             =   1800
      Width           =   5175
      _ExtentX        =   9128
      _ExtentY        =   7223
      _Version        =   393217
      BorderStyle     =   0
      Enabled         =   -1  'True
      ReadOnly        =   -1  'True
      ScrollBars      =   2
      TextRTF         =   $"frmAbout.frx":19F82
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.PictureBox picAcknowledgement 
      BorderStyle     =   0  'None
      Height          =   4095
      Left            =   240
      ScaleHeight     =   4095
      ScaleWidth      =   5175
      TabIndex        =   9
      TabStop         =   0   'False
      Top             =   1800
      Width           =   5175
      Begin VB.Label lblAcknowledgement 
         Caption         =   "这个网站有大量的 VB 编程信息，本 ID3v2 标签的读取就是基于本网站的源代码。"
         Height          =   375
         Index           =   2
         Left            =   600
         TabIndex        =   15
         Top             =   1680
         Width           =   4575
      End
      Begin VB.Label ldtAcknowledgement 
         AutoSize        =   -1  'True
         Caption         =   "www.vbaccelerator.com"
         ForeColor       =   &H00D54600&
         Height          =   180
         Index           =   2
         Left            =   600
         MouseIcon       =   "frmAbout.frx":1E793
         MousePointer    =   99  'Custom
         TabIndex        =   14
         Top             =   1440
         Width           =   1890
      End
      Begin VB.Image imgAcknowledgement 
         Height          =   480
         Index           =   2
         Left            =   0
         Picture         =   "frmAbout.frx":1E8E5
         Top             =   1440
         Width           =   480
      End
      Begin VB.Label lblAcknowledgement 
         Caption         =   "API Viewer 提供了比 VB 更多的 API 参考，并且提供了准确的 API 定义。"
         Height          =   375
         Index           =   1
         Left            =   600
         TabIndex        =   13
         Top             =   960
         Width           =   4575
      End
      Begin VB.Label ldtAcknowledgement 
         AutoSize        =   -1  'True
         Caption         =   "API Viewer 2004 (Christoph von Wittich)"
         ForeColor       =   &H00D54600&
         Height          =   180
         Index           =   1
         Left            =   600
         MouseIcon       =   "frmAbout.frx":1F1AF
         MousePointer    =   99  'Custom
         TabIndex        =   12
         Top             =   720
         Width           =   3510
      End
      Begin VB.Image imgAcknowledgement 
         Height          =   480
         Index           =   1
         Left            =   0
         Picture         =   "frmAbout.frx":1F301
         Top             =   720
         Width           =   480
      End
      Begin VB.Label lblAcknowledgement 
         Caption         =   "API-Guide 为本程序提供了大量的 Win32 API 参考，并且附带很多有用的实例和信息。"
         Height          =   375
         Index           =   0
         Left            =   600
         TabIndex        =   11
         Top             =   240
         Width           =   4575
      End
      Begin VB.Label ldtAcknowledgement 
         AutoSize        =   -1  'True
         Caption         =   "API-Guide (The KPD-Team)"
         ForeColor       =   &H00D54600&
         Height          =   180
         Index           =   0
         Left            =   600
         MouseIcon       =   "frmAbout.frx":1FBCB
         MousePointer    =   99  'Custom
         TabIndex        =   10
         Top             =   0
         Width           =   2160
      End
      Begin VB.Image imgAcknowledgement 
         Height          =   480
         Index           =   0
         Left            =   0
         Picture         =   "frmAbout.frx":1FD1D
         Top             =   0
         Width           =   480
      End
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdClose_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  tbsMain_Click
End Sub

Private Sub Image1_Click()
  SHOpenLink "http://www.paqckt.com/flydragon/", Me.hwnd
End Sub

Private Sub imgDonate_Click(Index As Integer)
  SHOpenLink imgDonate(Index).Tag, Me.hwnd
End Sub

Private Sub lblEmail_Click(Index As Integer)
  SHWriteEmail "chenminglong21cn@21cn.com", lblEmail(Index).Caption, Me.hwnd
End Sub

Private Sub lblSite_Click(Index As Integer)
  SHOpenLink lblSite(Index).Tag, Me.hwnd
End Sub

Private Sub ldtAcknowledgement_Click(Index As Integer)
  Select Case Index
  Case 0: SHOpenLink "http://www.allapi.net", Me.hwnd
  Case 1: SHWriteEmail "Christoph@ApiViewer.de", Me.hwnd
  Case 2: SHOpenLink "http://www.vbaccelerator.com", Me.hwnd
  End Select
End Sub

Private Sub picWebsite_Click()
  SHOpenLink "http://alexch.go3.icpcn.com/flydragon/mp3pa/", Me.hwnd
End Sub

Private Sub tbsMain_Click()
  Select Case tbsMain.selectedItem.Index
  Case 1
    picPage.ZOrder 0
    picPage.Visible = True
    rtbAuthor.Visible = False
    picAcknowledgement.Visible = False
    txtHistory.Visible = False
    picContact.Visible = False
    picDonate.Visible = False
  Case 2
    rtbAuthor.ZOrder 0
    picPage.Visible = False
    rtbAuthor.Visible = True
    picAcknowledgement.Visible = False
    txtHistory.Visible = False
    picContact.Visible = False
    picDonate.Visible = False
  Case 3
    picAcknowledgement.ZOrder 0
    picPage.Visible = True
    rtbAuthor.Visible = False
    picAcknowledgement.Visible = True
    txtHistory.Visible = False
    picContact.Visible = False
    picDonate.Visible = False
  Case 4
    txtHistory.ZOrder 0
    picPage.Visible = True
    rtbAuthor.Visible = False
    picAcknowledgement.Visible = False
    txtHistory.Visible = True
    picContact.Visible = False
    picDonate.Visible = False
  Case 5
    picContact.ZOrder 0
    picPage.Visible = False
    rtbAuthor.Visible = False
    picAcknowledgement.Visible = False
    txtHistory.Visible = False
    picContact.Visible = True
    picDonate.Visible = False
  Case 6
    picDonate.ZOrder 0
    picPage.Visible = False
    rtbAuthor.Visible = False
    picAcknowledgement.Visible = False
    txtHistory.Visible = False
    picContact.Visible = False
    picDonate.Visible = True
  End Select
End Sub

Public Sub ShowDonation()
  Load Me
  tbsMain.Tabs(6).Selected = True
  tbsMain_Click
  Me.Show 1
End Sub
