VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form dlgProperty 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "MP3 文件属性"
   ClientHeight    =   6630
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5670
   Icon            =   "dlgProperty.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6630
   ScaleWidth      =   5670
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '屏幕中心
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin VB.CommandButton cmdProperty 
      Caption         =   "一般属性(&P)..."
      Height          =   375
      Left            =   1800
      TabIndex        =   120
      Top             =   6120
      Width           =   1575
   End
   Begin VB.CommandButton cmdOpen 
      Caption         =   "以关联打开(&O)..."
      Height          =   375
      Left            =   120
      TabIndex        =   119
      Top             =   6120
      Width           =   1575
   End
   Begin VB.PictureBox picPage 
      BorderStyle     =   0  'None
      Height          =   5295
      Index           =   4
      Left            =   240
      ScaleHeight     =   5295
      ScaleWidth      =   5175
      TabIndex        =   99
      TabStop         =   0   'False
      Top             =   600
      Width           =   5175
      Begin VB.TextBox txtWMPVer 
         Height          =   270
         Left            =   1440
         Locked          =   -1  'True
         TabIndex        =   117
         Text            =   "APETAG 2.0"
         Top             =   0
         Width           =   3735
      End
      Begin VB.Frame fraWMPTag 
         Caption         =   "Windows Media 标签内容"
         ForeColor       =   &H00D54600&
         Height          =   2775
         Left            =   0
         TabIndex        =   102
         Top             =   360
         Width           =   5175
         Begin VB.TextBox txtWMPComment 
            Height          =   615
            Left            =   1440
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   109
            Top             =   2040
            Width           =   3615
         End
         Begin VB.TextBox txtWMPYear 
            Height          =   270
            Left            =   3360
            Locked          =   -1  'True
            TabIndex        =   108
            Top             =   1320
            Width           =   1695
         End
         Begin VB.TextBox txtWMPGenre 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   107
            Top             =   1680
            Width           =   3615
         End
         Begin VB.TextBox txtWMPTrack 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   106
            Top             =   1320
            Width           =   855
         End
         Begin VB.TextBox txtWMPAlbum 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   105
            Top             =   960
            Width           =   3615
         End
         Begin VB.TextBox txtWMPArtist 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   104
            Top             =   600
            Width           =   3615
         End
         Begin VB.TextBox txtWMPTitle 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   103
            Top             =   240
            Width           =   3615
         End
         Begin VB.Image imgWMPComment 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":058A
            Top             =   2055
            Width           =   240
         End
         Begin VB.Label lblWMPComment 
            AutoSize        =   -1  'True
            Caption         =   "注释:"
            Height          =   180
            Left            =   480
            TabIndex        =   116
            Top             =   2085
            Width           =   450
         End
         Begin VB.Image imgWMPGenre 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":0B14
            Top             =   1695
            Width           =   240
         End
         Begin VB.Label lblWMPGenre 
            AutoSize        =   -1  'True
            Caption         =   "流派:"
            Height          =   180
            Left            =   480
            TabIndex        =   115
            Top             =   1725
            Width           =   450
         End
         Begin VB.Image imgWMPYear 
            Height          =   240
            Left            =   2520
            Picture         =   "dlgProperty.frx":109E
            Top             =   1335
            Width           =   240
         End
         Begin VB.Label lblWMPYear 
            AutoSize        =   -1  'True
            Caption         =   "年代:"
            Height          =   180
            Left            =   2880
            TabIndex        =   114
            Top             =   1365
            Width           =   450
         End
         Begin VB.Image imgWMPTrack 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":1628
            Top             =   1335
            Width           =   240
         End
         Begin VB.Label lblWMPTrack 
            AutoSize        =   -1  'True
            Caption         =   "音轨序号:"
            Height          =   180
            Left            =   480
            TabIndex        =   113
            Top             =   1365
            Width           =   810
         End
         Begin VB.Image imgWMPAlbum 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":1BB2
            Top             =   975
            Width           =   240
         End
         Begin VB.Label lblWMPAlbum 
            AutoSize        =   -1  'True
            Caption         =   "专辑:"
            Height          =   180
            Left            =   480
            TabIndex        =   112
            Top             =   1005
            Width           =   450
         End
         Begin VB.Image imgArtist 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":213C
            Top             =   615
            Width           =   240
         End
         Begin VB.Label lblWMPArtist 
            AutoSize        =   -1  'True
            Caption         =   "艺术家:"
            Height          =   180
            Left            =   480
            TabIndex        =   111
            Top             =   645
            Width           =   630
         End
         Begin VB.Image imgWMPTitle 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":26C6
            Top             =   255
            Width           =   240
         End
         Begin VB.Label lblWMPTitle 
            AutoSize        =   -1  'True
            Caption         =   "标题:"
            Height          =   180
            Left            =   480
            TabIndex        =   110
            Top             =   285
            Width           =   450
         End
      End
      Begin VB.Frame fraWMPTags 
         Caption         =   "Windows Media 其它标签"
         ForeColor       =   &H00D54600&
         Height          =   2055
         Left            =   0
         TabIndex        =   100
         Top             =   3240
         Width           =   5175
         Begin MSComctlLib.ListView lvwWMPTag 
            Height          =   1695
            Left            =   120
            TabIndex        =   101
            Top             =   240
            Width           =   4935
            _ExtentX        =   8705
            _ExtentY        =   2990
            View            =   3
            Sorted          =   -1  'True
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            FullRowSelect   =   -1  'True
            _Version        =   393217
            SmallIcons      =   "iltProperty"
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            Appearance      =   1
            NumItems        =   2
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "字段"
               Object.Width           =   3863
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Text            =   "值"
               Object.Width           =   4233
            EndProperty
         End
      End
      Begin VB.Label lblWMPVer 
         AutoSize        =   -1  'True
         Caption         =   "WMP 版本:"
         Height          =   180
         Left            =   360
         TabIndex        =   118
         Top             =   45
         Width           =   810
      End
      Begin VB.Image imgWMPVer 
         Height          =   240
         Left            =   0
         Picture         =   "dlgProperty.frx":2C50
         Top             =   15
         Width           =   240
      End
   End
   Begin VB.PictureBox picPage 
      BorderStyle     =   0  'None
      Height          =   5295
      Index           =   3
      Left            =   240
      ScaleHeight     =   5295
      ScaleWidth      =   5175
      TabIndex        =   79
      TabStop         =   0   'False
      Top             =   600
      Width           =   5175
      Begin VB.Frame fraAPETags 
         Caption         =   "APE 其它标签"
         ForeColor       =   &H00D54600&
         Height          =   2055
         Left            =   0
         TabIndex        =   97
         Top             =   3240
         Width           =   5175
         Begin MSComctlLib.ImageList iltProperty 
            Left            =   4680
            Top             =   120
            _ExtentX        =   1005
            _ExtentY        =   1005
            BackColor       =   -2147483643
            ImageWidth      =   16
            ImageHeight     =   16
            MaskColor       =   12632256
            _Version        =   393216
            BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
               NumListImages   =   1
               BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                  Picture         =   "dlgProperty.frx":31DA
                  Key             =   ""
               EndProperty
            EndProperty
         End
         Begin MSComctlLib.ListView lvwAPETag 
            Height          =   1695
            Left            =   120
            TabIndex        =   98
            Top             =   240
            Width           =   4935
            _ExtentX        =   8705
            _ExtentY        =   2990
            View            =   3
            Sorted          =   -1  'True
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            FullRowSelect   =   -1  'True
            _Version        =   393217
            SmallIcons      =   "iltProperty"
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            Appearance      =   1
            NumItems        =   2
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "字段"
               Object.Width           =   3863
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Text            =   "值"
               Object.Width           =   4233
            EndProperty
         End
      End
      Begin VB.Frame fraAPEContent 
         Caption         =   "APE 标签内容"
         ForeColor       =   &H00D54600&
         Height          =   2775
         Left            =   0
         TabIndex        =   82
         Top             =   360
         Width           =   5175
         Begin VB.TextBox txtAPETitle 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   84
            Top             =   240
            Width           =   3615
         End
         Begin VB.TextBox txtAPEArtist 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   86
            Top             =   600
            Width           =   3615
         End
         Begin VB.TextBox txtAPEAlbum 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   88
            Top             =   960
            Width           =   3615
         End
         Begin VB.TextBox txtAPETrack 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   90
            Top             =   1320
            Width           =   855
         End
         Begin VB.TextBox txtAPEGenre 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   94
            Top             =   1680
            Width           =   3615
         End
         Begin VB.TextBox txtAPEYear 
            Height          =   270
            Left            =   3360
            Locked          =   -1  'True
            TabIndex        =   92
            Top             =   1320
            Width           =   1695
         End
         Begin VB.TextBox txtAPEComment 
            Height          =   615
            Left            =   1440
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   96
            Top             =   2040
            Width           =   3615
         End
         Begin VB.Label lblAPETitle 
            AutoSize        =   -1  'True
            Caption         =   "标题:"
            Height          =   180
            Left            =   480
            TabIndex        =   83
            Top             =   285
            Width           =   450
         End
         Begin VB.Image imgAPETitle 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":3774
            Top             =   255
            Width           =   240
         End
         Begin VB.Label lblAPEArtist 
            AutoSize        =   -1  'True
            Caption         =   "艺术家:"
            Height          =   180
            Left            =   480
            TabIndex        =   85
            Top             =   645
            Width           =   630
         End
         Begin VB.Image imgAPEArtist 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":3CFE
            Top             =   615
            Width           =   240
         End
         Begin VB.Label lblAPEAlbum 
            AutoSize        =   -1  'True
            Caption         =   "专辑:"
            Height          =   180
            Left            =   480
            TabIndex        =   87
            Top             =   1005
            Width           =   450
         End
         Begin VB.Image imgAPEAlbum 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":4288
            Top             =   975
            Width           =   240
         End
         Begin VB.Label lblAPETrack 
            AutoSize        =   -1  'True
            Caption         =   "音轨序号:"
            Height          =   180
            Left            =   480
            TabIndex        =   89
            Top             =   1365
            Width           =   810
         End
         Begin VB.Image imgTrack 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":4812
            Top             =   1335
            Width           =   240
         End
         Begin VB.Label lblAPEYear 
            AutoSize        =   -1  'True
            Caption         =   "年代:"
            Height          =   180
            Left            =   2880
            TabIndex        =   91
            Top             =   1365
            Width           =   450
         End
         Begin VB.Image imgAPEYear 
            Height          =   240
            Left            =   2520
            Picture         =   "dlgProperty.frx":4D9C
            Top             =   1335
            Width           =   240
         End
         Begin VB.Label lblAPEGenre 
            AutoSize        =   -1  'True
            Caption         =   "流派:"
            Height          =   180
            Left            =   480
            TabIndex        =   93
            Top             =   1725
            Width           =   450
         End
         Begin VB.Image imgAPEGenre 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":5326
            Top             =   1695
            Width           =   240
         End
         Begin VB.Label lblAPEComment 
            AutoSize        =   -1  'True
            Caption         =   "注释:"
            Height          =   180
            Left            =   480
            TabIndex        =   95
            Top             =   2085
            Width           =   450
         End
         Begin VB.Image imgAPEComment 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":58B0
            Top             =   2055
            Width           =   240
         End
      End
      Begin VB.TextBox txtAPEVer 
         Height          =   270
         Left            =   1440
         Locked          =   -1  'True
         TabIndex        =   81
         Text            =   "APETAG 2.0 (UTF-8)"
         Top             =   0
         Width           =   3735
      End
      Begin VB.Image imgAPEVer 
         Height          =   240
         Left            =   0
         Picture         =   "dlgProperty.frx":5E3A
         Top             =   15
         Width           =   240
      End
      Begin VB.Label lblAPEVer 
         AutoSize        =   -1  'True
         Caption         =   "版本:"
         Height          =   180
         Left            =   360
         TabIndex        =   80
         Top             =   45
         Width           =   450
      End
   End
   Begin VB.PictureBox picPage 
      BorderStyle     =   0  'None
      Height          =   5295
      Index           =   1
      Left            =   240
      ScaleHeight     =   5295
      ScaleWidth      =   5175
      TabIndex        =   31
      TabStop         =   0   'False
      Top             =   600
      Width           =   5175
      Begin VB.TextBox txtV1Ver 
         Height          =   270
         Left            =   1440
         Locked          =   -1  'True
         TabIndex        =   33
         Top             =   0
         Width           =   3735
      End
      Begin VB.Frame fraId3v1 
         Caption         =   "ID3v1 内容"
         ForeColor       =   &H00D54600&
         Height          =   4935
         Left            =   0
         TabIndex        =   34
         Top             =   360
         Width           =   5175
         Begin VB.TextBox txtV1Comment 
            Height          =   2415
            Left            =   1440
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   48
            Top             =   2400
            Width           =   3615
         End
         Begin VB.TextBox txtV1Year 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   46
            Top             =   2040
            Width           =   3615
         End
         Begin VB.TextBox txtV1Genre 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   44
            Top             =   1680
            Width           =   3615
         End
         Begin VB.TextBox txtV1Track 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   42
            Top             =   1320
            Width           =   3615
         End
         Begin VB.TextBox txtV1Album 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   40
            Top             =   960
            Width           =   3615
         End
         Begin VB.TextBox txtV1Artist 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   38
            Top             =   600
            Width           =   3615
         End
         Begin VB.TextBox txtV1Title 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   36
            Top             =   240
            Width           =   3615
         End
         Begin VB.Image imgV1Comment 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":63C4
            Top             =   2415
            Width           =   240
         End
         Begin VB.Label lblV1Comment 
            AutoSize        =   -1  'True
            Caption         =   "注释:"
            Height          =   180
            Left            =   480
            TabIndex        =   47
            Top             =   2445
            Width           =   450
         End
         Begin VB.Image imgV1Genre 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":694E
            Top             =   1695
            Width           =   240
         End
         Begin VB.Label lblV1Genre 
            AutoSize        =   -1  'True
            Caption         =   "流派:"
            Height          =   180
            Left            =   480
            TabIndex        =   43
            Top             =   1725
            Width           =   450
         End
         Begin VB.Image imgV1Year 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":6ED8
            Top             =   2055
            Width           =   240
         End
         Begin VB.Label lblV1Year 
            AutoSize        =   -1  'True
            Caption         =   "年代:"
            Height          =   180
            Left            =   480
            TabIndex        =   45
            Top             =   2085
            Width           =   450
         End
         Begin VB.Image imgV1Track 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":7462
            Top             =   1335
            Width           =   240
         End
         Begin VB.Label lblV1Track 
            AutoSize        =   -1  'True
            Caption         =   "音轨序号:"
            Height          =   180
            Left            =   480
            TabIndex        =   41
            Top             =   1365
            Width           =   810
         End
         Begin VB.Image imgV1Album 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":79EC
            Top             =   975
            Width           =   240
         End
         Begin VB.Label lblV1Album 
            AutoSize        =   -1  'True
            Caption         =   "专辑:"
            Height          =   180
            Left            =   480
            TabIndex        =   39
            Top             =   1005
            Width           =   450
         End
         Begin VB.Image imgV1Artist 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":7F76
            Top             =   615
            Width           =   240
         End
         Begin VB.Label lblV1Artist 
            AutoSize        =   -1  'True
            Caption         =   "艺术家:"
            Height          =   180
            Left            =   480
            TabIndex        =   37
            Top             =   645
            Width           =   630
         End
         Begin VB.Image imgV1Title 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":8500
            Top             =   255
            Width           =   240
         End
         Begin VB.Label lblV1Title 
            AutoSize        =   -1  'True
            Caption         =   "标题:"
            Height          =   180
            Left            =   480
            TabIndex        =   35
            Top             =   285
            Width           =   450
         End
      End
      Begin VB.Label lblV1Ver 
         AutoSize        =   -1  'True
         Caption         =   "版本:"
         Height          =   180
         Left            =   360
         TabIndex        =   32
         Top             =   45
         Width           =   450
      End
      Begin VB.Image imgVer 
         Height          =   240
         Left            =   0
         Picture         =   "dlgProperty.frx":8A8A
         Top             =   15
         Width           =   240
      End
   End
   Begin VB.PictureBox picPage 
      BorderStyle     =   0  'None
      Height          =   5295
      Index           =   0
      Left            =   240
      ScaleHeight     =   5295
      ScaleWidth      =   5175
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   600
      Width           =   5175
      Begin VB.PictureBox picIcon 
         AutoRedraw      =   -1  'True
         BorderStyle     =   0  'None
         Height          =   480
         Left            =   0
         Picture         =   "dlgProperty.frx":9014
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   30
         TabStop         =   0   'False
         Top             =   0
         Width           =   480
      End
      Begin VB.CheckBox chkAttribute 
         Caption         =   "已压缩 (NTFS)"
         Height          =   255
         Index           =   5
         Left            =   600
         TabIndex        =   29
         Top             =   5055
         Width           =   4575
      End
      Begin VB.CheckBox chkAttribute 
         Caption         =   "文档文件"
         Height          =   255
         Index           =   4
         Left            =   600
         TabIndex        =   28
         Top             =   4677
         Width           =   4575
      End
      Begin VB.CheckBox chkAttribute 
         Caption         =   "系统文件"
         Height          =   255
         Index           =   3
         Left            =   600
         TabIndex        =   27
         Top             =   4311
         Width           =   4575
      End
      Begin VB.CheckBox chkAttribute 
         Caption         =   "隐藏文件"
         Height          =   255
         Index           =   2
         Left            =   600
         TabIndex        =   26
         Top             =   3945
         Width           =   4575
      End
      Begin VB.CheckBox chkAttribute 
         Caption         =   "只读文件"
         Height          =   255
         Index           =   1
         Left            =   600
         TabIndex        =   25
         Top             =   3579
         Width           =   4575
      End
      Begin VB.CheckBox chkAttribute 
         Caption         =   "一般文件"
         Height          =   255
         Index           =   0
         Left            =   600
         TabIndex        =   24
         Top             =   3213
         Width           =   4575
      End
      Begin VB.Frame fraLine 
         Height          =   30
         Index           =   3
         Left            =   0
         TabIndex        =   23
         Top             =   3072
         Width           =   5175
      End
      Begin VB.Frame fraLine 
         Height          =   30
         Index           =   2
         Left            =   0
         TabIndex        =   16
         Top             =   2058
         Width           =   5175
      End
      Begin VB.Frame fraLine 
         Height          =   30
         Index           =   1
         Left            =   0
         TabIndex        =   12
         Top             =   1335
         Width           =   5175
      End
      Begin VB.PictureBox picApp 
         AutoRedraw      =   -1  'True
         BorderStyle     =   0  'None
         Height          =   480
         Left            =   0
         Picture         =   "dlgProperty.frx":98DE
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   3
         TabStop         =   0   'False
         Top             =   753
         Width           =   480
      End
      Begin VB.Frame fraLine 
         Height          =   30
         Index           =   0
         Left            =   0
         TabIndex        =   2
         Top             =   612
         Width           =   5175
      End
      Begin VB.Image imgAttribute 
         Height          =   480
         Left            =   0
         Picture         =   "dlgProperty.frx":A1A8
         Top             =   3213
         Width           =   480
      End
      Begin VB.Label lblDateAccess 
         AutoSize        =   -1  'True
         Caption         =   "访问时间:"
         Height          =   180
         Left            =   600
         TabIndex        =   22
         Top             =   2781
         Width           =   810
      End
      Begin VB.Label ldtDateAccess 
         AutoSize        =   -1  'True
         Caption         =   "歌曲文件"
         Height          =   180
         Left            =   1440
         TabIndex        =   21
         Top             =   2781
         Width           =   720
      End
      Begin VB.Label lblDateModify 
         AutoSize        =   -1  'True
         Caption         =   "修改时间:"
         Height          =   180
         Left            =   600
         TabIndex        =   20
         Top             =   2490
         Width           =   810
      End
      Begin VB.Label ldtDateModify 
         AutoSize        =   -1  'True
         Caption         =   "歌曲文件"
         Height          =   180
         Left            =   1440
         TabIndex        =   19
         Top             =   2490
         Width           =   720
      End
      Begin VB.Label lblDateCreated 
         AutoSize        =   -1  'True
         Caption         =   "创建时间:"
         Height          =   180
         Left            =   600
         TabIndex        =   18
         Top             =   2199
         Width           =   810
      End
      Begin VB.Label ldtDateCreated 
         AutoSize        =   -1  'True
         Caption         =   "歌曲文件"
         Height          =   180
         Left            =   1440
         TabIndex        =   17
         Top             =   2199
         Width           =   720
      End
      Begin VB.Image imgTime 
         Height          =   480
         Left            =   0
         Picture         =   "dlgProperty.frx":AA72
         Top             =   2199
         Width           =   480
      End
      Begin VB.Label ldtSizeByte 
         AutoSize        =   -1  'True
         Caption         =   "Windows Media Player"
         Height          =   180
         Left            =   1440
         TabIndex        =   15
         Top             =   1767
         Width           =   1800
      End
      Begin VB.Label ldtSize 
         AutoSize        =   -1  'True
         Caption         =   "Windows Media Player"
         Height          =   180
         Left            =   1440
         TabIndex        =   14
         Top             =   1476
         Width           =   1800
      End
      Begin VB.Label lblSize 
         AutoSize        =   -1  'True
         Caption         =   "大小:"
         Height          =   180
         Left            =   600
         TabIndex        =   13
         Top             =   1476
         Width           =   450
      End
      Begin VB.Image imgSize 
         Height          =   480
         Left            =   0
         Picture         =   "dlgProperty.frx":B33C
         Top             =   1476
         Width           =   480
      End
      Begin VB.Label ldtAssociatedApp 
         AutoSize        =   -1  'True
         Caption         =   "(未知)"
         Height          =   180
         Left            =   1440
         TabIndex        =   11
         Top             =   1050
         Width           =   540
      End
      Begin VB.Label lblAssociateApp 
         AutoSize        =   -1  'True
         Caption         =   "关联程序:"
         Height          =   180
         Left            =   600
         TabIndex        =   10
         Top             =   1044
         Width           =   810
      End
      Begin VB.Label ldtType 
         AutoSize        =   -1  'True
         Caption         =   "歌曲文件"
         Height          =   180
         Left            =   1440
         TabIndex        =   9
         Top             =   753
         Width           =   720
      End
      Begin VB.Label lblType 
         AutoSize        =   -1  'True
         Caption         =   "文件类型:"
         Height          =   180
         Left            =   600
         TabIndex        =   8
         Top             =   753
         Width           =   810
      End
      Begin VB.Label ldtPath 
         AutoSize        =   -1  'True
         Caption         =   "C:\My Music"
         Height          =   180
         Left            =   1440
         TabIndex        =   7
         Top             =   321
         Width           =   990
      End
      Begin VB.Label ldtFileName 
         AutoSize        =   -1  'True
         Caption         =   "Artist - Title.MP3"
         Height          =   180
         Left            =   1440
         TabIndex        =   6
         Top             =   30
         Width           =   1620
      End
      Begin VB.Label lblPath 
         AutoSize        =   -1  'True
         Caption         =   "位置:"
         Height          =   180
         Left            =   600
         TabIndex        =   5
         Top             =   321
         Width           =   450
      End
      Begin VB.Label lblFileName 
         AutoSize        =   -1  'True
         Caption         =   "文件名:"
         Height          =   180
         Left            =   600
         TabIndex        =   4
         Top             =   30
         Width           =   630
      End
   End
   Begin VB.CommandButton cmdClose 
      Cancel          =   -1  'True
      Caption         =   "关闭"
      Default         =   -1  'True
      Height          =   375
      Left            =   4080
      TabIndex        =   121
      Top             =   6120
      Width           =   1455
   End
   Begin MSComctlLib.ImageList iltTab 
      Left            =   3360
      Top             =   6000
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483633
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgProperty.frx":BC06
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgProperty.frx":C1A0
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgProperty.frx":C73A
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgProperty.frx":CCD4
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgProperty.frx":D26E
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TabStrip tbsProperty 
      Height          =   5895
      Left            =   120
      TabIndex        =   0
      Top             =   135
      Width           =   5415
      _ExtentX        =   9551
      _ExtentY        =   10398
      HotTracking     =   -1  'True
      ImageList       =   "iltTab"
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   5
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "基本信息"
            Object.Tag             =   "0"
            ImageVarType    =   2
            ImageIndex      =   1
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "ID3v1 标签"
            Key             =   "ID3V1"
            Object.Tag             =   "1"
            ImageVarType    =   2
            ImageIndex      =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "ID3v2 标签"
            Key             =   "ID3V2"
            Object.Tag             =   "2"
            ImageVarType    =   2
            ImageIndex      =   3
         EndProperty
         BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "APE 标签"
            Key             =   "APETAG"
            Object.Tag             =   "3"
            ImageVarType    =   2
            ImageIndex      =   4
         EndProperty
         BeginProperty Tab5 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Windows Media 标签"
            Key             =   "WMP"
            Object.Tag             =   "4"
            ImageVarType    =   2
            ImageIndex      =   5
         EndProperty
      EndProperty
   End
   Begin VB.PictureBox picPage 
      BorderStyle     =   0  'None
      Height          =   5295
      Index           =   2
      Left            =   240
      ScaleHeight     =   5295
      ScaleWidth      =   5175
      TabIndex        =   49
      TabStop         =   0   'False
      Top             =   600
      Width           =   5175
      Begin VB.Frame Frame1 
         Caption         =   "ID3v2 内容"
         ForeColor       =   &H00D54600&
         Height          =   4935
         Left            =   0
         TabIndex        =   52
         Top             =   360
         Width           =   5175
         Begin VB.TextBox txtV2EncodeApp 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   76
            Top             =   4200
            Width           =   3615
         End
         Begin VB.TextBox txtV2URL 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   78
            Top             =   4560
            Width           =   3615
         End
         Begin VB.TextBox txtV2Original 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   70
            Top             =   3120
            Width           =   3615
         End
         Begin VB.TextBox txtV2Songster 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   68
            Top             =   2760
            Width           =   3615
         End
         Begin VB.TextBox txtV2Title 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   54
            Top             =   240
            Width           =   3615
         End
         Begin VB.TextBox txtV2Artist 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   56
            Top             =   600
            Width           =   3615
         End
         Begin VB.TextBox txtV2Album 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   58
            Top             =   960
            Width           =   3615
         End
         Begin VB.TextBox txtV2Track 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   60
            Top             =   1320
            Width           =   615
         End
         Begin VB.TextBox txtV2Genre 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   64
            Top             =   1680
            Width           =   3615
         End
         Begin VB.TextBox txtV2Year 
            Height          =   270
            Left            =   3360
            Locked          =   -1  'True
            TabIndex        =   62
            Top             =   1320
            Width           =   1695
         End
         Begin VB.TextBox txtV2Comment 
            Height          =   615
            Left            =   1440
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   66
            Top             =   2040
            Width           =   3615
         End
         Begin VB.TextBox txtV2Copyright 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   74
            Top             =   3840
            Width           =   3615
         End
         Begin VB.TextBox txtV2Encoder 
            Height          =   270
            Left            =   1440
            Locked          =   -1  'True
            TabIndex        =   72
            Top             =   3480
            Width           =   3615
         End
         Begin VB.Label lblV2EncodeApp 
            AutoSize        =   -1  'True
            Caption         =   "编码器:"
            Height          =   180
            Left            =   480
            TabIndex        =   75
            Top             =   4245
            Width           =   630
         End
         Begin VB.Image imgV2EncodeApp 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":D808
            Top             =   4215
            Width           =   240
         End
         Begin VB.Label lblV2URL 
            AutoSize        =   -1  'True
            Caption         =   "URL:"
            Height          =   180
            Left            =   480
            TabIndex        =   77
            Top             =   4605
            Width           =   360
         End
         Begin VB.Image imgV2URL 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":DD92
            Top             =   4575
            Width           =   240
         End
         Begin VB.Label lblV2Original 
            AutoSize        =   -1  'True
            Caption         =   "原创歌手:"
            Height          =   180
            Left            =   480
            TabIndex        =   69
            Top             =   3165
            Width           =   810
         End
         Begin VB.Image imgV2Original 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":E31C
            Top             =   3135
            Width           =   240
         End
         Begin VB.Label lblV2Songster 
            AutoSize        =   -1  'True
            Caption         =   "作曲者:"
            Height          =   180
            Left            =   480
            TabIndex        =   67
            Top             =   2805
            Width           =   630
         End
         Begin VB.Image imgV2Songster 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":E8A6
            Top             =   2775
            Width           =   240
         End
         Begin VB.Label lblV2Title 
            AutoSize        =   -1  'True
            Caption         =   "标题:"
            Height          =   180
            Left            =   480
            TabIndex        =   53
            Top             =   285
            Width           =   450
         End
         Begin VB.Image imgV2Title 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":EE30
            Top             =   255
            Width           =   240
         End
         Begin VB.Label lblV2Artist 
            AutoSize        =   -1  'True
            Caption         =   "艺术家:"
            Height          =   180
            Left            =   480
            TabIndex        =   55
            Top             =   645
            Width           =   630
         End
         Begin VB.Image imgV2Artist 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":F3BA
            Top             =   615
            Width           =   240
         End
         Begin VB.Label lblV2Album 
            AutoSize        =   -1  'True
            Caption         =   "专辑:"
            Height          =   180
            Left            =   480
            TabIndex        =   57
            Top             =   1005
            Width           =   450
         End
         Begin VB.Image imgV2Album 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":F944
            Top             =   975
            Width           =   240
         End
         Begin VB.Label lblV2Track 
            AutoSize        =   -1  'True
            Caption         =   "音轨序号:"
            Height          =   180
            Left            =   480
            TabIndex        =   59
            Top             =   1365
            Width           =   810
         End
         Begin VB.Image imgV2Track 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":FECE
            Top             =   1335
            Width           =   240
         End
         Begin VB.Label lblV2Year 
            AutoSize        =   -1  'True
            Caption         =   "年代:"
            Height          =   180
            Left            =   2880
            TabIndex        =   61
            Top             =   1365
            Width           =   450
         End
         Begin VB.Image imgV2Year 
            Height          =   240
            Left            =   2520
            Picture         =   "dlgProperty.frx":10458
            Top             =   1335
            Width           =   240
         End
         Begin VB.Label lblV2Genre 
            AutoSize        =   -1  'True
            Caption         =   "流派:"
            Height          =   180
            Left            =   480
            TabIndex        =   63
            Top             =   1725
            Width           =   450
         End
         Begin VB.Image imgV2Genre 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":109E2
            Top             =   1695
            Width           =   240
         End
         Begin VB.Label lblV2Comment 
            AutoSize        =   -1  'True
            Caption         =   "注释:"
            Height          =   180
            Left            =   480
            TabIndex        =   65
            Top             =   2085
            Width           =   450
         End
         Begin VB.Image imgV2Comment 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":10F6C
            Top             =   2055
            Width           =   240
         End
         Begin VB.Label lblV2Copyright 
            AutoSize        =   -1  'True
            Caption         =   "版权:"
            Height          =   180
            Left            =   480
            TabIndex        =   73
            Top             =   3885
            Width           =   450
         End
         Begin VB.Image imgV2Copyright 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":114F6
            Top             =   3855
            Width           =   240
         End
         Begin VB.Label lblV2Encoder 
            AutoSize        =   -1  'True
            Caption         =   "编码人:"
            Height          =   180
            Left            =   480
            TabIndex        =   71
            Top             =   3525
            Width           =   630
         End
         Begin VB.Image imgV2Encoder 
            Height          =   240
            Left            =   120
            Picture         =   "dlgProperty.frx":11A80
            Top             =   3495
            Width           =   240
         End
      End
      Begin VB.TextBox txtV2Ver 
         Height          =   270
         Left            =   1440
         Locked          =   -1  'True
         TabIndex        =   51
         Top             =   0
         Width           =   3735
      End
      Begin VB.Image imgV2Ver 
         Height          =   240
         Left            =   0
         Picture         =   "dlgProperty.frx":1200A
         Top             =   15
         Width           =   240
      End
      Begin VB.Label lblV2Ver 
         AutoSize        =   -1  'True
         Caption         =   "版本:"
         Height          =   180
         Left            =   360
         TabIndex        =   50
         Top             =   45
         Width           =   450
      End
   End
End
Attribute VB_Name = "dlgProperty"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private LastPage As Integer
Private sFilePath As String

Const DI_MASK = &H1
Const DI_IMAGE = &H2
Const DI_NORMAL = DI_MASK Or DI_IMAGE

'获得程序图标的 API
Private Declare Function ExtractIcon Lib "shell32.dll" Alias "ExtractIconA" (ByVal hInst As Long, ByVal lpszExeFileName As String, ByVal nIconIndex As Long) As Long
Private Declare Function ExtractIconEx Lib "shell32.dll" Alias "ExtractIconExA" (ByVal lpszFile As String, ByVal nIconIndex As Long, phiconLarge As Long, phiconSmall As Long, ByVal nIcons As Long) As Long
Private Declare Function DrawIconEx Lib "user32" (ByVal hdc As Long, ByVal xLeft As Long, ByVal yTop As Long, ByVal hIcon As Long, ByVal cxWidth As Long, ByVal cyWidth As Long, ByVal istepIfAniCur As Long, ByVal hbrFlickerFreeDraw As Long, ByVal diFlags As Long) As Long
Private Declare Function DrawIcon Lib "user32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal hIcon As Long) As Long
Private Declare Function ExtractAssociatedIcon Lib "shell32.dll" Alias "ExtractAssociatedIconA" (ByVal hInst As Long, ByVal lpIconPath As String, lpiIcon As Long) As Long

Private Sub cmdClose_Click()
  Unload Me
End Sub

Public Sub ShowPropery(ByVal FileName As String)
  Dim F As Scripting.File
  Dim Attrib As Integer
  Dim FINF As SHFILEINFO
  Dim ExtName As String
  Dim RegPath As String
  Dim ClassName As String
  Dim hIcon As Long
  Dim ExeFileName As String
  
  If Not FS.FileExists(FileName) Then Exit Sub
  
  '读取基本信息
  Set F = FS.GetFile(FileName)
  
  ldtFileName.Caption = F.Name
  ldtPath.Caption = F.ParentFolder.Path
  ldtType.Caption = F.Type
  ldtSizeByte.Caption = FormatNumber(F.Size, 0, vbTrue, vbTrue, vbTrue) & " 字节"
  ldtSize.Caption = DisplaySize(F.Size)
  
  ldtDateCreated.Caption = F.DateCreated
  ldtDateAccess.Caption = F.DateLastAccessed
  ldtDateModify.Caption = F.DateLastModified
  
  Attrib = F.Attributes
  
  chkAttribute(0).Value = Abs(CBool(Attrib And Normal))
  chkAttribute(1).Value = Abs(CBool(Attrib And ReadOnly))
  chkAttribute(2).Value = Abs(CBool(Attrib And Hidden))
  chkAttribute(3).Value = Abs(CBool(Attrib And System))
  chkAttribute(4).Value = Abs(CBool(Attrib And Archive))
  chkAttribute(5).Value = Abs(CBool(Attrib And Compressed))
  
  '获得文件图标
  Set picIcon.Picture = Nothing
  hIcon = SHGetFileInfo(FileName, 0, FINF, Len(FINF), BASIC_SHGFI_FLAGS Or SHGFI_LARGEICON)
  r = ImageList_Draw(hIcon, FINF.iIcon, picIcon.hdc, 0, 0, ILD_TRANSPARENT)
  
  '获得程序
  ExtName = LCase(FS.GetExtensionName(FileName))
  RegPath = "HKEY_CLASSES_ROOT\." & ExtName
  ClassName = Registry.GetStringValue(RegPath, "")
  RegPath = "HKEY_CLASSES_ROOT\" & ClassName & "\shell\Open\command"
  RegPath = Registry.GetStringValue(RegPath, "")
  
  If Len(RegPath) > 3 Then
    '获得程序的图标
    If Left(RegPath, 1) = Chr(34) Then RegPath = Right(RegPath, Len(RegPath) - 1)
    If InStr(1, RegPath, Chr(34)) > 0 Then RegPath = Left(RegPath, InStr(1, RegPath, Chr(34)) - 1)
    
    If FS.FileExists(RegPath) Then
      hIcon = ExtractIcon(Me.hWnd, RegPath, 0)
      
      If hIcon > 0 Then
        Set picApp.Picture = Nothing
        Call DrawIcon(picApp.hdc, 0, 0, hIcon)
      End If
    End If
    
    '获得程序的名称
    RegPath = FS.GetFileName(RegPath)
    ExeFileName = RegPath
    RegPath = "HKEY_CLASSES_ROOT\Applications\" & RegPath & "\shell"
    RegPath = Registry.GetStringValue(RegPath, "FriendlyCache")
    
    If (RegPath) = "Error" Then
      ldtAssociatedApp.Caption = RegPath
    Else
      ldtAssociatedApp.Caption = ExeFileName
    End If
  End If
  
  '获取 ID3v1
  Dim oID3v1 As New MP3PA.ID3v1
  
  If oID3v1.LoadInfo(FileName) Then
    With oID3v1
      txtV1Ver.Text = Switch(.Version = UNKNOWN, "未知", .Version = VERSION10, "ID3v1.0", .Version = VERSION11, "ID3v1.1")
      txtV1Title.Text = .Title
      txtV1Artist.Text = .Artist
      txtV1Album.Text = .Album
      If .Track > 0 Then txtV1Track.Text = .Track
      txtV1Genre.Text = .Genre
      txtV1Year.Text = .Year
      txtV1Comment.Text = .Comment
    End With
  Else
    '没有信息
    tbsProperty.Tabs.Remove "ID3V1"
  End If
  
  '获取 ID3v2
  Dim oID3v2 As New MP3PA.ID3v2
  
  If oID3v2.LoadInfo(FileName) Then
    With oID3v2
      txtV2Ver.Text = "ID3v2." & .TagVersion & IIf(.IsUnicode, " (Unicode)", " (ISO-8859-1)")
      txtV2Album.Text = .Album
      txtV2Artist.Text = .Artist
      txtV2Comment.Text = .Comment
      txtV2Copyright.Text = .Copyright
      txtV2EncodeApp.Text = .EncodedBy
      txtV2Encoder.Text = .Lyrics
      txtV2Genre.Text = .Genre
      txtV2Original.Text = .OriginalArtist
      txtV2Songster.Text = .Composer
      txtV2Title.Text = .Title
      txtV2Track.Text = .Track
      txtV2URL.Text = .BuyURL
      txtV2Year.Text = .Year
    End With
  Else
    '没有信息
    tbsProperty.Tabs.Remove "ID3V2"
  End If
  
  '获取 APETAG
  Dim oAPE As New MP3PA.APETAG
  Dim oFD As MSComctlLib.ListItem
  
  Call oAPE.LoadInfo(FileName)
  
  If oAPE.Exist Then
    With oAPE
      txtAPEAlbum.Text = .Album
      txtAPEArtist.Text = .Artist
      txtAPEComment.Text = .Comment
      txtAPEGenre.Text = .Genre
      txtAPETitle.Text = .Title
      txtAPEYear.Text = .Year
      If .Track > 0 Then txtAPETrack.Text = .Track
      
      For i = 1 To .OtherField.Count
        Set oFD = lvwAPETag.ListItems.Add
        oFD.Text = .OtherName(i)
        oFD.SubItems(1) = .OtherField(i)
        oFD.SmallIcon = 1
      Next i
    End With
  Else
    '没有信息
    tbsProperty.Tabs.Remove "APETAG"
  End If
  
  '获得 Windows Media 标签
  Dim oMedia As Object
  
  Select Case UCase(FS.GetExtensionName(FileName))
  Case "WMA", "WMV", "ASX"
    Set oMedia = ffmVideo.WMP.newMedia(FileName)
    txtWMPVer.Text = ffmVideo.WMP.versionInfo
    
    For i = 0 To oMedia.attributeCount - 1
      Select Case oMedia.getAttributeName(i)
      Case "Title": txtWMPTitle.Text = oMedia.getItemInfo(oMedia.getAttributeName(i))
      Case "Author": txtWMPArtist.Text = oMedia.getItemInfo(oMedia.getAttributeName(i))
      Case "WM/AlbumTitle": txtWMPAlbum.Text = oMedia.getItemInfo(oMedia.getAttributeName(i))
      Case "WM/Year": txtWMPYear.Text = oMedia.getItemInfo(oMedia.getAttributeName(i))
      Case "Description": txtWMPComment.Text = oMedia.getItemInfo(oMedia.getAttributeName(i))
      Case "WM/TrackNumber": txtWMPTrack.Text = oMedia.getItemInfo(oMedia.getAttributeName(i))
      Case "WM/Genre": txtWMPGenre.Text = oMedia.getItemInfo(oMedia.getAttributeName(i))
      Case Else
        Set oFD = lvwWMPTag.ListItems.Add
        
        oFD.Text = oMedia.getAttributeName(i)
        oFD.SubItems(1) = oMedia.getItemInfo(oMedia.getAttributeName(i))
        oFD.SmallIcon = 1
      End Select
    Next i
  Case Else
    tbsProperty.Tabs.Remove "WMP"
  End Select
  
  '显示窗体
  tbsProperty_Click
  Me.Caption = FS.GetFileName(FileName) & " 属性"
  sFilePath = FileName
  Me.Show 1
End Sub

Private Sub cmdOpen_Click()
  ShellOpera.shelldoc sFilePath
End Sub

Private Sub cmdProperty_Click()
  ShellOpera.SHShowProperty sFilePath, Me.hWnd
End Sub

Private Sub Form_Load()
  SetHeaderStyle lvwAPETag.hWnd
  SetHeaderStyle lvwWMPTag.hWnd
End Sub

Private Sub tbsProperty_Click()
  For i = 0 To picPage.UBound
    picPage(i).Visible = False
    picPage(i).Enabled = False
  Next i
  
  picPage(CInt(tbsProperty.selectedItem.Tag)).Visible = True
  picPage(CInt(tbsProperty.selectedItem.Tag)).Enabled = True
  picPage(CInt(tbsProperty.selectedItem.Tag)).ZOrder 0
End Sub
