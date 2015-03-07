object frmReadSMS: TfrmReadSMS
  Left = 263
  Top = 130
  Caption = #38405#35835#30701#20449
  ClientHeight = 553
  ClientWidth = 715
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    000001001800000000000003000000000000000000000000000000000000C098
    90C09090C08880B08080B07870A07070A06860A06860A06860A06860A06860A0
    6860A06060A06060A06060A06060C09890F0D8C0FFFFF0FFF0D0FFE0B0FFD8A0
    FFC890FFC890FFC090FFB880FFB880FFA870FFA870F0A060D08050A06060D098
    90D0A8A0E0D0C0FFFFF0FFF8E0FFF0D0FFE8D0FFE8C0FFE0C0FFD8B0FFD8B0FF
    D0A0FFC890D09870C07060A06860D0A090FFFFF0D0B0A0E0D0C0FFF8F0FFF8F0
    FFF8F0FFF0E0FFF0E0FFE8C0FFE0C0FFD8B0E0A880C08070FFB870A06860D0A0
    A0FFFFFFFFFFF0D0A090E0C8C0FFF8F0FFF8F0FFF8F0FFF0E0FFF0D0F0E0C0D0
    A880C07870FFD8A0FFD090A06870D0A0A0FFFFFFF0D8D0E0C0B0E0C0B0E0C0B0
    E0C8C0E0C8B0E0C0B0E0C0B0D0B0A0D0A8A0D09890E0B090FFD8A0A07070D0A8
    A0F0D0C0E0B8B0F0F0F0F0F0F0E0B8A0E0B8A0D0B0A0D0B0A0D0A8A0D0A8A0F0
    E8E0F0E0D0C09890E0A880A07870D0A8A0C0B8B0F0F0F0FFF8F0F0E0E0F0F0F0
    F0F0F0F0F0F0F0F0E0F0F0E0F0F0E0F0E0D0FFF0E0F0D8D0A09090A07870D0A8
    A0A0D8F0FFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFF8F0FFF8F0FF
    F0F0F0F0F0E0E0E050B0E0A07870D0A8A0A0E8FFB0E0FFB0E0FFA0D8FF80D0FF
    60D0FF60C8FF60C8FF50C8FF50C0F040B8F040B0F030B0F020B0FFC098900000
    00D0B8C0C0F0FFD0F8FFD0F0FFD0E8FFB0E8FFA0E0FF80D0FF70C8FF50C8FF70
    C8FF60C8FF40B8FFA0B0C0000000000000000000D0B8B0D0E0E0D0F8FFD0F0FF
    D0E8FFB0E8FFA0E0FF80D0FF70C8FF50C8FF90C0E0B0A8B00000000000000000
    00000000000000000000D0B8B0E0F8FFE0F8FFD0F0FFB0E0FF90E0FF70D0FFC0
    B0B0000000000000000000000000000000000000000000000000000000000000
    E0E0E0D0F8FFC0F0FFB0C8D0D0B8B00000000000000000000000000000000000
    00000000000000000000000000000000000000000000D0B0A000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000080010000C0030000F00F0000FC1F0000FF7F0000FFFF0000}
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object stbMain: TdxStatusBar
    Left = 0
    Top = 531
    Width = 715
    Height = 22
    Images = iltStatusBar
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 0
        Fixed = False
        Text = #20849' 0 '#20010#23383#31526
      end
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = stbMainContainer3
        Width = 57
      end
      item
        PanelStyleClassName = 'TdxStatusBarKeyboardStatePanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clWindowText
        PanelStyle.Font.Height = -12
        PanelStyle.Font.Name = #23435#20307
        PanelStyle.Font.Style = []
        PanelStyle.KeyboardStates = [dxksCapsLock, dxksNumLock, dxksInsert]
        PanelStyle.CapsLockKeyAppearance.ActiveCaption = #22823#20889
        PanelStyle.CapsLockKeyAppearance.InactiveCaption = #22823#20889
        PanelStyle.NumLockKeyAppearance.ActiveCaption = #25968#23383
        PanelStyle.NumLockKeyAppearance.InactiveCaption = #25968#23383
        PanelStyle.ScrollLockKeyAppearance.ActiveCaption = 'SCRL'
        PanelStyle.ScrollLockKeyAppearance.InactiveCaption = 'SCRL'
        PanelStyle.InsertKeyAppearance.InactiveFontColor = clWindowText
        PanelStyle.InsertKeyAppearance.ActiveCaption = #35206#30422
        PanelStyle.InsertKeyAppearance.InactiveCaption = #25554#20837
        PanelStyle.ParentFont = False
        Text = #25351#31034#22120
      end>
    PaintStyle = stpsOffice11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    object stbMainContainer3: TdxStatusBarContainerControl
      Left = 546
      Top = 2
      Width = 57
      Height = 18
      object tlbStatus: TToolBar
        Left = 0
        Top = 0
        Width = 57
        Height = 18
        Align = alClient
        ButtonHeight = 18
        ButtonWidth = 19
        Caption = 'tlbStatus'
        EdgeInner = esNone
        EdgeOuter = esNone
        Images = iltStatus
        TabOrder = 0
        Transparent = False
        object btnRead: TToolButton
          Left = 0
          Top = 0
          Hint = #24050#35835
          Caption = 'btnRead'
          ImageIndex = 0
          Style = tbsCheck
          OnClick = btnReadClick
        end
        object btnReply: TToolButton
          Left = 19
          Top = 0
          Hint = #24050#22238#22797
          Caption = 'btnReply'
          ImageIndex = 1
          Style = tbsCheck
          OnClick = btnReplyClick
        end
        object btnTransmit: TToolButton
          Left = 38
          Top = 0
          Hint = #24050#36716#21457
          Caption = 'btnTransmit'
          ImageIndex = 2
          Style = tbsCheck
          OnClick = btnTransmitClick
        end
      end
    end
  end
  object txtSMS: TSynEditor
    Left = 0
    Top = 155
    Width = 715
    Height = 376
    Align = alClient
    Color = 15138790
    CodeFolding.CaseSensitive = False
    CodeFolding.FolderBarLinesColor = 12562872
    ActiveLine.Background = clBtnFace
    ActiveLine.Foreground = 12999969
    ActiveLine.Indicator.MaskColor = clBlack
    ActiveLine.Indicator.Visible = False
    ActiveLine.Visible = False
    LineDivider.Visible = True
    LineDivider.Color = clSilver
    LineDivider.Style = psDot
    RightEdge.MouseMove = False
    RightEdge.Visible = False
    RightEdge.Position = 80
    RightEdge.Color = clSilver
    RightEdge.Style = psSolid
    LineSpacing = 10
    LineSpacingRule = lsSpecified
    Background.Visible = False
    Background.RepeatMode = brmNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    TabOrder = 1
    BookMarkOptions.DrawBookmarksFirst = False
    BookMarkOptions.EnableKeys = False
    BookMarkOptions.GlyphsVisible = False
    Gutter.ShowLineModified = False
    Gutter.LineModifiedColor = clYellow
    Gutter.LineNormalColor = clLime
    Gutter.AutoSize = True
    Gutter.DigitCount = 2
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Arial'
    Gutter.Font.Style = [fsBold]
    Gutter.LeftOffset = 4
    Gutter.LeftOffsetColor = clNone
    Gutter.RightOffset = 4
    Gutter.RightOffsetColor = clNone
    Gutter.ShowLineNumbers = True
    Gutter.Gradient = True
    Options = [eoAltSetsColumnMode, eoDragDropEditing, eoGroupUndo, eoHideShowScrollbars, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces, eoTrimTrailingSpaces, eoColumnEditExtension]
    ReadOnly = True
    WordWrap.Enabled = True
    WordWrap.Position = 80
    WordWrap.Style = wwsClientWidth
    WordWrap.Indicator.Visible = False
    DocumentState = smsNormal
    DocumentFormat = sffDos
  end
  object pnlMsgReport: TPanel
    Left = 0
    Top = 107
    Width = 715
    Height = 48
    Align = alTop
    Color = 14811135
    ParentBackground = False
    TabOrder = 6
    Visible = False
    object lblMessageReport: TLabel
      Left = 40
      Top = 6
      Width = 348
      Height = 24
      Caption = #36825#26159#19968#20010#28040#24687#25253#21578#65292#23427#34920#31034#24744#22312#20197#21069#26576#20010#26102#38388#21457#36865#30701#20449#24050#32463#25104#21151#12290#13#10
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object imgMsgReport: TImage
      Left = 5
      Top = 7
      Width = 33
      Height = 33
      Picture.Data = {
        055449636F6E0000010001002020000001000800A80800001600000028000000
        2000000040000000010008000000000000040000000000000000000000010000
        00010000000000000246660002466A0002466E00024A6E00024A7200024E7600
        02527A0002527E00625E5A0062625E00666662006A6666006E6A6600726E6A00
        72726E00767672007A7676007E7A7600827E7A0082827E000256820002568600
        025A8600025A8A00025E8E00025E92000262960002669A00066A9A00066A9E00
        5E768200628E9A004EB6D60056BEDE005EBEDE0086868200868686008A868600
        8E8A8600928E8A0092928E00969692009A969200A6A6A200AAAAA600AEAAAA00
        B2AEAA00B2B2AE00E6AE9200EAB29A00EAB69E00C2BEBE00EABEA600EEC2AE00
        EEC2B200EEC6B600EECAB600EECABE00EECEBE00C6C6C200CECECE00D6D2D200
        D6D6D600DADADA00DEDEDE00F2D2C600F2D6CE00F6DED200C6DEE600C6E6F200
        D6EEF600E6E2E200E6E6E600EAEAE600EAEAEA00EEEEEA00EEEEEE00F2F2F200
        F6F6F600FAFAFA00FEFEFE000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        FFFFFF0000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000101010101010101010101010101010101010101010100
        0000000000000000022122222222222222222222222222222222222222222102
        0000000000000000022222222222222222222222222222222222222222222202
        0000000000000000022222090909090909090909090909090909090909222202
        00000000000000000522220A515151515151515151515151515151510A222205
        00000000000000000522220B515151515151515151515151515151510B222205
        00000000000000000522220C51513D3D3D3D3D3D3D3D3D3D3D3D51510C222205
        00000000000000000522220D515131313149313131493131314951510D222205
        00000000000000000722220E51513232324A3232324A3233324B51510E222207
        00000000000000000722220F51513233324B3233324B3535354A51510F222207
        00000000000000000722221051513335354D3535354D3737374D515110222207
        00000000000000000722221151513738354E3737374D3B3B3B4B515111222207
        000000000000000016222212515138383B4E3838384E4E4E4E4E515112222216
        00000000000000001622221351513B3B3B4E3B3B3B4E4E4E4E4E515113222216
        00000000000000001622221451514242424F4F4E4F4E514E4E51515114222216
        00000000000000001722222451514343434F4F4F514E4E514E4E515124222217
        000000000000000018222226515144444451514F51514F514F51515126222218
        000000000000000018222227515151514F514F514E514F514F51515127222218
        0000000000000000182222285151515151515151515151515151515128222218
        0000000000000000182222295151515151515151515151515151515129222218
        00000000000000001B22222A514040404040404040404040404040512A22221B
        00000000000000001B22222B2B0B0A0A0A0A0A0A0A0A0A0A0A0A0B2B2B22221B
        00000000000000001D23222222202E4B4049404049404049402C20222222231B
        00000000000000001D4647474745245151413E3C342E2E2E401445474747461C
        0000000000000000001C1C1C1C1C1F3F51515124245151513F1F1C1C1C1C1C00
        00000000000000000000000000000024242C512525512C242400000000000000
        00000000000000000000000000000000002D3C51513C2D000000000000000000
        000000000000000000000000000000000000302A2A3000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000FFFFFFFFFFFFFFFFFFFFFFFFF800001FF000000FF000000FF000000F
        F000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000F
        F000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000F
        F000000FF000000FF000000FF000000FF800001FFFE007FFFFF81FFFFFFC3FFF
        FFFFFFFF}
    end
    object imgRepDate: TImage
      Left = 40
      Top = 24
      Width = 17
      Height = 17
      Picture.Data = {
        055449636F6E0000010001001010000001000800680500001600000028000000
        1000000020000000010008000000000000010000000000000000000000010000
        00010000000000007C605D00CB5D3C00CF603E0084686300D46C4400DE6B4200
        CA735D00D1795F00E0704500E47C4B00CD7D6200DD875100EB8E5400E1915500
        E49A5A00F19E5B00E7A25E00E7A45F00E8A55F00F4A75F00CF846500D7846C00
        D6966E00DE9C7100E68C6D00F8B26500E0A07300E0A47500FEC56E00D69B8E00
        CEAB9700CEAE9C00D7A09000D8A39200D9A69300DCAC9600EFAE9700EFB09A00
        F0B29A00E6BFA200F3BFAC00F9C18800FBCA8D00FED29200F7C7A600FFCDA600
        FFCFA800E6CAB600EFCEB500E6CDBC00F6CBB400FFD4B100FFD6B600F8D6BE00
        FFD8B900FEE1B600FFDEC500FFE9C900FFE6D100FFE8D500FFE7D800FFEAD900
        E6E1E100FFEEE100FDEAE400FFEFE800FFF1E600FEF2EC00FFF7F100FFF7F400
        FFFCFA0000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        FFFFFF0000000000001E160202161E00000000000000001E0306192525190603
        1E00000000000B0A2741423D3D4141250607000000220D3344392F2E2E2E3741
        29061E00000C2D4439352835342E3534442503002214443E3931041F35353434
        3941061E182A463C3B3B300420373737354419160F35463E3E3C3C32013B3B39
        394326020F3546464341413E013C3B3B3B4326031C2CFF4644454444013E3E3E
        3C461908241D46FFFF454545014644434444091E00123845FFFFFFFF01464646
        FF2D050000241D3A45FF45FF3FFF45FF360D21000000171D38FF45FF45FFFF35
        1015000000000024121D2C38382B1A0E220000000000000000241C1212182400
        00000000F81F0000E0070000C003000080010000800100000000000000000000
        000000000000000000000000000000008001000080010000C0030000E0070000
        F81F0000}
    end
    object lblDate: TLabel
      Left = 60
      Top = 26
      Width = 96
      Height = 12
      Caption = #21457#36865#26102#38388': <'#26410#30693'>'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lblRepAddressee: TLabel
      Left = 260
      Top = 26
      Width = 84
      Height = 12
      Caption = #25910#20214#20154': <'#26410#30693'>'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object imgRepAddressee: TImage
      Left = 240
      Top = 23
      Width = 17
      Height = 17
      Picture.Data = {
        055449636F6E0000010001001010000001000800680500001600000028000000
        1000000020000000010008000000000000010000000000000000000000010000
        0001000000000000CC6C3D00CF704000D67D4600C9795700CC7F6300DA8B5100
        D5875F00D5895A00D89E5C00E4965500CD846500CD846900DC846300D79A7F00
        E4967100E4AB7A00E9B17900FABE7700F6B77B00F4BE7D00FAC07B0010559600
        1D5E9C001D609F0025629E003A6898000261A8000768AC001D65A300126FB500
        1B72B5001174B8002A6AA4003B6FA4003C7FB800157EC600758590005780AE00
        6383A7006082AD006087B2007F9BBD000D81C700008AD200168FD2000096DE00
        1C92D3002282C6003C8DC500328FCE003990C900228ED4002A92D4002FA9EF00
        2EB6FF005295C800509ED200619FCD0052A0D2005CA9D9006DBAE40049C1FF00
        5AC7FF006FC4EF0072C1EA0075D2FF007CD5FF009DAEBC00D9A18B00DCB08200
        E5A68600E2AB8100E9B28500E8B18C00F7BD8700F2B48800F4BE8A00E0B99300
        F4BE9800F2BDA200FAC48300F7C18E00E4C19F00EACFB50089B0D30091DDFF00
        9BE0FF00B3EAFF00F1DCC900FFF6F200FFF8F600000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        FFFFFF00000000000E0806060606080E0000000000000B0A1251515151140915
        0A040000000003135252525211464E4D4B0300000000014C4F4F4F10535A5949
        4F0200000000450F505048545B5B594A47450000000000050D472538333A4407
        0C00000000000000001A415858583D270000000000000000554058585858583C
        000000000000000033565757575757563A000000000000003542434343434343
        320000000000002A1C3E3F3F3F3F3F3E340000000000002A2C243736301F201E
        23000000000000002C1B1B1B2C2E2E2E16000000000000001D2F2F2F2F2D2D2B
        290000000000000000213B3B3939312200000000000000000000261718192800
        00000000F00F0000C0030000C0030000C0030000C0030000E0070000F80F0000
        F00F0000F0070000F0070000E0070000E0070000F0070000F0070000F80F0000
        FC1F0000}
    end
  end
  object dxbmMain: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = iltMenu
    ImageOptions.LargeImages = iltToolbar
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 520
    Top = 464
    DockControlHeights = (
      0
      0
      107
      0)
    object dxbmMainBar1: TdxBar
      AllowClose = False
      AllowQuickCustomizing = False
      Caption = #33756#21333#26639
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 229
      FloatTop = 201
      FloatClientWidth = 0
      FloatClientHeight = 0
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mnuSMS'
        end
        item
          Visible = True
          ItemName = 'mnuEdit'
        end
        item
          Visible = True
          ItemName = 'mnuView'
        end
        item
          Visible = True
          ItemName = 'mnuTool'
        end
        item
          Visible = True
          ItemName = 'mnuOption'
        end>
      MultiLine = True
      OldName = 'MainMenu'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxbmMainBar2: TdxBar
      Caption = #24037#20855#26639
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 27
      DockingStyle = dsTop
      FloatLeft = 227
      FloatTop = 254
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxlbSend'
        end
        item
          Visible = True
          ItemName = 'dxlbReply'
        end
        item
          Visible = True
          ItemName = 'dxlbTransmit'
        end
        item
          Visible = True
          ItemName = 'dxlbResend'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxlbDelete'
        end
        item
          Visible = True
          ItemName = 'dxlbCopyEntire'
        end
        item
          Visible = True
          ItemName = 'dxlbFind'
        end
        item
          Visible = True
          ItemName = 'dxlbFindNext'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxlbPrevious'
        end
        item
          Visible = True
          ItemName = 'dxlbNext'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxlbPreview'
        end
        item
          Visible = True
          ItemName = 'dxlbPrint'
        end>
      OldName = 'Toolbar'
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object dxbmMainBar3: TdxBar
      Caption = #22320#22336#26639
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 79
      DockingStyle = dsTop
      FloatLeft = 227
      FloatTop = 254
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxsDate'
        end
        item
          UserDefine = [udWidth]
          UserWidth = 112
          Visible = True
          ItemName = 'dxeDate'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxsAddress'
        end>
      OldName = 'Address'
      OneOnRow = True
      Row = 2
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object mnuSMS: TdxBarSubItem
      Caption = #30701#20449'(&S)'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mnuSMSSave'
        end
        item
          Visible = True
          ItemName = 'mnuSMSDelete'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuSMSSend'
        end
        item
          Visible = True
          ItemName = 'mnuSMSRelpy'
        end
        item
          Visible = True
          ItemName = 'mnuSMSTransmit'
        end
        item
          Visible = True
          ItemName = 'mnuSMSResend'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuSMSPreview'
        end
        item
          Visible = True
          ItemName = 'mnuSMSPrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuSMSClose'
        end>
    end
    object mnuSMSSave: TdxBarButton
      Action = aSynExporter
      Caption = #21478#23384#20026'(&A)...'
      Category = 0
      ImageIndex = 2
      ShortCut = 24659
    end
    object mnuSMSDelete: TdxBarButton
      Caption = #21024#38500'(&D)'
      Category = 0
      Hint = #21024#38500'(D)'
      Visible = ivAlways
      ImageIndex = 3
      ShortCut = 16452
      OnClick = mnuSMSDeleteClick
    end
    object mnuSMSRelpy: TdxBarButton
      Caption = #22238#22797'(&R)...'
      Category = 0
      Hint = #22238#22797'(R)'
      Visible = ivAlways
      ImageIndex = 5
      ShortCut = 16466
      OnClick = mnuSMSRelpyClick
    end
    object mnuSMSTransmit: TdxBarButton
      Caption = #36716#21457'(&T)...'
      Category = 0
      Hint = #36716#21457'(T)'
      Visible = ivAlways
      ImageIndex = 6
      ShortCut = 16468
      OnClick = mnuSMSTransmitClick
    end
    object mnuSMSResend: TdxBarButton
      Caption = #37325#26032#21457#36865'(&R)'
      Category = 0
      Hint = #37325#26032#21457#36865'(R)'
      Visible = ivAlways
      ImageIndex = 7
      OnClick = mnuSMSResendClick
    end
    object mnuSMSPreview: TdxBarButton
      Caption = #25171#21360#39044#35272'(&E)...'
      Category = 0
      Hint = #25171#21360#39044#35272'(E)'
      Visible = ivAlways
      ImageIndex = 8
      ShortCut = 24656
      OnClick = mnuSMSPreviewClick
    end
    object mnuSMSPrint: TdxBarButton
      Caption = #25171#21360'(&P)'
      Category = 0
      Hint = #25171#21360'(P)'
      Visible = ivAlways
      ImageIndex = 9
      ShortCut = 16464
      OnClick = mnuSMSPrintClick
    end
    object mnuSMSClose: TdxBarButton
      Caption = #20851#38381'(&C)'
      Category = 0
      Hint = #20851#38381'(C)'
      Visible = ivAlways
      ImageIndex = 10
      ShortCut = 32883
      OnClick = mnuSMSCloseClick
    end
    object mnuEdit: TdxBarSubItem
      Caption = #32534#36753'(&E)'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mnuEditCopyEntire'
        end
        item
          Visible = True
          ItemName = 'mnuEditCopy'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuEditFind'
        end
        item
          Visible = True
          ItemName = 'mnuEditFindNext'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuEditRead'
        end
        item
          Visible = True
          ItemName = 'mnuEditReplied'
        end
        item
          Visible = True
          ItemName = 'mnuEditTransmitted'
        end>
    end
    object mnuEditCopyEntire: TdxBarButton
      Caption = #22797#21046#30701#20449'(&S)'
      Category = 0
      Hint = #22797#21046#30701#20449'(S)'
      Visible = ivAlways
      ImageIndex = 11
      ShortCut = 24643
      OnClick = mnuEditCopyEntireClick
    end
    object mnuEditCopy: TdxBarButton
      Action = aSynCopy
      Caption = #22797#21046#25152#36873'(&C)'
      Category = 0
      ImageIndex = 12
      ShortCut = 16451
    end
    object mnuEditFind: TdxBarButton
      Action = aSynFind
      Caption = #26597#25214'(&F)...'
      Category = 0
      ImageIndex = 13
      ShortCut = 16454
    end
    object mnuEditFindNext: TdxBarButton
      Action = aSynFindNext
      Caption = #26597#25214#19979#19968#20010'(&N)'
      Category = 0
      ImageIndex = 14
      ShortCut = 114
    end
    object mnuSMSSend: TdxBarButton
      Caption = #31435#21051#21457#36865'(&S)'
      Category = 0
      Hint = #31435#21051#21457#36865'(S)'
      Visible = ivAlways
      ImageIndex = 4
      ShortCut = 16397
      OnClick = mnuSMSSendClick
    end
    object mnuView: TdxBarSubItem
      Caption = #35270#22270'(&V)'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mnuViewToolbar'
        end
        item
          Visible = True
          ItemName = 'mnuViewAddress'
        end
        item
          Visible = True
          ItemName = 'mnuViewStatusbar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuViewPrevious'
        end
        item
          Visible = True
          ItemName = 'mnuViewNext'
        end>
    end
    object mnuViewToolbar: TdxBarButton
      Caption = #24037#20855#26639'(&T)'
      Category = 0
      Hint = #24037#20855#26639'(T)'
      Visible = ivAlways
      AllowAllUp = True
      ButtonStyle = bsChecked
      Down = True
      OnClick = mnuViewToolbarClick
    end
    object mnuViewAddress: TdxBarButton
      Caption = #22320#22336#26639'(&A)'
      Category = 0
      Hint = #22320#22336#26639'(A)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = mnuViewAddressClick
    end
    object mnuViewStatusbar: TdxBarButton
      Caption = #29366#24577#26639'(&S)'
      Category = 0
      Hint = #29366#24577#26639'(S)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = mnuViewStatusbarClick
    end
    object mnuViewNext: TdxBarButton
      Caption = #19979#19968#26465#30701#20449'(&N)'
      Category = 0
      Hint = #19979#19968#26465#30701#20449'(N)'
      Visible = ivAlways
      ImageIndex = 19
      ShortCut = 116
      OnClick = mnuViewNextClick
    end
    object mnuViewPrevious: TdxBarButton
      Caption = #19978#19968#26465#30701#20449'(&P)'
      Category = 0
      Hint = #19978#19968#26465#30701#20449'(P)'
      Visible = ivAlways
      ImageIndex = 18
      ShortCut = 115
      OnClick = mnuViewPreviousClick
    end
    object mnuTool: TdxBarSubItem
      Caption = #215#20214#20154'(&S)'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object mnuOption: TdxBarSubItem
      Caption = #36873#39033'(&O)'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mnuOptionAutoWarp'
        end>
    end
    object mnuOptionAutoWarp: TdxBarButton
      Caption = #33258#21160#25442#34892'(&W)'
      Category = 0
      Hint = #33258#21160#25442#34892'(W)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = mnuOptionAutoWarpClick
    end
    object dxlbSend: TdxBarLargeButton
      Caption = #21457#36865
      Category = 0
      Hint = #21457#36865
      Visible = ivAlways
      LargeImageIndex = 0
      OnClick = mnuSMSSendClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 4
    end
    object dxlbReply: TdxBarLargeButton
      Caption = #22238#22797
      Category = 0
      Hint = #22238#22797
      Visible = ivAlways
      LargeImageIndex = 1
      OnClick = mnuSMSRelpyClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 5
    end
    object dxlbTransmit: TdxBarLargeButton
      Caption = #36716#21457
      Category = 0
      Hint = #36716#21457
      Visible = ivAlways
      LargeImageIndex = 2
      OnClick = mnuSMSTransmitClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 6
    end
    object dxlbResend: TdxBarLargeButton
      Caption = #37325#26032#21457#36865
      Category = 0
      Hint = #37325#26032#21457#36865
      Visible = ivAlways
      LargeImageIndex = 3
      OnClick = mnuSMSResendClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 7
    end
    object dxlbDelete: TdxBarLargeButton
      Caption = #21024#38500
      Category = 0
      Hint = #21024#38500
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = mnuSMSDeleteClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 3
    end
    object dxlbCopyEntire: TdxBarLargeButton
      Caption = #22797#21046
      Category = 0
      Hint = #22797#21046
      Visible = ivAlways
      LargeImageIndex = 5
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 11
    end
    object dxlbFind: TdxBarLargeButton
      Caption = #26597#25214
      Category = 0
      Hint = #26597#25214
      Visible = ivAlways
      LargeImageIndex = 6
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 13
    end
    object dxlbFindNext: TdxBarLargeButton
      Caption = #26597#25214#19979#19968#20010
      Category = 0
      Hint = #26597#25214#19979#19968#20010
      Visible = ivAlways
      LargeImageIndex = 7
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 14
    end
    object dxlbPrevious: TdxBarLargeButton
      Caption = #19978#19968#26465
      Category = 0
      Hint = #19978#19968#26465
      Visible = ivAlways
      LargeImageIndex = 8
      OnClick = mnuViewPreviousClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 18
    end
    object dxlbNext: TdxBarLargeButton
      Caption = #19979#19968#26465
      Category = 0
      Hint = #19979#19968#26465
      Visible = ivAlways
      LargeImageIndex = 9
      OnClick = mnuViewNextClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 19
    end
    object dxlbPreview: TdxBarLargeButton
      Caption = #25171#21360#39044#35272
      Category = 0
      Hint = #25171#21360#39044#35272
      Visible = ivAlways
      LargeImageIndex = 10
      OnClick = mnuSMSPreviewClick
      SyncImageIndex = False
      ImageIndex = 8
    end
    object dxlbPrint: TdxBarLargeButton
      Caption = #25171#21360
      Category = 0
      Hint = #25171#21360
      Visible = ivAlways
      LargeImageIndex = 11
      OnClick = mnuSMSPrintClick
      SyncImageIndex = False
      ImageIndex = 9
    end
    object dxsDate: TdxBarStatic
      Caption = #26085#26399':'
      Category = 0
      Hint = #26085#26399':'
      Visible = ivAlways
      ImageIndex = 0
    end
    object dxeDate: TdxBarEdit
      Caption = #26085#26399
      Category = 0
      Hint = #26085#26399
      Visible = ivAlways
      OnChange = dxeDateChange
      Width = 100
    end
    object dxsAddress: TdxBarStatic
      Caption = #215#20214#20154':'
      Category = 0
      Hint = #215#20214#20154':'
      Visible = ivAlways
      ImageIndex = 1
    end
    object mnuEditRead: TdxBarButton
      Caption = #24050#35835'(&R)'
      Category = 0
      Hint = #24050#35835'(R)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 15
      ShortCut = 117
      OnClick = mnuEditReadClick
    end
    object mnuEditReplied: TdxBarButton
      Caption = #24050#22238#22797'(&E)'
      Category = 0
      Hint = #24050#22238#22797'(E)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 16
      ShortCut = 118
      OnClick = mnuEditRepliedClick
    end
    object mnuEditTransmitted: TdxBarButton
      Caption = #24050#36716#21457'(&T)'
      Category = 0
      Hint = #24050#36716#21457'(T)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 17
      ShortCut = 119
      OnClick = mnuEditTransmittedClick
    end
    object dxmnuCreateContact: TdxBarButton
      Caption = #21019#24314#32852#31995#20154'(&C)...'
      Category = 0
      Hint = #21019#24314#32852#31995#20154'(C)'
      Visible = ivAlways
      ImageIndex = 20
      OnClick = dxmnuCreateContactClick
    end
    object dxmnuReplaceContact: TdxBarButton
      Caption = #26367#25442#32852#31995#20154'(&R)...'
      Category = 0
      Hint = #26367#25442#32852#31995#20154'(R)'
      Visible = ivAlways
      ImageIndex = 21
      OnClick = dxmnuReplaceContactClick
    end
    object dxmnuCopyToClipboard: TdxBarButton
      Caption = #22797#21046#21495#30721#37117#21098#36148#26495'(&L)'
      Category = 0
      Hint = #22797#21046#21495#30721#37117#21098#36148#26495'(L)'
      Visible = ivAlways
      ImageIndex = 22
      OnClick = dxmnuCopyToClipboardClick
    end
    object dxmnuCreateSMS: TdxBarButton
      Caption = #21019#24314#30701#20449'(&S)...'
      Category = 0
      Hint = #21019#24314#30701#20449'(S)'
      Visible = ivAlways
      ImageIndex = 23
      OnClick = dxmnuCreateSMSClick
    end
  end
  object iltToolbar: TImageList
    Height = 24
    Width = 24
    Left = 584
    Top = 464
    Bitmap = {
      494C01010D000E00100018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000006000000001002000000000000090
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A3A3A30092929200929292008C8C8E008C8C8E0092929200A3A3
      A300B8B5B6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8B5B600A3A3
      A3006A6B6600515D400059654200585B39005C523300654B2E00654B2E006759
      4F0073716F00B8B5B60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007A7A7800625343004F4A
      48005466370086A55A008DAD620092954E009C803A00A8752D00A86422009850
      17004C3627009A9A9A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000059594A009A7835007F4F
      12007C9C4E009BC17300A0C67E00A2A66200A3914B00A87D3400AB6A2300A456
      140061300F0065615C0092929200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005C615600959B5F00986E
      2C00869D5000A6D18700ADD99400A3B371009E9852009C803A009E6924009151
      15006A3007006A431F007A7A7800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BABABA00A8A7A4009C9B96005852520068836700ABB7
      740097A05400ADD99400B6E8AB00A5C28400989F5B0095813E008E6528007646
      170078360C00894E220092929200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008E809000427088004467BC00537CD5004343BC005D4B62009AB9
      9400B0D49500ADD99400B7F4BD00A1CF9B008DA66D00828244007A5F2700603B
      1100784011007568600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000092B2DD002767F4009AA0B500B8A1A000E0A18300FBBF8600DFB78A008F8E
      74007F96770098C18700AEEDBE0095D0A6007EA57A006D804C005D5627005039
      1C005B504200A9A9A90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002B7AF700807DA700FFEB8900FEEEAE00FEEEBA00FEF5C300FEF5D700EAE8
      DE00AA9A83006564450095CAA0008ACDA3006DA0770058724600313729004038
      2C007A7A7800A9A9A90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000088B3
      EA000D52D000C6AB7F00FEF5C300FCD9B200FCD9B200FEECCC00FEF7E800FCED
      D800D17B4A009C744F0068735800585B390052502C0049482F002B528B003563
      BA005A544E008A878300A9A9A900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004095
      EC0075657000E8BC8000FEECCC00FCD9B200FEECCC00FEF5D700FFFFFF00E6C7
      B800D17B4A00806E4F0040401B00583A100074350B00702E0E006B6968009ABB
      E9003885D2005F657A00928E8900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AEC3DF004694
      CD00F0C73200FFF1BB00FCEDD800FCEDD800FEFBF400FFFFFF00F5EDEC00D695
      7A00BA72410052502C005F702C008276370099662400A456140060382500A9A9
      A90068A9FB00247AD60088899300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000088B3EA006368
      8100F5C36200FEF7E800FCEDD800FEFBF400FFFFFF00FFFFFF00EAE8DE00E79E
      7500BBAA7F00637149009BC17300AABF7D00A3914B00AB6A2300793A11008590
      740034AD49002A68D0009992A400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004DA7EF002DA9
      B900DADCD500FFFFFF00FEF7E800FEFBF400FFFFFF00FEFBF400DFB5A100DD8B
      5100BAA1800063714900A7D18E00ACDDA70091A96F008276370059371C004998
      3E0012C22D006D71A700B8B5B600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BCCADA0025CCFA0043FA
      EC00F6FCF000FEF7E800FEF7E800FEFBF400FFFFFF00F5EDEC00E0A18300F0B7
      7F00EBD5B000928A780071896D0095D0A6006DA0770054663C004C4D440041A5
      8D0017959F0097889F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000749BEC000782B100FCD9
      B200FFFFFF00FCEDD800FEFBF400FFFFFF00FFFFFF00F5DECB00E59A6200F5C9
      9500FEECCC00FCEDD800A7A097006A6B6600666565007A7977008AA5C0002392
      FC005882C3000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003DB2A900199E1500FEF7
      E800FEF7E800FEF7E800FEFBF400FFFFFF00F5F7F600C8B6AE00F3AB5A00FDDF
      AB00FCEDD800FFFFFF00FEFBF400FEFBF400FFFFFF00FFFFFF007EC5FF00238E
      EB0089939E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000011D751009AC33E00FFFF
      FF00FEFBF400FEFBF400EEF7FD00A9C6FE0068A9FB00427AE900CACBBA00FEF5
      C300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0021A3FF00508B
      BE00A9A9A9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000068A9FB002D94D500BCD6BF00DAE6
      FF00C2D9F7009ABBE900ABBDE100000000000000000000000000BDD1EE0088B3
      EA00E1EFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0092D6FF002098E5008993
      9E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003E8DFF003E95F80079AAF000B1BE
      DC00000000000000000000000000000000000000000000000000000000000000
      0000B8CFEA00C2D9F700F3F9FE00FFFFFF00EEF7FD0042C1FE005A94C500B0AD
      AC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000086BCFC00FFFFFF00ABE4FE0033B8FE008C8C8E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000066ACEE0052B8FD00769DC600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000ECDFE400BF688300B74B6C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C1658100C87C940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E9D6DD00BB587500D987A000B94E6E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C1658100DE97AD00C46E8800D4C5CB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006865650068656500686565006865650068656500686565006865
      6500686565006865650068656500686565006865650068656500686565000000
      0000000000000000000000000000000000000000000000000000A5A5A5006C6B
      6B00B4A1A80095324F00B0607700C3829500932949006C6B6B006C6B6B006C6B
      6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B
      6B006C6B6B006C6B6B006C6B6B00A5A5A500A5A5A5006C6B6B006C6B6B006C6B
      6B006C6B6B006C6B6B006C6B6B006C6B6B007270710072707100727071007270
      710072707100727071007A7776008D324D00B77F9000A76176008D3851009484
      89006C6B6B00A9A9A90000000000000000000000000086858000868580008482
      7E0084827E00807F7A00807F7A007E7D79007E7D79007A797600797775007575
      7300757573007575730071706E0071706E00706E6E006E6C6D006E6C6D006E6C
      6D006E6C6D000000000000000000000000000000000000000000000000000000
      0000000000006B686700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006B6867000000
      00000000000000000000000000000000000000000000000000006C6B6B00CAB7
      BD00A4446000D98BA200E79FB400ECACBF00BE557400BE557400BE557400BE55
      7400BE557400BE557400BE557400BE557400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EEEDEC00908F8F00A9A7A6006C6B6B006C6B6B00A9A7A600908F8F00EEEE
      ED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C66C8600C66C8600CA708A00C66C
      8600CA708A00C66C8600C66C8600C66C8600EFB7C800EAAABC00DC98AD009F4D
      6500AF9FA400706F6F0000000000000000000000000089888200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006E6C6D0000000000000000000000000000000000B6B6B600777474006B68
      6700686565006B686700DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00686565006865
      65006B68670077747400B6B6B600000000000000000000000000B68D9A00C35E
      7C00D78EA200C67D9100DB859C00ECACBF00ECACBF00ECACBF00ECACBF00ECAC
      BF00ECACBF00ECACBF00ECACBF00C1597700FFFFFF00FFFFFF00FFFFFF00EEED
      EC0089888500D0CECD00FFFFFF007472710072707100FFFFFF00D0CECD008988
      8500EEEEED00FFFFFF00FFFFFF00FFFFFF00CA708A00EFB8C800EFB8C800EFB8
      C800EFB7C800EFB8C800EFB8C800EFB7C800EFB7C800DD91A600BE7E9000D696
      A800CA708A009A78820000000000000000000000000089888200FFFFFF00FFF9
      F200FEF5F100F2EDEA0089848100898481008984810089848100898481008984
      810089848100898481008984810089848100CCC5C300DCD5D200FBF0E700FFFF
      FF006E6C6D0000000000000000000000000000000000807D7C00A2A1A100DCDC
      DC00CBCBCB005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C
      5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C00C5C5
      C500D6D6D600A2A1A100807D7C000000000000000000DFB8C400A03B5800E79F
      B400E79FB400D5809700C46F8600DB859C00E28EA500E28EA500DD89A000D98B
      A200DD89A000D98BA200E9A6BA00BB587500F8F8F700FFFFFF00DDDDDC009592
      9000D0CECD00FFFFFF00FFFFFF007A7776007A777600FFFFFF00FFFFFF00D0CE
      CD0095929000DDDDDC00FFFFFF00F8F8F700C66C8600EDB2C400DE97AD00DE94
      A800E197AB00E197AB00E197AB00E59AAE00D88DA100BD718400D3879B00EBAD
      BF00EAAABC009B435C00D0AFB900000000000000000092918900FFFFFF00F6F0
      ED00A59690008B7D77008C7E7800FFF0EA00FFF0EA00FFF0EA00FFF0EA00FFF0
      EA00FFEFE700FFEFE700FFEFE7008B7D77008A786F009D8B8200D2CBC800FFFF
      FF006E6C6D000000000000000000000000000000000077747400DCDCDC00ACA9
      A700ACA9A7006B686700DCDCDC00DCDCDC00D6D6D600DCDCDC00DCDCDC00D6D6
      D600DCDCDC00DCDCDC00D6D6D600DCDCDC00DCDCDC00D6D6D6006B686700ACA9
      A700AEADA900DCDCDC007774740000000000E3BCC800C86A8500C1788E00E79F
      B400E491A900D98BA200D98BA200C8758C00DD89A000E491A900E491A900E491
      A900E491A900E491A900ECACBF00C5607D00FFFFFF00DDDDDC009A989600DDDD
      DC00EEEDEC00FFFFFF00FFFFFF007F7C7C007A777600FFFFFF00FFFFFF00EEEE
      ED00DDDDDC009D9A9900DDDDDC00FFFFFF00CC748E00EFB7C800E69DB200E69D
      B200E69DB200E69DB200E69DB200D88DA100C0768A00DD91A600DE97AD00E69D
      B200EAAABC00B8788B00D27E9600D0AFB9000000000092918900FFFFFF00AAA7
      A400B8ACA600E1D5D0008B7D7700887A74008B7D7700887A74008B7D7700887A
      74008B7D770088776F008A786F0088776F00E1D1C900B8A79E00A39D9900FFFF
      FF0071706E00000000000000000000000000000000007A787700DCDCDC00AEAD
      A900AEADA90077747400D6D6D600AEADA900AEADA900ACA9A700AEADA900AEAD
      A900ACA9A700AEADA900AEADA90077747400777474007774740072717100AEAD
      A900AEADA900DCDCDC007A78770000000000C8758C00E9A6BA00C67D9100E491
      A900E596AC00E491A900E191A700D98BA200D5809700D5859B00E491A900E491
      A900E596AC00E491A900ECAFC100C5607D00C6C6C200B0AFAB00E6E5E400F0F0
      ED00F0F0ED00FFFFFF00FFFFFF008988850089888500FFFFFF00FFFFFF00F0F0
      ED00F0F0ED00E6E5E400B0AFAB00C6C6C200CA708A00EFB8C800E6A1B500E6A1
      B500E6A1B500E59AAE00D18B9D00C8829400DE97AD00DC98AD00E59AAE00E6A1
      B500E6A1B500B8788B00EDB2C400D3879B000000000092918900FFFFFF009895
      9200E1D5D000C1B6AF008D817B00E1D4CE00E1D4CE00E1D4CE00E1D4CE00E1D4
      CE00E1D4CE00A5969000A596900092817A00C1B1A800E1D4CE0099928E00FFFF
      FF007575730000000000000000000000000000000000807D7C00EEEEED00CBCB
      CB00D1D0CC0086838200FFFFFF00D1D0CC00D6D6D600D1D0CC00D1D0CC00D6D6
      D600D1D0CC00D1D0CC00D1D0CC008F8D8B00FFFFFF008F8D8B0086838200D1D0
      CC00D1D0CC00EEEEED00807D7C0000000000D2758F00ECAFC100C8819500E79F
      B400E79AB000E491A900E596AC00E491A900E596AC00D78A9F00CC859A00C881
      9500D5859B00D5809700D594A700B34F6A00C3C2BF00EEEDEC00F1EEEE00F1EE
      EE00F1EEEE00FFFFFF00FFFFFF008988850089888500FFFFFF00FFFFFF00F0EE
      EE00F0EEEE00F0EEEE00F2F1F200C6C6C200B15B7200D098A700C8829400C882
      9400C8829400C8829400D18B9D00E69DB200E69DB200E59AAE00E6A1B500E6A1
      B500E7A6B800C8829400EFBCCC00D789A0000000000099988F00FFFFFF009F9D
      9900E1D5D000C5B9B200968A8500E1D5D000C5B9B200C4B7B000C1B6AF00C1B6
      AF00C1B6AF00AEA09900FFF0EA00A5969000C1B6AF00E1D1C90099988F00FFFF
      FF00757573000000000000000000000000000000000086838200FFFFFF00D6D6
      D600D6D6D600928F8D00FFFFFF00DCDCDC00DDDCD900DCDCDC00DCDCDC00DDDC
      D900DDDCD900DDDCD900DCDCDC00ACA9A700AAA7A300AAA7A300928F8D00D6D6
      D600D6D6D600FFFFFF008988850000000000E3BCC800D2758F00CA8FA000ECAC
      BF00E79FB400E79FB400E79FB400E596AC00D594A700C8819500D98BA200DC93
      A800DC93A800DC93A800E2A1B400BB5875009A989600D0D0CE00F8F8F700F8F8
      F700F1EEEE00FFFFFF00FFFFFF008F8E8B008F8E8B00FFFFFF00FFFFFF00F8F8
      F700F8F8F700F0EEEE00D6D6D60095929000BF698000DFA8B800DE97AD00D696
      A800DE97AD00D789A000BE809100D696A800E6A1B500E6A1B500E6A1B500E7A6
      B800EDB2C400C3929F00D18B9D00D7B6C0000000000099988F00FFFFFF00A6A4
      A100F0E8E400E1D5D000ABA09B00FEF5F100E9DED800E9DED800ECDCD600ECDC
      D600ECDCD600C7BBB400CCBFB800B8A79E00E1D1C900F0E2DB00ABA09B00FFFF
      FF0075757300000000000000000000000000000000008F8D8B00FFFFFF00DDDC
      D900DDDCD90098979400FFFFFF00E2E1E000E6E4E300E6E4E300E6E4E300E6E4
      E300E6E4E300E6E4E300E6E4E300E2E1E000E6E4E300FFFFFF009B9A9700DDDC
      D900D6D5D200FFFFFF008F8D8B000000000000000000E3BCC800B4566F00ECB7
      C800ECAFC100E2A1B400E2A1B400E09AB000CC859A00DC96AB00E79FB400E79F
      B400DC96AB00E2A1B400E2A1B400C86A8500D0CECD0095929000D6D6D600F8F8
      F700FFFFFF00FFFFFF00FFFFFF00908F8F0095929000FFFFFF00FFFFFF00F8F8
      F700F8F8F700D6D6D60095929000D0CECD00CA708A00E6ADBE00DC98AD00DE9E
      B000DE9EB000DE9EB000D696A800C8829400D696A800E7A6B800E7A6B800EFBC
      CC00F0C5D200AE5D7400D7B6C000000000000000000099988F00FFFFFF00B1B0
      AD00FEF5F100E6DED900B5ACA700FEF5F100FEF5F100FEF5F100FEF5F100FEF5
      F100FFF0EA00FEF5F100FFF0EA00B5ACA700E6D9D100FFF0EA00ADA8A500FFFF
      FF007A7976000000000000000000000000000000000096959200FFFFFF00DDDC
      D900DDDCD900A4A39F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A39F00DCDC
      DC00DDDCD900FFFFFF0096959200000000000000000000000000CAB7BD00D580
      9700EEBECC00F0BACB00E79FB400CA8FA000E8BFCB00EFC6D100E8BFCB00F0C8
      D300F0C8D300F0C8D300F0C8D300CF6E8A00F0F0ED00D6D6D6009A989600D6D6
      D600F8F8F700FFFFFF00FFFFFF009A9896009A989600FFFFFF00FFFFFF00FFFF
      FF00D6D6D6009D9A9900D6D6D600EEEEED00D3879B00EFD0D800F0D0D800EFD0
      D800EFD0D800EFD0D800EFD0D800E5C7CF00C3929F00DC98AD00EAC6D000F1CC
      D700D88DA100B5949D00000000000000000000000000A2A19600FFFFFF00B9B7
      B400FEF5F100EDE6E100B9B7B400C4B7B000B9B7B400C1B6AF00C1B6AF00B9B7
      B400C1B6AF00C1B6AF00C1B6AF00BDAFA700E9DED800FFF0EA00B1B0AD00FFFF
      FF007E7D790000000000000000000000000000000000A4A39F00FFFFFF00DDDC
      D900E2E1E000B0ADAA00AEADA900B0ADAA00AEADA900AEADA900AEADA900AEAD
      A900B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00AEADA900DDDC
      D900E6E4E300FFFFFF009B9A9700000000000000000000000000A5A2A000F0E0
      E500DB859C00E7B3C200D9A8B500E2A1B400C86A8500C86A8500C86A8500C86A
      8500C46F8600C86A8500C46F8600C86A8500F1EEEE00F0F0ED00DDDDDC00AAA9
      A500EEEDEC00FFFFFF00FFFFFF00A09D9B00A09D9B00FFFFFF00FFFFFF00EEEE
      ED00AAA9A500DDDDDC00D0D0CE00D0CECD00CA708A00C87C9400C8768C00C87C
      9400C8768C00C87C9400D4839900D3879B00E7A6B800D2A6B200EAC6D000DD91
      A600DCCCD100B7B4B500000000000000000000000000A2A19600FFFFFF00CCC5
      C300DCD5D200FFFFFF0099928E00FEF5F100F0E8E400F0E8E400F0E8E400F0E6
      E200F0E6E200EDE6E100FEF5F1009A8E8800E9DED800DDD1CA00C2BFBB00FFFF
      FF007E7D790000000000000000000000000000000000A2A1A100FFFFFF00EEEE
      ED00E6E4E3007A787700FFFFFF00FFFFFF00EAEAE900EAEAE900EAEAE900EAEA
      E900EAEAE900EAEAE900EAEAE900EAEAE900FFFFFF00FFFFFF007A787700DCDC
      DC00E6E4E300FFFFFF00A4A39F00000000000000000000000000AAA9A500FFFF
      FF00ECDFE400C1788E00E8BBC700F0BACB00D2758F00F1F1F100EEEDEC00EEED
      EC00F1F1F100F1EEEE00F1EEEE00F1EEEE00FFFFFF00EEEDEC00FFFFFF00EEED
      EC00AAA9A500EEEDEC00FFFFFF00A5A5A500AAA9A500FFFFFF00EEEEED00AAA9
      A500EEEEED00F0EEEE00F0EEEE00FFFFFF00EEEEED00EEEEED00F2F1F200F0EE
      EE00F0EEEE00F0EEEE00F2F1F200D3879B00F0D0D800F0C5D200BF698000D0CE
      CD00F2F1F200A5A5A500000000000000000000000000A5A39800FFFFFF00FFFF
      FF00CCC5C300C5B9B200A0989600FFF9F200F2EDEA00F2EDEA00F2EDEA00F0E8
      E400F2EDEA00F0E8E400FEF5F100A5969000B9B7B400C7BBB400FFF9F200FFFF
      FF0084827E0000000000000000000000000000000000B6B6B600D1D0CC00FFFF
      FF00FFFFFF00807D7C00FFFFFF00FFFFFF00EEEEED00EEEEED00EEEEED00EEEE
      ED00EEEEED00EEEEED00EEEEED00EEEEED00FFFFFF00FFFFFF00807D7C00CBCB
      CB00FFFFFF00D6D6D600BBBAB700000000000000000000000000B1B0AC00F1EE
      EE00B1B0AC00ECDFE400DC93A800F0C8D300C8758C00D6D6D600D6D6D600D0CE
      CD00D0D0CE00D6D6D600D6D6D600D6D6D600D0CECD00D6D6D600EEEDEC00FFFF
      FF00DDDDDC00B7B4B000F1EEEE00AAA9A500B1B0AC00F0EEEE00B7B4B000DDDD
      DC00FFFFFF00FFFFFF00D0CECD00D6D6D600D6D6D600D0D0CE00D0D0CE00D6D6
      D600D6D6D600D6D6D600D6D6D600D27E9600EDCED500DD91A600D4C5CB00BFBC
      B900F0EEEE00AAA9A500000000000000000000000000ABA09B00FFFFFF00FFFF
      FF00FEF5F100FEF5F100A39D9900FFFFFF00FFEFE700F6F0ED00FEF5F100FFF0
      EA00F6F0ED00FFF0EA00FFF9F200A39D9900D5CAC800ECDCD600FFFFFF00FFFF
      FF0084827E000000000000000000000000000000000000000000BBBAB700B0AD
      AA00B0ADAA0086838200FFFFFF00FFFFFF00F1F1F000F1F1F000F1F1F000F1F1
      F000F1F1F000F1F1F000F1F1F000F1F1F000FFFFFF00FFFFFF0086838200B0AD
      AA00B0ADAA00C9C9C60000000000000000000000000000000000C6C6C200B1B0
      AC0095929000FFFFFF00FFFFFF00DC93A800DC819A00F1EEEE00F8F8F700FFFF
      FF00F8F8F700F1EEEE00F9F8F900F1EEEE00FFFFFF00F1F1F100FFFFFF00FFFF
      FF00FFFFFF0095929000B1B0AC00C6C6C200C6C6C200B1B0AC0095929000FFFF
      FF00FFFFFF00F0EEEE00FFFFFF00F0EEEE00FFFFFF00F2F1F200FFFFFF00EEEE
      ED00FFFFFF00EEEEED00F2F1F200D88DA100EAAABC00F2F1F200FFFFFF009592
      9000B1B0AC00C6C6C200000000000000000000000000AAA89C00FFFFFF00FFFF
      FF00FEF5F100FEF5F100ADA8A500FFEFE700F2EDEA00F9E8E100F0E6E200F9E8
      E100F9E8E100F0E6E200FFEFE700AAA7A400D2CBC800FFEFE700FFF9F200FFFF
      FF00868580000000000000000000000000000000000000000000000000000000
      0000000000008F8D8B00FFFFFF00FFFFFF00F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500FFFFFF00FFFFFF00898885000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009A989600FFFFFF00FFFFFF00FFFFFF00F1EEEE00FFFFFF00F8F8F700F8F8
      F700FFFFFF00F1F1F100FFFFFF00FFFFFF00F1F1F100FFFFFF00EEEDEC00FFFF
      FF00FFFFFF009A989600000000000000000000000000000000009A989600FFFF
      FF00FFFFFF00FFFFFF00F0EEEE00FFFFFF00FFFFFF00F2F1F200FFFFFF00F2F1
      F200FFFFFF00FFFFFF00F8F8F700FFFFFF00F0EEEE00FFFFFF00FFFFFF009A98
      96000000000000000000000000000000000000000000AAA89C00FFFFFF00FFFF
      FF00FFFFFF00FEF5F100B4AFAD00FFEFE700F9E8E100F9E8E100F9E8E100F9E8
      E100F9E8E100F9E6DE00FFEFE700ABA09B00CCC5C300D7C9C100CCC5C300CDCA
      CD00898882000000000000000000000000000000000000000000000000000000
      000000000000928F8D00FFFFFF00FFFFFF00F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500FFFFFF00FFFFFF00928F8D000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009D9A9900FFFFFF00FFFFFF00FFFFFF00F8F8F700FFFFFF00F1F1F100FFFF
      FF00FFFFFF00FFFFFF00F1F1F100FFFFFF00FFFFFF00F1F1F100FFFFFF00FFFF
      FF00FFFFFF009A989600000000000000000000000000000000009D9A9900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F2F1F200FFFFFF00F8F8F700FFFFFF00FFFF
      FF00F2F1F200FFFFFF00FFFFFF00F2F1F200FFFFFF00FFFFFF00FFFFFF009A98
      96000000000000000000000000000000000000000000ADA8A500FFFFFF00FFFF
      FF00FEF5F100FFFFFF00B9B7B400F6F0ED00F6F0ED00FFEFE700FEF5F100FFEF
      E700FFEFE700FFEFE700EDE6E100AAA7A400CABBB600C7BBB400B9B7B400A39D
      9900898882000000000000000000000000000000000000000000000000000000
      00000000000098979400FCEFE800FCEFE800FBE5DC00FBE5DC00FBE5DC00FBE5
      DC00FBE5DC00FBE5DC00FBE5DC00FBE5DC00FCEFE800FCEFE800989794000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009D9A9900FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3
      D600FAE3D6009D9A9900000000000000000000000000000000009D9A9900FAE3
      D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3D6009D9A
      99000000000000000000000000000000000000000000AAA89C00F6E2D400F6E2
      D400F7D6C700F7D6C700BDAFA700BDAFA700BFB3AB00BDAFA700BDAFA700BDAF
      A700BDAFA700B8ACA600BFA39600929189009895920099928E00929189009291
      8900B3ACAC000000000000000000000000000000000000000000000000000000
      0000000000009B9A9700FCEFE800FCEFE800FBE5DC00FBE5DC00FBE5DC00FBE5
      DC00FBE5DC00FBE5DC00FBE5DC00FBE5DC00FCEFE800FCEFE8009B9A97000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5A2A000FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3
      D600FAE3D600A5A2A00000000000000000000000000000000000A3A09E00FAE3
      D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3D600A3A0
      9E000000000000000000000000000000000000000000B0AEA000F6E2D400F7DF
      D000F7D6C700F7D6C700F7D6C700F7D7C900F7D6C700F7D6C700F7D6C700F7D6
      C700F7D6C700F9CAB900FBB59A00A0989600EDEDEC00EDEDEC00C5B9B200B1B0
      AD00000000000000000000000000000000000000000000000000000000000000
      000000000000A2A1A100FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800FCEF
      E800FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800A4A39F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5A5A500FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3
      D600FAE3D600A9A7A60000000000000000000000000000000000A5A5A500FAE3
      D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3D600A9A7
      A6000000000000000000000000000000000000000000B5ACA700F6E2D400F7DF
      D000F7D6C700F7D6C700F7D6C700F7D6C700F7D6C700F7D6C700F7D6C700F7D6
      C700F7D6C700F9CAB900FBB59A0099988F00FFF9F200C2BFBB00B1B0AD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ACA9A700FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800FCEF
      E800FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800ACA9A7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A9A7A600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600A9A7A60000000000000000000000000000000000A9A7A600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600A9A7
      A6000000000000000000000000000000000000000000AAA89C00F6E2D400F6E2
      D400F7DFD000F7DFD000F7DFD000F7DFD000F7DFD000F7DFD000F7DFD000F7DF
      D000F7DFD000F9CAB900E6B9AB00A5A39800CBCBBD00BAB6B100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AEADA900B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0AD
      AA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AAA9A500FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600AAA9A50000000000000000000000000000000000AAA9A500FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600AAA9
      A5000000000000000000000000000000000000000000B0AEA000F6E2D400F6E2
      D400F6E2D400F6E2D400F6E2D400F6E2D400F7DFD000F6E2D400F6E2D400F6E2
      D400F6E2D400EEC4B600C2A99A00A5A39800BAB6B10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B1B0AC00B1B0AC00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AF
      AB00B0AFAB00B0AFAB00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0
      AC00B1B0AC00B1B0AC0000000000000000000000000000000000B1B0AC00B1B0
      AC00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AF
      AB00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0
      AC000000000000000000000000000000000000000000B5ACA700B0AEA000B5AC
      A700AAA89C00B0AEA000B5ACA700ADA8A500B0AEA000ADA8A500ADA8A500AAA8
      9C00AAA89C00AAA89C00ABA09B00C4C0B8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5E5E500D8D7D700D8D7D700D8D7
      D700D8D7D700D8D7D700D8D7D700D8D7D700D8D7D700D8D7D700D8D7D700D8D7
      D700D8D7D700E5E5E50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00EDEDED00C7612E00EDEDED0000000000000000000000
      00000000000000000000000000000000000000000000A5A5A5006C6B6B006C6B
      6B006C6B6B006C6B6B006C6B6B006C6B6B0064646400C8C7CB00535E89005757
      57005A5959005A5959006464640064646400A8A9B90047538100B8B7BC005757
      57005A595900646464009E9E9E00000000000000000000000000000000000000
      000000000000000000000000000000000000D8D7D700BEBEBE00BEBEBE00BEBE
      BE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBE
      BE00C1C1C000D0D0D000F5F4F400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CDD6DB00718F9F006E8D
      9E00B8C5CC000000000000000000000000000000000000000000000000000000
      0000D9D9D900C6C6C600D4D4D400C6C6C600D4D4D40000000000D9D9D900C6C6
      C600C6C6C600C9C9C900D4D4D400CC683700BE744F00ADA7A500000000000000
      000000000000000000000000000000000000000000006C6B6B00A9A7A600908F
      8F00EDEDED00FFFFFF00F3F3F300E1E1E100DAD9DD00415088001E458A003A49
      8100B8B7BC00A5A5A500B0B0B000C3C3D0002C3C7C001E4A91003A498100B6B5
      BA006C6B6B00807F7E0064646400000000000000000000000000000000000000
      0000000000000000000000000000ECECEC0081817D0081817D00807F7B007E7D
      7A007C7B78007C7B780074737200747372007473720071706E006E6D6C006E6D
      6C006E6D6C006E6D6C00ECECEC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3CDD3005A849B004494B8004494
      B8004385A700C3CDD30000000000000000000000000000000000000000000000
      0000CD6C3B00CD6C3B00CD6C3B00CD6C3B00CD6C3B0000000000CD6C3B00CD6C
      3B00CD6C3B00CD6C3B00CD6C3B00CD6C3B00E1926B00C6724600A6948A000000
      0000000000000000000000000000000000000000000074727100FFFFFF00D0CE
      CD0089888500EDEDED00EDEDED00DAD9DD00415088001E59A5001E9BEA001D71
      BE003A498100CACACC009E9E9E002C3C7C001D72C2001E9BEA001D57A200303E
      7600C0C0C300A5A5A50064646400000000000000000000000000000000000000
      0000000000000000000000000000E5E5E50081817D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006E6D6C00ECECEC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C3CDD3005A849B00479ABE0048AEDB0050B6
      E10045A1CA00448DB200D5DEE300F1F1F1000000000000000000000000000000
      0000CD6C3B00F7BA9C00F7BA9C00F7BA9C00CD6C3B0000000000CD6C3B00F7BA
      9C00F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA9C00EAA17E00D1734300AE8A
      780000000000000000000000000000000000000000007A777600FFFFFF00FFFF
      FF00D0CECD0093908F00DAD9DD00475795001E59A5001E8FE4001D6DCF001E8F
      E4001D71BE003748840026397E001D71BE001E89E0001D6DCF001585DA001D57
      A2003A498100B6B5BA0062616000000000000000000000000000ECECEC00ECEC
      EC00ECECEC00ECECEC00DEDDDD00CECECD008C8C8500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006E6D6C00ECECEC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C3CDD3005A849B00479ABE0048AEDB003FA4D40050B6
      E10067CEF1003897C70081ACC200F1F1F1000000000000000000000000000000
      0000D6794900F7BA9C00F0A78000F7BA9C00D679490000000000D6794900F7BA
      9C00F7BA9C00F0A78000F0A78000F0A78000F0A78000F0A78000F0A78000D87D
      4E00C7A4930000000000000000000000000000000000807F7E00FFFFFF00FFFF
      FF00EDEDED00DAD9DD0059659B0028529D003AA8ED001D71D2001D6ED1001D6E
      D1001E90E5001D71BE001D71BE001E8FE4001D6DCF001565C7001D6DCF0036A3
      E800264F9A0047579500696767000000000000000000E5E5E500D8D7D700D8D7
      D700D8D7D700D8D7D700CECECD00C1C1C000918F8900FFFFFF00FFFFFF00ECEC
      EC00EAE9E900EAE9E900EAE9E900EAE9E900EAE9E900EAE9E900EAE9E900FFFF
      FF00FFFFFF0074737200ECECEC00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E5E4
      E40000000000C3CDD3005A849B00479ABE0048AEDB003FA4D40050B6E10063C9
      EE006DD4F600379BCC008BB6CE00F1F1F1000000000000000000000000000000
      0000E38C5D00FADACA00FADACA00FADACA00E38C5D0000000000E38C5D00FADA
      CA00FADACA00FADACA00FADACA00FADACA00F8D0BB00F3C8B100E5916400DCBC
      AB00000000000000000000000000000000000000000088878400FFFFFF00FFFF
      FF00F0F0ED00F0F0ED00D2D5E1002A3F8A00327AC1001E89E0001D71D2001D71
      D2001D71D2001E90E5001E8FE4001D6DCF001565C7001D6DCF00218ADD00327A
      C1002B408B00A8A9B900807F7E0000000000000000008F8D8D008F8D8D008786
      86008F8D8D0087868600878686007E7D7A0095948C00FFFFFF00FFFFFF00ECEC
      EC00EAE9E900ECECEC00EAE9E900ECECEC00EAE9E900ECECEC00EAE9E900FFFF
      FF00FFFFFF0072707000ECECEC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C3CDD3005A8093004F6C7C006185950045A1CA0050B6E10063C9EE006DD4
      F60044A9D6006BA9CA00BCCCD500000000000000000000000000000000000000
      0000E48E6100E48E6100E48E6100E48E6100E48E610000000000E48E6100E48E
      6100E48E6100E48E6100E48E6100E48E6100F1BCA000E1926B00E1D1C8000000
      0000000000000000000000000000000000000000000089888500FFFFFF00FFFF
      FF00F0F0ED00F0F0ED00EDEDED00D1D3E0002B408B001B70C2001788DC001D71
      D2001772D0001772D0001772D0001772D0001D6ED1001E8FE4001D72C200273C
      8800A8A9B900D5D5D50082827F0000000000000000008F8D8D00ECECEC00ECEC
      EC00ECECEC00ECECEC00E5E5E500D8D7D70099988E00FFFFFF00FFFFFF00ECEC
      EC00D8D7D700D4D3D100D8D7D700D4D3D100F1EFEE00F1EFEE00ECECEC00FFFF
      FF00FFFFFF0074737200ECECEC00000000000000000000000000000000000000
      0000000000009694940074747400747474007474740074747400747474007474
      7400838282005165700096949400A1A0A00073848B0065C3E7006DD4F60044A9
      D6006BA9CA00BCCCD50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E5916400E1A28000CED3D700000000000000
      000000000000000000000000000000000000000000008F8E8B00FFFFFF00FFFF
      FF00F8F8F700F8F8F700EDEDED00C8C8C800B3B5C800273C88001B70C2001E8F
      E4001D71D2001B76D4001D71D2001772D0001E89E0001D72C2002A3F8A009699
      AA00A8A8A800D5D5D5008887840000000000000000008F8D8D00ECECEC00ECEC
      EC00ECECEC00ECECEC00E5E5E500D8D7D7009C9A9100FFFFFF00FFFFFF00F1EF
      EE00F1EFEE00F1EFEE00F1EFEE00F1EFEE00F1EFEE00F1EFEE00F1EFEE00FFFF
      FF00FFFFFF007E7D7A00ECECEC0000000000000000000000000000000000BDBC
      BC00747474008C8A8800C2C2C200E9E9E900E9E9E900E9E9E900E9E9E900C2C2
      C2008C8A880074747400C2C2C200E9E9E900ABAAAA007FA3AF0044A9D6006BA9
      CA00BCCCD5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E4E7E900C2D0D800EB996D0091BFD40076B2CE00000000000000
      0000000000000000000000000000000000000000000095929000FFFFFF00FFFF
      FF00F8F8F700F8F8F700CACACC0088878400B3B5C800283D91001D72C2001E8F
      E4001788DC001788DC001A7FD9001788DC001592E1001B70C200384D9700A9A9
      B200A5A5A500B0B0B000828282000000000000000000908F8F00ECECEC00ECEC
      EC00DEDDDD00DEDDDD00DEDDDD00C1C1C000A5A39800FFFFFF00FFFFFF00F5F4
      F400D8D7D700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600F5F4F400FFFF
      FF00FFFFFF007E7D7A00ECECEC00000000000000000000000000C2C2C2007474
      7400B6B5B500E5E4E400C7C5C200B6B5B500B0AEAA00B0AEAA00B7B6B300C7C5
      C200E5E4E400B6B5B50074747400CACACA00ABAAAA00648DA3006BA9CA00BCCC
      D500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099B5C500458BAD007BBAD50066B2D4009DCCE1004AAAD0004B9A
      C20000000000000000000000000000000000000000009A989600FFFFFF00FFFF
      FF00FFFFFF00D5D5D50093908F00C7C9D800294094001D72C2001E8FE4001788
      DC001C81DB001E89E000218ADD001788DC001788DC001592E1001B70C200384D
      9700B6B5BA00A5A5A500807F7E000000000000000000908F8F00ECECEC00ECEC
      EC00DEDDDD00DEDDDD00DEDDDD00CECECD00A5A39800FFFFFF00FFFFFF00F5F4
      F400F5F4F400F5F4F400F5F4F400F5F4F400F5F4F400F5F4F400F5F4F400FFFF
      FF00FFFFFF0081817D00ECECEC000000000000000000000000007E7C7B00B6B5
      B500E0DFDF00B0AEAA00D5CBC300F7E6DE00FCEBE300FCEBE300F7E6DE00D5CB
      C300B0AEAA00E0DFDF00B6B5B5007E7C7B006185950069A4C300BCCCD5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000093B0BF004174900040789200368DB60043A4CD0055B4D700509CC200A4BF
      CF000000000000000000000000000000000000000000A09D9B00FFFFFF00FFFF
      FF00EDEDED00AAA9A500D9DBE6002A419C002877C8001E90E5001E8FE4001788
      DC001C81DB0074B5E40074B5E400238DDF001D87DE001E8FE4001592E1002A79
      CA00394E9800C0C0C300747271000000000000000000908F8F00ECECEC00ECEC
      EC00E5E5E500CECECD00CECECD00BEBEBE00A5A39800FFFFFF00FFFFFF00F5F4
      F400DEDDDD00DBDBD900DEDDDD00DBDBD900DEDDDD00DEDDDD00F5F4F400FFFF
      FF00FFFFFF0087868600EAE9E90000000000E9E9E900C2C2C20096949400E5E4
      E400ADAAA700EBD7CC00FAE2D600FAE2D600FADED000FAD9C900F8D4C100FAD9
      C900EBD7CC00ABAAAA00E5E4E4009694940096949400BCCCD500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A47D7D007C7C7C008383830083838300838383009161
      6100526D890052798F00A9888800688C9D0056A9C7004AAAD000A7C2D0000000
      00000000000000000000000000000000000000000000AAA9A500FFFFFF00EDED
      ED00AAA9A500EDEDED007686C3004162B50094CAEC00329CE5001E8FE4002495
      E40087C1E5006890CB006890CB0081BDE6002495E4001E8FE400329CE50089BF
      E1003253A9005A6AA8008282820000000000000000009C9B9900ECECEC00ECEC
      EC00E0DFDE00E0DFDE00DEDDDD00C8C8C700ABA99D00FFFFFF00FFFFFF00F8F8
      F700F5F4F400F8F8F700F5F4F400F8F8F700ECECEC00E5E5E500E5E5E500ECEC
      EC00E5E5E5008C8C8500ECECEC0000000000E9E9E9008C8A8800CACACA00BDBC
      BC00CFBEB200FAD9C900FAE2D600F8D4C100F8CAB100F8C7AD00F5C2A900F8C2
      A600F8D1BC00CFBEB200C0BDBB00CACACA008C8A8800E5E4E400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C4C4AC009A6F6F00AC9B8900BBBBA400C2B9AE00C2B4AD00C4C4AC00BAAD
      A000A98484009B717100ADADAD00B19191005390AA00509CC200000000000000
      00000000000000000000000000000000000000000000B1B0AC00F1EFEE00B0B0
      B000DDDDDC00FFFFFF00ECECF100485EB1005072BB009CC9E70044A6E50087C1
      E5006890CB002A419C002942A2006F94CC008AC2E70048A9E8009ECBE9004C6E
      B800384D9700BCBBC5009E9E9E0000000000000000009C9B9900ECECEC00ECEC
      EC00E5E5E500D0D0CF00CECECD00BEBEBE00ABA99D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F8F8F700FFFFFF00F5F4F400ECECEC00CECECD00C1C1C000C8C7
      C700C8C8C700908E8700ECECEC0000000000E9E9E9008C8A8800E9E9E900A1A0
      A000F2CEB900FAD9C900F8CAB100F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA
      9C00F5BDA100F2CEB900A1A0A000F1F1F10083828200E9E9E900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009F8A7400B89D9D00BAADA000C4B3A400CBBAAE00CBBAAE00CBBAAE00C4B3
      A400BAADA000B19191009B71710060889E005391B200A7C2D000000000000000
      00000000000000000000000000000000000000000000C7C7C500B1B0AC009592
      9000FFFFFF00FFFFFF00EDEDED00E7E5E9004E66BE005878C300B4D8EC00799B
      D0002942A200B5B8C900C3C3D0003751B300799BD000B4D8EC005574C0003E55
      AA00B6B5BA009E9E9E00BDBDB90000000000000000009C9B9900ECECEC00ECEC
      EC00E5E5E500E5E5E500E0DFDE00CECECD00B0AEA100FCEFE800FCEFE800F8E1
      D800F8E1D800F8E1D800F8E1D800F8E1D800E7D4CC009C9A91009C9A91009998
      8E0095948C0095948C00F5F4F40000000000E9E9E9008C8A8800ECECEC00A39E
      9A00F5C8AF00F8CAB100F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA
      9C00F7BA9C00F5C8AF00A39E9A00F1F1F1008C8A8800E9E9E900000000000000
      0000000000000000000000000000000000000000000000000000D9D9D900BAAD
      A000B1919100BAADA000CAB2A500DAC5BA00DAC5BA00DFC4B700DEC0B000D9BF
      B000C5AFA100BDB5A600AC9B89006981990099B5C50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009A98
      9600FFFFFF00FFFFFF00FFFFFF00EDEDED00E7E5E9004E66BE004C6EB8002F49
      AB00B3B5C800D9DBE600EDEDED00D2D5E1003751B3004E66BE00475FB700D0D0
      D3008F8E8B00000000000000000000000000000000009C9B9900ECECEC00ECEC
      EC00E5E5E500D8D7D700CECECD00C1C1C000B0AEA100FCEFE800FCEFE800F8E1
      D800FCEFE800F8E1D800FBE5DC00F8E1D800E7D4CC00A5A39800ECECEC00ECEC
      EC00BDBCBA00B8B6B3000000000000000000E9E9E900918E8C00E9E9E9009A98
      9500F4C0A300F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA
      9C00F8D1BC00F5BDA1009F9A9600F1F1F100918E8C00E9E9E900000000000000
      0000000000000000000000000000000000000000000000000000D4C6C600A3A3
      7B00BABAA100C7A49300D9BFB000DEC0B000DDB5A100DCAE9600DCAE9600DBA9
      8F00D6B29E00BDA69400BBBBA4009F8A7400D9D9D90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009E9E
      9E00FFFFFF00FFFFFF00FFFFFF00F8F8F700F3F3F300ECECF100697DC900D2D5
      E100E1E1E100F1EFEE00F3F3F300FFFFFF00D4D8EA00697DC900EDEDED00E7E5
      E9009592900000000000000000000000000000000000A3A19F00ECECEC00ECEC
      EC00E5E5E500E5E5E500E5E5E500D8D7D700ABA99D00FCEFE800FCEFE800FCEF
      E800FCEFE800FCEFE800FCEFE800FCEFE800E5D9D400A5A39800F8F8F700C8C7
      C700BAB8B500F5F4F4000000000000000000F1F1F10096949400E9E9E9009A98
      9500ECB49700F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA9C00F8D4
      C100F7E6DE00ECB497009A989500FBFBFB0093928F0000000000000000000000
      0000000000000000000000000000000000000000000000000000D2D2C500A99E
      8600BAB2A000C7A49300DDB9A600DCAE9600DCA38700DCA38700DCA38700DBA9
      8F00DBA98F00C2A18E00C2B9AE009F827400D9D9D90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009A98
      9600FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D6009E9E9E0000000000000000000000000000000000A3A19F00ECECEC00ECEC
      EC00ECECEC00EAE9E900E5E5E500D8D7D700ABA99D00FCEFE800FCEFE800FCEF
      E800FCEFE800FCEFE800FCEFE800F4E6E100E5D9D400ABA99D00C8C8C700BEBE
      BE00F1EFEE00000000000000000000000000F1F1F100A1A0A000D6D6D500B0AE
      AA00C09F8C00F2B49400F8C7AD00F8CAB100F8CAB100F8D4C100F7E6DE00FDF1
      EC00F5C2A900C09F8C00B7B6B300D9D9D900A1A0A00000000000000000000000
      0000000000000000000000000000000000000000000000000000D2D2C500A9A9
      8700BAADA000C89F8800DCAA9100DCA38700DCA38700DBA98F00DCA38700DCA3
      8700DCAE9600C2998500C2B9AE00A3887A00E5DEDE0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A3A0
      9E00FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D600A09D9B0000000000000000000000000000000000A3A19F00EAE2DD00EAE2
      DD00E5D9D400E7D9D200E7D9D200E1D2CD00B0AEA100B0AEA100B0AEA100B0AE
      A100B0AEA100B0AEA100B0AEA100AEADA000ABA99D00ABA99D00C1C0BE00F1EF
      EE000000000000000000000000000000000000000000E9E9E900B0AEAA00E5E4
      E40096949400DCA28200F2B49400FAD9C900FCEBE300FDF1EC00FCEBE300F5BD
      A100DCA2820096949400E9E9E900B0AEAA00F1F1F10000000000000000000000
      0000000000000000000000000000000000000000000000000000D4D4D400ACA1
      8A00B5AD9600C4977E00DCA38700DBA98F00DCA38700DCA38700DCA38700DDB3
      9E00DCBCAB00BE937B00C2B9AE00A6997F000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A5A5
      A500FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D600AAA9A50000000000000000000000000000000000AAA9A700EAE2DD00EAE2
      DD00E7D9D200E7D9D200E7D9D200E5D9D400E7D4CC00D8CBC600AAA9A700DEDD
      DD00E5E5E500C1C1C000C1C1C000ECECEC00ECECEC0000000000000000000000
      00000000000000000000000000000000000000000000F5F5F500ABAAAA00D2D0
      CF00E5E4E400918E8C00BA937E00E79D7600ED9F7500ED9F7500E79D7600BA93
      7E00918E8C00E5E4E400D2D2D100ABAAAA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D9D9D900B1A1
      9100BABAA100B4907900D39B7E00DCAE9600DDB39E00DDB5A100DEC0B000DFCB
      C200D0A38B00B5927F00C2B4AD00AFAF8F000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A9A7
      A600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600A9A7A60000000000000000000000000000000000AAA9A700EAE2DD00EAE2
      DD00EAE2DD00F0E8E300EAE2DD00EAE2DD00E0DFDE00DBDBD900B8B6B300ECEC
      EC00C8C7C700CECECD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E9E9E900ADAA
      A700D2D2D100E9E9E900B6B5B5008C8A880083828200838282008C8A8800B0AE
      AA00E9E9E900D9D9D900ADAAA700F1F1F1000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CBCB
      BC00BAADA000B29D9200BA896D00D39B7E00DDB5A100DEC0B000D9BFB000CE9E
      8300B6897000BAADA000BAADA000D9D9D9000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AAA9
      A500FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600AAA9A50000000000000000000000000000000000B8B6B300F0E8E300F0E8
      E300F0E8E300EAE9E900F0E8E300F0E8E300EAE2DD00E5D9D400BAB8B500D0D0
      CF00D0D0CF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1F1
      F100B6B5B500C0BDBB00E0DFDF00FBFBFB00FBFBFB00FBFBFB00FBFBFB00E5E4
      E400C0BDBB00B0AEAA00F1F1F100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E5DE
      DE00BDB5A600C2B9AE00B5AD9600B2867000B57F6100B57F5F00B57F6100B689
      7000BAADA000C2B9AE00C0B8A800000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B1B0
      AC00B1B0AC00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AF
      AB00B0AFAB00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0
      AC00B1B0AC0000000000000000000000000000000000BEBEBE00BAB8B500BAB8
      B500BAB8B500BAB8B500BAB8B500BAB8B500B8B6B300BEBEBE00C1C0BE00D8D7
      D700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1F1F100E9E9E900C0BDBB00B0AEAA00B0AEAA00B0AEAA00B0AEAA00B6B5
      B500F1F1F1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D9D9D900BDB5A600C2B4AD00C2AFAF00C4C4AC00C2C2AD00C2B9AE00C2B9
      AE00BDB5A600C4C4AC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6D6CA00B5A79800B5AD9600B5AD9600B5AD9600BDB5
      A600D9D9D9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C9DAC9004992490049924900499249004992490049924900499249004992
      490049924900499249004992490073A372000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A8C2D8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A5006C6B6B006C6B
      6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B
      6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B
      6B006C6B6B006C6B6B00A5A5A5000000000000000000A5A5A5006C6B6B006C6B
      6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B
      6B009C9C9A00427E41002F863C0044B1670044B1670044B1670044B1670044B1
      670044B1670044B1670052C177004992490000000000A5A5A5006C6B6B006C6B
      6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B008482
      81008F9EA80055728F003554700030506D00304F6C0030506D0030506D004967
      820072818F0085817C0065839F006F8FAC0000000000A5A5A5006C6B6A006C6B
      6A006C6B6A006C6B6A006C6B6A006C6B6A006C6B6A006C6B6A00906B46008763
      3F007C5833007C5833006F4F2F006F4F2F006F4F2F006F4F2F0060442A00705A
      4400575757005B5A5A009696960000000000000000006C6B6B00A9A7A600908F
      8F00EEEEED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EEEE
      ED00908F8F00A9A7A6006C6B6B0000000000000000006C6B6B00A9A7A600908F
      8F00EEEDEC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2F2F1006FAA6E005FB46C0072DA93006AC2720066BD6D0066BD
      6D004A9E4E0052A6530042B167004F9A4F00000000006C6B6B00A9A7A600908F
      8F00EDEDED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5CD
      E00089A7C80087A1D1008AA3D4008A9FE100899AE900899AE9008296E500758D
      CA00456388005776930036557B007392B100000000006C6B6A00A9A7A600908F
      8F00EDEDED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5906A00CEA4
      7A00C49C7200C1976E00BB916700BB916700B3896000AE845A00A77D53007F5D
      3C00735D47007C7A79005B5A5A00000000000000000074727100FFFFFF00D0CE
      CD0089888500EEEEED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EEEEED008988
      8500D0CECD00FFFFFF0074727100000000000000000074727100FFFFFF00D0CE
      CD0089888500EEEDEC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F2F2F10071AE710062B76E006BD88E0066BD6D004A9E
      4E005DB464006AC2720042B167004F9A4F000000000074727100FFFFFF00D0CE
      CD0089888500EDEDED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9DAE8009EB9
      D900AFBCE700BECCE500BDD1E3009EB9D90082A3C600829DD4008A9FE1005062
      B4006E80CF007C96CE004658A7007392B1000000000075727100FFFFFF00D0CE
      CD0089888500EDEDED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B99A7900D2A8
      7E00CEA47A00C49C7200C2986F00BC936900B3896000B3896000AE845A009F75
      4A00906B4600876544006C6B6A0000000000000000007A777600FFFFFF00FFFF
      FF00D0CECD0095929000DDDDDC00FFFFFF00F8F8F700F0F0ED00EEEEED00EEEE
      ED00EEEEED00EEEEED00F0F0ED00F8F8F700FFFFFF00DDDDDC0095929000D0CE
      CD00FFFFFF00FFFFFF007A77760000000000000000007A777600FFFFFF00FFFF
      FF00D0CECD0095929000DCDCDC00FFFFFF00F8F8F700F0F0ED00EEEDEC00EEED
      EC00EEEDEC00EEEDEC00F0EFED00C1D6BF005DB4640062CD82004DA757005EB8
      68006AC272006BC6760048B56B0052A65300000000007A777600FFFFFF00FFFF
      FF00D0CECD0095929000DDDDDC00FFFFFF00F8F8F600EFF0ED00A8C2D800CAD0
      E800EDEDED00EDEDED00F1F0ED00F8F8F600F0F4F7008DAECA00507096008192
      D500829AE2008296E5004A5BAD00799DBE00000000007A777600FFFFFF00FFFF
      FF00D0CECD0096969600DCDBDA00FFFFFF00F8F8F700F0F0ED00C3A58900D8AE
      8400D1A67C00CEA47A00C49C7200C49C7200C49C7200B78F6800A87D53009974
      4E009C775300E1E1E1007A77760000000000000000007F7C7C00FFFFFF00FFFF
      FF00EEEEED00DDDDDC009D9A9900DDDDDC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDDDDC009A989600DDDDDC00EEEE
      ED00FFFFFF00FFFFFF007F7C7C0000000000000000007F7C7C00FFFFFF00FFFF
      FF00EEEDEC00DCDCDC009C9C9A00DCDCDC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007EB77D005ABD71004FB3670062C071006AC2
      720067CC7F0067CC7F0048B56B0058A65800000000007F7C7C00FFFFFF00FFFF
      FF00EDEDED00DDDDDC009D9A9900DDDDDC00FFFFFF00FFFFFF00D7DEEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDDDDC00B0AEAA0098B5CF007C96
      CE00829AE200829AE2004C5DB000799DBE00000000007C7A7900FFFFFF00FFFF
      FF00EDEDED00DCDBDA009C9A9800DCDBDA00FFFFFF00FFFFFF00C7AA8D00C8AF
      9500C3A58900BEA08300B99A7900B4927000B08E6C00A47F5900A47F5900B590
      6A00E1E1E100F0EEED007C7A7900000000000000000089888500FFFFFF00FFFF
      FF00F0F0ED00F0F0ED00E6E5E400B0AFAB00C6C6C200F1EFEE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1EFEE00C6C6C200B0AFAB00E6E5E400F0F0ED00F0F0
      ED00FFFFFF00FFFFFF0089888500000000000000000089888500FFFFFF00FFFF
      FF00F0F0ED00F0F0ED00E5E6E400B0AFAB00C6C6C200F0EFED00FFFFFF00FFFF
      FF00FFFFFF00F2F2F100B0C6AE004DA7570052C1770064C6790067C97C0067C9
      7C0070D58C006BCF83004FBA6F005BAA5B000000000089888500FFFFFF00FFFF
      FF00F1F0ED00F1F0ED00E6E5E400B0AEAA00C6C6C200F0EEED00FFFFFF00F0EE
      ED00F1F0ED00F1F0ED00E9E5DE00C9C8C000B1B0AC00E6E5E4007BA0C2007993
      D3008396E800829AE2005062B4007BA0C2000000000089888500FFFFFF00FFFF
      FF00F0F0ED00F0F0ED00E1E1E100B1B0AC00C5C5C200F0F0ED00FFFFFF00F6F6
      F600EDEDED00E1E1E100D0CECD00ABABA8009A989600C5C5C200CDCDCA00CDCD
      CA00DCDBDA00E1E1E10081807D00000000000000000089888500FFFFFF00FFFF
      FF00F1EFEE00F1EFEE00F1EFEE00F2F2F100C6C6C200AAA9A500ADACA800AAA9
      A500ADACA800ADACA800AAA9A500C3C2BF00EEEEED00F1EFEE00F1EFEE00F1EF
      EE00FFFFFF00FFFFFF0089888500000000000000000089888500FFFFFF00FFFF
      FF00F0EFED00F0EFED00F0EFED00F2F2F100CED2CB00B0C6AE00BAC5B700BCBD
      B800BBC4B9007EAB7C004A9E4E005AC67B0062CD820067CC7F006BCF830092DF
      AA00A0DAAB008BE2A7004FBA6F005BAA5B000000000089888500FFFFFF00FFFF
      FF00F0EEED00F0EEED00F0EEED00EDEDED006988A30049678200496782004A68
      83004A6883004A6883004A688300C8C3B800EBE9E50088AED000A4BAE000CAD0
      E800D0D7F600D0D7F6009DA4C2007EA6CC000000000089888500FFFFFF00FFFF
      FF00F0EEED00F0F0ED00F6F6F600F0F0ED00C5C5C200A9A8A500A9A8A500A3A0
      9E009C9A98008988850081807D008E8D8B00A5A5A500A9A8A500ABABA800A9A7
      A600B1B1B100B1B1B1007572710000000000000000008F8E8B00FFFFFF00FFFF
      FF00F8F8F700F8F8F700F1EFEE00D6D6D60095929000C6C6C200D6D6D600D6D6
      D600D6D6D600D6D6D600C3C2BF009A989600D0D0CE00F8F8F700F8F8F700F1EF
      EE00FFFFFF00FFFFFF008F8E8B0000000000000000008F8E8B00FFFFFF00FFFF
      FF00F8F8F700F8F8F700F0EFED00D6D6D6009C9C9A00BBCFB900A2C7A2008EBF
      900074B7790062C071005AC67B004FBA6F0064C679008FE0A800B0E5BE0078BD
      7A0061B2610089CA8E0071C38B0061B26100000000008F8E8B00FFFFFF00FFFF
      FF00F8F8F600F8F8F600F0EEED00DEDCD70044627E006A7DCE007184D6007184
      D6007486D8006C85BE0066849F00A9A69F00D3D2CF007EA6CC007EA6CC007EA6
      CC0081A9CF0088AED00051789D008EB5D800000000008E8D8B00FFFFFF00FFFF
      FF00F8F8F700F8F8F700F0EEED00D6D6D60096969600C5C5C200CDCDCA00C5C5
      C200B99A7E00916D4900845F3A00795736007F5D3C007F5D3C0077583A007758
      3A006C5136006C51360075727100000000000000000095929000FFFFFF00FFFF
      FF00F8F8F700F8F8F700D6D6D60095929000D0CECD00DDDDDC00E6E5E400E2E2
      E100E2E2E100E2E2E100E2E2E100D0CECD0095929000D6D6D600F8F8F700FFFF
      FF00FFFFFF00FFFFFF00908F8F00000000000000000095929000FFFFFF00FFFF
      FF00F8F8F700F8F8F700D6D6D60095929000D0CECD00E0E1DE00B1D1B0009FCE
      A3009FDAAF008ADAA40092DFAA00A3DDB5008EBF900083C288006BB66A00B0C6
      AE00E5E6E4007FC07F0071AE710061B261000000000095929000FFFFFF00FFFF
      FF00F8F8F600F8F8F600D6D6D600B1B0AC0065839F007486D800789CC9007890
      D5007C96CE006F8FAC00BED4D400D0CECD0095929000DEDCD700F0F4F700FFFF
      FF00FFFFFF00F0F4F700A7B3BC00000000000000000096969600FFFFFF00FFFF
      FF00F8F8F700F8F8F700D6D6D60095929000D0CECD00DCDBDA00DCDBDA00BB9D
      8100A9845F00CAA17700D2A87E00CEA47A00C2986F00C49C7200C49C7200C197
      6E00BC93690077583A006C6B6A0000000000000000009A989600FFFFFF00FFFF
      FF00FFFFFF00D6D6D6009D9A9900D6D6D600EEEEED00F1EFEE00F1EFEE00F1EF
      EE00F1EFEE00F1EFEE00F1EFEE00F0F0ED00D6D6D6009C9B9700D6D6D600F8F8
      F700FFFFFF00FFFFFF009A98960000000000000000009A989600FFFFFF00FFFF
      FF00FFFFFF00D6D6D6009C9C9A00D6D6D600EEEDEC00F0EFED00EEEDEC00C3DB
      C20088C487006BB66A0061B2610061B261007DB97C009EBB9C00D9DAD800F5F4
      F400FFFFFF00FFFFFF0089A9870068BA6800000000009A989600FFFFFF00FFFF
      FF00FFFFFF00D6D6D6009D9A9900E1DFDC006F91B1007D8FE1007C98D6007B91
      DC007490C2008DAECA00DBD4C700E1E1D300D6D6D6009A989600D6D6D600F0F4
      F700FFFFFF00CAD0E800A7B3BC0000000000000000009A989600FFFFFF00FFFF
      FF00FFFFFF00D6D6D6009C9A9800D6D6D600EDEDED00F0F0ED00C7AE9400A47F
      5900DAB08500E0B68C00DAB08500D5AB8200D1A67C00C49C7200C49C7200C49C
      7200BC93690082603F007A7776000000000000000000A09D9B00FFFFFF00FFFF
      FF00EEEEED00AAA9A500DDDDDC00D0D0CE00D0D0CE00D0D0CE00D6D6D600D0D0
      CE00D6D6D600D0D0CE00D6D6D600F0F0ED00F1EFEE00DDDDDC00AAA9A500EEEE
      ED00FFFFFF00FFFFFF00A09D9B000000000000000000A09D9B00FFFFFF00FFFF
      FF00EEEDEC00AAA9A500DCDCDC00D0D0CE00D0D0CE00D0D0CE00D6D6D600D6D6
      D600DCDCDC00D8D7D600DCDCDC00F2F2F100F2F2F100E0E1DE00AAA9A500EEED
      EC00FFFFFF00FFFFFF00B4B1B0000000000000000000A09D9B00FFFFFF00FFFF
      FF00EDEDED00AAA9A500DDDDDC00DDDDDC006488A8007184D6008E9EDB006E83
      D1007184D6006687B000799DBE00B0C4D300DFDACD00DEDCD700AAA9A500E6E5
      E400B4C2E600ADC5DF00ACB7BE000000000000000000A09D9B00FFFFFF00FFFF
      FF00EDEDED00A9A8A500DCDBDA00D0D0CE00D0D0CE00D0D0CE00D6D6D600CDB6
      9E00BEA08300DAB08500E0B68C00DEB48A00DAB08500D2A87E00C89E7400CEA4
      7A00C89E7400916D4900838180000000000000000000AAA9A500FFFFFF00EEEE
      ED00AAA9A500EEEEED00F1EFEE00F1EFEE00F9F9F900F1EFEE00F1EFEE00F8F8
      F700F1EFEE00F1EFEE00F1EFEE00F9F9F900F1EFEE00F9F9F900EEEEED00AAA9
      A500EEEEED00FFFFFF00A5A5A5000000000000000000AAA9A500FFFFFF00EEED
      EC00AAA9A500EEEDEC00F0EFED00F0EFED00FFFFFF00EEEDEC00F0EFED00F8F8
      F700F0EFED00F0EFED00F0F0ED00FFFFFF00EEEDEC00F9F9F900EEEDEC00AAA9
      A500EEEDEC00FFFFFF00A5A5A5000000000000000000AAA9A500FFFFFF00EDED
      ED00AAA9A500EDEDED00F0EEED00F1F0ED007BA0C200B1BDE90097B1DA00C0C9
      F0009AA7E6008293E2007C96CE00789CC900799DBE0094B5D30090AFCF007187
      B70094B5D300B5CDE000ADADAB000000000000000000A9A8A500FFFFFF00EDED
      ED00A9A8A500EDEDED00F0F0ED00F0EEED00FFFFFF00EDEDED00EDEDED00F6F6
      F600DCC7B300C3A58900B99A7900B99A7900B4927000B4927000B08E6C00A77D
      5300A9845F00A47F59009C9A98000000000000000000B1B0AC00F1EFEE00B7B4
      B000DDDDDC00FFFFFF00FFFFFF00D0D0CE00D6D6D600D6D6D600D0D0CE00D0D0
      CE00D6D6D600D6D6D600D6D6D600D0D0CE00D6D6D600F1EFEE00FFFFFF00DDDD
      DC00B7B4B000F1EFEE00AAA9A5000000000000000000B1B0AC00F0EFED00B4B1
      B000DCDCDC00FFFFFF00FFFFFF00D0CECD00D6D6D600D6D6D600D0D0CE00D0D0
      CE00D6D6D600D6D6D600D6D6D600D0CECD00D6D6D600F0EFED00FFFFFF00DCDC
      DC00B4B1B000F0F0ED00AAA9A5000000000000000000B1B0AC00F0EEED00B7B4
      B000DDDDDC00FFFFFF00FFFFFF00DEDCD7006F91B100799DC3007296BA007296
      BA00A2B7D800C3CBE400CACFE600CACFE600B9C3E00099B3DB0088AED000789C
      C9008FA8BE00EBE9E500AAA9A5000000000000000000B1B0AC00F0EEED00B1B1
      B100DDDDDC00FFFFFF00FFFFFF00CDCDCA00D6D6D600D6D6D600D0D0CE00D0CE
      CD00D6D6D600D6D6D600D6D6D600D0D0CE00D6D6D600F0F0ED00FFFFFF00DCDB
      DA00B1B1B100F0F0ED00A9A8A5000000000000000000C7C7C500B1B0AC009592
      9000FFFFFF00FFFFFF00F1EFEE00FFFFFF00F1EFEE00F9F9F900F9F9F900F9F9
      F900F1EFEE00F9F9F900F1EFEE00F9F9F900F5F5F500FFFFFF00FFFFFF00FFFF
      FF0095929000B1B0AC00C6C6C200000000000000000000000000B1B0AC009592
      9000FFFFFF00FFFFFF00F0EFED00FFFFFF00F0EFED00FFFFFF00F2F2F100FFFF
      FF00EEEDEC00FFFFFF00EEEDEC00FFFFFF00F2F2F100FFFFFF00FFFFFF00FFFF
      FF0095929000B1B0AC00000000000000000000000000C6C6C200B1B0AC009592
      9000FFFFFF00FFFFFF00F0EEED00FFFFFF00799DC300A2C2E000F1F0ED00D0DF
      EC0094B5D30080A7CD00799DC3007EA6CC007BA0C20088AED000A4BAE000D1E1
      EB00A29F9C00B1B0AC00C6C6C2000000000000000000C5C5C200B1B0AC009A98
      9600FFFFFF00FFFFFF00F0EEED00FFFFFF00F0EEED00FFFFFF00F6F6F600FFFF
      FF00EDEDED00FFFFFF00EDEDED00FFFFFF00F6F6F600FFFFFF00FFFFFF00FFFF
      FF0096969600B0AFAB00C5C5C200000000000000000000000000000000009C9B
      9700FFFFFF00FFFFFF00FFFFFF00F1EFEE00FFFFFF00F9F9F900F9F9F900F9F9
      F900F9F9F900FFFFFF00F9F9F900F9F9F900F9F9F900F1EFEE00FFFFFF00FFFF
      FF009A9896000000000000000000000000000000000000000000000000009A98
      9600FFFFFF00FFFFFF00FFFFFF00F0EFED00FFFFFF00FFFFFF00F2F2F100FFFF
      FF00F2F2F100FFFFFF00FFFFFF00F2F2F100FFFFFF00EEEDEC00FFFFFF00FFFF
      FF009A9896000000000000000000000000000000000000000000000000009A98
      9600FFFFFF00FFFFFF00FFFFFF00EDEDED00FFFFFF00FFFFFF00F1F0ED00FFFF
      FF00F0F4F700F8F8F600F8F8F600F1F0ED00FFFFFF00EDEDED00FFFFFF00FFFF
      FF009A9896000000000000000000000000000000000000000000000000009A98
      9600FFFFFF00FFFFFF00FFFFFF00F0EEED00FFFFFF00F6F6F600FFFFFF00F6F6
      F600F6F6F600FFFFFF00F6F6F600F6F6F600FFFFFF00EDEDED00FFFFFF00FFFF
      FF009A9896000000000000000000000000000000000000000000000000009D9A
      9900FFFFFF00FFFFFF00FFFFFF00F9F9F900F9F9F900F9F9F900F9F9F900FFFF
      FF00F9F9F900F9F9F900F9F9F900FFFFFF00F9F9F900FFFFFF00FFFFFF00FFFF
      FF009C9B97000000000000000000000000000000000000000000000000009C9C
      9A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F2F100FFFFFF00F8F8F700FFFF
      FF00FFFFFF00F2F2F100FFFFFF00FFFFFF00F2F2F100FFFFFF00FFFFFF00FFFF
      FF009A9896000000000000000000000000000000000000000000000000009D9A
      9900FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F0ED00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F1F0ED00FFFFFF00FFFFFF00F0F4F700FFFFFF00FFFFFF00FFFF
      FF009A9896000000000000000000000000000000000000000000000000009C9A
      9800FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600FFFFFF00F6F6F600FFFF
      FF00FFFFFF00F6F6F600FFFFFF00FFFFFF00F6F6F600FFFFFF00FFFFFF00FFFF
      FF009A9896000000000000000000000000000000000000000000000000009D9A
      9900FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D6009D9A99000000000000000000000000000000000000000000000000009C9C
      9A00FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D6009C9C9A000000000000000000000000000000000000000000000000009D9A
      9900FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D6009D9A99000000000000000000000000000000000000000000000000009C9A
      9800FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D6009C9A9800000000000000000000000000000000000000000000000000A3A0
      9E00FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D600A3A09E00000000000000000000000000000000000000000000000000A09D
      9B00FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D600A3A09E00000000000000000000000000000000000000000000000000A29F
      9C00FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D600A29F9C00000000000000000000000000000000000000000000000000A3A0
      9E00FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D600A3A09E00000000000000000000000000000000000000000000000000A5A5
      A500FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D600A9A7A600000000000000000000000000000000000000000000000000A5A5
      A500FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D600A9A7A600000000000000000000000000000000000000000000000000A5A5
      A500FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D600A9A7A600000000000000000000000000000000000000000000000000A5A5
      A500FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D600A9A7A600000000000000000000000000000000000000000000000000A9A7
      A600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600A9A7A600000000000000000000000000000000000000000000000000A9A7
      A600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600A9A7A600000000000000000000000000000000000000000000000000A9A7
      A600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600A9A7A600000000000000000000000000000000000000000000000000A9A7
      A600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600A9A7A600000000000000000000000000000000000000000000000000AAA9
      A500FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600AAA9A500000000000000000000000000000000000000000000000000AAA9
      A500FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600AAA9A500000000000000000000000000000000000000000000000000AAA9
      A500FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600AAA9A500000000000000000000000000000000000000000000000000A9A8
      A500FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600A9A8A500000000000000000000000000000000000000000000000000B1B0
      AC00B1B0AC00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AF
      AB00B0AFAB00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0
      AC00B1B0AC00000000000000000000000000000000000000000000000000B1B0
      AC00B1B0AC00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AF
      AB00B0AFAB00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0
      AC00B1B0AC00000000000000000000000000000000000000000000000000B1B0
      AC00B1B0AC00B0AEAA00B0AEAA00B0AEAA00B0AEAA00B0AEAA00B0AEAA00B0AE
      AA00B0AEAA00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0
      AC00B1B0AC00000000000000000000000000000000000000000000000000B1B0
      AC00B1B0AC00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AFAB00ABABA800B0AF
      AB00ABABA800B1B0AC00B0AFAB00B0AFAB00B1B0AC00B1B0AC00B1B0AC00B1B0
      AC00B1B0AC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000600000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF00FFF807000000000000000000FFC00300
      0000000000000000FF8003000000000000000000FF8001000000000000000000
      FF8001000000000000000000FC0001000000000000000000F800030000000000
      00000000F00003000000000000000000F00003000000000000000000E0000100
      0000000000000000E00001000000000000000000C00001000000000000000000
      C00001000000000000000000C000010000000000000000008000030000000000
      0000000080000700000000000000000080000700000000000000000080000700
      000000000000000001C00F0000000000000000000FF00F000000000000000000
      FFFC1F000000000000000000FFFE3F000000000000000000FFFFFF0000000000
      00000000FFFFFF000000000000000000FC7FFFFFFE7FFFFFFFFFFFFFF87FFFFF
      FE1FFFFFFFF8001FC00000000003800007F8001FC00000000003800007800001
      C000000000038000078000018000000000018000078000010000000000008000
      0780000100000000000080000780000100000000000080000780000100000000
      0000800007800001800000000001800007800001C00000000003800007800001
      C00000000003800007800001C00000000003800007800001C000000000038000
      07C00003C00000000003800007F8001FF00003C0000F800007F8001FF00003C0
      000F800007F8001FF00003C0000F800007F8001FF00003C0000F80000FF8001F
      F00003C0000F80001FF8001FF00003C0000F80003FF8001FF00003C0000F8000
      7FFFFFFFF00003C0000F8000FFFFFFFFFFFFFFFF0003FFFFBFFFF87F800001FF
      0001FFFF87F0403F800001FE0001FFFF03F0401F800001FE0001FFFE00F0400F
      800001C00001FFFC00F04007800001800001FFE800F0400F800001800001FFF0
      01F0401F800001800001F80003FFFE3F800001800001E00007FFF03F80000180
      0001C0000FFFF80F800001800001C0001FFFF00F80000180000100003FFC001F
      80000180000100003FF0003F80000180000100003FF0003F8000018000010000
      3FC0007FE0000780000300003FC0007FE0000780000300007FC0007FE0000780
      000700007FC0007FE0000780000F80007FC000FFE0000780007F8000FFC000FF
      E000078003FFC000FFE000FFE000078007FFE001FFE001FFE00007800FFFF007
      FFF003FFFFFFFFFFFFFFFFFFFFFC07FFFFFFFFFFF000FFFFFEFFFFFF80000180
      0000800000800001800001800000800000800001800001800000800000800001
      8000018000008000008000018000018000008000008000018000018000008000
      0080000180000180000080000080000180000180000080000080000180000180
      0000800001800001800001800000800001800001800001800001800001800001
      800001800001800001800001800001800001800001800001800001C000038000
      01800001E00007E00007E00007E00007E00007E00007E00007E00007E00007E0
      0007E00007E00007E00007E00007E00007E00007E00007E00007E00007E00007
      E00007E00007E00007E00007E00007E00007E00007E00007E00007E00007E000
      07E00007FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object iltMenu: TImageList
    Left = 616
    Top = 464
    Bitmap = {
      494C010118001D00100010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000007000000001002000000000000070
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007171710071717100717171006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D00000000000000000071717100717171007171
      71006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006D6D6D00B1654D008C5036008C5036008C5036008C50
      36006C554C006A635F00717171006D6D6D006D6D6D00B1654D008C5036008C50
      36008C5036008C5036006C554C006A635F007171710000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ACACAC00ACACAC00ACAC
      AC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACAC
      AC00ACACAC00ACACAC0000000000000000000000000000000000000000000000
      00000000000000000000E0664200DC513100F9635000FD725C00F1684E00D774
      4500F1684E00D24C27003559380035593800E0664200DC513100F9635000FD72
      5C00F1684E00D7744500F1684E00D24C27000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0704000B0583000B0583000A0502000A05020009048
      2000904820009040200080402000000000007C7C7C0075757500757575006C6C
      6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C006666
      66006666660066666600ACACAC00000000000000000000000000000000000000
      00000000000000000000D5885500F9635000FD7C6400FC8B6D00D5885500FFCF
      9C00F36D5300FD6A57009179300000000000D5885500F9635000FD7C6400FC8B
      6D00D5885500FFCF9C00F36D5300FD6A57009179300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0785000FFF8F000D0B0A000D0B0A000D0B0A000C0B0
      A000C0A8A000C0A890009040200000000000868686007C7C7C0092C4EE0084B9
      E40081B5DF00AA8D29008167190079601500795D1300795D1300795D1300795D
      1300795D1300795D1300795D1300000000000000000000000000000000000000
      0000000000000000000000000000E0664200FD846900EB805900FFCF9C00FFCF
      9C00EF765600FD6B5800000000000000000000000000E0664200FD846900EB80
      5900FFCF9C00FFCF9C00EF765600FD6B58000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D0886000FFFFFF00E0906000D0805000D0805000D080
      5000D0805000C0A8A000904820000000000094949400A8D8FC007C7C7C0092C4
      EE0092C4EE00CEAD3A00FFDD7C00E9C15200E9C04B00E9BC4500E9B43100E9B4
      3100E9B43100D9920C0081671900000000000000000000000000000000000000
      000000000000000000000000000000000000B1654D004C214F002E3457007F4C
      6E00B1654D009179300000000000000000000000000000000000B1654D004C21
      4F002E3457007F4C6E00B1654D00917930000000000000000000000000000000
      000000000000000000000000000000000000B0A0900060483000604830006048
      30006048300060483000D0907000FFFFFF00FFFFFF00FFF0F000F0E0D000F0D0
      C000F0C0B000C0B0A00090482000000000009C9C9C00BEE0FF00B6DFFF007C7C
      7C00A8D8FC00D7BE5E00FFEDB600FFE28D00FFDE8800FFE28D00FFDA7600FFD7
      7000FFD56D00F8CE56008E731E00000000000000000000000000000000000000
      00000000000000000000000000001717170005070E000D296800143AA000102F
      9500081D6C00545454000000000000000000000000001717170005070E000D29
      6800143AA000102F9500081D6C00545454000000000000000000000000000000
      000000000000000000000000000000000000B0A09000FFF0F000F0E0D000E0D8
      D000E0D0C000E0C8C000E0A08000FFFFFF00F0A88000E0987000E0906000D080
      5000D0805000D0B0A000A048200000000000A4A4A400CBE6FC00C6E5FF00BEE0
      FF007C7C7C00D7C16500FFEDB600CCB77600CCB77600D8C07300FFDD7C00FFDA
      7600FFD77000F8CE56008E731E00000000000000000000000000000000000000
      000000000000000000003F3F3F001A1A1A00102C5B001A4DB3001C56BC001B51
      B700102F95005454540000000000000000003F3F3F001A1A1A00102C5B001A4D
      B3001C56BC001B51B700102F9500545454000000000000000000000000000000
      000000000000000000000000000000000000B0A09000FFF8F000E0B08000E0A0
      7000E0A07000D0987000E0A89000FFFFFF00FFFFFF00FFFFFF00FFF8F000F0E8
      E000F0D0C000D0B0A000A050200000000000A4A4A400D3EAFE00CFEAFF008686
      8600C6E5FF00D7C16500FFEDB600FFE49A00FFE49200FFE28D00FFDE8200FFDD
      7C00FFDA7600F8D25F008E76220000000000000000000000000000000000A49E
      9E00A49E9E000000000017171700282828000F2D93002774DA002671D7002671
      D7001E5AC0005A606400000000000000000017171700282828000F2D93002774
      DA002671D7002671D7001E5AC0005A6064000000000000000000000000006565
      660000000000000000000000000000000000C0A89000FFFFFF00FFF8F000F0F0
      F000F0E8E000F0E0D000E0B8A000FFFFFF00FFB09000FFB09000F0D8D000E090
      6000B0583000B0583000A050200000000000A4A4A400DCF1FF009C9C9C00D8ED
      FF00D3EAFE00D7C16500FFF1C600CCB97F00CCB67B00CCB77600CCB77600CCB1
      6700E9C87400FFD56D008E7622000000000000000000000000005B9361000F9C
      1F00098D1200A49E9E00282828003F3F3F002C586F003191F9003399FF003694
      F700246AD0005A6064000000000000000000282828003F3F3F002C586F003191
      F9003399FF003694F700246AD0005A606400000000000000000057BDFD002792
      CA0065656600000000000000000000000000C0A8A000FFFFFF00FFC8A000F0B8
      9000E0B08000E0A07000F0C0A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F098
      7000F0C8B000B0583000C9A3940000000000ACACAC00A4A4A400E7F5FF00E7F5
      FF00E7F5FF00D7C16500FFF1C600FFE9A300FFE49A00FFE49A00FFE28D00FFE2
      8D00FFDE8200FFD56D008E76220000000000000000000000000054985E001EB7
      3E000F9C1F00A49E9E006D6D6D004D4D4D003F3F3F0046464600143AA0002060
      C600135F88007E7E7E0000000000000000006D6D6D004D4D4D003F3F3F004646
      4600143AA0002060C600135F88007E7E7E0000000000000000000000000057BD
      FD0065656600000000000000000000000000C0B0A000FFFFFF00FFFFFF00FFFF
      FF00FFF0F000F0E8E000F0C8B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0A8
      8000C0683000C9A394000000000000000000ACACAC00F3FFFF00F3FFFF00F3FF
      FF00F3FFFF00D7C16500FFF1C600CCBC8A00CCB97F00CCB97F00CCB77600CCB7
      7600F3D68300FFDA76008E7622000000000054985E0058AD690034AF52002BC4
      56001BAC3700449A4A004F924A00A49E9E00666666008F8F8F00A4A4A4004D4D
      4D00464646000000000000000000000000000000000036363600656566008F8F
      8F00A4A4A4004D4D4D004646460000000000000000000000000064CBFD0057BD
      FD002792CA00656566000000000000000000D0B8B000FFFFFF00FFD8C000FFD0
      B000F0D8D000B0A09000F0C8B000F0C0B000F0C0B000F0B8A000F0B09000F0B0
      9000D0B0A000000000000000000000000000ACACAC00ACACAC00ACACAC00A4A4
      A400A4A4A400D7C46900FFF2CB00FFEAA900FFEAA900FFE9A300FFE49A00CBA9
      3400CEAD3A00C5A22E00AA8D29000000000037BF59004BE47E0041DA740035CE
      68002BC456001FB83F0014A02600A49E9E006D6D6D00605E5E00605E5E006666
      66000000000000000000000000000000000000000000000000006D6D6D00605E
      5E00605E5E00656566000000000000000000000000005CD1F20047C1EA0047C1
      EA0057BDFD002792CA006565660000000000D0C0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0A89000D0C8C00090706000BCA69C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D7C46900FFF3D100CCBC8A00E0CE9800FFEAA900FFE49A00CEAD
      3A00D9B65C00D8B451000000000000000000659B6E006BA7790046B3630041DA
      74002EBE580054985E005B936100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000069D3F90047C1EA0047C1
      EA0058C6F5004CB4FB006565660000000000E0C0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0B0A000A0806000BCA69C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DDD08500FFF5E900FFF3D100FFF2CB00FFF2CB00FFF1C600D4BA
      5500D7BE5E0000000000000000000000000000000000000000006BA779004BE4
      7E0037BF5900A49E9E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000098E9F60074DAFD0069D3
      F90069D3F90044BCE9006565660000000000E0C0B000E0C0B000D0C0B000D0C0
      B000D0B8B000D0B0A000C7B1AA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E8E0AD00E8DEAA00E6D99900E6D99900E6D99900E3D48F00DBC6
      6C0000000000000000000000000000000000000000000000000067A073003ECB
      65002CB04A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000089D6EA0089D6
      EA0069C7E4002792CA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F5F9000000
      0000B15E7D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B15E
      7D0000000000F7F5F90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD68
      8F00BC5E80000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BC5E
      8000BD688F000000000000000000000000000000000000000000000000000000
      0000B5CCB4000268020002680200026802000268020002680200026802000268
      02000268020002680200026802003C803B000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001E0FE7000000
      0000000000000000000000000000000000000000000000000000BD688F00D572
      9D00C9679200BC5E8000BC5E8000B15E7D00DF8AB10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DF8AB100B15E7D00BC5E8000BC5E8000C967
      9200D5729D00BD688F0000000000000000000000000000000000000000000000
      0000E4E0E2003285310017912A0034CC660034CC660034CC660034CC660034CC
      660034CC660034CC660034CC6600026802000000000000000000000000000000
      000000000000000000000000000000000000000000001E0FE700341FF1001E0F
      E7000000000000000000000000000000000000000000BD688F00D5729700CE5E
      8500D7608600E3608B00E36A9300EC8DAE00C9688700C0A0A000C0A0A000C088
      8000C0888000C0908000C0908000C0908000C0908000C0908000C0908000C088
      8000C0888000B0888000C0A0A000CD6F9000EC8DAE00E36A9300E3608B00D760
      8600CE5E8500D5729700BD688F00000000000000000000000000000000000000
      000000000000E4E0E20036893500209632003BCB690030AC3C0030A5330030A5
      330030A5330030A5330034CC66000B730B000000000000000000000000000000
      0000000000000000000000000000000000001E0FE700554BDD004C37F600392D
      D3001E0FE700000000000000000000000000C9679200D5729700E980B100D760
      8600F181A600FF8CB300FFA1B900FEA9B600EA8CA100FFE0B000FFE0B000FFF0
      C000FFF0C000FFF8D000F0D8C000C0909000C0909000F0D8C000FFF8D000FFF0
      C000FFE8B000FFD8A000FFE0B000EA8EA600FEABBB00FFA1B900FF8CB300F181
      A600D7608600E980B100D5729700C96792000000000000000000000000000000
      00000000000000000000E4E0E200398E3900249A350034CC660030AC3C0030AC
      3C0030AC3C0030AC3C0034CC66000F790F0000000000000000001E0FE7000000
      00000000000000000000000000001E0FE7008A85E3005F4CF700604DF700604D
      F7003934AB001E0FE700000000000000000000000000C9679200E980B100ED7C
      A200F181A600FFA1B900FFBAD300FFBACE00EA95AA00FFF0D000FFF0D000FFF8
      F000FFF8F000FFF0E000D0908000C0989000C0989000D0908000FFF0E000FFF8
      F000FFF8E000FFF8D000FFF0D000EA93AA00FFBAD300FFBAD300FFA1B900F185
      A600ED7CA200E980AB00C9679200000000000000000000000000000000000000
      0000000000000000000000000000ABC9A9001A91270031C65E0030AC3C0030AC
      3C0030AC3C0031AF400034CC6600137E1300000000001E0FE7005D7BBA001E0F
      E70000000000000000001E0FE700716DC1003B29ED005847F0007865F9005949
      EE003B29ED00504AB9001E0FE700000000000000000000000000C9679200E779
      A000EA91A600D26A8700E693B400EA95B300F595B200FFF8E000FFF8E000F0F0
      E000F0F0E000D0908000FFE8B000D0989000D0989000FFE8B000D0908000F0F0
      E000FFF8F000FFF8E000FFF8E000F595B200E693AE00E693B400D26A8700EA91
      A600E779A000C967920000000000000000000000000000000000000000000000
      00000000000000000000000000004B9B4A0027B0470031BE540031B4470031B4
      470031B4470031B4470034CC660017831700000000001E0FE7007A94D8005555
      C1001E0FE7000000000000000000000000001E0FE7006F65E0008D7EF9001E0F
      E70000000000000000000000000000000000000000000000000000000000C763
      8000EA95AA00F0D8B000C0A0A000F0F0E000FFF0E000FFF0E000F0F0E000F0E8
      E000C0A0A000F0D8B000FFF8E000D0A09000D0A09000FFF8E000F0D8B000C0A0
      A000F0F0E000FFF0E000FFF0E000F0F0E000F0E8E000C0A0A000F0D8B000EA93
      AA00C7638000000000000000000000000000D9E1D70000000000000000000000
      0000000000000000000097BE96001F95290034CC660031B94E0031BE540031B9
      4E0038C45F0031BE540034CC66001B891B0000000000000000001E0FE700665A
      ED007E76D8001E0FE7001E0FE7001E0FE700A09DE200A292FB00A292FB001E0F
      E70000000000000000000000000000000000000000000000000000000000D0A8
      A000F191A900D0989000A0F8FF00C0A09000C0909000C0888000B0909000B098
      9000A0F8FF00D0989000F0E8C000D0A8A000D0A8A000F0E8C000D0989000A0F8
      FF00C0A09000C0909000C0888000B0909000B0989000A0F8FF00D0989000F191
      A900D0A8A000000000000000000000000000D9E1D700B2D2B100C5D8C3000000
      0000C1CEBF006BAA6A0023992D0034CC660031C2590031BE540031C65E006DD9
      8F007ACC8A005ED6850034CC6600208F20000000000000000000000000001E0F
      E7009181F900B5A7FB009189EA008A85E300B5A7FB00B8AAFC00AE9FFB001E0F
      E70000000000000000000000000000000000000000000000000000000000D0A8
      A000D0B0A000C0FFFF00C0FFFF00B0F8FF00B0F8FF00A0F0FF0090E8FF0080E0
      FF00C0FFFF00C0FFFF00D0B0A000D0A8A000D0A8A000D0B0A000C0FFFF00C0FF
      FF00B0F8FF00B0F8FF00A0F0FF0090E8FF0080E0FF00C0FFFF00C0FFFF00D0B0
      A000D0A8A00000000000000000000000000000000000B2D2B1008EC18D0072B6
      74004DAB540031B4470034CC660031C65E0031C2590065D88B0094DEA70048AA
      4C00249424005AB5610065D88B00249424000000000000000000000000000000
      00001E32D5009181F900C8BCFC00C8BCFC00C8BCFC00C8BCFC001E0FE7000000
      000000000000000000000000000000000000000000000000000000000000D0A8
      A000A0E8FF00A0E8FF00A0E8FF00A0E8FF0090E0FF0080D8FF0080D8F00070D0
      F000A0E8FF00A0E8FF00A0E8FF00D0A8A000D0A8A000A0E8FF00A0E8FF00A0E8
      FF00A0E8FF0090E0FF0080D8FF0080D8F00070D0F000A0E8FF00A0E8FF00A0E8
      FF00D0A8A00000000000000000000000000000000000000000009CC99B0085C6
      8A0085D79C006DD98F0074DC970091E3AC0084D1910063BA6900339C32008BBB
      8A00000000004DA74C0063BA690023992D000000000000000000000000000000
      0000000000002228DB005642F6009989F900A292FB006956F7004850CF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6A39C00E0FFFF00E0FFFF00F0FFFF00F0FFFF00E0FFFF00C0FFFF00A0E8
      FF0080E8FF0080E0FF00BC9A93000000000000000000C6A39C00E0FFFF00E0FF
      FF00F0FFFF00F0FFFF00E0FFFF00C0FFFF00A0E8FF0080E8FF0080E0FF00BC9A
      930000000000000000000000000000000000000000000000000000000000B2D2
      B1005AB5610038A338002D9F2D002D9F2D005AAE59009FC79E00000000000000
      0000000000000000000072B674002D9F2D000000000000000000000000000000
      000000000000000000006771E0001E0FE7001D07EE00373ED400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CAA2A200F0FFFF00F0FFFF00FFFFFF00F0FFFF00D0FFFF00B0F8
      FF0090E8FF00BC8D940000000000000000000000000000000000CAA2A200F0FF
      FF00F0FFFF00FFFFFF00F0FFFF00D0FFFF00B0F8FF0090E8FF00BC8D94000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C1DABF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CAA2A200F0FFFF00F0FFFF00F0FFFF00E0FFFF00B0F8
      FF00BC8D9400000000000000000000000000000000000000000000000000CAA2
      A200F0FFFF00F0FFFF00F0FFFF00E0FFFF00B0F8FF00BC8D9400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6A39C00C0A0A000C0A0A000C0989000C098
      9000000000000000000000000000000000000000000000000000000000000000
      0000C6A39C00C0A0A000C0A0A000C0989000C098900000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B6715500A070
      5000C5A99C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CBAE9F00A058
      400090503000985D4000BD9D8B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8BAA200E7B79E00E7B7
      9E00E7B79E00E7B79E00D8947000D48E6D00D48E6D00CE8A6600A05020009048
      200090482000904020008040200000000000A9846F00A0786000906040009058
      40009058400084472800000000000000000000000000B283650098725C00A070
      5000905840009050300075381900000000000000000000000000000000009058
      3000000000009058300000000000A0584000B0604000C0684000C0705000D078
      5000B0604000905830009050300000000000CE5BAA0076125200761252007612
      5200761252007612520076125200761252007612520000000000000000000000
      00000000000000000000000000000000000000000000E7B79E00FFFAF400FFFA
      F400FFFAF400FFFAF400F0D9C900FFFAF400F4E6DD00DCA48800D0B0A000C0B0
      A000C0A8A000C0A890009040200000000000B0908000FFFFFF00E0C8C000D0A0
      9000C080600080402000000000000000000000000000B2836500F0E8E000E0C8
      C000D0A89000B078500080482000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D9AFA000E080
      5000E0784000C7917300CDB2A70000000000CE5BAA00E6E0E200DFB7D200DFB7
      D200DEAFCF00DDA2CA00DA97C200D88EC0007612520000000000000000000000
      00000000000000000000000000000000000000000000E7B79E00FFFAF400FFFA
      F400FFFAF400FFFAF400F0D9C900FFFAF400F0D9C900DC987400D0805000D080
      5000D0805000C0A8A0009048200000000000B0908000FFF8FF00E0C8C000D0A0
      9000C080600080402000000000000000000000000000B0806000F0E8E000F0E0
      E000E0C0B000C088700080483000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E0885000E088
      600000000000000000000000000000000000CE5BAA00E6E0E200DF7EC500DF7E
      C500DB6FBE00DB6FBE00D563B800D88EC0007612520076125200761252007612
      520076125200761252007612520076125200B0A09000C18B6D00D8CDC100D8CD
      C100D8CDC100D8CDC100F4DFD100FFFAF400FFFAF400E8B59B00F4DFD100F0D0
      C000F0C0B000C0B0A0009048200000000000B0908000FFF8FF00E0C8C000D0A0
      9000C080600080402000000000000000000000000000B0806000F0E8E000F0E0
      E000E0C0B000C088700080483000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D061A900E6E0E200E6E0E200E6D8
      E200E4CEDF00DFB7D200DFB7D200D88EC00076125200DD98C900D88EC000DA83
      C400DF7EC500D76DBD00D563B80076125200B0A09000E8B59B00FBF2E800F7F0
      E800F7EDE400F7EDE400F4DFD100FFFAF400FBE5D500E09E7C00E0906000D080
      5000D0805000D0B0A000A048200000000000C0988000FFFFFF00F0E8E000E0C8
      C000D0A0800080402000000000000000000000000000B2836500F0E8E000F0E0
      E000E0C0B000C08870008048300000000000A070500070301000703010007030
      1000702800000000000070280000602800006020000060200000602000000000
      000000000000000000000000000000000000D26AB000E6E0E200DF7EC500DE79
      C100DB6FBE00D76DBD00D563B800D88EC00076125200E3C7DC00E2BCD700DFB7
      D200DDA2CA00DD98C900D76DBD0076125200B0A09000E8B59B00F4DFD100FBE5
      D500F4DFD100F4DFD100F7E8DD00FFFAF400FFFAF400E8B59B00FFFAF400F0E8
      E000F0D0C000D0B0A000A050200000000000C1A19200B0887000A06850009050
      300080483000804820008038100089482400B0887000A0685000905830009048
      300080402000703810009058300000000000A0786000F0D8D000FFFFFF00F0D0
      B000A06850000000000090604000E0B8A000E0D0C000D0A08000602000000000
      000000000000000000000000000000000000D473B600E6E0E200E6E0E200E6E0
      E200E6E0E200E3C7DC00DDA2CA00D88EC00076125200D473B600E4CEDF00E2B8
      D800E1B3D300DFADD100DF7EC50076125200C0A89000E8BAA200FFFAF400FBF2
      E800FBF6F000FBF2E800F7E8DD00FFFAF400FFE6D900E8A48400F0D9C900E090
      6000B0583000B0583000A050200000000000C8AEA200B0887000FFFFFF00E0D0
      C000D0A09000A070500080401000C1A19200B0907000E0D8D000F0D8D000D0A0
      9000B078500080382000C1A1920000000000B0806000F0D0C000FFFFFF00F0D0
      B000A070500000000000A0685000E0C8B000E0D8D000D0988000704020000000
      000000000000000000000000000000000000D67DB900E6E0E200DF7EC500DE79
      C100DE79C100CE5BAA00761252007612520076125200D88EC000D998C000E3C7
      DC00E2BCD700DFB7D200D979C00076125200C0A8A000E8BAA200E8AA8800E4A8
      8800E0A48000E0A48000E4A68400E8B59B00E8BAA200E8BAA200FFFFFF00F098
      7000F0C8B000B0583000C9A394000000000000000000C0908000F0F0F000FFF8
      F000F0D8C000B2836500804820008F502E00B0907000FFFFFF00FFF8F000F0D0
      C000B0785000804820000000000000000000C0988000B0807000B0887000A078
      6000A078600070301000A0685000C0988000A080600090685000805840000000
      000000000000000000000000000000000000D884BC00E6E0E200E6E0E200E6E0
      E200E6E0E200D061A900D88EC00078125300DDB5CA00E6E0E200E6E0E200E5D2
      DE002323FF0000007800D88EC00076125200C0B0A000FFFFFF00FFFFFF00FFFF
      FF00FBF2E800F0E8E000F0C8B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0A8
      8000C0683000C9A39400000000000000000000000000CFB9B100C0988000B283
      6500A06850008F502E009058400098644000B0786000B0887000A07050008048
      300080482000CFB9B100000000000000000000000000B0908000FFFFFF00F0D0
      B000906040007030100090604000FFF8F000F0C0B00080503000000000000000
      000000000000000000000000000000000000D88EC000E6E0E200E6E0E200E6E0
      E200E6E0E200D473B60078125300DDB5CA00E6E0E200E6E0E200E6E0E200E6E0
      E2005C5CFF002323FF00DD98C90076125200D0B8B000FFFFFF00FFD8C000FFD0
      B000F0D8D000B0A09000F0C8B000F0C0B000F0C0B000F0B8A000F0B09000F0B0
      9000D0B0A0000000000000000000000000000000000000000000C0988000FFF8
      FF00E0C0B000C09070008048200000000000C0988000FFFFFF00E0C0B000D0A0
      80008048200000000000000000000000000000000000C0988000FFFFFF00F0D0
      B000B07860008048200090604000FFFFFF00F0C8B00080503000000000000000
      000000000000000000000000000000000000D88EC000D88EC000DA83C400D884
      BC00D67DB900D473B600DFBCD400E6E0E200E6E0E200E6E0E200E6E0E200E6E0
      E200E6D8E200E4CEDF00E3C7DC0076125200D0C0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0A89000D0C8C00090706000BCA69C0000000000000000000000
      0000000000000000000000000000000000000000000000000000C4A79900B090
      8000A0685000905030008048300000000000C1A19200B0908000A06850009050
      30008048300000000000000000000000000000000000C0A09000C0988000B080
      6000C0908000A0705000B0887000C0988000A078600090685000000000000000
      000000000000000000000000000000000000000000000000000000000000D473
      B600DFB7D200DFADD100DFB7D200DFADD100DFADD100E0A7D000DD98C900D88E
      C000DE79C100DE79C100D76DBD00CA4A9B00E0C0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0B0A000A0806000BCA69C000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A477
      6400FFF8F0007B412400000000000000000000000000A0786000FFF8F0007B41
      24000000000000000000000000000000000000000000CDB2A700C0A09000E0D8
      D000C0908000C0908000C0988000F0F0F00090604000C5A79C00000000000000
      000000000000000000000000000000000000000000000000000000000000D26A
      B000D473B600D26AB000D473B600D26AB000D473B600D26AB000D76DBD00D26A
      B000D76DBD00D36FB500D36FB500D26AB000E0C0B000E0C0B000D0C0B000D0C0
      B000D0B8B000D0B0A000C7B1AA00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C1A1
      9200B088700098644000000000000000000000000000C4A79900B08870009864
      4000000000000000000000000000000000000000000000000000D0A89000FFFF
      FF00D0A8900000000000D0A89000FFFFFF009058400000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0988000B090
      7000B088700000000000C0988000B0907000B088700000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009F9AA000203040009A939600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0A09000604830006048
      3000604830006048300060483000604830006048300060483000604830005048
      4000305060004078C000304860009F9A9B000000000000000000806850008060
      5000806050007060500070584000705840007050400070504000604830006048
      3000604830000000000000000000000000000000000000000000000000000000
      000000000000CBA9A100C7A5A100BE959000744224008A4E2C00D2A895000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0A09000FFFFFF00B0A0
      9000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000908880003050
      70003080D0004098E00050B0F0005068700000000000A0898100E0D0C000B0A0
      9000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A0
      9000B0A090006048300000000000000000000000000000000000D5B5AA00B98A
      8200C18D8100DFB2A100FCF4EE00AC7872005E351D0064391F00744224000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0704000B0583000B0583000A0502000A05020009048
      20009048200090402000804020000000000000000000B0A09000FFFFFF00FFFF
      FF00FFFFFF00F0F0F000D0D8D000909890007068600060686000505860004070
      900040A0E00060C8FF007090A000B3ACAA00B8A69A00B1999100FFE8E000FFF8
      F000FFF0E000FFE8E000F0D8D000F0D0B000F0C0A00000A0000000A0000000A0
      00007058400060483000836C59000000000000000000C7A5A100CE968300EEB8
      9D00F7C8AE00F6CEB800FEF6F100AC7872001D769D001F7FAA001F7FAA000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0785000FFF8F000D0B0A000D0B0A000D0B0A000C0B0
      A000C0A8A000C0A89000904020000000000000000000B0A09000FFFFFF00FFFF
      FF00FFFFFF00E0E0E00090909000B0A8A000D0C0B000D0B0A000807870005058
      50006090B0007098B000A0A2A20000000000B0908100E0D8D000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF0F000F0E0E000F0D8C00000FF100000FFB00000A0
      00008068500070504000604830000000000000000000C7A5A100F7BB9900F8C0
      A200F7C8AE00F6CEB800FEF6F100AC7872005DB6D5005EC3E400189DC9000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D0886000FFFFFF00E0906000D0805000D0805000D080
      5000D0805000C0A8A000904820000000000000000000B0A09000FFFFFF00FFFF
      FF00FFFFFF00B0B0B000C0B8B000FFF0E000FFE8E000F0D8C000F0D0B0008078
      700091838500A0A2A2000000000000000000B0908100F0E8E000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0E8E00000FF100000FF100000A0
      00009070600070605000604830000000000000000000C7A5A100F8BB9900F7C0
      A200F7C8AE00F6CEB800FEF6F100AC78720069BBD60073CBE70046B1D400E0AD
      8E00E7681C00000000000000000000000000B0A0900060483000604830006048
      30006048300060483000D0907000FFFFFF00FFFFFF00FFF0F000F0E0D000F0D0
      C000F0C0B000C0B0A000904820000000000000000000C0A89000FFFFFF00FFFF
      FF00FFFFFF00A0989000F0E8E000FFF8F000FFF0F000FFE8E000F0D8D000D0B0
      A0005F645C00000000000000000000000000B0988000D0C0B000D0B8B000C0B0
      A000B0A09000B0988000A0898100908070009070600080686000806050007058
      50009080700080686000705840000000000000000000C7A5A100F8BB9900C18D
      8100B3807800F6CEB800FEF6F100AC78720087C7DB00A1DDEF00AFB0A400E55C
      0A00E5570100000000000000000000000000B0A09000FFF0F000F0E0D000E0D8
      D000E0D0C000E0C8C000E0A08000FFFFFF00F0A88000E0987000E0906000D080
      5000D0805000D0B0A000A04820000000000000000000C0A8A000FFFFFF00FFFF
      FF00FFFFFF00A0A09000F0E8E000FFFFFF00FFF8F000FFF0F000FFE8E000E0C0
      B0006D6B6A00000000000000000000000000C0A09000FFF8F000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000FFF0F000F0F0F000F0E8
      E000A089810090786000806050000000000000000000C7A5A100F7BB9900AC78
      7200FFFFFF00F6CEB800FEF6F100AC787200A3D4E200D4C4B200E5570100E557
      0100E5570100E5570100E5570100E5570100B0A09000FFF8F000E0B08000E0A0
      7000E0A07000D0987000E0A89000FFFFFF00FFFFFF00FFFFFF00FFF8F000F0E8
      E000F0D0C000D0B0A000A05020000000000000000000C0B0A000FFFFFF00FFFF
      FF00FFFFFF00C0C8C000C0C0C000FFFFFF00FFFFFF00FFF8F000FFF0E000B0A0
      9000988E8A0000000000000000000000000000000000B0988000D0B0A000C0A8
      A000D0B0A000C0A09000B0908100A08070009070600080605000706050008070
      6000B0A09000A0887000806050000000000000000000C7A5A100F7BB9900D29C
      8A00AC787200F6CEB800FEF6F100AC787200BBDFE900E5570100E5570100E557
      0100E5570100E5570100E5570100E5570100C0A89000FFFFFF00FFF8F000F0F0
      F000F0E8E000F0E0D000E0B8A000FFFFFF00FFB09000FFB09000F0D8D000E090
      6000B0583000B0583000A05020000000000000000000D0B0A000FFFFFF00FFFF
      FF00FFFFFF00F0F8FF00C0B8B000C0C0C000F0E8E000F0E8E000B0B0A0007070
      6000CCB8B0000000000000000000000000000000000000000000C0B0A000E0C8
      C000FFFFFF00FFFFFF00FFF8FF00FFF0F000F0F0E000F0E0E000C0A8A0008060
      5000A0908000C0B0A000806050000000000000000000C7A5A100F8BB9900F7C0
      A200F7C8AE00F6CEB800FEF6F100AC787200BFE0E900E4B29100E55C0A00E558
      0200E5570100E5570100E5570100E5570100C0A8A000FFFFFF00FFC8A000F0B8
      9000E0B08000E0A07000F0C0A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F098
      7000F0C8B000B0583000C9A394000000000000000000D0B8A000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F0F8FF00C0C8C000A0A0900090908000909090006050
      400000000000000000000000000000000000000000000000000000000000C0B0
      A000FFFFFF00F0E0E000D0C8C000D0C8C000D0B8B000D0C0B000E0D0D0008068
      600080605000B1999100B0A090000000000000000000C7A5A100F8BB9900F7C0
      A200F7C8AE00F6CEB800FEF6F100AC787200B7DBE400D7F1F700CAAD9400E55C
      0A00E5570100DFCABC00D9BDAC00DEC5B600C0B0A000FFFFFF00FFFFFF00FFFF
      FF00FFF0F000F0E8E000F0C8B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0A8
      8000C0683000C9A39400000000000000000000000000D0B8B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0A0900060483000604830006048
      300000000000000000000000000000000000000000000000000000000000D0B9
      A800F0E8E000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF0F000F0D8D000D0B8
      B00080605000AD948900000000000000000000000000C7A5A100F7BB9900F7C0
      A200F7C8AE00F6CEB800FEF6F100AC787200B2D7E100C5EAF40083CBE200E4A6
      8000E5580200000000000000000000000000D0B8B000FFFFFF00FFD8C000FFD0
      B000F0D8D000B0A09000F0C8B000F0C0B000F0C0B000F0B8A000F0B09000F0B0
      9000D0B0A00000000000000000000000000000000000D0C0B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A89000D0C8C00060483000D0B5
      A900000000000000000000000000000000000000000000000000000000000000
      0000D0B8B000FFFFFF00F0F0F000D0C8C000D0C8C000D0B8B000C0B0B000E0D8
      D0008070600080605000000000000000000000000000C7A5A100C7908100EAB3
      9A00F7C8AE00F6CEB800FEF6F100AC787200B8D9E200C5EAF4002CA5CE00C9A0
      860000000000000000000000000000000000D0C0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0A89000D0C8C00090706000BCA69C0000000000000000000000
      00000000000000000000000000000000000000000000E0C0B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A00060483000D0B5A9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFCECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0E0
      E000D0B8B00080605000C7B1A90000000000000000000000000000000000B98A
      8200C18D8100E5BAA700FEF6F100AC7872000A8FBB000A97C6000A97C6000000
      000000000000000000000000000000000000E0C0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0B0A000A0806000BCA69C000000000000000000000000000000
      00000000000000000000000000000000000000000000E0C0B000E0C0B000E0C0
      B000E0C0B000E0C0B000D0C0B000D0B8B000D0B0A000D0B5A900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D0C0B000D0C0B000D0C0B000D0B8B000D0C0B000D0C0
      B000D0C0B000D0C0B00000000000000000000000000000000000000000000000
      000000000000B98A8200BE959000BE959000C9977D00C9977D00CC997F000000
      000000000000000000000000000000000000E0C0B000E0C0B000D0C0B000D0C0
      B000D0B8B000D0B0A000C7B1AA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00368A
      39001A9832001A9832001A9832001C892A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001D2E
      920000000000F3F7F60000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0989000C0909000C0888000B080
      8000B0787000A0707000A0686000A0686000A0686000A0686000A0686000FFFF
      FF0034A4470030B0420030A8370022A139000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001D2F
      A1002B46A300000000000000000000000000C0989000C0909000C0888000B080
      8000B0787000A0707000A0686000D4BBB70062412100805E3D008A6846009472
      50009F7C5A00BE9A7700D4B7B700D4B7B7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0989000F0D8C000FFFFF000FFF0
      D000FFE0B000FFD8A000FFC89000FFC89000FFC09000FFB88000FFB88000FFA8
      7000FFFFFF0030B64A0030B0420022A139000000000000000000000000000000
      00000000000000000000000000005B76D3001D2E92001D38A1001D2FA1002B47
      B4003A56C5002B46A3000000000000000000C0989000F0D8C000FFFFF000FFF0
      D000FFE0B000FFD8A000FFC89000FFE6CD007C532B00C6936100D09D6A00DAA7
      7400E4B17E00996C3F00C1A28300D4B7B700000000000000000000000000C0A8
      A000604830006048300060483000604830006048300060483000604830006048
      300060483000604830006048300060483000D0989000D0A8A000E0D0C000FFFF
      F000FFF8E000FFF0D000FFE8D000FFE8C000FFE0C000B1AE9900FFFFFF00FFFF
      FF0032BA540036C05A0051C870002CAF4700C0908000C0908000C0908000C088
      8000C0888000B0888000C0A0A0005B6ED3008FA8FE005E79F1004E69F1004D68
      E2004A67D4003A4DC5002B3EA30000000000D0989000D0A8A000E0D0C000FFFF
      F000FFF8E000FFF0D000FFE8D000FFF5E30095693D00A0774E00AC866000B795
      7200C3A48400CFB39600E3BFB700D4BBB700B9937A00A475560000000000C0A8
      A000FFFFFF00F0D8D000F0D8D000E0D8D000E0D0C000E0C8C000E0C0B000E0B8
      B000D0B0A000D0A89000D0A8900060483000D0A09000FFFFF000D0B0A000E0D0
      C000FFFFF000FFFFF000FFF8F000FFF0E000FFF0E000FFFFFF007EC0830051C8
      70005ECE7C0064BF7100FFFFFF0045AF5100C0909000F0D8C000FFF8D000FFF0
      C000FFE8B000FFD8A000FFE0B0006D87E2008FA0FE008099FF006082FF005E79
      F1004D5FE2004D70E2003A4DC5002B47B400D0A09000FFFFF000D0B0A000E0D0
      C000FFF8F000FFF8F000FFF8F000FFF8F100FFF8F100FFF5E300FFF1E300FFED
      DB00F1D8C600E3C6BF00FFDFBF00D4BBB700000000000000000000000000C0B0
      A000FFFFFF00FFFFFF00FFFFFF00FFF8F000FFF0F000F0E8E000F0E0E000F0D8
      D000F0D0C000E0D0C000D0A8900060483000D0A0A000FFFFFF00FFFFF000D098
      9000E0C8C000FFF8F000FFFFF000FFF8F000FFF0E000FFF0D000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFD09000FFFFFF00C0989000D0908000FFF0E000FFF8
      F000FFF8E000FFF8D000FFF0D0006D7FE200A0B1FF00A0B1FF008091FF008099
      FF007089FF004D68E2002B47B40000000000D0A0A000FFFFFF00FFFFF000D0A0
      9000E0C8C000FFF8F000FFF8F000FFFCF800FFF8F100BE9A77009F7C5A009472
      50008A684600805E3D0062412100D4BBBF00B9937A00A475560000000000C0B0
      A000FFFFFF00C0A8A000C0A8A000C0A89000B0A09000B0989000F0E8E000F0E0
      E000F0D8D000F0D0C000D0B0A00060483000D0A0A000FFFFFF00F0D8D000E0C0
      B000E0C0B000E0C0B000E0C8C000E0C0B000E0C0B000E0C0B000D0B0A000D0A8
      A000D0989000E0B09000FFD8A000A0707000D0989000FFE8B000D0908000F0F0
      E000FFF8F000FFF8E000FFF8E0006D81F1006D7FE2006D87E2005B6ED3006D87
      E2006D89F1002B47B4000000000000000000D0A0A000FFFFFF00F0D8D000E0C0
      B000E0C0B000E0C0B000E0C8C000F1E6DB00C1A28300996C3F00E4B17E00DAA7
      7400D09D6A00C69361007C532B00D4BFBF00000000000000000000000000C0B0
      A000FFFFFF00C0B0A000C0B0A000C0A8A000C0A89000B0A09000B0A09000F0E8
      E000F0E0E000F0D8D000E0B8B00060483000D0A8A000F0D0C000E0C0B000F0F0
      F000F0F0F000E0B8A000E0B8A000D0B0A000D0B0A000D0A8A000D0A8A000F0E8
      E000F0E0D000C0989000E0A88000A0787000D0A09000FFF8E000F0D8B000C0A0
      A000F0F0E000FFF0E000FFF0E000F0F0E000F0E8E000F0E0E000FFF0E0006D7F
      E2004A5DC500000000000000000000000000D0A8A000F0D0C000E0B8B000F0F0
      F000F0F0F000E0B8A000E0B8A000EADBD400EADBD400CFB39600C3A48400B795
      7200AC866000A0774E0095693D00D4C2BF00B9937A00A475560000000000C0B0
      A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000FFF0
      F0002048D0002040A000E0C0B00060483000D0A8A000C0B8B000F0F0F000FFFF
      F000F0E0E000F0F0F000F0F0F000F0F0F000F0F0E000F0F0E000F0F0E000F0E0
      D000FFF0E000F0D8D000A0909000A0787000D0A8A000F0E8C000D0989000A0F8
      FF00C0A09000C0909000C0888000B0909000B0989000C0A8B000E0C0C0006D81
      F100D0B0A000000000000000000000000000D0A8A000C0B8B000F0F0F000FFF8
      F000F0E0E000F0F0F000F0F0F000F0F0F000F8F8F100F8F8F100F8F8F100F8F1
      EA00FFF8F100F8EDEA00D4CDCD00D4C2BF00000000000000000000000000C0B0
      A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8FF00FFF8
      F0004060F0002048D000E0C8C00060483000D0A8A000A0D8F000FFFFF000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF000FFFFF000FFFFF000FFF0
      F000F0F0F000E0E0E00050B0E000A0787000D0A8A000D0B0A000C0FFFF00C0FF
      FF00B0F8FF00B0F8FF00A0F0FF0090E8FF0080E0FF0080D8FF00A0E0FF00D0C0
      B000C0A8B000000000000000000000000000D0A8A000A0D8F000FFFFF000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF000FFF8F000FFF8F000FFF0
      F000F0F0F000E0E0E00050B0E000A0787000B9937A00A475560000000000C0B0
      A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF8F000FFF0F000F0E8E00060483000D0A8A000A0E8FF00B0E0FF00B0E0
      FF00A0D8FF0080D0FF0060D0FF0060C8FF0060C8FF0050C8FF0050C0F00040B8
      F00040B8F00030B0F00020B0FF00C0909000D0A8A000A0E8FF00A0E8FF00A0E8
      FF00A0E8FF0090E0FF0080D8FF0080D8F00070D0F00070C8F00060C8F00070C8
      F000B47F8600000000000000000000000000D0A8A000A0E8FF00B0E0FF00B0E0
      FF00A0D8FF0080D0FF0060D0FF0060C8FF0060C8FF0050C8FF0050C0F00040B8
      F00040B0F00030B0F00020B0FF00C0989000000000000000000000000000C0B0
      A000C0B0A000C0B0A000C0B0A000C0A8A000C0A8A000C0A89000B0989000B0A0
      9000B0989000B0989000B0989000B098900000000000D0B8C000C0F0FF00D0F8
      FF00D0F0FF00D0E8FF00B0E8FF00A0E8FF0080D0FF0070C8FF0050C8FF0070C8
      FF0060C8FF0040B8FF00A0B0C0000000000000000000C6A39C00E0FFFF00E0FF
      FF00F0FFFF00F0FFFF00E0FFFF00C0FFFF00A0E8FF0080E8FF0080E0FF00BC9A
      93000000000000000000000000000000000000000000D0B8C000C0F0FF00D0F8
      FF00D0F0FF00D0E8FF00B0E8FF00A0E0FF0080D0FF0070C8FF0050C8FF0070C8
      FF0060C8FF0040B8FF00A0B0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D0B8B000D0E0
      E000D0F8FF00D0F8FF00D0E8FF00B0E0FF00A0D8FF0080D0FF0070C8FF0050C8
      FF0090C0E000B0A8B00000000000000000000000000000000000CAA2A200F0FF
      FF00F0FFFF00FFFFFF00F0FFFF00D0FFFF00B0F8FF0090E8FF00BC8D94000000
      0000000000000000000000000000000000000000000000000000D0B8B000D0E0
      E000D0F8FF00D0F0FF00D0E8FF00B0E8FF00A0E0FF0080D0FF0070C8FF0050C8
      FF0090C0E000B0A8B00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D0B8
      B000D0B8B000E0F8FF00E0F8FF00D0F0FF00B0E0FF0090E0FF0070D0FF00C0B0
      B00000000000000000000000000000000000000000000000000000000000CAA2
      A200F0FFFF00F0FFFF00F0FFFF00E0FFFF00B0F8FF00BC8D9400000000000000
      000000000000000000000000000000000000000000000000000000000000D0B8
      B000D0B8B000E0F8FF00E0F8FF00D0F0FF00B0E0FF0090E0FF0070D0FF00C0B0
      B000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D0B8B000E0E0E000D0F8FF00C0F0FF00B0C8D000D0B8B0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6A39C00C0A0A000C0A0A000C0989000C098900000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D0B8B000E0E0E000D0F8FF00C0F0FF00B0C8D000D0B8B0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D0B8B000D0B8B000D0B0A00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D0B8B000D0B8B000D0B0A00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000737373007373730073737300737373007373730073737300737373007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009495D000090781005E61
      A5000000000000000000040D81009495D0000000000000000000000000000000
      000000000000000000002D2D66001F1F71001A1A6F00181861001A1A3A000000
      0000000000000000000000000000000000000000000000000000000000003E7A
      3E0021752100217521002175210021752100225B22002E5B2E00485B48006565
      6500737373000000000000000000000000000000000000000000C0686000B058
      5000A0505000A0505000A0505000904850009048400090484000804040008038
      4000803840007038400070383000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000060B8E000E74FF000023
      A900000A6E000023A900156AFD00060E90000000000000000000000000000000
      00003F3F8D002B2BDB003030F6003030F6003232EB003030F6002B2BF0005757
      E2000000000000000000000000000000000000000000000000002486240029AD
      29003CB73C004CBF4C0056C456002C962C0020811D0049B749002D9C2D001775
      17004659460073737300000000000000000000000000D0687000F0909000E080
      8000B048200040302000C0B8B000C0B8B000D0C0C000D0C8C00050505000A040
      3000A0403000A038300070384000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000595FB2001634B1001F76
      FF00003DC900257CFB002134B9005362AA000000000000000000000000004141
      AB003232F9004645D5009A96B500D1CABB00A8ACC400C7BEB4007B76AF003131
      E6003939EB0000000000000000000000000000000000000000001E891E003CB7
      3C0056C4560062CA620062C3620066A65D008FBC81005CC05C005CC05C0045BC
      45002069200073737300000000000000000000000000D0707000FF98A000F088
      8000E0808000705850004040300090787000F0E0E000F0E8E00090807000A040
      3000A0404000A04030008038400000000000C0908000C0908000C0908000C088
      8000C0888000B0888000C0A0A000C0A0A000C088800000000000131899000541
      CE003984FF000040D6001D1E9800FFFFFF0000000000000000006565B3003030
      F6006161C200E6E1CD00F9E8CF00F4D2AB00CDB0A800F7E0C500FDFAF200BEBB
      B2003937D7004141E700000000000000000000000000000000002486240047B9
      470062CA62007AD67A00308C3000EFF5E500CFE2C6004EAD4E006DCF6D0056C4
      56002870280073737300000000000000000000000000D0787000FFA0A000F090
      9000F0888000705850000000000040403000F0D8D000F0E0D00080786000B048
      4000B0484000A04040008040400000000000C0909000F0D8C000FFF8D000FFF0
      C000FFE8B000FFD8A000FFE0B000FFE0B000FFF0C0003430BF000018C2004965
      E9004850CC004761F6000018C200373AC10000000000000000003333DD004141
      E700E6E1CD00FDF6D400FAEBC000F7DFB300F3CC9A00F1C59200F8E4BB00FDFA
      F200A79E9F003030F6002D2DE600000000000000000000000000000000002081
      200062CA620041A04100BFD0AE00FFF6ED00FFF9F20041A041007AD67A0049B7
      4900648A640000000000000000000000000000000000D0788000FFA8B000FFA0
      A000F0909000705850007058500070585000705850007060500080686000C058
      5000B0505000B04840008040400000000000C0989000D0908000FFF0E000FFF8
      F000FFF8E000FFF8D000FFF0D000FFF0D000FFF8F000201EA000D2E2FF004F5B
      C0001519AD004D58D300D0E5F4002419AB00000000007C7CB7004040F4009291
      BE00FFFFE400FEFED700FFFFD900FEFED700FCF4CD00F6D9AA00F1C59200F3CD
      A300F6EDDE004844B9005757E200000000000000000000000000000000000000
      0000378A3700337F58004C92BE004C92BE0086A9B9003999390039993900568F
      56000000000000000000000000000000000000000000E0808000FFB0B000FFB0
      B000FFA0A000F0909000F0888000E0808000E0788000D0707000D0687000C060
      6000C0585000B05050009048400000000000D0989000FFE8B000D0908000F0F0
      E000FFF8F000FFF8E000FFF8E000FFF8E000F0F0E000FFFFFF00241BB8005357
      C000000000006556BF001C24B700FFFFFF00000000006A68BE005454F900CEC9
      C300FFFFFA00FFFFE400FFFFD900EFEFCF009D9D8C00E9E3C600EDCCA000EEB9
      8500FAECDE007068A8002D2DE600000000000000000000000000000000000000
      0000289EDF00248AE100288EEA002A90EE00288EEA001E6B81005A675A000000
      00000000000000000000000000000000000000000000E0889000FFB8C000FFB8
      B000D0606000C0605000C0585000C0504000B0503000B0483000A0402000A038
      1000C0606000C05850009048400000000000D0A09000FFF8E000F0D8B000C0A0
      A000F0F0E000FFF0E000FFF0E000F0F0E000F0E8E000C0A0A000F0D8B000FFF8
      E000D0A09000000000000000000000000000000000006D6DC7006C6CF800B3C0
      CA00DBECFC00FFFFFA00FFFFD900CECEB4004E4E4E004141410068645900D5B1
      87009A9FD7007068A8003131E600000000000000000000000000000000000000
      00002A90EE00389EFF00389EFF003AA0FF00389EFF003096F2004E5A61000000
      00000000000000000000000000000000000000000000E0909000FFC0C000D068
      6000FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000E0D0C000E0C8
      C000A0381000C06060009048500000000000D0A8A000F0E8C000D0989000A0F8
      FF00C0A09000C0909000C0888000B0909000B0989000A0F8FF00D0989000F0E8
      C000D0A8A000000000000000000000000000000000007F7FCB007676F400CCC2
      C700FFFFFA00FFFFFA00FFFFFA00FFFFD900E6E1CD0061615900BDB6A100F3CC
      9A00FAECDE005E59B3003E3EE50000000000000000000000000000000000289E
      DF003AA0FF0044AAFF0044AAFF0044AAFF0044AAFF0040A6FF003A6D90000000
      00000000000000000000000000000000000000000000E098A000FFC0C000D070
      7000FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000E0D0
      C000A0402000D0686000A050500000000000D0A8A000D0B0A000C0FFFF00C0FF
      FF00B0F8FF00B0F8FF00A0F0FF0090E8FF0080E0FF00C0FFFF00C0FFFF00D0B0
      A000D0A8A00000000000000000000000000000000000B2B2D4006D6DE500A8A2
      D400FBF5EA00FFFFFA00FFFFFA00FFFFFA00FFFFE800F3F3DB0061615900C1B3
      9E00D6CFB6003E3EE5006D6DE500000000000000000000000000000000004CA0
      DE0044AAFF004AB0FF004AB0FF004EB4FF004AB0FF004AB0FF003C7091000000
      00000000000000000000000000000000000000000000F0A0A000FFC0C000E078
      7000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8
      D000B0483000D0707000A050500000000000D0A8A000A0E8FF00A0E8FF00A0E8
      FF00A0E8FF0090E0FF0080D8FF0080D8F00070D0F000A0E8FF00A0E8FF00A0E8
      FF00D0A8A00000000000000000000000000000000000000000004A49B6009493
      F300D2C5C500FFFFFA00FFFFFA00FFFFFA00FFFFFA00FFFFFA00F3F3DB00E6E1
      CD006A68BE002B2BF0000000000000000000000000000000000000000000289E
      DF004EB4FF0058BEFF005BC1FF005BC1FF005BC1FF0058BEFF003C7091000000
      00000000000000000000000000000000000000000000F0A8A000FFC0C000E080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8
      E000B0503000E0788000A05050000000000000000000C6A39C00E0FFFF00E0FF
      FF00F0FFFF00F0FFFF00E0FFFF00C0FFFF00A0E8FF0080E8FF0080E0FF00BC9A
      9300000000000000000000000000000000000000000000000000000000006968
      DE009C9BEF00C9BEC700F6EDDE00FFFFFA00AED4F700FFFFFA00E0DFCC007373
      C8003030F6000000000000000000000000000000000000000000000000000EA1
      DF002CA2E9002D93DF003296DC0035B3E6001BC0FF003FB0FF004C7992000000
      00000000000000000000000000000000000000000000F0B0B000FFC0C000F088
      9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0
      F000C050400060303000B0585000000000000000000000000000CAA2A200F0FF
      FF00F0FFFF00FFFFFF00F0FFFF00D0FFFF00B0F8FF0090E8FF00BC8D94000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006666DE009493F3009E9CE400B4ADD500B8B0D3009390D7006160EF004242
      EF00000000000000000000000000000000000000000000000000000000003390
      BE0030CCFF00BFF2FF00D4F6FF0062E0FF000FC3FF001993DF004184A5000000
      00000000000000000000000000000000000000000000F0B0B000FFC0C000FF90
      9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8
      F000C0585000B0586000B058600000000000000000000000000000000000CAA2
      A200F0FFFF00F0FFFF00F0FFFF00E0FFFF00B0F8FF00BC8D9400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006D6DE5005858E1005757E2005757E2007979E4000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000488BF0032DBFF0078F0FF0056E8FF0011B8E6004184A500000000000000
      00000000000000000000000000000000000000000000F0B8B000F0B8B000F0B0
      B000F0B0B000F0A8B000F0A0A000E098A000E0909000E0909000E0889000E080
      8000D0788000D0787000D0707000000000000000000000000000000000000000
      0000C6A39C00C0A0A000C0A0A000C0989000C098900000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000056A2C200399CBE00469EBE006FA2BC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000700000000100010000000000800300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FE01807FFFFFFFFFFC00007FFFFF8003
      FC0000FFFC010001FC01007FFC010001FE0380FFFC010001FF03C0FF00010001
      FE0380FF00010001FC0300FF00010001E40300EF00010001C00300C700010001
      C00300E700030001000781C300070001000FC381007FF80301FFFF8100FFF807
      C3FFFF8101FFF80FC7FFFFC3FFFFFFFFFFFFFFFFD7FFFFEBFFFFFFFFE7FFFFE7
      F000FFDFC07FFE03F000FF8F80000001F800FF0700000000FC00DE0380000001
      FE008C01C0000003FE00870FE00000077C00C00FE00000071000E00FE0000007
      8000F01FE0000007C008F81FF001800FE03CFC3FF803C01FFFFEFFFFFC07E03F
      FFFFFFFFFE0FF07FFFFFFFFFFFFFFFFFFFFFFFFFFFC7FFFFFFFFFFFFFFC1FFFF
      80010381EA01007F80010381FFC1007F80010381FFCF000000010381FFFF0000
      00010381041F000000010001041F000000010001041F000000018003001F0000
      00038003803F00000007C107803F0000007FC107803FE00000FFE38F803FE000
      01FFE38FC47FFFFFFFFFFFFFC47FFFFFFFF1FFFFFFFFFFFF8000C007F81FFFFF
      80008003C01FFC0180000001801FFC0180010001801FFC018003000180070001
      8007000180070001800700018000000180078001800000018007C00180000001
      800FE00180000003800FE00380070007800FF003800F007F801FF801E01F00FF
      803FFC03F81F01FFFFFFFFFFFFFFFFFFFFFFFFC0FFEBFE01FFFF0000FFE70000
      FFFF0000FE030000E0000000000100002000000000000000E000000000010000
      2000000000030000E0000000000700002000000000070000E000000000070000
      2000000000070000E0008001800F8001FFFFC003C01FC003FFFFE00FE03FE00F
      FFFFF81FF07FF81FFFFFFC7FFFFFFC7FFFFFF00FFFFFFF8CFC1FE007C001FF80
      F00FC0038001FF80E007C00380010040C003C00382010000C001E00780010000
      8001F00F800100088001F01F800100078001F01F800100078001E01F80010007
      8001E01F80010007C003E01F8001800FE007E01F8001C01FF00FE01F8001E03F
      FC1FF03F8001F07FFFFFF87FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object atlTextBox: TActionList
    Left = 488
    Top = 464
    object aSynFind: TaSynFind
      Category = 'SynEdit'
      Caption = #26597#25214
    end
    object aSynFindNext: TaSynFindNext
      Category = 'SynEdit'
      Caption = #26597#25214#19979#19968#20010
    end
    object aSynCopy: TaSynCopy
      Category = 'SynEdit'
      Caption = #22797#21046
    end
    object aSynExporter: TaSynExporter
      Category = 'SynEdit'
      Caption = #23548#20986
    end
  end
  object iltStatusBar: TImageList
    Left = 648
    Top = 464
    Bitmap = {
      494C010101000400100010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      00000000000000000000000000000000000000000000F0E4DD00C2472F00C983
      6E0000000000000000000000000000000000C78E7F00A3453200892A17000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEDFD700D6A5
      9400C7755F00BF604600E3C6BB00B65D4B00BD736200D6A59400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E8D4C900C7796500A4331C00BF6658000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DC9D8900BD4B2F00DBB2A100AF412C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EAD1
      C700D4887000D4887000E5CFC200C9765D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D47D5F00C757
      3500C7573500B8432700AF382100A62E1A009F251400B8615700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0E4
      DD0000000000EEDFD700B23E2800D8C3B7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D3C4BB0015141300C4B5AC001817
      1700D2C7C100D3C4BB002D2B2A003C37330046403C00F0E4DD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008E8079001A191900756E6B005252
      5200A69C97002D2B2A007C747000AEAFAF001A242D00AC9C9200262220000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000051494500AC9C920074797A005E75
      84009A9B9C0041414000858688004A6170001E6E8B00223444009A9B9C000000
      00000000000000000000C0C8B600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EEDFD7008FA4AC0086D3
      E5004A617000A3ACB200465C6A0061C1DE004C616F0029B6E90015273300102C
      3A00152733006E6C6C003D7443005EB072000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6CBC4008FA4
      AC0083E1F6004A6170007ACDE2004C616F0065D2F200455D710032B2DF001D99
      C8001A88B3001F536D004F8458004CAC64000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6CB
      C4008FA4AC0083E1F6004A61700083E1F6003C59730065D2F20050C9EF003BBF
      EB0027B2E4001CA3D60064956E0053B46C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6CBC4008FA4AC0083E1F600455D710083E1F60077DBF40065D2F20050C9
      EF003BBFEB0029B6E90076A583005DC078000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6CBC4008FA4AC0083E1F60083E1F60083E1F60077DBF40065D2
      F2005FB2CF007A8B9600AEC1A60093D39A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6CBC4008FA4AC008FA4AC00889CA5008396A0007E90
      9A007A8B9600B1AEAC0099B89C00AEC1A6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF008F1F000000000000C03F000000000000
      F0FF000000000000F0FF000000000000E0FF000000000000C03F000000000000
      E8FF000000000000003F000000000000001F000000000000001D000000000000
      0000000000000000C000000000000000E000000000000000F000000000000000
      F800000000000000FC0000000000000000000000000000000000000000000000
      000000000000}
  end
  object tmrReadStatus: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = tmrReadStatusTimer
    Left = 456
    Top = 464
  end
  object iltStatus: TImageList
    Height = 12
    Width = 12
    Left = 680
    Top = 464
    Bitmap = {
      494C01010300040010000C000C00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000300000000C00000001002000000000000009
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004D58F9004D58F9004D58F9004D58F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ACACAC00ACACAC00ACAC
      AC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACAC
      AC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002F3F
      D1000F1EAE000413AD000011BB00081ABC002F3FD10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007C7C7C0075757500757575006C6C
      6C006C6C6C006C6C6C006C6C6C006C6C6C00666666006666660066666600ACAC
      AC00000000000000000000000000000000000000000000000000000000000000
      00003C9D3C0000000000000000000000000000000000000000002D3CC7002D3C
      C7005A68E5005360E5001426C2000116D2000116D2004F5CE900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000868686007C7C7C00EDA88A00E4A0
      8400DF9C8100DF9C8100DF9C8100DF9C8100D5967B006C6C6C0066666600ACAC
      AC0000000000000000000000000000000000000000000000000000000000127D
      1200008800001E821E0000000000000000000000000000000000000000000000
      000000000000000000005D6AEF000E21CD000018F7001125D800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400FBC0A8007C7C7C00F0B2
      9700ECAF9400ECAF9400ECAF9400E7AB92006C6C6C00D59D860066666600ACAC
      AC000000000000000000000000000000000000000000000000000F820F0000A5
      000000AB0000009B0000258F2500000000000000000000000000000000000000
      000000000000000000001C2DD300091FE900132EFF000D25FF001125D8004555
      EB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00FFCFBC00FCCBB6007C7C
      7C007C7C7C007C7C7C007C7C7C007C7C7C00E7B39D00DCAA96006C6C6C00ACAC
      AC000000000000000000000000000000000000000000127D12000088000000AB
      000000BA0000009B000000880000258F250000000000000000004F5CE9002634
      C800000000000000000000000000293DF7006072FF004D58F9004D58F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4A4A400FFDAC900FFD6C4007C7C
      7C00FFCFBC00FFCFBC00FFCFBC007C7C7C00ECBEAB00DFB9A8006C6C6C00ACAC
      AC002999290000000000000000000000000000000000000000002499240000BA
      000001C201002EA22E000000000000000000000000003547E4000318CF000116
      D2001728C4000000000000000000000000005054F700737BF800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4A4A400FEE7DE009C9C9C00FEE7
      DE00FEDFD200FEDFD200FEDFD200FEDFD2007C7C7C00E4C9BC006C6C6C00ACAC
      AC00000000001385130045A8450000000000000000002EA22E002EBD2E003ECD
      3E0017B517000000000000000000000000003F51E500081ABC000017E2000018
      F7000216C8001C2DC00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ACACAC007C7C7C00FFF5F300FFF5
      F300FFF5F300FFF5F300FFF5F300FFF5F300FFF2EE007C7C7C0075757500ACAC
      AC00000000000000000029AC290055BB550077C4770085CA850085CA850049BA
      49004AAC4A0000000000000000000000000000000000000000001125D800031C
      FF001125D8005C6AF20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ACACAC00ACACAC00ACACAC00A4A4
      A400A4A4A400A4A4A400A4A4A4009C9C9C0094949400868686007C7C7C000000
      000000000000000000000000000073BB79006ABB730077BD800066BA6E000000
      00000000000000000000000000000000000000000000000000005C6AF200384D
      FF004D58F9003B4DF6006E7BEF00707BF000384AE7002D3DE100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005260
      F700737BF8009096FF00737BF8004D58F9004F5CE90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004D58F9004D58F9004D58F900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000300000000C0000000100010000000000600000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFF0F0000000800FFFE070000000
      000FF7C030000000000FE3FC30000000000FC1FC00000000000F80CE10000000
      0007C3873000000000098703F0000000000C07C3F0000000001E1FC030000000
      FFFFFFE070000000FFFFFFF1F000000000000000000000000000000000000000
      000000000000}
  end
  object popContact: TdxBarPopupMenu
    BarManager = dxbmMain
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxmnuCreateContact'
      end
      item
        Visible = True
        ItemName = 'dxmnuReplaceContact'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'dxmnuCopyToClipboard'
      end
      item
        Visible = True
        ItemName = 'dxmnuCreateSMS'
      end>
    UseOwnFont = False
    Left = 552
    Top = 464
  end
end
