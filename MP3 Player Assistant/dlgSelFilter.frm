VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MsComCtl.ocx"
Begin VB.Form dlgSelFilter 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "选择过滤器"
   ClientHeight    =   4935
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6735
   Icon            =   "dlgSelFilter.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4935
   ScaleWidth      =   6735
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '屏幕中心
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin MSComctlLib.ImageList iltPreset 
      Left            =   3480
      Top             =   4440
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
            Picture         =   "dlgSelFilter.frx":058A
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.TextBox txtCurrent 
      BackColor       =   &H8000000F&
      Height          =   270
      Left            =   1200
      TabIndex        =   6
      Top             =   120
      Width           =   5415
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   5400
      TabIndex        =   4
      Top             =   4440
      Width           =   1215
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "确定"
      Default         =   -1  'True
      Height          =   375
      Left            =   4080
      TabIndex        =   3
      Top             =   4440
      Width           =   1215
   End
   Begin VB.CommandButton cmdOption 
      Caption         =   "设置预设过滤器(&P)..."
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   4440
      Width           =   2175
   End
   Begin VB.TextBox txtFilter 
      Height          =   270
      Left            =   1200
      TabIndex        =   1
      Top             =   480
      Width           =   5415
   End
   Begin MSComctlLib.ListView lvwPreset 
      Height          =   3255
      Left            =   120
      TabIndex        =   8
      Top             =   1080
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   5741
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
         Text            =   "名称"
         Object.Width           =   3528
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "过滤器"
         Object.Width           =   7056
      EndProperty
   End
   Begin VB.Label lblPreset 
      AutoSize        =   -1  'True
      Caption         =   "预设过滤器(&S):"
      Height          =   180
      Left            =   120
      TabIndex        =   7
      Top             =   840
      Width           =   1260
   End
   Begin VB.Label lblCurrent 
      AutoSize        =   -1  'True
      Caption         =   "当前过滤器:"
      Height          =   180
      Left            =   120
      TabIndex        =   5
      Top             =   165
      Width           =   990
   End
   Begin VB.Label lblFilter 
      AutoSize        =   -1  'True
      Caption         =   "新过滤器(&F):"
      Height          =   180
      Left            =   120
      TabIndex        =   0
      Top             =   525
      Width           =   1080
   End
End
Attribute VB_Name = "dlgSelFilter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCancel_Click()
  Unload Me
End Sub

Private Sub cmdOK_Click()
  '设置过滤器
  Dim NewFilter As String
  Dim IdxFilter As Long
  Dim ItmFilter As MSComctlLib.ListItem
  
  NewFilter = txtFilter.Text
  If StrComp(txtCurrent.Text, NewFilter, vbTextCompare) = 0 Then Unload Me
  
  '查找是否设预设
  Set ItmFilter = lvwPreset.findItem(NewFilter, lvwSubItem)
  
  If ItmFilter Is Nothing Then
    CurrentFilter = NewFilter
    
    '更新
    If (frmMain.ActivePage = 1) Or (frmMain.ActivePage = 2) Then
      frmMain.tbrDefault.Buttons("FILTER").ButtonMenus(1).Text = "当前过滤器:" & vbTab & NewFilter
      Unload Me
      frmMain.tbsFileBrowser_Click
    End If
  Else
    IdxFilter = ItmFilter.Index
    
    '更新
    Unload Me
    frmMain.tbrDefault_ButtonMenuClick frmMain.tbrDefault.Buttons("FILTER").ButtonMenus(IdxFilter + 4)
  End If
End Sub

Private Sub cmdOption_Click()
  '打开选项
  dlgOption.ShowPage 2
  
  '重新设置
  lvwPreset.ListItems.Clear
  
  Dim nItem As MSComctlLib.ListItem
  
  For i = 1 To FilterSet.Count
    Set nItem = lvwPreset.ListItems.Add
    nItem.Key = FilterKey(i)
    nItem.Text = FilterKey(i)
    nItem.SmallIcon = 1
    nItem.SubItems(1) = FilterSet(i)
  Next i
End Sub

Private Sub Form_Load()
  '添加过滤器集合
  Dim nItem As MSComctlLib.ListItem
  
  For i = 1 To FilterSet.Count
    Set nItem = lvwPreset.ListItems.Add
    nItem.Key = FilterKey(i)
    nItem.Text = FilterKey(i)
    nItem.SmallIcon = 1
    nItem.SubItems(1) = FilterSet(i)
  Next i
  
  SetHeaderStyle lvwPreset.hWnd
  
  txtCurrent.Text = CurrentFilter
  lvwPreset.ListItems(1).Selected = True
  lvwPreset_ItemClick lvwPreset.ListItems(1)
End Sub

Private Sub lvwPreset_ItemClick(ByVal Item As MSComctlLib.ListItem)
  txtFilter.Text = Item.SubItems(1)
End Sub
