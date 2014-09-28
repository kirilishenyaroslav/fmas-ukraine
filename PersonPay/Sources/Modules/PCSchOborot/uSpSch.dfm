object SpSchForm: TSpSchForm
  Left = 629
  Top = 391
  Width = 457
  Height = 269
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1088#1072#1093#1091#1085#1082#1110#1074
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
    Top = 40
    Width = 449
    Height = 197
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = ds1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Styles.Header = cxStyle1
      object ID_SCH: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_SCH'
      end
      object ON_CHECK: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueGrayed = 2
        Properties.ValueUnchecked = 0
        Options.Filtering = False
        DataBinding.FieldName = 'ON_CHECK'
        IsCaptionAssigned = True
      end
      object SCH_NUMBER: TcxGridDBColumn
        Caption = #1056#1072#1093#1091#1085#1086#1082
        Options.Filtering = False
        DataBinding.FieldName = 'SCH_NUMBER'
      end
      object SCH_TITLE: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' '#1088#1072#1093#1091#1085#1082#1091
        Options.Filtering = False
        DataBinding.FieldName = 'SCH_TITLE'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 449
    Height = 40
    Align = alTop
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 231
      Top = 6
      Width = 100
      Height = 28
      Action = actOk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Glyph.Data = {
        B6020000424DB602000000000000760000002800000030000000180000000100
        0400000000004002000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD2DDD
        DDDDDDDDDDDDDDDDDDDD7DDDDDDDDDDDDDDDDDDDDDD222DDDDDDDDDDDDDDDDDD
        DDD777DDDDDDDDDDDDDDDDDDDD22222DDDDDDDDDDDDDDDDDDD77777DDDDDDDDD
        DDDDDDDDD2222222DDDDDDDDDDDDDDDDD7777777DDDDDDDDDDDDDDDD22322222
        2DDDDDDDDDDDDDDD778877777DDDDDDDDDDDDDD22333223222DDDDDDDDDDDDD7
        7888777777DDDDDDDDDDDD2277332D22222DDDDDDDDDDD7788887D77777DDDDD
        DDDDDD277732DDD22222DDDDDDDDDD788887DDD77777DDDDDDDDDD23732DDDDD
        D2222DDDDDDDDD78887DDDDDD7777DDDDDDDDDD272DDDDDDDD2222DDDDDDDDD7
        87DDDDDDDD7777DDDDDDDDDD2DDDDDDDDDD2222DDDDDDDDD7DDDDDDDDDD7777D
        DDDDDDDDDDDDDDDDDDDDD222DDDDDDDDDDDDDDDDDDDDD777DDDDDDDDDDDDDDDD
        DDDDDD222DDDDDDDDDDDDDDDDDDDDD777DDDDDDDDDDDDDDDDDDDDDDD22DDDDDD
        DDDDDDDDDDDDDDDD77DDDDDDDDDDDDDDDDDDDDDDDD2DDDDDDDDDDDDDDDDDDDDD
        DD7DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      NumGlyphs = 2
      UseSystemPaint = False
    end
    object cxButton2: TcxButton
      Left = 345
      Top = 6
      Width = 100
      Height = 28
      Action = actCancel
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
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
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = TR
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 110
    Top = 106
  end
  object DS: TpFIBDataSet
    Database = DB
    Transaction = TR
    SelectSQL.Strings = (
      'SELECT * FROM PC_SP_SCH_FOR_SYSTEM')
    Left = 76
    Top = 105
    poSQLINT64ToBCD = True
    object DSID_POS: TFIBBCDField
      FieldName = 'ID_POS'
      Size = 0
      RoundByScale = True
    end
    object DSID_REG: TFIBBCDField
      FieldName = 'ID_REG'
      Size = 0
      RoundByScale = True
    end
    object DSID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DSSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DSSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DSID_SESSION: TFIBBCDField
      FieldName = 'ID_SESSION'
      Size = 0
      RoundByScale = True
    end
  end
  object TR: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 42
    Top = 103
  end
  object ds1: TDataSource
    DataSet = SchOborotForm.RxMemoryData
    Left = 7
    Top = 70
  end
  object StPr: TpFIBStoredProc
    Database = DB
    Transaction = TR
    Left = 7
    Top = 104
  end
  object StyleRepository: TcxStyleRepository
    Left = 633
    Top = 123
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
  object actlst1: TActionList
    Left = 401
    Top = 67
    object actOk: TAction
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      OnExecute = actOkExecute
    end
    object actCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = actCancelExecute
    end
  end
end
