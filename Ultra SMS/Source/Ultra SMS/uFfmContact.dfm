object ffmContact: TffmContact
  Left = 191
  Top = 116
  AlphaBlend = True
  AlphaBlendValue = 215
  BorderStyle = bsNone
  BorderWidth = 1
  ClientHeight = 451
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  inline fraContact: TfraContact
    Left = 0
    Top = 0
    Width = 320
    Height = 452
    Color = clWhite
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    OnMouseMove = FormMouseMove
  end
  object tmrHide: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = tmrHideTimer
    Left = 232
    Top = 24
  end
end
