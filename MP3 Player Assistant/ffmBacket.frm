VERSION 5.00
Begin VB.Form ffmBacket 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   ClientHeight    =   2430
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   2955
   ControlBox      =   0   'False
   Icon            =   "ffmBacket.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   OLEDropMode     =   1  'Manual
   Picture         =   "ffmBacket.frx":000C
   ScaleHeight     =   162
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   197
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  '窗口缺省
   Begin VB.Timer tmrDelay 
      Enabled         =   0   'False
      Left            =   840
      Top             =   960
   End
   Begin VB.Image imgPlus 
      Height          =   240
      Left            =   165
      Picture         =   "ffmBacket.frx":0ED6
      Top             =   1785
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Shape shpContent 
      BackColor       =   &H000000FF&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H000000FF&
      FillColor       =   &H80000008&
      Height          =   540
      Left            =   90
      Top             =   90
      Visible         =   0   'False
      Width           =   90
   End
   Begin VB.Shape shpDiskBack 
      BackStyle       =   1  'Opaque
      BorderColor     =   &H000E7AD7&
      Height          =   600
      Left            =   60
      Top             =   60
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.Menu popUp 
      Caption         =   "popUp"
      Begin VB.Menu mnuShowMainWindow 
         Caption         =   "打开/隐藏(&S)"
      End
      Begin VB.Menu mnuBlank1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFloat 
         Caption         =   "悬浮窗(&Z)"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuShowInfo 
         Caption         =   "显示相关信息(&I)"
      End
      Begin VB.Menu mnuTransparency 
         Caption         =   "透明度(&Y)..."
      End
      Begin VB.Menu mnuBlank2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuOption 
         Caption         =   "选项(&O)..."
      End
      Begin VB.Menu mnuLoad 
         Caption         =   "加载列表文件(&L)..."
      End
      Begin VB.Menu mnuSelectPlayer 
         Caption         =   "选择MP3播放器(&S)..."
      End
      Begin VB.Menu mnuSelectTemplate 
         Caption         =   "选择重命名模板(&T)..."
      End
      Begin VB.Menu mnuSort 
         Caption         =   "排序(&R).."
      End
      Begin VB.Menu mnuCopy 
         Caption         =   "开始复制(&C)..."
      End
      Begin VB.Menu mnuBlank3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "退出(&X)"
      End
   End
End
Attribute VB_Name = "ffmBacket"
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

'透明窗体的 API
Const LWA_COLORKEY = &H1
Const LWA_ALPHA = &H2
Const GWL_EXSTYLE = (-20)
Const WS_EX_LAYERED = &H80000
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hwnd As Long, ByVal crKey As Long, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long

'翻译颜色的 API
Private Declare Function TranslateColor Lib "olepro32.dll" Alias "OleTranslateColor" (ByVal clr As OLE_COLOR, ByVal palet As Long, col As Long) As Long

'拖动窗体的 API
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function SetCapture Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function ReleaseCapture Lib "user32" () As Long
Const WM_NCLBUTTONDOWN = &HA1
Const HTCAPTION = 2

'绘制文字的 API
Private Declare Function DrawTextEx Lib "user32" Alias "DrawTextExA" (ByVal hdc As Long, ByVal lpsz As String, ByVal N As Long, lpRect As RECT, ByVal un As Long, lpDrawTextParams As Any) As Long

Private Const DT_BOTTOM = &H8
Private Const DT_CALCRECT = &H400
Private Const DT_CENTER = &H1
Private Const DT_CHARSTREAM = 4
Private Const DT_DISPFILE = 6
Private Const DT_EXPANDTABS = &H40
Private Const DT_EXTERNALLEADING = &H200
Private Const DT_INTERNAL = &H1000
Private Const DT_METAFILE = 5
Private Const DT_LEFT = &H0
Private Const DT_NOCLIP = &H100
Private Const DT_NOPREFIX = &H800
Private Const DT_PLOTTER = 0
Private Const DT_RASCAMERA = 3
Private Const DT_RASDISPLAY = 1
Private Const DT_RASPRINTER = 2
Private Const DT_RIGHT = &H2
Private Const DT_SINGLELINE = &H20
Private Const DT_TABSTOP = &H80
Private Const DT_TOP = &H0
Private Const DT_VCENTER = &H4
Private Const DT_WORDBREAK = &H10

'关于矩形的 API
Private Declare Function SetRect Lib "user32" (lpRect As RECT, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long

Private Type RECT
        Left As Long
        Top As Long
        Right As Long
        Bottom As Long
End Type

'获得 Windows 的版本
Private Declare Function GetVersionEx Lib "kernel32.dll" Alias "GetVersionExA" (ByRef lpVersionInformation As OSVERSIONINFO) As Long

Private Type OSVERSIONINFO
  dwOSVersionInfoSize As Long
  dwMajorVersion As Long
  dwMinorVersion As Long
  dwBuildNumber As Long
  dwPlatformId As Long
  szCSDVersion As String * 128 ' Maintenance string for PSS usage
End Type

'恢复窗口的 API
Private Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Const SW_SHOWNORMAL = 1
Const SW_SHOW = 5

'当前窗体的状态
Private bStatus As Boolean
Private MouseLeave As Boolean
Private bBusying As Boolean

'一些自定义的成员
Private Type COLOR_ELEMENT
  bRed As Byte
  bGreen As Byte
  bBue As Byte
End Type

Public Sub UpdateWindow(Optional ByVal Visible As Boolean = True)
  '显示或隐藏悬浮窗的过程
  If bStatus = Visible Then Exit Sub
  
  If Visible Then
    Load Me
    
    Select Case FloatWindowProperty.cfpPosition
    Case FLOAT_POSITION.fpCenter
      Me.Move (Screen.Width - Me.Width) / 2, (Screen.Height - Me.Height) / 2
    Case FLOAT_POSITION.fpLeftBottom
      Me.Move FloatWindowProperty.lAnchorHorizon, Screen.Height - Me.Height - FloatWindowProperty.lAnchorVertical
    Case FLOAT_POSITION.fpLeftMiddle
      Me.Move FloatWindowProperty.lAnchorHorizon, (Screen.Height - Me.Height) / 2
    Case FLOAT_POSITION.fpLeftTop
      Me.Move FloatWindowProperty.lAnchorHorizon, FloatWindowProperty.lAnchorVertical
    Case FLOAT_POSITION.fpMiddleBottom
      Me.Move (Screen.Width - Me.Width) / 2, Screen.Height - Me.Height - FloatWindowProperty.lAnchorVertical
    Case FLOAT_POSITION.fpMiddleTop
      Me.Move (Screen.Width - Me.Width) / 2, FloatWindowProperty.lAnchorVertical
    Case FLOAT_POSITION.fpRightBottom
      Me.Move Screen.Width - Me.Width - FloatWindowProperty.lAnchorHorizon, Screen.Height - Me.Height - FloatWindowProperty.lAnchorVertical
    Case FLOAT_POSITION.fpRightMiddle
      Me.Move Screen.Width - Me.Width - FloatWindowProperty.lAnchorHorizon, (Screen.Height - Me.Height) / 2
    Case FLOAT_POSITION.fpRightTop
      Me.Move Screen.Width - Me.Width - FloatWindowProperty.lAnchorHorizon, FloatWindowProperty.lAnchorVertical
    End Select
    
    Me.Show
    Call SetWindowPos(Me.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE)
    UpdateDiskBar (SpaceAdded / (SpaceTotal - SpaceUsed))
    tmrDelay.Interval = FloatWindowProperty.lAddInfoDelay
    mnuShowInfo.Checked = FloatWindowProperty.bShowInfo
    mnuTransparency.Enabled = IsWin2kLater
    SetTransparency FloatWindowProperty.bTransparency
    bStatus = True
  Else
    Call SetWindowPos(Me.hwnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE)
    Unload Me
    bStatus = False
  End If
End Sub

Public Sub UpdateDiskBar(Optional Percent As Double = 0)
  '更新磁盘空间的显示
  Dim dHeight As Double
  Dim ocBack As OLE_COLOR
  
  dHeight = 36 * Percent
  ocBack = CalcColor(&H7200&, &HA7&, Percent)
  
  If Percent = 0 Then
    shpContent.BackColor = vbWhite
    shpContent.BorderColor = vbWhite
  Else
    shpContent.BorderColor = ocBack
    shpContent.BackColor = ocBack
  End If
  
  shpDiskBack.BorderColor = ocBack
  
  '移动图形
  If Percent = 0 Then
    shpContent.Height = 1
    shpContent.Top = 42 - shpContent.Height
  Else
    shpContent.Height = dHeight
    shpContent.Top = 42 - shpContent.Height
  End If
End Sub

Public Sub ShowDiskBar(Optional ByVal Visible As Boolean = True)
  shpContent.Visible = Visible
  shpDiskBack.Visible = Visible
End Sub

Private Sub Form_DblClick()
  mnuShowMainWindow_Click
End Sub

Private Sub Form_Load()
  Me.Height = 750
  Me.Width = 750
  popUp.Visible = False
End Sub

Private Function CalcColor(Optional BeginColor As OLE_COLOR = 255, Optional EndColor As OLE_COLOR = 65280, Optional Percent As Double = 0) As OLE_COLOR
  '计算该使用什么颜色
  Dim ceBegin As COLOR_ELEMENT
  Dim ceEnd As COLOR_ELEMENT
  Dim ceRtl As COLOR_ELEMENT
  
  '获得颜色
  ceBegin = GetColorElement(BeginColor)
  ceEnd = GetColorElement(EndColor)
  
  '按照百分比分析颜色
  ceRtl.bBue = ceBegin.bBue + (CDbl(ceEnd.bBue) - CDbl(ceBegin.bBue)) * Percent
  ceRtl.bGreen = ceBegin.bGreen + (CDbl(ceEnd.bGreen) - CDbl(ceBegin.bGreen)) * Percent
  ceRtl.bRed = ceBegin.bRed + (CDbl(ceEnd.bRed) - CDbl(ceBegin.bRed)) * Percent
  
  '返回颜色值
  CalcColor = RGB(ceRtl.bRed, ceRtl.bGreen, ceRtl.bBue)
End Function

Private Function GetColorElement(ByVal Color As OLE_COLOR) As COLOR_ELEMENT
  Dim RealColor As Long
  Dim ceTemp As COLOR_ELEMENT
  
  TranslateColor Color, 0, RealColor
  
  ceTemp.bRed = RealColor And &HFF&
  ceTemp.bGreen = (RealColor And &HFF00&) / 2 ^ 8
  ceTemp.bBue = (RealColor And &HFF0000) / 2 ^ 16
  
  GetColorElement = ceTemp
End Function

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  '显示弹出菜单
  ShowDiskBar False
  If Button = vbRightButton Then Me.PopupMenu popUp
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Dim lngReturnValue As Long
  
  MouseLeave = (0 <= X) And (X <= Me.ScaleWidth) And (0 <= Y) And (Y <= Me.ScaleHeight)
    
  '显示磁盘空间
  If FloatWindowProperty.bShowInfo And (Not bBusying) Then
    If MouseLeave Then
      ShowDiskBar True
      SetCapture Me.hwnd
    Else
      If Not tmrDelay.Enabled Then ShowDiskBar False
      ReleaseCapture
    End If
  End If
  
  If Button = 1 Then
    '释放鼠标捕获
    Call ReleaseCapture
    '重新发送消息给窗体，来处理移动窗体
    lngReturnValue = SendMessage(Me.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
    
    '写入当前的大小
    Select Case FloatWindowProperty.cfpPosition
    Case FLOAT_POSITION.fpLeftBottom
      FloatWindowProperty.lAnchorHorizon = Me.Left
      FloatWindowProperty.lAnchorVertical = Screen.Height - Me.Height - Me.Top
    Case FLOAT_POSITION.fpLeftMiddle
      FloatWindowProperty.lAnchorHorizon = Me.Left
    Case FLOAT_POSITION.fpLeftTop
      FloatWindowProperty.lAnchorHorizon = Me.Left
      FloatWindowProperty.lAnchorVertical = Me.Top
    Case FLOAT_POSITION.fpMiddleBottom
      FloatWindowProperty.lAnchorVertical = Screen.Height - Me.Height - Me.Top
    Case FLOAT_POSITION.fpMiddleTop
      FloatWindowProperty.lAnchorVertical = Screen.Height - Me.Height - Me.Top
    Case FLOAT_POSITION.fpRightBottom
      FloatWindowProperty.lAnchorHorizon = Screen.Width - Me.Width - Me.Left
      FloatWindowProperty.lAnchorVertical = Screen.Height - Me.Height - Me.Top
    Case FLOAT_POSITION.fpRightMiddle
      FloatWindowProperty.lAnchorHorizon = Screen.Width - Me.Width - Me.Left
    Case FLOAT_POSITION.fpRightTop
      FloatWindowProperty.lAnchorHorizon = Screen.Width - Me.Width - Me.Left
      FloatWindowProperty.lAnchorVertical = Me.Top
    End Select
  End If
End Sub

Private Sub Form_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  '开始添加文件
  Dim i As Long
  Dim oFiles As New VBA.Collection
  Dim oExist As New VBA.Collection
  Dim sAddNo As String
  Dim sfile As String
  Dim iItem As MSComctlLib.ListItem
  Dim bNoSpace As Boolean
  Dim dSpace As Double
  Dim nItems As New VBA.Collection
  Dim oLVW As MSComctlLib.ListView
  
  If Data.GetFormat(vbCFFiles) Then
    dSpace = SpaceTotal - SpaceUsed - SpaceAdded
    sAddNo = "没有足够的空间添加以下文件。" & vbCrLf & vbCrLf
    
    bBusying = True
    Me.MousePointer = 11
    
    For i = 1 To Data.Files.Count
      sfile = Data.Files.Item(i)
    
      If FS.FileExists(sfile) Then
        If ItemExist(sfile, frmMain.PlayListKeys) Then
          oExist.Add sfile
        Else
          dSpace = dSpace - FS.GetFile(sfile).Size
          
          If dSpace < 0 Then
            '没有空间了
            bNoSpace = True
            sAddNo = sAddNo & sfile & vbCrLf
          Else
            oFiles.Add sfile
          End If
        End If
      End If
    Next i
    
    If bNoSpace Then
      sAddNo = sAddNo & vbCrLf & "是否继续？"
      
      If MsgBox(sAddNo, vbQuestion + vbYesNo) = vbNo Then Exit Sub
    End If
    
    '添加文件
    If oFiles.Count Then
      frmMain.AddFile oFiles
    End If
    
    '重新选择
    For i = 1 To frmMain.lvwList.ListItems.Count
      frmMain.lvwList.ListItems(i).Selected = False
    Next i
    
    For i = 1 To oExist.Count
      frmMain.lvwList.ListItems(frmMain.PlayListKeys(oExist(i))).Selected = True
    Next i
    
    If FloatWindowProperty.bShowInfo Then
      ShowDiskBar True
      DrawAddFile Data.Files.Count
      tmrDelay.Enabled = True
    End If
  
    bBusying = False
    Me.MousePointer = 0
  End If
End Sub

Private Sub Form_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
  '开始接受数据
  If Data.GetFormat(vbCFFiles) Then
    '说明是文件拖动
    Effect = vbDropEffectCopy
  Else
    Effect = vbDropEffectNone
  End If
End Sub

Private Sub Form_Resize()
  Debug.Print "Resize"
End Sub

Public Sub DrawAddFile(ByVal lCount As Long)
  '首先绘制加号图标
  Call Me.Cls
  Call Me.PaintPicture(imgPlus.Picture, 19, 7)
  
  '绘制文字
  Dim sDraw As String
  Dim r As RECT
  
  sDraw = FormatNumber(lCount, 0)
  SetRect r, 16, 24, 40, 40
  
  Me.ForeColor = 25856
  DrawTextEx Me.hdc, sDraw, Len(sDraw), AdjustRect(r, -1, -1), DT_SINGLELINE Or DT_VCENTER Or DT_CENTER, ByVal 0&
  DrawTextEx Me.hdc, sDraw, Len(sDraw), AdjustRect(r, -1, 0), DT_SINGLELINE Or DT_VCENTER Or DT_CENTER, ByVal 0&
  DrawTextEx Me.hdc, sDraw, Len(sDraw), AdjustRect(r, -1, 1), DT_SINGLELINE Or DT_VCENTER Or DT_CENTER, ByVal 0&
  DrawTextEx Me.hdc, sDraw, Len(sDraw), AdjustRect(r, 0, -1), DT_SINGLELINE Or DT_VCENTER Or DT_CENTER, ByVal 0&
  DrawTextEx Me.hdc, sDraw, Len(sDraw), AdjustRect(r, 0, 1), DT_SINGLELINE Or DT_VCENTER Or DT_CENTER, ByVal 0&
  DrawTextEx Me.hdc, sDraw, Len(sDraw), AdjustRect(r, 1, -1), DT_SINGLELINE Or DT_VCENTER Or DT_CENTER, ByVal 0&
  DrawTextEx Me.hdc, sDraw, Len(sDraw), AdjustRect(r, 1, 0), DT_SINGLELINE Or DT_VCENTER Or DT_CENTER, ByVal 0&
  DrawTextEx Me.hdc, sDraw, Len(sDraw), AdjustRect(r, 1, -1), DT_SINGLELINE Or DT_VCENTER Or DT_CENTER, ByVal 0&
  
  Me.ForeColor = 10087577
  DrawTextEx Me.hdc, sDraw, Len(sDraw), r, DT_SINGLELINE Or DT_VCENTER Or DT_CENTER, ByVal 0&
End Sub

Private Function AdjustRect(ByRef r As RECT, ByVal Horizon As Long, ByVal Vertical As Long) As RECT
  '微调矩形
  Dim tmpR As RECT
  
  tmpR.Bottom = r.Bottom + Vertical
  tmpR.Left = r.Left + Horizon
  tmpR.Right = r.Right + Horizon
  tmpR.Top = r.Top + Vertical
  
  AdjustRect = tmpR
End Function

Private Sub mnuCopy_Click()
  If frmMain.WindowState = vbMinimized Then mnuShowMainWindow_Click
  frmMain.mnuCopy_Click
End Sub

Private Sub mnuExit_Click()
  Unload frmMain
End Sub

Private Sub mnuFloat_Click()
  frmMain.mnuFloatWindow_Click
End Sub

Private Sub mnuLoad_Click()
  frmMain.mnuLoad_Click
End Sub

Private Sub mnuOption_Click()
  dlgOption.ShowPage 1
End Sub

Private Sub mnuSelectPlayer_Click()
  dlgSelectPlayer.bStarting = False
  dlgSelectPlayer.Show 1
End Sub

Private Sub mnuSelectTemplate_Click()
  frmMain.mnuChangeFileName_Click
End Sub

Private Sub mnuShowInfo_Click()
  mnuShowInfo.Checked = Not mnuShowInfo.Checked
  FloatWindowProperty.bShowInfo = mnuShowInfo.Checked
  ShowDiskBar mnuShowInfo.Checked
End Sub

Private Sub mnuShowMainWindow_Click()
  If frmMain.WindowState = vbMinimized Then
    ShowWindow frmMain.hwnd, SW_SHOWNORMAL
  Else
    frmMain.WindowState = vbMinimized
  End If
End Sub

Private Sub mnuSort_Click()
  dlgSelSortKey.Show 1
End Sub

Private Sub mnuTransparency_Click()
  dlgTransparency.Show 1
  SetTransparency FloatWindowProperty.bTransparency
End Sub

Private Sub tmrDelay_Timer()
  '清空区域
  Me.Cls
  If Not MouseLeave Then ShowDiskBar False
  tmrDelay.Enabled = False
End Sub

Private Sub SetTransparency(Optional ByVal Transparency As Byte = 255)
  If Not IsWin2kLater Then Exit Sub
  
  Dim Ret As Long
  
  If Transparency < 255 Then
    '透明
    Ret = GetWindowLong(Me.hwnd, GWL_EXSTYLE)
    Ret = Ret Or WS_EX_LAYERED
    SetWindowLong Me.hwnd, GWL_EXSTYLE, Ret
    SetLayeredWindowAttributes Me.hwnd, 0, Transparency, LWA_ALPHA
  Else
    '不透明
    Ret = GetWindowLong(Me.hwnd, GWL_EXSTYLE)
    Ret = (Ret Or WS_EX_LAYERED) - WS_EX_LAYERED
    SetWindowLong Me.hwnd, GWL_EXSTYLE, Ret
  End If
  
  Me.BorderStyle = 0
End Sub

Private Function IsWin2kLater() As Boolean
  '判断是否是 Windows 2000 以上的版本
  Dim myOS As OSVERSIONINFO
  myOS.dwOSVersionInfoSize = Len(myOS)
  GetVersionEx myOS
  IsWin2kLater = (myOS.dwMajorVersion >= 5)
End Function
