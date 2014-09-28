object ShowAvgPaymentForm: TShowAvgPaymentForm
  Left = 241
  Top = 228
  BorderStyle = bsSingle
  Caption = 'ShowAvgPaymentForm'
  ClientHeight = 466
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object AvgPaymentGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 552
    Height = 368
    Align = alClient
    TabOrder = 0
    object AvgPaymentGridDBTableView: TcxGridDBTableView
      DataController.DataSource = DataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'AVG_SUMMA'
          Column = AvgSumColumn
        end
        item
          Kind = skSum
          FieldName = 'NUM_DAYS'
          Column = NumDaysColumn
        end
        item
          Format = #1057#1077#1088#1077#1076#1085#1110#1081'=0.00'
          Column = DateBegColumn
        end
        item
          Kind = skSum
          FieldName = 'SUMMA_N_KOEFF'
          Column = SummaColumn
        end
        item
          Format = '====='
          Kind = skAverage
          FieldName = 'AVG_SUMMA'
          Column = KoeffColumn
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.OnAfterSummary = AvgPaymentGridDBTableViewDataControllerSummaryAfterSummary
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
      Styles.StyleSheet = GridTableViewStyleSheetDevExpress
      object DateBegColumn: TcxGridDBColumn
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 110
        DataBinding.FieldName = 'DATE_BEG'
      end
      object NumDaysColumn: TcxGridDBColumn
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 110
        DataBinding.FieldName = 'NUM_DAYS'
      end
      object TotalHoursColumn: TcxGridDBColumn
        Visible = False
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object SummaColumn: TcxGridDBColumn
        Caption = #1057#1091#1084#1072
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 110
        DataBinding.FieldName = 'SUMMA_N_KOEFF'
      end
      object KoeffColumn: TcxGridDBColumn
        Caption = #1050#1086#1077#1092#1110#1094#1110#1077#1085#1090
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 82
        DataBinding.FieldName = 'KOEFF'
      end
      object AvgSumColumn: TcxGridDBColumn
        Caption = #1057#1091#1084#1072' '#1076#1083#1103' '#1089#1077#1088#1077#1076#1085#1100#1086#1075#1086
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 138
        DataBinding.FieldName = 'AVG_SUMMA'
      end
    end
    object HospitalTableView: TcxGridDBTableView
      DataController.DataSource = HospDataSource
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
      DataController.Summary.OnAfterSummary = HospitalTableViewDataControllerSummaryAfterSummary
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = GridTableViewStyleSheetDevExpress
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
    object AvgPaymentGridLevel: TcxGridLevel
      GridView = AvgPaymentGridDBTableView
    end
  end
  object ResultPanel: TPanel
    Left = 0
    Top = 368
    Width = 552
    Height = 98
    Align = alBottom
    TabOrder = 1
    object HospDataGroupBox: TGroupBox
      Left = 8
      Top = 8
      Width = 529
      Height = 73
      Caption = 'HospDataGroupBox'
      TabOrder = 0
      object DaysLabel: TLabel
        Left = 96
        Top = 16
        Width = 60
        Height = 13
        Caption = 'DaysLabel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object HoursLabel: TLabel
        Left = 96
        Top = 35
        Width = 65
        Height = 13
        Caption = 'HoursLabel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object AvgPaymentLabel: TLabel
        Left = 96
        Top = 52
        Width = 102
        Height = 13
        Caption = 'AvgPaymentLabel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DaysCaption: TLabel
        Left = 8
        Top = 16
        Width = 72
        Height = 13
        Caption = 'DaysCaption'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object HoursCaption: TLabel
        Left = 8
        Top = 35
        Width = 77
        Height = 13
        Caption = 'HoursCaption'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object AvgPaymentCaption: TLabel
        Left = 8
        Top = 52
        Width = 114
        Height = 13
        Caption = 'AvgPaymentCaption'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object IsSmenaLabel: TLabel
        Left = 208
        Top = 52
        Width = 67
        Height = 13
        Caption = 'IsSmenaLabel'
        Visible = False
      end
    end
  end
  object StylesGrid: TcxStyleRepository
    Left = 120
    Top = 72
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
  end
  object MainDataBase: TpFIBDatabase
    DBName = 'localhost:DneprActual'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Top = 64
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = MainDataBase
    TimeoutAction = TARollback
    Left = 32
    Top = 64
  end
  object AvgPaymentHolDataSet: TpFIBDataSet
    Database = MainDataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      #9'AVG_SUMMA,'
      #9'KS,'
      #9'NUM_DAYS,'
      #9'DATE_BEG,'
      #9'DATE_END'
      'FROM Z_COUNT_AVARAGE_PAYMENT '
      '(:STARTING_MONTH,:KOL_MONTH,:RMOVING)')
    Top = 104
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = AvgPaymentHolDataSet
    Left = 32
    Top = 104
  end
  object AvgPaymentHospDataSet: TpFIBDataSet
    Database = MainDataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      #9'TOTAL_SUM,'
      #9'TOTAL_DAYS,'
      #9'TOTAL_HOURS,'
      #9'KOD_SETUP,'
      #9'DATE_BEG,'
      #9'DATE_END'
      'FROM Z_COUNT_AVG_PAYMENT_HOSP_COMMON(:STARTING_MONTH,'
      ':KOL_MONTH,:ID_MAN,:ID_HOSP)'
      ' ')
    Top = 24
    poSQLINT64ToBCD = True
    object AvgPaymentHospDataSetTOTAL_SUM: TFIBBCDField
      FieldName = 'TOTAL_SUM'
      Size = 2
      RoundByScale = True
    end
    object AvgPaymentHospDataSetTOTAL_DAYS: TFIBIntegerField
      FieldName = 'TOTAL_DAYS'
    end
    object AvgPaymentHospDataSetTOTAL_HOURS: TFIBBCDField
      FieldName = 'TOTAL_HOURS'
      Size = 3
      RoundByScale = True
    end
    object AvgPaymentHospDataSetKOD_SETUP: TFIBIntegerField
      FieldName = 'KOD_SETUP'
    end
    object AvgPaymentHospDataSetDATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
    end
    object AvgPaymentHospDataSetDATE_END: TFIBDateField
      FieldName = 'DATE_END'
    end
  end
  object GetHolBegDataSet: TpFIBDataSet
    Database = MainDataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      #9'FIRST_DATE_BEG'
      'FROM Z_GET_HOLIDAY_BEG_FOR_AVG(:ID_VIDOPL,:RMOVING,'
      '                      :DATE_BEG)')
    Top = 144
    poSQLINT64ToBCD = True
  end
  object GetHospBegDataSet: TpFIBDataSet
    Database = MainDataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT '#9'FIRST_DATE_BEG'
      'FROM Z_GET_HOSP_BEG(:ID_HOSP)'
      ''
      ''
      '')
    Left = 32
    Top = 144
    poSQLINT64ToBCD = True
    object GetHospBegDataSetFIRST_DATE_BEG: TFIBDateField
      FieldName = 'FIRST_DATE_BEG'
    end
  end
  object HospDataSource: TDataSource
    DataSet = AvgPaymentHospDataSet
    Top = 184
  end
  object HospitalDetailsDataSet: TpFIBDataSet
    Database = MainDataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      #9'WORK_DAYS,'
      #9'WORK_HOURS,'
      #9'IS_SMENA'
      'FROM Z_GET_HOSP_DATA(:ID_HOSP,null,null,null,null)')
    Left = 32
    Top = 184
    poSQLINT64ToBCD = True
    object HospitalDetailsDataSetWORK_DAYS: TFIBIntegerField
      FieldName = 'WORK_DAYS'
    end
    object HospitalDetailsDataSetWORK_HOURS: TFIBBCDField
      FieldName = 'WORK_HOURS'
      Size = 3
      RoundByScale = True
    end
    object HospitalDetailsDataSetIS_SMENA: TFIBStringField
      FieldName = 'IS_SMENA'
      Size = 1
      EmptyStrToNull = True
    end
  end
  object ConstsDataSet: TpFIBDataSet
    Database = MainDataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT Z.CURRENT_KOD,Z.IS_UNIVER'
      'FROM Z_SETUP Z')
    Left = 64
    Top = 184
    poSQLINT64ToBCD = True
    object ConstsDataSetCURRENT_KOD: TFIBIntegerField
      FieldName = 'CURRENT_KOD'
    end
    object ConstsDataSetIS_UNIVER: TFIBStringField
      FieldName = 'IS_UNIVER'
      Size = 1
      EmptyStrToNull = True
    end
  end
end
