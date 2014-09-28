object fmuo_dics: Tfmuo_dics
  Left = 255
  Top = 117
  Width = 696
  Height = 480
  Caption = 'fmuo_dics'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 448
    Height = 426
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = cxGrid1DBTableView1DBColumn2
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = fmuo_sp_uchplan_main.cxStyleYellow
      Styles.Content = fmuo_sp_uchplan_main.cxStyleYellow
      Styles.ContentEven = fmuo_sp_uchplan_main.cxStyleYellow
      Styles.ContentOdd = fmuo_sp_uchplan_main.cxStyleYellow
      Styles.Inactive = fmuo_sp_uchplan_main.cxStyle4
      Styles.IncSearch = fmuo_sp_uchplan_main.cxStyleYellow
      Styles.Selection = fmuo_sp_uchplan_main.cxStyle17
      Styles.FilterBox = fmuo_sp_uchplan_main.cxStyleYellow
      Styles.Footer = fmuo_sp_uchplan_main.cxStyleBorder
      Styles.Group = fmuo_sp_uchplan_main.cxStyleYellow
      Styles.GroupByBox = fmuo_sp_uchplan_main.cxStyleYellow
      Styles.Header = fmuo_sp_uchplan_main.cxStyleBorder
      Styles.Indicator = fmuo_sp_uchplan_main.cxStyleYellow
      Styles.NewItemRowInfoText = fmuo_sp_uchplan_main.cxStyleYellow
      Styles.Preview = fmuo_sp_uchplan_main.cxStyleYellow
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Visible = False
        GroupIndex = 0
        SortOrder = soAscending
        DataBinding.FieldName = 'NAME_CIKL'
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Width = 106
        DataBinding.FieldName = 'NAME_DISC'
      end
      object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Width = 82
        DataBinding.FieldName = 'SHORT_NAME_DISC'
      end
      object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
        Width = 70
        DataBinding.FieldName = 'KOD_DISC'
      end
      object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
        Caption = #1057#1087#1077#1094#1110#1072#1083#1110#1079#1072#1094#1110#1103
        Visible = False
        GroupIndex = 1
        SortOrder = soAscending
        Width = 171
        DataBinding.FieldName = 'NAME_SPECIALIZATION'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object dxStatusBarSP: TdxStatusBar
    Left = 0
    Top = 426
    Width = 688
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
      end>
    PaintStyle = stpsOffice11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object cxSplitter1: TcxSplitter
    Left = 448
    Top = 0
    Width = 8
    Height = 426
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 60
    AlignSplitter = salRight
    Control = Panel1
  end
  object Panel1: TPanel
    Left = 456
    Top = 0
    Width = 232
    Height = 426
    Align = alRight
    TabOrder = 3
    object cxGrid2: TcxGrid
      Left = 1
      Top = 18
      Width = 230
      Height = 407
      Align = alClient
      TabOrder = 0
      object cxGrid2DBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSource2
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0'
            Kind = skSum
            FieldName = 'VAL_HOURS'
            Column = cxGrid2DBTableView1DBColumn4
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        Styles.Background = fmuo_sp_uchplan_main.cxStyleYellow
        Styles.Content = fmuo_sp_uchplan_main.cxStyleYellow
        Styles.ContentEven = fmuo_sp_uchplan_main.cxStyleYellow
        Styles.ContentOdd = fmuo_sp_uchplan_main.cxStyleYellow
        Styles.Inactive = fmuo_sp_uchplan_main.cxStyle4
        Styles.IncSearch = fmuo_sp_uchplan_main.cxStyleYellow
        Styles.Selection = fmuo_sp_uchplan_main.cxStyle17
        Styles.FilterBox = fmuo_sp_uchplan_main.cxStyleYellow
        Styles.Footer = fmuo_sp_uchplan_main.cxStyleBorder
        Styles.Group = fmuo_sp_uchplan_main.cxStyleYellow
        Styles.GroupByBox = fmuo_sp_uchplan_main.cxStyleYellow
        Styles.Header = fmuo_sp_uchplan_main.cxStyleBorder
        Styles.Indicator = fmuo_sp_uchplan_main.cxStyleYellow
        Styles.NewItemRowInfoText = fmuo_sp_uchplan_main.cxStyleYellow
        Styles.Preview = fmuo_sp_uchplan_main.cxStyleYellow
        object cxGrid2DBTableView1DBColumn1: TcxGridDBColumn
          Visible = False
          GroupIndex = 1
          SortOrder = soAscending
          Width = 75
          DataBinding.FieldName = 'NAME_SEM'
        end
        object cxGrid2DBTableView1DBColumn2: TcxGridDBColumn
          Visible = False
          GroupIndex = 0
          SortOrder = soAscending
          Width = 76
          DataBinding.FieldName = 'NAME_KURS'
        end
        object cxGrid2DBTableView1DBColumn3: TcxGridDBColumn
          Width = 58
          DataBinding.FieldName = 'NAME_TYPE'
        end
        object cxGrid2DBTableView1DBColumn4: TcxGridDBColumn
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.Precision = 16
          Width = 37
          DataBinding.FieldName = 'VAL_HOURS'
        end
        object cxGrid2DBTableView1DBColumn5: TcxGridDBColumn
          Caption = #1053#1072' '#1089#1090#1091#1076#1077#1085#1090#1072
          Visible = False
          DataBinding.FieldName = 'VAL_KONT'
        end
        object cxGrid2DBTableView1DBColumn6: TcxGridDBColumn
          Caption = #1053#1072' '#1075#1088#1091#1087#1091
          Visible = False
          DataBinding.FieldName = 'VAL_GROUP'
        end
        object cxGrid2DBTableView1DBColumn7: TcxGridDBColumn
          Caption = #1053#1072' '#1074#1110#1076#1089#1086#1090#1086#1082
          Visible = False
          DataBinding.FieldName = 'VAL_PERCENT'
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxGrid2DBTableView1
      end
    end
    object cxLabel1: TcxLabel
      Left = 1
      Top = 1
      Width = 230
      Height = 17
      Align = alTop
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clTeal
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #1042#1078#1077' '#1110#1089#1085#1091#1102#1095#1110' '#1076#1072#1085#1110
    end
  end
  object DS: TpFIBDataSet
    Database = DB
    Transaction = Tr
    SelectSQL.Strings = (
      'select * from UO_TEMP_UCH_PL_PERELIK_SEL_L(1, 1)')
    Left = 288
    Top = 296
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
    object DSID_SP_CIKL_PDG: TFIBBCDField
      FieldName = 'ID_SP_CIKL_PDG'
      Size = 0
      RoundByScale = True
    end
    object DSNAME_CIKL: TFIBStringField
      FieldName = 'NAME_CIKL'
      Size = 100
      EmptyStrToNull = True
    end
    object DSSHORT_NAME_CIKL: TFIBStringField
      FieldName = 'SHORT_NAME_CIKL'
      Size = 100
      EmptyStrToNull = True
    end
    object DSKOD_CIKL: TFIBIntegerField
      FieldName = 'KOD_CIKL'
    end
    object DSNAME_DISC: TFIBStringField
      FieldName = 'NAME_DISC'
      Size = 100
      EmptyStrToNull = True
    end
    object DSSHORT_NAME_DISC: TFIBStringField
      FieldName = 'SHORT_NAME_DISC'
      Size = 100
      EmptyStrToNull = True
    end
    object DSKOD_DISC: TFIBIntegerField
      FieldName = 'KOD_DISC'
    end
    object DSID_SP_TYPE_DISC: TFIBBCDField
      FieldName = 'ID_SP_TYPE_DISC'
      Size = 0
      RoundByScale = True
    end
    object DSNAME_TYPE: TFIBStringField
      FieldName = 'NAME_TYPE'
      Size = 100
      EmptyStrToNull = True
    end
    object DSKOD_TYPE: TFIBIntegerField
      FieldName = 'KOD_TYPE'
    end
    object DSSHORT_NAME_TYPE: TFIBStringField
      FieldName = 'SHORT_NAME_TYPE'
      Size = 100
      EmptyStrToNull = True
    end
    object DSID_SP_DISC: TFIBBCDField
      FieldName = 'ID_SP_DISC'
      Size = 0
      RoundByScale = True
    end
    object DSID_SP_UCH_PL_PERELIK: TFIBBCDField
      FieldName = 'ID_SP_UCH_PL_PERELIK'
      Size = 0
      RoundByScale = True
    end
    object DSID_SP_SPECIALIZATION: TFIBBCDField
      FieldName = 'ID_SP_SPECIALIZATION'
      Size = 0
      RoundByScale = True
    end
    object DSSHORT_NAME_SPECIALIZATION: TFIBStringField
      FieldName = 'SHORT_NAME_SPECIALIZATION'
      Size = 100
      EmptyStrToNull = True
    end
    object DSNAME_SPECIALIZATION: TFIBStringField
      FieldName = 'NAME_SPECIALIZATION'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object Tr: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 80
  end
  object DB: TpFIBDatabase
    DBName = 'E:\Poltava\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=sysdba')
    DefaultTransaction = Tr
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 128
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = DS
    Left = 352
    Top = 296
  end
  object ActionList1: TActionList
    Left = 216
    Top = 168
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 27
      OnExecute = Action2Execute
    end
  end
  object DSS: TpFIBDataSet
    Database = DB
    Transaction = Tr
    SelectSQL.Strings = (
      'select * from UO_TEMP_PERELIK(1, 1, 1)')
    DataSource = DataSource1
    Left = 536
    Top = 224
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    object DSSID_SP_SEMESTR: TFIBBCDField
      FieldName = 'ID_SP_SEMESTR'
      Size = 0
      RoundByScale = True
    end
    object DSSID_SP_TYPE_DISC_LESSON: TFIBBCDField
      FieldName = 'ID_SP_TYPE_DISC_LESSON'
      Size = 0
      RoundByScale = True
    end
    object DSSID_SPUCH_PL_HOURS: TFIBBCDField
      FieldName = 'ID_SPUCH_PL_HOURS'
      Size = 0
      RoundByScale = True
    end
    object DSSVAL_HOURS: TFIBBCDField
      FieldName = 'VAL_HOURS'
      Size = 0
      RoundByScale = True
    end
    object DSSSHORT_NAME_TYPE: TFIBStringField
      FieldName = 'SHORT_NAME_TYPE'
      Size = 100
      EmptyStrToNull = True
    end
    object DSSNAME_TYPE: TFIBStringField
      FieldName = 'NAME_TYPE'
      Size = 100
      EmptyStrToNull = True
    end
    object DSSTRIVALIST: TFIBSmallIntField
      FieldName = 'TRIVALIST'
    end
    object DSSID_SP_KURS: TFIBBCDField
      FieldName = 'ID_SP_KURS'
      Size = 0
      RoundByScale = True
    end
    object DSSKOD_SEM: TFIBIntegerField
      FieldName = 'KOD_SEM'
    end
    object DSSSHORT_NAME_SEM: TFIBStringField
      FieldName = 'SHORT_NAME_SEM'
      Size = 100
      EmptyStrToNull = True
    end
    object DSSNAME_SEM: TFIBStringField
      FieldName = 'NAME_SEM'
      Size = 100
      EmptyStrToNull = True
    end
    object DSSKOD_KURS: TFIBIntegerField
      FieldName = 'KOD_KURS'
    end
    object DSSNAME_KURS: TFIBStringField
      FieldName = 'NAME_KURS'
      Size = 100
      EmptyStrToNull = True
    end
    object DSSSHORT_NAME_KURS: TFIBStringField
      FieldName = 'SHORT_NAME_KURS'
      Size = 100
      EmptyStrToNull = True
    end
    object DSSKOD_TYPE: TFIBIntegerField
      FieldName = 'KOD_TYPE'
    end
    object DSSVAL_KONT: TFIBFloatField
      FieldName = 'VAL_KONT'
    end
    object DSSVAL_GROUP: TFIBFloatField
      FieldName = 'VAL_GROUP'
    end
    object DSSVAL_PERCENT: TFIBFloatField
      FieldName = 'VAL_PERCENT'
    end
  end
  object DataSource2: TDataSource
    DataSet = DSS
    Left = 584
    Top = 224
  end
end
