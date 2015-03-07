object PasswordDlg: TPasswordDlg
  Left = 450
  Top = 431
  BorderStyle = bsDialog
  Caption = #36755#20837#23494#30721
  ClientHeight = 93
  ClientWidth = 233
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  object lblPassword: TLabel
    Left = 8
    Top = 9
    Width = 108
    Height = 12
    Caption = #35831#36755#20837#24744#30340#23494#30721'(&P):'
  end
  object txtPassword: TEdit
    Left = 8
    Top = 27
    Width = 217
    Height = 20
    PasswordChar = '*'
    TabOrder = 0
  end
  object btnOKBtn: TButton
    Left = 70
    Top = 59
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = btnOKBtnClick
  end
  object btnCancelBtn: TButton
    Left = 150
    Top = 59
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
    OnClick = btnCancelBtnClick
  end
end
