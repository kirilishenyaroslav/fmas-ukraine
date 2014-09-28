object frmResultAnalyz: TfrmResultAnalyz
  Left = 355
  Top = 236
  Width = 818
  Height = 594
  Caption = 'frmResultAnalyz'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 42
    Width = 802
    Height = 196
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource1
      DataController.DetailKeyFieldNames = 'ID_DOC'
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'SUMMA_PRIH'
          Column = cxGrid1DBTableView1DBColumn4
        end
        item
          Kind = skSum
          FieldName = 'SUMMA_RASH'
          Column = cxGrid1DBTableView1DBColumn5
        end>
      DataController.Summary.SummaryGroups = <
        item
          Links = <>
          SummaryItems = <>
        end>
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Preview.Visible = True
      Styles.Background = cxStyleYellow
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = cxStyle4
      Styles.IncSearch = cxStyleYellow
      Styles.Selection = cxStyle17
      Styles.FilterBox = cxStyleYellow
      Styles.Footer = cxStyleBorder
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      Styles.Indicator = cxStyleYellow
      Styles.NewItemRowInfoText = cxStyleYellow
      Styles.Preview = cxStyleYellow
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Width = 86
        DataBinding.FieldName = 'NUMBER_DOC'
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Width = 75
        DataBinding.FieldName = 'DATE_DOC'
      end
      object cxGrid1DBTableView1DBColumn9: TcxGridDBColumn
        Width = 67
        DataBinding.FieldName = 'DATE_PROV'
      end
      object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Width = 89
        DataBinding.FieldName = 'NUM_RAS_NATIVE'
      end
      object cxGrid1DBTableView1DBColumn6: TcxGridDBColumn
        Width = 91
        DataBinding.FieldName = 'NUM_RAS_CUST'
      end
      object cxGrid1DBTableView1DBColumn7: TcxGridDBColumn
        Width = 196
        DataBinding.FieldName = 'NAME_CUST'
      end
      object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
        Width = 88
        DataBinding.FieldName = 'SUMMA_PRIH'
      end
      object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
        Width = 90
        DataBinding.FieldName = 'SUMMA_RASH'
      end
      object cxGrid1DBTableView1DBColumn8: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'IS_SPRAVKA'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 374
    Width = 802
    Height = 182
    Align = alBottom
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 120
      Width = 800
      Height = 61
      Align = alBottom
      TabOrder = 0
      DesignSize = (
        800
        61)
      object cxTextEdit1: TcxTextEdit
        Left = 144
        Top = 5
        Width = 658
        Height = 26
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        ParentColor = True
        Properties.ReadOnly = True
        TabOrder = 0
      end
      object cxTextEdit2: TcxTextEdit
        Left = 144
        Top = 32
        Width = 658
        Height = 26
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        ParentColor = True
        Properties.ReadOnly = True
        TabOrder = 1
      end
      object cxLabel3: TcxLabel
        Left = 8
        Top = 8
        Width = 129
        Height = 17
        AutoSize = False
        TabOrder = 2
        Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      end
      object cxLabel4: TcxLabel
        Left = 8
        Top = 37
        Width = 137
        Height = 17
        AutoSize = False
        TabOrder = 3
        Caption = #1055#1088#1080#1084#1099#1090#1082#1072' '#1076#1086' '#1087#1088#1086#1074#1086#1076#1082#1080
      end
    end
    object cxGrid2: TcxGrid
      Left = 1
      Top = 1
      Width = 800
      Height = 119
      Align = alClient
      TabOrder = 1
      object cxGrid2DBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourceProv
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'ID_ALL_PROV'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
            FieldName = 'SUMMA'
            Column = cxGrid2DBTableView1DBColumn7
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleYellow
        Styles.Content = cxStyleYellow
        Styles.ContentEven = cxStyleYellow
        Styles.ContentOdd = cxStyleYellow
        Styles.Inactive = cxStyle4
        Styles.IncSearch = cxStyle12
        Styles.Selection = cxStyleMalin
        Styles.FilterBox = cxStyleYellow
        Styles.Footer = cxStyleBorder
        Styles.Group = cxStyleBorder
        Styles.GroupByBox = cxStyleBorder
        Styles.Header = cxStyleBorder
        Styles.Indicator = cxStyleYellow
        Styles.NewItemRowInfoText = cxStyleYellow
        Styles.Preview = cxStyleYellow
        object cxGrid2DBTableView1DBColumn1: TcxGridDBColumn
          Width = 105
          DataBinding.FieldName = 'SCH_NUMBER'
        end
        object cxGrid2DBTableView1DBColumn2: TcxGridDBColumn
          Width = 141
          DataBinding.FieldName = 'SCH_KASS_NUMBER'
        end
        object cxGrid2DBTableView1DBColumn3: TcxGridDBColumn
          Width = 97
          DataBinding.FieldName = 'SMETA_KOD'
        end
        object cxGrid2DBTableView1DBColumn4: TcxGridDBColumn
          SortOrder = soDescending
          Width = 111
          DataBinding.FieldName = 'RAZD_NUM'
        end
        object cxGrid2DBTableView1DBColumn5: TcxGridDBColumn
          Width = 102
          DataBinding.FieldName = 'STAT_KOD'
        end
        object cxGrid2DBTableView1DBColumn6: TcxGridDBColumn
          Width = 108
          DataBinding.FieldName = 'KEKV_KOD'
        end
        object cxGrid2DBTableView1DBColumn7: TcxGridDBColumn
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0,00'#39'.'#39';-,0,00'#39'.'#39
          Width = 126
          DataBinding.FieldName = 'SUMMA'
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxGrid2DBTableView1
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 254
    Width = 802
    Height = 120
    Align = alBottom
    TabOrder = 2
    object cxLabel1: TcxLabel
      Left = 16
      Top = 3
      Width = 201
      Height = 17
      AutoSize = False
      TabOrder = 0
    end
    object cxLabel2: TcxLabel
      Left = 360
      Top = 3
      Width = 416
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
    end
    object cxCheckBox1: TcxCheckBox
      Left = 16
      Top = 99
      Width = 169
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1088#1086#1074#1086#1076#1082#1091
      TabOrder = 2
      OnClick = cxCheckBox1Click
    end
    object cxDBLabel1: TcxDBLabel
      Left = 72
      Top = 16
      Width = 649
      Height = 41
      DataBinding.DataField = 'NOTE_DOC'
      DataBinding.DataSource = DataSource1
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object cxLabel5: TcxLabel
      Left = 16
      Top = 52
      Width = 137
      Height = 17
      AutoSize = False
      TabOrder = 4
      Caption = #1055#1088#1080#1084#1099#1090#1082#1072' '#1076#1086' '#1087#1088#1086#1074#1086#1076#1082#1080
    end
    object cxMemo1: TcxMemo
      Left = 72
      Top = 67
      Width = 656
      Height = 33
      Align = alCustom
      Anchors = [akLeft, akTop, akRight, akBottom]
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.BorderStyle = ebsNone
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 5
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 238
    Width = 802
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 100
    AlignSplitter = salBottom
    Control = Panel1
  end
  object cxSplitter2: TcxSplitter
    Left = 0
    Top = 246
    Width = 802
    Height = 8
    HotZoneClassName = 'TcxXPTaskBarStyle'
    AlignSplitter = salBottom
    Control = Panel3
    Visible = False
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      'SELECT * FROM BANK_SELECT_FIND_ALL_ERR_DOCS(1,1)')
    AfterScroll = pFIBDataSet1AfterScroll
    Left = 560
    Top = 184
    poSQLINT64ToBCD = True
    object pFIBDataSet1ID_DOC: TFIBBCDField
      FieldName = 'ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSet1NUMBER_DOC: TFIBStringField
      FieldName = 'NUMBER_DOC'
      Size = 120
      EmptyStrToNull = True
    end
    object pFIBDataSet1SUMMA_PRIH: TFIBBCDField
      FieldName = 'SUMMA_PRIH'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1NOTE_DOC: TFIBStringField
      FieldName = 'NOTE_DOC'
      Size = 255
      EmptyStrToNull = True
    end
    object pFIBDataSet1FIO_DOC: TFIBStringField
      FieldName = 'FIO_DOC'
      Size = 150
      EmptyStrToNull = True
    end
    object pFIBDataSet1PRIHOD: TFIBIntegerField
      FieldName = 'PRIHOD'
    end
    object pFIBDataSet1DATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object pFIBDataSet1SUMMA_RASH: TFIBBCDField
      FieldName = 'SUMMA_RASH'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1NUM_RAS_NATIVE: TFIBStringField
      FieldName = 'NUM_RAS_NATIVE'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSet1NUM_RAS_CUST: TFIBStringField
      FieldName = 'NUM_RAS_CUST'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSet1NAME_CUST: TFIBStringField
      FieldName = 'NAME_CUST'
      Size = 180
      EmptyStrToNull = True
    end
    object pFIBDataSet1IS_SPRAVKA: TFIBIntegerField
      FieldName = 'IS_SPRAVKA'
    end
    object pFIBDataSet1DATE_PROV: TFIBDateField
      FieldName = 'DATE_PROV'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object pFIBDataSet1COMMENT_PROV_ALL: TFIBStringField
      FieldName = 'COMMENT_PROV_ALL'
      Size = 5000
      EmptyStrToNull = True
    end
    object pFIBDataSet1SCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSet1TITLE_SCH: TFIBStringField
      FieldName = 'TITLE_SCH'
      Size = 60
      EmptyStrToNull = True
    end
    object pFIBDataSet1SUMMA_P: TFIBBCDField
      FieldName = 'SUMMA_P'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1SUMMA_R: TFIBBCDField
      FieldName = 'SUMMA_R'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1PK_ID: TFIBBCDField
      FieldName = 'PK_ID'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSet1PK_: TFIBStringField
      FieldName = 'PK_'
      Size = 16
      EmptyStrToNull = True
    end
    object pFIBDataSet1DATE_REG: TFIBDateField
      FieldName = 'DATE_REG'
    end
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 72
    Top = 40
  end
  object pFIBDatabase1: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA'
      'sql_role_name=')
    DefaultTransaction = pFIBTransaction1
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    Left = 528
    Top = 184
  end
  object StyleRepository: TcxStyleRepository
    Left = 8
    Top = 40
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
  object pFIBStoredProc1: TpFIBStoredProc
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    Left = 128
    Top = 88
  end
  object DataSet: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    Left = 24
    Top = 88
    poSQLINT64ToBCD = True
  end
  object Query: TpFIBQuery
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    Left = 72
    Top = 88
  end
  object TransactionWrite: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 160
    Top = 88
  end
  object ActionList1: TActionList
    Left = 200
    Top = 8
    object ActionClose: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = ActionCloseExecute
    end
    object ActionPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ShortCut = 16464
      OnExecute = ActionPrintExecute
    end
    object ActionDoc: TAction
      Caption = 'ActionDoc'
      ShortCut = 13
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 209
        FloatTop = 209
        FloatClientWidth = 84
        FloatClientHeight = 144
        ItemLinks = <
          item
            Item = dxBarLargeButton11
            Visible = True
          end
          item
            Item = dxBarLargeButton7
            Visible = True
          end>
        Name = 'Custom 1'
        NotDocking = [dsNone]
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    HotImages = ImageList
    Images = ImageList
    LargeImages = ImageList
    NotDocking = [dsNone]
    PopupMenuLinks = <>
    Style = bmsXP
    UseSystemFont = True
    Left = 480
    Top = 8
    DockControlHeights = (
      0
      0
      42
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      AutoGrayScale = False
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      AutoGrayScale = False
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      AutoGrayScale = False
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      AutoGrayScale = False
    end
    object dxBarLargeButton5: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      AutoGrayScale = False
    end
    object dxBarStatic1: TdxBarStatic
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarLargeButton6: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      AutoGrayScale = False
    end
    object dxBarLargeButton7: TdxBarLargeButton
      Action = ActionClose
      Category = 0
      Hint = #1054#1090#1084#1077#1085#1072
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4BA64B4BA9
        4D4D4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        824B4B824B4BB64F50C24F50C54D4EB24D4E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FF824B4BD45859CB5556C95455C95253B7
        4F524E1E1FFE8B8CFB9A9CF8AAABF7B5B6F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BD75C5DD05A5BCF595ACF5758BD53564E1E1F23B54A13C14816BD480CBC
        41F7B5B6824B4BFF00FFFF00FFFF00FF824B4BDD6364D75F60D55E5FD55C5DC2
        575A4E1E1F2AB44D1CBF4C1EBC4C13BC45F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BE36869DD6566DA6364DE6667C6595B4E1E1F26B14916BC481BBB4910BB
        43F7B5B6824B4BFF00FFFF00FFFF00FF824B4BEB6D6EE26768E67E7FFAD3D4CC
        6E704E1E1FA5D89750D16F42C9662DC758F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BF27374E96C6DEB8182FCD1D3CF6E704E1E1FFFF2CCFFFFD7FFFFD4E6FC
        C7F7B5B6824B4BFF00FFFF00FFFF00FF824B4BF87879F07576EE7273F07374D1
        65664E1E1FFCEFC7FFFFD5FFFFD3FFFFD7F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFE7F80F77A7BF6797AF77779D76B6B4E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4BFF8384FC7F80FB7E7FFE7F80DA
        6E6F4E1E1FFCEFC7FFFFD5FFFFD3FFFFD5F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFF8889FF8283FF8182FF8283E073744E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4B824B4BE27576FE8182FF8687E5
        76774E1E1FFAEBC5FCFBD1FCFBCFFCFBD1F7B5B6824B4BFF00FFFF00FFFF00FF
        FF00FFFF00FF824B4B9C5657CB6C6DCF6E6E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B82
        4B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      AutoGrayScale = False
      HotImageIndex = 9
    end
    object dxBarLargeButton8: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000000000084830000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000000084830000FFFE000084830000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000FFFE0000FFFE0000FFFE0000FFFE00008483000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000000FFFE0000FFFE00848484008484840000FFFE0000FFFE000084
        830000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008484840000FFFE0084848400FF00FF00FF00FF008484840000FFFE0000FF
        FE000084830000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0084848400FF00FF00FF00FF00FF00FF00FF00FF008484840000FF
        FE0000FFFE000084830000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
        840000FFFE0000FFFE000084830000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008484840000FFFE0000FFFE0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008484840000FFFE0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      AutoGrayScale = False
      HotImageIndex = 0
    end
    object dxBarLargeButton9: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarLargeButton10: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      AutoGrayScale = False
      HotImageIndex = 7
    end
    object dxBarLargeButton11: TdxBarLargeButton
      Action = ActionPrint
      Category = 0
      Hint = #1055#1077#1095#1072#1090#1100
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000030F0000030F00000001000000010000424242004A42
        4A0052424A004A4A4A004A524A00525252005A6352005A5A5A005A635A006363
        5A006B635A0008426300525263005A5263005A5A6300635A63005A6363006363
        63006B6363006B6B6300635A6B0063636B006B6B6B006B736B00636B7300736B
        73006B737300737373007B73730084737300737B730073737B007B737B008473
        7B007B7B7B008C847B00848484008C848C00848C8C008C8C8C008C948C009494
        94009CA594009C9C9C00A5A5A500ADADAD00ADADB500B5B5B500BDBDBD00C6C6
        C600CECECE00D6D6D600E7DED600DEDEDE00ADCEE700299CEF00FF00FF004ABD
        FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00383838383838
        3838383838383838383838383838383838383838383838383838383838383838
        3838383838383838383838383838383824291611070707111622292C24383838
        38383838383824112B1B07111B272D2F30302C27242424383838383838380316
        3524111122292C30323331302D2B2F383838383838380316352711111B292C2F
        3233312F2D2B2F383838383838380016332411111B270B0B3133312F2D2B2F38
        383838383838031635241111220B3A360B33312F2C292F383838383838380316
        311B070507363A3A0B0B27292B2B2F3838383838383803072C1B07071B27363A
        3A360B2724242D383838383838380016332411111B272C363A3A0B0B2D2B2F38
        38383838383801133425090F21282C2F363A3A360B390B38383838383838001A
        332508151C272C2F32363A3A393A393838383838383800183525101122272C2F
        3233363A3A3A3A393838383838380212321D0C070507070716240B363A3A3A3A
        39383838383802122C1B06111B272C2F3132363A3A39373A3A39383838380212
        342509121B272C2D313231363A36363A3938383838380212342508091B262B2F
        3132302D363A3A39383838383838021234250E0917262B2D3132302D2C363638
        38383838383802122C1B0A141726292D3032302C2C272D383838383838380015
        2C1E0D05110F11111622222424242D3838383838383804172E27292A2C2D2C2C
        2D2D2C2B27222B38383838383838383823201B191F171B1B1B1B222224383838
        3838383838383838383838383838383838383838383838383838}
      AutoGrayScale = False
      HotImageIndex = 16
    end
    object dxBarLargeButton12: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      ImageIndex = 14
      AutoGrayScale = False
      HotImageIndex = 14
    end
    object dxBarLargeButton13: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      AutoGrayScale = False
      HotImageIndex = 12
    end
  end
  object ImageList: TImageList
    Left = 72
    Top = 176
    Bitmap = {
      494C010111001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C00D6D6D600E7E7E700EFEFEF00EFEFEF00E7EFE700DEDEDE00B5AD
      AD00A59C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A00EFEFEF00F7F7F700B5BDBD00C6C6C600CED6CE00FFFFFF007B73
      73004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B6B6B004A4A
      4A004A4A4A00F7F7F700EFF7F700D6CED600DED6D600DEDEDE00FFFFFF007B84
      7B004A4A4A004A4A4A006B6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6B6B004A4A4A004A4A
      4A004A4A4A00DEE7E700CED6D600848C8C008C8C8C009CA5AD00EFEFEF008484
      84004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300847B7B006363
      6300636363004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0063636300B5B5B500524A5A004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000847B8400949C9C008C9C
      9C008C9C9400949C9C00949494008C8C8C007B847B008C9C94008C9494008C94
      9C008C849C008CFF7B008C9C9C00393939000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADADAD00D6DEDE008C6B
      73009C6B7300A57B7B00BD8C8C00C68C9400BD8C9400BD8C8C00C68C8C00AD84
      8400A56B7B007B947300BDD6BD004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500CED6D600844A
      5200BD7B8400A57B7B00A57B7B00AD7B7B009C7B7B00AD7B7B00A57B7B00AD84
      8400B5848400AD7B9C00E7D6E700636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500CECECE004218
      21004A4A4A00736363007B63630073636300736363007B6363007B6363005231
      310039393900A59C9C00CECECE00ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500D6CECE004221
      21004A4A4A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A5
      A5004A4A4A00B5A5A500CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7EFEF00EFEF
      EF00EFE7E700E7E7E700F7FFFF00F7FFFF00FFFFFF00FFFFFF00EFF7F700D6D6
      D600E7E7E700EFE7E700E7EFE700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEDEDE00F7F7F700FFFFFF00CECECE00B5B5B500B5B5B500CED6
      D600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CECECE00F7F7F700DEDEDE00B5B5B500FFFFFF00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CECECE00F7F7F700CECECE00B5B5B500FFFFFF00E7E7E7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ADADAD00B5B5B500B5B5B500BDBDBD00CECECE00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000084
      BD0031A5D60042B5E70039ADDE00219CD60031A5DE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      BD0031A5D60042B5E70039ADDE00219CD60031A5DE0000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084BD
      E700316BCE00316BCE003973CE00397BD6003984DE004294E7004294E7003194
      EF0073BDEF000000000000000000000000000000000000000000008CC600008C
      C60063C6EF008CD6FF007BCEFF007BCEFF0063BDEF005ABDEF0029A5D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484006B6B6B00636363005A5A5A005A5A5A006B6B6B007B7B7B00A5A5
      A500848484000000000000000000000000000000000000000000008CC600008C
      C60063C6EF008CD6FF007BCEFF007BCEFF0063BDEF005ABDEF0029A5D6000000
      000000000000000000000000000000000000000000000000000000000000B5EF
      FF004294E70073D6FF008CD6FF008CD6FF008CD6FF00A5E7FF00B5EFFF0094DE
      FF0084CEFF0000000000000000000000000000000000000000000894C600089C
      CE006BCEEF008CDEFF007BCEF7006BC6EF0039ADD60073CEF70084D6FF005ABD
      EF00000000000000000000000000000000000000000000000000000000006363
      63009C9C9C005A5A5A00636363008C8C8C00ADADAD00BDBDBD00BDBDBD008C8C
      8C008484840084848400000000000000000000000000000000000894C600089C
      CE006BCEEF008CDEFF007BCEF7006BC6EF0039ADD60073CEF70084D6FF005ABD
      EF0000000000000000000000000000000000000000000000000000000000B5EF
      FF004A9CEF0073D6FF008CD6FF008CD6FF008CD6FF008CD6FF008CDEFF0094DE
      FF0084CEFF000000000000000000000000000000000000000000109CCE0018A5
      D6007BD6EF009CEFFF008CE7FF004A9CC6002184AD0052B5E7007BCEFF0084D6
      FF00189CCE000000000000000000000000000000000000000000000000006B6B
      6B00DEDEDE00636363006363630094949400A5A5A500CECECE00D6D6D600B5B5
      B500ADADAD00B5B5B50000000000000000000000000000000000109CCE0018A5
      D6007BD6EF009CEFFF008CE7FF004A9CC6002184AD0052B5E7007BCEFF0084D6
      FF00189CCE0000000000000000000000000000000000000000000000000084CE
      FF004A94E7004294E70052A5EF0063B5F7006BC6F7006BC6F7005AC6FF003163
      CE007BCEF700000000000000000000000000000000000000000018A5D60029AD
      DE009CDEEF00C6F7FF00A5F7FF006BBDD60010638C004AADD6007BD6FF007BCE
      FF00189CCE000000000000000000000000000000000000000000000000006B6B
      6B00D6D6D60063636300636363008C8C8C0008426300C6C6C600D6D6D600B5B5
      B500ADADAD00B5B5B5000000000000000000000000000000000018A5D60029AD
      DE009CDEEF00C6F7FF00A5F7FF006BBDD60010638C004AADD6007BD6FF007BCE
      FF00189CCE0000000000000000000000000000000000000000000000000084CE
      FF00428CE7004284DE004A94E7005AADEF0063B5F7006BC6F7005AC6FF003163
      CE0073BDEF00000000000000000000000000000000000000000021ADDE0029B5
      E700B5E7F700E7FFFF00BDF7FF009CE7F7004A94AD0073C6E70084D6FF007BCE
      FF00189CCE000000000000000000000000000000000000000000000000006B6B
      6B00C6C6C6005A5A5A0052525200ADCEE7008CF7FF0008426300084263009494
      94009C9C9C00B5B5B5000000000000000000000000000000000021ADDE0029B5
      E700B5E7F700E7FFFF00BDF7FF009CE7F7004A94AD0073C6E70084D6FF007BCE
      FF00189CCE00000000000000000000000000000000000000000000000000B5EF
      FF004AA5F70073D6FF008CD6FF008CD6FF008CD6FF008CD6FF00B5EFFF0094DE
      FF008CDEFF000000000000000000000000000000000000000000189CD60029B5
      DE0042ADD60052BDD60042BDDE0042B5DE0052C6E7006BCEEF0084DEF7008CDE
      FF00189CCE000000000000000000000000000000000000000000000000005A5A
      5A00A5A5A5005A5A5A005A5A5A008C8C8C00ADCEE7008CF7FF00ADCEE7008C8C
      8C0084848400ADADAD0000000000000000000000000000000000189CD60029B5
      DE0042ADD60052BDD60042BDDE0042B5DE0052C6E7006BCEEF0084DEF7008CDE
      FF00189CCE00000000000000000000000000000000000000000000000000B5EF
      FF004AA5F70073D6FF008CD6FF008CD6FF008CD6FF00A5E7FF00B5EFFF0094DE
      FF008CD6FF000000000000000000000000000000000000000000109CCE005AD6
      E70018738C0021849C004ADEEF0029BDE70010A5CE000894C600189CCE005AC6
      E700219CCE000000000000000000000000000000000000000000000000006B6B
      6300E7DED60063635A00635A63008C948C00A5A5A500ADCEE7008CF7FF00ADCE
      E700084263000842630000000000000000000000000000000000189CCE0039BD
      DE0029A5CE0029ADD60029B5D60021A5CE0031B5DE0052C6E70084DEF7006BC6
      F7001094C600000000000000000000000000000000000000000000000000B5EF
      FF0094BDEF008CADE70094BDEF009CC6EF009CCEF700A5DEFF00A5DEFF0094CE
      FF00A5CEF700000000000000000000000000000000000000000000000000189C
      CE0031ADC6005ACEDE0084FFFF0063EFFF0031C6DE00008CBD00007BB500088C
      C600088CC6000000000000000000000000000000000000000000000000006B73
      7300D6D6D6005A635A0063636B008C8C8C00A5A5A500CECECE00ADCEE7008CF7
      FF004ABDFF004ABDFF0000000000000000000000000000000000109CCE0042BD
      D6000084B50021A5C60073F7FF0039CEE70010A5CE000084BD001094C60039AD
      D6000894C6000000000000000000000000000000000000000000000000000000
      0000A5948400736B63000000000000000000000000000000000084847B008C73
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000039C6E70031BDDE0029B5D6000084B5000084B500008C
      C600008CC6000000000000000000000000000000000000000000000000006B63
      6300CECECE00525263005A5A5A005A5A5A005A5A5A006B6B6B0084848400ADCE
      E7008CF7FF008CF7FF008CF7FF0000000000000000000000000000000000007B
      B500007BAD00189CC6006BEFF7005AE7F70029B5D600007BAD000084B5000894
      C600000000000000000000000000000000000000000000000000000000000000
      0000A5948400736B6300000000000000000000000000000000008C8484008C73
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000084B500007BAD000000
      0000000000000000000000000000000000000000000000000000000000006B63
      6300A5A5A5005A635200636363008C8C8C00A5A5A500C6C6C600CECECE008CF7
      FF008CF7FF00299CEF008CF7FF004ABDFF000000000000000000000000000000
      00000084B5000884B5000000000021ADD6001094BD00007BAD00007BB5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A59484007B737300000000000000000000000000000000009C9C94008C73
      5A00000000000000000000000000000000000000000000000000000000000000
      00000073A500006B9C000000000000000000000000000084B500007BAD000000
      0000000000000000000000000000000000000000000000000000000000006B63
      6300E7DED6005A635A0063635A00848C8C009C9C9C00C6C6C600CECECE00ADAD
      AD00ADCEE7008CF7FF004ABDFF00000000000000000000000000000000000000
      000031B5DE001084B500000000000000000000000000007BAD000073A5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5948400737373007B634A00000000000000000084736300B5B5B5008C73
      5A00000000000000000000000000000000000000000000000000000000000000
      0000189CCE00088CBD000000000000000000000000000084BD00007BAD000000
      0000000000000000000000000000000000000000000000000000000000006B63
      6300E7DED6005A5A630063635A00848C8C009C9C9C00C6C6C600CECECE00ADAD
      AD00A5A5A500ADCEE70000000000000000000000000000000000000000000000
      00002194B5005AD6EF002194BD00000000000873A5000084BD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF00ADADAD008C8C8C008C8C8C00C6C6C600CECECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000031A5CE004AC6E7000000000000000000000000000084B500007BAD000000
      0000000000000000000000000000000000000000000000000000000000006363
      6B00A5A5A5005A52630052525200635A6300636363006B6B6B007B7B7B008484
      840084848400ADADAD0000000000000000000000000000000000000000000000
      00000000000031A5BD0063D6E70052C6DE0031ADD6000884B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5948400E7E7E700EFEFEF00EFEFEF00CECEC6008C735A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042B5CE005AD6E70031A5C600219CC6000894C600000000000000
      0000000000000000000000000000000000000000000000000000000000006B73
      6B00ADADB500949494009CA59400ADADAD00A5A5A500ADADAD00ADADAD009C9C
      9C008C8C8C009C9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000039ADC60039ADCE0031A5CE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000844A4A004A18180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005A6B6B00425A6B00425A6B00425A6B005A6B6B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900000000000000000000000000000000000000000000000000000000000000
      0000844A4A00844A4A00A54A4A00AD4A4A004A18180000000000000000000000
      000000000000000000000000000000000000000000000000000000000000394A
      5200426373004263730042637B00528494005A849C00ADE7EF00527B94000000
      000000000000000000000000000000000000000000000000000000000000088C
      CE00088CCE00088CCE00088CCE00088CCE00088CCE00088CCE00000000000000
      0000000000000000000000000000000000003939390084848400848484008484
      8400848484008484840084848400848484008484840084848400848484003939
      3900393939000000000000000000000000000000000000000000844A4A00844A
      4A00B54A5200C64A5200C64A4A00B54A4A004A181800844A4A00844A4A00844A
      4A00844A4A00844A4A00844A4A0000000000000000000000000000000000314A
      520042637300426373004A6B7B005A8CA5006394AD00ADE7EF00C6F7FF005A6B
      6B00000000000000000000000000000000000000000000000000088CCE0063CE
      F7006BC6E700528CA5003994B50029ADE70029ADE70021ADE700088CCE000000
      0000000000000000000000000000000000003939390039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900393939003939390000000000000000000000000000000000844A4A00D65A
      5A00CE525200CE525200CE525200B54A52004A181800FF8C8C00FF9C9C00FFAD
      AD00F7B5B500F7B5B500844A4A00000000000000000000000000000000003952
      5A00426373004263730042637B005A8CA5006394B5008CCEE700B5EFF700C6F7
      FF0084BDD6000000000000000000000000000000000000000000088CCE008CE7
      FF006B7B84009C84840063524A00318CAD0029B5E70029ADE700088CCE000000
      00000000000000000000000000000000000039393900C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400393939003939390000000000000000000000000000000000844A4A00D65A
      5A00D65A5A00CE5A5A00CE525A00BD5252004A18180021B54A0010C64A0010BD
      4A0008BD4200F7B5B500844A4A00000000000000000000000000000000004252
      630042637300426373004A7384005A8CA500639CB50094D6E700BDF7FF00B5EF
      F70084CEDE000000000000000000000000000000000000000000088CCE009CEF
      FF00737B7300C6BDBD00846B63004A63630039BDEF0031B5E700088CCE000000
      00000000000000000000000000000000000039393900C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000FF000000FF00000000FF000000FF00C6C6C6008484
      8400848484003939390039393900000000000000000000000000844A4A00DE63
      6300D65A6300D65A5A00D65A5A00C6525A004A18180029B54A0018BD4A0018BD
      4A0010BD4200F7B5B500844A4A0000000000000000000000000000000000425A
      6B00426373004A6B84004A6B7B005A8CAD00639CB5008CCEE700BDF7FF00B5EF
      F70073B5CE000000000000000000000000000000000000000000088CCE00A5EF
      FF00B5D6DE008C848400BDB5AD0063524A0042BDDE0042C6EF00088CCE000000
      00000000000000000000000000000000000039393900C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400848484008484840039393900000000000000000000000000844A4A00E76B
      6B00DE636300DE636300DE636300C65A5A004A18180021B54A0010BD4A0018BD
      4A0010BD4200F7B5B500844A4A0000000000000000000000000000000000425A
      73004A6B84005A8CA500639CBD006394AD00639CB5008CCEDE00BDF7FF00BDEF
      F70073B5CE000000000000000000000000000000000000000000088CCE00A5EF
      FF00CEF7FF009CADB500B5ADA5009C948C00427373004AA5BD00088CCE000000
      0000000000000000000000000000000000000000000039393900393939003939
      390039393900393939003939390039393900393939003939390039393900C6C6
      C600848484008484840039393900000000000000000000000000844A4A00EF6B
      6B00E7636B00E77B7B00FFD6D600CE6B73004A181800A5DE940052D66B0042CE
      630029C65A00F7B5B500844A4A00000000000000000000000000000000005273
      8C005A84940042636B006BA5BD00639CB5006394AD008CCEDE00B5EFF700ADEF
      F70073ADCE000000000000000000000000000000000000000000088CCE00A5EF
      FF00CEF7FF00C6F7FF0073848C00D6CEC6008C7B7B007B737300088CCE000000
      0000000000000000000000000000000000000000000000000000B58C8C00FFFF
      FF00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00FFFFFF009C6B
      6B00C6C6C6008484840039393900000000000000000000000000844A4A00F773
      7300EF6B6B00EF848400FFD6D600CE6B73004A181800FFF7CE00FFFFD600FFFF
      D600E7FFC600F7B5B500844A4A0000000000000000000000000000000000424A
      4A00394A5200526B73006BADC60073ADCE0063A5BD004A6B7B008C949C00ADE7
      EF0073B5CE000000000000000000000000000000000000000000088CCE00A5EF
      FF00CEF7FF00C6F7FF009CDEF700737B7B00D6CECE00948C8400846B63004A31
      2900634A42005A42390000000000000000000000000000000000B58C8C00FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFFF7009C6B
      6B00393939003939390000000000000000000000000000000000844A4A00FF7B
      7B00F7737300EF737300F7737300D66363004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A00000000000000000000000000000000000000
      00008C948C004A7352005A849C006394AD006BA5C6005A8CAD00314242005A84
      9C006BADC6000000000000000000000000000000000000000000088CCE00A5EF
      FF00CEF7FF00C6F7FF00A5EFFF0063BDCE009C9C9400C6BDB5009C8C8400C6B5
      B500C6B5B500C6B5B50073635A00000000000000000000000000B58C8C00FFFF
      FF00FFF7EF00F7E7CE00F7DEC600F7E7CE00F7DEC600F7E7CE00FFFFF7009C6B
      6B00000000000000000000000000000000000000000000000000844A4A00FF7B
      8400F77B7B00F77B7B00F7737B00D66B6B004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A00000000000000000000000000000000000000
      00008C948C004A5A5200000000005A849C005A849C005A849C00313939005A84
      9C006BA5BD000000000000000000000000000000000000000000088CCE00A5EF
      FF00CEF7FF00C6F7FF00A5EFFF006BE7FF00529CA500C6B5B500C6BDB500E7DE
      DE00E7DEDE00EFE7E700B5ADA50000000000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFF
      FF009C6B6B000000000000000000000000000000000000000000844A4A00FF84
      8400FF7B8400FF7B7B00FF7B8400DE6B6B004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A00000000000000000000000000000000000000
      00008C948C00394A420000000000000000000000000000000000314242000000
      0000000000000000000000000000000000000000000000000000088CCE00A5EF
      FF00D6F7FF00CEF7FF00ADF7FF0073E7FF0052848C00CEBDBD00EFE7EF00E7DE
      DE00EFE7E700F7EFEF00F7EFEF005A4A3900000000000000000000000000B58C
      8C00FFFFF700FFFFF700FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFFF
      FF009C6B6B000000000000000000000000000000000000000000844A4A00FF8C
      8C00FF848400FF848400FF848400E77373004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A00000000000000000000000000000000000000
      00008C948C00425A4A0052635A00000000000000000000000000313942000000
      0000000000000000000000000000000000000000000000000000088CCE00A5EF
      FF00BDEFFF00A5E7F70084DEF7005ACEE700847B7300FFFFFF00F7F7F700F7F7
      F700F7F7F700A59C9400BDB5B5005A4239000000000000000000000000000000
      0000B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C6B6B0000000000000000000000000000000000844A4A00844A
      4A00E7737300FF848400FF848400E77373004A181800FFEFC600FFFFD600FFFF
      CE00FFFFD600F7B5B500844A4A00000000000000000000000000000000000000
      000000000000314231004A5A4A008C948C00000000005A736300293931000000
      0000000000000000000000000000000000000000000000000000088CCE005AC6
      EF006BC6E70063C6E7005AC6E7004ABDE700529CAD00C6BDB500FFFFFF00DEDE
      DE007B6B630063524200A59494006B5A52000000000000000000000000000000
      000000000000B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C009C6B6B0000000000000000000000000000000000000000000000
      0000844A4A009C525200CE6B6B00CE6B6B004A181800844A4A00844A4A00844A
      4A00844A4A00844A4A00844A4A00000000000000000000000000000000000000
      0000000000009CA5A500314231006B7373005A7363004A635200424A4A000000
      0000000000000000000000000000000000000000000000000000088CCE008CD6
      F7009CE7F70094EFFF008CEFFF007BE7FF006BE7FF00847B6B00D6D6CE00BDB5
      AD008C847300BDB5AD007B6B63005A4239000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000844A4A00844A4A004A18180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000088C
      CE00088CCE00088CCE00088CCE00088CCE00088CCE00088CCE006B5A52006B5A
      520094847B007B6B63005A42390000000000000000008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C3100009C3100000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D60000000000EF42
      0000AD290000AD29000073290000732900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA5005A3118005A311800000000000000
      000000000000000000000000000000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D600FF9C1800FFF7
      E700AD290000AD29000073290000732900000000000094736B00B58C7B00B584
      7B00B5847B00B5847B00B5847B00B5847B00B5847B00B5847B00AD847B00AD84
      7B00B5848400B58C7B00845A52000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA500FFE78C00FFE78C00313131000000
      000000000000000000000000000000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D600FF9C1800FFF7
      E700AD290000AD290000732900007329000000000000B5948C00F7DECE00FFDE
      C600FFDEC600FFDEC600FFD6BD00FFD6BD00FFD6B500FFD6B500F7CEB500F7CE
      AD00F7CEAD00FFCEAD009C736B000000000000000000FFF7E700FFD6A500FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A003131
      31009C3100009C3100000000000000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D600000000000000
      0000AD290000AD290000732900007329000000000000B5949400EFEFD600FFF7
      D600E7E7BD00E7E7BD00FFEFD600F7E7B500EFE7AD00FFDEB500FFDEAD00FFD6
      A500F7D6A500FFDEB500A57373000000000000000000FFF7E700F7DEC600F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7CE00F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D600000000000000
      0000AD290000AD290000732900007329000000000000BD9C9400EFEFE700FFFF
      EF00ADD68C00009C0000009C0000009C0000009C000000940000219C2100D6CE
      9C00FFD6AD00FFD6BD009C7373000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00EFDECE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA5000000000008080800FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C18000000000000000000EF42
      0000AD290000AD2900007329000073290000FF9C1800FF9C1800000000000000
      0000AD290000AD290000732900007329000000000000C6A59C00EFF7EF00FFFF
      F700ADDE9C0000940000009C000010A510009CCE9400ADC6940029AD21005AB5
      4A00F7DEB500FFDEC6009C7373000000000000000000FFF7E70042424200FFD6
      A50042424200FFD6A50018181800FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6300000000000000000000000000000000000000000000000000080808000000
      000000000000FF633100FFEFA500FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C3100007329000073290000FF9C1800F7FFFF00000000000000
      0000AD290000AD290000732900007329000000000000C6A5A500EFF7EF00FFFF
      F700B5DEA500009C000008A5080018A5180052B54200F7E7C600F7E7C6005AB5
      5A00DED69C00FFDEC600A57B73000000000000000000FFF7EF00F7DEC600F7DE
      C600F7DEC6001818180018181800F7DEC600F7DEBD00F7E7CE00EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFDE8400FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD290000732900007329000000000000CEADA500F7FFF700F7F7
      E700DEEFCE00FFF7E700F7F7DE00FFF7DE00FFE7CE00FFEFDE00FFEFDE00F7E7
      CE00F7DEB500FFDEC600AD7B73000000000000000000FFF7EF00F7E7CE00F7DE
      C600181818001818180018181800F7DEC600F7DEC600F7E7D600EFDECE009C6B
      6B000000000000000000000000000000000000000000FFFFCE00FFFFBD00FFC6
      5A00FFA51000FF9C0000F7FFFF00FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FFA53900FFA53900F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD2900008C3921008C39210000000000D6B5A500F7FFFF00E7F7
      E7008CD68C00EFF7DE00FFFFFF00C6DEAD004AB5390052B542004AB53900C6D6
      9C00FFEFD600FFE7CE00AD7B73000000000000000000FFFFF700FFD6A5001818
      18008484840000FFFF0018181800FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      00000000000008080800F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000CED6D600FFA53900FFA53900EF42
      0000EF420000AD290000732900008C392100FFA53900FF9C1800000000000000
      0000AD2900008C3921008C392100CED6D60000000000D6B5A500F7FFFF00FFFF
      FF008CCE94004ABD5200E7EFDE00FFFFEF0063BD63000094000000940000ADD6
      8C00FFEFDE00FFDECE00AD7B73000000000000000000FFFFF700FFE7D6001818
      1800C6C6C60000FFFF0018181800FFE7D6000000000000000000000000009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000CED6D600CED6D600FFA53900FFF7
      E700EF420000AD290000732900008C392100FFA53900FFF7E700000000000000
      00008C3921008C392100CED6D600CED6D60000000000DEBDA500F7FFFF00FFFF
      FF00EFF7E70039AD310018A518005AC65A0031AD3100009C000000940000ADD6
      8C00FFF7E700FFDECE00AD847B000000000000000000FFFFFF00181818008484
      840000FFFF0018181800FFFFF700FFFFF70000000000FFFFFF00C68C7B00CED6
      D600000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100C65A0000FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C00009C3100000000000000000000CED6D600CED6D600FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100CED6D600CED6D600CED6D60000000000E7C6A500F7FFFF00FFFF
      FF00FFFFFF00C6EFCE0021AD2100009400000094000010A51000089C1000A5CE
      8C00FFCEC600FFADA500AD7B730000000000000000004242420084848400C6C6
      C60000FFFF0018181800FFFFFF00FFFFFF0000000000C68C7B00CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300C65A0000C65A0000CE636300FFC65A00FF9C
      0000FF9C00009C3100000000000000000000CED6D600CED6D600FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100CED6D600CED6D600CED6D60000000000E7CEAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEAD
      9400D6945200C69C7B00C6ADA5000000000000000000181818001818180000FF
      FF001818180000000000000000000000000000000000CED6D600CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300FFD67300FFD67300C65A0000CE636300FF9C
      0000FF9C00009C3100000000000000000000CED6D600CED6D600CED6D600FFA5
      3900FF9C1800EF4200008C392100CED6D600CED6D600FFA53900000000000000
      00008C392100CED6D600CED6D600CED6D60000000000EFCEAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00F7FFFF00F7FFFF00C6AD
      9C00D69C7300DECEB50000000000000000001818180000008400000084001818
      1800CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFDE8400FFDE8400FFDE8400FFDE8400C65A0000C65A
      0000C65A00009C3100000000000000000000CED6D600CED6D600CED6D600FFA5
      3900F7FFFF00EF4200008C392100CED6D600CED6D600FFA53900F7FFFF000000
      00008C392100CED6D600CED6D600CED6D60000000000E7C69C00E7C6A500E7C6
      A500E7C6A500E7C6A500E7C6A500E7C6A500DEC6A500DEC6A500DEC6A500C69C
      8400DECEBD00000000000000000000000000CED6D60018181800181818001818
      1800CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF6331000000000000000000CED6D600CED6D600CED6D600FFCE
      6300FFCE6300FFA53900FFA53900CED6D600CED6D600FFCE6300FFA53900FFA5
      39008C392100CED6D600CED6D600CED6D6000000000000000000000000000000
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
      0000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
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
      0000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500EFDECE008C5A5A0000000000000000000000000000000000000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      840000008400000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000848400000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C008C5A5A008C5A5A008C5A
      5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7
      CE00EFDECE009C6B630000000000000000000000000000000000000084000000
      8400000084008484840000000000000000000000000000000000000084000000
      840084848400000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500F7E7CE008C5A5A00000000000000000000000000000000000000
      0000000000000084840000FFFF00008484000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7E700F7EFDE00F7EF
      DE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7E7
      D600EFDECE009C6B6B0000000000000000000000000000000000000000000000
      8400000084000000840084848400000000000000000000008400000084000000
      84000000000000000000000000000000000000000000000000000000FF00B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00F7E7CE008C5A5A00000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000084840000000000000000000000
      000000000000000000000000000000000000B58C8C00F7EFDE00F7DECE00F7DE
      C600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A5004A844A004A844A004A84
      4A004A844A00A57B730000000000000000000000000000000000000000000000
      0000000084000000840000008400848484000000840000008400000084000000
      00000000000000000000000000000000000000000000000000000000FF000000
      8400F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC6000000
      FF00EFDECE00EFDECE008C5A5A000000000000000000000000000000000000FF
      FF0000FFFF00848484008484840000FFFF0000FFFF0000848400000000000000
      000000000000000000000000000000000000B58C8C00FFF7E700FFD6A500FFD6
      A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D6004A844A0052AD520052AD
      52004A844A00A57B730000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000008400FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500000084000000
      FF00FFD6A500EFDECE009C6B63000000000000000000000000008484840000FF
      FF008484840000000000000000008484840000FFFF0000FFFF00008484000000
      000000000000000000000000000000000000B58C8C00FFF7EF00F7DEC600F7DE
      C600B58C8C00FFFFFF00FFFFFF004A844A004A844A004A844A0052AD520052AD
      52004A844A004A844A004A844A00000000000000000000000000000000000000
      00000000000000000000000084000000FF000000840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000006B6B
      FF0000008400F7DEC600F7DEC600F7DEC600F7DEC600000084000000FF00F7DE
      BD00F7E7CE00EFDECE009C6B6B00000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000FFFF0000FFFF000084
      840000000000000000000000000000000000B58C8C00FFF7EF00F7E7CE00F7DE
      C600B58C8C00FFFFFF00FFFFFF004A844A0052AD520052AD520052AD520052AD
      520052AD520052AD52004A844A00000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400848484000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C000000FF0000008400F7DEC600F7DEC600000084000000FF00F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000848400000000000000000000000000B58C8C00FFFFF700FFD6A500FFD6
      A500B58C8C00FFFFFF00FFFFFF004A844A006BCE84006BCE84006BCE840052AD
      520052AD520052AD52004A844A00000000000000000000000000000000000000
      0000000084000000840000008400000000000000840000008400000084008484
      840000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF0000008400000084000000FF00FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF00000000000000000000000000B58C8C00FFFFF700FFE7D600FFE7
      D600B58C8C00B58C8C00B58C8C004A844A004A844A004A844A006BCE840052AD
      52004A844A004A844A004A844A00000000000000000000000000000000000000
      8400000084000000840000000000000000000000000000008400000084000000
      840084848400000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF000000FF000000FF00FFE7D600FFE7D600FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFF00000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD004A844A006BCE840052AD
      52004A844A000000000000000000000000000000000000000000000084000000
      8400000084000000000000000000000000000000000000000000000084000000
      840000008400000000000000000000000000000000000000000000000000B58C
      8C000000FF00000084000000FF0000008400FFFFFF00FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C004A844A004A844A004A84
      4A004A844A000000000000000000000000000000000000000000000084000000
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
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000F007000000000000
      F007000000000000C00100000000000080010000000000008000000000000000
      8000000000000000800000000000000080000000000000008000000000000000
      8001000000000000C001000000000000F80F000000000000F80F000000000000
      F81F000000000000F83F000000000000FFFFFFFFE07FFFFFE07FE007C01FF007
      C01FE007C00FE003C00FE007C007E003C007E007C007E003C007E007C007E003
      C007E007C007E003C007E007C007E003C007E007E007E003C007F3CFFC07E001
      E00FF3CFFF9FE000F21FF3CFF39FE001F39FF18FF39FE003F13FF81FF39FE003
      F83FF81FF83FE003FFFFFFFFFC7FFFFFFFFFFE7FF07FFFFF800FF07FE01FE03F
      0007C001E00FC01F0003C001E007C01F0003C001E007C01F0001C001E007C01F
      0001C001E007C01F8001C001E007C01FC001C001E007C003C003C001F007C001
      C00FC001F207C001E007C001F3DFC000E007C001F1DFC000F003C001F89FC000
      F803F001F81FC000FFFFFC7FFFFFE001800FFCFFE020FFFF800FFC3F20008001
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
  object DataSetProv: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      'select * from BANK_SELECT_ALL_PROV(1, 1)')
    AfterScroll = DataSetProvAfterScroll
    Left = 184
    Top = 472
    poSQLINT64ToBCD = True
  end
  object DataSourceProv: TDataSource
    DataSet = DataSetProv
    Left = 216
    Top = 472
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38771.497942152800000000
    ReportOptions.LastChange = 38772.650262615740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 248
    Top = 168
    Datasets = <>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 210.000000000000000000
      PaperHeight = 148.000000000000000000
      PaperSize = 11
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Memo1: TfrxMemoView
        Left = 3.779530000000000000
        Top = 15.118120000000000000
        Width = 710.551640000000000000
        Height = 30.236240000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          #1044#1086#1074#1110#1076#1082#1072)
        ParentFont = False
      end
      object Memo2: TfrxMemoView
        Left = 11.338590000000000000
        Top = 56.692950000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1044#1086#1082#1091#1084#1077#1085#1090' '#8470'  ')
        ParentFont = False
      end
      object Memo3: TfrxMemoView
        Left = 249.448980000000000000
        Top = 56.692950000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[date_doc]')
        ParentFont = False
      end
      object Memo4: TfrxMemoView
        Left = 226.771800000000000000
        Top = 56.692950000000000000
        Width = 22.677180000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1074#1110#1076)
        ParentFont = False
      end
      object Memo5: TfrxMemoView
        Left = 105.826840000000000000
        Top = 56.692950000000000000
        Width = 120.944960000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[num_doc]')
        ParentFont = False
      end
      object Memo6: TfrxMemoView
        Left = 328.819110000000000000
        Top = 56.692950000000000000
        Width = 52.913420000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1085#1072' '#1089#1091#1084#1091' ')
        ParentFont = False
      end
      object Memo7: TfrxMemoView
        Left = 381.732530000000000000
        Top = 56.692950000000000000
        Width = 117.165430000000000000
        Height = 18.897650000000000000
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2n'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[sum_doc]')
        ParentFont = False
      end
      object Memo8: TfrxMemoView
        Left = 498.897960000000000000
        Top = 56.692950000000000000
        Width = 215.433210000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1074#1110#1076#1086#1073#1088#1072#1078#1077#1085' '#1074' '#1086#1073#1083#1110#1082#1091' '#1073#1072#1085#1082#1110#1074#1089#1100#1082#1080#1093' '#1086#1087#1077#1088#1072#1094#1110#1081)
        ParentFont = False
      end
      object Memo9: TfrxMemoView
        Left = 11.338590000000000000
        Top = 83.149660000000000000
        Width = 695.433520000000000000
        Height = 41.574830000000000000
        AllowHTMLTags = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haBlock
        Memo.Strings = (
          #1087#1086' '#1073#1072#1083#1072#1085#1089#1086#1074#1086#1084#1091' '#1088#1072#1093#1091#1085#1082#1091' <b>[name_sch]</b> ( <i>[tytle_sch]</i> )')
        ParentFont = False
      end
      object Memo10: TfrxMemoView
        Left = 11.338590000000000000
        Top = 128.504020000000000000
        Width = 699.213050000000000000
        Height = 204.094620000000000000
        AllowHTMLTags = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haBlock
        Memo.Strings = (
          #1055#1077#1088#1077#1088#1072#1093#1086#1074#1072#1085#1086' '#1074#1110#1076' <i>[name_pred]</i>  ('#1028#1044#1056#1055#1054#1059' <b>[OKPO]</b>) '#1089' '
          #1056'/'#1056' <b>[RS]</b> '#1052#1060#1054' <b>[mfo]</b>  <i>[bank]</i>'
          #1085#1072' '#1087#1110#1076#1087#1088#1080#1108#1084#1089#1090#1074#1086' ('#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1102') '#1079' '#1088#1077#1082#1074#1110#1079#1080#1090#1072#1084#1080' : '
          '<i>[name_pred_cust]</i> ('#1028#1044#1056#1055#1054#1059' <b>[OKPO_cust]</b>)'
          #1056'/'#1056' <b>[RS_cust]</b> '#1052#1060#1054' <b>[mfo_cust]</b>  <i>[bank_cust]</i>'
          #1055#1110#1076#1089#1090#1072#1074#1072' '#1087#1077#1088#1077#1088#1072#1093#1086#1074#1072#1085#1086#1075#1086' '#1087#1083#1072#1090#1077#1078#1091' :'
          '<i>[note]</i>')
        ParentFont = False
      end
      object Memo11: TfrxMemoView
        Left = 7.559060000000000000
        Top = 351.496290000000000000
        Width = 102.047310000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          '[Date]')
        ParentFont = False
      end
      object Memo12: TfrxMemoView
        Left = 321.260050000000000000
        Top = 355.275820000000000000
        Width = 389.291590000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1055#1110#1076#1087#1080#1089#1100' ('#1085#1072#1076#1088#1091#1082#1091#1074#1072#1074#1096#1077#1075#1086' '#1076#1086#1074#1110#1076#1082#1091') : __________________')
        ParentFont = False
      end
      object Memo13: TfrxMemoView
        Left = 491.338900000000000000
        Top = 396.850650000000000000
        Width = 41.574830000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1052'.'#1055'.')
        ParentFont = False
      end
      object Memo14: TfrxMemoView
        Left = 275.905690000000000000
        Top = 445.984540000000000000
        Width = 430.866420000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1043#1086#1083#1086#1074#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088' ('#1047#1072#1084'. '#1043#1083'. '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072') : __________________')
        ParentFont = False
      end
    end
  end
  object DS: TpFIBDataSet
    Left = 344
    Top = 176
    poSQLINT64ToBCD = True
  end
  object DataSetLang: TpFIBDataSet
    Left = 704
    Top = 8
    poSQLINT64ToBCD = True
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39764.480194768500000000
    ReportOptions.LastChange = 39807.583776215300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var s_1, s_2: double;'
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with ReportTitle1, Engine do'
      '  begin'
      's_1 := 0;'
      's_2 := 0;'
      '  end'
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with MasterData1, Engine do'
      '  begin'
      '     s_1 := s_1 + <frxDBDataset1."SUMMA_PRIH">;'
      '     s_2 := s_2 + <frxDBDataset1."SUMMA_RASH">;'
      '  end'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 208
    Top = 120
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = 'OS_SCH'
        Value = #39#1059#1089#1110' '#1086#1089#1085#1086#1074#1085#1110' '#1088#1072#1093#1091#1085#1082#1080#39
      end
      item
        Name = 'KOR_SCH'
        Value = #39#1041#1077#1079' '#1086#1073#1084#1077#1078#1077#1085#1085#1103' '#1085#1072' '#1082#1086#1088#1077#1089#1087#1086#1085#1076#1091#1102#1095#1110' '#1088#1072#1093#1091#1085#1082#1080#39
      end
      item
        Name = 'DATE_BEGIN'
        Value = #39'16.12.2008'#39
      end
      item
        Name = 'DATE_END'
        Value = #39'25.12.2008'#39
      end
      item
        Name = 'SUMMA'
        Value = #39#1041#1077#1079' '#1086#1073#1084#1077#1078#1077#1085#1085#1103' '#1085#1072' '#1057#1059#1052#1059' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#39
      end
      item
        Name = 'FIO'
        Value = #39#1041#1077#1079' '#1086#1073#1084#1077#1078#1077#1085#1085#1103' '#1085#1072' '#1050#1054#1053#1058#1056#1040#1043#1045#1053#1058#1040#39
      end
      item
        Name = 'NOTE'
        Value = #39#1041#1077#1079' '#1086#1073#1084#1077#1078#1077#1085#1085#1103' '#1085#1072' '#1055#1030#1044#1057#1058#1040#1042#1059#39
      end
      item
        Name = 'RRR'
        Value = #39#1055#1056#1048#1041#1059#1058#1050#1054#1042#1030' '#1081' '#1042#1048#1044#1040#1058#1050#1054#1042#1030' '#1076#1086#1082#1091#1084#1077#1085#1090#1080#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 287.338590000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo1: TfrxMemoView
          Left = 222.779530000000000000
          Top = 3.779530000000001000
          Width = 288.000000000000000000
          Height = 28.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1077#1108#1089#1090#1088' '#1073#1072#1085#1082#1110#1074#1089#1100#1082#1080#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 10.779530000000000000
          Top = 51.779529999999990000
          Width = 168.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1059#1084#1086#1074#1080' '#1092#1110#1083#1100#1090#1088#1072#1094#1110#1111' :')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 10.779530000000000000
          Top = 75.779530000000000000
          Width = 108.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1054#1089#1085#1086#1074#1085#1110' '#1088#1072#1093#1091#1085#1082#1080' :')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 122.779530000000000000
          Top = 75.779530000000000000
          Width = 568.000000000000000000
          Height = 32.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          HAlign = haBlock
          Memo.Strings = (
            '[OS_SCH]')
          ParentFont = False
          Underlines = True
        end
        object Memo5: TfrxMemoView
          Left = 12.000000000000000000
          Top = 111.779530000000000000
          Width = 153.102350000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1050#1086#1088#1077#1089#1087#1086#1085#1076#1091#1102#1095#1080' '#1088#1072#1093#1091#1085#1082#1080' :')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 168.102350000000000000
          Top = 111.779530000000000000
          Width = 500.000000000000000000
          Height = 48.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          HAlign = haBlock
          Memo.Strings = (
            '[KOR_SCH]')
          ParentFont = False
          Underlines = True
        end
        object Memo7: TfrxMemoView
          Left = 101.102350000000000000
          Top = 167.779530000000000000
          Width = 64.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1055#1086' '#1044#1072#1090#1110' :')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 168.102350000000000000
          Top = 167.779530000000000000
          Width = 500.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Memo.Strings = (
            #1089'  [DATE_BEGIN]  '#1087#1086'  [DATE_END]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 89.102350000000000000
          Top = 190.779530000000000000
          Width = 76.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1055#1086' '#1057#1091#1084#1110' :')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 168.102350000000000000
          Top = 190.779530000000000000
          Width = 500.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Memo.Strings = (
            '[SUMMA]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 29.102350000000000000
          Top = 213.779530000000000000
          Width = 136.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1055#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091' :')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 168.102350000000000000
          Top = 213.779530000000000000
          Width = 500.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Memo.Strings = (
            '[FIO]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 8.220470000000000000
          Top = 236.779530000000000000
          Width = 156.881880000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1055#1086' '#1074#1082#1083#1102#1095#1077#1085#1085#1102' '#1091' '#1087#1110#1076#1089#1090#1072#1074#1091' :')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 168.102350000000000000
          Top = 236.779530000000000000
          Width = 500.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Memo.Strings = (
            '[NOTE]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 18.897650000000000000
          Top = 263.559060000000000000
          Width = 146.204700000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1059#1084#1086#1074#1072' '#1087#1088#1080#1073#1091#1090#1082#1086#1074#1086#1089#1090#1110' :')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 168.102350000000000000
          Top = 263.559060000000000000
          Width = 500.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Memo.Strings = (
            '[RRR]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 20.000000000000000000
        Top = 442.205010000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo17: TfrxMemoView
          Left = 32.000000000000000000
          Width = 80.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."NUMBER_DOC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 504.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."SUMMA_PRIH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 280.000000000000000000
          Width = 224.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_CUST"]('#1056'/'#1089'-[frxDBDataset1."NUM_RAS_CUST"])'
            '[frxDBDataset1."NOTE_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 112.000000000000000000
          Width = 72.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."DATE_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 604.000000000000000000
          Width = 96.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."SUMMA_RASH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Width = 32.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[LINE#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 184.000000000000000000
          Width = 96.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."NUM_RAS_NATIVE"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 51.850650000000000000
        Top = 328.819110000000000000
        Width = 718.110700000000000000
        object Memo35: TfrxMemoView
          Left = 607.102350000000000000
          Top = 3.779530000000022000
          Width = 84.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1088'. [PAGE#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 604.000000000000000000
          Top = 31.850649999999970000
          Width = 96.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072' '#1074#1080#1073#1091#1090#1082#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 112.000000000000000000
          Top = 31.850649999999970000
          Width = 72.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1086#1082'-'#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 280.000000000000000000
          Top = 31.850649999999970000
          Width = 224.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090'  '#1090#1072'  '#1087#1110#1076#1089#1090#1072#1074#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 504.000000000000000000
          Top = 31.850649999999970000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072' '#1087#1088#1080#1073#1091#1090#1082#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 32.000000000000000000
          Top = 31.850649999999970000
          Width = 80.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1053#1086#1084#1077#1088' '#1076#1086#1082'-'#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Top = 31.850649999999970000
          Width = 32.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 184.000000000000000000
          Top = 31.850649999999970000
          Width = 96.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1096' '#1056'\'#1089)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 20.000000000000000000
        Top = 521.575140000000100000
        Width = 718.110700000000000000
        object Memo24: TfrxMemoView
          Width = 504.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' : ')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 504.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[s_1]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 604.000000000000000000
          Width = 96.000000000000000000
          Height = 20.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[s_2]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    OpenDataSource = False
    DataSet = pFIBDataSet1
    Left = 232
    Top = 8
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 296
    Top = 112
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 504
    Top = 136
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 440
    Top = 104
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 472
    Top = 104
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 504
    Top = 104
  end
  object pFIBDataSet2: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      'SELECT * FROM BANK_SELECT_FIND_ALL_PROV(1)')
    Left = 360
    Top = 8
    poSQLINT64ToBCD = True
    object FIBBCDField1: TFIBBCDField
      FieldName = 'ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object FIBStringField1: TFIBStringField
      FieldName = 'NUMBER_DOC'
      Size = 120
      EmptyStrToNull = True
    end
    object FIBBCDField2: TFIBBCDField
      FieldName = 'SUMMA_PRIH'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object FIBStringField2: TFIBStringField
      FieldName = 'NOTE_DOC'
      Size = 255
      EmptyStrToNull = True
    end
    object FIBStringField3: TFIBStringField
      FieldName = 'FIO_DOC'
      Size = 150
      EmptyStrToNull = True
    end
    object FIBIntegerField1: TFIBIntegerField
      FieldName = 'PRIHOD'
    end
    object FIBDateField1: TFIBDateField
      FieldName = 'DATE_DOC'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object FIBBCDField3: TFIBBCDField
      FieldName = 'SUMMA_RASH'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object FIBStringField4: TFIBStringField
      FieldName = 'NUM_RAS_NATIVE'
      Size = 30
      EmptyStrToNull = True
    end
    object FIBStringField5: TFIBStringField
      FieldName = 'NUM_RAS_CUST'
      Size = 30
      EmptyStrToNull = True
    end
    object FIBStringField6: TFIBStringField
      FieldName = 'NAME_CUST'
      Size = 180
      EmptyStrToNull = True
    end
    object FIBIntegerField2: TFIBIntegerField
      FieldName = 'IS_SPRAVKA'
    end
    object FIBDateField2: TFIBDateField
      FieldName = 'DATE_PROV'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object FIBStringField7: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object FIBStringField8: TFIBStringField
      FieldName = 'TITLE_SCH'
      Size = 60
      EmptyStrToNull = True
    end
    object FIBBCDField4: TFIBBCDField
      FieldName = 'SUMMA_P'
      Size = 2
      RoundByScale = True
    end
    object FIBBCDField5: TFIBBCDField
      FieldName = 'SUMMA_R'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet2PK_ID: TFIBBCDField
      FieldName = 'PK_ID'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSet2PK_: TFIBStringField
      FieldName = 'PK_'
      Size = 16
      EmptyStrToNull = True
    end
    object pFIBDataSet2DATE_REG: TFIBDateField
      FieldName = 'DATE_REG'
    end
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_DOC=ID_DOC'
      'NUMBER_DOC=NUMBER_DOC'
      'SUMMA_PRIH=SUMMA_PRIH'
      'NOTE_DOC=NOTE_DOC'
      'FIO_DOC=FIO_DOC'
      'PRIHOD=PRIHOD'
      'DATE_DOC=DATE_DOC'
      'SUMMA_RASH=SUMMA_RASH'
      'NUM_RAS_NATIVE=NUM_RAS_NATIVE'
      'NUM_RAS_CUST=NUM_RAS_CUST'
      'NAME_CUST=NAME_CUST'
      'IS_SPRAVKA=IS_SPRAVKA'
      'DATE_PROV=DATE_PROV'
      'SCH_NUMBER=SCH_NUMBER'
      'TITLE_SCH=TITLE_SCH'
      'SUMMA_P=SUMMA_P'
      'SUMMA_R=SUMMA_R'
      'PK_ID=PK_ID'
      'PK_=PK_'
      'DATE_REG=DATE_REG')
    OpenDataSource = False
    DataSet = pFIBDataSet2
    Left = 392
    Top = 8
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 24
    Top = 360
  end
end
