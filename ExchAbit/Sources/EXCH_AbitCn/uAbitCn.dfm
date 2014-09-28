object FormAbitCn: TFormAbitCn
  Left = 299
  Top = 107
  Width = 911
  Height = 708
  Caption = 'FormAbitCn'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxSplitterAllFilter: TcxSplitter
    Left = 0
    Top = 213
    Width = 903
    Height = 8
    Cursor = crHandPoint
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 100
    AlignSplitter = salTop
    AllowHotZoneDrag = False
    AutoPosition = False
    PositionAfterOpen = 141
    Control = cxGroupBoxAllFilter
  end
  object dxStatusBarVWF: TdxStatusBar
    Left = 0
    Top = 654
    Width = 903
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
      end>
    PaintStyle = stpsOffice11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object cxSplitterContracts: TcxSplitter
    Left = 511
    Top = 221
    Width = 8
    Height = 433
    Cursor = crHandPoint
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 43
    AlignSplitter = salRight
    PositionAfterOpen = 5
    Control = cxGroupBoxContracts
  end
  object cxGroupBoxContracts: TcxGroupBox
    Left = 519
    Top = 221
    Width = 384
    Height = 433
    Align = alRight
    Alignment = alTopLeft
    Caption = 'cxGroupBoxContracts'
    TabOrder = 3
    object cxGridPrKContracts: TcxGrid
      Left = 2
      Top = 49
      Width = 380
      Height = 199
      Align = alClient
      TabOrder = 0
      object cxGridPrKContractsDBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourceContrakts
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleBackGround_Content
        Styles.Content = cxStyleBackGround_Content
        Styles.Inactive = cxStyleInactive
        Styles.Selection = cxStyleSelection
        Styles.Header = cxStyleHeader
        object colNUM_DOG: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortOrder = soAscending
          Width = 114
          DataBinding.FieldName = 'NUM_DOG'
        end
        object colDATE_DOG: TcxGridDBColumn
          Width = 91
          DataBinding.FieldName = 'DATE_DOG'
        end
        object colSUMMA: TcxGridDBColumn
          Width = 81
          DataBinding.FieldName = 'SUMMA'
        end
        object cxGridPrKContractsDBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1057#1090#1072#1085
          DataBinding.FieldName = 'SIGN_TEXT'
        end
      end
      object cxGridPrKContractsLevel1: TcxGridLevel
        GridView = cxGridPrKContractsDBTableView1
      end
    end
    object cxGroupBoxDataDog: TcxGroupBox
      Left = 2
      Top = 248
      Width = 380
      Height = 183
      Align = alBottom
      Alignment = alTopLeft
      TabOrder = 1
      object cxLabelNAME_DOG_STATUS: TcxLabel
        Left = 9
        Top = 76
        Width = 113
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
      end
      object cxDBTextEditNAME_DOG_STATUS: TcxDBTextEdit
        Left = 124
        Top = 75
        Width = 163
        Height = 21
        TabStop = False
        DataBinding.DataField = 'NAME_DOG_STATUS'
        DataBinding.DataSource = DataSourceContrakts
        Style.StyleController = cxEditStyleControllerVWF
        TabOrder = 1
      end
      object cxDBTextEditNAME_DOG_TYPE: TcxDBTextEdit
        Left = 125
        Top = 99
        Width = 163
        Height = 21
        TabStop = False
        DataBinding.DataField = 'NAME_DOG_TYPE'
        DataBinding.DataSource = DataSourceContrakts
        Style.StyleController = cxEditStyleControllerVWF
        TabOrder = 2
      end
      object cxLabelNAME_DOG_TYPE: TcxLabel
        Left = 9
        Top = 101
        Width = 113
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 3
      end
      object cxLabelMFO: TcxLabel
        Left = 9
        Top = 125
        Width = 113
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 4
      end
      object cxDBTextEditMFO: TcxDBTextEdit
        Left = 125
        Top = 123
        Width = 163
        Height = 21
        TabStop = False
        DataBinding.DataField = 'MFO'
        DataBinding.DataSource = DataSourceContrakts
        Style.StyleController = cxEditStyleControllerVWF
        TabOrder = 5
      end
      object cxLabelFIO_PAYER: TcxLabel
        Left = 9
        Top = 149
        Width = 113
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 6
      end
      object cxDBTextEditFIO_PAYER: TcxDBTextEdit
        Left = 125
        Top = 147
        Width = 163
        Height = 21
        TabStop = False
        DataBinding.DataField = 'MFO'
        DataBinding.DataSource = DataSourceContrakts
        Style.StyleController = cxEditStyleControllerVWF
        TabOrder = 7
      end
      object LABEL_OWNER: TcxLabel
        Left = 9
        Top = 28
        Width = 113
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 8
        Caption = #1042#1083#1072#1089#1085#1080#1082
      end
      object LABEL_SIGNED: TcxLabel
        Left = 9
        Top = 52
        Width = 113
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 9
        Caption = #1055#1110#1076#1087#1080#1089#1072#1074#1096#1080#1081
      end
      object cxDBTextEditID_USER_OWNER: TcxDBTextEdit
        Left = 124
        Top = 27
        Width = 163
        Height = 21
        TabStop = False
        DataBinding.DataField = 'FIO_OWNER'
        DataBinding.DataSource = DataSourceContrakts
        Style.StyleController = cxEditStyleControllerVWF
        TabOrder = 10
      end
      object cxDBTextEditID_USER_PODPIS: TcxDBTextEdit
        Left = 124
        Top = 51
        Width = 163
        Height = 21
        TabStop = False
        DataBinding.DataField = 'FIO_SIGN'
        DataBinding.DataSource = DataSourceContrakts
        Style.StyleController = cxEditStyleControllerVWF
        TabOrder = 11
      end
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 15
      Width = 380
      Height = 34
      Align = alTop
      TabOrder = 2
      object cxDateEditEnd: TcxDateEdit
        Left = 232
        Top = 7
        Width = 113
        Height = 21
        Style.Color = 16776176
        TabOrder = 0
      end
      object cxDateEditBeg: TcxDateEdit
        Left = 64
        Top = 7
        Width = 113
        Height = 21
        Style.Color = 16776176
        TabOrder = 1
      end
      object cxLabelDateBeg: TcxLabel
        Left = 5
        Top = 10
        Width = 44
        Height = 17
        AutoSize = False
        ParentFont = False
        TabOrder = 2
      end
      object cxLabelDateEnd: TcxLabel
        Left = 184
        Top = 10
        Width = 44
        Height = 17
        AutoSize = False
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  object cxGridPrKViewWithFilter: TcxGrid
    Left = 0
    Top = 221
    Width = 511
    Height = 433
    Align = alClient
    TabOrder = 4
    object cxGridPrKViewWithFilterDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSourcePrKViewWithFilter
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxGridPrKViewWithFilterDBTableView1CustomDrawCell
      OptionsBehavior.CellHints = True
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleBackGround_Content
      Styles.Content = cxStyleBackGround_Content
      Styles.Inactive = cxStyleInactive
      Styles.Selection = cxStyleSelection
      Styles.Header = cxStyleHeader
      object colFIO: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        SortOrder = soAscending
        Width = 129
        DataBinding.FieldName = 'FIO'
      end
      object colNOMER_DELA: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 46
        DataBinding.FieldName = 'NAB'
      end
      object colSHORT_NAME_FAK: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 63
        DataBinding.FieldName = 'SHORT_NAME_fak'
      end
      object colSHORT_NAME_SPEC: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 103
        DataBinding.FieldName = 'NSPEC'
      end
      object colSHORT_NAME_FORM_STUD: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 103
        DataBinding.FieldName = 'NFOR'
      end
      object colSHORT_NAME_KAT_STUD: TcxGridDBColumn
        Width = 42
        DataBinding.FieldName = 'NAMESP'
      end
      object colIS_LOCKED: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Width = 23
        DataBinding.FieldName = 'contract'
      end
    end
    object cxGridPrKViewWithFilterLevel1: TcxGridLevel
      GridView = cxGridPrKViewWithFilterDBTableView1
    end
  end
  object cxGroupBoxAllFilter: TcxGroupBox
    Left = 0
    Top = 72
    Width = 903
    Height = 141
    Align = alTop
    Alignment = alTopCenter
    Caption = #1060#1080#1083#1100#1090#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    LookAndFeel.Kind = lfUltraFlat
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 9
    Ctl3D = True
    object cxRadioButtonToday: TcxRadioButton
      Left = 14
      Top = 105
      Width = 153
      Height = 17
      Cursor = crHandPoint
      Caption = 'cxRadioButtonToday'
      Checked = True
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
      TabStop = True
    end
    object cxRadioButtonAll: TcxRadioButton
      Left = 198
      Top = 105
      Width = 153
      Height = 17
      Cursor = crHandPoint
      Caption = 'cxRadioButtonAll'
      Color = clBtnFace
      ParentColor = False
      TabOrder = 1
    end
    object cxLookupComboBoxSpec: TcxLookupComboBox
      Left = 144
      Top = 21
      Width = 433
      Height = 21
      TabStop = False
      AutoSize = False
      Properties.AutoSelect = False
      Properties.KeyFieldNames = 'ID_REC'
      Properties.ListColumns = <
        item
          Caption = 'NSPEC'
          Sorting = False
          FieldName = 'NSPEC'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataSourceSpec
      TabOrder = 2
    end
    object cxLabelSpec: TcxLabel
      Left = 13
      Top = 26
      Width = 108
      Height = 17
      AutoSize = False
      ParentFont = False
      TabOrder = 3
      Caption = 'cxLabelSpec'
    end
    object cxTextFIO: TcxTextEdit
      Left = 144
      Top = 72
      Width = 433
      Height = 21
      TabOrder = 4
      OnKeyPress = cxTextFIOKeyPress
    end
    object cxLabelFIO: TcxLabel
      Left = 13
      Top = 74
      Width = 108
      Height = 17
      AutoSize = False
      ParentFont = False
      TabOrder = 5
      Caption = 'cxLabelFIO'
    end
    object cxTextEditTIN: TcxTextEdit
      Left = 144
      Top = 47
      Width = 433
      Height = 21
      TabOrder = 6
      OnKeyPress = cxTextEditTINKeyPress
    end
    object cxLabelTIN: TcxLabel
      Left = 13
      Top = 48
      Width = 124
      Height = 17
      AutoSize = False
      ParentFont = False
      TabOrder = 7
      Caption = 'cxLabelTIN'
    end
    object cxButtonFiltr: TcxButton
      Left = 440
      Top = 100
      Width = 133
      Height = 30
      Cursor = crHandPoint
      Action = ActionObnov
      DragCursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      Glyph.Data = {
        82040000424D8204000000000000420200002800000018000000180000000100
        08000000000040020000120B0000120B0000830000008300000000000000FFFF
        FF00FF00FF00FC00FC0076037600FF78FF00FA95FA00FF7E0000E2AB6F00C47B
        0000DAAB1F00E0B73B00E0B83B00E3C15200E3C15300E6C65B00E5C65B00E7C9
        6600EDD78A00EFDC9800F6E9BD00F8F2D4001491100000830100008200000081
        0000007700000076000000730000006F00000066000000620000005E00000058
        0000004F0000004E0000004B0000005A0100018603000169020002880500038B
        0700015D04000381080002600500025E050003760800048E0A0003600600055E
        080005900D0006920F0004640A000796130005670D000786120009981600076A
        0F000C7315000A9A19000A9A1A000C9D1D000A8C1B000DA021000EA324001080
        1E00148823001CA92F0019932B000FA4280010A528001C9A310011A72C0011A7
        2D0013AB30001E9E340020A539002FD8500015AD3500189D33001DA5390023AC
        40002FD851002FD7510028B5450028B4450032A54B0016B0390018B23D0028CC
        4F0027B5480033CC580019B641001AB641001CB8450034CC59001BB845001DBB
        49001FBF4D002EBB550021C2500023C5530026C9560028CC59002ACF5B002DD3
        5E002FD7620031D9640034DD670036E16A003BE76F003EEB730041EF760045F6
        7B0047F87E0049FB80004BFE820045F67F0045F6800081FFFE007FFAF80054E6
        F70000D7F40000CCE90000C9E30000C4E00000B1CA0000A6BD000A4A52000D5A
        64000D5862000202020202020202020202020202020202020202020202020202
        020202020202020224242424020202020202020202020202020202020202022D
        59765219240202020202020202020202020202020202022D59764D1924020202
        0202020202020202020202020202022D59765319240202020202020202020202
        020202020202022D59755319240202020202020202020202020202020202022D
        59764D19240202020202020202020202020202020202022D5663431622020202
        02020202020202020202020202022D4F655D493C2B2302020202020202020202
        02020202022D506964584638291A23020202020202020202020202022D516D68
        6257403528191B2302020202020202020202022D55706C67614E3F332619191B
        230202020202020202022D54736F6B665E4A3D32171919191B23020202020202
        022D5474726E6A655C483B2F18191919191B2302020202022D4B5F4B47413936
        34302A252121201E1E1C1D230202022D2424211F272E373E777B7E7F805A4C4B
        423A242424022D211B19090909093C454E787C7D7C8271747474745F3124022D
        2C090F0D0B0A09454E60777A7A7A815B4B4405242402020202081312110C0924
        242424777A812424240505040202020202081514120E09020202020279020202
        0605030404020202020801151310070202020202020202060603030304040202
        0202080808080202020202020202020206060304040202020202020202020202
        0202020202020202020605040202020202020202020202020202020202020202
        020205020202}
      UseSystemPaint = False
    end
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 456
  end
  object DataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    Left = 164
    Top = 458
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 67
    Top = 456
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 94
    Top = 456
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 191
    Top = 458
  end
  object FormStoragePrK: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 120
    Top = 456
  end
  object ErrorHandlerPrK: TpFibErrorHandler
    Top = 456
  end
  object DataSetContrakts: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'Select * from EXCH_NST_DOG_INFO_SELECT(1,1)')
    AfterOpen = DataSetContraktsAfterOpen
    Left = 680
    Top = 345
    poSQLINT64ToBCD = True
    object DataSetContraktsID_DT_NST_DOG: TFIBBCDField
      FieldName = 'ID_DT_NST_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetContraktsID_DOG: TFIBBCDField
      FieldName = 'ID_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetContraktsNUM_DOG: TFIBStringField
      FieldName = 'NUM_DOG'
      Size = 75
      EmptyStrToNull = True
    end
    object DataSetContraktsDATE_DOG: TFIBDateField
      FieldName = 'DATE_DOG'
    end
    object DataSetContraktsID_DOG_STATUS: TFIBBCDField
      FieldName = 'ID_DOG_STATUS'
      Size = 0
      RoundByScale = True
    end
    object DataSetContraktsID_TYPE_DOG: TFIBBCDField
      FieldName = 'ID_TYPE_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetContraktsSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetContraktsNAME_DOG_STATUS: TFIBStringField
      FieldName = 'NAME_DOG_STATUS'
      Size = 80
      EmptyStrToNull = True
    end
    object DataSetContraktsNAME_DOG_TYPE: TFIBStringField
      FieldName = 'NAME_DOG_TYPE'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetContraktsID_PAYER: TFIBBCDField
      FieldName = 'ID_PAYER'
      Size = 0
      RoundByScale = True
    end
    object DataSetContraktsID_TYPE_PAYER: TFIBBCDField
      FieldName = 'ID_TYPE_PAYER'
      Size = 0
      RoundByScale = True
    end
    object DataSetContraktsID_RATE_ACCOUNT: TFIBBCDField
      FieldName = 'ID_RATE_ACCOUNT'
      Size = 0
      RoundByScale = True
    end
    object DataSetContraktsID_TYPE_STAGE: TFIBBCDField
      FieldName = 'ID_TYPE_STAGE'
      Size = 0
      RoundByScale = True
    end
    object DataSetContraktsPERSENT_OF_PAYER: TFIBFloatField
      FieldName = 'PERSENT_OF_PAYER'
    end
    object DataSetContraktsSUMMA_OF_PAYER: TFIBBCDField
      FieldName = 'SUMMA_OF_PAYER'
      Size = 2
      RoundByScale = True
    end
    object DataSetContraktsFIO_PAYER: TFIBStringField
      FieldName = 'FIO_PAYER'
      Size = 85
      EmptyStrToNull = True
    end
    object DataSetContraktsMFO: TFIBStringField
      FieldName = 'MFO'
      Size = 16
      EmptyStrToNull = True
    end
    object DataSetContraktsRATE_ACCOUNT: TFIBStringField
      FieldName = 'RATE_ACCOUNT'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetContraktsNAME_STAGE: TFIBStringField
      FieldName = 'NAME_STAGE'
      EmptyStrToNull = True
    end
    object DataSetContraktsISPERCENT: TFIBSmallIntField
      FieldName = 'ISPERCENT'
    end
    object DataSetContraktsID_GROUP: TFIBBCDField
      FieldName = 'ID_GROUP'
      Size = 0
      RoundByScale = True
    end
    object DataSetContraktsID_NATIONAL: TFIBBCDField
      FieldName = 'ID_NATIONAL'
      Size = 0
      RoundByScale = True
    end
    object DataSetContraktsDATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
    end
    object DataSetContraktsDATE_END: TFIBDateField
      FieldName = 'DATE_END'
    end
    object DataSetContraktsIS_DOG_LOCKED: TFIBSmallIntField
      FieldName = 'IS_DOG_LOCKED'
    end
    object DataSetContraktsVIDPR: TFIBStringField
      FieldName = 'VIDPR'
      Size = 1
      EmptyStrToNull = True
    end
    object DataSetContraktsID_USER_OWNER: TFIBBCDField
      FieldName = 'ID_USER_OWNER'
      Size = 0
      RoundByScale = True
    end
    object DataSetContraktsIS_SIGNED: TFIBSmallIntField
      FieldName = 'IS_SIGNED'
    end
    object DataSetContraktsID_USER_PODPIS: TFIBBCDField
      FieldName = 'ID_USER_PODPIS'
      Size = 0
      RoundByScale = True
    end
    object DataSetContraktsSIGN_TEXT: TFIBStringField
      FieldName = 'SIGN_TEXT'
      Size = 15
      EmptyStrToNull = True
    end
    object DataSetContraktsFIO_OWNER: TFIBStringField
      FieldName = 'FIO_OWNER'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetContraktsFIO_SIGN: TFIBStringField
      FieldName = 'FIO_SIGN'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object DataSourceContrakts: TDataSource
    DataSet = DataSetContrakts
    Left = 712
    Top = 345
  end
  object StoredProcContracts: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 741
    Top = 345
  end
  object ImageListViewWithFilter: TImageList
    Left = 16
    Top = 305
    Bitmap = {
      494C01010B000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006C6A6A006C6A6A0000000000000000006C6A6A006C6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00E0E0
      E000D8D8D800D8D8D800E0E0E000F0F0F000FCFCFC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C6A
      6A00AAA7A700A19F9F006C6A6A006C6A6A006C6A6A00E5E3E3006C6A6A006C6A
      6A006C6A6A000000000000000000000000000000000000000000000000000000
      0000824B4B00824B4B00A64B4B00A94D4D004E1E1F0000000000000000000000
      00000000000000000000000000000000000000000000F8F8F8004C4C4C005454
      54006363630060606000555555004D4D4D006969690087878700AAAAAA00CFCF
      CF00EFEFEF00FBFBFB00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006C6A6A00DAD9
      D900A19F9F00A19F9F00A19F9F0037363600353535006C6D6D00BFBFBF00E1E2
      E200B7B6B6006C6A6A006C6A6A006C6A6A000000000000000000824B4B00824B
      4B00B64F5000C24F5000C54D4E00B24D4E004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B000000000000000000DADADA00B4B4B400C7C7
      C700D5D5D500E8E8E800FAFAFA00FFFFFF00FFFFFF00F2F2F200B0B0B0005F5F
      5F00505050005D5D5D0080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006C6A6A00D4D3D300CACA
      CA008E8C8C008E8C8C008E8C8C003C3B3B000A090A00070707000B0B0B000707
      07007A7A7A00BBBBBB006C6A6A00000000000000000000000000824B4B00D458
      5900CB555600C9545500C9525300B74F52004E1E1F00FE8B8C00FB9A9C00F8AA
      AB00F7B5B600F7B5B600824B4B000000000000000000C1C1C100B5B5B500C8C8
      C8003C3C3C0088888800F2F2F200E9E9E900E9E9E900E9E9E900FDFDFD00FDFD
      FD00FCFCFC00FDFDFD007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6A6A00CACACA00CACACA008E8C
      8C00D7D4D400CECBCB00BFBCBC00B1AFAF00A3A0A000888686005E5B5C000707
      070009090900080808006C6A6A00767373000000000000000000824B4B00D75C
      5D00D05A5B00CF595A00CF575800BD5356004E1E1F0023B54A0013C1480016BD
      48000CBC4100F7B5B600824B4B000000000000000000D8D8D800A9A9A9006767
      67001010100047474700D6D6D600FDFDFD00F5F5F500E9E9E900E8E8E800FAFA
      FA00E4E4E400F4F4F400A7A7A700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6A6A00CACACA008E8C8C00EFEE
      EE00FFFEFE00FBFAFA00E3E0E100DEDEDE00DEDDDD00CFCECE00BDBCBC00ADAB
      AB008B898900585656007A787800757373000000000000000000824B4B00DD63
      6400D75F6000D55E5F00D55C5D00C2575A004E1E1F002AB44D001CBF4C001EBC
      4C0013BC4500F7B5B600824B4B000000000000000000DDDDDD009B9B9B000A0A
      0B007E7E7E00D8D8D800010101007A7A7A00FBFBFB00F5F5F500E7E7E700E7E7
      E700F4F4F400E0E0E000B9B9B900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6A6A008E8C8C00FFFFFF00FEFC
      FC00FAFAFA00D5D4D50098919300A0989900B2ABAC00C4C0C100D7D7D700D8D8
      D800C7C6C600B7B6B600918F8F006C6969000000000000000000824B4B00E368
      6900DD656600DA636400DE666700C6595B004E1E1F0026B1490016BC48001BBB
      490010BB4300F7B5B600824B4B000000000000000000D5D5D500B8B8B800ADAD
      BC0078787800252525003D3D3D0027272700B6B6B600F9F9F900F0F0F000DFDF
      DF00EAEAEA00C8C8C800C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006C6A6A006C6A6A00EDEB
      EB00B1A6A7007A6F72008A83880096929500969091009D9798009A9395009E98
      9900BBBABA00D1D1D100C2C2C2006C6A6A000000000000000000824B4B00EB6D
      6E00E2676800E67E7F00FAD3D400CC6E70004E1E1F00A5D8970050D16F0042C9
      66002DC75800F7B5B600824B4B000000000000000000D1D1D100B8B8B800BBBB
      CE00DADADA002727270050505000BFBFBF0023232300B8B8B800E7E7E700DCDC
      DC00E5E5E500AEAEAE00CFCFCF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C6A
      6A00BB897F00A7876D008B6F64007D6760006F626500797379008F8B8E00A9A3
      A400CBCACA00C1C1C1006C6A6A00000000000000000000000000824B4B00F273
      7400E96C6D00EB818200FCD1D300CF6E70004E1E1F00FFF2CC00FFFFD700FFFF
      D400E6FCC700F7B5B600824B4B000000000000000000CDCDCD0001010100BABA
      CD00E1E1E100E8E8E800959595007A7A7A00080808001C1C1C007E7E7E00DDDD
      DD00D3D3D30099999900D5D5D500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD828100FFE3B400FFD39F00E9B28100C9997300BA916C00BD828100807D
      7E006C6A6A006C6A6A0000000000000000000000000000000000824B4B00F878
      7900F0757600EE727300F0737400D16566004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD700F7B5B600824B4B000000000000000000CCCCCC00C5C5C500C8C8
      DE00EFEFEF00FEFEFE00FEFEFE007B7B7B0006060600E4E4E400D9D9D9004646
      4600BABABA0091919100D5D5D500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD828100FFE0B800FFD3A700FFD09D00FFCE9000FFC68800BD8281000000
      0000000000000000000000000000000000000000000000000000824B4B00FE7F
      8000F77A7B00F6797A00F7777900D76B6B004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B000000000000000000CFCFCF00C2C2C200C4C4
      DA00E8E8E800F7F7F700FAFAFA00F1F1F1001A1A1A0024242400878787004242
      42008787870089898900CDCDCD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C086
      8300FFE7CF00FFE0C000FFD9B200FFD3A500FFD09900BD828100000000000000
      0000000000000000000000000000000000000000000000000000824B4B00FF83
      8400FC7F8000FB7E7F00FE7F8000DA6E6F004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B000000000000000000D5D5D500BABABA00B2B2
      C600D2D2D200E3E3E300F4F4F400F4F4F400F4F4F400181818002F2F2F005151
      51004C4C4C004D4D4D00C5C5C500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD82
      8100FEEBD800FFE6CC00FFDEBD00FFD8B100FED3A400BD828100000000000000
      0000000000000000000000000000000000000000000000000000824B4B00FF88
      8900FF828300FF818200FF828300E07374004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B000000000000000000E2E2E200A5A5A500A4A4
      B700C1C1C100CDCDCD00D8D8D800E8E8E800EDEDED00EAEAEA00242424007575
      75003D3D3D0009090900D6D6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD828100FFFF
      F200FFFFF200FFEBD800FFE5CA00FFE1BD00F3C7A700BD828100000000000000
      0000000000000000000000000000000000000000000000000000824B4B00824B
      4B00E2757600FE818200FF868700E57677004E1E1F00FAEBC500FCFBD100FCFB
      CF00FCFBD100F7B5B600824B4B000000000000000000F4F4F4003B3B3B00B8B8
      B800C7C7C700D5D5D500E1E1E100E4E4E400E5E5E500E6E6E600C3C3C3009383
      73009F8D81003B2F260000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD828100BD82
      8100BD828100FBEFE200FBE3CF00FBDDC200BD82810000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000824B4B009C565700CB6C6D00CF6E6E004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B000000000000000000FCFCFC009E9E9E00A5A5
      A500ADADAD00B7B7B700C2C2C200CBCBCB00D1D1D100D7D7D700D0D0D000D4C6
      BC0093847900FCFCFC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD828100BD828100BD8281000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000824B4B00824B4B004E1E1F0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FEFEFE000000
      000000000000FEFEFE00FDFDFD00F6F6F600E0E0E000D1D1D100CDCDCD00B3A4
      9600FCFCFC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C3100009C3100000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D40000000000EF42
      0000AD290000AD29000073290000732900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA5005A3118005A311800000000000000
      000000000000000000000000000000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400FF9C1800FFF7
      E700AD290000AD29000073290000732900000000000097736B00B3887F00B184
      7C00B1847C00B1847C00B1857D00B1857D00B1857E00B0857D00AE857E00AA83
      7C00B0858000B48A7C00875D56000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA500FFE78C00FFE78C00313131000000
      000000000000000000000000000000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400FF9C1800FFF7
      E700AD290000AD290000732900007329000000000000B3938C00F1DCCA00FCDB
      C400FCDAC600FCDBC700FAD5BA00FED6BC00FFD4B600FAD3B600F6CFB000F1CD
      AE00F5CEA800FDCFAD009D706A000000000000000000FFF7E700FFD6A500FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A003131
      31009C3100009C3100000000000000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400000000000000
      0000AD290000AD290000732900007329000000000000B3969000ECE8D600FFF2
      D400E4E6BE00E3E1B900FFEAD300F4E1B600E9E3AF00FDDDB700FDD8AD00FAD5
      A700F6D6A200FCD8B600A07272000000000000000000FFF7E700F7DEC600F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7CE00F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400000000000000
      0000AD290000AD290000732900007329000000000000BB9F9000ECEFE500FFFA
      EC00A9D38F00009A0000029B050000980000009D000000930000269D2300D5CD
      9800FFD7AC00FED7BA009E7070000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00EFDECE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA5000000000008080800FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C18000000000000000000EF42
      0000AD290000AD2900007329000073290000FF9C1800FF9C1800000000000000
      0000AD290000AD290000732900007329000000000000C0A49800EFF1EA00FFFB
      F400AAD89900009400000098000010A016009CCE9100AFC791002FA826005FB5
      4F00F6DAB100FFDEC6009E7170000000000000000000FFF7E70045454500FFD6
      A50045454500FFD6A5001F1F1F00FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6300000000000000000000000000000000000000000000000000080808000000
      000000000000FF633100FFEFA500FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C3100007329000073290000FF9C1800F7FFFF00000000000000
      0000AD290000AD290000732900007329000000000000C4A7A000EFF5E900FFFC
      F700B3DCA300019D01000DA10B001DA41C0051B14300F0E5C400F4E2C3005FB4
      5B00D9D29D00FFDDC600A77A74000000000000000000FFFFEF00F7DEC600FFDE
      C600F7DEC6001F1F1F001F1F1F00F7DEC600F7DEBD00F7E7CE00EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFDE8400FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD290000732900007329000000000000CAACA100F4FAF200F2F7
      E500DCEBCE00FBF4E600F5F3DF00F9F1DA00FEE7CD00FEEBD800FFECDB00F7E6
      CD00F0DEB600FEDAC100AB7D75000000000000000000FFFFEF00F7E7CE00FFDE
      C6001F1F1F001F1F1F001F1F1F00F7DEC600F7DEC600F7E7D600EFDECE009C6B
      6B000000000000000000000000000000000000000000FFFFCE00FFFFBD00FFC6
      5A00FFA51000FF9C0000F7FFFF00FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FFA53900FFA53900F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD2900008C3921008C39210000000000D2B5A000F6FAFA00E6F7
      E1008AD38800EDF3DF00FFFCF900C0DEAA004AB0390053B4430049B13C00C5D5
      9F00FFE8D000FDE1CC00AA7E76000000000000000000FFFFF700FFD6A5001F1F
      1F008484840000FFFF001F1F1F00FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      00000000000008080800F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000C8D0D400FFA53900FFA53900EF42
      0000EF420000AD290000732900008C392100FFA53900FF9C1800000000000000
      0000AD2900008C3921008C392100C8D0D40000000000D1B4A100F4FAF800FFFF
      FD008FCF910049B95100E2EFD800FFF9EA0063BB64000093000000910000AAD0
      8D00FFEED900FEDFCA00AC7F77000000000000000000FFFFF700FFE7D6001F1F
      1F00C6C6C60000FFFF001F1F1F00FFE7D6000000000000000000000000009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000C8D0D400C8D0D400FFA53900FFF7
      E700EF420000AD290000732900008C392100FFA53900FFF7E700000000000000
      00008C3921008C392100C8D0D400C8D0D40000000000DBBDA300F6FDFA00FFFF
      FF00E9F4E5003AAA350018A519005FC0590036AD33000099000000950000AAD4
      8F00FFF6E200FCDCC800AF847D000000000000000000FFFFFF001F1F1F008484
      840000FFFF001F1F1F00FFFFF700FFFFF70000000000FFFFFF00C68C7B00C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100C65A0000FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C00009C3100000000000000000000C8D0D400C8D0D400FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D40000000000E1C3A300F6FDFB00F8FC
      F800FFFFFF00C4EBCC0021AA2500009500000094000012A414000D9F1100A5CC
      8B00FFCAC000F8ADA100AC7E760000000000000000004545450084848400C6C6
      C60000FFFF001F1F1F00FFFFFF00FFFFFF0000000000C68C7B00C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300C65A0000C65A0000CE636300FFC65A00FF9C
      0000FF9C00009C3100000000000000000000C8D0D400C8D0D400FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D40000000000E6C9A900F9FFFE00F8FC
      F800F8FCF800F8FCF800FBFEFA00FFFFFF00FFFFFF00FEFEF800FFFFFE00C9AA
      9700D4975200C79A7A00C3AEA20000000000000000001F1F1F001F1F1F0000FF
      FF001F1F1F0000000000000000000000000000000000C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300FFD67300FFD67300C65A0000CE636300FF9C
      0000FF9C00009C3100000000000000000000C8D0D400C8D0D400C8D0D400FFA5
      3900FF9C1800EF4200008C392100C8D0D400C8D0D400FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D40000000000E8CBAC00FBFFFF00FAFF
      FF00FAFFFF00FAFFFF00FAFEFD00F9FEFD00F4FBFB00F3FBF800F7FFFC00C6AA
      9800D09E7300DCC9B60000000000000000001F1F1F0000008400000084001F1F
      1F00C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFDE8400FFDE8400FFDE8400FFDE8400C65A0000C65A
      0000C65A00009C3100000000000000000000C8D0D400C8D0D400C8D0D400FFA5
      3900F7FFFF00EF4200008C392100C8D0D400C8D0D400FFA53900F7FFFF000000
      00008C392100C8D0D400C8D0D400C8D0D40000000000E7C29D00E1C6A500E2C6
      A600E2C6A600E2C6A600E2C4A400E1C3A300DDC1A100DCC0A000DEC3A300C29C
      8400DECCB800000000000000000000000000C8D0D4001F1F1F001F1F1F001F1F
      1F00C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF6331000000000000000000C8D0D400C8D0D400C8D0D400FFCE
      6300FFCE6300FFA53900FFA53900C8D0D400C8D0D400FFCE6300FFA53900FFA5
      39008C392100C8D0D400C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00FFFFE700F7EFDE00FFFFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7E7CE008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600EFDE
      CE00EFDECE008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00FFFFE700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500EFDECE008C5A5A0000000000000000000000000000000000000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      840000008400000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000848300000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C008C5A5A008C5A5A008C5A
      5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7
      CE00EFDECE009C6B630000000000000000000000000000000000000084000000
      8400000084008484840000000000000000000000000000000000000084000000
      840084848400000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500F7E7CE008C5A5A00000000000000000000000000000000000000
      0000000000000084830000FFFE00008483000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7E700F7EFDE00F7EF
      DE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7E7
      D600EFDECE009C6B6B0000000000000000000000000000000000000000000000
      8400000084000000840084848400000000000000000000008400000084000000
      84000000000000000000000000000000000000000000000000000000FF00B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00F7E7CE008C5A5A00000000000000000000000000000000000000
      000000FFFE0000FFFE0000FFFE0000FFFE000084830000000000000000000000
      000000000000000000000000000000000000B58C8C00F7EFDE00F7DECE00F7DE
      C600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A5004C804C004C804C004C80
      4C004C804C00A57B730000000000000000000000000000000000000000000000
      0000000084000000840000008400848484000000840000008400000084000000
      00000000000000000000000000000000000000000000000000000000FF000000
      8400F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC6000000
      FF00EFDECE00EFDECE008C5A5A000000000000000000000000000000000000FF
      FE0000FFFE00848484008484840000FFFE0000FFFE0000848300000000000000
      000000000000000000000000000000000000B58C8C00FFF7E700FFD6A500FFD6
      A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D6004C804C0052AE570052AE
      57004C804C00A57B730000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000008400FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500000084000000
      FF00FFD6A500EFDECE009C6B63000000000000000000000000008484840000FF
      FE008484840000000000000000008484840000FFFE0000FFFE00008483000000
      000000000000000000000000000000000000B58C8C00FFF7EF00F7DEC600F7DE
      C600B58C8C00FFFFFF00FFFFFF004C804C004C804C004C804C0052AE570052AE
      57004C804C004C804C004C804C00000000000000000000000000000000000000
      00000000000000000000000084000000FF000000840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000006C6C
      FF0000008400F7DEC600F7DEC600F7DEC600F7DEC600000084000000FF00F7DE
      BD00F7E7CE00EFDECE009C6B6B00000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000FFFE0000FFFE000084
      830000000000000000000000000000000000B58C8C00FFF7EF00F7E7CE00F7DE
      C600B58C8C00FFFFFF00FFFFFF004C804C0052AE570052AE570052AE570052AE
      570052AE570052AE57004C804C00000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400848484000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C000000FF0000008400F7DEC600F7DEC600000084000000FF00F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFE0000FF
      FE0000848300000000000000000000000000B58C8C00FFFFF700FFD6A500FFD6
      A500B58C8C00FFFFFF00FFFFFF004C804C0069CA800069CA800069CA800052AE
      570052AE570052AE57004C804C00000000000000000000000000000000000000
      0000000084000000840000008400000000000000840000008400000084008484
      840000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF0000008400000084000000FF00FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FE0000FFFE00000000000000000000000000B58C8C00FFFFF700FFE7D600FFE7
      D600B58C8C00B58C8C00B58C8C004C804C004C804C004C804C0069CA800052AE
      57004C804C004C804C004C804C00000000000000000000000000000000000000
      8400000084000000840000000000000000000000000000008400000084000000
      840084848400000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF000000FF000000FF00FFE7D600FFE7D600FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFE00000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD004C804C0069CA800052AE
      57004C804C000000000000000000000000000000000000000000000084000000
      8400000084000000000000000000000000000000000000000000000084000000
      840000008400000000000000000000000000000000000000000000000000B58C
      8C000000FF00000084000000FF0000008400FFFFFF00FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C004C804C004C804C004C80
      4C004C804C000000000000000000000000000000000000000000000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      84000000840000000000000000000000000000000000000000000000FF000000
      FF0000008400FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00B58C
      8C00C68C7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C000000FF0000008400B58C8C00B58C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00BD8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F33FFE7FC07F0000E007F07F80010000
      C000C001800100008001C001800100000000C001800100000000C00180010000
      0000C001800100008000C00180010000E001C00180010000F003C00180010000
      F01FC00180010000E03FC00180010000E03FC00180010000C03FC00180030000
      C07FF00180030000F8FFFC7F98070000800FFCFFE020FFFF800FFC3F20008001
      800FFC1F20008001800FF80320308001800FF00320308001800FF80360308001
      800FD80340308001800FD80340308001800F000300308001800F800300308001
      80EFD80300308001808FD00300308001808FF80300308001878FF80300308003
      000FF80300108007000FF8030000FFFFFFFFF003FFFFFFFFFFFFF003FFFFE001
      FFFFF003FFFFE001FDFFF003C7E7E001F8FF0003C3C7E001F07F0003E18FC001
      E03F0003F01FC001C01F0003F83FE001C60F0001FC3FE001EF070001F81FE001
      FF830001F10FE001FFC30001E387E001FFE30007C7C7E003FFF70007CFE7C007
      FFFF007FFFFF800FFFFF00FFFFFFFF9F00000000000000000000000000000000
      000000000000}
  end
  object DataSourcePrKViewWithFilter: TDataSource
    DataSet = ADOStoredProc
    Left = 17
    Top = 378
  end
  object ActionListViewWithFilter: TActionList
    Images = ImageListViewWithFilter
    Left = 45
    Top = 304
    object ActionAddCN: TAction
      Caption = 'ActionAddCN'
      ImageIndex = 1
      ShortCut = 16429
      OnExecute = ActionAddCNExecute
    end
    object ActionChangeCN: TAction
      Caption = 'ActionChangeCN'
      ImageIndex = 4
      ShortCut = 16497
      OnExecute = ActionChangeCNExecute
    end
    object ActionDelCN: TAction
      Caption = 'ActionDelCN'
      ImageIndex = 3
      ShortCut = 16430
      OnExecute = ActionDelCNExecute
    end
    object ActionPrintCn: TAction
      Caption = 'ActionPrintCn'
      ImageIndex = 8
      ShortCut = 16464
      OnExecute = ActionPrintCnExecute
    end
    object ActionObnov: TAction
      Caption = 'ActionObnov'
      Hint = #1053#1072#1087#1080#1089#1072#1090#1100' '#1074' inicCaption'
      ImageIndex = 7
      ShortCut = 116
      OnExecute = ActionObnovExecute
    end
    object ActionChangeCN_Status: TAction
      Caption = 'ActionChangeCN_Status'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1090#1072#1090#1091#1089
      ImageIndex = 4
      ShortCut = 24689
      OnExecute = ActionChangeCN_StatusExecute
    end
    object ActionOtmena: TAction
      Caption = 'ActionOtmena'
      Hint = #1053#1072#1087#1080#1089#1072#1090#1100' '#1074' inicCaption'
      ImageIndex = 5
      ShortCut = 27
      OnExecute = ActionOtmenaExecute
    end
    object ActionLink: TAction
      Caption = 'ActionLink'
      ImageIndex = 0
      ShortCut = 8307
      OnExecute = ActionLinkExecute
    end
    object ActionPrikzObnov3: TAction
      Caption = 'ActionPrikzObnov3'
      ImageIndex = 10
      ShortCut = 16500
      OnExecute = ActionPrikzObnov3Execute
    end
    object ActionPrikzObnov12: TAction
      Caption = 'ActionPrikzObnov12'
      ImageIndex = 10
      OnExecute = ActionPrikzObnov12Execute
    end
    object ActionPodpis: TAction
      Caption = 'ActionPodpis'
      ImageIndex = 4
      OnExecute = ActionPodpisExecute
    end
    object ActionRasPodpis: TAction
      Caption = 'ActionRasPodpis'
      ImageIndex = 4
      OnExecute = ActionRasPodpisExecute
    end
    object ActionPriceCurrent: TAction
      Caption = 'ActionPriceCurrent'
      ImageIndex = 4
      OnExecute = ActionPriceCurrentExecute
    end
    object ActionCrypt: TAction
      Caption = 'ActionCrypt'
      OnExecute = ActionCryptExecute
    end
    object ActionShowButton: TAction
      Caption = #1064#1080#1092#1088
      ShortCut = 57428
      OnExecute = ActionShowButtonExecute
    end
  end
  object StyleRepositoryViewWithFilter: TcxStyleRepository
    Left = 75
    Top = 305
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
    object cxStyleHeader: TcxStyle
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
    object cxStyleInactive: TcxStyle
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
    object cxStyleBackGround_Content: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyleSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
  end
  object cxEditStyleControllerVWF: TcxEditStyleController
    Style.Color = clInfoBk
    Left = 106
    Top = 305
  end
  object FormStorageViewWithFilter: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 158
    Top = 304
  end
  object dxBarManagerViewWithFilter: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'ContractsBar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 146
        FloatClientHeight = 190
        ItemLinks = <
          item
            Item = dxBarLargeButtonAddCN
            Visible = True
          end
          item
            Item = dxBarLargeButtonChangeCN
            Visible = True
          end
          item
            Item = dxBarLargeButtonChangeCN_Status
            Visible = True
          end
          item
            Item = dxBarLargeButtonDelCN
            Visible = True
          end
          item
            Item = dxBarLargeButtonPrintCn
            Visible = True
          end
          item
            Item = dxBarLargeButtonObnov
            Visible = True
          end
          item
            Item = dxBarLargeButtonLink
            Visible = True
          end
          item
            Item = dxBarLargeButtonPrikzObnov
            Visible = True
          end
          item
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            Item = dxBarLargeButton3
            Visible = True
          end
          item
            Item = dxBarLargeButtonOtmena
            Visible = True
          end
          item
            Item = dxBarLargeButton4
            Visible = True
          end>
        MultiLine = True
        Name = 'ContractsBar'
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    HotImages = ImageListViewWithFilter
    Images = ImageListViewWithFilter
    LargeImages = ImageListViewWithFilter
    NotDocking = [dsNone]
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 294
    Top = 304
    DockControlHeights = (
      0
      0
      72
      0)
    object dxBarLargeButtonObnov: TdxBarLargeButton
      Action = ActionObnov
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonOtmena: TdxBarLargeButton
      Action = ActionOtmena
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonAddCN: TdxBarLargeButton
      Action = ActionAddCN
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonChangeCN: TdxBarLargeButton
      Action = ActionChangeCN
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonDelCN: TdxBarLargeButton
      Action = ActionDelCN
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonPrintCn: TdxBarLargeButton
      Action = ActionPrintCn
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonChangeCN_Status: TdxBarLargeButton
      Action = ActionChangeCN_Status
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonLink: TdxBarLargeButton
      Action = ActionLink
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonPrikzObnov: TdxBarLargeButton
      Action = ActionPrikzObnov3
      Category = 0
      ButtonStyle = bsDropDown
      DropDownMenu = dxBarPopupMenu1
      AutoGrayScale = False
    end
    object dxBarButton3: TdxBarButton
      Action = ActionPrikzObnov3
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = ActionPrikzObnov12
      Category = 0
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = ActionPodpis
      Category = 0
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = ActionRasPodpis
      Category = 0
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = ActionPriceCurrent
      Category = 0
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Action = ActionCrypt
      Caption = #1064#1080#1092#1088
      Category = 0
      Hint = #1064#1080#1092#1088
      ImageIndex = 4
    end
  end
  object ADOConnection: TADOConnection
    CommandTimeout = 99999999
    ConnectionTimeout = 9999999
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 376
  end
  object ADOStoredProc: TADOStoredProc
    Connection = ADOConnection
    AfterScroll = ADOStoredProcAfterScroll
    CommandTimeout = 99999999
    ProcedureName = 'n_dolg_insert;1'
    Parameters = <>
    Left = 80
    Top = 376
  end
  object ADOStoredProcWrite: TADOStoredProc
    Connection = ADOWriteConnection
    Parameters = <>
    Left = 312
    Top = 376
  end
  object ADOConnectionGlobalData: TADOConnection
    CommandTimeout = 99999999
    ConnectionTimeout = 9999999
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 232
  end
  object ADOStoredProcGlobalData: TADOStoredProc
    Connection = ADOConnectionGlobalData
    CommandTimeout = 99999999
    ProcedureName = 'n_dolg_insert;1'
    Parameters = <>
    Left = 72
    Top = 232
  end
  object ADOStoredProcSpec: TADOStoredProc
    Connection = ADOConnection
    Parameters = <>
    Left = 696
    Top = 72
  end
  object DataSourceSpec: TDataSource
    DataSet = ADOStoredProcSpec
    Left = 697
    Top = 106
  end
  object ADOWriteConnection: TADOConnection
    CommandTimeout = 99999999
    ConnectionTimeout = 9999999
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 280
    Top = 376
  end
  object dxBarPopupMenu1: TdxBarPopupMenu
    BarManager = dxBarManagerViewWithFilter
    ItemLinks = <
      item
        Item = dxBarButton3
        Visible = True
      end
      item
        Item = dxBarButton4
        Visible = True
      end>
    UseOwnFont = False
    Left = 664
    Top = 156
  end
  object DataSet_ini: TpFIBDataSet
    Left = 360
    Top = 296
    poSQLINT64ToBCD = True
  end
end
