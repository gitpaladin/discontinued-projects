VERSION 5.00
Begin VB.Form frmSplash 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   ClientHeight    =   4500
   ClientLeft      =   210
   ClientTop       =   1365
   ClientWidth     =   7500
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmSplash.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmSplash.frx":628A
   ScaleHeight     =   4500
   ScaleWidth      =   7500
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '屏幕中心
   Begin VB.Label lblWarning 
      BackStyle       =   0  'Transparent
      Caption         =   "这个版本正在测试中，如果使用中出现错误，请使用上一个正式版。"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00EA0023&
      Height          =   375
      Left            =   3600
      TabIndex        =   1
      Top             =   2880
      Visible         =   0   'False
      Width           =   3615
   End
   Begin VB.Label lblInfo 
      BackStyle       =   0  'Transparent
      Caption         =   "正在..."
      Height          =   180
      Left            =   3600
      TabIndex        =   0
      Top             =   3240
      Width           =   3615
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

'使窗体最前方
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Private Const HWND_BOTTOM = 1
Private Const HWND_TOP = 0
Private Const HWND_TOPMOST = -1
Private Const HWND_NOTOPMOST = -2

Private Const SWP_DRAWFRAME = &H20
Private Const SWP_FRAMECHANGED = &H20
Private Const SWP_HIDEWINDOW = &H80
Private Const SWP_NOACTIVATE = &H10
Private Const SWP_NOCOPYBITS = &H100
Private Const SWP_NOMOVE = &H2
Private Const SWP_NOOWNERZORDER = &H200
Private Const SWP_NOREDRAW = &H8
Private Const SWP_NOREPOSITION = 512
Private Const SWP_NOSIZE = &H1
Private Const SWP_NOZORDER = &H4
Private Const SWP_SHOWWINDOW = &H40

Public Sub SetInfo(ByVal Info As String)
  lblInfo.Caption = Info
  DoEvents
End Sub

Public Sub ShowMe()
  Me.Show
  Call SetWindowPos(Me.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE)
End Sub

Public Sub BringToFront(ByVal Top As Boolean)
  If Top Then
    Call SetWindowPos(Me.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE)
  Else
    Call SetWindowPos(Me.hwnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE)
  End If
End Sub
