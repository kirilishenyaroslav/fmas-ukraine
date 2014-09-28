object TaxInvoicesKorigAddInNaklForm: TTaxInvoicesKorigAddInNaklForm
  Left = 367
  Top = 189
  Width = 581
  Height = 647
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
    Width = 565
    Height = 609
    Align = alClient
    TabOrder = 0
    object SummaGroupBox: TGroupBox
      Left = 1
      Top = 434
      Width = 563
      Height = 119
      Align = alTop
      Caption = #1055#1110#1076#1083#1103#1075#1072#1102#1090#1100' '#1082#1086#1088#1080#1075#1091#1074#1072#1085#1085#1102' '#1086#1073#1089#1103#1075#1080' '#1073#1077#1079' '#1091#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1055#1044#1042', '#1097#1086
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
        Width = 251
        Height = 16
        Caption = #1054#1087#1086#1076#1072#1090#1082#1086#1074'. '#1079#1072' '#1085#1091#1083#1100#1086#1074#1086#1102' '#1089#1090#1072#1074#1082#1086#1102
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
        Width = 251
        Height = 16
        Caption = #1054#1087#1086#1076#1072#1090#1082#1086#1074'. '#1079#1072' '#1086#1089#1085#1086#1074#1085#1086#1102' '#1089#1090#1072#1074#1082#1086#1102
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
        Width = 133
        Height = 16
        Caption = #1047#1074#1110#1083#1100#1085#1077#1085#1110' '#1074#1110#1076' '#1055#1044#1042
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object main_stavkaCurrencyEdit: TcxCurrencyEdit
        Left = 296
        Top = 24
        Width = 209
        Height = 24
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00'#39#39';'
        TabOrder = 0
        OnExit = main_stavkaCurrencyEditExit
        OnKeyPress = main_stavkaCurrencyEditKeyPress
      end
      object null_stavkaCurrencyEdit: TcxCurrencyEdit
        Left = 296
        Top = 52
        Width = 209
        Height = 24
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
        TabOrder = 1
        OnKeyPress = null_stavkaCurrencyEditKeyPress
      end
      object summa_not_pdvCurrencyEdit: TcxCurrencyEdit
        Left = 296
        Top = 80
        Width = 209
        Height = 24
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
        TabOrder = 2
        OnKeyPress = summa_not_pdvCurrencyEditKeyPress
      end
    end
    object PostavkaGroupBox: TGroupBox
      Left = 1
      Top = 234
      Width = 563
      Height = 95
      Align = alTop
      Caption = #1050#1086#1088#1080#1075#1091#1074#1072#1085#1085#1103' '#1082#1110#1083#1100#1082#1086#1089#1090#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object PriceLabel: TLabel
        Left = 33
        Top = 60
        Width = 241
        Height = 16
        Caption = #1062#1110#1085#1072' '#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103' '#1090#1086#1074#1072#1088#1110#1074'/'#1087#1086#1089#1083#1091#1075
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object KolVoLabel: TLabel
        Left = 33
        Top = 28
        Width = 230
        Height = 16
        Caption = #1047#1084#1110#1085#1072' '#1082#1110#1083#1100#1082#1086#1089#1090#1110', '#1086#1073'`'#1108#1084#1091', '#1086#1073#1089#1103#1075#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edit_priceCurrencyEdit: TcxCurrencyEdit
        Left = 296
        Top = 59
        Width = 209
        Height = 24
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
        TabOrder = 0
        OnKeyPress = edit_priceCurrencyEditKeyPress
      end
      object edit_kolvoCurrencyEdit: TcxCurrencyEdit
        Left = 296
        Top = 24
        Width = 209
        Height = 24
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
        TabOrder = 1
        OnKeyPress = edit_kolvoCurrencyEditKeyPress
      end
    end
    object YesButton: TcxButton
      Left = 368
      Top = 568
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 2
      OnClick = YesButtonClick
    end
    object CancelButton: TcxButton
      Left = 448
      Top = 568
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 3
      OnClick = CancelButtonClick
    end
    object DataGroupBox: TGroupBox
      Left = 1
      Top = 1
      Width = 563
      Height = 168
      Align = alTop
      TabOrder = 4
      object DateKorrectLabel: TLabel
        Left = 33
        Top = 20
        Width = 136
        Height = 16
        Caption = #1044#1072#1090#1072' '#1082#1086#1088#1080#1075#1091#1074#1072#1085#1085#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RangeOfDeliveryLabel: TLabel
        Left = 33
        Top = 76
        Width = 171
        Height = 16
        Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072' '#1090#1086#1074#1072#1088#1110#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ReasonLabel: TLabel
        Left = 33
        Top = 44
        Width = 165
        Height = 16
        Caption = #1055#1088#1080#1095#1080#1085#1072' '#1082#1086#1088#1080#1075#1091#1074#1072#1085#1085#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MeasuresLabel: TLabel
        Left = 33
        Top = 124
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
      object DateKorrectEdit: TcxDateEdit
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
        OnKeyPress = DateKorrectEditKeyPress
      end
      object RangeOfDeliveryButtonEdit: TcxButtonEdit
        Left = 224
        Top = 72
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
        Top = 96
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
        Top = 96
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
        Top = 96
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
      object ReasonTextEdit: TcxTextEdit
        Left = 224
        Top = 43
        Width = 281
        Height = 24
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 5
        Text = 'ReasonTextEdit'
        OnKeyPress = ReasonTextEditKeyPress
      end
      object MeasuresButtonEdit: TcxButtonEdit
        Left = 224
        Top = 128
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
        TabOrder = 6
        Text = #1087#1086#1089#1083#1091#1075#1072
        OnKeyPress = MeasuresButtonEditKeyPress
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 169
      Width = 563
      Height = 65
      Align = alTop
      Caption = #1050#1086#1076' '#1090#1086#1074#1072#1088#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object KodTovarCheckBox: TCheckBox
        Left = 32
        Top = 24
        Width = 113
        Height = 17
        Caption = #1050#1086#1076' '#1090#1086#1074#1072#1088#1091
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
        Left = 224
        Top = 24
        Width = 281
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
    object GroupBox2: TGroupBox
      Left = 1
      Top = 329
      Width = 563
      Height = 105
      Align = alTop
      Caption = #1050#1086#1088#1080#1075#1091#1074#1072#1085#1085#1103' '#1074#1072#1088#1090#1086#1089#1090#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object Label1: TLabel
        Left = 33
        Top = 28
        Width = 78
        Height = 16
        Caption = #1047#1084#1110#1085#1072' '#1094#1110#1085#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 33
        Top = 52
        Width = 260
        Height = 16
        Caption = #1050#1110#1083#1100'-'#1090#1100' '#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103' '#1090#1086#1074#1072#1088#1110#1074'/'#1087#1086#1089#1083#1091#1075
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edit_price_costCurrencyEdit: TcxCurrencyEdit
        Left = 296
        Top = 16
        Width = 209
        Height = 24
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
        TabOrder = 0
        OnKeyPress = edit_price_costCurrencyEditKeyPress
      end
      object edit_kolvo_costTextEdit: TcxTextEdit
        Left = 296
        Top = 56
        Width = 209
        Height = 24
        TabOrder = 1
        Text = 'edit_kolvo_costTextEdit'
      end
    end
  end
end
