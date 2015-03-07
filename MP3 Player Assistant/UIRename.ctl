VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl UIRename 
   ClientHeight    =   5055
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5655
   ScaleHeight     =   5055
   ScaleWidth      =   5655
   Begin VB.Frame fraInfo 
      Caption         =   "注意"
      Height          =   735
      Left            =   2280
      TabIndex        =   14
      Top             =   3840
      Width           =   3375
      Begin VB.Label lblInfo 
         Caption         =   "这里的模板指的是文件名的主文件名部分，文件的扩展名不会改变。"
         Height          =   375
         Left            =   120
         TabIndex        =   15
         Top             =   240
         Width           =   3135
      End
   End
   Begin MSComctlLib.ImageList iltTemplate 
      Left            =   4320
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
            Picture         =   "UIRename.ctx":0000
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Frame fraField 
      Caption         =   "可用的字段"
      Height          =   4575
      Left            =   0
      TabIndex        =   10
      Top             =   0
      Width           =   2175
      Begin MSComctlLib.TreeView tvwField 
         Height          =   3495
         Left            =   120
         TabIndex        =   11
         Top             =   240
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   6165
         _Version        =   393217
         HideSelection   =   0   'False
         Indentation     =   441
         LabelEdit       =   1
         Style           =   7
         ImageList       =   "iltField"
         Appearance      =   1
         OLEDragMode     =   1
      End
      Begin VB.Label lblDescription 
         Caption         =   "字段的描述"
         Height          =   375
         Left            =   120
         TabIndex        =   13
         Top             =   4080
         Width           =   1935
      End
      Begin VB.Label lblField 
         AutoSize        =   -1  'True
         Caption         =   "字段名称"
         ForeColor       =   &H00A85E33&
         Height          =   180
         Left            =   120
         TabIndex        =   12
         Top             =   3840
         Width           =   720
      End
   End
   Begin VB.TextBox txtPattern 
      Height          =   615
      Left            =   2280
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   6
      Top             =   3120
      Width           =   3375
   End
   Begin VB.CommandButton cmdEdit 
      Caption         =   "编辑(&E)"
      Height          =   375
      Left            =   960
      TabIndex        =   5
      Top             =   4680
      Width           =   855
   End
   Begin VB.CommandButton cmdMoveDown 
      Caption         =   "下移(&W)"
      Height          =   375
      Left            =   4800
      TabIndex        =   4
      Top             =   4680
      Width           =   855
   End
   Begin VB.CommandButton cmdMoveUp 
      Caption         =   "上移(&U)"
      Height          =   375
      Left            =   3840
      TabIndex        =   3
      Top             =   4680
      Width           =   855
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "添加(&A)"
      Height          =   375
      Left            =   0
      TabIndex        =   2
      Top             =   4680
      Width           =   855
   End
   Begin VB.CommandButton cmdDel 
      Caption         =   "删除(&D)"
      Height          =   375
      Left            =   1920
      TabIndex        =   1
      Top             =   4680
      Width           =   855
   End
   Begin VB.CommandButton cmdDefault 
      Caption         =   "默认(&D)"
      Height          =   375
      Left            =   2880
      TabIndex        =   0
      Top             =   4680
      Width           =   855
   End
   Begin MSComctlLib.ImageList iltField 
      Left            =   4920
      Top             =   0
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
            Picture         =   "UIRename.ctx":059A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIRename.ctx":0B34
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvwPreset 
      Height          =   2535
      Left            =   2280
      TabIndex        =   7
      Top             =   240
      Width           =   3375
      _ExtentX        =   5953
      _ExtentY        =   4471
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      _Version        =   393217
      SmallIcons      =   "iltTemplate"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "重命名模板"
         Object.Width           =   5821
      EndProperty
   End
   Begin VB.Label lblPreset 
      AutoSize        =   -1  'True
      Caption         =   "已存在的模板(&P):"
      Height          =   180
      Left            =   2280
      TabIndex        =   9
      Top             =   0
      Width           =   1440
   End
   Begin VB.Label lblPattern 
      AutoSize        =   -1  'True
      Caption         =   "重命名模板(&K):"
      Height          =   180
      Left            =   2280
      TabIndex        =   8
      Top             =   2880
      Width           =   1260
   End
End
Attribute VB_Name = "UIRename"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'注意！不要删除或修改下列被注释的行！
'MappingInfo=UserControl,UserControl,-1,Enabled
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "返回/设置一个值，决定一个对象是否响应用户生成事件。"
  Enabled = UserControl.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  UserControl.Enabled() = New_Enabled
  PropertyChanged "Enabled"
End Property

Private Sub cmdAdd_Click()
  '检查是否有相同的一个项目
  Dim vNewText As String
  
  vNewText = txtPattern.Text
  
  '检查项目的合法性
  If Len(vNewText) = 0 Then
    MsgBox "你输入的文件名无效。", vbExclamation
    Exit Sub
  End If
  
  If IsFileName(vNewText) = False Then
    MsgBox "您输入文件名不合法。" & vbCrLf & vbCrLf & _
           "* 文件名必须以字母或数字开头。它可以包含大小写字符(文件名不分大小写)，但以下的字符除外：双引号(" & Chr(34) & _
           ")、撇号(') 、斜杠(/)、反斜杠(\)、冒号(:)、垂直条(|)。" & vbCrLf & _
           "* 以下的名称将保留，且不能用在文件或目录上：CON、AUX、COM1、COM2、COM3、COM4、LPT1、LPT2、LPT3、PRN、NUL。" _
           , vbExclamation
    Exit Sub
  End If
  
  If CheckDulp(vNewText) Then
    MsgBox "你添加一个项目已经有重复的一项了， 请输入一个不相同的模板。", vbExclamation
    Exit Sub
  End If
  
  '开始添加一些项目
  lvwPreset.ListItems.Add(, , vNewText, , 1).Selected = True
End Sub

Private Sub cmdDefault_Click()
  '设置默认的状态
  lvwPreset.ListItems.Clear
  lvwPreset.ListItems.Add , , "%NUMBER%.%ARTIST% - %TITLE%", , 1
  lvwPreset.ListItems.Add , , "%ARTIST% - %TITLE%", , 1
  lvwPreset.ListItems.Add , , "%ARTIST% - %ALBUM% - %TRACKNUMBER%.%TITLE%", , 1
  lvwPreset.ListItems(1).Selected = True
End Sub

Private Sub cmdDel_Click()
  '删除一个项目
  Dim iIndex As Long
  
  If lvwPreset.ListItems.Count = 0 Then Exit Sub
  
  If Not (lvwPreset.selectedItem Is Nothing) Then
    iIndex = lvwPreset.selectedItem.Index
    lvwPreset.ListItems.Remove iIndex
    
    If lvwPreset.ListItems.Count < iIndex Then
      lvwPreset.ListItems(lvwPreset.ListItems.Count).Selected = True
    Else
      lvwPreset.ListItems(iIndex).Selected = True
    End If
  End If
End Sub

Private Sub cmdEdit_Click()
  '检查是否有相同的一个项目
  Dim vNewText As String
  Dim iIndex As Long
  
  vNewText = txtPattern.Text
  
  '检查项目的合法性
  If Len(vNewText) = 0 Then
    MsgBox "你输入的文件名无效。", vbExclamation
    Exit Sub
  End If
  
  If IsFileName(vNewText) = False Then
    MsgBox "您输入文件名不合法。" & vbCrLf & vbCrLf & _
           "* 文件名必须以字母或数字开头。它可以包含大小写字符(文件名不分大小写)，但以下的字符除外：双引号(" & Chr(34) & _
           ")、撇号(') 、斜杠(/)、反斜杠(\)、冒号(:)、垂直条(|)。" & vbCrLf & _
           "* 以下的名称将保留，且不能用在文件或目录上：CON、AUX、COM1、COM2、COM3、COM4、LPT1、LPT2、LPT3、PRN、NUL。" _
           , vbExclamation
    Exit Sub
  End If
  
  If CheckDulp(vNewText) Then
    MsgBox "你添加一个项目已经有重复的一项了， 请输入一个不相同的模板。", vbExclamation
    Exit Sub
  End If
  
  '开始更改一些项目
  lvwPreset.selectedItem.Text = vNewText
End Sub

Private Sub cmdMoveDown_Click()
  '向下移动一个项目
  If lvwPreset.selectedItem Is Nothing Then Exit Sub
  If lvwPreset.selectedItem.Index = lvwPreset.ListItems.Count Then Exit Sub
  
  Dim OldIndex As Long
  Dim CurPattern As String
  
  OldIndex = lvwPreset.selectedItem.Index
  CurPattern = lvwPreset.selectedItem.Text
  
  lvwPreset.ListItems.Remove OldIndex
  lvwPreset.ListItems.Add(OldIndex + 1, , CurPattern, , 1).Selected = True
End Sub

Private Sub cmdMoveUp_Click()
  '向上移动一个项目
  If lvwPreset.selectedItem Is Nothing Then Exit Sub
  If lvwPreset.selectedItem.Index = 1 Then Exit Sub
  
  Dim OldIndex As Long
  Dim CurPattern As String
  
  OldIndex = lvwPreset.selectedItem.Index
  CurPattern = lvwPreset.selectedItem.Text
  
  lvwPreset.ListItems.Remove OldIndex
  lvwPreset.ListItems.Add(OldIndex - 1, , CurPattern, , 1).Selected = True
End Sub

Private Sub lvwPreset_ItemClick(ByVal Item As MSComctlLib.ListItem)
  txtPattern.Text = Item.Text
End Sub

Private Sub tvwField_DblClick()
  Dim VarTxt As String
  Dim NewTxt As String
  Dim BTxt As String
  Dim ATxt As String
  
  If tvwField.selectedItem.Parent Is Nothing Then Exit Sub
  
  VarTxt = txtPattern.Text
  NewTxt = tvwField.selectedItem.Text
  
  BTxt = Left(VarTxt, txtPattern.SelStart)
  ATxt = Right(VarTxt, Len(VarTxt) - txtPattern.SelStart - txtPattern.SelLength)
  
  txtPattern.Text = BTxt & NewTxt & Space(1) & ATxt
  txtPattern.SelStart = Len(BTxt) + Len(NewTxt) + 1
  
  SetObjectFocus txtPattern.hWnd
End Sub

Private Sub tvwField_NodeClick(ByVal Node As MSComctlLib.Node)
  lblField.Caption = Node.Text
  lblDescription.Caption = Node.Tag
End Sub

Private Sub UserControl_Initialize()
  '添加一些必要的信息
  tvwField.Nodes.Add(, , "ROOT_METADATA", "标签数据", 1).Tag = "关于一些可以从标签中读取的数据，这些数据是有 MP3 文件决定的。"
  tvwField.Nodes.Add(, , "ROOT_FILEINFO", "文件信息", 1).Tag = "所有文件都具有的一般的信息。"
  tvwField.Nodes.Add(, , "ROOT_LISTDATA", "清单数据", 1).Tag = "从生成的清单的中读取的数据。"
  
  tvwField.Nodes.Add("ROOT_METADATA", tvwChild, "TAG_ARTIST", "%ARTIST%", 2).Tag = "艺术家信息。"
  tvwField.Nodes.Add("ROOT_METADATA", tvwChild, "TAG_ALBUM", "%ALBUM%", 2).Tag = "专辑信息。"
  tvwField.Nodes.Add("ROOT_METADATA", tvwChild, "TAG_TITLE", "%TITLE%", 2).Tag = "标题信息。"
  tvwField.Nodes.Add("ROOT_METADATA", tvwChild, "TAG_GENRE", "%GENRE%", 2).Tag = "流派信息。"
  tvwField.Nodes.Add("ROOT_METADATA", tvwChild, "TAG_LENGTH", "%LENGTH%", 2).Tag = "长度信息。"
  tvwField.Nodes.Add("ROOT_METADATA", tvwChild, "TAG_TRACKNUMBER", "%TRACKNUMBER%", 2).Tag = "音轨序号信息。"
  tvwField.Nodes.Add("ROOT_METADATA", tvwChild, "TAG_YEAR", "%YEAR%", 2).Tag = "年代信息。"
  
  tvwField.Nodes.Add("ROOT_FILEINFO", tvwChild, "FI_FILENAME", "%FILENAME%", 2).Tag = "文件名。"
  tvwField.Nodes.Add("ROOT_FILEINFO", tvwChild, "FI_FILESIZE", "%FILESIZE%", 2).Tag = "文件大小。"
  tvwField.Nodes.Add("ROOT_FILEINFO", tvwChild, "FI_DATECREATED", "%DATECREATED%", 2).Tag = "文件创建的时间。"
  
  tvwField.Nodes.Add("ROOT_LISTDATA", tvwChild, "LD_NUMBER", "%NUMBER%", 2).Tag = "这个表示文件在播放清单中的序号。"
  
  '展开全部
  tvwField.Nodes("ROOT_METADATA").Expanded = True
  tvwField.Nodes("ROOT_FILEINFO").Expanded = True
  tvwField.Nodes("ROOT_LISTDATA").Expanded = True
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
  '初始化变量
  Dim i As Long
  
  For i = 1 To RenameKey.Count
    lvwPreset.ListItems.Add , , RenameKey(i), , 1
  Next i
  
  lvwPreset.ListItems(RenameCurrent).Selected = True
  txtPattern.Text = lvwPreset.selectedItem.Text
End Sub

Public Sub Update()
  Dim i As Long
  
  '保存设置
  If lvwPreset.ListItems.Count = 0 Then
    MsgBox "您已经删除所有的命名模板，重新载入设置。", vbOKOnly Or vbInformation
    cmdDefault_Click
  End If
  
  Set RenameKey = New VBA.Collection
  
  For i = 1 To lvwPreset.ListItems.Count
    RenameKey.Add lvwPreset.ListItems(i).Text
  Next i
  
  RenameCurrent = lvwPreset.selectedItem.Index
  
  '设置界中的菜单
  For i = 6 To frmMain.tbrDefault.Buttons("RENAME").ButtonMenus.Count
    frmMain.tbrDefault.Buttons("RENAME").ButtonMenus.Remove 6
  Next i
  
  For i = 1 To RenameKey.Count
    frmMain.tbrDefault.Buttons("RENAME").ButtonMenus.Add , , RenameKey(i)
  Next i
  
  Call frmMain.SetRenameStatus(RenameEnabled)
  
End Sub

Private Function CheckDulp(ByVal NewVal As String) As Long
  '检查是否有相同的
  Dim i As Long
  
  For i = 1 To lvwPreset.ListItems.Count
    If StrComp(lvwPreset.ListItems(i).Text, NewVal, vbTextCompare) = 0 Then
      CheckDulp = i
      Exit Function
    End If
  Next i
End Function
