VERSION 5.00
Begin VB.UserControl Cubagor 
   Alignable       =   -1  'True
   AutoRedraw      =   -1  'True
   BackColor       =   &H80000005&
   ClientHeight    =   6555
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1080
   ScaleHeight     =   437
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   72
End
Attribute VB_Name = "Cubagor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private vMax As Double
Private vValue As Double
Private vOriginal As Double

Public Property Get Max() As Double
  Max = vMax
End Property

Public Property Let Max(ByVal vNewValue As Double)
  If vNewValue > 0 Then
    vMax = vNewValue
  End If
  Refresh
End Property

Public Property Get value() As Double
  value = vValue
End Property

Public Property Let value(ByVal vNewValue As Double)
  If vNewValue >= 0 Then
    vValue = vNewValue
  End If
  Refresh
End Property

Public Property Get Original() As Double
  Original = vOriginal
End Property

Public Property Let Original(ByVal vNewValue As Double)
  If vNewValue >= 0 Then
    vOriginal = vNewValue
  End If
  Refresh
End Property

Public Sub Refresh()
  Dim X As Long, Y As Long, Blank As Long
  
  '读取数据
  Y = UserControl.ScaleHeight
  Blank = (Y - 11) * (vOriginal / Max)
  UserControl.Cls
  
  '绘制上部空白矩形
  If vValue <> vMax Then
    ForeColor = 14706792
    Line (1, 6)-(14, 6 + (Y - 11) * (Max - value) / Max), 14706792, BF
    
    ForeColor = 16744576
    Line (16, 6)-(29, 6 + (Y - 11) * (Max - value) / Max), 16744576, BF
  End If
  
  '绘制已存在用的矩形
  If vValue Then
    ForeColor = 8535190
    Line (1, 6 + (Y - 11) * (Max - value - vOriginal) / Max)-(14, Y - 6), 8535190, BF

    ForeColor = 9192128
    Line (16, 6 + (Y - 11) * (Max - value - vOriginal) / Max)-(29, Y - 6), 9192128, BF
  End If
  
  '绘制已经使用的矩形
  If vOriginal Then
    ForeColor = 48384
    Line (1, 6 + (Y - 11) * (Max - vOriginal) / Max)-(14, Y - 6), 6303087, BF

    ForeColor = 16384
    Line (16, 6 + (Y - 11) * (Max - vOriginal) / Max)-(29, Y - 6), 5908861, BF
  End If
  
  '绘制底部菱形
  If (value = 0) And (vOriginal = 0) Then
    DrawDiamond 0, Y - 11, 16769248, 14373715
  ElseIf (vOriginal = 0) Then
    DrawDiamond 0, Y - 11, 6570124, 8011916
  Else
    DrawDiamond 0, Y - 11, 4661586, 5055577
  End If
  
  '绘制顶部矩形
  DrawDiamond 0, 0, 16769248, 16744576
  
  '绘制中间菱形
  If vValue Then
    DrawDiamond 0, (Y - 11) * (Max - value - vOriginal) / Max, 8413344, 10510496
  End If
  
  If vOriginal Then
    DrawDiamond 0, (Y - 11) * (Max - vOriginal) / Max, 6570124, 8011916
  End If
  
  '绘制边线
  Line (0, 5)-(0, Y - 5), 16769248
  Line (0, Y - 6)-(15, Y - 1), 16769248
  Line (30, Y - 6)-(15, Y - 1), 16769248
  Line (15, 10)-(15, Y), 16769248
  Line (30, 5)-(30, Y - 5), 16769248
  
  Line (0, 5)-(15, 0), 16769248
  Line (0, 5)-(15, 10), 16769248
  Line (15, 0)-(30, 5), 16769248
  Line (15, 10)-(30, 5), 16769248
  PSet (30, 5), 16769248
  
End Sub

Private Sub UserControl_Initialize()
  vMax = 100
  vValue = 50
End Sub

Private Sub UserControl_InitProperties()
  vMax = 100
  vValue = 50
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  value = PropBag.ReadProperty("Value", 50)
  Max = PropBag.ReadProperty("Max", 100)
  Original = PropBag.ReadProperty("Original", 20)
  'UserControl.PropertyChanged = True
  Refresh
  UserControl.BackColor = PropBag.ReadProperty("BackColor", &H80000005)
End Sub

Private Sub UserControl_Resize()
  Refresh
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  PropBag.WriteProperty "Value", vValue
  PropBag.WriteProperty "Max", vMax
  PropBag.WriteProperty "Original", vOriginal
  Call PropBag.WriteProperty("BackColor", UserControl.BackColor, &H80000005)
End Sub

Private Sub DrawDiamond(ByVal X As Long, ByVal Y As Long, ByVal FC As OLE_COLOR, ByVal BC As OLE_COLOR)
  '绘制菱形
  Line (X, Y + 5)-(X + 15, Y), FC
  Line (X, Y + 5)-(X + 15, Y + 10), FC
  Line (X + 15, Y)-(X + 30, Y + 5), FC
  Line (X + 15, Y + 10)-(X + 30, Y + 5), FC
  PSet (X + 30, Y + 5), FC
  
  Line (X + 14, Y + 1)-(X + 17, Y + 1), BC
  Line (X + 11, Y + 2)-(X + 20, Y + 2), BC
  Line (X + 8, Y + 3)-(X + 23, Y + 3), BC
  Line (X + 5, Y + 4)-(X + 26, Y + 4), BC
  Line (X + 2, Y + 5)-(X + 29, Y + 5), BC
  Line (X + 5, Y + 6)-(X + 26, Y + 6), BC
  Line (X + 8, Y + 7)-(X + 23, Y + 7), BC
  Line (X + 11, Y + 8)-(X + 20, Y + 8), BC
  Line (X + 14, Y + 9)-(X + 17, Y + 9), BC
End Sub
'注意！不要删除或修改下列被注释的行！
'MappingInfo=UserControl,UserControl,-1,BackColor
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "返回/设置对象中文本和图形的背景色。"
  BackColor = UserControl.BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
  UserControl.BackColor() = New_BackColor
  PropertyChanged "BackColor"
End Property

