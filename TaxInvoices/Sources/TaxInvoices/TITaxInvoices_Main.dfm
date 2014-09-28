object TaxInvoicesMainForm: TTaxInvoicesMainForm
  Left = 83
  Top = 299
  BorderStyle = bsSingle
  Caption = 'TaxInvoicesMainForm'
  ClientHeight = 520
  ClientWidth = 1175
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 0
    Top = 46
    Width = 161
    Height = 474
    Align = alLeft
    Caption = 'Panel4'
    TabOrder = 1
    object ReestrGrid: TcxGrid
      Left = 1
      Top = 43
      Width = 159
      Height = 295
      Align = alClient
      TabOrder = 0
      object ReestrGridDBTableView: TcxGridDBTableView
        DataController.DataSource = TaxInvoicesDM.ReestrDSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnCustomDrawCell = ReestrGridDBTableViewCustomDrawCell
        OnFocusedRecordChanged = ReestrGridDBTableViewFocusedRecordChanged
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = StyleDM.GridTableViewStyleSheetDevExpress
        object ReestrGridDBTableViewDB_IS_SIGN: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'is_signature'
        end
        object ReestrGridDBTableViewDB_PERIOD: TcxGridDBColumn
          Caption = #1055#1077#1088#1110#1086#1076
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          SortOrder = soDescending
          Width = 80
          DataBinding.FieldName = 'kod_setup_out'
        end
        object ReestrGridDBTableViewDB_NUM_REESTR: TcxGridDBColumn
          Caption = #8470' '#1088#1077#1108#1089#1090#1088#1091
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Width = 77
          DataBinding.FieldName = 'NUM_REESTR'
        end
      end
      object ReestrGridLevel: TcxGridLevel
        GridView = ReestrGridDBTableView
      end
    end
    object SignatureGroupBox: TcxGroupBox
      Left = 1
      Top = 378
      Width = 159
      Height = 95
      Align = alBottom
      Alignment = alTopLeft
      Caption = #1055#1110#1076#1087#1080#1089#1072#1085#1085#1103' '#1088#1077#1108#1089#1090#1088#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object NameSignatureLabel: TcxLabel
        Left = 8
        Top = 13
        Width = 153
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
        Caption = #1082#1080#1084':'
      end
      object DataSignatureLabel: TcxLabel
        Left = 8
        Top = 50
        Width = 110
        Height = 17
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
        Caption = #1076#1072#1090#1072' '#1087#1110#1076#1087#1080#1089#1072#1085#1085#1103':'
      end
      object SignatureReestrDBDateEdit: TcxDBTextEdit
        Left = 8
        Top = 65
        Width = 145
        Height = 21
        DataBinding.DataField = 'DATE_TIME_SIGNATURE_MODERN'
        DataBinding.DataSource = TaxInvoicesDM.SignatureReestrDSource
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 2
      end
      object SignatureReestrDBTextEdit: TcxDBTextEdit
        Left = 8
        Top = 28
        Width = 145
        Height = 21
        DataBinding.DataField = 'FIO'
        DataBinding.DataSource = TaxInvoicesDM.SignatureReestrDSource
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 3
      end
    end
    object TypeReestrGroupBox: TcxGroupBox
      Left = 1
      Top = 338
      Width = 159
      Height = 40
      Align = alBottom
      Alignment = alTopLeft
      Caption = #1058#1080#1087' '#1088#1077#1108#1089#1090#1088#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object TypeReestrDBTextEdit: TcxDBTextEdit
        Left = 7
        Top = 15
        Width = 146
        Height = 21
        DataBinding.DataField = 'NAME_TYPE_REESTR'
        DataBinding.DataSource = TaxInvoicesDM.ReestrDSource
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 159
      Height = 42
      Align = alTop
      TabOrder = 3
      object ReestrLabel: TLabel
        Left = 1
        Top = 4
        Width = 159
        Height = 26
        Caption = #1055#1086#1076#1072#1108#1090#1100#1089#1103' '#1076#1086' '#1076#1077#1082#1083#1072#1088#1072#1094#1110#1111' '#1079' '#1087#1086#1076'.'#13#10#1085#1072' '#1076#1086#1076#1072#1085#1091' '#1074#1072#1088#1090#1110#1089#1090#1100' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ReestrComboBox: TcxComboBox
        Left = 95
        Top = 18
        Width = 65
        Height = 21
        Enabled = False
        ParentFont = False
        Style.BorderColor = clInfoText
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
        Text = #1047#1074#1110#1090#1085#1086#1111
      end
    end
  end
  object ReestrSplitter: TcxSplitter
    Left = 161
    Top = 46
    Width = 8
    Height = 474
    HotZoneClassName = 'TcxMediaPlayer9Style'
    MinSize = 200
    Control = Panel4
    OnAfterOpen = ReestrSplitterAfterOpen
    OnAfterClose = ReestrSplitterAfterClose
  end
  object Panel1: TPanel
    Left = 169
    Top = 46
    Width = 1006
    Height = 474
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 6
    object NaklPageControl: TPageControl
      Left = 1
      Top = 23
      Width = 1004
      Height = 450
      ActivePage = OtrNaklTabSheet
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = NaklPageControlChange
      object VidNaklTabSheet: TTabSheet
        Caption = #1042#1080#1076#1072#1085#1110' '#1085#1072#1082#1083#1072#1076#1085#1110
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        object VidNaklGrid: TcxGrid
          Left = 0
          Top = 0
          Width = 996
          Height = 334
          Align = alClient
          TabOrder = 0
          object VidNaklGridDBTableView: TcxGridDBTableView
            OnDblClick = VidNaklGridDBTableViewDblClick
            DataController.DataSource = TaxInvoicesDM.VidNaklDSource
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0.00'#39#39';-,0.00'#39#39
                Kind = skSum
                FieldName = 'summa_all_pdv'
                Column = VidNaklGridDBTableViewDB_summa_all_pdv
              end
              item
                Format = ',0.00'#39#39';-,0.00'#39#39
                Kind = skSum
                FieldName = 'summa_exempt'
                Column = VidNaklGridDBTableViewDB_summa_exempt
              end
              item
                Format = ',0.00'#39#39';-,0.00'#39#39
                Kind = skSum
                FieldName = 'summa_export'
                Column = VidNaklGridDBTableViewDB_summa_export
              end
              item
                Format = ',0.00'#39#39';-,0.00'#39#39
                Kind = skSum
                FieldName = 'summa_pdv_20'
                Column = VidNaklGridDBTableViewDB_summa_pdv_20
              end
              item
                Format = ',0.00'#39#39';-,0.00'#39#39
                Kind = skSum
                Column = VidNaklGridDBTableViewDB_summa_pdv_20
              end
              item
                Format = ',0.00'#39#39';-,0.00'#39#39
                Kind = skSum
                FieldName = 'summa_taxable_0'
                Column = VidNaklGridDBTableViewDB_summa_taxable_0
              end
              item
                Format = ',0.00'#39#39';-,0.00'#39#39
                Kind = skSum
                FieldName = 'summa_taxable_20'
                Column = VidNaklGridDBTableViewDB_summa_taxable_20
              end>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnCustomDrawCell = VidNaklGridDBTableViewCustomDrawCell
            OnFocusedRecordChanged = VidNaklGridDBTableViewFocusedRecordChanged
            OptionsSelection.CellSelect = False
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderAutoHeight = True
            Styles.Background = StyleDM.cxStyle1
            Styles.StyleSheet = StyleDM.GridTableViewStyleSheetDevExpress
            Styles.Selection = StyleDM.cxStyle15
            Styles.Group = StyleDM.cxStyle6
            Styles.GroupByBox = StyleDM.cxStyle7
            Styles.NewItemRowInfoText = StyleDM.cxStyle13
            Styles.Preview = StyleDM.cxStyle14
            object VidNaklGridDBTableViewDB_Is_Signature: TcxGridDBColumn
              Caption = #1087#1110#1076#1087#1080#1089#1072#1085#1086
              Visible = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 75
              DataBinding.FieldName = 'is_signature'
            end
            object VidNaklGridDBTableViewDB_Is_Import: TcxGridDBColumn
              Caption = #1030#1084#1087#1086#1088#1090#1086#1074#1072#1085#1086
              Visible = False
              DataBinding.FieldName = 'is_import'
            end
            object VidNaklGridDBTableViewDB_is_document: TcxGridDBColumn
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayUnchecked = 'False'
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              OnCustomDrawCell = VidNaklGridDBTableViewDB_is_documentCustomDrawCell
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 21
              DataBinding.FieldName = 'IS_DOCUMENT'
              IsCaptionAssigned = True
            end
            object cxGridVidNaklDBTable_num_order: TcxGridDBColumn
              Caption = #8470' '#1079'.'#1087'.'#13#10'---'#13#10'1'
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              SortOrder = soAscending
              Width = 37
              DataBinding.FieldName = 'num_order'
            end
            object cxGridVidNaklDBTable_data_vipiski: TcxGridDBColumn
              Caption = #13#10#1044#1072#1090#1072' '#1074#1080#1087#1080#1089#1082#1080#13#10'--------'#13#10'2'
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Width = 74
              DataBinding.FieldName = 'data_vipiski'
            end
            object VidNaklGridDBTableViewDB_Num_Nakl: TcxGridDBColumn
              Caption = #13#10#13#10#1085#1086#1084#1077#1088#13#10'-----'#13#10'3'
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Width = 63
              DataBinding.FieldName = 'num_nakl'
            end
            object VidNaklGridDBTableViewDB_name_type_document: TcxGridDBColumn
              Caption = #13#10#13#10#1074'.'#1076'.'#13#10'--'#13#10'4'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 43
              DataBinding.FieldName = 'charcode_name_type_document'
            end
            object VidNaklGridDBTableViewDB_NUM_SPECIALNOTES: TcxGridDBColumn
              Caption = #13#10#13#10#1074'.'#1076'.'#13#10'--'#13#10'4'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaBottom
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 35
              DataBinding.FieldName = 'NUM_SPECIALNOTES'
            end
            object VidNaklGridDBTableViewDB_OZNAKA_NAKL: TcxGridDBColumn
              Caption = #13#10#13#10#1074'.'#1076'. '#13#10'--'#13#10'4'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 33
              DataBinding.FieldName = 'OZNAKA_NAKL'
            end
            object VidNaklGridDBTableViewDB_name_customer: TcxGridDBColumn
              Caption = 
                #13#10#13#10#1053#1072#1079#1074#1072' '#1087#1086#1082#1091#1087#1094#1103#13#10'---------------------------------------------' +
                '-'#13#10'5'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 209
              DataBinding.FieldName = 'name_customer'
            end
            object VidNaklGridDBTableViewDB_ipn_customer: TcxGridDBColumn
              Caption = #1030#1085#1076'.'#1087#1086#1076'. '#1085#1086#1084#1077#1088' '#1087#1086#1082#1091#1087#1094#1103#13#10'----------'#13#10'6'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 88
              DataBinding.FieldName = 'ipn_customer'
            end
            object VidNaklGridDBTableViewDB_summa_all_pdv: TcxGridDBColumn
              Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1089#1091#1084#1072' '#1074#1082#1083'. '#1055#1044#1042#13#10'--------------'#13#10'7'
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 80
              DataBinding.FieldName = 'summa_all_pdv'
            end
            object VidNaklGridDBTableViewDB_summa_taxable_20: TcxGridDBColumn
              Caption = '20% '#1073#1072#1079#1072' '#1086#1087#1086#1076#1072#1090#1082#1091#1074#1072#1085#1085#1103#13#10'--------------'#13#10'8'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00'#39'.'#39';-,0.00'#39'.'#39
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 82
              DataBinding.FieldName = 'summa_taxable_20'
            end
            object VidNaklGridDBTableViewDB_summa_pdv_20: TcxGridDBColumn
              Caption = #13#10'20 % '#1089#1091#1084#1072' '#1055#1044#1042#13#10'---------------9'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 71
              DataBinding.FieldName = 'summa_pdv_20'
            end
            object VidNaklGridDBTableViewDB_summa_taxable_0: TcxGridDBColumn
              Caption = '0 % '#1073#1072#1079#1072' '#1086#1087#1086#1076#1072#1090#1082#1091#1074#1072#1085#1085#1103#13#10'--------------'#13#10'10'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 81
              DataBinding.FieldName = 'summa_taxable_0'
            end
            object VidNaklGridDBTableViewDB_summa_exempt: TcxGridDBColumn
              Caption = #13#10#1047#1074#1110#1083#1100#1085#1077#1085#1110' '#1074#1110#1076' '#1086#1087#1086#1076#1072#1090#1082#1091#1074#1072#1085#1085#1103' '#13#10'-----------------'#13#10'11'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 101
              DataBinding.FieldName = 'summa_exempt'
            end
            object VidNaklGridDBTableViewDB_summa_export: TcxGridDBColumn
              Caption = #13#10#1045#1082#1089#1087#1086#1088#1090' '#1073#1072#1079#1072' '#1086#1087#1086#1076#1072#1090#1082#1091#1074#1072#1085#1085#1103#13#10'------------------'#13#10'12'
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 97
              DataBinding.FieldName = 'summa_export'
            end
            object VidNaklGridDBTableViewDB_SUMMA_DELIVERY: TcxGridDBColumn
              Caption = #13#10#1087#1086#1089#1090'. '#1087#1086#1089#1083#1091#1075' '#1079#1072' '#1084#1077#1078#1072#1084#1080' '#1084#1080#1090#1085'. '#1090#1077#1088'.'#13#10'-----------------------'#13#10'13'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 124
              DataBinding.FieldName = 'SUMMA_DELIVERY'
            end
            object cxGridVidNaklDBTable_is_korig: TcxGridDBColumn
              Caption = #1050#1086#1088#1080#1075
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayUnchecked = 'False'
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 37
              DataBinding.FieldName = 'is_korig'
            end
            object VidNaklGridDBTableViewDB_is_expansion: TcxGridDBColumn
              Caption = #1059#1090'. '#1088#1086#1079'.'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayUnchecked = 'False'
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 34
              DataBinding.FieldName = 'is_expansion'
            end
            object VidNaklGridDBTableViewDB_name_system: TcxGridDBColumn
              Caption = #1057#1080#1089#1090#1077#1084#1072' '#1030#1084#1087#1086#1088#1090
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 147
              DataBinding.FieldName = 'NAME_SUBDIVISION'
            end
            object VidNaklGridDBTableViewDB_is_edit: TcxGridDBColumn
              Visible = False
              DataBinding.FieldName = 'is_edit'
            end
          end
          object VidNaklGridLevel: TcxGridLevel
            GridView = VidNaklGridDBTableView
          end
        end
        object SignatureNaklGroupBox: TcxGroupBox
          Left = 0
          Top = 378
          Width = 996
          Height = 44
          Align = alBottom
          Alignment = alTopLeft
          Caption = #1055#1110#1076#1087#1080#1089#1072#1085#1085#1103' '#1085#1072#1082#1083#1072#1076#1085#1086#1111
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Image1: TImage
            Left = 646
            Top = 12
            Width = 24
            Height = 24
            AutoSize = True
            Picture.Data = {
              07544269746D617076060000424D760600000000000036040000280000001800
              000018000000010008000000000040020000120B0000120B0000000100000000
              000000000000000080000080000000808000800000008000800080800000C0C0
              C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
              E00000400000004020000040400000406000004080000040A0000040C0000040
              E00000600000006020000060400000606000006080000060A0000060C0000060
              E00000800000008020000080400000806000008080000080A0000080C0000080
              E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
              E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
              E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
              E00040000000400020004000400040006000400080004000A0004000C0004000
              E00040200000402020004020400040206000402080004020A0004020C0004020
              E00040400000404020004040400040406000404080004040A0004040C0004040
              E00040600000406020004060400040606000406080004060A0004060C0004060
              E00040800000408020004080400040806000408080004080A0004080C0004080
              E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
              E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
              E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
              E00080000000800020008000400080006000800080008000A0008000C0008000
              E00080200000802020008020400080206000802080008020A0008020C0008020
              E00080400000804020008040400080406000804080008040A0008040C0008040
              E00080600000806020008060400080606000806080008060A0008060C0008060
              E00080800000808020008080400080806000808080008080A0008080C0008080
              E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
              E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
              E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
              E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
              E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
              E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
              E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
              E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
              E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
              E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
              A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00070707070707070707070707070707070707070707070707070707070707
              0707070707070707070707070707070707070707070707070707070707070707
              07070707070707070707EE070707070707070707070707070707070707070707
              070791919191919191919191919191919191919191919191070791FFFFF6F6F6
              09090909090909090909090909090991070791FFFFFFFFF6F609090909090909
              0909090909090991070791FFFFFFFFFFF6F60909090909090909090909090991
              070791FFFF01010101F69191919191919191919191090991070791FFFFFFFFFF
              FFFFFFF6F60909090909090909090991070791FFFFFFFFFFFFFFFFFFF6F60909
              0909090909090991070791FFFFFFFFFFFFFFFFFFFFF6F6F60909090909090991
              070791FFFF01010101FF9191919191919191919191090991070791FFFFFFFFFF
              FFFFFFFFFFFFFFFFF6F609090909F418070791FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFF6F60909F51818070791FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F5183218
              181891FFFF01010101FFF9F9F9F9F9F9F9F9F9F9187B7332291891FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFF5187B18181891FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFF5181807079108080808080808080808080808080808080808F718
              0707919191919191919191919191919191919191919191910707D8E1E1E1E1E1
              E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1D8070707D8D8D8D8D8D8D8D8D8D8D8D8D8
              D8D8D8D8D8D8D807070707070707070707070707070707070707070707070707
              0707}
          end
          object Image2: TImage
            Left = 722
            Top = 12
            Width = 24
            Height = 24
            AutoSize = True
            Picture.Data = {
              07544269746D617076060000424D760600000000000036040000280000001800
              000018000000010008000000000040020000120B0000120B0000000100000000
              000000000000000080000080000000808000800000008000800080800000C0C0
              C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
              E00000400000004020000040400000406000004080000040A0000040C0000040
              E00000600000006020000060400000606000006080000060A0000060C0000060
              E00000800000008020000080400000806000008080000080A0000080C0000080
              E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
              E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
              E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
              E00040000000400020004000400040006000400080004000A0004000C0004000
              E00040200000402020004020400040206000402080004020A0004020C0004020
              E00040400000404020004040400040406000404080004040A0004040C0004040
              E00040600000406020004060400040606000406080004060A0004060C0004060
              E00040800000408020004080400040806000408080004080A0004080C0004080
              E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
              E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
              E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
              E00080000000800020008000400080006000800080008000A0008000C0008000
              E00080200000802020008020400080206000802080008020A0008020C0008020
              E00080400000804020008040400080406000804080008040A0008040C0008040
              E00080600000806020008060400080606000806080008060A0008060C0008060
              E00080800000808020008080400080806000808080008080A0008080C0008080
              E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
              E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
              E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
              E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
              E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
              E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
              E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
              E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
              E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
              E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
              A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF000707079B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9A07070707079B0909
              0909090909090909090909090909F49A07070707079B09090909090909090909
              F4F4F4F4F4F4F49A07070707079B090909090909090909099B9B9B9B9B9BF49A
              07070707079B090909090909090909090909F4F4F4F4F49A07070707079B0909
              09090909090909099B9B9B9B9B9BF49A07070707079BF6F60909090909090909
              09090909F4F4F49A07070707079BF69B9B099B9B099B9B099B9B099B9BF4F49A
              07070707079BF6FFF6F6090909090909090909090909F49A0707070707E3F6FF
              F6F6F60909090909090909090909F49A0707070707E3FF9B9B9B9B9B9B090909
              090909090909099A0707070707E3FFFFFFFFF6F6F6090909090909090909099A
              0707070707E3FF9B9B9B9B9B9B9B9B9B9B0909090909099A0707070707E3FFFF
              FFFFFFFFF6F6F609090909090909099A0707070707E3FF9B9B9B9B9B9B9B9B9B
              9B0909090909F59A0707070707E3FFFFFFFFFFFFFFFFF6F6F609090909F5EC9A
              0707070707E4FFFF9B9B9B9B9B9B9B9BF6F6F609EDF7F79A0707070707ECFF9B
              FFFFFFFFFFFFFFFF9B099B9B9B9B9B9B0707070707ECFF9BFFFFFFFFFFFFFFFF
              9B099BEBEAEAE1DB0707070707ECFF9BFFFFFFFFFFFFFFFF9B079BF4EBEADB07
              0707070707ECFFFF9B9B9B9B9B9B9B9BFF079BF4EBDB07070707070707ECFFFF
              FFFFFFFFFFFFFFFFFF089BF4DB0707070707070707E3E3E3E3E3E3E3E3E3E3E3
              E3E39BDB07070707070707070707070707070707070707070707070707070707
              0707}
          end
          object KolvoVidLabel: TLabel
            Left = 368
            Top = 18
            Width = 184
            Height = 13
            Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1080#1093' '#1091' '#1088#1077#1108#1089#1090#1088#1110':'
          end
          object KolvoVidValueLabel: TLabel
            Left = 552
            Top = 18
            Width = 89
            Height = 13
            AutoSize = False
            Caption = 'KolvoVidValueLabel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object NameSignatureNaklLabel: TcxLabel
            Left = 0
            Top = 18
            Width = 361
            Height = 17
            AutoSize = False
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clNavy
            Style.Font.Height = -12
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 0
            Caption = #1082#1080#1084
          end
          object DataSignatureNaklLabel: TcxLabel
            Left = 163
            Top = 18
            Width = 106
            Height = 17
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clNavy
            Style.Font.Height = -12
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 1
            Caption = #1076#1072#1090#1072' '#1087#1110#1076#1087#1080#1089'.'
          end
          object SignatureNaklDBTextEdit: TcxDBTextEdit
            Left = 26
            Top = 18
            Width = 137
            Height = 21
            DataBinding.DataField = 'FIO'
            DataBinding.DataSource = TaxInvoicesDM.SignatureNaklDSource
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -12
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            TabOrder = 2
          end
          object IsSignLabel: TcxLabel
            Left = 824
            Top = 8
            Width = 33
            Height = 15
            AutoSize = False
            ParentColor = False
            Properties.ShadowedColor = 13553358
            Style.BorderStyle = ebsSingle
            Style.Color = 13553358
            TabOrder = 3
            Caption = ''
          end
          object NotSignLabel: TcxLabel
            Left = 824
            Top = 24
            Width = 33
            Height = 15
            AutoSize = False
            ParentColor = False
            Style.BorderStyle = ebsSingle
            Style.Color = 16247513
            TabOrder = 4
            Caption = ''
          end
          object cxLabel1: TcxLabel
            Left = 670
            Top = 16
            Width = 56
            Height = 17
            AutoSize = False
            TabOrder = 5
            Caption = ' - '#1088#1103#1076#1086#1082
          end
          object cxLabel2: TcxLabel
            Left = 744
            Top = 16
            Width = 77
            Height = 17
            AutoSize = False
            TabOrder = 6
            Caption = ' - '#1076#1086#1082#1091#1084#1077#1085#1090
          end
          object cxLabel3: TcxLabel
            Left = 856
            Top = 8
            Width = 65
            Height = 17
            AutoSize = False
            TabOrder = 7
            Caption = #1087#1110#1076#1087#1080#1089#1072#1085#1086
          end
          object cxLabel4: TcxLabel
            Left = 856
            Top = 24
            Width = 89
            Height = 17
            AutoSize = False
            TabOrder = 8
            Caption = #1085#1077' '#1087#1110#1076#1087#1080#1089#1072#1085#1086
          end
          object SignatureDataDBTextEdit: TcxDBTextEdit
            Left = 240
            Top = 16
            Width = 121
            Height = 21
            DataBinding.DataField = 'DATE_TIME_SIGNATURE_MODERN'
            DataBinding.DataSource = TaxInvoicesDM.SignatureNaklDSource
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -12
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            TabOrder = 9
          end
          object cxLabel5: TcxLabel
            Left = 944
            Top = 16
            Width = 33
            Height = 15
            AutoSize = False
            ParentColor = False
            Properties.ShadowedColor = 13553358
            Style.BorderStyle = ebsSingle
            Style.Color = 13893544
            TabOrder = 10
            Caption = ''
          end
          object cxLabel6: TcxLabel
            Left = 976
            Top = 16
            Width = 49
            Height = 17
            AutoSize = False
            TabOrder = 11
            Caption = #1110#1084#1087#1086#1088#1090
          end
        end
        object cxGroupBox1: TcxGroupBox
          Left = 0
          Top = 334
          Width = 996
          Height = 44
          Align = alBottom
          Alignment = alTopLeft
          Caption = #1110#1085#1092#1086' '#1087#1088#1086' '#1089#1090#1074#1086#1088#1077#1085#1085#1103' '#1085#1072#1082#1083#1072#1076#1085#1086#1111
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Label1: TLabel
            Left = 24
            Top = 18
            Width = 116
            Height = 13
            Caption = #1085#1072#1082#1083#1072#1076#1085#1091' '#1089#1090#1074#1086#1088#1080#1074': '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 352
            Top = 18
            Width = 98
            Height = 13
            Caption = #1076#1072#1090#1072' '#1089#1090#1074#1086#1088#1077#1085#1085#1103':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object UserCreateDBTextEdit: TcxDBTextEdit
            Left = 136
            Top = 16
            Width = 209
            Height = 21
            DataBinding.DataField = 'name_user_create'
            DataBinding.DataSource = TaxInvoicesDM.VidNaklDSource
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            TabOrder = 0
          end
          object dateTimeCreateDBTextEdit: TcxDBTextEdit
            Left = 456
            Top = 15
            Width = 145
            Height = 21
            DataBinding.DataField = 'date_time_create_modern'
            DataBinding.DataSource = TaxInvoicesDM.VidNaklDSource
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -12
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            TabOrder = 1
          end
        end
      end
      object OtrNaklTabSheet: TTabSheet
        Caption = #1054#1090#1088#1080#1084#1072#1085#1110' '#1085#1072#1082#1083#1072#1076#1085#1110
        ImageIndex = 1
        object Panel2: TPanel
          Left = 0
          Top = 398
          Width = 996
          Height = 24
          Align = alBottom
          TabOrder = 0
          object KolvoOtrLabel: TLabel
            Left = 8
            Top = 3
            Width = 184
            Height = 13
            Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1080#1093' '#1091' '#1088#1077#1108#1089#1090#1088#1110':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object KolvoOtrValeuLabel: TLabel
            Left = 200
            Top = 3
            Width = 96
            Height = 13
            AutoSize = False
            Caption = 'KolvoValueLabel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object OtrNaklGrid: TcxGrid
          Left = 0
          Top = 0
          Width = 996
          Height = 354
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = cxcbsNone
          TabOrder = 1
          object OtrNaklGridDBTableView: TcxGridDBTableView
            OnDblClick = OtrNaklGridDBTableViewDblClick
            DataController.DataSource = TaxInvoicesDM.OtrNaklDSource
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0.00'#39#39';-,0.00'#39#39
                Kind = skSum
                FieldName = 'summa_all_pdv'
                Column = OtrNaklGridDBTableViewDB_summa_all_pdv
              end
              item
                Format = ',0.00'#39#39';-,0.00'#39#39
                Kind = skSum
                FieldName = 'summa_20_0_not_pdv'
                Column = OtrNaklGridDBTableViewDB_summa_20_0_not_pdv
              end
              item
                Format = ',0.00'#39#39';-,0.00'#39#39
                Kind = skSum
                FieldName = 'summa_20_0_pdv'
                Column = OtrNaklGridDBTableViewDB_summa_20_0_pdv
              end
              item
                Format = ',0.00'#39#39';-,0.00'#39#39
                Kind = skSum
                FieldName = 'summa_exempt_not_pdv'
                Column = OtrNaklGridDBTableViewDB_summa_exempt_not_pdv
              end
              item
                Format = ',0.00'#39#39';-,0.00'#39#39
                Kind = skSum
                FieldName = 'summa_exempt_pdv'
                Column = OtrNaklGridDBTableViewDB_summa_exempt_pdv
              end
              item
                Format = ',0.00'#39#39';-,0.00'#39#39
                Kind = skSum
                FieldName = 'summa_econ_activ_not_pdv'
                Column = OtrNaklGridDBTableViewDB_summa_econ_activ_not_pdv
              end
              item
                Format = ',0.00'#39#39';-,0.00'#39#39
                Kind = skSum
                FieldName = 'summa_econ_activ_pdv'
                Column = OtrNaklGridDBTableViewDB_summa_econ_activ_pdv
              end
              item
                Format = ',0.00'#39#39';-,0.00'#39#39
                Kind = skSum
                FieldName = 'summa_delivery_not_pdv'
                Column = OtrNaklGridDBTableViewDB_summa_delivery_not_pdv
              end
              item
                Format = ',0.00'#39#39';-,0.00'#39#39
                Kind = skSum
                FieldName = 'summa_delivery_pdv'
                Column = OtrNaklGridDBTableViewDB_summa_delivery_pdv
              end>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnCustomDrawCell = OtrNaklGridDBTableViewCustomDrawCell
            OptionsSelection.CellSelect = False
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderAutoHeight = True
            Styles.Background = StyleDM.cxStyle1
            Styles.StyleSheet = StyleDM.GridTableViewStyleSheetDevExpress
            Styles.Selection = StyleDM.cxStyle15
            Styles.NewItemRowInfoText = StyleDM.cxStyle13
            Styles.Preview = StyleDM.cxStyle14
            object OtrNaklGridDBTableViewDB_num_order: TcxGridDBColumn
              Caption = #13#10#13#10#8470' '#1079'.'#1087'.'#13#10'--'#13#10'1'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              SortOrder = soAscending
              Width = 37
              DataBinding.FieldName = 'num_order'
            end
            object OtrNaklGridDBTableViewDB_Data_Otr: TcxGridDBColumn
              Caption = #13#10#13#10#13#10#1044#1072#1090#1072' '#1086#1090#1088'.'#13#10'---'#13#10'2'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Width = 64
              DataBinding.FieldName = 'data_otr'
            end
            object OtrNaklGridDBTableViewDB_Data_vipiski: TcxGridDBColumn
              Caption = #13#10#13#10#13#10#1044#1072#1090#1072' '#1074#1080#1087'.'#13#10'------'#13#10'3'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Width = 65
              DataBinding.FieldName = 'Data_vipiski'
            end
            object OtrNaklGridDBTableViewDB_is_import: TcxGridDBColumn
              Visible = False
              DataBinding.FieldName = 'is_import'
            end
            object OtrNaklGridDBTableViewDB_Num_Nakl: TcxGridDBColumn
              Caption = #13#10#13#10#13#10#13#10#1085#1086#1084#1077#1088#13#10'---'#13#10'4'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Width = 61
              DataBinding.FieldName = 'Num_Nakl'
            end
            object OtrNaklGridDBTableViewDB_name_type_document: TcxGridDBColumn
              Caption = #13#10#13#10#13#10#13#10#1074'.'#1076'.'#13#10'--'#13#10'5'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 35
              DataBinding.FieldName = 'charcode_name_type_document'
            end
            object OtrNaklGridDBTableViewDB_oznaka1: TcxGridDBColumn
              Caption = #13#10#13#10#13#10#13#10#1074'.'#1076'.'#13#10'----'#13#10'5'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 36
              DataBinding.FieldName = 'oznaka1'
            end
            object OtrNaklGridDBTableViewDB_oznaka2: TcxGridDBColumn
              Caption = #13#10#13#10#13#10#13#10#1074'.'#1076'.'#13#10'----'#13#10'5'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 40
              DataBinding.FieldName = 'oznaka2'
            end
            object OtrNaklGridDBTableViewDB_name_provider: TcxGridDBColumn
              Caption = #13#10#13#10#13#10#13#10#1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#13#10'---------------------'#13#10'6'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 109
              DataBinding.FieldName = 'name_provider'
            end
            object OtrNaklGridDBTableViewDB_ipn_provider: TcxGridDBColumn
              Caption = #13#10#13#10#13#10#1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082' ('#1030#1055#1053')'#13#10'-----------'#13#10'7'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Width = 90
              DataBinding.FieldName = 'ipn_provider'
            end
            object OtrNaklGridDBTableViewDB_summa_all_pdv: TcxGridDBColumn
              Caption = #13#10#13#10#1047#1072#1075#1072#1083#1100#1085#1072' '#1089#1091#1084#1072' '#1074#1082#1083'. '#1055#1044#1042#13#10'--------------'#13#10'8'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 80
              DataBinding.FieldName = 'summa_all_pdv'
            end
            object OtrNaklGridDBTableViewDB_summa_20_0_not_pdv: TcxGridDBColumn
              Caption = #13#10#13#10'20%, 0% '#1074#1072#1088#1090'-'#1090#1100' '#1073#1077#1079' '#1055#1044#1042#13#10'------------'#13#10'9'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 78
              DataBinding.FieldName = 'summa_20_0_not_pdv'
            end
            object OtrNaklGridDBTableViewDB_summa_20_0_pdv: TcxGridDBColumn
              Caption = #13#10#13#10#13#10'20%, 0% '#1089#1091#1084#1072' '#1055#1044#1042#13#10'------------'#13#10'10'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 73
              DataBinding.FieldName = 'summa_20_0_pdv'
            end
            object OtrNaklGridDBTableViewDB_summa_exempt_not_pdv: TcxGridDBColumn
              Caption = 
                #13#10#1047#1074#1110#1083#1100#1085#1077#1085#1110' '#1074#1110#1076' '#1086#1087#1086#1076#1072#1090#1082#1091#1074'. '#1074#1072#1088#1090'-'#1090#1100' '#1073#1077#1079' '#1055#1044#1042' '#13#10'----------------'#13#10'1' +
                '1'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 91
              DataBinding.FieldName = 'summa_exempt_not_pdv'
            end
            object OtrNaklGridDBTableViewDB_summa_exempt_pdv: TcxGridDBColumn
              Caption = #13#10#13#10#1047#1074#1110#1083#1100#1085#1077#1085#1110' '#1074#1110#1076' '#1086#1087#1086#1076#1072#1090#1082#1091#1074'. '#1089#1091#1084#1072' '#1055#1044#1042#13#10'---------------'#13#10'12'#13#10
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 90
              DataBinding.FieldName = 'summa_exempt_pdv'
            end
            object OtrNaklGridDBTableViewDB_summa_econ_activ_not_pdv: TcxGridDBColumn
              Caption = 
                #13#10#1071#1082#1110' '#1085#1077' '#1087#1088#1080#1079#1085'. '#1076#1083#1103' '#1074#1080#1082#1086#1088'. '#1091' '#1075#1086#1089#1087'. '#1076'. '#1074#1072#1088#1090'-'#1090#1100' '#1073#1077#1079' '#1055#1044#1042#13#10'---------' +
                '-----------'#13#10'13'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 104
              DataBinding.FieldName = 'summa_econ_activ_not_pdv'
            end
            object OtrNaklGridDBTableViewDB_summa_econ_activ_pdv: TcxGridDBColumn
              Caption = 
                #13#10#1071#1082#1110' '#1085#1077' '#1087#1088#1080#1079#1085'. '#1076#1083#1103' '#1074#1080#1082#1086#1088'. '#1091' '#1075#1086#1089#1087'. '#1076'. '#1089#1091#1084#1072' '#1055#1044#1042#13#10'---------------'#13 +
                #10'14'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 89
              DataBinding.FieldName = 'summa_econ_activ_pdv'
            end
            object OtrNaklGridDBTableViewDB_summa_delivery_not_pdv: TcxGridDBColumn
              Caption = #1044#1083#1103' '#1087#1086#1089#1090#1072#1074#1082#1080' '#1087#1086#1089#1083#1091#1075', '#1074#1072#1088#1090'-'#1090#1100' '#1073#1077#1079' '#1055#1044#1042#13#10'-------------'#13#10'15'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 83
              DataBinding.FieldName = 'summa_delivery_not_pdv'
            end
            object OtrNaklGridDBTableViewDB_summa_delivery_pdv: TcxGridDBColumn
              Caption = #13#10#1044#1083#1103' '#1087#1086#1089#1090#1072#1074#1082#1080' '#1087#1086#1089#1083#1091#1075', '#1089#1091#1084#1072' '#1055#1044#1042#13#10'-------------'#13#10'16'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 80
              DataBinding.FieldName = 'summa_delivery_pdv'
            end
            object OtrNaklGridDBTableViewDB_is_expansion: TcxGridDBColumn
              Caption = #1059#1090'. '#1088#1086#1079#1096'.'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayUnchecked = 'False'
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 40
              DataBinding.FieldName = 'is_expansion'
            end
            object OtrNaklGridDBTableViewDB_is_korig: TcxGridDBColumn
              Caption = #1050#1086#1088#1080#1075
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayUnchecked = 'False'
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 30
              DataBinding.FieldName = 'is_korig'
            end
            object OtrNaklGridDBTableViewDB_is_edit: TcxGridDBColumn
              Visible = False
              DataBinding.FieldName = 'is_edit'
            end
            object OtrNaklGridDBTableViewDB_name_subdivision: TcxGridDBColumn
              Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
              Options.Filtering = False
              DataBinding.FieldName = 'name_subdivision'
            end
          end
          object OtrNaklGridLevel: TcxGridLevel
            GridView = OtrNaklGridDBTableView
          end
        end
        object cxGroupBox2: TcxGroupBox
          Left = 0
          Top = 354
          Width = 996
          Height = 44
          Align = alBottom
          Alignment = alTopLeft
          Caption = #1110#1085#1092#1086' '#1087#1088#1086' '#1089#1090#1074#1086#1088#1077#1085#1085#1103' '#1085#1072#1082#1083#1072#1076#1085#1086#1111
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Label3: TLabel
            Left = 24
            Top = 18
            Width = 116
            Height = 13
            Caption = #1085#1072#1082#1083#1072#1076#1085#1091' '#1089#1090#1074#1086#1088#1080#1074': '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 352
            Top = 18
            Width = 98
            Height = 13
            Caption = #1076#1072#1090#1072' '#1089#1090#1074#1086#1088#1077#1085#1085#1103':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object UserCreateOtrDBTextEdit: TcxDBTextEdit
            Left = 136
            Top = 16
            Width = 201
            Height = 21
            DataBinding.DataField = 'name_user_create'
            DataBinding.DataSource = TaxInvoicesDM.OtrNaklDSource
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            TabOrder = 0
          end
          object DataCreateOtrDBTextEdit: TcxDBTextEdit
            Left = 448
            Top = 16
            Width = 169
            Height = 21
            DataBinding.DataField = 'date_time_create'
            DataBinding.DataSource = TaxInvoicesDM.OtrNaklDSource
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            TabOrder = 1
          end
        end
      end
    end
    object dxBarDockControl1: TdxBarDockControl
      Left = 1
      Top = 1
      Width = 1004
      Height = 22
      Align = dalTop
      BarManager = TaxInvoicesBarManager
    end
  end
  object TaxInvoicesBarManager: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = #1055#1072#1085#1077#1083#1100' '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 404
        FloatTop = 343
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = InsertReestrBtn
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = UpdateReestrBtn
            Visible = True
          end
          item
            Item = DeleteReestrBtn
            Visible = True
          end
          item
            BeginGroup = True
            Item = IsSignatureReestrButton
            Visible = True
          end
          item
            Item = NotSignatureReestrButton
            Visible = True
          end
          item
            Item = SignatureReestrHistButton
            Visible = True
          end
          item
            BeginGroup = True
            Item = ExportButton
            Visible = True
          end
          item
            BeginGroup = True
            Item = ImportBarLargeButton
            Visible = True
          end
          item
            BeginGroup = True
            Item = ImportSystemLargeButton
            Visible = True
          end
          item
            Item = FilterBtn
            Visible = True
          end
          item
            BeginGroup = True
            Item = RefreshBtn
            Visible = True
          end
          item
            BeginGroup = True
            Item = PrintBtn
            Visible = True
          end
          item
            BeginGroup = True
            Item = ExitBtn
            Visible = True
          end>
        Name = 'Custom 1'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = #1055#1072#1085#1077#1083#1100' '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103' '#1085#1072#1082#1083#1072#1076#1085#1080#1093
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 634
        FloatTop = 378
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = InsInReestrButton
            Visible = True
          end
          item
            Item = UpdInReestrButton
            Visible = True
          end
          item
            Item = DelInReestrButton
            Visible = True
          end
          item
            BeginGroup = True
            Item = IsNaklSignatureButton
            Visible = True
          end
          item
            Item = NotNaklSignatureButton
            Visible = True
          end
          item
            BeginGroup = True
            Item = IsEditButton
            Visible = True
          end
          item
            Item = SignatureNaklHistButton
            Visible = True
          end
          item
            BeginGroup = True
            Item = NumOrderButton
            Visible = True
          end
          item
            BeginGroup = True
            Item = ViewButton
            Visible = True
          end>
        Name = 'Custom 2'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clBtnFace
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 1088
    Top = 40
    DockControlHeights = (
      0
      0
      46
      0)
    object InsertReestrBtn: TdxBarLargeButton
      Caption = #1044#1086#1076#1072#1090#1080' '#13#10
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1088#1077#1108#1089#1090#1088#13#10
      Visible = ivAlways
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF0006770C0008780E0006770D00097711000EA51B000EA51C000EA4
        1B000EA31B000FA41D0010A61F0012A8210011A8210013A8230017AC280017AB
        290018AD2A0019AC2B001BB02F001DB132001EB032001FB1330020B2360022B4
        380024B53B0026B63D0027B7400029BA43002CBC48002BBA44002EBE4A0030BE
        4C0031C04F0033C1510036C6550037C5560038C558003BC95C003CC95E003CCC
        5F003FCC630041CF660042CE660042D0680046D46D0046D36E0046D26D0049D5
        71004CD875004CD675004DD8770050DB7B0052DD7E0051DA7C0054DD810057E1
        850056E0850059E289005AE38A005CE58C005EE8900000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202060606060202020202020202
        0202020202020202020202030109080806020202020202020202020202020202
        0202020301090808060202020202020202020202020202020202020301090808
        0602020202020202020202020202020202020205010908080602020202020202
        020202020202020202020204010C070706020202020202020202020202020202
        0202020401110E0E060202020202020202020202020606060606060401151212
        040606060606060202020202060136322E2B29241D1A171314100D0807070706
        02020202060136322E2B2924211F1B1814100D08070808060202020206013A37
        33302C2825221E1C1916130F0B0A090602020202060101010101010101262320
        0101010101010106020202020206060606060604012A27270406060606060602
        020202020202020202020206012F2D2D06020202020202020202020202020202
        0202020601343131060202020202020202020202020202020202020601383535
        0602020202020202020202020202020202020206013B393E0602020202020202
        020202020202020202020206013C3D3E06020202020202020202020202020202
        0202020601010101060202020202020202020202020202020202020206060606
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202}
      OnClick = InsertReestrBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FF92635DA46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769A46769A46769A46769A46769A46769A46769A46769FF00FFFF
        00FFFF00FFFF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0CE9EEFCB97
        EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080EDC180EABF
        7F9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED4B8F4DABBF2D5B1F0
        D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9BD7FE9BD7FE9BD7F
        E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED7
        C0F6E0C1F2D9B8F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC58FEBC189EABF82E9
        BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF93655FEFDAC5F7E2C7F3DCBFF2D8B7F2D4B0F0D1AAEFCEA3EECB9CEDC7
        95EDC58FEBC189E9BD81E9BD7FE9BD7FE9BD7FEABF7FE7BC7E9F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FF936560F0DECCF8E6CFF6E0C6F3DCBDF2D8B7F2D5B1
        F0D1AAEFCEA3EECB9CEDC796EDC590EBC189E9BF82E9BD7FE9BD7FEABF7FE7BC
        7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2D3FAEAD7F6E3CEF4
        DEC5F3DCBFF2D8B8F0D4B1F0D1AAEFCEA3EECB9DEDC797EDC590EBC189E9BD81
        E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF986963F2E6
        DAFAEEDEF7E7D4F6E2CBF4E0C5F3DCBFF2D8B7F2D5B0F0D1A9EFCEA3EECB9DED
        C796EDC58FEBC189E9BD81EABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF9E6E64F4EAE1FBF2E6F8EADCF7E6D3F6E2CCF4E0C6F3DCBFF2D8B7F2D5
        B0F0D1AAEFCEA4EDCB9CEDC796EBC58FEBC188EABF82E7BB7E9F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3F7EADAF7E6D3F6E2CC
        F4DEC5F3DCBDF2D8B6F0D5B0F0D1AAEFCEA3EECA9CEDC795EBC48EEBC288E7BC
        809F6F60FF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3F0FEFBF6FBF3EBF8
        EEE3F8EBDCF7E7D3F6E2CCF4E0C5F3DCBDF2D8B7F2D4B1F0D1A9EFCEA3EDCB9C
        EDC795EDC58FE9BF879F6F62FF00FFFF00FFFF00FFFF00FFFF00FFAC7969FAF6
        F4FFFFFEFEF8F3FBF2EAF8EEE3F8EBDAF7E6D3F7E2CCF6E0C5F3DCBFF2D8B7F2
        D4B0F0D1AAEFCEA3EECB9CEEC996EAC18EA07063FF00FFFF00FFFF00FFFF00FF
        FF00FFB17E6BFAF6F4FFFFFFFFFEFBFEF7F0FBF3EAFAEFE3F8EADAF7E7D3F6E2
        CBF6E0C5F3DCBFF2D8B6F2D4B0F0D1A9EFCEA1EECB9CEBC592A07264FF00FFFF
        00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFBFEF7F2FBF3EB
        F8EEE3F8EBDCF7E6D3F6E3CCF6DEC5F3DCBDF3D8B6F2D4AFF0D1A9F0CFA3EDC9
        999D7065FF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFFFFFFFFFFFF
        FFFFFFFEFBFEF7F2FBF3EAFAEEE3F8EADAF7E6D3F6E2CBF6DEC4F3DABCF2D8B6
        F0D4AFEFD0A7CEB491896A63FF00FFFF00FFFF00FFFF00FFFF00FFC0896FFBF7
        F4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFEF7F2FBF2EAFAEEE2F8EBDAF7E6D3F6
        E2CBF6DEC4F3DCBDE5CEAFC4B096A1927F806762FF00FFFF00FFFF00FFFF00FF
        FF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFCF8F2FBF3
        EAF8EEE2F8EAD9F8E7D4FAE9D0E0D0BAB8AB9AA79C8BA49786846964FF00FFFF
        00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C49E675B98665B95655B96655B9665
        5B986859FF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7F6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B69F675BDAA16B
        DD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FFFF00FFD49875FCF8
        F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFFFEF7DD
        C4BC9F675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFDDC7C29F675BEAB273EFA751A5686BFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CE9F675BEDB572A5686BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD39570E6C2ACE7C6B0E7C6B0E6
        C4B0E3C2B0E1C0AFDEBDADDCBCACD8BAACD5B7ABD3B5ABC099909F675BA5686B
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object UpdateReestrBtn: TdxBarLargeButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1088#1077#1108#1089#1090#1088' '
      Visible = ivAlways
      OnClick = UpdateReestrBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF0022212300534E5700FF00FF0041353800A4676900A5686B007A494A005A35
        35008B555500804E4E0091595900965D5D008B565600734747008C5757009560
        6000AA6E6E00A96D6D00A76C6C00A66B6B008C5B5B0091606000B77A7A00B679
        7900B87B7B00BB7E7E00BA7D7D009C696900CB8C8C00CA8B8B00C98B8B00C78A
        8A00CC8E8E00DA9A9A00D9999900C2898900D99A9A00DC9D9D00E1A1A100DA9C
        9C00E2A3A300EBAAAA00E2A4A400E1A3A300643B3A00734847007B504F005D38
        360093656000E2D0CE009566600093655F009869630084544C009F675B009E6E
        6400A3726600DDC7C200FBF7F6009D6D5F00865D51007350460062443C00A775
        68009F6F6000AC796900583F3700533C3500DDC4BC0096695A00B17E6B00FFFC
        FB00BB846E00B6816C00BCA19600DAC0B600BBA19600CB917300C58C7000C089
        6F00FCF8F600FAF6F400CF8E6800D4987500CF967400F6EEE900F8F3F000AA78
        56003C383500FEF7F200ECD5C200E1CCBB003E3935006A554200F2E2D300FAEE
        E300F4EAE100B77D460066523F0064513E0065524000EFDAC500F2E6DA00FBF2
        E900FEF7F000FDF8F300EAB2730062503D00604F3D00EED4B800F0DAC200F6E3
        CE00F0DECB00F7E6D300F4E3D000F8EEE300FBF3EA00EFA75100EDB57200EAB4
        7400F2D5B100E9CCAB00F4DEC500F4E1CA00F3E0CA00F7E7D400FAEAD700F8EA
        D900F7EADA00F8EBDC008E745100E5BC8400A4865F00B29268009E835F00E1BB
        88006C594100897253006A5841008E775900DEBB8C00AA8F6B00C6A67E007764
        4C00E1C09300C1A57F00836F5600E6C79D00C9AD89008C796000EDCEA700D9BD
        9900E6CEAF00F2DABC00EAD4B600F4DEC000AC9D8A00F6E1C600F7E5CE00F6E6
        D100F8EBDA00FAEEDE00FBF2E600E1B77900EABF7F00CCA66E00E9BD7F00E7BC
        7E00E5BB7D00DEB57900DAB17700D9B17600E3BA7D00D1AB7300C09C6900A989
        5D009A7E5500E7BC8100E1B77D00C7A36F00BC996900B2916300D1AB7500826C
        4B00987D5800DAB47F00C7A474007B664800B89A6F007E694C00766347006F5D
        4300D1AF7F009D876700F0D8B700EBD8BD00FCF6ED00FCF7F000E3BA7B00FEFB
        F600FFFAEF00FFFEFB00FFFEF700FFFFFE003A494800748686003443440000BD
        FF0000B1F2004E6C760000AAEA0000A6E600009FDE000093D100097BAB001A3E
        4D000087C4000084C100028AC4000B4159000C3C5200113B4E00008CD100036A
        9D0004689A000459830005679800064F7500182A33001B506E00315065003547
        56002A34400041485500012BA700001C9D002D4FF6005270FC00021DB100031E
        B1000420B8000725DC000F2ECC001839E3000C21BF00010D9D001322BD001624
        BF0001099700010A9700050DA50000058F00000082001F1F2100040404040404
        0404040404040404040404040404040404043506060606060606060606060606
        06060606060404040404356F9B7A9895928E8985B3A9A8A8A8A8A6A942040404
        0404355C9DC47B99969390C2BBB4AEA9A8A8A6A942040404040435679F9B9A02
        5E97C38FBEBCB8ABAAA9A6A94204040404043272A07C9C5AFFE6D0948D8887B5
        ADAEA9A942040404040434608071709EDFE2E5DECE918B86B6AFA5C842040404
        04043668A37F7DC5D9E1E4E7EA055FBFBAB7A7AC3D04040404043962A483737E
        CFE3E811120D2E66C084B1B04704040404043A57C675827372DD16221B120D2E
        65C1B9B23E04040404044158C9767583A1D31D271E1C130C096D8CBD3F040404
        04044353CD6B6975A274302C271E1C1310096E8A400404040404485301CB6A76
        61815D302A271F1A140E09644404040404044B530101495B7675835D2F2D2920
        1A140E314504040404044A53010101CB5B7661814E2F28232018150A09040404
        0404515301010101CB5B6961A24E2F28262118150A0904040404505301010101
        01496B7675814C172B2421190BEBE90404044F53010101010101CBC769A45C37
        172B2403DCD4D5DA0404563C0101010101010149C7CA4D38591725D8D1D1D5ED
        FE045552010101010101010149CC463879630FD6D1E0EDF7FBFE555201010101
        0101010101013B386C7708D7D2ECF3F2F0FB55CD010101010101010101013338
        78070404DBF6EEF4F1FD54545454545454545454545454380704040404F9EFF5
        FA040404040404040404040404040404040404040404F8FC0404}
    end
    object DeleteReestrBtn: TdxBarLargeButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1088#1077#1108#1089#1090#1088
      Visible = ivAlways
      OnClick = DeleteReestrBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FF0005B70005B70005
        B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FFFF00FF
        0005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FFFF
        00FFFF00FFFF00FF0005B70005B70005B70005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B700
        05B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006
        F60005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FF0005B700
        05B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FF0005
        B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B70005B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF0005B70005B70006F60005B70006F60005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70006F60005B7FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F60005B70005
        B70006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F6
        0005B70006F60006F60006F60005B70006F6FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60005B70006F6FF00FFFF00FF0006F60006F60006F60006F6FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0006F60006F60005B70006F60006F6FF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0006F6FF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006
        F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F6
        0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object ExitBtn: TdxBarLargeButton
      Align = iaRight
      Caption = #1042#1080#1093#1110#1076
      Category = 0
      Hint = #1042#1080#1093#1110#1076
      Visible = ivAlways
      ShortCut = 27
      OnClick = ExitBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF004E1E1F00BF4C4D00BD4B4C00C04D4E00C14E4F00C4505100C24F
        5000C5515200B64B4C00C9545500C7535400C6525300CA555600CB565700CE58
        5900CC575800C5545500D05A5B00CF595A00D35C5D00D15B5C00D55E5F00D45D
        5E00D8606200D75F6000AF4E4F00D9626300DD656600DC646500DA636400E067
        6800DE666700E2696A00E1686900E56B6C00E36A6B00E96E6F00E76D6E00E66C
        6D009F4B4C00EA6F7000A04C4D00EB707200A34E4F00EE737400ED7273009C4B
        4C00F2767700F0757600EF747500E06D6E00A6515200F6797A00F4787900F377
        7800A9535400F87B7D00F77A7B00FB7E7F00FA7D7E00AF585900AC5657009A4D
        4E00FF818200FE808100FC7F8000F77E7F00B25B5C00EE7A7B00D56F7000B860
        6200B6626300AF5E5F00FE8B8C0091515200FC929300EF909100FB9A9C00E690
        9100EB959600FAA3A400F8AAAB00F2A9AA00EEA6A700F7B5B600A5505000994B
        4B00AB555500B15A5A00B55D5D00B75F5F00914B4B00BB636300BF666600BD65
        65008C4B4B00894B4B009F58580098555500824B4B00EB9C9C00F7B1B100EECE
        AF00FFFFD300D9F6BD00B7EBAA0058A55B003F9E4C005ED3770045CA67001EBC
        4C00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        02020202026603020202020202020202020202020202020202026666625E0302
        020202020202020202020202020202666663310B052A03020202020202020202
        02020202026666411C070604042A03596666666666666666020202020266130C
        0D0E0A08092C034C4E505354685757660202020202661112100F0C0D0E2E036E
        71717171717157660202020202661714151112100F58036E7171717171715766
        0202020202661818191617141536036E7171717171715766020202020266201D
        1A1B1819163A036E7171717171715766020202020266221E1F201D1A1B5A036E
        71717171717157660202020202662324212235511F40036D7171717171715766
        020202020266282925265601673F03696C6F6F70707057660202020202662D2B
        27285501525B03696A6A6A6A6B6B5766020202020266342F302D2B4F28460369
        6A6A6A6A6A6A576602020202026639393233342F305C03696A6A6A6A6A6A5766
        0202020202663B3C37383932335D03696A6A6A6A6A6A5766020202020266443D
        3E3B3C37384903696A6A6A6A6A6A576602020202026642424344443D3E5F0369
        6A6A6A6A6A6A5766020202020266424242424243436103696A6A6A6A6A6A5766
        020202020266454242424242426003696A6A6A6A6A6A5766020202020266664B
        48424242426003696A6A6A6A6A6A57660202020202020266664D4A474260035E
        6666666666666666020202020202020202026666656403020202020202020202
        0202020202020202020202020266030202020202020202020202}
    end
    object FilterBtn: TdxBarLargeButton
      Caption = #1060#1110#1083#1100#1090#1088
      Category = 0
      Hint = #1060#1110#1083#1100#1090#1088
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = FilterBarPopupMenu
      OnClick = FilterBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        0800000000004002000000000000000000000001000000000000FF00FF00004B
        0000004E000000580000005E0000015D0400055E080000620000006600000260
        050001690200006F000004640A0005670D00076A0F0000730000007600000376
        08000C731500760376000A4A52000D5862000D5A6400C47B0000FF7E00000081
        0000018603000289060003810800048E0A0005910E00078612000A8C1B001080
        1E0007961300099816000A9A19000C9D1D00149110001488230019932B001C9A
        3100189D33001E9E34000DA021000EA324000FA4280010A5280011A72C001CA9
        2F0013AB300015AD35001DA5390016B0390018B23D0020A5390019B641001BB8
        45001CB845001DBB49001FBF4D0023AC400032A54B0028B4450027B548002EBB
        550028CC4F0021C2500023C5530026C9560029CD5A0033CC580034CC59002FD7
        51002FD850002DD35E002FD7620031D9640034DD670036E16A003BE76F003EEB
        730041EF760045F67B0045F67F0047F87E00DAAB1F00E0B73B00E0B83B00E2AB
        6F00E3C15200E5C65B00E7C96600FC00FC00FF78FF0000A6BD0045F6800049FB
        80004BFE820000B1CA0000C4E00000C9E30000CCE90000D7F40054E6F7007FFA
        F800EDD78A00EFDC9800F6E9BD00FA95FA0081FFFE00F8F2D400FFFFFF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000001010101
        0000000000000000000000000000000000000005426049190100000000000000
        0000000000000000000000054260491901000000000000000000000000000000
        0000000542604919010000000000000000000000000000000000000542544919
        0100000000000000000000000000000000000005426049190100000000000000
        0000000000000000000000053E41312601000000000000000000000000000000
        0000052A443830241C0100000000000000000000000000000005344B44363023
        1B100100000000000000000000000000053D4F463C362C221B19100100000000
        00000000000000053F524E463C322C1E1919191001000000000000000000053F
        61514E443832242219191919100100000000000000053F6155504C443830241D
        191919191910010000000000052A482A2A210E0D0D0505050505050808101001
        00000005010105050A101F206E66635F143F372A271201010100050510101717
        17172430326E656465155461616161480601000508175B5A5856173032386E67
        6767154837285E010100000000596B6A5C5817010101016E67150101015E5E13
        0000000000596F6C6A5A170000000000680000006D5E5D13130000000059706F
        6B5B1800000000000000006D6D5D5D5D13130000000059595959000000000000
        000000006D6D5D131300000000000000000000000000000000000000006D5E13
        000000000000000000000000000000000000000000005E000000}
    end
    object RefreshBtn: TdxBarLargeButton
      Caption = #1054#1085#1086#1074#1080#1090#1080
      Category = 0
      Hint = #1054#1085#1086#1074#1080#1090#1080
      Visible = ivAlways
      OnClick = RefreshBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF92635D8E5D598E5D598E5D598E5D598E5D598E5D598E5D59
        8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598050
        4BFF00FFFF00FFFF00FFFF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0
        CE9EEFCB97EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080
        EDC180EABF7F80504BFF00FFFF00FFFF00FFFF00FFFF00FF93655FEED4B8F4DA
        BBF2D5B1F0D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9BD7FE9
        BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF
        93655FEED7C0F6E0C1F2D9B8F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC58FEBC1
        89EABF82E9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF
        00FFFF00FFFF00FF93655FEFDAC5F7E2C7F3DCBFF2D8B7007000F0D1AAEFCEA3
        B1B874007000007000007000ADAD60E9BD7FE9BD7FE9BD7FEABF7FE7BC7E8050
        4BFF00FFFF00FFFF00FFFF00FFFF00FF936560F0DECCF8E6CFF6E0C6F3DCBD00
        7000047503B2BD7F007000B1B874EDC796B0B46B007000ADAF62E9BD7FE9BD7F
        EABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2D3FAEA
        D7F6E3CEF4DEC5007000007000007000B2BD7FEFCEA3EECB9DEDC797B0B46B00
        7000E9BD81E9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF
        986963F2E6DAFAEEDEF7E7D4F6E2CB007000007000007000007000F0D1A9EFCE
        A3EECB9DEDC796007000EBC189E9BD81EABF7FE7BC7E80504BFF00FFFF00FFFF
        00FFFF00FFFF00FF9E6E64F4EAE1FBF2E6F8EADCF7E6D3007000007000007000
        007000007000F0D1AAEFCEA4EDCB9CEDC796EBC58FEBC188EABF82E7BB7E8050
        4BFF00FFFF00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3F7EADAF7
        E6D3F6E2CCF4DEC5F3DCBDF2D8B6F0D5B0F0D1AAEFCEA3EECA9CEDC795EBC48E
        EBC288E7BC8080504BFF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3F0FEFB
        F6FBF3EBF8EEE3F8EBDCF7E7D3F6E2CCF4E0C500700000700000700000700000
        7000EDCB9CEDC795EDC58FE9BF8780504BFF00FFFF00FFFF00FFFF00FFFF00FF
        AC7969FAF6F4FFFFFEFEF8F3FBF2EA007000F8EBDAF7E6D3F7E2CCF6E0C50070
        00007000007000007000EFCEA3EECB9CEEC996EAC18E80504BFF00FFFF00FFFF
        00FFFF00FFFF00FFB17E6BFAF6F4FFFFFFFFFEFBFEF7F0007000BAD4AAF8EADA
        F7E7D3F6E2CBB7C792007000007000007000F0D1A9EFCEA1EECB9CEBC5928050
        4BFF00FFFF00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFBBC
        DAB4007000B8D3AAF8EBDCB7CC9D007000B7C792047503007000F2D4AFF0D1A9
        F0CFA3EDC99980504BFF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFF
        FFFFFFFFFFFFFFFFFEFBBCDAB4007000007000007000B7CC9DF6E2CBF6DEC400
        7000F2D8B6F0D4AFEFD0A7CEB49180504BFF00FFFF00FFFF00FFFF00FFFF00FF
        C0896FFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFEF7F2FBF2EAFAEEE2F8EB
        DAF7E6D3F6E2CBF6DEC4F3DCBDE5CEAFC4B096A1927F80504BFF00FFFF00FFFF
        00FFFF00FFFF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFB
        FCF8F2FBF3EAF8EEE2F8EAD9F8E7D4FAE9D0E0D0BAB8AB9AA79C8BA497868050
        4BFF00FFFF00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C4A0675BA0675BA0675B
        A0675BA0675BA0675BFF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7F6FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B6A0
        675BDAA16BDD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FFFF00FF
        D49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
        FBFFFEF7DDC4BCA0675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFDDC7C2A0675BEAB273EFA751A5686BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CEA0675BEDB572A5686B
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E68CF8E
        68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68A0
        675BA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object PrintBtn: TdxBarLargeButton
      Caption = #1044#1088#1091#1082' '#1087#1086#1076'.'#1085#1072#1082#1083#1072#1076#1085#1086#1111
      Category = 0
      Hint = #1044#1088#1091#1082' '#1087#1086#1076'.'#1085#1072#1082#1083#1072#1076#1085#1086#1111
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = PrintBarPopupMenu
      OnClick = PrintBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C
        6A6A6C6A6AFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF6C6A6AB0ADAD9692938E8A8B6C6A6A6C6A6A817E7F6C6A6ADDDCDCD0CFCF6C
        6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF6C6A6AD5D4D4C6C4C4A19F9FA19F9FA19F9F8381825C5B5BBCBC
        BCCECECECFCFCFD1D1D1D3D3D3CAC9C96C6A6A6C6A6A6C6A6AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6C6A6AD8D7D7E0DEDEC0BFBFA19F9FA19F9FA19F9F
        6260600000000000001616165D5D5DA9A9A9CACACACACACACACACACACACAC1C0
        C06C6A6A6C6A6A6C6A6AFF00FFFF00FF6C6A6AD3D3D3D4D3D3CFCFCF8C8A8A81
        7F7F817F7F817F7F6C6A6A1414140808080000000000000000001616165D5D5D
        A9A9A9CACACACACACAB7B6B6B7B6B66C6A6AFF00FF6C6A6ACACACACACACAC6C6
        C68E8C8CB8B5B5B6B4B4A19F9FA19F9F9F9D9D9997979390918280805250502B
        2A2A080808000000000000161616646464817E7F6C6A6AFF00FFFF00FF6C6A6A
        CACACAC5C5C58E8C8CD7D4D4F7F6F6F6F4F4F2F0F0E0DEDECAC7C7B6B5B5A5A3
        A3A19F9FA19F9F9E9A9C9390916865662322230303031919199997976C6A6AFF
        00FFFF00FF6C6A6AC5C5C58E8C8CE7E6E6F7F6F6F7F6F6F6F4F4F2F0F0EEEDED
        EAEAEAE7E6E6E3E2E2D4D3D3C2C1C1AFADADA19F9FA19F9F9997978280806C6A
        6A9F9D9D6C6A6AFF00FFFF00FF6C6A6A8E8C8CEFEEEEF7F6F6F7F6F6F7F6F6F6
        F4F4D5D3D4867B7E958B8EC1BFBFDDDCDCE0E0E0DCDCDCD8D8D8D1D1D1C2C1C1
        B2B0B0A19F9F9C99996C6A6A6C6A6AFF00FFFF00FF6C6A6ACECBCCF7F6F6F7F6
        F6F7F6F6F7F6F6CFCBCCAFACADADABAB9E989883797B75696B898081ABA5A6C7
        C6C6D5D5D5D1D1D1CECECEC9C7C7BBBABAA6A4A46C6A6AFF00FFFF00FFFF00FF
        6C6A6A6C6A6ACECBCCEDEBEBAFA4A56B5D5F766A6C83787A9C9697ACAAAAB2B0
        B0ABA7A9989192817778847A7D938C8EBFBFBFCBCBCBCACACAC0C0C06C6A6AFF
        00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6ABD8281AF8A737D5E51665456
        6554576D5E626D5E62898081A09A9CAFACADB2B0B0A49FA0CAC9CACBCBCBB7B6
        B66C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FF
        D4ABFFD0A1FFCB98D5A57BA1785C7B665F6050536656596F62658E8687CECCCC
        CFCFCFA5A4A46C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFBD8281FFD9B2FFD4A9FFCFA0FFCA97FFC68EFFC186FFBF81FFC084BD
        82816C6A6A6C6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFBD8281FFDDBAFFD8B1FFD3A7FFCE9EFFCA96FFC5
        8CFFC084FFC084BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFE5CBFFE1C2FFDCB8FFD7AF
        FFD3A6FFCE9DFFC995FFC48BBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFEAD4FF
        E5CAFFE0C0FFDAB7FFD7ADFFD1A5FFCC9CFFC792BD8281FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFBD8281FFEEDCFFE9D1FFE3C9FFE0BFFFDAB6FFD5ACFFD0A3F7C297BD8281FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFBD8281FFF7EEFFF2E3FFEDDAFFE7D0FFE3C7FFDEBDFFD9B4FFD4
        ABBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFBD8281FFFAF3FFFAF3FFF6EDFFF0E2FFEBD9FFE7CF
        FFE2C5FFDDBCF2C7A9BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281BD8281BD8281BD8281FF
        F4EBFFF0E1FFEBD7FFE6CEFBDCC0BD8281FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFBD8281BD8281BD8281BD8281BD8281FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object IsSignatureReestrButton: TdxBarLargeButton
      Caption = #1055#1110#1076#1087#1080#1089#1072#1090#1080' '
      Category = 0
      Hint = #1055#1110#1076#1087#1080#1089#1072#1090#1080' '#1088#1077#1108#1089#1090#1088
      Visible = ivAlways
      OnClick = IsSignatureReestrButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        0800000000004002000000000000000000000001000000000000FF00FF00021F
        2D00001A3000001C3400001F380000203B0000223E000F283D0035353C00562C
        1200593436006E3326006833280079352B00603535006A363500623939006438
        3800693E3E0000204000012542000127450002294A00022C4E0007334A000435
        4D00002D52000131560003315B0006335A0003335C0002355D0007385F002133
        41002434420025364400373C40000238620006396600023D6700083B64000438
        6A00053A6D00183B6A0001377700093E70000746670001426D00034B6E000144
        72000C4473000D4879001F5B780023567200265D7900585554006B4040008C2C
        0500972E0200982F03009F3103009E330600A4320400AB350700AA340900B538
        0E00BB3A1300BC3A1400B13D1C00893D3700CB390F00C0391300C13D1900C93E
        1800BA411400BC481C008F442800A7413600D3411E00DA412300D8492400D355
        2D00DD532800DA562900D85A3500EA472E00E3492C00E3562E00ED592D00F248
        3400F74B3700F84F3300F84A3800E1533700F4503900F2573B00C66C3D008F53
        51009D5956009C606000A3656400AC747300B67D7D00F8574000F8634400F46A
        4400FA6F4C00FC6D4C00FB704D00FF704E00FF754F00FF745100FF795900CE8B
        6600CA8C6A00CE957300000081000000890000028E0000039700000796000006
        A100000AA2000007B5000259890001588C000E4E99000C499C00005E9200315C
        8B000662900004659600005EAD000644B4000E4DB2001B66A6000375AC000060
        B1000572BC000A78BF001F70B1001E70BB003568A10041729F00000FCF000949
        C2000D50CF00105BC6000E52D4000D56D5000B59D400155FD300165DDC001669
        C000237ED4001766E200196EE7001A70EA001B74EE001D7DEB001F7FED001C75
        F0001D7DF4001A76F800008AC9000095D3002C8EDD001F81F900268BEF002186
        FA002187FF00248AFA00268CFA00238AFC00268EFF00288FFA00288FFE002D95
        F0002890FA002B95FA002D97FA002E9AFB002B98FF002D99FD00329DF700319D
        FB00309EFD0007B6ED0032A0FE0034A3FF0035A7FF0039B0FF0018C4EF000ED0
        FE0030D5EF002BE6FF00BA818100C1838100C6999C00E7B79800C69EA000CB9F
        A100D1A4A400D8A4A400DCB7B700DCB8B700DDB8B800E2B5B500E5BABA00E5CB
        BA00F2E9E100FFEDED00FFF2F200FFFFF800FFFFFF0000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00D7D70000000000000000000000000000000000000000000000D70118000000
        0000000000000000000000000000000000000183832E18000000000000000000
        000000000000000000000030887C221100000000000000000000003B40414242
        4247462480226164380000000000000000003B3C49555A5C5C675B4D2265CFC4
        633800000000000000003A3E4E555A5E686D4B4845C6D3CE6663120000000000
        00003A3F4E55676A6F5772715045C8D3CE6663120000000000003A414F676A6A
        6A4BD2D1535D0DC8D3CD66631200000000000040566A6A6D5073D6D1516D440B
        C9D3CC6663380000000000504A696D5860D6D6C7537054390CC9D3CCC4640F00
        00000000003C4C08818E8F3751584A50000ACAD4D06234A50000000000077F96
        959291852B090000000011CAC535BBC1890000001393A39E9E9C9B98952C0000
        0000000E36C0C38A787500027FAAAAAAA9A7A29E9B861A0000000000A4C28B7A
        7B750216A0AEB2B2AFAAAAAA9E971C000000000000847A907974022DB6B6B6B2
        B9B4B4A9AA9C29000000000000007578740013269A8DB1BCB6B4B4B4A9A22600
        00000000000000000000131B160587BCBCB8B6B4AAA01C000000000000000000
        0000132F311A8CBFBCBCB9B4B69900000000000000000000000031317C2F288C
        A6B8BCBCA82600000000000000000000000000137C802F16182632331C020000
        000000000000000000000000052F3126261C1816050000000000000000000000
        0000000000003113151331000000000000000000000000000000}
    end
    object NotSignatureReestrButton: TdxBarLargeButton
      Caption = #1047#1085#1103#1090#1080' '#1087#1110#1076#1087#1080#1089
      Category = 0
      Hint = #1047#1085#1103#1090#1080' '#1087#1110#1076#1087#1080#1089' '#1079' '#1088#1077#1108#1089#1090#1088#1091
      Visible = ivAlways
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        0800000000004002000000000000000000000001000000000000FF00FF006E2D
        13000134590002375C00013A6100033E6700043E6700033E68000A486E000046
        7A0000487D0015587E00B0350A00B8380F00B5321500C03B1300C73B1600B841
        1700CE411D00C9412400D7412200DC422400E1442800E1442C00E5472F00EB47
        2F00EF463100EE493100F3453000F2493400F64E3500F44F3800EA533500F455
        3D00F6583F00F25F3F00F45D4000CE744F00D3725800E66A4F00F7604300F864
        4100F9684600FA6C4700FC6C4500FA6E4B00FA6F4C00FA714D00FC724D00F665
        5300EB7E6700C4817000F8826E00F88C7A0000008200024B8000034F84000352
        890008588B000D5E91000E589D000A6288000A648B000A658E000B6C97000B6E
        9A001167990013689A0013699C00166B9D00186E9F001A6FA0001D74A4004864
        9300777D87000017EF000118EE000018F300021EF3000018F600001CFB00001D
        FE000724ED001134ED000624F0000927F0000A2BF3000D2EF3000C2EF6000626
        FA000425FF00082AFF000B2EFF000E30F3000A31FC000D32FF000D35FF001133
        F0001336F0001032F6001134F600193FF0001135FB00143BF800123BFF00133E
        FF000C54D4000F5BDA00145DD900105FDE000F60C5001665D900207BCF001D42
        ED001A41F7001540FF001844FF00244BEF002049F8002250FF002856F8002A59
        FF00305FFB000F65E7000E69E6001164E100186BE5001878E6001A71EA001C75
        EF001D7BF4001E7EF5005298BC00559ABD002181D4002489D400238ADE001F80
        F7002186E100268EEF002A95EE002D98EE002388F7002185F8002387FC002389
        FA00248AFA00278EFA00288FFB002F9DF4002991FA002B95FA002C96FA002B95
        FE002D97FC002D98FA002E99FC00319EF700309DFB00309CFD0033A0FC0034A0
        FE0035A4FF0093969600919DAB00CB818000F3AB9D00FBBBB200F4D3CE00FCD5
        D100FEDAD700FBE0DC00FCE0DD00E7E7E700EDEDED00FFFBFC00FEFEFE000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000003636000000000000363600000000000000000000000000365E54
        3600000000364F503600000000000000000000000036585E52360000364F504B
        360000000000000000000000000036585E5836364F504F360000000101010101
        01010101010000365D5E5950504F36000000010C14191D1F21281D1C1D010100
        36635B59503600000000010D151B222A2F2934311B18130136665E5B63360000
        0000010F18222F2F2A11AAA71118263672746363685836000000010F202F2F2F
        1135AFAC11323676776536366368633600000012222F2F2A11A9AFAC25367879
        71360000365373633600000E0E2F2A11A6ADAEA825367A753600000000366367
        36000000000E27A5A44AA333110E36360000000000003636000000000049403F
        3F3F3F3F00000000000000000000000000000000417C7C7D7D6D6A6B41000000
        0000000000000000000000046E8182828982817E6C4100000000000000000000
        000000047F90929292929082816F4100000000000000000000000A033C949696
        96969292828141000000000000000000000009037096A1A19B9B969692824100
        0000000000000000000009038A86038CA19BA196929241000000000000000000
        0000393904030388A1A19B9B969241000000000000000000000042433A380495
        A1A1A19B96410000000000000000000000000048844208878D95A1A18B410000
        0000000000000000000000438484470B08040704410000000000000000000000
        00000000004347433B3809000000000000000000000000000000}
      OnClick = NotSignatureReestrButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        0800000000004002000000000000000000000001000000000000FF00FF006E2D
        13000134590002375C00013A6100033E6700043E6700033E68000A486E000046
        7A0000487D0015587E00B0350A00B8380F00B5321500C03B1300C73B1600B841
        1700CE411D00C9412400D7412200DC422400E1442800E1442C00E5472F00EB47
        2F00EF463100EE493100F3453000F2493400F64E3500F44F3800EA533500F455
        3D00F6583F00F25F3F00F45D4000CE744F00D3725800E66A4F00F7604300F864
        4100F9684600FA6C4700FC6C4500FA6E4B00FA6F4C00FA714D00FC724D00F665
        5300EB7E6700C4817000F8826E00F88C7A0000008200024B8000034F84000352
        890008588B000D5E91000E589D000A6288000A648B000A658E000B6C97000B6E
        9A001167990013689A0013699C00166B9D00186E9F001A6FA0001D74A4004864
        9300777D87000017EF000118EE000018F300021EF3000018F600001CFB00001D
        FE000724ED001134ED000624F0000927F0000A2BF3000D2EF3000C2EF6000626
        FA000425FF00082AFF000B2EFF000E30F3000A31FC000D32FF000D35FF001133
        F0001336F0001032F6001134F600193FF0001135FB00143BF800123BFF00133E
        FF000C54D4000F5BDA00145DD900105FDE000F60C5001665D900207BCF001D42
        ED001A41F7001540FF001844FF00244BEF002049F8002250FF002856F8002A59
        FF00305FFB000F65E7000E69E6001164E100186BE5001878E6001A71EA001C75
        EF001D7BF4001E7EF5005298BC00559ABD002181D4002489D400238ADE001F80
        F7002186E100268EEF002A95EE002D98EE002388F7002185F8002387FC002389
        FA00248AFA00278EFA00288FFB002F9DF4002991FA002B95FA002C96FA002B95
        FE002D97FC002D98FA002E99FC00319EF700309DFB00309CFD0033A0FC0034A0
        FE0035A4FF0093969600919DAB00CB818000F3AB9D00FBBBB200F4D3CE00FCD5
        D100FEDAD700FBE0DC00FCE0DD00E7E7E700EDEDED00FFFBFC00FEFEFE000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000003636000000000000363600000000000000000000000000365E54
        3600000000364F503600000000000000000000000036585E52360000364F504B
        360000000000000000000000000036585E5836364F504F360000000101010101
        01010101010000365D5E5950504F36000000010C14191D1F21281D1C1D010100
        36635B59503600000000010D151B222A2F2934311B18130136665E5B63360000
        0000010F18222F2F2A11AAA71118263672746363685836000000010F202F2F2F
        1135AFAC11323676776536366368633600000012222F2F2A11A9AFAC25367879
        71360000365373633600000E0E2F2A11A6ADAEA825367A753600000000366367
        36000000000E27A5A44AA333110E36360000000000003636000000000049403F
        3F3F3F3F00000000000000000000000000000000417C7C7D7D6D6A6B41000000
        0000000000000000000000046E8182828982817E6C4100000000000000000000
        000000047F90929292929082816F4100000000000000000000000A033C949696
        96969292828141000000000000000000000009037096A1A19B9B969692824100
        0000000000000000000009038A86038CA19BA196929241000000000000000000
        0000393904030388A1A19B9B969241000000000000000000000042433A380495
        A1A1A19B96410000000000000000000000000048844208878D95A1A18B410000
        0000000000000000000000438484470B08040704410000000000000000000000
        00000000004347433B3809000000000000000000000000000000}
    end
    object InsInReestrButton: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080
      Visible = ivAlways
      ButtonStyle = bsDropDown
      CloseSubMenuOnClick = False
      DropDownMenu = ReestrInsPopupMenu
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF00035D050005950E0005930D0005920D00058C0D00058B0D000695
        0F0006920E000A9A15000C9C18000D9E1C00119F210017A62B0018A92F0021B8
        3C0025BC42002AC64D0030CF570030CE57003BD968003BDA690048EB7F005BF7
        9100000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020202020202020202030302020202020202020202020202
        0319070302020202020202020202020203190403020202020202020202020202
        0319060302020202020202020202020203190903020202020202020203030303
        03190C03030303030202020319171413110F0E0D0B0A05080302020319191919
        1919101919191919030202020303030303191203030303030202020202020202
        0319150302020202020202020202020203191603020202020202020202020202
        0319180302020202020202020202020203191903020202020202020202020202
        0203030202020202020202020202020202020202020202020202}
      PaintStyle = psCaptionGlyph
      OnClick = InsInReestrButtonClick
    end
    object UpdInReestrButton: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080
      Visible = ivAlways
      ButtonStyle = bsChecked
      DropDownMenu = ReestrUpdPopupMenu
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF0062555D00745D65006B5D62008C6D7300A4676900A0656700925C
        5E00764C4E007D525400633B3C0081535400865151008E575700865252008753
        5300B6757500B4767600B8797900B2757500B07474008A5B5B0097666600CA8B
        8B00CE8F8F00CF909000CC8E8E00EFAAA900E2A1A100E1A1A100E6A6A600302D
        2D007E444200875958008C5E5D00DD908C00E9A4A1009E5D5800D8C2C000DCC7
        C500955F5600A0675B00A56B5F005B3D37005E3F3900A7756B00583C35005C3F
        3800DAC1BA00C1836C00BC826800CFB5AA00F8F2EF00D7C1B500FBF4F000FAF3
        EF00D1926D00F7F2EF00DA9D7500E1CEC000FEF7F200FBF4EF00E7AB7900FAEF
        E600EBDCCE00FAEFE500D1914F00F8EADC00FAF0E600FEF7F000FCF6F000EEDD
        CA00DCC1A000F6E0C6009C8F8000F7E5CF00F8EADA00FCF6EF00DCB27A00DCB5
        8100C2A07400AD926F00917B5E0086725800BFA4800099846800C4AA8900F0D8
        BA00FFF4E500E9BD7F00E7BC7E00E2B87E00D1AB7400B5976C009A815D00A78C
        6600CFAF82007D6B51007A695000FEEFDA004B474100F0E5D500FCF3E600FCF7
        F000E9BF7D00EFC48100CEAA7300FCEACE00FFFEFC00FFFBF000FFFEFB00FFFE
        F700FFFFFC008F9F9D003745460006BBF0000C98BD00068FC1001E799F002D84
        A70022576C000393DE00036292000D4663000B3B5400165E820021252700008E
        DE000263BF003E4145001031D3000320BA000318B200000F95002F45ED000C19
        B400010B9900010A95002732D000000081000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020207070707070707070707070707020202076D594A5856
        62515D5C5B6B070202022B654B218074575352505C6B070202022B5A4D4C7D7C
        7E66545F5E6A070202022F6F45497A7F040B2E55616C080202022F72464E7303
        25140F2D63600902020234013E416705261B151130640D02020234016E484142
        241E1A1310310A0202023A01016E47433D231F1C160E0C0202023A0101016E69
        433717201912228302023C010101016E4F6835181D06787676023C0101010101
        7071322A27797581878D4001010101010101292C44777B85868A40383F393936
        3B3B282C33028288848B403A3A3A3A3A3A3A3A2C0202028C8902}
      PaintStyle = psCaptionGlyph
      OnClick = UpdInReestrButtonClick
    end
    object DelInReestrButton: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0005B70005B7FF00FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B7FF00FFFF00FF0005B7
        0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005
        B70005B7FF00FFFF00FFFF00FF0005B70005B60005B70005B7FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FF
        0006D70005BA0005B70005B7FF00FFFF00FFFF00FFFF00FF0005B70005B7FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B6FF
        00FF0005B60005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0005B60006C70006C70006CE0005B4FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006C100
        05C10006DAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0005B60006D70006CE0006DA0006E9FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006E50006DA0006D3FF
        00FFFF00FF0006E50006EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0006F80006DA0006EFFF00FFFF00FFFF00FFFF00FF0006F80006F6FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F8FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0006F60006F6FF00FFFF00FFFF00FFFF00FF0006F6
        0006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0006F6FF00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F6
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      PaintStyle = psCaptionGlyph
      OnClick = DelInReestrButtonClick
    end
    object IsNaklSignatureButton: TdxBarButton
      Caption = #1055#1110#1076#1087#1080#1089#1072#1090#1080
      Category = 0
      Hint = #1055#1110#1076#1087#1080#1089#1072#1090#1080
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B000000010000000000008480AA00A19A
        B200BAB7BC00FF00FF00C7BCC600BBB7B70003650000015D0000035A05000467
        0600036E070010891A00118B1C0000510A00128E1F0013902100035E10001381
        210019982B001FAC340021AF370023B13C0023A63E0028B845002ABC49002DC0
        4D000056140028AD460031C5550033C95900035E1C0036CE600038D065003AD1
        68003CD36A003DD56C000075880000B1FF000074A6000079E1002075DC000047
        BB00005CFF00003ED0000037B6000036CE00002DC100516FDD000023BD000027
        FF000D2FF6000022FF000023FF000018F0000018EF000017EE000017EA000014
        FA000013D9000011D8000012D8000012D7000012D5000011D3000010CE00000E
        C600000FE600000DC500000DC100000CC000000BBF00000CBF00000CBD00000A
        B6000009B100020BB5000611B400222CC0007378C0000007A9000006A6000006
        A4000004A3000005A30000049E000107A5000D13A6000004AF0000039E000003
        9C000003990000029600000192000001910000028F000103960001018A000507
        910005058800070789000707880008098C0008088B0008098B001B1B8E00B7B7
        D500000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000030303030303
        6464645D03030303030303030366646405004C3B5D030303030303646401024E
        4D575844415E030303036404692F32394240495A4A485D0303030368282A292D
        33373F4654524B6703032C27252626080833373E475359556503033024260812
        0F0834353D45515B5F63030330081619150E0834363C45505C600303081B211D
        18140C0834353A434F6203081B2323201C17130B083138616503080808081123
        1F080808080865030303030303031E2322082E2B56030303030303030303081B
        2308030303030303030303030303031023230803030303030303030303030303
        0908230803030303030303030303030303030A06071A0D030303}
      PaintStyle = psCaptionGlyph
      OnClick = IsNaklSignatureButtonClick
    end
    object NotNaklSignatureButton: TdxBarButton
      Caption = #1047#1085#1103#1090#1080' '#1087#1110#1076#1087#1080#1089
      Category = 0
      Hint = #1047#1085#1103#1090#1080' '#1087#1110#1076#1087#1080#1089
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B000000010000000000008480AA00A19A
        B200BAB7BC00FF00FF00C7BCC600BBB7B7000365000005780300015D00000C95
        0B0028A62600035A05000467060013921400036E07000B7911000D8111001093
        180016A623001156180000510A00279D3500035E100013812100259D350029BF
        42002DA7410024C0420029C5490025AF42003DD75C000056140031CC57002DBC
        520030C556002FC1530032C75700035E1C002EBA540038D3620038D16300016F
        22003FDD6F003CD56B003DD56A003DD56C0041DC720041DC730044E1780048EA
        800001542200017434003E676700004B5000065668000090BA00008CE000004B
        8900004ADA000040C00000359D00004AE9000033AB000034D800516FDD000035
        FF00002DF2000D2FF600001EFF00001FFF000022FF000020FE000021FE00001C
        FF000018EF000017EB000016EA000016E9000016E3000014FA000011D8000013
        D8000011D4000011D3000011D0000010CF000010CE00000EC600000FE600000D
        C500000DC100000CBD00000CBC00000ABA00000BB800000AB6000009B1000611
        B400222CC0007378C0000008AF000007AD000006A9000007A9000006A6000005
        A5000005A1000005A00000049F0000049C000106A600030799000004AF000003
        9E0000039C00000399000001910000028F0000018C0003048E00070788000808
        8B00B7B7D5000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000030303030303
        7878787403030303030303030379787805006150740303030303037878010263
        6270715A57750303030378047A40434F58565F73605B74030303133436393B42
        444D555E726764750303141F08060E323E494D545D6B6D677403033A37330709
        0C3C454B535B6A69657603033A38291112163F474C525C686C760303033A3A10
        1B0D3541484A51596E77030303033A0F1C19253D41464E666F03030B0B0B0B0B
        2027170B0B0B0B03030303030B1D2422282B2C1E0A0B030303030303030B232A
        2D2E301A0B0303030303030303030B21312F150B03030303030303030303030B
        26180B030303030303030303030303030B0B0303030303030303}
      PaintStyle = psCaptionGlyph
      OnClick = NotNaklSignatureButtonClick
    end
    object NumOrderButton: TdxBarButton
      Caption = #1054#1085#1086#1074#1080#1090#1080' '#1085#1091#1084#1077#1088#1072#1094#1110#1102
      Category = 0
      Hint = #1054#1085#1086#1074#1080#1090#1080' '#1085#1091#1084#1077#1088#1072#1094#1110#1102
      Visible = ivNever
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF00A467690096655E0092635D009E6B620099685F00A9756600811E
        0000581400009F6F6000B67F6A00C1896F00BC846C0088604C00CF8E6800D498
        7500ACA69F00F6E3C900FAEBD700ABA39900FBF0E200ACA9A500EEC78F00EDC6
        8F00EEC99300EECB9800F0CF9E00F3D8B000F2D8B100F3DAB500F4DEBD00F6E1
        C200F7E2C400F6E2C400F7E3C600F6E2C500F7E5CA00F7E5CB00F7E6CE00F7E7
        CF00F8EBD800FAEEDD00FCF3E600ABA59C00FCF4E900ACA7A000EDC68B00EDCA
        9200EECB9600EFCE9A00EFCF9D00EFD09F00EFD0A100F0D3A400F0D3A600F2D5
        A900F2D7AB00F0D5AA00F3D9B000F2D8AF00F2D8B000F4DCB600F3DCB600F4DD
        BA00F4DEBC00F6E1C000F6E2C200F7E5C900F7E6CA00F7E6CB00F8E9D100FBF0
        DE00FAEFDD00FAEFDE00FAF2E500FBF4E900F3DCB500F3DEBB00F4E0BD00F4E1
        C000F7E9D100F8EBD400F8EBD500FAEED900F8EDD900FBF2E200FCF7EE00F8ED
        D800F8EEDA00FAF2E300FBF4E700FCF7ED00ACA9A300FCF8F000004B0000315E
        FF001B47FF00052BFF000018F300000CC4000000820000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020205030303
        030303030303030303020202044F1F3D39373533323119300B02020207516040
        1D090909090909180B020202064521423F1E3A3836341B1A0B02026666666666
        66666666666666666666026608546646226666666666661C0B66026666666666
        6666666666666666666602020C572B2A52472443414E3E3B0B0202020E4D604B
        590909090909093C0B0202020D582E4C495553281344503F0B0202020F175E12
        2D155A53292623200B02666666666666660A0909090909250B02666162636465
        662F2C164A1448270B02666666666666665F5D5C5B4A56480B02020211101010
        1010101010101010100202020202020202020202020202020202}
      PaintStyle = psCaptionGlyph
      OnClick = NumOrderButtonClick
    end
    object SignatureReestrHistButton: TdxBarLargeButton
      Caption = #1030#1089#1090#1086#1088#1110#1103' '
      Category = 0
      Hint = #1030#1089#1090#1086#1088#1110#1103' '#1087#1110#1076#1087#1080#1089#1072#1085#1085#1103' '#1088#1077#1108#1089#1090#1088#1091
      Visible = ivAlways
      OnClick = SignatureReestrHistButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF00D1CFD300FF00FF00ADA7A900C4C1C200ADA5A700BAB6B7009C9395009A91
        93009A909100AFA4A400988F8F00ABA1A100AFA7A700ABA3A300AAA3A300FEFB
        FB00FFFEFE009A908F0090817F0095827F0093827F00D1C4C200DED1CF00F6EB
        E90096848000A7280600A9290700A7290700AD2E0A00AA2E0A00AA2E0B009886
        8100C4AFA900C1AFAA00AD300B00AD310B00AB310C00AA300C00AF340D00AB32
        0D00AF350E00AD330E00AF360F00AD350F00AF361100AF371100AF381200B43A
        1300AF3C1600B79E9600D1C1BC00B53F1400B7411600B6411600B13C1500B540
        1600B6411700C99E8E00BC9A8E00C2A19500C2AAA1009A88820097868000DDCE
        C900E7D9D400EEE5E200BB4A1C00BA491C00C15D3500C25F3800B0573500C667
        3F00B05A3800C7684000B05B3900B05D3D00B05E3E00B1604100B1674900C278
        5900D7A79300D8AA9700D7A99600CCA18F00C69D8C00C9A08F00D7AB9A00C09A
        8A00DAB1A000DEB5A400C6A19300E0BAAA00BDB0AB00F6EAE500F3E7E200E7DD
        D900BC4C1C00BC4D1E00BD4E1F00C1542100C0532200C1552300C4633A00C465
        3C00C96D4300CB704800CE775200C6775400CF7F5B00D3846000D3866400CE88
        6800D78F6E00CC886A00D4907200C7896E00D79A7F00D1A49000D8AA9600D3A7
        9300D7AA9700D8AB9800D8AD9A00C7A08E00D9AF9C00DAB19E00D9B09D00BD9C
        8E00E0BBAA00B69C9100F3E2DA00EBE2DE00F8EFEB00C2572300C2592500C45B
        2600C75F2900C45B2800C45C2800CB6C3E00CF794F00E0A48600EED7CB00EFDD
        D400F0E0D800C9632800C7632C00C9662E00CB682F00D88C6000F3E5DD00F0E2
        DA00F4E9E300F0E7E200CF6F3200CC6A3100CF6F3500CE6E3500D1753C00CF73
        3D00F6EAE300D3763800CF753700D3773B00D17A4200E2A98400E9B69300E9BB
        9C00F3D4C000F0E2D900D47D3C00D8824000D8824100D7804100D9894E00E09E
        6D00F0D3BD00F0D4C000F4DAC600D9864100D9874400DA894A00DA8F5200E9B7
        8F00DE904C00E2975200E2964C00F3CFAB00FEFAF600E5A45F00EABA8700F0CC
        A500F0D1AF00F0D1B100F4D9BB00EAAF6C00EBB47000F6DDC000F4D7B100F6DE
        C000F8E2C600FAE7CB00FFFEFB00FEFFFF00F6FEFF00FAFEFF00F0F6FA00E2E7
        EB00EEF4FA00EFF4FA00E7EAEE00D1D3D700E9EAEF00E2E2E500D9D9DA000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000030303030303
        03030303793D817703030303030303030303030303030303030303585E100C3F
        3B030303030303030303030303030303030358170507060C217D030303030303
        0303030303030303037C18D8023E33040A405703030303030303030303030303
        8061D6D7513030500609215603030303030303030303037E43D0D36D1B1D1C1C
        4E0E0916560303030303030303037B9BCFCE71386C6F6F6C314C040916560303
        03030303037B60CDCD7427277001016E26244F06081A5603030303037C190101
        7226291F69010146202D254A0B081659030303535F01018F35312F1F49010147
        202D2D24480D0914590352AB0101A96763453A284B010147202D2D2D1E4D0613
        1555820101BEA68A8C6764356B010147202D2D2D2B2E8304133C5D0101BEB09C
        9D948B628E010168202D2D2D263222070F5C52840101C3AEA39E96879701016A
        2A2C2D292675D50523520353A20101C2B6ACA4A0A8B3B28D36392C2973D1D834
        5403030353980101C4BAADAFA59F958866443776D2D44154030303030354AB01
        01C7BBB5B8B4AAA189658FCED0427A0303030303030354990101CABCC00101B1
        93A7CDCF857C03030303030303030353920101C9C5C8BDB7B901CD607E030303
        030303030303030352910101CBC6BFC101019A7C030303030303030303030303
        0352910101CCBE0101867E030303030303030303030303030303529201010101
        865A0303030303030303030303030303030303529011129A7F03030303030303
        030303030303030303030303785B5D7803030303030303030303}
    end
    object SignatureNaklHistButton: TdxBarButton
      Caption = #1030#1089#1090#1086#1088#1110#1103
      Category = 0
      Hint = #1030#1089#1090#1086#1088#1110#1103' '#1087#1110#1076#1087#1080#1089#1072#1085#1085#1103' '#1085#1072#1082#1083#1072#1076#1085#1086#1111
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B0000000100000000000000000000FFFF
        FF009F9EA1009E9CA000A19EA300FF00FF00A39FA300A39EA100A0989C00A09A
        9D009E8A87009E8B8700E1D1CE0099888400AA260300A7250300A72A0600AD2C
        0700AD2D0800AC2D0800AA2D0900AC310D00CEBFBB00AB2E0900AC320D00AD33
        0E00B0350F00B0370F00AF360F00AD340F00AD350F00AF371000AD3610009F8C
        8600CFBCB600F2E2DD00B43B1000B6411700B8421A00B5411A00B05E4000C297
        8700C99E8E00B4968B00C1A39800B1958B00A08E8800E0CFC900BB471800B845
        1900BB4A1C00B1624300B1654800CE876A00D58F7200CA886D00B47F6A00B483
        7000C2917E00D7A79300D8AA9700D5AA9800E0BAAA00F2E1DA00E9DCD700EADE
        D900C0542200C67D5D00DD9E8100DD9F8200D79A7F00D7A69100D5A79300D8AA
        9600C79E8B00D7AA9700C69D8B00C79E8C00D8AD9900BDA39800F0D4C700F0D5
        C900F2D8CC00EED9D000EFDDD500F2E1D900F4E5DE00F3E6E000C0542100C65D
        2700C65D2800E1A68800D8AF9A00F2DACE00EED9CF00EEDAD000D0794800E1A4
        8200F3DCCF00F6E3D800F4E1D700F6E5DC00EEDDD400F0E2DA00EFE1D900C964
        2800CC692F00D37B4600E7BA9F00CE6F3100D3763600D8895500F2D4BF00F7E0
        D000D57D3B00D57E3E00F3D9C500DC8A4500F6DECB00E0924A00EBBC9300EAB0
        7900EFCBA700FAEADA00F3D4B200F6D7B600F6E0C600F0C58F00F6DCBB00FAEA
        D300FEFFFF00F0FEFF00F2FEFF00DAE1E500B7BBC000DADDE100B8BBC0000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000050505050505
        3D4F2B2A05050505050505050505053C168603213C0505050505050505055C0C
        873A39092E4D050505050505053C4184430F0E34060A3C05050505053C688235
        2745442628040B4C0505053C23013610206564201333070A3C05493F015B241A
        1C525019151228080D4A3E01745942322562511D181E1138022D3E01766E6A5A
        42635D1F18181729882C4955017A726D6B706C311B1437852248053C54017C75
        736F60583046832F3C0505053B66017D777B71696182404B05050505053C5F01
        807F797801673C05050505050505475301817E01564E0505050505050505053C
        5E0101573C0505050505050505050505493E3E49050505050505}
      PaintStyle = psCaptionGlyph
      OnClick = SignatureNaklHistButtonClick
    end
    object AddSeriesBarButton: TdxBarButton
      Caption = #1085#1086#1074#1080#1081' '#1088#1103#1076#1086#1082
      Category = 0
      Hint = #1085#1086#1074#1080#1081' '#1088#1103#1076#1086#1082
      Visible = ivAlways
      OnClick = AddSeriesBarButtonClick
    end
    object AddDocumentBarButton: TdxBarButton
      Caption = #1085#1086#1074#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' "'#1055#1086#1076#1072#1090#1082#1086#1074#1072' '#1085#1072#1082#1083#1072#1076#1085#1072'"'
      Category = 0
      Hint = #1085#1086#1074#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' "'#1055#1086#1076#1072#1090#1082#1086#1074#1072' '#1085#1072#1082#1083#1072#1076#1085#1072'"'
      Visible = ivAlways
      OnClick = AddDocumentBarButtonClick
    end
    object dxBarButton1: TdxBarButton
      Caption = #1088#1103#1076#1086#1082
      Category = 0
      Hint = #1088#1103#1076#1086#1082
      Visible = ivAlways
      OnClick = dxBarButton1Click
    end
    object dxBarButton2: TdxBarButton
      Caption = #1076#1086#1082#1091#1084#1077#1085#1090' "'#1055#1086#1076#1072#1090#1082#1086#1074#1072' '#1085#1072#1082#1083#1072#1076#1085#1072'"'
      Category = 0
      Hint = #1076#1086#1082#1091#1084#1077#1085#1090' "'#1055#1086#1076#1072#1090#1082#1086#1074#1072' '#1085#1072#1082#1083#1072#1076#1085#1072'"'
      Visible = ivAlways
      OnClick = dxBarButton2Click
    end
    object ExportButton: TdxBarLargeButton
      Caption = #1045#1082#1089#1087#1086#1088#1090' '#1088#1077#1108#1089#1090#1088#1091
      Category = 0
      Hint = #1045#1082#1089#1087#1086#1088#1090' '#1088#1077#1108#1089#1090#1088#1091
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = ExportBarPopupMenu
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B00000001000000000000FF00FF000151
        0000004900000157030001500300035B0400035A050005600700015205000257
        0500035E0600025D0800025407000791110007900F00099212000D7715001380
        1A00015509000B9617000D981800119E1F0001540A000E9A1D00014E0C0011A0
        230015A4270016A52B0019A72D00188F2700046013001CAB34001EAD37001FAF
        380021B13A0022B23D0023B5400026B6430028B8460028BA48002ABC4A002ABC
        4C002BBD4D002DC050002DBF4F002EC0520030C2550030C1540031C4560031C4
        570033C55900004B140000531D0001512100005328000A84520009745700004D
        3A000272570000483A0001574D0009786C000F7E7B000DA7A90070FFFF0054FC
        FF0028D5E10052E6F20001626D003FEEFF0045EDFF0048DCEE002CE3FF0041CB
        E000004F5C001EDDFF0028E1FF0031E2FF003DDEFA0013D7FF0023DAFF0031DC
        FC0000CCFF0000D0FF0000465700015E7500015C700004677D000CD0FF0012D0
        FF0016D5FF001ACCF7001BD5FF001ECAF20029C6EB0029C2E60000C7FF0000CA
        FF000168860002CAFF0003C6FF0004CAFF0004C1F8000468840009CCFF000ACA
        FF000DC7FA0016CBFC0028AACE0000C4FF0000B8F40001BDF800015973000258
        730009C0F8000F9FCC001CA3CB002998BC0000B7F70000B6F30000ABE70000A5
        E20001A7E2000C90BD00138BB7001E8BB40000ADEF0000A0DD000097D300007E
        B2000181B600015A7D000378A7000D97CE000F81AD001984AF00008ECA00048E
        C900087FB5000C7EB1000C7BAC00127AA7000080BD000079B6000078B4000077
        B2000183C5000179B5000279B4000373AB000679B000066DA1000774A900076A
        9D000870A4000974A7000B6C9D000C70A0000D6A9A000077BA000073B000006D
        A900006CA700006BA500006CA500006AA4000068A10000669F0000649E000062
        9A00016BA600016AA3000269A1000379BA000376B600035E9200046298000569
        9F0005649A0006689C0008699D000A6A9F000A6798000A659700006BAD000069
        AA0000639D0000609A00005C9600005A9300005C9200005A900000558900015E
        9500015C9200015A900002609700036FB2000369A700035B900003568B00045A
        900007609500075E9100005A96000057900000538C0000518A00005088000051
        88000162A400014F8600014E8400056EB400005DA400005A9C0000539100004D
        8600004B8200004A810001579600014C8400035D9F0000488000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000606060603000000000000000000000000000000
        000000000006060E0E060200D8D1D1D1D1D1D000000000000000000000000006
        0E0E1D0662AE93A7A1A7A9D1000000000000000000000000060E0E1134C6AAA7
        A6A8A9A8BD000000000000000000000033100F0D093F686F77787F8ECD000000
        00000000DFDFDFDF4405141311374B5865615260A0D9BCBA000000DF8C85C592
        82081915171E425059727E8FA8BBA3CECF00D386B2677183700C1C1B1A0A383E
        3D57CCA9A0A9A39279A4DBC8DC060416120622201F06070106549FA5A9916E60
        53A1DA7C8B7B062B2A282625242321064AC5ABBC89646D609E00D39DC7D7C006
        302F2D2C29270639D596AF734F6965779E00DFB3977BAD84063232312E063BDE
        9BB0744C5C5A6A9E0000D47C9B98C2D255183232063AD7B5CA87454D485D9E00
        0000D4C9D4C3CDBFD6560B0636B8CC8DB74741465F9E00000000DF99B28AC1AC
        A3B93C3581D8DFDD7D40439EB40000000000DFB2B296959490A0A2BEA1DF0000
        9E9E9E00000000000000CB6C5E5D5B6A666F767E80DF00000000000000000000
        0000B64041454D4B5968636153DF000000000000000000000000B67549474E51
        506B727A88DF0000000000000000000000000000B7CA9C9D9AB1C4CE00000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object VidNaklExportBarButton: TdxBarButton
      Caption = #1074#1080#1076#1072#1085#1110' '#1085#1072#1082#1083#1072#1076#1085#1110' '#1088#1077#1108#1089#1090#1088#1091
      Category = 0
      Hint = #1074#1080#1076#1072#1085#1110' '#1085#1072#1082#1083#1072#1076#1085#1110' '#1088#1077#1108#1089#1090#1088#1091
      Visible = ivAlways
      OnClick = VidNaklExportBarButtonClick
    end
    object OtrNaklExportBarButton: TdxBarButton
      Caption = #1086#1090#1088#1080#1084#1072#1085#1110' '#1085#1072#1082#1083#1072#1076#1085#1110' '#1088#1077#1108#1089#1090#1088#1091
      Category = 0
      Hint = #1086#1090#1088#1080#1084#1072#1085#1110' '#1085#1072#1082#1083#1072#1076#1085#1110' '#1088#1077#1108#1089#1090#1088#1091
      Visible = ivAlways
      OnClick = OtrNaklExportBarButtonClick
    end
    object OldPrintBarButton: TdxBarButton
      Caption = #1087#1086#1076'. '#1085#1072#1082#1083#1072#1076#1085#1072' '#1073#1077#1079' '#1079#1084#1110#1085
      Category = 0
      Hint = #1087#1086#1076'. '#1085#1072#1082#1083#1072#1076#1085#1072' '#1073#1077#1079' '#1079#1084#1110#1085
      Visible = ivNever
      OnClick = OldPrintBarButtonClick
    end
    object NewPrint1BarButton: TdxBarButton
      Caption = #1087#1086#1076'.'#1085#1072#1082#1083#1072#1076#1085#1072' '#1087#1077#1088#1096#1080#1081' '#1077#1082#1079#1077#1084#1087#1083#1103#1088
      Category = 0
      Hint = #1087#1086#1076'.'#1085#1072#1082#1083#1072#1076#1085#1072' '#1087#1077#1088#1096#1080#1081' '#1077#1082#1079#1077#1084#1087#1083#1103#1088
      Visible = ivAlways
      OnClick = NewPrint1BarButtonClick
    end
    object NewPrint2Button: TdxBarButton
      Caption = #1087#1086#1076'.'#1085#1072#1082#1083#1072#1076#1085#1072' '#1076#1088#1091#1075#1080#1081' '#1077#1082#1079#1077#1084#1087#1083#1103#1088
      Category = 0
      Hint = #1087#1086#1076'.'#1085#1072#1082#1083#1072#1076#1085#1072' '#1076#1088#1091#1075#1080#1081' '#1077#1082#1079#1077#1084#1087#1083#1103#1088
      Visible = ivAlways
      OnClick = NewPrint2ButtonClick
    end
    object dxBarButton3: TdxBarButton
      Caption = #1085#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103' '#1087#1072#1088#1072#1084#1077#1090#1088#1110#1074' '#1076#1088#1091#1082#1091
      Category = 0
      Hint = #1085#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103' '#1087#1072#1088#1072#1084#1077#1090#1088#1110#1074' '#1076#1088#1091#1082#1091
      Visible = ivAlways
      OnClick = dxBarButton3Click
    end
    object ImportBarLargeButton: TdxBarLargeButton
      Caption = #1030#1084#1087#1086#1088#1090' '#1076#1072#1085#1080#1093
      Category = 0
      Hint = #1030#1084#1087#1086#1088#1090' '#1076#1072#1085#1080#1093
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = ImportBarPopupMenu
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B00000001000000000000FF00FF000663
        0000037201000155000000510000004B0000015C010002570100015403000153
        0200015102000263050002570300036A05000C720E0015841600025A0500035A
        0600058B0C0005800900056409000663090007670C000257070005910D000792
        0F00088E11000A931400086E0F000A6F1100004C0600015309000D971A000F8C
        1B000E801900108A1A00189022001F982900004E090001580A001B92280012A0
        24001FA1300018A52D001DB1350025A73900025E120024BC410028AB4100004E
        1100035F16002BC64E0028B247002CBC4D000054150000501600035F1D0038D7
        65003DD56A0041DD7000005F200047E77E0001572100036B2D00004D29000560
        3A00005835001EA57A00096C5000006E5200005D470022B69900004D4100096A
        5B00006B690065FFFF0070FFFF0052FAFF0054FCFF00004F530052E6F2003FEE
        FF0045EDFF0048DCEE0053D9E90001515C002CE3FF0041CBE0000A7D90001EDD
        FF0023DDFF0028E1FF0031E2FF003DDEFA0013D7FF0015D8FF000E74890023DA
        FF0031DCFC0033D1EF0000CCFF0000D0FF000ACFFF000FCFFF0012D0FF0016D5
        FF0019D3FF001ACCF7001BD5FF001ECAF20029C6EB0029C2E60000CBFF0000C7
        FF0002CAFF0003C6FF0004CAFF0004C7FF0004C1F800035E760009CCFF000ACA
        FF000DC7FA0016CBFC0028AACE0000C5FF0000B8F40001C1FE0001BDF80009C0
        F8000AB7F0000F9FCC0015B1E2001CA3CB002998BC0000B7F70000B6F30000AC
        EB0000A5E20001A7E20003B2EE0003516D001191C1001B96BF0000ADEF0000A0
        DE0000A0DD000097D300008FCA00025170000786BB000A8ABB000C89BB001395
        CA00048EC9000D7FB1001376A300167BA7000080BD00007DB8000079B6000078
        B4000078B2000077B2000075AF000074AB00006599000183C5000170AA000279
        B4000376AD000373AB0003577F000576AC000679B0000870A4000A7AB0000972
        A4000B6C9D000A6896000C70A0000D6A9A000082CA000077BA000073B000006F
        AB00006DA900006CA700006CA500006BA5000069A4000068A3000066A1000066
        9F0000649E0000649D0000629A00016AA30002689E00035E920005699F000566
        9C0005649A00066CA30008699D000A6798000A6597000C75B0000064A3000063
        9E0000639D0000609C0000609A00005D9700005C9600005A9300005C92000059
        9100015C95000260980002609700036FB4000364A000046096000567A100045B
        9000066AA50007609500075E9100005A96000057900000558F0000538C000051
        8A00005088000050870001558C00014F8600014E840000508E00004F8A00004D
        8600004B8200004A8100015A9D00004B86000048800000467E00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000800000000000000000000000000000000
        000000000000080B07000000D1C1D2C3D3E7EA000000000000000000000A0D18
        0D31E097AAC6A2A5A4C3C4EA00000000000000000A0B1A19120641B0C6DABFC1
        BED6C4C2D70000000000000A142B291B1912064484828C899194929EE6000000
        0000090C2A2F2B2920130211476A67757D706471B8F1D6D2000008101C222F2C
        211F270403435A5F667F90A0C2D4BDE8E900ED994911353323409577608F8E98
        ADD5E5C4B8C4BDA78ABCF3ACAC1734392442D0F0F0F70000EAC0B7BEC4A37E71
        65BAF2999938283D2D3CB69F9FEB0000D9A8C5D69A737D71B500EDCFCF4F153A
        3A1648D7B9D200EC96DBC7835E797488B500F6DFDEDE3F283D30054AF4F5EFC9
        CB9B855B6C697AB50000EE8FE2E2581E253B351D3F455558B363515C566DB500
        0000EEE1F1F4F477360E2A2D0F010303264D4E526FB500000000F6B1C998DDDD
        A646372E32383E8D544B50B5CC0000000000F6CACAAEABA9A1B8BBD8BAF60000
        9D9CB500000000000000E47C6E6D6B7A7680879093F600000000000000000000
        0000CD4C4E515C596878727065F6000000000000000000000000CD8657535D62
        617B818B94F60000000000000000000000000000CEE3B2B4AFC8DCE800000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B00000001000000000000FF00FF000663
        0000037201000155000000510000004B0000015C010002570100015403000153
        0200015102000263050002570300036A05000C720E0015841600025A0500035A
        0600058B0C0005800900056409000663090007670C000257070005910D000792
        0F00088E11000A931400086E0F000A6F1100004C0600015309000D971A000F8C
        1B000E801900108A1A00189022001F982900004E090001580A001B92280012A0
        24001FA1300018A52D001DB1350025A73900025E120024BC410028AB4100004E
        1100035F16002BC64E0028B247002CBC4D000054150000501600035F1D0038D7
        65003DD56A0041DD7000005F200047E77E0001572100036B2D00004D29000560
        3A00005835001EA57A00096C5000006E5200005D470022B69900004D4100096A
        5B00006B690065FFFF0070FFFF0052FAFF0054FCFF00004F530052E6F2003FEE
        FF0045EDFF0048DCEE0053D9E90001515C002CE3FF0041CBE0000A7D90001EDD
        FF0023DDFF0028E1FF0031E2FF003DDEFA0013D7FF0015D8FF000E74890023DA
        FF0031DCFC0033D1EF0000CCFF0000D0FF000ACFFF000FCFFF0012D0FF0016D5
        FF0019D3FF001ACCF7001BD5FF001ECAF20029C6EB0029C2E60000CBFF0000C7
        FF0002CAFF0003C6FF0004CAFF0004C7FF0004C1F800035E760009CCFF000ACA
        FF000DC7FA0016CBFC0028AACE0000C5FF0000B8F40001C1FE0001BDF80009C0
        F8000AB7F0000F9FCC0015B1E2001CA3CB002998BC0000B7F70000B6F30000AC
        EB0000A5E20001A7E20003B2EE0003516D001191C1001B96BF0000ADEF0000A0
        DE0000A0DD000097D300008FCA00025170000786BB000A8ABB000C89BB001395
        CA00048EC9000D7FB1001376A300167BA7000080BD00007DB8000079B6000078
        B4000078B2000077B2000075AF000074AB00006599000183C5000170AA000279
        B4000376AD000373AB0003577F000576AC000679B0000870A4000A7AB0000972
        A4000B6C9D000A6896000C70A0000D6A9A000082CA000077BA000073B000006F
        AB00006DA900006CA700006CA500006BA5000069A4000068A3000066A1000066
        9F0000649E0000649D0000629A00016AA30002689E00035E920005699F000566
        9C0005649A00066CA30008699D000A6798000A6597000C75B0000064A3000063
        9E0000639D0000609C0000609A00005D9700005C9600005A9300005C92000059
        9100015C95000260980002609700036FB4000364A000046096000567A100045B
        9000066AA50007609500075E9100005A96000057900000558F0000538C000051
        8A00005088000050870001558C00014F8600014E840000508E00004F8A00004D
        8600004B8200004A8100015A9D00004B86000048800000467E00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000800000000000000000000000000000000
        000000000000080B07000000D1C1D2C3D3E7EA000000000000000000000A0D18
        0D31E097AAC6A2A5A4C3C4EA00000000000000000A0B1A19120641B0C6DABFC1
        BED6C4C2D70000000000000A142B291B1912064484828C899194929EE6000000
        0000090C2A2F2B2920130211476A67757D706471B8F1D6D2000008101C222F2C
        211F270403435A5F667F90A0C2D4BDE8E900ED994911353323409577608F8E98
        ADD5E5C4B8C4BDA78ABCF3ACAC1734392442D0F0F0F70000EAC0B7BEC4A37E71
        65BAF2999938283D2D3CB69F9FEB0000D9A8C5D69A737D71B500EDCFCF4F153A
        3A1648D7B9D200EC96DBC7835E797488B500F6DFDEDE3F283D30054AF4F5EFC9
        CB9B855B6C697AB50000EE8FE2E2581E253B351D3F455558B363515C566DB500
        0000EEE1F1F4F477360E2A2D0F010303264D4E526FB500000000F6B1C998DDDD
        A646372E32383E8D544B50B5CC0000000000F6CACAAEABA9A1B8BBD8BAF60000
        9D9CB500000000000000E47C6E6D6B7A7680879093F600000000000000000000
        0000CD4C4E515C596878727065F6000000000000000000000000CD8657535D62
        617B818B94F60000000000000000000000000000CEE3B2B4AFC8DCE800000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object DBFBarButton: TdxBarButton
      Caption = #1079' DBF-'#1092#1072#1081#1083#1091
      Category = 0
      Hint = #1079' DBF-'#1092#1072#1081#1083#1091
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = DBFBarPopupMenu
    end
    object XMLBarButton: TdxBarButton
      Caption = #1079#1074#1110#1090' XML'
      Category = 0
      Hint = #1079#1074#1110#1090' XML'
      Visible = ivAlways
      OnClick = XMLBarButtonClick
    end
    object ImportSystemLargeButton: TdxBarLargeButton
      Caption = #1030#1084#1087#1086#1088#1090' '#1076#1072#1085#1080#1093' '#1079' '#1110#1085#1096#1080#1093' '#1089#1080#1089#1090#1077#1084
      Category = 0
      Hint = #1030#1084#1087#1086#1088#1090' '#1076#1072#1085#1080#1093' '#1079' '#1110#1085#1096#1080#1093' '#1089#1080#1089#1090#1077#1084
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = ImportSystemBarPopupMenu
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF00FFFEFE008E5D590080504B009365600093655E0092635D009566
        600093655F00986963009E6E6400A3726600FBF7F600A7756800AC796900B17E
        6B00BB846E00B6816C00CB917300C58C7000C0896F00FCF8F600FAF6F400FEFC
        FB00CF8E6800D4987500CF967400F6EEE900F8F3F000FFFCFA00FBF7F400E1A5
        6D00E3AD7D00F2E2D300F4EAE100DEA16500E0A36900E0A46900E0A66D00E1A9
        7200E1AA7500E1AA7600E2AC7900E2AD7A00E3AF7D00E3B07F00E3B18000E3B1
        8100EED7C000EFDAC500F0DECC00F2E6DA00FBF2E900EFD3B400EED4B800FBF3
        EA00E2A55A00E2A65D00E2A65E00E3A96200E3AA6500E3AC6800E3AC6900E5AD
        6B00E5AD6C00E5AF6C00E6B06E00E6B06F00E6B07000E6B17000E6B17400E6B2
        7400E7B57700E7B57800E6B47700E7B57900E9B77B00E7B67B00EABA8000E7B7
        7F00E9BB8300EABC8400EBBF8900EABF8B00EAC18E00EBC29000EAC08F00F2D4
        AF00F2D4B100F2D5B100F6E0C600F6E2CB00F8E6D000F7E7D400FEF7EF00E2A5
        5800E1A55800E1A55A00FBC07300FCC27600FEC67B00E7B47400E6B47400E9BD
        8100EBBF8800E9BF8700EBC18900EDC58F00EFC79100EBC59200EDC79600EDC9
        9900EECB9C00EECB9D00F0CFA300F2D1A500EFCEA300EFCFA400F0D0A600F3D4
        AB00F0D1A900F2D3AC00F0D1AA00F3D5AD00F3D7B100F6DAB600F3D8B600F4DA
        B700F4DAB800F3DAB800F2D8B700F2D9B800F6DEC000F3DCBD00F4DEC000F7E2
        C700F6E2C700F8E6CF00F7E6D000FAEBD800FAEEDE00FBEFE000FAEFE000EDC1
        8000EABF7F00EBC08000E9BD7F00E7BB7E00E7BC7E00EBC18200E7BC8000EABF
        8200E9BF8200EEC58900EBC28800AD906700AC906700EFCB9700EEC99600F0CE
        9E00AF987800B29F8300F6E0C100F4DEBF00F7E3C700FFEFD800F8EBD800FCF6
        ED00FCF7F000FEFAF400AD936B00FBF4E900B4A68A00B4A68B00FBF4E700B2A5
        8A00B7B0A000FFFEFB00BABAB50080C67A0081CA7F0081C97F0081CA810080E0
        F6007FDDF20081E3FC00BCC6CE003696F0003897F0003C9AF0003F9CF2003E9C
        F000409DF200288AEE00298BEE002B8CEE002D8EEE002E8FEF003090EF003292
        EF003493EF003595F0003896F0003998F2003B98F0003D9AF2001277E9001168
        C9001579EA00167AEA00177BEA00156CCB001B7EEB001C7FEB001E81EB001F82
        EB002386ED002487EE002788ED000F73E9000D62C6001074EA001175EA00095C
        C600095CC5000A5DC50007397A00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020202020202020202020202080404040404040404040404
        04040404040405020202020207377F7D75A19F6E9B9793939393939391920502
        020202020A384D494643403E3D3B3A626262626261960502020202020A32A485
        5A7C7773706D6C999494949492960502020202020A33504F4C484642ACE49D3C
        63626262619605020202020206348B5C87845BB2E4E2E4AF6C9A949492960502
        0202020209236A52514FA2E4E3DDE2E49D3C636261960502020202020B358E5F
        5DB4E4DED6D2DFE2E4AE6C6992960502020202020C245755A3E4D1C4DAD7D3E0
        E1E49E3B3A950502020202020D1DA9BCE4D5BEC9C5DBD8D4D0E3E4B19C980502
        020202020F1E2EE4E4E4E4CDCAC6DCD9E4E4E4E43D6B05020202020210183066
        6564E4C0CECBC7C3E47C7672A056050202020202111831BBB9BAE4C2C2BFBDC8
        E44845413F6F050202020202131831B8B7B5E4C2C2C2CFCCE480597A74710502
        02020202121831B8B8B6E4C2C2C2C2C1E44B68474474050202020202162031A7
        A7A7E4E4E4E4E4E4E486827E7B78050202020202152031313131312F2D395854
        53504E4A67790502020202021420010101010101B3AA368FA85E89A5837E0502
        020202021C0E010101010101011FAAAD908D8CA688810502020202021B173131
        3131313131312F2C2B29212625860502020202021B1731313131313131313122
        2C2A2928278A0502020202021B0301010101010101010119AB60B090A88C0502
        020202021A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A020202}
    end
    object OrendaBarLargeButton: TdxBarLargeButton
      Caption = #1092#1110#1085#1072#1085#1089#1086#1074#1086'-'#1075#1086#1089#1087#1086#1076#1072#1088#1089#1100#1082#1110' '#1076#1086#1075#1086#1074#1086#1088#1080
      Category = 0
      Hint = #1092#1110#1085#1072#1085#1089#1086#1074#1086'-'#1075#1086#1089#1087#1086#1076#1072#1088#1089#1100#1082#1110' '#1076#1086#1075#1086#1074#1086#1088#1080
      Visible = ivAlways
      OnClick = OrendaBarLargeButtonClick
    end
    object PrintReestrBarButton: TdxBarButton
      Caption = #1110#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1079' '#1088#1077#1108#1089#1090#1088#1091' ('#1074#1080#1076#1072#1085#1110' '#1085#1072#1082#1083#1072#1076#1085#1110')'
      Category = 0
      Hint = #1110#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1079' '#1088#1077#1108#1089#1090#1088#1091' ('#1074#1080#1076#1072#1085#1110' '#1085#1072#1082#1083#1072#1076#1085#1110')'
      Visible = ivAlways
      OnClick = PrintReestrBarButtonClick
    end
    object VidNaklImportBarButton: TdxBarButton
      Caption = #1074#1080#1076#1072#1085#1110' '#1085#1072#1082#1083#1072#1076#1085#1110
      Category = 0
      Hint = #1074#1080#1076#1072#1085#1110' '#1085#1072#1082#1083#1072#1076#1085#1110
      Visible = ivAlways
      OnClick = VidNaklImportBarButtonClick
    end
    object OtrNaklImportBarButton: TdxBarButton
      Caption = #1086#1090#1088#1080#1084#1072#1085#1110' '#1085#1072#1082#1083#1072#1076#1085#1110
      Category = 0
      Hint = #1086#1090#1088#1080#1084#1072#1085#1110' '#1085#1072#1082#1083#1072#1076#1085#1110
      Visible = ivAlways
      OnClick = OtrNaklImportBarButtonClick
    end
    object BankLargeButton: TdxBarLargeButton
      Caption = #1041#1072#1085#1082
      Category = 0
      Hint = #1041#1072#1085#1082
      Visible = ivAlways
      OnClick = BankLargeButtonClick
    end
    object ContragentFilterButton: TdxBarLargeButton
      Caption = #1079#1074#1110#1090' '#1079#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1084
      Category = 0
      Hint = #1079#1074#1110#1090' '#1079#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1084
      Visible = ivAlways
      OnClick = ContragentFilterButtonClick
    end
    object FilterSubdivisionButton: TdxBarLargeButton
      Caption = #1079#1074#1110#1090' '#1079#1072' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1072#1084#1080
      Category = 0
      Hint = #1079#1074#1110#1090' '#1079#1072' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1072#1084#1080
      Visible = ivAlways
      OnClick = FilterSubdivisionButtonClick
    end
    object FilterBudgetButton: TdxBarLargeButton
      Caption = #1079#1074#1110#1090' '#1079#1072' '#1073#1102#1076#1078#1077#1090#1072#1084#1080
      Category = 0
      Hint = #1079#1074#1110#1090' '#1079#1072' '#1073#1102#1076#1078#1077#1090#1072#1084#1080
      Visible = ivAlways
      OnClick = FilterBudgetButtonClick
    end
    object IsEditButton: TdxBarButton
      Caption = #1053#1077#1086#1073#1093#1110#1076#1085#1077' '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103
      Category = 0
      Hint = #1053#1077#1086#1073#1093#1110#1076#1085#1077' '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103
      Visible = ivAlways
      OnClick = IsEditButtonClick
    end
    object KorigButton: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1086#1082' 2 ('#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1082#1086#1088#1080#1075#1091#1074#1072#1085#1085#1103')'
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1086#1082' 2 ('#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1082#1086#1088#1080#1075#1091#1074#1072#1085#1085#1103')'
      Visible = ivAlways
      OnClick = KorigButtonClick
    end
    object PrintKorigButton: TdxBarButton
      Caption = #1076#1088#1091#1082' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1072' '#1082#1086#1088#1077#1075#1091#1074#1072#1085#1085#1103' ('#1087#1077#1088#1096#1080#1081' '#1077#1082#1079#1077#1084#1087#1083#1103#1088')'
      Category = 0
      Hint = #1076#1088#1091#1082' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1072' '#1082#1086#1088#1077#1075#1091#1074#1072#1085#1085#1103' ('#1087#1077#1088#1096#1080#1081' '#1077#1082#1079#1077#1084#1087#1083#1103#1088')'
      Visible = ivAlways
      OnClick = PrintKorigButtonClick
    end
    object PrintReestrOtrButton: TdxBarButton
      Caption = #1110#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1079' '#1088#1077#1108#1089#1090#1088#1091' ('#1086#1090#1088#1080#1084#1072#1085#1110' '#1085#1072#1082#1083#1072#1076#1085#1110')'
      Category = 0
      Hint = #1110#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1079' '#1088#1077#1108#1089#1090#1088#1091' ('#1086#1090#1088#1080#1084#1072#1085#1110' '#1085#1072#1082#1083#1072#1076#1085#1110')'
      Visible = ivAlways
      OnClick = PrintReestrOtrButtonClick
    end
    object dxBarButton4: TdxBarButton
      Caption = #1079#1074#1110#1090' '#1079#1072' '#1090#1080#1087#1086#1084' '#1087#1086#1076'. '#1085#1072#1082#1083#1072#1076#1085#1086#1111
      Category = 0
      Hint = #1079#1074#1110#1090' '#1079#1072' '#1090#1080#1087#1086#1084' '#1087#1086#1076'. '#1085#1072#1082#1083#1072#1076#1085#1086#1111
      Visible = ivAlways
      OnClick = dxBarButton4Click
    end
    object ExportnaklXmlButton5: TdxBarButton
      Caption = #1087#1086#1076#1072#1090#1082#1086#1074#1072' '#1085#1072#1082#1083#1072#1076#1085#1072' (XML)'
      Category = 0
      Hint = #1087#1086#1076#1072#1090#1082#1086#1074#1072' '#1085#1072#1082#1083#1072#1076#1085#1072' (XML)'
      Visible = ivAlways
      OnClick = ExportnaklXmlButton5Click
    end
    object PrintKorigTwoEkzButton: TdxBarButton
      Caption = #1076#1088#1091#1082' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1072' '#1082#1086#1088#1077#1075#1091#1074#1072#1085#1085#1103' ('#1076#1088#1091#1075#1080#1081' '#1077#1082#1079#1077#1084#1087#1083#1103#1088')'
      Category = 0
      Hint = #1076#1088#1091#1082' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1072' '#1082#1086#1088#1077#1075#1091#1074#1072#1085#1085#1103' ('#1076#1088#1091#1075#1080#1081' '#1077#1082#1079#1077#1084#1087#1083#1103#1088')'
      Visible = ivAlways
      OnClick = PrintKorigTwoEkzButtonClick
    end
    object ViewButton: TdxBarButton
      Caption = #1087#1077#1088#1077#1075#1083#1103#1076' '#1086#1090#1088'. '#1085#1072#1082#1083'.'
      Category = 0
      Hint = #1087#1077#1088#1077#1075#1083#1103#1076' '#1086#1090#1088'. '#1085#1072#1082#1083'.'
      Visible = ivAlways
      OnClick = ViewButtonClick
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = #1041#1072#1085#1082' ('#1085#1072#1074#1095#1072#1085#1085#1103', '#1089#1090#1091#1076#1084#1110#1089#1090#1077#1095#1082#1086')'
      Category = 0
      Hint = #1041#1072#1085#1082' ('#1085#1072#1074#1095#1072#1085#1085#1103', '#1089#1090#1091#1076#1084#1110#1089#1090#1077#1095#1082#1086')'
      Visible = ivAlways
      OnClick = dxBarLargeButton1Click
    end
  end
  object ReestrInsPopupMenu: TdxBarPopupMenu
    BarManager = TaxInvoicesBarManager
    ItemLinks = <
      item
        Item = AddSeriesBarButton
        Visible = True
      end
      item
        Item = AddDocumentBarButton
        Visible = True
      end
      item
        Item = KorigButton
        Visible = True
      end>
    UseOwnFont = False
    Left = 197
    Top = 86
  end
  object ReestrUpdPopupMenu: TdxBarPopupMenu
    BarManager = TaxInvoicesBarManager
    ItemLinks = <
      item
        Item = dxBarButton1
        Visible = True
      end
      item
        Item = dxBarButton2
        Visible = True
      end>
    UseOwnFont = False
    Left = 1054
    Top = 53
  end
  object ImageList: TImageList
    Left = 1119
    Top = 37
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008E5D5900905F
      5A00905F5A00905F5A00905F5A00905F5A00905F5A00905F5A00905F5A00905F
      5A00905F5A0082524C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000091605A00F8E0
      B400F8DDAC00F8D9A600F8D8A000F7D59900F7D39500F7CF9000F6CE8B00F6CC
      8800F6CB840082524C000000000000000000893615007D3213007B3113007B31
      13007B3113007B3113007B3113007B3113007B3113007B3113007B3113007B31
      13007B3113007E3313008A371500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000096645C00FAE3
      BD00FAE1B700FADEAF00F8DAA900F8D8A10090605B0090605B0090605B009060
      5B00F6CC890082524C000000000000000000692A1100FEF0E200FEEBD700FEE6
      CB00FEE1C100FEDCB700FED8B000FED4A900FED3A500FED3A500FED3A500FED3
      A500FED3A500FED3A50078301200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C685F00FBE9
      C900FBE6C100FAE3BA00F8E0B400F8DCAC00F8D9A500F8D79F00F7D49900F7D1
      9300F6D08F0082524C00000000000000000065281000FEF6EE00FEF0E500FEED
      D900FEE7CF00FEE2C500FEDDBA00FED9B100FED5AB00FED3A500FED3A500FED3
      A500FED3A500FED3A500762F1200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A06D6000FBED
      D10090605B00FBE7C40090605B00FAE0B50090605B00F8DAA90090605B00F8D7
      9C00F7D3970082524C00000000000000000066281000FEFBF700000082000000
      820000008200FEE9D10096351100963511009635110096351100963511009635
      11006F390C00035A0500762F1200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A7736400FCF2
      DD00FBEED500FBEACF00FBE9C700FBE5C000FAE1B800FADEB200F8DCAB00F8D9
      A400F7D79E0082524C00000000000000000066281000FEFEFE00FEFBF800FEF8
      F200FEF3EA00FEEFE000FEEAD400FEE5CA00FEE0BF00FEDAB600FED8AD00BCB6
      7D00035A0500035A0500762F1200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AF796700FEF4
      E60090605B0090605B0090605B0090605B0090605B00FBE3BB00F8E1B500F8DD
      AD00F8DAA70082524C00000000000000000065280F00FEFEFE00FEFEFE00FEFC
      FB00FEFAF400FEF4EB00FEF0E100FEEBD800FEE6CB00FEE1C200BCBC8900035A
      05001FB53700035A0500035A0500035A05000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B67F6900FEF8
      EE00FEF6E900FCF3E200FCF0DC00FBEED400FCEACE00FBE9C600FAE5BF00FAE1
      B700F8DEB00082524C00000000000000000065280F00FEFEFE00000082000000
      820000008200FEFBF70096351100963511009635110096351100035A05003AD4
      63002FC750001FB5370011A32100035A05000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BC846C00FEFC
      F60090605B0090605B0090605B0090605B0090605B00FBEBD000FBE9C900FBE6
      C200FAE3BB0082524C00000000000000000066281000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFBF700FEF7F000FEF3E600FEEEDD00BCC69C00035A
      05003AD46300035A0500035A0500035A05000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C4896E00FFFE
      FC00FFFCF800FFFAF300FEF8ED00FEF6E700FEF2E100FCF0DA00FCEDD300F6D8
      B200EFD3A70082524C00000000000000000065280F00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFCFA00FEF8F200FEF4E900FEEFE000BCC7
      9E00035A0500035A0500752E1100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C98F7000FFFF
      FF0090605B0090605B0090605B0090605B0090605B00FCF4E300FCF2DD00DDCB
      B400B4AA970082524C0000000000000000006B2D1200DCDCDC00DCDCDC00DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCD9D800DCD7
      D100A3B69600035A05007B341600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE927200FFFF
      FF0090605B00FFFFFF00FEFEFB00FFFCF70090605B00FEF8ED009F675A009F67
      5A009F675A009F675A0000000000000000009941150099461100984410009844
      100098441000984410009844100098441000984411009A471300994611009A47
      13009745130095461600762F1200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1967400FFFF
      FF0090605B0090605B0090605B0090605B0090605B00FFFBF4009F675A00FFC4
      6500F2A14100BB775D00000000000000000099411500E97F1E00E97F1E00E97F
      1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F
      1E00E97F1E00E97F1E00A6420C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1967400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFFFE00FFFEFB009F675A00F4B6
      6900BB775D0000000000000000000000000000000000BC580C00BD580C00BD58
      0C00BD580C00BD580C00BD580C00BD580C00BD590C00BF5A0D00BD580B00BF5A
      0D00BB570C00B8570F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1967400CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E68009F675A00BB77
      5D00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000C003FFFF00000000
      C003000100000000C003000100000000C003000100000000C003000100000000
      C003000100000000C003000000000000C003000000000000C003000000000000
      C003000100000000C003000100000000C003000100000000C003000100000000
      C007800300000000C00FFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object Styles: TcxStyleRepository
    Left = 1152
    Top = 48
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15461375
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWindowText
    end
    object StyleOutPut: TcxStyle
      AssignedValues = [svBitmap, svColor, svFont, svTextColor]
      Color = 13827759
      Bitmap.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF0045434600FF00FF002322230022212200201F20004F4D4F00CAC6CA004746
        4700756F7400696367004C494B00B29DA90089838600575355002D2B2C009892
        9500413F4000F6F0F300C1A7B2005F525700E3DEE000B7939F00322F30003A37
        38003F3C3D00403D3E0066636400C3C0C100A1838B009C828900746D6F003531
        32007E7A7B00BDB9BA009E898E00A78B91008A737800C3B0B400443F40005D58
        5900D9D4D500816B6F00BFAFB200BDB2B4007B757600B7B1B200BCB5B600B68F
        9300584F500062595A0069616200978F9000A0989900CBBFC000897777009481
        81004C454500867A7A0049434300645C5C003F3A3A008076760035313100A59A
        9A004F4A4A00312E2E00DACECE00353232003B38380027252500252323008B84
        84002C2A2A00D4CBCB00A49D9D008C868600625E5E005F5B5B002F2D2D00E3DB
        DB005552520038363600363434001D1C1C00ABA6A600A4A0A0009E9A9A005351
        510028272700F3EEEE00DCD7D700B1ADAD00AEAAAA0058565600A09D9D003938
        3800FFFCFC00FAF7F7009290900083818100424141005756560079676600BFAD
        AC00A5979600C5B8B700CABDBC007B6A68008B7A78007A706F0081787700C0B7
        B600DDD4D300504847005A535200928A89008F888700C3BCBB00EDE5E4006256
        5400A4939000AB9A9700413B3A004E484700ACA09E00817B7A009E989700BDB7
        B600BCB6B500BBB5B4008F807D0062585600B5A7A40046414000AF9E9A00A696
        92005D5553002F2B2A00766D6B003C383700413D3C00716D6C0073686500766B
        68005D5654007A73710076625C003F3C3B004A47460068656400F1EBE9009174
        6800998F8B00CFC5C100A2817200B58C78006B65620036343300403E3D008B86
        83009E8C7E00837E7A00181716002726250025242300333231002F2E2D003D3C
        3B003C3B3A004B4A49007A644D00786E6300FFC989008A745B00D2B68E006A62
        540046454300FFE6AA00FFF7E300FFFFD7002F2F2E003E3E3D003D3D3C004343
        420040403F005E604E00585B4D006C6F62003334320089B26A004D58470077BB
        5A003C683A00494A4900007801000EAF1A00094D0D0051A4560005A013001195
        1E00037D1200057E13002D57320027AD390007A52100079D1F0015BF310009B6
        2B0013C03600107A26000D932D000EAC350011AF390019C0490025C551000059
        22000EA8500028D57200019F520024AA6C0032845E0073BBA30046977E004DCE
        C20032353500151616001B1C1C001E1F1F000087AC00006884000F5A6E001315
        1600161819006C7980000084D800181A1C0011121300292B2D001F2021001516
        180017181A00333539005252560019191A0058585B001D1D1E00232324007070
        7200414141002D2D2D00252525001B1B1B001313130010101000030303030303
        030303030303030303030303F1F7F806EA0303030303E3281A55A4EEE9ED4A28
        543E3C79686EA285EA030303E38D7C8A3B96193C343B1F2517319D9C6D333991
        F50303F7337A8A527E6F34B92724A3BDC0C2E8E8E7D9B12B550303FF6A7B8A59
        868C0C661FC6CAD4C8DCECECDCC4BB26E50303FF6A883D5FA159FA6625C4C8D8
        D8E6ECDAC5CBBC39050303FF7E869E4F22BA35120DCAC8C9DDE6DAD0D2CEBC1F
        470303FF86698F4F7FA0411B14D3D2CFD4E0CDD5D6D1C21E4A0303FF2D6B7029
        65B7801A27DEDBD7C1B3B0BFC7D4CC25540303FF6C9BA3595E97B8952CE0E1DF
        B09D9C9994C0C089460303FF37447FAB773064AA5BEBEBEB2E0A0A200B15327D
        400303FF4B78490981815DA9562E74421A53454318214A03030303FF71084E96
        822F23A5051019521C8CFC5A75B60303030303FF22AD8BC35E83641267BE6709
        293CA7619AB603030303EFF3A2AEAC020E714E57015C589307A7A5059AA80303
        0303E20FB0B5AF59F92F4208019878165C777E7676A803030303A03313B5AFF4
        2275590163512A4B9B376C7241E503030303537398B4B1F6368A600101625B78
        514B774C42030303030303433F913A93883E651D1D2356114D8FAB283A030303
        0303030387E5E5408E9F1048A4049287FE9538888950F2030303030303030303
        030303030303FD39393242843855F1F0030303030303030303030303030303F7
        E484907CA604FB550303030303030303030303030303030303E5558EB276A355
        0303030303030303030303030303030303030304555555030303}
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object StyleHoliday: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14870782
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBtnText
    end
    object StyleSimple: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15912375
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object StyleSimple1: TcxStyle
    end
    object cxStyleTshAbsHeader: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInactiveCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object StyleBold: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clHighlight
    end
    object StyleFio: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle2: TcxStyle
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      BuiltIn = True
    end
    object GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      BuiltIn = True
    end
    object cxGridBandedTableViewStyleSheet1: TcxGridBandedTableViewStyleSheet
      BuiltIn = True
    end
  end
  object ExportBarPopupMenu: TdxBarPopupMenu
    BarManager = TaxInvoicesBarManager
    ItemLinks = <
      item
        Item = VidNaklExportBarButton
        Visible = True
      end
      item
        Item = OtrNaklExportBarButton
        Visible = True
      end
      item
        Item = ExportnaklXmlButton5
        Visible = True
      end>
    UseOwnFont = False
    Left = 407
    Top = 69
  end
  object PrintBarPopupMenu: TdxBarPopupMenu
    BarManager = TaxInvoicesBarManager
    ItemLinks = <
      item
        Item = OldPrintBarButton
        Visible = True
      end
      item
        Item = NewPrint1BarButton
        Visible = True
      end
      item
        Item = NewPrint2Button
        Visible = True
      end
      item
        Item = dxBarButton3
        Visible = True
      end
      item
        Item = PrintReestrBarButton
        Visible = True
      end
      item
        Item = PrintReestrOtrButton
        Visible = True
      end
      item
        Item = PrintKorigButton
        Visible = True
      end
      item
        Item = PrintKorigTwoEkzButton
        Visible = True
      end>
    UseOwnFont = False
    Left = 1009
    Top = 54
  end
  object ImportBarPopupMenu: TdxBarPopupMenu
    BarManager = TaxInvoicesBarManager
    ItemLinks = <
      item
        Item = DBFBarButton
        Visible = True
      end
      item
        Item = XMLBarButton
        Visible = True
      end>
    UseOwnFont = False
    Left = 601
    Top = 70
  end
  object ImportSystemBarPopupMenu: TdxBarPopupMenu
    BarManager = TaxInvoicesBarManager
    ItemLinks = <
      item
        Item = OrendaBarLargeButton
        Visible = True
      end
      item
        Item = BankLargeButton
        Visible = True
      end
      item
        Item = dxBarLargeButton1
        Visible = True
      end>
    UseOwnFont = False
    Left = 721
    Top = 70
  end
  object DBFBarPopupMenu: TdxBarPopupMenu
    BarManager = TaxInvoicesBarManager
    ItemLinks = <
      item
        Item = VidNaklImportBarButton
        Visible = True
      end
      item
        Item = OtrNaklImportBarButton
        Visible = True
      end>
    UseOwnFont = False
    Left = 566
    Top = 69
  end
  object FilterBarPopupMenu: TdxBarPopupMenu
    BarManager = TaxInvoicesBarManager
    ItemLinks = <
      item
        Item = ContragentFilterButton
        Visible = True
      end
      item
        Item = FilterSubdivisionButton
        Visible = True
      end
      item
        Item = FilterBudgetButton
        Visible = True
      end
      item
        Item = dxBarButton4
        Visible = True
      end>
    UseOwnFont = False
    Left = 854
    Top = 77
  end
end
