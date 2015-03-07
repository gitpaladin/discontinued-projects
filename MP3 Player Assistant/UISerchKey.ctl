VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl UISerchKey 
   ClientHeight    =   5055
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5655
   ScaleHeight     =   5055
   ScaleWidth      =   5655
   Begin VB.CommandButton cmdDeleteSeletion 
      Caption         =   "删除所选记录(&S)"
      Height          =   375
      Left            =   1680
      TabIndex        =   3
      Top             =   4200
      Width           =   1575
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "清除历史记录(&C)"
      Height          =   375
      Left            =   0
      TabIndex        =   2
      Top             =   4200
      Width           =   1575
   End
   Begin MSComctlLib.ListView lvwSHistory 
      Height          =   3855
      Left            =   0
      TabIndex        =   1
      Top             =   240
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   6800
      View            =   3
      LabelEdit       =   1
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      SmallIcons      =   "iltHistory"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      NumItems        =   2
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "编号"
         Object.Width           =   1535
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "历史记录"
         Object.Width           =   8334
      EndProperty
   End
   Begin MSComctlLib.ImageList iltHistory 
      Left            =   5040
      Top             =   4320
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
            Picture         =   "UISerchKey.ctx":0000
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Label lblInfo 
      Caption         =   "* 在输入关键字的时候, 按下 Enter 键可以自动添加历史记录."
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   0
      TabIndex        =   4
      Top             =   4680
      Width           =   5655
   End
   Begin VB.Label lblHistory 
      AutoSize        =   -1  'True
      Caption         =   "搜索历史记录(&H):"
      Height          =   195
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1335
   End
End
Attribute VB_Name = "UISerchKey"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=UserControl,UserControl,-1,Enabled
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Returns/sets a value that determines whether an object can respond to user-generated events."
  Enabled = UserControl.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  UserControl.Enabled() = New_Enabled
  PropertyChanged "Enabled"
End Property

Private Sub cmdClear_Click()
  lvwSHistory.ListItems.Clear
  CheckItemCount
End Sub

Private Sub cmdDeleteSeletion_Click()
  Dim j As Long
  
  j = 1
    
  Do Until j >= lvwSHistory.ListItems.Count
    If lvwSHistory.ListItems(j).Selected Then
      lvwSHistory.ListItems.Remove j
    Else
      lvwSHistory.ListItems(j).Text = j
      j = j + 1
    End If
  Loop
  
  If lvwSHistory.ListItems.Count Then
    lvwSHistory.ListItems(lvwSHistory.ListItems.Count).Text = lvwSHistory.ListItems.Count
  End If
  
  CheckItemCount
End Sub

Private Sub UserControl_Click()
  Debug.Print lvwSHistory.ColumnHeaders(1).Width
  Debug.Print lvwSHistory.ColumnHeaders(2).Width
End Sub

'Load property values from storage
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  
  UserControl.Enabled = PropBag.ReadProperty("Enabled", True)
End Sub

'Write property values to storage
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)

  Call PropBag.WriteProperty("Enabled", UserControl.Enabled, True)
End Sub

Public Sub Init()
  '设置表头样式
  Dim xItem As MSComctlLib.ListItem
  
  SetHeaderStyle lvwSHistory.hWnd
  
  '读取数据
  If frmMain.icbSearch.ComboItems.Count Then
    For i = 1 To frmMain.icbSearch.ComboItems.Count
      Set xItem = lvwSHistory.ListItems.Add(, , i, , 1)
      xItem.SubItems(1) = frmMain.icbSearch.ComboItems(i).Text
    Next i
  Else
    cmdClear.Enabled = False
    cmdDeleteSeletion.Enabled = False
  End If
End Sub

Public Sub Update()
  Dim sStr As String

  '更新数据
  frmMain.icbSearch.ComboItems.Clear
  
  '写入数据
  If lvwSHistory.ListItems.Count Then
    For i = 1 To lvwSHistory.ListItems.Count
      sStr = lvwSHistory.ListItems(i).SubItems(1)
      frmMain.icbSearch.ComboItems.Add , "[KEY]" & sStr, sStr, 8
    Next i
  End If
End Sub

Private Sub CheckItemCount()
  '检查项目个数
  If lvwSHistory.ListItems.Count = 0 Then
    cmdClear.Enabled = False
    cmdDeleteSeletion.Enabled = False
  End If
End Sub
