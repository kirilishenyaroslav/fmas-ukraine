object frmFilterMonth: TfrmFilterMonth
  Left = 438
  Top = 331
  Width = 314
  Height = 142
  Caption = #1052#1110#1089#1103#1094#1110
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 89
    Width = 306
    Height = 19
    Panels = <>
  end
  object cxButtonEnter: TcxButton
    Left = 112
    Top = 56
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    Default = True
    TabOrder = 1
    OnClick = cxButtonEnterClick
  end
  object cxButtonCancel: TcxButton
    Left = 216
    Top = 56
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 2
    OnClick = cxButtonCancelClick
  end
  object MonthComboBox: TcxComboBox
    Left = 64
    Top = 14
    Width = 225
    Height = 21
    ParentFont = False
    Properties.OnChange = MonthComboBoxPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 16
    Width = 50
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = #1052#1110#1089#1103#1094#1100
  end
end
