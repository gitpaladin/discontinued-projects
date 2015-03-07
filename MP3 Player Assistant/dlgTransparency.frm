VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MsComCtl.ocx"
Begin VB.Form dlgTransparency 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "选择透明度"
   ClientHeight    =   1455
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4575
   Icon            =   "dlgTransparency.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1455
   ScaleWidth      =   4575
   StartUpPosition =   2  '屏幕中心
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   3360
      TabIndex        =   3
      Top             =   960
      Width           =   1095
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "确定"
      Default         =   -1  'True
      Height          =   375
      Left            =   2160
      TabIndex        =   2
      Top             =   960
      Width           =   1095
   End
   Begin MSComctlLib.Slider sldTransparency 
      Height          =   435
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   4335
      _ExtentX        =   7646
      _ExtentY        =   767
      _Version        =   393216
      LargeChange     =   50
      Max             =   255
      TickStyle       =   3
   End
   Begin VB.CheckBox chkTransparency 
      Caption         =   "使用半透明效果(&T)(需要 Windows 2000 以上)"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4335
   End
End
Attribute VB_Name = "dlgTransparency"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub chkTransparency_Click()
  sldTransparency.Enabled = CBool(chkTransparency.Value)
End Sub

Private Sub cmdCancel_Click()
  Unload Me
End Sub

Private Sub cmdOK_Click()
  FloatWindowProperty.bTransparency = IIf(chkTransparency.Value, sldTransparency.Value, 255)
  Unload Me
End Sub

'设置透明度
Private Sub Form_Load()
  If FloatWindowProperty.bTransparency = 255 Then
    chkTransparency.Value = 0
  Else
    chkTransparency.Value = 1
  End If
  
  chkTransparency_Click
  
  sldTransparency = FloatWindowProperty.bTransparency
End Sub
