object TaxLiabilitiesSummaEnableOtrNaklForm: TTaxLiabilitiesSummaEnableOtrNaklForm
  Left = 439
  Top = 171
  BorderStyle = bsDialog
  Caption = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103' '#1086#1087#1077#1088#1072#1094#1110#1111
  ClientHeight = 262
  ClientWidth = 784
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
    Width = 784
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
      Left = 128
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
    Width = 784
    Height = 160
    Align = alTop
    Alignment = alTopLeft
    Caption = #1054#1073#1077#1088#1110#1090#1100' '#1089#1091#1084#1080', '#1103#1082#1110' '#1084#1086#1078#1085#1072' '#1088#1077#1076#1072#1075#1091#1074#1072#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object summa_20_0_not_pdvCheckBox: TcxCheckBox
      Left = 8
      Top = 24
      Width = 345
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = '20%, 0%  '#1074#1072#1088'-'#1090#1100' '#1073#1077#1079' '#1055#1044#1042
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object summa_20_0_pdvCheckBox: TcxCheckBox
      Left = 416
      Top = 24
      Width = 209
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = '20%, 0% '#1089#1091#1084#1072' '#1055#1044#1042
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object summa_exempt_not_pdvCheckBox: TcxCheckBox
      Left = 8
      Top = 56
      Width = 353
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1074#1110#1083#1100#1085#1077#1085#1110' '#1074#1110#1076' '#1086#1087#1086#1076#1072#1090#1082#1091#1074'. '#1074#1072#1088#1090#1110#1089#1090#1100' '#1073#1077#1079' '#1055#1044#1042
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object summa_exempt_pdvCheckBox: TcxCheckBox
      Left = 416
      Top = 56
      Width = 393
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1074#1110#1083#1100#1085#1077#1085#1110' '#1074#1110#1076' '#1086#1087#1086#1076#1072#1090#1082#1091#1074#1072#1085#1085#1103' '#1089#1091#1084#1072' '#1055#1044#1042
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object summa_econ_activ_not_pdvCheckBox: TcxCheckBox
      Left = 8
      Top = 88
      Width = 409
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1071#1082#1110' '#1085#1077' '#1087#1088#1080#1079#1085'. '#1076#1083#1103' '#1074#1080#1082#1086#1088'. '#1091' '#1075#1086#1089#1087'. '#1076'. '#1074#1072#1088#1090'-'#1090#1100' '#1073#1077#1079' '#1055#1044#1042
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object summa_econ_activ_pdvCheckBox: TcxCheckBox
      Left = 416
      Top = 88
      Width = 401
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1071#1082#1110' '#1085#1077' '#1087#1088#1080#1079#1085'. '#1076#1083#1103' '#1074#1080#1082#1086#1088'. '#1091' '#1075#1086#1089#1087'. '#1076'. '#1089#1091#1084#1072' '#1055#1044#1042
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
    object summa_delivery_not_pdvCheckBox: TcxCheckBox
      Left = 8
      Top = 120
      Width = 337
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1044#1083#1103' '#1087#1086#1089#1090#1072#1074#1082#1080' '#1087#1086#1089#1083#1091#1075' '#1074#1072#1088#1090#1110#1089#1090#1100' '#1073#1077#1079' '#1055#1044#1042' '
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
    end
    object summa_delivery_pdvCheckBox: TcxCheckBox
      Left = 416
      Top = 120
      Width = 321
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1044#1083#1103' '#1087#1086#1089#1090#1072#1074#1082#1080' '#1087#1086#1089#1083#1091#1075' '#1089#1091#1084#1072' '#1055#1044#1042
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
    end
  end
  object YesButton: TcxButton
    Left = 608
    Top = 224
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    Default = True
    TabOrder = 2
    OnClick = YesButtonClick
  end
  object CancelButton: TcxButton
    Left = 696
    Top = 224
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = CancelButtonClick
  end
end
