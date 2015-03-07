VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ID3v1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'**************************************************************
'MP3 ID3v1 读取类模块
'---------------------
'BY Alexander Chen
'**************************************************************

Public Enum ID3V1_VERSION
  VERSION10 = 0                                   '版本 1.0
  VERSION11 = 1                                   '版本 1.1
  UNKNOWN = -1                                    '未知
End Enum

Public Exist As Boolean                           '存在 ID3v1
Public Version As ID3V1_VERSION                   'ID3v1 版本

Public Title As String                            '标题
Public Artist As String                           '艺术家
Public Album As String                            '专辑
Public Year As String                             '年代
Public Comment As String                          '注释
Public Track As Integer                           '音轨
Public Genre As String                            '流派

Private Const IML_KEY As String = ">ID3v1"
Private Const LST_TEXT As String = "ID3v1"
Private Const LST_COLOR As Long = 14051935

Public Property Get idImlKey() As String
  idImlKey = IML_KEY
End Property

Public Property Get idLstText() As String
  idLstText = LST_TEXT
End Property

Public Property Get idCellColor() As OLE_COLOR
  idCellColor = LST_COLOR
End Property

'============
' 读取 ID3v1
'============
Public Function LoadInfo(ByVal FileName As String) As Boolean
  Dim FileNum As Long
  Dim TagText(127) As Byte
  Dim StrTmp As String
  
  '打开文件
  On Error GoTo ToManyFile
  FileNum = FreeFile
  On Error GoTo 0
  
  Open FileName For Binary Access Read Lock Write As FileNum
  
  '判断是否有 TAG
  If LOF(FileNum) < 128 Then
    '字节太小
    InitProperties
    LoadInfo = False
    Close FileNum
    Exit Function
  Else
    Get FileNum, LOF(FileNum) - 127, TagText
    Close FileNum
    
    '判断是否存在 TAG 标签
    If UCase(GetStringFromByte(TagText, 0, 3)) = "TAG" Then
      '存在 ID3v1
      Me.Exist = True
    Else
      '不存在 ID3v1
      InitProperties
      Exist = False
      LoadInfo = False
      Exit Function
    End If
  End If
  
  '判断版本
  If TagText(UBound(TagText)) = 255 Then
    '表示是 ID3v1.0
    Me.Version = VERSION10
  Else
    Me.Version = VERSION11
  End If
  
  '获得数据
  If Me.Version = VERSION10 Then
    Me.Title = Trim((GetStringFromByte(TagText, 3, 30)))
    Me.Artist = Trim((GetStringFromByte(TagText, 33, 30)))
    Me.Album = Trim((GetStringFromByte(TagText, 63, 30)))
    Me.Year = Trim((GetStringFromByte(TagText, 93, 4)))
    Me.Comment = Trim((GetStringFromByte(TagText, 97, 28)))
  ElseIf Me.Version = VERSION11 Then
    Me.Title = Trim((GetStringFromByte(TagText, 3, 30)))
    Me.Artist = Trim((GetStringFromByte(TagText, 33, 30)))
    Me.Album = Trim((GetStringFromByte(TagText, 63, 30)))
    Me.Year = Trim((GetStringFromByte(TagText, 93, 4)))
    Me.Comment = Trim(StripNulls(GetStringFromByte(TagText, 97, 28)))
    Me.Track = CInt(TagText(126))
    Me.Genre = GenreName(CByte(TagText(127)))
  End If
  
  LoadInfo = True
  Exit Function
ToManyFile:
  Reset
  Resume
End Function

'============
' 初始化属性
'============
Private Sub InitProperties()
  Exist = False
  Version = UNKNOWN
  Title = vbNullString
  Artist = vbNullString
  Album = vbNullString
  Year = vbNullString
  Comment = vbNullString
  Track = -1
  Genre = -1
End Sub

'=================================
' 从 Byte 数组中获得字符
'------------------------
' ByteArrary - 要传递的 Byte 数组
' UpperBound - 上界
' ReadByte - 要获得的字符数
'=================================
Private Function GetStringFromByte(ByRef ByteArrary() As Byte, Optional ByVal UpperBound As Integer = 0, Optional ByVal ReadByte As Integer = 1) As String
  Dim bTemp() As Byte
  Dim i As Long
  
  ReDim bTemp(ReadByte - 1)
  
  For i = UpperBound To UpperBound + ReadByte - 1
    bTemp(i - UpperBound) = ByteArrary(i)
  Next i
  
  GetStringFromByte = StripNulls(StrConv(bTemp, vbUnicode))
End Function

'===========================
' 将 LPSTR 转化为 VB String
'---------------------------
' Item - LPSTR 字符串
'===========================
Private Function StripNulls(Item As String) As String
  Dim pos As Integer
  pos = InStr(Item, Chr$(0))
  If pos Then Item = Left$(Item, pos - 1)
  StripNulls = Item
End Function

Public Property Get GenreName(ByVal Genre As Byte) As String
Dim sName As String
   
   Select Case Genre
   
   Case 34: sName = "Acid"
   Case 74: sName = "Acid Jazz"
   Case 73: sName = "Acid Punk"
   Case 99: sName = "Acoustic"
   Case 40: sName = "Alt.Rock"
   Case 20: sName = "Alternative"
   Case 26: sName = "Ambient"
   Case 145: sName = "Anime"
   Case 90: sName = "Avant Garde"
   
   Case 116: sName = "Ballad"
   Case 41: sName = "Bass"
   Case 135: sName = "Beat"
   Case 85: sName = "Bebob"
   Case 96: sName = "Big Band"
   Case 138: sName = "Black Metal"
   Case 89: sName = "Blue Grass"
   Case 0: sName = "Blues"
   Case 107: sName = "Booty Bass"
   Case 132: sName = "Brit Pop"

   Case 65: sName = "Cabaret"
   Case 88: sName = "Celtic"
   Case 104: sName = "Chamber Music"
   Case 102: sName = "Chanson"
   Case 97: sName = "Chorus"
   Case 136: sName = "Christian Gangsta Rap"
   Case 61: sName = "Christian Rap"
   Case 141: sName = "Christian Rock"
   Case 1: sName = "Classic Rock"
   Case 32: sName = "Classical"
   Case 112: sName = "Club"
   Case 128: sName = "Club - House"
   Case 57: sName = "Comedy"
   Case 140: sName = "Contemporary Christian"
   Case 2: sName = "Country"
   Case 139: sName = "Crossover"
   Case 58: sName = "Cult"
   
   Case 3: sName = "Dance"
   Case 125: sName = "Dance Hall"
   Case 50: sName = "Darkwave"
   Case 22: sName = "Death Metal"
   Case 4: sName = "Disco"
   Case 55: sName = "Dream"
   Case 127: sName = "Drum & Bass"
   Case 122: sName = "Drum Solo"
   Case 120: sName = "Duet"
   
   Case 98: sName = "Easy Listening"
   Case 52: sName = "Electronic"
   Case 48: sName = "Ethnic"
   Case 54: sName = "Eurodance"
   Case 124: sName = "Euro - House"
   Case 25: sName = "Euro - Techno"
   
   Case 84: sName = "Fast Fusion"
   Case 80: sName = "Folk"
   Case 81: sName = "Folk / Rock"
   Case 115: sName = "Folklore"
   Case 119: sName = "Freestyle"
   Case 5: sName = "Funk"
   Case 30: sName = "Fusion"
   
   Case 36: sName = "Game"
   Case 59: sName = "Gangsta Rap"
   Case 126: sName = "Goa"
   Case 38: sName = "Gospel"
   Case 49: sName = "Gothic"
   Case 91: sName = "Gothic Rock"
   Case 6: sName = "Grunge"
   
   Case 79: sName = "Hard Rock"
   Case 129: sName = "Hardcore"
   Case 137: sName = "Heavy Metal"
   Case 7: sName = "Hip Hop"
   Case 35: sName = "House"
   Case 100: sName = "Humour"
   
   Case 131: sName = "Indie"
   Case 19: sName = "Industrial"
   Case 33: sName = "Instrumental"
   Case 46: sName = "Instrumental Pop"
   Case 47: sName = "Instrumental Rock"
   
   Case 8: sName = "Jazz"
   Case 29: sName = "Jazz - Funk"
   Case 146: sName = "JPop"
   Case 63: sName = "Jungle"
   
   Case 86: sName = "Latin"
   Case 71: sName = "Lo - fi"
   
   Case 45: sName = "Meditative"
   Case 142: sName = "Merengue"
   Case 9: sName = "Metal"
   Case 77: sName = "Musical"
   Case 82: sName = "National Folk"
   Case 64: sName = "Native American"
   Case 133: sName = "Negerpunk"
   Case 10: sName = "New Age"
   Case 66: sName = "New Wave"
   Case 39: sName = "Noise"
   
   Case 11: sName = "Oldies"
   Case 103: sName = "Opera"
   Case 12: sName = "Other"
   
   Case 75: sName = "Polka"
   Case 134: sName = "Polsk Punk"
   Case 13: sName = "Pop"
   Case 62: sName = "Pop / Funk"
   Case 53: sName = "Pop / Folk"
   Case 109: sName = "Pr0n Groove"
   Case 117: sName = "Power Ballad"
   Case 23: sName = "Pranks"
   Case 108: sName = "Primus"
   Case 92: sName = "Progressive Rock"
   Case 67: sName = "Psychedelic"
   Case 93: sName = "Psychedelic Rock"
   Case 43: sName = "Punk"
   Case 121: sName = "Punk Rock"
   
   Case 14: sName = "R&B"
   Case 15: sName = "Rap"
   Case 68: sName = "Rave"
   Case 16: sName = "Reggae"
   Case 76: sName = "Retro"
   Case 87: sName = "Revival"
   Case 118: sName = "Rhythmic Soul"
   Case 17: sName = "Rock"
   Case 78: sName = "Rock 'n'Roll"
   
   Case 143: sName = "Salsa"
   Case 114: sName = "Samba"
   Case 110: sName = "Satire"
   Case 69: sName = "Showtunes"
   Case 21: sName = "Ska"
   Case 111: sName = "Slow Jam"
   Case 95: sName = "Slow Rock"
   Case 105: sName = "Sonata"
   Case 42: sName = "Soul"
   Case 37: sName = "Sound Clip"
   Case 24: sName = "Soundtrack"
   Case 56: sName = "Southern Rock"
   Case 44: sName = "Space"
   Case 101: sName = "Speech"
   Case 83: sName = "Swing"
   Case 94: sName = "Symphonic Rock"
   Case 106: sName = "Symphony"
   Case 147: sName = "Synth Pop"
   
   Case 113: sName = "Tango"
   Case 18: sName = "Techno"
   Case 51: sName = "Techno - Industrial"
   Case 130: sName = "Terror"
   Case 144: sName = "Thrash Metal"
   Case 60: sName = "Top 40"
   Case 70: sName = "Trailer"
   Case 31: sName = "Trance"
   Case 72: sName = "Tribal"
   Case 27: sName = "Trip Hop"
   
   Case 28: sName = "Vocal"
   
   
   End Select
   GenreName = sName
End Property

