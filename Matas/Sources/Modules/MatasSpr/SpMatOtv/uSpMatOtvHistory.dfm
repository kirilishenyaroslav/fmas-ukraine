object SpMatOtvHistoryForm: TSpMatOtvHistoryForm
  Left = 400
  Top = 286
  Width = 561
  Height = 321
  Caption = #1030#1089#1090#1086#1088#1110#1103' '#1079#1084#1110#1085
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
    Width = 553
    Height = 41
    Align = alTop
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 423
      Top = 8
      Width = 110
      Height = 25
      Action = actClose
      TabOrder = 0
      Glyph.Data = {
        B6020000424DB602000000000000760000002800000030000000180000000100
        0400000000004002000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDD11DDDDDDDDDD11DDDDDDDDDD77DDDDDDDDDD77DDDDDDDDD1991DDDD
        DDDD1991DDDDDDDD7877DDDDDDDD7777DDDDDDD199991DDDDDD199991DDDDDD7
        88877DDDDDD777777DDDDDD1999991DDDD1999991DDDDDD7888877DDDD777777
        7DDDDDDD1999991DD1999991DDDDDDDD7888877DD7777777DDDDDDDDD1999991
        1999991DDDDDDDDDD78888777777777DDDDDDDDDDD199999999991DDDDDDDDDD
        DD788887777777DDDDDDDDDDDDD1999999991DDDDDDDDDDDDDD7888887777DDD
        DDDDDDDDDDDD19999991DDDDDDDDDDDDDDDD78888877DDDDDDDDDDDDDDDD1999
        9991DDDDDDDDDDDDDDDD78888877DDDDDDDDDDDDDDD1999999991DDDDDDDDDDD
        DDD7888888887DDDDDDDDDDDDD199999999991DDDDDDDDDDDD788888888887DD
        DDDDDDDDD19999911999991DDDDDDDDDD78888877888887DDDDDDDDD1999991D
        D1999991DDDDDDDD7888887DD7788887DDDDDDD1999991DDDD1999991DDDDDD7
        888887DDDD7788887DDDDDD199991DDDDDD199991DDDDDD788887DDDDDD77888
        7DDDDDDD1991DDDDDDDD1991DDDDDDDD7887DDDDDDDD7887DDDDDDDDD11DDDDD
        DDDDD11DDDDDDDDDD77DDDDDDDDDD77DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      NumGlyphs = 2
      UseSystemPaint = False
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 553
    Height = 253
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
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      Styles.Header = cxStyle11
      object cxgrdbclmnFIO: TcxGridDBColumn
        Caption = #1055#1030#1041
        Options.Editing = False
        Options.Filtering = False
        Width = 72
        DataBinding.FieldName = 'FIO'
      end
      object cxgrdbclmnDEP: TcxGridDBColumn
        Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
        Options.Editing = False
        Options.Filtering = False
        Width = 202
        DataBinding.FieldName = 'NAME_DEPARTMENT'
      end
      object cxgrdbclmnDateBeg: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'DATE_BEG'
      end
      object cxgrdbclmnDateEnd: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1082#1110#1085#1094#1103
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'DATE_END'
      end
      object cxgrdbclmnUser: TcxGridDBColumn
        Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
        Options.Editing = False
        Options.Filtering = False
        Width = 250
        DataBinding.FieldName = 'USER_FIO'
      end
      object cxgrdbclmnAction: TcxGridDBColumn
        Caption = #1044#1110#1103
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'USER_ACTION'
      end
      object cxgrdbclmnDATETIME: TcxGridDBColumn
        Caption = #1063#1072#1089' '#1079#1084#1110#1085
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'DATETIME'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object actlst1: TActionList
    Left = 308
    Top = 5
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ShortCut = 27
      OnExecute = actCloseExecute
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 11
    Top = 68
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
      Color = 16445924
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
      Font.Color = clSilver
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      TextColor = clBlack
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
      Color = 10485760
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
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
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14013866
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
  object ds1: TDataSource
    DataSet = HistorySet
    Left = 10
    Top = 114
  end
  object HistorySet: TpFIBDataSet
    Database = fmSpMatOtv.MatOtvDatabase
    Transaction = fmSpMatOtv.ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_SP_MO_HIST_SEL(:ID_MO)')
    Left = 46
    Top = 114
    poSQLINT64ToBCD = True
    object HistorySetID_MAN: TFIBBCDField
      FieldName = 'ID_MAN'
      Size = 0
      RoundByScale = True
    end
    object HistorySetID_SPODR: TFIBBCDField
      FieldName = 'ID_SPODR'
      Size = 0
      RoundByScale = True
    end
    object HistorySetIS_SKLAD: TFIBIntegerField
      FieldName = 'IS_SKLAD'
    end
    object HistorySetDISABLE: TFIBIntegerField
      FieldName = 'DISABLE'
    end
    object HistorySetDATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
    end
    object HistorySetDATE_END: TFIBDateField
      FieldName = 'DATE_END'
    end
    object HistorySetCOMMENT: TFIBStringField
      FieldName = 'COMMENT'
      Size = 30
      EmptyStrToNull = True
    end
    object HistorySetUSER_FIO: TFIBStringField
      FieldName = 'USER_FIO'
      Size = 100
      EmptyStrToNull = True
    end
    object HistorySetID_HIST: TFIBBCDField
      FieldName = 'ID_HIST'
      Size = 0
      RoundByScale = True
    end
    object HistorySetUSER_ACTION: TFIBStringField
      FieldName = 'USER_ACTION'
      Size = 10
      EmptyStrToNull = True
    end
    object HistorySetDATETIME: TFIBDateTimeField
      FieldName = 'DATETIME'
    end
    object HistorySetFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 100
      EmptyStrToNull = True
    end
    object HistorySetNAME_DEPARTMENT: TFIBStringField
      FieldName = 'NAME_DEPARTMENT'
      Size = 255
      EmptyStrToNull = True
    end
  end
end
