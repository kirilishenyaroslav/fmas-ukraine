object HistoryForm: THistoryForm
  Left = 442
  Top = 289
  Width = 698
  Height = 445
  Caption = #1030#1089#1090#1086#1088#1110#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
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
    Width = 690
    Height = 41
    Align = alTop
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 549
      Top = 6
      Width = 122
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
    Width = 690
    Height = 372
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
      Styles.Header = cxStyle1
      object cxgrdbclmnDOC: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'TIPD'
      end
      object cxgrdbclmnNUM_DOC: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'NUM_DOC'
      end
      object cxgrdbclmnMO_OUT: TcxGridDBColumn
        Caption = #1042#1110#1076' '#1082#1086#1075#1086
        Options.Editing = False
        Options.Filtering = False
        Width = 275
        DataBinding.FieldName = 'NAME_OUT'
      end
      object cxgrdbclmnMO_IN: TcxGridDBColumn
        Caption = #1050#1086#1084#1091
        Options.Editing = False
        Options.Filtering = False
        Width = 301
        DataBinding.FieldName = 'NAME_IN'
      end
      object cxgrdbclmnSUMMA: TcxGridDBColumn
        Caption = #1057#1091#1084#1072
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'SUMMA'
      end
      object cxgrdbclmnUSER: TcxGridDBColumn
        Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
        Options.Editing = False
        Options.Filtering = False
        Width = 390
        DataBinding.FieldName = 'USER_NAME'
      end
      object cxgrdbclmnTime: TcxGridDBColumn
        Caption = #1063#1072#1089' '#1079#1084#1110#1085
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'DATETIME'
      end
      object cxgrdbclmnACTION: TcxGridDBColumn
        Caption = #1044#1110#1103
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'USER_ACTION'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object actlst1: TActionList
    Left = 508
    Top = 5
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ShortCut = 27
      OnExecute = actCloseExecute
    end
  end
  object HistoryDS: TpFIBDataSet
    Database = DocWorkForm.DocWorkDatabase
    Transaction = DocWorkForm.ReadTransaction
    SelectSQL.Strings = (
      'Select * from MAT_DT_DOC_HIST_SEL(:ID_DOC)')
    Left = 10
    Top = 112
    poSQLINT64ToBCD = True
    object HistoryDSID_TIPD: TFIBIntegerField
      FieldName = 'ID_TIPD'
    end
    object HistoryDSTIPD: TFIBStringField
      FieldName = 'TIPD'
      Size = 15
      EmptyStrToNull = True
    end
    object HistoryDSNAME_TIPD: TFIBStringField
      FieldName = 'NAME_TIPD'
      Size = 50
      EmptyStrToNull = True
    end
    object HistoryDSKOD_DOC: TFIBSmallIntField
      FieldName = 'KOD_DOC'
    end
    object HistoryDSNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object HistoryDSDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object HistoryDSOSN_ID_TIPD: TFIBIntegerField
      FieldName = 'OSN_ID_TIPD'
    end
    object HistoryDSOTIPD: TFIBStringField
      FieldName = 'OTIPD'
      Size = 15
      EmptyStrToNull = True
    end
    object HistoryDSNAME_OSN: TFIBStringField
      FieldName = 'NAME_OSN'
      Size = 255
      EmptyStrToNull = True
    end
    object HistoryDSOSN_NUM_DOC: TFIBStringField
      FieldName = 'OSN_NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object HistoryDSOSN_DATE_DOC: TFIBDateField
      FieldName = 'OSN_DATE_DOC'
    end
    object HistoryDSID_MO_IN: TFIBIntegerField
      FieldName = 'ID_MO_IN'
    end
    object HistoryDSFIO_MO_IN: TFIBStringField
      FieldName = 'FIO_MO_IN'
      Size = 100
      EmptyStrToNull = True
    end
    object HistoryDSFIO_IN: TFIBStringField
      FieldName = 'FIO_IN'
      Size = 62
      EmptyStrToNull = True
    end
    object HistoryDSNAME_DEP_IN: TFIBStringField
      FieldName = 'NAME_DEP_IN'
      Size = 255
      EmptyStrToNull = True
    end
    object HistoryDSID_MO_OUT: TFIBIntegerField
      FieldName = 'ID_MO_OUT'
    end
    object HistoryDSFIO_MO_OUT: TFIBStringField
      FieldName = 'FIO_MO_OUT'
      Size = 100
      EmptyStrToNull = True
    end
    object HistoryDSFIO_OUT: TFIBStringField
      FieldName = 'FIO_OUT'
      Size = 62
      EmptyStrToNull = True
    end
    object HistoryDSNAME_DEP_OUT: TFIBStringField
      FieldName = 'NAME_DEP_OUT'
      Size = 255
      EmptyStrToNull = True
    end
    object HistoryDSID_CUST: TFIBBCDField
      FieldName = 'ID_CUST'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSNAME_CUSTOMER: TFIBStringField
      FieldName = 'NAME_CUSTOMER'
      Size = 255
      EmptyStrToNull = True
    end
    object HistoryDSNAME_IN: TFIBStringField
      FieldName = 'NAME_IN'
      Size = 255
      EmptyStrToNull = True
    end
    object HistoryDSNAME_OUT: TFIBStringField
      FieldName = 'NAME_OUT'
      Size = 255
      EmptyStrToNull = True
    end
    object HistoryDSSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object HistoryDSSUMMA_DOC: TFIBBCDField
      FieldName = 'SUMMA_DOC'
      Size = 2
      RoundByScale = True
    end
    object HistoryDSID_MAN: TFIBIntegerField
      FieldName = 'ID_MAN'
    end
    object HistoryDSFIO_MAN: TFIBStringField
      FieldName = 'FIO_MAN'
      Size = 62
      EmptyStrToNull = True
    end
    object HistoryDSSFIO_MAN: TFIBStringField
      FieldName = 'SFIO_MAN'
      Size = 62
      EmptyStrToNull = True
    end
    object HistoryDSDOV_NUM: TFIBStringField
      FieldName = 'DOV_NUM'
      Size = 15
      EmptyStrToNull = True
    end
    object HistoryDSDOV_DATE: TFIBDateField
      FieldName = 'DOV_DATE'
    end
    object HistoryDSDATE_REC: TFIBDateField
      FieldName = 'DATE_REC'
    end
    object HistoryDSPUB_ID_DOC: TFIBBCDField
      FieldName = 'PUB_ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSNUM_REESTR: TFIBStringField
      FieldName = 'NUM_REESTR'
      Size = 15
      EmptyStrToNull = True
    end
    object HistoryDSDATE_REESTR: TFIBDateField
      FieldName = 'DATE_REESTR'
    end
    object HistoryDSUSER_NAME: TFIBStringField
      FieldName = 'USER_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object HistoryDSCOMPUTER: TFIBStringField
      FieldName = 'COMPUTER'
      Size = 15
      EmptyStrToNull = True
    end
    object HistoryDSDATETIME: TFIBDateTimeField
      FieldName = 'DATETIME'
    end
    object HistoryDSDIR_KOMISSIA: TFIBStringField
      FieldName = 'DIR_KOMISSIA'
      Size = 50
      EmptyStrToNull = True
    end
    object HistoryDSKOMISSIA: TFIBStringField
      FieldName = 'KOMISSIA'
      Size = 255
      EmptyStrToNull = True
    end
    object HistoryDSNUM_PRIKAZ_KOMISSIA: TFIBStringField
      FieldName = 'NUM_PRIKAZ_KOMISSIA'
      Size = 15
      EmptyStrToNull = True
    end
    object HistoryDSDATE_PRIKAZ_KOMISSIA: TFIBDateField
      FieldName = 'DATE_PRIKAZ_KOMISSIA'
    end
    object HistoryDSDOC_NOTE: TFIBStringField
      FieldName = 'DOC_NOTE'
      Size = 255
      EmptyStrToNull = True
    end
    object HistoryDSINV_KART_MODE: TFIBIntegerField
      FieldName = 'INV_KART_MODE'
    end
    object HistoryDSMNA_KART_MODE: TFIBIntegerField
      FieldName = 'MNA_KART_MODE'
    end
    object HistoryDSID_USER: TFIBBCDField
      FieldName = 'ID_USER'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSUSER_FULL_NAME: TFIBStringField
      FieldName = 'USER_FULL_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object HistoryDSPUB_COMPUTER: TFIBStringField
      FieldName = 'PUB_COMPUTER'
      Size = 255
      EmptyStrToNull = True
    end
    object HistoryDSPUB_DATETIME: TFIBDateTimeField
      FieldName = 'PUB_DATETIME'
    end
    object HistoryDSSTORNO: TFIBIntegerField
      FieldName = 'STORNO'
    end
    object HistoryDSR_PUB_ID_DOC: TFIBBCDField
      FieldName = 'R_PUB_ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSTIP_WORK: TFIBIntegerField
      FieldName = 'TIP_WORK'
    end
    object HistoryDSUSER_ACTION: TFIBStringField
      FieldName = 'USER_ACTION'
      Size = 10
      EmptyStrToNull = True
    end
  end
  object ds1: TDataSource
    DataSet = HistoryDS
    Left = 42
    Top = 112
  end
  object StyleRepository: TcxStyleRepository
    Left = 75
    Top = 113
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
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWindow
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
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svFont, svTextColor]
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
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
end
