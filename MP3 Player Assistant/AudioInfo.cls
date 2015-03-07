VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "AudioInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'项目信息
Public FileName As String
Public Title As String
Public Artist As String
Public Album As String
Public TrackNumber As Long
Public Bitrate As Long
Public VBR As Boolean
Public Channels As Integer
Public SampleRate As Long
Public Mp3StereoMode As String
Public Codec As String
Public PlayCounter As Long
Public DateYear As String
Public Genre As String

