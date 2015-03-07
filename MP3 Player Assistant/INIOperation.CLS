VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "INIOperation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "INI �ļ��� API ����ͨ��������װ�� 6 �� API ������ʹ�������Է���ط��ʡ�д�� INI �ļ���"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'**********************************************************************
'                                                          INIAPI ����
'                                                         -------------
'    ����ͨ�� API �򵥵ط��� INI �ļ���
'**********************************************************************
Option Explicit

Private vFileName As String
Private cSection As VBA.Collection
Private cSecName As VBA.Collection

'======================================================================
'FileName ����
'--------------
'����Ҫ������ INI �ļ������֡�
'======================================================================
Public Property Get FileName() As String
Attribute FileName.VB_Description = "���ء�����Ҫ�������ļ������������һ�������ڵ��ļ�������һ������ʱ����"
Attribute FileName.VB_UserMemId = 0
  FileName = vFileName
End Property

Public Property Let FileName(ByVal vNewValue As String)
  Dim cValue As New VBA.Collection
  Dim CurrentSection As String
  Dim sLine As String
  Dim sKey As String
  Dim iFl As Integer
  Dim lPos As Long
  
  If vNewValue <> vFileName Then
    vFileName = vNewValue
    
    Set cSection = New VBA.Collection
    Set cSecName = New VBA.Collection
  
    If FS.FileExists(vFileName) Then
      '��Ҫ��ȡ�ļ�
      Set cSection = New VBA.Collection
      Set cSecName = New VBA.Collection
      
      '���ļ�
      iFl = FreeFile
      Open vNewValue For Input As iFl
      
      '�����ļ�
      Do Until EOF(iFl)
        '��ȡ�ļ�
        Line Input #iFl, sLine
        
        sLine = Trim(sLine)
        
        If Len(sLine) Then
          If Left(sLine, 1) <> ";" Then
            If CBool(InStr(1, sLine, "]")) And (Left(sLine, 1) = "[") Then
              '��ʾ��һ���ڵĿ�ʼ
              '�洢��һ���ڵ�����
              If Len(CurrentSection) Then
                cSecName.Add CurrentSection, CurrentSection
                cSection.Add cValue, CurrentSection
                Set cValue = New VBA.Collection
              End If
              
              '������һ������
              CurrentSection = GetSectionName(sLine)
            ElseIf Len(CurrentSection) Then
              '��ʾ�����е�����
              'ȥ�����е�ע��
              lPos = InStr(1, sLine, " ;")
              
              If lPos Then
                sLine = Left(sLine, lPos - 1)
              End If
              
              '��� Key
              lPos = InStr(1, sLine, "=")
              
              If lPos > 1 Then
                '�ǺϷ�������
                sKey = Left(sLine, lPos - 1)
                cValue.Add sLine, sKey
              End If
            End If
          End If
        End If
      Loop
      
      '�������Ľ�
      If Len(CurrentSection) Then
        cSecName.Add CurrentSection, CurrentSection
        cSection.Add cValue, CurrentSection
        Set cValue = New VBA.Collection
      End If
      
      '�ر��ļ�
      Close iFl
    End If
  End If
End Property

'======================================================================
'GetIniString ����
'------------------
'����ƶ��Ĵ���
'======================================================================
Public Function GetIniString(ByVal Section As String, ByVal Key As String, Optional Default As String = vbNullString) As String
  Dim cValue As Collection
  
  On Error GoTo ReturnDefault
  
  Set cValue = cSection(Section)
  GetIniString = cValue(Key)
  GetIniString = Right(GetIniString, Len(GetIniString) - InStr(1, GetIniString, "="))
  
  Exit Function
ReturnDefault:
  GetIniString = Default
End Function

'======================================================================
'GetIniInteger ����
'------------------
'����ƶ��Ĵ�������ֵ
'======================================================================
Public Function GetIniInteger(ByVal Section As String, ByVal Key As String, Optional Default As Long = 0) As Long
  Dim cValue As Collection
  Dim sTmp
  
  On Error GoTo ReturnDefault
  
  Set cValue = cSection(Section)
  sTmp = cValue(Key)
  sTmp = Right(sTmp, Len(sTmp) - InStr(1, sTmp, "="))
  GetIniInteger = CLng(sTmp)
  
  Exit Function
ReturnDefault:
  GetIniInteger = Default
End Function

'======================================================================
'SetIniString ����
'------------------
'д������
'======================================================================
Public Function SetIniString(ByVal Section As String, ByVal Key As String, ByVal Value As String) As Boolean
  Dim cValue As Collection
  
  On Error GoTo NoSuchSection
  Set cValue = cSection(Section)
  
  On Error Resume Next
  cValue.Remove Key
  
  'û�м�������һ����
  cValue.Add Key & "=" & Value, Key
  
  On Error GoTo 0
  Exit Function

NoSuchSection:
  'û�нھ�����һ����
  cSection.Add New VBA.Collection, Section
  cSecName.Add Section, Section
  Resume
  
End Function

'======================================================================
'Update ����
'------------------
'�����ļ�
'======================================================================
Public Sub Update()
  'д�뵽�ļ�
  Dim F As Integer
  Dim i As Long
  Dim j As Long
  Dim cValue As VBA.Collection
  
  F = FreeFile
  Open vFileName For Output Access Write As F
  
  'д���ļ�
  For i = 1 To cSection.Count
    'д���ͷ
    Print #F, "[" & cSecName(i) & "]"
    
    'д������
    Set cValue = cSection(i)
    
    For j = 1 To cValue.Count
      Print #F, cValue(j)
    Next j
    
    'д��հ�
    Print #F,
  Next i
  
  Close #F
End Sub

Private Sub Class_Initialize()
  Set cSection = New VBA.Collection
End Sub

Private Sub Class_Terminate()
  Set cSection = Nothing
End Sub

Private Function GetSectionName(ByVal szLine As String) As String
  '������ֵĺ���
  Dim lPos As Long
  
  lPos = InStr(1, szLine, "]")
  
  If lPos Then GetSectionName = Mid(szLine, 2, lPos - 2)
End Function
