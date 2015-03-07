VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.UserControl UIApp 
   ClientHeight    =   5055
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5655
   LockControls    =   -1  'True
   ScaleHeight     =   5055
   ScaleWidth      =   5655
   Begin VB.Frame fraFoobar 
      Caption         =   "Foobar 2000"
      ForeColor       =   &H00D54600&
      Height          =   1575
      Left            =   0
      TabIndex        =   7
      Top             =   2295
      Width           =   5655
      Begin VB.PictureBox picfoobar 
         BorderStyle     =   0  'None
         Height          =   1215
         Left            =   120
         ScaleHeight     =   1215
         ScaleWidth      =   5415
         TabIndex        =   8
         TabStop         =   0   'False
         Top             =   240
         Width           =   5415
         Begin VB.CommandButton cmdFoobar9 
            Height          =   375
            Left            =   840
            TabIndex        =   16
            Top             =   840
            Width           =   4575
         End
         Begin VB.CheckBox chkFoobar9 
            Caption         =   "读取 Foobar 2000 0.9x 播放列表(&O)"
            Height          =   255
            Left            =   840
            TabIndex        =   15
            Top             =   600
            Value           =   1  'Checked
            Width           =   3255
         End
         Begin VB.CheckBox chkFoobar 
            Caption         =   "读取 Foobar 2000 0.8x 播放列表(&F)"
            Height          =   255
            Left            =   840
            TabIndex        =   9
            Top             =   0
            Value           =   1  'Checked
            Width           =   3255
         End
         Begin VB.CommandButton cmdFoobar 
            Height          =   375
            Left            =   840
            TabIndex        =   10
            Top             =   240
            Width           =   4575
         End
         Begin VB.Image imgFoobar 
            Height          =   720
            Left            =   0
            Picture         =   "UIApp.ctx":0000
            Top             =   0
            Width           =   720
         End
      End
   End
   Begin VB.Frame fraTTPlayer 
      Caption         =   "千千静听"
      ForeColor       =   &H00D54600&
      Height          =   1095
      Left            =   0
      TabIndex        =   11
      Top             =   3960
      Width           =   5655
      Begin VB.PictureBox Picture1 
         BorderStyle     =   0  'None
         Height          =   735
         Left            =   120
         ScaleHeight     =   735
         ScaleWidth      =   5415
         TabIndex        =   12
         TabStop         =   0   'False
         Top             =   240
         Width           =   5415
         Begin VB.CommandButton cmdTTPlayer 
            Height          =   375
            Left            =   840
            TabIndex        =   14
            Top             =   360
            Width           =   4575
         End
         Begin VB.CheckBox chkTTPlayer 
            Caption         =   "读取千千静听播放列表(&T)"
            Height          =   255
            Left            =   840
            TabIndex        =   13
            Top             =   0
            Value           =   1  'Checked
            Width           =   4575
         End
         Begin VB.Image imgTTPlayer 
            Height          =   720
            Left            =   0
            Picture         =   "UIApp.ctx":0ECA
            Top             =   0
            Width           =   720
         End
      End
   End
   Begin MSComDlg.CommonDialog CDG 
      Left            =   5160
      Top             =   4560
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame fraWinamp 
      Caption         =   "Winamp"
      ForeColor       =   &H00D54600&
      Height          =   1095
      Left            =   0
      TabIndex        =   3
      Top             =   1170
      Width           =   5655
      Begin VB.PictureBox picWinamp 
         BorderStyle     =   0  'None
         Height          =   735
         Left            =   120
         ScaleHeight     =   735
         ScaleWidth      =   5415
         TabIndex        =   4
         TabStop         =   0   'False
         Top             =   240
         Width           =   5415
         Begin VB.CheckBox chkWinamp 
            Caption         =   "读取 Winamp 播放列表(&A)"
            Height          =   255
            Left            =   840
            TabIndex        =   5
            Top             =   0
            Value           =   1  'Checked
            Width           =   4575
         End
         Begin VB.CommandButton cmdWinamp 
            Height          =   375
            Left            =   840
            TabIndex        =   6
            Top             =   360
            Width           =   4575
         End
         Begin VB.Image imgWinamp 
            Height          =   720
            Left            =   0
            Picture         =   "UIApp.ctx":1D94
            Top             =   0
            Width           =   720
         End
      End
   End
   Begin VB.Frame fraWMP 
      Caption         =   "Windows Media Player"
      ForeColor       =   &H00D54600&
      Height          =   1095
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   5655
      Begin VB.CheckBox chkReadWMP 
         Caption         =   "读取 Windows Media Player 播放列表(&W)"
         Height          =   255
         Left            =   960
         TabIndex        =   2
         Top             =   720
         Value           =   1  'Checked
         Width           =   4575
      End
      Begin VB.Label lblInfo 
         Caption         =   "注意: 只能读取 Windows Media Player 9/10 的播放清单。Windows Media Player 7/8 没测试。"
         Height          =   495
         Left            =   960
         TabIndex        =   1
         Top             =   240
         Width           =   4575
      End
      Begin VB.Image imgWMP 
         Height          =   720
         Left            =   120
         Picture         =   "UIApp.ctx":2C5E
         Top             =   240
         Width           =   720
      End
   End
End
Attribute VB_Name = "UIApp"
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

Private Sub chkFoobar_Click()
  cmdFoobar.Enabled = (chkFoobar.Value = 1)
End Sub

Private Sub chkFoobar9_Click()
  cmdFoobar9.Enabled = (chkFoobar9.Value = 1)
End Sub

Private Sub chkTTPlayer_Click()
  cmdTTPlayer.Enabled = (chkTTPlayer.Value = 1)
End Sub

Private Sub chkWinamp_Click()
  cmdWinamp.Enabled = (chkWinamp.Value = 1)
End Sub

Private Sub cmdFoobar_Click()
  '查找文件
  Dim sPath As String
  
  sPath = cmdFoobar.Caption
  
  If FS.FolderExists(sPath) = False Then
    sPath = CurDir
  End If
  
  If Right(sPath, 1) = "\" Then
    sPath = sPath & "foobar2000.exe"
  Else
    sPath = sPath & "\foobar2000.exe"
  End If
  
  With CDG
    On Error Resume Next
    Err.Clear
    .CancelError = True
    .DefaultExt = "EXE"
    .DialogTitle = "选择 Foobar 主程序位置"
    .FileName = sPath
    .Filter = "foobar2000.exe|foobar2000.exe"
    .Flags = cdlOFNExplorer + cdlOFNExtensionDifferent + cdlOFNFileMustExist + cdlOFNHideReadOnly + cdlOFNLongNames
    
    .ShowOpen
    
    If Err.Number <> cdlCancel Then
      cmdFoobar.Caption = FS.GetParentFolderName(.FileName)
    End If
    
    On Error GoTo 0
  End With
End Sub

Private Sub cmdFoobar9_Click()
  '查找文件
  Dim sPath As String
  
  sPath = cmdFoobar.Caption
  
  If FS.FolderExists(sPath) = False Then
    sPath = CurDir
  End If
  
  If Right(sPath, 1) = "\" Then
    sPath = sPath & "foobar2000.exe"
  Else
    sPath = sPath & "\foobar2000.exe"
  End If
  
  With CDG
    On Error Resume Next
    Err.Clear
    .CancelError = True
    .DefaultExt = "EXE"
    .DialogTitle = "选择 Foobar 0.9.x 主程序位置"
    .FileName = sPath
    .Filter = "foobar2000.exe|foobar2000.exe"
    .Flags = cdlOFNExplorer + cdlOFNExtensionDifferent + cdlOFNFileMustExist + cdlOFNHideReadOnly + cdlOFNLongNames
    
    .ShowOpen
    
    If Err.Number <> cdlCancel Then
      cmdFoobar9.Caption = FS.GetParentFolderName(.FileName)
    End If
    
    On Error GoTo 0
  End With

End Sub

Private Sub cmdTTPlayer_Click()
  '查找文件
  Dim sPath As String
  
  sPath = cmdTTPlayer.Caption
  
  If FS.FolderExists(sPath) = False Then
    sPath = CurDir
  End If
  
  If Right(sPath, 1) = "\" Then
    sPath = sPath & "TTPlayer.exe"
  Else
    sPath = sPath & "\TTPlayer.exe"
  End If
  
  With CDG
    On Error Resume Next
    Err.Clear
    .CancelError = True
    .DefaultExt = "EXE"
    .DialogTitle = "选择千千静听主程序位置"
    .FileName = sPath
    .Filter = "TTPlayer.exe|TTPlayer.exe"
    .Flags = cdlOFNExplorer + cdlOFNExtensionDifferent + cdlOFNFileMustExist + cdlOFNHideReadOnly + cdlOFNLongNames
    
    .ShowOpen
    
    If Err.Number <> cdlCancel Then
      cmdTTPlayer.Caption = FS.GetParentFolderName(.FileName)
    End If
    
    On Error GoTo 0
  End With
End Sub

Private Sub cmdWinamp_Click()
  '查找文件
  Dim sPath As String
  
  sPath = cmdWinamp.Caption
  
  If FS.FolderExists(sPath) = False Then
    sPath = CurDir
  End If
  
  If Right(sPath, 1) = "\" Then
    sPath = sPath & "winamp.exe"
  Else
    sPath = sPath & "\winamp.exe"
  End If
  
  With CDG
    On Error Resume Next
    Err.Clear
    .CancelError = True
    .DefaultExt = "EXE"
    .DialogTitle = "选择 Winamp 主程序位置"
    .FileName = sPath
    .Filter = "winamp.exe|winamp.exe"
    .Flags = cdlOFNExplorer + cdlOFNExtensionDifferent + cdlOFNFileMustExist + cdlOFNHideReadOnly + cdlOFNLongNames
    
    .ShowOpen
    
    If Err.Number <> cdlCancel Then
      cmdWinamp.Caption = FS.GetParentFolderName(.FileName)
    End If
    
    On Error GoTo 0
  End With
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
  '初始化
  chkReadWMP.Value = Abs(CInt(AppWmp))
  chkWinamp.Value = Abs(Len(AppWinamp) > 0)
  chkFoobar.Value = Abs(Len(AppFoobar) > 0)
  chkTTPlayer.Value = Abs(Len(AppTTPlayer) > 0)
  chkFoobar9.Value = Abs(Len(AppFoobar9) > 0)
  
  cmdWinamp.Caption = AppWinamp
  cmdFoobar.Caption = AppFoobar
  cmdTTPlayer.Caption = AppTTPlayer
  cmdFoobar.Caption = AppFoobar9
End Sub

Public Sub Update()
  '更新
  AppWmp = (chkReadWMP.Value = 1)
      
  If chkWinamp.Value = 1 Then AppWinamp = cmdWinamp.Caption Else AppWinamp = vbNullString
  If chkFoobar.Value = 1 Then AppFoobar = cmdFoobar.Caption Else AppFoobar = vbNullString
  If chkTTPlayer.Value = 1 Then AppTTPlayer = cmdTTPlayer.Caption Else AppTTPlayer = vbNullString
  If chkFoobar9.Value = 1 Then AppFoobar9 = cmdFoobar9.Caption Else AppFoobar9 = vbNullString
  
  frmMain.RefreshAppList
End Sub
