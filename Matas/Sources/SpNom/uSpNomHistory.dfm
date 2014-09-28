object SpNomHistoryForm: TSpNomHistoryForm
  Left = 485
  Top = 353
  Width = 640
  Height = 396
  Caption = #1030#1089#1090#1086#1088#1110#1103
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
    Width = 632
    Height = 41
    Align = alTop
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 512
      Top = 7
      Width = 104
      Height = 25
      Action = act1
      TabOrder = 0
      Glyph.Data = {
        96010000424D9601000000000000760000002800000018000000180000000100
        0400000000002001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        D11DDDDDDDDDD11DDDDDDDDD1991DDDDDDDD1991DDDDDDD199991DDDDDD19999
        1DDDDDD1999991DDDD1999991DDDDDDD1999991DD1999991DDDDDDDDD1999991
        1999991DDDDDDDDDDD199999999991DDDDDDDDDDDDD1999999991DDDDDDDDDDD
        DDDD19999991DDDDDDDDDDDDDDDD19999991DDDDDDDDDDDDDDD1999999991DDD
        DDDDDDDDDD199999999991DDDDDDDDDDD19999911999991DDDDDDDDD1999991D
        D1999991DDDDDDD1999991DDDD1999991DDDDDD199991DDDDDD199991DDDDDDD
        1991DDDDDDDD1991DDDDDDDDD11DDDDDDDDDD11DDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      UseSystemPaint = False
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 632
    Height = 328
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
      Styles.Header = cxStyle12
      object cxgrdbclmnKOD: TcxGridDBColumn
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'KOD'
        IsCaptionAssigned = True
      end
      object cxgrdbclmnNOMN: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'NOMN'
      end
      object cxgrdbclmnNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'NAME'
      end
      object cxgrdbclmnED_IZM: TcxGridDBColumn
        Caption = #1054#1076'.'#1074#1080#1084'.'
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'SHORT_NAME'
      end
      object cxgrdbclmnPRICE: TcxGridDBColumn
        Caption = #1062#1110#1085#1072
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'PRICE'
      end
      object cxgrdbclmnTIP: TcxGridDBColumn
        Caption = #1058#1080#1087
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'TIP'
      end
      object cxgrdbclmnUSER_FIO: TcxGridDBColumn
        Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'NAME_USER'
      end
      object cxgrdbclmnDATETIME: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1079#1084#1110#1085
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'DATETIME'
      end
      object cxgrdbclmnUSER_ACTION: TcxGridDBColumn
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
  object StyleRepository: TcxStyleRepository
    Left = 8
    Top = 432
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      Font.Style = []
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
      Font.Style = []
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
  object ds1: TDataSource
    DataSet = HistoryDS
    Left = 171
    Top = 72
  end
  object HistoryDS: TpFIBDataSet
    Database = SpNomForm.SpNomDatabase
    Transaction = SpNomForm.ReadTransaction
    UpdateTransaction = SpNomForm.WriteTransaction
    SelectSQL.Strings = (
      'Select * from MAT_SP_NOM_BASE_HIST_SEL(:ID_NOMN)')
    Left = 138
    Top = 74
    poSQLINT64ToBCD = True
    object HistoryDSKOD: TFIBStringField
      FieldName = 'KOD'
      Size = 10
      EmptyStrToNull = True
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
    object HistoryDSID_UNIT: TFIBBCDField
      FieldName = 'ID_UNIT'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSPRICE: TFIBBCDField
      FieldName = 'PRICE'
      Size = 2
      RoundByScale = True
    end
    object HistoryDSTIP: TFIBIntegerField
      FieldName = 'TIP'
    end
    object HistoryDSNTYPE: TFIBIntegerField
      FieldName = 'NTYPE'
    end
    object HistoryDSID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSNAME_USER: TFIBStringField
      FieldName = 'NAME_USER'
      Size = 100
      EmptyStrToNull = True
    end
    object HistoryDSID_HIST: TFIBBCDField
      FieldName = 'ID_HIST'
      Size = 0
      RoundByScale = True
    end
    object HistoryDSDATETIME: TFIBDateTimeField
      FieldName = 'DATETIME'
    end
    object HistoryDSUSER_ACTION: TFIBStringField
      FieldName = 'USER_ACTION'
      Size = 10
      EmptyStrToNull = True
    end
    object HistoryDSSHORT_NAME: TFIBStringField
      FieldName = 'SHORT_NAME'
      Size = 10
      EmptyStrToNull = True
    end
    object HistoryDSSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      EmptyStrToNull = True
    end
    object HistoryDSSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 100
      EmptyStrToNull = True
    end
    object HistoryDSCUR_PERIOD: TFIBDateField
      FieldName = 'CUR_PERIOD'
    end
  end
  object actlst1: TActionList
    Left = 327
    Top = 9
    object act1: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ShortCut = 27
      OnExecute = act1Execute
    end
  end
end
