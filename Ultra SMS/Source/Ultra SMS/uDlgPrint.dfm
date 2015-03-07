object dlgPrint: TdlgPrint
  Left = 205
  Top = 79
  Caption = #25171#21360#39044#35272
  ClientHeight = 613
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001000800680500001600000028000000100000002000
    0000010008000000000000010000000000000000000000010000000100000000
    0000000080000080000000808000800000008000800080800000C0C0C000C0DC
    C000F0CAA60000003E0000005D0000007C0000009B000000BA000000D9000000
    F0002424FF004848FF006C6CFF009090FF00B4B4FF0000143E00001E5D000028
    7C0000329B00003CBA000046D9000055F000246DFF004885FF006C9DFF0090B5
    FF00B4CDFF00002A3E00003F5D0000547C0000699B00007EBA000093D90000AA
    F00024B6FF0048C2FF006CCEFF0090DAFF00B4E6FF00003E3E00005D5D00007C
    7C00009B9B0000BABA0000D9D90000F0F00024FFFF0048FFFF006CFFFF0090FF
    FF00B4FFFF00003E2A00005D3F00007C5400009B690000BA7E0000D9930000F0
    AA0024FFB60048FFC2006CFFCE0090FFDA00B4FFE600003E1400005D1E00007C
    2800009B320000BA3C0000D9460000F0550024FF6D0048FF85006CFF9D0090FF
    B500B4FFCD00003E0000005D0000007C0000009B000000BA000000D9000000F0
    000024FF240048FF48006CFF6C0090FF9000B4FFB400143E00001E5D0000287C
    0000329B00003CBA000046D9000055F000006DFF240085FF48009DFF6C00B5FF
    9000CDFFB4002A3E00003F5D0000547C0000699B00007EBA000093D90000AAF0
    0000B6FF2400C2FF4800CEFF6C00DAFF9000E6FFB4003E3E00005D5D00007C7C
    00009B9B0000BABA0000D9D90000F0F00000FFFF2400FFFF4800FFFF6C00FFFF
    9000FFFFB4003E2A00005D3F00007C5400009B690000BA7E0000D9930000F0AA
    0000FFB62400FFC24800FFCE6C00FFDA9000FFE6B4003E1400005D1E00007C28
    00009B320000BA3C0000D9460000F0550000FF6D2400FF854800FF9D6C00FFB5
    9000FFCDB4003E0000005D0000007C0000009B000000BA000000D9000000F000
    0000FF242400FF484800FF6C6C00FF909000FFB4B4003E0014005D001E007C00
    28009B003200BA003C00D9004600F0005500FF246D00FF488500FF6C9D00FF90
    B500FFB4CD003E002A005D003F007C0054009B006900BA007E00D9009300F000
    AA00FF24B600FF48C200FF6CCE00FF90DA00FFB4E6003E003E005D005D007C00
    7C009B009B00BA00BA00D900D900F000F000FF24FF00FF48FF00FF6CFF00FF90
    FF00FFB4FF002A003E003F005D0054007C0069009B007E00BA009300D900AA00
    F000B624FF00C248FF00CE6CFF00DA90FF00E6B4FF0014003E001E005D002800
    7C0032009B003C00BA004600D9005500F0006D24FF008548FF009D6CFF00B590
    FF00CDB4FF0006060600121212001F1F1F002C2C2C0039393900454545005252
    52005F5F5F006C6C6C007878780085858500929292009F9F9F00ABABAB00B8B8
    B800C5C5C500D2D2D200DEDEDE00EBEBEB00F8F8F800F0FBFF00A4A0A0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000E50000F7E7E7E7E7E7E7E7E7E7E7E7E826E700F7FF
    07EFF7F7F7F7F7F7EC24261E2AEAF7FFFFF5F4F3F1EDEAE9E8251E2BED00F7FF
    FFF5F5F2EDEF07EFEBE8EDED0000F7FFFFFFF5EFF0F4F49909EBEC000000EFFF
    EAF3FFEDF4F5F5F4F2EFE9000000EFFFEFE607EEF4FFF5F5F409EA000000EFFF
    FFEDE5ED07FFFFF5F4F7ED000000EFFFF307E6E6ED07F4F4EFEA00000000F0FF
    EAE5E5E7EAEEEEEDEDE800000000F0FFF4E6E5E9F2F5F5F4F7E70000000007FF
    FF07E6E5E7F2F5F5EFE70000000007FFFFFFEFE7E5E7F4F507E70000000009FF
    FFFFFFFFFFFFFFFFF5E70000000009090909090907F0EFEFEFEF00000000FFFB
    0000000100000000000000010000000300000007000000070000000700000007
    0000000F0000000F0000000F0000000F0000000F0000000F0000000F0000}
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = seppPreviewScaleChange
  PixelsPerInch = 96
  TextHeight = 13
  object seppPreview: TSynEditPrintPreview
    Left = 0
    Top = 97
    Width = 862
    Height = 494
    SynEditPrint = sepPrint
    OnPreviewPage = seppPreviewPreviewPage
    OnScaleChange = seppPreviewScaleChange
  end
  object txtPrint: TSynEditor
    Left = 360
    Top = 200
    Width = 345
    Height = 273
    CodeFolding.CaseSensitive = False
    CodeFolding.FolderBarLinesColor = 12562872
    ActiveLine.Background = clYellow
    ActiveLine.Foreground = clNavy
    ActiveLine.Visible = True
    LineDivider.Visible = False
    LineDivider.Color = clRed
    LineDivider.Style = psSolid
    RightEdge.MouseMove = False
    RightEdge.Visible = True
    RightEdge.Position = 80
    RightEdge.Color = clSilver
    RightEdge.Style = psSolid
    LineSpacing = 0
    LineSpacingRule = lsOneAndHalf
    Background.Visible = False
    Background.RepeatMode = brmNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    TabOrder = 0
    Visible = False
    Gutter.ShowLineModified = False
    Gutter.LineModifiedColor = clYellow
    Gutter.LineNormalColor = clLime
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.LeftOffsetColor = clNone
    Gutter.RightOffsetColor = clNone
    WordWrap.Enabled = False
    WordWrap.Position = 80
    WordWrap.Style = wwsClientWidth
    DocumentState = smsNormal
    DocumentFormat = sffDos
  end
  object stbPrint: TdxStatusBar
    Left = 0
    Top = 591
    Width = 862
    Height = 22
    Images = iltStatusBar
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 0
        Fixed = False
        Text = '{'#25171#21360#26426'}'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 1
        MinWidth = 0
        Text = '{'#32440#24352#22823#23567'}'
        Visible = False
        Width = 0
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 2
        Text = '{'#24403#21069#20301#32622'}'
        Width = 75
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 3
        Text = '{'#32553#25918#22823#23567'}'
        Width = 120
      end>
    PaintStyle = stpsOffice11
    ParentFont = True
  end
  object sepPrint: TSynEditPrint
    Copies = 1
    Header.DefaultFont.Charset = DEFAULT_CHARSET
    Header.DefaultFont.Color = clBlack
    Header.DefaultFont.Height = -12
    Header.DefaultFont.Name = #40657#20307
    Header.DefaultFont.Style = []
    Footer.DefaultFont.Charset = DEFAULT_CHARSET
    Footer.DefaultFont.Color = clBlack
    Footer.DefaultFont.Height = -12
    Footer.DefaultFont.Name = #40657#20307
    Footer.DefaultFont.Style = []
    Margins.Left = 25.000000000000000000
    Margins.Right = 15.000000000000000000
    Margins.Top = 25.000000000000000000
    Margins.Bottom = 25.000000000000000000
    Margins.Header = 15.000000000000000000
    Margins.Footer = 15.000000000000000000
    Margins.LeftHFTextIndent = 2.000000000000000000
    Margins.RightHFTextIndent = 2.000000000000000000
    Margins.HFInternalMargin = 0.500000000000000000
    Margins.MirrorMargins = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    Highlight = False
    TabWidth = 8
    Color = clWindow
    Left = 104
    Top = 272
  end
  object dxbmPrint: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = iltMenu
    ImageOptions.LargeImages = iltLarge
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 136
    Top = 272
    DockControlHeights = (
      0
      0
      97
      0)
    object dxbmPrintBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      Caption = #33756#21333#26639
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
          ItemName = 'mnuFile'
        end
        item
          Visible = True
          ItemName = 'mnuView'
        end
        item
          Visible = True
          ItemName = 'mnuPage'
        end
        item
          Visible = True
          ItemName = 'mnuZoom'
        end
        item
          Visible = True
          ItemName = 'mnuContent'
        end
        item
          Visible = True
          ItemName = 'mnuFormat'
        end>
      MultiLine = True
      OldName = 'MainMenu'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxbmPrintBar2: TdxBar
      AllowCustomizing = False
      Caption = #24037#20855#26639
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 23
      DockingStyle = dsTop
      FloatLeft = 242
      FloatTop = 129
      FloatClientWidth = 595
      FloatClientHeight = 40
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxlbFirst'
        end
        item
          Visible = True
          ItemName = 'dxlbPrevious'
        end
        item
          Visible = True
          ItemName = 'dxlbNext'
        end
        item
          Visible = True
          ItemName = 'dxlbLast'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxlbZoomIn'
        end
        item
          Visible = True
          ItemName = 'dxlbZoomOut'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxlbPageWidth'
        end
        item
          Visible = True
          ItemName = 'dxlbWholePage'
        end
        item
          Visible = True
          ItemName = 'dxlbActual'
        end
        item
          Visible = True
          ItemName = 'dxlbZoom'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxlbPrint'
        end
        item
          Visible = True
          ItemName = 'dxlbSettings'
        end
        item
          Visible = True
          ItemName = 'dxlbPageSetup'
        end
        item
          Visible = True
          ItemName = 'dxlbClose'
        end>
      OldName = 'Toolbar'
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbmPrintBar3: TdxBar
      Caption = #26684#24335
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 71
      DockingStyle = dsTop
      FloatLeft = 277
      FloatTop = 315
      FloatClientWidth = 254
      FloatClientHeight = 20
      ItemLinks = <
        item
          UserDefine = [udWidth]
          UserWidth = 186
          Visible = True
          ItemName = 'mnuFormatFontName'
        end
        item
          UserDefine = [udWidth]
          UserWidth = 93
          Visible = True
          ItemName = 'mnuFormatSize'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuFormatBold'
        end
        item
          Visible = True
          ItemName = 'mnuFormatItalic'
        end
        item
          Visible = True
          ItemName = 'mnuFormatUnderline'
        end
        item
          Visible = True
          ItemName = 'mnuFormatStrikeout'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuContentDate'
        end
        item
          Visible = True
          ItemName = 'mnuContentTime'
        end
        item
          Visible = True
          ItemName = 'mnuContentName'
        end
        item
          Visible = True
          ItemName = 'mnuContentPhoneNumber'
        end
        item
          Visible = True
          ItemName = 'mnuContentSign'
        end
        item
          Visible = True
          ItemName = 'mnuContentHeader'
        end
        item
          Visible = True
          ItemName = 'mnuContentFooter'
        end
        item
          Visible = True
          ItemName = 'mnuContentLineNum'
        end>
      OldName = 'Format'
      OneOnRow = True
      Row = 2
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object mnuFile: TdxBarSubItem
      Caption = #25991#20214'(&F)'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mnuFileSaveAs'
        end
        item
          Visible = True
          ItemName = 'mnuFileCopy'
        end
        item
          Visible = True
          ItemName = 'mnuFilePageSetup'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuFilePrintSettings'
        end
        item
          Visible = True
          ItemName = 'mnuFilePrintEx'
        end
        item
          Visible = True
          ItemName = 'mnuFilePrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuFileExit'
        end>
    end
    object mnuFileSaveAs: TdxBarButton
      Action = aSynSaveAs
      Caption = #20869#23481#21478#23384#20026'(&S)...'
      Category = 0
      ImageIndex = 0
      ShortCut = 16467
    end
    object mnuFileExit: TdxBarButton
      Caption = #36864#20986'(&X)'
      Category = 0
      Hint = #36864#20986'(X)'
      Visible = ivAlways
      ImageIndex = 5
      ShortCut = 32883
      OnClick = mnuFileExitClick
    end
    object mnuFilePageSetup: TdxBarButton
      Caption = #38754#39029#35774#32622'(&U)...'
      Category = 0
      Hint = #38754#39029#35774#32622'(U)'
      Visible = ivAlways
      ImageIndex = 2
      ShortCut = 16464
      OnClick = mnuFilePageSetupClick
    end
    object mnuFilePrintSettings: TdxBarButton
      Caption = #25171#21360#35774#32622'(&I)...'
      Category = 0
      Hint = #25171#21360#35774#32622'(I)'
      Visible = ivAlways
      ImageIndex = 3
      ShortCut = 24655
      OnClick = mnuFilePrintSettingsClick
    end
    object mnuFilePrint: TdxBarButton
      Caption = #31435#21363#25171#21360'(&R)'
      Category = 0
      Hint = #31435#21363#25171#21360'(R)'
      Visible = ivAlways
      ShortCut = 24656
      OnClick = mnuFilePrintClick
    end
    object mnuPage: TdxBarSubItem
      Caption = #39029#38754'(&P)'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mnuPageGo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuPagePrevious'
        end
        item
          Visible = True
          ItemName = 'mnuPageNext'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuPageFirst'
        end
        item
          Visible = True
          ItemName = 'mnuPageLast'
        end>
    end
    object mnuFileCopy: TdxBarButton
      Caption = #22797#21046#20869#23481'(&C)'
      Category = 0
      Hint = #22797#21046#20869#23481'(C)'
      Visible = ivAlways
      ImageIndex = 1
      ShortCut = 16451
      OnClick = mnuFileCopyClick
    end
    object mnuPageGo: TdxBarButton
      Caption = #36716#21040'(&G)...'
      Category = 0
      Hint = #36716#21040'(G)'
      Visible = ivAlways
      ShortCut = 114
      OnClick = mnuPageGoClick
    end
    object mnuPagePrevious: TdxBarButton
      Caption = #19978#19968#39029'(&P)'
      Category = 0
      Hint = #19978#19968#39029'(P)'
      Visible = ivAlways
      ImageIndex = 6
      ShortCut = 33
      OnClick = mnuPagePreviousClick
    end
    object mnuPageNext: TdxBarButton
      Caption = #19979#19968#39029'(&N)'
      Category = 0
      Hint = #19979#19968#39029'(N)'
      Visible = ivAlways
      ImageIndex = 7
      ShortCut = 34
      OnClick = mnuPageNextClick
    end
    object mnuPageFirst: TdxBarButton
      Caption = #39318#39029'(&F)'
      Category = 0
      Hint = #39318#39029'(F)'
      Visible = ivAlways
      ImageIndex = 8
      ShortCut = 36
      OnClick = mnuPageFirstClick
    end
    object mnuPageLast: TdxBarButton
      Caption = #26411#39029'(&E)'
      Category = 0
      Hint = #26411#39029'(E)'
      Visible = ivAlways
      ImageIndex = 9
      ShortCut = 35
      OnClick = mnuPageLastClick
    end
    object mnuZoom: TdxBarSubItem
      Caption = #32553#25918'(&Z)'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mnuZoomIn'
        end
        item
          Visible = True
          ItemName = 'mnuZoomOut'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuZoomFitPage'
        end
        item
          Visible = True
          ItemName = 'mnuZoomFitWidth'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuZoom25'
        end
        item
          Visible = True
          ItemName = 'mnuZoom50'
        end
        item
          Visible = True
          ItemName = 'mnuZoom75'
        end
        item
          Visible = True
          ItemName = 'mnuZoom100'
        end
        item
          Visible = True
          ItemName = 'mnuZoom150'
        end
        item
          Visible = True
          ItemName = 'mnuZoom200'
        end
        item
          Visible = True
          ItemName = 'mnuZoom500'
        end
        item
          Visible = True
          ItemName = 'mnuZoomCustom'
        end>
    end
    object mnuZoomIn: TdxBarButton
      Caption = #25918#22823'(&I)'
      Category = 0
      Hint = #25918#22823'(I)'
      Visible = ivAlways
      ImageIndex = 10
      ShortCut = 116
      OnClick = mnuZoomInClick
    end
    object mnuZoomOut: TdxBarButton
      Caption = #32553#23567'(&O)'
      Category = 0
      Hint = #32553#23567'(O)'
      Visible = ivAlways
      ImageIndex = 11
      ShortCut = 117
      OnClick = mnuZoomOutClick
    end
    object mnuZoomFitPage: TdxBarButton
      Caption = #36866#21512#39029#38754'(&P)'
      Category = 0
      Hint = #36866#21512#39029#38754'(P)'
      Visible = ivAlways
      ImageIndex = 12
      ShortCut = 118
      OnClick = mnuZoomFitPageClick
    end
    object mnuZoomFitWidth: TdxBarButton
      Caption = #36866#21512#39029#23485'(&W)'
      Category = 0
      Hint = #36866#21512#39029#23485'(W)'
      Visible = ivAlways
      ImageIndex = 13
      ShortCut = 119
      OnClick = mnuZoomFitWidthClick
    end
    object mnuZoom25: TdxBarButton
      Caption = '&25%'
      Category = 0
      Hint = '25%'
      Visible = ivAlways
      OnClick = mnuZoom25Click
    end
    object mnuZoom50: TdxBarButton
      Caption = '&50%'
      Category = 0
      Hint = '50%'
      Visible = ivAlways
      OnClick = mnuZoom50Click
    end
    object mnuZoom75: TdxBarButton
      Caption = '&75%'
      Category = 0
      Hint = '75%'
      Visible = ivAlways
      OnClick = mnuZoom75Click
    end
    object mnuZoom100: TdxBarButton
      Caption = '&100%'
      Category = 0
      Hint = '100%'
      Visible = ivAlways
      OnClick = mnuZoom100Click
    end
    object mnuZoom150: TdxBarButton
      Caption = '15&0%'
      Category = 0
      Hint = '150%'
      Visible = ivAlways
      OnClick = mnuZoom150Click
    end
    object mnuZoom200: TdxBarButton
      Caption = '200%(T)'
      Category = 0
      Hint = '200%(T)'
      Visible = ivAlways
      OnClick = mnuZoom200Click
    end
    object mnuZoom500: TdxBarButton
      Caption = '500%(&F)'
      Category = 0
      Hint = '500%(F)'
      Visible = ivAlways
      OnClick = mnuZoom500Click
    end
    object mnuContent: TdxBarSubItem
      Caption = #20869#23481'(&C)'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mnuContentDate'
        end
        item
          Visible = True
          ItemName = 'mnuContentTime'
        end
        item
          Visible = True
          ItemName = 'mnuContentName'
        end
        item
          Visible = True
          ItemName = 'mnuContentPhoneNumber'
        end
        item
          Visible = True
          ItemName = 'mnuContentSign'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuContentHeader'
        end
        item
          Visible = True
          ItemName = 'mnuContentFooter'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuContentLineNum'
        end
        item
          Visible = True
          ItemName = 'mnuContentSpace'
        end>
    end
    object mnuContentTime: TdxBarButton
      Caption = #26102#38388'(&T)'
      Category = 0
      Hint = #26102#38388'(T)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      ImageIndex = 16
      ShortCut = 16434
      OnClick = mnuContentDateClick
    end
    object mnuContentName: TdxBarButton
      Caption = #22995#21517'(&N)'
      Category = 0
      Hint = #22995#21517'(N)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      ImageIndex = 17
      ShortCut = 16435
      OnClick = mnuContentDateClick
    end
    object mnuContentPhoneNumber: TdxBarButton
      Caption = #30005#35805#21495#30721'(&P)'
      Category = 0
      Hint = #30005#35805#21495#30721'(P)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      ImageIndex = 18
      ShortCut = 16436
      OnClick = mnuContentDateClick
    end
    object mnuContentSign: TdxBarButton
      Caption = #26631#24535'(&S)'
      Category = 0
      Hint = #26631#24535'(S)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      ImageIndex = 19
      ShortCut = 16437
      OnClick = mnuContentDateClick
    end
    object mnuContentDate: TdxBarButton
      Caption = #26085#26399'(&D)'
      Category = 0
      Hint = #26085#26399'(D)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      ImageIndex = 15
      ShortCut = 16433
      OnClick = mnuContentDateClick
    end
    object mnuContentHeader: TdxBarButton
      Caption = #39029#30473'(&H)'
      Category = 0
      Hint = #39029#30473'(H)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      ImageIndex = 20
      ShortCut = 16438
      OnClick = mnuContentDateClick
    end
    object mnuContentFooter: TdxBarButton
      Caption = #39029#33050'(&F)'
      Category = 0
      Hint = #39029#33050'(F)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      ImageIndex = 21
      ShortCut = 16439
      OnClick = mnuContentDateClick
    end
    object dxlbFirst: TdxBarLargeButton
      Caption = #39318#39029
      Category = 0
      Hint = #39318#39029
      Visible = ivAlways
      LargeImageIndex = 0
      OnClick = mnuPageFirstClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 8
    end
    object dxlbPrevious: TdxBarLargeButton
      Caption = #19978#19968#39029
      Category = 0
      Hint = #19978#19968#39029
      Visible = ivAlways
      LargeImageIndex = 1
      OnClick = mnuPagePreviousClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 6
    end
    object dxlbNext: TdxBarLargeButton
      Caption = #19979#19968#39029
      Category = 0
      Hint = #19979#19968#39029
      Visible = ivAlways
      LargeImageIndex = 2
      OnClick = mnuPageNextClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 7
    end
    object dxlbLast: TdxBarLargeButton
      Caption = #26411#39029
      Category = 0
      Hint = #26411#39029
      Visible = ivAlways
      LargeImageIndex = 3
      OnClick = mnuPageLastClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 9
    end
    object dxlbPageWidth: TdxBarLargeButton
      Caption = #39029#23485
      Category = 0
      Hint = #39029#23485
      Visible = ivAlways
      LargeImageIndex = 6
      OnClick = mnuZoomFitWidthClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 12
    end
    object dxlbWholePage: TdxBarLargeButton
      Caption = #25972#39029
      Category = 0
      Hint = #25972#39029
      Visible = ivAlways
      LargeImageIndex = 7
      OnClick = mnuZoomFitPageClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 13
    end
    object dxlbActual: TdxBarLargeButton
      Caption = #23454#38469#22823#23567
      Category = 0
      Hint = #23454#38469#22823#23567
      Visible = ivAlways
      LargeImageIndex = 8
      OnClick = mnuZoom100Click
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 14
    end
    object dxlbZoom: TdxBarLargeButton
      Caption = #32553#25918
      Category = 0
      Hint = #32553#25918
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = popZoom
      LargeImageIndex = 9
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 14
    end
    object dxlbZoomIn: TdxBarLargeButton
      Caption = #25918#22823
      Category = 0
      Hint = #25918#22823
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = mnuZoomInClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 10
    end
    object dxlbZoomOut: TdxBarLargeButton
      Caption = #32553#23567
      Category = 0
      Hint = #32553#23567
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = mnuZoomOutClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 11
    end
    object dxlbPrint: TdxBarLargeButton
      Caption = #25171#21360
      Category = 0
      Hint = #25171#21360
      Visible = ivAlways
      LargeImageIndex = 10
      OnClick = mnuFilePrintExClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 4
    end
    object dxlbSettings: TdxBarLargeButton
      Caption = #35774#32622
      Category = 0
      Hint = #35774#32622
      Visible = ivAlways
      LargeImageIndex = 11
      OnClick = mnuFilePrintSettingsClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 3
    end
    object dxlbClose: TdxBarLargeButton
      Caption = #20851#38381
      Category = 0
      Hint = #20851#38381
      Visible = ivAlways
      LargeImageIndex = 13
      OnClick = mnuFileExitClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 5
    end
    object mnuFormatFontName: TdxBarFontNameCombo
      Caption = #23383#20307
      Category = 0
      Hint = #23383#20307
      Visible = ivAlways
      OnChange = mnuFormatFontNameChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888444488844444488887488888744
        7888888448888744888888874888844788888888444444488888888874884478
        8888888884484488888888888744478888888888884448888888888888747888
        8888888888848888888888888888888888888888888888888888}
      ImageIndex = 23
      ShowCaption = True
      Width = 160
      DropDownCount = 12
    end
    object mnuFormatSize: TdxBarCombo
      Caption = #22823#23567
      Category = 0
      Hint = #22823#23567
      Visible = ivAlways
      OnChange = mnuFormatSizeChange
      ShowCaption = True
      Width = 100
      Items.Strings = (
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12'
        '14'
        '16'
        '18')
      ItemIndex = -1
    end
    object mnuContentLineNum: TdxBarButton
      Caption = #34892#21495'(&L)'
      Category = 0
      Hint = #34892#21495'(L)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 22
      ShortCut = 16440
      OnClick = mnuContentLineNumClick
    end
    object mnuContentSpace: TdxBarButton
      Caption = #34892#21495#26174#31034#22312#31354#30333#21306#22495'(&M)'
      Category = 0
      Hint = #34892#21495#26174#31034#22312#31354#30333#21306#22495'(M)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = mnuContentSpaceClick
    end
    object mnuFormat: TdxBarSubItem
      Caption = #26684#24335'(&F)'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mnuFormatFont'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuFormatBold'
        end
        item
          Visible = True
          ItemName = 'mnuFormatItalic'
        end
        item
          Visible = True
          ItemName = 'mnuFormatUnderline'
        end
        item
          Visible = True
          ItemName = 'mnuFormatStrikeout'
        end>
    end
    object mnuFormatFont: TdxBarButton
      Caption = #23383#20307'(&F)...'
      Category = 0
      Hint = #23383#20307'(F)'
      Visible = ivAlways
      ImageIndex = 23
      ShortCut = 16454
      OnClick = mnuFormatFontClick
    end
    object mnuFormatBold: TdxBarButton
      Caption = #21152#31895'(&B)'
      Category = 0
      Hint = #21152#31895'(B)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 24
      ShortCut = 16450
      OnClick = mnuFormatBoldClick
    end
    object mnuFormatItalic: TdxBarButton
      Caption = #20542#26012'(&I)'
      Category = 0
      Hint = #20542#26012'(I)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 25
      ShortCut = 16457
      OnClick = mnuFormatItalicClick
    end
    object mnuFormatUnderline: TdxBarButton
      Caption = #19979#21010#32447'(&U)'
      Category = 0
      Hint = #19979#21010#32447'(U)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 26
      ShortCut = 16469
      OnClick = mnuFormatUnderlineClick
    end
    object mnuFormatStrikeout: TdxBarButton
      Caption = #21024#38500#32447'(&S)'
      Category = 0
      Hint = #21024#38500#32447'(S)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 27
      ShortCut = 16466
      OnClick = mnuFormatStrikeoutClick
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
          ItemName = 'mnuViewFormat'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'mnuViewStatusbar'
        end>
    end
    object mnuViewToolbar: TdxBarButton
      Caption = #24037#20855#26639'(&T)'
      Category = 0
      Hint = #24037#20855#26639'(T)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = mnuViewToolbarClick
    end
    object mnuViewFormat: TdxBarButton
      Caption = #26684#24335#26639'(&F)'
      Category = 0
      Hint = #26684#24335#26639'(F)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = mnuViewFormatClick
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
    object mnuFilePrintEx: TdxBarButton
      Caption = #25171#21360'(&P)...'
      Category = 0
      Hint = #25171#21360'(P)'
      Visible = ivAlways
      ImageIndex = 4
      ShortCut = 16464
      OnClick = mnuFilePrintExClick
    end
    object dxlbPageSetup: TdxBarLargeButton
      Caption = #38754#39029
      Category = 0
      Hint = #38754#39029
      Visible = ivAlways
      LargeImageIndex = 12
      OnClick = mnuFilePageSetupClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 2
    end
    object mnuZoomCustom: TdxBarButton
      Caption = #33258#23450#20041#32553#25918'(&C)...'
      Category = 0
      Hint = #33258#23450#20041#32553#25918'(C)'
      Visible = ivAlways
      ImageIndex = 14
      ShortCut = 120
      OnClick = mnuZoomCustomClick
    end
  end
  object popZoom: TdxBarPopupMenu
    BarManager = dxbmPrint
    ItemLinks = <
      item
        Visible = True
        ItemName = 'mnuZoom25'
      end
      item
        Visible = True
        ItemName = 'mnuZoom50'
      end
      item
        Visible = True
        ItemName = 'mnuZoom75'
      end
      item
        Visible = True
        ItemName = 'mnuZoom100'
      end
      item
        Visible = True
        ItemName = 'mnuZoom150'
      end
      item
        Visible = True
        ItemName = 'mnuZoom200'
      end
      item
        Visible = True
        ItemName = 'mnuZoom500'
      end
      item
        Visible = True
        ItemName = 'mnuZoomCustom'
      end>
    UseOwnFont = False
    Left = 168
    Top = 272
  end
  object iltMenu: TImageList
    Left = 200
    Top = 272
    Bitmap = {
      494C01011C001D00040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001212120078787800ABAB
      AB00000000000000000000000000000000000000000000000000000000000000
      0000A4A0A0000000000000000000A4A0A0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A4A0A0005252520000000000000000000000000052525200A4A0A0000000
      0000000000000000000000000000000000004940470051534A00514D4A002020
      20008D868900635E5C00101810002B2229005D5052008E7E7A00F0E4DD000000
      00008E7E7A0044393D002B222900685D54000000000000000000000000009292
      9200000000000000000000000000000000009292920000000000000000007878
      7800000000000000000000000000000000000000000000000000000000000000
      00000000000085858500000000006C6C6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000525252000000000092929200000000009292920000000000525252000000
      0000000000000000000000000000000000005D50520000000000E7DCD5003735
      33000000000089837F00101810000000000000000000201820009A8A85006961
      5C0020182000B0A09B0000000000544A41000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001212
      1200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002018200020182000201820002018
      2000201820002018200020182000201820002018200020182000201820002018
      2000201820002018200020182000201820000000000000000000000000000000
      0000000000000000000000000000000000009292920000000000000000007878
      7800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000085858500000000007878780000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005D5052005058
      5000D4CBC60069615C002B222900E0D0C600CDBEB70044393D008E7E7A005D50
      520020182000A7958F00E5D7CF00DDCFC8000000000000000000000000000000
      000000000000000000000000000000000000000000000000000045454500ABAB
      AB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000817E7B0000000000BDB2AC00666A
      62000000000069615C00201820005D5052005045480075676600000000009A8F
      88005045480044393D0050454800504548000000000000000000000000000000
      0000000000000000000000000000000000009292920000000000000000007878
      7800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000858585000000000085858500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDCFC80051534A00494F4700988E
      90000000000069615C00201820005D50520082737000DDCFC800000000000000
      0000D4CBC6005D50520044403D00C6B5AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001212
      1200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A4A0A0000000000000000000A4A0A0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000069615C002B222900000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4A0
      A000000000000000000000000000000000009292920000000000000000007878
      7800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4A0
      A0000000000000000000A4A0A00000000000A4A0A0000000000000000000A4A0
      A000000000000000000000000000000000000000000000000000000000000000
      0000000000005D56520010181000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001212120078787800ABAB
      AB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000050454800463C3300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5A79F007E756F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005068
      7000404860003048600030405000203040002030400020283000202830002020
      2000101820001018200020202000000000000000000000000000000000005068
      7000404860003048600030405000203040002030400020283000202830002020
      20001018200010182000202020000000000000000000C0705000A05840000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005070
      8000B0F0F000B0F0F000A0E8F000A0E0E00090D0E00080C8D00080C0D00070B8
      D00060B0C00060A8C00020283000000000000000000000000000000000005070
      8000B0F0F000B0F0F000A0E8F000A0E0E00090D0E00080C8D00080C0D00070B8
      D00060B0C00060A8C00020283000000000000000000000000000000000009050
      3000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B8B8B800A4A0A000A4A0
      A000A4A0A000000000000000000000000000B8B8B800A4A0A000A4A0A000A4A0
      A000A4A0A000B8B8B8000000000000000000C0704000B5683B00AA613700A05A
      330095532F00894A2A0080442600753D22006A361E0060331F00507080005068
      70004060700060A8C0003038400000000000C0704000B0583000B05830006080
      9000B0F8FF007098A0007090A0007090A0006080900060788000507080005068
      70004060700060A8C00030384000000000000000000000000000D07850000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ABABAB006C6C6C007C54
      00005F5F5F00000000000000000000000000929292005D3F00005D3F00005D3F
      00005D3F0000B8B8B8000000000000000000C0785000F0D8D000F0D6CA00F0D5
      C500F0D5C500F0D3BD00F0D3BD00F0D1B400EBD0B2006D381F0080C8D00070B8
      D00070B0C00060A8C0003040500000000000C0785000F0D8D000F0D8D0007090
      A000B0F8FF00B0F0F000B0E8F000A0E0F00090D8E00090D0E00080C8D00070B8
      D00070B0C00060A8C000304050000000000000000000D0785000D0785000C087
      6700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8B8B8009B69
      0000B8B8B80000000000000000000000000000000000787878005D3F00005D3F
      000000000000000000000000000000000000D0886000FFF8F000E0906000E090
      6000D0805000D0805000D0805000D0805000F0D1B4007B412400507080005068
      700050687000406060003048600000000000D0886000FFF8F000FFFFFF007098
      A0007098A0007090A00060889000608890006080900060788000507080005068
      7000506870004060600030486000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007878
      78006C6C6C00A4A0A000A4A0A000A4A0A000A4A0A0007C5400005D3F00005F5F
      5F0000000000000000000000000000000000D0886000FFF8F000FFF8F000FFF8
      F000FFF8F000FFF8F000FFF8F000FFF4EC00F0D3BD00894A2A00000000000000
      000000000000000000000000000000000000D0886000FFF8F000FFFFFF00FFFF
      FF00FFF0F000FFF0F000FFE8E000FFE8E000F0D0B00090482000000000000000
      00000000000000000000000000000000000000000000C0705000A05840008050
      3000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ABAB
      AB009B6900009B6900005F5F5F009B6900007C5400007C5400005D3F0000ABAB
      AB0000000000000000000000000000000000D0907000FFF8F000E0906000E090
      6000D0805000D0805000D0805000D0805000F0D3BD0096542F00000000000000
      000000000000000000000000000000000000D0907000FFF8F000E0906000E090
      6000D0805000D0805000D0805000D0805000F0D0B00090482000000000000000
      0000000000000000000000000000000000000000000000000000B06840000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006C6C6C00ABABAB00C0C0C000C0C0C0009B6900007C5400005F5F5F000000
      000000000000000000000000000000000000E0A08000FFFFFF00FFFFFF00FFFF
      FF00FFF0F000FFF0F000FFE8E000FFE8E000F0D5C500A05A3300000000000000
      000000000000000000000000000000000000E0A08000FFFFFF00FFFFFF00FFFF
      FF00FFF0F000FFF0F000FFE8E000FFE8E000F0D0C000A0482000000000000000
      000000000000000000000000000000000000000000000000000000000000A060
      4000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A4A0A0006C6C6C00C0C0C000A4A0A0007C5400007C540000A4A0A0000000
      000000000000000000000000000000000000E0A89000FFFFFF00F0A88000F0A8
      8000E0987000E0906000D0805000D0805000F0D6CA00B2663A00000000000000
      000000000000000000000000000000000000E0A89000FFFFFF00F0A88000F0A8
      8000E0987000E0906000D0805000D0805000F0D8D000A0502000000000000000
      00000000000000000000000000000000000000000000E0805000D07850000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009B690000B8B8B8009B6900007C5400009B690000000000000000
      000000000000000000000000000000000000E0B8A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF0F000FFF0F000F0D8D000B9693900000000000000
      000000000000000000000000000000000000E0B8A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF0F000FFF0F000F0E0E000A0502000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000085858500808080009B6900007C540000A4A0A000000000000000
      000000000000000000000000000000000000F0C0A000FFFFFF00FFB090005068
      7000404860003048600030405000203040002030400020283000202830002020
      200010182000101820002020200000000000F0C0A000FFFFFF00FFB09000FFB0
      9000F0B09000F0A88000F0987000E0906000F0E0E000A0502000202830002020
      20001018200010182000202020000000000000000000C0684000905840009C63
      4600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8B8B8006C6C6C006C6C6C009B69000000000000000000000000
      000000000000000000000000000000000000F0C8B000FFFFFF00FFFFFF005070
      8000B0F0F000B0F0F000A0E8F000A0E0E00090D0E00080C8D00080C0D00070B8
      D00060B0C00060A8C0002028300000000000F0C8B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A050200080C0D00070B8
      D00060B0C00060A8C00020283000000000000000000000000000B06040000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000858585006C6C6C00B8B8B80000000000000000000000
      000000000000000000000000000000000000F0C8B000F0C0B000F0C0B0006080
      9000B0F8FF007098A0007090A0007090A0006080900060788000507080005068
      70004060700060A8C0003038400000000000F0C8B000F0C0B000F0C0B000F0C0
      B000F0B8A000E0A08000D0907000D0886000C0785000C0704000507080005068
      70004060700060A8C000303840000000000000000000EAAA8A00C07050000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000ABABAB00858585000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007090
      A000B0F8FF00B0F0F000B0E8F000A0E0F00090D8E00090D0E00080C8D00070B8
      D00070B0C00060A8C00030405000000000000000000000000000000000007090
      A000B0F8FF00B0F0F000B0E8F000A0E0F00090D8E00090D0E00080C8D00070B8
      D00070B0C00060A8C00030405000000000000000000000000000D07850000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007098
      A0007098A0007090A00060889000608890006080900060788000507080005068
      7000506870004060600030486000000000000000000000000000000000007098
      A0007098A0007090A00060889000608890006080900060788000507080005068
      7000506870004060600030486000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D69B8E00D7846C00CB5D3C00CB5D3C00D7846C00D69B8E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B59D8900806850007058500060504000AA938800CBB7A900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69B
      8E00CF603E00DE6B4200E68C6D00EFAE9700EFAE9700E68C6D00DE6B4200CF60
      3E00D69B8E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B59D89008070
      6000A0807000E0C0B000E0C0B000907860008070600070504000AA938800DCC6
      B900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CD7D6200E47C
      4B00F0B29A00FDEAE400FFEFE800FFE7D800FFE7D800FDEAE400FDEAE400EFAE
      9700DE6B4200CA735D000000000000000000B0A0900070605000705840006050
      4000604830006048300060483000604830006048300060483000604830006048
      300060483000604830006048300060483000B59D89009070600090786000F0D0
      C000F0C8B000F0C8B000F0C8B0008070600090787000B0A09000807060008068
      5000AA938800DCC6B90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D8A39200EB8E5400F6CB
      B400FEF2EC00FFDEC500FFCFA800FFCDA600FFCDA600FFCDA600FFD8B900FDEA
      E400F3BFAC00DE6B4200D69B8E0000000000B0A09000F0E0D000F0D8D000E0D0
      C000E0C8B000E0C0B000E0C0B000E0C0B000E0C0A000E0B8A000E0B8A000E0B8
      A000E0B09000E0B09000E0B090006048300090706000F0E0D000F0D8C000F0D8
      D000E0C0B000A0908000B08870008070600090786000A0908000C0A8A000B0A0
      90008068500070504000DCC6B900000000000000000000000000000000000000
      0000000000000000000000000000000000007640290000000000000000000000
      00000000000000000000000000000000000000000000DD875100F7C7A600FEF2
      EC00FFDEC500FFD6B600E6BFA200FFD6B600FFD4B100FFCDA600FFD6B600FFD4
      B100FEF2EC00EFAE9700CF603E0000000000C0A89000FFF0F000B0B8C0001058
      C0001050B0000040900020509000B0A0A000FFE0D000F0E0D000F0D8C000F0D8
      C000F0D8C000F0D8C000E0B0900060483000B0807000F0F0F000FFE8E000B090
      8000A0908000D0C0B000E5CFC200D0C0B0008070600090807000B0989000C0B0
      A000C0B8B000B0A8A00060484000000000000000000000000000000000000000
      000000000000000000000000000000000000855A3D0000000000000000000000
      000000000000000000000000000000000000D8A39200F4A75F00FEF2EC00FFEA
      D900FFDEC500EFCEB50084686300CEAB9700FFD6B600FFD6B600FFD4B100FFD4
      B100FFDEC500FDEAE400DE6B4200D69B8E00C0A8A000E0E8F0002060C00070A8
      F0004088E0000048A0001068D00000409000FFE8E000E0B8B000C0A09000C098
      8000C0988000C0908000E0B8A00060483000C0988000F0E8E000B0A09000E0D0
      D000F0E8E00090807000DCC6B900F0D8C000E0C0B00090786000B0A09000B0A8
      A0008068600070585000605040009F7A65000000000000000000000000000000
      0000000000000000000000000000804020000000000000000000000000000000
      000000000000000000000000000000000000DE9C7100F9C18800FFF7F400FFE8
      D500FFE6D100FFE6D100E6CAB60084686300CEAE9C00FFD8B900FFD8B900FFD8
      B900FFD6B600FEF2EC00E68C6D00D7846C00C0B0A000F0F0F0003070C00070A8
      E0002058B0002070E0001050B0002058A000FFF0E000FFE0D000FFE0D000F0E0
      D000F0D8C000F0D8C000E0B8A00060483000C0988000C0A8A000FFF8F0009080
      7000F0D8D000F0E8E000B0A09000E0D8D000F0E8E000D0C0B000908070008068
      6000C0A09000C0A09000A0807000705840000000000000000000000000000000
      0000000000000000000000000000764F38009B9B9B0000000000000000000000
      000000000000000000000000000000000000E49A5A00FFD6B600FFF7F400FFEA
      D900FFEAD900FFE8D500FFE8D500E6CDBC007C605D00FFE6D100FFE6D100FFDE
      C500FFDEC500FFF1E600EFB09A00CB5D3C00C0B0A000FFF8FF00E0E0E0003050
      9000A09890008088A00030509000D0D8E000FFF0F000F0D0C000C0A09000C098
      8000C0988000C0908000D0C0B00060483000D1B7A900B0908000F0E8E000FFFF
      FF00B0A09000F0E8E000FFF8FF00C0B8B000F0F8F000F0F0F000A0908000A080
      7000E0C0B000D0B0A000C0988000705040000000000000000000000000000000
      000000000000000000008D63540060887000507860008B8B8B00969696000000
      000000000000000000000000000000000000E49A5A00FFD6B600FFF7F400FFF7
      F400FFF1E600FDEAE400FDEAE400FFEAD9007C605D00FFE8D500FFE6D100FFE6
      D100FFE6D100FFF1E600EFB09A00CF603E00C0B8A000FFF8FF00606860003028
      2000B0B8B0008080800060687000FFF8FF00FFF8F000FFF0F000FFF0E000FFE8
      E000FFE8E000FFE0D000D0C0B0006048300000000000CDB3A500B0887000F0E8
      E000FFFFFF00D0C8C000FFFFFF00F0E8E000FFFFFF00E0E0E00070585000C0B0
      A000F0D8D000F0E0D000E0C0B000806050000000000000000000000000000000
      000000000000000000007050500070B8900060A0700050906000407860008B8B
      8B0000000000000000000000000000000000E0A47500FED29200FFFFFF00FFF7
      F400FEF2EC00FFF7F100FEF2EC00FEF2EC007C605D00FFEAD900FFEAD900FFEA
      D900FFE8D500FFF7F400E68C6D00D1795F00D0B8B000FFF8FF00505050005048
      5000E0E0E000C0C8C00080787000E0D8E000FFF8F000FFC8A000FFB89000FFB0
      8000FFA88000F0A07000D0C0B000604830000000000000000000D1B7A900B088
      7000F0E8E000FFFFFF00FFFFFF00A0807000705850006048400070504000D0D0
      C000FFFFFF00F0E8E000F0E0D000807060000000000000000000000000000000
      0000000000008058400090D0B00080D0A00070C0900060B0800060A880005080
      600096969600000000000000000000000000DCAC9600FEC56E00FFF7F400FFFF
      FF00FFFFFF00FFF7F100FFF7F100FFF7F1007C605D00FFF7F400FEF2EC00FFF1
      E600FEF2EC00FEF2EC00E0704500D69B8E00D0B8B000FFF8FF00706870007078
      7000A098A0009098900080788000E0E0E000FFF8FF00FFF8F000FFF8FF00FFF8
      F000FFF8F000FFF8F000D0C8C000605040000000000000000000A47D65008068
      60008060500080706000B0A8A000A08070009080700080706000D0B8B000F0F0
      F000FFFFFF00F0E0E000B0908000DCC4B5000000000000000000000000000000
      00000000000090605000A0E8C00090D8B00060A0700080D0A00090D8B00070B0
      80005080600000000000000000000000000000000000E7A45F00FEE1B600FFF7
      F100FFFFFF00FFFFFF00FFFFFF00FFFFFF007C605D00FFF7F400FFF7F400FFF7
      F400FFFFFF00F7C7A600D46C440000000000D0C0B000FFF8FF00E0E0E0007078
      70008088800070787000C0C8C000FFF8FF00FFF8FF00FFF8FF00FFF8FF00FFF8
      FF00FFF8F000FFF8F000D0C8C000705840000000000000000000B0887000D0B0
      A000C0A8A0007058500080706000A47D6500F0F0E000F0F0F000F0F0F000E0D8
      D000C0A8A000B0908000D4BAAC00000000000000000000000000000000000000
      00008058400090D0B00070A0800060A880005090700090D8B00060A0800050A0
      700050987000497D6500000000000000000000000000DCAC9600FEC56E00FFE9
      C900FFF7F100FFFFFF00FFF7F100FFFFFF00E6E1E100FFFFFF00FFF7F100FFFF
      FF00F8D6BE00EB8E5400D7A0900000000000D0C0B000FFF8FF00FFF8FF00FFF8
      FF00FFF8FF00FFF8FF00FFF8FF00FFF8FF00FFF8FF00FFF8FF00FFF8FF00FFF8
      FF00FFF8FF00FFF8FF00FFF8FF00806850000000000000000000C0988000E0D0
      D000F0E0E000C0A8A00090706000F0F0F000F0F0F000E0D8D000C0B0A000B090
      8000D4BAAC00E2CCBE0000000000000000000000000000000000000000000000
      00009A745D0060987000000000000000000062896B0050806000000000000000
      0000000000000000000000000000000000000000000000000000D6966E00FEC5
      6E00FEE1B600FFFFFF00FFF7F100FFFFFF00FFF7F100FFFFFF00FFFFFF00FFD6
      B600F19E5B00CF8465000000000000000000D0C0B000D0C0B000D0C0B000D0C0
      B000D0B8B000D0B8B000C0B8A000C0B0A000C0B0A000C0A8A000C0A8A000C0A8
      9000B0A09000B0A09000B0A09000B0A09000000000000000000000000000C090
      8000F0F0F000F0F0F000F0F0F000E0D8D000D0B0A000B0908000D4BAAC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DCAC
      9600E7A45F00FEC56E00FED29200FEE1B600FEE1B600FBCA8D00F8B26500E191
      5500D8A392000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0988000B0908000B0887000B0908000D4BAAC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DCAC9600E0A47500E7A45F00E7A45F00DE9C7100DCAC96000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002048
      6000303040000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002048
      6000303040000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002048
      600030304000000000000000000000000000BBA5960063493500634935006349
      3500664D38006349350063493500634935006349350063493500634935006349
      3500634935006349350063493500634935000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000305060004088
      A0003090B0003040500000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000305060004088
      A0003090B0003040500000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000305060004088
      A0003090B000304050000000000000000000BBA59600D8B7A100C59D8100B28B
      6F00D8B7A100C9A78F00B68D7100D8B7A100C59D8100B28B6F00D8B7A100C59D
      8100B28B6F00D2A98C00BE987B00634935000000000000000000000000000000
      00000000000000000000000000000000000000000000305060003088B00040B8
      E00090E0F00090D0E0006090A000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000305060003088B00040B8
      E00090E0F00090D0E0006090A000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000305060003088B00040B8
      E00090E0F00090D0E0006090A00000000000C0AB9C00FEFEFE00FEFEFE00C29A
      7D00FEFEFE00FEF7F400C29A7D00FBF2EC00FBF2EC00BF967900FAE9DD00FBEA
      E000C29A7D00FAE0CF00D4BDAE00634935000000000000000000000000009F95
      9600837C7A00665D5600575D560078776F00646A69003080A00040B8E00090E0
      F00090E0F0006098B00000000000000000000000000000000000000000009F95
      9600837C7A00665D5600575D560078776F00646A69003080A00040B8E00090E0
      F00090E0F0006098B00000000000000000000000000000000000000000009F95
      9600837C7A00665D5600575D560078776F00646A69003080A00040B8E00090E0
      F00090E0F0006098B0000000000000000000C0AB9C00FEFEFE00FEFEFE00CFA5
      8700FEFEFE00FDF8F500CFA58700FBF2EC00FBF2EC00CFA58700FAE9DD00FAE9
      DD00CFA58700F9E1D200D4BDAE006349350000000000000000008E827A00A090
      9000C0B0A000E0C8B000E0C0B000C0A890009080700078776F0080C0D000A0D8
      F0006098B00000000000000000000000000000000000000000008E827A00A090
      9000C0B0A000E0C8B000E0C0B000C0A890009080700078776F0080C0D000A0D8
      F0006098B00000000000000000000000000000000000000000008E827A00A090
      9000C0B0A000E0C8B000E0C0B000C0A890009080700078776F0080C0D000A0D8
      F0006098B000000000000000000000000000C0AB9C00D5AF9600C29A7D00B28B
      6F00CFA58700BF967900B28B6F00CFA58700BF9679000940EB000535D3000535
      D300022BB800CFA58700BF96790063493500000000008E878500B0B0A000FFE8
      E000FFE0D000F0D8C000F0D0C000F0D0B000F0D0B000A0908000707069006088
      90000000000000000000000000000000000000000000000000008E878500FFF8
      F000FFF0E000E3E0CA00007F0F00D6CAAC00F0D0C000F0D0B000707069006088
      900000000000000000000000000000000000000000008E878500B0B0A000FFE8
      E000FFE0D000F0D8C000F0D0C000F0D0B000F0D0B000A0908000707069006088
      900000000000000000000000000000000000C8B3A400FEFEFE00FEFEFE00BF96
      7900FEFEFE00FEFEFE00BF967900FDF8F500FEF7F4002759F400FEF7F400FBF2
      EC000535D300FAE6DB00D0C2B50063493500AD9E9700B0A8A000FFF8F000FFF0
      E000FFE8E000FFE8E000F0D8C000F0D0C000F0D0B000F0D0B00090807000908E
      8A000000000000000000000000000000000000000000AD9E9700B0A8A000FFF8
      FF00FFF8F00000760E00007F0F0000760E00F0D0C000F0D0C00090807000908E
      8A0000000000000000000000000000000000AD9E9700B0A8A000FFF8F000FFF0
      E000FFE8E000FFE8E000F0D8C000F0D0C000F0D0B000F0D0B00090807000908E
      8A0000000000000000000000000000000000C8B3A400FEFEFE00FEFEFE00CFA5
      8700FEFEFE00FEFEFE00CFA58700FEFEFE00FDF8F5004F78F600FEFEFE00FEF7
      F4000535D300FBEAE000D0C2B5006349350099928500D0D0D000FFF8FF00FFF8
      F000FFF0E000FFF0E000F0D0C000F0D8C000F0D0C000F0D0B000C0A890007877
      6F00000000000000000000000000000000000000000099928500D0D0D000E8F5
      EB0022B33400FFF8F000098B1900FFF8F00007701400D6C5AD00C0A890007877
      6F000000000000000000000000000000000099928500D0D0D000FFF8FF00FFF8
      F000FFF0E000FFF0E000F0D0C000F0D8C000F0D0C000F0D0B000C0A890007877
      6F0000000000000000000000000000000000C8B3A400D5AF9600C29A7D00B28B
      6F00CFA58700BF967900B28B6F00CFA58700BF9679007193FB004F78F6002759
      F4000940EB00CFA58700C29A7D006349350084838300F0F0F000FFF8FF00FF9E
      8000D85F3600FFF0E000FFF0E000FF9C7A00D5562B00F0D0C000E0C0B000665D
      5600000000000000000000000000000000000000000084838300F0F0F00031DA
      47002AC83E0022B334001CA42D00159224000E801C00076E1300E0C0B000665D
      56000000000000000000000000000000000084838300F0F0F000FFF8FF00FFF8
      FF00FFF8F000FFF0E000FFF0E000FFF0E000F0D0C000F0D0C000E0C0B000665D
      560000000000000000000000000000000000C8B3A400FEFEFE00FEFEFE00BF96
      7900FEFEFE00FEFEFE00BF967900FEFEFE00FEFEFE00BF967900FEFEFE00FEF7
      F400BF967900FBF2EC00E0D8D200664D380093838300F0F0F000FF9E8000F778
      4E00F06C4100E9613400E2552700DB4A1A00D43E0D00D5582B00E0C8B0006665
      6500000000000000000000000000000000000000000093838300F0F0F000E8F5
      EB0022B33400FFF8F000098B1900FFF8F00007701400E4DBC900E0C8B0006665
      65000000000000000000000000000000000093838300F0F0F000FFF8FF00FFF8
      FF00FFF8FF00FFF0E000FFF0E000FFF0E000FFE8E000F0D8C000E0C8B0006665
      650000000000000000000000000000000000C8B3A400FEFEFE00FEFEFE00CFA5
      8700FEFEFE00FEFEFE00CFA58700FEFEFE00FEFEFE00CFA58700FDF8F500FDF8
      F500CFA58700FBF2EC00FBF2EC0063493500A4989000E0D8D000FFF8FF00FF9E
      8000D85F3900FFF8FF00FFF8F000FF9C7A00D85F3600FFE0D000C0B0A000837C
      7A000000000000000000000000000000000000000000A4989000E0D8D000FFF8
      FF00FFF8FF0000760E00007F0F0000760E00FFF8F000FFF0E000C0B0A000837C
      7A0000000000000000000000000000000000A4989000E0D8D000FFF8FF00FFF8
      FF00FFF8FF00FFF8FF00FFF8F000FFF0E000FFE8E000FFE0D000C0B0A000837C
      7A0000000000000000000000000000000000EAAA8B00EAAA8B00E9A78700E8A4
      8200E7A07D00E6997400E6997400E5936A00E48E6300E4895C00E3835300E27D
      4B00E1794500E0753F00DC723B00CE6B3A00B5A59E00B0B0B000FFF8FF00FFF8
      FF00FFF8FF00FFF8FF00FFF8F000FFF8F000FFF0E000FFE8E000A09090009F95
      96000000000000000000000000000000000000000000B5A59E00B0B0B000CFDA
      D100FFF8FF00E3EFE500007F0F00E3E7E400FFF8FF00FFF8F000A09090009F95
      960000000000000000000000000000000000B5A59E00B0B0B000FFF8FF00FFF8
      FF00FFF8FF00FFF8FF00FFF8F000FFF8F000FFF0E000FFE8E000A09090009F95
      960000000000000000000000000000000000EAAA8B00FBEAE000FBEAE000FBEA
      E000FAE9DD00FAE9DD00FAE6DB00F8AC8500F8AC8500F6A57B00F6A57B00F6A5
      7B00F6A57B00F6A57B00F59E7100CE6B3A0000000000A4989000C0C0C000FFF8
      FF00FFF8FF00FFF8FF00FFF8FF00FFF8FF00FFF8F000C0B0B0008E8785000000
      0000000000000000000000000000000000000000000000000000A4989000B0B0
      B000E0D8D000F0F0F000F0F0F000D0D0D000B0A8A000998D85008E8785000000
      00000000000000000000000000000000000000000000A4989000C0C0C000FFF8
      FF00FFF8FF00FFF8FF00FFF8FF00FFF8FF00FFF8F000C0B0B0008E8785000000
      000000000000000000000000000000000000EAAA8B00E9A78700E9A78700E7A0
      7D00E6997400E6997400E5936A00E48E6300DA845A00DA845A00D5774A00D577
      4A00D5774A00CE6B3A00CE6B3A00CE6B3A000000000000000000A4989000B0B0
      B000E0D8D000F0F0F000F0F0F000D0D8D000B0A8A000998D8500000000000000
      000000000000000000000000000000000000000000000000000000000000B5A5
      9E00A49890008E8785008483830099928500ADA2970000000000000000000000
      0000000000000000000000000000000000000000000000000000A4989000B0B0
      B000E0D8D000F0F0F000F0F0F000D0D8D000B0A8A000998D8500000000000000
      000000000000000000000000000000000000A3A3A100FEFEFE008B8B8800FEFE
      FE008B8B8800FEFEFE008B8B8800FEFEFE008B8B8800FEFEFE006E726F00FEFE
      FE0063636300FEFEFE0061615500D0D5D100000000000000000000000000B5A5
      9E00A49890008E8785008483830099928500ADA2970000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5A5
      9E00A49890008E8785008483830099928500ADA2970000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002048
      6000303040000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002048
      600030304000000000000000000000000000000000000000000000000000FF6D
      24007C5400007C5400000000000000000000000000000000000000000000A4A0
      A00000000000000000000000000000000000000000000000000000000000FF6C
      6C000000000000000000000000000000000000000000FF6D24007C5400007C54
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000305060004088
      A0003090B0003040500000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000305060004088
      A0003090B000304050000000000000000000000000000000000000000000FF6D
      2400FF8548007C54000000000000000000000000000000000000A4A0A0007C54
      000000000000000000000000000000000000000000000000000000000000FF6D
      24008585850000000000000000000000000000000000FF6D2400FF8548007C54
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000305060003088B00040B8
      E00090E0F00090D0E0006090A000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000305060003088B00040B8
      E00090E0F00090D0E0006090A00000000000000000000000000000000000FF6D
      2400FF8548009B690000000000000000000000000000A4A0A000FF6D24007C54
      000000000000000000000000000000000000000000000000000000000000FF6D
      24007C54000085858500000000000000000000000000FF6D2400FF8548009B69
      0000000000000000000000000000000000000000000000000000000000009F95
      9600837C7A00665D5600575D560078776F00646A69003080A00040B8E00090E0
      F00090E0F0006098B0000000000000000000000000000000000000000000ADAF
      B0008A8B8B0067605800586059007B827D00687576003080A00040B8E00090E0
      F00090E0F0006098B0000000000000000000000000000000000000000000FF85
      4800FF9D6C009B6900000000000000000000A4A0A000FF6D2400FF6D24009B69
      000000000000000000000000000000000000000000000000000000000000FF85
      4800FF8548007C540000FF9D6C000000000000000000FF854800FF9D6C009B69
      00000000000000000000000000000000000000000000000000008E827A00A090
      9000C0B0A000E0C8B000E0C0B000C0A890009080700078776F0080C0D000A0D8
      F0006098B000000000000000000000000000000000000000000096918C00A090
      9000C0B0A000E0C8B000E0C0B000C0A89000908070007C7E7F0080C0D000A0D8
      F0006098B000000000000000000000000000000000000000000000000000FF85
      4800FF9D6C009B69000000000000A4A0A000FF6D2400FF6D2400FF6D24009B69
      000000000000000000000000000000000000000000000000000000000000FF85
      4800FF854800D94600007C5400008585850000000000FF854800FF9D6C009B69
      000000000000000000000000000000000000000000008E878500B0B0A000FFE8
      E000FFE0D000F0D8C000F0D0C000F0D0B000F0D0B000A0908000707069006088
      9000000000000000000000000000000000000000000097979800B0B0A000FFE8
      E000FFE0D000F0D8C000F0D0C000F0D0B000F0D0B000A0908000737A75006088
      900000000000000000000000000000000000000000000000000000000000FF85
      4800FF9D6C009B690000A4A0A000FF854800FF9D6C00FF854800FF6D24009B69
      000000000000000000000000000000000000000000000000000000000000FF85
      4800FF9D6C00FF6D2400D94600007C54000080808000FF854800FF9D6C009B69
      000000000000000000000000000000000000AD9E9700B0A8A000FFF8F000FFF0
      E000FFE8E0008060500080605000F0D0C000F0D0B000F0D0B00090807000908E
      8A0000000000000000000000000000000000BFBCBA00B0A8A000FFF8F000FFF0
      E000FFE8E000FFE0D000F0D8C000F0D0C000F0D0B000F0D0B0009080700096A0
      A10000000000000000000000000000000000000000000000000000000000FF85
      4800FF9D6C00BA7E0000FF854800FFB59000FFB59000FF9D6C00FF8548009B69
      000000000000000000000000000000000000000000000000000000000000FF85
      4800FFB59000FF9D6C00FF6D2400D94600009B690000FF854800FF9D6C00BA7E
      00000000000000000000000000000000000099928500D0D0D000FFF8FF00FFF8
      F000FFF0E0008068500080605000F0D8C000F0D0C000F0D0B000C0A890007877
      6F0000000000000000000000000000000000A3A39800D0D0D000FFF8FF00FFF8
      F000FFF0E000FFE8E000FFE0D000F0D8C000F0D0C000F0D0B000C0A890007B82
      7D0000000000000000000000000000000000000000000000000000000000FF85
      4800FFB59000FF854800F0CAA600FF854800FFB59000FFB59000FF854800BA7E
      000000000000000000000000000000000000000000000000000000000000FF85
      4800FFB59000FF9D6C00FF9D6C00FF854800FFB59000FF854800FFB59000FF85
      48000000000000000000000000000000000084838300F0F0F000FFF8FF00A088
      7000A080700090786000907060008068500080605000F0D0C000E0C0B000665D
      56000000000000000000000000000000000085868600F1F3F400FFF8FF00A088
      7000A080700090786000907060008068500080605000F0D0C000E0C0B0006760
      580000000000000000000000000000000000000000000000000000000000FF9D
      6C00FFB59000FF85480000000000F0CAA600FF854800FFB59000FF9D6C00FF85
      480000000000000000000000000000000000000000000000000000000000FF9D
      6C00FFB59000FFB59000FF854800FFB5900000000000FF9D6C00FFB59000FF85
      48000000000000000000000000000000000093838300F0F0F000FFF8FF00A090
      8000A0908000A0887000908070009070600080685000F0D8C000E0C8B0006665
      65000000000000000000000000000000000095868600F0F0F000FFF8FF00A090
      8000A0908000A0887000908070009070600080685000F0D8C000E0C8B0006767
      670000000000000000000000000000000000000000000000000000000000FF9D
      6C00F0CAA600FF8548000000000000000000F0CAA600FF854800FFB59000FF85
      480000000000000000000000000000000000000000000000000000000000FF9D
      6C00FFB59000FF854800FFB590000000000000000000FF9D6C00F0CAA600FF85
      480000000000000000000000000000000000A4989000E0D8D000FFF8FF00FFF8
      FF00FFF8FF00A0908000A0887000FFF0E000FFE8E000FFE0D000C0B0A000837C
      7A0000000000000000000000000000000000ADA8A300E0D8D000FFF8FF00FFF8
      FF00FFF8FF00FFF8FF00FFF8F000FFF0E000FFE8E000FFE0D000C0B0A0008688
      880000000000000000000000000000000000000000000000000000000000FF9D
      6C00F0CAA600FF854800000000000000000000000000F0CAA600FF854800FF85
      480000000000000000000000000000000000000000000000000000000000FF9D
      6C00FF854800FFB59000000000000000000000000000FF9D6C00F0CAA600FF85
      480000000000000000000000000000000000B5A59E00B0B0B000FFF8FF00FFF8
      FF00FFF8FF00A0908000A0908000FFF8F000FFF0E000FFE8E000A09090009F95
      960000000000000000000000000000000000C6C4C100B0B0B000FFF8FF00FFF8
      FF00FFF8FF00FFF8FF00FFF8FF00FFF8F000FFF0E000FFE8E000A0909000A6AC
      AA0000000000000000000000000000000000000000000000000000000000FF9D
      6C00FF9D6C00FF9D6C0000000000000000000000000000000000B8B8B800FF85
      480000000000000000000000000000000000000000000000000000000000FF9D
      6C00F0CAA60000000000000000000000000000000000FF9D6C00FF9D6C00FF9D
      6C000000000000000000000000000000000000000000A4989000C0C0C000FFF8
      FF00FFF8FF00FFF8FF00FFF8FF00FFF8FF00FFF8F000C0B0B0008E8785000000
      00000000000000000000000000000000000000000000ADA8A300C6C4C100FFF8
      FF00FFF8FF00FFF8FF00FFF8FF00FFF8FF00FFF8F000C0B0B000979798000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B8B8
      B80000000000000000000000000000000000000000000000000000000000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4989000B0B0
      B000E0D8D000F0F0F000F0F0F000D0D8D000B0A8A000998D8500000000000000
      0000000000000000000000000000000000000000000000000000ADA8A300ADAF
      B000E0D8D000F1F3F400F0F0F000D0D8D000B0A8A0009E9A9500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5A5
      9E00A49890008E8785008483830099928500ADA2970000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C3C1
      BE00ADA8A300958D8600858686009E9F9500B8BAB40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000806850008060
      5000806050007060500070584000705840007050400070504000604830006048
      3000604830000000000000000000000000000000000000000000000000000000
      000000000000CBA9A100C7A5A100BE959000744224008A4E2C00D2A895000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0898100E0D0C000B0A0
      9000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A0
      9000B0A090006048300000000000000000000000000000000000D5B5AA00B98A
      8200C18D8100DFB2A100FCF4EE00AC7872005E351D0064391F00744224000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4A0A0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A4A0A00000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8A69A00B1999100FFE8E000FFF8
      F000FFF0E000FFE8E000F0D8D000F0D0B000F0C0A00000A0000000A0000000A0
      00007058400060483000836C59000000000000000000C7A5A100CE968300EEB8
      9D00F7C8AE00F6CEB800FEF6F100AC7872001D769D001F7FAA001F7FAA000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A0A0007C5400000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF6D2400A4A0A000000000000000000000000000000000000000
      000000000000000000000000000000000000B0908100E0D8D000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF0F000F0E0E000F0D8C00000FF100000FFB00000A0
      00008068500070504000604830000000000000000000C7A5A100F7BB9900F8C0
      A200F7C8AE00F6CEB800FEF6F100AC7872005DB6D5005EC3E400189DC9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4A0A000FF6D24007C5400000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF6D24007C540000A4A0A0000000000000000000000000000000
      000000000000000000000000000000000000B0908100F0E8E000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0E8E00000FF100000FF100000A0
      00009070600070605000604830000000000000000000C7A5A100F8BB9900F7C0
      A200F7C8AE00F6CEB800FEF6F100AC78720069BBD60073CBE70046B1D400E0AD
      8E00E7681C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A4A0A000FF6D2400FF6D24009B6900000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF854800FF8548007C540000A4A0A00000000000000000000000
      000000000000000000000000000000000000B0988000D0C0B000D0B8B000C0B0
      A000B0A09000B0988000A0898100908070009070600080686000806050007058
      50009080700080686000705840000000000000000000C7A5A100F8BB9900C18D
      8100B3807800F6CEB800FEF6F100AC78720087C7DB00A1DDEF00AFB0A400E55C
      0A00E55701000000000000000000000000000000000000000000000000000000
      00000000000000000000A4A0A000FF6D2400FF6D2400FF6D24009B6900000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF854800FF854800D94600007C540000A4A0A000000000000000
      000000000000000000000000000000000000C0A09000FFF8F000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000FFF0F000F0F0F000F0E8
      E000A089810090786000806050000000000000000000C7A5A100F7BB9900AC78
      7200FFFFFF00F6CEB800FEF6F100AC787200A3D4E200D4C4B200E5570100E557
      0100E5570100E5570100E5570100E55701000000000000000000000000000000
      000000000000A4A0A000FF854800FF9D6C00FF854800FF6D24009B6900000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF854800FF9D6C00FF6D2400D94600007C540000A4A0A0000000
      00000000000000000000000000000000000000000000B0988000D0B0A000C0A8
      A000D0B0A000C0A09000B0908100A08070009070600080605000706050008070
      6000B0A09000A0887000806050000000000000000000C7A5A100F7BB9900D29C
      8A00AC787200F6CEB800FEF6F100AC787200BBDFE900E5570100E5570100E557
      0100E5570100E5570100E5570100E55701000000000000000000000000000000
      0000ABABAB00FF854800FFB59000FFB59000FF9D6C00FF8548009B6900000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF854800FFB59000FF9D6C00FF6D2400D94600009B690000A4A0
      A000000000000000000000000000000000000000000000000000C0B0A000E0C8
      C000FFFFFF00FFFFFF00FFF8FF00FFF0F000F0F0E000F0E0E000C0A8A0008060
      5000A0908000C0B0A000806050000000000000000000C7A5A100F8BB9900F7C0
      A200F7C8AE00F6CEB800FEF6F100AC787200BFE0E900E4B29100E55C0A00E558
      0200E5570100E5570100E5570100E55701000000000000000000000000000000
      000000000000F0CAA600FF854800FFB59000FFB59000FF854800BA7E00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF854800FFB59000FF9D6C00FF9D6C00FF854800F0CAA6000000
      000000000000000000000000000000000000000000000000000000000000C0B0
      A000FFFFFF00F0E0E000D0C8C000D0C8C000D0B8B000D0C0B000E0D0D0008068
      600080605000B1999100B0A090000000000000000000C7A5A100F8BB9900F7C0
      A200F7C8AE00F6CEB800FEF6F100AC787200B7DBE400D7F1F700CAAD9400E55C
      0A00E5570100DFCABC00D9BDAC00DEC5B6000000000000000000000000000000
      00000000000000000000F0CAA600FF854800FFB59000FF9D6C00FF8548000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9D6C00FFB59000FFB59000FF854800F0CAA600000000000000
      000000000000000000000000000000000000000000000000000000000000D0B9
      A800F0E8E000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF0F000F0D8D000D0B8
      B00080605000AD948900000000000000000000000000C7A5A100F7BB9900F7C0
      A200F7C8AE00F6CEB800FEF6F100AC787200B2D7E100C5EAF40083CBE200E4A6
      8000E55802000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F0CAA600FF854800FFB59000FF8548000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9D6C00FFB59000FF854800F0CAA60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D0B8B000FFFFFF00F0F0F000D0C8C000D0C8C000D0B8B000C0B0B000E0D8
      D0008070600080605000000000000000000000000000C7A5A100C7908100EAB3
      9A00F7C8AE00F6CEB800FEF6F100AC787200B8D9E200C5EAF4002CA5CE00C9A0
      8600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0CAA600FF854800FF8548000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9D6C00FF854800F0CAA6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFCECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0E0
      E000D0B8B00080605000C7B1A90000000000000000000000000000000000B98A
      8200C18D8100E5BAA700FEF6F100AC7872000A8FBB000A97C6000A97C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B8B8B800FF8548000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9D6C00B8B8B800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D0C0B000D0C0B000D0C0B000D0B8B000D0C0B000D0C0
      B000D0C0B000D0C0B00000000000000000000000000000000000000000000000
      000000000000B98A8200BE959000BE959000C9977D00C9977D00CC997F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8B8B80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000C0686000B058
      5000A0505000A0505000A0505000904850009048400090484000804040008038
      4000803840007038400070383000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BBAAA300393037003028300030283000302830003028
      3000302830003028300030283000000000000000000000000000000000000000
      0000976C5700976C5700976C57007E5645008D5F4C00F4D50400F5940000F4E2
      0100DF940500976C5700976C57007F7F7F0000000000D0687000F0909000E080
      8000B048200040302000C0B8B000C0B8B000D0C0C000D0C8C00050505000A040
      3000A0403000A038300070384000000000000000000000000000000000000000
      00000000000000000000C0704000B0583000B0583000A0502000A05020009048
      20009048200090402000804020000000000060483000B9A59C00000000000000
      000000000000B59F980060483000B0B0B000B0B0B000B0A8A000A0A0A000A098
      9000909090008070700030303000000000000000000000000000000000000000
      0000976C5700FEFEFE00F5EAE400F0D10800F4D50400FFA50000FF7C0000FF89
      0000FF98000094705A00976C57007F7F7F0000000000D0707000FF98A000F088
      8000E0808000705850004040300090787000F0E0E000F0E8E00090807000A040
      3000A0404000A040300080384000000000000000000000000000000000000000
      00000000000000000000C0785000FFF8F000D0B0A000D0B0A000D0B0A000C0B0
      A000C0A8A000C0A890009040200000000000A088800060483000A0888000C8B4
      AD00988272007058500070504000E0E0E000F0D8C000F0D0C000F0C8C000F0C8
      B000F0C0B0009088800030283000000000000000000000000000000000000000
      00009D715B00FEE6DA00F5BEA400DE7E1000FF980000F5910800D59B6100E7A0
      5000FFA50000D8920F00A67760007F7F7F0000000000D0787000FFA0A000F090
      9000F0888000705850000000000040403000F0D8D000F0E0D00080786000B048
      4000B0484000A040400080404000000000000000000000000000000000000000
      00000000000000000000D0886000FFFFFF00E0906000D0805000D0805000D080
      5000D0805000C0A8A0009048200000000000C0A89000C0C0C000807060007060
      5000B0A09000B0A8A00070584000F0F0F000F0D8D000F0D8C000F0D0C000F0C8
      C000F0C8B0009088800030283000000000000000000000000000000000000000
      0000A0735D00FEDDCC00BC6A2A00FB810100E6A20B00EEAC8A00F9B49200E5AC
      8300FFE828009A615700AD7D65007F7F7F0000000000D0788000FFA8B000FFA0
      A000F0909000705850007058500070585000705850007060500080686000C058
      5000B0505000B04840008040400000000000B0A0900060483000604830006048
      30006048300060483000D0907000FFFFFF00FFFFFF00FFF0F000F0E0D000F0D0
      C000F0C0B000C0B0A0009048200000000000C0A89000FFFFFF00DFE5DD00C0C8
      C000B0B0B000B0A8A00070584000F0F0F000F0E0D000F0D8D000F0D8C000F0D0
      C000F0C8C0009088900030303000000000000000000000000000000000000000
      000089574600F7F1EF00E4A21800FFE60000CCA28D00FDCFB700F4C6B000CCB1
      4800FFE90D00A4765100996D58007F7F7F0000000000E0808000FFB0B000FFB0
      B000FFA0A000F0909000F0888000E0808000E0788000D0707000D0687000C060
      6000C0585000B05050009048400000000000B0A09000FFF0F000F0E0D000E0D8
      D000E0D0C000E0C8C000E0A08000FFFFFF00F0A88000E0987000E0906000D080
      5000D0805000D0B0A000A048200000000000C0A8A000FFF8FF00F0F0F000E0E0
      E000C0C0C000A0A0A00070605000F0F0F000FFE8E000F0E0D000F0D8D000F0D8
      C000F0D0C0009090900030303000000000000000000000000000000000000000
      0000E8650600AF503800E4620C00FFB80100BA7B2700AC7C7400D06B3000FFDD
      1400C8833200FEFEFE00976C57007F7F7F0000000000E0889000FFB8C000FFB8
      B000D0606000C0605000C0585000C0504000B0503000B0483000A0402000A038
      1000C0606000C05850009048400000000000B0A09000FFF8F000E0B08000E0A0
      7000E0A07000D0987000E0A89000FFFFFF00FFFFFF00FFFFFF00FFF8F000F0E8
      E000F0D0C000D0B0A000A050200000000000C0B0A000FFF8FF00F0F0F000E0E0
      E000D0D8D000A0A0A00080686000F0F0F000FFF0F000FFE8E000F0E0D000F0D8
      D000F0D8C0009090900030303000000000000000000000000000CB725100EE65
      0800FF210000FF160000FF000000FDD40000FFE60000FEAE0000F5BA0000CE97
      2100DAB19A00FEFEFE00976C57007F7F7F0000000000E0909000FFC0C000D068
      6000FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000E0D0C000E0C8
      C000A0381000C06060009048500000000000C0A89000FFFFFF00FFF8F000F0F0
      F000F0E8E000F0E0D000E0B8A000FFFFFF00FFB09000FFB09000F0D8D000E090
      6000B0583000B0583000A050200000000000C0B0A000F0F8F000F0F0F000F0F0
      F000D0D8D000B0B0B00080706000F0F0F000FFF0F000FFF0E000FFE8E000F0E0
      D000F0D8D000A098900030303000000000000000000000000000C2645C00FF21
      0000B93B1500F3DCD400F5531500D4131200C9B22A00C9AF6100B9995900FEDD
      CC00FEDDCC00FEFEFE00976C57007F7F7F0000000000E098A000FFC0C000D070
      7000FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000E0D0
      C000A0402000D0686000A050500000000000C0A8A000FFFFFF00FFC8A000F0B8
      9000E0B08000E0A07000F0C0A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F098
      7000F0C8B000B0583000C9A3940000000000D0B0A000F0F0F000F0F0F000F0F0
      F000E0D8E000C0C0C00090786000F0F0F000FFF8F000FFF0F000FFF0E000F0E8
      E000F0E0D000A0989000303030000000000000000000CB676300FF1E0000AB63
      4B00976C5700FEFEFE00F4CA5600B11F1D00FEE6DA00FFE1D100FFE1D100FEDD
      CC00FEDDCC00FEFEFE00976C57007F7F7F0000000000F0A0A000FFC0C000E078
      7000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8
      D000B0483000D0707000A050500000000000C0B0A000FFFFFF00FFFFFF00FFFF
      FF00FFF0F000F0E8E000F0C8B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0A8
      8000C0683000C9A394000000000000000000D0B8A000F0F0F000F0F0F000F0F0
      F000E0E0E000D0D8D00090786000FFFFFF00FFF8FF00FFF0F000FFF0F000FFF0
      F000FFE8E000A0A0A00030303000000000000000000000000000FB5E0500A96C
      64008D5F4C00D9644600FB760D00CBABA600FFF0EA00FFECE300FEE6DA00FFE1
      D100FEE6DA00FEFEFE00976C57007F7F7F0000000000F0A8A000FFC0C000E080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8
      E000B0503000E0788000A050500000000000D0B8B000FFFFFF00FFD8C000FFD0
      B000F0D8D000B0A09000F0C8B000F0C0B000F0C0B000F0B8A000F0B09000F0B0
      9000D0B0A000000000000000000000000000D0B8A000DFE5DD00F0F0F000F0F0
      F000F0F0F000E0E0E000A0909000B0B0B000B0B0B000B0B0B000B0A8A000A0A0
      A000A098A0009090900030303000000000000000000000000000E7561B00FF6B
      0000F5350000F5560100BD766200FFF0EA00FFF0EA00FFF0EA00FFECE300EFDE
      D600ECD9CF00FFF8F300976C57007F7F7F0000000000F0B0B000FFC0C000F088
      9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0
      F000C050400060303000B058500000000000D0C0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0A89000D0C8C00090706000BCA69C0000000000000000000000
      000000000000000000000000000000000000D1BCB100B0A8A000DFD6DD00E0E0
      E000E0E0E000A098A000C7B3AF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E688
      4400C46C1900CBA89C00FFF8F300FFF8F300FFF8F300FFF0EA00F5EAE4009470
      5A00976C5700976C5700976C57000000000000000000F0B0B000FFC0C000FF90
      9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8
      F000C0585000B0586000B058600000000000E0C0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0B0A000A0806000BCA69C000000000000000000000000000000
      00000000000000000000000000000000000000000000BBAAA300B0A09000B0A0
      9000A0989000C7B3AF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000976C5700FEFEFE00FFF8F300FFF8F300FFF8F300FFF8F300F5EAE400976C
      5700FFF3E600976C5700000000000000000000000000F0B8B000F0B8B000F0B0
      B000F0B0B000F0A8B000F0A0A000E098A000E0909000E0909000E0889000E080
      8000D0788000D0787000D070700000000000E0C0B000E0C0B000D0C0B000D0C0
      B000D0B8B000D0B0A000C7B1AA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000976C5700FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FFF8F300976C
      5700976C57000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000976C5700976C5700976C5700976C5700976C5700976C5700976C5700976C
      570000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFE00FFFFFFFFFE07FFFFFFFFFE00FF0FFF01F0010E10FF8FFF11F4982
      F18FFCFFF39F0000F10FFC7FF39FC000F00FFE7FF39F4820F10FFE3FF39F0830
      F18FFE1FF39FF9FFE10FFE0FE10FF9FFE00FFFFFE10FF9FFFFFFFFFFFFFFF9FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE001E0019FFFFFFF
      E001E001EFFF870300010001DC018703000100018FFFC78F00010001FFFFE00F
      003F003F8FFFE00F003F003FDFFFF01F003F003FEC01F01F003F003F9FFFF83F
      003F003FFFFFF83F000100018FFFF87F00010001DFFFFC7F000100019C01FCFF
      E001E001DFFFFFFFE001E001FFFFFFFFF81FFFFFF03FFFFFE007FFFFC00FFFFF
      C00300000003FFFF800100000001FF7F800100000001FF7F000000000000FEFF
      000000000000FE7F000000000000FC1F000000008000FC0F00000000C000F807
      00000000C000F80780010000C001F00380010000C003F33FC0030000E01FFFFF
      E007FFFFF07FFFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7FFE7FFE70000
      FFC3FFC3FFC30000FF81FF81FF810000E003E003E0030000C007C007C0070000
      800FC00F800F0000000F800F000F0000000F800F000F0000000F800F000F0000
      000F800F000F0000000F800F000F0000000F800F000F0000801FC01F801F0000
      C03FE07FC03F0000E07FFFFFE07F0000FFFFFFFFFFFFFFFFFFFFFFFFFFE7FFE7
      E3EFEF8FFFC3FFC3E3CFE78FFF81FF81E38FE38FE003E003E30FE18FC007C007
      E20FE08F800F800FE00FE00F000F000FE00FE00F000F000FE00FE00F000F000F
      E20FE08F000F000FE30FE18F000F000FE38FE38F000F000FE3CFE78F801F801F
      FFEFEFFFC03FC03FFFFFFFFFE07FE07FFFFFFFFFFFFFFFFFC007F81FFFFFFFFF
      8003C01FFFDFFBFF0001801FFF9FF9FF0001801FFF1FF8FF00018007FE1FF87F
      00018007FC1FF83F00018000F81FF81F80018000F01FF80FC0018000F81FF81F
      E0018000FC1FF83FE0038007FE1FF87FF003800FFF1FF8FFF801E01FFF9FF9FF
      FC03F81FFFFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800C001FFFFFC01F000
      8001FC013801F0008001FC010001F0008201FC010001F000800100010001F000
      800100010001F000800100010001C000800100010001C0008001000100018000
      800100030001C000800100070001C0008001007F01FFE001800100FF83FFF003
      800101FFFFFFF007FFFFFFFFFFFFF00F}
  end
  object iltLarge: TImageList
    Height = 24
    Width = 24
    Left = 232
    Top = 272
    Bitmap = {
      494C01010E001300040018001800FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000006000000001002000000000000090
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000066666600666666006666660066666600666666006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666007876740000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007C69600068574D0068574D0068574D0068574D0068574D006857
      4D0068574D0068574D0068574D0068574D0068574D0068574D0068574D006857
      4D0068574D005F534E00948E8900000000000000000000000000000000000000
      00000000000000000000F3F3F300E1E1E100C5C3C300BDB1B100BAA2A200CAB5
      B500D6C8C8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B2988C00CCB5AB00DDCEC600DDCEC600DDCEC600DDCEC600DDCEC600DDCE
      C600DDCEC600DDCEC600DDCEC600DDCEC600DDCEC600DDCEC600DDCEC600DDCE
      C600E3D7D1007A5D5000948E890000000000000000000000000000000000EDED
      ED00D6C8C800C1B0AC00AE938E00BE8B7D00BD847600D0937D00D89E8700E9D9
      D600947B7C00979B9D00EDEDED00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BB9E9100E3D8D300F4D0BD00F4D0BD00F2CEBA00F4D0BD00FDD2BD00FDD2
      BD00FDD2BD00FDD2BD00FDD2BD00FDD2BD00FED6C100FED6C100FED6C100FEDC
      CA00FEF5F1007D605100948E89000000000000000000E1E1E100C1B0AC00B895
      8D00AB807A00C5897700D8957A00E5A18100EFAB8900EFAB8900E3A98E00E9D9
      D600947B7C0091969600AEB1B200D9DBDB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFA49900C6B6B000D1B5AB00D1B5AB00CDAB9D00CAA69700E3B6A100FAC4
      A900FAC4A900FAC4A900FAC4A900FCC8AF00FCC8AF00FDD2BD00FED6C100FED6
      C100FEF5F1007D60510097908B0000000000ECE1E000BD847600C4867300D895
      7A00EBA58200F2AA8300D89E8700D3A29400D0A69D00CF9D9000E3A98E00E9D9
      D600647C90001C8DBA001C8DBA001C8DBA002286B100D0DEE700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BEAF
      A700BEAFA700D9BEB400D8B5A800D1A79800C99D8D00C99D8D00BF988B00DEAD
      9600FCBEA100FCBEA100FCBEA100FABEA200FABEA200FAC4A900FDD2BD00FED6
      C100FEF7F4007D60510097908B0000000000ECE0DF00D8927600D89E8700CE96
      8500D3A29400E3A38700CFA09400EACCC000F1D6C800D5A89A00E4AB9100E9D9
      D60061879D001BAADB001BAADB001BAADB00289AC500D3E5ED00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B1A59D009989
      8100A58E84009C8176008C6C5F0086655800866558008C6C5F008F7166008F79
      7000BF998700C99D8D00DEAD9600FAC4A900FAC4A900FCC8AF00FED6C100FED6
      C100FEF7F4007D60510097908B0000000000ECE0DF00D8927600D0A69D00F4DA
      CC00E0BDB200E3A38700D5A89A00F4DACC00F1D6C800D5A89A00E4AB9100E9D9
      D60061879D001BAADB001BAADB001BAADB004292B200D3D4D800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFA49900C5A69C00C6A8
      9F00C6A89F00C5A69C00C5A69C00C1A09700C1A09700BB9E9100C1A09700BF98
      8B00BF988B00BA988E00AA8E8300FDD2BD00FDD2BD00FDD2BD00FED6C100FEDC
      CA00FEF5F1007D605100A097930000000000ECE0DF00DD987A00D5A89A00F8DF
      D100E0BDB200E3A38700D5A89A00F8DFD100F1D6C800D8A99B00E3AE9800E9D9
      D60061879D001BAADB001BAADB002BA2CC00B4735D00EBB09A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CAAEA400D39A8800D570
      3D00D5764400D5764400D5755800D5764400D5764400D5764400DB784E00D576
      4400D2713C00DC9374009E877F00FEDCCA00FED6C100FEDCCA00FEDCCA00FED6
      C100FEF5F1007D605100A199940000000000ECE0DF00DD987A00D1A9A100F8DF
      D100E0BDB200DEA89200D5A89A00F4DACC00F1D6C800D1A9A100E4B09900E9D9
      D60061879D001BAADB00399DC300A9837200EB9E4800ECBC9700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CCB5AB00D38C7200DF83
      3600F17B1F00FB701300F8763400FA7A1900FA7A1900E19D43007EE66800A2CD
      6000EF741B00D8895C00A58E8400FEDCCA00FEDCCA00FEDCCA00FEDCCA00FED6
      C100FEF7F4007D605100A199940000000000ECE0DF00DD987A00D1A9A100F8DF
      D100E0BDB200E3A38700D1A9A100F4DACC00F1D6C800D9AFA300E4B09900E9D9
      D60061879D0025A5D400A1808000F1A05F00F6B96300F3A25400F8B07600FAC8
      A600FDF3ED000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CCB5AB00D1907800EF74
      1B00E2855500EE803900F5771400F18F3600F1842D00AEC96D003BDC550063CC
      5E00EB7F3300D6895F009E877F00FEDCCA00FEDCCA00FEDCCA00FEDCCA00FEDC
      CA00FEF5F1007D605100A199940000000000ECE1E000D89E8700D5A89A00F8DF
      D100E0BDB200E4AB9100D1A9A100F8DFD100EACCC000CF9D9000E3B29F00E9D9
      D600758493009B898F00F4A87700F9D3A300F9D3A300F9C98900F9B76200F7A4
      4800F69B4F00FBD2B60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CCB8AD00D4967B00CD7A
      5E00746AE3009278C900EF844800F2833100D6A64700A5E77400BCC47E00D8A7
      6900EB7F3300D58F6700A58E8400FEDCCA00FEDCCA00FEDCCA00FEDCCA00FEDC
      CA00FEF5F1007D605100A199940000000000ECE0DF00DE9C7F00D1A9A100F8DF
      D100E0BDB200E4AB9100D1A9A100F4DACC00AEACA8008F969600C9998C00E9D9
      D60081848E00BA918600F4BC8B00F9D8B300FADCB800F9D6AC00F9CF9D00F9C9
      8900F7AF5600F69B4F00FDE9DE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEBCB400D4967B00CD7F
      6100756DD2008B7CD000C184CA00D8807400D1A85A00E3A15600F0934F00F09C
      5000E5873F00D4926D00A58E8400FEDED000FEDCCA00FEDCCA00FEDCCA00FEDC
      CA00FEF5F1007D605100A199940000000000ECE0DF00DEA08500D5A89A00F8DF
      D100E0BDB200E4AB9100D1A9A100F4DACC0097B1B0007DB7BB00C9998C00E9D9
      D6006D91A1004EB4D100C5A19600F3C29C00F9C5A100FAA39400FBA79800F9BD
      9E00F8CB9500F8B25E00F8A57000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D9BEB100C69A8C00F898
      4B00EEB78E00EFA37400E5886100E8785A00F07C6300F5A27500EEA36A00EBA8
      6400E58E4B00D4947300A58E8400FEDED000FEDED000FEDCCA00FEDCCA00FEDC
      CA00FEF5F1007D605100A199940000000000ECE0DF00DEA08500D1A89E00F4DA
      CC00E0BDB200E3AE9800D1A9A100F4DACC00E3CABF00C8A09800E3B29F00E9D9
      D6007295A3003CC6E60064B6CA00CFAC9A00F6B09500F8A7A600FDBFB700FCAB
      9E00F9B79500F7BE7F00F79C5600FDE1D5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D9BEB100C1A09700FEA4
      5500FAD9AB00FCD5A900FCC99E00FABD9800FBA59C00FC9D9300F6B79B00F7BB
      8F00EDA97400D4A38200A58E8400FEDED000FEDED000FEDCCA00FEDCCA00FEDC
      CA00FEF5F1007D605100A199940000000000ECE0DF00D89E8700D5A08F00D3A2
      9400D3A29400EBB09A00D8A99B00D5A89A00D1A9A100DCB1A300E5BAA900E9D9
      D6007899A40049D0E90042CAE7005EBCD200DA968F00F5C2C50000000000FEF5
      F100FCB5A600F2AA8300F49C5E00FBBFA5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D4C3BA00CAA69900FCAF
      6600F7DDB200F8DCB600F5E0C200F3E6CC00F3D9CB00F0C6C000F6D0B600F0D3
      A400E8BB8E00DAA58B00A58E8400FEE1D100FEE1D100FEE1D100FEDED000FEE1
      D100FEF5F1007D605100A097930000000000ECE0DF00E3A38700CF9D9000CFA0
      9400D3A29400E8B8A300D5A89A00D0A69D00D5A89A00E3B29F00E5BAA900E9D9
      D6007899A40054D9ED0049D0E90049D0E90085A7B200DFBAC000000000000000
      0000FDECE800F8A48800F1965C00F9BD9E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D4C3BA00D0AFA500D79A
      6A00D6A27A00D4A38200C8AB8C00C8AB8C00C6A98F00C1A09700CD9F7800C7A0
      6F00C2967900C99D8D00AA8E8300FCEBE100FCEBE100FEE8DD00FEE8DD00FEE8
      DD00FEF7F4007D605100A097930000000000ECE1E000D89E8700D1A9A100F8DF
      D100E0BDB200E4B09900D1A9A100F1D6C800EACCC000D8B2A800E5BAA900E9D9
      D60087A5A90061E4F1005ADEEF0054D9ED0046BCD600CFE4EC00000000000000
      000000000000FCB5A600F28C5F00FAC8B8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D4C3BA00F1DED900EAD4
      CB00EAD4CB00E8D0C400E8D0C400E5C8BE00E5C8BE00E1BBB000E1BBB000E1BB
      B000D8B5A800E3B6A100A9908600FCEBE100EEDBD100EEDBD100EAD4CB00EAD4
      CB00FEF5F1007D605100A097930000000000ECE1E000E4AB9100D1A9A100F8DF
      D100E2C0B400E3B29F00D4ACA200F4DACC00F1D6C800D8B2A800E6C1B200E9D9
      D60087A5A9006BECF40061E4F1005EE1F00047C2DB00D0E9F200000000000000
      000000000000FAC5B600F5856B00FCE4DE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A89F00BAA8
      9E00B9A29500BAA89E00BEAFA700BFA49900BAA89E00BAA89E00B1A59D00B9A2
      9500B9A29500B1A59D00D9BEB100E8D0C400C18A7000BB897100BC8E7800BC8E
      7800A97A64007A645A00B2A6A10000000000ECE1E000DEA89200D0A69D00DCB1
      A300D6B1A800E5BAA900D1A9A100F4DACC00F1D6C800D8B2A800E6C1B200E9D9
      D6008DAAA90076F4F70076F4F7006BECF40042CAE700D0E9F200000000000000
      000000000000FCAB9E00FAB7AA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D5BAAD00EBE2DE00FEF5F100FEF7F400FEF7F400FEF5F100FEF5F100FEF5
      F100FEF5F100FDF2ED00FDF2ED00E8D0C400DAA58B00FAC4A900F3D9CB00CAB0
      A300846A5E00B2A6A1000000000000000000ECE1E000BE8B7D00DEA89200E5BA
      A900E5BAA900F1C6B000DCB1A300D1A9A100D6B1A800D6B1A800E6C1B200E9D9
      D6008DAAA9007DFAF90076F4F70076F4F7004DD1E400D0E9F200000000000000
      000000000000FDE8E40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CAB0A300E3D8D300FEF7F400FEF7F400FEF7F400FEF7F400FEF7F400FEF5
      F100FEF5F100FEF5F100FEF5F100EAD4CB00E0AD9400FEE1D100D9BEB100846A
      5E00B1A59D0000000000000000000000000000000000FBF9F900DCC7C600C7A7
      A600CF9D9000D5A89A00E5BAA900F0CBBA00E8C4B600E6C1B200E6C4B700E9D9
      D6008996A0006BC0DC006BC0DC006BC0DC006BC0DC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CAB0A300E3D8D300FEFCFA00FEFCFA00FEF7F400FEFCFA00FEF7F400FEF7
      F400FEF5F100FEF5F100FEF5F100EFD9CF00D8B5A800D1B5AB00846A5E00B7AB
      A600000000000000000000000000000000000000000000000000000000000000
      0000F4ECEB00E5D7D600D1A9A100BF958E00C8A09800E6C1B200E6C4B700E9D9
      D600CEB8B8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CAB0A300E3D8D300FEFCFA00FEFCFA00FEFCFA00FEFCFA00FEFCFA00FEFC
      FA00FEFCFA00FEFCFA00FEFCFA00EEDBD100C2967900846A5E00BEAFA7000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ECE1E000D7BFBD00C9AEAD00D7BE
      BA00E7DBDA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CCB5AB00A9867500B0908000B0908000B0908000B0908000B0908000B090
      8000B0908000B0908000B0908000AD89780080655800B2A6A100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CDD6DB00718F9F006E8D
      9E00B8C5CC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CDD6DB00718F9F006E8D
      9E00B8C5CC000000000000000000000000000000000000000000000000000000
      0000000000006865650068656500686565006865650068656500686565006865
      6500686565006865650068656500686565006865650068656500686565000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AAAA
      AA00767474006D6A6A00848583008C8A8A00C9C9C90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3CDD3005A849B004494B8004494
      B8004385A700C3CDD30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3CDD3005A849B004494B8004494
      B8004385A700C3CDD30000000000000000000000000000000000000000000000
      0000000000006B686700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006B6867000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C9C9C900848583006564640076747400BDBDBD00C1C1C1007F7F
      7F00BDBDBD00F1F1F100D5D5D5009E9D9D0076747400E4E4E300EEEDED00EEED
      ED00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C3CDD3005A849B00479ABE0048AEDB0050B6
      E10045A1CA00448DB200D5DEE300F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C3CDD3005A849B00479ABE0048AEDB0050B6
      E10045A1CA00448DB200D5DEE300F1F1F10000000000B6B6B600777474006B68
      6700686565006B686700DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00686565006865
      65006B68670077747400B6B6B60000000000000000000000000000000000F1F1
      F100D5D5D5007674740096959500F1F1F100AAAAAA007F7F7F008C8A8A00605E
      5E00E0DFDF00F1F1F100F9F9F900AFB0B0008C8A8A00C9C9C900C9C9C900C9C9
      C900D5D5D5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C3CDD3005A849B00479ABE0048AEDB003FA4D40050B6
      E10067CEF1003897C70081ACC200F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C3CDD3005A849B00479ABE0048AEDB003FA4D40050B6
      E10067CEF1003897C70081ACC200F1F1F10000000000807D7C00A2A1A100DCDC
      DC00CBCBCB005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C
      5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C005C5C5C00C5C5
      C500D6D6D600A2A1A100807D7C0000000000000000000000000000000000F1F1
      F1008A868600BDBDBD00F8F8F700E4E4E300F8F7F7008C8A8A0098969600BDBD
      BD00F9F9F900E0DFDF00F8F8F7008485830096959500AAAAAA00969595007674
      74009E9D9D00DEDEDD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E5E4
      E40000000000C3CDD3005A849B00479ABE0048AEDB003FA4D40050B6E10063C9
      EE006DD4F600379BCC008BB6CE00F1F1F1000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E5E4
      E40000000000C3CDD3005A849B00479ABE0048AEDB003FA4D40050B6E10063C9
      EE006DD4F600379BCC008BB6CE00F1F1F1000000000077747400DCDCDC00ACA9
      A700ACA9A7006B686700DCDCDC00DCDCDC00D6D6D600DCDCDC00DCDCDC00D6D6
      D600DCDCDC00DCDCDC00D6D6D600DCDCDC00DCDCDC00D6D6D6006B686700ACA9
      A700AEADA900DCDCDC0077747400000000000000000000000000000000000000
      0000B4B2B20084858300F8F7F700D9D0C900E2E2E100F8F8F700F1F1F100F5EF
      EC00DEDEDD00DDDDD900EDE5E200EEEDED0072717000767474007A797900B4B2
      B20076747400C1C1C10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C3CDD3005A8093004F6C7C006185950045A1CA0050B6E10063C9EE006DD4
      F60044A9D6006BA9CA00BCCCD500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C3CDD3005A8093004F6C7C006185950045A1CA0050B6E10063C9EE006DD4
      F60044A9D6006BA9CA00BCCCD50000000000000000007A787700DCDCDC00AEAD
      A900AEADA90077747400D6D6D600AEADA900AEADA900ACA9A700AEADA900AEAD
      A900ACA9A700AEADA900AEADA90077747400777474007774740072717100AEAD
      A900AEADA900DCDCDC007A787700000000000000000000000000000000000000
      0000B4B2B20084858300C1C1C100F0EFED00D5D5D500D6D5D100DDDDD900E4E4
      E300E2E2E100E0DFDF00D9D0C900EEEDED00F5EFEC00C1C1C100F8F8F700F9F9
      F9009695950096959500F1F1F100000000000000000000000000000000000000
      0000000000009694940074747400747474007474740074747400747474007474
      7400838282005165700096949400A1A0A00073848B0065C3E7006DD4F60044A9
      D6006BA9CA00BCCCD50000000000000000000000000000000000000000000000
      0000000000009694940074747400747474007474740074747400747474007474
      7400838282005165700096949400A1A0A00073848B0065C3E7006DD4F60044A9
      D6006BA9CA00BCCCD500000000000000000000000000807D7C00EEEEED00CBCB
      CB00D1D0CC0086838200FFFFFF00D1D0CC00D6D6D600D1D0CC00D1D0CC00D6D6
      D600D1D0CC00D1D0CC00D1D0CC008F8D8B00FFFFFF008F8D8B0086838200D1D0
      CC00D1D0CC00EEEEED00807D7C000000000000000000D5D5D500948E8C009190
      8E009695950084858300F9F9F900D6CFCC00D6D5D100F1F1F100F8F8F700E2E2
      E100E2E2E100F8F8F700F9F9F900D5D5D500DDDDD900F0EFED00DCD6D600E4E4
      E300F1F1F1006D6A6A00F1F1F10000000000000000000000000000000000BDBC
      BC00747474008C8A8800C2C2C200E9E9E900E9E9E900E9E9E900E9E9E900C2C2
      C2008C8A880074747400C2C2C200E9E9E900ABAAAA007FA3AF0044A9D6006BA9
      CA00BCCCD500000000000000000000000000000000000000000000000000BDBC
      BC00747474008C8A8800C2C2C200E9E9E900E9E9E900E9E9E900E9E9E900C2C2
      C2008C8A880074747400C2C2C200E9E9E900ABAAAA007FA3AF0044A9D6006BA9
      CA00BCCCD5000000000000000000000000000000000086838200FFFFFF00D6D6
      D600D6D6D600928F8D00FFFFFF00DCDCDC00DDDCD900DCDCDC00DCDCDC00DDDC
      D900DDDCD900DDDCD900DCDCDC00ACA9A700AAA7A300AAA7A300928F8D00D6D6
      D600D6D6D600FFFFFF008988850000000000000000009E9D9D00A9A6A500BDBD
      BD0096959500F1F1F100EDE5E200C9C9C900F9F9F900C3C0BF00767474008C8A
      8A008C8A8A0072717000BDBDBD00F9F9F900D5D5D500D6D5D100E1DAD300F9F9
      F900B4B2B2007F7F7F00F1F1F100000000000000000000000000C2C2C2007474
      7400B6B5B500E5E4E400C2C2C200B6B5B500B0AEAA00B0AEAA00B6B5B500C2C2
      C200E5E4E400B6B5B50074747400C9C9C900ABAAAA00648DA3006BA9CA00BCCC
      D500000000000000000000000000000000000000000000000000C2C2C2007474
      7400B6B5B500E5E4E400C7C5C200B6B5B500B0AEAA00B0AEAA00B7B6B300C7C5
      C200E5E4E400B6B5B50074747400CACACA00ABAAAA00648DA3006BA9CA00BCCC
      D50000000000000000000000000000000000000000008F8D8B00FFFFFF00DDDC
      D900DDDCD90098979400FFFFFF00E2E1E000E6E4E300E6E4E300E6E4E300E6E4
      E300E6E4E300E6E4E300E6E4E300E2E1E000E6E4E300FFFFFF009B9A9700DDDC
      D900D6D5D200FFFFFF008F8D8B0000000000000000008C8A8A00DEDEDD00F1F1
      F100F9F9F900E4E4E300C1C1C100F8F8F700C1C1C10096959500000000000000
      0000000000000000000084858300BDBDBD00F8F8F700D6D5D100F1F1F1009896
      960084858300C8C8C600EEEDED000000000000000000000000007E7C7B00B6B5
      B500E0DFDF00B0AEAA00D5CBC300F7E6DE00FCEBE300FCEBE300F7E6DE00E0DF
      DF00D5CBC300E0DFDF00B6B5B5007E7C7B006185950069A4C300BCCCD5000000
      00000000000000000000000000000000000000000000000000007E7C7B00B6B5
      B500E0DFDF00B0AEAA00D5CBC300F7E6DE00FCEBE300FCEBE300F7E6DE00D5CB
      C300B0AEAA00E0DFDF00B6B5B5007E7C7B006185950069A4C300BCCCD5000000
      0000000000000000000000000000000000000000000096959200FFFFFF00DDDC
      D900DDDCD900A4A39F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A39F00DCDC
      DC00DDDCD900FFFFFF009695920000000000000000008A868600F1F1F100F0EF
      ED00DEDEDD00DCD6D600D6CFCC00F8F7F700807F7E0000000000000000000000
      00000000000000000000000000007A797400F1F1F100D5D5D500F8F7F700A2A1
      A10096959500AAAAAA00D5D5D50000000000E9E9E900C2C2C20096949400E5E4
      E400ADAAA700EBD7CC00FAE2D600FAE2D600FADED000FAD9C900FAE2D600C86F
      A600C16EA800C9C9C900E5E4E4009694940096949400BCCCD500000000000000
      000000000000000000000000000000000000E9E9E900C2C2C20096949400E5E4
      E400ADAAA700EBD7CC00FAE2D600FAE2D600FADED000FAD9C900F8D4C100FAD9
      C900EBD7CC00ABAAAA00E5E4E4009694940096949400BCCCD500000000000000
      00000000000000000000000000000000000000000000A4A39F00FFFFFF00DDDC
      D900E2E1E000B0ADAA00AEADA900B0ADAA00AEADA900AEADA900AEADA900AEAD
      A900B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00AEADA900DDDC
      D900E6E4E300FFFFFF009B9A97000000000000000000948E8C00C9C9C900EEED
      ED00F8F8F700DEDEDD00EDE5E200E4E4E300948E8C0000000000000000000000
      00000000000000000000000000008C8A8A00E4E4E300DDDDD900EDE5E200C8C8
      C600767474008C8A8A009E9D9D0000000000E9E9E9008C8A8800C9C9C900BDBC
      BC00CFBEB200FAD9C900FAE2D600F8D4C100F8CAB100FAD9C900C6649500C664
      9500C76BA000E0D5CD00C0BDBB00C9C9C9008C8A8800E5E4E400000000000000
      000000000000000000000000000000000000E9E9E9008C8A8800CACACA00BDBC
      BC00CFBEB200FAD9C900FAE2D600F8D4C100F8CAB100F8C7AD00F5C2A900F8C2
      A600F8D1BC00CFBEB200C0BDBB00CACACA008C8A8800E5E4E400000000000000
      00000000000000000000000000000000000000000000A2A1A100FFFFFF00EEEE
      ED00E6E4E3007A787700FFFFFF00FFFFFF00EAEAE900EAEAE900EAEAE900EAEA
      E900EAEAE900EAEAE900EAEAE900EAEAE900FFFFFF00FFFFFF007A787700DCDC
      DC00E6E4E300FFFFFF00A4A39F000000000000000000D5D5D500AAAAAA008887
      8300D5D5D500EEEDED00E4E4E300EEEDED008C8A8A0000000000000000000000
      000000000000000000000000000088878300E8E8E700DEDEDD00C9C4BE00F9F9
      F900E8E8E700C9C9C9008485830000000000E9E9E9008C8A8800E9E9E900A1A0
      A000F2CEB900FAD9C900F8CAB100F7BA9C00F9D1BE00C7608F00C7608F00C760
      8F00F8D4C100F2CEB900A1A0A000F1F1F10083828200E9E9E900000000000000
      000000000000000000000000000000000000E9E9E9008C8A8800E9E9E900A1A0
      A000F2CEB900FAD9C900F8CAB100F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA
      9C00F5BDA100F2CEB900A1A0A000F1F1F10083828200E9E9E900000000000000
      00000000000000000000000000000000000000000000B6B6B600D1D0CC00FFFF
      FF00FFFFFF00807D7C00FFFFFF00FFFFFF00EEEEED00EEEEED00EEEEED00EEEE
      ED00EEEEED00EEEEED00EEEEED00EEEEED00FFFFFF00FFFFFF00807D7C00CBCB
      CB00FFFFFF00D6D6D600BBBAB7000000000000000000E4E4E300C1C1C100A9A6
      A500B1B0AC00F9F9F900E2E2E100F8F7F70088878300D5D5D500000000000000
      00000000000000000000D5D5D50084858300F1F1F100D6CFCC00C8C8C600C3C0
      BF00E2E2E100F1F1F1008485830000000000E9E9E9008C8A8800E9E9E900A39E
      9A00F5C8AF00F8CAB100F7BA9C00F9D1BE00C7608F00C7608F00C7608F00F9D1
      BE00F7BA9C00F5C8AF00A39E9A00F1F1F1008C8A8800E9E9E900000000000000
      000000000000000000000000000000000000E9E9E9008C8A8800ECECEC00A39E
      9A00F5C8AF00F8CAB100F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA
      9C00F7BA9C00F5C8AF00A39E9A00F1F1F1008C8A8800E9E9E900000000000000
      0000000000000000000000000000000000000000000000000000BBBAB700B0AD
      AA00B0ADAA0086838200FFFFFF00FFFFFF00F1F1F000F1F1F000F1F1F000F1F1
      F000F1F1F000F1F1F000F1F1F000F1F1F000FFFFFF00FFFFFF0086838200B0AD
      AA00B0ADAA00C9C9C600000000000000000000000000DEDEDD00B4B2B2009E9D
      9D00AAAAAA00F9F9F900E0DFDF00F8F8F700D6CFCC0091908E00C9C9C9000000
      000000000000C1C1C10091908E00C8C7C800F1F1F100BEBCB900E4E4E300F8F8
      F700F6F5F500DDDDD9009E9D9D0000000000E9E9E900918E8C00E9E9E9009A98
      9500F4C0A300F7BA9C00F9D1BE00C7608F00C7608F00C7608F00F9D1BE00F7BA
      9C00F9D1BE00F5BDA1009A989500F1F1F100918E8C00E9E9E900000000000000
      000000000000000000000000000000000000E9E9E900918E8C00E9E9E9009A98
      9500F4C0A300F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA
      9C00F8D1BC00F5BDA1009F9A9600F1F1F100918E8C00E9E9E900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F8D8B00FFFFFF00FFFFFF00F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500FFFFFF00FFFFFF00898885000000
      00000000000000000000000000000000000000000000D0D0CD00A9A6A500C8C8
      C600F9F9F900EEEDED00E2E2E100E4E4E300F9F9F900D6CFCC0091908E009190
      8E008C8A8A00948E8C00C9C9C900F9F9F900D0CEC900E2E2E100F1F1F100A2A1
      A100C1C1C100AAAAAA00BDBDBD0000000000F1F1F10096949400E9E9E9009A98
      9500ECB49700F9D1BE00C7608F00C7608F00C7608F00F9D1BE00F7BA9C00F8D4
      C100F7E6DE00ECB497009A989500FBFBFB0093928F0000000000000000000000
      000000000000000000000000000000000000F1F1F10096949400E9E9E9009A98
      9500ECB49700F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA9C00F7BA9C00F8D4
      C100F7E6DE00ECB497009A989500FBFBFB0093928F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000928F8D00FFFFFF00FFFFFF00F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500FFFFFF00FFFFFF00928F8D000000
      00000000000000000000000000000000000000000000E4E4E300AAAAAA00F9F9
      F900EEEDED00E4E4E300F8F8F700EDE5E200E4E4E300F9F9F900F9F9F900EEED
      ED00EEEDED00F9F9F900F9F9F900EDE5E200EEEDED00F9F9F90098979300BAB8
      B500C3C0BF00AAAAAA00F1F1F10000000000F1F1F100A1A0A000D6D6D500B0AE
      AA00C09F8C00F2CEB900C7669800C7689A00FAD9C900F8D4C100F7E6DE00FDF1
      EC00F5C2A900C09F8C00B6B5B500D9D9D900A1A0A00000000000000000000000
      000000000000000000000000000000000000F1F1F100A1A0A000D6D6D500B0AE
      AA00C09F8C00F2B49400F8C7AD00F8CAB100F8CAB100F8D4C100F7E6DE00FDF1
      EC00F5C2A900C09F8C00B7B6B300D9D9D900A1A0A00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000098979400FCEFE800FCEFE800FBE5DC00FBE5DC00FBE5DC00FBE5
      DC00FBE5DC00FBE5DC00FBE5DC00FBE5DC00FCEFE800FCEFE800989794000000
      0000000000000000000000000000000000000000000000000000D6CFCC00BDBD
      BD00F9F9F900F9F9F900DEDEDD00F9F9F900F1F1F100E4E4E300EEEDED00EEED
      ED00EEEDED00EEEDED00E4E4E300E8E8E700F9F9F900D8D7D300A1A09B00C1C1
      C100E8E8E70000000000000000000000000000000000E9E9E900B0AEAA00E5E4
      E40096949400DCA28200F7CEBA00F7E6DE00FCEBE300FDF1EC00FCEBE300F5BD
      A100DCA2820096949400E9E9E900B0AEAA00F1F1F10000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900B0AEAA00E5E4
      E40096949400DCA28200F2B49400FAD9C900FCEBE300FDF1EC00FCEBE300F5BD
      A100DCA2820096949400E9E9E900B0AEAA00F1F1F10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009B9A9700FCEFE800FCEFE800FBE5DC00FBE5DC00FBE5DC00FBE5
      DC00FBE5DC00FBE5DC00FBE5DC00FBE5DC00FCEFE800FCEFE8009B9A97000000
      0000000000000000000000000000000000000000000000000000EEEDED00B5B5
      AF00DEDEDD00AAA9A700AAA9A700AAA9A700F8F8F700F1F1F100EEEDED00E8E8
      E700F8F8F700F9F9F900F9F9F900F1F1F100EEEDED00F9F9F900A7A6A200C1C1
      C1000000000000000000000000000000000000000000F1F1F100ABAAAA00D6D6
      D500E5E4E400918E8C00BA937E00ED9F7500ED9F7500ED9F7500E79D7600BA93
      7E00918E8C00E5E4E400D6D6D500ABAAAA000000000000000000000000000000
      00000000000000000000000000000000000000000000F5F5F500ABAAAA00D2D0
      CF00E5E4E400918E8C00BA937E00E79D7600ED9F7500ED9F7500E79D7600BA93
      7E00918E8C00E5E4E400D2D2D100ABAAAA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A2A1A100FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800FCEF
      E800FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800A4A39F000000
      000000000000000000000000000000000000000000000000000000000000E4E4
      E300BEBCB900DEDEDD00DDDDD900B4B2B200B5B5AF00F9F9F900EEEDED00F9F9
      F900DEDEDD00BDBDBD00BAB8B500F9F9F900F1F1F100F9F9F900D8D7D300B4B2
      B200000000000000000000000000000000000000000000000000E9E9E900ADAA
      A700D2D0CF00E9E9E900B6B5B5008C8A880083828200838282008C8A8800B0AE
      AA00E9E9E900D9D9D900ADAAA700F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E9E9E900ADAA
      A700D2D2D100E9E9E900B6B5B5008C8A880083828200838282008C8A8800B0AE
      AA00E9E9E900D9D9D900ADAAA700F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ACA9A700FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800FCEF
      E800FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800FCEFE800ACA9A7000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EEEDED00BAB8B500DCD6D600F9F9F900F9F9F900F5EF
      EC009E9D9D00C8C8C600B4B2B200C9C9C900F9F9F900C3C0BF00B5B5AF00E4E4
      E30000000000000000000000000000000000000000000000000000000000F1F1
      F100B6B5B500C0BDBB00E0DFDF00FBFBFB00FBFBFB00FBFBFB00FBFBFB00E5E4
      E400C0BDBB00B0AEAA00F1F1F100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1F1
      F100B6B5B500C0BDBB00E0DFDF00FBFBFB00FBFBFB00FBFBFB00FBFBFB00E5E4
      E400C0BDBB00B0AEAA00F1F1F100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AEADA900B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0AD
      AA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA00B0ADAA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C1C1C100C8C8C600E8E8E700F8F8F700DEDE
      DD00C3C0BF00E8E8E700E4E4E300B5B5AF00A9A6A500C9C9C900EEEDED000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1F1F100E9E9E900C0BDBB00B0AEAA00B0AEAA00B0AEAA00B0AEAA00B6B5
      B500F1F1F1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1F1F100E9E9E900C0BDBB00B0AEAA00B0AEAA00B0AEAA00B0AEAA00B6B5
      B500F1F1F1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F1F1F100D6D5D100B6B4B100AAA9A700B5B5
      AF00DEDEDD000000000000000000EEEDED00F1F1F10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CDD6DB00718F9F006E8D
      9E00B8C5CC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CDD6DB00718F9F006E8D
      9E00B8C5CC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CDD6DB00718F9F006E8D
      9E00B8C5CC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CDD6DB00718F9F006E8D
      9E00B8C5CC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3CDD3005A849B004494B8004494
      B8004385A700C3CDD30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3CDD3005A849B004494B8004494
      B8004385A700C3CDD30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3CDD3005A849B004494B8004494
      B8004385A700C3CDD30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3CDD3005A849B004494B8004494
      B8004385A700C3CDD30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C3CDD3005A849B00479ABE0048AEDB0050B6
      E10045A1CA00448DB200D5DEE300F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C3CDD3005A849B00479ABE0048AEDB0050B6
      E10045A1CA00448DB200D5DEE300F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C3CDD3005A849B00479ABE0048AEDB0050B6
      E10045A1CA00448DB200D5DEE300F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C3CDD3005A849B00479ABE0048AEDB0050B6
      E10045A1CA00448DB200D5DEE300F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C3CDD3005A849B00479ABE0048AEDB003FA4D40050B6
      E10067CEF1003897C70081ACC200F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C3CDD3005A849B00479ABE0048AEDB003FA4D40050B6
      E10067CEF1003897C70081ACC200F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C3CDD3005A849B00479ABE0048AEDB003FA4D40050B6
      E10067CEF1003897C70081ACC200F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C3CDD3005A849B00479ABE0048AEDB003FA4D40050B6
      E10067CEF1003897C70081ACC200F1F1F1000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E5E4
      E40000000000C3CDD3005A849B00479ABE0048AEDB003FA4D40050B6E10063C9
      EE006DD4F600379BCC008BB6CE00F1F1F1000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E5E4
      E40000000000C3CDD3005A849B00479ABE0048AEDB003FA4D40050B6E10063C9
      EE006DD4F600379BCC008BB6CE00F1F1F1000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E5E4
      E40000000000C3CDD3005A849B00479ABE0048AEDB003FA4D40050B6E10063C9
      EE006DD4F600379BCC008BB6CE00F1F1F1000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E5E4
      E40000000000C3CDD3005A849B00479ABE0048AEDB003FA4D40050B6E10063C9
      EE006DD4F600379BCC008BB6CE00F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C3CDD3005A8093004F6C7C006185950045A1CA0050B6E10063C9EE006DD4
      F60044A9D6006BA9CA00BCCCD500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C3CDD3005A8093004F6C7C006185950045A1CA0050B6E10063C9EE006DD4
      F60044A9D6006BA9CA00BCCCD500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C3CDD3005A8093004F6C7C006185950045A1CA0050B6E10063C9EE006DD4
      F60044A9D6006BA9CA00BCCCD500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C3CDD3005A8093004F6C7C006185950045A1CA0050B6E10063C9EE006DD4
      F60044A9D6006BA9CA00BCCCD500000000000000000000000000000000000000
      0000000000009694940074747400747474007474740074747400747474007474
      7400838282005165700096949400A1A0A00073848B0065C3E7006DD4F60044A9
      D6006BA9CA00BCCCD50000000000000000000000000000000000000000000000
      0000000000009694940074747400747474007474740074747400747474007474
      7400838282005165700096949400A1A0A00073848B0065C3E7006DD4F60044A9
      D6006BA9CA00BCCCD50000000000000000000000000000000000000000000000
      0000000000009694940074747400747474007474740074747400747474007474
      7400838282005165700096949400A1A0A00073848B0065C3E7006DD4F60044A9
      D6006BA9CA00BCCCD50000000000000000000000000000000000000000000000
      0000000000009694940074747400747474007474740074747400747474007474
      7400838282005165700096949400A1A0A00073848B0065C3E7006DD4F60044A9
      D6006BA9CA00BCCCD5000000000000000000000000000000000000000000BDBC
      BC00747474008C8A8800C2C2C200E9E9E900E9E9E900E9E9E900E9E9E900C2C2
      C2008C8A880074747400C2C2C200E9E9E900ABAAAA007FA3AF0044A9D6006BA9
      CA00BCCCD500000000000000000000000000000000000000000000000000BDBC
      BC00747474008C8A8800C2C2C200E9E9E900E9E9E900E9E9E900E9E9E900C2C2
      C2008C8A880074747400C2C2C200E9E9E900ABAAAA007FA3AF0044A9D6006BA9
      CA00BCCCD500000000000000000000000000000000000000000000000000BDBC
      BC00747474008C8A8800C2C2C200E9E9E900E9E9E900E9E9E900E9E9E900C2C2
      C2008C8A880074747400C2C2C200E9E9E900ABAAAA007FA3AF0044A9D6006BA9
      CA00BCCCD500000000000000000000000000000000000000000000000000BDBC
      BC00747474008C8A8800C2C2C200E9E9E900E9E9E900E9E9E900E9E9E900C2C2
      C2008C8A880074747400C2C2C200E9E9E900ABAAAA007FA3AF0044A9D6006BA9
      CA00BCCCD5000000000000000000000000000000000000000000C2C2C2007474
      7400B6B5B500E5E4E400C2C2C200B6B5B500B0AEAA00B0AEAA00B6B5B500C2C2
      C200E5E4E400B6B5B50074747400CACACA00ABAAAA00648DA3006BA9CA00BCCC
      D500000000000000000000000000000000000000000000000000C2C2C2007474
      7400B6B5B500E5E4E400C2C2C200B6B5B500B0AEAA00B0AEAA00B6B5B500C2C2
      C200E5E4E400B6B5B50074747400CACACA00ABAAAA00648DA3006BA9CA00BCCC
      D500000000000000000000000000000000000000000000000000C2C2C2007474
      7400B6B5B500E5E4E400C2C2C200B6B5B500B0AEAA00B0AEAA00B6B5B500C2C2
      C200E5E4E400B6B5B50074747400CACACA00ABAAAA00648DA3006BA9CA00BCCC
      D500000000000000000000000000000000000000000000000000C2C2C2007474
      7400B6B5B500E5E4E400C2C2C200B8B7B400CACAC600CACAC600B8B7B400C2C2
      C200E5E4E400B6B5B50074747400CACACA00ABAAAA00648DA3006BA9CA00BCCC
      D5000000000000000000000000000000000000000000000000007E7C7B00B6B5
      B500E0DFDF00B0AEAA00D5CBC300FDFAF900FDF8F600FDF8F600FDFAF900D5CB
      C300B0AEAA00E0DFDF00B6B5B5007E7C7B006185950069A4C300BCCCD5000000
      00000000000000000000000000000000000000000000000000007E7C7B00B6B5
      B500E0DFDF00B0AEAA00D5CBC300F7E6DE00FCEBE300FCEBE300F7E6DE00D5CB
      C300B0AEAA00E0DFDF00B6B5B5007E7C7B006185950069A4C300BCCCD5000000
      00000000000000000000000000000000000000000000000000007E7C7B00B6B5
      B500E0DFDF00B0AEAA00D5CBC300F7E6DE00FCEBE300FCEBE300F7E6DE00D5CB
      C300B0AEAA00E0DFDF00B6B5B5007E7C7B006185950069A4C300BCCCD5000000
      00000000000000000000000000000000000000000000000000007E7C7B00B6B5
      B500E0DFDF00B0AEAA00D6CDC500F5ECE40094BC820094BC8200F5ECE400D6CD
      C500B0AEAA00E0DFDF00B6B5B5007E7C7B006185950069A4C300BCCCD5000000
      000000000000000000000000000000000000E9E9E900C2C2C20096949400E5E4
      E400ADAAA700EBD7CC00FAE1D500FEF7F400C49E8A00BA937E00FDF2EC00FAD9
      C900EBD7CC00ABAAAA00E5E4E4009694940096949400BCCCD500000000000000
      000000000000000000000000000000000000E9E9E900C2C2C20096949400E5E4
      E400ADAAA700EBD7CC00FAE1D500FAE1D500FADED000FAD9C900F8D4C100FAD9
      C900EBD7CC00ABAAAA00E5E4E4009694940096949400BCCCD500000000000000
      000000000000000000000000000000000000E9E9E900C2C2C20096949400E5E4
      E400ADAAA700EBD7CC00FAE2D600FAE2D600FADED000FAD9C900F8D4C100FAD9
      C900EBD7CC00ABAAAA00E5E4E4009694940096949400BCCCD500000000000000
      000000000000000000000000000000000000E9E9E900C2C2C20096949400E5E4
      E400ADAAA700EBD7CC00FBE8DF00B6CDA4001E7701001E780000B6CDA400FBE1
      D500EBD7CC00ABAAAA00E5E4E4009694940096949400BCCCD500000000000000
      000000000000000000000000000000000000E9E9E9008C8A8800CACACA00BDBC
      BC00CFBEB200FAD9C900FAE1D500FDF2EC00BA937E00BA937E00FCF0E900F8C2
      A600F8D1BC00CFBEB200C0BDBB00CACACA008C8A8800E5E4E400000000000000
      000000000000000000000000000000000000E9E9E9008C8A8800CACACA00BDBC
      BC00CFBEB200FAD9C900FAE1D500F8D4C100F8CAB100F8C7AD00F5C2A900F8C2
      A600F8D1BC00CFBEB200C0BDBB00CACACA008C8A8800E5E4E400000000000000
      000000000000000000000000000000000000E9E9E9008C8A8800CACACA00BDBC
      BC00CFBEB200FAD9C900FAE2D600F8D4C100F8CAB100F8C7AD00F5C2A900F8C2
      A600F8D1BC00CFBEB200C0BDBB00CACACA008C8A8800E5E4E400000000000000
      000000000000000000000000000000000000E9E9E9008C8A8800CACACA00BDBC
      BC00D1C0B400FBE1D500FCEBE300D5D9BD004C9130004C913000D4D2B500FAD5
      C100FAD8C800D1C0B400C0BDBA00CACACA008C8A8800E5E4E400000000000000
      000000000000000000000000000000000000E9E9E9008C8A8800E9E9E900A1A0
      A000FEF7F400FDF2EC00FDF2EC00FDF2EC00BA937E00BA937E00FAE1D500FAE1
      D500FCEDE500FEF7F400A1A0A000F1F1F10083828200E9E9E900000000000000
      000000000000000000000000000000000000E9E9E9008C8A8800E9E9E900A1A0
      A000F2CEB900FEF8F500FDF0E900FCEBE300FCEBE300FCEBE300FCEBE300FCEB
      E300FDF0E900F2CEB900A1A0A000F1F1F10083828200E9E9E900000000000000
      000000000000000000000000000000000000E9E9E9008C8A8800E9E9E900A1A0
      A000F2CEB900FEF4F000FCF0E900F7BA9C00F7BA9C00F7BA9C00F7BA9C00FCEB
      E300FCEBE300F2CEB900A1A0A000F1F1F10083828200E9E9E900000000000000
      000000000000000000000000000000000000E9E9E9008C8A8800E9E9E900A1A0
      A000F2DCCC00B6CDA400D5D5B800FAD8C800A6BF8C00A6BF8C00FAD8C800D4D2
      B500B5C89D00F2DCCC00A1A0A000F1F1F10083828200E9E9E900000000000000
      000000000000000000000000000000000000E9E9E9008C8A8800E9E9E900A39E
      9A00FDF2EC00CCA38D00BA937E00BA937E00BA937E00BA937E00BA937E00BA93
      7E00BA937E00FDF2EC00A39E9A00F1F1F1008C8A8800E9E9E900000000000000
      000000000000000000000000000000000000E9E9E9008C8A8800E9E9E900A39E
      9A00F5C8AF00FDF0E90013419500003794000037940000379400003794001844
      9500FCEBE300F5C8AF00A39E9A00F1F1F1008C8A8800E9E9E900000000000000
      000000000000000000000000000000000000E9E9E9008C8A8800E9E9E900A39E
      9A00FCF0E900738C0000738C0000FCEBE300FCEBE300FFFEFE00FFFEFE00738C
      0000738C0000FCF0E900A39E9A00F1F1F1008C8A8800E9E9E900000000000000
      000000000000000000000000000000000000E9E9E9008C8A8800E9E9E900C2C0
      BC0093B77C001E7701004B902F00A6BF8C006CA150006CA15000A6BF8C004B90
      2F001E78000093B77C00C2C0BC00F1F1F1008C8A8800E9E9E900000000000000
      000000000000000000000000000000000000E9E9E900918E8C00E9E9E9009A98
      9500FCEDE500C69B8400BA937E00BA937E00BA937E00BA937E00BA937E00BA93
      7E00C69B8400FCEDE5009A989500F1F1F100918E8C00E9E9E900000000000000
      000000000000000000000000000000000000E9E9E900918E8C00E9E9E9009A98
      9500F4C0A300FCEBE3000A3C9400003794000037940000379400003794001844
      9500FDF0E900F5BDA1009A989500F1F1F100918E8C00E9E9E900000000000000
      000000000000000000000000000000000000E9E9E900918E8C00E9E9E900E5E4
      E400738C0000738C0000738C0000738C0000738C0000738C0000738C0000738C
      0000738C0000738C0000E5E4E400F1F1F100918E8C00E9E9E900000000000000
      000000000000000000000000000000000000E9E9E900918E8C00E9E9E900BDBC
      BC0093B77C001E7800004B902F00A6BF8C006CA150006CA15000A6BF8C004B90
      2F001E78000093B77C00C0BDBA00F1F1F100918E8C00E9E9E900000000000000
      000000000000000000000000000000000000F1F1F10096949400E9E9E9009A98
      9500FDF2EC00FCEDE500FCEDE500FDF2EC00BA937E00BA937E00FDF2EC00FDF2
      EC00FDFAF900FDF2EC009A989500FDFAF9009694940000000000000000000000
      000000000000000000000000000000000000F1F1F10096949400E9E9E9009A98
      9500ECB49700FAE1D500FAE1D500FCEBE300FCEBE300FCEBE300FCEBE300FDF0
      E900FFFFFF00ECB497009A989500FFFFFF00918E8C0000000000000000000000
      000000000000000000000000000000000000F1F1F10096949400E9E9E9009A98
      9500FCEBE300738C0000738C0000FCEBE300FCEBE300FCEBE300FCEBE300738C
      0000738C0000FCEBE3009A989500FFFEFE0093928F0000000000000000000000
      000000000000000000000000000000000000F1F1F10096949400E9E9E9009C9A
      9700EECCB700B5C89D00D4D2B500F9CDB700BDBE9000A6BF8C00FAD8C800D5D9
      BD00B6D0A800EECCB7009C9A9700FBFBFB0093928F0000000000000000000000
      000000000000000000000000000000000000F1F1F100A1A0A000D6D6D500B0AE
      AA00C09F8C00F2B49400F8C7AD00FDF2EC00BA937E00BA937E00FDF8F600FDF2
      EC00F5C2A900C49E8A00B6B5B500D9D9D900A39E9A0000000000000000000000
      000000000000000000000000000000000000F1F1F100A1A0A000D6D6D500B0AE
      AA00C09F8C00F2B49400F8C7AD00F8CAB100F8CAB100F8D4C100F7E6DE00FDF0
      E900F5C2A900C09F8C00B6B5B500D9D9D900A1A0A00000000000000000000000
      000000000000000000000000000000000000F1F1F100A1A0A000D6D6D500B0AE
      AA00C09F8C00FCEBE300FCEBE300F8CAB100F8CAB100F8D4C100F7E6DE00FFFE
      FE00FCEBE300C09F8C00B6B5B500D9D9D900A1A0A00000000000000000000000
      000000000000000000000000000000000000F1F1F100A1A0A000D6D6D500B0AE
      AA00C2A29000F5C4AB00FAD5C100D9D3B600629841004C913000D5DFC700FDF5
      F200F7CFBC00C2A29000B6B5B500D9D9D900A1A0A00000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900B0AEAA00E5E4
      E40096949400DCA28200F2B49400FDF2EC00C7A59200CEAF9F00FDF8F600F5BD
      A100DCA2820096949400E9E9E900ABAAAA00F1F1F10000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900B0AEAA00E5E4
      E40096949400DCA28200F2B49400FAD9C900FCEBE300FDF0E900FCEBE300F5BD
      A100DCA2820096949400E9E9E900B0AEAA00F1F1F10000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900B0AEAA00E5E4
      E40096949400DCA28200F2B49400FAD9C900FCEBE300FCF0E900FCEBE300F5BD
      A100DCA2820096949400E9E9E900B0AEAA00F1F1F10000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900B0AEAA00E5E4
      E40096949400DCA28200F5C4AB00B6CDA4001E7800001E780000B6D0A800F7CB
      B600DCA2820096949400E9E9E900B0AEAA00F1F1F10000000000000000000000
      00000000000000000000000000000000000000000000F1F1F100ABAAAA00D6D6
      D500E5E4E400918E8C00BA937E00FCEDE500FAE4D900FAE4D900FCEDE500BA93
      7E00918E8C00E5E4E400D6D6D500ABAAAA000000000000000000000000000000
      00000000000000000000000000000000000000000000F1F1F100ABAAAA00D6D6
      D500E5E4E400918E8C00BA937E00E79D7600ED9F7500ED9F7500E79D7600BA93
      7E00918E8C00E5E4E400D6D6D500ABAAAA000000000000000000000000000000
      00000000000000000000000000000000000000000000F1F1F100ABAAAA00D6D6
      D500E5E4E400918E8C00BA937E00E79D7600ED9F7500ED9F7500E79D7600BA93
      7E00918E8C00E5E4E400D6D6D500ABAAAA000000000000000000000000000000
      00000000000000000000000000000000000000000000F1F1F100ABAAAA00D6D6
      D500E5E4E400918E8C00BC968200EBBDA20092B2740092B27400EBBDA200BC96
      8200918E8C00E5E4E400D6D6D500ABAAAA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E9E9E900ADAA
      A700D2D0CF00E9E9E900B6B5B5008C8A880083828200838282008C8A8800B0AE
      AA00E9E9E900D9D9D900ADAAA700F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E9E9E900ADAA
      A700D2D0CF00E9E9E900B6B5B5008C8A880083828200838282008C8A8800B0AE
      AA00E9E9E900D9D9D900ADAAA700F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E9E9E900ADAA
      A700D2D0CF00E9E9E900B6B5B5008C8A880083828200838282008C8A8800B0AE
      AA00E9E9E900D9D9D900ADAAA700F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E9E9E900ADAA
      A700D2D0CF00E9E9E900B6B5B5008C8A8800AEAFAD00ABAAAA008C8A8800B0AE
      AA00E9E9E900D9D9D900ADAAA700F1F1F1000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1F1
      F100B6B5B500C0BDBB00E0DFDF00FDFAF900FDFAF900FDFAF900FDFAF900E5E4
      E400C0BDBB00B0AEAA00F1F1F100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1F1
      F100B6B5B500C0BDBB00E0DFDF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E5E4
      E400BDBCBC00B0AEAA00F1F1F100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1F1
      F100B6B5B500C0BDBB00E0DFDF00FFFEFE00FFFEFE00FFFEFE00FFFEFE00E5E4
      E400BDBCBC00B0AEAA00F1F1F100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1F1
      F100B6B5B500C0BDBA00E0DFDF00FBFBFB00FBFBFB00FBFBFB00FBFBFB00E5E4
      E400C0BDBA00B0AEAA00F1F1F100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1F1F100E9E9E900C0BDBB00ABAAAA00B0AEAA00ABAAAA00B0AEAA00B6B5
      B500F1F1F1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1F1F100E9E9E900BDBCBC00ADAAA700ADAAA700ADAAA700ADAAA700B6B5
      B500F1F1F1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1F1F100E9E9E900BDBCBC00ADAAA700ABAAAA00ADAAA700ABAAAA00B6B5
      B500F1F1F1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1F1F100E9E9E900C0BDBA00B0AEAA00B0AEAA00B0AEAA00B0AEAA00B6B5
      B500F1F1F1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EDEDED00A1A19D00A09F9C009D9C99009D9C9900999896009796
      9400979694009796940097969400908F8E00908F8E00908F8E00908F8E00908F
      8E008A898900908F8E00908F8E00000000000000000000000000000000000000
      000000000000EDEDED00A1A19D00A09F9C009D9C99009D9C9900999896009796
      9400979694009796940097969400908F8E00908F8E00908F8E00908F8E00908F
      8E008A898900908F8E00908F8E00000000000000000000000000000000000000
      000000000000EDEDED00A1A19D00A09F9C009D9C99009D9C9900999896009796
      9400979694009796940097969400908F8E00908F8E00908F8E00908F8E00908F
      8E008A898900908F8E00908F8E00000000000000000000000000000000000000
      000000000000EDEDED00A1A19D00A09F9C009D9C99009D9C9900999896009796
      9400979694009796940097969400908F8E00908F8E00908F8E00908F8E00908F
      8E008A898900908F8E00908F8E00000000000000000000000000000000000000
      000000000000EDEDED00A1A19D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F8F6F500FFFFFF00908F8E00000000000000000000000000000000000000
      000000000000EDEDED00A1A19D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F8F6F500FFFFFF00908F8E00000000000000000000000000000000000000
      000000000000EDEDED00A1A19D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F8F6F500FFFFFF00908F8E00000000000000000000000000000000000000
      000000000000EDEDED00A1A19D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F8F6F500FFFFFF00908F8E00000000000000000000000000E6E5E500EDED
      ED00A1A19D00C4C3C200908F8E00E8E7E800E8E3DC00F3A88000B29C6E00B29C
      6E00E7E1DA00E6DED800E6DED800E6DED800E6DED800C5BFBC00E5DBD400E6DE
      D800E6DED800F8F6F500908F8E00000000000000000000000000E6E5E500EDED
      ED00A1A19D00C4C3C200908F8E00E8E7E800E8E3DC00E8E3DC00E8E3DC00E7E1
      DA00E7E1DA00E6DED800E6DED800E6DED800C5BFBC00E6DED800E5DBD400E6DE
      D800E6DED800F8F6F500908F8E00000000000000000000000000E6E5E500EDED
      ED00A1A19D00C4C3C200908F8E00E8E7E800E8E3DC00E8E3DC00E8E3DC00E7E1
      DA00C4C1BD00E6DED800E6DED800E6DED800E6DED800E6DED800E5DBD400E6DE
      D800E6DED800F8F6F500908F8E00000000000000000000000000E6E5E500EDED
      ED00A1A19D00C4C3C200908F8E00E8E7E800E8E3DC00E8E3DC00F3A8A400E7E1
      DA00E7E1DA00E6DED800E6DED800E6DED800F2A67E00B1996C00B1996C00E6DE
      D800E6DED800F8F6F500908F8E0000000000000000000000000000000000EDED
      ED00A1A19D00EDEDED00A9A7A100FFFFFF00FFF9F500FFAA8000FEB59100BE9D
      6E00FFE6DC00FFE6DC00FFE6DC00FEDECD00D1BFB700BE9D6E00FEDECD00FEDE
      CD00E6DED800F8F6F500908F8E0000000000000000000000000000000000EDED
      ED00A1A19D00EDEDED00A9A7A100FFFFFF00FFF9F500FFE6DC00FFE6DC00FFE6
      DC00FFE6DC00FFE6DC00FFE6DC00D1BFB700BD996700FFDFD000FEDECD00FEDE
      CD00E6DED800F8F6F500908F8E0000000000000000000000000000000000EDED
      ED00A1A19D00EDEDED00A9A7A100FFFFFF00FFF9F500FFE6DC00FFE6DC00FFE6
      DC00FEA97F00D0C3BD00FFE6DC00FEDECD00FEDECD00FFDFD000FEDECD00FEDE
      CD00E6DED800F8F6F500908F8E0000000000000000000000000000000000EDED
      ED00A1A19D00EDEDED00A9A7A100FFFFFF00FFF9F500FFE6DC00FFAA8000C2B6
      B100FFE6DC00FFE6DC00FFE6DC00FEDECD00FEA67900FFB28C00BD996700FEDE
      CD00E6DED800F8F6F500908F8E0000000000000000000000000087868100BAB9
      B8008A898300E6E5E500A9A69D00FFF9F500F8F5EF00FFAA8000FAB38E00CDA7
      6D00F6DDCF00FEDECD00F6DDCF00D1BFB700FAA57A00BD996700F6DDCF00FEDE
      CD00E6DED800F8F6F5009796940000000000000000000000000087868100BAB9
      B8008A898300E6E5E500A9A69D00FFF9F500F8F5EF00FFE6DC00F5E0D400FFE6
      DC00F6DDCF00FEDECD00CDBFB800FEA67900B9996800FEDECD00F6DDCF00FEDE
      CD00E6DED800F8F6F5009796940000000000000000000000000087868100BBBA
      B8008A898300E6E5E500A9A69D00FFF9F500F8F5EF00FFE6DC00F5E0D400FFE6
      DC00FAA57A00BD996700CDBFB800FEDECD00F6DDCF00FEDECD00F6DDCF00FEDE
      CD00E6DED800F8F6F5009796940000000000000000000000000087868100BBBA
      B8008A898300E6E5E500A9A69D00FFF9F500F8F5EF00FFE6DC00FEA67900BD9D
      6D00BEB1AA00FEDECD00F6DDCF00FEDECD00FEA67900FFB28C00C9A36800FEDE
      CD00E6DED800F8F6F500979694000000000000000000000000008A898300EDED
      ED00A9A7A100FFFFFF00AFADA500FFF9F500FFF9F500FEB59100FFC2A400CDA8
      6E00FFE6DC00FFE6DC00D1C3BE00FEA97F00FAA57A00CDA46700F6DDCF00FFE6
      DC00E5DBD400FFFFFF00979694000000000000000000000000008A898300EDED
      ED00A9A7A100FFFFFF00AFADA500FFF9F500FFF9F500FFE6DC00FFE6DC00FFE6
      DC00FFE6DC00D1C3BE00FEA97F00FEA97F00CDA46700FEDECD00F6DDCF00FFE6
      DC00E5DBD400FFFFFF00979694000000000000000000000000008A898300EDED
      ED00A9A7A100FFFFFF00AFADA500FFF9F500FFF9F500FFE6DC00FFE6DC00FFE6
      DC00FEB59100FEB59100BD9D6D00D0C3BD00FEDECD00FEDECD00F6D8CA00FFE6
      DC00E6DED800FFFFFF00979694000000000000000000000000008A898300EDED
      ED00A9A7A100FFFFFF00AFADA500FFF9F500FFF9F500FFE6DC00FEB59100FEB5
      9100BD9D6D00FEC1A300FFE6DC00FFE6DC00FFB28C00FBBD9C00C9A16500FFE6
      DC00E6DED800FFFFFF00979694000000000000000000000000008A898300FFFF
      FF00AFADA500F8F6F500B4B2A900FFFFFF00FFF9F500FEB89500FFC2A400CDA8
      6E00FFE6DC00D1C3BE00FEA97F00FEA97F00FEA97F00CDA46700F6DDCF00FFE6
      DC00E7E1DA00FFFFFF00979694000000000000000000000000008A898300FFFF
      FF00AFADA500F8F6F500B4B2A900FFFFFF00FFF9F500FEEAE100FEEAE100FFE6
      DC00D1C3BE00FEA97F00FEA97F00FEA97F00CDA86E00FEDECD00F6DDCF00FFE6
      DC00E7E1DA00FFFFFF00979694000000000000000000000000008A898300FFFF
      FF00AFADA500F8F6F500B4B2A900FFFFFF00FFF9F500FEEAE100FEEAE100FFE6
      DC00FEB59100FEB59100EC966D00BD9D6D00D0C3BD00FEDECD00F6DDCF00FFE6
      DC00E7E1DA00FFFFFF00979694000000000000000000000000008A898300FFFF
      FF00AFADA500F8F6F500B4B2A900FFFFFF00FFF9F500FEEAE100FEB89500FEB5
      9100EC966E00BD9D6D00C2B5AF00FEE5D900FEB59100FBBD9C00C9A36800FFE6
      DC00E7E1DA00FFFFFF0097969400000000000000000000000000918F8700F8F6
      F500B0AEA600F8F5EF00B4B2A900FFF9F500FFF9F500FEB89500FEC4A700CDAA
      7100D1C3BE00FEB59100FFC2A400FEB59100FEA97F00CDA76D00F6DDCF00FFE6
      DC00E7E1DA00FFFFFF0097969400000000000000000000000000918F8700F8F6
      F500B0AEA600F8F5EF00B4B2A900FFF9F500FFF9F500FEEAE100FEEAE100D1C5
      C100FEB59100FFC2A400FEB59100FEA97F00CDA76D00FFE6DC00F6DDCF00FFE6
      DC00E7E1DA00FFFFFF0097969400000000000000000000000000918F8700F8F6
      F500B0AEA600F8F5EF00B4B2A900FFF9F500FFF9F500FEEAE100FEEAE100FEEA
      E100FEB59100FFC2A400FEA97F00EC966D00BD9D6D00D0C3BD00F6DDCF00FFE6
      DC00E7E1DA00FFFFFF0097969400000000000000000000000000918F8700F8F6
      F500B0AEA600F8F5EF00B4B2A900FFF9F500FFF9F500FEEAE100FEB89500FEC4
      A700FFAA8000EC966E00BD9D6D00BEB1AA00FEB59100FEC1A300C9A36800FFE6
      DC00E7E1DA00FFFFFF009796940000000000000000000000000099978F00FFFF
      FF00B0AEA600FFF9F500B4B2A900FFF9F500FFF9F500FFBA9800FEC4A700DCB4
      7100FEB89500FFCEB600FFCEB600FFC2A400FEB59100CDA76D00FFE6DC00FEEA
      E100E7E1DA00FFFFFF009998960000000000000000000000000099978F00FFFF
      FF00B0AEA600FFF9F500B4B2A900FFF9F500FFF9F500FFEEE800D5CDCA00FEB8
      9500FED0B900FFCEB600FFC2A400FEB59100CDA76D00FFE6DC00FFE6DC00FEEA
      E100E7E1DA00FFFFFF009998960000000000000000000000000099978F00FFFF
      FF00B0AEA600FFF9F500B4B2A900FFF9F500FFF9F500FFEEE800FFEEE800FEEA
      E100FEB89500FFCEB600FFC2A400FEA97F00EC966D00CDA76D00CEC2BD00FEEA
      E100E7E1DA00FFFFFF009998960000000000000000000000000099978F00FFFF
      FF00B0AEA600FFF9F500B4B2A900FFF9F500FFF9F500FFEEE800FBBD9C00FED0
      B900FEC1A300FFAA8000EC966E00CDA76D00FEB59100FEC1A300DDB26E00FEEA
      E100E7E1DA00FFFFFF009998960000000000000000000000000099989600F8F6
      F500B4B2A900FFF9F500B4B2A900FFFFFF00FFF9F500FFBA9800FFD2BC00FFBA
      9800F8DCC700FEB89500FFD2BC00FED0B900FEB89500DCB47100FFE6DC00FEEA
      E100E7E1DA00FFFFFF009D9C990000000000000000000000000099989600F8F6
      F500B4B2A900FFF9F500B4B2A900FFFFFF00FFF9F500F8F5EF00FFEEE800F8DC
      C700FFBA9800FED0B900FED0B900FEB89500DCB47100FEEAE100FFE6DC00FEEA
      E100E7E1DA00FFFFFF009D9C990000000000000000000000000099989600F8F6
      F500B4B2A900F9F8F600B4B2A900FFFFFF00FFF9F500F8F5EF00FFEEE800FFEE
      E800FFBA9800FED0B900FFC2A400FEC4A700FEB89500F7DAC400FFE6DC00FFEE
      E800E7E1DA00FFFFFF009D9C990000000000000000000000000099989600F8F6
      F500B4B2A900FFF9F500B4B2A900FFFFFF00FFF9F500F8F5EF00FEB89500FFD2
      BC00FEC4A700FEC4A700FEB89500FFD2BC00FEB59100FFD2BC00FEB59100FEEA
      E100E7E1DA00FFFFFF009D9C990000000000000000000000000099989600FFF9
      F500B4B2A900FFF9F500B4B2A900FFFFFF00FFF9F500FFCEB600FFD2BC00FFBA
      9800FFEEE800F8DCC700FEB59100FFD2BC00FFC2A400FEB89500FFE6DC00FEEA
      E100E7E1DA00FFFFFF009D9C990000000000000000000000000099989600FFF9
      F500B4B2A900FFF9F500B4B2A900FFFFFF00FFF9F500F8F5EF00FFEEE800FFEE
      E800F8DCC700FFBA9800FED0B900FFC2A400FEB89500FEEAE100FFE6DC00FEEA
      E100E7E1DA00FFFFFF009D9C990000000000000000000000000099989600FFF9
      F500B4B2A900FFF9F500B4B2A900FFFFFF00FFF9F500F8F5EF00FFEEE800FFEE
      E800FEC4A700FED0B900FED0B900FEB89500F7DAC400FEEAE100FFE6DC00FEEA
      E100E7E1DA00FFFFFF009D9C990000000000000000000000000099989600FFF9
      F500B4B2A900FFF9F500B4B2A900FFFFFF00FFF9F500F8F5EF00FEC4A700FFD2
      BC00FFD2BC00FBBD9C00FED0B900FEEAE100FEC4A700FFD2BC00FFB28C00FFEE
      E800E7E1DA00FFFFFF009D9C9900000000000000000000000000A09E9500FFFF
      FF00BAB8AE00FFFFFF00BAB8AE00FFFFFF00FFF9F500FBC9AE00F8DCC700FFBA
      9800FFEEE800FFEEE800FEDECD00FEB89500FFD2BC00FEB89500F7E8DD00FFEE
      E800E6E5E500FFFFFF009D9C9900000000000000000000000000A09E9500FFFF
      FF00BAB8AE00FFFFFF00BAB8AE00FFFFFF00FFF9F500FFF9F500FFEEE800F8F5
      EF00FFEEE800F8DCC700FFBA9800FED0B900FFBA9800FFEEE800F7E8DD00FFEE
      E800E6E5E500FFFFFF009D9C9900000000000000000000000000A09E9500FFFF
      FF00BAB8AE00F9F9F900C0BAB300FFFFFF00FFF9F500F9F8F600FFEEE800F8F5
      EF00FFC6AA00FFD2BC00FFBA9800FEDECD00FEEAE100F8F5EF00F8E4D900F8F5
      EF00E6E5E500FFFFFF009D9C9900000000000000000000000000A09E9500FFFF
      FF00BAB8AE00FFFFFF00BAB8AE00FFFFFF00FFF9F500FFF9F500FEC4A700FBD5
      C000FBBD9C00FFD2BC00FEEAE100F8F5EF00FEC1A300F6DDCF00FEB89500FEEA
      E100E6E5E500FFFFFF009D9C9900000000000000000000000000A09E9500FFF9
      F500BAB9B800F8F6F500BAB8AE00FFFFFF00FFF9F500FFCEB600F5E1CE00FBBD
      9C00F8F5EF00F8F5EF00FEEAE100F6DDCF00FEB89500F6B29100E6DED800E0D1
      CB00BAB9B800D5D2D500A1A19D00000000000000000000000000A09E9500FFF9
      F500BAB9B800F8F6F500BAB8AE00FFFFFF00FFF9F500F9F8F600F9F8F600F8F5
      EF00F8F5EF00F8F5EF00FEDECD00FEB89500FFBA9800EDDED900E6DED800E0D1
      CB00BAB9B800D5D2D500A1A19D00000000000000000000000000A09E9500FFF9
      F500BBBAB800FFF9F500BAB8AE00FFFFFF00FFF9F500F9F8F600F9F8F600F8F5
      EF00FFCEB600FFBA9800F6DDCF00FEEAE100F8F5EF00F6DDCF00E6DED800E0D1
      CB00BBBAB800D5D2D500A1A19D00000000000000000000000000A09E9500FFF9
      F500BBBAB800F8F6F500BAB8AE00FFFFFF00FFF9F500F9F9F900FED0B900FBBD
      9C00FBD5C000F8F6F500FEEAE100FFEEE800FEC4A700EED4C000F2B29000E0D1
      CB00BBBAB800D5D2D500A1A19D00000000000000000000000000A1A19D00FFF9
      F500BAB9B800FFF9F500C0BAB300FFFFFF00FFFFFF00FBC9AE00FFCEB600FEC4
      A700FFF9F500FFEEE800FFF9F500FFEEE800D3CBC900EFAB8A00D1C3BE00D4C8
      C400BAB8AE00B3ADAD00A1A19D00000000000000000000000000A1A19D00FFF9
      F500BAB9B800FFF9F500C0BAB300FFFFFF00FFFFFF00FFF9F500F9F8F600FFEE
      E800FFF9F500FEEAE100FFF9F500DCD3D000F6B29100E0D1CB00D1C3BE00D4C8
      C400BAB8AE00B3ADAD00A1A19D00000000000000000000000000A1A19D00FFF9
      F500BBBAB800F9F8F600C0BAB300FFFFFF00FFFFFF00F9F8F600F9F8F600FEEA
      E100FFCEB600DCD3D000F9F8F600FFEEE800EDDED900E0D1CB00D0C3BD00D0C3
      BD00B8B3B000B3ADAD00A1A19D00000000000000000000000000A1A19D00FFF9
      F500BBBAB800FFF9F500C0BAB300FFFFFF00FFFFFF00F8F6F500FCCBB100F8DC
      C700FFF9F500FEEAE100FFFFFF00FFEEE800F6BEA300EFB79C00E7B09600D4C8
      C400BAB8AE00B3ADAD00A1A19D00000000000000000000000000A9A69D00FFF9
      F500BAB9B800F8F5EF00C2C0B500FFE6DC00F5E0D400FEDECD00FEDECD00FEDE
      CD00F6DDCF00FEDECD00F6DDCF00F6D1C100FEC4A700B0AFAA0099989600A1A1
      9D00908F8E00AFADA500D3CBC900000000000000000000000000A9A69D00FFF9
      F500BAB9B800F8F5EF00C2C0B500FFE6DC00F5E0D400FEDECD00FEDECD00FFDF
      D000F6DFD000FFDFD000F6DDCF00F6D1C100F8C2AC00A9A69D00A09E9500A1A1
      9D008A898900B3ADAD00D0CCCC00000000000000000000000000A9A69D00FFF9
      F500BBBAB800F8F5EF00C2C0B500FFE6DC00F5E0D400FEDECD00FEDECD00FFDF
      D000D4C8C400FEDECD00F6DDCF00F6D1C100FEC4A700A9A7A100A09F9C00A1A1
      9D00908F8E00B0AEA600D0CCCC00000000000000000000000000A9A69D00FFF9
      F500BBBAB800F8F5EF00C2C0B500FFE6DC00F5E0D400FEDECD00F7D4BA00FFDF
      D000F6DFD000FEDECD00F6DDCF00F6D1C100FEC4A700A1A19D00A09E9500A1A1
      9D008A898900B3ADAD00D0CCCC00000000000000000000000000A1A19D00FFF9
      F500BAB9B800FFF9F500C0BAB300F7E8DD00FFE6DC00F6DDCF00F6DDCF00F6DD
      CF00FEDECD00F6DDCF00F6DDCF00F3CFBF00F3BAA400A9A69D00E8E3DC00E6DE
      D800B4B2A900C4C2BE0000000000000000000000000000000000A1A19D00FFF9
      F500BAB9B800FFF9F500C0BAB300F7E8DD00FFE6DC00F6DDCF00F6DDCF00F6DD
      CF00FEDECD00F6DDCF00F6DDCF00F3CFBF00F3BAA400A9A69D00E6DED800E6DE
      D800B4B2A900C4C2BE0000000000000000000000000000000000A1A19D00FFF9
      F500BBBAB800FFF9F500C0BAB300F7E8DD00FFE6DC00F6DDCF00F6DDCF00F6DD
      CF00FEDECD00F6DDCF00F6D8CA00F6D1C100F3BAA400A1A19D00E6DED800E6DE
      D800B4B2A900C4C3C20000000000000000000000000000000000A1A19D00FFF9
      F500BBBAB800FFF9F500C0BAB300F7E8DD00FFE6DC00F6DDCF00F6DDCF00F6DD
      CF00FEDECD00F6DDCF00F6DDCF00F3CFBF00F6BEA300A9A69D00E6DED800E6DE
      D800B4B2A900C4C2BE0000000000000000000000000000000000A9A69D00FFFF
      FF00C0BAB300FFE6DC00B4B2A900F5E0D400F6DDCF00F6DDCF00F6DDCF00F6D8
      CA00F6D8CA00F6DDCF00F3CFBF00E7C2B200E5AE990099989600E7E1DA00BAB9
      B800BAB9B800EDEDED0000000000000000000000000000000000A9A69D00FFFF
      FF00C0BAB300FFE6DC00B4B2A900F5E0D400F6DFD000F6DDCF00F6DDCF00F6D8
      CA00F6D8CA00F6DDCF00F3CFBF00E7C2B200E5AE990099989600E7E1DA00BAB9
      B800BAB9B800EDEDED0000000000000000000000000000000000A8A69A00FFFF
      FF00C0BAB300F8E4D900BAB8AE00F5E0D400F6DDCF00F6DDCF00F6D8CA00F6D8
      CA00F6D8CA00F6DDCF00F3CFBF00E7C2B200E5AE990099989600E8E3DC00BBBA
      B800BBBAB800EDEDED0000000000000000000000000000000000A9A69D00FFFF
      FF00C0BAB300FFE6DC00B4B2A900F5E0D400F6DFD000F6DDCF00F6DDCF00F6D8
      CA00F6D8CA00F6DDCF00F3CFBF00E7C2B200E5AE990099989600E7E1DA00BBBA
      B800BBBAB800EDEDED0000000000000000000000000000000000A9A69D00FFFF
      FF00BAB9B800F7E8DD00BAB8AE00F7E8DD00FEDECD00FEDECD00F6DDCF00F6DD
      CF00FEDECD00F6DDCF00F3CFBF00E7C2B200E7C2B200B0AEA600C4C2BE00BAB8
      AE00EDEDED000000000000000000000000000000000000000000A9A69D00FFFF
      FF00BAB9B800FEEAE100BAB8AE00FFE6DC00F6DDCF00FEDECD00F6DDCF00F6DD
      CF00FEDECD00F6DDCF00F3CFBF00E7C2B200E7C2B200B0AEA600C4C2BE00BAB8
      AE00EDEDED000000000000000000000000000000000000000000A9A69D00FFFF
      FF00C0BAB300F7E8DD00BAB8AE00FFE6DC00F6DDCF00F6DDCF00F6DDCF00F6DD
      CF00FEDECD00F6D8CA00F6D1C100E7C2B200E7C2B200B0AEA600C4C3C200BAB8
      AE00EDEDED000000000000000000000000000000000000000000A9A69D00FFFF
      FF00BBBAB800F7E8DD00BAB8AE00F7E8DD00FEDECD00F6DDCF00F6DDCF00F6DD
      CF00FEDECD00F6DDCF00F3CFBF00E7C2B200E7C2B200B0AEA600C4C2BE00BAB8
      AE00EDEDED000000000000000000000000000000000000000000B0AEA600F5E0
      D400BAB8AE00F5E0D400BAB8AE00F6DFD000F6DDCF00F5E0D400F6DDCF00F6DD
      CF00F6DDCF00F6D1C100F6DDCF00DCBBAE00C9B6A900A9A69D00BAB9B800E8E7
      E800000000000000000000000000000000000000000000000000B0AEA600F5E0
      D400BAB8AE00F6DFD000BAB8AE00F6DFD000F6DDCF00F5E0D400F6DDCF00F6DF
      D000F6D8CA00F6D1C100F6DDCF00DCBBAE00C9B6A900A9A69D00BAB9B800E8E7
      E800000000000000000000000000000000000000000000000000B0AEA600F5E0
      D400BAB8AE00F5E0D400BAB8AE00F6DFD000F6DDCF00F6DDCF00F6DDCF00F6DD
      CF00F6DDCF00F6D8CA00F2D6C600DCBBAE00C9B6A900A1A19D00C0BAB300E8E7
      E800000000000000000000000000000000000000000000000000B0AEA600F5E0
      D400BAB8AE00F5E0D400BAB8AE00FFDFD000F6DFD000F6DFD000F6DDCF00F6DD
      CF00F6D8CA00F6DDCF00F3CFBF00DCBBAE00C9B6A900A9A69D00BBBAB800E8E7
      E800000000000000000000000000000000000000000000000000A1A19D00F5E0
      D400BAB8AE00F5E0D400C0B9AA00C0B9AA00BAB8AE00C0B9AA00BAB8AE00BAB8
      AE00BAB8AE00B0AEA600BFB5A700A9A69D00B0AEA600C0BAB300E6E5E5000000
      0000000000000000000000000000000000000000000000000000A1A19D00F5E0
      D400BAB8AE00F5E0D400BAB8AE00C0B9AA00BAB8AE00C0B9AA00BAB8AE00BAB8
      AE00BAB8AE00B0AEA600BFB5A700A9A69D00B0AEA600C0BAB300E6E5E5000000
      0000000000000000000000000000000000000000000000000000A1A19D00F5E0
      D400BAB8AE00F5E0D400C0B9AA00C0B9AA00C0B9AA00C0B9AA00C0B9AA00C0BA
      B300BFB5A700AFADA500BAB8AE00A8A69A00B0AEA600C0BAB300E6E5E5000000
      0000000000000000000000000000000000000000000000000000A1A19D00F5E0
      D400BAB8AE00F5E0D400C0B9AA00BAB8AE00C0B9AA00BAB8AE00C0B9AA00C0BA
      B300BFB5A700B0AEA600BFB5A700A1A19D00B0AEA600C0BAB300E6E5E5000000
      0000000000000000000000000000000000000000000000000000B0AEA600FFE6
      DC00BAB8AE00FFE6DC00FFE6DC00F5E0D400FEEAE100F7E9E200FFE6DC00F5E0
      D400FFE6DC00E4CCC100D9CBC100C0BAB300CBC9C300EDEDED00000000000000
      0000000000000000000000000000000000000000000000000000B0AEA600FFE6
      DC00BAB8AE00FFE6DC00FEE5D900F5E0D400FEEAE100F7E9E200FFE6DC00F5E0
      D400FFE6DC00E4CCC100D9CBC100C0BAB300CBC9C300EDEDED00000000000000
      0000000000000000000000000000000000000000000000000000B0AEA600F6E4
      D700BAB8AE00FEE5D900F6E4D700FFE6DC00F7E8DD00F7E9E200FFE6DC00F6DD
      CF00FFE6DC00E4CCC100D8CAC200B8B3B000CCC9C400EDEDED00000000000000
      0000000000000000000000000000000000000000000000000000B0AEA600FFE6
      DC00BAB8AE00FFE6DC00FEE5D900F5E0D400F7E8DD00FEEAE100FFE6DC00F6DF
      D000FFE6DC00E4CCC100D9CBC100BBBAB800CCC9C400EDEDED00000000000000
      0000000000000000000000000000000000000000000000000000B0AEA600F5E0
      D400BAB8AE00BAB8AE00BAB8AE00BAB8AE00C0B9AA00BAB8AE00BAB8AE00BFB5
      A700B8AEA100A09E9500AFADA500BAB8AE00E6E5E50000000000000000000000
      0000000000000000000000000000000000000000000000000000B0AEA600F5E0
      D400BAB8AE00BAB8AE00BAB8AE00BAB8AE00C0B9AA00BAB8AE00BAB8AE00BFB5
      A700B8AEA100A09E9500AFADA500BAB8AE00E6E5E50000000000000000000000
      0000000000000000000000000000000000000000000000000000B0AEA600F5E0
      D400C0B9AA00BAB8AE00BAB8AE00BAB8AE00C0B9AA00BAB8AE00BAB8AE00BAB8
      AE00B8AEA100A09E9500B0AEA600C0B9AA00E6E5E50000000000000000000000
      0000000000000000000000000000000000000000000000000000B0AEA600F5E0
      D400BAB8AE00BAB8AE00BAB8AE00BAB8AE00BAB8AE00BAB8AE00BAB8AE00BFB5
      A700B0AEA600A09E9500B0AEA600C0B9AA00E6E5E50000000000000000000000
      0000000000000000000000000000000000000000000000000000B0AEA600F5E0
      D400FEEAE100F7E8DD00FEEAE100FEEAE100F7E8DD00FEEAE100F5E0D400F6D1
      C100D1BFB700C0BAB300CBC9C300EDEDED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B0AEA600F5E0
      D400FEEAE100F7E8DD00FEEAE100FEEAE100F7E8DD00FEEAE100F5E0D400F6D1
      C100D1BFB700C0BAB300CBC9C300EDEDED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B0AEA600F5E0
      D400FEEAE100F7E8DD00FFEEE800FEEAE100F7E8DD00FEEAE100F6DDCF00F2D6
      C600D0BDB200B8B3B000CCC9C400EDEDED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B0AEA600F5E0
      D400FEEAE100F7E8DD00FEEAE100FEEAE100F7E8DD00FEEAE100F5E0D400F6D1
      C100D0BDB200C0BAB300CCC9C400EDEDED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B0AEA600B0AE
      A600B0AEA100B0AEA600B0AEA600A9A69D00B0AEA100A9A69D00AFADA500A1A1
      9D00A8A69A00BAB8AE00E8E7E800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B0AEA600B0AE
      A600B0AEA100B0AEA600B0AEA600A9A69D00B0AEA100A9A69D00AFADA500A1A1
      9D00A8A69A00BAB8AE00E8E7E800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B0AEA600B0AE
      A600B0AEA100B0AEA600B0AEA100A1A19D00B0AEA100A9A69D00B0AEA600A8A6
      9A00A9A69D00C0B9AA00E8E7E800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B0AEA600B0AE
      A600B0AEA100B0AEA600B0AEA600A9A69D00A9A69D00A9A69D00B0AEA600A1A1
      9D00A9A69D00BAB8AE00E8E7E800000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000600000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF00FC0003FFFFFF000000000000F80001FC
      07FF000000000000F00001E001FF000000000000F000018000FF000000000000
      F0000100003F000000000000E0000100003F000000000000C0000100003F0000
      0000000080000100003F00000000000080000100003F00000000000080000100
      0007000000000000800001000003000000000000800001000001000000000000
      8000010000010000000000008000010000000000000000008000010000200000
      0000000080000100003000000000000080000100003800000000000080000100
      0038000000000000C00001000039000000000000F0000300003B000000000000
      F0000780007F000000000000F0000FF007FF000000000000F0001FFF07FF0000
      00000000F0003FFFFFFF000000000000FFFFBFFFFFBFFFFFFFFFFFFFFFFF87FF
      FF87F8001FFFE07FFFFF03FFFF03F8001FF8000FFFFE00FFFE00800001E00007
      FFFC00FFFC00800001E00003FFE800FFE800800001F00003FFF001FFF0018000
      01F00001F80003F80003800001800001E00007E00007800001800001C0000FC0
      000F800001803C01C0001FC0001F800001807E0100003F00003F800001807E01
      00003F00003F800001807E0100003F00003F800001803C0100003F00003FC000
      0380180100003F00003FF8001F80000100007F00007FF8001F80000100007F00
      007FF8001FC0000780007F80007FF8001FC0000F8000FF8000FFF8001FE0000F
      C000FFC000FFF8001FFC000FE001FFE001FFF8001FFE001FF007FFF007FFFFFF
      FFFE067FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFBFFFFFBFFFFFBFFFFF87FF
      FF87FFFF87FFFF87FFFF03FFFF03FFFF03FFFF03FFFE00FFFE00FFFE00FFFE00
      FFFC00FFFC00FFFC00FFFC00FFE800FFE800FFE800FFE800FFF001FFF001FFF0
      01FFF001F80003F80003F80003F80003E00007E00007E00007E00007C0000FC0
      000FC0000FC0000FC0001FC0001FC0001FC0001F00003F00003F00003F00003F
      00003F00003F00003F00003F00003F00003F00003F00003F00003F00003F0000
      3F00003F00003F00003F00003F00003F00007F00007F00007F00007F00007F00
      007F00007F00007F80007F80007F80007F80007F8000FF8000FF8000FF8000FF
      C000FFC000FFC000FFC000FFE001FFE001FFE001FFE001FFF007FFF007FFF007
      FFF007FFFFFFFFFFFFFFFFFFFFFFFFFFF80001F80001F80001F80001F80001F8
      0001F80001F80001C00001C00001C00001C00001E00001E00001E00001E00001
      C00001C00001C00001C00001C00001C00001C00001C00001C00001C00001C000
      01C00001C00001C00001C00001C00001C00001C00001C00001C00001C00001C0
      0001C00001C00001C00001C00001C00001C00001C00001C00001C00001C00001
      C00001C00001C00001C00001C00001C00001C00001C00001C00001C00001C000
      01C00001C00003C00003C00003C00003C00003C00003C00003C00003C00007C0
      0007C00007C00007C0000FC0000FC0000FC0000FC0001FC0001FC0001FC0001F
      C0003FC0003FC0003FC0003FC0007FC0007FC0007FC0007FC000FFC000FFC000
      FFC000FFC001FFC001FFC001FFC001FF}
  end
  object alPrint: TActionList
    Left = 72
    Top = 272
    object aSynSaveAs: TaSynSaveAs
      Category = 'SynEdit'
      Caption = 'aSynSaveAs'
      SynEdit = txtPrint
      SaveDialogTitle = #20869#23481#21478#23384#20026
      SaveDialogOptions = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    end
    object aSynPageSetup: TaSynPageSetup
      Category = 'SynEdit'
      Caption = 'aSynPageSetup'
      SynEdit = txtPrint
      Print = sepPrint
    end
  end
  object pdPrint: TPrintDialog
    OnClose = pdPrintClose
    Options = [poDisablePrintToFile]
    Left = 40
    Top = 272
  end
  object iltStatusBar: TImageList
    Left = 264
    Top = 272
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008282820082828200828282008282820082828200828282008282
      8200000000000000000000000000000000000000000000000000000000006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666006666660066666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008282
      820082828200525252003E3D3D003E3D3D003E3D3D003E3D3D003E3D3D003E3D
      3D007A7A7A007A7A7A0000000000000000000000000000000000AE7B6E00D9AD
      9D00D6A89A00D3A69800D2A49700CCA19900C99E9700C69C9600C69C9600C196
      9300B6918B00B88E8B0066666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002048
      6000303040000000000000000000000000000000000000000000828282005252
      52003E3D3D00F1F1F100B1B1B1009D868500A8838500B1B1B100E5E5E500B1B1
      B1004E4E4E003E3D3D007A7A7A00000000000000000000000000B5827200FCE1
      CA00FCE1CA00FBDEC500FBDEC500FAD9BD00FAD9BD00FAD6B800FAD6B800FAD0
      AE00FAD0AE00EEBDA50066666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000305060004088
      A0003090B000304050000000000000000000000000003E3D3D003E3D3D00F1F1
      F100F1F1F100F1F1F100AAAAAA00929292005F5F5F006E6E6E008E8E8E00BABA
      BA00F1F1F100AAAAAA007A7A7A00000000000000000000000000BB887500FCE1
      CA00FCE1CA00FCE1CA00FBDEC500FBDEC500FAD9BD00FAD9BD00FAD6B800FAD6
      B800FAD0AE00EFBFA80066666600000000000000000000000000000000000000
      0000000000000000000000000000B0A090006048300060483000604830006050
      4000705040007050400070504000705040000000000000000000000000000000
      00000000000000000000000000000000000000000000305060003088B00040B8
      E00090E0F00090D0E0006090A0000000000000000000AAAAAA00FAFAFA00F1F1
      F100D5D5D500929292007A7A7A0099999900B1B1B100A6A6A600929292008E8E
      8E00828282005F5F5F007D7D7E00000000000000000000000000C28F7900FCE8
      D700FCE5D100FCE1CA00FCE1CA00FBDEC500FBDEC500FAD9BD00FAD9BD00FAD6
      B800FAD6B800F0C1AB006666660000000000000000000000000000000000A048
      2000000000000000000000000000C0B0A000FFFFFF00E0E8E000E0E0E000E0D8
      D000E0C8C000D0C8B000C0B8A000605040000000000000000000000000009F95
      9600837C7A00665D5600575D560078776F00646A69003080A00040B8E00090E0
      F00090E0F0006098B000000000000000000000000000A6A6A600D8D8D800A6A6
      A60092929200CDCDCD00AAAAAA008E8E8E008282820082828200A6A6A600BABA
      BA0073A38300525252007D7D7E00000000000000000000000000C8957C00FCE8
      D700FCE5D100FCE5D100FCE5D100FCE1CA00FBE0C900FBDEC500FBDEC500FAD9
      BD00FAD9BD00F0C1AB006666660000000000000000000000000000000000B058
      3000A05830000000000000000000C0B0A000FFF8F000E0C8C000E0C8C000D0C0
      B000D0B8B000F0E0D000D0B8B0007050400000000000000000008E827A00A090
      9000C0B0A000E0C8B000E0C0B000C0A890009080700078776F0080C0D000A0D8
      F0006098B0000000000000000000000000000000000077777700A6A6A600D8D8
      D800D8D8D800D8D8D800D8D8D800E5E5E500CDCDCD00BABABA00A6A6A6008E8E
      8E00687B6E004E4E4E0082828200000000000000000000000000CF9C8000FCE8
      D700FDECDE00FCE8D700FCE5D100FCE5D100FCE1CA00FCE1CA00FBDEC500FBDE
      C500FAD9BD00F1C5B1006666660000000000C0785000A0503000A0503000C068
      4000E0805000A058300000000000D0B8A000FFF8F000FFFFFF00FFFFFF00FFF8
      F000FFF0E000FFE8E000D0C0B00070504000000000008E878500B0B0A000FFE8
      E000FFE0D000F0D8C000F0D0C000F0D0B000F0D0B000A0908000707069006088
      9000000000000000000000000000000000000000000099999900E5E5E500D5D5
      D500D5D5D500CDCDCD00D5D5D500CDCDCD00C1C1C100C1C1C100CDCDCD00D5D5
      D500CDCDCD006E6E6E0000000000000000000000000000000000D6A38400FDEC
      DE00FDECDE00FCE8D700FCE8D700FCE5D100FCE5D100FCE1CA00FCE1CA00FBDE
      C500FBDEC500F2C8B6006666660000000000E0987000F0B8A000F0B09000E098
      7000E0906000D0886000E0704000D0B8A000FFFFFF00E0C8C000E0C8C000D0C0
      C000D0B8B000F0E8E000D0C0C00070504000AD9E9700B0A8A000FFF8F000FFF0
      E000FFE8E000FFE8E000F0D8C000F0D0C000F0D0B000F0D0B00090807000908E
      8A00000000000000000000000000000000000000000092929200D5D5D500C1C1
      C100AAAAAA00A6A6A600CDCDCD00F1F1F100F1F1F100F1F1F100D5D5D500BABA
      BA00BABABA007777770000000000000000000000000000000000DCA98700FDF0
      E600FDECDE00FDECDE00FDECDE00FCE8D700FCE8D700FCE5D100FCE1CA00FCE1
      CA00FBDEC500F2C8B6006666660000000000F0B09000F0987000E0886000E080
      5000F0A88000E078400000000000D0B8A000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF8F000FFF0E000FFE8E0007050400099928500D0D0D000FFF8FF00FFF8
      F000FFF0E000FFF0E000F0D0C000F0D8C000F0D0C000F0D0B000C0A890007877
      6F00000000000000000000000000000000000000000000000000A6A6A600C1C1
      C100F1F1F100B1B1B100BABABA00AAAAAA00B1B1B100BABABA00BABABA007777
      7700777777000000000000000000000000000000000000000000DCA98700FDF3
      EC00FDF3EC00FDF0E600FDECDE00FCE8D700FCE8D700FCE8D700FCE5D100FCE5
      D100FCE1CA00F3CCBA006666660000000000000000000000000000000000E088
      5000E07840000000000000000000F0B09000F0A88000F0A08000F0987000E090
      6000E0886000E0805000E0784000D06D370084838300F0F0F000FFF8FF00FFF8
      FF00FFF8F000FFF0E000FFF0E000FFF0E000F0D0C000F0D0C000E0C0B000665D
      560000000000000000000000000000000000000000000000000000000000B3AC
      A500FFD4C600FFD4C600FDD7CD00EEDBD400E6E3E100F1F1F1006E6E6E000000
      0000000000000000000000000000000000000000000000000000DCA98700FDF3
      EC00FDF3EC00FDF0E600FDF0E600FDECDE00FDECDE00FCE8D700FCE8D700FCE5
      D100FCE5D100F3CCBA006666660000000000000000000000000000000000F0A8
      8000000000000000000000000000F0B09000FFC0A000FFC0A000FFC0A000FFB8
      9000FFB08000FFA88000F0A07000D074460093838300F0F0F000FFF8FF00FFF8
      FF00FFF8FF00FFF0E000FFF0E000FFF0E000FFE8E000F0D8C000E0C8B0006665
      650000000000000000000000000000000000000000000000000000000000AB8E
      9100FFDAB400FFDCB900FFDCB900FFDAB400FFD6AD00665C5A00000000000000
      0000000000000000000000000000000000000000000000000000DCA98700FEF8
      F200FDF3EC00FDF3EC00FDF3EC00FDF0E600FDECDE00FDECDE00FCE8D700FCE8
      D700FCE8D700F3CCBA0066666600000000000000000000000000000000000000
      0000000000000000000000000000F0B09000F0A88000F0A88000F0987000F098
      7000E0906000E0885000E0805000E0784000A4989000E0D8D000FFF8FF00FFF8
      FF00FFF8FF00FFF8FF00FFF8F000FFF0E000FFE8E000FFE0D000C0B0A000837C
      7A0000000000000000000000000000000000000000000000000000000000B29E
      8D00FFE5CA00FFE5CA00FFE5CA00FFE5CA00FFE0C200725F5F00000000000000
      0000000000000000000000000000000000000000000000000000DCA98700FEF8
      F200FEF8F200FEF8F200FDF3EC00FDF3EC00FDF3EC00FDF0E600FFD5CC00FFD5
      CC00F5B3AA00B3887E0066666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5A59E00B0B0B000FFF8FF00FFF8
      FF00FFF8FF00FFF8FF00FFF8F000FFF8F000FFF0E000FFE8E000A09090009F95
      960000000000000000000000000000000000000000000000000000000000D9BF
      B700FFEEDD00FFEEDD00FFEEDD00FFEEDD00725F5F0000000000000000000000
      0000000000000000000000000000000000000000000000000000DCA98700FFFF
      FF00FFFFFF00FEF8F200FDF3EC00FDF3EC00FDF3EC00FDF0E600F7A64300F7A6
      4300E09241006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4989000C0C0C000FFF8
      FF00FFF8FF00FFF8FF00FFF8FF00FFF8FF00FFF8F000C0B0B0008E8785000000
      0000000000000000000000000000000000000000000000000000A59A9700FFF7
      EE00FFF7EE00FFF7EE00FFF7EE00FFF7EE00725F5F0000000000000000000000
      0000000000000000000000000000000000000000000000000000DCA98700FFFF
      FF00FFFFFF00FEF8F200FEF8F200FEF8F200FEF6F000FDF3EC00DCA98700EAB3
      7700666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4989000B0B0
      B000E0D8D000F0F0F000F0F0F000D0D8D000B0A8A000998D8500000000000000
      0000000000000000000000000000000000000000000000000000AB8E9100AB8E
      9100AB8E9100AB8E9100AB8E9100AB8E91000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DCA98700DCA9
      8700DCA98700DCA98700DCA98700DCA98700DCA98700D6A38400DCA987006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5A5
      9E00A49890008E8785008483830099928500ADA2970000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F80FE001FFFFFFFFE003C001FFFFFFE7
      C001C001FFFFFFC38001C001FE00FF818001C001EE00E0038001C001E600C007
      8001C0010200800F8003C0010000000F8003C0010200000FC007C001E600000F
      E01FC001EE00000FE03FC001FE00000FE03FC001FFFF000FE07FC003FFFF801F
      C07FC007FFFFC03FC0FFC00FFFFFE07F}
  end
  object fdFont: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Device = fdPrinter
    Left = 8
    Top = 272
  end
end
