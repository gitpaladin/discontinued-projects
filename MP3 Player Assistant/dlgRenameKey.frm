VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form dlgRenameKey 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "选择重命名模板"
   ClientHeight    =   4575
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   4575
   Icon            =   "dlgRenameKey.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4575
   ScaleWidth      =   4575
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  '所有者中心
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin VB.Frame fraInfo 
      Caption         =   "注意"
      Height          =   735
      Left            =   120
      TabIndex        =   7
      Top             =   3240
      Width           =   4335
      Begin VB.Label lblInfo 
         Caption         =   "这里的模板指的是文件名的主文件名部分，文件的扩展名不会改变。"
         Height          =   375
         Left            =   120
         TabIndex        =   8
         Top             =   240
         Width           =   4095
      End
   End
   Begin VB.TextBox txtTemplate 
      Height          =   630
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   3
      Top             =   2520
      Width           =   4335
   End
   Begin MSComctlLib.ImageList iltTemplate 
      Left            =   1320
      Top             =   4080
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
            Picture         =   "dlgRenameKey.frx":058A
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvwTemplate 
      Height          =   1695
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   4335
      _ExtentX        =   7646
      _ExtentY        =   2990
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      _Version        =   393217
      SmallIcons      =   "iltTemplate"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "重命名模板"
         Object.Width           =   7541
      EndProperty
   End
   Begin VB.CheckBox chkEnabled 
      Caption         =   "启用复制重新命名功能(&E)"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4335
   End
   Begin VB.CommandButton cmdSettings 
      Caption         =   "设置(&S)..."
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   4080
      Width           =   1215
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "取消"
      Height          =   375
      Left            =   3240
      TabIndex        =   6
      Top             =   4080
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "确定"
      Height          =   375
      Left            =   1920
      TabIndex        =   5
      Top             =   4080
      Width           =   1215
   End
   Begin VB.Label lblTemplate 
      AutoSize        =   -1  'True
      Caption         =   "命名模板(&T):"
      Height          =   180
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   1080
   End
End
Attribute VB_Name = "dlgRenameKey"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub CancelButton_Click()
  Unload Me
End Sub

Private Sub chkEnabled_Click()
  UpdateUI CBool(chkEnabled.Value)
End Sub

Private Sub cmdSettings_Click()
  dlgOption.ShowPage 6
  Form_Load
End Sub

Private Sub Form_Load()
  '填充已经存在的模板
  Dim i As Long
  
  '设置样式
  SetHeaderStyle lvwTemplate.hWnd
  
  For i = 1 To RenameKey.Count
    lvwTemplate.ListItems.Add , , RenameKey(i), , 1
  Next i
  
  lvwTemplate.ListItems(RenameCurrent).Selected = True
  txtTemplate.Text = RenameKey(RenameCurrent)

  '选择已经存在的
  If RenameEnabled Then
    chkEnabled.Value = 1
    UpdateUI True
  Else
    chkEnabled.Value = 0
    UpdateUI False
  End If
End Sub

Private Sub lvwTemplate_ItemClick(ByVal Item As MSComctlLib.ListItem)
  txtTemplate.Text = Item.Text
End Sub

Private Sub UpdateUI(ByVal Enabled As Boolean)
  If Enabled Then
    lblTemplate.Enabled = True
    lvwTemplate.Enabled = True
    txtTemplate.Enabled = True
    lvwTemplate.BackColor = &H80000005
    txtTemplate.BackColor = &H80000005
  Else
    lblTemplate.Enabled = False
    lvwTemplate.Enabled = False
    txtTemplate.Enabled = False
    lvwTemplate.BackColor = &H8000000F
    txtTemplate.BackColor = &H8000000F
  End If
End Sub

Private Sub OKButton_Click()
  '设置新的样式
  RenameEnabled = chkEnabled.Value
  RenameCurrent = lvwTemplate.selectedItem.Index
  Unload Me
End Sub
