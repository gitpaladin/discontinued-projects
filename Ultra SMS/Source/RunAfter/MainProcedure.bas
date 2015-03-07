Attribute VB_Name = "MainProcedure"
Option Explicit
Option Base 1

' 命令行格式
' RUNAFTER hProcess dwMilliseconds lpCmdLine
' hProcess        当前进程的句柄
' dwMilliseconds  延时
' lpCmdLine       命令行

Public Declare Function WaitForSingleObject Lib "kernel32" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long
Public Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Public Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Public Const SYNCHRONIZE = &H100000

Public Function GetCommandLine(Optional MaxArgs As Long = 0)
  Dim Result() As Variant
  Dim iBegin As Long
  Dim bInQuoted As Boolean
  Dim bInArgv As Boolean
  Dim i As Long
  Dim a As Long
  Dim CmdLen As Long
  Dim ch As String
  
  ' 获得命令行的长度
  CmdLen = Len(Command)
  
  ' 分析每一个字符
  iBegin = 1
  a = 0
  
  For i = 1 To CmdLen
    ' 或者每一个字符以供分析
    ch = Mid(Command, i, 1)
    
    ' 如果是在引号里面就当作一个整体
    If ch = Chr(34) Then
      If bInArgv Then
        ' 如果是参数
        a = a + 1
        ReDim Preserve Result(a) As Variant
        Result(a) = Mid(Command, iBegin + 1, i - iBegin - 1)
      Else
        ' 如果不是参数 进入参数范围
        bInArgv = True
        bInQuoted = True
        iBegin = i
      End If
      
    ElseIf ch = vbTab Or ch = " " Then
      ' 如果是引号范围忽略空格
      If Not bInQuoted Then
        If bInArgv Then
          ' 参数结束标志
          a = a + 1
          ReDim Preserve Result(a) As Variant
          Result(a) = Mid(Command, iBegin, i - iBegin)
          bInArgv = False
        End If
      End If
      
    Else
      ' 参数开始标志
      If Not bInArgv Then
        bInArgv = True
        iBegin = i
      End If
    End If
  Next i
  
  If MaxArgs > 1 Then
    ReDim Preserve Result(MaxArgs) As Variant
  End If
  
  GetCommandLine = Result
End Function

