VERSION 5.00
Begin VB.UserControl VSplitter 
   ClientHeight    =   6960
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6735
   ControlContainer=   -1  'True
   PropertyPages   =   "VSplitter.ctx":0000
   ScaleHeight     =   6960
   ScaleWidth      =   6735
   ToolboxBitmap   =   "VSplitter.ctx":0020
   Begin VB.PictureBox picSplitter 
      AutoRedraw      =   -1  'True
      BorderStyle     =   0  'None
      Height          =   6975
      Left            =   2880
      MousePointer    =   9  'Size W E
      ScaleHeight     =   6975
      ScaleWidth      =   255
      TabIndex        =   0
      Top             =   0
      Width           =   255
   End
End
Attribute VB_Name = "VSplitter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'缺省属性值:
Const m_def_SplWidth = 60
Const m_def_SplLeft = 2250

'属性变量:
Dim m_SplWidth As Long
Dim m_SplLeft As Long
Dim m_LeftControls As New Collection
Dim m_RightControls As New Collection

Public MinLeft As Long
Private vHide As HideMode
Public MinRight As Long
Public SplBackColor As OLE_COLOR
Public ResizeMode As LockArea

Public Enum HideMode
  ShowAll = 0
  ShowPart1 = 1
  ShowPart2 = 2
End Enum

Public Enum LockArea
  ByPrecent = 0
  LockPart1 = 1
  LockPart2 = 2
End Enum

Private LastWidth As Long
Private Resizing As Boolean
Public Event ResizeCompleted(ByVal LeftWidth As Single, ByVal Height As Single, ByVal RightWidth As Single, ByVal RightLeft As Single)

'Private Declare Function CreateDC Lib "Gdi32.dll" Alias "CreateDCA" (ByVal lpDriverName As String, ByVal lpDeviceName As String, ByVal lpOutput As String, lpInitData As Long) As Long
'Private Declare Function DeleteDC Lib "Gdi32.dll" (ByVal hdc As Long) As Long
'Private Declare Function GetWindowRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
'Private Declare Function BitBlt Lib "Gdi32.dll" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
'
'Private Type RECT
'  Left As Long
'  Top As Long
'  Right As Long
'  Bottom As Long
'End Type

'注意！不要删除或修改下列被注释的行！
'MemberInfo=8,0,0,4
Public Property Get SplWidth() As Long
Attribute SplWidth.VB_Description = "分割线宽度。"
  SplWidth = m_SplWidth
End Property

Public Property Let SplWidth(ByVal New_SplWidth As Long)
  m_SplWidth = New_SplWidth
  PropertyChanged "SplWidth"
  Refresh
End Property

'注意！不要删除或修改下列被注释的行！
'MemberInfo=8,1,0,500
Public Property Get SplLeft() As Long
Attribute SplLeft.VB_Description = "分割线左边距离。"
  SplLeft = m_SplLeft
End Property

Public Property Let SplLeft(ByVal New_SplLeft As Long)
'  If Ambient.UserMode Then Err.Raise 382
  m_SplLeft = New_SplLeft
  PropertyChanged "SplLeft"
  Refresh

End Property

'注意！不要删除或修改下列被注释的行！
'MappingInfo=picSplitter,picSplitter,-1,BackColor
'注意！不要删除或修改下列被注释的行！
'MemberInfo=14,0,0,0
Public Property Get LeftControls() As Collection
Attribute LeftControls.VB_Description = "左边窗口的控件的集合。"
  Set LeftControls = m_LeftControls
End Property

Public Property Set LeftControls(ByVal New_LeftControls As Collection)
  Set m_LeftControls = New_LeftControls
  PropertyChanged "LeftControls"
End Property

'注意！不要删除或修改下列被注释的行！
'MemberInfo=14,0,0,0
Public Property Get RightControls() As Collection
Attribute RightControls.VB_Description = "右边窗口的控件的集合。"
  Set RightControls = m_RightControls
End Property

Public Property Set RightControls(ByVal New_RightControls As Collection)
  Set m_RightControls = New_RightControls
  PropertyChanged "RightControls"
End Property

'注意！不要删除或修改下列被注释的行！
'MemberInfo=14
Public Sub Refresh()
  '现在更新
  Dim x As Long, y As Long
  Dim Width As Long
  Dim i As Long
  Dim CtnCtl As Object
  Dim NewLeft As Long
  
  x = UserControl.Width
  y = UserControl.Height
  
  picSplitter.Move m_SplLeft, 0, m_SplWidth, y
  
  If UserControl.ContainedControls.Count = 0 Then Exit Sub
  
  If LastWidth <> 0 And ResizeMode <> LockPart1 Then
    If ResizeMode = ByPrecent Then
      NewLeft = (x - m_SplWidth) * (m_SplLeft / (LastWidth - m_SplWidth))
    Else
      NewLeft = x - LastWidth + m_SplLeft
    End If
    
    If NewLeft > MinLeft Then
      m_SplLeft = NewLeft
      PropertyChanged "SplLeft"
      picSplitter.Left = NewLeft
    End If
  End If
  
  On Error Resume Next
  For i = 0 To UserControl.ContainedControls.Count - 1
    Set CtnCtl = UserControl.ContainedControls(i)
    
    If vHide = ShowAll Then
      picSplitter.Visible = True
    
      If IsInCollection(CtnCtl.Name, m_LeftControls) Then
        CtnCtl.Visible = True
        CtnCtl.Left = 0
        CtnCtl.Top = 0
        CtnCtl.Width = m_SplLeft
        CtnCtl.Height = y
      ElseIf IsInCollection(CtnCtl.Name, m_RightControls) Then
        CtnCtl.Visible = True
        CtnCtl.Left = m_SplLeft + m_SplWidth
        CtnCtl.Top = 0
        CtnCtl.Width = x - m_SplLeft - m_SplWidth
        CtnCtl.Height = y
      End If
    ElseIf vHide = HideLeft Then
      picSplitter.Visible = False
      
      If IsInCollection(CtnCtl.Name, m_LeftControls) Then
        CtnCtl.Visible = True
        
        CtnCtl.Left = 0
        CtnCtl.Top = 0
        CtnCtl.Width = x
        CtnCtl.Height = y
      ElseIf IsInCollection(CtnCtl.Name, m_RightControls) Then
        CtnCtl.Visible = False
      End If
    Else
      picSplitter.Visible = False
      
      If IsInCollection(CtnCtl.Name, m_LeftControls) Then
        CtnCtl.Visible = False
      ElseIf IsInCollection(CtnCtl.Name, m_RightControls) Then
        CtnCtl.Visible = True
        
        CtnCtl.Left = 0
        CtnCtl.Top = 0
        CtnCtl.Width = x
        CtnCtl.Height = y
      End If
    End If
  Next i
  
  LastWidth = x
  
  RaiseEvent ResizeCompleted(m_SplLeft, UserControl.Height, UserControl.Width - m_SplLeft - SplWidth, m_SplLeft + m_SplWidth)
  On Error GoTo 0
End Sub

Private Sub picSplitter_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  Resizing = True
  SplLeft = picSplitter.Left
  picSplitter.BackColor = SplBackColor
  picSplitter.ZOrder 0
End Sub

Private Sub picSplitter_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
  Dim SizX As Long
  Dim hDCscr As Long
  'Dim PicRect As RECT
  Dim PicX As Long, PicY As Long
  
  SizX = picSplitter.Left + x
  
  If Resizing Then
    If SizX < MinLeft Then
      picSplitter.Left = MinLeft
    ElseIf SizX > (UserControl.Width - m_SplWidth - MinRight) Then
      picSplitter.Left = (UserControl.Width - m_SplWidth - MinRight)
    Else
      picSplitter.Left = SizX
    End If
    
'    '绘制透明部分
'    picSplitter.Visible = False
'    picSplitter.Cls
'    DoEvents
'
'    GetWindowRect picSplitter.hwnd, PicRect
'    PicX = picSplitter.ScaleX(m_SplWidth, vbTwips, vbPixels)
'    PicY = picSplitter.ScaleY(UserControl.Height, vbTwips, vbPixels)
'
'    '创建屏幕句柄
'    hDCscr = CreateDC("DISPLAY", "", "", 0)
'    '将屏幕拷贝的图片框中
'    BitBlt picSplitter.hdc, 0, 0, PicX, PicY, hDCscr, PicRect.Left, PicRect.Top, vbSrcErase
'    '删除创建的句柄
'    DeleteDC hDCscr
'    picSplitter.Visible = True
'    picSplitter.Refresh
  End If
End Sub

Private Sub picSplitter_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  Resizing = False
  picSplitter.BackColor = &H8000000F
  SplLeft = picSplitter.Left
End Sub

'为用户控件初始化属性
Private Sub UserControl_InitProperties()
  m_SplWidth = m_def_SplWidth
  m_SplLeft = m_def_SplLeft
  MinLeft = 350
  MinRight = 350
  
  Hide = ShowAll
  
  Set m_LeftControls = New Collection
  Set m_RightControls = New Collection
End Sub


'从存贮器中加载属性值
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  Dim i As Long, j As Long
  
  m_SplWidth = PropBag.ReadProperty("SplWidth", m_def_SplWidth)
  m_SplLeft = PropBag.ReadProperty("SplLeft", m_def_SplLeft)
  MinLeft = PropBag.ReadProperty("MinLeft", 350)
  MinRight = PropBag.ReadProperty("MinRight", 350)
  Hide = PropBag.ReadProperty("Hide", ShowAll)
  picSplitter.BackColor = &H8000000F
  ResizeMode = PropBag.ReadProperty("ResizeMode", 0)
  
  For i = 1 To PropBag.ReadProperty("LeftCtlCount", 0)
    m_LeftControls.Add PropBag.ReadProperty("LeftCtl" & i), PropBag.ReadProperty("LeftCtl" & i)
  Next i
  
  For i = 1 To PropBag.ReadProperty("RightCtlCount", 0)
    m_RightControls.Add PropBag.ReadProperty("RightCtl" & i), PropBag.ReadProperty("RightCtl" & i)
  Next i
End Sub

Private Sub UserControl_Resize()
  Refresh
End Sub

Private Sub UserControl_Show()
  Refresh
End Sub

'将属性值写到存储器
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Dim i As Long
  
  Call PropBag.WriteProperty("SplWidth", m_SplWidth, m_def_SplWidth)
  Call PropBag.WriteProperty("SplLeft", m_SplLeft, m_def_SplLeft)
  Call PropBag.WriteProperty("MinLeft", MinLeft, 350)
  Call PropBag.WriteProperty("MinRight", MinRight, 350)
  Call PropBag.WriteProperty("Hide", Hide, ShowAll)
  Call PropBag.WriteProperty("SplBackColor", picSplitter.BackColor, &H8000000F)
  Call PropBag.WriteProperty("LeftCtlCount", m_LeftControls.Count, 0)
  Call PropBag.WriteProperty("RightCtlCount", m_RightControls.Count, 0)
  Call PropBag.WriteProperty("ResizeMode", ResizeMode, 0)
 
  For i = 1 To m_LeftControls.Count
    Call PropBag.WriteProperty("LeftCtl" & i, m_LeftControls(i), 0)
  Next i
  
  For i = 1 To m_RightControls.Count
    Call PropBag.WriteProperty("RightCtl" & i, m_RightControls(i), 0)
  Next i
End Sub

Public Function TMPInnerControls() As ContainedControls
  Set TMPInnerControls = UserControl.ContainedControls
End Function

Private Function IsInCollection(Item, ByVal Collection As Collection) As Boolean
  On Error Resume Next
  Err.Clear
  
  Collection.Item Item
  
  If Err = 0 Then IsInCollection = True Else IsInCollection = False
  
  On Error GoTo 0
End Function

Public Property Get Hide() As HideMode
  Hide = vHide
End Property

Public Property Let Hide(ByVal vNewValue As HideMode)
  vHide = vNewValue
  UserControl.PropertyChanged "Hide"
  Refresh
End Property
