object HistoryForm: THistoryForm
  Left = 283
  Top = 284
  Width = 865
  Height = 528
  Caption = #1030#1089#1090#1086#1088#1110#1103' '#1082#1072#1088#1090#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 857
    Height = 41
    Align = alTop
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 711
      Top = 9
      Width = 130
      Height = 25
      Action = actClose
      TabOrder = 0
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DD99D99DDDDDDDDDD99DD999DDDDDDDD99DDD9999DDDDDD99DDDDD9999DDDD99
        DDDDDDDD999D999DDDDDDDDDD99999DDDDDDDDDDDD999DDDDDDDDDDDD99999DD
        DDDDDDDD999DD99DDDDDDDD999DDDD99DDDDDD999DDDDDD99DDDD999DDDDDDDD
        D9DD999DDDDDDDDDDDDD99DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      UseSystemPaint = False
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 857
    Height = 297
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = ds1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Styles.Header = cxStyle8
      object cxgrdbclmnSCH: TcxGridDBColumn
        Caption = #1056#1072#1093#1091#1085#1086#1082
        Options.Editing = False
        Options.Filtering = False
        Width = 94
        DataBinding.FieldName = 'SCH_NUMBER'
      end
      object cxgrdbclmnFIO: TcxGridDBColumn
        Caption = #1055#1030#1041
        Options.Editing = False
        Options.Filtering = False
        Width = 147
        DataBinding.FieldName = 'SFIO'
      end
      object cxgrdbclmnPIDR: TcxGridDBColumn
        Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
        Options.Editing = False
        Options.Filtering = False
        Width = 388
        DataBinding.FieldName = 'NAME_DEPARTMENT'
      end
      object cxgrdbclmnNomN: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1085#1082#1083'.'#8470
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'NNUM'
      end
      object cxgrdbclmnInvN: TcxGridDBColumn
        Caption = #1030#1085#1074'. '#1085#1086#1084#1077#1088
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'INUM'
      end
      object cxgrdbclmnName: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        Options.Editing = False
        Options.Filtering = False
        Width = 249
        DataBinding.FieldName = 'NAME'
      end
      object cxgrdbclmnKol: TcxGridDBColumn
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'KOL_MAT'
      end
      object cxgrdbclmnSum: TcxGridDBColumn
        Caption = #1057#1091#1084#1072
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'SUMMA'
      end
      object cxgrdbclmnDateTime: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1079#1084#1110#1085
        Options.Editing = False
        Options.Filtering = False
        Width = 124
        DataBinding.FieldName = 'DATETIME'
      end
      object cxgrdbclmnAction: TcxGridDBColumn
        Caption = #1044#1110#1103
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'USER_ACTION'
      end
      object cxgrdbclmnUSER: TcxGridDBColumn
        Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
        Options.Editing = False
        Options.Filtering = False
        SortOrder = soAscending
        Width = 145
        DataBinding.FieldName = 'NAME_USER'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 338
    Width = 857
    Height = 158
    Align = alBottom
    TabOrder = 2
    object lbl1: TLabel
      Left = 9
      Top = 9
      Width = 38
      Height = 13
      Caption = #1053#1072#1079#1074#1072
    end
    object lbl2: TLabel
      Left = 10
      Top = 36
      Width = 142
      Height = 13
      Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1085#1080#1081' '#1085#1086#1084#1077#1088
    end
    object lbl3: TLabel
      Left = 10
      Top = 67
      Width = 123
      Height = 13
      Caption = #1044#1072#1090#1072' '#1086#1087#1088#1080#1073#1091#1090#1091#1074#1072#1085#1085#1103
    end
    object lbl4: TLabel
      Left = 10
      Top = 99
      Width = 124
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1077#1082#1089#1087#1083'.'
    end
    object lbl5: TLabel
      Left = 10
      Top = 127
      Width = 96
      Height = 13
      Caption = #1044#1072#1090#1072' '#1074#1080#1083#1091#1095#1077#1085#1085#1103
    end
    object lbl6: TLabel
      Left = 307
      Top = 39
      Width = 69
      Height = 13
      Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
    end
    object cxDBTextEdit9: TcxDBTextEdit
      Left = 57
      Top = 5
      Width = 705
      Height = 21
      DataBinding.DataField = 'NAME'
      DataBinding.DataSource = ds1
      TabOrder = 0
    end
    object cxDBTextEdit8: TcxDBTextEdit
      Left = 167
      Top = 35
      Width = 121
      Height = 21
      DataBinding.DataField = 'NNUM_FULL'
      DataBinding.DataSource = ds1
      TabOrder = 1
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 166
      Top = 66
      Width = 121
      Height = 21
      DataBinding.DataField = 'DATE_OPR'
      DataBinding.DataSource = ds1
      TabOrder = 2
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 167
      Top = 94
      Width = 121
      Height = 21
      DataBinding.DataField = 'DATE_EXPL'
      DataBinding.DataSource = ds1
      TabOrder = 3
    end
    object cxDBTextEdit5: TcxDBTextEdit
      Left = 166
      Top = 122
      Width = 121
      Height = 21
      DataBinding.DataField = 'DATE_OUT'
      TabOrder = 4
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 397
      Top = 36
      Width = 364
      Height = 21
      DataBinding.DataField = 'NAME_USER'
      DataBinding.DataSource = ds1
      TabOrder = 5
    end
  end
  object actlst1: TActionList
    Left = 405
    Top = 6
    object actClose: TAction
      Caption = #1042#1080#1093#1110#1076
      ShortCut = 27
      OnExecute = actCloseExecute
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 196
    Top = 129
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
  object HistoryDS: TpFIBDataSet
    Database = MnaKartMainForm.MnaKartDatabase
    Transaction = MnaKartMainForm.ReadTransaction
    UpdateTransaction = MnaKartMainForm.WriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_DT_MNA_KART_HIST_SEL(:ID_KART)')
    Left = 10
    Top = 89
    poSQLINT64ToBCD = True
    object HistoryDSID_MNA_KART: TFIBBCDField
      FieldName = 'ID_MNA_KART'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSTIP_MNA_KART: TFIBIntegerField
      FieldName = 'TIP_MNA_KART'
    end
    object HistoryDSID_MO: TFIBBCDField
      FieldName = 'ID_MO'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 62
      EmptyStrToNull = True
    end
    object HistoryDSSFIO: TFIBStringField
      FieldName = 'SFIO'
      Size = 50
      EmptyStrToNull = True
    end
    object HistoryDSID_SPODR: TFIBIntegerField
      FieldName = 'ID_SPODR'
    end
    object HistoryDSNAME_DEPARTMENT: TFIBStringField
      FieldName = 'NAME_DEPARTMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object HistoryDSIS_SKLAD: TFIBSmallIntField
      FieldName = 'IS_SKLAD'
    end
    object HistoryDSBAL_ID_SCH: TFIBBCDField
      FieldName = 'BAL_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSBAL_SCH_NUMBER: TFIBStringField
      FieldName = 'BAL_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object HistoryDSBAL_SCH_TITLE: TFIBStringField
      FieldName = 'BAL_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object HistoryDSID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object HistoryDSSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object HistoryDSNNUM: TFIBIntegerField
      FieldName = 'NNUM'
    end
    object HistoryDSGNUM: TFIBSmallIntField
      FieldName = 'GNUM'
    end
    object HistoryDSINUM: TFIBIntegerField
      FieldName = 'INUM'
    end
    object HistoryDSID_NOMN: TFIBBCDField
      FieldName = 'ID_NOMN'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSNOMN: TFIBStringField
      FieldName = 'NOMN'
      Size = 30
      EmptyStrToNull = True
    end
    object HistoryDSNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object HistoryDSID_OST: TFIBBCDField
      FieldName = 'ID_OST'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSID_UNIT: TFIBBCDField
      FieldName = 'ID_UNIT'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSUNIT: TFIBStringField
      FieldName = 'UNIT'
      Size = 10
      EmptyStrToNull = True
    end
    object HistoryDSPRICE: TFIBBCDField
      FieldName = 'PRICE'
      Size = 4
      RoundByScale = True
    end
    object HistoryDSKOL_MAT: TFIBBCDField
      FieldName = 'KOL_MAT'
      Size = 4
      RoundByScale = True
    end
    object HistoryDSSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object HistoryDSSUMMA_OST: TFIBBCDField
      FieldName = 'SUMMA_OST'
      Size = 2
      RoundByScale = True
    end
    object HistoryDSDATE_OST: TFIBDateField
      FieldName = 'DATE_OST'
    end
    object HistoryDSSUMMA_AMORT: TFIBBCDField
      FieldName = 'SUMMA_AMORT'
      Size = 2
      RoundByScale = True
    end
    object HistoryDSDATE_OPR: TFIBDateField
      FieldName = 'DATE_OPR'
    end
    object HistoryDSID_OPER_OPR: TFIBBCDField
      FieldName = 'ID_OPER_OPR'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSDATE_EXPL: TFIBDateField
      FieldName = 'DATE_EXPL'
    end
    object HistoryDSID_OPER_EXPL: TFIBBCDField
      FieldName = 'ID_OPER_EXPL'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSDATE_OUT: TFIBDateField
      FieldName = 'DATE_OUT'
    end
    object HistoryDSID_OPER_OUT: TFIBBCDField
      FieldName = 'ID_OPER_OUT'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSYEAR_EXPL: TFIBIntegerField
      FieldName = 'YEAR_EXPL'
    end
    object HistoryDSMONTH_EXPL: TFIBIntegerField
      FieldName = 'MONTH_EXPL'
    end
    object HistoryDSDATE_CREATE: TFIBDateField
      FieldName = 'DATE_CREATE'
    end
    object HistoryDSMODEL: TFIBStringField
      FieldName = 'MODEL'
      Size = 50
      EmptyStrToNull = True
    end
    object HistoryDSMARKA: TFIBStringField
      FieldName = 'MARKA'
      Size = 50
      EmptyStrToNull = True
    end
    object HistoryDSZAVNUM: TFIBStringField
      FieldName = 'ZAVNUM'
      Size = 30
      EmptyStrToNull = True
    end
    object HistoryDSPASSNUM: TFIBStringField
      FieldName = 'PASSNUM'
      Size = 30
      EmptyStrToNull = True
    end
    object HistoryDSNOTE: TFIBStringField
      FieldName = 'NOTE'
      Size = 255
      EmptyStrToNull = True
    end
    object HistoryDSIS_AMORT: TFIBIntegerField
      FieldName = 'IS_AMORT'
    end
    object HistoryDSAMOR_METHOD: TFIBIntegerField
      FieldName = 'AMOR_METHOD'
    end
    object HistoryDSAMORT_PERCENT: TFIBFloatField
      FieldName = 'AMORT_PERCENT'
    end
    object HistoryDSDB_ID_SCH_AMORT: TFIBBCDField
      FieldName = 'DB_ID_SCH_AMORT'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSDB_ID_SM_AMORT: TFIBBCDField
      FieldName = 'DB_ID_SM_AMORT'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSDB_ID_RZ_AMORT: TFIBBCDField
      FieldName = 'DB_ID_RZ_AMORT'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSDB_ID_ST_AMORT: TFIBBCDField
      FieldName = 'DB_ID_ST_AMORT'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSDB_ID_KEKV_AMORT: TFIBBCDField
      FieldName = 'DB_ID_KEKV_AMORT'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSKR_ID_SCH_AMORT: TFIBBCDField
      FieldName = 'KR_ID_SCH_AMORT'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSKR_ID_SM_AMORT: TFIBBCDField
      FieldName = 'KR_ID_SM_AMORT'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSKR_ID_RZ_AMORT: TFIBBCDField
      FieldName = 'KR_ID_RZ_AMORT'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSKR_ID_ST_AMORT: TFIBBCDField
      FieldName = 'KR_ID_ST_AMORT'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSKR_ID_KEKV_AMORT: TFIBBCDField
      FieldName = 'KR_ID_KEKV_AMORT'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSINV_NUM_FULL: TFIBStringField
      FieldName = 'INV_NUM_FULL'
      Size = 10
      EmptyStrToNull = True
    end
    object HistoryDSNNUM_EXT: TFIBStringField
      FieldName = 'NNUM_EXT'
      Size = 10
      EmptyStrToNull = True
    end
    object HistoryDSNNUM_FULL: TFIBStringField
      FieldName = 'NNUM_FULL'
      Size = 25
      EmptyStrToNull = True
    end
    object HistoryDSOST_INFO: TFIBStringField
      FieldName = 'OST_INFO'
      Size = 255
      EmptyStrToNull = True
    end
    object HistoryDSDATETIME: TFIBDateTimeField
      FieldName = 'DATETIME'
    end
    object HistoryDSUSER_ACTION: TFIBStringField
      FieldName = 'USER_ACTION'
      Size = 10
      EmptyStrToNull = True
    end
    object HistoryDSNAME_USER: TFIBStringField
      FieldName = 'NAME_USER'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object ds1: TDataSource
    DataSet = HistoryDS
    Left = 49
    Top = 88
  end
end
