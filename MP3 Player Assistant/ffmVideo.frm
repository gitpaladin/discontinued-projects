VERSION 5.00
Object = "{6BF52A50-394A-11D3-B153-00C04F79FAA6}#1.0#0"; "wmp.dll"
Begin VB.Form ffmVideo 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "视频窗口"
   ClientHeight    =   5070
   ClientLeft      =   2775
   ClientTop       =   3645
   ClientWidth     =   5925
   Icon            =   "ffmVideo.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5070
   ScaleWidth      =   5925
   ShowInTaskbar   =   0   'False
   Begin VB.Timer tmrResize 
      Enabled         =   0   'False
      Left            =   4560
      Top             =   1440
   End
   Begin WMPLibCtl.WindowsMediaPlayer WMP 
      Height          =   3840
      Left            =   0
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   0
      Visible         =   0   'False
      Width           =   4020
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "none"
      stretchToFit    =   -1  'True
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   0   'False
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   7091
      _cy             =   6773
   End
End
Attribute VB_Name = "ffmVideo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

'浮动窗口
Private Declare Function SetWindowLong Lib "user32.dll" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private lngOrigParenthWnd As Long

'不活动显示
Private Declare Function ShowWindowAPI Lib "user32.dll" Alias "ShowWindow" (ByVal hWnd As Long, ByVal nCmdShow As Long) As Long

Private Const SW_HIDE As Long = 0
Private Const SW_MAXIMIZE As Long = 3
Private Const SW_MINIMIZE As Long = 6
Private Const SW_SHOWNOACTIVATE As Long = 4

Private Sub Form_Load()
  '设置窗口的状态
  lngOrigParenthWnd = SetWindowLong(Me.hWnd, -8, frmMain.hWnd)
  
  Me.Move frmMain.Left, frmMain.Top + frmMain.Height - 3600, 4800, 3600
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  '如果 用户关闭就隐藏
  If UnloadMode = 0 Then
    ShowWindow False
    Cancel = 1
  Else
    SetWindowLong Me.hWnd, -8, lngOrigParenthWnd
    Cancel = 0
  End If
End Sub

Private Sub Form_Resize()
  '调整内容大小
  WMP.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight
End Sub

Private Sub tmrResize_Timer()
  Dim oPlayerMedia As WMPLibCtl.IWMPMedia
  Dim xPadding As Long
  Dim yPadding As Long
  
  xPadding = Me.Width - Me.ScaleWidth
  yPadding = Me.Height - Me.ScaleHeight
  
  Set oPlayerMedia = WMP.currentMedia
  
  If (oPlayerMedia.getItemInfo("MediaType") = "video") Then
    ffmVideo.Move ffmVideo.Left, ffmVideo.Top - (oPlayerMedia.imageSourceHeight * 15 - ffmVideo.Height + yPadding), oPlayerMedia.imageSourceWidth * 15 + xPadding, oPlayerMedia.imageSourceHeight * 15 + yPadding

    If Not frmMain.mnuVideo.Checked Then
      frmMain.mnuVideo_Click
    End If
  End If
  
  tmrResize.Enabled = False
End Sub

Private Sub WMP_EndOfStream(ByVal Result As Long)
  '播放完成
  frmMain.stbDefault.Panels(2).Text = "(停止)"
  frmMain.mnuStop.Enabled = False
  frmMain.mnuPause.Enabled = False
  frmMain.tbrPlayer.Buttons(3).Enabled = False
  frmMain.tbrPlayer.Buttons(4).Enabled = False
End Sub

Public Sub ShowWindow(ByVal Visible As Boolean)
  '显示窗口
  If Visible Then
    ShowWindowAPI Me.hWnd, SW_SHOWNOACTIVATE
    WMP.Visible = True
  Else
    Hide
    WMP.Visible = False
  End If
  
  frmMain.mnuVideo.Checked = Visible
End Sub

Private Sub WMP_MediaChange(ByVal Item As Object)
  Dim oPlayerMedia As WMPLibCtl.IWMPMedia
  Dim xPadding As Long
  Dim yPadding As Long
  
  xPadding = Me.Width - Me.ScaleWidth
  yPadding = Me.Height - Me.ScaleHeight
  
  Set oPlayerMedia = WMP.currentMedia
  
  If (oPlayerMedia.getItemInfo("MediaType") = "video") Then
    ffmVideo.Move ffmVideo.Left, ffmVideo.Top - (oPlayerMedia.imageSourceHeight * 15 - ffmVideo.Height + yPadding), oPlayerMedia.imageSourceWidth * 15 + xPadding, oPlayerMedia.imageSourceHeight * 15 + yPadding

    If Not frmMain.mnuVideo.Checked Then
      frmMain.mnuVideo_Click
    End If
  End If
  
  tmrResize.Enabled = False
End Sub
