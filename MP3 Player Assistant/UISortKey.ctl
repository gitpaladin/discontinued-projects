VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl UISortKey 
   ClientHeight    =   5055
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5655
   ScaleHeight     =   5055
   ScaleWidth      =   5655
   Begin MSComctlLib.ImageList iltListHeader 
      Left            =   4200
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   10
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UISortKey.ctx":0000
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UISortKey.ctx":059A
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UISortKey.ctx":0B34
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UISortKey.ctx":10CE
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UISortKey.ctx":1668
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UISortKey.ctx":1C02
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UISortKey.ctx":219C
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UISortKey.ctx":2736
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UISortKey.ctx":2CD0
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UISortKey.ctx":326A
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "清空(&C)"
      Height          =   375
      Left            =   2880
      TabIndex        =   9
      Top             =   4680
      Width           =   855
   End
   Begin VB.CommandButton cmdDel 
      Caption         =   "删除(&D)"
      Height          =   375
      Left            =   1920
      TabIndex        =   8
      Top             =   4680
      Width           =   855
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "添加(&A)"
      Height          =   375
      Left            =   0
      TabIndex        =   6
      Top             =   4680
      Width           =   855
   End
   Begin VB.CommandButton cmdMoveUp 
      Caption         =   "上移(&U)"
      Height          =   375
      Left            =   3840
      TabIndex        =   10
      Top             =   4680
      Width           =   855
   End
   Begin VB.CommandButton cmdMoveDown 
      Caption         =   "下移(&W)"
      Height          =   375
      Left            =   4800
      TabIndex        =   11
      Top             =   4680
      Width           =   855
   End
   Begin VB.CommandButton cmdEdit 
      Caption         =   "编辑(&E)"
      Height          =   375
      Left            =   960
      TabIndex        =   7
      Top             =   4680
      Width           =   855
   End
   Begin MSComctlLib.ImageCombo icbVariable 
      Height          =   315
      Left            =   1440
      TabIndex        =   5
      Top             =   4200
      Width           =   4215
      _ExtentX        =   7435
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Locked          =   -1  'True
      Text            =   "ImageCombo1"
      ImageList       =   "iltListHeader"
   End
   Begin VB.TextBox txtKey 
      Height          =   855
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   3
      Top             =   3240
      Width           =   5655
   End
   Begin MSComctlLib.ImageList iltPreset 
      Left            =   3600
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   1
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UISortKey.ctx":3804
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvwPreset 
      Height          =   2655
      Left            =   0
      TabIndex        =   1
      Top             =   240
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   4683
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
         Object.Width           =   8105
      EndProperty
   End
   Begin VB.Label lblVariable 
      AutoSize        =   -1  'True
      Caption         =   "插入歌曲变量(&L):"
      Height          =   180
      Left            =   0
      TabIndex        =   4
      Top             =   4260
      Width           =   1440
   End
   Begin VB.Label lblKey 
      AutoSize        =   -1  'True
      Caption         =   "排序关键字(&K):"
      Height          =   180
      Left            =   0
      TabIndex        =   2
      Top             =   3000
      Width           =   1260
   End
   Begin VB.Label lblPreset 
      AutoSize        =   -1  'True
      Caption         =   "排序关键字列表(&P):"
      Height          =   180
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1620
   End
End
Attribute VB_Name = "UISortKey"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


'注意！不要删除或修改下列被注释的行！
'MappingInfo=UserControl,UserControl,-1,Enabled
Public Property Get Enabled() As Boolean
  Enabled = UserControl.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  UserControl.Enabled() = New_Enabled
  PropertyChanged "Enabled"
End Property

Private Sub cmdAdd_Click()
  '添加一个项目
  Dim N As MSComctlLib.ListItem
  
  Set N = lvwPreset.ListItems.Add
  N.Text = N.Index
  N.SubItems(1) = txtKey.Text
  N.ToolTipText = txtKey.Text
  N.SmallIcon = 1
  N.EnsureVisible
  N.Selected = True
  
  cmdDel.Enabled = (lvwPreset.ListItems.Count > 1)
  cmdClear.Enabled = (lvwPreset.ListItems.Count > 1)
End Sub

Private Sub cmdClear_Click()
  For i = 2 To lvwPreset.ListItems.Count
    lvwPreset.ListItems.Remove 2
  Next i
  
  lvwPreset.ListItems(1).Selected = True
  lvwPreset_ItemClick lvwPreset.selectedItem
End Sub

Private Sub cmdDel_Click()
  Dim OldIdx As Long
  
  If lvwPreset.ListItems.Count < 2 Then cmdDel.Enabled = False: Exit Sub
  
  OldIdx = lvwPreset.selectedItem.Index
  
  lvwPreset.ListItems.Remove OldIdx
  
  If lvwPreset.ListItems.Count < OldIdx Then
    lvwPreset.ListItems(lvwPreset.ListItems.Count).Selected = True
  Else
    lvwPreset.ListItems(OldIdx).Selected = True
  End If
  
  For i = 1 To lvwPreset.ListItems.Count
    lvwPreset.ListItems(i).Text = i
  Next i
  
  lvwPreset_ItemClick lvwPreset.selectedItem
End Sub

Private Sub cmdEdit_Click()
  If lvwPreset.selectedItem Is Nothing Then Exit Sub
  
  lvwPreset.selectedItem.SubItems(1) = txtKey.Text
  lvwPreset.selectedItem.ToolTipText = txtKey.Text
End Sub

Private Sub cmdMoveDown_Click()
  '向下移动
  Dim Idx As Long
  Dim Ky As String
  Dim N As MSComctlLib.ListItem
  
  If lvwPreset.selectedItem Is Nothing Then Exit Sub
  If lvwPreset.selectedItem.Index = lvwPreset.ListItems.Count Then Exit Sub
  
  Idx = lvwPreset.selectedItem.Index
  Ky = lvwPreset.selectedItem.SubItems(1)
  
  lvwPreset.ListItems.Remove Idx
  
  Set N = lvwPreset.ListItems.Add(Idx + 1, , Idx + 1, , 1)
  N.SubItems(1) = Ky
  N.ToolTipText = Ky
  N.Selected = True
  
  lvwPreset.ListItems(Idx).Text = Idx
  lvwPreset_ItemClick N
End Sub

Private Sub cmdMoveUp_Click()
  '向上移动
  Dim Idx As Long
  Dim Ky As String
  Dim N As MSComctlLib.ListItem
  
  If lvwPreset.selectedItem Is Nothing Then Exit Sub
  If lvwPreset.selectedItem.Index = 1 Then Exit Sub
  
  Idx = lvwPreset.selectedItem.Index
  Ky = lvwPreset.selectedItem.SubItems(1)
  
  lvwPreset.ListItems.Remove Idx
  
  Set N = lvwPreset.ListItems.Add(Idx - 1, , Idx - 1, , 1)
  N.SubItems(1) = Ky
  N.ToolTipText = Ky
  N.Selected = True
  
  lvwPreset.ListItems(Idx).Text = Idx
  lvwPreset_ItemClick N
End Sub

Private Sub icbVariable_Change()
  icbVariable_Click
End Sub

Private Sub icbVariable_Click()
  Dim VarTxt As String
  Dim BTxt As String
  Dim ATxt As String
  
  VarTxt = txtKey.Text
  
  BTxt = Left(VarTxt, txtKey.SelStart)
  ATxt = Right(VarTxt, Len(VarTxt) - txtKey.SelStart - txtKey.SelLength)
  
  txtKey.Text = BTxt & icbVariable.selectedItem.Key & Space(1) & ATxt
  txtKey.SelStart = Len(BTxt) + Len(icbVariable.selectedItem.Key) + 1
  
  SetObjectFocus txtKey.hWnd
End Sub

Private Sub lvwPreset_ItemClick(ByVal Item As MSComctlLib.ListItem)
  cmdMoveUp.Enabled = Not (Item.Index = 1)
  cmdMoveDown.Enabled = Not (Item.Index = lvwPreset.ListItems.Count)

  txtKey.Text = Item.SubItems(1)
End Sub

Private Sub txtKey_Validate(Cancel As Boolean)
  txtKey.Text = Replace(txtKey.Text, vbCrLf, "")
End Sub

Private Sub UserControl_Initialize()
  '设置
  SetHeaderStyle lvwPreset.hWnd
  
  '添加插入项目
  icbVariable.ComboItems.Add , "%FILENAME%", "文件名 (%FILENAME%)", 1
  icbVariable.ComboItems.Add , "%ARTIST%", "艺术家 (%ARTIST%)", 2
  icbVariable.ComboItems.Add , "%ALBUM%", "专辑 (%ALBUM%)", 3
  icbVariable.ComboItems.Add , "%TITLE%", "标题 (%TITLE%)", 4
  icbVariable.ComboItems.Add , "%GENRE%", "流派 (%GENRE%)", 5
  icbVariable.ComboItems.Add , "%LENGTH%", "长度 (%LENGTH%)", 6
  icbVariable.ComboItems.Add , "%TRACKNUMBER%", "音轨序号 (%TRACKNUMBER%)", 7
  icbVariable.ComboItems.Add , "%YEAR%", "年代 (%YEAR%)", 8
  icbVariable.ComboItems.Add , "%FILESIZE%", "文件大小 (%FILESIZE%)", 9
  icbVariable.ComboItems.Add , "%DATECREATED%", "创建时间 (%DATECREATED%)", 10
  icbVariable.ComboItems(1).Selected = True
  
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
  Dim nItem As MSComctlLib.ListItem
  
  lvwPreset.ListItems.Clear
  
  For i = 1 To SortKeySet.Count
    Set nItem = lvwPreset.ListItems.Add
    nItem.SmallIcon = 1
    nItem.Text = i
    nItem.SubItems(1) = SortKeySet(i)
  Next i
  
  If SortKeySet.Count > 1 Then lvwPreset.ListItems(1).Selected = True
  
  cmdDel.Enabled = (lvwPreset.ListItems.Count > 1)
  cmdClear.Enabled = (lvwPreset.ListItems.Count > 1)
End Sub

Public Sub Update()
  '更新内部集合
  Set SortKeySet = New VBA.Collection
  
  For i = 1 To lvwPreset.ListItems.Count
    SortKeySet.Add lvwPreset.ListItems(i).SubItems(1)
  Next i
  
  '更新工具栏中的菜单
  Dim lAddIdx As Long
  Dim oItm As MSComctlLib.ButtonMenu
  
  For i = 3 To frmMain.tbrDefault.Buttons("SORTLIST").ButtonMenus.Count
    frmMain.tbrDefault.Buttons("SORTLIST").ButtonMenus.Remove 3
  Next i
  
  For i = 1 To SortKeySet.Count
    frmMain.tbrDefault.Buttons("SORTLIST").ButtonMenus.Add , , SortKeySet(i)
  Next i
End Sub


