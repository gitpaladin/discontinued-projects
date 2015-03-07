VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MsComCtl.ocx"
Begin VB.UserControl UIFilter 
   ClientHeight    =   5055
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5655
   ScaleHeight     =   5055
   ScaleWidth      =   5655
   Begin MSComctlLib.ImageList iltListHeader 
      Left            =   4440
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   12
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFilter.ctx":0000
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFilter.ctx":059A
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFilter.ctx":0B34
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFilter.ctx":10CE
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFilter.ctx":1668
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFilter.ctx":1C02
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFilter.ctx":219C
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFilter.ctx":2736
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFilter.ctx":2CD0
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFilter.ctx":326A
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFilter.ctx":3804
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFilter.ctx":3D9E
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList iltFilter 
      Left            =   5040
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
            Picture         =   "UIFilter.ctx":4338
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.TextBox txtFilter 
      Height          =   270
      Left            =   960
      TabIndex        =   5
      Top             =   4320
      Width           =   4695
   End
   Begin VB.TextBox txtName 
      Height          =   270
      Left            =   960
      TabIndex        =   3
      Top             =   3960
      Width           =   4695
   End
   Begin VB.CommandButton cmdEdit 
      Caption         =   "编辑(&E)"
      Height          =   375
      Left            =   960
      TabIndex        =   7
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
   Begin VB.CommandButton cmdMoveUp 
      Caption         =   "上移(&U)"
      Height          =   375
      Left            =   3840
      TabIndex        =   10
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
   Begin VB.CommandButton cmdDel 
      Caption         =   "删除(&D)"
      Height          =   375
      Left            =   1920
      TabIndex        =   8
      Top             =   4680
      Width           =   855
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "清空(&C)"
      Height          =   375
      Left            =   2880
      TabIndex        =   9
      Top             =   4680
      Width           =   855
   End
   Begin MSComctlLib.ListView lvwFilter 
      Height          =   3615
      Left            =   0
      TabIndex        =   1
      Top             =   240
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   6376
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      SmallIcons      =   "iltFilter"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      NumItems        =   2
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "说明"
         Object.Width           =   4260
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "过滤器"
         Object.Width           =   5318
      EndProperty
   End
   Begin VB.Label lblFilter 
      AutoSize        =   -1  'True
      Caption         =   "过滤器(&F):"
      Height          =   180
      Left            =   0
      TabIndex        =   4
      Top             =   4350
      Width           =   900
   End
   Begin VB.Label lblName 
      AutoSize        =   -1  'True
      Caption         =   "说明(&N):"
      Height          =   180
      Left            =   0
      TabIndex        =   2
      Top             =   3990
      Width           =   720
   End
   Begin VB.Label lblFilterList 
      AutoSize        =   -1  'True
      Caption         =   "过滤器列表(&F):"
      Height          =   180
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1260
   End
End
Attribute VB_Name = "UIFilter"
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
  Dim sKey As String
  Dim nItem As MSComctlLib.ListItem
  
  If (Len(txtName.Text) = 0) Or (Len(txtFilter.Text) = 0) Then Exit Sub
  
  sKey = txtName.Text
  
  If Not (lvwFilter.findItem(sKey) Is Nothing) Then
    MsgBox "名称已经存在。", vbExclamation
    SetObjectFocus txtName.hWnd
  Else
    '添加
    Set nItem = lvwFilter.ListItems.add(, txtName.Text)
    nItem.SmallIcon = 1
    nItem.Text = txtName.Text
    nItem.SubItems(1) = txtFilter.Text
    nItem.Selected = True
  End If
End Sub

Private Sub cmdClear_Click()
  Dim nItem As MSComctlLib.ListItem
  
  lvwFilter.ListItems.Clear

  Set nItem = lvwFilter.ListItems.add
  nItem.SmallIcon = 1
  nItem.Key = "所有文件"
  nItem.Text = "所有文件"
  nItem.SubItems(1) = "*.*"
  nItem.Selected = True
  
  lvwFilter_ItemClick lvwFilter.selectedItem
End Sub

Private Sub cmdDel_Click()
  Dim SelIdx As Long
  
  If Not lvwFilter.selectedItem Is Nothing Then
    SelIdx = lvwFilter.selectedItem.Index
    lvwFilter.ListItems.Remove lvwFilter.selectedItem.Index
    
    If SelIdx > lvwFilter.ListItems.Count Then lvwFilter.ListItems(lvwFilter.ListItems.Count).Selected = True Else lvwFilter.ListItems(SelIdx).Selected = True
    lvwFilter_ItemClick lvwFilter.selectedItem
  End If
End Sub

Private Sub cmdEdit_Click()
  Dim iIdx As Long
  Dim sKey As String
  Dim nItem As MSComctlLib.ListItem
  
  If lvwFilter.selectedItem Is Nothing Then Exit Sub
  If (Len(txtName.Text) = 0) Or (Len(txtFilter.Text) = 0) Then Exit Sub
  
  iIdx = lvwFilter.selectedItem.Index
  sKey = lvwFilter.selectedItem.Key
  
  If sKey = "所有文件" Then
    MsgBox "“所有文件”这个过滤器是只读的。", vbInformation
    Exit Sub
  End If
  
  If StrComp(sKey, txtName.Text, vbTextCompare) = 0 Then
    '编辑
    lvwFilter.selectedItem.SubItems(1) = txtFilter.Text
  Else
    If Not (lvwFilter.findItem(txtName.Text) Is Nothing) Then
      MsgBox "名称已经存在。", vbExclamation
      SetObjectFocus txtName.Text
    Else
      lvwFilter.ListItems.Remove iIdx
      
      '添加
      Set nItem = lvwFilter.ListItems.add(iIdx, txtName.Text)
      nItem.SmallIcon = 1
      nItem.Text = txtName.Text
      nItem.SubItems(1) = txtFilter.Text
      nItem.Selected = True
    End If
  End If
End Sub

Private Sub cmdMoveDown_Click()
  Dim sKey As String
  Dim sCont As String
  Dim iIdx As Long
  Dim nItem As MSComctlLib.ListItem
  
  If lvwFilter.selectedItem Is Nothing Then Exit Sub
  If lvwFilter.selectedItem.Index = lvwFilter.ListItems.Count Then Exit Sub
  
  sKey = lvwFilter.selectedItem.Key
  sCont = lvwFilter.selectedItem.SubItems(1)
  iIdx = lvwFilter.selectedItem.Index
  
  lvwFilter.ListItems.Remove iIdx
  
  '添加
  Set nItem = lvwFilter.ListItems.add(iIdx + 1, sKey)
  nItem.SmallIcon = 1
  nItem.Text = sKey
  nItem.SubItems(1) = sCont
  nItem.Selected = True
  
  lvwFilter_ItemClick nItem
End Sub

Private Sub cmdMoveUp_Click()
  Dim sKey As String
  Dim sCont As String
  Dim iIdx As Long
  Dim nItem As MSComctlLib.ListItem
  
  If lvwFilter.selectedItem Is Nothing Then Exit Sub
  If lvwFilter.selectedItem.Index = 1 Then Exit Sub
  
  sKey = lvwFilter.selectedItem.Key
  sCont = lvwFilter.selectedItem.SubItems(1)
  iIdx = lvwFilter.selectedItem.Index
  
  lvwFilter.ListItems.Remove iIdx
  
  '添加
  Set nItem = lvwFilter.ListItems.add(iIdx - 1, sKey)
  nItem.SmallIcon = 1
  nItem.Text = sKey
  nItem.SubItems(1) = sCont
  nItem.Selected = True
  
  lvwFilter_ItemClick nItem
End Sub

Private Sub lvwFilter_ItemClick(ByVal Item As MSComctlLib.ListItem)
  cmdDel.Enabled = Not (Item.Text = "所有文件")
  cmdMoveUp.Enabled = Not (Item.Index = 1)
  cmdMoveDown.Enabled = Not (Item.Index = lvwFilter.ListItems.Count)
  
  txtName.Text = Item.Key
  txtFilter.Text = Item.SubItems(1)
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
  
  lvwFilter.ListItems.Clear
  SetHeaderStyle lvwFilter.hWnd
  
  For i = 1 To FilterSet.Count
    Set nItem = lvwFilter.ListItems.add
    nItem.SmallIcon = 1
    nItem.Key = FilterKey(i)
    nItem.Text = FilterKey(i)
    nItem.SubItems(1) = FilterSet(i)
  Next i
  
  If FilterSet.Count > 1 Then lvwFilter.ListItems(1).Selected = True
End Sub

Public Sub Update()
  '更新内部集合
  Set FilterKey = New VBA.Collection
  Set FilterSet = New VBA.Collection
  
  For i = 1 To lvwFilter.ListItems.Count
    FilterKey.add lvwFilter.ListItems(i).Key, lvwFilter.ListItems(i).Key
    FilterSet.add lvwFilter.ListItems(i).SubItems(1), lvwFilter.ListItems(i).Key
  Next i
  
  '更新工具栏中的菜单
  Dim lAddIdx As Long
  Dim oItm As MSComctlLib.ButtonMenu
  
  For i = 5 To frmMain.tbrDefault.Buttons("FILTER").ButtonMenus.Count
    frmMain.tbrDefault.Buttons("FILTER").ButtonMenus.Remove 5
  Next i
  
  For i = 1 To FilterSet.Count
    frmMain.tbrDefault.Buttons("FILTER").ButtonMenus.add , , FilterKey(i) & vbTab & FilterSet(i)
  Next i
End Sub

