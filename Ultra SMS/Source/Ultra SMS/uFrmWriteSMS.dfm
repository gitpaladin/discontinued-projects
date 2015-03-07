object frmWriteSMS: TfrmWriteSMS
  Left = 264
  Top = 90
  Caption = #25776#20889#30701#20449
  ClientHeight = 607
  ClientWidth = 703
  Color = clBtnFace
  Constraints.MinHeight = 560
  Constraints.MinWidth = 490
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001000800680500001600000028000000100000002000
    0000010008000000000000010000000000000000000000010000000100000000
    0000795D130079601500666666006C6C6C00757575007C7C7C00816719008E73
    1E008E762200AA8D2900D9920C00C5A22E00CBA93400CEAD3A00E9B43100D8B4
    5100D4BA5500D9B65C00D7BE5E00E9BC4500CCB16700CCB77600CCB67B00CCB9
    7F00E9C04B00E9C15200F8CE5600F8D25F00D7C16500D7C46900DBC66C00D8C0
    7300FFD56D00E9C87400FFD77000FFDA7600FFDD7C0086868600949494009C9C
    9C00A4A4A400ACACAC00CCBC8A00DDD08500E3D48F00F3D68300FFDE8200FFDE
    8800E0CE9800E6D99900FFE28D00FFE49200FFE49A00E8DEAA00E8E0AD00FFE9
    A300FFEAA900FFEDB60081B5DF0084B9E40092C4EE00A8D8FC00B6DFFF00BEE0
    FF00FFF1C600FFF2CB00FFF3D100C6E5FF00CBE6FC00CFEAFF00D3EAFE00D8ED
    FF00DCF1FF00FFF5E900E7F5FF00F3FFFF000000000000000000000000000000
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
    0000000000000000000000000000000000000000000000000000FFFFFF000000
    0000000000000000000000000000002A2A2A2A2A2A2A2A2A2A2A2A2A00000605
    0504040404040404040303032A0026063D3C3B0A07020101010101010100273E
    063D3D0E251A19140F0F0F0B070028403F063E133A3330332423211B08002945
    4440061D3A1616202524231B080029474626441D3A3534332F25241C09002949
    2848471D411817161615222109002A294B4B4B1D4138353533332F2109002A4C
    4C4C4C1D412B181816162E2409002A2A2A29291E42393938350D0E0C0A000000
    0000001E432B3139350E1210000000000000002C4A4342424111130000000000
    00000037363232322D1F0000000000000000000000000000000000000000FFFF
    0000800300000001000000010000000100000001000000010000000100000001
    0000000100000001000000010000F8030000F8070000F80F0000FFFF0000}
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object stbMain: TdxStatusBar
    Left = 0
    Top = 585
    Width = 703
    Height = 22
    Images = iltStatusBar
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 0
        Fixed = False
        Text = #20849' 0 '#20010#25910#20214#20154
        Width = 120
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 1
        Fixed = False
        Text = #20998#21106' 0 '#26465#30701#20449
        Width = 120
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 2
        Fixed = False
        Text = #21512#35745' 0 '#26465#30701#20449
        Width = 120
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 3
        Fixed = False
        Text = '0/0'
        Width = 80
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 4
        Fixed = False
        Text = 'GSM '#23383#31526#38598
        Width = 120
      end
      item
        PanelStyleClassName = 'TdxStatusBarKeyboardStatePanelStyle'
        PanelStyle.KeyboardStates = [dxksCapsLock, dxksNumLock, dxksInsert]
        PanelStyle.CapsLockKeyAppearance.ActiveCaption = #22823#20889
        PanelStyle.CapsLockKeyAppearance.InactiveCaption = #22823#20889
        PanelStyle.NumLockKeyAppearance.ActiveCaption = #25968#23383
        PanelStyle.NumLockKeyAppearance.InactiveCaption = #25968#23383
        PanelStyle.ScrollLockKeyAppearance.ActiveCaption = #28378#21160
        PanelStyle.ScrollLockKeyAppearance.InactiveCaption = #28378#21160
        PanelStyle.InsertKeyAppearance.InactiveFontColor = clWindowText
        PanelStyle.InsertKeyAppearance.ActiveCaption = #35206#30422
        PanelStyle.InsertKeyAppearance.InactiveCaption = #25554#20837
        Text = #38190#30424#29366#24577
      end>
    PaintStyle = stpsOffice11
    ParentFont = True
  end
  object dxdsWriteSMS: TdxDockSite
    Left = 0
    Top = 79
    Width = 703
    Height = 506
    AllowDockClients = [dtLeft, dtTop, dtRight, dtBottom]
    Align = alClient
    ExplicitTop = 0
    ExplicitHeight = 585
    DockType = 0
    OriginalWidth = 703
    OriginalHeight = 506
    object dxLayoutDockSite2: TdxLayoutDockSite
      Left = 0
      Top = 185
      Width = 703
      Height = 321
      DockType = 1
      OriginalWidth = 300
      OriginalHeight = 200
      object dxLayoutDockSite3: TdxLayoutDockSite
        Left = 0
        Top = 105
        Width = 703
        Height = 216
        DockType = 1
        OriginalWidth = 300
        OriginalHeight = 200
        object dxLayoutDockSite1: TdxLayoutDockSite
          Left = 0
          Top = 0
          Width = 703
          Height = 216
          DockType = 1
          OriginalWidth = 300
          OriginalHeight = 200
        end
        object dxdpSMS: TdxDockPanel
          Left = 0
          Top = 0
          Width = 703
          Height = 216
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AllowDockClients = []
          AllowFloating = False
          AllowDock = [dtClient]
          AutoHide = False
          Caption = #30701#20449#20869#23481
          CaptionButtons = []
          ShowCaption = False
          DockType = 1
          OriginalWidth = 185
          OriginalHeight = 140
          object txtSMS: TSynEditor
            Left = 0
            Top = 0
            Width = 699
            Height = 212
            Align = alClient
            CodeFolding.CaseSensitive = False
            CodeFolding.CollapsedCodeHint = False
            CodeFolding.FolderBarLinesColor = 12562872
            CodeFolding.HighlighterFoldRegions = False
            CodeFolding.HighlightIndentGuides = False
            CodeFolding.IndentGuides = False
            CodeFolding.ShowCollapsedLine = False
            ActiveLine.Background = 16710131
            ActiveLine.Foreground = 12999969
            ActiveLine.Indicator.MaskColor = clBlack
            ActiveLine.Indicator.Visible = False
            ActiveLine.Visible = True
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
            BlockWidth = 0
            Background.Visible = False
            Background.RepeatMode = brmNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = []
            TabOrder = 0
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
            Options = [eoAltSetsColumnMode, eoDragDropEditing, eoGroupUndo, eoHideShowScrollbars, eoShowScrollHint]
            WantTabs = True
            WordWrap.Enabled = True
            WordWrap.Position = 80
            WordWrap.Style = wwsClientWidth
            WordWrap.Indicator.Visible = False
            OnChange = txtSMSChange
            DocumentState = smsNormal
            DocumentFormat = sffDos
          end
        end
      end
      object dxdpOriginalInfo: TdxDockPanel
        Left = 0
        Top = 0
        Width = 703
        Height = 105
        AllowFloating = True
        AutoHide = False
        Caption = #21407#22987#20449#24687
        ShowCaption = False
        TabPosition = tctpTop
        OnClose = dxdpOriginalInfoClose
        DockType = 3
        OriginalWidth = 185
        OriginalHeight = 105
        inline fraInfoPreview: TfraInfoPreview
          Left = 0
          Top = 0
          Width = 699
          Height = 101
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 699
          ExplicitHeight = 101
          inherited pnlHeader: TPanel
            Width = 699
            ExplicitWidth = 699
            inherited txtPerson: TEdit
              ReadOnly = True
            end
            inherited txtDate: TEdit
              Width = 621
              ReadOnly = True
              ExplicitWidth = 621
            end
          end
          inherited txtContent: TSynMemo
            Width = 699
            Height = 60
            ExplicitWidth = 699
            ExplicitHeight = 60
          end
        end
      end
    end
    object dxdpAddressee: TdxDockPanel
      Left = 0
      Top = 0
      Width = 703
      Height = 185
      AllowFloating = True
      AutoHide = False
      Caption = #25910#20214#20154
      ShowCaption = False
      TabPosition = tctpTop
      OnClose = dxdpAddresseeClose
      DockType = 3
      OriginalWidth = 185
      OriginalHeight = 185
      object bdcSearchArea: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 699
        Height = 28
        Align = dalTop
        AllowDocking = False
        BarManager = dxbmMain
        SunkenBorder = False
        UseOwnSunkenBorder = True
      end
      object pnlAddressee: TPanel
        Left = 0
        Top = 28
        Width = 699
        Height = 153
        Align = alClient
        BevelOuter = bvNone
        Constraints.MinHeight = 153
        TabOrder = 1
        OnResize = pnlAddresseeResize
        object splAddressee: TSplitter
          Left = 185
          Top = 0
          Width = 4
          Height = 153
          OnMoved = splAddresseeMoved
          ExplicitHeight = 154
        end
        object pnlButtons: TPanel
          Left = 189
          Top = 0
          Width = 41
          Height = 153
          Align = alLeft
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object btnAddAll: TSpeedButton
            Left = 2
            Top = 0
            Width = 33
            Height = 33
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000000000000000
              0080000080000000000000000000000080000080000000000000000000000000
              000000000000000000000000000000000080004BB55300800000000000000000
              80004BB553008000000000000000000000000000000000000000000000000000
              00800043BA554DB95D00800000000000800043BA554DB95D0080000000000000
              000000000000000000000080000080000080005BBB6862CC815BBB6800800000
              80005BBB6862CC815BBB6800800000000000000000000000000000800086A583
              80AE7F60C77A71D69371D48D64AC6C00800060C77A71D69371D48D64AC6C0080
              000000000000000000000080007ACA7F51CA7764D08674D89686DAA37BD8986D
              AE7200800074D89686DAA37BD8986DAE7200800000000000000000800089CC8E
              5CCF8866D28D76D6988BDCA89CE0B089DE9F76B17A0080008BDCA89CE0B089DE
              9F76B17A00800000000000800089CC8E5CCF8866D28D71D6938BDCA89CE0B0AB
              E4BD93DEA56DAE720080009CE0B0ABE4BD93DEA56DAE7200800000800080CE8B
              5CCE8766D29278D6998BDCA89CE0B0A8E5C1A2E1B066C7720080009CE0B0A8E5
              C1A2E1B066C77200800000800089CC8E5CCE8766D28D76D6988BDCA89CE0B09C
              E0B080CE8B0080008BDCA89CE0B09CE0B080CE8B00800000000000800080CE8B
              5CCE8766D2927ED79686DAA389DE9F6ECA800080007ED79686DAA389DE9F6ECA
              8000800000000000000000800070B26A4FAE5F5DCA7C76D6987ED79669C77B00
              80005DCA7C76D6987ED79669C77B008000000000000000000000008000008000
              00800066C77266D28D5BC87200800000800066C77266D28D5BC8720080000000
              0000000000000000000000000000000000800051BE665BC46F00800000000000
              800051BE665BC46F008000000000000000000000000000000000000000000000
              00800056B65C00800000000000000000800056B65C0080000000000000000000
              0000000000000000000000000000000000800000800000000000000000000000
              8000008000000000000000000000000000000000000000000000}
            OnClick = btnAddAllClick
          end
          object btnAddSel: TSpeedButton
            Left = 2
            Top = 40
            Width = 33
            Height = 33
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000010000000000000080
              00003CA9520045A6500042AA52004FAE5F004BB5530043BA55004DB95D0056B6
              5C0056AB600051BE66005BBB680064AC6C0070B26A006DAE720073A1750076A1
              7B007CA67E0076B17A0044C56C005BC46F0047C67A004DCA7A0051CA77005BC8
              72005DCA7C0066C7720060C77A0069C77B007ACA7F0080AE7F0053CD81005CCE
              87005CCF880062CC81006ECA800064D0860066D28D0071D48D0066D2920071D6
              93007ED7960074D8960076D6980078D699007BD8980086A5830080CE8B0089CC
              8E0089DE9F0086DAA3008BDCA80093DEA5009CE0B000A2E1B000ABE4BD00A8E5
              C100BCECCF00C2EDD400C9F1D700D2F3DC00D1F3E000E0F7E800000000000000
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
              00000000000000000000000000000000000000000000FFFFFF00000000000000
              0001010000000000000000000000000000010601000000000000000000000000
              0001070801000000000001010101010101010C230C0100000000012F10101112
              121F1C29270D01000000011E3E3A37291418252B332E0F01000001313D3B3926
              2022262C34363213010001313D3B361620222629343638350F0101303D3C2817
              2021282D343639371B0101313E3C16162021262C34363630010001303F3D1717
              1721282A333224010000010E0A0A020304051A2C2A1D01000000010101010101
              01011B2619010000000000000000000000010B15010000000000000000000000
              0001090100000000000000000000000000010100000000000000}
            OnClick = btnAddSelClick
          end
          object btnDelete: TSpeedButton
            Left = 2
            Top = 80
            Width = 33
            Height = 33
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000000000000000
              0000000000000000000000000000000080000080000000000000000000000000
              000000000000000000000000000000000000000000000000000000000080004B
              B553008000000000000000000000000000000000000000000000000000000000
              0000000000000000000080004DB95D43BA550080000000000000000000000000
              000000000000000000000000000000000000000000000080005BBB6862CC815B
              BB68008000008000008000008000008000008000008000008000000000000000
              00000000800064AC6C71D48D71D69360C77A80AE7F7CA67E7CA67E76A17B73A1
              7573A17586A5830080000000000000000080006DAE727BD89886DAA374D89664
              D08651CA7744C56C71D693A2E1B0BCECCFD1F3E07ACA7F008000000000008000
              76B17A89DE9F9CE0B08BDCA876D69866D28D5CCF8853CD8166D28DA8E5C1C2ED
              D4D2F3DC89CC8E0080000080006DAE7293DEA5ABE4BD9CE0B08BDCA871D69366
              D28D5CCF8853CD8147C67A9CE0B0C2EDD4D2F3DC89CC8E00800000800066C772
              A2E1B0A8E5C19CE0B08BDCA878D69966D2925CCE8753CD814DCA7A66D292C9F1
              D7D2F3DC80CE8B00800000000000800080CE8B9CE0B09CE0B08BDCA876D69866
              D28D5CCE8753CD8147C67A47C67AC9F1D7D1F3E089CC8E008000000000000000
              0080006ECA8089DE9F86DAA37ED79666D2925CCE874DCA7A4DCA7A4DCA7AD2F3
              DCE0F7E880CE8B00800000000000000000000000800069C77B7ED79676D6985D
              CA7C4FAE5F42AA5245A6503CA95256AB6056AB6070B26A008000000000000000
              0000000000000080005BC87266D28D66C7720080000080000080000080000080
              000080000080000080000000000000000000000000000000000080005BC46F51
              BE66008000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000800056B65C0080000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              8000008000000000000000000000000000000000000000000000}
            OnClick = btnDeleteClick
          end
          object btnDelAll: TSpeedButton
            Left = 2
            Top = 120
            Width = 33
            Height = 33
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000000000000000
              0000000000000000000000000000000080000080000000000000000000000080
              000080000000000000000000000000000000000000000000000000000080004B
              B5530080000000000000000080004BB553008000000000000000000000000000
              0000000000000000000080004DB95D43BA550080000000000080004DB95D43BA
              550080000000000000000000000000000000000000000080005BBB6862CC815B
              BB680080000080005BBB6862CC815BBB68008000008000008000000000000000
              00000000800064AC6C71D48D71D69360C77A00800064AC6C71D48D71D69360C7
              7A80AE7F86A5830080000000000000000080006DAE727BD89886DAA374D89600
              80006DAE727BD89886DAA374D89664D08651CA777ACA7F008000000000008000
              76B17A89DE9F9CE0B08BDCA800800076B17A89DE9F9CE0B08BDCA876D69866D2
              8D5CCF8889CC8E0080000080006DAE7293DEA5ABE4BD9CE0B00080006DAE7293
              DEA5ABE4BD9CE0B08BDCA871D69366D28D5CCF8889CC8E00800000800066C772
              A2E1B0A8E5C19CE0B000800066C772A2E1B0A8E5C19CE0B08BDCA878D69966D2
              925CCE8780CE8B00800000000000800080CE8B9CE0B09CE0B08BDCA800800080
              CE8B9CE0B09CE0B08BDCA876D69866D28D5CCE8789CC8E008000000000000000
              0080006ECA8089DE9F86DAA37ED7960080006ECA8089DE9F86DAA37ED79666D2
              925CCE8780CE8B00800000000000000000000000800069C77B7ED79676D6985D
              CA7C00800069C77B7ED79676D6985DCA7C4FAE5F70B26A008000000000000000
              0000000000000080005BC87266D28D66C7720080000080005BC87266D28D66C7
              720080000080000080000000000000000000000000000000000080005BC46F51
              BE660080000000000080005BC46F51BE66008000000000000000000000000000
              00000000000000000000000000800056B65C00800000000000000000800056B6
              5C00800000000000000000000000000000000000000000000000000000000000
              8000008000000000000000000000008000008000000000000000}
            OnClick = btnDelAllClick
          end
        end
        object vstPhoneBook: TVirtualStringTree
          Left = 0
          Top = 0
          Width = 185
          Height = 153
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header.AutoSizeIndex = 0
          Header.DefaultHeight = 17
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Header.Images = iltHeader
          Header.Options = [hoColumnResize, hoDblClickResize, hoDrag, hoShowImages, hoVisible]
          Header.SortColumn = 0
          Images = iltStatusBar
          IncrementalSearch = isVisibleOnly
          ParentFont = False
          TabOrder = 1
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoTristateTracking, toAutoDeleteMovedNodes]
          TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toInitOnSave, toReportMode, toToggleOnDblClick, toWheelPanning, toFullRowDrag]
          TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowTreeLines, toThemeAware, toUseBlendedImages]
          TreeOptions.SelectionOptions = [toFullRowSelect, toMultiSelect, toSimpleDrawSelection]
          OnCompareNodes = vstPhoneBookCompareNodes
          OnDblClick = btnAddSelClick
          OnGetText = vstPhoneBookGetText
          OnGetImageIndex = vstPhoneBookGetImageIndex
          OnGetHint = vstPhoneBookGetHint
          OnHeaderClick = vstPhoneBookHeaderClick
          OnKeyDown = vstPhoneBookKeyDown
          Columns = <
            item
              Color = 16250871
              ImageIndex = 0
              Layout = blGlyphRight
              MinWidth = 60
              Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coResizable, coShowDropMark, coVisible]
              Position = 0
              Width = 60
              WideText = #22995#21517
            end
            item
              Layout = blGlyphRight
              MinWidth = 60
              Position = 1
              Width = 60
              WideText = #21495#30721
            end
            item
              Layout = blGlyphRight
              MinWidth = 60
              Position = 2
              Width = 61
              WideText = #20998#31867
            end>
        end
        object vstAddressee: TVirtualStringTree
          Left = 230
          Top = 0
          Width = 469
          Height = 153
          Align = alClient
          EditDelay = 200
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header.AutoSizeIndex = 0
          Header.DefaultHeight = 17
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Header.Options = [hoColumnResize, hoDblClickResize, hoDrag, hoShowImages, hoVisible]
          Images = iltStatusBar
          ParentFont = False
          TabOrder = 2
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoTristateTracking, toAutoDeleteMovedNodes, toDisableAutoscrollOnEdit]
          TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toFullRepaintOnResize, toGridExtensions, toInitOnSave, toReportMode, toToggleOnDblClick, toWheelPanning, toFullRowDrag]
          TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowTreeLines, toThemeAware, toUseBlendedImages]
          TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toLevelSelectConstraint, toMiddleClickSelect, toMultiSelect, toRightClickSelect, toSimpleDrawSelection]
          OnCompareNodes = vstPhoneBookCompareNodes
          OnDblClick = vstAddresseeDblClick
          OnGetText = vstPhoneBookGetText
          OnGetImageIndex = vstPhoneBookGetImageIndex
          OnKeyAction = vstAddresseeKeyAction
          OnKeyDown = vstAddresseeKeyDown
          OnNewText = vstAddresseeNewText
          Columns = <
            item
              Position = 0
              Width = 107
              WideText = #22995#21517
            end
            item
              Position = 1
              Width = 100
              WideText = #21495#30721
            end>
        end
      end
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
    ImageOptions.StretchGlyphs = False
    MenuAnimations = maFade
    MenusShowRecentItemsFirst = False
    PopupMenuLinks = <>
    StoreInIniFile = True
    Style = bmsOffice11
    UseSystemFont = True
    Left = 464
    Top = 536
    DockControlHeights = (
      0
      0
      79
      0)
    object dxbrMainMenu: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = #20027#33756#21333
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 142
      FloatTop = 110
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
          ItemName = 'mnuInsert'
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
    object dxbrMainBar: TdxBar
      AllowCustomizing = False
      Caption = #24037#20855#26639
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 27
      DockingStyle = dsTop
      FloatLeft = 363
      FloatTop = 257
      FloatClientWidth = 610
      FloatClientHeight = 44
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxlbSend'
        end
        item
          Visible = True
          ItemName = 'dxlbOutbox'
        end
        item
          Visible = True
          ItemName = 'dxlbDraft'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxlbUndo'
        end
        item
          Visible = True
          ItemName = 'dxllbRedo'
        end
        item
          Visible = True
          ItemName = 'dxlbCut'
        end
        item
          Visible = True
          ItemName = 'dxlbCopy'
        end
        item
          Visible = True
          ItemName = 'dxlbPaste'
        end
        item
          Visible = True
          ItemName = 'dxlbPrintPreview'
        end
        item
          Visible = True
          ItemName = 'dxlbPrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxlbPhonebook'
        end
        item
          Visible = True
          ItemName = 'dxlbReport'
        end>
      OldName = 'GeneralToolbar'
      OneOnRow = True
      Row = 1
      SizeGrip = False
      UseOwnFont = False
      UseRecentItems = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object dxbrIncrementalSearch: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowReset = False
      Caption = #25910#20214#20154#26597#35810
      CaptionButtons = <>
      DockControl = bdcSearchArea
      DockedDockControl = bdcSearchArea
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 729
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Hidden = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxlblFind'
        end
        item
          Visible = True
          ItemName = 'dxtxtName'
        end
        item
          Visible = True
          ItemName = 'dxlblFilter'
        end
        item
          Visible = True
          ItemName = 'dxtxtSpelling'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      RotateWhenVertical = False
      Row = 0
      ShowMark = False
      SizeGrip = False
      UseOwnFont = False
      UseRecentItems = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object mnuSMS: TdxBarSubItem
      Caption = #30701#20449'(&S)'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mnuSMSSend'
        end
        item
          Visible = True
          ItemName = 'mnuSMSSaveDraft'
        end
        item
          Visible = True
          ItemName = 'mnuSMSSaveOutbox'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuSMSSaveAs'
        end
        item
          Visible = True
          ItemName = 'mnuSMSImport'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuSMSPrintPreivew'
        end
        item
          Visible = True
          ItemName = 'mnuSMSPrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuSMSExit'
        end>
    end
    object mnuSMSSend: TdxBarButton
      Caption = #31435#21363#21457#36865'(&S)'
      Category = 0
      Hint = #31435#21363#21457#36865'(S)'
      Visible = ivAlways
      ImageIndex = 0
      ShortCut = 16397
      OnClick = mnuSMSSendClick
    end
    object mnuSMSSaveDraft: TdxBarButton
      Caption = #20445#23384#33267#33609#31295'(&D)'
      Category = 0
      Hint = #20445#23384#33267#33609#31295'(D)'
      Visible = ivAlways
      ImageIndex = 2
      ShortCut = 16467
      OnClick = mnuSMSSaveDraftClick
    end
    object mnuSMSSaveOutbox: TdxBarButton
      Caption = #20445#23384#33267#21457#20214#31665'(&O)'
      Category = 0
      Hint = #20445#23384#33267#21457#20214#31665'(O)'
      Visible = ivAlways
      ImageIndex = 1
      ShortCut = 8305
      OnClick = mnuSMSSaveOutboxClick
    end
    object mnuSMSSaveAs: TdxBarButton
      Action = aSynSaveAs
      Caption = #20869#23481#21478#23384#20026'(&A)...'
      Category = 0
      ImageIndex = 3
      ShortCut = 24659
    end
    object mnuSMSImport: TdxBarButton
      Action = aSynInsertFile
      Caption = #23548#20837#25991#26412'(&I)...'
      Category = 0
      ImageIndex = 4
    end
    object mnuSMSExit: TdxBarButton
      Caption = #20851#38381'(&C)'
      Category = 0
      Hint = #20851#38381'(C)'
      Visible = ivAlways
      ImageIndex = 5
      ShortCut = 32883
      OnClick = mnuSMSExitClick
    end
    object mnuEdit: TdxBarSubItem
      Caption = #32534#36753'(&E)'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mnuEditUndo'
        end
        item
          Visible = True
          ItemName = 'mnuEditRedo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuEditCut'
        end
        item
          Visible = True
          ItemName = 'mnuEditCopy'
        end
        item
          Visible = True
          ItemName = 'mnuEditPaste'
        end
        item
          Visible = True
          ItemName = 'mnuEditDelete'
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
          Visible = True
          ItemName = 'mnuEditReplace'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxbrAddressee'
        end>
    end
    object mnuEditUndo: TdxBarButton
      Action = aSynUndo
      Caption = #25764#38144'(&U)'
      Category = 0
      ImageIndex = 6
    end
    object mnuEditRedo: TdxBarButton
      Action = aSynRedo
      Caption = #37325#20570'(&R)'
      Category = 0
      ImageIndex = 7
    end
    object mnuEditCut: TdxBarButton
      Action = aSynCut
      Caption = #21098#20999'(&T)'
      Category = 0
      ImageIndex = 8
    end
    object mnuEditCopy: TdxBarButton
      Action = aSynCopy
      Caption = #22797#21046'(&C)'
      Category = 0
      ImageIndex = 9
    end
    object mnuEditPaste: TdxBarButton
      Action = aSynPaste
      Caption = #31896#36148'(&P)'
      Category = 0
      ImageIndex = 10
    end
    object mnuEditDelete: TdxBarButton
      Action = aSynClearAll
      Caption = #28165#31354'(&L)'
      Category = 0
    end
    object mnuEditFind: TdxBarButton
      Action = aSynFind
      Caption = #26597#25214'(&F)...'
      Category = 0
      ImageIndex = 11
      ShortCut = 16454
    end
    object mnuEditFindNext: TdxBarButton
      Action = aSynFindNext
      Caption = #26597#25214#19979#19968#20010'(&N)'
      Category = 0
      ImageIndex = 12
      ShortCut = 114
    end
    object mnuEditReplace: TdxBarButton
      Action = aSynReplace
      Caption = #26367#25442'(&A)...'
      Category = 0
      ImageIndex = 13
      ShortCut = 16466
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
          ItemName = 'mnuViewStatusBar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuViewAddressee'
        end
        item
          Visible = True
          ItemName = 'dxmnuViewOriginal'
        end>
    end
    object mnuViewToolbar: TdxBarButton
      Caption = #24120#35268#24037#20855#26639'(&T)'
      Category = 0
      Hint = #24120#35268#24037#20855#26639'(T)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = mnuViewToolbarClick
    end
    object mnuViewAddressee: TdxBarButton
      Caption = #25910#20214#20154'(&A)'
      Category = 0
      Hint = #25910#20214#20154'(A)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = mnuViewAddresseeClick
    end
    object mnuViewStatusBar: TdxBarButton
      Caption = #29366#24577#26639'(&S)'
      Category = 0
      Hint = #29366#24577#26639'(S)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = mnuViewStatusBarClick
    end
    object mnuInsert: TdxBarSubItem
      Caption = #25554#20837'(&I)'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mnuInsertDate'
        end
        item
          Visible = True
          ItemName = 'mnuInsertTime'
        end
        item
          Visible = True
          ItemName = 'mnuInsertDateTime'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuInsertPhoneBook'
        end>
    end
    object mnuInsertDate: TdxBarButton
      Caption = #26085#26399'(&D)'
      Category = 0
      Hint = #26085#26399'(D)'
      Visible = ivAlways
      ImageIndex = 15
      OnClick = mnuInsertDateClick
    end
    object mnuInsertTime: TdxBarButton
      Caption = #26102#38388'(&T)'
      Category = 0
      Hint = #26102#38388'(T)'
      Visible = ivAlways
      ImageIndex = 16
      OnClick = mnuInsertTimeClick
    end
    object mnuInsertDateTime: TdxBarButton
      Caption = #26085#26399#21644#26102#38388'(&A)'
      Category = 0
      Hint = #26085#26399#21644#26102#38388'(A)'
      Visible = ivAlways
      ShortCut = 116
      OnClick = mnuInsertDateTimeClick
    end
    object mnuInsertPhoneBook: TdxBarButton
      Caption = #30005#35805#31807#26465#30446'(&P)'
      Category = 0
      Hint = #30005#35805#31807#26465#30446'(P)'
      Visible = ivAlways
      ImageIndex = 17
      ShortCut = 113
      OnClick = mnuInsertPhoneBookClick
    end
    object mnuOption: TdxBarSubItem
      Caption = #36873#39033'(&O)'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mnuOptionIns'
        end
        item
          Visible = True
          ItemName = 'mnuOptionWordWrap'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxmnuOptionReport'
        end
        item
          Visible = True
          ItemName = 'dxmnuOptionAutoPrefix'
        end>
    end
    object mnuOptionIns: TdxBarButton
      Caption = #25554#20837#27169#24335'(&I)    Insert'
      Category = 0
      Hint = #25554#20837#27169#24335'(I)    Insert'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = mnuOptionInsClick
    end
    object mnuOptionWordWrap: TdxBarButton
      Caption = #33258#21160#25442#34892'(&W)'
      Category = 0
      Hint = #33258#21160#25442#34892'(W)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = mnuOptionWordWrapClick
    end
    object dxlbSend: TdxBarLargeButton
      Caption = #31435#21363#21457#36865
      Category = 0
      Hint = #31435#21363#21457#36865#25776#20889#30340#30701#20449
      Visible = ivAlways
      LargeImageIndex = 0
      OnClick = mnuSMSSendClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 0
    end
    object dxlbOutbox: TdxBarLargeButton
      Caption = #21457#20214#31665
      Category = 0
      Hint = #23558#25776#20889#22909#30340#30701#20449#20445#23384#21040#21457#20214#31665#20399#21457
      Visible = ivAlways
      LargeImageIndex = 1
      OnClick = mnuSMSSaveOutboxClick
      AutoGrayScale = False
    end
    object dxlbDraft: TdxBarLargeButton
      Caption = #20445#23384
      Category = 0
      Hint = #23558#25776#20889#30340#30701#20449#20445#23384#21040#33609#31295#31665
      Visible = ivAlways
      LargeImageIndex = 2
      OnClick = mnuSMSSaveDraftClick
      AutoGrayScale = False
    end
    object dxlbCut: TdxBarLargeButton
      Action = aSynCut
      Caption = #21098#20999
      Category = 0
      Hint = #21098#20999#21040#21098#36148#26495
      LargeImageIndex = 5
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 8
    end
    object dxlbCopy: TdxBarLargeButton
      Action = aSynCopy
      Caption = #22797#21046
      Category = 0
      Hint = #22797#21046#20869#23481#21040#21098#36148#26495
      LargeImageIndex = 6
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 9
    end
    object dxlbPaste: TdxBarLargeButton
      Action = aSynPaste
      Caption = #31896#36148
      Category = 0
      LargeImageIndex = 7
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 10
    end
    object dxlbPhonebook: TdxBarLargeButton
      Caption = #25554#20837#30005#35805#31807
      Category = 0
      Hint = #23558#36873#25321#30340#32852#31995#20154#26465#30446#25554#20837#21040#30701#20449#20013
      Visible = ivAlways
      LargeImageIndex = 8
      OnClick = mnuInsertPhoneBookClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 17
    end
    object dxbrAddressee: TdxBarButton
      Caption = #36873#25321#25910#20214#20154'(&S)'
      Category = 0
      Hint = #36873#25321#25910#20214#20154'(S)'
      Visible = ivAlways
      ImageIndex = 14
      ShortCut = 115
      OnClick = dxbrAddresseeClick
    end
    object dxlbUndo: TdxBarLargeButton
      Action = aSynUndo
      Caption = #25764#38144
      Category = 0
      Hint = #25764#38144#19978#27425#25805#20316
      LargeImageIndex = 3
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 6
    end
    object dxllbRedo: TdxBarLargeButton
      Action = aSynRedo
      Caption = #37325#20570
      Category = 0
      Hint = #37325#20570#19978#27425#25805#20316
      LargeImageIndex = 4
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 7
    end
    object mnuSMSPrint: TdxBarButton
      Caption = #25171#21360'(&P)...'
      Category = 0
      Hint = #25171#21360'(P)'
      Visible = ivAlways
      ImageIndex = 19
      ShortCut = 16464
      OnClick = mnuSMSPrintClick
    end
    object mnuSMSPrintPreivew: TdxBarButton
      Caption = #25171#21360#39044#35272'(&R)..'
      Category = 0
      Hint = #25171#21360#39044#35272'(R)..'
      Visible = ivAlways
      ImageIndex = 18
      ShortCut = 24656
      OnClick = mnuSMSPrintPreivewClick
    end
    object dxlbPrint: TdxBarLargeButton
      Caption = #25171#21360
      Category = 0
      Hint = #25171#21360#30701#20449#26465#30446
      Visible = ivAlways
      LargeImageIndex = 10
      OnClick = mnuSMSPrintClick
      SyncImageIndex = False
      ImageIndex = 19
    end
    object dxlbPrintPreview: TdxBarLargeButton
      Caption = #25171#21360#39044#35272
      Category = 0
      Hint = #25171#21360#39044#35272#30701#20449#26465#30446
      Visible = ivAlways
      LargeImageIndex = 9
      OnClick = mnuSMSPrintPreivewClick
      SyncImageIndex = False
      ImageIndex = 18
    end
    object dxlbReport: TdxBarLargeButton
      Caption = #28040#24687#25253#21578
      Category = 0
      Hint = #28040#24687#25253#21578
      Visible = ivAlways
      ButtonStyle = bsChecked
      LargeImageIndex = 11
      OnClick = dxmnuOptionReportClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 20
    end
    object dxmnuOptionReport: TdxBarButton
      Caption = #35201#27714#28040#24687#25253#21578'(&R)'
      Category = 0
      Hint = #35201#27714#28040#24687#25253#21578'(R)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      ImageIndex = 20
      ShortCut = 117
      OnClick = dxmnuOptionReportClick
    end
    object dxmnuOptionAutoPrefix: TdxBarButton
      Caption = #33258#21160#28155#21152#21495#30721#21069#32512'(&P)'
      Category = 0
      Hint = #33258#21160#28155#21152#21495#30721#21069#32512'(P)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = dxmnuOptionAutoPrefixClick
    end
    object dxmnuViewOriginal: TdxBarButton
      Caption = #21407#22987#20449#24687'(&R)'
      Category = 0
      Hint = #21407#22987#20449#24687'(R)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = dxmnuViewOriginalClick
    end
    object dxtxtName: TdxBarEdit
      Caption = #26597#25214
      Category = 0
      Hint = #26597#25214
      Visible = ivAlways
      OnCurChange = txtNameChange
      OnKeyDown = txtNameKeyDown
      ImageIndex = 21
      Width = 100
    end
    object dxlblFind: TdxBarStatic
      Caption = #26597#25214' '
      Category = 0
      Hint = #26597#25214' '
      Visible = ivAlways
      Alignment = taLeftJustify
      ImageIndex = 21
    end
    object dxlblFilter: TdxBarStatic
      Align = iaRight
      Caption = #36807#28388' '
      Category = 0
      Hint = #36807#28388' '
      Visible = ivAlways
      Alignment = taLeftJustify
      ImageIndex = 22
    end
    object dxtxtSpelling: TdxBarEdit
      Align = iaClient
      Caption = #36807#28388
      Category = 0
      Hint = #36807#28388
      Visible = ivAlways
      OnCurChange = dxtxtSpellingCurChange
      OnKeyDown = dxtxtSpellingKeyDown
      OnKeyPress = dxtxtSpellingKeyPress
      Width = 100
    end
  end
  object iltToolbar: TImageList
    Height = 24
    Width = 24
    Left = 496
    Top = 536
    Bitmap = {
      494C01010C000E00080018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000006000000001002000000000000090
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
      0000DE845A00DE845A00DE845A00DE845A00DE845A0000000000000000000000
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
      0000DE845A00FBBE7200FBBE7200FBBE7200DE845A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006865650068656500686565006865650068656500686565006865
      6500686565006865650068656500686565006865650068656500686565000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003187
      3100DE845A00F9B86E00F9B86E00F9B86E00DE845A0000790000007900000079
      000000790000007900000079000000790000007900001E7E1E00000000000000
      0000000000000000000000000000000000000000000086858000868580008482
      7E0084827E00807F7A00807F7A007E7D79007E7D79007A797600797775007575
      7300757573007575730071706E0071706E00706E6E006E6C6D006E6C6D006E6C
      6D006E6C6D000000000000000000000000000000000000000000000000000000
      0000000000006B686700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006B6867000000
      0000000000000000000000000000000000000000000000000000000000000000
      000002466A0002466A0002466A0002466A0002466A0002466A0002466A000246
      6A0002466A0002466A0002466A0002466A0002466A0002466A0002466A000246
      6A00000000000000000000000000000000000000000000000000000000003291
      3100DE845A00F7B16A00F7B16A00F7B16A00DE845A001F9FE50029A1E50033A4
      E5003CA6E50046A9E5004FABE5005BAFE7002D89B6001D8A1D00000000000000
      0000000000000000000000000000000000000000000089888200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006E6C6D0000000000000000000000000000000000B6B6B600777474006B68
      6700686565006B686700DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00686565006865
      65006B68670077747400B6B6B600000000000000000000000000000000000246
      6A004EB6D60056BEDE0056BEDE0056BEDE0056BEDE0056BEDE0056BEDE0056BE
      DE0056BEDE0056BEDE0056BEDE0056BEDE0056BEDE0056BEDE0056BEDE004EB6
      D60002466A00000000000000000000000000BF846C00C78D7200B76D4A00CB83
      5F00DE845A00F3A86400F3A86400F3A86400E6985B00DE845A00CD714700CD71
      4700CD7147007EF1FF0092F6FF00A9FEFF004CA5C7001D8A1D00000000000000
      0000000000000000000000000000000000000000000089888200FFFFFF00FFF9
      F200FEF5F100F2EDEA0089848100898481008984810089848100898481008984
      810089848100898481008984810089848100CCC5C300DCD5D200FBF0E700FFFF
      FF006E6C6D0000000000000000000000000000000000807D7C00A2A1A100DCDC
      DC00CBCBCB005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C
      5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C00C5C5
      C500D6D6D600A2A1A100807D7C0000000000000000000000000000000000024A
      6E0056BEDE00625E5A00625E5A00625E5A00625E5A00625E5A00625E5A00625E
      5A00625E5A00625E5A00625E5A00625E5A00625E5A00625E5A00625E5A0056BE
      DE00024A6E00000000000000000000000000D17A4A00F1A56A00F1A86D00F1A8
      6D00F1A56A00F0A26400F09F5F00F09F5F00F09F5F00F09F5F00F09F5F00F09F
      5F00CD7147003FA87E0048AA7E0053AE8000258261001E811E00000000000000
      0000000000000000000000000000000000000000000092918900FFFFFF00F6F0
      ED00A59690008B7D77008C7E7800FFF0EA00FFF0EA00FFF0EA00FFF0EA00FFF0
      EA00FFEFE700FFEFE700FFEFE7008B7D77008A786F009D8B8200D2CBC800FFFF
      FF006E6C6D000000000000000000000000000000000077747400DCDCDC00ACA9
      A700ACA9A7006B686700DCDCDC00DCDCDC00D6D6D600DCDCDC00DCDCDC00D6D6
      D600DCDCDC00DCDCDC00D6D6D600DCDCDC00DCDCDC00D6D6D6006B686700ACA9
      A700AEADA900DCDCDC007774740000000000000000000000000000000000024A
      720056BEDE0066625E00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE0066625E0056BE
      DE00024A7200000000000000000000000000CF764900F0AA7A00F0AA7A00F0AA
      7A00F0AA7A00F0AA7A00EFA57100ED9A6100EC955800EC955800EC955800EC95
      5800CD7147000097000000970000009700000099000013780700CD6B4E00C667
      4600000000000000000000000000000000000000000092918900FFFFFF00AAA7
      A400B8ACA600E1D5D0008B7D7700887A74008B7D7700887A74008B7D7700887A
      74008B7D770088776F008A786F0088776F00E1D1C900B8A79E00A39D9900FFFF
      FF0071706E00000000000000000000000000000000007A787700DCDCDC00AEAD
      A900AEADA90077747400D6D6D600AEADA900AEADA900ACA9A700AEADA900AEAD
      A900ACA9A700AEADA900AEADA90077747400777474007774740072717100AEAD
      A900AEADA900DCDCDC007A78770000000000000000000000000000000000024A
      720056BEDE006A666200FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE006A66620056BE
      DE00024A7200000000000000000000000000CD714700EEAC8500EEAE8900EEAE
      8900EEAE8900EEAE8900EEAE8900EEAE8900EEAC8500EFA57100EB9C6C00EB9C
      6C00CD71470027C03A0025BE390024BE360024BE360022861900E6704500DF6D
      3F00000000000000000000000000000000000000000092918900FFFFFF009895
      9200E1D5D000C1B6AF008D817B00E1D4CE00E1D4CE00E1D4CE00E1D4CE00E1D4
      CE00E1D4CE00A5969000A596900092817A00C1B1A800E1D4CE0099928E00FFFF
      FF007575730000000000000000000000000000000000807D7C00EEEEED00CBCB
      CB00D1D0CC0086838200FFFFFF00D1D0CC00D6D6D600D1D0CC00D1D0CC00D6D6
      D600D1D0CC00D1D0CC00D1D0CC008F8D8B00FFFFFF008F8D8B0086838200D1D0
      CC00D1D0CC00EEEEED00807D7C0000000000000000000000000000000000024A
      720056BEDE006E6A6600FEFEFE00FEFEFE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00FEFEFE00FEFEFE006E6A660056BE
      DE00024A7200000000000000000000000000C5643D00DE845A00DE845A00DE84
      5A00E7966D00EEB49600EEB49600EEAE8900E48A5F00DE845A00DE845A00DE84
      5A00CD71470028C13D0025BE390025BE390025BE390024891D00ED845900E670
      4500000000000000000000000000000000000000000099988F00FFFFFF009F9D
      9900E1D5D000C5B9B200968A8500E1D5D000C5B9B200C4B7B000C1B6AF00C1B6
      AF00C1B6AF00AEA09900FFF0EA00A5969000C1B6AF00E1D1C90099988F00FFFF
      FF00757573000000000000000000000000000000000086838200FFFFFF00D6D6
      D600D6D6D600928F8D00FFFFFF00DCDCDC00DDDCD900DCDCDC00DCDCDC00DDDC
      D900DDDCD900DDDCD900DCDCDC00ACA9A700AAA7A300AAA7A300928F8D00D6D6
      D600D6D6D600FFFFFF008988850000000000000000000000000000000000024E
      7A0056BEDE00726E6A00FEFEFE00FEFEFE00E6AE9200E6AE9200EAE6E600E6AE
      9200E6AE9200EAE6E600EAB29600EAB29600FEFEFE00FEFEFE00726E6A0056BE
      DE00024E7A00000000000000000000000000000000000000000000000000268B
      2000DE856200F0BBA500F0BDA800EDAE9400D16C450032CC4D002ECC4A002DC6
      44002DC644002DC644002DC6440027C03A0027C03A00268B2000F6996E00EC8E
      6000000000000000000000000000000000000000000099988F00FFFFFF00A6A4
      A100F0E8E400E1D5D000ABA09B00FEF5F100E9DED800E9DED800ECDCD600ECDC
      D600ECDCD600C7BBB400CCBFB800B8A79E00E1D1C900F0E2DB00ABA09B00FFFF
      FF0075757300000000000000000000000000000000008F8D8B00FFFFFF00DDDC
      D900DDDCD90098979400FFFFFF00E2E1E000E6E4E300E6E4E300E6E4E300E6E4
      E300E6E4E300E6E4E300E6E4E300E2E1E000E6E4E300FFFFFF009B9A9700DDDC
      D900D6D5D200FFFFFF008F8D8B00000000000000000000000000000000000252
      7A0056BEDE0076726E00FEFEFE00FEFEFE00EAB69E00EAB69E00EAEAEA00EAB6
      9E00EAB69E00EAEAEA00EABEAA00EABEAA00FEFEFE00FEFEFE0076726E0056BE
      DE0002527A00000000000000000000000000000000000000000000000000288F
      2400DE856200F2C6B500F2C6B500F0BBA500D16C450032CC4D0032CC4D0032CC
      4D0032CC4D002DC644002DC644002DC644002DC64400268B2000FFAD8000F7A4
      7400000000000000000000000000000000000000000099988F00FFFFFF00B1B0
      AD00FEF5F100E6DED900B5ACA700FEF5F100FEF5F100FEF5F100FEF5F100FEF5
      F100FFF0EA00FEF5F100FFF0EA00B5ACA700E6D9D100FFF0EA00ADA8A500FFFF
      FF007A7976000000000000000000000000000000000096959200FFFFFF00DDDC
      D900DDDCD900A4A39F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A39F00DCDC
      DC00DDDCD900FFFFFF0096959200000000000000000000000000000000000252
      7A0056BEDE007A767200FEFEFE00FEFEFE00EABEAA00EABEAA00EAEAEA00EABE
      AA00EABEAA00EAEAEA00EECABE00EECABA00FEFEFE00FEFEFE007A76720056BE
      DE0002527A00000000000000000000000000000000000000000000000000268B
      2000DE856200F3CDBD00F3CDBD00F0BBA500D16C45003AD3580036D0520032CC
      4D0032CC4D0032CC4D0032CC4D002ECC4A002DC64400268B2000BB685B00B564
      52000000000000000000000000000000000000000000A2A19600FFFFFF00B9B7
      B400FEF5F100EDE6E100B9B7B400C4B7B000B9B7B400C1B6AF00C1B6AF00B9B7
      B400C1B6AF00C1B6AF00C1B6AF00BDAFA700E9DED800FFF0EA00B1B0AD00FFFF
      FF007E7D790000000000000000000000000000000000A4A39F00FFFFFF00DDDC
      D900E2E1E000B0ADAA00AEADA900B0ADAA00AEADA900AEADA900AEADA900AEAD
      A900B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00AEADA900DDDC
      D900E6E4E300FFFFFF009B9A9700000000000000000000000000000000000256
      820056BEDE007E7A7600FEFEFE00FEFEFE00EEC6B200EEC6B200F2F2F200EEC6
      B200EEC6B200F2F2F200F2F2F200F2F2F200FEFEFE00FEFEFE007E7A760056BE
      DE00025682000000000000000000000000000000000000000000000000001080
      2D00D16C4500D16C4500D8714800D76F4700CB653F003AD358003AD358003AD3
      580035CE510036D0520032CC4D0032CC4D0032CC4D0010802D000000C3001E1E
      B1000000000000000000000000000000000000000000A2A19600FFFFFF00CCC5
      C300DCD5D200FFFFFF0099928E00FEF5F100F0E8E400F0E8E400F0E8E400F0E6
      E200F0E6E200EDE6E100FEF5F1009A8E8800E9DED800DDD1CA00C2BFBB00FFFF
      FF007E7D790000000000000000000000000000000000A2A1A100FFFFFF00EEEE
      ED00E6E4E3007A787700FFFFFF00FFFFFF00EAEAE900EAEAE900EAEAE900EAEA
      E900EAEAE900EAEAE900EAEAE900EAEAE900FFFFFF00FFFFFF007A787700DCDC
      DC00E6E4E300FFFFFF00A4A39F00000000000000000000000000000000000256
      820056BEDE00827E7A00FEFEFE00FEFEFE00EECABE00F2CEBE00F2F2F200EECA
      BE00EECABA00F2F2F200F6F6F200F2F2F200FEFEFE00FEFEFE00827E7A0056BE
      DE00025682000000000000000000000000000000000000000000000000001281
      310042E066007AEE980098F6B2003AD85C003FDC61003AD358003AD358003AD3
      58003AD3580036D0520035CE510035CE510036D04F00128131000000D5001E1E
      B1000000000000000000000000000000000000000000A5A39800FFFFFF00FFFF
      FF00CCC5C300C5B9B200A0989600FFF9F200F2EDEA00F2EDEA00F2EDEA00F0E8
      E400F2EDEA00F0E8E400FEF5F100A5969000B9B7B400C7BBB400FFF9F200FFFF
      FF0084827E0000000000000000000000000000000000B6B6B600D1D0CC00FFFF
      FF00FFFFFF00807D7C00FFFFFF00FFFFFF00EEEEED00EEEEED00EEEEED00EEEE
      ED00EEEEED00EEEEED00EEEEED00EEEEED00FFFFFF00FFFFFF00807D7C00CBCB
      CB00FFFFFF00D6D6D600BBBAB70000000000000000000000000000000000025A
      860056BEDE0086827E00FEFEFE00FEFEFE00F2D6C600F2D6C600F6F6F200FEFE
      FE00F2F2F200FEFEFE00F2F2F200F6F6F200FEFEFE00FEFEFE0086827E0056BE
      DE00025A86000000000000000000000000000000000000000000000000001281
      310046E26B007CF09B009EFABA005CE47C005CE47C005CE47C005CE47C005CE4
      7C0057DE740057DE740057DE740047D763003AD35800128131000000EB001616
      BA000000000000000000000000000000000000000000ABA09B00FFFFFF00FFFF
      FF00FEF5F100FEF5F100A39D9900FFFFFF00FFEFE700F6F0ED00FEF5F100FFF0
      EA00F6F0ED00FFF0EA00FFF9F200A39D9900D5CAC800ECDCD600FFFFFF00FFFF
      FF0084827E000000000000000000000000000000000000000000BBBAB700B0AD
      AA00B0ADAA0086838200FFFFFF00FFFFFF00F1F1F000F1F1F000F1F1F000F1F1
      F000F1F1F000F1F1F000F1F1F000F1F1F000FFFFFF00FFFFFF0086838200B0AD
      AA00B0ADAA00C9C9C6000000000000000000000000000000000000000000025A
      8A0056BEDE008A868200FEFEFE00FEFEFE00F6DED200F6DED200FEFEFE00F2F2
      F200FEFEFE00F6F6F200FEFEFE00FEFEFE00FEFEFE00FEFEFE008A86820056BE
      DE00025A8A000000000000000000000000000000000000000000000000001281
      310049E672007CF09B00B3FFCC00B3FFCC00B3FFCC00B3FFCC00B3FFCC00B3FF
      CC00B3FFCC00B3FFCC00B3FFCC0079EC96003AD35800128131000000D5000009
      AF000000000000000000000000000000000000000000AAA89C00FFFFFF00FFFF
      FF00FEF5F100FEF5F100ADA8A500FFEFE700F2EDEA00F9E8E100F0E6E200F9E8
      E100F9E8E100F0E6E200FFEFE700AAA7A400D2CBC800FFEFE700FFF9F200FFFF
      FF00868580000000000000000000000000000000000000000000000000000000
      0000000000008F8D8B00FFFFFF00FFFFFF00F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500FFFFFF00FFFFFF00898885000000
      000000000000000000000000000000000000000000000000000000000000025A
      8A0056BEDE008E8A8600FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE008E8A860056BE
      DE00025A8A000000000000000000000000000000000000000000000000001C98
      3A004BE975007CF09B00B3FFCC00B3FFCC00B3FFCC00B3FFCC00B3FFCC00B3FF
      CC00B3FFCC00B3FFCC00B3FFCC0079EC96003AD85C001C983A0034C6F80026BE
      F1000000000000000000000000000000000000000000AAA89C00FFFFFF00FFFF
      FF00FFFFFF00FEF5F100B4AFAD00FFEFE700F9E8E100F9E8E100F9E8E100F9E8
      E100F9E8E100F9E6DE00FFEFE700ABA09B00CCC5C300D7C9C100CCC5C300CDCA
      CD00898882000000000000000000000000000000000000000000000000000000
      000000000000928F8D00FFFFFF00FFFFFF00F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500FFFFFF00FFFFFF00928F8D000000
      000000000000000000000000000000000000000000000000000000000000025A
      8A0056BEDE00928E8A00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00928E8A0056BE
      DE00025A8A00000000000000000000000000000000000000000000000000209C
      3C004EEC7A0086F5A500B3FFCC00B3FFCC00B3FFCC00B3FFCC00B3FFCC00B0FF
      C900B3FFCC00B3FFCC00B3FFCC0079EC96003AD85C00209C3C005BE7FF0047D4
      F7000000000000000000000000000000000000000000ADA8A500FFFFFF00FFFF
      FF00FEF5F100FFFFFF00B9B7B400F6F0ED00F6F0ED00FFEFE700FEF5F100FFEF
      E700FFEFE700FFEFE700EDE6E100AAA7A400CABBB600C7BBB400B9B7B400A39D
      9900898882000000000000000000000000000000000000000000000000000000
      00000000000098979400FCEFE800FCEFE800FBE5DC00FBE5DC00FBE5DC00FBE5
      DC00FBE5DC00FBE5DC00FBE5DC00FBE5DC00FCEFE800FCEFE800989794000000
      0000000000000000000000000000000000000000000000000000000000000262
      960056BEDE0096928E00FEFEFE00DADADA00DADADA00DADADA00DADADA00DADA
      DA00DADADA00DADADA00DADADA00DADADA00DADADA00FEFEFE0096928E0056BE
      DE0002629600000000000000000000000000000000000000000000000000209C
      3C0052F180008DF5AC00C4FFD700BDFFD200B3FFCC00B3FFCC00B3FFCC00B0FF
      C900B0FFC900B3FFCC00B3FFCC007AEE980044DF6700209C3C007EF1FF0066DC
      F8000000000000000000000000000000000000000000AAA89C00F6E2D400F6E2
      D400F7D6C700F7D6C700BDAFA700BDAFA700BFB3AB00BDAFA700BDAFA700BDAF
      A700BDAFA700B8ACA600BFA39600929189009895920099928E00929189009291
      8900B3ACAC000000000000000000000000000000000000000000000000000000
      0000000000009B9A9700FCEFE800FCEFE800FBE5DC00FBE5DC00FBE5DC00FBE5
      DC00FBE5DC00FBE5DC00FBE5DC00FBE5DC00FCEFE800FCEFE8009B9A97000000
      0000000000000000000000000000000000000000000000000000000000000666
      9A005EBEDE009A96920096928E006A6662006662620066626200666262006662
      6200666262006662620066626200666262006A6662009A9692009A9692005EBE
      DE0002629600000000000000000000000000000000000000000000000000209C
      3C0052F1800094F8B100DBFFE700D5FFE300D0FFDF00CBFFDC00C4FFD700BDFF
      D200B3FFCC00B3FFCC00B3FFCC007CF09B0046E26B00209C3C0068C3F00053B3
      E4000000000000000000000000000000000000000000B0AEA000F6E2D400F7DF
      D000F7D6C700F7D6C700F7D6C700F7D7C900F7D6C700F7D6C700F7D6C700F7D6
      C700F7D6C700F9CAB900FBB59A00A0989600EDEDEC00EDEDEC00C5B9B200B1B0
      AD00000000000000000000000000000000000000000000000000000000000000
      000000000000A2A1A100FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800FCEF
      E800FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800A4A39F000000
      000000000000000000000000000000000000000000000000000000000000066A
      9A00C6E6F200D6EEF600D6EEF6009EA6AA00AEAEAE00EAEAEA00E2E2E200E2DE
      DE00E2DEDE00E2DEDE00E2DEDE00AAAAA6009EA6AA00D6EEF600D6EEF600C6E6
      F2000262960000000000000000000000000000000000000000000000000041A1
      4B005AF98C009EFABA00C4FFD70052F07F0052F07F0051EE7E0051EE7E0051EE
      7E004EEC7A004BE975004EEC7A0049E6720051EE7E0032A03E00000000000000
      00000000000000000000000000000000000000000000B5ACA700F6E2D400F7DF
      D000F7D6C700F7D6C700F7D6C700F7D6C700F7D6C700F7D6C700F7D6C700F7D6
      C700F7D6C700F9CAB900FBB59A0099988F00FFF9F200C2BFBB00B1B0AD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ACA9A700FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800FCEF
      E800FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800ACA9A7000000
      0000000000000000000000000000000000000000000000000000000000000000
      000006669A0006669A0006669A000E6A96008E8E8A00E2DEDE00EAEAEA00AEAE
      AE00A6A6A600EAEAEA00E2DEDE008E8E8A000E6A960006669A0006669A000666
      9A00000000000000000000000000000000000000000000000000000000003590
      390023A93C002DA942002DA9420024A63B0024A63B0024A63B0021A4360021A4
      360021A4360021A436001EA1320021A436001EA1320024891D00000000000000
      00000000000000000000000000000000000000000000AAA89C00F6E2D400F6E2
      D400F7DFD000F7DFD000F7DFD000F7DFD000F7DFD000F7DFD000F7DFD000F7DF
      D000F7DFD000F9CAB900E6B9AB00A5A39800CBCBBD00BAB6B100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AEADA900B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0AD
      AA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009A9692009A969600F2F2
      F200F2F2F2009A9696009A969200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0AEA000F6E2D400F6E2
      D400F6E2D400F6E2D400F6E2D400F6E2D400F7DFD000F6E2D400F6E2D400F6E2
      D400F6E2D400EEC4B600C2A99A00A5A39800BAB6B10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2C2C2009692
      8E009A969200C2C2C20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5ACA700B0AEA000B5AC
      A700AAA89C00B0AEA000B5ACA700ADA8A500B0AEA000ADA8A500ADA8A500AAA8
      9C00AAA89C00AAA89C00ABA09B00C4C0B8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEDEDD00DEDE
      DD00D6D6D600E5E5E50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5E5E500D8D7D700D8D7D700D8D7
      D700D8D7D700D8D7D700D8D7D700D8D7D700D8D7D700D8D7D700D8D7D700D8D7
      D700D8D7D700E5E5E50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEDEDD00C2C2C100C2C2
      C100C2C2C100C2C2C100D6D6D600EDEDED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8D7D700BEBEBE00BEBEBE00BEBE
      BE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBE
      BE00C1C1C000D0D0D000F5F4F400000000000000000000000000000000000000
      0000000000000000000000000000000000006865650068656500686565006865
      6500686565006865650068656500686565006865650068656500686565006865
      6500686565006865650000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED00B4A29800C0683D00C761
      2E00C7612E00BB704900A9918400CDCDCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ECECEC0081817D0081817D00807F7B007E7D
      7A007C7B78007C7B780074737200747372007473720071706E006E6D6C006E6D
      6C006E6D6C006E6D6C00ECECEC00000000000000000000000000D1CFCF00CECD
      CD00CECDCD00CECDCD00CECDCD00BFBFBF006B696800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006B69680000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400E9E9E900000000000000000000000000E5E5E500C36D4100EAA98900ECA4
      8200F2BCA200E5A58600CC6B3B00AE887600D6D6D60000000000000000000000
      0000000000000000000000000000000000000000000000000000E5E5E500D6D6
      D600DEDEDD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E5E5E50081817D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006E6D6C00ECECEC0000000000000000006B8D9F00327699003276
      9900327699003276990032749600336F8E006B696800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006B69680000000000000000000000000000000000000000000000
      0000000000000000000000000000DDDDDD00C5C5C500C5C5C500BEBEBE00BEBE
      BE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00C5C5
      C500C5C5C500DDDDDD000000000000000000DEDEDD00D0764900EEBCA400CC6B
      3B00CC6B3B00E39D7B00F6CAB300D0744700B2938300EDEDED00000000000000
      000000000000000000000000000000000000DEDEDD00CDCDCC00C2C2C100C2C2
      C100CDCDCC00E5E5E50000000000000000000000000000000000ECECEC00ECEC
      EC00ECECEC00ECECEC00DEDDDD00CECECD008C8C8500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006E6D6C00ECECEC0000000000000000003276990069CFEF006DD4
      F5006DD4F5006DD4F5006DD4F50068C2E10072706F00FFFFFF00FFFFFF00E9E8
      E800E9E8E800E9E8E800E9E8E800E9E8E800E9E8E800E9E8E800E9E8E800FFFF
      FF00FFFFFF0072706F0000000000000000000000000000000000000000000000
      00000000000000000000F8F8F8003D9C3D003498340034983400349834003498
      3400349834003498340034983400349834003498340034983400349834003498
      3400349834007EA57E00F8F8F80000000000EDEDED00D0744700F7DACE00D074
      4700BBAFA900C87A5200E39D7B00EEB59900C6724700BAB9B500000000000000
      00000000000000000000DEDEDD00CDCDCC00A6A6A6008E8D8D006E6B6B006867
      67006867670068676700F9F9F8000000000000000000E5E5E500D8D7D700D8D7
      D700D8D7D700D8D7D700CECECD00C1C1C000918F8900FFFFFF00FFFFFF00ECEC
      EC00EAE9E900EAE9E900EAE9E900EAE9E900EAE9E900EAE9E900EAE9E900FFFF
      FF00FFFFFF0074737200ECECEC00000000000000000031799D006DD4F5006DD4
      F5006DD4F5006DD4F50069CFEF0068C2E10072706F00FFFFFF00FFFFFF00E9E8
      E800EEEDED00EEEDED00EEEDED00EEEDED00EEEDED00EEEDED00E9E8E800FFFF
      FF00FFFFFF0072706F0000000000000000000000000000000000000000000000
      00000000000000000000000000005FAC5F003FB44F0054EB850054EB850054EB
      850054EB850054EB850054EB850054EB850054EB850054EB850054EB850052EA
      820050E6800034983400E9E9E90000000000EDEDED00CD795000F2CEBD00E5A5
      8600C87A5200BBAFA900D0744700F3B59800D67C4F00B6978800D6D6D600EDED
      ED00E5E5E500D6D6D600A6A6A60096969600787575007C797900CDCDCC00CDCD
      CC0078757500B6B5B5000000000000000000000000008F8D8D008F8D8D008786
      86008F8D8D0087868600878686007E7D7A0095948C00FFFFFF00FFFFFF00ECEC
      EC00EAE9E900ECECEC00EAE9E900ECECEC00EAE9E900ECECEC00EAE9E900FFFF
      FF00FFFFFF0072707000ECECEC000000000000000000317BA1006DD4F5006DD4
      F50029C0F20029C0F20029BDEE002CB1DD007A777600FFFFFF00FFFFFF00EEED
      ED00D4D4D300D4D4D300D1CFCF00D4D4D300EEEDED00EEEDED00EEEDED00FFFF
      FF00FFFFFF007A77760000000000000000000000000000000000000000000000
      0000000000000000000000000000E4E4E40055A9550046BB570058EB890054EB
      850052EA820052EA820052EA820052EA820052EA820052EA820052EA820052EA
      820052EA8200389F3800E9E9E90000000000F5F5F500D3AF9D00DB8E6900FBE5
      DC00E6A07E00D0764900D0744700EEA88500E4966E00B6876E00A6A6A600CDCD
      CC00C2C2C10098979500817F7E0078757500B6B5B500E5E5E500D1D1D1007875
      7500B6B5B500000000000000000000000000000000008F8D8D00ECECEC00ECEC
      EC00ECECEC00ECECEC00E5E5E500D8D7D70099988E00FFFFFF00FFFFFF00ECEC
      EC00D8D7D700D4D3D100D8D7D700D4D3D100F1EFEE00F1EFEE00ECECEC00FFFF
      FF00FFFFFF0074737200ECECEC000000000000000000317BA1006DD4F5006DD4
      F50029C0F20035C2F20029BDEE0032B1DD007A777600FFFFFF00FFFFFF00F1F1
      F000EEEDED00EEEDED00F1F1F000EEEDED00F1F1F000EEEDED00F1F1F000FFFF
      FF00FFFFFF007A77760000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DFE4DF0055A955004ABE5B0060ED
      8F0052EA82004EDB710055C9560055C9560055C9560055C9560055C9560052EC
      850052EC85003AA23A00E9E9E9000000000000000000EDEDED00D48C6900E39D
      7B00FBE5DC00F4C7B100EAA98900F6B99C00EEA88500C37E5A008E8D8D008E8D
      8D008281800078757500ADACAC00DEDEDD00E9E9E900D6D6D600817F7E00BAB9
      B50000000000000000000000000000000000000000008F8D8D00ECECEC00ECEC
      EC00ECECEC00ECECEC00E5E5E500D8D7D7009C9A9100FFFFFF00FFFFFF00F1EF
      EE00F1EFEE00F1EFEE00F1EFEE00F1EFEE00F1EFEE00F1EFEE00F1EFEE00FFFF
      FF00FFFFFF007E7D7A00ECECEC000000000000000000317BA1006DD4F5006DD4
      F50035C2F20035C2F20036C0EF003CB4DE0081807D00FFFFFF00FFFFFF00F1F1
      F000DADAD900D8D7D700D8D7D700DADAD900D8D7D700DADAD900F1F1F000FFFF
      FF00FFFFFF0081807D0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D4DAD40055A9550051C1
      610052EC850054EB850054D7690055C9560055D3650055C9560055D3650054EB
      850052EC85003DA63D00E9E9E900000000000000000000000000E7E2DF00D695
      7400DD8C6500EEBCA400FAD7CA00FAD7CA00F2BCA200D6D2CF00878786007979
      76008E8D8D00CDCDCC00D8D8D800E5E5E500C2C2C10087878600CDCDCC000000
      00000000000000000000000000000000000000000000908F8F00ECECEC00ECEC
      EC00DEDDDD00DEDDDD00DEDDDD00C1C1C000A5A39800FFFFFF00FFFFFF00F5F4
      F400D8D7D700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600F5F4F400FFFF
      FF00FFFFFF007E7D7A00ECECEC0000000000000000002F81AA006DD4F5006DD4
      F5003BC5F2003BC5F20036C0EF003CB4DE0083828000FFFFFF00FFFFFF00F1F1
      F000F5F4F400F1F1F000F5F4F400F5F4F400F1F1F000F5F4F400F1F1F000FFFF
      FF00FFFFFF008382800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900ABB2AB0040A9
      40004EDF780054EB85004EDB710055D3650055D3650055D3650055C9560052EC
      850052EC85003DA63D00E9E9E90000000000000000000000000000000000F5F5
      F500DCC0B200D7997700D7815500EECBB900E0DFDC00DEDEDD00DEDEDD009897
      950098979500B2B2B100CDCDCC00BAB9B50087878600C9C9C900000000000000
      00000000000000000000000000000000000000000000908F8F00ECECEC00ECEC
      EC00DEDDDD00DEDDDD00DEDDDD00CECECD00A5A39800FFFFFF00FFFFFF00F5F4
      F400F5F4F400F5F4F400F5F4F400F5F4F400F5F4F400F5F4F400F5F4F400FFFF
      FF00FFFFFF0081817D00ECECEC0000000000000000002F81AA006DD4F5006DD4
      F50046C9F30046C9F30040C3EF0040B6DD0083828000FFFFFF00FFFFFF00F5F4
      F400DEDCDE00DEDCDE00DADAD900DEDCDE00DADAD900DEDCDE00F5F4F400FFFF
      FF00FFFFFF008382800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4E4E4009AA79A0045B5
      490054EB850054EB850055D3650055D3650055D3650055D3650054D7690052EC
      850052EC850040A94000EDEDED00000000000000000000000000000000000000
      000000000000E5E5E500C0AFA6009B938E00D6D6D600DEDEDD00D6D2CF00E5E5
      E50098979500A19E9D00A6A6A6007C797900B6B5B500F5F5F500000000000000
      00000000000000000000000000000000000000000000908F8F00ECECEC00ECEC
      EC00E5E5E500CECECD00CECECD00BEBEBE00A5A39800FFFFFF00FFFFFF00F5F4
      F400DEDDDD00DBDBD900DEDDDD00DBDBD900DEDDDD00DEDDDD00F5F4F400FFFF
      FF00FFFFFF0087868600EAE9E90000000000000000002F81AA006DD4F5006DD4
      F50046C9F30046C9F30047C5F00046B8DF008A888500FFFFFF00FFFFFF00F8F8
      F700F8F8F700F8F8F700F8F8F700F5F4F400F1F1F000E9E8E800E6E5E500E9E8
      E800E9E8E8008382800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E9E9E900B5B5B50066AA66004BCD
      640054EB850052E57D0055D3650055D365004EDB710055D3650054D7690052EC
      850052EC850045B54900E9E9E900000000000000000000000000000000000000
      000000000000E5E5E500C2C2C1008E8D8D0096969600DEDEDD00CDCDCC00A6A6
      A600A6A6A600B1AEAD008E8D8D0096969600C2C2C100E5E5E500000000000000
      000000000000000000000000000000000000000000009C9B9900ECECEC00ECEC
      EC00E0DFDE00E0DFDE00DEDDDD00C8C8C700ABA99D00FFFFFF00FFFFFF00F8F8
      F700F5F4F400F8F8F700F5F4F400F8F8F700ECECEC00E5E5E500E5E5E500ECEC
      EC00E5E5E5008C8C8500ECECEC0000000000000000002E84B1006DD4F5006DD4
      F5004DCAF2004DCAF2004DCAF2004CB9DF008F8C8A00FFFFFF00FFFFFF00FFFF
      FF00F8F8F700FFFFFF00F8F8F700F8F8F700E9E8E800C8C7C700C2C1C100C2C1
      C100C2C1C1008A888500E6E5E500000000000000000000000000000000000000
      0000000000000000000000000000E4E4E400BEBEBE008EA18E0045B5490050E6
      800054EB850054DE74004EDB71004EDB710054DE720054EB850053E0760054EB
      850054EB850046B24600E9E9E900000000000000000000000000000000000000
      0000E5E5E500CDCDCC00C0AFA600938B8700AEACAA00BAB9B500E5E5E500A6A6
      A60098979500E5E5E500BAB9B5009897950098979500D1D1D100EDEDED000000
      000000000000000000000000000000000000000000009C9B9900ECECEC00ECEC
      EC00E5E5E500D0D0CF00CECECD00BEBEBE00ABA99D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F8F8F700FFFFFF00F5F4F400ECECEC00CECECD00C1C1C000C8C7
      C700C8C8C700908E8700ECECEC0000000000000000002E84B1006DD4F5006DD4
      F50053CDF40053CDF40052C9F00050BBDF0092918E00FCEDE800FCEDE800F8E1
      D900F8E1D900F8E1D900F8E1D900F8E1D900E7D4CC0092918E0092918E009491
      8F0092918E0092918E00E6E5E500000000000000000000000000BEDBBE00D4DA
      D40000000000E4E4E400BEBEBE00ADADAD008EA18E004DB44D004EDB710054EB
      850054EB85004EDB710054DE720052E57D005BEC8A0078F09F0054EB850054EB
      850052EA820045B54900E9E9E900000000000000000000000000EDEDED00CDCD
      CC00C2C2C100C0AFA600D67C4F00ECB29600CDC8C400A1A09D00B1B0AD00E5E5
      E500E5E5E500D6D2CF00DEDEDD00CDCDCC0098979500A1A1A100CDCDCC00E9E9
      E90000000000000000000000000000000000000000009C9B9900ECECEC00ECEC
      EC00E5E5E500E5E5E500E0DFDE00CECECD00B0AEA100FCEFE800FCEFE800F8E1
      D800F8E1D800F8E1D800F8E1D800F8E1D800E7D4CC009C9A91009C9A91009998
      8E0095948C0095948C00F5F4F40000000000000000002E84B1006DD4F5006DD4
      F50058CEF40058CEF40058CBF10050BBDF0092918E00FCEDE800F5E6E100F8E1
      D900F8E1D900F8E1D900F8E1D900F8E1D900E7D4CC0094918F00F0EFEE00F0EF
      EE00B6B4B200ACA9A90000000000000000000000000000000000B6DBB6009DCD
      9D009CC09C00A0B4A00093AA930070AC700050BC54004FD86F0054EB850052EA
      820053E0760052E57D0054EB850078F09F00A7F1BC0084DB90008FF2B00054EB
      850052EA82004BB84B00E9E9E9000000000000000000DEDEDD00C9C9C900C0AF
      A600CA8E6D00D5885F00EAA07900F3B59800EDA88B00DEDEDD00AAA7A5009897
      9500C2C2C100F5F5F500FFFFFF00FFFFFF00E9E9E900A6A6A60098979500CDCD
      CC00E5E5E500000000000000000000000000000000009C9B9900ECECEC00ECEC
      EC00E5E5E500D8D7D700CECECD00C1C1C000B0AEA100FCEFE800FCEFE800F8E1
      D800FCEFE800F8E1D800FBE5DC00F8E1D800E7D4CC00A5A39800ECECEC00ECEC
      EC00BDBCBA00B8B6B3000000000000000000000000002D88B9006DD4F5006DD4
      F50058CBF1005FCCF1005DCAEE005FBDDC008F8C8A00E6D9D400E6D9D400E6D9
      D400E6D9D400EFE1DC00F5E6E100F5E6E100E6D9D4009A989500F8F8F700BFBF
      BF00ACA9A900E9E8E80000000000000000000000000000000000BFE0BF00BEDB
      BE0090D49D0070C7790062C76B0054D7690052E57D0054EB850052EA820054EB
      850054EB85006EEF9700A3F5BE0092E19E0054C054005EBF5E0077D37D0095F3
      B40054EB850050BC5400E9E9E90000000000F5F5F500CDCDCC00D28C6500E087
      5A00E7986E00EAA98900F9CAB300F6B99C00F7B59500DFA07F00A9A29C00D6D2
      CF00BAB9B500AEACAA00D6D2CF00F9F9F800FFFFFF00EDEDED00ADACAC00A19E
      9D00C2C2C100DEDEDD00000000000000000000000000A3A19F00ECECEC00ECEC
      EC00E5E5E500E5E5E500E5E5E500D8D7D700ABA99D00FCEFE800FCEFE800FCEF
      E800FCEFE800FCEFE800FCEFE800FCEFE800E5D9D400A5A39800F8F8F700C8C7
      C700BAB8B500F5F4F4000000000000000000000000002D88B9006DD4F5006CCF
      EF0062C4E50062C4E5005FBDDC005DB1CE0083828000CFC2BE00CFC2BE00CFC2
      BE00D1C5C000DBD0CB00EFE1DC00F3E6DF00E6D9D4009A989500C1C0BE00B0AD
      A900E9E8E8000000000000000000000000000000000000000000EFF4EF00A9D8
      AA00C2E6CA00A0E8B70070E8980052EC850054EB850054EB85006AED940085F2
      A900B9F7CE00A9EBB5006ECF720072C77200C1D6C100D4DAD40080C780007CD6
      83009CF3B80051C15100E9E9E90000000000EDEDED00D2937000EA9E7900E38E
      6200D8906B00D8906B00E7986E00F9CAB300EA9E7900DF997200EDEDED000000
      000000000000EDEDED00BAB9B500B6B5B500DEDEDD00FFFFFF00FFFFFF00B6B5
      B500AAA7A500CDCDCC00F1F1F1000000000000000000A3A19F00ECECEC00ECEC
      EC00ECECEC00EAE9E900E5E5E500D8D7D700ABA99D00FCEFE800FCEFE800FCEF
      E800FCEFE800FCEFE800FCEFE800F4E6E100E5D9D400ABA99D00C8C8C700BEBE
      BE00F1EFEE00000000000000000000000000000000002D88B9006DD4F5006AC9
      E80062B8D60061B0CB005FACC7005DA3BA00838280008A888500838280008A88
      8500838280008A8885009A9895009D9A98009D9A9800A29F9B00B1B0AD00E9E8
      E80000000000000000000000000000000000000000000000000000000000E6EE
      E60094D29400A8DFAD00C6EFD100D2F7E000D2F9E100D2F9E100B9EEC50099E2
      A10062CB630063C66300AAD4AA00F8F8F8000000000000000000E9E9E90084CA
      840081D7850054C05400F8F8F80000000000EDEDED00E38E6200F5D0BD00D695
      74009897950098979500D6957400F0AA8600E4966E00E1CCC100000000000000
      0000000000000000000000000000D6D6D600B6B5B500BAB9B500E9E9E900F9F9
      F800C1C0BC00B1AEAD00F1F1F1000000000000000000A3A19F00EAE2DD00EAE2
      DD00E5D9D400E7D9D200E7D9D200E1D2CD00B0AEA100B0AEA100B0AEA100B0AE
      A100B0AEA100B0AEA100B0AEA100AEADA000ABA99D00ABA99D00C1C0BE00F1EF
      EE0000000000000000000000000000000000000000003192C20074D5F5006DC9
      E500888C8B008A8885008A8885008A8885008A8885008A8885008A8885008A88
      85008A8885008A8885005FACC70074D5F5003192C200D1CFCF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F800A4D8A40070CB700059C7590054C0540053C7530062CB630088CF
      8800BEDBBE00F8F8F8000000000000000000000000000000000000000000F8F8
      F80088CF880054C05400F5F5F50000000000EDEDED00E39B7300F5D0BD00EAA0
      7900D7997700D7997700E7956900E7956900DFB59E0000000000000000000000
      00000000000000000000000000000000000000000000D6D2CF00B6B5B500B1B0
      AD00B1B0AD00B1B0AD00BAB9B5000000000000000000AAA9A700EAE2DD00EAE2
      DD00E7D9D200E7D9D200E7D9D200E5D9D400E7D4CC00D8CBC600AAA9A700DEDD
      DD00E5E5E500C1C1C000C1C1C000ECECEC00ECECEC0000000000000000000000
      000000000000000000000000000000000000000000003192C200CEECF800D5ED
      F500AAB4B500C1C0BE00E9E8E800E9E8E800E9E8E800E9E8E800E9E8E800E9E8
      E800BFBFBF00AAB4B500D5EDF500CBE8F4002D88B900E6E5E500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F8F8F800E9E9E900F8F8F800E9E9E900F8F8F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F5F5F5000000000000000000F5F5F500E1CCC100E7986E00F5D0
      BD00F5D0BD00F5D0BD00F0AA8600E5A58600F1F1F10000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1F1
      F100F1F1F100F5F5F500000000000000000000000000AAA9A700EAE2DD00EAE2
      DD00EAE2DD00F0E8E300EAE2DD00EAE2DD00E0DFDE00DBDBD900B8B6B300ECEC
      EC00C8C7C700CECECD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000081B1CC002C90C4002C8E
      C2003A8CB800ACA9A900E9E8E800F1F1F000BFBFBF00BFBFBF00F0EFEE00E6E5
      E500A9A8A4003A8CB8002C8EC2002C90C40081B1CC00F0EFEE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F5F5F500E4D0C500ECA4
      8200E7986E00E7986E00E7AF9000E9E9E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B8B6B300F0E8E300F0E8
      E300F0E8E300EAE9E900F0E8E300F0E8E300EAE2DD00E5D9D400BAB8B500D0D0
      CF00D0D0CF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DADAD900B6B4B200B0ADA900B1B0AD00F8F8F700F8F8F700B1B0AD00B0AD
      A900B6B4B200DEDCDE00E6E5E500E9E8E800E9E8E80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F5F5
      F500F1F1F100F5F5F500F5F5F500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BEBEBE00BAB8B500BAB8
      B500BAB8B500BAB8B500BAB8B500BAB8B500B8B6B300BEBEBE00C1C0BE00D8D7
      D700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E6E5E500BDBBB900B0ADA900B0ADA900BFBFBF00E2E1
      E100000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000A5A5A5006C6B6B006C6B
      6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B
      6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B
      6B006C6B6B006C6B6B00A5A5A500F1EFEE0000000000A5A5A5006C6B6B006C6B
      6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B
      6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B6B006C6B
      6B006C6B6B006C6B6B00A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006C6B6B00A9A7A600908F
      8F00EEEEED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EEEE
      ED00908F8F00A9A7A6006C6B6B00EEEEED00000000006C6B6B00A9A7A600908F
      8F00EEEEED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EEEE
      ED00908F8F00A9A7A6006C6B6B00000000000000000000000000DFDEDF00A983
      7100BC6A4100686767005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C
      5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C00B1968A00CC6B
      3B00C7602E00BF7C5B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000074727100FFFFFF00D0CE
      CD0089888500EEEEED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EEEEED008988
      8500D0CECD00FFFFFF0074727100DDDDDC000000000074727100FFFFFF00D0CE
      CD0089888500EEEEED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EEEEED008988
      8500D0CECD00FFFFFF0074727100000000000000000000000000B6775800D174
      4400E89E7A006B6A6A00C4C4C400ABA8A400ABA8A400ABA8A400ABA8A400ABA8
      A400ABA8A400ABA8A400ABA8A400ABA8A400C4C4C4006B6A6A00DE794700E89E
      7A00F7BA9C00CC6B3B0000000000000000000000000000000000F1F1F100D9D9
      D900D9D9D900D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600D9D9D9000000000000000000000000000000
      000000000000000000000000000000000000000000007A777600FFFFFF00FFFF
      FF00D0CECD0095929000DDDDDC00FFFFFF00F8F8F700F0F0ED00EEEEED00EEEE
      ED00EEEEED00EEEEED00F0F0ED00F8F8F700FFFFFF00DDDDDC0095929000D0CE
      CD00FFFFFF00FFFFFF007A777600DDDDDC00000000007A777600FFFFFF00FFFF
      FF00D0CECD0095929000DDDDDC00FFFFFF00F8F8F700F0F0ED00EEEEED00EEEE
      ED00EEEEED00EEEEED00F0F0ED00F8F8F700FFFFFF00DDDDDC0095929000D0CE
      CD00FFFFFF00FFFFFF007A7776000000000000000000BB9A8900D47B4E00F7BA
      9C00F7BA9C006B6A6A00C4C4C400B0ADA900CCC9C800CCC9C800CCC9C800B0AD
      A900B0ADA900B0ADA900B0ADA900B0ADA900C4C4C4006B6A6A00EC906500F7BA
      9C00F7BA9C00C967340000000000000000000000000000000000D6D6D600C5C5
      C500C5C5C500BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00C5C5C500C5C5C500D9D9D90000000000000000000000
      000000000000000000000000000000000000000000007F7C7C00FFFFFF00FFFF
      FF00EEEEED00DDDDDC009D9A9900DDDDDC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDDDDC009A989600DDDDDC00EEEE
      ED00FFFFFF00FFFFFF007F7C7C00DDDDDC00000000007F7C7C00FFFFFF00FFFF
      FF00EEEEED00DDDDDC009D9A9900DDDDDC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDDDDC009A989600DDDDDC00EEEE
      ED00FFFFFF00FFFFFF007F7C7C000000000000000000C46F4500EEAA8800F7BA
      9C00F3AF8E0072706F00C4C4C400B3B2AE00E9885A00E9885A00E9885A00B3B2
      AE00B3B2AE00B3B2AE00B3B2AE00B3B2AE00C4C4C40072706F00EC906500F7BA
      9C00F7BA9C00C9673400000000000000000000000000F1F1F100B6907D00C761
      2E00C7612E00C7612E00C7612E00C7612E00C7612E00C7612E00C7612E00C761
      2E00C7612E00C7612E00C7612E00C7612E00C5663800EEEEEE00000000000000
      0000000000000000000000000000000000000000000089888500FFFFFF00FFFF
      FF00F0F0ED00F0F0ED00E6E5E400B0AFAB00C6C6C200F1EFEE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1EFEE00C6C6C200B0AFAB00E6E5E400F0F0ED00F0F0
      ED00FFFFFF00FFFFFF0089888500D6D6D6000000000089888500FFFFFF00FFFF
      FF00F0F0ED00F0F0ED00E6E5E400B0AFAB00C6C6C200F1EFEE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1EFEE00C6C6C200B0AFAB00E6E5E400F0F0ED00F0F0
      ED00FFFFFF00FFFFFF00898885000000000000000000CC6B3B00F7BA9C00F7BA
      9C00EEA37A0072706F00C4C4C400BAB7B300E9885A00E9885A00E9885A00BAB7
      B300BAB7B300BAB7B300BAB7B300BAB7B300C4C4C40072706F00E9885A00F7BA
      9C00F7BA9C00CC6B3B00000000000000000000000000EEEEEE00C9643300F2B4
      9500F6B99C00F6B99C00F6B99C00F6B99C00F6B99C00F6B99C00F6B99C00F6B9
      9C00F6B99C00F6B99C00F6B99C00D7815500CD88660000000000000000000000
      0000000000000000000000000000000000000000000089888500FFFFFF00FFFF
      FF00F1EFEE00F1EFEE00F1EFEE00F2F2F100C6C6C200AAA9A500ADACA800AAA9
      A500ADACA800ADACA800AAA9A500C3C2BF00EEEEED00F1EFEE00F1EFEE00F1EF
      EE00FFFFFF00FFFFFF0089888500DDDDDC000000000089888500FFFFFF00FFFF
      FF00F1EFEE00F1EFEE00F1EFEE00F2F2F100C6C6C200AAA9A500ADACA800AAA9
      A500ADACA800ADACA800AAA9A500C3C2BF00EEEEED00F1EFEE00F1EFEE00F1EF
      EE00FFFFFF00FFFFFF00898885000000000000000000CC6B3B00F7BA9C00F7BA
      9C00EEA37A007C797900C4C4C400BFBCB800E9885A00E9885A00E9885A00BFBC
      B800BFBCB800BFBCB800BFBCB800BFBCB800C4C4C40079767600E9885A00F7BA
      9C00F7BA9C00CF6E3D00000000000000000000000000EEEEEE00CB693800F6B9
      9C00F6B99C00F6B99C00F6B99C00F6B99C00F6B99C00F6B99C00F6B99C00F6B9
      9C00F6B99C00F6BCA000DC885F00CC7C5500E8E3E10000000000000000000000
      000000000000000000000000000000000000000000008F8E8B00FFFFFF00FFFF
      FF00F8F8F700F8F8F700F1EFEE00D6D6D60095929000C6C6C200D6D6D600D6D6
      D600D6D6D600D6D6D600C3C2BF009A989600D0D0CE00F8F8F700F8F8F700F1EF
      EE00FFFFFF00FFFFFF008F8E8B00DDDDDC00000000008F8E8B00FFFFFF00FFFF
      FF00F8F8F700F8F8F700F1EFEE00D6D6D60095929000C6C6C200D6D6D600D6D6
      D600D6D6D600D6D6D600C3C2BF009A989600D0D0CE00F8F8F700F8F8F700F1EF
      EE00FFFFFF00FFFFFF008F8E8B000000000000000000D1744400F7BA9C00F7BA
      9C00F0A67F00807D7C00C4C4C400C4C1BD00E9885A00E9885A00E9885A00C4C1
      BD00C4C1BD00C4C1BD00C4C1BD00C4C1BD00C4C4C4007C797900E9885A00F7BA
      9C00F7BA9C00D1744400000000000000000000000000EEEEEE00CE6E3C00F6B9
      9C00F6B99C00ED9C7100ED9C7100ED9C7100ED9C7100ED9C7100F1A98400F6B9
      9C00F8BFA300DE8D6500CE805700E4DEDC000000000000000000000000000000
      0000000000000000000000000000000000000000000095929000FFFFFF00FFFF
      FF00F8F8F700F8F8F700D6D6D60095929000D0CECD00DDDDDC00E6E5E400E2E2
      E100E2E2E100E2E2E100E2E2E100D0CECD0095929000D6D6D600F8F8F700FFFF
      FF00FFFFFF00FFFFFF00908F8F00DDDDDC000000000095929000FFFFFF00FFFF
      FF00F8F8F700F8F8F700D6D6D60095929000D0CECD00DDDDDC00E8E6E600D5C0
      B200AC796E004E4E59004E515200474D45003D423C004A4C4C005A5E5D004E51
      5200E5B099009D664D00814B3200D0BEB20000000000D1744400F7BA9C00F7BA
      9C00F0A67F0083828000DFDEDF00DFDEDF00E1E1E100E1E1E100E1E1E100E1E1
      E100E1E1E100E1E1E100E1E1E100E1E1E100DFDEDF007C797900E9885A00F7BA
      9C00F7BA9C00D1744400000000000000000000000000EEEEEE00CE6E3C00F6B9
      9C00F6B99C00EEA07800EEA07800EEA07800EEA07800EEA68100F6B99C00F6B9
      9C00DF906900CD7E5800D9D3D000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009A989600FFFFFF00FFFF
      FF00FFFFFF00D6D6D6009D9A9900D6D6D600EEEEED00F1EFEE00F1EFEE00F1EF
      EE00F1EFEE00F1EFEE00F1EFEE00F0F0ED00D6D6D6009C9B9700D6D6D600F8F8
      F700FFFFFF00FFFFFF009A989600D9D9D900000000009A989600FFFFFF00FFFF
      FF00FFFFFF00D6D6D6009D9A9900D6D6D600EEEEED00F1EFEE00DAC5B700AA77
      6200DD9A82005A5D6500C6C6C200DCCBBA00CEB6A80097988F00B3B2B300606C
      6600B5745100D2936C00D99D7600B269530000000000D1744400F7BA9C00F7BA
      9C00F1A88300B9958100807D7C00838280008382800082807F0083828000807D
      7C008382800082807F0082807F00807D7C0082807F00B6866E00EF9C7500F7BA
      9C00F7BA9C00D1744400000000000000000000000000EEEEEE00D0704100F6B9
      9C00F6B99C00F0A57E00F0A57E00F0A57E00F0A57E00F1A98400F6B99C00EDAD
      8C00D3754500B4AEAC00EEEEEE00000000000000000000000000000000000000
      000000000000000000000000000000000000EEEEED00A09D9B00FFFFFF00FFFF
      FF00EEEEED00AAA9A500DDDDDC00D0D0CE00D0D0CE00D0D0CE00D6D6D600D0D0
      CE00D6D6D600D0D0CE00D6D6D600F0F0ED00F1EFEE00DDDDDC00AAA9A500EEEE
      ED00FFFFFF00FFFFFF00A09D9B00DDDDDC0000000000A09D9B00FFFFFF00FFFF
      FF00EEEEED00AAA9A500DDDDDC00D0D0CE00D0D0CE00D0BEB200AA776200E9AD
      8F00DFA47E0065676C00B6B8AC00AF7F6700C78A7400B2AD9B00BBADB100606B
      6A00D5A78400E3B68E00E3B68E00A7624B0000000000D77B4A00F7BA9C00F7BA
      9C00F1A88300F1A88300F1A88300F1A88300F1A88300F1A88300F2AD8800F1A8
      8300F1A88300F1A88300F1A88300F1A88300F1A88300F2AD8800F1A88300F7BA
      9C00F7BA9C00D77B4A00000000000000000000000000EEEEEE00D3754500F6B9
      9C00F6B99C00F1A98400F1A98400F1A98400F1A98400F1A98400F6B99C00F6B9
      9C00DA815400ACA09B00D9D9D900000000000000000000000000000000000000
      000000000000000000000000000000000000EEEEED00AAA9A500FFFFFF00EEEE
      ED00AAA9A500EEEEED00F1EFEE00F1EFEE00F9F9F900F1EFEE00F1EFEE00F8F8
      F700F1EFEE00F1EFEE00F1EFEE00F9F9F900F1EFEE00F9F9F900EEEEED00AAA9
      A500EEEEED00FFFFFF00A5A5A500EEEEED0000000000AAA9A500FFFFFF00EEEE
      ED00AAA9A500EEEEED00F1EFEE00F1EFEE00FFFFFF00AC796E00EAA78F00E3A8
      8200D1A573006B656B00CECBBB00CC866900DE856900C6BCA500D2B9C000555E
      5F00D1937C00DEA08100E3A88200BB67560000000000D77B4A00F7BA9C00F7BA
      9C00F2AD8800F3AF8E00F2AD8800F3AF8E00F2AD8800F2AD8800F2AD8800F2AD
      8800F3AF8E00F2AD8800F3AF8E00F2AD8800F2AD8800F2AD8800F2AD8800F7BA
      9C00F7BA9C00D77B4A00000000000000000000000000EEEEEE00D6794900F6B9
      9C00F6B99C00F1A98400EDAD8C00F1A98400F1A98400EDAD8C00F5B49300F6B9
      9C00ED9C7100C1896C00B5B5B500EEEEEE000000000000000000000000000000
      000000000000000000000000000000000000F1EFEE00B1B0AC00F1EFEE00B7B4
      B000DDDDDC00FFFFFF00FFFFFF00D0D0CE00D6D6D600D6D6D600D0D0CE00D0D0
      CE00D6D6D600D6D6D600D6D6D600D0D0CE00D6D6D600F1EFEE00FFFFFF00DDDD
      DC00B7B4B000F1EFEE00AAA9A500EEEEED0000000000B1B0AC00F1EFEE00B3B2
      B300DDDDDC00FFFFFF00FFFFFF00D0CECD00D6D6D600B06C4C00E2B29600CE99
      7B00DE9A7B0063796700D4BAAF00BB756F00C37D7600D7B5A900C8C8C200796B
      6A00CC876700D59D7F00DAA78C00B873530000000000DB815100F7BA9C00F7BA
      9C00ED956D00E8804F00E8804F00E8804F00E8804F00E8804F00E8804F00E880
      4F00E8804F00E8804F00E8804F00E8804F00E8804F00E8804F00ED956D00F7BA
      9C00F7BA9C00DB815100000000000000000000000000EEEEEE00DA815400F6B9
      9C00F6B99C00F2B49500F6B99C00F5B49300F3AF8D00F3AF8D00F5B49300F6B9
      9C00F6B89900DD845700AA9A9100B5B5B500D9D9D90000000000000000000000
      00000000000000000000EEDFD7000000000000000000C7C7C500B1B0AC009592
      9000FFFFFF00FFFFFF00F1EFEE00FFFFFF00F1EFEE00F9F9F900F9F9F900F9F9
      F900F1EFEE00F9F9F900F1EFEE00F9F9F900F5F5F500FFFFFF00FFFFFF00FFFF
      FF0095929000B1B0AC00C6C6C2000000000000000000C6C6C200B1B0AC009592
      9000FFFFFF00FFFFFF00F1EFEE00FFFFFF00F1EFEE00B8735300ECBCA000D5A7
      8400E4A081006C816F00DAC5B700D8B6AA00D8B6AA00DAB8AD00C8C8C2008173
      7200C47F6000C78A7400E2B29600B574510000000000DB815100F7BA9C00F7BA
      9C00E9865600F4EEEB00F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F4EEEB00E9865600F7BA
      9C00F7BA9C00DB815100000000000000000000000000EAEAEA00DA815400F6B9
      9C00F6B99C00F6B99C00F8C9B100F8BFA300F6B89900F5B49300F5B49300F6B9
      9C00F6B99C00F1A98400DD845700AA9A9100ABABAB00CECECE00D6D6D600D9D9
      D900D0C9C500E2C9BB00EEDFD700000000000000000000000000D6D6D6009C9B
      9700FFFFFF00FFFFFF00FFFFFF00F1EFEE00FFFFFF00F9F9F900F9F9F900F9F9
      F900F9F9F900FFFFFF00F9F9F900F9F9F900F9F9F900F1EFEE00FFFFFF00FFFF
      FF009A989600D6D6D60000000000000000000000000000000000000000009A98
      9600FFFFFF00FFFFFF00FFFFFF00F1EFEE00FFFFFF00BE7C6000E7B9A300DBA9
      9100E5A88E00A68978008A7C6A007F8170007F817000777D6E008C7E72009683
      7700C4826900D6A48C00E7B9A300BD79610000000000DE855700F7BA9C00F7BA
      9C00E9885A00F5F5F500D9D9D500D9D9D500D9D9D500D9D9D500D9D9D500D9D9
      D500D9D9D500D9D9D500D9D9D500D9D9D500D9D9D500F5F5F500E9885A00F7BA
      9C00F7BA9C00DE855700000000000000000000000000EEEEEE00DC885F00F6B9
      9C00F6B99C00F9D4BF00F6B99C00F9D9C800F8C9B100F6B99C00F6B99C00F6B8
      9900F6B99C00F6B99C00EEA68100DE8D6500C0907800B19E9300B9A9A000CBAD
      9E00DCB5A000E5C5B400F0E6E000000000000000000000000000DDDDDC009D9A
      9900FFFFFF00FFFFFF00FFFFFF00F9F9F900F9F9F900F9F9F900F9F9F900FFFF
      FF00F9F9F900F9F9F900F9F9F900FFFFFF00F9F9F900FFFFFF00FFFFFF00FFFF
      FF009C9B9700E6E5E40000000000000000000000000000000000000000009D9A
      9900FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F2F100BE7C6000E6B5A300DBA9
      9100EAA79200E9AD8F00E0AB8F00D5AA9100D1A69000DBA99100E9AA9300E5AB
      9100D1937C00E5AB9100EEBCAA00C47F600000000000E0895A00F7BA9C00F7BA
      9C00EC906500F5F5F500DFDEDF00DFDEDF00D9D9D500DFDEDF00DFDEDF00D9D9
      D500DFDEDF00DFDEDF00D9D9D500DFDEDF00DFDEDF00F5F5F500EC906500F7BA
      9C00F7BA9C00E0895A00000000000000000000000000EAEAEA00E38D6100F6B9
      9C00F9D9C800EDAD8C00E1966E00E5926500F8C4AB00F9DBCC00F8C4AB00F6B9
      9C00F6B99C00F6B99C00F6B99C00F2B49500EEA07800E29E7900DFA58500E2BA
      A500E8CEC000EACEBF0000000000000000000000000000000000E6E5E4009D9A
      9900FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D6009D9A99000000000000000000000000000000000000000000000000009D9A
      9900FAE3D600FAE3D600FED6C400FED6C400FED6C400BD715600E7AD9700DE9F
      8600BE7C6000BE7C6000BE7C6000BE7C6000BE7C6000BE7C6000BD806400BE7C
      6000A86F5600E4AC9800EEBCAA00C07D660000000000E0895A00F7BA9C00F7BA
      9C00ED956D00F5F5F500E2E1DE00E2E1DE00E2E1DE00E2E1DE00E2E1DE00E2E1
      DE00E2E1DE00E2E1DE00E2E1DE00E2E1DE00E2E1DE00F5F5F500ED956D00F7BA
      9C00F7BA9C00E0895A00000000000000000000000000EEEEEE00E5926500F9D9
      C800F3AF8D00DFAA8D00DBD5D300DDCDC500E1A38000EEA68100F6D3C000FBE3
      D800F8D0BA00F8C4AB00F6B99C00F6B99C00F6B99C00F8C4AB00EFD3C300ECD9
      CF00E7C1AD00F5F1EE0000000000000000000000000000000000EEEEED00A3A0
      9E00FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D600A3A09E00000000000000000000000000000000000000000000000000A3A0
      9E00FAE3D600FAE3D600FED6C400FED6C400FED6C400CC866900E4AC9800DAA7
      8C00BE7C6000E8E6E600FAE5E100FFEEEB00FFEEEB00E8E6E600FFEEEB00FAE5
      E100AF735A00E5B09900E5B9A500CC89700000000000E48E6100F7BA9C00F9D3
      C200EF9C7500F5F5F500E1E1E100E1E1E100E1E1E100E5E5E200E1E1E100E1E1
      E100E5E5E200E1E1E100E1E1E100E5E5E200E1E1E100F5F5F500EF9C7500F9D3
      C200F7BA9C00E48E6100000000000000000000000000F5F1EE00E5926500F2B4
      9500E2AF9200EEEEEE000000000000000000EEEEEE00E5C5B400E69F7600EEA0
      7800F8C4AB00F9DDCD00FCECE500FCECE500FCECE500F5E2D600EDC9B400E6B6
      9C00E8E3E1000000000000000000000000000000000000000000EEEEED00A5A5
      A500FAE3D600FAE3D600FED6C400FED6C400FED6C400FED6C400FED6C400FED6
      C400FED6C400FED6C400FED6C400FED6C400FED6C400FED6C400FAE3D600FAE3
      D600A9A7A600000000000000000000000000000000000000000000000000A5A5
      A500FAE3D600FAE3D600FED6C400FED6C400FED6C400C7795500EFB59400E9AD
      8F00D4856200F9EAE800DACAC700DECFCB00DDD3CC00C8C8C200DCD4D000FEF0
      EE00BD796100F1B69800F0BB9E00C780610000000000E6916400F7BA9C00F49E
      7B00EEA37A00F5F5F500EDEBEA00EDEBEA00EDEBEA00EDEBEA00EDEBEA00EDEB
      EA00EDEBEA00EDEBEA00EDEBEA00EDEBEA00EDEBEA00F5F5F500EEA37A00F49E
      7B00F7BA9C00E6916400000000000000000000000000F6F6F600ED9C7100E8B5
      9800000000000000000000000000000000000000000000000000EEEEEE00E3CF
      C400E2AF9200EEA07800ED9C7100ED9C7100ED9C7100E9A68100E7C1AD00F1F1
      F100000000000000000000000000000000000000000000000000EEEEED00A9A7
      A600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600A9A7A600000000000000000000000000000000000000000000000000A9A7
      A600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600CC897000DEB69600FED3
      B200CE9C8200F1EFEE00E1DDDA00E1DDDA00E1DDDA00E1DDDA00E1DDDA00F1EF
      EE00BC8E7600FFD9BB00E7B9A300CA8B7E0000000000ED956D00F7BA9C00F7BA
      9C00F0A67F00F5F5F500EDEBEA00EDEBEA00EDEBEA00EDEBEA00EDEBEA00EDEB
      EA00EDEBEA00EDEBEA00EDEBEA00EDEBEA00EDEBEA00F5F5F500F0A67F00F7BA
      9C00F7BCA000EC90650000000000000000000000000000000000F6F6F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6F6F600F1F1F100EEEEEE00EEEEEE00EEEEEE00F1F1F100000000000000
      0000000000000000000000000000000000000000000000000000F0F0ED00AAA9
      A500FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600FAE3
      D600AAA9A500000000000000000000000000000000000000000000000000AAA9
      A500FAE3D600FAE3D600FAE3D600FAE3D600FAE3D600D68A7700F9C09E00E19F
      7B00E19F7B00F9EAE800EBE2DE00E8E6E600EBE2DE00EBE2DE00EBE2DE00F0F0
      ED00D48F6F00E1A48300FBC8A800D68A770000000000EA996D00FAE6DD00FDED
      E500FDEDE500FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00F5F5F500FAFA
      FA00FAFAFA00F5F5F500FAFAFA00FAFAFA00FAFAFA00FAFAFA00FBE8DF00FDED
      E500FAE6DD00ED956D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F8F8F700B1B0
      AC00B1B0AC00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B0AF
      AB00B0AFAB00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0AC00B1B0
      AC00B1B0AC00000000000000000000000000000000000000000000000000B1B0
      AC00B1B0AC00B0AFAB00B0AFAB00B0AFAB00B0AFAB00B5827D00EDD2C400EDD9
      CB00EDD3CB00EEEEED00E1DDDA00EBEDE900E6E9E400E6E9E400E6E9E400EBED
      E900EDD3CB00FFEADD00FAE3D600C6938F0000000000E3BAA300EA996D00EA99
      6D00EA996D00EA996D00EA996D00EA996D00EA996D00EA996D00EA996D00EA99
      6D00EA996D00EA996D00EA996D00EA996D00EA996D00EA996D00EA996D00EA99
      6D00EA996D00E6C1AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DCCBBA00CAA48800C99C
      8000C99C8000DE9A7B00DE9A7B00DFA47E00DE9A7B00DE9A7B00DE9A7B00DE9A
      7B00C99C8000CE997B00CAA48800DACAC7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000600000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F07FFFFFFFFFFFFFFFFFFFFFF07FFFFF
      FFFFF8001FFFFFFFE0003F800007F8001FF0000FE0003F800007800001E00007
      00003F800007800001E0000700003F800007800001E0000700000F8000078000
      01E0000700000F800007800001E0000700000F800007800001E00007E0000F80
      0007800001E00007E0000F800007800001E00007E0000F800007800001E00007
      E0000F800007800001E00007E0000F800007800001E00007E0000F800007C000
      03E00007E0000F800007F8001FE00007E0000F800007F8001FE00007E0000F80
      0007F8001FE00007E0000F800007F8001FE00007E0000F80000FF8001FE00007
      E0003F80001FF8001FF0000FE0003F80003FF8001FFF81FFFFFFFF80007FFFFF
      FFFFC3FFFFFFFF8000FFFFFFFFFFFFFFFFFFFFC3FFFFFF0003FFFFFFFFFFFF80
      FFFFFF0001FF0003FFFFFF00FFFFFE0001C00003FF0007007FC7FE0001800003
      FE0003003F03C00001800003FC0001003C01800001800003FE00010000038000
      01800003FE0001000007800001800003FF000180000F800001800003FF8001C0
      001F800001800003FF8001E0003F800001800003FF8001F8003F800001800003
      FF0001F8003F800001800001FE0001F0001F800001800001C80001C0000F8000
      01800003C00001800007800003800003C00001000003800003800007C0000100
      180180000780000FE000C1003E0180000F80003FF003E1007F8180007F80003F
      FC1FFB007FE38003FF80003FFFFFFF80FFFF8007FFF0007FFFFFFFE1FFFF800F
      FFFC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80000080
      0001FFFFFFFFFFFF800000800001C00003FFFFFF800000800001C00003C000FF
      800000800001800003C0007F80000080000180000380003F8000008000018000
      0380007F80000080000180000380007F8000008000018000038000FF80000080
      00008000038001FF8000008000008000038001FF0000008000008000038001FF
      0000008000008000038000FF00000080000080000380007D8000018000008000
      03800001C00003E00000800003800001C00003E00000800003800003C00007E0
      0000800003800003C00007E00000800003830007C00007E000008000038FC00F
      C00007E00000800003DFF03FC00007E00000800003FFFFFFC00007E000008000
      03FFFFFFFFFFFFFF8000FFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object iltStatusBar: TImageList
    Left = 528
    Top = 536
    Bitmap = {
      494C010105000900080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      0000666666006666660066666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A89A
      9400A89A9400B3A19D00A89A9400666666006666660066666600666666000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C898300CA8A
      8A00E4CACA00E9D3D300DAB3B300B5A58F00B4AAA500A89A94009C8E88006666
      6600666666006666660066666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A18B8500C5808000C47D
      7D00E2C3C300ECDADA00DCBABA002B9B220086A16A00D2A6A600D2A6A600D2A6
      A600B4AAA500E2C3C30066666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3989200C47D7D00794C8700794C
      8700DAB3B300ECDADA00DCBABA00CCA5A2001D9A170086A16A00D2A6A600D2A6
      A600D3A9A900E2C3C30066666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C47D7D00C47D7D00794C8700C47D
      7D00D19A9A00E9D3D300DCC0C000D3A9A900CCA5A200119A0D00B5A58F00409D
      3300D3A9A900D8ABAB0066666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A37390003622910041298E00C47D
      7D00CA8A8A00E9D3D300E2C3C300D3A9A900D2A6A60092A2730000990000119A
      0D00DAB3B300D19A9A0066666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C47D7D00BF797D003C269000C47D
      7D00C5808000E4CACA00E2C3C300D3A9A900D2A6A6005D9F4A00239B1B000099
      0000E2C3C3006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C580800041298E00C47D
      7D00C47D7D00DAB3B300E4CACA00DCBABA00DAB3B300D2A6A600D2A6A600D3A9
      A900E9D3D3006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D19A9A0088568500C580
      8000D2A6A600ECDADA00E2C3C300D8ABAB00D8ABAB00E2C3C300E0BBBB00F0E1
      E100666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E0BBBB00E0BB
      BB00E2C3C300D4884A00CC660000CC660000D08A6800CD929200B28882006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D2BCBA00DCCDCC00D4C2C100D2BCBA00B4AAA5009C8E8800000000000000
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
      00000000000000000000000000000000000000000000F0E4DD00C2472F00C983
      6E0000000000000000000000000000000000C78E7F00A3453200892A17000000
      0000000000000000000000000000000000000000000071717100717171007171
      71006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D0000000000000000000000
      00000000000000000000000000000000000081A9B80048718200467183004671
      830037708A00316D89002C67860000000000000000002C6380002C6786002C63
      80002C6380002F5E7700305B7200305B72000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEDFD700D6A5
      9400C7755F00BF604600E3C6BB00B65D4B00BD736200D6A59400000000000000
      0000000000000000000000000000000000006D6D6D00B1654D008C5036008C50
      36008C5036008C5036006C554C006A635F00717171006D6D6D006D6D6D006D6D
      6D006D6D6D0071717100717171006D6D6D0081A9B80069D2FC0069D2FC0069D2
      FC003AB6E50020A2D8001AA4D5000000000000000000000000001AA4D5003CAC
      E4004BB6ED0054BFF10054BFF100415A6B000000000000000000000000000000
      0000000000000000000080A0B0006090A0005088900050788000406070003048
      500030405000A2A8AD0000000000000000000000000000000000000000000000
      0000E8D4C900C7796500A4331C00BF6658000000000000000000000000000000
      000000000000000000000000000000000000E0664200DC513100F9635000FD72
      5C00F1684E00D7744500F1684E00D24C270035593800355938002F982D004890
      37002F982D0025662500355938006D6D6D0081A9B80069D2FC0060CCF60030B1
      E0000D94CB00009BE20000000000000000000000000070D6FE0070D6FE0070D6
      FE0070D6FE0070D6FE0070D6FE00415A6B000000000000000000000000000000
      0000000000000000000080A8B00090E0F00070C0D00060B8D00060B0C00060A8
      C0004058600030384000A2A8AD00000000000000000000000000000000000000
      0000DC9D8900BD4B2F00DBB2A100AF412C000000000000000000000000000000
      000000000000000000000000000000000000D5885500F9635000FD7C6400FC8B
      6D00D5885500FFCF9C00F36D5300FD6A5700917930004DB34D006AA9660063CA
      630052C252003CB73C00239023006D6D6D0081A9B80068CEF5002BACDF000FA6
      D70035D1FE0028C6F800000000000000000070D6FE0070D6FE0070D6FE0070D6
      FE0070D6FE0070D6FE0070D6FE004661710000000000000000000000000080A0
      B0006090A0004070800080A8C000B0E8F00090E0F00080E0F00070D8F00070D0
      E0006078800070D0E000303840009FA7AB00000000000000000000000000EAD1
      C700D4887000D4887000E5CFC200C9765D000000000000000000000000000000
      00000000000000000000000000000000000000000000E0664200FD846900EB80
      5900FFCF9C00FFCF9C00EF765600FD6B580080AB670080B38000FFEFDF004DB3
      4D0075D275004FC14F00489037006D6D6D0081A9B80055C5E90003A0D6002CCC
      F20028C4EC000097CE0047BCE200000000000000000078DDFF0078DDFF0078DD
      FF0078DDFF0078DDFF0078DDFF004661710000000000000000000000000080A8
      B00090E0F00060A0B00080B0C000C0E8F000B0E8F00090E0F00080E0F00070D8
      F000708890006078800040586000304050000000000000000000D47D5F00C757
      3500C7573500B8432700AF382100A62E1A009F251400B8615700000000000000
      0000000000000000000000000000000000000000000000000000B1654D004C21
      4F002E3457007F4C6E00B1654D00917930007CD77C008FE08F00FFF7E800BFD9
      AC005BC55B0044A64400000000000000000081A9B8003CB3DC003EC1E50039B8
      DE002EB3DB0016A0CE00000000000000000000000000000000007FE4FF007BE0
      FE007FE4FF007BE0FE007FE4FF004661710080A0B0006090A0004070800080A8
      C000B0E8F00080C0D00090B8D000D0F0FF00C0E8F000B0E8F00090E0F00080E0
      F00070D8F00070D0E00060A8C00030485000000000000000000000000000F0E4
      DD0000000000EEDFD700B23E2800D8C3B7000000000000000000000000000000
      000000000000000000000000000000000000000000001717170005070E000D29
      6800143AA000102F9500081D6C00545454006AA96600427399001579BA00247D
      B600377D57004D4D4D00000000000000000081A9B80051BCE10079E3F6007BE0
      FE007FE4FF007FE4FF0000000000000000007BE0FE007FE4FF007BE0FE007FE4
      FF007FE4FF007FE4FF007FE4FF004661710080A8B00090E0F00060A0B00080B0
      C000C0E8F00090C8D00090C0D000D0F0FF00D0F0FF00C0E8F000B0E8F00090E0
      F00080E0F00070D8F00070D0E00030486000D3C4BB0015141300C4B5AC001817
      1700D2C7C100D3C4BB002D2B2A003C37330046403C00F0E4DD00000000000000
      0000000000000000000000000000000000003F3F3F001A1A1A00102C5B001A4D
      B3001C56BC001B51B700102F950054545400699AAE002C92F1003399FF003399
      FF002C92F1002C586F00848484000000000081AEBF0076D1EC0082E8FF0082E8
      FF0082E8FF0082E8FF0082E8FF00000000000000000082E8FF0082E8FF0082E8
      FF0082E8FF0082E8FF0082E8FF004E6B790080A8C000B0E8F00080C0D00090B8
      D000D0F0FF00C0E8F00090C8D00090C8D00090C0D00090B8D00080B0C00080A8
      C00080A0B0007098B0007090A0007090A0008E8079001A191900756E6B005252
      5200A69C97002D2B2A007C747000AEAFAF001A242D00AC9C9200262220000000
      00000000000000000000000000000000000017171700282828000F2D93002774
      DA002671D7002671D7001E5AC0005A6064003F95C30040A6FF0040A6FF0040A6
      FF003DA2FF002385C6006D6D6D000000000083B0C1008CDEF10086EFFC0086EF
      FC0086EFFC0088EEFF0088EEFF00000000000000000088EEFF0088EEFF0088EE
      FF0088EEFF0088EEFF0088EEFF004C69770080B0C000C0E8F00090C8D00090C0
      D000D0F0FF00D0F0FF00C0E8F000B0E8F00090E0F00080E0F00070D8F00070D0
      E0003048600000000000000000000000000051494500AC9C920074797A005E75
      84009A9B9C0041414000858688004A6170001E6E8B00223444009A9B9C000000
      00000000000000000000C0C8B600000000002C2C2C00363636002C586F003191
      F9003399FF003694F700246AD0005A606400479FD0004BB1FF004BB1FF004BB1
      FF004BB1FF002D92E600666666000000000083B0C1009FE5F7008FF5FF008FF5
      FF008FF5FF008FF5FF008FF5FF008FF5FF0000000000000000008FF5FF008FF5
      FF008FF5FF008FF5FF008FF5FF004C69770090B8D000D0F0FF00C0E8F00090C8
      D00090C8D00090C0D00090B8D00080B0C00080A8C00080A0B0007098B0007090
      A0007090A00000000000000000000000000000000000EEDFD7008FA4AC0086D3
      E5004A617000A3ACB200465C6A0061C1DE004C616F0029B6E90015273300102C
      3A00152733006E6C6C003D7443005EB072006D6D6D004D4D4D003F3F3F004646
      4600143AA0002060C600135F88007E7E7E0057A9D7004DB3F2004DB3F20055BB
      FF0051B7FF0043A8ED006D6D6D000000000083B0C100B2EFF80099FFFF0099FF
      FF0099FFFF0099FFFF00000000000000000000000000000000000000000099FF
      FF0099FFFF0099FFFF0099FFFF004E6B790090C0D000D0F0FF00D0F0FF00C0E8
      F000B0E8F00090E0F00080E0F00070D8F00070D0E00030486000000000000000
      0000000000000000000000000000000000000000000000000000D6CBC4008FA4
      AC0083E1F6004A6170007ACDE2004C616F0065D2F200455D710032B2DF001D99
      C8001A88B3001F536D004F8458004CAC64000000000036363600666666008F8F
      8F00A4A4A4004D4D4D00464646000000000063ABD200247DB60057A9D70063AB
      D200479FD0001372A200699AAE000000000092C5D600C7F5FB00AAFFFF00AAFF
      FF00AAFFFF00AAFFFF000000000000000000AAFFFF00AAFFFF00AAFFFF00AAFF
      FF00AAFFFF00AAFFFF00AAFFFF00506D7B0090C8D00090C8D00090C0D00090B8
      D00080B0C00080A8C00080A0B0007098B0007090A0007090A000000000000000
      000000000000000000000000000000000000000000000000000000000000D6CB
      C4008FA4AC0083E1F6004A61700083E1F6003C59730065D2F20050C9EF003BBF
      EB0027B2E4001CA3D60064956E0053B46C0000000000000000006D6D6D00605E
      5E00605E5E00666666000000000000000000000000003A8BB70084C0E400A3D0
      EA00479FD000699AAE00000000000000000092C5D600DAFBFF00CCFFFF00C4FF
      FF00C4FFFF00C4FFFF00C4FFFF000000000000000000C4FFFF00C4FFFF00C4FF
      FF00C4FFFF00C4FFFF00C4FFFF00506D7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6CBC4008FA4AC0083E1F600455D710083E1F60077DBF40065D2F20050C9
      EF003BBFEB0029B6E90076A583005DC078000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003A8BB7003A8B
      B7003A8BB70000000000000000000000000092C5D60092C5D60092C5D60092C5
      D60092C5D60092C5D6008EC1D0008EC1D00000000000000000008DBECE008DBE
      CE0085B2C20081A9B80081A9B80081A9B8000000000000000000000000000000
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
      9A007A8B9600B1AEAC0099B89C00AEC1A600424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      F1FF000000000000E01F000000000000C0010000000000008001000000000000
      0001000000000000000100000000000000010000000000000003000000000000
      80030000000000008007000000000000C00F000000000000F03F000000000000
      FFFF000000000000FFFF000000000000FFFFFFFFFFFF8F1F807F0180FFFFC03F
      000001C0FC03F0FF00000380FC01F0FF00000300E000E0FF80000180E000C03F
      C00303C00000E8FF800303000000003F000101800000001F000101800007001D
      000100C000070000000103E0003FC00081010300003FE000C3830180FFFFF000
      FFC700C0FFFFF800FFFFFFFFFFFFFC0000000000000000000000000000000000
      000000000000}
  end
  object iltHeader: TImageList
    Height = 12
    Width = 12
    Left = 561
    Top = 535
    Bitmap = {
      494C01010200040008000C000C00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000300000000C00000001002000000000000009
      000000000000000000000000000000000000000000000000000050AA5400208B
      2000209222002092220020922200209222001D8E1C0050AA5400000000000000
      000000000000000000000000000000000000000000004EA852004EA852000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000050AA540086B2
      8800A9DFB200A9DFB200A9DFB200AEE1B80076BB7A0050AA5400000000000000
      00000000000000000000000000000000000066B46A006EBA770073C87E0068B9
      6D00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000050AA540086B2
      8800C5EED500C5EED500CBF1D800D0F2DC0076BB7A0050AA5400000000000000
      00000000000000000000000000004EA852006EBA77009CDEAE00A2E2B70073C9
      83004EA852000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000050AA54007FB1
      870096DEAD008ADBA50058CD85004AC87A0041B05B0050AA5400000000000000
      000000000000000000004EA852006DBE7E008ADBA50096DFAE0096DFAE0090DE
      A70074CF89004EA8520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000050AA540072B1
      7D0058CD850051CA7E0051CA7E004AC87A0041B05B0050AA5400000000000000
      0000000000005FB5660050B9630074D693007ED89E007ED89E0081D9A00081D8
      9E007BD6980053C26D0062B86A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000050AA540050AA5400158A160072B1
      7D0051CA7E0058CD850058CD850058CD85004EB46500158A160050AA540050AA
      54004AA84E003EB04A0056BD680065CC820068D28D0068D28D006AD391006AD3
      910065CC820061C7740049B356004AA84E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004AA84E003EB04A0057BE680065CC
      820069D28D006AD391006AD391006AD3910065CC820061C774004AB456004DA9
      510051AB550051AB5500158B160072B17D0051CA7E0059CD850059CD850059CD
      85004EB56500158B160051AB550051AB55000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000060B5660050B9620074D6
      93007ED89E007ED89E0081D9A00081D9A0007BD6980053C26D0063B96B000000
      0000000000000000000051AB550072B17D0059CD850051CA7E004FCB7D004FCB
      7D0045B05B0051AB550000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004DA951006CBE
      7D008ADBA50096DEAD0096DEAD008ADBA50074CF89004DA95100000000000000
      0000000000000000000051AB55007FB1870096DFAE008ADBA50059CD850049C7
      790045B05B0051AB550000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004DA9
      51006BBA75009CDEAE00A2E2B70073C9830050AA540000000000000000000000
      0000000000000000000051AB550086B48C00C3EED400C3EED400CBF1D800D0F2
      DC0075BD7F0051AB550000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000066B46A006BBA750073C87E0063B96B000000000000000000000000000000
      0000000000000000000051AB550086B48C00A9DEB200A9DEB200AEE0B800AEE0
      B80075BD7F0051AB550000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004DA951004DA95100000000000000000000000000000000000000
      0000000000000000000051AB5500208B20002092220020922200209222002092
      22001C8E1C0051AB550000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000300000000C0000000100010000000000600000000000000000000000
      000000000000000000000000FFFFFF00C03F9F0000000000C03F0F0000000000
      C03E070000000000C03C030000000000C0380100000000000000000000000000
      0000000000000000801C030000000000C03C030000000000E07C030000000000
      F0FC030000000000F9FC03000000000000000000000000000000000000000000
      000000000000}
  end
  object actEdit: TActionList
    Left = 432
    Top = 536
    object aSynSaveAs: TaSynSaveAs
      Category = 'SynEdit'
      Caption = 'aSynSaveAs'
      SaveDialogTitle = #20869#23481#21478#23384#20026
      SaveDialogOptions = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    end
    object aSynFind: TaSynFind
      Category = 'SynEdit'
      Caption = 'aSynFind'
    end
    object aSynFindNext: TaSynFindNext
      Category = 'SynEdit'
      Caption = 'aSynFindNext'
    end
    object aSynFindLast: TaSynFindLast
      Category = 'SynEdit'
      Caption = 'aSynFindLast'
    end
    object aSynReplace: TaSynReplace
      Category = 'SynEdit'
      Caption = 'aSynReplace'
    end
    object aSynUndo: TaSynUndo
      Category = 'SynEdit'
      Caption = 'aSynUndo'
    end
    object aSynRedo: TaSynRedo
      Category = 'SynEdit'
      Caption = 'aSynRedo'
    end
    object aSynCut: TaSynCut
      Category = 'SynEdit'
      Caption = 'aSynCut'
    end
    object aSynCopy: TaSynCopy
      Category = 'SynEdit'
      Caption = 'aSynCopy'
    end
    object aSynPaste: TaSynPaste
      Category = 'SynEdit'
      Caption = 'aSynPaste'
    end
    object aSynInsertFile: TaSynInsertFile
      Category = 'SynEdit'
      Caption = 'aSynInsertFile'
      OpenDialogTitle = #23548#20837#25991#26412
    end
    object aSynClearAll: TaSynClearAll
      Category = 'SynEdit'
      Caption = 'aSynClearAll'
    end
  end
  object iltMenu: TImageList
    Left = 592
    Top = 536
    Bitmap = {
      494C010117001800080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      000000000000000000000000000000000000000000000000000002466A000246
      6A0002466A0002466A0002466A0002466A0002466A0002466A0002466A000246
      6A0002466A0002466A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B8B8B80092929200ABABAB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002466A004EB6D60056BE
      DE0056BEDE0056BEDE0056BEDE0056BEDE0056BEDE0056BEDE0056BEDE0056BE
      DE0056BEDE004EB6D60002466A00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009F9F9F00003F
      5D00393939009F9F9F0000000000000000000000000000000000000000000000
      000000000000000000009B6900007C540000BA7E0000B8B8B800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000024A6E0056BEDE00625E
      5E00625E5E00625E5E00625E5E00625E5E00625E5E00625E5E00625E5E00625E
      5E00625E5E0056BEDE00024A6E00000000000000000000000000000000000000
      000000000000000000000000000000000000000000009F9F9F0052525200009B
      9B00007EBA0045454500ABABAB00000000000000000000000000000000000000
      0000ABABAB009B690000FF854800FF8548009B69000085858500B8B8B8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000024A720056BEDE006666
      6200FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE006666620056BEDE00024A7200000000000000000000000000000000000000
      0000000000000000000000000000000000009F9F9F0052525200007EBA0048C2
      FF0090DAFF0090DAFF009292920000000000000000000000000000000000ABAB
      AB009B690000FF854800FF9D6C00FF9D6C00FF8548009B690000929292000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000024A720056BEDE006E6A
      6600FEFEFE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00FEFE
      FE006E6A660056BEDE00024A7200000000000000000000000000000000009292
      9200808080005F5F5F005F5F5F00787878006C6C6C0000699B0048C2FF0090DA
      FF0090DAFF0092929200ABABAB00000000000000000000000000000000009B69
      0000FF854800FF9D6C00FF9D6C00B8B8B800FFB59000FF8548009B690000ABAB
      AB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002527A0056BEDE007272
      6E00FEFEFE00EAB29600EAB29600EAEAE600EAB69A00EAB69A00EAEAE600FEFE
      FE0072726E0056BEDE0002527A00000000000000000000000000858585009292
      9200ABABAB00F0CAA600F0CAA600ABABAB00808080007878780090B5FF0090DA
      FF0092929200ABABAB000000000000000000000000000000000000000000FFB5
      9000FFB59000FF9D6C00000000000000000000000000FFB59000FF8548009B69
      0000F0CAA6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002527A0056BEDE007676
      7200FEFEFE00EABAA600EABAA600EEEEEA00EEC6B200EEC6B200EEEEEA00FEFE
      FE007676720056BEDE0002527A00000000000000000085858500ABABAB00EBEB
      EB00FFE6B400DEDEDE00FFCDB400FFCDB400F0CAA600A4A0A0006C6C6C008585
      8500ABABAB000000000000000000000000000000000000000000000000000000
      0000F0CAA6000000000000000000000000000000000000000000FF9D6C00FF85
      480080808000F0CAA60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000256820056BEDE007E7A
      7600FEFEFE00EEC6B200EEC6B200F2F2F200F2DACE00F2DACE00F2F2F200FEFE
      FE007E7A760056BEDE000256820000000000A4A0A000ABABAB00F8F8F800EBEB
      EB00EBEBEB00EBEBEB00FFE6B400D2D2D200FFCDB400FFCDB400858585009292
      9200000000000000000000000000000000000000000000000000121212007878
      780000000000000000000000000039393900121212005F5F5F00000000006C6C
      6C002C2C2C001212120039393900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000256820056BEDE008282
      7E00FEFEFE00F2D2C200F2D2C200F2F2F200FEFEFE00F2F2F200F2F2F200FEFE
      FE0082827E0056BEDE00025682000000000092929200D2D2D200FFFFFF00F8F8
      F800F8F8F800EBEBEB00EBEBEB00DEDEDE00DEDEDE00FFCDB400ABABAB007878
      7800000000000000000000000000000000000000000000000000929292004545
      4500000000000000000000000000ABABAB0052525200A4A0A00000000000ABAB
      AB006C6C6C003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000025A8A0056BEDE008A86
      8200FEFEFE00F2DACE00F2DACE00FEFEFE00F2F2F200FEFEFE00FEFEFE00FEFE
      FE008A86820056BEDE00025A8A000000000085858500EBEBEB00FFFFFF00FFFF
      FF00F8F8F800F8F8F800EBEBEB00EBEBEB00DEDEDE00D2D2D200F0CAA6005F5F
      5F00000000000000000000000000000000000000000000000000ABABAB000000
      0000000000000000000000000000000000006C6C6C0012121200454545004545
      45001212120078787800BA7E0000B8B8B8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000025A8A0056BEDE008E8E
      8A00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE008E8E8A0056BEDE00025A8A000000000085858500EBEBEB00FFFFFF00FFFF
      FF00FFFFFF00F8F8F800F8F8F800EBEBEB00EBEBEB00FFE6B400FFCDB4005F5F
      5F00000000000000000000000000000000005252520000000000000000000000
      000000000000000000000606060052525200929292004545450000000000A4A0
      A00039393900A4A0A000F0CAA600FF9D6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000025A8A0056BEDE009292
      8E00FEFEFE00DADADA00DADADA00DADADA00DADADA00DADADA00DADADA00FEFE
      FE0092928E0056BEDE00025A8A0000000000A4A0A000D2D2D200FFFFFF00FFFF
      FF00FFFFFF00F8F8F800F8F8F800F8F8F800EBEBEB00FFE6B400B8B8B8007878
      780000000000000000000000000000000000000000000000000000000000A4A0
      A00000000000000000000000000000000000B8B8B8005F5F5F00787878007878
      78005F5F5F00B8B8B80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000066A9A005EBEDE009A96
      920092928E006666620066666200666662006666620066666200666662009292
      8E009A9692005EBEDE000262920000000000A4A0A000ABABAB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F8F8F800F8F8F800F8F8F800EBEBEB00929292009292
      920000000000000000000000000000000000B8B8B800000000005F5F5F000000
      00000000000052525200B8B8B800000000000000000092929200393939002C2C
      2C00929292000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000066A9A00C6E6F200D2EE
      F600D2EEF600929A9A00C6C2C200E6E6E600E6E6E600C6C2C200929A9A00D2EE
      F600D2EEF600C6E6F200026292000000000000000000A4A0A000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8F800B8B8B800858585000000
      00000000000000000000000000000000000039393900A4A0A000000000000000
      000000000000ABABAB00858585001212120000000000B8B8B800454545004545
      4500B8B8B8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000002669A000266
      9A0002669A003A728E0086868200BEBEBE00BEBEBE008686820032728E000266
      9A0002669A0002669A0000000000000000000000000000000000A4A0A000ABAB
      AB00D2D2D200EBEBEB00F8F8F800D2D2D200ABABAB0092929200000000000000
      00000000000000000000000000000000000092929200454545002C2C2C000606
      0600000000002C2C2C0045454500787878000000000000000000929292009292
      9200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A2A29E009A9A960000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4A0
      A000A4A0A000858585008585850092929200A4A0A00000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4A0
      A0002C2C2C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D69B8E00D7846C00CB5D3C00CB5D3C00D7846C00D69B8E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009F9AA000203040009A939600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69B
      8E00CF603E00DE6B4200E68C6D00EFAE9700EFAE9700E68C6D00DE6B4200CF60
      3E00D69B8E000000000000000000000000000000000071717100717171007171
      71006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D0000000000000000000000
      00000000000000000000000000000000000000000000B0A09000604830006048
      3000604830006048300060483000604830006048300060483000604830005048
      4000305060004078C000304860009F9A9B000000000000000000806850008060
      5000806050007060500070584000705840007050400070504000604830006048
      3000604830000000000000000000000000000000000000000000CD7D6200E47C
      4B00F0B29A00FDEAE400FFEFE800FFE7D800FFE7D800FDEAE400FDEAE400EFAE
      9700DE6B4200CA735D0000000000000000006D6D6D00B1654D008C5036008C50
      36008C5036008C5036006C554C006A635F00717171006D6D6D006D6D6D006D6D
      6D006D6D6D0071717100717171006D6D6D0000000000B0A09000FFFFFF00B0A0
      9000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000908880003050
      70003080D0004098E00050B0F0005068700000000000A0898100E0D0C000B0A0
      9000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A0
      9000B0A0900060483000000000000000000000000000D8A39200EB8E5400F6CB
      B400FEF2EC00FFDEC500FFCFA800FFCDA600FFCDA600FFCDA600FFD8B900FDEA
      E400F3BFAC00DE6B4200D69B8E0000000000E0664200DC513100F9635000FD72
      5C00F1684E00D7744500F1684E00D24C270035593800355938002F982D004890
      37002F982D0025662500355938006D6D6D0000000000B0A09000FFFFFF00FFFF
      FF00FFFFFF00F0F0F000D0D8D000909890007068600060686000505860004070
      900040A0E00060C8FF007090A000B3ACAA00B8A69A00B1999100FFE8E000FFF8
      F000FFF0E000FFE8E000F0D8D000F0D0B000F0C0A00000A0000000A0000000A0
      00007058400060483000836C59000000000000000000DD875100F7C7A600FEF2
      EC00FFDEC500FFD6B600E6BFA200FFD6B600FFD4B100FFCDA600FFD6B600FFD4
      B100FEF2EC00EFAE9700CF603E0000000000D5885500F9635000FD7C6400FC8B
      6D00D5885500FFCF9C00F36D5300FD6A5700917930004DB34D006AA9660063CA
      630052C252003CB73C00239023006D6D6D0000000000B0A09000FFFFFF00FFFF
      FF00FFFFFF00E0E0E00090909000B0A8A000D0C0B000D0B0A000807870005058
      50006090B0007098B000A0A2A20000000000B0908100E0D8D000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF0F000F0E0E000F0D8C00000FF100000FFB00000A0
      000080685000705040006048300000000000D8A39200F4A75F00FEF2EC00FFEA
      D900FFDEC500EFCEB50084686300CEAB9700FFD6B600FFD6B600FFD4B100FFD4
      B100FFDEC500FDEAE400DE6B4200D69B8E0000000000E0664200FD846900EB80
      5900FFCF9C00FFCF9C00EF765600FD6B580080AB670080B38000FFEFDF004DB3
      4D0075D275004FC14F00489037006D6D6D0000000000B0A09000FFFFFF00FFFF
      FF00FFFFFF00B0B0B000C0B8B000FFF0E000FFE8E000F0D8C000F0D0B0008078
      700091838500A0A2A2000000000000000000B0908100F0E8E000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0E8E00000FF100000FF100000A0
      000090706000706050006048300000000000DE9C7100F9C18800FFF7F400FFE8
      D500FFE6D100FFE6D100E6CAB60084686300CEAE9C00FFD8B900FFD8B900FFD8
      B900FFD6B600FEF2EC00E68C6D00D7846C000000000000000000B1654D004C21
      4F002E3457007F4C6E00B1654D00917930007CD77C008FE08F00FFF7E800BFD9
      AC005BC55B0044A64400000000000000000000000000C0A89000FFFFFF00FFFF
      FF00FFFFFF00A0989000F0E8E000FFF8F000FFF0F000FFE8E000F0D8D000D0B0
      A0005F645C00000000000000000000000000B0988000D0C0B000D0B8B000C0B0
      A000B0A09000B0988000A0898100908070009070600080686000806050007058
      500090807000806860007058400000000000E49A5A00FFD6B600FFF7F400FFEA
      D900FFEAD900FFE8D500FFE8D500E6CDBC007C605D00FFE6D100FFE6D100FFDE
      C500FFDEC500FFF1E600EFB09A00CB5D3C00000000001717170005070E000D29
      6800143AA000102F9500081D6C00545454006AA96600427399001579BA00247D
      B600377D57004D4D4D00000000000000000000000000C0A8A000FFFFFF00FFFF
      FF00FFFFFF00A0A09000F0E8E000FFFFFF00FFF8F000FFF0F000FFE8E000E0C0
      B0006D6B6A00000000000000000000000000C0A09000FFF8F000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000FFF0F000F0F0F000F0E8
      E000A0898100907860008060500000000000E49A5A00FFD6B600FFF7F400FFF7
      F400FFF1E600FDEAE400FDEAE400FFEAD9007C605D00FFE8D500FFE6D100FFE6
      D100FFE6D100FFF1E600EFB09A00CF603E003F3F3F001A1A1A00102C5B001A4D
      B3001C56BC001B51B700102F950054545400699AAE002C92F1003399FF003399
      FF002C92F1002C586F00848484000000000000000000C0B0A000FFFFFF00FFFF
      FF00FFFFFF00C0C8C000C0C0C000FFFFFF00FFFFFF00FFF8F000FFF0E000B0A0
      9000988E8A0000000000000000000000000000000000B0988000D0B0A000C0A8
      A000D0B0A000C0A09000B0908100A08070009070600080605000706050008070
      6000B0A09000A08870008060500000000000E0A47500FED29200FFFFFF00FFF7
      F400FEF2EC00FFF7F100FEF2EC00FEF2EC007C605D00FFEAD900FFEAD900FFEA
      D900FFE8D500FFF7F400E68C6D00D1795F0017171700282828000F2D93002774
      DA002671D7002671D7001E5AC0005A6064003F95C30040A6FF0040A6FF0040A6
      FF003DA2FF002385C6006D6D6D000000000000000000D0B0A000FFFFFF00FFFF
      FF00FFFFFF00F0F8FF00C0B8B000C0C0C000F0E8E000F0E8E000B0B0A0007070
      6000CCB8B0000000000000000000000000000000000000000000C0B0A000E0C8
      C000FFFFFF00FFFFFF00FFF8FF00FFF0F000F0F0E000F0E0E000C0A8A0008060
      5000A0908000C0B0A0008060500000000000DCAC9600FEC56E00FFF7F400FFFF
      FF00FFFFFF00FFF7F100FFF7F100FFF7F1007C605D00FFF7F400FEF2EC00FFF1
      E600FEF2EC00FEF2EC00E0704500D69B8E002C2C2C00363636002C586F003191
      F9003399FF003694F700246AD0005A606400479FD0004BB1FF004BB1FF004BB1
      FF004BB1FF002D92E600666666000000000000000000D0B8A000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F0F8FF00C0C8C000A0A0900090908000909090006050
      400000000000000000000000000000000000000000000000000000000000C0B0
      A000FFFFFF00F0E0E000D0C8C000D0C8C000D0B8B000D0C0B000E0D0D0008068
      600080605000B1999100B0A090000000000000000000E7A45F00FEE1B600FFF7
      F100FFFFFF00FFFFFF00FFFFFF00FFFFFF007C605D00FFF7F400FFF7F400FFF7
      F400FFFFFF00F7C7A600D46C4400000000006D6D6D004D4D4D003F3F3F004646
      4600143AA0002060C600135F88007E7E7E0057A9D7004DB3F2004DB3F20055BB
      FF0051B7FF0043A8ED006D6D6D000000000000000000D0B8B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0A0900060483000604830006048
      300000000000000000000000000000000000000000000000000000000000D0B9
      A800F0E8E000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF0F000F0D8D000D0B8
      B00080605000AD948900000000000000000000000000DCAC9600FEC56E00FFE9
      C900FFF7F100FFFFFF00FFF7F100FFFFFF00E6E1E100FFFFFF00FFF7F100FFFF
      FF00F8D6BE00EB8E5400D7A09000000000000000000036363600666666008F8F
      8F00A4A4A4004D4D4D00464646000000000063ABD200247DB60057A9D70063AB
      D200479FD0001372A200699AAE000000000000000000D0C0B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A89000D0C8C00060483000D0B5
      A900000000000000000000000000000000000000000000000000000000000000
      0000D0B8B000FFFFFF00F0F0F000D0C8C000D0C8C000D0B8B000C0B0B000E0D8
      D000807060008060500000000000000000000000000000000000D6966E00FEC5
      6E00FEE1B600FFFFFF00FFF7F100FFFFFF00FFF7F100FFFFFF00FFFFFF00FFD6
      B600F19E5B00CF846500000000000000000000000000000000006D6D6D00605E
      5E00605E5E00666666000000000000000000000000003A8BB70084C0E400A3D0
      EA00479FD000699AAE00000000000000000000000000E0C0B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A00060483000D0B5A9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFCECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0E0
      E000D0B8B00080605000C7B1A90000000000000000000000000000000000DCAC
      9600E7A45F00FEC56E00FED29200FEE1B600FEE1B600FBCA8D00F8B26500E191
      5500D8A392000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003A8BB7003A8B
      B7003A8BB70000000000000000000000000000000000E0C0B000E0C0B000E0C0
      B000E0C0B000E0C0B000D0C0B000D0B8B000D0B0A000D0B5A900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D0C0B000D0C0B000D0C0B000D0B8B000D0C0B000D0C0
      B000D0C0B000D0C0B00000000000000000000000000000000000000000000000
      000000000000DCAC9600E0A47500E7A45F00E7A45F00DE9C7100DCAC96000000
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
      00000000000000000000A9999600404840005A5755005048400030303000807A
      7200ADB09600108010003587240095A7810000000000A0685000804820008040
      2000803810008038100070301000703010007030100070301000703010007030
      100070301000703010007030100000000000BBA5960063493500634935006349
      3500664D38006349350063493500634935006349350063493500634935006349
      3500634935006349350063493500634935000000000000000000000000009058
      3000000000009058300000000000A0584000B0604000C0684000C0705000D078
      5000B06040009058300090503000000000000000000000000000CCB6AE00CCB6
      AE0080685000C5AEA500A999960060586000A9999600AD9F98003030300095A9
      81000060000058964D008EA977001088100000000000A0685000FFFFFF00FFFF
      FF00D0D0D0002058B0000048B0000048A000004090000038800000388000C0A8
      A000E0C0B000E0B8B0007030100000000000BBA59600D8B7A100C59D8100B28B
      6F00D8B7A100C9A78F00B68D7100D8B7A100C59D8100B28B6F00D8B7A100C59D
      8100B28B6F00D2A98C00BE987B00634935000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D9AFA000E080
      5000E0784000C7917300CDB2A7000000000000000000C7B0A700846556008465
      5600806050008068500000000000B5A5A0008A7D8000676462004038400095A9
      8100108010007CA26D0000000000C5B7AB0000000000A0705000FFFFFF00FFFF
      FF001058B0003078D0005088E0004088E0000048A0002070E0001050A0000030
      7000E0C8C000E0C0B0007030100000000000C0AB9C00FEFEFE00FEFEFE00C29A
      7D00FEFEFE00FEF7F400C29A7D00FBF2EC00FBF2EC00BF967900FAE9DD00FBEA
      E000C29A7D00FAE0CF00D4BDAE00634935000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E0885000E088
      6000000000000000000000000000000000000000000080584000A3837300C5AE
      A50080584000CCB6AE00C5B7AB00998D8900000000007F76730030303000ADB0
      960020902000789E62008EA9770030A0200000000000A0786000FFFFFF00FFFF
      FF002060C00080A8E0006098E0000048A0002070E0000050B0002070E0001050
      A000F0D0C000E0C8C0007030100000000000C0AB9C00FEFEFE00FEFEFE00CFA5
      8700FEFEFE00FDF8F500CFA58700FBF2EC00FBF2EC00CFA58700FAE9DD00FAE9
      DD00CFA58700F9E1D200D4BDAE00634935000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080584000CCB6AE000000
      000000000000000000000000000091868200514F4E004847460058585100C5B7
      AB00A1AD8C00209020001088100095A9810000000000A0806000FFFFFF00FFFF
      FF00B0C0D0001058B0002060B000D0D8E000FFF8F0000050C00000409000C0B8
      C000F0D8D000F0D0C0007030100000000000C0AB9C00D5AF9600C29A7D00B28B
      6F00CFA58700BF967900B28B6F00CFA58700BF9679000940EB000535D3000535
      D300022BB800CFA58700BF96790063493500A070500070301000703010007030
      1000702800000000000070280000602800006020000060200000602000000000
      00000000000000000000000000000000000000000000B3968900000000000000
      000000000000000000000000000000000000B5A5A000A9999600CCB6AE000000
      000000000000C6B9AB00C6B9AB000000000000000000B0807000FFFFFF00FFFF
      FF00F0F8F000D0D0D0006068700050585000606060000048A000B0B8C000F0E8
      E000F0E0E000F0D8D0007030100000000000C8B3A400FEFEFE00FEFEFE00BF96
      7900FEFEFE00FEFEFE00BF967900FDF8F500FEF7F4002759F400FEF7F400FBF2
      EC000535D300FAE6DB00D0C2B50063493500A0786000F0D8D000FFFFFF00F0D0
      B000A06850000000000090604000E0B8A000E0D0C000D0A08000602000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0887000FFFFFF00FFFF
      FF00C0C8C00000000000C0C0C000A0A0A0008088800050585000A098A000FFF0
      F000F0E8E000F0E0E0007030100000000000C8B3A400FEFEFE00FEFEFE00CFA5
      8700FEFEFE00FEFEFE00CFA58700FEFEFE00FDF8F5004F78F600FEFEFE00FEF7
      F4000535D300FBEAE000D0C2B50063493500B0806000F0D0C000FFFFFF00F0D0
      B000A070500000000000A0685000E0C8B000E0D8D000D0988000704020000000
      000000000000000000000000000000000000A99996004040400064585D004D50
      480030383000B6A69F00A4959000A4989000B6A69F00A9979400C5B7AB000000
      00000000000000000000000000000000000000000000B0908000FFFFFF00FFFF
      FF004038400030303000D0D8D000C0C0C000A0A0A0008088800060686000FFF8
      F000FFF0F000F0E8E0007030100000000000C8B3A400D5AF9600C29A7D00B28B
      6F00CFA58700BF967900B28B6F00CFA58700BF9679007193FB004F78F6002759
      F4000940EB00CFA58700C29A7D0063493500C0988000B0807000B0887000A078
      6000A078600070301000A0685000C0988000A080600090685000805840000000
      000000000000000000000000000000000000A999960050585000000000009B90
      890030383000CCB6AE00998D8900B6A69F0000000000A99794009F8E8B000000
      00000000000000000000000000000000000000000000C0988000FFFFFF00FFFF
      FF005050500050485000B0B8B000D0D8D000C0C0C000A0A0A00070787000FFFF
      FF00FFF8F000FFF0F0007030100000000000C8B3A400FEFEFE00FEFEFE00BF96
      7900FEFEFE00FEFEFE00BF967900FEFEFE00FEFEFE00BF967900FEFEFE00FEF7
      F400BF967900FBF2EC00E0D8D200664D380000000000B0908000FFFFFF00F0D0
      B000906040007030100090604000FFF8F000F0C0B00080503000000000000000
      00000000000000000000000000000000000000000000B6A69F00807D76006764
      620040384000000000009B908900B2A09C0000000000B2A09C00998D89000000
      00000000000000000000000000000000000000000000C0A08000FFFFFF00FFFF
      FF008080800060606000606060007070700060586000C0C0C00080888000FFFF
      FF00FFFFFF00FFFFFF008038100000000000C8B3A400FEFEFE00FEFEFE00CFA5
      8700FEFEFE00FEFEFE00CFA58700FEFEFE00FEFEFE00CFA58700FDF8F500FDF8
      F500CFA58700FBF2EC00FBF2EC006349350000000000C0988000FFFFFF00F0D0
      B000B07860008048200090604000FFFFFF00F0C8B00080503000000000000000
      00000000000000000000000000000000000000000000998D890000000000887F
      7C004038400000000000998D8900B2A09C00CCB6AE00998D89009F8E8B000000
      00000000000000000000000000000000000000000000C0A09000FFFFFF00FFFF
      FF00C0C8C0007070700080808000A0A0A0009090900050585000B0B0B000FFFF
      FF00FFFFFF00FFFFFF008038100000000000EAAA8B00EAAA8B00E9A78700E8A4
      8200E7A07D00E6997400E6997400E5936A00E48E6300E4895C00E3835300E27D
      4B00E1794500E0753F00DC723B00CE6B3A0000000000C0A09000C0988000B080
      6000C0908000A0705000B0887000C0988000A078600090685000000000000000
      00000000000000000000000000000000000000000000998D89005F5D5C00574E
      5600645E5D00000000009B908900A4959000B6A69F00A9979400CCB6AE000000
      00000000000000000000000000000000000000000000C0A89000FFFFFF00FFFF
      FF00F0F0F000C0B8C000909090009088900080888000B0B8B000F0F0F000FFFF
      FF00FFFFFF00FFFFFF008040200000000000EAAA8B00FBEAE000FBEAE000FBEA
      E000FAE9DD00FAE9DD00FAE6DB00F8AC8500F8AC8500F6A57B00F6A57B00F6A5
      7B00F6A57B00F6A57B00F59E7100CE6B3A0000000000CDB2A700C0A09000E0D8
      D000C0908000C0908000C0988000F0F0F00090604000C5A79C00000000000000
      0000000000000000000000000000000000000000000000000000B5A5A000A999
      960000000000000000009B908900B6A69F000000000000000000000000000000
      00000000000000000000000000000000000000000000D0A89000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008048200000000000EAAA8B00E9A78700E9A78700E7A0
      7D00E6997400E6997400E5936A00E48E6300DA845A00DA845A00D5774A00D577
      4A00D5774A00CE6B3A00CE6B3A00CE6B3A000000000000000000D0A89000FFFF
      FF00D0A8900000000000D0A89000FFFFFF009058400000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000998D8900B2A09C000000000000000000000000000000
      00000000000000000000000000000000000000000000D0A89000D0A89000C0A8
      9000C0A09000C0A08000C0988000B0908000B0887000B0807000A0806000A078
      6000A0705000A0685000A068500000000000A3A3A100FEFEFE008B8B8800FEFE
      FE008B8B8800FEFEFE008B8B8800FEFEFE008B8B8800FEFEFE006E726F00FEFE
      FE0063636300FEFEFE0061615500D0D5D1000000000000000000C0988000B090
      7000B088700000000000C0988000B0907000B088700000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B6A69F00A1918F00BDABA5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE001F251E00E1E1E0001F25
      1E00E1E1E0001F251E00E8E7E6001F251E00D0D5D1001F251E00D0D5D1001F25
      1E00ECECEC001F251E00E1E1E000A3A3A1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C59D
      890098644000663F3700AD897B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080685000203040002030400020304000203040002030
      4000203040002030400020304000203040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D084
      6200B0604000905030005F48320000000000C59D8900663F3700663F2800AD89
      7B00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0704000B0583000B0583000A0502000A05020009048
      2000904820009040200080402000000000000000000060809000506070004050
      6000304050002030400090706000F0E0D000B0A09000B0A09000B0A09000B0A0
      9000B0A09000B0A09000B0A0900020304000A9846F00A0786000906040009058
      40009058400084472800000000000000000000000000B283650098725C00A070
      500090584000905030007538190000000000000000000000000000000000E080
      500000000000C59D89008050300000000000C3846200B0604000604030003929
      2800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0785000FFF8F000D0B0A000D0B0A000D0B0A000C0B0
      A000C0A8A000C0A8900090402000000000007080900020B8F0000090D0000090
      D0000090D0000090D00090786000F0E8E000F0D8D000E0D0C000E0C8C000D0C0
      B000D0B8B000D0B8B000B0A0900020304000B0908000FFFFFF00E0C8C000D0A0
      9000C080600080402000000000000000000000000000B2836500F0E8E000E0C8
      C000D0A89000B07850008048200000000000000000000000000000000000E088
      500000000000CBAD9F0090503000CDB6AD00D078500000000000B59082007040
      3000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D0886000FFFFFF00E0906000D0805000D0805000D080
      5000D0805000C0A8A00090482000000000007088900070C8F00010B8F00010B0
      F00000A8E0000098D000A0807000F0F0F000C0B0A000C0B0A000C0A8A000B0A0
      9000D0C0B000B0A09000B0A0900020304000B0908000FFF8FF00E0C8C000D0A0
      9000C080600080402000000000000000000000000000B0806000F0E8E000F0E0
      E000E0C0B000C08870008048300000000000000000000000000000000000DB98
      6F00E0885000B068400090503000A4715900D078500000000000C59D89009050
      300000000000000000000000000000000000B0A0900060483000604830006048
      30006048300060483000D0907000FFFFFF00FFFFFF00FFF0F000F0E0D000F0D0
      C000F0C0B000C0B0A00090482000000000008088900070D0F00030C0F00010B8
      F00000A8F00000A0E000A0888000FFFFFF00F0F0F000F0E8E000F0D8D000E0D0
      C00070585000605040005048400040404000B0908000FFF8FF00E0C8C000D0A0
      9000C080600080402000000000000000000000000000B0806000F0E8E000F0E0
      E000E0C0B000C08870008048300000000000000000000000000000000000D7B3
      A500EE926500DF835600A25D4600985D4000C1744600D0785000C0684000B588
      730000000000000000000000000000000000B0A09000FFF0F000F0E0D000E0D8
      D000E0D0C000E0C8C000E0A08000FFFFFF00F0A88000E0987000E0906000D080
      5000D0805000D0B0A000A0482000000000008090A00080D8F00040C8F00030C0
      F00010B8F00000A0E000B0908000FFFFFF00C0A8A000C0B0A000C0A8A000F0E0
      D00080605000D0C8C0006050400000000000C0988000FFFFFF00F0E8E000E0C8
      C000D0A0800080402000000000000000000000000000B2836500F0E8E000F0E0
      E000E0C0B000C088700080483000000000000000000000000000000000000000
      0000D7B3A500E6987A00E0805000D08D6F00D0785000D0785000D0917600CCA2
      900000000000000000000000000000000000B0A09000FFF8F000E0B08000E0A0
      7000E0A07000D0987000E0A89000FFFFFF00FFFFFF00FFFFFF00FFF8F000F0E8
      E000F0D0C000D0B0A000A0502000000000008098A00090E0F00060D8F00050C8
      F00030C0F00010B0F000B0989000FFFFFF00FFFFFF00FFFFFF00F0F0F000F0E8
      E00080685000806050000000000000000000C1A19200B0887000A06850009050
      300080483000804820008038100089482400B0887000A0685000905830009048
      3000804020007038100090583000000000000000000000000000000000000000
      00000000000000000000847465007060500080685000B3998F00000000000000
      000000000000000000000000000000000000C0A89000FFFFFF00FFF8F000F0F0
      F000F0E8E000F0E0D000E0B8A000FFFFFF00FFB09000FFB09000F0D8D000E090
      6000B0583000B0583000A0502000000000008098A000A0E8F00080E0F00070D8
      F00050D0F00010B0F000B0A09000B0989000B0908000A0888000A08070009070
      600090706000000000000000000000000000C8AEA200B0887000FFFFFF00E0D0
      C000D0A09000A070500080401000C1A19200B0907000E0D8D000F0D8D000D0A0
      9000B078500080382000C1A19200000000000000000000000000000000000000
      000000000000C5B1AC00908070008474650070605000786C6400000000000000
      000000000000000000000000000000000000C0A8A000FFFFFF00FFC8A000F0B8
      9000E0B08000E0A07000F0C0A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F098
      7000F0C8B000B0583000C9A394000000000090A0A000B0F0FF00A0E8FF0090E0
      F00070D0F00010A0D00010A0D00010A0D0001098D0000090D0000090D0000090
      D0003038400000000000000000000000000000000000C0908000F0F0F000FFF8
      F000F0D8C000B2836500804820008F502E00B0907000FFFFFF00FFF8F000F0D0
      C000B07850008048200000000000000000000000000000000000000000000000
      000000000000C5AEA600A0989000ACA199009080700066565600000000000000
      000000000000000000000000000000000000C0B0A000FFFFFF00FFFFFF00FFFF
      FF00FFF0F000F0E8E000F0C8B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0A8
      8000C0683000C9A39400000000000000000090A0B000B0F0FF00A0F0FF006080
      9000607080005070800050687000506870005060700040587000207090000090
      D0004048600000000000000000000000000000000000CFB9B100C0988000B283
      6500A06850008F502E009058400098644000B0786000B0887000A07050008048
      300080482000CFB9B10000000000000000000000000000000000000000000000
      000000000000C0B0B000A0909000D0C6C300D0C8C00070605000B9A7A1000000
      000000000000000000000000000000000000D0B8B000FFFFFF00FFD8C000FFD0
      B000F0D8D000B0A09000F0C8B000F0C0B000F0C0B000F0B8A000F0B09000F0B0
      9000D0B0A00000000000000000000000000090A8B000B0F0FF00B0F0FF006088
      900090C8D00090E8F00080D8E00060C8E0005098B000405860002080A0000090
      D000505870000000000000000000000000000000000000000000C0988000FFF8
      FF00E0C0B000C09070008048200000000000C0988000FFFFFF00E0C0B000D0A0
      8000804820000000000000000000000000000000000000000000000000000000
      000000000000B3998F00BCAA9E00D4C1BA00EEE5DD0084746500B9A7A1000000
      000000000000000000000000000000000000D0C0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0A89000D0C8C00090706000BCA69C0000000000000000000000
      00000000000000000000000000000000000090A8B000B0F0F000B0F0FF00A0F0
      F0007098A000A0F0F00067777C0080C8D000507080003060800060C0F00020B8
      F000506070000000000000000000000000000000000000000000C4A79900B090
      8000A0685000905030008048300000000000C1A19200B0908000A06850009050
      3000804830000000000000000000000000000000000000000000000000000000
      000000000000A0989000CDB6AD0000000000E8DAD300C0B0B000B3998F000000
      000000000000000000000000000000000000E0C0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0B0A000A0806000BCA69C000000000000000000000000000000
      0000000000000000000000000000000000000000000090A8B00090A8B00090A8
      B0006090A000A0E8F000A0E8F00090D8E0004068700070889000808890007088
      900000000000000000000000000000000000000000000000000000000000A477
      6400FFF8F0007B412400000000000000000000000000A0786000FFF8F0007B41
      2400000000000000000000000000000000000000000000000000000000000000
      000000000000B4AAA2000000000000000000DAC9C300DFDDDD00A49890000000
      000000000000000000000000000000000000E0C0B000E0C0B000D0C0B000D0C0
      B000D0B8B000D0B0A000C7B1AA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080B0C00080B0C00080A0B0000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C1A1
      9200B088700098644000000000000000000000000000C4A79900B08870009864
      4000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000080A8C000507080004070
      9000306880003068800030608000305870003058700030587000305870003050
      6000305060003048600000000000000000000000000000000000000000000000
      000000000000CBA9A100C7A5A100BE959000744224008A4E2C00D2A895000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DBA99600DBA996000000000000000000000000000000
      0000000000000000000000000000000000000000000080A8C000D0FFFF00A0E8
      FF0080E0F00080D8F00070D0F00070D0F00070C8F00070C8F00070C8F00060C8
      F00060C0F0003050600000000000000000000000000000000000D5B5AA00B98A
      8200C18D8100DFB2A100FCF4EE00AC7872005E351D0064391F00744224000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDAC9500D09A7A00CFB7AD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CDB5AC00DD846200EE8B5600D5AB9C000000000000000000000000000000
      0000000000000000000000000000000000000000000080A8C000C0E8F000B0F8
      FF0090F0FF0090F0FF0090F0FF0090F0FF0090F0FF0090F0FF0090F0FF0080E0
      FF0060B8E00030506000000000000000000000000000C7A5A100CE968300EEB8
      9D00F7C8AE00F6CEB800FEF6F100AC7872001D769D001F7FAA001F7FAA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D5AB9C00F0885000D0785000C79D
      8B00000000000000000000000000000000000000000000000000000000000000
      0000D07C5600F0885000D1A18900D5B7AB000000000000000000000000000000
      0000000000000000000000000000000000000000000080B0C00080B8D00090E0
      F00090F8FF0090F0FF0080E8FF0070E0FF0080E8FF0080E8FF0090F0FF0070D8
      F0004088B00040586000000000000000000000000000C7A5A100F7BB9900F8C0
      A200F7C8AE00F6CEB800FEF6F100AC7872005DB6D5005EC3E400189DC9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D5B7AB00D1A18900F0885000D078
      500000000000000000000000000000000000000000000000000000000000D1A1
      8900F0885000C377550000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000090B0C000B0E8F00060B8
      D00080E8FF0070E0F00050B0E00030A0D0003090C00070D0F00070D8F0004098
      C00060C0E00040587000000000000000000000000000C7A5A100F8BB9900F7C0
      A200F7C8AE00F6CEB800FEF6F100AC78720069BBD60073CBE70046B1D400E0AD
      8E00E7681C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C3775500F088
      5000D1A18900000000000000000000000000000000000000000000000000F090
      6000E0784000C19F9000000000000000000000000000D3BDB500000000000000
      0000000000000000000000000000000000000000000090B8D000D0FFFF00CDB2
      A70090503000BD9D8B0080D8F00080E8FF0080E8F00040A0C00050C0E00080E0
      F00070C8F00040607000000000000000000000000000C7A5A100F8BB9900C18D
      8100B3807800F6CEB800FEF6F100AC78720087C7DB00A1DDEF00AFB0A400E55C
      0A00E55701000000000000000000000000000000000000000000000000000000
      00000000000000000000D3BDB500000000000000000000000000C19F9000E078
      4000F09060000000000000000000000000000000000000000000DBA99600EE8B
      5600B0583000CDB5AC000000000000000000D0704000C0684000B0603000A058
      3000905030009048200000000000000000000000000090C0D000D0FFFF00C791
      730090583000985D4000A0F8FF0090F0FF0090F0FF0090E8FF0050A8D00080E0
      F00070D0F00040607000000000000000000000000000C7A5A100F7BB9900AC78
      7200FFFFFF00F6CEB800FEF6F100AC787200A3D4E200D4C4B200E5570100E557
      0100E5570100E5570100E5570100E55701000000000000000000E0784000D070
      4000C0684000B0603000B0583000905030000000000000000000CDB1A500C068
      4000F0885000DDAC950000000000000000000000000000000000E6AE9000EE83
      560098564000000000000000000000000000D7BCAE00F0B89000F0987000F080
      5000E07030009050300000000000000000000000000090C0D000C0F8FF00E078
      4000B060400090503000C5A99C00A0F8FF00A0F8FF00B0A09000604830006048
      30006048300060483000604830006048300000000000C7A5A100F7BB9900D29C
      8A00AC787200F6CEB800FEF6F100AC787200BBDFE900E5570100E5570100E557
      0100E5570100E5570100E5570100E55701000000000000000000E0805000E070
      3000F0805000F0987000E0906000D9B5A800000000000000000000000000C068
      4000DF835600E6AE900000000000000000000000000000000000E8AD8D00DF7C
      4600A0644500000000000000000000000000C9A59400A46C5900F0A07000F090
      6000F0805000A058300000000000000000000000000090C8D000E0886000E080
      5000D0785000A0584000A0705000E0FFFF00E0FFFF00B0A09000FFFFFF00B0A0
      9000B0A09000B0A09000B0A090006048300000000000C7A5A100F8BB9900F7C0
      A200F7C8AE00F6CEB800FEF6F100AC787200BFE0E900E4B29100E55C0A00E558
      0200E5570100E5570100E5570100E55701000000000000000000E0906000F080
      5000F0906000F0A07000A46C5900C9A59400000000000000000000000000C068
      4000DF7C4600E8AD8D0000000000000000000000000000000000E8AD8D00DF7C
      460098563200CDB5AC0000000000C3947B00A0583000A0503000EC8E5C00F0A0
      7000F0987000B060300000000000000000000000000090C8D000E0885000D9AF
      A000C0705000CBAE9F00B671550090B8D00090B8C000D0B0A000FFFFFF00FFFF
      FF00FFF8F000F0F0F000B0A090006048300000000000C7A5A100F8BB9900F7C0
      A200F7C8AE00F6CEB800FEF6F100AC787200B7DBE400D7F1F700CAAD9400E55C
      0A00E5570100DFCABC00D9BDAC00DEC5B6000000000000000000E0987000F098
      7000F0A07000EE926500B0604000B0604000C3947B0000000000CFB7AD00A25D
      3700DF7C4600E8AD8D0000000000000000000000000000000000ECBFA200F088
      5000A0583000B4794E00B8765100B2653700B0603000F0906000EC9C6A00DDB2
      9B00ECBFA200C0684000D3BDB500000000000000000000000000000000000000
      0000C070500000000000000000000000000000000000D0B8A000FFFFFF00FFFF
      FF00FFFFFF00B0A09000B0A090006048300000000000C7A5A100F7BB9900F7C0
      A200F7C8AE00F6CEB800FEF6F100AC787200B2D7E100C5EAF40083CBE200E4A6
      8000E55802000000000000000000000000000000000000000000F0A88000E9BF
      A400E1B29A00F0B09000E0906000C0704000C0684000B8765100B4794E00A060
      4000F0885000E9BFA40000000000000000000000000000000000EDBFB000ECBF
      A200E0784000B2653700B0684000C1744600EE926500EEA17400DBB3A0000000
      0000D3BDB500D07040000000000000000000000000000000000000000000C070
      5000C070500000000000000000000000000000000000D2BDB600FFFFFF00FFFF
      FF00B0A0900060483000604830006048300000000000C7A5A100C7908100EAB3
      9A00F7C8AE00F6CEB800FEF6F100AC787200B8D9E200C5EAF4002CA5CE00C9A0
      8600000000000000000000000000000000000000000000000000F0A89000D3BD
      B50000000000E1B29A00F0B09000EE926500D0704000B0684000B0603000DF7C
      4600E9BFA400EDBFB00000000000000000000000000000000000D3BDB500EDBF
      B000ECB8A100E8AD8D00ECAA8600ECAA8600EEA18300DBB3A000000000000000
      000000000000000000000000000000000000000000000000000000000000C070
      5000C070500000000000C0705000C070500000000000D0C0B000FFFFFF00FFFF
      FF00C0A89000D0C8C00060483000D0B5A900000000000000000000000000B98A
      8200C18D8100E5BAA700FEF6F100AC7872000A8FBB000A97C6000A97C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E8B39900F0B09000ECB19400ECAA8600E8AD8D00E9BF
      A400EDBFB000000000000000000000000000000000000000000000000000D3BD
      B500E2BEB200ECBFA200ECBFA200DBB3A000D3BDB50000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C070
      5000C0705000C0705000C0705000C070500000000000E0C0B000FFFFFF00FFFF
      FF00C0A8A00060483000D0B5A900000000000000000000000000000000000000
      000000000000B98A8200BE959000BE959000C9977D00C9977D00CC997F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DDBBA700E8B39900E9BFA400E9BFA400E2BE
      B200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0705000C0705000000000000000000000000000E0C0B000E0C0B000D2BD
      B600D0B0A000D0B5A90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009048
      200000000000F6F4F5000000000000000000000000000000000000000000C0A8
      9000705840007050400060483000604830006048300060483000604830006048
      3000604830006048300060483000604830000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A050
      2000A0503000000000000000000000000000000000000000000000000000C0A8
      9000FFF8F000F0E8E000E0D0D000E0D8D000E0D0C000E0D0C000E0C8C000E0B0
      9000E0C8B000E0C8B000E0C8B000604830000000000000000000C0686000B058
      5000A0505000A0505000A0505000904850009048400090484000804040008038
      4000803840007038400070383000000000000000000080A8C000507080004070
      9000306880003068800030608000305870003058700030587000305870003050
      6000305060003048600000000000000000000000000000000000000000000000
      0000000000000000000000000000D080600090482000A0482000A0502000B058
      3000C0684000A0503000000000000000000000000000C0686000B0585000C0A8
      A000FFFFFF00C0806000FFF8F000FFF8F000FFF0F000FFF0F000FFF0E000C068
      4000F0E0D000FFE8E000E0C8B0006048300000000000D0687000F0909000E080
      8000B048200040302000C0B8B000C0B8B000D0C0C000D0C8C00050505000A040
      3000A0403000A038300070384000000000000000000080A8C000D0FFFF00A0E8
      FF0080E0F00080D8F00070D0F00070D0F00070C8F00070C8F00070C8F00060C8
      F00060C0F000305060000000000000000000C0908000C0908000C0908000C088
      8000C0888000B0888000C0A0A000D0886000FFB09000F0906000F0885000E080
      5000D0785000C0704000A058300000000000D0687000F0909000E0808000C0A8
      A000FFFFFF00B0604000E0B0A000FFF8F000FFF8F000FFF0F000FFF0F000C068
      4000D0785000F0E0D000E0C8B0006048300000000000D0707000FF98A000F088
      8000E0808000705850004040300090787000F0E0E000F0E8E00090807000A040
      3000A0404000A040300080384000000000000000000080A8C000C0E8F000B0F8
      FF0090F0FF0090F0FF0090F0FF0090F0FF0090F0FF0090F0FF0090F0FF0080E0
      FF0060B8E000305060000000000000000000C0909000F0D8C000FFF8D000FFF0
      C000FFE8B000FFD8A000FFE0B000E0907000FFB89000FFA88000FF906000F090
      6000E0885000E0785000C0704000B0583000D0707000FF98A000F0888000C0B0
      A000FFFFFF00E0B8A000E0806000E0805000E0785000D0704000D0683000E068
      2000F0906000C0704000E0C0B0006048300000000000D0787000FFA0A000F090
      9000F0888000705850000000000040403000F0D8D000F0E0D00080786000B048
      4000B0484000A040400080404000000000000000000080B0C00080B8D00090E0
      F00090F8FF0090F0FF0080E8FF0070E0FF0080E8FF0080E8FF0090F0FF0070D8
      F0004088B000405860000000000000000000C0989000D0908000FFF0E000FFF8
      F000FFF8E000FFF8D000FFF0D000E0987000FFC0A000FFC0A000FFB08000FFA8
      8000FFA07000E0805000B058300000000000D0787000FFA0A000F0909000C0B0
      A000FFFFFF00F0E0D000E0B8A000E0A89000E0A08000F0987000F0906000FFB0
      8000FFB09000E0A07000D08050006048300000000000D0788000FFA8B000FFA0
      A000F0909000705850007058500070585000705850007060500080686000C058
      5000B0505000B048400080404000000000000000000090B0C000B0E8F00060B8
      D00080E8FF0070E0F00050B0E00030A0D0003090C00070D0F00070D8F0004098
      C00060C0E000405870000000000000000000D0989000FFE8B000D0908000F0F0
      E000FFF8F000FFF8E000FFF8E000F0A07000E0987000E0907000D0886000E090
      7000F0987000B05830000000000000000000D0788000FFA8B000FFA0A000D0B0
      A000FFFFFF00FFFFFF00F0E0D000F0D8D000E0C0B000E0A89000D0907000E090
      6000F0A88000D0806000E0B8A0006048300000000000E0808000FFB0B000FFB0
      B000FFA0A000F0909000F0888000E0808000E0788000D0707000D0687000C060
      6000C0585000B050500090484000000000000000000090B8D000D0FFFF00A0E8
      F00070C8F00050B0E00080D8F00080E8FF0080E8F00040A0C00050C0E00080E0
      F00070C8F000406070000000000000000000D0A09000FFF8E000F0D8B000C0A0
      A000F0F0E000FFF0E000FFF0E000F0F0E000F0E8E000F0E6E200FFF0E000E090
      7000C0785000000000000000000000000000E0808000FFB0B000FFB0B000D0B8
      A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF0F000FFF8F000E090
      6000D0907000FFF0E000F0D8D0006048300000000000E0889000FFB8C000FFB8
      B000D0606000C0605000C0585000C0504000B0503000B0483000A0402000A038
      1000C0606000C058500090484000000000000000000090C0D000D0FFFF0090E8
      F00060B8E00080E0F000A0F8FF0090F0FF0090F0FF0090E8FF0050A8D00080E0
      F00070D0F000406070000000000000000000D0A8A000F0E8C000D0989000A0F8
      FF00C0A09000C0909000C0888000B0909000B0909000C0A8B000E0C0C000F0A0
      7000D0B0A000000000000000000000000000E0889000FFB8C000FFB8B000D0B8
      A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D090
      7000FFFFFF00FFFFFF00FFF0F0006050400000000000E0909000FFC0C000D068
      6000FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000E0D0C000E0C8
      C000A0381000C060600090485000000000000000000090C0D000C0F8FF0060C0
      E00090E0F000A0F8FF00A0F8FF00A0F8FF00A0F8FF00B0A09000604830006048
      300060483000604830006048300060483000D0A8A000D0B0A000C0FFFF00C0FF
      FF00B0F8FF00B0F8FF00A0F0FF0090E8FF0080E0FF0080D8FF00A0E0FF00D0C0
      B000C0A8B000000000000000000000000000E0909000FFC0C000D0686000D0B8
      A000D0B8A000D0B8A000C0B0A000C0B0A000C0B0A000C0A8A000C0A8A000C0A8
      A000C0A89000C0A89000C0A89000C0A8900000000000E098A000FFC0C000D070
      7000FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000E0D0
      C000A0402000D0686000A0505000000000000000000090C8D000A0E0F000C070
      5000E0FFFF00E0FFFF00E0FFFF00E0FFFF00E0FFFF00B0A09000FFFFFF00B0A0
      9000B0A09000B0A09000B0A0900060483000D0A8A000A0E8FF00A0E8FF00A0E8
      FF00A0E8FF0090E0FF0080D8FF0080D8F00070D0F00070C8F00060C8F00070C8
      F000B47F8600000000000000000000000000E098A000FFC0C000D0707000FFFF
      FF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000E0D0C000A040
      2000D0686000A0505000000000000000000000000000F0A0A000FFC0C000E078
      7000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8
      D000B0483000D0707000A0505000000000000000000090C8D000C070500090C8
      D00090C8D00090C0D00090C0D00090B8D00090B8C000D0B0A000FFFFFF00FFFF
      FF00FFF8F000F0F0F000B0A090006048300000000000C6A39C00E0FFFF00E0FF
      FF00F0FFFF00F0FFFF00E0FFFF00C0FFFF00A0E8FF0080E8FF0080E0FF00B088
      800000000000000000000000000000000000F0A0A000FFC0C000E0787000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000B048
      3000D0707000A0505000000000000000000000000000F0A8A000FFC0C000E080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8
      E000B0503000E0788000A05050000000000000000000C0705000000000000000
      0000B6715500A0705000C5A99C000000000000000000D0B8A000FFFFFF00FFFF
      FF00FFFFFF00B0A09000B0A09000604830000000000000000000CAA2A200F0FF
      FF00F0FFFF00F9F7F800F0FFFF00D0FFFF00B0F8FF0090E8FF00B47F86000000
      000000000000000000000000000000000000F0A8A000FFC0C000E0808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000B050
      3000E0788000A0505000000000000000000000000000F0B0B000FFC0C000F088
      9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0
      F000C050400060303000B05850000000000000000000C0705000000000000000
      000000000000A058400090503000985D4000BD9D8B00D2BDB600FFFFFF00FFFF
      FF00B0A09000604830006048300060483000000000000000000000000000CAA2
      A200F0FFFF00F0FFFF00F0FFFF00E0FFFF00B0F8FF00B47F8600000000000000
      000000000000000000000000000000000000F0B0B000FFC0C000F0889000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000C050
      400060303000B0585000000000000000000000000000F0B0B000FFC0C000FF90
      9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8
      F000C0585000B0586000B0586000000000000000000000000000C0705000C070
      5000C0705000D0785000B06040009058300090503000D0C0B000FFFFFF00FFFF
      FF00C0A89000D0C8C00060483000D0B5A9000000000000000000000000000000
      0000C6A39C00C0A0A000C0A0A000C0989000C098900000000000000000000000
      000000000000000000000000000000000000F0B0B000FFC0C000FF909000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000C058
      5000B0586000B0586000000000000000000000000000F0B8B000F0B8B000F0B0
      B000F0B0B000F0A8B000F0A0A000E098A000E0909000E0909000E0889000E080
      8000D0788000D0787000D0707000000000000000000000000000000000000000
      000000000000E0805000E0784000C7917300CDB2A700E0C0B000FFFFFF00FFFF
      FF00C0A8A00060483000D0B5A900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0B8B000F0B8B000F0B0B000F0B0
      B000F0A8B000F0A0A000E098A000E0909000E0909000E0889000E0808000D078
      8000D0787000D070700000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E0885000E0886000000000000000000000000000E0C0B000E0C0B000D2BD
      B600D0B0A000D0B5A9000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF00C003FFFFFC7F00008001FFC3FC3F0000
      8001FF81F01F00008001FF01E01F00008001E001E00F00008001C003E3870000
      80018007F7C300008001000FCE2100008001000FCE2300008001000FCF000000
      8001000F002000008001000FE70300008001000F418700008001801F38870000
      C003C03F00CF0000FE7FE07FE7FF0000F81FFFFFFFF1FFFFE007807F8000C007
      C003000080008003800100008000000180010000800100010000800080030001
      0000C0038007000100008003800700010000000180078001000000018007C001
      00000001800FE00180010001800FE00380018101800FF003C003C383801FF801
      E007FFC7803FFC03F81FFFFFFFFFFFFFFFC7FFFFFFFFFFFFFFC1FC0080010000
      EA01C00080010000FFC1820280010000FFCF808080010000FFFF9E0080010000
      041FBF1980010000041FFFFF80010000041F001F80010000001F209F80010000
      803F849F80010000803FA41F80010000803F841F80010000803FCCFF80010000
      C47FFCFF80010000C47FF8FFFFFF0000FFFFFFFFFFFFFFFFE1FFFFFFFC00FFFF
      E10FFC0180000381E90FFC0100000381E84FFC0100000381E04F000100000381
      E00F000100010381F00F000100030001FC3F000100070001F83F000100078003
      F83F000300078003F81F00070007C107F81F007F0007C107F91F00FF800FE38F
      FB1F01FFF8FFE38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8003F81FFFFFFCFF
      8003C01FFF1FF0FF8003801FFF0FF0FF8003801FFF0FE3FF80038007FFC7E3BF
      80038007FDC7C30380038000C0C3C70380008000C0E3C70380008000C0E3C203
      80008000C043C001F7808007C003C013E780800FC803C03FE480E01FFC07E07F
      E081F81FFE0FFFFFF383FFFFFFFFFFFFFFEBE000FFFFFFFFFFE7E000C0018003
      FE03800080018003000100008001800300000000820180030001000080018003
      0003000080018003000700008001800300070000800180000007000080018000
      0007000380018000800F00038001B180C01F00038001B800E03F00038001C000
      F07F00038001F801FFFF0003FFFFF38300000000000000000000000000000000
      000000000000}
  end
  object dmWriteSMS: TdxDockingManager
    Color = clBtnFace
    DefaultHorizContainerSiteProperties.Dockable = True
    DefaultHorizContainerSiteProperties.ImageIndex = -1
    DefaultVertContainerSiteProperties.Dockable = True
    DefaultVertContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.Dockable = True
    DefaultTabContainerSiteProperties.ImageIndex = -1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ViewStyle = vsOffice11
    Left = 400
    Top = 536
  end
end
