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
'�б��ļ�����Ŀ����
'---------------------
'BY Alexander Chen
'**************************************************************

Public ParentFolder As ListFolder           '���ظ��ļ��е�����
Public TotalFileSize As Double              '�ļ����ܹ���С
Public ListFiles As Collection              '�����ļ��ļ���
Public SubFolders As ListFolders            '���ļ��еļ���
Public TotalSize As Double                  '�ϼƴ�С���������ļ��У�
Public FolderName As String

Option Explicit

Public Sub RecalculateSubFolders(ByVal SizeIncrement As Double)
  '���¼������ļ��еĴ�С
  TotalSize = TotalSize + SizeIncrement
    
  '�ݹ�ͨ����С�ı�
  If Not ParentFolder Is Nothing Then
    ParentFolder.RecalculateSubFolders SizeIncrement
  End If
End Sub

Public Function Recalculate(Optional ByVal IncludeLyric As Boolean = False) As Double
  '���¼����ļ��д�С
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
  
  '�����С�ı��˾�֪ͨ�ϼ�
  If Not ParentFolder Is Nothing Then
    ParentFolder.RecalculateSubFolders dIncrement
  End If
End Function

Private Sub Class_Initialize()
  '�����µ�����
  Set ParentFolder = Nothing
  Set ListFiles = New VBA.Collection
  Set SubFolders = New MP3PA.ListFolders
End Sub

Private Sub Class_Terminate()
  '�ƻ�����
  Set ParentFolder = Nothing
  Set ListFiles = Nothing
  Set SubFolders = Nothing
End Sub

Public Sub ClearAllFileSize()
  '������е��ļ���Сͳ�ƣ�����ɾ�����ļ���
  Dim dIncrement As Double
  
  dIncrement = -TotalSize
  
  '�ݹ�ͨ����С�ı�
  If Not ParentFolder Is Nothing Then
    ParentFolder.RecalculateSubFolders dIncrement
  End If
End Sub