object TaxInvoicesEditAddInNaklForm: TTaxInvoicesEditAddInNaklForm
  Left = 597
  Top = 318
  Width = 553
  Height = 530
  Caption = #1044#1086#1076#1072#1090#1080' '#1090#1086#1074#1072#1088' '#1091' '#1085#1072#1082#1083#1072#1076#1085#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 492
    Align = alClient
    TabOrder = 0
    object SummaGroupBox: TGroupBox
      Left = 1
      Top = 225
      Width = 535
      Height = 152
      Align = alTop
      Caption = #1054#1073#1089#1103#1075#1080' '#1087#1086#1089#1090#1072#1074#1082#1080' '#1073#1077#1079' '#1091#1088#1072#1093#1091#1074'. '#1055#1044#1042', '#1097#1086' '#1087#1110#1076#1083#1103#1075#1072#1102#1090#1100' '#1086#1087#1086#1076#1072#1090#1082#1091#1074#1072#1085#1085#1102
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object ValueDeliveryExportLabel: TLabel
        Left = 33
        Top = 53
        Width = 100
        Height = 16
        Caption = '0 % ('#1077#1082#1089#1087#1086#1088#1090')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ValueDelivery20Label: TLabel
        Left = 33
        Top = 28
        Width = 108
        Height = 16
        Caption = #1086#1073#1089#1103#1075' '#1073#1077#1079' '#1055#1044#1042
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ValueDeliveryVATexemptionsLabel: TLabel
        Left = 33
        Top = 116
        Width = 146
        Height = 16
        Caption = #1047#1074#1110#1083#1100#1085#1077#1085#1085#1103' '#1074#1110#1076' '#1055#1044#1042
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ValueDeliveryCustomsLabel: TLabel
        Left = 33
        Top = 78
        Width = 136
        Height = 32
        Caption = '0 % ('#1088#1077#1072#1083#1110#1079#1072#1094#1110#1103' '#1085#1072#13#10' '#1084#1080#1090#1085#1110#1081' '#1090#1077#1088#1080#1090#1086#1088#1110#1111')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ValueDelivery20CurrencyEdit: TcxCurrencyEdit
        Left = 192
        Top = 24
        Width = 225
        Height = 24
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00'#39#39';'
        TabOrder = 0
        OnExit = ValueDelivery20CurrencyEditExit
        OnKeyPress = ValueDelivery20CurrencyEditKeyPress
      end
      object ValueDeliveryExportCurrencyEdit: TcxCurrencyEdit
        Left = 192
        Top = 52
        Width = 225
        Height = 24
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00'#39#39';'
        TabOrder = 1
        OnKeyPress = ValueDeliveryExportCurrencyEditKeyPress
      end
      object ValueDeliveryCustomsCurrencyEdit: TcxCurrencyEdit
        Left = 192
        Top = 80
        Width = 225
        Height = 24
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00'#39#39';'
        TabOrder = 2
        OnKeyPress = ValueDeliveryCustomsCurrencyEditKeyPress
      end
      object ValueDeliveryVATexemptionsCurrencyEdit: TcxCurrencyEdit
        Left = 192
        Top = 112
        Width = 225
        Height = 24
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00'#39#39';'
        TabOrder = 3
        OnKeyPress = ValueDeliveryVATexemptionsCurrencyEditKeyPress
      end
    end
    object PostavkaGroupBox: TGroupBox
      Left = 1
      Top = 113
      Width = 535
      Height = 112
      Align = alTop
      Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1088#1086' '#1087#1086#1089#1090#1072#1074#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object MeasuresLabel: TLabel
        Left = 33
        Top = 28
        Width = 119
        Height = 16
        Caption = #1054#1076#1080#1085#1080#1094#1103' '#1074#1080#1084#1110#1088#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PriceLabel: TLabel
        Left = 33
        Top = 76
        Width = 190
        Height = 16
        Caption = #1062#1110#1085#1072' '#1079#1072' '#1086#1076#1080#1085#1080#1094#1102' '#1073#1077#1079' '#1055#1044#1042
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object KolVoLabel: TLabel
        Left = 33
        Top = 52
        Width = 67
        Height = 16
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MeasuresButtonEdit: TcxButtonEdit
        Left = 224
        Top = 24
        Width = 281
        Height = 21
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = False
        Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
        Text = #1087#1086#1089#1083#1091#1075#1072
        OnKeyPress = MeasuresButtonEditKeyPress
      end
      object PriceCurrencyEdit: TcxCurrencyEdit
        Left = 224
        Top = 75
        Width = 281
        Height = 24
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DecimalPlaces = 5
        Properties.DisplayFormat = ',0.00000'#39#39';-,0.00000'#39#39
        TabOrder = 1
        OnKeyPress = PriceCurrencyEditKeyPress
      end
      object KolVoTextEdit: TcxTextEdit
        Left = 224
        Top = 48
        Width = 281
        Height = 24
        TabOrder = 2
        Text = 'KolVoTextEdit'
        OnKeyPress = KolVoTextEditKeyPress
      end
    end
    object YesButton: TcxButton
      Left = 360
      Top = 448
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 2
      OnClick = YesButtonClick
    end
    object CancelButton: TcxButton
      Left = 440
      Top = 448
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 3
      OnClick = CancelButtonClick
    end
    object DataGroupBox: TGroupBox
      Left = 1
      Top = 1
      Width = 535
      Height = 112
      Align = alTop
      TabOrder = 4
      object DateShipmentLabel: TLabel
        Left = 33
        Top = 20
        Width = 152
        Height = 16
        Caption = #1044#1072#1090#1072' '#1074#1110#1076#1074#1072#1085#1090#1072#1078#1077#1085#1085#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RangeOfDeliveryLabel: TLabel
        Left = 33
        Top = 44
        Width = 187
        Height = 16
        Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072' '#1087#1086#1089#1090#1072#1074#1082#1080' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DateShipmentEdit: TcxDateEdit
        Left = 224
        Top = 16
        Width = 185
        Height = 21
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
        OnKeyPress = DateShipmentEditKeyPress
      end
      object RangeOfDeliveryButtonEdit: TcxButtonEdit
        Left = 224
        Top = 40
        Width = 281
        Height = 21
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
        OnKeyPress = RangeOfDeliveryButtonEditKeyPress
      end
      object MonthList: TComboBox
        Left = 224
        Top = 64
        Width = 185
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 16
        ParentFont = False
        TabOrder = 2
        Text = 'MonthList'
      end
      object YearSpinEdit: TSpinEdit
        Left = 408
        Top = 64
        Width = 97
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 3
        Value = 0
      end
      object ZaCheckBox: TCheckBox
        Left = 184
        Top = 64
        Width = 41
        Height = 17
        Caption = #1079#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = ZaCheckBoxClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 376
      Width = 529
      Height = 65
      Caption = #1050#1086#1076' '#1090#1086#1074#1072#1088#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object KodTovarCheckBox: TCheckBox
        Left = 40
        Top = 24
        Width = 113
        Height = 17
        Caption = #1082#1086#1076' '#1090#1086#1074#1072#1088#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = KodTovarCheckBoxClick
      end
      object KodTovarButtonEdit: TcxButtonEdit
        Left = 192
        Top = 24
        Width = 313
        Height = 24
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = KodTovarButtonEditPropertiesButtonClick
        TabOrder = 1
        Text = 'KodTovarButtonEdit'
        OnClick = KodTovarButtonEditClick
      end
    end
  end
end
