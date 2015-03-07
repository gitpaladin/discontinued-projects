Attribute VB_Name = "Template"
'**************************************************************
'文件夹模板 相关功能模块
'-----------------------------------
'BY Alexander Chen
'For Version 1.7 or later
'**************************************************************

Public oTemplates As New VBA.Collection
Public oNames As New VBA.Collection

Private Const TmpFileName As String = "Template.INI"

Public Sub TemplateRead()
  '读取模板
  Dim oINI As New MP3PA.INIOperation
  Dim oTemplate As New VBA.Collection
  
  Dim lCount As Long
  Dim lFolderCount As Long
  Dim FN As String
  Dim sTmpName As String
  Dim sPath As String
  Dim i As Long
  Dim j As Long
  
  FN = AppendPath(App.Path, TmpFileName)
  
  '打开 INI 文件
  oINI.FileName = FN
  
  '读取内容
  lCount = oINI.GetIniInteger("Template Define", "Count", 0)
  
  For i = 1 To lCount
    sTmpName = oINI.GetIniString("Template Define", "Template" & i)
    
    '添加具体的模板
    If CBool(Len(sTmpName)) And (Not TemplateExist(sTmpName)) Then
      oNames.Add sTmpName, sTmpName
      
      '添加项目
      Set oTemplate = New VBA.Collection
      
      lFolderCount = oINI.GetIniInteger(sTmpName, "Count", 0)
      
      For j = 1 To lFolderCount
        sPath = oINI.GetIniString(sTmpName, "Folder" & j)
        oTemplate.Add sPath
      Next j
      
      '添加到集合中
      oTemplates.Add oTemplate, sTmpName
    End If
  Next i
End Sub

Public Function TemplateExist(ByVal TemplateName As String)
  '项目是否存在
  TemplateExist = ItemExistOBJ(TemplateName, oTemplates)
End Function

Public Sub TemplateWrite()
  '保存模板
  Dim oTemplate As New VBA.Collection
  
  Dim lCount As Long
  Dim lFolderCount As Long
  Dim FN As String
  Dim sTmpName As String
  Dim sPath As String
  Dim i As Long
  Dim j As Long
  Dim FileNum As Long
  
  FN = AppendPath(App.Path, TmpFileName)
  
  '打开 INI 文件
  FileNum = FreeFile
  Open FN For Output Access Write Lock Read Write As FileNum
  
  '写入文件头
  Print #FileNum, "[Template Define]"
  Print #FileNum, "Count=" & oTemplates.Count
  
  For i = 1 To oNames.Count
    Print #FileNum, "Template" & i & "=" & oNames(i)
  Next i
  
  Print #FileNum,
  
  '写入每一个模板的内容
  For i = 1 To oTemplates.Count
    Set oTemplate = oTemplates(i)
    Let sTmpName = oNames(i)
    Print #FileNum, "[" & sTmpName & "]"
    Print #FileNum, "Count=" & oTemplate.Count
    
    For j = 1 To oTemplate.Count
      Print #FileNum, "Folder" & j & "=" & oTemplate(j)
    Next j
    
    Print #FileNum,
  Next i
  
  Close #FileNum
End Sub

Public Sub ApplyTemplate(ByVal TemplateName As String)
  '应用模板的子程序
  Dim oExistFolders As New VBA.Collection
  Dim oFolders As New VBA.Collection
  Dim nListInfo As MP3PA.ListFolder
  Dim oParentListFolder As MP3PA.ListFolder
  Dim sFolders() As String
  Dim sParent As String
  Dim sPath As String
  Dim sFolderName As String
  Dim nNode As MSComctlLib.Node
  Dim lPos As Long
  Dim i As Long
  
  If Not TemplateExist(TemplateName) Then Exit Sub
  
  '为现有的目录编制索引
  '因为添加了索引所以就可以很方便地查找对象了
  For i = 1 To frmMain.tvwList.Nodes.Count
    oExistFolders.Add frmMain.tvwList.Nodes(i), frmMain.tvwList.Nodes(i).FullPath
  Next i
  
  '重新排序文件夹, 否则会出现一些问题
  Set oFolders = oTemplates(TemplateName)
  ReDim sFolders(oFolders.Count - 1)
  
  For i = 1 To oFolders.Count
    sFolders(i - 1) = oFolders(i)
  Next i
  
  QuickSort.QuickSort sFolders, 0, oFolders.Count - 1
  
  '开始添加自动文件夹
  For i = 0 To UBound(sFolders)
    '如果已经存在就更换图标
    If ItemExistOBJ(sFolders(i), oExistFolders) Then
      Set nNode = oExistFolders(sFolders(i))
      nNode.Image = 7
      nNode.SelectedImage = 8
    Else
      '如果不存在就要添加项目
      sPath = sFolders(i)
      lPos = InStrRev(sPath, "\")
      
      If lPos Then
        sParent = Left(sPath, lPos - 1)
        sFolderName = Right(sPath, Len(sPath) - lPos)
        
        If ItemExistOBJ(sParent, oExistFolders) Then
          '添加一个文件夹
          Set oParentListFolder = oExistFolders(sParent).Tag
          Set nListInfo = oParentListFolder.SubFolders.Add(oParentListFolder, sFolderName)
          Set nNode = frmMain.tvwList.Nodes.Add(oExistFolders(sParent).Index, tvwChild, , sFolderName, 7)
          nNode.SelectedImage = 8
          Set nNode.Tag = nListInfo
          oExistFolders.Add nNode, sPath
        End If
      End If
    End If
  Next i
End Sub
