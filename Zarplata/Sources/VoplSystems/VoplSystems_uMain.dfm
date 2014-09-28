object FZVoSystems: TFZVoSystems
  Left = 285
  Top = 178
  Width = 619
  Height = 342
  Caption = 'FZVoSystems'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PanelGridParent: TPanel
    Left = 0
    Top = 0
    Width = 370
    Height = 312
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Grid1: TcxGrid
      Left = 0
      Top = 0
      Width = 370
      Height = 312
      Align = alClient
      BevelInner = bvNone
      BorderStyle = cxcbsNone
      TabOrder = 0
      object Grid1View1: TcxGridDBTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'ID_VIDOPL'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = Grid1View1FocusedRecordChanged
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = GridClName
        OptionsCustomize.ColumnFiltering = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GridLineColor = clBtnText
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object GridClKod: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortOrder = soAscending
          Width = 59
          DataBinding.FieldName = 'KOD_VIDOPL'
        end
        object GridClName: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 277
          DataBinding.FieldName = 'NAME_VIDOPL'
        end
        object GridClGroup: TcxGridDBColumn
          Visible = False
          GroupIndex = 1
          SortOrder = soAscending
          DataBinding.FieldName = 'NAME_VOPL_GROUP'
        end
        object GridClNachicl: TcxGridDBColumn
          Visible = False
          OnGetDisplayText = GridClNachiclGetDisplayText
          GroupIndex = 0
          SortOrder = soDescending
          DataBinding.FieldName = 'NACHISL'
        end
      end
      object Grid1Level1: TcxGridLevel
        GridView = Grid1View1
      end
    end
  end
  object PanelGridChild: TPanel
    Left = 378
    Top = 0
    Width = 233
    Height = 312
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 5
    object Grid2: TcxGrid
      Left = 0
      Top = 0
      Width = 233
      Height = 312
      Align = alClient
      BevelInner = bvNone
      BorderStyle = cxcbsNone
      TabOrder = 0
      object Grid2View1: TcxGridDBTableView
        OnDblClick = Grid2View1DblClick
        OnKeyUp = Grid2View1KeyUp
        DataController.DataModeController.SmartRefresh = True
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'ID_SYSTEM'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = GridClSystems
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GridLineColor = clBtnText
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object GridClSystems: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 136
          DataBinding.FieldName = 'NAME_SYSTEM'
        end
        object GridClYesNo: TcxGridDBColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ReadOnly = False
          Properties.ValueChecked = 'T'
          Properties.ValueUnchecked = 'F'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Options.IncSearch = False
          Options.Sorting = False
          Width = 98
          DataBinding.FieldName = 'IN_USE'
        end
      end
      object Grid2Level1: TcxGridLevel
        GridView = Grid2View1
      end
    end
  end
  object SplitterGridChildControl: TcxSplitter
    Left = 370
    Top = 0
    Width = 8
    Height = 312
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 100
    AlignSplitter = salRight
    Control = PanelGridChild
  end
  object LocateBarDockControl: TdxBarDockControl
    Left = 0
    Top = 312
    Width = 611
    Height = 3
    Align = dalBottom
    AllowDocking = False
    BarManager = BarManager
    SunkenBorder = False
    UseOwnSunkenBorder = True
  end
  object BarManager: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clActiveBorder
    PopupMenuLinks = <>
    Style = bmsFlat
    UseSystemFont = True
    Left = 568
    Top = 48
    DockControlHeights = (
      0
      0
      0
      0)
  end
  object DataSourceParent: TDataSource
    DataSet = DataSetParent
    Left = 472
  end
  object DataSourceChild: TDataSource
    DataSet = DataSetChild
    Left = 472
    Top = 28
  end
  object DataBase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 344
  end
  object DataSetParent: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    Left = 376
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 408
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 408
    Top = 27
  end
  object StoredProc: TpFIBStoredProc
    Database = DataBase
    Transaction = WriteTransaction
    Left = 440
    Top = 16
  end
  object DataSetChild: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    DataSource = DataSourceParent
    Left = 376
    Top = 27
    poSQLINT64ToBCD = True
  end
  object Styles: TcxStyleRepository
    Left = 547
    Top = 8
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
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
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
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
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
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
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
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
      TextColor = clNavy
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
  object ActionList: TActionList
    Left = 570
    Top = 96
    object SystemAction: TAction
      Caption = 'SystemAction'
      ShortCut = 49242
      OnExecute = SystemActionExecute
    end
  end
end
