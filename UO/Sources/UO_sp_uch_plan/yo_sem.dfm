object fmyo_sem: Tfmyo_sem
  Left = 186
  Top = 136
  Width = 696
  Height = 480
  Caption = 'fmyo_sem'
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
    Width = 688
    Height = 426
    Align = alClient
    BevelInner = bvSpace
    BevelKind = bkFlat
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
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
      object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
        Width = 183
        DataBinding.FieldName = 'SHORT_NAME_KURS'
      end
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Width = 257
        DataBinding.FieldName = 'NAME_SEM'
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Width = 152
        DataBinding.FieldName = 'SHORT_NAME_SEM'
      end
      object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Width = 90
        DataBinding.FieldName = 'KOD_SEM'
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
  object DS: TpFIBDataSet
    Database = D
    Transaction = Tr
    SelectSQL.Strings = (
      'select * from UO_TEMP_HOURS_SEM_SELECT(1, 1)')
    Left = 368
    Top = 264
    poSQLINT64ToBCD = True
    object DSID_SP_UCH_PL_SEM: TFIBBCDField
      FieldName = 'ID_SP_UCH_PL_SEM'
      Size = 0
      RoundByScale = True
    end
    object DSTRIVALIST: TFIBSmallIntField
      FieldName = 'TRIVALIST'
    end
    object DSID_SP_UCH_PLAN: TFIBBCDField
      FieldName = 'ID_SP_UCH_PLAN'
      Size = 0
      RoundByScale = True
    end
    object DSID_SP_KURS: TFIBBCDField
      FieldName = 'ID_SP_KURS'
      Size = 0
      RoundByScale = True
    end
    object DSID_SP_SEMESTR: TFIBBCDField
      FieldName = 'ID_SP_SEMESTR'
      Size = 0
      RoundByScale = True
    end
    object DSKOD_KURS: TFIBIntegerField
      FieldName = 'KOD_KURS'
    end
    object DSNAME_KURS: TFIBStringField
      FieldName = 'NAME_KURS'
      Size = 100
      EmptyStrToNull = True
    end
    object DSSHORT_NAME_KURS: TFIBStringField
      FieldName = 'SHORT_NAME_KURS'
      Size = 100
      EmptyStrToNull = True
    end
    object DSSHORT_NAME_SEM: TFIBStringField
      FieldName = 'SHORT_NAME_SEM'
      Size = 100
      EmptyStrToNull = True
    end
    object DSNAME_SEM: TFIBStringField
      FieldName = 'NAME_SEM'
      Size = 100
      EmptyStrToNull = True
    end
    object DSKOD_SEM: TFIBSmallIntField
      FieldName = 'KOD_SEM'
    end
  end
  object D: TpFIBDatabase
    DBName = 'E:\Poltava\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=sysdba')
    DefaultTransaction = Tr
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 48
    Top = 72
  end
  object Tr: TpFIBTransaction
    DefaultDatabase = D
    TimeoutAction = TARollback
    Left = 88
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = DS
    Left = 328
    Top = 264
  end
  object ActionList1: TActionList
    Left = 448
    Top = 96
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = Action1Execute
    end
  end
end
