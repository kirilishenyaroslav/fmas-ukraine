object fmErrorDocsProvs: TfmErrorDocsProvs
  Left = 352
  Top = 239
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072' '#1086#1096#1080#1073#1086#1082' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084
  ClientHeight = 371
  ClientWidth = 590
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShortCut = FormShortCut
  PixelsPerInch = 96
  TextHeight = 13
  object btnExit: TcxButton
    Left = 515
    Top = 344
    Width = 75
    Height = 25
    Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1086#1085#1086' - <Esc>'
    Caption = #1042#1099#1093#1086#1076
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Colors.Default = 16247513
    Colors.Normal = clBtnFace
    Colors.Hot = 16247513
    Colors.Pressed = 11184895
  end
  object grErrorDocsProvs: TcxGrid
    Left = 0
    Top = 0
    Width = 590
    Height = 337
    Align = alTop
    TabOrder = 1
    object tvwDocs: TcxGridDBBandedTableView
      DataController.DataSource = dsrDocs
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'OUT_KEY_SESSION'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#0.00'
          Kind = skSum
          FieldName = 'OUT_SUMMA'
          Column = cmnSUMMA_DOC
        end
        item
          Kind = skCount
          FieldName = 'OUT_NUM_DOC'
          Column = cmnNUM_DOC
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnVertSizing = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.CellEndEllipsis = True
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderEndEllipsis = True
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 10
      OptionsView.BandHeaderEndEllipsis = True
      Styles.Background = dmdDataModul.cxBackground
      Styles.Content = dmdDataModul.cxsContent
      Styles.ContentEven = dmdDataModul.cxsContentEvent
      Styles.ContentOdd = dmdDataModul.cxsContentOdd
      Styles.Inactive = dmdDataModul.cxsInactive
      Styles.Selection = dmdDataModul.cxsSelection
      Styles.Footer = dmdDataModul.cxsFooter
      Styles.GroupByBox = dmdDataModul.cxsGroupByBox
      Styles.Header = dmdDataModul.cxsColumnHeader
      Styles.Indicator = dmdDataModul.cxsIndicator
      Styles.BandHeader = dmdDataModul.cxsHeader
      Bands = <
        item
          Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
          Options.HoldOwnColumnsOnly = True
        end>
      object cmnNUM_DOC: TcxGridDBBandedColumn
        Caption = #8470
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 40
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        SortOrder = soAscending
        Width = 70
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_NUM_DOC'
      end
      object cmnDATE_DOC: TcxGridDBBandedColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 90
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 120
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_DATE_DOC'
      end
      object cmnSUMMA_DOC: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1084#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 90
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 120
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_SUMMA'
      end
      object cmnNOTE: TcxGridDBBandedColumn
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 50
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 300
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_NOTE'
      end
      object cmnERROR_MSG_DOC: TcxGridDBBandedColumn
        Caption = #1054#1096#1080#1073#1082#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 50
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 350
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_ERROR_MSG'
      end
    end
    object tvwProvs: TcxGridDBBandedTableView
      DataController.DataSource = dsrProvs
      DataController.DetailKeyFieldNames = 'OUT_KEY_SESSION'
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'OUT_ID_PROV'
      DataController.MasterKeyFieldNames = 'OUT_KEY_SESSION'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#0.00'
          Kind = skSum
          FieldName = 'OUT_SUMMA'
          Column = cmnSUMMA_PROV
        end
        item
          Kind = skCount
          FieldName = 'OUT_ERROR_MSG'
          Column = cmnERROR_MSG_PROV
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnVertSizing = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.CellEndEllipsis = True
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderEndEllipsis = True
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 10
      OptionsView.BandHeaderEndEllipsis = True
      Styles.Background = dmdDataModul.cxBackground
      Styles.Content = dmdDataModul.cxsContent
      Styles.ContentEven = dmdDataModul.cxsContentEvent
      Styles.ContentOdd = dmdDataModul.cxsContentOdd
      Styles.Inactive = dmdDataModul.cxsInactive
      Styles.Selection = dmdDataModul.cxsSelection
      Styles.Footer = dmdDataModul.cxsFooter
      Styles.GroupByBox = dmdDataModul.cxsGroupByBox
      Styles.Header = dmdDataModul.cxsColumnHeader
      Styles.Indicator = dmdDataModul.cxsIndicator
      Styles.BandHeader = dmdDataModul.cxsHeader
      Bands = <
        item
          Caption = #1048#1085#1092#1086#1088#1084#1072#1080#1103' '#1087#1086' '#1087#1088#1086#1074#1086#1076#1082#1077
        end
        item
          Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1076#1077#1073#1077#1090#1086#1074#1086#1075#1086' '#1089#1095#1105#1090#1072
        end
        item
          Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1082#1088#1077#1076#1080#1090#1086#1074#1086#1075#1086' '#1089#1095#1105#1090#1072
        end
        item
          Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1076#1077#1073#1077#1090#1086#1074#1086#1081' '#1089#1084#1077#1090#1099
        end
        item
          Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1082#1088#1077#1076#1080#1090#1086#1074#1086#1081' '#1089#1084#1077#1090#1099
        end
        item
          Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1076#1077#1073#1077#1090#1086#1074#1086#1075#1086' '#1088#1072#1079#1076#1077#1083#1072
        end
        item
          Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1082#1088#1077#1076#1080#1090#1086#1074#1086#1075#1086' '#1088#1072#1079#1076#1077#1083#1072
        end
        item
          Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1076#1077#1073#1077#1090#1086#1074#1086#1081' '#1089#1090#1072#1090#1100#1080
        end
        item
          Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1082#1088#1077#1076#1080#1090#1086#1074#1086#1081' '#1089#1090#1072#1090#1100#1080
        end>
      object cmnID_PROV: TcxGridDBBandedColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_ID_PROV'
        IsCaptionAssigned = True
      end
      object cmnSUMMA_PROV: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1084#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 50
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 120
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_SUMMA'
      end
      object cmnERROR_MSG_PROV: TcxGridDBBandedColumn
        Caption = #1054#1096#1080#1073#1082#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 50
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 300
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_ERROR_MSG'
      end
      object cmnDB_SCH_NUM: TcxGridDBBandedColumn
        Caption = #8470
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 40
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_DB_SCH_NUM'
      end
      object cmnDB_SCH_TITLE: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 150
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_DB_SCH_TITLE'
      end
      object cmnKR_SCH_NUM: TcxGridDBBandedColumn
        Caption = #8470
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 40
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_KR_SCH_NUM'
      end
      object cmnKR_SCH_TITLE: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 150
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_KR_SCH_TITLE'
      end
      object cmnDB_SMET_NUM: TcxGridDBBandedColumn
        Caption = #8470
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 40
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_DB_SMET_NUM'
      end
      object cmnDB_SMET_TITLE: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 150
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_DB_SMET_TITLE'
      end
      object cmnKR_SMET_NUM: TcxGridDBBandedColumn
        Caption = #8470
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 40
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_KR_SMET_NUM'
      end
      object cmnKR_SMET_TITLE: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 150
        Position.BandIndex = 4
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_KR_SMET_TITLE'
      end
      object cmnDB_RAZD_NUM: TcxGridDBBandedColumn
        Caption = #8470
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 40
        Position.BandIndex = 5
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_DB_RAZD_NUM'
      end
      object cmnDB_RAZD_TITLE: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 150
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_DB_RAZD_TITLE'
      end
      object cmnKR_RAZD_NUM: TcxGridDBBandedColumn
        Caption = #8470
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 40
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_KR_RAZD_NUM'
      end
      object cmnKR_RAZD_TITLE: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 150
        Position.BandIndex = 6
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_KR_RAZD_TITLE'
      end
      object cmnDB_STAT_NUM: TcxGridDBBandedColumn
        Caption = #8470
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 40
        Position.BandIndex = 7
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_DB_STAT_NUM'
      end
      object cmnDB_STAT_TITLE: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 150
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_DB_STAT_TITLE'
      end
      object cmnKR_STAT_NUM: TcxGridDBBandedColumn
        Caption = #8470
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 40
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_KR_STAT_NUM'
      end
      object cmnKR_STAT_TITLE: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.VertSizing = False
        Width = 150
        Position.BandIndex = 8
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_KR_STAT_TITLE'
      end
    end
    object lvlDocs: TcxGridLevel
      GridView = tvwDocs
      object lvlProvs: TcxGridLevel
        GridView = tvwProvs
      end
    end
  end
  object dsrDocs: TDataSource
    DataSet = dstDocs
    Left = 12
    Top = 48
  end
  object dstDocs: TRxMemoryData
    FieldDefs = <>
    Left = 12
    Top = 96
  end
  object dsrProvs: TDataSource
    DataSet = dstProvs
    Left = 63
    Top = 48
  end
  object dstProvs: TRxMemoryData
    FieldDefs = <>
    Left = 63
    Top = 96
  end
end
