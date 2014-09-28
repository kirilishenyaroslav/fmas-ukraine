object TaxLiabilitiesSummaEnableForm: TTaxLiabilitiesSummaEnableForm
  Left = 368
  Top = 352
  Width = 582
  Height = 267
  Caption = #1042#1089#1090#1072#1085#1086#1074#1080#1090#1080' '#1089#1091#1084#1080' '#1076#1083#1103' '#1087#1086#1076#1072#1090#1082#1086#1074#1086#1075#1086' '#1079#1086#1073#1086#1074#39#1103#1079#1072#1085#1085#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object NameTaxLiabilitiesGroupBox: TcxGroupBox
    Left = 0
    Top = 0
    Width = 566
    Height = 57
    Align = alTop
    Alignment = alTopLeft
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1087#1086#1076#1072#1090#1082#1086#1074#1086#1075#1086' '#1079#1086#1073#1086#1074#39#1103#1079#1072#1085#1085#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object SummaEnableDBTextEdit: TcxDBTextEdit
      Left = 16
      Top = 24
      Width = 537
      Height = 24
      DataBinding.DataField = 'NAME'
      DataBinding.DataSource = TaxLiabilitiesDM.TaxLiabilitiesDSource
      Style.Color = clBtnFace
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = True
      Style.Shadow = False
      TabOrder = 0
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 57
    Width = 566
    Height = 128
    Align = alTop
    Alignment = alTopLeft
    Caption = #1057#1091#1084#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object SummaTaxable20CheckBox: TcxCheckBox
      Left = 16
      Top = 24
      Width = 225
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = '20%, '#1073#1072#1079#1072' '#1086#1087#1086#1076#1072#1090#1082#1091#1074#1072#1085#1085#1103
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object SummaPDVCheckBox: TcxCheckBox
      Left = 312
      Top = 24
      Width = 209
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = '20%, '#1089#1091#1084#1072' '#1055#1044#1042
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object SummaTaxableCheckBox: TcxCheckBox
      Left = 16
      Top = 56
      Width = 257
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = '0%, '#1073#1072#1079#1072' '#1086#1087#1086#1076#1072#1090#1082#1091#1074#1072#1085#1085#1103
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object SummaExemptCheckBox: TcxCheckBox
      Left = 312
      Top = 56
      Width = 249
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1074#1110#1083#1100#1085#1077#1085#1110' '#1074#1110#1076' '#1086#1087#1086#1076#1072#1090#1082#1091#1074#1072#1085#1085#1103
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object SummaExportCheckBox: TcxCheckBox
      Left = 16
      Top = 88
      Width = 265
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1045#1082#1089#1087#1086#1088#1090'('#1073#1072#1079#1072' '#1086#1087#1086#1076#1072#1090#1082#1091#1074#1072#1085#1085#1103'.)'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
  end
  object YesButton: TcxButton
    Left = 392
    Top = 192
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    Default = True
    TabOrder = 2
    OnClick = YesButtonClick
  end
  object CancelButton: TcxButton
    Left = 472
    Top = 192
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = CancelButtonClick
  end
end
