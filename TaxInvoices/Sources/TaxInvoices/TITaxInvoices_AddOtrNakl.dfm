object TITaxInvoicesAddOtrNaklForm: TTITaxInvoicesAddOtrNaklForm
  Left = 369
  Top = 242
  BorderStyle = bsDialog
  Caption = 'TITaxInvoicesAddOtrNaklForm'
  ClientHeight = 623
  ClientWidth = 781
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object MainInfoNaklGroupBox: TcxGroupBox
    Left = 8
    Top = 32
    Width = 753
    Height = 57
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object DataVipNaklLabel: TcxLabel
      Left = 408
      Top = 32
      Width = 109
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = #1076#1072#1090#1072' '#1074#1080#1087#1080#1089#1082#1080
    end
    object NumNaklLabel: TcxLabel
      Left = 408
      Top = 10
      Width = 55
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #1085#1086#1084#1077#1088
    end
    object DateVipDateEdit: TcxDateEdit
      Left = 546
      Top = 32
      Width = 135
      Height = 24
      Properties.ShowTime = False
      TabOrder = 2
      OnKeyPress = DateVipDateEditKeyPress
    end
    object NumNaklTextEdit: TcxTextEdit
      Left = 544
      Top = 7
      Width = 135
      Height = 24
      TabOrder = 3
      Text = 'NumNaklTextEdit'
      OnKeyPress = NumNaklTextEditKeyPress
    end
    object NumOrderLabel: TcxLabel
      Left = 64
      Top = 7
      Width = 54
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Caption = #8470' '#1079'.'#1087'.'
    end
    object NumOrderTextEdit: TcxTextEdit
      Left = 202
      Top = 7
      Width = 135
      Height = 24
      TabOrder = 5
      Text = 'NumOrderTextEdit'
      OnExit = NumOrderTextEditExit
      OnKeyPress = NumOrderTextEditKeyPress
    end
    object DateOtrNaklLabel: TcxLabel
      Left = 64
      Top = 33
      Width = 128
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
      Caption = #1076#1072#1090#1072' '#1086#1090#1088#1080#1084#1072#1085#1085#1103
    end
    object DateOtrDateEdit: TcxDateEdit
      Left = 202
      Top = 32
      Width = 137
      Height = 24
      Properties.ShowTime = False
      TabOrder = 7
      OnKeyPress = DateOtrDateEditKeyPress
    end
  end
  object TaxLiabilitiesGroupBox: TcxGroupBox
    Left = 0
    Top = 712
    Width = 585
    Height = 57
    Alignment = alTopLeft
    Caption = #1050#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object KodButtonEdit: TcxButtonEdit
      Left = 88
      Top = 24
      Width = 401
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = KodButtonEditPropertiesButtonClick
      TabOrder = 0
      Text = 'KodButtonEdit'
      OnKeyPress = KodButtonEditKeyPress
    end
  end
  object ProviderGroupBox: TcxGroupBox
    Left = 8
    Top = 168
    Width = 753
    Height = 137
    Alignment = alTopLeft
    Caption = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object IPNProviderLabel: TLabel
      Left = 40
      Top = 20
      Width = 144
      Height = 16
      Caption = #1030#1055#1053' '#1087#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ProviderButtonEdit: TcxButtonEdit
      Left = 88
      Top = 42
      Width = 593
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = CustomerButtonEditPropertiesButtonClick
      TabOrder = 0
      Text = 'ProviderButtonEdit'
      OnKeyPress = ProviderButtonEditKeyPress
    end
    object IPNProviderTextEdit: TcxTextEdit
      Left = 192
      Top = 16
      Width = 489
      Height = 24
      Properties.ReadOnly = False
      Style.Color = clWhite
      TabOrder = 1
      Text = 'IPNProviderTextEdit'
      OnKeyPress = IPNProviderTextEditKeyPress
    end
    object FullNameCheckBox: TCheckBox
      Left = 40
      Top = 68
      Width = 401
      Height = 17
      Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103' '#1087#1086#1074#1085#1086#1111' '#1085#1072#1079#1074#1080' '#1087#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = FullNameCheckBoxClick
    end
    object SaveFullNameButton: TcxButton
      Left = 624
      Top = 96
      Width = 57
      Height = 25
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = SaveFullNameButtonClick
    end
    object FullNameMemo: TcxMemo
      Left = 88
      Top = 88
      Width = 529
      Height = 41
      Lines.Strings = (
        'FullNameMemo')
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = []
      TabOrder = 4
      OnKeyPress = FullNameMemoKeyPress
    end
  end
  object SummaGroupBox: TcxGroupBox
    Left = 8
    Top = 296
    Width = 769
    Height = 265
    Alignment = alTopLeft
    Caption = #1057#1091#1084#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object summa_20_0_not_pdv_Label: TLabel
      Left = 8
      Top = 28
      Width = 101
      Height = 26
      Caption = '20%, 0% '#13#10#1074#1072#1088#1090'-'#1090#1100' '#1073#1077#1079' '#1055#1044#1042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object summa_20_0_pdv_Label: TLabel
      Left = 205
      Top = 28
      Width = 61
      Height = 26
      Caption = '20%, 0% '#13#10#1089#1091#1084#1072' '#1055#1044#1042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object summa_exempt_not_pdv_Label: TLabel
      Left = 8
      Top = 90
      Width = 114
      Height = 26
      Caption = #1047#1074#1110#1083#1100#1085#1077#1085#1110' '#1074#1110#1076' '#1086#1087#1086#1076'.'#13#10#1074#1072#1088#1090'-'#1090#1100' '#1073#1077#1079' '#1055#1044#1042' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object summa_exempt_pdv_Label: TLabel
      Left = 205
      Top = 90
      Width = 114
      Height = 26
      Caption = #1047#1074#1110#1083#1100#1085#1077#1085#1110' '#1074#1110#1076' '#1086#1087#1086#1076'.'#13#10#1089#1091#1084#1072' '#1055#1044#1042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object summa_econ_activ_not_pdv_Label: TLabel
      Left = 8
      Top = 142
      Width = 106
      Height = 39
      Caption = #1071#1082#1110' '#1085#1077' '#1087#1088#1080#1079#1085'. '#1076#1083#1103#13#10#1074#1080#1082#1086#1088'. '#1091' '#1075#1086#1089#1087'.'#1076'.'#13#10#1074#1072#1088#1090'-'#1090#1100' '#1073#1077#1079' '#1055#1044#1042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object summa_econ_activ_pdv_Label: TLabel
      Left = 205
      Top = 142
      Width = 106
      Height = 39
      Caption = #1071#1082#1110' '#1085#1077' '#1087#1088#1080#1079#1085'. '#1076#1083#1103#13#10#1074#1080#1082#1086#1088'. '#1091' '#1075#1086#1089#1087'.'#1076'.'#13#10#1089#1091#1084#1072' '#1055#1044#1042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object summa_delivery_not_pdv_Label: TLabel
      Left = 8
      Top = 218
      Width = 108
      Height = 26
      Caption = #1044#1083#1103' '#1087#1086#1089#1090'. '#1087#1086#1089#1083#1091#1075','#13#10#1074#1072#1088#1090'-'#1090#1100' '#1073#1077#1079' '#1055#1044#1042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object summa_delivery_pdv_Label: TLabel
      Left = 205
      Top = 218
      Width = 112
      Height = 26
      Caption = #1044#1083#1103' '#1087#1086#1089#1090'. '#1087#1086#1089#1083#1091#1075', '#13#10#1089#1091#1084#1072' '#1055#1044#1042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 0
      Top = 64
      Width = 576
      Height = 16
      Caption = 
        '----------------------------------------------------------------' +
        '---------------------------------------------------'
    end
    object Label10: TLabel
      Left = 0
      Top = 128
      Width = 576
      Height = 16
      Caption = 
        '----------------------------------------------------------------' +
        '---------------------------------------------------'
    end
    object Label11: TLabel
      Left = 0
      Top = 192
      Width = 576
      Height = 16
      Caption = 
        '----------------------------------------------------------------' +
        '---------------------------------------------------'
    end
    object summa_20_0_not_pdv_CurrencyEdit: TcxCurrencyEdit
      Left = 116
      Top = 28
      Width = 82
      Height = 24
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.DisplayFormat = ',0.00'#39#39
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      TabOrder = 0
      OnExit = summa_20_0_not_pdv_CurrencyEditExit
      OnKeyPress = summa_20_0_not_pdv_CurrencyEditKeyPress
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
    end
    object summa_20_0_pdv_CurrencyEdit: TcxCurrencyEdit
      Left = 312
      Top = 28
      Width = 82
      Height = 24
      EditValue = '0'
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.DisplayFormat = ',0.00'#39#39
      TabOrder = 1
      OnKeyPress = summa_20_0_pdv_CurrencyEditKeyPress
    end
    object summa_exempt_pdv_CurrencyEdit: TcxCurrencyEdit
      Left = 312
      Top = 96
      Width = 82
      Height = 24
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.DisplayFormat = ',0.00'#39#39
      TabOrder = 2
      OnKeyPress = summa_exempt_pdv_CurrencyEditKeyPress
    end
    object summa_delivery_pdv_CurrencyEdit: TcxCurrencyEdit
      Left = 312
      Top = 222
      Width = 82
      Height = 24
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.DisplayFormat = ',0.00'#39#39
      TabOrder = 3
      OnKeyPress = summa_exempt_not_pdv_CurrencyEditKeyPress
    end
    object summa_exempt_not_pdv_CurrencyEdit: TcxCurrencyEdit
      Left = 120
      Top = 96
      Width = 81
      Height = 24
      EditValue = '0'
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.DisplayFormat = ',0.00'#39#39
      TabOrder = 4
      OnExit = summa_exempt_not_pdv_CurrencyEditExit
      OnKeyPress = summa_exempt_not_pdvCurrencyEditKeyPress
    end
    object summa_delivery_not_pdv_CurrencyEdit: TcxCurrencyEdit
      Left = 120
      Top = 224
      Width = 81
      Height = 24
      EditValue = '0'
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.DisplayFormat = ',0.00'#39#39
      TabOrder = 5
      OnExit = summa_delivery_not_pdv_CurrencyEditExit
      OnKeyPress = summa_delivery_not_pdv_CurrencyEditKeyPress
    end
    object summa_econ_activ_not_pdv_CurrencyEdit: TcxCurrencyEdit
      Left = 120
      Top = 152
      Width = 81
      Height = 24
      EditValue = '0'
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.DisplayFormat = ',0.00'#39#39
      TabOrder = 6
      OnExit = summa_econ_activ_not_pdv_CurrencyEditExit
      OnKeyPress = summa_econ_activ_not_pdv_CurrencyEditKeyPress
    end
    object summa_econ_activ_pdv_CurrencyEdit: TcxCurrencyEdit
      Left = 312
      Top = 152
      Width = 81
      Height = 24
      EditValue = '0'
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.DisplayFormat = ',0.00'#39#39
      TabOrder = 7
      OnKeyPress = summa_econ_activ_pdv_CurrencyEditKeyPress
    end
    object Panel1: TPanel
      Left = 400
      Top = 18
      Width = 367
      Height = 245
      Align = alRight
      TabOrder = 8
      object Label5: TLabel
        Left = 0
        Top = 208
        Width = 48
        Height = 16
        Caption = 'Label5'
      end
      object GroupBox6: TGroupBox
        Left = 1
        Top = 1
        Width = 365
        Height = 243
        Align = alClient
        Caption = #1041#1102#1076#1078#1077#1090#1080' '#1055#1044#1042
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Bevel2: TBevel
          Left = 2
          Top = 150
          Width = 361
          Height = 2
          Align = alBottom
          Shape = bsTopLine
        end
        object cxGrid1: TcxGrid
          Left = 2
          Top = 49
          Width = 361
          Height = 101
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          object cxGrid1DBTableView1: TcxGridDBTableView
            OnDblClick = cxGrid1DBTableView1DblClick
            DataController.DataSource = TaxInvoicesDM.DataSource_smet
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            NavigatorButtons.Edit.Enabled = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            Styles.StyleSheet = StyleDM.GridTableViewStyleSheetDevExpress
            object cxGrid1DBTableView1DBColumn_smeta: TcxGridDBColumn
              Caption = #1050#1086#1096#1090#1086#1088#1080#1089
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Options.Filtering = False
              SortOrder = soAscending
              Width = 83
              DataBinding.FieldName = 'kod_smety'
            end
            object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
              Caption = #1056#1086#1079#1076#1110#1083
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Options.Filtering = False
              Width = 58
              DataBinding.FieldName = 'n_razd'
            end
            object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
              Caption = #1057#1090#1072#1090#1090#1103
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Options.Filtering = False
              Width = 56
              DataBinding.FieldName = 'n_stat'
            end
            object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
              Caption = #1050#1045#1050#1042
              Options.Filtering = False
              Width = 48
              DataBinding.FieldName = 'kod_kekv'
            end
            object cxGrid1DBTableView1DBColumn6: TcxGridDBColumn
              Visible = False
              Options.Filtering = False
              DataBinding.FieldName = 'Flag_del'
            end
            object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
              Caption = #1057#1091#1084#1072
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00 ;-,0.00 '
              Options.Filtering = False
              Width = 63
              DataBinding.FieldName = 'sum_smet'
            end
            object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
              Caption = #1055#1110#1083#1100#1075#1072
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayUnchecked = 'False'
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              Options.Filtering = False
              Width = 51
              DataBinding.FieldName = 'is_lgota'
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
        object Panel4: TPanel
          Left = 2
          Top = 15
          Width = 361
          Height = 34
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object ToolButton_add: TSpeedButton
            Left = 8
            Top = 0
            Width = 73
            Height = 33
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              36090000424D3609000000000000360000002800000018000000180000000100
              2000000000000009000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF0094635A00A5636B00A5636B00A5636B00A5636B00A5636B00A563
              6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
              6B00A5636B00A5636B00A5636B00A5636B00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0094635A00EFD6B500F7DEB500F7D6AD00F7D6A500F7CE9C00EFCE
              9400EFC69400EFC68C00EFC68400EFC68400EFC68400EFC68400EFC68400EFC6
              8400EFC68400EFC68400EFBD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0094635A00EFD6BD00F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE
              9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD
              7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0094635A00EFD6C600F7E7C600F7DEBD00F7D6B500F7D6AD00EFCE
              A500EFCE9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD
              7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0094635A00EFDEC600F7E7C600F7DEBD00F7DEB500F7D6B500F7D6
              AD00EFCEA500EFCE9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD
              7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0094636300F7DECE00FFE7CE00F7E7C600F7DEBD00F7DEB500F7D6
              B500EFCEA500DEBD9400D6B58C00D6B58400DEB58400E7BD8400EFBD8400EFBD
              7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0094636300F7E7D600FFEFD600F7E7CE00F7DEC600F7DEBD00F7DE
              BD00DEC6A500BDA58400AD947300A58C6B00BD9C7300DEB58400EFC68C00EFBD
              8400EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF009C6B6300F7E7DE00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DE
              BD00004A0000004A0000004A0000004A0000A58C6B00D6B58400EFC68C00EFC6
              8C00EFBD8400EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF009C6B6300F7EFE700FFF7E700FFEFDE00F7E7CE00E7D6BD00DECE
              B500004A00000894100000940800004A0000A58C6B00C6AD8400D6B58400DEB5
              8400E7BD8400EFBD8400E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00A5736300F7EFEF00FFF7EF00FFEFE700E7DECE00C6B5A500AD9C
              8C00004A0000089C1800089C1000004A000094846B00A58C6B00A58C6B00BD9C
              7300DEB58400EFC68C00E7BD84009C6B6300FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00A5736B00FFF7F700FFFFF700FFF7EF00004A0000004A0000004A
              0000004A000010A5210008A51800004A0000004A0000004A0000004A0000A58C
              6B00D6B58400EFC68C00EFBD84009C6B6300FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00AD7B6B00FFF7F700FFFFFF00FFFFF700004A000021C6420021C6
              420018BD390018B5310010AD290010A5210008A51800089C1000004A0000AD94
              7300D6B58C00EFCE9400EFC68C00A5736300FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00B57B6B00FFF7F700FFFFFF00FFFFFF00004A000029D6520029CE
              4A0021C6420018BD390018B5310010B5290010AD210010A52100004A0000BDA5
              8400DEBD9400EFCE9C00EFC69400A5736300FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00B5846B00FFF7F700FFFFFF00FFFFFF00004A0000004A0000004A
              0000004A000021CE4A0021C64200004A0000004A0000004A0000004A0000E7C6
              A500EFCEA500F7CEA500EFCE9C009C736300FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00BD846B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
              F700004A000029D65A0029CE5200004A0000AD9C8C00DECEB500F7DEBD00F7DE
              B500F7D6AD00EFD6A500CEB594008C6B6300FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00C68C6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00004A000031DE630031DE5A00004A0000C6B5A500E7D6BD00F7DEC600F7DE
              BD00E7CEAD00C6B59400A5947B0084636300FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00C68C7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00004A0000004A0000004A0000004A0000E7DECE00F7E7CE00FFEFD600E7D6
              BD00BDAD9C00A59C8C00A5948400846B6300FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00CE947300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFF7E700EFD6C6009C635A009C63
              5A0094635A0094635A0094635A009C6B5A00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00CE947300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFFFEF00DEC6B5009C635A00DEA5
              6B00DE9C4A00E7943900EF8C2100A56B6B00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00D69C7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700DEC6BD009C635A00EFB5
              7300EFAD5200F7A53100A56B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00D69C7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C6009C635A00EFB5
              7300EFA55200A56B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00D69C7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE009C635A00EFB5
              7300A56B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00D6947300E7C6AD00E7C6B500E7C6B500E7C6B500E7C6B500E7C6
              AD00DEBDAD00DEBDAD00DEBDAD00D6B5AD00D6B5AD00C69C94009C635A00A56B
              6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ParentFont = False
            OnClick = ToolButton_addClick
          end
          object ToolButton_del: TSpeedButton
            Left = 176
            Top = 0
            Width = 65
            Height = 33
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              36090000424D3609000000000000360000002800000018000000180000000100
              2000000000000009000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF000000B5000000B500FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF000000B5000000B5000000B500FF00FF00FF00FF00FF00
              FF000000B5000000B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF000000B5000000B5000000B500FF00FF00FF00FF00FF00FF00FF00
              FF000000B5000000B5000000B5000000B500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
              B5000000B5000000B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF000000B5000000B5000000B5000000B5000000B500FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000
              B5000000B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF000000B5000000B5000000B5000000B5000000B500FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000B5000000
              B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF000000F7000000B5000000B5000000B5000000B500FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000B5000000B5000000
              B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000B5000000B5000000
              B500FF00FF00FF00FF000000B5000000B5000000B5000000B5000000B500FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000B5000000
              B5000000B5000000B5000000B5000000B5000000B5000000B500FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000
              B5000000F7000000B5000000F7000000B5000000B500FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
              B5000000B5000000B5000000F7000000B500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000
              B5000000F7000000B5000000B5000000F7000000F700FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000B5000000
              F7000000B5000000F7000000F7000000F7000000B5000000F700FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF000000F7000000F7000000F7000000
              B5000000F700FF00FF00FF00FF000000F7000000F7000000F7000000F700FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF000000F7000000F7000000B5000000F7000000
              F700FF00FF00FF00FF00FF00FF00FF00FF000000F7000000F7000000F7000000
              F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF000000F7000000F7000000F7000000F7000000F700FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000F7000000
              F7000000F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF000000F7000000F7000000F7000000F7000000F700FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
              F7000000F7000000F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF000000F7000000F7000000F7000000F7000000F700FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF000000F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
              F7000000F7000000F7000000F7000000F700FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
              F7000000F7000000F7000000F700FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
              F7000000F7000000F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ParentFont = False
            OnClick = ToolButton_delClick
          end
          object SpeedButton_red: TSpeedButton
            Left = 96
            Top = 0
            Width = 65
            Height = 33
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              36090000424D3609000000000000360000002800000018000000180000000100
              2000000000000009000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0094635A00A563
              6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
              6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
              6B00A5636B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0094635A00EFD6
              BD00F7DEBD00F7D6B500EFCEA500E7C69C00E7C69400DEBD8C00E7BD8C00E7BD
              8400E7BD8400E7BD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00E7BD
              7B009C6B6300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0094635A00EFD6
              C600F7DEC600F7DEB500EFCEAD00DEBD9C00CEAD8C00C6A57B00C6A57B00D6AD
              7B00DEB57B00E7B57B00E7BD7B00E7BD7B00EFBD7B00EFBD7B00EFBD7B00E7BD
              7B009C6B6300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0094635A00EFDE
              C600F7E7C600F7DEBD00E7CEAD0021212100393931008C7B63009C846300AD8C
              6B00BD9C6B00C6A57300D6AD7300DEB57B00E7BD7B00E7BD7B00EFBD7B00E7BD
              7B009C6B6300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0094636300F7DE
              CE00F7E7CE00F7DEC600EFD6B50039393100181821001829310031424200846B
              52008C735A009C845A00B5946B00C6A56B00DEB57300E7BD7B00E7BD7B00E7BD
              7B009C6B6300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0094636300F7E7
              D600FFEFD600F7E7CE00F7DEC600AD9C8C0010394A00006B9C00004A73000839
              5200394A4A0073634A008C735200A5845A00BD9C6B00D6AD7300E7B57B00E7BD
              7B009C6B6300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009C6B6300F7E7
              DE00FFEFDE00F7E7D600F7E7CE00EFDEBD0018394A00006B9C0000639C001852
              6B0029314200423139006B5242007B6B4A009C7B5A00B5946300CEA56B00DEB5
              73009C6B5A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009C6B6300F7EF
              E700FFF7E700FFEFDE00F7E7D600F7E7CE0073848400005A8400315263009463
              6300AD6B6B00945A5A006339390063524200736342008C735200AD8C5A00C69C
              6B00946B5A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A5736300F7EF
              EF00FFF7EF00FFEFE700F7EFDE00F7E7D600F7DECE0008425A008C5A5A00CE8C
              8C00BD7B7B00AD6B6B00945A5A0063393900635239006B5A4200846B4A009C7B
              5200845A5200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A5736B00FFF7
              F700FFFFF700FFF7EF00FFEFE700FFEFDE00F7E7D6004A6B73009C6B6B00DE9C
              9C00CE8C8C00BD7B7B00AD6B6B00945A5A005A313100635239006B5A42007B63
              4A0073524200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AD7B6B00FFF7
              F700FFFFFF00FFFFF700FFF7EF00FFEFE700FFEFDE00F7E7D6007B524A00E7A5
              A500DE9C9C00CE8C8C00BD7B7B00AD6B6B008C5252005A313100634A39006B5A
              420063423900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B57B6B00FFF7
              F700FFFFFF00FFFFFF00FFF7F700FFF7EF00FFEFE700FFEFDE00E7CEBD007B52
              4A00E7A5A500DE9C9C00CE8C8C00BD7B7B00A56B6B008C5252005A3131006352
              39005A393100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B5846B00FFF7
              F700FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFEFE700FFEFDE00E7CE
              BD00734A4200E7A5A500DE9C9C00CE8C8C00BD7B7B00A56B6B008C5252005A39
              310052393100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BD846B00FFF7
              F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFEFE700FFEF
              DE00BDA59400734A4200E7A5A500DE9C9C00CE8C8C00B57B7B00A56B6B008C52
              52005A313100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C68C6B00FFF7
              F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFEF
              E700FFEFDE00BDA59400734A4200E7A5A500DE9C9C00C68C8C00B57B7B00A56B
              6B008C5252005A313100FF00FF00FF00FF00FF00FF00FF00FF00C68C7300FFF7
              F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
              EF00FFEFE700FFEFDE00BDA5940094636300EFADAD00DE9C9C00C68C8C00B57B
              7B00844A4A00424A520031425200FF00FF00FF00FF00FF00FF00CE947300FFF7
              F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
              F700FFF7EF00FFF7E700EFD6C60084524A0094636300EFADAD00DE9C9C00524A
              5200008CC60000ADEF0000A5E7000084C600FF00FF00FF00FF00CE947300FFF7
              F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFF7F700FFFFEF00DEC6B5009C635A00AD7B520094636300C68C8C00087B
              AD0000BDFF0000BDFF0000A5E70000189C0000008400FF00FF00D69C7300FFFF
              F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFF700DEC6BD009C635A00EFB57300B57B420073424200009C
              DE0000BDFF00008CD60000189C0000089C000008940000008400D69C7300FFFF
              F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00DEC6C6009C635A00EFB57300EFA552007B4A4A000094
              D60000B5F7000029A5000021DE000021BD000018B50000089400D69C7300FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00E7D6CE009C635A00EFB57300A56B6B00FF00FF00FF00
              FF000084C6000821BD00294AF7000829CE000018B50000008C00CE8C6B00CE8C
              6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C
              6B00CE8C6B00CE8C6B00CE8C6B009C635A00A56B6B00FF00FF00FF00FF00FF00
              FF00FF00FF001021BD005273FF001839E70000089400FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF001021BD000008A500FF00FF00FF00FF00}
            ParentFont = False
            OnClick = SpeedButton_redClick
          end
        end
        object Panel2: TPanel
          Left = 2
          Top = 152
          Width = 361
          Height = 89
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object Label18: TLabel
            Left = 8
            Top = 0
            Width = 63
            Height = 13
            Caption = #1050#1086#1096#1090#1086#1088#1080#1089':'
            ParentShowHint = False
            ShowHint = False
          end
          object Label19: TLabel
            Left = 8
            Top = 16
            Width = 44
            Height = 13
            Caption = #1056#1086#1079#1076#1110#1083':'
          end
          object Label20: TLabel
            Left = 8
            Top = 32
            Width = 45
            Height = 13
            Caption = #1057#1090#1072#1090#1090#1103':'
          end
          object Label21: TLabel
            Left = 72
            Top = 0
            Width = 38
            Height = 13
            Caption = 'Label21'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label22: TLabel
            Left = 72
            Top = 16
            Width = 38
            Height = 13
            Caption = 'Label22'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label23: TLabel
            Left = 72
            Top = 32
            Width = 38
            Height = 13
            Caption = 'Label23'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label25: TLabel
            Left = 8
            Top = 48
            Width = 37
            Height = 13
            Caption = #1050#1045#1050#1042':'
          end
          object Label26: TLabel
            Left = 72
            Top = 48
            Width = 38
            Height = 13
            Caption = 'Label26'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label1: TLabel
            Left = 208
            Top = 72
            Width = 66
            Height = 13
            Caption = #1057#1091#1084#1072' '#1055#1044#1042':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 8
            Top = 72
            Width = 91
            Height = 13
            Caption = #1057#1091#1084#1072' '#1073#1077#1079' '#1055#1044#1042':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LabelNotPDV: TLabel
            Left = 104
            Top = 72
            Width = 77
            Height = 13
            Caption = 'LabelNotPDV'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LabelPDV: TLabel
            Left = 280
            Top = 72
            Width = 57
            Height = 13
            Caption = 'LabelPDV'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = -8
            Top = 56
            Width = 369
            Height = 13
            Caption = 
              '----------------------------------------------------------------' +
              '----------------------------'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
        end
      end
    end
  end
  object SignGroupBox: TcxGroupBox
    Left = 8
    Top = 560
    Width = 769
    Height = 33
    Alignment = alTopLeft
    Caption = #1054#1079#1085#1072#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object IsKorigCheckBox: TcxCheckBox
      Left = 232
      Top = 8
      Width = 121
      Height = 24
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1050#1088#1080#1075#1091#1074#1072#1085#1085#1103
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      OnKeyPress = IsKorigCheckBoxKeyPress
    end
    object IsExpansionCheckBox: TcxCheckBox
      Left = 424
      Top = 8
      Width = 113
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1059#1090#1086#1095'. '#1088#1086#1079#1096'.'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      OnKeyPress = IsExpansionCheckBoxKeyPress
    end
  end
  object YesButton: TcxButton
    Left = 584
    Top = 592
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 5
    OnClick = YesButtonClick
  end
  object CancelButton: TcxButton
    Left = 672
    Top = 592
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 6
    OnClick = CancelButtonClick
  end
  object InfoReestrGroupBox: TcxGroupBox
    Left = 8
    Top = 0
    Width = 753
    Height = 33
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object NumReestrLabel: TcxLabel
      Left = 512
      Top = 8
      Width = 89
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = #8470' '#1088#1077#1108#1089#1090#1088#1091
    end
    object NumReestrDBTextEdit: TcxDBTextEdit
      Left = 608
      Top = 8
      Width = 105
      Height = 24
      DataBinding.DataField = 'num_reestr'
      DataBinding.DataSource = TaxInvoicesDM.ReestrDSource
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Color = clMenuBar
      TabOrder = 1
    end
    object NaklLabel: TcxLabel
      Left = 272
      Top = 8
      Width = 185
      Height = 20
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = #1054#1058#1056#1048#1052#1040#1053#1040' '#1053#1040#1050#1051#1040#1044#1053#1040
    end
    object PeriodLabel: TcxLabel
      Left = 48
      Top = 8
      Width = 58
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = #1087#1077#1088#1110#1086#1076
    end
    object PeriodDBTextEdit: TcxDBTextEdit
      Left = 104
      Top = 8
      Width = 121
      Height = 24
      DataBinding.DataField = 'KOD_SETUP_OUT'
      DataBinding.DataSource = TaxInvoicesDM.ReestrDSource
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clMenuBar
      TabOrder = 4
    end
  end
  object TypeDocumentGroupBox: TcxGroupBox
    Left = 8
    Top = 88
    Width = 753
    Height = 81
    Alignment = alTopLeft
    Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    object TypeDocumentButtonEdit: TcxButtonEdit
      Left = 88
      Top = 22
      Width = 593
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = TypeDocumentButtonEditPropertiesButtonClick
      TabOrder = 0
      Text = 'TypeDocumentButtonEdit'
      OnKeyPress = TypeDocumentButtonEditKeyPress
    end
    object Oznaka1TextEdit: TcxTextEdit
      Left = 256
      Top = 49
      Width = 121
      Height = 24
      TabOrder = 1
      Text = 'Oznaka1TextEdit'
    end
    object Oznaka2TextEdit: TcxTextEdit
      Left = 560
      Top = 49
      Width = 121
      Height = 24
      TabOrder = 2
      Text = 'Oznaka2TextEdit'
    end
    object Oznaka1CheckBox: TcxCheckBox
      Left = 88
      Top = 48
      Width = 169
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1054#1079#1085#1072#1082#1072' '#1074#1080#1076#1091' '#1076#1086#1082'. 1'
      TabOrder = 3
      OnClick = Oznaka1CheckBoxClick
    end
    object Oznaka2CheckBox: TcxCheckBox
      Left = 392
      Top = 48
      Width = 169
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1054#1079#1085#1072#1082#1072' '#1074#1080#1076#1091' '#1076#1086#1082'. 2'
      TabOrder = 4
      OnClick = Oznaka2CheckBoxClick
    end
  end
end
