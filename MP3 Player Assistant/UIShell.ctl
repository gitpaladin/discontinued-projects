VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl UIShell 
   ClientHeight    =   5055
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5655
   ScaleHeight     =   5055
   ScaleWidth      =   5655
   Begin VB.Frame fraShortcut 
      Caption         =   "创建快捷方式"
      ForeColor       =   &H00D54600&
      Height          =   2295
      Left            =   3480
      TabIndex        =   13
      Top             =   2760
      Width           =   2175
      Begin VB.PictureBox picShortCut 
         BorderStyle     =   0  'None
         HasDC           =   0   'False
         Height          =   1935
         Left            =   120
         ScaleHeight     =   1935
         ScaleWidth      =   1935
         TabIndex        =   14
         TabStop         =   0   'False
         Top             =   240
         Width           =   1935
         Begin VB.CommandButton cmdProgram 
            Caption         =   "程序根文件夹(&P)"
            Height          =   375
            Left            =   0
            TabIndex        =   18
            Top             =   1560
            Width           =   1935
         End
         Begin VB.CommandButton cmdStartMenu 
            Caption         =   "开始菜单根文件夹(&M)"
            Height          =   375
            Left            =   0
            TabIndex        =   17
            Top             =   1040
            Width           =   1935
         End
         Begin VB.CommandButton cmdQuickLaunch 
            Caption         =   "快速启动栏(&Q)"
            Height          =   375
            Left            =   0
            TabIndex        =   16
            Top             =   520
            Width           =   1935
         End
         Begin VB.CommandButton cmdDesktop 
            Caption         =   "桌面(&D)"
            Height          =   375
            Left            =   0
            TabIndex        =   15
            Top             =   0
            Width           =   1935
         End
      End
   End
   Begin VB.Frame fraCopy 
      Caption         =   "复制速度"
      ForeColor       =   &H00D54600&
      Height          =   2295
      Left            =   0
      TabIndex        =   8
      Top             =   2760
      Width           =   3375
      Begin MSComctlLib.Slider sldByte 
         Height          =   495
         Left            =   120
         TabIndex        =   10
         Top             =   600
         Width           =   3135
         _ExtentX        =   5530
         _ExtentY        =   873
         _Version        =   393216
         LargeChange     =   8
         Min             =   1
         Max             =   31
         SelStart        =   1
         Value           =   1
      End
      Begin VB.Label lblCopyInfo 
         Caption         =   "不要将每次读取的数据的值调得太大，因为真正的复制速度是由硬件决定的。所以一般的情况下不要更改。"
         Height          =   615
         Left            =   120
         TabIndex        =   12
         Top             =   1560
         Width           =   3135
      End
      Begin VB.Label lblByte 
         AutoSize        =   -1  'True
         Caption         =   "1024 字节/次"
         Height          =   180
         Left            =   120
         TabIndex        =   11
         Top             =   1200
         Width           =   1080
      End
      Begin VB.Label lblCopySpeedLBL 
         AutoSize        =   -1  'True
         Caption         =   "每次读取的字节数(&B):"
         Height          =   180
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Width           =   1800
      End
   End
   Begin VB.Frame fraMP3Info 
      Caption         =   "MP3 信息读取"
      ForeColor       =   &H00D54600&
      Height          =   2655
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   5655
      Begin VB.PictureBox picInfo 
         BorderStyle     =   0  'None
         Height          =   1215
         Left            =   120
         ScaleHeight     =   1215
         ScaleWidth      =   5415
         TabIndex        =   19
         Top             =   1320
         Width           =   5415
         Begin VB.Frame fraInfo 
            Caption         =   "高级选项"
            ForeColor       =   &H00D54600&
            Height          =   1215
            Left            =   0
            TabIndex        =   7
            Top             =   0
            Width           =   5415
            Begin VB.CheckBox chkNoDuration 
               Caption         =   "不获取音乐文件长度(&D)"
               Height          =   255
               Left            =   120
               TabIndex        =   22
               Top             =   840
               Width           =   5175
            End
            Begin VB.CheckBox chkNoTime 
               Caption         =   "不获取文件时间(&M)"
               Height          =   375
               Left            =   120
               TabIndex        =   21
               Top             =   480
               Width           =   5175
            End
            Begin VB.CheckBox chkInherit 
               Caption         =   "继承播放列表或收藏夹中的音乐信息(&I)"
               Height          =   255
               Left            =   120
               TabIndex        =   20
               Top             =   240
               Width           =   5175
            End
         End
      End
      Begin MSComctlLib.ImageList iltInfo 
         Left            =   1320
         Top             =   120
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
               Picture         =   "UIShell.ctx":0000
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "UIShell.ctx":059A
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "UIShell.ctx":0B34
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "UIShell.ctx":10CE
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "UIShell.ctx":1668
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo icbFirst 
         Height          =   315
         Left            =   2160
         TabIndex        =   2
         Top             =   225
         Width           =   3375
         _ExtentX        =   5953
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         Locked          =   -1  'True
         Text            =   "ImageCombo1"
         ImageList       =   "iltInfo"
      End
      Begin MSComctlLib.ImageCombo icbThird 
         Height          =   315
         Left            =   2160
         TabIndex        =   6
         Top             =   945
         Width           =   3375
         _ExtentX        =   5953
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         Locked          =   -1  'True
         Text            =   "ImageCombo1"
         ImageList       =   "iltInfo"
      End
      Begin MSComctlLib.ImageCombo icbSecond 
         Height          =   315
         Left            =   2160
         TabIndex        =   4
         Top             =   585
         Width           =   3375
         _ExtentX        =   5953
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         Locked          =   -1  'True
         Text            =   "ImageCombo1"
         ImageList       =   "iltInfo"
      End
      Begin VB.Label lblThird 
         AutoSize        =   -1  'True
         Caption         =   "第三次尝试获取信息(&T):"
         Height          =   180
         Left            =   120
         TabIndex        =   5
         Top             =   1027
         Width           =   1980
      End
      Begin VB.Label lblSecond 
         AutoSize        =   -1  'True
         Caption         =   "第二次尝试获取信息(&S):"
         Height          =   180
         Left            =   120
         TabIndex        =   3
         Top             =   667
         Width           =   1980
      End
      Begin VB.Label lblFirst 
         AutoSize        =   -1  'True
         Caption         =   "第一次尝试获取信息(&F):"
         Height          =   180
         Left            =   120
         TabIndex        =   1
         Top             =   307
         Width           =   1980
      End
   End
End
Attribute VB_Name = "UIShell"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private sInfo(1 To 5) As String

'注意！不要删除或修改下列被注释的行！
'MappingInfo=UserControl,UserControl,-1,Enabled
Public Property Get Enabled() As Boolean
  Enabled = UserControl.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  UserControl.Enabled() = New_Enabled
  PropertyChanged "Enabled"
End Property

Private Sub cmdDesktop_Click()
  CreateShortcutDesktop App.Title, AppendPath(App.Path, App.EXEName) & ".EXE"
End Sub

Private Sub cmdProgram_Click()
  CreateShortcutStartMenu App.Title, AppendPath(App.Path, App.EXEName) & ".EXE"
End Sub

Private Sub cmdQuickLaunch_Click()
  CreateShortcutQuickLaunch App.Title, AppendPath(App.Path, App.EXEName) & ".EXE"
End Sub

Private Sub cmdStartMenu_Click()
  CreateShortcutStartRootMenu App.Title, AppendPath(App.Path, App.EXEName) & ".EXE"
End Sub

Private Sub icbFirst_Click()
  '刷新
  Dim SelIdx As Long
  Dim SelTxt As String
  Dim cb As MSComctlLib.ComboItem
  
  SelIdx = icbFirst.selectedItem.Image
  SelTxt = icbFirst.selectedItem.Text
  
  icbSecond.ComboItems.Clear
  
  For i = 1 To 5
    Set cb = icbFirst.ComboItems(i)
    
    If cb.Image <> SelIdx Then
      icbSecond.ComboItems.Add , , cb.Text, cb.Image
    End If
  Next i
  
  lblSecond.Visible = Not (SelIdx = 1)
  icbSecond.Visible = Not (SelIdx = 1)
  lblThird.Visible = Not (SelIdx = 1)
  icbThird.Visible = Not (SelIdx = 1)
  
  icbSecond.ComboItems(2).Selected = True
  
  If SelIdx <> 1 Then icbSecond_Click
  
  RefreshInfo icbFirst.Text, icbFirst.selectedItem.Image
End Sub

Private Sub icbFirst_GotFocus()
  '刷新信息
  RefreshInfo icbFirst.Text, icbFirst.selectedItem.Image
End Sub

Private Sub icbSecond_Click()
  '刷新
  Dim SelIdx As Long
  Dim SelTxt As String
  Dim cb As MSComctlLib.ComboItem
  
  SelIdx = icbSecond.selectedItem.Image
  SelTxt = icbSecond.selectedItem.Text
  
  icbThird.ComboItems.Clear
  
  For i = 1 To 4
    Set cb = icbSecond.ComboItems(i)
    
    If cb.Image <> SelIdx Then
      icbThird.ComboItems.Add , , cb.Text, cb.Image
    End If
  Next i
  
  lblThird.Visible = Not (SelIdx = 1)
  icbThird.Visible = Not (SelIdx = 1)
  
  icbThird.ComboItems(2).Selected = True
  
  RefreshInfo icbSecond.Text, icbSecond.selectedItem.Image
End Sub

Private Sub icbSecond_GotFocus()
  RefreshInfo icbSecond.Text, icbSecond.selectedItem.Image
End Sub

Private Sub icbThird_Click()
  RefreshInfo icbThird.Text, icbThird.selectedItem.Image
End Sub

Private Sub icbThird_GotFocus()
  RefreshInfo icbThird.Text, icbThird.selectedItem.Image
End Sub

Private Sub sldByte_Change()
  sldByte_Click
End Sub

Private Sub sldByte_Click()
  lblByte.Caption = FormatNumber(sldByte.Value * 1024, 0, vbTrue, vbTrue, vbTrue) & " 字节/次"
  
  Select Case sldByte.Value
  Case 1
    lblByte.Caption = lblByte.Caption & " (最稳定)"
  Case 2
    lblByte.Caption = lblByte.Caption & " (USB 1.0 推荐)"
  Case 3
    lblByte.Caption = lblByte.Caption & " (USB 1.1 推荐)"
  Case 18
    lblByte.Caption = lblByte.Caption & " (USB 2.0 推荐)"
  End Select
End Sub

Private Sub sldByte_Scroll()
  sldByte_Click
End Sub

Private Sub UserControl_Initialize()
  '设置信息
  sInfo(1) = "不从文件中读取任何信息，这种方式是最快的，但是会牺牲很多有用的功能。比如统计歌曲长度，查看歌曲信息，为歌曲排序等等。"
  sInfo(2) = "ID3v1 是兼容性最好的标签，它使用附加在 MP3 文件最后 128 字节上，它也是读取速度最快的标签。它是以 ANSI 字符集字符存储的，所以它的兼容型最好，现在很多的 MP3 播放器也只能获得 ID3v1 的标签。但是由于 128 字节的限制，有可能使得过长的歌曲名字无法正常显示，但幸好这种可能很小。"
  sInfo(3) = "ID3v2 是最广泛应用的标签，它可以存储任何信息，而且每个信息没有固定的大小，也可以在同一个字段中存储不同的条目。它的编码一般是 ISO-8859-1 和 UTF-16(Unicode)。与 ID3v1 不同的是，它存储在音乐文件头部，没有固定的大小。由于 ID3v2 编码长度非固定，所以获取它所要时间比较长。"
  sInfo(4) = "APETAG 是由 Monkey's Audio(APE) 标签继承而来的，它和 ID3v2 有很多相识之处，不同的是它存储在文件的末尾。如果有 ID3v1，它存储在 ID3v1 的前面。它是使用 UTF-8 编码的，所以具有广泛的语言支持性，如果您经常使用 Foobar，就应该首选它，因为它在 Foobar 中是默认的标签。"
  sInfo(5) = "如果您不知道何种标签可取，本程序可直接通过 Windows Media Player 读取信息，而且它读取信息和 Windows Media Player 读取的结果是一样的，但是同时这也是最慢的方式，并且 Windows Media Player 不支持 APE 标签。"

  '填充属性
  icbFirst.ComboItems.Add , , "不读取", 1
  icbFirst.ComboItems.Add , , "ID3v1", 2
  icbFirst.ComboItems.Add , , "ID3v2", 3
  icbFirst.ComboItems.Add , , "APE", 4
  icbFirst.ComboItems.Add , , "Windows Media Player", 5
  
  icbFirst.ComboItems(2).Selected = True
  icbFirst_Click
End Sub

'从存贮器中加载属性值
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  UserControl.Enabled = PropBag.ReadProperty("Enabled", True)
End Sub

'将属性值写到存储器
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("Enabled", UserControl.Enabled, True)
End Sub

Private Sub RefreshInfo(ByVal Title As String, ByVal Index As Long)
  '填充信息
  'lblInfoTitle.Caption = "关于 " & Title
  'lblTagInfo.Caption = sInfo(Index)
End Sub

Public Sub Init()
  '获得信息
  icbFirst.ComboItems(InfoReadIdx(0) + 1).Selected = True
  icbFirst_Click
  
  For i = 1 To icbSecond.ComboItems.Count
    If icbSecond.ComboItems(i).Image = InfoReadIdx(1) + 1 Then
      icbSecond.ComboItems(i).Selected = True
      Exit For
    End If
  Next i
  icbSecond_Click
    
  For i = 1 To icbThird.ComboItems.Count
    If icbThird.ComboItems(i).Image = InfoReadIdx(2) + 1 Then
      icbThird.ComboItems(i).Selected = True
      Exit For
    End If
  Next i
  icbThird_Click
  
  RefreshInfo icbFirst.Text, icbFirst.selectedItem.Image
  
  sldByte.Value = frmMain.uifCopying.CopySpeed
  chkInherit.Value = Abs(InheritInfo)
  chkNoDuration.Value = Abs(NoDuration)
  chkNoTime.Value = Abs(NoTime)
  
End Sub

Public Sub Update()
  InfoReadIdx(0) = CLng(icbFirst.selectedItem.Image - 1)
  InfoReadIdx(1) = CLng(icbSecond.selectedItem.Image - 1)
  InfoReadIdx(2) = CLng(icbThird.selectedItem.Image - 1)
  
  If InfoReadIdx(0) = 0 Then InfoReadIdx(1) = 0
  If InfoReadIdx(1) = 0 Then InfoReadIdx(2) = 0
  
  Set InfoReadObj(0) = Choose(InfoReadIdx(0) + 1, oReaderNone, oReaderID3v1, oReaderID3v2, oReaderAPETAG, oReaderWMPTAG)
  Set InfoReadObj(1) = Choose(InfoReadIdx(1) + 1, oReaderNone, oReaderID3v1, oReaderID3v2, oReaderAPETAG, oReaderWMPTAG)
  Set InfoReadObj(2) = Choose(InfoReadIdx(2) + 1, oReaderNone, oReaderID3v1, oReaderID3v2, oReaderAPETAG, oReaderWMPTAG)
  
  frmMain.uifCopying.CopySpeed = sldByte.Value
  InheritInfo = CBool(chkInherit.Value)
  NoDuration = CBool(chkNoDuration.Value)
  NoTime = CBool(chkNoTime.Value)
End Sub

