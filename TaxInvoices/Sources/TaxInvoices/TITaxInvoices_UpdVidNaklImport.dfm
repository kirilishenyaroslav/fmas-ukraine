object TITaxInvoicesUpdVidNaklImportForm: TTITaxInvoicesUpdVidNaklImportForm
  Left = 372
  Top = 135
  BorderStyle = bsDialog
  Caption = 'TITaxInvoicesUpdVidNaklImportForm'
  ClientHeight = 736
  ClientWidth = 694
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
    Top = 40
    Width = 681
    Height = 65
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object DataVidNaklLabel: TcxLabel
      Left = 24
      Top = 40
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
      Left = 336
      Top = 18
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
    object NaklDateEdit: TcxDateEdit
      Left = 136
      Top = 40
      Width = 185
      Height = 24
      Properties.ShowTime = False
      TabOrder = 2
      OnKeyPress = NaklDateEditKeyPress
    end
    object NumNaklTextEdit: TcxTextEdit
      Left = 392
      Top = 18
      Width = 185
      Height = 24
      TabOrder = 3
      Text = 'NumNaklTextEdit'
      OnKeyPress = NumNaklTextEditKeyPress
    end
    object NumOrderLabel: TcxLabel
      Left = 24
      Top = 15
      Width = 55
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
      Left = 136
      Top = 15
      Width = 185
      Height = 24
      TabOrder = 5
      Text = 'NumOrderTextEdit'
      OnExit = NumOrderTextEditExit
      OnKeyPress = NumOrderTextEditKeyPress
    end
  end
  object TaxLiabilitiesGroupBox: TcxGroupBox
    Left = 16
    Top = 800
    Width = 617
    Height = 65
    Alignment = alTopLeft
    Caption = #1050#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Visible = False
    object KodButtonEdit: TcxButtonEdit
      Left = 32
      Top = 24
      Width = 377
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
  object YesButton: TcxButton
    Left = 520
    Top = 704
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 2
    OnClick = YesButtonClick
  end
  object CancelButton: TcxButton
    Left = 600
    Top = 704
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object InfoReestrGroupBox: TcxGroupBox
    Left = 8
    Top = 0
    Width = 681
    Height = 41
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object NumReestrLabel: TcxLabel
      Left = 488
      Top = 16
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
      Left = 576
      Top = 16
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
      Top = 16
      Width = 156
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = #1042#1048#1044#1040#1053#1040' '#1053#1040#1050#1051#1040#1044#1053#1040
    end
    object PeriodLabel: TcxLabel
      Left = 0
      Top = 16
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
      Left = 56
      Top = 16
      Width = 145
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
    Top = 104
    Width = 681
    Height = 89
    Alignment = alTopLeft
    Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1091' '#1087#1086#1076#1072#1090#1082#1086#1074#1086#1111' '#1085#1072#1082#1083#1072#1076#1085#1086#1111
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object TypeDocumentButtonEdit: TcxButtonEdit
      Left = 32
      Top = 24
      Width = 553
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
    object SpecialNotesCheckBox: TCheckBox
      Left = 32
      Top = 53
      Width = 161
      Height = 17
      Caption = #1086#1089#1086#1073#1083#1080#1074#1110' '#1087#1088#1080#1084#1110#1090#1082#1080
      TabOrder = 1
      OnClick = SpecialNotesCheckBoxClick
    end
    object OznakaCheckBox: TCheckBox
      Left = 384
      Top = 56
      Width = 97
      Height = 17
      Caption = #1086#1079#1085#1072#1082#1072
      TabOrder = 2
      OnClick = OznakaCheckBoxClick
    end
    object SpecialNotesButtonEdit: TcxButtonEdit
      Left = 192
      Top = 53
      Width = 185
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = SpecialNotesButtonEditPropertiesButtonClick
      TabOrder = 3
      Text = 'SpecialNotesButtonEdit'
    end
    object OznakaTextEdit: TcxTextEdit
      Left = 464
      Top = 57
      Width = 129
      Height = 24
      TabOrder = 4
      Text = 'OznakaTextEdit'
    end
  end
  object GroupBox6: TGroupBox
    Left = 8
    Top = 496
    Width = 681
    Height = 209
    Caption = #1041#1102#1076#1078#1077#1090#1080' '#1055#1044#1042
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object Bevel2: TBevel
      Left = 2
      Top = 118
      Width = 677
      Height = 2
      Align = alBottom
      Shape = bsTopLine
    end
    object cxGrid1: TcxGrid
      Left = 2
      Top = 49
      Width = 677
      Height = 69
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object cxGrid1DBTableView1: TcxGridDBTableView
        DataController.DataSource = TaxInvoicesDM.DataSource_smet
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
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
          Width = 90
          DataBinding.FieldName = 'kod_smety'
        end
        object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
          Caption = #1056#1086#1079#1076#1110#1083
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Options.Filtering = False
          Width = 76
          DataBinding.FieldName = 'n_razd'
        end
        object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
          Caption = #1057#1090#1072#1090#1090#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Options.Filtering = False
          Width = 80
          DataBinding.FieldName = 'n_stat'
        end
        object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
          Caption = #1050#1045#1050#1042
          Options.Filtering = False
          Width = 64
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
          Width = 91
          DataBinding.FieldName = 'sum_smet'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 15
      Width = 677
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
      Top = 120
      Width = 677
      Height = 87
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
        Left = 80
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
        Left = 80
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
        Left = 80
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
        Left = 80
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
        Left = 0
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
  object VidDogGroupBox: TGroupBox
    Left = 8
    Top = 192
    Width = 345
    Height = 57
    Caption = #1042#1080#1076' '#1094#1080#1074#1110#1083#1100#1085#1086'-'#1087#1088#1072#1074#1086#1074#1086#1075#1086' '#1076#1086#1075#1086#1074#1086#1088#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object VidDogButtonEdit: TcxButtonEdit
      Left = 8
      Top = 24
      Width = 329
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      TabOrder = 0
      Text = 'VidDogButtonEdit'
    end
  end
  object ProviderGroupBox: TcxGroupBox
    Left = 7
    Top = 296
    Width = 682
    Height = 105
    Alignment = alTopLeft
    Caption = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    object IPNProviderLabel: TLabel
      Left = 16
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
    object Label3: TLabel
      Left = 16
      Top = 40
      Width = 413
      Height = 16
      Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103' '#1087#1086#1074#1085#1086#1111' '#1085#1072#1079#1074#1080' '#1087#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1072' '#1091' '#1085#1072#1082#1083#1072#1076#1085#1110#1081':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object IPNProviderTextEdit: TcxTextEdit
      Left = 168
      Top = 16
      Width = 393
      Height = 24
      Properties.ReadOnly = True
      Style.Color = clWhite
      TabOrder = 0
      Text = 'IPNProviderTextEdit'
    end
    object FullNameMemo: TcxMemo
      Left = 16
      Top = 56
      Width = 601
      Height = 41
      Lines.Strings = (
        'FullNameMemo')
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = []
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 400
    Width = 681
    Height = 97
    Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1110' '#1076#1072#1085#1110' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    object PlacePokupCheckBox: TCheckBox
      Left = 16
      Top = 24
      Width = 145
      Height = 17
      Caption = #1040#1076#1088#1077#1089#1072' '#1087#1086#1082#1091#1087#1094#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = PlacePokupCheckBoxClick
    end
    object PlacePokupMemo: TcxMemo
      Left = 168
      Top = 24
      Width = 393
      Height = 33
      Lines.Strings = (
        'PlacePokupMemo')
      TabOrder = 1
    end
    object PhoneCheckBox: TCheckBox
      Left = 16
      Top = 64
      Width = 145
      Height = 17
      Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = PhoneCheckBoxClick
    end
    object TelPokupTextEdit: TcxTextEdit
      Left = 168
      Top = 60
      Width = 225
      Height = 24
      Properties.ReadOnly = False
      Style.Color = clWindow
      TabOrder = 3
      Text = 'TelPokupTextEdit'
    end
    object SavePlacePokupButton: TcxButton
      Left = 568
      Top = 24
      Width = 59
      Height = 25
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = SavePlacePokupButtonClick
    end
    object SavePhoneButton: TcxButton
      Left = 400
      Top = 64
      Width = 59
      Height = 25
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = SavePhoneButtonClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 352
    Top = 200
    Width = 337
    Height = 49
    Caption = #1060#1086#1088#1084#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1093' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1110#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    object RozraxunokButtonEdit: TcxButtonEdit
      Left = 8
      Top = 16
      Width = 321
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = RozraxunokButtonEditPropertiesButtonClick
      TabOrder = 0
      Text = 'RozraxunokButtonEdit'
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 248
    Width = 681
    Height = 49
    Alignment = alTopLeft
    Caption = #1055#1086#1082#1091#1087#1077#1094#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    object Label4: TLabel
      Left = 16
      Top = 20
      Width = 127
      Height = 16
      Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PhonePocupTextEdit: TcxTextEdit
      Left = 176
      Top = 16
      Width = 225
      Height = 24
      TabOrder = 0
      Text = 'PhonePocupTextEdit'
    end
  end
end
