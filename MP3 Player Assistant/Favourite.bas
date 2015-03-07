Attribute VB_Name = "Favourite"
Option Explicit

'Fav LVW
Public lLVWDefault(1 To 5) As Long
Public lLVWMusic(1 To 10) As Long
Public oFav As New MP3PA.FAVFolder
Public oFavCol As New VBA.Collection

'IO API
Private Declare Function DeleteFile Lib "kernel32" Alias "DeleteFileA" (ByVal lpFileName As String) As Long

Public Sub AddFavItem(ByVal TVW As MSComctlLib.TreeView, ByVal Node As MSComctlLib.Node, ByVal FI As MP3PA.FAVFolder)
  '刷新项目
  Dim oFI As MP3PA.FAVItem
  Dim oFF As MP3PA.FAVFolder
  Dim oND As MSComctlLib.Node
  Dim iCounter As Long
  Dim fCounter As Long
  Dim sStr() As String
  Dim sName As String
  Dim i As Long
  
  '从配置中读取项目
  iCounter = iniFav.GetIniInteger(FI.Key, "Item")
  fCounter = iniFav.GetIniInteger(FI.Key, "SubFolder")
  
  '添加项目
  For i = 1 To iCounter
    sStr = Split(iniFav.GetIniString(FI.Key, "Item" & i), "|")
    
    If FI.MusicType Then
      '如果是音乐文件类型
      ReDim Preserve sStr(8) As String
      
      Set oFI = FI.FavouriteItems.Add(sStr(0), sStr(0))
      oFI.FileName = sStr(0)
      oFI.Artist = sStr(1)
      oFI.Title = sStr(2)
      oFI.Album = sStr(3)
      oFI.Track = CLng(sStr(4))
      oFI.Year = sStr(5)
      oFI.Genre = sStr(6)
      oFI.Duration = CLng(sStr(7))
      oFI.Comment = sStr(8)
    Else
      '如果是普通类型
      ReDim Preserve sStr(1) As String
      
      Set oFI = FI.FavouriteItems.Add(sStr(0), sStr(0))
      oFI.FileName = sStr(0)
      oFI.Comment = sStr(1)
    End If
  Next i
  
  '添加子文件夹
  For i = 1 To fCounter
    sName = iniFav.GetIniString(FI.Key, "SubFolder" & i)
    
    '添加到下一循环引用
    Set oFF = FI.FavouriteSubFolders.Add(AppendPath(FI.Key, sName), New FAVItems, AppendPath(FI.Key, sName))
    oFF.MusicType = Not CBool(StrComp("MP3PA.FAVOURITE.MUSIC", iniFav.GetIniString(oFF.Key, "Type", "MP3PA.FAVOURITE.MUSIC"), vbTextCompare))
    
    '添加到树图中
    Set oND = TVW.Nodes.Add(FI.Key, tvwChild, oFF.Key, sName, IIf(oFF.MusicType, 2, 3))
    oND.Sorted = True
    oND.Expanded = True
    
    '将 Key 和 FAVFolder 关联
    oFavCol.Add oFF, oFF.Key
    
    '递归循环
    Call AddFavItem(TVW, oND, oFF)
  Next i
End Sub

Public Sub SaveFavItem(ByVal FF As MP3PA.FAVFolder, Optional ByVal DeleteOriFile As Boolean = False)
  '保存收藏夹
  Dim FI As MP3PA.FAVItem
  Dim S As String
  Const Divider As String = "|"
  Dim i As Long
  
  If DeleteOriFile Then
    '删除文件
    Reset
    Call DeleteFile(iniFav.FileName)
    Set iniFav = New MP3PA.INIOperation
    iniFav.FileName = AppendPath(App.Path, "Favourite.ini")
  End If
  
  '保存类型
  If FF.MusicType Then
    Call iniFav.SetIniString(FF.Key, "Type", "MP3PA.FAVOURITE.MUSIC")
  Else
    Call iniFav.SetIniString(FF.Key, "Type", "MP3PA.FAVOURITE.NORMAL")
  End If
  
  '保存项目
  Call iniFav.SetIniString(FF.Key, "Item", FF.FavouriteItems.Count)
  
  For i = 1 To FF.FavouriteItems.Count
    Set FI = FF.FavouriteItems(i)
    
    '准备数据
    If FF.MusicType Then
      S = FI.FileName & Divider & FI.Artist & Divider & FI.Title & Divider & FI.Album & Divider
      S = S & FI.Track & Divider & FI.Year & Divider & FI.Genre & Divider & FI.Duration & Divider & FI.Comment
    Else
      S = FI.FileName & Divider & FI.Comment
    End If
    
    Call iniFav.SetIniString(FF.Key, "Item" & i, S)
  Next i
  
  '保存子目录
  Call iniFav.SetIniString(FF.Key, "SubFolder", FF.FavouriteSubFolders.Count)
  
  For i = 1 To FF.FavouriteSubFolders.Count
    Call iniFav.SetIniString(FF.Key, "SubFolder" & i, FS.GetFileName(FF.FavouriteSubFolders(i).Key))
    
    '递归循环
    Call SaveFavItem(FF.FavouriteSubFolders(i), False)
  Next i
End Sub

