object fraAdditionTask: TfraAdditionTask
  Left = 0
  Top = 0
  Width = 466
  Height = 198
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object lblCategory: TLabel
    Left = 80
    Top = 107
    Width = 48
    Height = 12
    Caption = #31867#22411'(&C):'
    Enabled = False
    FocusControl = cboCategory
  end
  object lblModel: TLabel
    Left = 80
    Top = 131
    Width = 48
    Height = 12
    Caption = #22411#21495'(&M):'
    Enabled = False
    FocusControl = cboModel
  end
  object chkPhoneBook: TCheckBox
    Left = 56
    Top = 32
    Width = 377
    Height = 17
    Caption = #35835#21462#31227#21160#30005#35805#20013#30340#30005#35805#31807'(&H)'
    TabOrder = 0
  end
  object chkSMS: TCheckBox
    Left = 56
    Top = 56
    Width = 377
    Height = 17
    Caption = #35835#21462#31227#21160#30005#35805#20013#30340#30701#20449'(&S)'
    TabOrder = 1
  end
  object chkEnablePreset: TCheckBox
    Left = 56
    Top = 80
    Width = 353
    Height = 17
    Caption = #21152#36733#39044#35774#37197#32622'(&P)'
    TabOrder = 2
    OnClick = chkEnablePresetClick
  end
  object cboCategory: TComboBox
    Left = 152
    Top = 104
    Width = 257
    Height = 20
    Style = csDropDownList
    Enabled = False
    ItemHeight = 0
    Sorted = True
    TabOrder = 3
    OnSelect = cboCategorySelect
  end
  object cboModel: TComboBox
    Left = 152
    Top = 128
    Width = 257
    Height = 20
    Style = csDropDownList
    Enabled = False
    ItemHeight = 0
    Sorted = True
    TabOrder = 4
  end
end
