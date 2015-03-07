VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ID3v2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

' 2004-01-10

' * Added ID3v2.2 support
' * Fixed problem with tags with trailing nulls. Previously code
'   used to return an empty string.
' * Added sanity test for corrupt headers to prevent allocation
'   of vast amounts of memory

Private Type ID3V22HDR
   frameName1 As String * 3
   frameSize1 As Byte
   frameSize2 As Byte
   frameSize3 As Byte
End Type
Private Type ID3V23HDR
   sFrameName As String * 4      ' 4
   lSize As Long                 ' 8
   bPad1 As Byte                 ' 10
   bPad2 As Byte                 ' 12
End Type


Private m_sMp3File As String
Private m_iID3Pos As Long
Private m_sID3Ver As Byte
Private m_sTitle As String
Private m_sArtist As String
Private m_sAlbum As String
Private m_sYear As String
Private m_sComment As String
Private m_sGenre As Byte

Public Exist As Boolean
Public IsUnicode As Boolean

Private m_sTrack As String
Private m_sPlayCounter As String
Private m_sEncodedBy As String
Private m_sGenreName As String
Private m_sLinkTo As String
Private m_sOriginalArtist As String
Private m_sComposer As String
Private m_sCopyright As String
Private m_sAudioURL As String
Private m_sBuyURL As String
Private m_sArtistURL As String
Private m_sLyrics As String

Private m_cFrame As Collection
Private m_cFrameItems As Collection
Private m_cTag As Collection

Private Const IML_KEY As String = ">ID3v2"
Private Const LST_TEXT As String = "ID3v2"
Private Const LST_COLOR As Long = 5724922

Public Property Get idImlKey() As String
  idImlKey = IML_KEY
End Property

Public Property Get idLstText() As String
  If IsUnicode Then
    idLstText = LST_TEXT & " Unicode"
  Else
    idLstText = LST_TEXT & " ISO"
  End If
End Property

Public Property Get idCellColor() As OLE_COLOR
  idCellColor = LST_COLOR
End Property

Public Property Get HasID3v2Tag() As Boolean
   HasID3v2Tag = (m_iID3Pos > 0)
End Property

Public Property Get ID3v2TagVersion() As Byte
   ID3v2TagVersion = m_sID3Ver
End Property

Public Property Get FrameCount() As Long
   FrameCount = m_cFrame.Count
End Property

Public Property Get Frame(ByVal Index As Long) As String
   Frame = m_cFrame.Item(Index)
End Property

Public Sub RemoveFrame(Frame As Variant)
   
   Dim sTag As String
   Dim lErr As Long
   Dim sErr As String
   
   ' does this frame exist?
   On Error Resume Next
   sTag = m_cFrame.Item(Frame)
   If (Err.Number <> 0) Then
      lErr = Err.Number
      sErr = Err.Description
      On Error GoTo 0
      Err.Raise lErr, App.EXEName & ".cMP3ID3v2", sErr
   Else
      On Error GoTo 0
      Dim sKey As String
      sKey = m_cFrame.Item(Frame)
      
      ' remove it from m_cTag:
      m_cFrame.Remove Frame
      m_cFrameItems.Remove Frame
      
      ' now remove any associated items from the items & tag collections:
      Dim i As Long
      i = 0
      Err.Clear
      On Error Resume Next
      Do
         i = i + 1
         m_cTag.Remove sKey & ":" & i
      Loop While (Err.Number = 0)
   End If
   
   
End Sub

Public Function LoadInfo(ByVal FileName As String) As Boolean
  m_sMp3File = FileName
  IsUnicode = False
  LoadInfo = pLoadTag
  
End Function

Public Property Get TagsInFrame(Frame As Variant) As Long
   On Error Resume Next
   TagsInFrame = m_cFrameItems(Frame)
End Property

Public Sub AddTag(ByVal sFrame As String, ByVal sTag As String)
   Dim iCount As Long
   ' does it exist?
   On Error Resume Next
   sTag = m_cFrame.Item(sFrame)
   If (Err.Number <> 0) Then
      ' it doesn't exist, need to add:
      On Error GoTo 0
      m_cFrame.Add sFrame, sFrame
      m_cFrameItems.Add 1, sFrame
      iCount = 1
   Else
      ' it already exists:
      On Error GoTo 0
      iCount = m_cFrameItems(sFrame) + 1
      m_cFrameItems.Remove sFrame
      m_cFrameItems.Add iCount, sFrame
   End If
   ' now add the tag:
   m_cTag.Add sTag, sFrame & ":" & iCount

End Sub

Public Sub RemoveTag(ByVal sFrame As String, ByVal tagIndex As Long)
   ' does it exist?
   Dim sTagExist As String
   Dim lErr As Long
   Dim sErr As String
   
   On Error Resume Next
   sTagExist = m_cTag.Item(sFrame & ":" & tagIndex)
   If (Err.Number <> 0) Then
      lErr = Err.Number
      sErr = Err.Description
      On Error GoTo 0
      Err.Raise lErr, App.EXEName & ".cMP3ID3v2", sErr
   Else
      ' we can remove it:
      m_cTag.Remove sFrame & ":" & tagIndex
      
      Dim iCount As Long
      iCount = m_cTag.Item(sFrame) - 1
      If (iCount = 0) Then
         m_cTag.Remove sFrame
         m_cFrameItems.Remove sFrame
      Else
         ' this is appalling:
         m_cFrameItems.Remove sFrame
         m_cFrameItems.Add iCount
         Dim cTags As New Collection
         Dim iNewIndex As Long
         Dim i As Long
         For i = 1 To iCount + 1
            If (i = tagIndex) Then
            Else
               iNewIndex = iNewIndex + 1
               cTags.Add m_cTag(sFrame & ":" & i), sFrame & ":" & iNewIndex
            End If
         Next i
         Set m_cTag = cTags
      End If
   End If
End Sub

Private Property Get Tag( _
      ByVal sFrame As String, _
      ByVal indexInFrame As Long _
   ) As String
   Tag = m_cTag(sFrame & ":" & indexInFrame)
End Property

Public Property Get ArtistURL() As String
   ArtistURL = m_sArtistURL
End Property
Public Property Let ArtistURL(ByVal Value As String)
   m_sArtistURL = Value
   On Error Resume Next
   RemoveFrame "WOAR"
   On Error GoTo 0
   AddTag "WOAR", Value
End Property


Public Property Get BuyURL() As String
   BuyURL = m_sBuyURL
End Property
Public Property Let BuyURL(ByVal Value As String)
   m_sBuyURL = Value
   On Error Resume Next
   RemoveFrame "WCOM"
   On Error GoTo 0
   AddTag "WCOM", Value
End Property


Public Property Get AudioURL() As String
   AudioURL = m_sAudioURL
End Property
Public Property Let AudioURL(ByVal Value As String)
   m_sAudioURL = Value
   On Error Resume Next
   RemoveFrame "WOAF"
   On Error GoTo 0
   AddTag "WOAF", Value
End Property


Public Property Get Copyright() As String
   Copyright = m_sCopyright
End Property
Public Property Let Copyright(ByVal Value As String)
   m_sCopyright = Value
   On Error Resume Next
   RemoveFrame "TCOP"
   On Error GoTo 0
   AddTag "TCOP", Value
End Property

Public Property Get Composer() As String
   Composer = m_sComposer
End Property
Public Property Let Composer(ByVal Value As String)
   m_sComposer = Value
   On Error Resume Next
   RemoveFrame "TCOM"
   On Error GoTo 0
   AddTag "TCOM", Value
End Property


Public Property Get OriginalArtist() As String
   OriginalArtist = m_sOriginalArtist
End Property
Public Property Let OriginalArtist(ByVal Value As String)
   m_sOriginalArtist = Value
   On Error Resume Next
   RemoveFrame "TOPE"
   On Error GoTo 0
   AddTag "TOPE", Value
End Property


Public Property Get LinkTo() As String
   LinkTo = m_sLinkTo
End Property
Public Property Let LinkTo(ByVal Value As String)
   m_sLinkTo = Value
   On Error Resume Next
   RemoveFrame "WXXX"
   On Error GoTo 0
   AddTag "WXXX", vbNullChar & Value
End Property


Public Property Get PlayCounter() As String
   PlayCounter = m_sPlayCounter
End Property
Public Property Let PlayCounter(ByVal Value As String)
   m_sPlayCounter = Value
   On Error Resume Next
   RemoveFrame "PCNT"
   On Error GoTo 0
   AddTag "PCNT", Value
End Property

Public Property Get EncodedBy() As String
   EncodedBy = m_sEncodedBy
End Property
Public Property Let EncodedBy(ByVal Value As String)
   m_sEncodedBy = Value
   On Error Resume Next
   RemoveFrame "TENC"
   On Error GoTo 0
   AddTag "TENC", Value
End Property

Public Property Get Title() As String
   Title = m_sTitle
End Property
Public Property Let Title(ByVal Value As String)
   m_sTitle = Value
   On Error Resume Next
   RemoveFrame "TIT2"
   On Error GoTo 0
   AddTag "TIT2", Value
End Property

Public Property Get Artist() As String
   Artist = m_sArtist
End Property
Public Property Let Artist(ByVal Value As String)
   m_sArtist = Value
   On Error Resume Next
   RemoveFrame "TPE1"
   On Error GoTo 0
   AddTag "TPE1", Value
End Property

Public Property Get Album() As String
   Album = m_sAlbum
End Property
Public Property Let Album(ByVal Value As String)
   m_sAlbum = Value
   On Error Resume Next
   RemoveFrame "TALB"
   On Error GoTo 0
   AddTag "TALB", Value
End Property

Public Property Get Year() As String
   Year = m_sYear
End Property
Public Property Let Year(ByVal Value As String)
   m_sYear = Value
   On Error Resume Next
   RemoveFrame "TYER"
   On Error GoTo 0
   AddTag "TYER", Value
End Property

Public Property Get Comment() As String
   Comment = m_sComment
End Property
Public Property Let Comment(ByVal Value As String)
   m_sComment = Value
   On Error Resume Next
   RemoveFrame "COMM"
   On Error GoTo 0
   AddTag "COMM", vbNullChar & "nt" & vbNullChar & Value
End Property

Public Property Get Lyrics() As String
   Lyrics = m_sLyrics
End Property
Public Property Let Lyrics(ByVal Value As String)
   m_sLyrics = Value
   On Error Resume Next
   RemoveFrame "USLT"
   On Error GoTo 0
   AddTag "USLT", vbNullChar & Value
End Property

Public Property Get Genre() As String
   Genre = GenreName(m_sGenre)
   
   If Len(Genre) = 0 Then
      Genre = m_sGenreName
   End If
End Property
Public Property Let Genre(ByVal Value As String)
   m_sGenre = CInt(Val(Value))
   On Error Resume Next
   RemoveFrame "TCON"
   On Error GoTo 0
   AddTag "TCON", "(" & Value & ")" & OtherGenreName
End Property

Public Property Get OtherGenreName() As String
   OtherGenreName = m_sGenreName
End Property
Public Property Let OtherGenreName(ByVal Value As String)
   m_sGenreName = Value
   On Error Resume Next
   RemoveFrame "TCON"
   On Error GoTo 0
   AddTag "TCON", "(" & Genre & ")" & Value
End Property

Public Property Get Track() As String
   Track = m_sTrack
End Property
Public Property Let Track(ByVal Value As String)
   m_sTrack = Value
   On Error Resume Next
   RemoveFrame "TRCK"
   On Error GoTo 0
   AddTag "TRCK", Value
End Property



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


Public Property Get MP3File() As String
   MP3File = m_sMp3File
End Property

Public Property Let MP3File(ByVal Value As String)
   m_sMp3File = Value
   pLoadTag
End Property

Public Property Get TagVersion() As Byte
   TagVersion = m_sID3Ver
End Property

'Public Sub Update()
'   pUpdateTag
'End Sub

Private Function pLoadTag() As Boolean
Dim iFile As Integer
   
   Set m_cTag = New Collection
   Set m_cFrame = New Collection
   Set m_cFrameItems = New Collection

   m_iID3Pos = 0
   m_sID3Ver = 0
   m_sTitle = ""
   m_sArtist = ""
   m_sAlbum = ""
   m_sYear = ""
   m_sComment = ""
   m_sGenre = 255

   m_sTrack = ""
   m_sPlayCounter = ""
   m_sEncodedBy = ""
   m_sGenreName = ""
   m_sLinkTo = ""
   m_sOriginalArtist = ""
   m_sComposer = ""
   m_sCopyright = ""

   m_sAudioURL = ""
   m_sBuyURL = ""
   m_sArtistURL = ""

   Exist = False
   iFile = FreeFile
   On Error Resume Next
   Open m_sMp3File For Binary Access Read Lock Write As #iFile
   If (Err.Number <> 0) Then
      Dim lErr As Long
      Dim sErr As String
      lErr = Err.Number
      sErr = Err.Description
      On Error GoTo 0
      Err.Raise lErr, App.EXEName & ".cMP3ID3v1", sErr
   Else
      On Error GoTo 0
      
      Dim iID3Pos As Long
      iID3Pos = findID3Pos(iFile)
      
      pLoadTag = False
      Exist = False
      
      ' If we got an ID3 tag, then try and process it:
      If (iID3Pos > 0) Then
         Seek #iFile, iID3Pos
         m_iID3Pos = iID3Pos
         pLoadID3Data iFile
         pLoadTag = True
        Exist = True
      End If
      
   End If
   
   On Error Resume Next
   Close #iFile
   On Error GoTo 0
   Err.Clear
   
End Function
Private Function findID3Pos(ByVal iFile As Integer)
   
   ' Find the first occurence of "ID3"
   ' in the file.  ID3 marks the ID3 tag
   ' Note that &HFFFB marks the header of the
   ' MP3 file.
   Dim sBuf As String
   sBuf = String$(4096, 0)
   Dim iChunkSize As Long
   iChunkSize = 4096
   Dim lFileLen As Long
   lFileLen = LOF(iFile)
   Dim iPos As Long
   iPos = 1
   Dim bComplete As Boolean
   bComplete = False
   Dim iID3Pos As Long
   Dim iHdrPos As Long
   Dim sMp3Hdr As String
   
   sMp3Hdr = Chr(&HFF) & Chr(&HFB)
   
   If LOF(iFile) Then
    Do While Not bComplete
       If (iPos + iChunkSize >= LOF(iFile)) Then
          bComplete = True
          sBuf = Space$(LOF(iFile) - iPos)
       End If
       Get #iFile, , sBuf
       iID3Pos = InStr(sBuf, "ID3")
       If (iID3Pos > 0) Then
          bComplete = True
          findID3Pos = iPos + iID3Pos + 2
       Else
          ' MP3 header found
          iHdrPos = InStr(sBuf, sMp3Hdr)
          If (iHdrPos > 0) Then
             bComplete = True
          End If
          iPos = iPos + iChunkSize - 3
          Seek #iFile, iPos
       End If
    Loop
  End If

End Function

Private Sub pLoadID3Data( _
      ByVal iFile As Integer _
   )
   Dim bVer As Byte

   Get #iFile, , bVer
   m_sID3Ver = bVer
   
   If (m_sID3Ver < 2) Or (m_sID3Ver > 4) Then
      ' incorrect version.
   Else
      ' junk bytes
      Get #iFile, , bVer
      Get #iFile, , bVer
      
      ' read the length of the ID3 tag
      Dim lTagLenFile As Long
      Dim lTagLen As Long
      
      Get #iFile, , lTagLenFile
      lTagLen = getSize(lTagLenFile)
      
      ' Now start reading the data:
      Dim bComplete As Boolean
      Dim sBuf As String
      Dim bBuf() As Byte
      Dim sTag As String
      Dim lSize As Long
      Dim lReadSize As Long
      
      If (m_sID3Ver > 2) Then
         Dim tv3 As ID3V23HDR
         
         Do While Not bComplete
            Get #iFile, , tv3
            lReadSize = lReadSize + LenB(tv3)
            
            If StrComp(tv3.sFrameName, String$(4, vbNullChar)) = 0 Then
               bComplete = True
            Else
               lSize = getSize(tv3.lSize)
               If (lReadSize + lSize > lTagLen) Or (lSize <= 0) Then
                  Debug.Print "ERROR!!!!", m_sMp3File
                  bComplete = True
               Else
'                  sBuf = String$(lSize, 0)
'                  Get #iFile, , sBuf

                  ReDim bBuf(lSize - 1) As Byte
                  Get #iFile, , bBuf
                  sBuf = TranslateString(bBuf)
                  
                  '转化 ID3v2.4=>ID3v2.3
                  If (m_sID3Ver = 4) And (tv3.sFrameName = "TDRC") Then tv3.sFrameName = "TYER"
                  
                  lReadSize = lReadSize + lSize
                  sTag = psStripNulls(sBuf)
                  pAddTag tv3.sFrameName, sTag
                  
                  '如果是 Unicode 就要跳过下一个字符
                  If IsUnicode Then
                    Seek #iFile, Seek(iFile) + 1
                    
                    '如果是注释字段还要在偏移
                    If tv3.sFrameName = "TCOM" Then
                      Seek #iFile, Seek(iFile) + 1
                    End If
                  End If
               End If
            End If
            If (Seek(iFile) > lTagLen) Then
               bComplete = True
            End If
         Loop
         
      Else
         Dim tv2 As ID3V22HDR
         
         Debug.Print "REVISION 2 FILE", m_sMp3File
         Dim sFrameName As String
         
         Do While Not bComplete
            Get #iFile, , tv2
            lReadSize = lReadSize + LenB(tv2)

            If StrComp(tv2.frameName1, String$(3, vbNullChar)) = 0 Then
               bComplete = True
            Else
               lSize = tv2.frameSize3 Or (tv2.frameSize2 * &H100&) Or (tv2.frameSize1 * &H10000)
               If (lReadSize + lSize > lTagLen) Then
                  Debug.Print "ERROR!!!!", m_sMp3File
                  bComplete = True
               Else
                  sFrameName = pV2toV3FrameName(tv2.frameName1)

'                  sBuf = String$(lSize, 0)
'                  Get #iFile, , sBuf
                  
                  ReDim bBuf(lSize - 1) As Byte
                  Get #iFile, , bBuf
                  sBuf = TranslateString(bBuf)
                  
                  lReadSize = lReadSize + lSize
                  sTag = psStripNulls(sBuf)
                  pAddTag sFrameName, sTag
                  
                  '如果是 Unicode 就要跳过下一个字符
                  If IsUnicode Then
                    Seek #iFile, Seek(iFile) + 1
                  
                    '如果是注释字段还要在偏移
                    If tv2.frameName1 = "COM" Then
                      Seek #iFile, Seek(iFile) + 1
                    End If
                  End If
               End If
            End If
            If (Seek(iFile) > lTagLen) Then
               bComplete = True
            End If
         Loop

      End If
      
   End If
   
      
End Sub
Private Function psStripNulls(ByVal sBuf As String) As String
Dim i As Long
Dim bFoundFirstChar As Boolean
Dim sTag As String
   
   sTag = ""
   For i = 1 To Len(sBuf)
      If Not (Asc(Mid(sBuf, i, 1)) = 0) Then
         sTag = sTag & Mid(sBuf, i, 1)
      End If
   Next i
   psStripNulls = sTag
   
End Function

Private Function pV2toV3FrameName(ByVal sV2FrameName As String) As String
   
   ' There are probably some more tags that need to be added
   ' here. Send a mail with the MP3 file if you get "Unidentified frame"
   Select Case sV2FrameName
   Case "TP1" ' artist
      pV2toV3FrameName = "TPE1"
   Case "TT2" ' track title
      pV2toV3FrameName = "TIT2"
   Case "TAL" ' album
      pV2toV3FrameName = "TALB"
   Case "COM" ' comment
      pV2toV3FrameName = "COMM"
   Case "TRK" ' track
      pV2toV3FrameName = "TRCK"
   Case "TEN" ' encoder
      pV2toV3FrameName = "TENC"
   Case "TYE" ' year
      pV2toV3FrameName = "TYER"
   Case "TCO" ' genre
      pV2toV3FrameName = "TCON"
   Case Else
      Debug.Print "Unidentified ID3v2 frame : " & sV2FrameName, m_sMp3File
   End Select
   
End Function

Private Sub pAddTag( _
      ByVal sFrameName As String, _
      ByVal sTag As String _
   )
   
   Dim iCount As Long
   
   ' This frame may already be present:
   On Error Resume Next
   m_cFrame.Add sFrameName, sFrameName
   If (Err.Number = 0) Then
      ' it wasn't there
      On Error GoTo 0
      m_cFrameItems.Add 1, sFrameName
      iCount = 1
   Else
      ' it was there, increase the count:
      On Error GoTo 0
      iCount = m_cFrameItems(sFrameName) + 1
      ' Why do I even try to use VB Collection object, it is
      ' absolutely useless - here we should say
      ' m_cFrameItems(sFrameName) = iCount but it fails...
      m_cFrameItems.Remove sFrameName
      m_cFrameItems.Add iCount, sFrameName
   End If
   
   ' Add the frame to the frame items and then the tag:
   m_cTag.Add sTag, sFrameName & ":" & iCount
   
   Select Case sFrameName
   Case "PCNT" ' Play counter
      m_sPlayCounter = sTag
   Case "TRCK" ' track
      m_sTrack = sTag
   Case "TENC" ' encoded by
      m_sEncodedBy = sTag
   Case "WXXX" ' link to
      m_sLinkTo = sTag
   Case "TCOP" ' copyright
      m_sCopyright = sTag
   Case "TOPE" ' original artist
      m_sOriginalArtist = sTag
   Case "TCOM" ' composer
      m_sComposer = sTag
   Case "TCON" ' genre
      Dim iPosGS As Long
      Dim iPosGE As Long
      Dim lGenre As Long
      Dim bGenreSet As Boolean
      iPosGS = InStr(sTag, "(")
      If (iPosGS > 0) Then
         iPosGE = InStr(sTag, ")")
         If (iPosGE > 0) Then
            On Error Resume Next
            lGenre = CLng(Mid$(sTag, iPosGS + 1, iPosGE - iPosGS - 2))
            If (Err.Number = 0) Then
               m_sGenre = lGenre
               If (Err.Number = 0) Then
                  If (iPosGE + 1 < Len(sTag)) Then
                     m_sGenreName = Mid$(sTag, iPosGE + 1)
                  Else
                     m_sGenreName = GenreName(m_sGenre)
                  End If
                  bGenreSet = (Err.Number = 0)
               End If
            End If
         End If
      End If
      On Error GoTo 0
      If Not bGenreSet Then
         m_sGenreName = sTag
      End If
         
   Case "COMM" ' comment
      
      ' often, there are multiple comments:
      If (Len(m_sComment) > 0) Then
         m_sComment = m_sComment & vbNullChar & vbCrLf & sTag
      Else
         m_sComment = sTag
      End If
      
   Case "TYER" ' year
      m_sYear = sTag
      
   Case "TIT2" ' title
      m_sTitle = sTag
      
   Case "TRCK" ' track number
      m_sTrack = sTag
   
   Case "TPE1" ' Artist
      m_sArtist = sTag
   
   Case "TALB" ' Album
      m_sAlbum = sTag

   Case "WOAF" ' Audio URL
      m_sAudioURL = sTag
      
   Case "WOAR" ' Artist URL
      m_sArtistURL = sTag
   
   Case "WCOM" ' Buy URL
      m_sBuyURL = sTag
   
   Case "USLT" ' lyrics
      m_sLyrics = sTag
      
   End Select
   
End Sub

Private Function getSize(ByVal lFromFile) As Long
Dim lR As Long
   ' Re-order the bytes:
   lR = (lFromFile And &H7F000000) \ &H1000000
   If (lFromFile And &H80000000) = &H80000000 Then
      lR = lR Or &H80
   End If
   lR = lR Or ((lFromFile And &HFF0000) \ &H10000) * &H100&
   lR = lR Or ((lFromFile And &HFF00&) \ &H100&) * &H10000
   lR = lR Or (lFromFile And &H7F&) * &H1000000
   If (lFromFile And &H80) = &H80 Then
      lR = lR Or &H80000000
   End If
   getSize = lR
End Function

Private Sub setSize(b() As Byte, ByVal lStart As Long, ByVal lSize As Long)
   b(lStart + 3) = lSize And &HFF
   b(lStart + 2) = (lSize And &HFF00) \ &H100&
   b(lStart + 1) = (lSize And &HFF0000) \ &H10000
   b(lStart) = (lSize And &H7FFFFFFF) \ &H1000000
   If (lSize And &H80000000) = &H80000000 Then
      b(lStart) = b(lStart) Or &H80
   End If
End Sub
Private Sub pUpdateTag()
Dim lErr As Long
Dim sErr As String

   On Error GoTo errorHandler
   ' create a byte array containing the information
   ' we want to write out:
   Dim b() As Byte
   
   ' Write header:
   ReDim b(0 To 11) As Byte
   b(0) = Asc("I")
   b(1) = Asc("D")
   b(2) = Asc("3")
   b(3) = 3
   Dim lSize As Long
   lSize = 10
   
   ' start writing:
   Dim sFrame As String
   Dim iTagCount As Long
   Dim k As Long
   For k = 1 To m_cFrame.Count
      sFrame = m_cFrame.Item(k)
      If InStr(sFrame, "ID3") = 0 Then
         iTagCount = m_cFrameItems(sFrame)
         If (iTagCount > 0) Then
            Dim i As Long, j As Long
            Dim sTag As String
            Dim lTagLen As Long
            Dim bTag() As Byte
            For i = 1 To iTagCount
               ' how long is the tag?
               sTag = m_cTag(sFrame & ":" & i)
               sTag = vbNullChar & sTag
               lTagLen = Len(sTag)
               ReDim Preserve b(0 To lSize + lTagLen + 12 - 1) As Byte
               ' write the frame:
               b(lSize) = Asc(Mid(sFrame, 1, 1))
               b(lSize + 1) = Asc(Mid(sFrame, 2, 1))
               b(lSize + 2) = Asc(Mid(sFrame, 3, 1))
               b(lSize + 3) = Asc(Mid(sFrame, 4, 1))
               ' write the size:
               setSize b, lSize + 4, lTagLen
               
               ' write the tag:
               bTag = StrConv(sTag, vbFromUnicode)
               For j = LBound(bTag) To UBound(bTag)
                  b(lSize + 10 + j) = bTag(j)
               Next j
               
               ' prepare for the next one:
               lSize = lSize + lTagLen + 10
            Next i
         End If
      End If
   Next k
   lSize = lSize + 4
   ReDim Preserve b(0 To lSize - 1) As Byte
   
   ' Correct header size:
   setSize b, 6, lSize
   
   
   ' Now check if we have sufficient space to write the
   ' ID3v2 header to the file:
   Dim iFile As Integer
   iFile = FreeFile
   
   On Error Resume Next
   Open m_sMp3File For Binary Access Read Write Lock Write As #iFile
   If (Err.Number <> 0) Then
      lErr = Err.Number
      sErr = Err.Description
      On Error GoTo 0
      Err.Raise lErr, App.EXEName & ".cMP3ID3v2", sErr
   Else
      
      On Error GoTo errorHandler
      
      Dim iPos As Long
      Dim bVer As Byte
      iPos = findID3Pos(iFile)
      If (iPos > 0) Then
         
         Seek #iFile, iPos
         
         ' find the available space to write into:
         Get #iFile, , bVer
         Get #iFile, , bVer
         Get #iFile, , bVer
         Dim lTagLenFile As Long
         Dim lTagBlockLen As Long
         Get #iFile, , lTagLenFile
         lTagBlockLen = getSize(lTagLenFile)
         
         If (lSize < lTagBlockLen) Then
            ' we can overwrite the existing ID3 tag
            setSize b, 6, lTagBlockLen
            
            Seek #iFile, iPos - 3
            Put #iFile, , b
            
         Else
            ' we need to allocate space for this ID3 tag:
            Dim lNewTagSpace As Long
            lNewTagSpace = ((lSize \ 2048) + 1) * 2048
            setSize b, 6, lNewTagSpace
            
            iFile = copyFileShift(iFile, lNewTagSpace - lTagBlockLen)
            If Not (iFile = 0) Then
               Seek #iFile, 1
               Put #iFile, , b
            End If
            
         End If
      Else
         ' we to create a new ID3 tag:
         lNewTagSpace = ((lSize \ 2048) + 1) * 2048
         setSize b, 6, lNewTagSpace
         
         ' take everything from the start to then end
         ' and put it at position lNewTagSpace along:
         iFile = copyFileShift(iFile, lNewTagSpace)
         If Not (iFile = 0) Then
            Seek #iFile, 1
            Put #iFile, , b
         End If
         
      End If
      
      
   End If
   On Error Resume Next
   Close #iFile
   On Error GoTo 0
   Exit Sub
   
errorHandler:
   ' out of memory, can't read or write files, out of disk space
   ' etc
   lErr = Err.Number
   sErr = Err.Description
   On Error Resume Next
   Close #iFile
   On Error GoTo 0
   Err.Raise lErr, App.EXEName & ".cMP3ID3v2", sErr
   Exit Sub
   
End Sub

Private Function copyFileShift( _
      ByVal iFile As Integer, _
      ByVal lShiftBy As Long _
   ) As Integer
Dim lErr As Long
Dim sErr As String
   
   On Error GoTo errorHandler
   
   Dim sTempFile As String
   sTempFile = GetTempFile()
   Dim iNewFile As Integer
   iNewFile = FreeFile
   Open sTempFile For Binary Access Read Write As #iNewFile
   Seek #iFile, 1
   
   Dim iPos As Long
   Dim iChunkSize As Long
   Dim bComplete As Boolean
   Dim b() As Byte
   
   ' Write out 0s to the shiftby bytes:
   bComplete = False
   iChunkSize = 4096
   ReDim b(0 To iChunkSize - 1) As Byte
   iPos = 1
   Do
      If (iPos + iChunkSize >= lShiftBy) Then
         iChunkSize = lShiftBy - iPos + 1
         ReDim b(0 To iChunkSize - 1) As Byte
         bComplete = True
      End If
      Put #iNewFile, , b
      iPos = iPos + iChunkSize
   Loop While Not bComplete
   
   bComplete = False
   iChunkSize = 4096
   ReDim b(0 To iChunkSize - 1) As Byte
   iPos = 1
   Do
      If (iPos + iChunkSize >= LOF(iFile)) Then
         iChunkSize = LOF(iFile) - iPos + 1
         ReDim b(0 To iChunkSize - 1) As Byte
         bComplete = True
      End If
      Get #iFile, , b
      Put #iNewFile, , b
      iPos = iPos + iChunkSize
   Loop While Not bComplete
   
   Close #iFile
   Close #iNewFile
   
   On Error Resume Next
   Kill m_sMp3File
   If Not (Err.Number = 0) Then
      lErr = Err.Number
      sErr = Err.Description
      On Error GoTo 0
      Err.Raise lErr, App.EXEName & ".cMP3ID3v2", sErr
      Exit Function
   End If
   On Error Resume Next
   Name sTempFile As m_sMp3File
   If Not (Err.Number = 0) Then
      ' this would be a problem.  I can't think why it would
      ' occur though since we've successfully killed
      ' the file
      lErr = Err.Number
      sErr = Err.Description
      On Error GoTo 0
      Err.Raise lErr, App.EXEName & ".cMP3ID3v2", sErr
      Exit Function
   End If
   
   On Error GoTo errorHandler
   iNewFile = FreeFile
   Open m_sMp3File For Binary Access Read Write Lock Write As #iNewFile
   
   copyFileShift = iNewFile

   Exit Function

errorHandler:
   ' can't create temporary file, out of disk space, out of memory:
   lErr = Err.Number
   sErr = Err.Description
   If Len(sTempFile) > 0 Then
      On Error Resume Next
      Kill sTempFile
   End If
   On Error Resume Next
   Close #iNewFile
   
   On Error GoTo 0
   Err.Raise lErr, App.EXEName & ".cMP3ID3v2", sErr
   Exit Function
   
End Function

'将读取的内容转化的字符
Private Function TranslateString(bStr() As Byte) As String
  Dim lBegin As Long
  Dim lEnd As Long
  Dim bBuf() As Byte
  Dim i As Long
  
  lBegin = LBound(bStr)
  lEnd = UBound(bStr)

  '判断是否是 Unicode 编码(代码页: &H01FF00FE)
  If lEnd - lBegin > 12 Then
    If bStr(lBegin) = &H1 And _
       bStr(lBegin + 4) = &HFF And _
       bStr(lBegin + 5) = &H0 And _
       bStr(lBegin + 6) = &HFE And _
       bStr(lBegin + 7) = &H0 And _
       bStr(lBegin + 8) = &H0 And _
       bStr(lBegin + 9) = &HFF And _
       bStr(lBegin + 10) = &H0 And _
       bStr(lBegin + 11) = &HFE Then
      '0165 6E67 FF00 FE00 00FF 00FE
      '删除前面的 Unicode 标识字符
      ReDim bBuf(lBegin To lEnd - 12) As Byte
      
      For i = lBegin To lEnd - 12
        bBuf(i) = bStr(i + 12)
      Next i
      
      '转化编码
      'TranslateString = StrConv(StrConv(bBuf, vbFromUnicode), vbUnicode)
      TranslateString = CStr(bBuf)
      
      '设置属性
      IsUnicode = True
    Else
      '如果不是 Unicode 编码就直接转化
      TranslateString = StrConv(bStr, vbUnicode)
    End If
  ElseIf lEnd - lBegin > 3 Then
    If bStr(lBegin) = &H1 And _
       bStr(lBegin + 1) = &HFF And _
       bStr(lBegin + 2) = &H0 And _
       bStr(lBegin + 3) = &HFE Then
      '删除前面的 Unicode 标识字符
      ReDim bBuf(lBegin To lEnd - 4) As Byte
      
      For i = lBegin To lEnd - 4
        bBuf(i) = bStr(i + 4)
      Next i
      
      '转化编码
      TranslateString = StrConv(StrConv(bBuf, vbFromUnicode), vbUnicode)
      
      '设置属性
      IsUnicode = True
    Else
      '如果不是 Unicode 编码就直接转化
      TranslateString = StrConv(bStr, vbUnicode)
    End If
  Else
    '如果不是 Unicode 编码就直接转化
    TranslateString = StrConv(bStr, vbUnicode)
  End If
End Function





