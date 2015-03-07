VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MsComCtl.ocx"
Begin VB.Form dlgSelSortKey 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "选择排序关键字"
   ClientHeight    =   4935
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6735
   Icon            =   "dlgSelSortKey.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4935
   ScaleWidth      =   6735
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '屏幕中心
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin VB.CheckBox chkOrderSelection 
      Caption         =   "只排序所选项目(&S)"
      Height          =   255
      Left            =   3120
      TabIndex        =   18
      Top             =   4080
      Width           =   1935
   End
   Begin MSComctlLib.ImageCombo icbOrder 
      Height          =   315
      Left            =   1320
      TabIndex        =   17
      Top             =   4050
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Locked          =   -1  'True
   End
   Begin VB.CommandButton cmdRandom 
      Caption         =   "随机排序(&R)"
      Height          =   375
      Left            =   2760
      TabIndex        =   20
      Top             =   4440
      Width           =   1215
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "排序"
      Default         =   -1  'True
      Height          =   375
      Left            =   4080
      TabIndex        =   21
      Top             =   4440
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   5400
      TabIndex        =   22
      Top             =   4440
      Width           =   1215
   End
   Begin VB.CommandButton cmdPreset 
      Caption         =   "设置预设排序关键字(&O)..."
      Height          =   375
      Left            =   120
      TabIndex        =   19
      Top             =   4440
      Width           =   2415
   End
   Begin VB.TextBox txtKey 
      Height          =   735
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   360
      Width           =   4935
   End
   Begin VB.Frame fraVariable 
      Caption         =   "插入歌曲变量"
      ForeColor       =   &H00D54600&
      Height          =   4215
      Left            =   5160
      TabIndex        =   4
      Top             =   120
      Width           =   1455
      Begin VB.PictureBox picInsert 
         BorderStyle     =   0  'None
         Height          =   3885
         Left            =   120
         ScaleHeight     =   3885
         ScaleWidth      =   1215
         TabIndex        =   5
         TabStop         =   0   'False
         Top             =   240
         Width           =   1215
         Begin VB.CommandButton cmdVariable 
            Caption         =   "文件名(&F)"
            Height          =   375
            Index           =   0
            Left            =   0
            TabIndex        =   6
            Tag             =   "%FILENAME%"
            Top             =   0
            Width           =   1215
         End
         Begin VB.CommandButton cmdVariable 
            Caption         =   "艺术家(&A)"
            Height          =   375
            Index           =   1
            Left            =   0
            TabIndex        =   7
            Tag             =   "%ARTIST%"
            Top             =   390
            Width           =   1215
         End
         Begin VB.CommandButton cmdVariable 
            Caption         =   "专辑(&L)"
            Height          =   375
            Index           =   2
            Left            =   0
            TabIndex        =   8
            Tag             =   "%ALBUM%"
            Top             =   780
            Width           =   1215
         End
         Begin VB.CommandButton cmdVariable 
            Caption         =   "标题(&T)"
            Height          =   375
            Index           =   3
            Left            =   0
            TabIndex        =   9
            Tag             =   "%TITLE%"
            Top             =   1170
            Width           =   1215
         End
         Begin VB.CommandButton cmdVariable 
            Caption         =   "流派(&G)"
            Height          =   375
            Index           =   4
            Left            =   0
            TabIndex        =   10
            Tag             =   "%GENRE%"
            Top             =   1560
            Width           =   1215
         End
         Begin VB.CommandButton cmdVariable 
            Caption         =   "长度(&H)"
            Height          =   375
            Index           =   5
            Left            =   0
            TabIndex        =   11
            Tag             =   "%LENGTH%"
            Top             =   1950
            Width           =   1215
         End
         Begin VB.CommandButton cmdVariable 
            Caption         =   "音轨序号(&N)"
            Height          =   375
            Index           =   6
            Left            =   0
            TabIndex        =   12
            Tag             =   "%TRACKNUMBER%"
            Top             =   2340
            Width           =   1215
         End
         Begin VB.CommandButton cmdVariable 
            Caption         =   "年代(&Y)"
            Height          =   375
            Index           =   7
            Left            =   0
            TabIndex        =   13
            Tag             =   "%YEAR%"
            Top             =   2730
            Width           =   1215
         End
         Begin VB.CommandButton cmdVariable 
            Caption         =   "文件大小(&I)"
            Height          =   375
            Index           =   8
            Left            =   0
            TabIndex        =   14
            Tag             =   "%FILESIZE%"
            Top             =   3120
            Width           =   1215
         End
         Begin VB.CommandButton cmdVariable 
            Caption         =   "创建时间(&M)"
            Height          =   375
            Index           =   9
            Left            =   0
            TabIndex        =   15
            Tag             =   "%DATECREATED%"
            Top             =   3510
            Width           =   1215
         End
      End
   End
   Begin MSComctlLib.ListView lvwPreset 
      Height          =   2535
      Left            =   120
      TabIndex        =   3
      Top             =   1440
      Width           =   4935
      _ExtentX        =   8705
      _ExtentY        =   4471
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      SmallIcons      =   "iltPreset"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      NumItems        =   2
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "编号"
         Object.Width           =   979
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "排序关键字"
         Object.Width           =   7091
      EndProperty
   End
   Begin MSComctlLib.ImageList iltPreset 
      Left            =   2400
      Top             =   4320
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
            Picture         =   "dlgSelSortKey.frx":058A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgSelSortKey.frx":0B24
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Label lblOrder 
      AutoSize        =   -1  'True
      Caption         =   "排序顺序(&R):"
      Height          =   180
      Left            =   120
      TabIndex        =   16
      Top             =   4117
      Width           =   1080
   End
   Begin VB.Label lblPreset 
      AutoSize        =   -1  'True
      Caption         =   "预设(&P):"
      Height          =   180
      Left            =   120
      TabIndex        =   2
      Top             =   1200
      Width           =   720
   End
   Begin VB.Label lblKey 
      AutoSize        =   -1  'True
      Caption         =   "排序关键字(&K):"
      Height          =   180
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1260
   End
End
Attribute VB_Name = "dlgSelSortKey"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCancel_Click()
  Unload Me
End Sub

Private Sub cmdOK_Click()
  Dim sSortKey As String
  Dim CurrentIndex As Long
  Dim CurrentKey As String
  Dim SelIdx As New VBA.Collection
  Dim N As MSComctlLib.ListItem
  
  sSortKey = txtKey.Text
  
  '调整排序顺序
  Set N = lvwPreset.findItem(sSortKey, lvwSubItem)
  
  If Not N Is Nothing Then
    CurrentIndex = N.Index
    CurrentKey = SortKeySet(CurrentIndex)
    SortKeySet.Remove CurrentIndex
    
    If CurrentIndex > SortKeySet.Count Then
      SortKeySet.Add CurrentKey, , 1
    Else
      SortKeySet.Add CurrentKey, , 1
    End If
  
    For i = 1 To SortKeySet.Count
      frmMain.tbrDefault.Buttons("SORTLIST").ButtonMenus(i + 2).Text = SortKeySet(i)
    Next i
  End If

  '排序
  LastAscending = icbOrder.ComboItems(1).Selected
  LastSortKey = sSortKey
  
  If chkOrderSelection.Value = 0 Then
    frmMain.SortList sSortKey, LastAscending
  Else
    For i = 1 To frmMain.lvwList.ListItems.Count
      If frmMain.lvwList.ListItems(i).Selected Then
        SelIdx.Add i
      End If
    Next i
    
    frmMain.SortList sSortKey, LastAscending, SelIdx
  End If
  Unload Me
End Sub

Private Sub cmdPreset_Click()
  dlgOption.ShowPage 3
  RefreshPreset
End Sub

Private Sub cmdRandom_Click()
  Unload Me
  frmMain.SortListRandom
End Sub

Private Sub cmdVariable_Click(Index As Integer)
  '插入变量
  Dim VarTxt As String
  Dim BTxt As String
  Dim ATxt As String
  
  VarTxt = txtKey.Text
  
  BTxt = Left(VarTxt, txtKey.SelStart)
  ATxt = Right(VarTxt, Len(VarTxt) - txtKey.SelStart - txtKey.SelLength)
  
  txtKey.Text = BTxt & cmdVariable(Index).Tag & Space(1) & ATxt
  txtKey.SelStart = Len(BTxt) + Len(cmdVariable(Index).Tag) + 1
  
  SetObjectFocus txtKey.hWnd
End Sub

Private Sub Form_Load()
  SetHeaderStyle lvwPreset.hWnd
  RefreshPreset
  lvwPreset.ListItems(1).Selected = True
  lvwPreset_ItemClick lvwPreset.ListItems(1)
  icbOrder.ImageList = iltPreset
  icbOrder.ComboItems.Add , , "升序", 1
  icbOrder.ComboItems.Add , , "降序", 2
  icbOrder.ComboItems(1).Selected = True
End Sub

Private Sub RefreshPreset()
  '刷新预设列表
  Dim N As MSComctlLib.ListItem
  
  lvwPreset.ListItems.Clear
  
  For i = 1 To SortKeySet.Count
    Set N = lvwPreset.ListItems.Add(, , i, , 1)
    N.SubItems(1) = SortKeySet(i)
    N.ToolTipText = SortKeySet(i)
  Next i
End Sub
Private Sub lvwPreset_ItemClick(ByVal Item As MSComctlLib.ListItem)
  txtKey.Text = Item.SubItems(1)
End Sub

Private Sub txtKey_Validate(Cancel As Boolean)
  txtKey.Text = Replace(txtKey.Text, vbCrLf, "")
End Sub
