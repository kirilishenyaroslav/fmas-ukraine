object frmDateReg: TfrmDateReg
  Left = 759
  Top = 122
  Width = 218
  Height = 126
  Caption = 'frmDateReg'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonOk: TcxButton
    Left = 24
    Top = 56
    Width = 75
    Height = 25
    Caption = 'ButtonOk'
    TabOrder = 0
    OnClick = ButtonOkClick
  end
  object ButtonCansel: TcxButton
    Left = 112
    Top = 56
    Width = 75
    Height = 25
    Caption = 'ButtonCansel'
    TabOrder = 1
    OnClick = ButtonCanselClick
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 8
    Width = 0
    Height = 4
    TabOrder = 2
    Caption = ''
  end
  object ComboBox_month: TcxComboBox
    Left = 16
    Top = 24
    Width = 97
    Height = 21
    TabOrder = 3
    Text = 'ComboBox_month'
  end
  object ComboBox_year: TcxComboBox
    Left = 120
    Top = 24
    Width = 73
    Height = 21
    TabOrder = 4
    Text = 'ComboBox_year'
  end
end
