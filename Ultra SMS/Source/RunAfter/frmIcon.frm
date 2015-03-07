VERSION 5.00
Begin VB.Form frmIcon 
   BorderStyle     =   0  'None
   ClientHeight    =   3090
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4680
   Icon            =   "frmIcon.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  '窗口缺省
   Visible         =   0   'False
End
Attribute VB_Name = "frmIcon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
  Dim PID As Long
  Dim hProcess As Long
  Dim dwMilliseconds As Long
  Dim Parameters() As Variant
  
  Parameters = GetCommandLine(3)
  
  ' 分析获得的数据
  PID = CLng(Parameters(1))
  dwMilliseconds = CLng(Parameters(2))
  
  ' 打开进程
  hProcess = OpenProcess(SYNCHRONIZE, 0, PID)
  
  If hProcess <> 0 Then
    ' 等待进程结束
    WaitForSingleObject hProcess, -1
    CloseHandle hProcess
  End If
  
  ' 运行新的进程
  If Parameters(2) = -1 Then
    Shell Parameters(3), vbNormalFocus
  Else
    MsgBox Parameters(3), vbInformation, "Ultra SMS"
  End If
  
  Unload Me
End Sub
