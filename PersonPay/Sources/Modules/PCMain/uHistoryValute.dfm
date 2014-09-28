object HistoryForm: THistoryForm
  Left = 345
  Top = 300
  Width = 572
  Height = 400
  Caption = #1030#1089#1090#1086#1088#1110#1103
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
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 556
    Height = 362
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = ds1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle2
      Styles.Content = cxStyle2
      Styles.Header = cxStyle1
      object cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1042#1072#1083#1102#1090#1072
        Options.Editing = False
        Options.Filtering = False
        Width = 160
        DataBinding.FieldName = 'VALUTE_TITLE'
      end
      object cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1074#1072#1083#1102#1090#1080
        Options.Editing = False
        Options.Filtering = False
        Width = 82
        DataBinding.FieldName = 'CODE_VALUTE'
      end
      object cxgrdbclmnGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Caption = #1050#1091#1088#1089
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'KURS'
      end
      object cxgrdbclmnGrid1DBTableView1DBColumn4: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1074#1080#1089#1090#1072#1074#1083#1077#1085#1085#1103
        Options.Editing = False
        Options.Filtering = False
        Width = 118
        DataBinding.FieldName = 'DATE_KURS'
      end
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1063#1072#1089' '#1074#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1103
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'TIME_KURS'
      end
      object cxgrdbclmnGrid1DBTableView1DBColumn5: TcxGridDBColumn
        Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
        Options.Editing = False
        Options.Filtering = False
        Width = 143
        DataBinding.FieldName = 'USER_FIO_HST'
      end
      object cxgrdbclmnGrid1DBTableView1DBColumn6: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1079#1084#1110#1085
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'DATE_TIME_HST'
      end
      object cxgrdbclmnGrid1DBTableView1DBColumn7: TcxGridDBColumn
        Caption = 'IP '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'COMP'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object ds1: TDataSource
    DataSet = DS_History
    Left = 21
    Top = 317
  end
  object StyleRepository: TcxStyleRepository
    Left = 18
    Top = 256
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
      Font.Style = [fsBold]
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
      Font.Style = []
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
  object DS_History: TpFIBDataSet
    Database = DB
    Transaction = TR
    SelectSQL.Strings = (
      
        'select * from PUB_DT_VALUTE_KURS_HST a inner join pub_sp_valute ' +
        'b on a.id_valute=b.id_valute where a.id_valute=:id_val order by ' +
        'a.date_time_hst')
    Left = 16
    Top = 192
    poSQLINT64ToBCD = True
    object DS_HistoryID_KURS_HST: TFIBBCDField
      FieldName = 'ID_KURS_HST'
      Size = 0
      RoundByScale = True
    end
    object DS_HistoryID_KURS: TFIBBCDField
      FieldName = 'ID_KURS'
      Size = 0
      RoundByScale = True
    end
    object DS_HistoryID_VALUTE: TFIBBCDField
      FieldName = 'ID_VALUTE'
      Size = 0
      RoundByScale = True
    end
    object DS_HistoryDATE_KURS: TFIBDateField
      FieldName = 'DATE_KURS'
    end
    object DS_HistoryKURS: TFIBBCDField
      FieldName = 'KURS'
      RoundByScale = True
    end
    object DS_HistoryACTION_HST: TFIBStringField
      FieldName = 'ACTION_HST'
      EmptyStrToNull = True
    end
    object DS_HistoryUSER_FIO_HST: TFIBStringField
      FieldName = 'USER_FIO_HST'
      Size = 255
      EmptyStrToNull = True
    end
    object DS_HistoryDATE_TIME_HST: TFIBDateTimeField
      FieldName = 'DATE_TIME_HST'
    end
    object DS_HistoryID_HISTORY_INFO_HST: TFIBBCDField
      FieldName = 'ID_HISTORY_INFO_HST'
      Size = 0
      RoundByScale = True
    end
    object DS_HistoryCODE_VALUTE: TFIBStringField
      FieldName = 'CODE_VALUTE'
      Size = 4
      EmptyStrToNull = True
    end
    object DS_HistoryVALUTE_TITLE: TFIBStringField
      FieldName = 'VALUTE_TITLE'
      Size = 100
      EmptyStrToNull = True
    end
    object DS_HistoryID_VALUTE1: TFIBBCDField
      FieldName = 'ID_VALUTE1'
      Size = 0
      RoundByScale = True
    end
    object DS_HistoryCOMP: TFIBStringField
      FieldName = 'COMP'
      Size = 32
      EmptyStrToNull = True
    end
    object DS_HistoryTIME_KURS: TFIBTimeField
      FieldName = 'TIME_KURS'
      DisplayFormat = 'hh:mm:ss'
    end
    object DS_HistorySPECIAL_SIGN: TFIBStringField
      FieldName = 'SPECIAL_SIGN'
      Size = 4
      EmptyStrToNull = True
    end
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = TR
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 15
    Top = 225
  end
  object TR: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 15
    Top = 157
  end
end
