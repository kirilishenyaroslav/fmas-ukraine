object frmHtmlReport: TfrmHtmlReport
  Left = 224
  Top = 148
  Width = 724
  Height = 503
  ActiveControl = BuReportsInfoGrid
  Caption = #1055#1086#1088#1110#1074#1085#1103#1083#1100#1085#1072' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072' '#1074#1072#1088#1110#1072#1085#1090#1110#1074' '#1073#1102#1076#1078#1077#1090#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 716
    Height = 469
    Align = alClient
    TabOrder = 0
    object TitlePanel: TPanel
      Left = 1
      Top = 38
      Width = 714
      Height = 44
      Align = alTop
      BevelOuter = bvNone
      BiDiMode = bdLeftToRight
      Color = clActiveBorder
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
    end
    object BuReportsInfoGrid: TcxGrid
      Left = 1
      Top = 82
      Width = 714
      Height = 386
      Align = alClient
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = cxcbsNone
      PopupMenu = ChengeWorkperiodMenu
      TabOrder = 1
      object ViewLevel0: TcxGridDBTableView
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHiding = True
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsCustomize.DataRowSizing = True
        OptionsCustomize.GroupRowSizing = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupRowHeight = 40
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheetHighContrastWhite
        Styles.ContentEven = cxStyle1
        Styles.ContentOdd = cxStyle1
        Styles.Group = cxStyle2
        Styles.Header = cxStyle14
        object ViewLevel0DBColumn2: TcxGridDBColumn
          Caption = #1043#1056#1059#1055#1048' '#1041#1070#1044#1046#1045#1058#1030#1042
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 326
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel0DBColumn2StylesGetContentStyle
          Width = 326
          DataBinding.FieldName = 'OBJECT_TITLE'
        end
        object ViewLevel0DBColumn3: TcxGridDBColumn
          Caption = #1042#1080#1082#1086#1085#1072#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1110#1074' '#1074' '#1075#1088#1091#1087#1087#1110
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 68
          Options.Filtering = False
          Width = 68
        end
        object ViewLevel0DBColumn5: TcxGridDBColumn
          Caption = #1042#1080#1082#1086#1085#1072#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1110#1074' '#1074' '#1075#1088#1091#1087#1087#1110'('#1091' '#1088#1086#1079#1088#1110#1079#1110' '#1073#1102#1076#1078#1077#1090#1110#1074')'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = ViewLevel0DBColumn5GetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
        end
        object ViewLevel0DBColumn4: TcxGridDBColumn
          Caption = #1055#1083#1072#1085#1086#1074#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080' ('#1091' '#1088#1086#1079#1088#1110#1079#1110' '#1073#1102#1076#1078#1077#1090#1110#1074')'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = ViewLevel0DBColumn4GetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 67
          Options.Filtering = False
          Width = 67
        end
        object ViewLevel0DBColumn1: TcxGridDBColumn
          Visible = False
          SortOrder = soAscending
          DataBinding.FieldName = 'SHOW_POSITION'
        end
        object OBJECT_TYPE_COL: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'OBJECT_TYPE'
        end
      end
      object ViewLevel1: TcxGridDBTableView
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnHiding = True
        OptionsCustomize.ColumnHorzSizing = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.NewItemRowSeparatorColor = clGradientActiveCaption
        Styles.StyleSheet = GridTableViewStyleSheetHighContrastWhite
        Styles.ContentEven = cxStyle3
        Styles.Group = cxStyle2
        Styles.Header = cxStyle14
        object ViewLevel1DBColumn1: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 100
          Options.Filtering = False
          Options.Sorting = False
          Width = 100
          DataBinding.FieldName = 'BU_KOD'
        end
        object ViewLevel1DBColumn2: TcxGridDBColumn
          Caption = #1041#1102#1076#1078#1077#1090
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 200
          Options.Filtering = False
          Options.Sorting = False
          Width = 200
          DataBinding.FieldName = 'BU_TITLE'
        end
        object ViewLevel1DBColumn9: TcxGridDBColumn
          Caption = #1044#1086#1093#1086#1076#1080
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 150
          Options.Filtering = False
          Options.Sorting = False
          Styles.OnGetContentStyle = ViewLevel1DBColumn9StylesGetContentStyle
          Width = 150
          DataBinding.FieldName = 'DOXOD'
        end
        object ViewLevel1DBColumn10: TcxGridDBColumn
          Caption = #1042#1080#1076#1072#1090#1082#1080
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 150
          Options.Filtering = False
          Options.Sorting = False
          Styles.OnGetContentStyle = ViewLevel1DBColumn10StylesGetContentStyle
          Width = 150
          DataBinding.FieldName = 'RASXOD'
        end
        object ViewLevel1DBColumn3: TcxGridDBColumn
          Caption = #1047#1072#1083#1080#1096#1086#1082' '#1075#1088#1086#1096#1086#1074#1080#1093' '#1082#1086#1096#1090#1110#1074
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 150
          Options.Filtering = False
          Options.Sorting = False
          Width = 150
          DataBinding.FieldName = 'REST'
        end
        object ViewLevel1DBColumn4: TcxGridDBColumn
          Caption = #1047#1072#1083#1080#1096#1086#1082' '#1079' '#1091#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084' '#1082#1088'/'#1076#1073' '#1079#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1086#1089#1090#1110
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 165
          Options.Filtering = False
          Options.Sorting = False
          Width = 165
          DataBinding.FieldName = 'REST_WITH_CREDIT'
        end
        object ViewLevel1DBColumn5: TcxGridDBColumn
          Caption = 
            #1047#1072#1083#1080#1096#1086#1082' '#1079' '#1091#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084' '#1089#1092#1086#1088#1084#1086#1074#1072#1085#1080#1093' '#1090#1072' '#1085#1077#1086#1073#1088#1086#1073#1083#1077#1085#1080#1093' '#1087#1083#1072#1090#1110#1078#1085#1080#1093' '#1076#1086#1088#1091 +
            #1095#1077#1085#1100' '#1076#1083#1103' '#1086#1087#1083#1072#1090#1080' '#1079#1072' '#1086#1089#1090#1072#1085#1085#1110' 30 '#1076#1110#1073
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 150
          Options.Editing = False
          Options.Filtering = False
          Options.Sorting = False
          Styles.Header = cxStyle24
          Width = 150
          DataBinding.FieldName = 'REST_WITH_PL_DOCS'
        end
        object ViewLevel1DBColumn6: TcxGridDBColumn
          Caption = 
            #1057#1091#1084#1072' '#1089#1092#1086#1088#1084#1086#1074#1072#1085#1080#1093' '#1090#1072' '#1085#1077#1086#1073#1088#1086#1073#1083#1077#1085#1080#1093' '#1087#1083#1072#1090#1110#1078#1085#1080#1093' '#1076#1086#1088#1091#1095#1077#1085#1100' '#1076#1083#1103' '#1086#1087#1083#1072#1090#1080' '#1079 +
            #1072' '#1086#1089#1090#1072#1085#1085#1110' 30 '#1076#1110#1073
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 150
          Options.Editing = False
          Options.Filtering = False
          Options.Sorting = False
          Styles.Header = cxStyle24
          Width = 150
          DataBinding.FieldName = 'SUM_PL_DOCS'
        end
        object ViewLevel1DBColumn7: TcxGridDBColumn
          Caption = #1052'(K)'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 50
          Options.Editing = False
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 50
        end
        object ViewLevel1DBColumn8: TcxGridDBColumn
          Caption = 'M('#1060')'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          MinWidth = 55
          Options.Filtering = False
          Options.Sorting = False
          Width = 55
        end
        object ViewLevel1DBColumn11: TcxGridDBColumn
          PropertiesClassName = 'TcxCalcEditProperties'
          Visible = False
          MinWidth = 64
          SortOrder = soAscending
          DataBinding.FieldName = 'SMETA_KOD_INT'
        end
      end
      object ViewLevel2: TcxGridDBBandedTableView
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'PLAN_VALUE_FC'
            Column = PLAN_VALUE
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'BU_FINANCE_FACT_FC'
            Column = BU_FINANCE_FACT
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'BU_KASSA_FACT_FC'
            Column = BU_KASSA_FACT
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'BU_DEBIT_Z_FC'
            Column = BU_DEBIT_Z
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'BU_KREDIT_Z_FC'
            Column = BU_KREDIT_Z
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'DIFF_FROM_PLAN_FC'
            Column = DIFF_FROM_PLAN
          end>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        Styles.StyleSheet = GridBandedTableViewStyleSheetHighContrastWhite
        Styles.ContentEven = cxStyle13
        Styles.ContentOdd = cxStyle13
        Styles.Footer = cxStyle14
        Styles.Group = cxStyle14
        Styles.Header = cxStyle14
        Styles.BandHeader = cxStyle14
        Bands = <
          item
            Caption = #1056#1086#1079#1076#1110#1083'/'#1089#1090#1072#1090#1090#1103
            Width = 278
          end
          item
            Caption = #1055#1083#1072#1085
            Width = 110
          end
          item
            Caption = #1042#1080#1082#1086#1085#1072#1085#1085#1103
            Width = 121
          end
          item
            Caption = #1047#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1110#1089#1090#1100
            Width = 208
          end
          item
            Caption = #1042#1110#1076#1093#1080#1083#1077#1085#1085#1103
            Width = 103
          end
          item
            Visible = False
          end
          item
            Caption = #1057#1080#1089#1090#1077#1084#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
            Visible = False
          end>
        object PLAN_VALUE: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 83
          Options.Filtering = False
          Width = 83
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'PLAN_VALUE'
          IsCaptionAssigned = True
        end
        object BU_KASSA_FACT: TcxGridDBBandedColumn
          Caption = #1059#1087#1088#1072#1074#1083#1110#1085#1089#1100#1082#1080#1081
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 99
          Options.Filtering = False
          Width = 99
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KASSA_FACT'
        end
        object BU_FINANCE_FACT: TcxGridDBBandedColumn
          Caption = #1060#1110#1085#1072#1085#1089#1086#1074#1080#1081
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 93
          Options.Filtering = False
          Width = 93
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_FINANCE_FACT'
        end
        object BU_DEBIT_Z: TcxGridDBBandedColumn
          Caption = #1044#1077#1073#1110#1090#1086#1088#1089#1100#1082#1072
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 72
          Options.Filtering = False
          Width = 72
          Position.BandIndex = 3
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_DEBIT_Z'
        end
        object BU_KREDIT_Z: TcxGridDBBandedColumn
          Caption = #1050#1088#1077#1076#1080#1090#1086#1088#1089#1100#1082#1072
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 58
          Options.Filtering = False
          Width = 58
          Position.BandIndex = 3
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KREDIT_Z'
        end
        object DIFF_FROM_PLAN: TcxGridDBBandedColumn
          Caption = #1074#1110#1076' '#1087#1083#1072#1085#1091
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 101
          Options.Filtering = False
          Width = 101
          Position.BandIndex = 4
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'DIFF_FROM_PLAN'
        end
        object SHOW_TITLE: TcxGridDBBandedColumn
          Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 64
          Options.Filtering = False
          Options.Sorting = False
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'SHOW_TITLE'
        end
        object ViewLevel2DBBandedColumn1: TcxGridDBBandedColumn
          Caption = #1053#1086#1084#1077#1088' '#1087#1086#1082#1072#1079#1085#1080#1082#1072' '#1091' '#1079#1074#1110#1090#1110
          PropertiesClassName = 'TcxTextEditProperties'
          MinWidth = 64
          Options.Editing = False
          Options.Filtering = False
          Options.HorzSizing = False
          Options.VertSizing = False
          SortOrder = soAscending
          Position.BandIndex = 5
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object PROFIT_FLAG_TITLE: TcxGridDBBandedColumn
          Caption = #1044#1086#1093#1086#1076#1085#1110#1089#1090#1100' '#1087#1086#1082#1072#1079#1085#1080#1082#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          GroupIndex = 0
          SortOrder = soDescending
          Position.BandIndex = 6
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'PROFIT_FLAG_TITLE'
        end
        object PLAN_VALUE_FC: TcxGridDBBandedColumn
          Caption = #1055#1083#1072#1085#1086#1074#1077' '#1079#1085#1072#1095#1077#1085#1085#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Position.BandIndex = 6
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'PLAN_VALUE_FC'
        end
        object BU_KASSA_FACT_FC: TcxGridDBBandedColumn
          Caption = #1059#1087#1088#1072#1074#1083#1110#1085#1089#1100#1082#1080#1081' '#1086#1073#1083#1110#1082
          PropertiesClassName = 'TcxTextEditProperties'
          Position.BandIndex = 6
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KASSA_FACT_FC'
        end
        object BU_FINANCE_FACT_FC: TcxGridDBBandedColumn
          Caption = #1060#1110#1085#1072#1085#1089#1086#1074#1080#1081' '#1086#1073#1083#1110#1082
          PropertiesClassName = 'TcxTextEditProperties'
          Position.BandIndex = 6
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_FINANCE_FACT_FC'
        end
        object BU_DEBIT_Z_FC: TcxGridDBBandedColumn
          Caption = #1044#1077#1073#1110#1090#1086#1088#1089#1100#1082#1072' '#1079#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1110#1089#1090#1100
          PropertiesClassName = 'TcxTextEditProperties'
          Position.BandIndex = 6
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_DEBIT_Z_FC'
        end
        object BU_KREDIT_Z_FC: TcxGridDBBandedColumn
          Caption = #1050#1088#1077#1076#1080#1090#1086#1088#1089#1100#1082#1072' '#1079#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1110#1089#1090#1100
          PropertiesClassName = 'TcxTextEditProperties'
          Position.BandIndex = 6
          Position.ColIndex = 5
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KREDIT_Z_FC'
        end
        object DIFF_FROM_PLAN_FC: TcxGridDBBandedColumn
          Caption = #1042#1110#1076#1093#1080#1083#1077#1085#1085#1103' '#1074#1110#1076' '#1087#1083#1072#1085#1091
          PropertiesClassName = 'TcxTextEditProperties'
          Position.BandIndex = 6
          Position.ColIndex = 6
          Position.RowIndex = 0
          DataBinding.FieldName = 'DIFF_FROM_PLAN_FC'
        end
        object TYPE_OBJ: TcxGridDBBandedColumn
          Caption = #1058#1080#1087' '
          PropertiesClassName = 'TcxTextEditProperties'
          Position.BandIndex = 6
          Position.ColIndex = 7
          Position.RowIndex = 0
          DataBinding.FieldName = 'OBJECT_TYPE'
        end
      end
      object ViewLevel3: TcxGridDBBandedTableView
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'PLAN_VALUE_FC'
            Column = ViewLevel3DBBandedColumn2
          end>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnVertSizing = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridBandedTableViewStyleSheetHighContrastWhite
        Styles.Content = cxStyle12
        Styles.ContentEven = cxStyle12
        Styles.ContentOdd = cxStyle12
        Bands = <
          item
            Caption = #1047#1074#1110#1090' '#1087#1086' '#1075#1088#1091#1087#1087#1110' '#1073#1102#1076#1078#1077#1090#1110#1074
            FixedKind = fkLeft
            Width = 456
          end
          item
            Caption = #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1087#1086' '#1073#1102#1076#1078#1077#1090#1072#1084' '#1074' '#1075#1088#1091#1087#1110
            Width = 566
          end>
        object ViewLevel3DBBandedColumn4: TcxGridDBBandedColumn
          Visible = False
          GroupIndex = 0
          Options.Filtering = False
          SortOrder = soDescending
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'PROFIT_FLAG_TITLE_EX'
          IsCaptionAssigned = True
        end
        object ViewLevel3DBBandedColumn1: TcxGridDBBandedColumn
          Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1073#1102#1076#1078#1077#1090#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 314
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'SHOW_TITLE'
        end
        object ViewLevel3DBBandedColumn2: TcxGridDBBandedColumn
          Caption = #1047#1072#1075#1072#1083#1100#1085#1080#1081' '#1087#1083#1072#1085
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 125
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'PLAN_VALUE'
        end
        object ViewLevel3DBBandedColumn5: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'IS_DETAIL'
        end
        object ViewLevel3DBBandedColumn3: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'PLAN_VALUE_FC'
        end
      end
      object ViewLevel4: TcxGridDBBandedTableView
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'PLAN_VALUE_FC'
            Column = PLAN_VALUE_COLUMN
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'BU_KASSA_FACT_FC'
            Column = BU_KASSA_FACT_COLUMN
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'DIFF_FROM_PLAN_FC'
            Column = DIFF_FROM_PLAN_COLUMN
          end>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.InvertSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        Styles.StyleSheet = GridBandedTableViewStyleSheetHighContrastWhite
        Styles.Content = cxStyle12
        Styles.ContentEven = cxStyle12
        Styles.ContentOdd = cxStyle12
        Styles.Footer = cxStyle14
        Styles.Group = cxStyle14
        Styles.Header = cxStyle14
        Styles.BandHeader = cxStyle14
        Bands = <
          item
            Caption = #1056#1086#1079#1076#1110#1083'/'#1089#1090#1072#1090#1090#1103
            Width = 369
          end
          item
            Caption = #1055#1083#1072#1085
            Width = 134
          end
          item
            Caption = #1042#1080#1082#1086#1085#1072#1085#1085#1103
            Width = 139
          end
          item
            Caption = #1047#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1110#1089#1090#1100
            Width = 130
          end
          item
            Caption = #1042#1110#1076#1093#1080#1083#1077#1085#1085#1103
            Width = 134
          end
          item
            Caption = 'system'
            Visible = False
          end>
        object ViewLevel4DBBandedColumn1: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          GroupIndex = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          SortOrder = soDescending
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'PROFIT_FLAG_TITLE_EX'
          IsCaptionAssigned = True
        end
        object ViewLevel4DBBandedColumn3: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel4DBBandedColumn3StylesGetContentStyle
          Width = 124
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'SHOW_TITLE'
          IsCaptionAssigned = True
        end
        object PLAN_VALUE_COLUMN: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 139
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'PLAN_VALUE'
          IsCaptionAssigned = True
        end
        object BU_KASSA_FACT_COLUMN: TcxGridDBBandedColumn
          Caption = #1059#1087#1088#1072#1074#1083#1110#1085#1089#1100#1082#1080#1081
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 66
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KASSA_FACT'
        end
        object ViewLevel4DBBandedColumn6: TcxGridDBBandedColumn
          Caption = #1060#1110#1085#1072#1085#1089#1086#1074#1080#1081
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 79
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'FACT_FINANCE'
        end
        object ViewLevel4DBBandedColumn7: TcxGridDBBandedColumn
          Caption = #1044#1077#1073#1110#1090#1086#1088#1089#1100#1082#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 96
          Position.BandIndex = 3
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'Z_DEBIT'
        end
        object BU_KREDIT_Z_COLUMN: TcxGridDBBandedColumn
          Caption = #1050#1088#1077#1076#1080#1090#1086#1088#1089#1100#1082#1072
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 98
          Position.BandIndex = 3
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KREDIT_Z'
        end
        object DIFF_FROM_PLAN_COLUMN: TcxGridDBBandedColumn
          Caption = #1074#1110#1076' '#1087#1083#1072#1085#1091
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 82
          Position.BandIndex = 4
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'DIFF_FROM_PLAN'
        end
        object ViewLevel4DBBandedColumn2: TcxGridDBBandedColumn
          Options.Filtering = False
          SortOrder = soAscending
          Position.BandIndex = 5
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'SHOW_POSITION'
        end
        object ViewLevel4DBBandedColumn10: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'IS_DETAIL'
        end
        object PLAN_FC: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'PLAN_VALUE_FC'
        end
        object KASSA_FC: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KASSA_FACT_FC'
        end
        object DIFF_FC: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
          DataBinding.FieldName = 'DIFF_FROM_PLAN_FC'
        end
      end
      object ViewLevelMonth: TcxGridDBBandedTableView
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'BU_KASSA_FACT_FC'
            Column = BU_KASSA_FACT_
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'DIFF_FROM_PLAN'
            Column = DIFF_FROM_PLAN_
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'PLAN_VALUE_FC'
            Column = PLAN_VALUE_
          end>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridBandedTableViewStyleSheetHighContrastWhite
        Styles.Content = ST_STYLE
        Styles.ContentEven = ST_STYLE
        Styles.ContentOdd = ST_STYLE
        Styles.Inactive = cxStyle20
        Styles.Selection = cxStyle23
        Styles.Footer = cxStyle14
        Styles.Group = cxStyle14
        Styles.GroupByBox = cxStyle18
        Styles.Header = cxStyle14
        Styles.Indicator = cxStyle21
        Styles.Preview = cxStyle22
        Styles.BandHeader = cxStyle14
        Bands = <
          item
            Caption = #1056#1086#1079#1076#1110#1083'/'#1089#1090#1072#1090#1090#1103
            FixedKind = fkLeft
            Width = 341
          end
          item
            HeaderAlignmentHorz = taLeftJustify
            Caption = #1060#1072#1082#1090#1080#1095#1085#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080' '#1091#1087#1088#1072#1074#1083#1110#1085#1089#1100#1082#1086#1075#1086' '#1086#1073#1083#1110#1082#1091
            Styles.Content = ST_STYLE
            Width = 1101
          end
          item
            Caption = #1030#1090#1086#1075#1086#1074#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080
            FixedKind = fkRight
            Width = 180
          end>
        object OBJECT_TYPE: TcxGridDBBandedColumn
          Caption = #1058#1080#1087
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'OBJECT_TYPE'
        end
        object SHOW_TITLE_: TcxGridDBBandedColumn
          Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 196
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'SHOW_TITLE'
        end
        object PLAN_VALUE_: TcxGridDBBandedColumn
          Caption = #1055#1083#1072#1085
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 97
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'PLAN_VALUE'
        end
        object BU_KASSA_FACT_: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1072' '#1074#1080#1082#1086#1085#1072#1085#1085#1103
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KASSA_FACT'
        end
        object DIFF_FROM_PLAN_: TcxGridDBBandedColumn
          Caption = #1042#1110#1076#1093#1080#1083#1077#1085#1085#1103' '#1074#1110#1076' '#1087#1083#1072#1085#1091
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'DIFF_FROM_PLAN'
        end
        object PROFIT_FLAG_TITLE_EX_: TcxGridDBBandedColumn
          Visible = False
          GroupIndex = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortOrder = soDescending
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'PROFIT_FLAG_TITLE_EX'
          IsCaptionAssigned = True
        end
        object PLAN_VALUE_FC_: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'PLAN_VALUE_FC'
        end
        object BU_KASSA_FACT_FC_: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KASSA_FACT_FC'
        end
        object DIFF_FROM_PLAN_FC_: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 0
          DataBinding.FieldName = 'DIFF_FROM_PLAN_FC'
        end
      end
      object PLReestrView: TcxGridDBBandedTableView
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = PLReestrViewDBBandedColumn2
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridBandedTableViewStyleSheetHighContrastWhite
        Bands = <
          item
            Caption = #1056#1077#1082#1074#1110#1079#1080#1090#1080' '#1087#1083#1072#1090#1110#1078#1085#1086#1075#1086' '#1076#1086#1088#1091#1095#1077#1085#1085#1103
            Width = 559
          end
          item
            Caption = #1044#1086#1087#1086#1084#1110#1078#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
            Width = 181
          end>
        object PLReestrViewDBBandedColumn1: TcxGridDBBandedColumn
          Caption = #1053#1086#1084#1077#1088', '#1076#1072#1090#1072' '#1087#1083#1072#1090#1110#1078#1085#1086#1075#1086' '#1076#1086#1088#1091#1095#1077#1085#1085#1103
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 130
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'D_ATTR'
        end
        object PLReestrViewDBBandedColumn2: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 99
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'SUMMA'
        end
        object PLReestrViewDBBandedColumn4: TcxGridDBBandedColumn
          Caption = #1055#1110#1076#1089#1090#1072#1074#1072' '#1087#1083#1072#1090#1077#1078#1091
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 200
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'NOTE'
        end
        object PLReestrViewDBBandedColumn5: TcxGridDBBandedColumn
          Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 97
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'USER_FIO'
        end
        object PLReestrViewDBBandedColumn6: TcxGridDBBandedColumn
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1090#1074#1086#1088#1077#1085#1086
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          SortOrder = soAscending
          Width = 104
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'ADD_TIME'
        end
        object PLReestrViewDBBandedColumn3: TcxGridDBBandedColumn
          Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 105
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'NAME_CUSTOMER'
        end
        object PLReestrViewDBBandedColumn7: TcxGridDBBandedColumn
          Caption = #1052#1060#1054', '#1056'/'#1057
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 85
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'B_ATTR'
        end
      end
      object ViewLevel8: TcxGridDBBandedTableView
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'BU_KASSA_FACT_FC'
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'FACT_FINANCE_FC'
          end>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridBandedTableViewStyleSheetHighContrastWhite
        Styles.Content = cxStyle12
        Styles.ContentEven = cxStyle12
        Styles.ContentOdd = cxStyle12
        Bands = <
          item
            Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1073#1102#1076#1078#1077#1090#1091
            Width = 254
          end
          item
            Caption = #1042#1072#1088#1110#1072#1085#1090#1080' '#1073#1102#1076#1078#1077#1090#1091
            Width = 579
          end>
        object ViewLevel8DBBandedColumn1: TcxGridDBBandedColumn
          Caption = #1044#1086#1093#1086#1076#1085#1110#1089#1090#1100
          Visible = False
          GroupIndex = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          SortOrder = soDescending
          Styles.OnGetContentStyle = ViewLevel8DBBandedColumn1StylesGetContentStyle
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'PROFIT_FLAG_TITLE_EX'
        end
        object ViewLevel8DBBandedColumn2: TcxGridDBBandedColumn
          Caption = #1056#1086#1079#1076#1110#1083'/'#1089#1090#1072#1090#1090#1103
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel8DBBandedColumn2StylesGetContentStyle
          Width = 215
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'SHOW_TITLE'
        end
        object ViewLevel8DBBandedColumn5: TcxGridDBBandedColumn
          Caption = #1057#1090#1080#1083#1100
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel8DBBandedColumn5StylesGetContentStyle
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'IS_DETAIL'
        end
      end
      object SmGroupV_Detail: TcxGridLevel
        GridView = ViewLevel8
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 714
      Height = 37
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object cxButton1: TcxButton
        Left = 224
        Top = 0
        Width = 73
        Height = 36
        Caption = #1042#1080#1093#1110#1076
        TabOrder = 0
      end
      object cxButton2: TcxButton
        Left = 1
        Top = 0
        Width = 73
        Height = 36
        Caption = #1054#1085#1086#1074#1080#1090#1080
        ModalResult = 1
        TabOrder = 1
        Layout = blGlyphBottom
        UseSystemPaint = False
      end
      object PrintButton: TcxButton
        Left = 149
        Top = 0
        Width = 75
        Height = 36
        Caption = #1040#1085#1072#1083#1110#1079
        ModalResult = 1
        TabOrder = 2
        OnClick = PrintButtonClick
        Layout = blGlyphBottom
        UseSystemPaint = False
      end
      object cxButton11: TcxButton
        Left = 74
        Top = 0
        Width = 75
        Height = 36
        Caption = #1045#1082#1089#1087#1086#1088#1090
        TabOrder = 3
        DropDownMenu = ExportPopupMenu
        Kind = cxbkDropDownButton
        Layout = blGlyphBottom
        UseSystemPaint = False
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 585
    Top = 64
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsItalic]
      TextColor = clBlack
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15658734
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clSilver
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnHighlight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = cl3DLight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15658734
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clSilver
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = cl3DLight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object RAZD_STYLE: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = cl3DLight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
    end
    object ST_STYLE: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsItalic]
    end
    object SM_STYLE: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = cl3DLight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clInfoText
    end
    object RED_SUM_STYLE: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15658734
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object RAZD_STYLE_RED: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = cl3DLight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      TextColor = clRed
    end
    object ST_STYLE_RED: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsItalic]
      TextColor = clRed
    end
    object SM_STYLE_RED: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = cl3DLight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = cl3DLight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNone
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBtnText
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10841658
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10841658
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle49: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle50: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle51: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle52: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10841658
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle53: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle54: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle55: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle56: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle57: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle58: TcxStyle
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    object GridTableViewStyleSheetHighContrastWhite: TcxGridTableViewStyleSheet
      Caption = 'High Contrast White'
      Styles.Content = cxStyle1
      Styles.ContentEven = cxStyle2
      Styles.ContentOdd = cxStyle3
      Styles.Inactive = cxStyle8
      Styles.Selection = cxStyle11
      Styles.Footer = cxStyle4
      Styles.Group = cxStyle5
      Styles.GroupByBox = cxStyle6
      Styles.Header = cxStyle7
      Styles.Indicator = cxStyle9
      Styles.Preview = cxStyle10
      BuiltIn = True
    end
    object GridBandedTableViewStyleSheetHighContrastWhite: TcxGridBandedTableViewStyleSheet
      Caption = 'High Contrast White'
      Styles.Content = cxStyle13
      Styles.ContentEven = cxStyle14
      Styles.ContentOdd = cxStyle15
      Styles.Inactive = cxStyle20
      Styles.Selection = cxStyle23
      Styles.Footer = cxStyle16
      Styles.Group = cxStyle17
      Styles.GroupByBox = cxStyle18
      Styles.Header = cxStyle19
      Styles.Indicator = cxStyle21
      Styles.Preview = cxStyle22
      Styles.BandHeader = cxStyle12
      BuiltIn = True
    end
    object GridTableViewStyleSheetWindowsClassic: TcxGridTableViewStyleSheet
      Caption = 'Windows Classic'
      Styles.Content = cxStyle25
      Styles.ContentEven = cxStyle26
      Styles.ContentOdd = cxStyle27
      Styles.Inactive = cxStyle32
      Styles.Selection = cxStyle35
      Styles.Footer = cxStyle28
      Styles.Group = cxStyle29
      Styles.GroupByBox = cxStyle30
      Styles.Header = cxStyle31
      Styles.Indicator = cxStyle33
      Styles.Preview = cxStyle34
      BuiltIn = True
    end
    object cxGridTableViewStyleSheet2: TcxGridTableViewStyleSheet
      Caption = 'Windows Classic'
      Styles.Content = cxStyle36
      Styles.ContentEven = cxStyle37
      Styles.ContentOdd = cxStyle38
      Styles.Inactive = cxStyle43
      Styles.Selection = cxStyle46
      Styles.Footer = cxStyle39
      Styles.Group = cxStyle40
      Styles.GroupByBox = cxStyle41
      Styles.Header = cxStyle42
      Styles.Indicator = cxStyle44
      Styles.Preview = cxStyle45
      BuiltIn = True
    end
    object cxGridTableViewStyleSheet3: TcxGridTableViewStyleSheet
      Caption = 'Windows Classic'
      Styles.Content = cxStyle47
      Styles.ContentEven = cxStyle48
      Styles.ContentOdd = cxStyle49
      Styles.Inactive = cxStyle54
      Styles.Selection = cxStyle57
      Styles.Footer = cxStyle50
      Styles.Group = cxStyle51
      Styles.GroupByBox = cxStyle52
      Styles.Header = cxStyle53
      Styles.Indicator = cxStyle55
      Styles.Preview = cxStyle56
      BuiltIn = True
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 392
  end
  object DataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 80
    Top = 392
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 48
    Top = 392
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 112
    Top = 392
  end
  object ExportPopupMenu: TPopupMenu
    Left = 40
    Top = 64
    object HTML1: TMenuItem
      Caption = #1044#1086' HTML '#1092#1086#1088#1084#1072#1090#1091
    end
    object Excelajhvfne1: TMenuItem
      Caption = #1044#1086' Excel '#1092#1086#1088#1084#1072#1090#1091
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 8
    Top = 64
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbPageSetup]
    PreviewOptions.ShowCaptions = True
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38554.649386689800000000
    ReportOptions.LastChange = 38792.453403692130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo4OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'end;'
      ''
      'procedure Memo1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '     if (<DBDataset."PLAN_VALUE"><0)'
      '     then Memo4.Font.Color:=clRed'
      '     else Memo4.Font.Color:=clBlack;'
      ''
      '     if (<DBDataset."BU_KASSA_FACT"><0)'
      '     then Memo9.Font.Color:=clRed'
      '     else Memo9.Font.Color:=clBlack;'
      ''
      '     if (<DBDataset."OBJECT_TYPE">=1)'
      '     then begin'
      ''
      '               Memo1.Color:=$00E4E4E4;'
      '               Memo4.Color:=$00E4E4E4;'
      '               Memo9.Color:=$00E4E4E4;'
      '     end;'
      '     if (<DBDataset."OBJECT_TYPE">=2)'
      '     then begin'
      '               Memo1.Color:=$00E4E4E4;'
      '               Memo4.Color:=$00E4E4E4;'
      '               Memo9.Color:=$00E4E4E4;'
      '     end;'
      '     if (<DBDataset."OBJECT_TYPE">=0)'
      '     then begin'
      '               Memo1.Color:=clWindow;'
      '               Memo4.Color:=clWindow;'
      '               Memo9.Color:=clWindow;'
      '     end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 73
    Top = 67
    Datasets = <
      item
        DataSet = DBDataset
        DataSetName = 'DBDataset'
      end
      item
        DataSet = PlanRestDataset
        DataSetName = 'PlanRestDataset'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 113.385900000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 192.756030000000000000
          Top = 34.015770000000000000
          Width = 366.614410000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1082#1086#1085#1072#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1091'('#1060#1110#1085#1072#1085#1089#1086#1074#1080#1081' '#1086#1073#1083#1110#1082')')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 60.472480000000000000
          Width = 718.110700000000000000
          Height = 52.913420000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          HAlign = haCenter
          Memo.Strings = (
            '[TITLE]')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 105.826840000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[DATE]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1088#1091#1082#1091)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        DataSet = DBDataset
        DataSetName = 'DBDataset'
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 544.252320000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."SHOW_TITLE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 544.251939210000000000
          Width = 83.149577010000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."PLAN_VALUE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 627.401980000000000000
          Width = 90.708637010000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."BU_FINANCE_FACT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 37.795300000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        Condition = 'DBDataset."PROFIT_FLAG"'
        KeepChild = True
        KeepTogether = True
        OutlineText = 'DBDataset."PROFIT_FLAG"'
        object Memo2: TfrxMemoView
          Width = 544.252320000000000000
          Height = 37.795300000000000000
          AllowHTMLTags = True
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."PROFIT_FLAG_TITLE_EX"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 544.252320000000000000
          Width = 83.149660000000000000
          Height = 37.795300000000000000
          AllowHTMLTags = True
          Color = 14211288
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 627.402360790000000000
          Width = 90.708720000000000000
          Height = 37.795300000000000000
          AllowHTMLTags = True
          Color = 14211288
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 37.795300000000000000
        Top = 434.645950000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Left = 578.268090000000000000
          Top = 7.559060000000045000
          Width = 136.063080000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[Page]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = -0.000000000000000444
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559059999999988000
          Width = 570.709030000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1089#1092#1086#1088#1084#1086#1074#1072#1085#1086' [date]'
            #1089#1090#1072#1085' '#1073#1102#1076#1078#1077#1090#1091' [date_data]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 37.795300000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        RowCount = 1
        Stretched = True
        object Memo13: TfrxMemoView
          Width = 544.252320000000000000
          Height = 37.795300000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1076#1110#1083'/'#1089#1090#1072#1090#1090#1103' '#1073#1102#1076#1078#1077#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 544.251939210000000000
          Width = 83.149577010000000000
          Height = 37.795300000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1083#1072#1085#1086#1074#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 627.401980000000000000
          Width = 90.708637010000000000
          Height = 37.795300000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1110#1085#1072#1085#1089#1086#1074#1080#1081' '
            #1086#1073#1083#1110#1082)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 544.252320000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -12
          Highlight.Font.Name = 'Times New Roman'
          Highlight.Font.Style = []
          Highlight.Color = clSilver
          Highlight.Condition = 'Value<0'
          Memo.Strings = (
            '[SUM(<DBDataset."PLAN_VALUE_FC">,MasterData1)]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 627.401980000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -12
          Highlight.Font.Name = 'Times New Roman'
          Highlight.Font.Style = []
          Highlight.Color = clSilver
          Highlight.Condition = 'Value<0'
          Memo.Strings = (
            '[SUM(<DBDataset."BU_FINANCE_FACT_FC">,MasterData1)]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Width = 544.252320000001000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."PROFIT_FLAG_TITLE"]:')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object DBDataset: TfrxDBDataset
    UserName = 'DBDataset'
    CloseDataSource = False
    DataSet = DataSet
    Left = 105
    Top = 67
  end
  object PlanRestsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 16
    Top = 424
    poSQLINT64ToBCD = True
  end
  object PlanRestDataset: TfrxDBDataset
    UserName = 'PlanRestDataset'
    CloseDataSource = False
    DataSet = PlanRestsDataSet
    Left = 137
    Top = 67
  end
  object RestDataSource: TDataSource
    DataSet = PlanRestsDataSet
    Left = 49
    Top = 424
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    ShowProgress = True
    Left = 617
    Top = 62
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 649
    Top = 62
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 753
    Top = 46
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 785
    Top = 46
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 721
    Top = 6
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    Left = 753
    Top = 6
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 785
    Top = 6
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    Left = 817
    Top = 6
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 849
    Top = 6
  end
  object RowDataSet: TfrxUserDataSet
    RangeEnd = reCount
    UserName = 'RowDataSet'
    Left = 88
    Top = 160
  end
  object ColDataSet: TfrxUserDataSet
    RangeEnd = reCount
    UserName = 'ColDataSet'
    Left = 120
    Top = 160
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 8
    Top = 168
  end
  object PrintPopupMenu: TPopupMenu
    Left = 8
    Top = 200
    object N1: TMenuItem
      Caption = #1050#1072#1089#1086#1074#1080#1081' '#1086#1073#1083#1110#1082
    end
    object N2: TMenuItem
      Caption = #1060#1110#1085#1072#1085#1089#1086#1074#1080#1081' '#1086#1073#1083#1110#1082
    end
  end
  object FPlanRestsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 80
    Top = 424
    poSQLINT64ToBCD = True
  end
  object FRestDataSource: TDataSource
    DataSet = FPlanRestsDataSet
    Left = 113
    Top = 424
  end
  object ChengeWorkperiodMenu: TPopupMenu
    Left = 88
    Top = 200
    object N3: TMenuItem
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1088#1086#1073#1086#1095#1080#1081' '#1087#1077#1088#1110#1086#1076' '#1076#1083#1103' '#1079#1074#1110#1090#1091
      OnClick = N3Click
    end
  end
end
