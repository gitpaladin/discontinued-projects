Attribute VB_Name = "WriteTag"
Option Explicit

Private Type SIZE_DEFINE
  bSize1 As Byte          '大于 256 个字符使用
  bSize2 As Byte          '小于 256 字符使用
End Type

'Unicode 定义
Private Type TAG_STRING_U
  bEncoder As Byte        '00 - ISO ,01 - Unicode
  lFlags As Long
  bContext() As Byte
  bNullStop As Long
End Type

Private Type TAG_FRAME_U
  sIdentifier As String * 4
  lFlags As Long
  uSize As SIZE_DEFINE
End Type

'======================
' 使用 ISO 8859-1 标准
'======================
Public Sub WriteID3v2A(ByVal FileNumber As Integer, Optional ByVal Artist As String, Optional ByVal Album As String, Optional ByVal Title As String, Optional ByVal Track As String, Optional ByVal Genre As String, Optional ByVal Year As String, Optional ByVal Comment As String)
  '写入 ID3v2 的标签头部
  'ID3v2.3 标准: http://www.id3.org/id3v2.3.0.html
  Dim bHeader(9) As Byte
  Dim bPadding() As Byte
  
  '写入 Header
  bHeader(0) = &H49
  bHeader(1) = &H44
  bHeader(2) = &H33
  bHeader(3) = &H3
  bHeader(4) = &H0
  bHeader(5) = &H80
  bHeader(6) = &H0
  bHeader(7) = &H0
  bHeader(8) = &H10
  bHeader(9) = &H0
  
  '如果什么也没有就不写
  If Len(Artist) + Len(Album) + Len(Title) + Len(Track) + Len(Genre) + Len(Year) = 0 Then
    Exit Sub
  Else
    Put #FileNumber, 1, bHeader
  End If
  
  If Len(Artist) Then Call WriteFrameA(FileNumber, "TPE1", Artist)
  If Len(Title) Then Call WriteFrameA(FileNumber, "TIT2", Title)
  If Len(Album) Then Call WriteFrameA(FileNumber, "TALB", Album)
  If Len(Track) Then Call WriteFrameA(FileNumber, "TRCK", Track)
  If Len(Comment) Then Call WriteFrameA(FileNumber, "COMM", "chi" & vbNullChar & Comment)
  If Len(Genre) Then Call WriteFrameA(FileNumber, "TCON", Genre)
  If Len(Year) Then Call WriteFrameA(FileNumber, "TYER", Year)
  
  '然后填充内容
  ReDim bPadding(2058 - Seek(FileNumber)) As Byte
  Put #FileNumber, , bPadding
End Sub

Private Sub WriteFrameA(ByVal FileNumber As Integer, ByVal FrameName As String, ByVal Content As String, Optional ByVal WriteLang As String = vbNullString)
  '写入每个 Frame
  Const lFlags As Integer = 0
  Const lStrFlags As Integer = 0
  Const bISODefine As Byte = 0
  Const bNullStop As Byte = 0
  Dim bFrameName() As Byte
  Dim uLength As SIZE_DEFINE
  Dim bContent() As Byte
  
  '使用 ISO 解码
  bFrameName = StrConv(FrameName, vbFromUnicode)
  bContent = StrConv(Content, vbFromUnicode)
  uLength = LengthToByte(UBound(bContent) + 3)
  
  '写入
  Put #FileNumber, , bFrameName                   '写入 Frame 名称 (4 字节)
  Put #FileNumber, , lFlags                       '写入 Flags (2 字节)
  Put #FileNumber, , uLength.bSize1               '写入内容的大小 (>255 部分)
  Put #FileNumber, , uLength.bSize2               '写入内容的大小 (<255 部分)
  Put #FileNumber, , lStrFlags                    '写入字符串的标志信息
  Put #FileNumber, , bISODefine                   '写入字符串的标识 ISO 8859-1
  Put #FileNumber, , bContent                     '写入内容
  Put #FileNumber, , bNullStop                    '写入空终止
End Sub

'===================
' 使用 Unicode 标准
'===================
Public Sub WriteID3v2W(ByVal FileNumber As Integer, Optional ByVal Artist As String, Optional ByVal Album As String, Optional ByVal Title As String, Optional ByVal Track As String, Optional ByVal Genre As String, Optional ByVal Year As String, Optional ByVal Comment As String)
  '写入 ID3v2 的标签头部
  'ID3v2.3 标准: http://www.id3.org/id3v2.3.0.html
  Dim bHeader(9) As Byte
  Dim bPadding() As Byte
  
  '写入 Header
  bHeader(0) = &H49
  bHeader(1) = &H44
  bHeader(2) = &H33
  bHeader(3) = &H3
  bHeader(4) = &H0
  bHeader(5) = &H80
  bHeader(6) = &H0
  bHeader(7) = &H0
  bHeader(8) = &H10
  bHeader(9) = &H0
  
  '如果什么也没有就不写
  If Len(Artist) + Len(Album) + Len(Title) + Len(Track) + Len(Genre) + Len(Year) = 0 Then
    Exit Sub
  Else
    Put #FileNumber, 1, bHeader
  End If
  
  If Len(Artist) Then Call WriteFrameW(FileNumber, "TPE1", Artist)
  If Len(Title) Then Call WriteFrameW(FileNumber, "TIT2", Title)
  If Len(Album) Then Call WriteFrameW(FileNumber, "TALB", Album)
  If Len(Track) Then Call WriteFrameW(FileNumber, "TRCK", Track)
  If Len(Comment) Then Call WriteFrameW(FileNumber, "COMM", Comment, "chi")
  If Len(Genre) Then Call WriteFrameW(FileNumber, "TCON", Genre)
  If Len(Year) Then Call WriteFrameW(FileNumber, "TYER", Year)
  
  '然后填充内容
  ReDim bPadding(2058 - Seek(FileNumber)) As Byte
  Put #FileNumber, , bPadding
End Sub

Private Sub WriteFrameW(ByVal FileNumber As Integer, ByVal FrameName As String, ByVal Content As String, Optional ByVal WriteLang As String = vbNullString)
  '写入每个 Frame
  Const lFlags As Integer = 0
  Const lStrFlags As Integer = 0
  Const bUnicodeDefine As Byte = 1
  Const bNullStop As Integer = 0
  
  Dim bFrameName() As Byte
  Dim uLength As SIZE_DEFINE
  Dim bContent() As Byte
  Dim bBOM(2) As Byte
  Dim bLangInfo() As Byte
  Dim bLangEnder(4) As Byte
  
  '设置 Unicode 的 BOM
  bBOM(0) = &HFF
  bBOM(1) = &H0
  bBOM(2) = &HFE
  
  '使用 Unicode 解码
  bFrameName = StrConv(FrameName, vbFromUnicode)
  bContent = Content
  
  If Len(WriteLang) Then
    uLength = LengthToByte(LenB(Content) + 12)
  Else
    uLength = LengthToByte(LenB(Content) + 5)
  End If
  
  '写入
  Put #FileNumber, , bFrameName                   '写入 Frame 名称 (4 字节)
  Put #FileNumber, , lFlags                       '写入 Flags (2 字节)
  Put #FileNumber, , uLength.bSize1               '写入内容的大小 (>255 部分)
  Put #FileNumber, , uLength.bSize2               '写入内容的大小 (<255 部分)
  Put #FileNumber, , lStrFlags                    '写入字符串的标志信息
  Put #FileNumber, , bUnicodeDefine               '写入字符串的标识 Unicode
  
  If Len(WriteLang) Then
    bLangEnder(0) = &HFF
    bLangEnder(2) = &HFE
    bLangInfo = StrConv(WriteLang, vbFromUnicode)
    
    Put #FileNumber, , bLangInfo
    Put #FileNumber, , bLangEnder
  End If
  
  Put #FileNumber, , bBOM                         '写入 Unicode 的 BOM
  Put #FileNumber, , bContent                     '写入内容
  Put #FileNumber, , bNullStop                    '写入空终止
End Sub

'============
' 写入 ID3v1
'============
Public Sub WriteID3v1(ByVal FileNumber As Integer, Optional ByVal Artist As String, Optional ByVal Album As String, Optional ByVal Title As String, Optional ByVal Track As String, Optional ByVal Genre As String, Optional ByVal Year As String, Optional ByVal Comment As String)
  Dim bHeader() As Byte
  Dim bArtist() As Byte
  Dim bAlbum() As Byte
  Dim bTitle() As Byte
  Dim bComment() As Byte
  Dim bYear() As Byte
  Dim bTrack As Byte
  Dim bGenre As Byte
    
  '解码 ISO 8891-1
  bHeader = StrConv("TAG", vbFromUnicode)
  bArtist = StrConv(Artist, vbFromUnicode)
  bAlbum = StrConv(Album, vbFromUnicode)
  bTitle = StrConv(Title, vbFromUnicode)
  bComment = StrConv(Comment, vbFromUnicode)
  bYear = StrConv(Year, vbFromUnicode)
  
  If Val(Track) > 0 Then
    bTrack = CByte(Val(Track))
  End If
  
  If Len(Genre) Then
    bGenre = GetGenreCode(Genre)
  End If
  
  '定义大小
  ReDim Preserve bArtist(29) As Byte
  ReDim Preserve bAlbum(29) As Byte
  ReDim Preserve bTitle(29) As Byte
  ReDim Preserve bComment(28) As Byte
  ReDim Preserve bYear(3) As Byte
  
  '写入
  Put #FileNumber, , bHeader
  Put #FileNumber, , bTitle
  Put #FileNumber, , bArtist
  Put #FileNumber, , bAlbum
  Put #FileNumber, , bYear
  Put #FileNumber, , bComment
  Put #FileNumber, , bTrack
  Put #FileNumber, , bGenre
End Sub

Private Function GetGenreCode(ByVal sName As String) As Byte
  Dim bCode As Byte

  Select Case UCase(sName)
  Case "ACID": bCode = 34
  Case "ACID JAZZ": bCode = 74
  Case "ACID PUNK": bCode = 73
  Case "ACOUSTIC": bCode = 99
  Case "ALT.ROCK": bCode = 40
  Case "ALTERNATIVE": bCode = 20
  Case "AMBIENT": bCode = 26
  Case "ANIME": bCode = 145
  Case "AVANT GARDE": bCode = 90
  
  Case "BALLAD": bCode = 116
  Case "BASS": bCode = 41
  Case "BEAT": bCode = 135
  Case "BEBOB": bCode = 85
  Case "BIG BAND": bCode = 96
  Case "BLACK METAL": bCode = 138
  Case "BLUE GRASS": bCode = 89
  Case "BLUES": bCode = 0
  Case "BOOTY BASS": bCode = 107
  Case "BRIT POP": bCode = 132
  
  Case "CABARET": bCode = 65
  Case "CELTIC": bCode = 88
  Case "CHAMBER MUSIC": bCode = 104
  Case "CHANSON": bCode = 102
  Case "CHORUS": bCode = 97
  Case "CHRISTIAN GANGSTA RAP": bCode = 136
  Case "CHRISTIAN RAP": bCode = 61
  Case "CHRISTIAN ROCK": bCode = 141
  Case "CLASSIC ROCK": bCode = 1
  Case "CLASSICAL": bCode = 32
  Case "CLUB": bCode = 112
  Case "CLUB - HOUSE": bCode = 128
  Case "COMEDY": bCode = 57
  Case "CONTEMPORARY CHRISTIAN": bCode = 140
  Case "COUNTRY": bCode = 2
  Case "CROSSOVER": bCode = 139
  Case "CULT": bCode = 58
  
  Case "DANCE": bCode = 3
  Case "DANCE HALL": bCode = 125
  Case "DARKWAVE": bCode = 50
  Case "DEATH METAL": bCode = 22
  Case "DISCO": bCode = 4
  Case "DREAM": bCode = 55
  Case "DRUM & BASS": bCode = 127
  Case "DRUM SOLO": bCode = 122
  Case "DUET": bCode = 120
  
  Case "EASY LISTENING": bCode = 98
  Case "ELECTRONIC": bCode = 52
  Case "ETHNIC": bCode = 48
  Case "EURODANCE": bCode = 54
  Case "EURO - HOUSE": bCode = 124
  Case "EURO - TECHNO": bCode = 25
  
  Case "FAST FUSION": bCode = 84
  Case "FOLK": bCode = 80
  Case "FOLK / ROCK": bCode = 81
  Case "FOLKLORE": bCode = 115
  Case "FREESTYLE": bCode = 119
  Case "FUNK": bCode = 5
  Case "FUSION": bCode = 30
  
  Case "GAME": bCode = 36
  Case "GANGSTA RAP": bCode = 59
  Case "GOA": bCode = 126
  Case "GOSPEL": bCode = 38
  Case "GOTHIC": bCode = 49
  Case "GOTHIC ROCK": bCode = 91
  Case "GRUNGE": bCode = 6
  
  Case "HARD ROCK": bCode = 79
  Case "HARDCORE": bCode = 129
  Case "HEAVY METAL": bCode = 137
  Case "HIP HOP": bCode = 7
  Case "HOUSE": bCode = 35
  Case "HUMOUR": bCode = 100
  
  Case "INDIE": bCode = 131
  Case "INDUSTRIAL": bCode = 19
  Case "INSTRUMENTAL": bCode = 33
  Case "INSTRUMENTAL POP": bCode = 46
  Case "INSTRUMENTAL ROCK": bCode = 47
  
  Case "JAZZ": bCode = 8
  Case "JAZZ - FUNK": bCode = 29
  Case "JPOP": bCode = 146
  Case "JUNGLE": bCode = 63
  
  Case "LATIN": bCode = 86
  Case "LO - FI": bCode = 71
  
  Case "MEDITATIVE": bCode = 45
  Case "MERENGUE": bCode = 142
  Case "METAL": bCode = 9
  Case "MUSICAL": bCode = 77
  Case "NATIONAL FOLK": bCode = 82
  Case "NATIVE AMERICAN": bCode = 64
  Case "NEGERPUNK": bCode = 133
  Case "NEW AGE": bCode = 10
  Case "NEW WAVE": bCode = 66
  Case "NOISE": bCode = 39
  
  Case "OLDIES": bCode = 11
  Case "OPERA": bCode = 103
  Case "OTHER": bCode = 12
  
  Case "POLKA": bCode = 75
  Case "POLSK PUNK": bCode = 134
  Case "POP": bCode = 13
  Case "POP / FUNK": bCode = 62
  Case "POP / FOLK": bCode = 53
  Case "PR0N GROOVE": bCode = 109
  Case "POWER BALLAD": bCode = 117
  Case "PRANKS": bCode = 23
  Case "PRIMUS": bCode = 108
  Case "PROGRESSIVE ROCK": bCode = 92
  Case "PSYCHEDELIC": bCode = 67
  Case "PSYCHEDELIC ROCK": bCode = 93
  Case "PUNK": bCode = 43
  Case "PUNK ROCK": bCode = 121
  
  Case "R&B": bCode = 14
  Case "RAP": bCode = 15
  Case "RAVE": bCode = 68
  Case "REGGAE": bCode = 16
  Case "RETRO": bCode = 76
  Case "REVIVAL": bCode = 87
  Case "RHYTHMIC SOUL": bCode = 118
  Case "ROCK": bCode = 17
  Case "ROCK 'N'ROLL": bCode = 78
  
  Case "SALSA": bCode = 143
  Case "SAMBA": bCode = 114
  Case "SATIRE": bCode = 110
  Case "SHOWTUNES": bCode = 69
  Case "SKA": bCode = 21
  Case "SLOW JAM": bCode = 111
  Case "SLOW ROCK": bCode = 95
  Case "SONATA": bCode = 105
  Case "SOUL": bCode = 42
  Case "SOUND CLIP": bCode = 37
  Case "SOUNDTRACK": bCode = 24
  Case "SOUTHERN ROCK": bCode = 56
  Case "SPACE": bCode = 44
  Case "SPEECH": bCode = 101
  Case "SWING": bCode = 83
  Case "SYMPHONIC ROCK": bCode = 94
  Case "SYMPHONY": bCode = 106
  Case "SYNTH POP": bCode = 147
  
  Case "TANGO": bCode = 113
  Case "TECHNO": bCode = 18
  Case "TECHNO - INDUSTRIAL": bCode = 51
  Case "TERROR": bCode = 130
  Case "THRASH METAL": bCode = 144
  Case "TOP 40": bCode = 60
  Case "TRAILER": bCode = 70
  Case "TRANCE": bCode = 31
  Case "TRIBAL": bCode = 72
  Case "TRIP HOP": bCode = 27
  
  Case "VOCAL": bCode = 28
  
  Case Else: bCode = 0
  End Select
  
  GetGenreCode = bCode
End Function

'============
' 公用的函数
'============
Private Function LengthToByte(ByVal Length As Long) As SIZE_DEFINE
  '返回大小的字符串
  LengthToByte.bSize2 = Length Mod 256
  LengthToByte.bSize1 = Length \ 256
End Function

