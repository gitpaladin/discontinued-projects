Attribute VB_Name = "MP3Infp"
Option Explicit

' DWORD __stdcall mp3infp_GetType();
Private Declare Function mp3infp_GetType Lib "mp3infp" () As Long

' #define MP3INFP_FILE_UNKNOWN    0x00
' #define MP3INFP_FILE_MP3        0x01
' #define MP3INFP_FILE_WAV        0x02
' #define MP3INFP_FILE_AVI        0x03
' #define MP3INFP_FILE_VQF        0x04
' #define MP3INFP_FILE_WMA        0x05
' #define MP3INFP_FILE_OGG        0x07
' #define MP3INFP_FILE_APE        0x08
' #define MP3INFP_FILE_MP4        0x09

Private Const MP3INFP_FILE_UNKNOWN As Long = &H0
Private Const MP3INFP_FILE_MP3 As Long = &H1
Private Const MP3INFP_FILE_WAV As Long = &H2
Private Const MP3INFP_FILE_AVI As Long = &H3
Private Const MP3INFP_FILE_VQF As Long = &H4
Private Const MP3INFP_FILE_WMA As Long = &H5
Private Const MP3INFP_FILE_OGG As Long = &H7
Private Const MP3INFP_FILE_APE As Long = &H8
Private Const MP3INFP_FILE_MP4 As Long = &H9


' BOOL __stdcall mp3infp_GetValue(const char *szValueName,char **buf);
Private Declare Function mp3infp_GetValue Lib "mp3infp" (ByVal szValueName As String, ByRef ptrBuf As Long) As Long


' DWORD __stdcall mp3infp_GetVer();
Private Declare Function mp3infp_GetVer Lib "mp3infp" () As Long


' DWORD __stdcall mp3infp_Load(HWND hWnd,const char *szFileName);
Private Declare Function mp3infp_Load Lib "mp3infp" (ByVal hWnd As Long, ByVal szFileName As String) As Long


' DWORD __stdcall mp3infp_Save(const char *szFileName);
Private Declare Function mp3infp_Save Lib "mp3infp" (ByVal szFileName As String) As Long


' BOOL __stdcall mp3infp_SetConf(char *tag,char *value);
Private Declare Function mp3infp_SetConf Lib "mp3infp" (ByVal tag As String, ByVal value As String) As Long


' DWORD __stdcall mp3infp_SetValue(const char *szValueName,const char *buf);
Private Declare Function mp3infp_SetValue Lib "mp3infp" (ByVal szValueName As String, ByVal buf As Any) As Long


' BOOL __stdcall mp3infp_ViewProp(HWND hWnd,const char *szFileName,DWORD dwPage);
Private Declare Function mp3infp_ViewProp Lib "mp3infp" (ByVal hWnd As Long, ByVal szFileName As String, ByVal dwPage As Long) As Long


' int __stdcall mp3infp_ViewPropEx(HWND hWnd,const char *szFileName,DWORD dwPage,BOOL modeless,DWORD param1,DWORD param2);
Private Declare Function mp3infp_ViewPropEx Lib "mp3infp" (ByVal hWnd As Long, ByVal szFileName As String, ByVal dwPage As Long, ByVal modeless As Long, ByVal param1 As Long, ByVal param2 As Long) As Long


' DWORD __stdcall mp3infp_mp3_DelApeTag(const char *szFileName);
Private Declare Function mp3infp_mp3_DelApeTag Lib "mp3infp" (ByVal szFileName As String) As Long


' DWORD __stdcall mp3infp_mp3_DelId3v1(const char *szFileName);
Private Declare Function mp3infp_mp3_DelId3v1 Lib "mp3infp" (ByVal szFileName As String) As Long


' DWORD __stdcall mp3infp_mp3_DelId3v2(const char *szFileName);
Private Declare Function mp3infp_mp3_DelId3v2 Lib "mp3infp" (ByVal szFileName As String) As Long


' DWORD __stdcall mp3infp_mp3_DelRMP(const char *szFileName);
Private Declare Function mp3infp_mp3_DelRMP Lib "mp3infp" (ByVal szFileName As String) As Long


' DWORD __stdcall mp3infp_mp3_GetTagType();
Private Declare Function mp3infp_mp3_GetTagType Lib "mp3infp" () As Long

' #define MP3INFP_HAS_MP3_ID3V1   0x00000001
' #define MP3INFP_HAS_MP3_ID3V2   0x00000002
' #define MP3INFP_HAS_MP3_RIFFSIF 0x00000004
' #define MP3INFP_HAS_MP3_ID3V1_0 0x00000008  // v2.43бл
' #define MP3INFP_HAS_MP3_ID3V1_1 0x00000010  // v2.43бл
' #define MP3INFP_HAS_MP3_ID3V2_2 0x00000020  // v2.43бл
' #define MP3INFP_HAS_MP3_ID3V2_3 0x00000040  // v2.43бл
' #define MP3INFP_HAS_MP3_ID3V2_4 0x00000080  // v2.43бл
' #define MP3INFP_HAS_MP3_APEV1   0x00000100  // v2.47бл
' #define MP3INFP_HAS_MP3_APEV2   0x00000200  // v2.47бл

Private Const MP3INFP_HAS_MP3_ID3V1   As Long = &H1
Private Const MP3INFP_HAS_MP3_ID3V2   As Long = &H2
Private Const MP3INFP_HAS_MP3_RIFFSIF As Long = &H4
Private Const MP3INFP_HAS_MP3_ID3V1_0 As Long = &H8         ' v2.43бл
Private Const MP3INFP_HAS_MP3_ID3V1_1 As Long = &H10        ' v2.43бл
Private Const MP3INFP_HAS_MP3_ID3V2_2 As Long = &H20        ' v2.43бл
Private Const MP3INFP_HAS_MP3_ID3V2_3 As Long = &H40        ' v2.43бл
Private Const MP3INFP_HAS_MP3_ID3V2_4 As Long = &H80        ' v2.43бл
Private Const MP3INFP_HAS_MP3_APEV1   As Long = &H100       ' v2.47бл
Private Const MP3INFP_HAS_MP3_APEV2   As Long = &H200       ' v2.47бл


' DWORD __stdcall mp3infp_mp3_MakeApeTag(const char *szFileName);
Private Declare Function mp3infp_mp3_MakeApeTag Lib "mp3infp" (ByVal szFileName As String) As Long


' DWORD __stdcall mp3infp_mp3_MakeId3v1(const char *szFileName);
Private Declare Function mp3infp_mp3_MakeId3v1 Lib "mp3infp" (ByVal szFileName As String) As Long


' DWORD __stdcall mp3infp_mp3_MakeId3v2(const char *szFileName);
Private Declare Function mp3infp_mp3_MakeId3v2 Lib "mp3infp" (ByVal szFileName As String) As Long

' DWORD __stdcall mp3infp_mp3_MakeRMP(const char *szFileName);
Private Declare Function mp3infp_mp3_MakeRMP Lib "mp3infp" (ByVal szFileName As String) As Long
