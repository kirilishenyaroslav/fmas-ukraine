object ImportXMLForm: TImportXMLForm
  Left = 327
  Top = 324
  Width = 798
  Height = 558
  Caption = #1044#1072#1085#1110' XML-'#1092#1072#1081#1083#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 41
    Align = alTop
    Caption = #1044#1072#1085#1110' '#1079' XML-'#1092#1072#1081#1083#1091'  ('#1074#1080#1076#1072#1085#1110' '#1085#1072#1082#1083#1072#1076#1085#1110')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 16
      Top = 8
      Width = 161
      Height = 25
      Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1110#1085#1092#1086
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000FF00FF00811E
        000095440F00A7632F00CF7B3500BF8B6200D3844100D78F5000D5925A00DA99
        5E00CCA17E00DAA67D00E0A67200D8A78400D8AF9600D8B69C00E3B08100E7BB
        9200EBC9A700E6D1BF00EFD4B800F0D7BD00E7D3C400F3DECA00F4E2CF00F0E2
        D900FAF0E600FCF7F20000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000001000000000000000000000000000000000101000000
        0000000000000000000000000101010000000000000000000000000000010201
        0000000000000000000000000000010301010000000000000000000000000001
        050A0101000000000000000000000000010F1316010000000000000000000000
        0001191B1A010100000000000000000000010E18150D01010000000000000000
        011714120B0100000000000000000000000111100C0801000000000000000000
        0000010907060401000000000000000000000001010101010100000000000000
        0000000000000000000000000000000000000000000000000000}
    end
  end
  object XMLDataVidNaklGrid: TcxGrid
    Left = 0
    Top = 41
    Width = 782
    Height = 117
    Align = alClient
    TabOrder = 1
    object XMLDataVidNaklGridTableView1: TcxGridTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          Column = XMLDataVidNaklGridTableView_SUMMA_ALL_PDV
        end
        item
          Kind = skSum
          Column = XMLDataVidNaklGridTableView_SUMMA_TAXABLE_20
        end
        item
          Kind = skSum
          Column = XMLDataVidNaklGridTableView_SUMMA_PDV_20
        end
        item
          Kind = skSum
          Column = XMLDataVidNaklGridTableView_SUMMA_TAXABLE_0
        end
        item
          Kind = skSum
          Column = XMLDataVidNaklGridTableView_SUMMA_EXEMPT
        end
        item
          Kind = skSum
          Column = XMLDataVidNaklGridTableView_SUMMA_EXPORT
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnSorting = False
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = StyleDM.GridTableViewStyleSheetDevExpress
      object XMLDataVidNaklGridTableView_NUM_ORDER: TcxGridColumn
        Caption = #8470' '#1079'.'#1087'.'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 48
      end
      object XMLDataVidNaklGridTableView_DATA_VIPISKI: TcxGridColumn
        Caption = #1076#1072#1090#1072' '#1074#1080#1087#1080#1089#1082#1080
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 92
      end
      object XMLDataVidNaklGridTableView_NUM_NAKL: TcxGridColumn
        Caption = #1085#1086#1084#1077#1088
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 61
      end
      object XMLDataVidNaklGridTableView_NAME_TYPE_DOCUMENT: TcxGridColumn
        Caption = #1074#1080#1076' '#1076#1086#1082'.'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 51
      end
      object XMLDataVidNaklGridTableView1_NAME_TYPE_DOC_OZN: TcxGridColumn
        Caption = #1074#1080#1076' '#1076#1086#1082'.'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 45
      end
      object XMLDataVidNaklGridTableView_NAME_TYPE_DOC_OZN2: TcxGridColumn
        Caption = #1074#1080#1076' '#1076#1086#1082'.'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object XMLDataVidNaklGridTableView_NAME_CUSTOMER: TcxGridColumn
        Caption = #1085#1072#1079#1074#1072' '#1087#1086#1082#1091#1087#1094#1103
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 170
      end
      object XMLDataVidNaklGridTableView_IPN_CUSTOMER: TcxGridColumn
        Caption = #1030#1055#1053' '#1087#1086#1082#1091#1087#1094#1103
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 100
      end
      object XMLDataVidNaklGridTableView_SUMMA_ALL_PDV: TcxGridColumn
        Caption = #1079#1072#1075#1072#1083#1100#1085#1072' '#1089#1091#1084#1072', '#1074#1082#1083'. '#1055#1044#1042
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 99
      end
      object XMLDataVidNaklGridTableView_SUMMA_TAXABLE_20: TcxGridColumn
        Caption = '20%, '#1073#1072#1079#1072' '#1086#1087#1086#1076#1072#1090#1082#1091#1074'.'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 94
      end
      object XMLDataVidNaklGridTableView_SUMMA_PDV_20: TcxGridColumn
        Caption = '20%, '#1089#1091#1084#1072' '#1055#1044#1042
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 86
      end
      object XMLDataVidNaklGridTableView_SUMMA_TAXABLE_0: TcxGridColumn
        Caption = '0%, '#1073#1072#1079#1072' '#1086#1087#1086#1076#1072#1090#1082#1091#1074'.'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 91
      end
      object XMLDataVidNaklGridTableView_SUMMA_EXEMPT: TcxGridColumn
        Caption = #1047#1074#1110#1083#1100#1085#1077#1085#1110' '#1074#1110#1076' '#1086#1087#1086#1076#1072#1090#1082#1091#1074#1072#1085#1085#1103
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 120
      end
      object XMLDataVidNaklGridTableView_SUMMA_EXPORT: TcxGridColumn
        Caption = #1045#1082#1089#1087#1086#1088#1090', '#1073#1072#1079#1072' '#1086#1087#1086#1076#1072#1090#1082#1091#1074#1072#1085#1085#1103
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        SortOrder = soAscending
        Width = 118
      end
    end
    object XMLDataVidNaklGridLevel1: TcxGridLevel
      GridView = XMLDataVidNaklGridTableView1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 471
    Width = 782
    Height = 49
    Align = alBottom
    TabOrder = 2
    object cxButton1: TcxButton
      Left = 680
      Top = 16
      Width = 75
      Height = 25
      Caption = #1030#1084#1087#1086#1088#1090#1091#1074#1072#1090#1080
      Default = True
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 768
      Top = 16
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object ReestrSplitter: TcxSplitter
    Left = 0
    Top = 158
    Width = 782
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer9Style'
    AlignSplitter = salBottom
    MinSize = 200
    Control = Panel4
  end
  object Panel4: TPanel
    Left = 0
    Top = 166
    Width = 782
    Height = 305
    Align = alBottom
    Caption = 'Panel4'
    TabOrder = 4
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 780
      Height = 40
      Align = alTop
      Caption = #1044#1072#1085#1110' '#1079' XML-'#1092#1072#1081#1083#1091' ('#1086#1090#1088#1080#1084#1072#1085#1110' '#1085#1072#1082#1083#1072#1076#1085#1110')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object XMLDataOtrNaklGrid: TcxGrid
      Left = 1
      Top = 41
      Width = 780
      Height = 263
      Align = alClient
      TabOrder = 1
      object XMLDataOtrNaklGridTableView1: TcxGridTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
            Column = XMLDataOtrNaklGridTableView_SUMMA_ALL_PDV
          end
          item
            Kind = skSum
            Column = XMLDataOtrNaklGridTableView_SUMMA_20_0_NOT_PDV
          end
          item
            Kind = skSum
            Column = XMLDataOtrNaklGridTableView_SUMMA_20_0_PDV
          end
          item
            Kind = skSum
            Column = XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_NOT_PDV
          end
          item
            Kind = skSum
            Column = XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_PDV
          end
          item
            Kind = skSum
            Column = XMLDataOtrNaklGridTableView_SUMMA_ECON_ACTIV_NOT_PDV
          end
          item
            Kind = skSum
            Column = XMLDataOtrNaklGridTableView1_SUMMA_ECON_ACTIV_PDV
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsSelection.CellSelect = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = StyleDM.GridTableViewStyleSheetDevExpress
        object XMLDataOtrNaklGridTableView_DATA_OTR: TcxGridColumn
          Caption = #1044#1072#1090#1072' '#1086#1090#1088#1080#1084#1072#1085#1085#1103
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 112
        end
        object XMLDataOtrNaklGridTableView_DATA_VIPISKI: TcxGridColumn
          Caption = #1044#1072#1090#1072' '#1074#1080#1087#1080#1089#1082#1080
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 98
        end
        object XMLDataOtrNaklGridTableView_NUM_NAKL: TcxGridColumn
          Caption = #1085#1086#1084#1077#1088
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 57
        end
        object XMLDataOtrNaklGridTableView_NAME_TYPE_DOCUMENT: TcxGridColumn
          Caption = #1074#1080#1076' '#1076#1086#1082'.'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 56
        end
        object XMLDataOtrNaklGridTableView_NAME_PROVIDER: TcxGridColumn
          Caption = #1087#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 99
        end
        object XMLDataOtrNaklGridTableView_IPN_PROVIDER: TcxGridColumn
          Caption = #1030#1055#1053' '#1087#1088#1086#1074#1072#1081#1076#1077#1088
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 83
        end
        object XMLDataOtrNaklGridTableView_SUMMA_ALL_PDV: TcxGridColumn
          Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1089#1091#1084#1072' '#1074#1082#1083'. '#1055#1044#1042
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 102
        end
        object XMLDataOtrNaklGridTableView_SUMMA_20_0_NOT_PDV: TcxGridColumn
          Caption = '20%, 0%, '#1074#1072#1088#1090'-'#1090#1100' '#1073#1077#1079' '#1055#1044#1042
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 103
        end
        object XMLDataOtrNaklGridTableView_SUMMA_20_0_PDV: TcxGridColumn
          Caption = '20%,0%. '#1089#1091#1084#1072' '#1055#1044#1042
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 85
        end
        object XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_NOT_PDV: TcxGridColumn
          Caption = #1079#1074'. '#1074#1110#1076' '#1086#1087#1086#1076#1072#1090#1082'. '#1074#1072#1088#1090'-'#1090#1100' '#1073#1077#1079' '#1055#1044#1042
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 118
        end
        object XMLDataOtrNaklGridTableView_SUMMA_EXEMPT_PDV: TcxGridColumn
          Caption = #1079#1074'. '#1074#1110#1076' '#1086#1087#1086#1076#1072#1090#1082'. '#1089#1091#1084#1072' '#1055#1044#1042
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 91
        end
        object XMLDataOtrNaklGridTableView_SUMMA_ECON_ACTIV_NOT_PDV: TcxGridColumn
          Caption = #1071#1082#1110' '#1085#1077' '#1087#1088#1080#1079#1085'. '#1076#1083#1103' '#1074#1080#1082#1086#1088'. '#1091' '#1075#1086#1089#1087'. '#1076'. '#1074#1072#1088#1090'-'#1090#1100' '#1055#1044#1042
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 116
        end
        object XMLDataOtrNaklGridTableView1_SUMMA_ECON_ACTIV_PDV: TcxGridColumn
          Caption = #1071#1082#1110' '#1085#1077' '#1087#1088#1080#1079#1085'. '#1076#1083#1103' '#1074#1080#1082#1086#1088'. '#1091' '#1075#1086#1089#1087'. '#1076'. '#1089#1091#1084#1072' '#1055#1044#1042
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 96
        end
        object XMLDataOtrNaklGridTableView_SUMMA_DELIVERY_NOT_PDV: TcxGridColumn
          Caption = #1044#1083#1103' '#1087#1086#1089#1090#1072#1074#1082#1080' '#1087#1086#1089#1083#1091#1075', '#1074#1072#1088#1090'-'#1090#1100' '#1073#1077#1079' '#1055#1044#1042
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 95
        end
        object XMLDataOtrNaklGridTableView_SUMMA_DELIVERY_PDV: TcxGridColumn
          Caption = #1044#1083#1103' '#1087#1086#1089#1090#1072#1074#1082#1080' '#1087#1086#1089#1083#1091#1075', '#1089#1091#1084#1072' '#1055#1044#1042
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 90
        end
      end
      object XMLDataOtrNaklGridLevel1: TcxGridLevel
        GridView = XMLDataOtrNaklGridTableView1
      end
    end
  end
end
