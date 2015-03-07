VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ListFolder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'**************************************************************
'列表文件夹项目对象
'---------------------
'BY Alexander Chen
'**************************************************************

Public ParentFolder As ListFolder           '返回父文件夹的引用
Public TotalFileSize As Double              '文件的总共大小
Public ListFiles As Collection              '所有文件的集合
Public SubFolders As ListFolders            '子文件夹的集合
Public TotalSize As Double                  '合计大小（包括子文件夹）
Public FolderName As String

Option Explicit

Public Sub RecalculateSubFolders(ByVal SizeIncrement As Double)
  '重新计算子文件夹的大小
  TotalSize = TotalSize + SizeIncrement
    
  '递归通报大小改变
  If Not ParentFolder Is Nothing Then
    ParentFolder.RecalculateSubFolders SizeIncrement
  End If
End Sub

Public Function Recalculate(Optional ByVal IncludeLyric As Boolean = False) As Double
  '重新计算文件夹大小
  Dim dNewSize As Double
  Dim dIncrement As Double
  Dim i As Long
  
  If IncludeLyric Then
    For i = 1 To ListFiles.Count
      dNewSize = dNewSize + ListFiles(i).Size + ListFiles(i).LyricSize
    Next i
  Else
    For i = 1 To ListFiles.Count
      dNewSize = dNewSize + ListFiles(i).Size
    Next i
  End If
  
  dIncrement = dNewSize - TotalFileSize
  TotalFileSize = dNewSize
  TotalSize = TotalSize + dIncrement
  Recalculate = dNewSize
  
  '如果大小改变了就通知上级
  If Not ParentFolder Is Nothing Then
    ParentFolder.RecalculateSubFolders dIncrement
  End If
End Function

Private Sub Class_Initialize()
  '创建新的内容
  Set ParentFolder = Nothing
  Set ListFiles = New VBA.Collection
  Set SubFolders = New MP3PA.ListFolders
End Sub

Private Sub Class_Terminate()
  '破坏对象
  Set ParentFolder = Nothing
  Set ListFiles = Nothing
  Set SubFolders = Nothing
End Sub

Public Sub ClearAllFileSize()
  '清除所有的文件大小统计，用于删除该文件夹
  Dim dIncrement As Double
  
  dIncrement = -TotalSize
  
  '递归通报大小改变
  If Not ParentFolder Is Nothing Then
    ParentFolder.RecalculateSubFolders dIncrement
  End If
End Sub
