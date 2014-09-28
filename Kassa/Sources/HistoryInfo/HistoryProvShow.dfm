object fmHistoryProvShow: TfmHistoryProvShow
  Left = 220
  Top = 53
  Width = 800
  Height = 612
  Caption = 'fmHistoryProvShow'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 792
    Height = 38
    AutoSize = True
    ButtonHeight = 36
    ButtonWidth = 63
    Caption = 'ToolBar1'
    Flat = True
    Images = ImageList
    ShowCaptions = True
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      AutoSize = True
      Caption = 'ActionClose'
      ImageIndex = 0
      OnClick = ToolButton1Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 38
    Width = 792
    Height = 371
    Align = alClient
    TabOrder = 1
    object cxGrid1: TcxGrid
      Left = 1
      Top = 217
      Width = 790
      Height = 153
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleYellow
        Styles.Content = cxStyleYellow
        Styles.ContentEven = cxStyleYellow
        Styles.ContentOdd = cxStyleYellow
        Styles.Inactive = cxStyle4
        Styles.IncSearch = cxStyle14
        Styles.Selection = cxStyle17
        Styles.FilterBox = cxStyle9
        Styles.Footer = cxStyleBorder
        Styles.Group = cxStyleYellow
        Styles.GroupByBox = cxStyleYellow
        Styles.Header = cxStyleBorder
        Styles.Indicator = cxStyleYellow
        Styles.NewItemRowInfoText = cxStylemalinYellow
        Styles.Preview = cxStyleYellow
        object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
          Width = 94
          DataBinding.FieldName = 'SCH_KASS_NUMBER'
        end
        object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
          Width = 106
          DataBinding.FieldName = 'SCH_NUMBER'
        end
        object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
          Width = 124
          DataBinding.FieldName = 'SM_R_ST_KEKV'
        end
        object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
          Width = 285
          DataBinding.FieldName = 'TITLE_SMETA'
        end
        object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
          DataBinding.FieldName = 'SUMMA'
        end
        object cxGrid1DBTableView1DBColumn6: TcxGridDBColumn
          DataBinding.FieldName = 'USE_BEG'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object cxLabel10: TcxLabel
      Left = 8
      Top = 185
      Width = 289
      Height = 17
      AutoSize = False
      ParentFont = False
      TabOrder = 1
    end
    object cxLabel19: TcxLabel
      Left = 304
      Top = 185
      Width = 321
      Height = 17
      AutoSize = False
      ParentFont = False
      TabOrder = 2
    end
    object cxLabel9: TcxLabel
      Left = 8
      Top = 161
      Width = 289
      Height = 17
      AutoSize = False
      ParentFont = False
      TabOrder = 3
    end
    object cxLabel12: TcxLabel
      Left = 304
      Top = 161
      Width = 329
      Height = 17
      AutoSize = False
      ParentFont = False
      TabOrder = 4
    end
    object cxTextEditNum: TcxTextEdit
      Left = 264
      Top = 16
      Width = 89
      Height = 21
      Properties.Alignment.Horz = taRightJustify
      Properties.MaxLength = 10
      Style.Color = 15204351
      TabOrder = 5
      OnKeyPress = cxTextEditNumKeyPress
    end
    object cxTextEditSumma: TcxTextEdit
      Left = 617
      Top = 128
      Width = 113
      Height = 21
      TabStop = False
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.Color = 15204351
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      TabOrder = 6
      Text = '0,00'
      OnKeyPress = cxTextEditNumKeyPress
    end
    object cxTextEditAddNum: TcxTextEdit
      Left = 362
      Top = 16
      Width = 17
      Height = 21
      Properties.MaxLength = 1
      Style.Color = 15204351
      TabOrder = 7
      OnKeyPress = cxTextEditNumKeyPress
    end
    object cxTextEdit7: TcxTextEdit
      Left = 88
      Top = 72
      Width = 433
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Style.Color = 15204351
      TabOrder = 8
      OnKeyPress = cxTextEditNumKeyPress
    end
    object cxTextEdit6: TcxTextEdit
      Left = 464
      Top = 48
      Width = 89
      Height = 21
      Properties.Alignment.Horz = taRightJustify
      Properties.MaxLength = 6
      Style.Color = 15204351
      TabOrder = 9
    end
    object cxTextEdit5: TcxTextEdit
      Left = 264
      Top = 48
      Width = 89
      Height = 21
      Properties.Alignment.Horz = taRightJustify
      Properties.MaxLength = 6
      Style.Color = 15204351
      TabOrder = 10
    end
    object cxMemo1: TcxMemo
      Left = 88
      Top = 117
      Width = 433
      Height = 36
      Properties.MaxLength = 150
      Style.Color = 15204351
      TabOrder = 11
      OnKeyPress = cxTextEditNumKeyPress
    end
    object cxLabel7: TcxLabel
      Left = 0
      Top = 120
      Width = 75
      Height = 17
      AutoSize = False
      TabOrder = 12
      Caption = 'Osnovanie'
    end
    object cxLabel6: TcxLabel
      Left = 0
      Top = 76
      Width = 89
      Height = 17
      AutoSize = False
      TabOrder = 13
    end
    object cxLabel5: TcxLabel
      Left = 696
      Top = 13
      Width = 15
      Height = 24
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 14
      Caption = ')'
    end
    object cxLabel4: TcxLabel
      Left = 557
      Top = 14
      Width = 15
      Height = 24
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 15
      Caption = '('
    end
    object cxLabel3: TcxLabel
      Left = 381
      Top = 18
      Width = 33
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 16
      Caption = 'from'
    end
    object cxLabel22: TcxLabel
      Left = 355
      Top = 49
      Width = 110
      Height = 17
      AutoSize = False
      TabOrder = 17
      Caption = #1053#1086#1084#1077#1088' '#1089#1077#1088#1110#1111' '#1073#1083#1072#1085#1082#1091
    end
    object cxLabel21: TcxLabel
      Left = 181
      Top = 50
      Width = 84
      Height = 17
      AutoSize = False
      TabOrder = 18
      Caption = #1057#1077#1088#1110#1103' '#1073#1083#1072#1085#1082#1091
    end
    object cxLabel2: TcxLabel
      Left = 351
      Top = 10
      Width = 17
      Height = 33
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -24
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 19
      Caption = '/'
    end
    object cxLabel14: TcxLabel
      Left = 521
      Top = 131
      Width = 96
      Height = 17
      AutoSize = False
      TabOrder = 20
    end
    object cxLabel13: TcxLabel
      Left = 568
      Top = 14
      Width = 41
      Height = 24
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 21
      Caption = 'from'
    end
    object cxLabel1: TcxLabel
      Left = 0
      Top = 15
      Width = 265
      Height = 24
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 22
      Caption = 'Prihod/Rashod kassa order '#8470
    end
    object cxDateEdit2: TcxDateEdit
      Left = 608
      Top = 16
      Width = 89
      Height = 21
      TabStop = False
      TabOrder = 23
      OnKeyPress = cxTextEditNumKeyPress
      EditValue = 0d
    end
    object DateTimePicker1: TDateTimePicker
      Left = 416
      Top = 16
      Width = 137
      Height = 21
      CalColors.BackColor = 15204351
      CalColors.TitleTextColor = 15204351
      CalColors.MonthBackColor = 15204351
      Date = 38285.000000000000000000
      Time = 38285.000000000000000000
      Color = 15204351
      DateFormat = dfLong
      ParentShowHint = False
      ShowHint = False
      TabOrder = 24
      TabStop = False
      OnKeyPress = cxTextEditNumKeyPress
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 409
    Width = 792
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 100
    AlignSplitter = salBottom
    Control = Panel2
    OnAfterOpen = cxSplitter1AfterOpen
    OnAfterClose = cxSplitter1AfterClose
  end
  object Panel2: TPanel
    Left = 0
    Top = 417
    Width = 792
    Height = 161
    Align = alBottom
    TabOrder = 3
    object cxLabel15: TcxLabel
      Left = 2
      Top = 106
      Width = 103
      Height = 17
      AutoSize = False
      TabOrder = 0
    end
    object cxTextEdit4: TcxTextEdit
      Left = 112
      Top = 105
      Width = 660
      Height = 21
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
    end
    object cxLabel16: TcxLabel
      Left = 2
      Top = 15
      Width = 103
      Height = 17
      AutoSize = False
      TabOrder = 2
    end
    object cxTextEdit1: TcxTextEdit
      Left = 112
      Top = 13
      Width = 660
      Height = 21
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 3
    end
    object cxLabel17: TcxLabel
      Left = 2
      Top = 46
      Width = 103
      Height = 17
      AutoSize = False
      TabOrder = 4
    end
    object cxTextEdit2: TcxTextEdit
      Left = 112
      Top = 44
      Width = 660
      Height = 21
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 5
    end
    object cxLabel18: TcxLabel
      Left = 2
      Top = 77
      Width = 103
      Height = 17
      AutoSize = False
      TabOrder = 6
    end
    object cxTextEdit3: TcxTextEdit
      Left = 112
      Top = 75
      Width = 660
      Height = 21
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 7
    end
    object cxLabel8: TcxLabel
      Left = 2
      Top = 138
      Width = 103
      Height = 17
      AutoSize = False
      TabOrder = 8
    end
    object cxTextEdit8: TcxTextEdit
      Left = 112
      Top = 137
      Width = 657
      Height = 21
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 9
    end
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=Win1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 48
    Top = 296
  end
  object DataSet: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    SelectSQL.Strings = (
      'SELECT * FROM KASSA_SELECT_HISTORY_PROV_IN(1,1)')
    AfterScroll = DataSetAfterScroll
    Left = 96
    Top = 304
    poSQLINT64ToBCD = True
    object DataSetR_FIO_USER_DEL: TFIBStringField
      FieldName = 'R_FIO_USER_DEL'
      Size = 150
      EmptyStrToNull = True
    end
    object DataSetR_PRIZNAK_DEL: TFIBStringField
      FieldName = 'R_PRIZNAK_DEL'
      Size = 15
      EmptyStrToNull = True
    end
    object DataSetSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetID_SM: TFIBBCDField
      FieldName = 'ID_SM'
      Size = 0
      RoundByScale = True
    end
    object DataSetID_DEL: TFIBBCDField
      FieldName = 'ID_DEL'
      Size = 0
      RoundByScale = True
    end
    object DataSetUSE_END: TFIBDateTimeField
      FieldName = 'USE_END'
    end
    object DataSetUSE_BEG: TFIBDateTimeField
      FieldName = 'USE_BEG'
    end
    object DataSetID_USER: TFIBBCDField
      FieldName = 'ID_USER'
      Size = 0
      RoundByScale = True
    end
    object DataSetID_RAZD: TFIBBCDField
      FieldName = 'ID_RAZD'
      Size = 0
      RoundByScale = True
    end
    object DataSetID_ST: TFIBBCDField
      FieldName = 'ID_ST'
      Size = 0
      RoundByScale = True
    end
    object DataSetID_KEKV: TFIBBCDField
      FieldName = 'ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object DataSetID_DOG: TFIBBCDField
      FieldName = 'ID_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetKOD_DOG: TFIBBCDField
      FieldName = 'KOD_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetID_MAN: TFIBBCDField
      FieldName = 'ID_MAN'
      Size = 0
      RoundByScale = True
    end
    object DataSetID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetSUMMA_VALUE: TFIBBCDField
      FieldName = 'SUMMA_VALUE'
      Size = 2
      RoundByScale = True
    end
    object DataSetID_VALUE: TFIBBCDField
      FieldName = 'ID_VALUE'
      Size = 2
      RoundByScale = True
    end
    object DataSetSMETA_KOD: TFIBIntegerField
      FieldName = 'SMETA_KOD'
    end
    object DataSetRAZD_NUM: TFIBIntegerField
      FieldName = 'RAZD_NUM'
    end
    object DataSetKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object DataSetFIO_MAN: TFIBStringField
      FieldName = 'FIO_MAN'
      Size = 120
      EmptyStrToNull = True
    end
    object DataSetSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetSTAT_KOD: TFIBIntegerField
      FieldName = 'STAT_KOD'
    end
    object DataSetID_KASS_SH: TFIBBCDField
      FieldName = 'ID_KASS_SH'
      Size = 0
      RoundByScale = True
    end
    object DataSetSCH_KASS_NUMBER: TFIBStringField
      FieldName = 'SCH_KASS_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetTITLE_SMETA: TFIBStringField
      FieldName = 'TITLE_SMETA'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetTITLE_RAZD: TFIBStringField
      FieldName = 'TITLE_RAZD'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetTITLE_STATE: TFIBStringField
      FieldName = 'TITLE_STATE'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetTITLE_KEKV: TFIBStringField
      FieldName = 'TITLE_KEKV'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetDATE_DOG: TFIBDateField
      FieldName = 'DATE_DOG'
    end
    object DataSetNAME_CUST: TFIBStringField
      FieldName = 'NAME_CUST'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetTITLE_SCH: TFIBStringField
      FieldName = 'TITLE_SCH'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetTITLE_KOR_SCH: TFIBStringField
      FieldName = 'TITLE_KOR_SCH'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetTYPE_DOG: TFIBStringField
      FieldName = 'TYPE_DOG'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetREG_DOG: TFIBStringField
      FieldName = 'REG_DOG'
      Size = 12
      EmptyStrToNull = True
    end
    object DataSetNUM_DOG: TFIBStringField
      FieldName = 'NUM_DOG'
      EmptyStrToNull = True
    end
    object DataSetTIN: TFIBStringField
      FieldName = 'TIN'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetBIRTHDAY: TFIBDateField
      FieldName = 'BIRTHDAY'
    end
    object DataSetR_FIO_USER: TFIBStringField
      FieldName = 'R_FIO_USER'
      Size = 150
      EmptyStrToNull = True
    end
    object DataSetSM_R_ST_KEKV: TFIBStringField
      FieldName = 'SM_R_ST_KEKV'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 128
    Top = 312
  end
  object StyleRepository: TcxStyleRepository
    Left = 72
    Top = 296
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyleYellow: TcxStyle
      AssignedValues = [svColor]
      Color = 15204351
    end
    object cxStyleFontBlack: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleMalin: TcxStyle
      AssignedValues = [svColor]
      Color = 4194368
    end
    object cxStyleBorder: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveBorder
    end
    object cxStylemalinYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4194368
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15204351
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleGrid: TcxStyle
      AssignedValues = [svColor]
      Color = 10485760
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle4
      Styles.Content = cxStyle5
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Inactive = cxStyle13
      Styles.IncSearch = cxStyle14
      Styles.Selection = cxStyle17
      Styles.FilterBox = cxStyle8
      Styles.Footer = cxStyle9
      Styles.Group = cxStyle10
      Styles.GroupByBox = cxStyle11
      Styles.Header = cxStyle12
      Styles.Indicator = cxStyle15
      Styles.Preview = cxStyle16
      BuiltIn = True
    end
  end
  object ImageList: TImageList
    Left = 16
    Top = 289
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C3100009C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA5005A3118005A311800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA500FFE78C00FFE78C00313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A003131
      31009C3100009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA5000000000008080800FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000080808000000
      000000000000FF633100FFEFA500FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFDE8400FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFCE00FFFFBD00FFC6
      5A00FFA51000FF9C0000F7FFFF00FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000008080800F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100C65A0000FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C00009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300C65A0000C65A0000CE636300FFC65A00FF9C
      0000FF9C00009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300FFD67300FFD67300C65A0000CE636300FF9C
      0000FF9C00009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFDE8400FFDE8400FFDE8400FFDE8400C65A0000C65A
      0000C65A00009C31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF63310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FCFF000000000000FC3F000000000000
      FC1F000000000000F803000000000000F003000000000000F803000000000000
      D803000000000000D80300000000000000030000000000008003000000000000
      D803000000000000D003000000000000F803000000000000F803000000000000
      F803000000000000F80300000000000000000000000000000000000000000000
      000000000000}
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 168
    Top = 296
  end
end
