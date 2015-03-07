Attribute VB_Name = "DiskInfo"
Option Explicit

Private Declare Function GetDiskFreeSpaceEx Lib "kernel32" Alias "GetDiskFreeSpaceExA" (ByVal lpRootPathName As String, lpFreeBytesAvailableToCaller As Currency, lpTotalNumberOfBytes As Currency, lpTotalNumberOfFreeBytes As Currency) As Long

Private Declare Function CreateDirectory Lib "kernel32" Alias "CreateDirectoryA" (ByVal lpPathName As String, lpSecurityAttributes As SECURITY_ATTRIBUTES) As Long
Private Type SECURITY_ATTRIBUTES
    nLength As Long
    lpSecurityDescriptor As Long
    bInheritHandle As Long
End Type

Public Sub GetDiskSpace(ByVal DiskLetter As String, TotalSpace As Double, FreeSpace As Double)
  '获得磁盘大小的过程
  Dim RootPathName As String
  Dim BytesFreeToCalller As Currency, TotalBytes As Currency
  Dim TotalFreeBytes As Currency, TotalBytesUsed As Currency
  
  RootPathName = Left(DiskLetter, 1) & ":\"
  
  Call GetDiskFreeSpaceEx(RootPathName, BytesFreeToCalller, TotalBytes, TotalFreeBytes)
  
  TotalSpace = CDbl(TotalBytes * 10000)
  FreeSpace = CDbl(TotalFreeBytes * 10000)
End Sub

Public Function CreateFolder(ByVal FullPath As String) As Boolean
  '创建层级的文件夹
  Dim Security As SECURITY_ATTRIBUTES

  If Not FS.FolderExists(FS.GetParentFolderName(FullPath)) Then
    CreateFolder = CreateFolder(FS.GetParentFolderName(FullPath))
  End If
  
  CreateFolder = CBool(CreateDirectory(FullPath, Security))
End Function

