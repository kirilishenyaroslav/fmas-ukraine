object fmAddChangeAvance: TfmAddChangeAvance
  Left = 444
  Top = 246
  Width = 1090
  Height = 753
  Color = clInactiveBorder
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 217
    Width = 1074
    Height = 472
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 1072
      Height = 427
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      OnChanging = PageControl1Changing
      object TabSheet1: TTabSheet
        Caption = #1087#1086' '#1089#1084#1077#1090#1072#1084
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 1064
          Height = 278
          Align = alClient
          TabOrder = 0
          object cxGrid1DBTableView1: TcxGridDBTableView
            OnDblClick = cxGrid1DBTableView1DblClick
            OnKeyUp = cxGrid1DBTableView1KeyUp
            DataController.DataSource = DataSourceSave
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '0.00;-0.00'
                Kind = skSum
                FieldName = 'RxMemDat_summa'
                Column = cxGrid1DBTableView1DBColumn7
              end
              item
                Format = '0.00;-0.00'
                Kind = skSum
                FieldName = 'Summa_po_osnovnim'
                Column = cxGrid1DBTableView1DBColumn8
              end
              item
                Format = '0.00;-0.00'
                Kind = skSum
                FieldName = 'Summa_po_neosnovnim'
                Column = cxGrid1DBTableView1DBColumn9
              end>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            Styles.Background = cxStyleYellow
            Styles.StyleSheet = fmAvanceOtchet.GridTableViewStyleSheetDevExpress
            Styles.Content = cxStyleYellow
            Styles.ContentEven = cxStyleYellow
            Styles.ContentOdd = cxStyleYellow
            Styles.Inactive = cxStyle4
            Styles.IncSearch = cxStyleYellow
            Styles.Selection = cxStyleMalin
            Styles.FilterBox = cxStyleYellow
            Styles.Footer = cxStyleBorder
            Styles.Group = cxStyleYellow
            Styles.GroupByBox = cxStyleYellow
            Styles.Header = cxStyleBorder
            Styles.Indicator = cxStyleYellow
            Styles.Preview = cxStyleYellow
            object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
              Width = 104
              DataBinding.FieldName = 'RxMemDatNameSch'
            end
            object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
              Width = 101
              DataBinding.FieldName = 'RxMemDatname_korespond'
            end
            object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
              Width = 83
              DataBinding.FieldName = 'RxMemoryDataSaveProvFieldSmRzStK'
            end
            object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
              Width = 155
              DataBinding.FieldName = 'RxMemoryDataSaveProvFieldTitle_sm'
            end
            object cxGrid1DBTableView1DBColumn7: TcxGridDBColumn
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = '0.00;-0.00'
              Width = 84
              DataBinding.FieldName = 'RxMemDat_summa'
            end
            object cxGrid1DBTableView1DBColumn8: TcxGridDBColumn
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = '0.00;-0.00'
              Width = 116
              DataBinding.FieldName = 'Summa_po_osnovnim'
            end
            object cxGrid1DBTableView1DBColumn9: TcxGridDBColumn
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = '0.00;-0.00'
              Width = 101
              DataBinding.FieldName = 'Summa_po_neosnovnim'
            end
            object cxGrid1DBTableView1DBColumn6: TcxGridDBColumn
              Visible = False
              Options.ShowEditButtons = isebAlways
              SortOrder = soAscending
              DataBinding.FieldName = 'id'
            end
            object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
              PropertiesClassName = 'TcxImageProperties'
              OnCustomDrawCell = cxGrid1DBTableView1DBColumn5CustomDrawCell
              Width = 26
              DataBinding.FieldName = 'RxMemoryDataSaveProvFieldMain'
              IsCaptionAssigned = True
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
        object cxSplitter1: TcxSplitter
          Left = 0
          Top = 278
          Width = 1064
          Height = 8
          HotZoneClassName = 'TcxSimpleStyle'
          HotZone.SizePercent = 100
          AlignSplitter = salBottom
          Control = PageControl2
        end
        object PageControl2: TPageControl
          Left = 0
          Top = 286
          Width = 1064
          Height = 113
          ActivePage = TabSheet5
          Align = alBottom
          Style = tsFlatButtons
          TabOrder = 2
          TabStop = False
          object TabSheet5: TTabSheet
            Caption = 'TabSheet5'
            ImageIndex = 2
            object cxLabel15: TcxLabel
              Left = 1
              Top = 1
              Width = 73
              Height = 17
              AutoSize = False
              TabOrder = 0
            end
            object cxTextEdit4: TcxTextEdit
              Left = 75
              Top = 0
              Width = 689
              Height = 21
              ParentColor = True
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clNavy
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = []
              TabOrder = 1
            end
            object cxLabel16: TcxLabel
              Left = 1
              Top = 38
              Width = 75
              Height = 17
              AutoSize = False
              TabOrder = 2
            end
            object cxTextEdit1: TcxTextEdit
              Left = 75
              Top = 36
              Width = 286
              Height = 21
              ParentColor = True
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clGreen
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = []
              TabOrder = 3
            end
            object cxLabel17: TcxLabel
              Left = 363
              Top = 37
              Width = 77
              Height = 17
              AutoSize = False
              TabOrder = 4
            end
            object cxTextEdit3: TcxTextEdit
              Left = 432
              Top = 35
              Width = 332
              Height = 21
              ParentColor = True
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clGreen
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = []
              TabOrder = 5
            end
            object cxLabel18: TcxLabel
              Left = -1
              Top = 60
              Width = 77
              Height = 17
              AutoSize = False
              TabOrder = 6
            end
            object cxTextEdit5: TcxTextEdit
              Left = 75
              Top = 59
              Width = 689
              Height = 21
              ParentColor = True
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clGreen
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = []
              TabOrder = 7
            end
          end
          object TabSheet3: TTabSheet
            Caption = #1054#1096#1080#1073#1082#1080' '#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1077
            object cxMemo2: TcxMemo
              Left = 0
              Top = 0
              Width = 764
              Height = 82
              TabStop = False
              Align = alClient
              Properties.ReadOnly = True
              Style.Color = 15451300
              TabOrder = 0
            end
          end
          object TabSheet4: TTabSheet
            Caption = #1054#1096#1080#1073#1082#1080' '#1086' '#1087#1088#1086#1074#1086#1076#1082#1072#1093
            ImageIndex = 1
            object cxGrid4: TcxGrid
              Left = 0
              Top = 0
              Width = 764
              Height = 105
              Align = alClient
              TabOrder = 0
              TabStop = False
              object cxGridDBTableView2: TcxGridDBTableView
                DataController.DataSource = DataSourceError
                DataController.Filter.Criteria = {FFFFFFFF0000000000}
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                NavigatorButtons.ConfirmDelete = False
                OptionsData.Editing = False
                OptionsSelection.CellSelect = False
                OptionsView.CellAutoHeight = True
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                OptionsView.HeaderAutoHeight = True
                Styles.Background = cxStyle13
                Styles.Content = cxStyle13
                object cxGridDBTableView2DBColumn1: TcxGridDBColumn
                  Caption = #1050#1086#1076' '#1086#1096#1080#1073#1082#1080
                  PropertiesClassName = 'TcxTextEditProperties'
                  Width = 113
                  DataBinding.FieldName = 'Rxkod'
                end
                object cxGridDBTableView2DBColumn2: TcxGridDBColumn
                  Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
                  PropertiesClassName = 'TcxTextEditProperties'
                  SortOrder = soAscending
                  Width = 606
                  DataBinding.FieldName = 'RxName'
                end
              end
              object cxGridLevel2: TcxGridLevel
                GridView = cxGridDBTableView2
              end
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1103
        ImageIndex = 1
        object SpBtUp: TSpeedButton
          Left = 616
          Top = 40
          Width = 113
          Height = 57
          Hint = #1055#1077#1088#1077#1089#1090#1072#1074#1080#1090#1080' '#1074#1080#1076#1077#1083#1077#1085#1091' '#1088#1086#1079#1096#1080#1092#1088#1086#1074#1082#1091' '#1085#1072' '#1086#1076#1080#1085' '#1074#1074#1077#1088#1093
          Caption = #1053#1072' '#1086#1076#1080#1085' '#1074#1074#1077#1088#1093
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FF331400451B00572200572200471C00361600FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF491C00491C00803200A54100AA
            4200AA4200A74100843400511F00511F00FF00FFFF00FFFF00FFFF00FFFF00FF
            5923006E2B00AF4400B14500AA4200A54100AA4200AA4200AF4400B14500702C
            00361600FF00FFFF00FFFF00FF5923007B3000C54D00B84800AA4200A54100E7
            CAAFFFFFFFC07231A74100AA4200B14500702C00511F00FF00FFFF00FF592300
            D45300CC5000BB4900AA4200A74100E7C9ACFFFFFFC07332A74100A74100AA42
            00B14500511F00FF00FF5F2500A03F00EB5C00CC5000B14500AC4300A74100E7
            C9ABFFFFFFC07231A74100A74100A74100AF4400843400451B005F2500D75400
            EB5C00D45300BB5910AC4703AC4300E9C9ABFFFFFFC07231A74100B25711AC4A
            05AC43009E3E00451B00772E00F66000F86200F86200FBE7D4EFB47EE35900F7
            CEA6FFFFFFBA6825C07230FBF7F2E1BA95AA4200AA42004F1F00893500FF7813
            FF6A04FB6300FFF3E7FFFFFFFFB26FFFD3AAFFFFFFD59A66F4E7DAFFFFFFD9A7
            7AAC4300AA4200572200893500FF8829FF801EF05E00FC9742FFFAF4FFFEFCFF
            FAF6FFFEFCFEFBF8FFFFFFE2A670C44F01B84800A541004B1D00893500FF801E
            FFAD67FF6400EE5D00FC923AFFF8F3FFFFFFFFFFFFFFFFFFEAAF79CF5200C54D
            00BB4900953A004B1D00FF00FFE65A00FFC693FF9842E15800EB5C00FC9138FF
            F6EEFFFFFFF3BD8CCF5200CA4F00C04B00C74E00752D00FF00FFFF00FFE65A00
            FF892BFFDAB7FF9741F86200E95B00FB9E4FFED1A7E6670BD95500D45300D754
            00B44600752D00FF00FFFF00FFFF00FFC54D00FF9842FFE2C6FFBB7FFF8728FF
            750FFF6B05FF6E08FF6E08FF6701CA4F00702C00FF00FFFF00FFFF00FFFF00FF
            FF00FFFF801EFF801EFFBA7DFFD5ADFFC591FFB574FFA558FF8323D75400D754
            00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE15800FF700AFF
            7D19FF7813FB6300B64700FF00FFFF00FFFF00FFFF00FFFF00FF}
          Layout = blGlyphTop
          ParentShowHint = False
          ShowHint = True
          Visible = False
          OnClick = SpBtUpClick
        end
        object SpBtDown: TSpeedButton
          Left = 624
          Top = 128
          Width = 113
          Height = 65
          Hint = #1055#1077#1088#1077#1089#1090#1072#1074#1080#1090#1080' '#1074#1080#1076#1077#1083#1077#1085#1091' '#1088#1086#1079#1096#1080#1092#1088#1086#1074#1082#1091' '#1085#1072' '#1086#1076#1080#1085' '#1074#1085#1080#1079
          Caption = #1053#1072' '#1086#1076#1080#1085' '#1074#1085#1080#1079
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FF331400451B00572200572200471C00361600FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF491C00491C00803200A54100AA
            4200AA4200A74100843400511F00511F00FF00FFFF00FFFF00FFFF00FFFF00FF
            5923006E2B00AF4400B14500AA4200A54100AA4200AA4200AF4400B14500702C
            00361600FF00FFFF00FFFF00FF5923007B3000C54D00B84800AA4200A54100CA
            884FE6C6A7AF500BA74100AA4200B14500702C00511F00FF00FFFF00FF592300
            D45300CC5000BB4900AA4200C27738FAF4EEFFFFFFDEB48CA94200A74100AA42
            00B14500511F00FF00FF5F2500A03F00EB5C00CC5000B14500C67A3AFCF7F3FF
            FFFFFFFFFFFFFFFFD9A679A94200A74100AF4400843400451B005F2500D75400
            EB5C00D45300CC8242FCF8F4FEFEFCFCFAF6FEFEFCFEFBF8FFFFFFD5A070A944
            01AC43009E3E00451B00772E00F66000F86200F86200FEF2E7FFFFFFF2AD6FF7
            CFAAFFFFFFD19866F4E7DAFFFFFFD9A77AAA4200AA42004F1F00893500FF7813
            FF6A04FB6300FFEAD4FFBB7EFF6400FFD1A6FFFFFFBF6A25C07230FBF7F2E1BA
            95AC4300AA4200572200893500FF8829FF801EF05E00FB7410FB6703FB6300FC
            D3ABFFFFFFD77D31C54D00CA6011C65405B84800A541004B1D00893500FF801E
            FFAD67FF6400EE5D00FB6300FB6300FED3ABFFFFFFE18031CF5100CF5100C54D
            00BB4900953A004B1D00FF00FFE65A00FFC693FF9842E15800EB5C00FB6300FE
            D4ACFFFFFFE78332CF5100CA4F00C04B00C74E00752D00FF00FFFF00FFE65A00
            FF892BFFDAB7FF9741F86200E95B00FED5AFFFFFFFEB8431D95500D45300D754
            00B44600752D00FF00FFFF00FFFF00FFC54D00FF9842FFE2C6FFBB7FFF8728FF
            750FFF6B05FF6E08FF6E08FF6701CA4F00702C00FF00FFFF00FFFF00FFFF00FF
            FF00FFFF801EFF801EFFBA7DFFD5ADFFC591FFB574FFA558FF8323D75400D754
            00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE15800FF700AFF
            7D19FF7813FB6300B64700FF00FFFF00FFFF00FFFF00FFFF00FF}
          Layout = blGlyphTop
          ParentShowHint = False
          ShowHint = True
          Visible = False
          OnClick = SpBtDownClick
        end
        object cxTextEdit2: TcxTextEdit
          Left = 272
          Top = 408
          Width = 153
          Height = 21
          Style.Color = 16776176
          TabOrder = 0
        end
        object cxLabel7: TcxLabel
          Left = 168
          Top = 408
          Width = 92
          Height = 17
          TabOrder = 2
          Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1089#1091#1084#1084#1072
        end
        object cxLabel1: TcxLabel
          Left = 118
          Top = 369
          Width = 172
          Height = 17
          TabOrder = 3
          Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1089#1091#1084#1072' '#1087#1086' '#1088#1086#1079#1087#1086#1076#1110#1083#1077#1085#1085#1102
        end
        object cxGrid2: TcxGrid
          Left = 0
          Top = 0
          Width = 1064
          Height = 399
          Align = alClient
          PopupMenu = PopupMenuRas
          TabOrder = 1
          object cxGrid2DBTableView1: TcxGridDBTableView
            OnDblClick = cxGrid2DBTableView1DblClick
            OnKeyPress = cxGrid2DBTableView1KeyPress
            DataController.DataSource = DataSourceRas
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '0.00;-0.00'
                Kind = skSum
                FieldName = 'RxMemoryDataSumma'
                Column = cxGrid2DBTableView1DBColumn2
              end>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            Styles.Background = cxStyleYellow
            Styles.Content = cxStyleYellow
            Styles.ContentEven = cxStyleYellow
            Styles.ContentOdd = cxStyleYellow
            Styles.Inactive = cxStyleYellow
            Styles.IncSearch = cxStyleYellow
            Styles.Selection = cxStyle17
            Styles.FilterBox = cxStyleYellow
            Styles.Footer = cxStyleBorder
            Styles.Group = cxStyleYellow
            Styles.GroupByBox = cxStyleYellow
            Styles.Header = cxStyleBorder
            Styles.Indicator = cxStyleYellow
            Styles.NewItemRowInfoText = cxStyleYellow
            Styles.Preview = cxStyleYellow
            object cxGrid2DBTableView1DBColumn3: TcxGridDBColumn
              MinWidth = 89
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              SortOrder = soAscending
              Width = 89
              DataBinding.FieldName = 'RxMemoryDataNumber'
              IsCaptionAssigned = True
            end
            object cxGrid2DBTableView1DBColumn1: TcxGridDBColumn
              MinWidth = 471
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 471
              DataBinding.FieldName = 'RxMemoryDataName'
            end
            object cxGrid2DBTableView1DBColumn2: TcxGridDBColumn
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = '0.00;-0.00'
              HeaderAlignmentHorz = taRightJustify
              HeaderGlyphAlignmentHorz = taRightJustify
              MinWidth = 210
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 210
              DataBinding.FieldName = 'RxMemoryDataSumma'
            end
          end
          object cxGrid2Level1: TcxGridLevel
            GridView = cxGrid2DBTableView1
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 428
      Width = 1072
      Height = 43
      Align = alBottom
      Color = clInactiveBorder
      TabOrder = 1
      TabStop = True
      DesignSize = (
        1072
        43)
      object Bevel1: TBevel
        Left = 644
        Top = 1
        Width = 427
        Height = 41
        Align = alRight
        Shape = bsFrame
      end
      object cxButtonClose: TcxButton
        Left = 958
        Top = 8
        Width = 113
        Height = 25
        Anchors = [akRight]
        Cancel = True
        Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = cxButtonCloseClick
        Glyph.Data = {
          32040000424D3204000000000000360000002800000014000000110000000100
          180000000000FC030000120B0000120B00000000000000000000C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4B54A009C31009C3100C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4B54A00FFEFA5FFEFA55A31185A3118C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4B54A00FFEFA5FFEFA5FFE78CFFE78C313131313131C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
          FF6331B54A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65A3131319C31009C31
          00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF31FFFF6331B5
          4A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65AFF9C00FF9C639C3100C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331B54A00FFEF
          A5FFEFA5000000080808FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4080808C8D0D4C8D0D4FF6331B54A00FFEFA5FFEFA5
          FFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4000000000000C8D0D4C8D0D4FF6331B54A00F7FFFFFFDE84FFDE84FF
          DE84FFDE84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000
          FFFFCE000000000000000000000000B54A00F7FFFFFFEFA5FFDE84FFDE84FFDE
          84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4000000FFFFCEFFFFCEFF
          FFBDFFC65AFFA510FF9C00B54A00F7FFFFFFEFA5FFDE84FFDE84FFCE63FFC65A
          FF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000FFFFCE0000000000
          00000000080808B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF
          9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4080808000000C8D0D4C8D0D4
          FF6331B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C31
          00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4FF31FFFF6331C6
          5A00C65A00FFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C009C3100C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD6
          73C65A00C65A00CE6363FFCE63FFC65AFF9C00FF9C009C3100C8D0D4C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD673FFD673
          FFD673C65A00C65A00CE6363FF9C00FF9C009C3100C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFDE84FFDE84FFDE84FFDE84FF
          DE84FFDE84C65A00C65A00C65A009C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4FF6331FF6331FF6331FF6331FF6331FF6331FF63
          31FF6331FF6331FF6331FF6331C8D0D4C8D0D4C8D0D4}
        UseSystemPaint = False
      end
      object cxButtonOk: TcxButton
        Left = 846
        Top = 8
        Width = 97
        Height = 25
        Action = ActionSave
        Anchors = [akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Glyph.Data = {
          AE010000424DAE01000000000000AE000000280000000F000000100000000100
          08000000000000010000C30E0000C30E00001E0000001E00000000000000FFFF
          FF008C5A5A009C6B6B00BD848400B58C8C00BDADAD00D6C6C600EFDEDE009C6B
          6300A57B7300C68C7B00F7DECE00FFE7D600F7DEC600EFDECE00FFF7EF00F7E7
          D600FFD6A500EFB56B00F7DEBD00F7E7CE00FFF7E700F7EFDE00FFFFF7004C80
          4C0052AE570069CA8000C8D0D400FFFFFF001C1C1C1C05020202020202020202
          1C001C1C1C1C051617171717171715021C001C1C1C1C05170C0E0E0E0E0F0F02
          1C001C1C1C1C05161212121212120F021C000502020205100E0E0E0E14150F09
          1C00051617170510150E0E0E0E110F031C0005170C0E0518121212191919190A
          1C000516121205180D0D11191A1A190A1C0005100E0E0501011919191A1A1919
          19000510150E050101191A1A1A1A1A1A190005181212050101191B1B1B1A1A1A
          190005180D0D0505051919191B1A19191900050101011818080706191B1A191C
          1C00050101011818050505191919191C1C0005010101010105130B1C1C1C1C1C
          1C0005050505050505041C1C1C1C1C1C1C00}
        UseSystemPaint = False
      end
      object cxButtonNext: TcxButton
        Left = 660
        Top = 8
        Width = 188
        Height = 25
        Anchors = [akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = cxButtonNextClick
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 1074
    Height = 217
    Align = alTop
    ParentColor = True
    TabOrder = 0
    TabStop = True
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 1072
      Height = 175
      Align = alClient
      Color = clInactiveBorder
      TabOrder = 0
      TabStop = True
      DesignSize = (
        1072
        175)
      object Bevel2: TBevel
        Left = 8
        Top = 32
        Width = 1061
        Height = 121
        Anchors = [akLeft, akTop, akRight, akBottom]
        Shape = bsFrame
      end
      object SpeedButtonDog: TSpeedButton
        Left = 712
        Top = 120
        Width = 23
        Height = 30
        Flat = True
        Glyph.Data = {
          26040000424D2604000000000000360000002800000012000000120000000100
          180000000000F003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000FFFFFFFFFFFF000000000000FFFFFFFFFFFF000000000000FFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFF
          FFFF000000000000FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000}
        OnClick = SpeedButtonDogClick
      end
      object LabelTypeDoc: TLabel
        Left = 8
        Top = 6
        Width = 74
        Height = 13
        Caption = #1090#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      end
      object cxMRUEditFio: TcxMRUEdit
        Left = 176
        Top = 42
        Width = 569
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxMRUEditFioPropertiesButtonClick
        Style.Color = 16776176
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
      end
      object cxLabel8: TcxLabel
        Left = 19
        Top = 42
        Width = 158
        Height = 17
        AutoSize = False
        TabOrder = 5
        Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1084#1080#1083#1080#1102
      end
      object cxEditNumber1: TcxTextEdit
        Left = 547
        Top = 6
        Width = 73
        Height = 21
        Anchors = [akTop]
        Enabled = False
        Properties.MaxLength = 8
        Properties.ReadOnly = True
        Style.Color = 16776176
        TabOrder = 6
      end
      object cxLabel9: TcxLabel
        Left = 175
        Top = 6
        Width = 329
        Height = 17
        Anchors = [akTop]
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 7
        Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      end
      object cxDateEditAo: TcxDateEdit
        Left = 766
        Top = 6
        Width = 113
        Height = 21
        OnFocusChanged = cxDateEditAoFocusChanged
        Anchors = [akTop]
        ParentFont = False
        Properties.OnChange = cxDateEditAoPropertiesChange
        Style.Color = 16776176
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
        OnExit = cxDateEditAoPropertiesChange
      end
      object cxTextEditSumma: TcxTextEdit
        Left = 816
        Top = 42
        Width = 246
        Height = 21
        Anchors = [akTop, akRight]
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Style.Color = 16776176
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 2
        Text = '0,00'
        OnExit = cxTextEditSummaExit
        OnKeyPress = cxTextEditSummaKeyPress
      end
      object cxLabel10: TcxLabel
        Left = 749
        Top = 42
        Width = 42
        Height = 17
        Anchors = [akTop, akRight]
        TabOrder = 8
        Caption = #1057#1091#1084#1084#1072
      end
      object cxLabel11: TcxLabel
        Left = 713
        Top = 6
        Width = 19
        Height = 17
        Anchors = [akTop]
        TabOrder = 9
        Caption = #1086#1090
      end
      object cxMemoNote: TcxMemo
        Left = 88
        Top = 82
        Width = 773
        Height = 33
        Anchors = [akLeft, akTop, akRight]
        Properties.MaxLength = 180
        Style.Color = 16776176
        TabOrder = 3
      end
      object cxLabel3: TcxLabel
        Left = 19
        Top = 83
        Width = 64
        Height = 17
        TabOrder = 10
        Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
      end
      object cxEditNumber2: TcxTextEdit
        Left = 640
        Top = 6
        Width = 51
        Height = 21
        TabStop = False
        Anchors = [akTop]
        Properties.MaxLength = 5
        Properties.UseLeftAlignmentOnEditing = False
        Style.Color = 16776176
        TabOrder = 4
        OnKeyPress = cxEditNumber2KeyPress
      end
      object cxLabel2: TcxLabel
        Left = 19
        Top = 124
        Width = 46
        Height = 17
        TabOrder = 11
        Caption = #1055#1088#1080#1082#1072#1079
      end
      object cxMemoDog: TcxMemo
        Left = 88
        Top = 118
        Width = 774
        Height = 31
        Anchors = [akLeft, akTop, akRight]
        Properties.MaxLength = 180
        Style.Color = 16776176
        TabOrder = 12
      end
      object cxLabel4: TcxLabel
        Left = 174
        Top = 62
        Width = 166
        Height = 17
        AutoSize = False
        TabOrder = 13
        Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
      end
      object cxLabel5: TcxLabel
        Left = 339
        Top = 62
        Width = 166
        Height = 17
        AutoSize = False
        TabOrder = 14
        Caption = ''
      end
      object cxCheckBoxKom: TcxCheckBox
        Left = 749
        Top = 62
        Width = 119
        Height = 21
        Anchors = [akTop, akRight]
        Properties.DisplayUnchecked = 'False'
        TabOrder = 15
        OnClick = cxCheckBoxKomClick
      end
      object Panel5: TPanel
        Left = 864
        Top = 62
        Width = 200
        Height = 24
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        FullRepaint = False
        ParentColor = True
        TabOrder = 16
        TabStop = True
        Visible = False
        object cxLabelFrom: TcxLabel
          Left = 0
          Top = 0
          Width = 14
          Height = 24
          Align = alLeft
          TabOrder = 0
          Visible = False
          Caption = #1079
        end
        object cxDateEditFrom: TcxDateEdit
          Left = 16
          Top = 2
          Width = 81
          Height = 21
          Style.Color = 16776176
          TabOrder = 1
          Visible = False
          EditValue = 39468d
        end
        object cxLabelTo: TcxLabel
          Left = 103
          Top = 2
          Width = 20
          Height = 17
          TabOrder = 2
          Visible = False
          Caption = #1076#1086
        end
        object cxDateEditTo: TcxDateEdit
          Left = 117
          Top = 1
          Width = 81
          Height = 21
          Style.Color = 16776176
          TabOrder = 3
          Visible = False
        end
      end
      object ButtonEditTypeDoc: TcxButtonEdit
        Left = 88
        Top = 3
        Width = 225
        Height = 21
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = ButtonEditTypeDocPropertiesButtonClick
        Style.Color = 16776176
        TabOrder = 17
        Text = 'ButtonEditTypeDoc'
      end
    end
    object ToolBar1: TToolBar
      Left = 1
      Top = 176
      Width = 1072
      Height = 40
      Align = alBottom
      ButtonHeight = 36
      ButtonWidth = 58
      Caption = 'ToolBar1'
      Flat = True
      Images = fmAvanceOtchet.ImageList
      ShowCaptions = True
      TabOrder = 1
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = ActionAdd
      end
      object ToolButton3: TToolButton
        Left = 58
        Top = 0
        Action = ActionEdit
      end
      object ToolButton2: TToolButton
        Left = 116
        Top = 0
        Action = ActionDel
      end
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 689
    Width = 1074
    Height = 26
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Color = clBtnFace
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clNavy
        PanelStyle.Font.Height = -8
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = []
        PanelStyle.ParentFont = False
        Fixed = False
        Width = 160
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clNavy
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = []
        PanelStyle.ParentFont = False
        Fixed = False
        Width = 110
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clNavy
        PanelStyle.Font.Height = -8
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = []
        PanelStyle.ParentFont = False
        Fixed = False
        Width = 106
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clNavy
        PanelStyle.Font.Height = -8
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = []
        PanelStyle.ParentFont = False
        Fixed = False
        Width = 106
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clNavy
        PanelStyle.Font.Height = -8
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = []
        PanelStyle.ParentFont = False
        Fixed = False
        Width = 106
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clNavy
        PanelStyle.Font.Height = -8
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = []
        PanelStyle.ParentFont = False
        Fixed = False
        Width = 80
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clNavy
        PanelStyle.Font.Height = -8
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = []
        PanelStyle.ParentFont = False
        Fixed = False
        Width = 50
      end>
    PaintStyle = stpsOffice11
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object DataSetNumber: TpFIBDataSet
    Database = fmAvanceOtchet.DatabaseMain
    Transaction = fmAvanceOtchet.TransactionRead
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 53
    Top = 234
    poSQLINT64ToBCD = True
  end
  object DataSetChange: TpFIBDataSet
    Database = fmAvanceOtchet.DatabaseMain
    Transaction = fmAvanceOtchet.TransactionRead
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 24
    Top = 234
    poSQLINT64ToBCD = True
  end
  object ActionList1: TActionList
    Images = fmAvanceOtchet.ImageList
    Left = 320
    Top = 151
    object ActionAdd: TAction
      Caption = #1044#1072#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      ShortCut = 45
      OnExecute = ActionAddExecute
    end
    object ActionEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 4
      ShortCut = 113
      OnExecute = ActionEditExecute
    end
    object ActionDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = ActionDelExecute
    end
    object ActionSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 121
      OnExecute = ActionSaveExecute
    end
    object ActionShowAll: TAction
      Caption = 'ActionShowAll'
      ShortCut = 57431
      OnExecute = ActionShowAllExecute
    end
  end
  object RxMemoryDataSaveProv: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxMemDatId_doc_prov'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_doc'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDat_summa'
        DataType = ftFloat
      end
      item
        Name = 'RxMemDatid_sm'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_razd'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_st'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_kekv'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_man'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_sch'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatNameSch'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RxMemDatNameStat'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RxMemDatNameRazd'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RxMemDatNameSmeta'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RxMemDatFio'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'RxMemDatNameKekv'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RxMemDatID_SCH_KORESPOND'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatname_korespond'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RxMemDatid_all_prov'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatkod_dog'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatsumma_value'
        DataType = ftFloat
      end
      item
        Name = 'RxMemDatid_value'
        DataType = ftVariant
      end
      item
        Name = 'RxMemoryDataSaveId_Dog'
        DataType = ftVariant
      end
      item
        Name = 'RxMemoryDataSaveProvFieldTitle_sm'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemoryDataSaveProvFieldTitle_raz'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemoryDataSaveProvFieldTitle_st'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemoryDataSaveProvFieldTitle_kekv'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemoryDataSaveProvFieldDate_dog'
        DataType = ftDate
      end
      item
        Name = 'RxMemoryDataSaveProvFieldNum_dog'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RxMemoryDataSaveProvFieldTitle_sch'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'RxMemoryDataSaveProvFieldTitle_kor_sch'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'RxMemoryDataSaveProvFieldNameCust'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RxMemoryDataSaveProvFieldSmRzStK'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'RxMemoryDataSaveProvFieldRegDog'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RxMemoryDataSaveProvFieldTypeDog'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RxMemoryDataSaveProvFieldTin'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RxMemoryDataSaveProvFieldBirthday'
        DataType = ftDate
      end
      item
        Name = 'RxMemoryDataSaveProvFieldMain'
        DataType = ftInteger
      end
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'Summa_po_osnovnim'
        DataType = ftCurrency
      end
      item
        Name = 'Summa_po_neosnovnim'
        DataType = ftCurrency
      end
      item
        Name = 'id_customer'
        DataType = ftVariant
      end>
    AfterScroll = RxMemoryDataSaveProvAfterScroll
    Left = 21
    Top = 167
  end
  object RxMemoryDataRas: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxMemoryDataSumma'
        DataType = ftCurrency
      end
      item
        Name = 'RxMemoryDataName'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RxMemoryDataId'
        DataType = ftVariant
      end
      item
        Name = 'RxMemoryDataNumber'
        DataType = ftInteger
      end
      item
        Name = 'id_prov'
        DataType = ftVariant
      end>
    Left = 413
    Top = 207
  end
  object DataSourceSave: TDataSource
    DataSet = RxMemoryDataSaveProv
    Left = 53
    Top = 183
  end
  object StyleRepository: TcxStyleRepository
    Left = 88
    Top = 168
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyleYellow: TcxStyle
      AssignedValues = [svColor]
      Color = 15204351
    end
    object cxStyleFontBlack: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleMalin: TcxStyle
      AssignedValues = [svColor]
      Color = 4194368
    end
    object cxStyleBorder: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveBorder
    end
    object cxStylemalinYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4194368
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15204351
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleGrid: TcxStyle
      AssignedValues = [svColor]
      Color = 10485760
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle4
      Styles.Content = cxStyle5
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Inactive = cxStyle13
      Styles.IncSearch = cxStyle14
      Styles.Selection = cxStyle17
      Styles.FilterBox = cxStyle8
      Styles.Footer = cxStyle9
      Styles.Group = cxStyle10
      Styles.GroupByBox = cxStyle11
      Styles.Header = cxStyle12
      Styles.Indicator = cxStyle15
      Styles.Preview = cxStyle16
      BuiltIn = True
    end
  end
  object DataSourceRas: TDataSource
    DataSet = RxMemoryDataRas
    Left = 453
    Top = 207
  end
  object Class_StoredProc: TpFIBStoredProc
    Database = fmAvanceOtchet.DatabaseMain
    Transaction = fmAvanceOtchet.TransactionRead
    Left = 149
    Top = 255
  end
  object Class_DataSet: TpFIBDataSet
    Database = fmAvanceOtchet.DatabaseMain
    Transaction = fmAvanceOtchet.TransactionRead
    Left = 117
    Top = 255
    poSQLINT64ToBCD = True
  end
  object Class_Transaction_Wr: TpFIBTransaction
    DefaultDatabase = fmAvanceOtchet.DatabaseMain
    TimeoutAction = TARollback
    Left = 277
    Top = 295
  end
  object PopupMenuRas: TPopupMenu
    Left = 325
    Top = 202
  end
  object RxError: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'Rxkod'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RxName'
        DataType = ftString
        Size = 255
      end>
    Left = 505
    Top = 418
  end
  object DataSetError: TpFIBDataSet
    Left = 329
    Top = 418
    poSQLINT64ToBCD = True
  end
  object DataSourceError: TDataSource
    DataSet = RxError
    Left = 449
    Top = 418
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = fmAvanceOtchet.DatabaseMain
    Transaction = fmAvanceOtchet.TransactionRead
    Left = 477
    Top = 266
    poSQLINT64ToBCD = True
  end
  object pFIBTransactionRead: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 189
    Top = 322
  end
  object ImageList1: TImageList
    Left = 89
    Top = 9
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000000000000000000094635A00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094635A00F7DE
      BD00F7DEB500F7DEAD00F7D6AD00F7D6A500EFD69C00EFCE9C00EFCE9400EFCE
      9400EFC68C00EFC68C009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C6B5A00F7E7
      C600004A0000F7DEB500F7DEB500841800008418000084180000841800008418
      000084180000EFC68C009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C6B6300F7E7
      CE00F7E7C600F7DEBD00F7DEB500F7DEB500F7D6AD00F7D6A500EFD6A500EFCE
      9C00EFCE9C00EFCE94009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004A0000004A0000004A
      0000004A0000004A0000004A0000004A0000004A0000004A0000004A0000004A
      0000004A0000004A0000004A0000004A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004A0000AD736300FFEF
      D600004A0000F7E7CE00F7E7C600841800008418000084180000841800008418
      000084180000F7CE9C009C6B6300004A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004A0000004A0000004A
      0000004A0000004A0000004A0000004A0000004A0000004A0000004A0000004A
      0000004A0000004A0000004A0000004A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B57B6B00FFF7
      E700FFEFDE00FFEFDE00F7EFD600F7E7CE00F7E7C600F7E7C600F7DEBD00F7DE
      B500F7DEB500F7D6AD009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD846B00ADA5
      9C0000310000ADA59400FFEFDE00841800008418000084180000841800008418
      000084180000F7DEB5009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A0000004A
      0000004A0000ADA59C00FFF7DE00FFEFDE00FFEFD600F7E7CE00F7E7CE00F7E7
      C600F7E7BD00F7DEB5009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A0000089C
      1800004A0000ADA59C00ADA59C00ADA59C00FFEFDE00FFEFD600F7E7CE00F7E7
      CE00F7E7C600F7DEBD009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004A0000004A0000004A000010AD
      2900004A0000004A0000004A00005A1000008418000084180000841800008418
      000084180000F7E7C6009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004A000031DE630029D6520021C6
      420018B5310010A52100004A0000ADA5A500FFF7E700FFF7E700FFEFDE00FFEF
      D600FFEFD600F7E7CE009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004A0000004A0000004A000029D6
      5A00004A0000004A0000004A0000FFFFF700FFF7EF00FFF7E700FFF7E700FFEF
      DE00FFEFDE00FFEFD6009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A000031DE
      6300004A00008C634200CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A0000004A
      0000004A00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00C001000000000000C001000000000000
      C001000000000000C00100000000000080000000000000008000000000000000
      8000000000000000C001000000000000C001000000000000C001000000000000
      C001000000000000000100000000000000010000000000000001000000000000
      C001000000000000C7FF00000000000000000000000000000000000000000000
      000000000000}
  end
  object Ds: TpFIBDataSet
    Left = 513
    Top = 184
    poSQLINT64ToBCD = True
  end
  object DataSetVed: TpFIBDataSet
    Left = 685
    Top = 306
    poSQLINT64ToBCD = True
  end
  object Query: TpFIBQuery
    Database = fmAvanceOtchet.DatabaseMain
    Transaction = fmAvanceOtchet.TransactionRead
    Left = 221
    Top = 258
  end
  object DataSetSch: TpFIBDataSet
    Left = 317
    Top = 258
    poSQLINT64ToBCD = True
  end
end
