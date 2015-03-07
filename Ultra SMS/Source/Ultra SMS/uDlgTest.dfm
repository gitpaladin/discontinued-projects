object dlgTest: TdlgTest
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 215
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = #32534#30721#27979#35797
  ClientHeight = 489
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pgcCodingtest: TPageControl
    Left = 7
    Top = 8
    Width = 554
    Height = 473
    ActivePage = tsControlTest
    TabOrder = 0
    object tsCharset: TTabSheet
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = #23383#31526#32534#30721#27979#35797
      object mmoSource: TMemo
        Left = 3
        Top = 3
        Width = 540
        Height = 192
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object mmoResult: TMemo
        Left = 3
        Top = 232
        Width = 540
        Height = 210
        Color = clBtnFace
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 6
      end
      object btnEncodingbit: TButton
        Left = 3
        Top = 201
        Width = 75
        Height = 25
        Caption = '7-bit '#32534#30721'(&E)'
        TabOrder = 1
        OnClick = btnEncodingbitClick
      end
      object btnDecodingbit: TButton
        Left = 84
        Top = 201
        Width = 75
        Height = 25
        Caption = '7-bit '#35299#30721'(&D)'
        TabOrder = 2
        OnClick = btnDecodingbitClick
      end
      object btnDecodingUCS2: TButton
        Left = 246
        Top = 201
        Width = 75
        Height = 25
        Caption = 'UCS2 '#35299#30721'(&S)'
        TabOrder = 4
        OnClick = btnDecodingUCS2Click
      end
      object btnEncodeUCS2: TButton
        Left = 165
        Top = 201
        Width = 75
        Height = 25
        Caption = 'UCS2 '#32534#30721'(&U)'
        TabOrder = 3
        OnClick = btnEncodeUCS2Click
      end
      object btnCopyToSource: TButton
        Left = 518
        Top = 201
        Width = 25
        Height = 25
        Caption = #8593
        TabOrder = 5
        OnClick = btnCopyToSourceClick
      end
    end
    object edit: TTabSheet
      Caption = #30005#35805#21495#30721#32534#30721
      ImageIndex = 1
      object txtSource: TEdit
        Left = 3
        Top = 3
        Width = 540
        Height = 21
        TabOrder = 0
      end
      object txtResult: TEdit
        Left = 3
        Top = 62
        Width = 540
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 5
      end
      object btnEncodingNumber: TButton
        Left = 3
        Top = 31
        Width = 75
        Height = 25
        Caption = #32534#30721'(&E)'
        TabOrder = 1
        OnClick = btnEncodingNumberClick
      end
      object btnDecoding: TButton
        Left = 84
        Top = 31
        Width = 75
        Height = 25
        Caption = #35299#30721'(&D)'
        TabOrder = 2
        OnClick = btnDecodingClick
      end
      object btnCopytoSrc: TButton
        Left = 518
        Top = 31
        Width = 25
        Height = 25
        Caption = #8593
        TabOrder = 3
        OnClick = btnCopytoSrcClick
      end
      object chkInfoCenter: TCheckBox
        Left = 165
        Top = 35
        Width = 108
        Height = 17
        Caption = #20449#24687#20013#24515#21495#30721'(&C)'
        TabOrder = 4
      end
    end
    object tsPDU: TTabSheet
      Caption = 'PDU'#32534#30721
      ImageIndex = 2
      object grpEncoding: TGroupBox
        Left = 3
        Top = 3
        Width = 534
        Height = 230
        Caption = #32534#30721
        TabOrder = 0
        object lblContent: TLabel
          Left = 9
          Top = 15
          Width = 43
          Height = 13
          Caption = #20869#23481'(&C):'
        end
        object mmoSMS: TMemo
          Left = 9
          Top = 30
          Width = 512
          Height = 43
          ScrollBars = ssVertical
          TabOrder = 0
          OnChange = mmoSMSChange
        end
        object txtNumber: TLabeledEdit
          Left = 9
          Top = 96
          Width = 121
          Height = 21
          EditLabel.Width = 66
          EditLabel.Height = 13
          EditLabel.Caption = #30005#35805#21495#30721'(&P):'
          TabOrder = 2
        end
        object txtInfoCenter: TLabeledEdit
          Left = 145
          Top = 96
          Width = 121
          Height = 21
          EditLabel.Width = 88
          EditLabel.Height = 13
          EditLabel.Caption = #20449#24687#20013#24515#21495#30721'(&I):'
          TabOrder = 3
        end
        object txtMessageRef: TLabeledEdit
          Left = 281
          Top = 96
          Width = 80
          Height = 21
          EditLabel.Width = 79
          EditLabel.Height = 13
          EditLabel.Caption = #28040#24687#21442#32771#20540'(&R):'
          TabOrder = 4
          Text = '0'
        end
        object chkMsgReport: TCheckBox
          Left = 376
          Top = 79
          Width = 145
          Height = 17
          Caption = #38656#35201#28040#24687#25253#21578'(&M)'
          TabOrder = 1
        end
        object chkCSMS: TCheckBox
          Left = 376
          Top = 102
          Width = 81
          Height = 17
          Caption = #32423#32852#30701#20449'(&N)'
          TabOrder = 5
        end
        object chkUnicode: TCheckBox
          Left = 472
          Top = 102
          Width = 49
          Height = 17
          Caption = '&UCS2'
          TabOrder = 6
        end
        object mmoPDUResult: TMemo
          Left = 9
          Top = 154
          Width = 512
          Height = 63
          Color = clBtnFace
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 7
        end
        object btnPDUEncoding: TButton
          Left = 9
          Top = 123
          Width = 121
          Height = 25
          Caption = 'PDU '#32534#30721'(&D)'
          TabOrder = 8
          OnClick = btnPDUEncodingClick
        end
      end
      object grpDecoding: TGroupBox
        Left = 3
        Top = 239
        Width = 534
        Height = 194
        Caption = #35299#30721
        TabOrder = 1
        object mmoPDUSrc: TMemo
          Left = 9
          Top = 16
          Width = 512
          Height = 43
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object mmoPduDecResult: TMemo
          Left = 9
          Top = 96
          Width = 512
          Height = 88
          Color = clBtnFace
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object btnPDUDecoding: TButton
          Left = 9
          Top = 65
          Width = 121
          Height = 25
          Caption = 'PDU '#35299#30721'(&D)'
          TabOrder = 2
        end
      end
    end
    object tsControlTest: TTabSheet
      Caption = #25511#20214#27979#35797
      ImageIndex = 3
      ExplicitLeft = 0
    end
  end
end
