Attribute VB_Name = "UTF8Conv"
Option Explicit

Private Declare Function GetVersionEx Lib "kernel32.dll" Alias "GetVersionExA" (ByRef lpVersionInformation As OSVERSIONINFO) As Long

Private Type OSVERSIONINFO
  dwOSVersionInfoSize As Long
  dwMajorVersion As Long
  dwMinorVersion As Long
  dwBuildNumber As Long
  dwPlatformId As Long
  szCSDVersion As String * 128 ' Maintenance string for PSS usage
End Type

Private Const VER_PLATFORM_WIN32_NT As Long = 2
Private Const VER_PLATFORM_WIN32_WINDOWS As Long = 1
Private Const VER_PLATFORM_WIN32s As Long = 0

Public Declare Function WideCharToMultiByte Lib "kernel32" (ByVal CodePage As Long, ByVal dwFlags As Long, ByVal lpWideCharStr As Long, ByVal cchWideChar As Long, ByRef lpMultiByteStr As Any, ByVal cchMultiByte As Long, ByVal lpDefaultChar As String, ByVal lpUsedDefaultChar As Long) As Long
Public Declare Function MultiByteToWideChar Lib "kernel32" (ByVal CodePage As Long, ByVal dwFlags As Long, ByRef lpMultiByteStr As Any, ByVal cchMultiByte As Long, ByVal lpWideCharStr As Long, ByVal cchWideChar As Long) As Long
Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)

Public Const CP_UTF8 = 65001

Private m_bIsNt As Boolean
Private m_Inited As Boolean

'Purpose:Convert Utf8 to Unicode
Public Function UTF8_Decode(ByRef bytUTF8() As Byte, Optional ByVal UseDefaultApi As Boolean = True) As String
   Dim lngUtf8Size      As Long
   Dim strBuffer        As String
   Dim lngBufferSize    As Long
   Dim lngResult        As Long
   Dim N                As Long
   
   If Not m_Inited Then Init
   If UBound(bytUTF8) = 0 Then UTF8_Decode = Chr(bytUTF8(0)): Exit Function
   If m_bIsNt And UseDefaultApi Then
      On Error GoTo EndFunction
      lngUtf8Size = UBound(bytUTF8) + 1
      On Error GoTo 0
      'Set buffer for longest possible string i.e. each byte is
      'ANSI, thus 1 unicode(2 bytes)for every utf-8 character.
      lngBufferSize = lngUtf8Size * 2
      strBuffer = String$(lngBufferSize, vbNullChar)
      'Translate using code page 65001(UTF-8)
      lngResult = MultiByteToWideChar(CP_UTF8, 0, bytUTF8(0), _
         lngUtf8Size, StrPtr(strBuffer), lngBufferSize)
      'Trim result to actual length
      If lngResult Then
         UTF8_Decode = Left$(strBuffer, lngResult)
      End If
   Else
      Dim i                As Long
      Dim TopIndex         As Long
      Dim TwoBytes(1)      As Byte
      Dim ThreeBytes(2)    As Byte
      Dim AByte            As Byte
      Dim TStr             As String
      Dim BArray()         As Byte
      Dim cBytes           As New VBA.Collection
      'Resume on error in case someone inputs text with accents
      'that should have been encoded as UTF-8
      On Error Resume Next
      TopIndex = UBound(bytUTF8) + 1  ' Number of bytes equal TopIndex+1
      If TopIndex = 0 Then Exit Function ' get out if there's nothing to convert
      'BArray = StrConv(sUTF8, vbFromUnicode)
      Let BArray = bytUTF8
      i = 0 ' Initialise pointer
      TopIndex = TopIndex - 1
      ' Iterate through the Byte Array
      Do While i <= TopIndex
         AByte = BArray(i)
         If AByte < &H80 Then
            ' Normal ANSI character - use it as is
'            TStr = TStr & Chr$(AByte): i = i + 1 ' Increment byte array index
            cBytes.Add AByte: i = i + 1
            TStr = TStr & Chr(AByte)
         ElseIf AByte >= &HE0 Then         'was = &HE1 Then
            ' Start of 3 byte UTF-8 group for a character
            ' Copy 3 byte to ThreeBytes
            ThreeBytes(0) = BArray(i): i = i + 1
            ThreeBytes(1) = BArray(i): i = i + 1
            ThreeBytes(2) = BArray(i): i = i + 1
            ' Convert Byte array to UTF-16 then Unicode
            TStr = TStr & ChrW$((ThreeBytes(0) And &HF) * &H1000 + (ThreeBytes(1) And &H3F) * &H40 + (ThreeBytes(2) And &H3F))
         ElseIf (AByte >= &HC2) And (AByte <= &HDB) Then
            ' Start of 2 byte UTF-8 group for a character
            TwoBytes(0) = BArray(i): i = i + 1
            TwoBytes(1) = BArray(i): i = i + 1
            ' Convert Byte array to UTF-16 then Unicode
            TStr = TStr & ChrW$((TwoBytes(0) And &H1F) * &H40 + (TwoBytes(1) And &H3F))
         Else
            ' Normal ANSI character - use it as is
            TStr = TStr & Chr$(AByte): i = i + 1 ' Increment byte array index
         End If
      Loop
      UTF8_Decode = TStr    ' Return the resultant string
      Erase BArray
   End If
EndFunction:
End Function

'Purpose:Convert Unicode string to UTF-8.
Public Function UTF8_Encode(ByVal strUnicode As String) As Byte()
   Dim i                As Long
   Dim TLen             As Long
   Dim lPtr             As Long
   Dim UTF16            As Long
   Dim UTF8_EncodeLong  As String
   TLen = Len(strUnicode)
   If TLen = 0 Then Exit Function
   If m_bIsNt Then
      Dim lngBufferSize    As Long
      Dim lngResult        As Long
      Dim bytUTF8()        As Byte
      'Set buffer for longest possible string.
      lngBufferSize = TLen * 3 + 1
      ReDim bytUTF8(lngBufferSize - 1)
      'Translate using code page 65001(UTF-8).
      lngResult = WideCharToMultiByte(CP_UTF8, 0, StrPtr(strUnicode), _
         TLen, bytUTF8(0), lngBufferSize, vbNullString, 0)
      'Trim result to actual length.
      If lngResult Then
         lngResult = lngResult - 1
         ReDim Preserve bytUTF8(lngResult)
         'CopyMemory StrPtr(UTF8_Encode), bytUtf8(0&), lngResult
         'UTF8_Encode = StrConv(bytUTF8, vbUnicode)
         ' For i = 0 To lngResult
         '    UTF8_Encode = UTF8_Encode & Chr$(bytUtf8(i))
         ' Next
         UTF8_Encode = bytUTF8
      End If
   End If
   'Substitute vbCrLf with HTML line breaks if requested.
End Function

Public Sub Init()
  Dim myOS As OSVERSIONINFO
  myOS.dwOSVersionInfoSize = Len(myOS)
  GetVersionEx myOS
  m_bIsNt = (myOS.dwPlatformId = VER_PLATFORM_WIN32_NT)
  m_Inited = True
End Sub

Public Function UTF8_DecodeAlt(ByRef bytUTF8() As Byte) As String
  '预备的 UTF8 解码方案
  Dim cbUnicode As New VBA.Collection
  Dim bCurByte() As Byte
  Dim bytCurByte As Byte
  Dim luBound As Long
  Dim dSection As Double
  Dim i As Long
  
  '填充方案
  luBound = UBound(bytUTF8)
  
  '开始解码
  Do Until i >= luBound + 1
    bytCurByte = bytUTF8(i)
    
    If bytCurByte < 192 Then
      '1 字节标识符
      'BIN: 1000 0000  HEX: 80
      'UTF-8:   0xxxxxxx
      'Unicode: 0x00000000 - 0x0000007F
      ReDim bCurByte(0) As Byte
      
      bCurByte(0) = bytUTF8(i)
      
      cbUnicode.Add CByte(0)
      cbUnicode.Add CByte(bCurByte(0))
      
      i = i + 1
    ElseIf bytCurByte < 224 Then
      '2 字节标识符
      'BIN: 1100 0000  HEX: C0
      'UTF-8:   110xxxxx 10xxxxxx
      'Unicode: 0x00000080 - 0x000007FF
      ReDim bCurByte(1) As Byte
      
      bCurByte(0) = bytUTF8(i)
      bCurByte(1) = bytUTF8(i + 1)
      
      dSection = (bCurByte(1) - 64)
      dSection = dSection + (bCurByte(0) - 192) * 64
      
      cbUnicode.Add CByte(Int(dSection / 16))
      cbUnicode.Add CByte(dSection Mod 16)
      
      i = i + 2
    ElseIf bytCurByte < 240 Then
      '3 字节标识符
      'BIN: 1110 0000  HEX: E0
      'UTF-8:   1110xxxx 10xxxxxx 10xxxxxx
      'Unicode: 0x00000800 - 0x0000FFFF
      ReDim bCurByte(2) As Byte
      
      bCurByte(0) = bytUTF8(i)
      bCurByte(1) = bytUTF8(i + 1)
      bCurByte(2) = bytUTF8(i + 2)
      
      dSection = (bCurByte(2) - 64) + (bCurByte(1) - 64) * 64 + CDbl((bCurByte(0) - 224)) * 4096
      
      cbUnicode.Add CByte(Int(dSection / 256)): dSection = dSection Mod 256
      cbUnicode.Add CByte(Int(dSection / 16)): dSection = dSection Mod 16
      cbUnicode.Add CByte(dSection)
      
      i = i + 3
    ElseIf bytCurByte < 248 Then
      '4 字节标识符
      'BIN: 1111 0000  HEX: F0
      'UTF-8:   11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
      'Unicode: 0x00010000 - 0x001FFFFF
      ReDim bCurByte(3) As Byte
      
      bCurByte(0) = bytUTF8(i)
      bCurByte(1) = bytUTF8(i + 1)
      bCurByte(2) = bytUTF8(i + 2)
      bCurByte(3) = bytUTF8(i + 3)
      
      dSection = (bCurByte(3) - 64) + (bCurByte(2) - 64) * 64 + CDbl((bCurByte(1) - 64)) * 4096 + CDbl((bCurByte(0) - 240)) * 262144
      
      cbUnicode.Add CByte(Int(dSection / 4096)): dSection = dSection Mod 4096
      cbUnicode.Add CByte(Int(dSection / 256)): dSection = dSection Mod 256
      cbUnicode.Add CByte(Int(dSection / 16)): dSection = dSection Mod 16
      cbUnicode.Add CByte(dSection)
      
      i = i + 4
    ElseIf bytCurByte < 252 Then
      '5 字节标识符
      'BIN: 1111 1000  HEX: F8
      'UTF-8:   111110xx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
      'Unicode: 0x00200000 - 0x03FFFFFF
      ReDim bCurByte(4) As Byte
      
      bCurByte(0) = bytUTF8(i)
      bCurByte(1) = bytUTF8(i + 1)
      bCurByte(2) = bytUTF8(i + 2)
      bCurByte(3) = bytUTF8(i + 3)
      bCurByte(4) = bytUTF8(i + 5)
      
      dSection = (bCurByte(4) - 64) + (bCurByte(3) - 64) * 64 + CDbl((bCurByte(2) - 64)) * 4096 + CDbl((bCurByte(1) - 64)) * 262144 + CDbl((bCurByte(0) - 248)) * 16777216
      
      cbUnicode.Add CByte(Int(dSection / 65536)): dSection = dSection Mod 65536
      cbUnicode.Add CByte(Int(dSection / 4096)): dSection = dSection Mod 4096
      cbUnicode.Add CByte(Int(dSection / 256)): dSection = dSection Mod 256
      cbUnicode.Add CByte(Int(dSection / 16)): dSection = dSection Mod 16
      cbUnicode.Add CByte(dSection)
      
      i = i + 5
    ElseIf bytCurByte < 256 Then
      '6 字节标识符
      'BIN: 1111 1100  HEX: FC
      'UTF-8:   1111110x 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
      'Unicode: 0x04000000 - 0x7FFFFFFF
      ReDim bCurByte(5) As Byte
      
      bCurByte(0) = bytUTF8(i)
      bCurByte(1) = bytUTF8(i + 1)
      bCurByte(2) = bytUTF8(i + 2)
      bCurByte(3) = bytUTF8(i + 3)
      bCurByte(4) = bytUTF8(i + 5)
      bCurByte(5) = bytUTF8(i + 6)
      
      dSection = (bCurByte(5) - 64) + (bCurByte(4) - 64) * 64 + (bCurByte(3) - 64) * 4096 + (bCurByte(2) - 64) * 262144 + (bCurByte(1) - 64) * 16777216 + (bCurByte(0) - 252) * 1073741824
      
      cbUnicode.Add CByte(Int(dSection / 1048576)): dSection = dSection Mod 1048576
      cbUnicode.Add CByte(Int(dSection / 65536)): dSection = dSection Mod 65536
      cbUnicode.Add CByte(Int(dSection / 4096)): dSection = dSection Mod 4096
      cbUnicode.Add CByte(Int(dSection / 256)): dSection = dSection Mod 256
      cbUnicode.Add CByte(Int(dSection / 16)): dSection = dSection Mod 16
      cbUnicode.Add CByte(dSection)
      
      i = i + 6
    End If
  Loop
  
  '转化数组
  ReDim bCurByte(cbUnicode.Count - 1) As Byte
  
  For i = 0 To cbUnicode.Count - 1
    bCurByte(i) = cbUnicode(i + 1)
  Next i
  
  '转化字符串
  UTF8_DecodeAlt = StrConv(bCurByte, vbFromUnicode)
End Function
