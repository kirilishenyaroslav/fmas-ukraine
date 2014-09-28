object fmHolAvg: TfmHolAvg
  Left = 194
  Top = 311
  BorderStyle = bsDialog
  Caption = #1057#1077#1088#1077#1076#1085#1108' '#1076#1083#1103' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1072' '#1074#1110#1076#1088#1103#1076#1078#1077#1085#1085#1103
  ClientHeight = 381
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 465
    Height = 381
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object Grid1: TcxGrid
      Left = 0
      Top = 0
      Width = 465
      Height = 153
      Align = alTop
      TabOrder = 0
      object Grid1DBTableView1: TcxGridDBTableView
        DataController.DataSource = DSource1
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'KOD_SETUP'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0'
            Kind = skSum
            FieldName = 'DAYS'
            Column = cmnGrid1Days
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.Indicator = True
        object cmnGrid1DateBeg: TcxGridDBColumn
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'DATE_BEG'
        end
        object cmnGrid1DateEnd: TcxGridDBColumn
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'DATE_END'
        end
        object cmnGrid1Days: TcxGridDBColumn
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'DAYS'
        end
      end
      object Grid1Level1: TcxGridLevel
        GridView = Grid1DBTableView1
      end
    end
    object Grid2: TcxGrid
      Left = 0
      Top = 153
      Width = 465
      Height = 228
      Align = alClient
      TabOrder = 1
      object Grid2DBTableView: TcxGridDBTableView
        DataController.DataSource = DSource2
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'summa_month'
            Column = cmnGrid2Summa
          end
          item
            Format = '0'
            Kind = skSum
            FieldName = 'wday'
            Column = cmnGrid2Days
          end
          item
            Format = #1057#1077#1088#1077#1076#1085#1110#1081'=0.00'
            Column = Grid2DBTableViewDBColumn2
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.Summary.OnAfterSummary = Grid2DBTableViewDataControllerSummaryAfterSummary
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object cmnGrid2Days: TcxGridDBColumn
          Caption = #1056#1086#1073#1086#1095#1110' '#1076#1085#1110
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 65
          DataBinding.FieldName = 'wday'
        end
        object cmnGrid2DateBeg: TcxGridDBColumn
          Caption = #1055#1077#1088#1110#1086#1076
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 81
          DataBinding.FieldName = 'd_acc_month'
        end
        object Grid2DBTableViewDBColumn2: TcxGridDBColumn
          Caption = #1057#1091#1084#1072' '
          HeaderAlignmentHorz = taCenter
          Width = 129
          DataBinding.FieldName = 'summa_not_koeff'
        end
        object Grid2DBTableViewDBColumn1: TcxGridDBColumn
          Caption = #1050#1086#1108#1092'.'
          HeaderAlignmentHorz = taCenter
          Width = 62
          DataBinding.FieldName = 'koeff'
        end
        object cmnGrid2Summa: TcxGridDBColumn
          Caption = #1057#1091#1084#1072' * '#1050#1086#1108#1092'.'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 126
          DataBinding.FieldName = 'summa_month'
        end
      end
      object HospitalTableView: TcxGridDBTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
            FieldName = 'TOTAL_SUM'
            Column = HospitalDateBegColumn
          end
          item
            Kind = skSum
            FieldName = 'TOTAL_DAYS'
          end
          item
            Kind = skSum
            FieldName = 'TOTAL_HOURS'
          end
          item
            Column = HospitalTotalDaysColumn
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Editing = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object HospitalDateBegColumn: TcxGridDBColumn
          DataBinding.FieldName = 'DATE_BEG'
        end
        object HospitalTotalDaysColumn: TcxGridDBColumn
          Width = 100
          DataBinding.FieldName = 'TOTAL_DAYS'
        end
        object HospitalTotalSumColumn: TcxGridDBColumn
          DataBinding.FieldName = 'TOTAL_SUM'
        end
        object HospitalTotalHoursColumn: TcxGridDBColumn
          DataBinding.FieldName = 'TOTAL_HOURS'
        end
      end
      object Grid2Level: TcxGridLevel
        GridView = Grid2DBTableView
      end
    end
  end
  object Grid3: TcxGrid
    Left = 465
    Top = 0
    Width = 314
    Height = 381
    Align = alClient
    TabOrder = 1
    object Grid3DBTableView: TcxGridDBTableView
      DataController.DataSource = DSource3
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.00;-0.00'
          Kind = skSum
          FieldName = 'SUMMA_FOR_COUNT'
          Column = cmnGrid3SummaForCount
        end
        item
          Format = '0.00;-0.00'
          Kind = skSum
          FieldName = 'SUMMA'
          Column = cmnGrid3Summa
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.OnAfterSummary = Grid2DBTableViewDataControllerSummaryAfterSummary
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cmnGrid3VO: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 54
        DataBinding.FieldName = 'KOD_VIDOPL'
      end
      object cmnGrid3VoName: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 208
        DataBinding.FieldName = 'NAME_VIDOPL'
      end
      object cmnGrid3KodSmeta: TcxGridDBColumn
        Caption = #1057#1084#1077#1090#1072
        PropertiesClassName = 'TcxTextEditProperties'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 56
        DataBinding.FieldName = 'KOD_SMETA'
      end
      object cmnGrid3Summa: TcxGridDBColumn
        Caption = #1057#1091#1084#1072
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 92
        DataBinding.FieldName = 'SUMMA'
      end
      object cmnGrid3SummaForCount: TcxGridDBColumn
        Caption = #1057#1091#1084#1072' '#1076#1083#1103' '#1089#1077#1088#1077#1076#1085#1100#1086#1075#1086
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 97
        DataBinding.FieldName = 'SUMMA_FOR_COUNT'
      end
    end
    object cxGridDBTableView2: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'TOTAL_SUM'
          Column = cxGridDBColumn6
        end
        item
          Kind = skSum
          FieldName = 'TOTAL_DAYS'
        end
        item
          Kind = skSum
          FieldName = 'TOTAL_HOURS'
        end
        item
          Column = cxGridDBColumn7
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGridDBColumn6: TcxGridDBColumn
        DataBinding.FieldName = 'DATE_BEG'
      end
      object cxGridDBColumn7: TcxGridDBColumn
        Width = 100
        DataBinding.FieldName = 'TOTAL_DAYS'
      end
      object cxGridDBColumn8: TcxGridDBColumn
        DataBinding.FieldName = 'TOTAL_SUM'
      end
      object cxGridDBColumn9: TcxGridDBColumn
        DataBinding.FieldName = 'TOTAL_HOURS'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = Grid3DBTableView
    end
  end
  object DB: TpFIBDatabase
    DBName = 'F:\DB\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251'
      'user_name=SYSDBA'
      'password='
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 48
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 64
    Top = 48
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    IS_SMENA,'
      '    AVG_SUM,'
      '    IS_HANDS,'
      '    HOSP_DATE'
      'FROM'
      '    Z_PAYMENT_COUNT_AVG_HOSP'
      '    ('
      '    146112'
      '    ) ')
    Left = 32
    Top = 96
    poSQLINT64ToBCD = True
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    KOD_SETUP,'
      '    SUMMA,'
      '    DAYS,'
      '    HOURS,'
      '    ID_MAN'
      'FROM'
      '    Z_GET_HOSP_AVG_DATA'
      '    ('
      '    ?ID_HOSP,'
      '    ?HOSP_DATE,'
      '    ?IS_SMENA,'
      '    ?WORK_DATE_BEG'
      '    ) ')
    DataSource = DSource1
    Left = 32
    Top = 128
    poSQLINT64ToBCD = True
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 64
    Top = 96
  end
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 64
    Top = 128
  end
  object DSet3: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    KOD_SETUP,'
      '    SUMMA,'
      '    DAYS,'
      '    HOURS,'
      '    ID_MAN'
      'FROM'
      '    Z_GET_HOSP_AVG_DATA'
      '    ('
      '    ?ID_HOSP,'
      '    ?HOSP_DATE,'
      '    ?IS_SMENA,'
      '    ?WORK_DATE_BEG'
      '    ) ')
    DataSource = DSource2
    Left = 32
    Top = 217
    poSQLINT64ToBCD = True
  end
  object DSource3: TDataSource
    DataSet = DSet3
    Left = 64
    Top = 217
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 48
  end
end
