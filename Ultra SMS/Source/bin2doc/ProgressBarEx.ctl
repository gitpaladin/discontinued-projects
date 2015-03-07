VERSION 5.00
Begin VB.UserControl ProgressBarEx 
   AutoRedraw      =   -1  'True
   ClientHeight    =   1155
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6300
   ScaleHeight     =   1155
   ScaleWidth      =   6300
   ToolboxBitmap   =   "ProgressBarEx.ctx":0000
   Begin VB.PictureBox picBack 
      Align           =   1  'Align Top
      BackColor       =   &H00FFFFFF&
      Height          =   855
      Left            =   0
      ScaleHeight     =   795
      ScaleWidth      =   6240
      TabIndex        =   0
      Top             =   0
      Width           =   6300
      Begin VB.PictureBox picBar 
         AutoRedraw      =   -1  'True
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   0
         ScaleHeight     =   495
         ScaleWidth      =   2655
         TabIndex        =   1
         Top             =   0
         Width           =   2655
         Begin VB.Label lblForeText 
            Alignment       =   2  'Center
            BackStyle       =   0  'Transparent
            Caption         =   "百分比"
            Height          =   180
            Left            =   0
            TabIndex        =   2
            Top             =   120
            Width           =   1380
         End
      End
      Begin VB.Label lblBackText 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "百分比"
         Height          =   180
         Left            =   0
         TabIndex        =   3
         Top             =   600
         Width           =   2100
      End
   End
End
Attribute VB_Name = "ProgressBarEx"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Public Enum FillStyle
  SingleColor = 0
  GradientColor = 1
End Enum
'缺省属性值:
Const m_def_BarColor = &H820238
Const m_def_BarColor2 = 0
Const m_def_Value = 25
Const m_def_Min = 0
Const m_def_Max = 100
'属性变量:
Dim m_Font As Font
Dim m_BarColor As OLE_COLOR
Dim m_BarColor2 As OLE_COLOR
Dim m_Value As Double
Dim m_Min As Double
Dim m_Max As Double
Dim m_BarFillStyle As FillStyle

Public DoNotRefresh As Boolean

Private Sub picBack_Resize()
  lblBackText.Width = picBack.ScaleWidth
  lblForeText.Width = picBack.ScaleWidth
  lblBackText.Top = Int((picBack.ScaleHeight - lblBackText.Height) / 2)
  lblForeText.Top = Int((picBack.ScaleHeight - lblBackText.Height) / 2)
  RefreshBackground
  RefreshText
End Sub

Private Sub UserControl_Resize()
  picBack.Align = 1
  picBack.Align = 3
  picBar.Height = picBack.Height - 60
  RefreshBackground
  RefreshText
End Sub
'注意！不要删除或修改下列被注释的行！
'MemberInfo=6,0,0,0
Public Property Get Font() As Font
Attribute Font.VB_UserMemId = -512
  Set Font = m_Font
End Property

Public Property Set Font(ByVal New_Font As Font)
  Set m_Font = New_Font
  PropertyChanged "Font"
  Refresh
End Property

'注意！不要删除或修改下列被注释的行！
'MappingInfo=lblForeText,lblForeText,-1,ForeColor
Public Property Get BarForeColor() As OLE_COLOR
Attribute BarForeColor.VB_Description = "返回/设置对象中文本和图形的前景色。"
  BarForeColor = lblForeText.ForeColor
End Property

Public Property Let BarForeColor(ByVal New_BarForeColor As OLE_COLOR)
  lblForeText.ForeColor() = New_BarForeColor
  PropertyChanged "BarForeColor"
  lblForeText.ForeColor = New_BarForeColor
End Property

'注意！不要删除或修改下列被注释的行！
'MappingInfo=lblBackText,lblBackText,-1,ForeColor
Public Property Get BackForeColor() As OLE_COLOR
Attribute BackForeColor.VB_Description = "返回/设置对象中文本和图形的前景色。"
  BackForeColor = lblBackText.ForeColor
End Property

Public Property Let BackForeColor(ByVal New_BackForeColor As OLE_COLOR)
  lblBackText.ForeColor() = New_BackForeColor
  PropertyChanged "BackForeColor"
  lblBackText.ForeColor = New_BackForeColor
End Property

'注意！不要删除或修改下列被注释的行！
'MemberInfo=10,0,0,0
Public Property Get BarColor() As OLE_COLOR
  BarColor = m_BarColor
End Property

Public Property Let BarColor(ByVal New_BarColor As OLE_COLOR)
  m_BarColor = New_BarColor
  PropertyChanged "BarColor"
  RefreshBackground
End Property

'注意！不要删除或修改下列被注释的行！
'MemberInfo=10,0,0,0
Public Property Get BarColor2() As OLE_COLOR
  BarColor2 = m_BarColor2
End Property

Public Property Let BarColor2(ByVal New_BarColor2 As OLE_COLOR)
  m_BarColor2 = New_BarColor2
  PropertyChanged "BarColor2"
  RefreshBackground
End Property

'注意！不要删除或修改下列被注释的行！
'MappingInfo=picBack,picBack,-1,BackColor
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "返回/设置对象中文本和图形的背景色。"
  BackColor = picBack.BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
  picBack.BackColor() = New_BackColor
  PropertyChanged "BackColor"
  picBack.BackColor = New_BackColor
End Property

'注意！不要删除或修改下列被注释的行！
'MemberInfo=7,0,0,0
Public Property Get Value() As Double
  Value = m_Value
End Property

Public Property Let Value(ByVal New_Value As Double)
  m_Value = New_Value
  PropertyChanged "Value"
  If Not DoNotRefresh Then RefreshText
End Property

'注意！不要删除或修改下列被注释的行！
'MemberInfo=7,0,0,0
Public Property Get Min() As Double
  Min = m_Min
End Property

Public Property Let Min(ByVal New_Min As Double)
  m_Min = New_Min
  PropertyChanged "Min"
  RefreshText
End Property

'注意！不要删除或修改下列被注释的行！
'MemberInfo=7,0,0,0
Public Property Get Max() As Double
  Max = m_Max
End Property

Public Property Let Max(ByVal New_Max As Double)
  PropertyChanged "Max"
  
  If New_Max <= m_Min Then New_Max = 100
  
  ' 重新计算 Value
  'If m_Value >= New_Max Then m_Value = New_Max
  m_Value = (New_Max - m_Min) * (m_Value - m_Min) / (m_Max - m_Min) + m_Min
  PropertyChanged "Value"
  
  ' 设置 最大值
  m_Max = New_Max
  
  RefreshText
End Property

'为用户控件初始化属性
Private Sub UserControl_InitProperties()
  Set m_Font = Ambient.Font
  m_BarColor = m_def_BarColor
  m_BarColor2 = m_def_BarColor2
  m_Value = 25
  m_Min = m_def_Min
  m_Max = 100
  m_BarFillStyle = SingleColor
  lblBackText.ForeColor = &HC000&
  lblForeText.ForeColor = &HC000&
End Sub

'从存贮器中加载属性值
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)

  Set m_Font = PropBag.ReadProperty("Font", Ambient.Font)
  lblForeText.ForeColor = PropBag.ReadProperty("BarForeColor", &H80000012)
  lblBackText.ForeColor = PropBag.ReadProperty("BackForeColor", &H80000012)
  m_BarColor = PropBag.ReadProperty("BarColor", m_def_BarColor)
  m_BarColor2 = PropBag.ReadProperty("BarColor2", m_def_BarColor2)
  picBack.BackColor = PropBag.ReadProperty("BackColor", &HFFFFFF)
  m_Value = PropBag.ReadProperty("Value", m_def_Value)
  m_Min = PropBag.ReadProperty("Min", m_def_Min)
  m_Max = PropBag.ReadProperty("Max", m_def_Max)
  m_BarFillStyle = PropBag.ReadProperty("BarFillStyle", 0)
  
  
End Sub

Private Sub UserControl_Show()
  Refresh
End Sub

'将属性值写到存储器
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)

  Call PropBag.WriteProperty("Font", m_Font, Ambient.Font)
  Call PropBag.WriteProperty("BarForeColor", lblForeText.ForeColor, &H80000012)
  Call PropBag.WriteProperty("BackForeColor", lblBackText.ForeColor, &H80000012)
  Call PropBag.WriteProperty("BarColor", m_BarColor, m_def_BarColor)
  Call PropBag.WriteProperty("BarColor2", m_BarColor2, m_def_BarColor2)
  Call PropBag.WriteProperty("BackColor", picBack.BackColor, &HFFFFFF)
  Call PropBag.WriteProperty("Value", m_Value, m_def_Value)
  Call PropBag.WriteProperty("Min", m_Min, m_def_Min)
  Call PropBag.WriteProperty("Max", m_Max, m_def_Max)
  Call PropBag.WriteProperty("BarFillStyle", m_BarFillStyle, 0)
End Sub

Public Property Get BarFillStyle() As FillStyle
  BarFillStyle = m_BarFillStyle
End Property

Public Property Let BarFillStyle(ByVal vNewValue As FillStyle)
  m_BarFillStyle = vNewValue
  
  RefreshBackground
End Property

Public Sub RefreshBackground()
  '刷新背景
  Dim GradientX As New clsGradient
  Dim PreWidth As Long
  
  If m_BarFillStyle = GradientColor Then
    GradientX.Color1 = BarColor
    GradientX.Color2 = BarColor2
    GradientX.Angle = 0
    picBar.Cls
    PreWidth = picBar.Width
    picBar.Width = picBack.Width - 60
    GradientX.Draw picBar
    picBar.Width = PreWidth
  ElseIf m_BarFillStyle = SingleColor Then
    picBar.Cls
    picBar.BackColor = BarColor
  End If
End Sub

Public Sub RefreshText()
  '刷新文本
  Dim Percent As Double
  Dim NewText As String
  
  On Error GoTo HandleError
  Percent = (m_Value - m_Min) / (m_Max - m_Min)
  
  If m_Value > 0 Then
    picBar.Visible = True
    picBar.Width = Percent * (picBack.Width - 60)
  Else
    picBar.Visible = False
  End If
    
  NewText = Int(Percent * 100) & " %"
  
  If NewText <> lblForeText.Caption Then
    lblForeText.Caption = Int(Percent * 100) & " %"
    lblBackText.Caption = Int(Percent * 100) & " %"
  End If
  
  Set lblForeText.Font = m_Font
  Set lblBackText.Font = m_Font
  Set UserControl.Font = m_Font
  lblForeText.Height = UserControl.TextHeight(" ")
  lblBackText.Height = UserControl.TextHeight(" ")
  DoEvents
  Exit Sub
HandleError:
  m_Value = 25
  m_Min = 0
  m_Max = 100
End Sub

Public Sub Refresh()
  '刷新
  picBack_Resize
  RefreshBackground
  RefreshText
End Sub

Public Property Get hWnd() As Long
  hWnd = UserControl.hWnd
End Property

Public Sub AddMax(ByVal MaxToAdd As Double)
  ' 添加最大值
  Max = m_Min + MaxToAdd / (m_Max - m_Value) * (m_Max - m_Min)
End Sub
