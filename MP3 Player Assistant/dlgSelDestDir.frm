VERSION 5.00
Begin VB.Form dlgSelDestDir 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "选择复制的目标文件夹"
   ClientHeight    =   1320
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   4695
   Icon            =   "dlgSelDestDir.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1320
   ScaleWidth      =   4695
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '屏幕中心
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin VB.PictureBox picDir 
      BackColor       =   &H80000005&
      Height          =   360
      Left            =   120
      ScaleHeight     =   300
      ScaleWidth      =   4395
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   360
      Width           =   4455
      Begin VB.TextBox txtDir 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         Height          =   180
         Left            =   630
         TabIndex        =   2
         Text            =   "fsaffd"
         Top             =   60
         Width           =   3765
      End
      Begin VB.Label lblDirTxt 
         BackStyle       =   0  'Transparent
         Caption         =   "M:\"
         Height          =   150
         Left            =   375
         TabIndex        =   1
         Top             =   60
         Width           =   255
      End
      Begin VB.Image imgDir 
         Height          =   240
         Left            =   45
         Picture         =   "dlgSelDestDir.frx":058A
         Top             =   30
         Width           =   240
      End
   End
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "浏览文件夹(&B)..."
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   825
      Width           =   1695
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "取消"
      Height          =   375
      Left            =   3360
      TabIndex        =   5
      Top             =   825
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "确定"
      Default         =   -1  'True
      Height          =   375
      Left            =   2040
      TabIndex        =   4
      Top             =   825
      Width           =   1215
   End
   Begin VB.Label lblDir 
      AutoSize        =   -1  'True
      Caption         =   "文件夹名称(&N):"
      Height          =   180
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1260
   End
End
Attribute VB_Name = "dlgSelDestDir"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub CancelButton_Click()
  Unload Me
End Sub

Private Sub cmdBrowse_Click()
  '浏览文件夹
  Dim sPath As String
  
  sPath = BrowseFolder.BrowseForFolder(Me.hWnd, "选择目标文件夹", lblDirTxt.Caption)
  
  If Len(sPath) = 0 Then Exit Sub
  
  txtDir.Text = Right(sPath, Len(sPath) - 3)
  txtDir.SelStart = 0
  txtDir.SelLength = Len(txtDir)
End Sub

Private Sub Form_Load()
  Dim sPath As String

  Set imgDir.Picture = frmMain.stbDefault.Panels(3).Picture
  sPath = frmMain.stbDefault.Panels(3).Text
  lblDirTxt = Left(sPath, 3)
  txtDir.Text = Right(sPath, Len(sPath) - 3)
  txtDir.SelStart = 0
  txtDir.SelLength = Len(txtDir)
  
  cmdBrowse.Enabled = FS.DriveExists(lblDirTxt)
End Sub

Private Sub OKButton_Click()
  frmMain.stbDefault.Panels(3).Text = lblDirTxt.Caption & txtDir.Text
  Unload Me
End Sub

Private Sub txtDir_Validate(Cancel As Boolean)
  '验证是否正确
  Dim nPath As String
  
  nPath = txtDir.Text
  
  Cancel = (InStr(1, nPath, "\") = 1)
  Cancel = InStr(1, nPath, "\\") Or Cancel
  Cancel = InStr(1, nPath, "/") Or Cancel
  Cancel = InStr(1, nPath, "?") Or Cancel
  Cancel = InStr(1, nPath, ":") Or Cancel
  Cancel = InStr(1, nPath, "<") Or Cancel
  Cancel = InStr(1, nPath, ">") Or Cancel
  Cancel = InStr(1, nPath, "|") Or Cancel
  
  If Cancel Then
    MsgBox "无效的目录名称。无效的字符 \ / ? : < > |。", vbCritical
    txtDir.SelStart = 0
    txtDir.SelLength = Len(txtDir)
    SetObjectFocus txtDir.hWnd
  End If
End Sub
