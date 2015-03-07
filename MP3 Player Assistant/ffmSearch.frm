VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MsComCtl.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form ffmSearch 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "搜索结果"
   ClientHeight    =   5265
   ClientLeft      =   165
   ClientTop       =   690
   ClientWidth     =   6435
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5265
   ScaleWidth      =   6435
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  '窗口缺省
   Begin MSComDlg.CommonDialog CDG 
      Left            =   4440
      Top             =   2160
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Timer tmrSelEvent 
      Interval        =   100
      Left            =   4440
      Top             =   2640
   End
   Begin MSComctlLib.ImageList iltSearch 
      Left            =   4440
      Top             =   960
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   16
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":0000
            Key             =   "IMG1"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":059A
            Key             =   "IMG2"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":0B34
            Key             =   "IMG3"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":10CE
            Key             =   "IMG4"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":1668
            Key             =   "IMG5"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":1C02
            Key             =   "IMG6"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":219C
            Key             =   "IMG7"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":2736
            Key             =   "IMG8"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":2CD0
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":326A
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":3804
            Key             =   "IMG9"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":3D9E
            Key             =   "IMG10"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":4338
            Key             =   "IMG11"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":48D2
            Key             =   "IMG12"
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":4E6C
            Key             =   "IMG13"
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":5406
            Key             =   "IMG14"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvwResult 
      Height          =   2730
      Left            =   0
      TabIndex        =   1
      Top             =   360
      Width           =   3285
      _ExtentX        =   5794
      _ExtentY        =   4815
      View            =   3
      LabelEdit       =   1
      Sorted          =   -1  'True
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      OLEDragMode     =   1
      OLEDropMode     =   1
      Checkboxes      =   -1  'True
      FullRowSelect   =   -1  'True
      _Version        =   393217
      ColHdrIcons     =   "iltColHeader"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      OLEDragMode     =   1
      OLEDropMode     =   1
      NumItems        =   0
   End
   Begin MSComctlLib.StatusBar stbResult 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   0
      Top             =   4950
      Width           =   6435
      _ExtentX        =   11351
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   2
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5733
            MinWidth        =   5733
            Picture         =   "ffmSearch.frx":59A0
            Text            =   "选择了 0 个文件(0 字节)"
            TextSave        =   "选择了 0 个文件(0 字节)"
            Object.ToolTipText     =   "选择的项目"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5733
            MinWidth        =   5733
            Picture         =   "ffmSearch.frx":5F3A
            Text            =   "标记了 0 个文件(0 字节)"
            TextSave        =   "标记了 0 个文件(0 字节)"
            Object.ToolTipText     =   "标记的项目"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList iltColHeader 
      Left            =   4440
      Top             =   1560
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   12
      ImageHeight     =   12
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":64D4
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ffmSearch.frx":6710
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar tbrSearch 
      Align           =   1  'Align Top
      Height          =   360
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   6435
      _ExtentX        =   11351
      _ExtentY        =   635
      ButtonWidth     =   609
      ButtonHeight    =   582
      Wrappable       =   0   'False
      Appearance      =   1
      Style           =   1
      ImageList       =   "iltSearch"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   22
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "SaveList"
            Object.ToolTipText     =   "保存列表"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Refresh"
            Object.ToolTipText     =   "刷新"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Locate"
            Object.ToolTipText     =   "自动定位"
            ImageIndex      =   3
            Style           =   1
            Value           =   1
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "SelAllItems"
            Object.ToolTipText     =   "全选"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "SelReverse"
            Object.ToolTipText     =   "反选"
            ImageIndex      =   5
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MarkSel"
            Object.ToolTipText     =   "标记选择"
            ImageIndex      =   6
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MarkAll"
            Object.ToolTipText     =   "全部标记"
            ImageIndex      =   7
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MarkCancel"
            Object.ToolTipText     =   "全部取消标记"
            ImageIndex      =   8
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Key             =   "AddSel"
            Object.ToolTipText     =   "添加选择的项目"
            ImageIndex      =   9
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "AddMark"
            Object.ToolTipText     =   "添加标记的项目"
            ImageIndex      =   10
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "AddAll"
            Object.ToolTipText     =   "添加所有项目"
            ImageIndex      =   11
         EndProperty
         BeginProperty Button16 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button17 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Key             =   "Play"
            Object.ToolTipText     =   "播放"
            ImageIndex      =   12
         EndProperty
         BeginProperty Button18 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Key             =   "Pause"
            Object.ToolTipText     =   "暂停"
            ImageIndex      =   13
         EndProperty
         BeginProperty Button19 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Key             =   "Stop"
            Object.ToolTipText     =   "停止"
            ImageIndex      =   14
         EndProperty
         BeginProperty Button20 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button21 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Key             =   "Open"
            Object.ToolTipText     =   "打开"
            ImageIndex      =   15
         EndProperty
         BeginProperty Button22 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Key             =   "Property"
            Object.ToolTipText     =   "属性"
            ImageIndex      =   16
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuFile 
      Caption         =   "文件(&F)"
      Begin VB.Menu mnuSaveList 
         Caption         =   "保存列表(&S)..."
         Shortcut        =   ^S
      End
      Begin VB.Menu mnuBlank1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPlay 
         Caption         =   "播放(&P)"
         Shortcut        =   {F9}
      End
      Begin VB.Menu mnuOpen 
         Caption         =   "打开(&O)...	Ctrl+Enter"
      End
      Begin VB.Menu mnuPropery 
         Caption         =   "属性(&P)...	Alt+Enter"
      End
      Begin VB.Menu mnuBlank2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuClose 
         Caption         =   "关闭(&C)	Alt+F4"
      End
   End
   Begin VB.Menu mnuEdit 
      Caption         =   "编辑(&E)"
      Begin VB.Menu mnuSelAll 
         Caption         =   "全选(&S)"
         Shortcut        =   ^A
      End
      Begin VB.Menu mnuSelRev 
         Caption         =   "反选(&R)"
         Shortcut        =   ^I
      End
      Begin VB.Menu mnuBlank3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuMarkSel 
         Caption         =   "标记高亮(&M)"
         Shortcut        =   ^M
      End
      Begin VB.Menu mnuMarkCancel 
         Caption         =   "取消标记(&A)"
         Shortcut        =   ^N
      End
      Begin VB.Menu mnuMarkAll 
         Caption         =   "全部标记(&L)"
         Shortcut        =   ^R
      End
      Begin VB.Menu mnuBlank4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAddSel 
         Caption         =   "添加选择项目(&C)"
         Shortcut        =   {F2}
      End
      Begin VB.Menu mnuAddMark 
         Caption         =   "添加标记项目(&D)"
         Shortcut        =   ^{F2}
      End
      Begin VB.Menu mnuAddAll 
         Caption         =   "添加所有项目(&T)"
         Shortcut        =   +^{F2}
      End
      Begin VB.Menu mnuBlank5 
         Caption         =   "-"
      End
      Begin VB.Menu mnuInsertSel 
         Caption         =   "插入选择项目(&I)"
      End
      Begin VB.Menu mnuInsertMark 
         Caption         =   "插入标记项目(&R)"
      End
      Begin VB.Menu mnuInsertAll 
         Caption         =   "插入所有项目(&E)"
      End
   End
   Begin VB.Menu mnuSerach 
      Caption         =   "搜索(&S)"
      Begin VB.Menu mnuResearch 
         Caption         =   "重新搜索(&R)"
         Shortcut        =   {F5}
      End
      Begin VB.Menu mnuLocate 
         Caption         =   "自动定位(&L)"
         Checked         =   -1  'True
         Shortcut        =   ^L
      End
   End
   Begin VB.Menu popmenu 
      Caption         =   "POPMENU"
      Begin VB.Menu popPlay 
         Caption         =   "播放(&Y)"
      End
      Begin VB.Menu popProperty 
         Caption         =   "属性(&P)..."
      End
      Begin VB.Menu popOpen 
         Caption         =   "以关联打开(&O)..."
      End
      Begin VB.Menu popblank1 
         Caption         =   "-"
      End
      Begin VB.Menu popAllSel 
         Caption         =   "添加所选项目(&S)"
      End
      Begin VB.Menu popAddMark 
         Caption         =   "添加标记项目(&M)"
      End
      Begin VB.Menu popAddAll 
         Caption         =   "添加所有项目(&A)"
      End
      Begin VB.Menu popblank2 
         Caption         =   "-"
      End
      Begin VB.Menu popInsertSel 
         Caption         =   "插入所选项目(&I)"
      End
      Begin VB.Menu popInsertMark 
         Caption         =   "插入标记项目(&R)"
      End
      Begin VB.Menu popInsertAll 
         Caption         =   "插入所有项目(&L)"
      End
   End
End
Attribute VB_Name = "ffmSearch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function SetWindowWord Lib "user32" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal wNewWord As Long) As Long
Private Declare Function SetWindowLong Lib "user32.dll" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private lngOrigParenthWnd As Long

'获得窗口位置
Private Declare Function GetWindowRect Lib "user32.dll" (ByVal hWnd As Long, ByRef lpRect As RECT) As Long
Private Type RECT
  Left As Long
  Top As Long
  Right As Long
  Bottom As Long
End Type

'不活动显示
Private Declare Function ShowWindowAPI Lib "user32.dll" Alias "ShowWindow" (ByVal hWnd As Long, ByVal nCmdShow As Long) As Long

Private Const SW_HIDE As Long = 0
Private Const SW_MAXIMIZE As Long = 3
Private Const SW_MINIMIZE As Long = 6
Private Const SW_SHOWNOACTIVATE As Long = 4

'位置
Private RLeft As Long
Private RTop As Long
Private RWidth As Long
Private RHeight As Long

Public RWLoaded As Boolean
Private LastKey As String
Private ShowSearch As Boolean
Private cFileSize As New VBA.Collection
Private SelectionChanged As Boolean

Private Sub Form_Initialize()
  '设置初始值
  RLeft = 105
  RTop = 105
  RWidth = 6210
  RHeight = 5910
End Sub

Private Sub Form_Load()
  '设置初始位置
  Dim rLVW As RECT
  
  r = GetWindowRect(frmMain.lvwList.hWnd, rLVW)
  
  If r Then
    RTop = Screen.TwipsPerPixelY * rLVW.Top
    RWidth = Screen.TwipsPerPixelX * (rLVW.Right - rLVW.Left) / 2
    RHeight = Screen.TwipsPerPixelY * (rLVW.Bottom - rLVW.Top)
    RLeft = Screen.TwipsPerPixelX * rLVW.Left + RWidth
  End If
  
  lngOrigParenthWnd = SetWindowLong(Me.hWnd, -8, frmMain.hWnd)
  Me.Move RLeft, RTop, RWidth, RHeight
  
  RWLoaded = True
  popmenu.Visible = False
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If UnloadMode = 0 Then
    ShowWindow False
    frmMain.mnuResult.Checked = False
    frmMain.tbrSearch.Buttons(1).Value = tbrUnpressed
    Cancel = 1
  Else
    SetWindowLong Me.hWnd, -8, lngOrigParenthWnd
    Cancel = 0
  End If
End Sub

Private Sub Form_Resize()
  lvwResult.Move Me.ScaleLeft, Me.ScaleTop + tbrSearch.Height, Me.ScaleWidth, Me.ScaleHeight - tbrSearch.Height - stbResult.Height
  stbResult.Panels(1).Width = (Me.ScaleWidth - 150) / 2
  stbResult.Panels(2).Width = (Me.ScaleWidth - 150) / 2
End Sub

Public Sub ShowWindow(ByVal Visible As Boolean, Optional Focused As Boolean = False)
  If RWLoaded = False Then
    Form_Load
  End If

  If Visible Then
    Me.Move RLeft, RTop, RWidth, RHeight
    tmrSelEvent.Enabled = True
    
    If Focused Then
      Show
    Else
      ShowWindowAPI Me.hWnd, SW_SHOWNOACTIVATE
    End If
    
    '表示隐藏的时候需要搜索而没有搜索，此时显示的时候开始搜索
    If ShowSearch Then
      Research
      ShowSearch = False
    End If
  Else
    tmrSelEvent.Enabled = False
    RLeft = Me.Left
    RTop = Me.Top
    RWidth = Me.Width
    RHeight = Me.Height
    Hide
  End If
End Sub

Private Sub lvwResult_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
  '重新排序
  Dim PreSortKey As Integer
  Dim NewSortKey As Integer
  Dim SortOrder As Integer
  
  PreSortKey = lvwResult.SortKey
  NewSortKey = ColumnHeader.Index - 1
  
  If PreSortKey = NewSortKey Then
    SortOrder = Choose(lvwResult.SortOrder + 1, 1, 0)
  Else
    SortOrder = lvwResult.SortOrder
  End If
   
  SortListView lvwResult, NewSortKey, SortOrder
End Sub

Private Sub lvwResult_DblClick()
  '打开文件
  If lvwResult.selectedItem Is Nothing Then Exit Sub
  
  Select Case UCase(FS.GetExtensionName(lvwResult.selectedItem.Tag))
  Case "MP3", "WMA"
    mnuPlay_Click
  Case Else
    mnuOpen_Click
  End Select
End Sub

Private Sub lvwResult_ItemCheck(ByVal Item As MSComctlLib.ListItem)
  '统计信息
  Dim TotalSize As Double
  Dim TotalCount As Long
  
  For i = 1 To lvwResult.ListItems.Count
    If lvwResult.ListItems(i).Checked Then
      TotalCount = TotalCount + 1
      TotalSize = TotalSize + cFileSize(i)
    End If
  Next i
  
  stbResult.Panels(2).Text = "标记了 " & TotalCount & " 个文件(" & DisplaySize(TotalSize) & ")"
End Sub

Private Sub lvwResult_ItemClick(ByVal Item As MSComctlLib.ListItem)
  SelectionChanged = True
End Sub

Private Sub lvwResult_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyReturn Then
    If Shift = vbAltMask Then
      'Alt+Enter
      mnuPropery_Click
    ElseIf Shift = vbCtrlMask Then
      mnuOpen_Click
    ElseIf Shift = 0 Then
      lvwResult_DblClick
    End If
  End If
End Sub

Private Sub lvwResult_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If (Shift = 0) And (Button = 2) Then PopupMenu popmenu
End Sub

Private Sub lvwResult_OLESetData(Data As MSComctlLib.DataObject, DataFormat As Integer)
  Data.SetData , 15
End Sub

Private Sub lvwResult_OLEStartDrag(Data As MSComctlLib.DataObject, AllowedEffects As Long)
  '设置托放
  AllowedEffects = vbDropEffectCopy

  For i = 1 To lvwResult.ListItems.Count
    If lvwResult.ListItems(i).Selected = True Then
      Data.Files.Add lvwResult.ListItems(i).Tag
    End If
  Next i
  
  Data.SetData , 15
  frmMain.DragSender = "lvwResult"
End Sub

Private Sub mnuAddAll_Click()
  '添加文件
  Dim nAddIndex As New VBA.Collection
  
  For i = 1 To lvwResult.ListItems.Count
    nAddIndex.Add Val(lvwResult.ListItems(i).Text)
  Next i
  
  Call frmMain.AddFileItems(nAddIndex)
End Sub

Private Sub mnuAddMark_Click()
  '添加文件
  Dim nAddIndex As New VBA.Collection
  
  For i = 1 To lvwResult.ListItems.Count
    If lvwResult.ListItems(i).Checked Then
      nAddIndex.Add Val(lvwResult.ListItems(i).Text)
    End If
  Next i
  
  Call frmMain.AddFileItems(nAddIndex)
End Sub

Private Sub mnuAddSel_Click()
  '添加文件
  Dim nAddIndex As New VBA.Collection
  
  For i = 1 To lvwResult.ListItems.Count
    If lvwResult.ListItems(i).Selected Then
      nAddIndex.Add Val(lvwResult.ListItems(i).Text)
    End If
  Next i
  
  Call frmMain.AddFileItems(nAddIndex)
End Sub

Private Sub mnuClose_Click()
  Form_QueryUnload 1, 0
End Sub

Public Sub UpdateHeader(ByVal LVW As MSComctlLib.ListView)
  '更新表头
  lvwResult.ListItems.Clear
  lvwResult.ColumnHeaders.Clear
  lvwResult.SmallIcons = LVW.SmallIcons
  
  If LVW.ColumnHeaders.Count = 0 Then Exit Sub
  
  For i = 1 To LVW.ColumnHeaders.Count
    lvwResult.ColumnHeaders.Add , , LVW.ColumnHeaders(i).Text, LVW.ColumnHeaders(i).Width, LVW.ColumnHeaders(i).Alignment
  Next
  
  SortListView lvwResult, 0, lvwAscending
End Sub

Public Sub Search(ByVal LVW As MSComctlLib.ListView, SearchKey As String)
  '搜索
  Dim sSpc As String
  Dim sNum As String
  Dim iOri As MSComctlLib.ListItem
  Dim iCpy As MSComctlLib.ListItem
  Dim cColSrh As New VBA.Collection
  Dim lColNum As Long
  Dim x As Long
  
  lvwResult.ListItems.Clear
  SearchKey = Trim(SearchKey)
  LastKey = SearchKey
  Set cFileSize = New VBA.Collection
  
  If Len(SearchKey) = 0 Then
    Me.Caption = "搜索结果 - 0 个项目已找到"
    SelectionChanged = True
    Exit Sub
  End If
  
  '空格
  sSpc = Space(Len(CStr(LVW.ListItems.Count)))
  
  '开始搜索
  Me.MousePointer = 11
  frmMain.MousePointer = 13
  
  '设置应该搜索的栏
  For i = 2 To LVW.ColumnHeaders.Count
    If LVW.ColumnHeaders(i).Tag = "SEARCH_FIELD" Then
      cColSrh.Add i - 1
    End If
  Next i
  
  '逐项搜索
  If frmMain.ActivePage = 3 Then
    lColNum = LVW.ColumnHeaders.Count
    Set lvwResult.SmallIcons = LVW.SmallIcons
    
    For i = 1 To LVW.ListItems.Count
      Set iOri = LVW.ListItems(i)
      
      For j = 1 To cColSrh.Count
        If InStr(1, iOri.SubItems(cColSrh(j)), SearchKey, vbTextCompare) Then
          '添加项目
          Let sNum = sSpc
          RSet sNum = i
          
          Set iCpy = lvwResult.ListItems.Add(, , sNum)
          iCpy.SmallIcon = iOri.SmallIcon
          iCpy.Tag = iOri.Key
          cFileSize.Add CDbl(frmMain.lvwFavourite.ListItems(i).Tag)
          
          For x = 1 To lColNum - 1
            iCpy.SubItems(x) = iOri.SubItems(x)
          Next x
          Exit For
        End If
      Next j
    Next i
  ElseIf frmMain.ActivePage = 4 Then
    lColNum = LVW.ColumnHeaders.Count
    Set lvwResult.SmallIcons = LVW.SmallIcons
    
    For i = 1 To LVW.ListItems.Count
      Set iOri = LVW.ListItems(i)
      
      For j = 1 To cColSrh.Count
        If InStr(1, iOri.SubItems(cColSrh(j)), SearchKey, vbTextCompare) Then
          '添加项目
          Let sNum = sSpc
          RSet sNum = i
          
          Set iCpy = lvwResult.ListItems.Add(, , sNum)
          iCpy.SmallIcon = iOri.SmallIcon
          iCpy.Tag = iOri.Tag
          cFileSize.Add frmMain.GetAppFileSize(i)
          
          For x = 1 To lColNum - 1
            iCpy.SubItems(x) = iOri.SubItems(x)
          Next x
          Exit For
        End If
      Next j
    Next i
  End If
  
  Me.MousePointer = 0
  frmMain.MousePointer = 0
  Me.Caption = "搜索结果 - " & lvwResult.ListItems.Count & " 个项目已找到"
  SelectionChanged = True
End Sub

Public Sub Research()
  '重新搜索
  If Me.Visible Then
    If frmMain.ActivePage = 3 Then
      Search frmMain.lvwFavourite, LastKey
    ElseIf frmMain.ActivePage = 4 Then
      Search frmMain.lvwProgram, LastKey
    End If
  Else
    ShowSearch = True
  End If
End Sub

Private Sub mnuInsertAll_Click()
  '添加文件
  Dim nAddIndex As New VBA.Collection
  
  For i = 1 To lvwResult.ListItems.Count
    nAddIndex.Add Val(lvwResult.ListItems(i).Text)
  Next i
  
  If frmMain.lvwList.selectedItem Is Nothing Then
    Call frmMain.AddFileItems(nAddIndex)
  Else
    Call frmMain.AddFileItems(nAddIndex, frmMain.lvwList.selectedItem.Index)
  End If

End Sub

Private Sub mnuInsertMark_Click()
  '添加文件
  Dim nAddIndex As New VBA.Collection
  
  For i = 1 To lvwResult.ListItems.Count
    If lvwResult.ListItems(i).Checked Then
      nAddIndex.Add Val(lvwResult.ListItems(i).Text)
    End If
  Next i
  
  If frmMain.lvwList.selectedItem Is Nothing Then
    Call frmMain.AddFileItems(nAddIndex)
  Else
    Call frmMain.AddFileItems(nAddIndex, frmMain.lvwList.selectedItem.Index)
  End If
End Sub

Private Sub mnuInsertSel_Click()
  '添加文件
  Dim nAddIndex As New VBA.Collection
  
  For i = 1 To lvwResult.ListItems.Count
    If lvwResult.ListItems(i).Selected Then
      nAddIndex.Add Val(lvwResult.ListItems(i).Text)
    End If
  Next i
  
  If frmMain.lvwList.selectedItem Is Nothing Then
    Call frmMain.AddFileItems(nAddIndex)
  Else
    Call frmMain.AddFileItems(nAddIndex, frmMain.lvwList.selectedItem.Index)
  End If
End Sub

Private Sub mnuLocate_Click()
  '设置自动定位
  mnuLocate.Checked = Not mnuLocate.Checked
  tbrSearch.Buttons("Locate").Value = Abs(CLng(mnuLocate.Checked))
End Sub

Private Sub mnuMarkAll_Click()
  For i = 1 To lvwResult.ListItems.Count
    lvwResult.ListItems(i).Checked = True
  Next i
End Sub

Private Sub mnuMarkCancel_Click()
  For i = 1 To lvwResult.ListItems.Count
    lvwResult.ListItems(i).Checked = False
  Next i
End Sub

Private Sub mnuMarkSel_Click()
  '全选
  For i = 1 To lvwResult.ListItems.Count
    If lvwResult.ListItems(i).Selected Then
      lvwResult.ListItems(i).Checked = True
    End If
  Next i
End Sub

Private Sub mnuOpen_Click()
  If lvwResult.selectedItem Is Nothing Then Exit Sub
  ShellOpera.shelldoc lvwResult.selectedItem.Tag
End Sub

Private Sub mnuPlay_Click()
  '播放文件
  If lvwResult.selectedItem Is Nothing Then Exit Sub
  
  Select Case UCase(FS.GetExtensionName(lvwResult.selectedItem.Tag))
  Case "MP3", "WMA"
    '播放文件
    If FS.FileExists(lvwResult.selectedItem.Tag) Then
      frmMain.PlayMusicFile lvwResult.selectedItem.Tag
    End If
  End Select
End Sub

Private Sub mnuPropery_Click()
  If lvwResult.selectedItem Is Nothing Then Exit Sub
  dlgProperty.ShowPropery lvwResult.selectedItem.Tag
End Sub

Private Sub mnuResearch_Click()
  Research
End Sub

Private Sub mnuSaveList_Click()
  '保存播放列表
  With CDG
    .CancelError = True
    .DefaultExt = "M3U"
    .DialogTitle = "将列表保存为播放列表"
    .Filter = "M3U - MP3 播放清单|*.m3u"
    .flags = cdlOFNExplorer Or cdlOFNExtensionDifferent Or cdlOFNHideReadOnly Or cdlOFNLongNames Or cdlOFNNoDereferenceLinks Or cdlOFNNoReadOnlyReturn Or cdlOFNNoValidate Or cdlOFNOverwritePrompt
    On Error GoTo ExitSub
    .ShowSave
    On Error GoTo 0
  End With
  
  '写入文件
  Dim F As Integer
  
  On Error GoTo happeneanerror
  F = FreeFile
  Open CDG.FileName For Output Access Write As F
  
  For i = 1 To lvwResult.ListItems.Count
    Print #F, lvwResult.ListItems(i).Tag
  Next i
  
  Close #F
  On Error GoTo 0
  
  Exit Sub
happeneanerror:
  MsgBox "[" & Err.Number & "]" & Err.Description, vbCritical
ExitSub:
End Sub

Private Sub mnuSelAll_Click()
  '全选
  For i = 1 To lvwResult.ListItems.Count
    lvwResult.ListItems(i).Selected = True
  Next i
End Sub

Private Sub mnuSelRev_Click()
  '全选
  For i = 1 To lvwResult.ListItems.Count
    lvwResult.ListItems(i).Selected = Not lvwResult.ListItems(i).Selected
  Next i
End Sub

Private Sub tbrSearch_ButtonClick(ByVal Button As MSComctlLib.Button)
  Select Case Button.Index
  Case 1: mnuSaveList_Click
  Case 3: Research
  Case 4: mnuLocate_Click
  Case 6: mnuSelAll_Click
  Case 7: mnuSelRev_Click
  Case 9: mnuMarkSel_Click
  Case 10: mnuMarkAll_Click
  Case 11: mnuMarkCancel_Click
  Case 13: mnuAddSel_Click
  Case 14: mnuAddMark_Click
  Case 15: mnuAddAll_Click
  Case 17: mnuPlay_Click
  Case 18: frmMain.mnuPause_Click
  Case 19: frmMain.mnuStop_Click
  Case 21: mnuOpen_Click
  Case 22: mnuPropery_Click
  End Select
End Sub

Private Sub tmrSelEvent_Timer()
  '刷新内容
  Dim TotalSize As Double
  Dim TotalCount As Long
  Dim SelIdx As Long
  Dim Item As MSComctlLib.ListItem
  
  If SelectionChanged Then
    '自动选择
    Set Item = lvwResult.selectedItem
    
    If (mnuLocate.Checked) And (Not (Item Is Nothing)) Then
      SelIdx = Val(Item.Text)
      
      Select Case frmMain.ActivePage
      Case 3:
        If SelIdx <= frmMain.lvwFavourite.ListItems.Count Then
          frmMain.lvwFavourite.MultiSelect = False
          Set frmMain.lvwFavourite.selectedItem = frmMain.lvwFavourite.ListItems(SelIdx)
          frmMain.lvwFavourite.MultiSelect = True
          frmMain.lvwFavourite.ListItems(SelIdx).EnsureVisible
        End If
      Case 4:
        If SelIdx <= frmMain.lvwProgram.ListItems.Count Then
          frmMain.lvwProgram.MultiSelect = False
          Set frmMain.lvwProgram.selectedItem = frmMain.lvwProgram.ListItems(SelIdx)
          frmMain.lvwProgram.MultiSelect = True
          frmMain.lvwProgram.ListItems(SelIdx).EnsureVisible
        End If
      End Select
    End If
    
    '更新状态栏
    For i = 1 To lvwResult.ListItems.Count
      If lvwResult.ListItems(i).Selected Then
        TotalCount = TotalCount + 1
        TotalSize = TotalSize + cFileSize(i)
      End If
    Next i
    
    SelectionChanged = False
    stbResult.Panels(1).Text = "选择了 " & TotalCount & " 个文件(" & DisplaySize(TotalSize) & ")"
    
    '设置选择文件
    If Item Is Nothing Then
      mnuPlay.Enabled = False
      mnuOpen.Enabled = False
      mnuPropery.Enabled = False
      mnuAddSel.Enabled = False
      
      tbrSearch.Buttons(13).Enabled = False
      tbrSearch.Buttons(17).Enabled = False
      tbrSearch.Buttons(21).Enabled = False
      tbrSearch.Buttons(22).Enabled = False
    Else
      Select Case UCase(FS.GetExtensionName(Item.Tag))
      Case "MP3", "WMA"
        mnuPlay.Enabled = True
        tbrSearch.Buttons(17).Enabled = True
      Case Else
        mnuPlay.Enabled = False
        tbrSearch.Buttons(17).Enabled = False
      End Select
      
      mnuOpen.Enabled = True
      mnuPropery.Enabled = True
      mnuAddSel.Enabled = True
      tbrSearch.Buttons(13).Enabled = True
      tbrSearch.Buttons(21).Enabled = True
      tbrSearch.Buttons(22).Enabled = True
    End If
  End If
End Sub

