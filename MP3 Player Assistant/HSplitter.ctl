VERSION 5.00
Begin VB.UserControl HSplitter 
   Alignable       =   -1  'True
   ClientHeight    =   6960
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6735
   ControlContainer=   -1  'True
   PropertyPages   =   "HSplitter.ctx":0000
   ScaleHeight     =   6960
   ScaleWidth      =   6735
   ToolboxBitmap   =   "HSplitter.ctx":0010
   Begin VB.PictureBox picSplitter 
      BorderStyle     =   0  'None
      Height          =   255
      Left            =   0
      MousePointer    =   7  'Size N S
      ScaleHeight     =   255
      ScaleWidth      =   6735
      TabIndex        =   0
      Top             =   4560
      Width           =   6735
   End
End
Attribute VB_Name = "HSplitter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'缺省属性值:
Const m_def_SplHeight = 60
Const m_def_SplTop = 2250

'属性变量:
Dim m_SplHeight As Long
Dim m_SplTop As Long
Dim m_TopControls As New Collection
Dim m_BottomControls As New Collection

Public MinTop As Long
Public MinBottom As Long
Private vHide As HideMode
Public SplBackColor As OLE_COLOR
Public ResizeMode As LockArea

Private Resizing As Boolean
Private LastHeight As Long

Public Event ResizeCompleted(ByVal TopHeihgt As Single, ByVal BottomHeight As Single, ByVal BottomTop As Single, ByVal Width As Single)

'注意！不要删除或修改下列被注释的行！
'MemberInfo=8,0,0,4
Public Property Get SplHeight() As Long
Attribute SplHeight.VB_Description = "分割线宽度。"
  SplHeight = m_SplHeight
End Property

Public Property Let SplHeight(ByVal New_SplHeight As Long)
  m_SplHeight = New_SplHeight
  PropertyChanged "SplHeight"
  Refresh
End Property

'注意！不要删除或修改下列被注释的行！
'MemberInfo=8,1,0,500
Public Property Get SplTop() As Long
Attribute SplTop.VB_Description = "分割线左边距离。"
  SplTop = m_SplTop
End Property

Public Property Let SplTop(ByVal New_SplTop As Long)
'  If Ambient.UserMode Then Err.Raise 382
  m_SplTop = New_SplTop
  PropertyChanged "SplTop"
  Refresh
End Property

'注意！不要删除或修改下列被注释的行！
'MappingInfo=picSplitter,picSplitter,-1,BackColor
'注意！不要删除或修改下列被注释的行！
'MemberInfo=14,0,0,0
Public Property Get TopControls() As Collection
Attribute TopControls.VB_Description = "左边窗口的控件的集合。"
  Set TopControls = m_TopControls
End Property

Public Property Set TopControls(ByVal New_TopControls As Collection)
  Set m_TopControls = New_TopControls
  PropertyChanged "TopControls"
End Property

'注意！不要删除或修改下列被注释的行！
'MemberInfo=14,0,0,0
Public Property Get BottomControls() As Collection
Attribute BottomControls.VB_Description = "右边窗口的控件的集合。"
  Set BottomControls = m_BottomControls
End Property

Public Property Set BottomControls(ByVal New_BottomControls As Collection)
  Set m_BottomControls = New_BottomControls
  PropertyChanged "BottomControls"
End Property

'注意！不要删除或修改下列被注释的行！
'MemberInfo=14
Public Sub Refresh()
  '现在更新
  Dim X As Long, Y As Long
  Dim Height As Long
  Dim i As Long
  Dim CtnCtl As Object
  Dim NewTop As Long
  
  X = UserControl.Width
  Y = UserControl.Height
  
  picSplitter.Move 0, m_SplTop, X, m_SplHeight
  
  If UserControl.ContainedControls.Count = 0 Then Exit Sub
  
  If LastHeight <> 0 And ResizeMode <> LockPart1 Then
    If ResizeMode = ByPrecent Then
      NewTop = (Y - m_SplHeight) * (m_SplTop / (LastHeight - m_SplHeight))
    Else
      NewTop = Y - LastHeight + m_SplTop
    End If
    
    If NewTop > MinTop Then
      m_SplTop = NewTop
      PropertyChanged "SplTop"
      picSplitter.Top = NewTop
    End If
  End If
  
  On Error Resume Next
  For i = 0 To UserControl.ContainedControls.Count - 1
    Set CtnCtl = UserControl.ContainedControls(i)
    
    If vHide = ShowAll Then
      picSplitter.Visible = True
    
      If IsInCollection(CtnCtl.Name, m_TopControls) Then
        CtnCtl.Visible = True
        
        CtnCtl.Top = 0
        CtnCtl.Left = 0
        CtnCtl.Height = m_SplTop
        CtnCtl.Width = X
      ElseIf IsInCollection(CtnCtl.Name, m_BottomControls) Then
        CtnCtl.Visible = True
        
        CtnCtl.Top = m_SplTop + m_SplHeight
        CtnCtl.Left = 0
        CtnCtl.Height = Y - m_SplTop - m_SplHeight
        CtnCtl.Width = X
      End If
    ElseIf vHide = ShowPart1 Then
      picSplitter.Visible = False
    
      If IsInCollection(CtnCtl.Name, m_TopControls) Then
        CtnCtl.Visible = True
        
        CtnCtl.Top = 0
        CtnCtl.Left = 0
        CtnCtl.Height = Y
        CtnCtl.Width = X
      ElseIf IsInCollection(CtnCtl.Name, m_BottomControls) Then
        CtnCtl.Visible = False
      End If
    Else
      picSplitter.Visible = False
    
      If IsInCollection(CtnCtl.Name, m_TopControls) Then
        CtnCtl.Visible = False
      ElseIf IsInCollection(CtnCtl.Name, m_BottomControls) Then
        CtnCtl.Visible = True
        
        CtnCtl.Top = 0
        CtnCtl.Left = 0
        CtnCtl.Height = Y
        CtnCtl.Width = X
      End If
    End If
  Next i
  
  LastHeight = Y
    RaiseEvent ResizeCompleted(m_SplTop, UserControl.Height - m_SplTop - m_SplHeight, m_SplTop + m_SplHeight, UserControl.Width)

  On Error GoTo 0
End Sub

Private Sub picSplitter_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Resizing = True
  SplTop = picSplitter.Top
  picSplitter.BackColor = SplBackColor
  picSplitter.ZOrder 0
End Sub

Private Sub picSplitter_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Dim SizY As Long
  
  SizY = picSplitter.Top + Y
  
  If Resizing Then
    If SizY < MinTop Then
      picSplitter.Top = MinTop
    ElseIf SizY > (UserControl.Height - m_SplHeight - MinBottom) Then
      picSplitter.Top = (UserControl.Height - m_SplHeight - MinBottom)
    Else
      picSplitter.Top = SizY
    End If
  End If
End Sub

Private Sub picSplitter_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Resizing = False
  picSplitter.BackColor = &H8000000F
  SplTop = picSplitter.Top
End Sub

'为用户控件初始化属性
Private Sub UserControl_InitProperties()
  m_SplHeight = m_def_SplHeight
  m_SplTop = m_def_SplTop
  MinTop = 350
  MinBottom = 350
  
  Hide = ShowAll
  
  Set m_TopControls = New Collection
  Set m_BottomControls = New Collection
End Sub

'从存贮器中加载属性值
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  Dim i As Long, j As Long
  
  m_SplHeight = PropBag.ReadProperty("SplHeight", m_def_SplHeight)
  m_SplTop = PropBag.ReadProperty("SplTop", m_def_SplTop)
  MinTop = PropBag.ReadProperty("MinTop", 350)
  MinBottom = PropBag.ReadProperty("MinBottom", 350)
  Hide = PropBag.ReadProperty("Hide", ShowAll)
  picSplitter.BackColor = PropBag.ReadProperty("SplBackColor", &H8000000F)
  ResizeMode = PropBag.ReadProperty("ResizeMode", 0)
  
  For i = 1 To PropBag.ReadProperty("TopCtlCount", 0)
    m_TopControls.Add PropBag.ReadProperty("TopCtl" & i), PropBag.ReadProperty("TopCtl" & i)
  Next i
  
  For i = 1 To PropBag.ReadProperty("BottomCtlCount", 0)
    m_BottomControls.Add PropBag.ReadProperty("BottomCtl" & i), PropBag.ReadProperty("BottomCtl" & i)
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
  
  Call PropBag.WriteProperty("SplHeight", m_SplHeight, m_def_SplHeight)
  Call PropBag.WriteProperty("SplTop", m_SplTop, m_def_SplTop)
  Call PropBag.WriteProperty("MinTop", MinTop, 350)
  Call PropBag.WriteProperty("MinBottom", MinBottom, 350)
  Call PropBag.WriteProperty("Hide", Hide, ShowAll)
  Call PropBag.WriteProperty("SplBackColor", picSplitter.BackColor, &H8000000F)
  Call PropBag.WriteProperty("TopCtlCount", m_TopControls.Count, 0)
  Call PropBag.WriteProperty("BottomCtlCount", m_BottomControls.Count, 0)
  Call PropBag.WriteProperty("ResizeMode", ResizeMode, 0)
 
  For i = 1 To m_TopControls.Count
    Call PropBag.WriteProperty("TopCtl" & i, m_TopControls(i), 0)
  Next i
  
  For i = 1 To m_BottomControls.Count
    Call PropBag.WriteProperty("BottomCtl" & i, m_BottomControls(i), 0)
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
