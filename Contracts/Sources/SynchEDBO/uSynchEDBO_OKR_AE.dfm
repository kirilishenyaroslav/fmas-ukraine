object frmSynchEDBO_OKR_AE: TfrmSynchEDBO_OKR_AE
  Left = 545
  Top = 307
  Width = 481
  Height = 327
  Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103' '#1079#1074#39#1103#1079#1082#1091' '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TcxButton
    Left = 278
    Top = 257
    Width = 87
    Height = 25
    Caption = #1057#1074#1103#1079#1072#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 371
    Top = 257
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Width = 204
    Height = 17
    TabOrder = 2
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1092#1086#1088#1084#1080' '#1085#1072#1074#1095#1072#1085#1085#1103' '#1045#1044#1041#1054
  end
  object TextEdit_form_stud_edbo: TcxTextEdit
    Left = 8
    Top = 24
    Width = 449
    Height = 21
    Properties.ReadOnly = True
    Style.Color = 16311512
    TabOrder = 3
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 88
    Width = 170
    Height = 17
    TabOrder = 4
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1092#1086#1088#1084#1080' '#1085#1072#1074#1095#1072#1085#1085#1103
  end
  object ButtonEdit_form_stud: TcxButtonEdit
    Left = 8
    Top = 104
    Width = 449
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEdit_form_studPropertiesButtonClick
    Style.Color = 16311512
    TabOrder = 5
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 128
    Width = 181
    Height = 17
    TabOrder = 6
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1082#1072#1090#1077#1075#1086#1088#1110#1111' '#1085#1072#1074#1095#1072#1085#1085#1103
  end
  object ButtonEdit_kat_stud: TcxButtonEdit
    Left = 8
    Top = 144
    Width = 449
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEdit_kat_studPropertiesButtonClick
    Style.Color = 16311512
    TabOrder = 7
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 48
    Width = 142
    Height = 17
    TabOrder = 8
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1054#1050#1056' '#1045#1044#1041#1054
  end
  object TextEdit_OKR_edbo: TcxTextEdit
    Left = 8
    Top = 64
    Width = 449
    Height = 21
    Properties.ReadOnly = True
    Style.Color = 16311512
    TabOrder = 9
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 168
    Width = 124
    Height = 17
    TabOrder = 10
    Caption = #1050#1091#1088#1089' '#1087#1086#1095#1072#1090#1082#1091' '#1085#1072#1074#1095#1072#1085#1085#1103
  end
  object cxLabel6: TcxLabel
    Left = 8
    Top = 208
    Width = 142
    Height = 17
    TabOrder = 11
    Caption = #1058#1077#1088#1084#1110#1085' '#1085#1072#1074#1095#1072#1085#1085#1103
  end
  object CurrencyEdit_kurs_beg: TcxCurrencyEdit
    Left = 8
    Top = 184
    Width = 449
    Height = 21
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '0'
    Style.Color = 16311512
    TabOrder = 12
  end
  object CurrencyEdit_term_stud: TcxCurrencyEdit
    Left = 8
    Top = 224
    Width = 449
    Height = 21
    Properties.DisplayFormat = '0.00'
    Style.Color = 16311512
    TabOrder = 13
  end
end
