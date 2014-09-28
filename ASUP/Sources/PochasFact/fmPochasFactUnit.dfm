object fmPochasFact: TfmPochasFact
  Left = 366
  Top = 135
  Width = 800
  Height = 600
  Caption = #1060#1072#1082#1090#1080#1095#1085#1072' '#1087#1086#1075#1086#1076#1080#1085#1085#1072' '#1087#1088#1072#1094#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 49
    Align = alTop
    TabOrder = 0
    object Man: TqFSpravControl
      Left = 16
      Top = 16
      Width = 617
      Height = 21
      FieldName = 'ID_MAN'
      DisplayName = #1060#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072
      Interval = 120
      Value = Null
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = True
      Enabled = True
      Blocked = False
      TabOrder = 0
      AutoSaveToRegistry = False
      OnOpenSprav = ManOpenSprav
      DisplayText = ''
      DisplayTextField = 'FIO'
    end
  end
  object LeftPanel: TPanel
    Left = 0
    Top = 49
    Width = 497
    Height = 517
    Align = alLeft
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 495
      Height = 16
      Align = alTop
      Caption = #1055#1083#1072#1085#1086#1074#1072' '#1087#1086#1075#1086#1076#1080#1085#1085#1072' '#1087#1088#1072#1094#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel5: TPanel
      Left = 1
      Top = 17
      Width = 495
      Height = 56
      Align = alTop
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 1
    end
    object cxGrid2: TcxGrid
      Left = 1
      Top = 389
      Width = 495
      Height = 127
      Align = alBottom
      BevelInner = bvNone
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object cxGridDBTableView2: TcxGridDBTableView
        OnKeyDown = cxGridDBTableView1KeyDown
        DataController.DataSource = SmDataSourse
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = qizzStyle
        Styles.ContentEven = stContent
        Styles.ContentOdd = stContent
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1073#1102#1076#1078#1077#1090#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 140
          DataBinding.FieldName = 'KOD_SM'
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = #1041#1102#1076#1078#1077#1090
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 236
          DataBinding.FieldName = 'SM_TITLE'
        end
        object cxGridDBColumn4: TcxGridDBColumn
          Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1075#1086#1076#1080#1085
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00'#39'.'#39';-,0.00'#39'.'#39
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 69
          DataBinding.FieldName = 'HOURS'
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = cxGridDBTableView2
      end
    end
    object ItemsGrid: TcxGrid
      Left = 1
      Top = 73
      Width = 495
      Height = 308
      Align = alClient
      TabOrder = 3
      object cxGridDBTableView6: TcxGridDBTableView
        OnKeyDown = cxGridDBTableView6KeyDown
        DataController.DataSource = PlanDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = qizzStyle
        object cxGridDBTableView6DBColumn1: TcxGridDBColumn
          Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 75
          DataBinding.FieldName = 'DATE_BEG'
        end
        object cxGridDBTableView6DBColumn2: TcxGridDBColumn
          Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 89
          DataBinding.FieldName = 'DATE_END'
        end
        object cxGridDBTableView6DBColumn4: TcxGridDBColumn
          Caption = #1058#1072#1088#1080#1092
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 77
          DataBinding.FieldName = 'TARIF'
        end
        object cxGridDBTableView6DBColumn3: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1072#1079#1091
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 84
          DataBinding.FieldName = 'NUM_ORDER'
        end
        object cxGridDBTableView6DBColumn5: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1085#1072#1082#1072#1079#1091
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 75
          DataBinding.FieldName = 'DATE_ORDER'
        end
        object cxGridDBTableView6DBColumn6: TcxGridDBColumn
          Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1075#1086#1076#1080#1085
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 76
          DataBinding.FieldName = 'HOURS'
        end
        object cxGridDBTableView6DBColumn7: TcxGridDBColumn
          Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
          Visible = False
          GroupIndex = 0
          SortOrder = soAscending
          DataBinding.FieldName = 'DEPARTMENT_NAME'
        end
      end
      object cxGridLevel6: TcxGridLevel
        GridView = cxGridDBTableView6
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 381
      Width = 495
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer8Style'
      AlignSplitter = salBottom
      Control = cxGrid2
    end
  end
  object PeopleSplitter: TcxSplitter
    Left = 497
    Top = 49
    Width = 8
    Height = 517
    Hint = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1081#1085#1072' '#1087#1072#1085#1077#1083#1100
    HotZoneClassName = 'TcxMediaPlayer9Style'
    Control = LeftPanel
    ShowHint = True
    ParentShowHint = False
  end
  object RigthPanel: TPanel
    Left = 505
    Top = 49
    Width = 287
    Height = 517
    Align = alClient
    TabOrder = 3
    object cxGrid1: TcxGrid
      Left = 1
      Top = 73
      Width = 285
      Height = 308
      Align = alClient
      TabOrder = 0
      object cxGridDBTableView1: TcxGridDBTableView
        OnDblClick = ModifyItemButtonClick
        OnKeyDown = cxGridDBTableView1KeyDown
        DataController.DataSource = FactDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
            FieldName = 'HOURS'
            Column = cxGridDBTableView1DBColumn4
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = qizzStyle
        object cxGridDBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 86
          DataBinding.FieldName = 'PERIOD_BEG'
        end
        object cxGridDBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 84
          DataBinding.FieldName = 'PERIOD_END'
        end
        object cxGridDBTableView1DBColumn3: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088' '#1072#1082#1090#1091
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 84
          DataBinding.FieldName = 'NUM_ACT'
        end
        object cxGridDBTableView1DBColumn5: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1072#1082#1090#1091
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Filtering = False
          DataBinding.FieldName = 'DATE_ACT'
        end
        object cxGridDBTableView1DBColumn4: TcxGridDBColumn
          Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1075#1086#1076#1080#1085
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 86
          DataBinding.FieldName = 'HOURS'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 17
      Width = 285
      Height = 56
      Align = alTop
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 1
      object dxBarDockControl1: TdxBarDockControl
        Left = 1
        Top = 0
        Width = 283
        Height = 44
        Align = dalNone
        BarManager = dxBarManager1
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 285
      Height = 16
      Align = alTop
      Caption = #1060#1072#1082#1090#1080#1095#1085#1072' '#1087#1086#1075#1086#1076#1080#1085#1085#1072' '#1087#1088#1072#1094#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object cxGrid3: TcxGrid
      Left = 1
      Top = 389
      Width = 285
      Height = 127
      Align = alBottom
      BevelInner = bvNone
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object cxGridDBTableView3: TcxGridDBTableView
        OnKeyDown = cxGridDBTableView1KeyDown
        DataController.DataSource = FactSmetSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = qizzStyle
        Styles.ContentEven = stContent
        Styles.ContentOdd = stContent
        object cxGridDBColumn3: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1073#1102#1076#1078#1077#1090#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 140
          DataBinding.FieldName = 'KOD_SM'
        end
        object cxGridDBColumn5: TcxGridDBColumn
          Caption = #1041#1102#1076#1078#1077#1090
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 236
          DataBinding.FieldName = 'SM_TITLE'
        end
        object cxGridDBColumn6: TcxGridDBColumn
          Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1075#1086#1076#1080#1085
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00'#39'.'#39';-,0.00'#39'.'#39
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 69
          DataBinding.FieldName = 'HOURS'
        end
      end
      object cxGridLevel3: TcxGridLevel
        GridView = cxGridDBTableView3
      end
    end
    object cxSplitter2: TcxSplitter
      Left = 1
      Top = 381
      Width = 285
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer8Style'
      AlignSplitter = salBottom
      Control = cxGrid3
    end
  end
  object LocalDatabase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = LocalReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 363
    Top = 8
  end
  object LocalReadTransaction: TpFIBTransaction
    DefaultDatabase = LocalDatabase
    TimeoutAction = TARollback
    Left = 395
    Top = 8
  end
  object LocalWriteTransaction: TpFIBTransaction
    DefaultDatabase = LocalDatabase
    TimeoutAction = TARollback
    Left = 427
    Top = 8
  end
  object KeyList: TActionList
    Left = 332
    Top = 7
    object OkAction: TAction
      Caption = #1043#1072#1088#1072#1079#1076
      ShortCut = 13
      SecondaryShortCuts.Strings = (
        'F10')
    end
    object Cancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1072
      ShortCut = 27
      OnExecute = CancelExecute
    end
    object AddPochas: TAction
      Caption = #1044#1086#1076#1072#1090#1080
    end
    object ModifyPochas: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
    end
    object DeletePochas: TAction
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080
    end
    object ViewPochas: TAction
      Caption = #1055#1077#1088#1077#1075#1083#1103#1076
    end
    object ClonePochas: TAction
      Caption = #1050#1086#1087#1110#1102#1074#1072#1090#1080
    end
    object PrintOrderAction: TAction
      Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1085#1072#1082#1072#1079
    end
  end
  object PlanQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    AfterOpen = PlanQueryAfterOpen
    AfterScroll = PlanQueryAfterScroll
    Left = 208
    Top = 176
    poSQLINT64ToBCD = True
  end
  object PlanDataSource: TDataSource
    DataSet = PlanQuery
    Left = 240
    Top = 177
  end
  object FactQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    AfterOpen = FactQueryAfterOpen
    AfterScroll = FactQueryAfterScroll
    Left = 384
    Top = 184
    poSQLINT64ToBCD = True
  end
  object FactDataSource: TDataSource
    DataSet = FactQuery
    Left = 416
    Top = 185
  end
  object StyleRepository: TcxStyleRepository
    Left = 392
    Top = 192
    object stBackground: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object stContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentOdd: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stFilterBox: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object stFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stGroup: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object stGroupByBox: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object stHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stInactive: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object stIncSearch: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object stIndicator: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object stPreview: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stHotTrack: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clMaroon
    end
    object qizzStyle: TcxGridTableViewStyleSheet
      Styles.Background = stBackground
      Styles.Content = stContent
      Styles.ContentEven = stContentEven
      Styles.ContentOdd = stContentOdd
      Styles.Inactive = stInactive
      Styles.IncSearch = stIncSearch
      Styles.Selection = stSelection
      Styles.FilterBox = stFilterBox
      Styles.Footer = stFooter
      Styles.Group = stGroup
      Styles.GroupByBox = stGroupByBox
      Styles.Header = stHeader
      Styles.Indicator = stIndicator
      Styles.Preview = stPreview
      BuiltIn = True
    end
  end
  object SmDataSets: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    DataSource = PlanDataSource
    AfterOpen = PlanQueryAfterOpen
    AfterScroll = PlanQueryAfterScroll
    Left = 96
    Top = 320
    poSQLINT64ToBCD = True
  end
  object SmDataSourse: TDataSource
    DataSet = SmDataSets
    Left = 128
    Top = 321
  end
  object FactSmetSource: TDataSource
    DataSet = FactSmets
    Left = 528
    Top = 313
  end
  object FactSmets: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    DataSource = FactDataSource
    AfterOpen = PlanQueryAfterOpen
    Left = 496
    Top = 312
    poSQLINT64ToBCD = True
  end
  object dxBarManager1: TdxBarManager
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
        BorderStyle = bbsNone
        Caption = 'Main'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 2
        DockedTop = 0
        FloatLeft = 404
        FloatTop = 344
        FloatClientWidth = 62
        FloatClientHeight = 44
        ItemLinks = <
          item
            Item = AddItemButton
            Visible = True
          end
          item
            Item = ModifyItemButton
            Visible = True
          end
          item
            Item = DeleteItemButton
            Visible = True
          end
          item
            Item = CloneButton
            Visible = True
          end>
        Name = 'Main'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    HotImages = IL_OrdAcc
    Images = IL_OrdAcc
    LargeImages = IL_OrdAcc
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 152
    Top = 177
    DockControlHeights = (
      0
      0
      0
      0)
    object AddItemButton: TdxBarLargeButton
      Caption = #1044#1086#1076#1072#1090#1080
      Category = 0
      Enabled = False
      Hint = #1044#1086#1076#1072#1090#1080
      Visible = ivAlways
      ImageIndex = 0
      ShortCut = 45
      OnClick = AddItemButtonClick
      AutoGrayScale = False
      HotImageIndex = 0
    end
    object ModifyItemButton: TdxBarLargeButton
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Category = 0
      Enabled = False
      Hint = #1047#1084#1110#1085#1080#1090#1080
      Visible = ivAlways
      ImageIndex = 1
      ShortCut = 113
      OnClick = ModifyItemButtonClick
      AutoGrayScale = False
      HotImageIndex = 1
    end
    object DeleteItemButton: TdxBarLargeButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Enabled = False
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080
      Visible = ivAlways
      ImageIndex = 2
      ShortCut = 46
      OnClick = DeleteItemButtonClick
      AutoGrayScale = False
      HotImageIndex = 2
    end
    object CloneButton: TdxBarLargeButton
      Caption = #1050#1086#1087#1110#1102#1074#1072#1090#1080
      Category = 0
      Enabled = False
      Hint = #1050#1086#1087#1110#1102#1074#1072#1090#1080
      Visible = ivAlways
      ImageIndex = 8
      OnClick = CloneButtonClick
      AutoGrayScale = False
      HotImageIndex = 8
    end
  end
  object IL_OrdAcc: TImageList
    Height = 24
    ShareImages = True
    Width = 24
    Left = 128
    Top = 216
    Bitmap = {
      494C010109000E00040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000006000000001002000000000000090
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
      00008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59000000000000000000000000000000
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
      000093635B00FFE9CE00FFE1BD00FFDDB500FFD9AC00FFD5A500FFD39D00FFCF
      9700FFCB9100FFC98C00FFC7870080504B000000000000000000000000000000
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
      000093635B00FFEFDC00FFE7CB00FFE3C200FFE0BB00FFDCB200FFD8AB00FFD4
      A100FFD09C00FFCE9500FFCB8F0080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000744640008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      590097665D00FFF4E900FFEED900FFE9D000FFE6C700FFE2BF00FFDDB600FFDA
      AF00FFD7A600FFD39F00FFCF980080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000072444000F6E1BF00F6DEBB00F4DC
      B600F3DAB000F3D7AB00F2D5A700B0AC9C00E9CC9E00F0CF9A00EECC9600EECB
      93009D6A5F00FFFAF200FFF3E500FFF0DE00FFEBD500FFE9CC00FFE5C500FFE0
      BB00FFDDB500FFD8AB00FFD5A50080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000076484100F7E6C700F6E2C400F6E1
      BF00F6DEBB00F3DCB400EFD7B000164987000B4086003F6488008F979300DCC2
      9800A3706000FFFEFC00FFF8F000FFF6E900FFF2E100FFEEDA00FFEAD100FFE7
      CB00FFE3C100FFDEB800FFDAB00080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000076484100F8EAD200F7E6CB00F7E5
      C600F6E2C200F6E0BC00F4DDB8003C658F000445A300085CC7000648A300073E
      8800244575007B9EC500DDE6ED00FEFAF400FFF8EF00FFF4E700FFF0DE00FFEE
      D700FFE9CE00FFE5C600FFE1BD0080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000794B4200FAEED900D5812700D581
      2700D5812700D5812700BF7A2D007764430005459E000A73F2000B74F4000A6D
      E9000658C500043D90002B5E9C00FFFEFC00FFFCF700FFFAF200FFF6EB00FFF3
      E300FFEFDC00FFEBD300FFE7CB0080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007D4E4400FBF0E100FAEEDC00FAEB
      D800F8EAD200F2E6CC004C729800104E9A000F69D1001178ED001079F2000C75
      F4000765E0000948A000799CC100FFFFFF00FFFFFF00FFFEFB00FEFBF600FFF8
      EF00FFF4E700FFF2E100FFEED90080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080524600FCF4E700D5812700D581
      2700C47B2C00525754000A4CA0001880E9001F8EF8002291FA001B84EF001481
      F8000959BF00366AA600D4E0EB00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFC
      F800F7F0EB00E2DAD100E2D8CC007B4D49000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084564900FEF7EF00FCF6EB00FCF4
      E7008BA5BB001054A4001C83EA00299DFE00268FE700176ABF001872CB001C84
      ED000F4E9D0098B2D000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EAE9E600B6B4B000B6B1AB00754945000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008A5A4A00FEFAF400BC4B0000BB4B
      0000404244001574D8002596FC00186BC000184A82004B729C000E478A001468
      BF00375A8300FAFBFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C645800A0675B00A0675B00955C4B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000905F4C00FFFEFB00BC4B0000ED7D
      0300204F7A001E89F3001970C7001F43670083441300FAEEDC00426D9D000741
      8C008E7F7800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A0675B00FEB04A00F0912C00E1842E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000095654E00FFFFFF00BC4B000001A0
      E500095FB700187FEE0025567F009E661900BC4B0000FBF3E500986E3A002E4B
      6500D39F7600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A0675B00E0A66F00DA986300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009A695000FFFFFF00BC4B00000075
      090007588B000F6CD7000375C00000B7FA00BC4B0000FCF6EB00FBF3E700CCD3
      D400DCA37600D1926D00D1926D00D1926D00D1926D00D1926D00D1926D00BD8B
      7A00A0675B00D49A730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A06E5200FFFFFF00BC4B00000081
      0000044B69000A5CC200035A3D00F3D1A000BC4B0000FFFAF200D5812700D581
      2700D5812700D5812700D5812700FAEED90080504B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A6745400FFFFFF00BC4B0000FFD9
      A100758892000649A50037639000FFD9A100BC4B0000FFFBF900FEFAF400FCF8
      F000FCF7EE00FCF4E900FBF3E700FBF0E10080504B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AB785600FFFFFF00BC4B0000BC4B
      0000AA490400183E6900163F7200A1490700BC4B0000FFFEFC00D5812700D581
      2700D5812700D5812700D5812700FBF4E70080504B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B07B5700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00AFC5DC00053A82006E95BF00F8FBFC00FFFFFF00FFFFFE00FFFE
      FB00FFFCF800FEFBF600FFFAF200FEF7EF0080504B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B2805900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFF3F800C5D5E600F3F7FA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFE00FFFEFC00FFFBF900FEFBF60080504B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B7835B00FFFFFF00BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000FFFEFB0080504B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BB875C00FFFFFF00BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000FFFFFF0080504B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BB865B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080504B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BA835800D1926D00D1926D00D192
      6D00D1926D00D1926D00D1926D00D1926D00D1926D00D1926D00D1926D00D192
      6D00D1926D00D1926D00D1926D00D1926D00D1926D0000000000000000000000
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
      0000000000000000000000000000000000000000000000000000DDBAA900D0B5
      AA00CCB0A400DCB7A60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C8B3
      A400694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0BDAF00CCC1BD00BCB6
      B600ADA5A500AF9F9A00D5B2A400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C8B3
      A400EDE5E000B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B6A19200B5A09100B5A09100B6A19200B7A29300B7A29300B7A29300B7A2
      9300B7A29300694731000000000000000000000000000000000092635D008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      590080504B000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0BDAF00DCD1D000D1CFD000C9C6
      C700BFB8BA00ADA5A500AD9D9900D4B4A4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      31003C511C00000000000000000000000000000000000000000000000000C8B3
      A400EFE8E300EDE5E000ECE2DE00EBE0DB00E9DDD700E6D9D300E3D5CF00E0D3
      CC00D6C8C200CDBFB700D0C1B900D8C7BE00D9C7BE00D9C7BE00DAC8BE00DBC9
      BF00B7A29300694731000000000000000000000000000000000093655E00EFD3
      B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB9700EFC79100EEC58900EBC1
      8200EBC08000EBC08000EBC08000EBC08000EBC08000EBC08000EDC18000EABF
      7F0080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E1BFAF00E6DCDA00E2E2E300DCDADD00D0BC
      B500C7B2AB00BFBABB00AFA6A700AC9D9800D5B4A50000000000000000000000
      00000000000000000000000000000000000000000000000000000090000072D2
      8A00006000000060000000600000006000000060000000600000006000000060
      0000006000000060000000600000006000000060000000600000006000000060
      000000600000694731000000000000000000000000000000000000000000C8B3
      A400F2ECE800F0E9E500EEE6E200EDE4DF00E7DDD900DFD4CF00D8CCC700D1C7
      C400A9ABB900999AA500B5A9A200CBBCB400CEBEB600CEBDB400D6C4BB00DAC8
      BE00B7A29300694731000000000000000000000000000000000093655F00EED4
      B800F4DABB00F2D5B100F0D1AA00EFCFA300EECB9D00EDC79600EDC58F00EBC1
      8800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      00000000000000000000E2C1B100EDE5E200EEEFF300E9E9EB00D0917400C052
      2300C0522300C2816400BFB8BA00AFA7A900AD9D9900D3B1A300000000000000
      000000000000000000000000000000000000000000000000000000900000FFFF
      FF0041C15E003CBE580037BB500032B84A002EB543002AB23D0025AF360020AC
      2F001BA9270016A6200011A219000CA01200089D0C0003990500009800000098
      000000600000694731000000000000000000000000000000000000000000C8B3
      A400F4EEEC00F2ECE800F0E9E500EDE5E100E2DAD600B7B8C300B5ADAA009FA2
      B2004581E2004E80D200958F9000AAA19F00A19EA400B7A9A100CDBCB300D9C7
      BE00B7A29300694731000000000000000000000000000000000093655F00EED7
      C000F6E0C100F2D9B800F2D4B100F0D1AA00EFCFA400EECB9D00EDC79600EDC5
      8F00EBC18900EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      000000000000E2C0B000F2EBE900F4F8FB00F3F7FB00D3906F00BA400F00BA41
      1100BB411200BB411100C1795800C0BABA00AFA7A900A99A9700D3B1A3000000
      000000000000000000000000000000000000000000000000000000900000FFFF
      FF0045C4640041C15E002FAB45001B8D270032B84A002EB5430021A131000B77
      0F000F8517001BA9270016A6200011A219000CA01200089D0C00029904000098
      000000600000694731000000000000000000000000000000000000000000C8B3
      A400F6F1EF00F4EEEC00F2ECE800EFE8E400AFBEDD004A86E300718CBB006C87
      B6003D7EE800437FDF007385A8005E82C0004A81D9009C9CA700CEBEB600D9C7
      BE00B7A29300694731000000000000000000000000000000000093655F00EFDA
      C500F7E2C700F3DCBF00F2D8B700F2D4B000F0D1AA00EFCEA300EECB9C00EDC7
      9500EDC58F00EBC18900E9BD8100E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      0000E1BDAD00F4EDE900FBFEFF00F8FEFF00D99F8200C2562700D9906D00DD9C
      7B00DD9C7B00D9906D00C4542400C1765300BFBABB00AFA7A900A99A9700D3B1
      A30000000000000000000000000000000000000000000000000000900000FFFF
      FF004CC86E0046C56600FFFFFF00056807001B8D280029A63C00FFFFFF00FFFF
      FF0003670500108517001BA9280017A6210012A31A000DA01300089D0C000399
      050000600000694731000000000000000000000000000000000000000000C8B3
      A400F8F4F200F6F1EF00F4EEEC00EFE9E500CDD1DC005D8EDF003B7EE9003F7E
      E6004E84DD005087DF004180E6003C7FEA005E82C000ABA3A200CFC0B800D8C7
      BE00B6A19200694731000000000000000000000000000000000093656000F0DE
      CC00F8E6CF00811E0000811E0000811E0000811E0000811E0000811E0000EECB
      9C00EDC79600EDC59000EBC18900E9BF8200E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B00000000000000000000000000000000000000000000000000E1BD
      AD00F6EDE900FEFFFF00FEFFFF00DEA68B00BC491900BC491900DD9D7E00FFFF
      FF00FFFFFF00DA977600BD4A1A00BF491800C27B5B00BFB8BA00B0A9AA00AB9C
      9800D3B1A300000000000000000000000000000000000000000000900000FFFF
      FF0051CB75004CC86E00FFFFFF00FFFFFF0005680700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0003670500108518001CAA290017A7220012A31B000DA01300089D
      0C0000600000694731000000000000000000000000000000000000000000C8B3
      A400FAF6F600F8F4F200F4EFED00E9E4E200D4CECB007194CF003F7FE6007E96
      C000C7C3C500D5CED00083A1D8003D7FE8007587AB00A1979200BBAFA700CDBF
      B600B49F9100694731000000000000000000000000000000000095666000F2E2
      D300FAEAD700811E0000FEFEFE00CCD4F2002346FC00566FDD00811E0000EFCE
      A300EECB9D00EDC79700EDC59000EBC18900E9BD8100E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000E1BFAF00F8F0
      EE00FFFFFF00FFFFFF00E0A58800BD4A1A00BD4B1C00BC471600D17F5600FFFF
      FF00FFFFFF00CF784F00BC471800BF4E1E00BF4A1800C1755200C0B7B700B0A9
      AA00A99A9700CEAFA1000000000000000000000000000000000000900000FFFF
      FF0055CE7B0051CB7500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0003670500118619001DAB2B0019A7240014A41C000EA1
      150000600000694731000000000000000000000000000000000000000000C8B3
      A400FCF9F900FAF6F600F5F1EF00BBC8E0008AA3CE004983DE005A85CC00B4AF
      AD00DDD5D000E9DFDA00D2CDD2004F87E0004D81D5006E84AC008D95AA00C2B5
      AD00B19D8E00694731000000000000000000000000000000000098696300F2E6
      DA00FAEEDE00811E0000BAC6FA00183EFF005B78FE001032F400751C0100F0D1
      A900EFCEA300EECB9D00EDC79600EDC58F00EBC18900E9BD8100EABF7F00E7BC
      7E0080504B0000000000000000000000000000000000E1BCAC00F8EFEB00FFFF
      FF00FFFFFF00E7B79D00C5592600C4542400C0512200BC471600D3815900FFFF
      FF00FFFFFF00D07A5200BC471800BF4E1F00BF4E1E00BF491800C1724E00BDB5
      B500AFA7A900A6999700CEAFA10000000000000000000000000000900000FFFF
      FF0057CF7F0055CE7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00056807001C8E
      290034B94D00FFFFFF00FFFFFF000B77100022AD32001DAB2B0018A7230014A4
      1C0000600000694731000000000000000000000000000000000000000000C8B3
      A400FDFCFC00FCF9F900F8F4F40084AAE8004282E9003B7EEA006089CB00ACA7
      A400CFC8C500E0D7D300CEC8CA005086DE003B7EE9003F7EE5006F92CF00CFC2
      BB00B39F900069473100000000000000000000000000000000009E6E6400F4EA
      E100FBF2E600811E0000D8E0FE00BBC7FE00FEFEFE006480F7001E185E00F2D5
      B000F0D1AA00EFCEA400EDCB9C00EDC79600EBC58F00EBC18800EABF8200E7BB
      7E0080504B00000000000000000000000000E0BAA900F4E9E200FFFFFF00FFFF
      FF00EECAB000CF703A00CB683300C9643000C65C2A00C04D1C00D4825A00FFFF
      FF00FFFFFF00D07A5200BC471800BF4E1F00BF4E1F00BF4E1E00BF471700C178
      5700BFB8BA00AFA6A500AA9A9700D8B5A500000000000000000000900000FFFF
      FF0058D0800057CF7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000568
      07001C8D290034B94D00FFFFFF001A92260013881C0022AD32001DAA2A0018A7
      230000600000694731000000000000000000000000000000000000000000C8B3
      A400FFFFFF00FDFCFC00FCF9F900E2E6F200C7D2E5006795DE004D84DC008692
      A800B0ABA800BEB9B50095A3BD004380E4006085C3009DA1B100C1BEC500DFD1
      CB00B6A192006947310000000000000000000000000000000000A3726600F6EE
      E900FCF6ED00811E0000FEFEFE00FEFEFE00FEFEFE00F6F6F8000E1A9A006073
      DA00F0D5B000F0D1AA00EFCEA300EECA9C00EDC79500EBC48E00EBC28800E7BC
      800080504B00000000000000000000000000E7CABC00FFFFFF00FFFFFF00FEFB
      F800DC935D00D47A4100D1774000CF703A00CC693500C5592600D78A6300FFFF
      FF00FFFFFF00D07A5200BC471800BF4E1F00BF4E1F00BF4E1F00BF4C1D00C050
      2100C6B0A700BFBABB00AFA6A500CBAFA400000000000000000000900000FFFF
      FF0058D0800058D08000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0031AC480039BC530034B94D00FFFFFF0023A3330027B1390021AD31001DAA
      2A0000600000694731000000000000000000000000000000000000000000C8B3
      A400FFFFFF00FFFFFF00FEFDFE00FBF9F900E3E4E9006D98DE003A7EEA004983
      DF007490BD00708BBA004883DE003C7FEA006F8CBE00B4ADAA00D8CDC700E4D7
      D200B7A293006947310000000000000000000000000000000000A7756800F8F3
      F000FEFBF600811E0000811E0000811E0000811E0000811E0000741D04002948
      EE002F4BE6009695C600F0D1A900EFCEA300EDCB9C00EDC79500EDC58F00E9BF
      870080504B00000000000000000000000000E7C9BC00FFFFFF00FFFFFF00FEFB
      F800E2A06900DA894B00D8844A00D47D4400D1763F00CB673000DA926A00FFFF
      FF00FFFFFF00D17D5400BC471800BF4E1F00BF4E1F00BF4E1F00BD4A1A00C056
      2800D1C0BB00C9C6C700BDB6B600D3B5A900000000000000000000900000FFFF
      FF0058D0800058D0800058D0800046B966002A963D0052CC77004EC971003BB1
      5500137C1C00127B1A00117B18000F7A16000E7914001689200028B13A0022AD
      320000600000694731000000000000000000000000000000000000000000C8B3
      A400FFFFFF00FFFFFF00FFFFFF00FDFCFD00B4CAF0003F81E9006D98DE006795
      DE003B7EEA003E7FE700678DCB005B8DDD004985E500B1B6C600DFD5D000E7DB
      D500B7A293006947310000000000000000000000000000000000AC796900FAF6
      F400FFFFFE00FEF8F300FBF2EA00F8EEE300F8EBDA00F7E6D300F7E2CC00EFDC
      C6006877DA005367DC00F2D4B000F0D1AA00EFCEA300EECB9C00EEC99600EAC1
      8E0080504B00000000000000000000000000E0BAA900F6E9E300FFFFFF00FFFF
      FF00F4DCC200E19A5C00DD8F5200DA894F00D7824800D0723900E1A37B00FFFF
      FF00FFFFFF00D5875E00C04F1D00C0501F00BF4E1F00BD4B1C00BD4A1A00D4A0
      8800DCDDE000D1CFD000CFC0BC00E0BAA900000000000000000000900000FFFF
      FF0058D0800058D0800058D08000FFFFFF0034A24C002A963D0052CC7700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000E7915002DB5420029B1
      3B0000600000694731000000000000000000000000000000000000000000C8B3
      A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F5FB00B4CAF000E4E5EA00C7D1
      E5004181E8005087E000BDBCC000C8CCD800AFC0DE00E1DAD600E8DEDB00EBE0
      DB00B7A293006947310000000000000000000000000000000000B17E6B00FAF6
      F400FFFFFF00FFFEFB00FEF7F000FBF3EA00FAEFE300F8EADA00F7E7D300F6E2
      CB00F6E0C500F3DCBF00F2D8B600F2D4B000F0D1A900EFCEA100EECB9C00EBC5
      920080504B0000000000000000000000000000000000E1BCAC00F8EFEA00FFFF
      FF00FFFFFF00F4DCC000E29E5F00DE955600DA8E5100DC8E5600EEC6A900F4DE
      CE00F4DDCC00D7865800C75C2800C55A2800C0501F00BD4B1C00D89F8400E9ED
      F000E2E2E300DCCFCB00E0BBAB0000000000000000000000000000900000FFFF
      FF0058D0800058D0800058D0800058D08000FFFFFF0007690B002A963D0052CC
      7700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00107A170032B749002DB5
      430000600000694731000000000000000000000000000000000000000000C8B3
      A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFCFD00FBF9F900E3E8
      F30084AAE9008CADE300DFDCDD00EEE8E500F0E9E600EDE6E100ECE4DF00ECE2
      DE00B7A293006947310000000000000000000000000000000000B6816C00FAF6
      F400FFFFFF00811E0000811E0000811E0000811E0000811E0000811E0000F7E6
      D300F6E3CC00F6DEC500F3DCBD00F3D8B600F2D4AF00F0D1A900F0CFA300EDC9
      990080504B000000000000000000000000000000000000000000E1BCAC00F6EB
      E500FFFFFF00FFFFFF00F7E2CA00E6A66700E19A5A00E0985C00DD905500D988
      4E00D5804700D0743C00CE6E3800CA653000C65C2800E0AF9700F2F7FB00EDEF
      F200E5D9D500E0BBAB000000000000000000000000000000000000900000FFFF
      FF0058D0800058D0800058D0800058D08000FFFFFF00FFFFFF0007690B001980
      2400177F2200FFFFFF00FFFFFF00FFFFFF00FFFFFF00117B190036BA500032B7
      490000600000694731000000000000000000000000000000000000000000C8B3
      A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFDFE00FDFB
      FB00F9F6F500F5F1F000F4EFEE00F4EFEC00F3EDEA00F1EAE700EFE8E300EDE5
      E000B7A293006947310000000000000000000000000000000000BB846E00FAF6
      F400FFFFFF00811E0000FEFEFE00CCD4F2002346FC00566FDD00811E0000F8EA
      DA00F7E6D300F6E2CB00F6DEC400F3DABC00F2D8B600F0D4AF00EFD0A700CEB4
      910080504B00000000000000000000000000000000000000000000000000E0BB
      AB00F4E9E200FFFFFF00FFFFFF00F8E5CE00E9AC6D00E29D5B00E3A56D00F7E3
      D300F6DECE00DA8C5700D1763D00CF6F3700E7B79D00F8FEFF00F4F8FB00EDE2
      DE00E0BCAC00000000000000000000000000000000000000000000900000FFFF
      FF0058D0800058D0800058D0800058D0800058D08000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00127B1B003BBD560036BA
      500000600000694731000000000000000000000000000000000000000000C8B3
      A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFD
      FE00FDFBFB00FBF8F700F9F5F400F7F2F100F5F0ED00D5BFB100CAB5A600B7A2
      9300B7A293006947310000000000000000000000000000000000C0896F00FBF7
      F400FFFFFF00811E0000BAC6FA00183EFF005B78FE001032F400751C0100FAEE
      E200F8EBDA00F7E6D300F6E2CB00F6DEC400F3DCBD00E5CEAF00C4B09600A192
      7F0080504B000000000000000000000000000000000000000000000000000000
      0000E0BBAB00F4E9E300FFFFFF00FFFFFF00FAE9D300E9AB6700EFC99E00FFFF
      FF00FFFFFF00E7B28700D57D3F00E9BB9C00FEFFFF00FBFEFF00F0E9E600E1BF
      AF0000000000000000000000000000000000000000000000000000900000FFFF
      FF0058D0800058D0800058D0800058D0800058D0800058D08000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0041B65F00FFFFFF00FFFFFF00147C1D003FC05C003BBD
      560000600000694731000000000000000000000000000000000000000000C8B3
      A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFDFE00FDFBFB00FBF8F700FAF6F600C8B3A40069473100694731006947
      3100694731006947310000000000000000000000000000000000C58C7000FBF7
      F400FFFFFF00811E0000D8E0FE00BBC7FE00FEFEFE006480F7001E185E00FBF3
      EA00F8EEE200F8EAD900F8E7D400FAE9D000E0D0BA00B8AB9A00A79C8B00A497
      860080504B000000000000000000000000000000000000000000000000000000
      000000000000E1BCAC00F4E7E100FFFFFF00FFFFFF00F8E6CE00EFC08600F7E0
      C200F6DABD00E3A06500EEC7A500FFFFFF00FEFFFF00F6EDE900E2C0B0000000
      000000000000000000000000000000000000000000000000000000900000FFFF
      FF0058D0800058D0800058D0800058D0800058D0800058D0800058D08000FFFF
      FF00FFFFFF0046B9660057CF7E0054CE7A00FFFFFF003DB3570046C4660040C1
      5D0000600000694731000000000000000000000000000000000000000000C8B3
      A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFCFC00FCF9F900C8B3A400F3EBE600EFE6E000E8DC
      D400DBC9BF006947310000000000000000000000000000000000CB917300FBF7
      F400FFFFFF00811E0000FEFEFE00FEFEFE00FEFEFE00F6F6F8000E1A9A006580
      F800FBF2E900FBF2E500E9D3C400A0675B00A0675B00A0675B00A0675B00A067
      5B00A0675B000000000000000000000000000000000000000000000000000000
      00000000000000000000E0BAA900F3E5DE00FFFFFF00FFFFFF00FBEDD700F0C4
      8A00EBB77A00F4D8B800FFFFFF00FFFFFF00F7EEEA00E1BFAF00000000000000
      000000000000000000000000000000000000000000000000000000900000FFFF
      FF0058D0800058D0800058D0800058D0800058D0800058D0800058D0800058D0
      800058D0800058D0800058D0800057CF7E0054CE7A0050CB74004BC86C0047C5
      660000600000694731000000000000000000000000000000000000000000C8B3
      A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFCFC00C8B3A400EFE6E000E8DCD400DBC9
      BF00694731000000000000000000000000000000000000000000CF967400FBF7
      F600FFFFFF00811E0000811E0000811E0000811E0000811E0000741D04002B4E
      FE003252F7009EACF200DAC0B600A0675B00DAA16B00DD984F00E2903A00EA89
      2300A5686B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E0BAA900F3E5DE00FFFFFF00FFFFFF00FFFE
      FC00FEFBF800FFFFFF00FFFFFF00FAF3F000E2C0B00000000000000000000000
      000000000000000000000000000000000000000000000000000000900000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0076D48F00694731000000000000000000000000000000000000000000C8B3
      A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400E8DCD400DBC9BF006947
      3100000000000000000000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8FA
      FF006C86FB005875F800DDC4BC00A0675B00EAB47400EFA95200F6A03600A568
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0BAA900F4E7E100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FAF3F000E3C2B4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000090
      0000009000000090000000900000009000000090000000900000009000000090
      0000009000000090000000900000009000000090000000900000009000000090
      000000900000000000000000000000000000000000000000000000000000C8B3
      A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400DBC9BF00694731000000
      0000000000000000000000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DDC7C200A0675B00EAB27300EFA75100A5686B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0BAA900F2E0D700FEFC
      FC00FFFEFE00F7EEEA00E3C2B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C8B3
      A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3
      A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A40069473100000000000000
      0000000000000000000000000000000000000000000000000000D4987500FFFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E2D0CE00A0675B00EDB57200A5686B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E1BCAB00E6C5
      B700E7C9BC00E1BCAB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800A0675B00A5686B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFD6B500F7DEB500F7D6AD00F7D6A500F7CE9C00EFCE9400EFC69400EFC6
      8C00EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFC6
      8400EFBD7B009C6B6300000000000000000093655F00A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A46769000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B700000000000000000000000000A87D7800A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400986B66000000000000000000000000000000000000000000000000009463
      5A00EFD6BD00F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC69400EFC6
      8C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093655F00EED4B800F2DABC00F2D5
      B100EDCEA700E6C79D00E1C09300DEBB8C00E1BB8800E5BC8400E7BC8100E7BC
      7E00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC7E009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000005B7000005B7000005B700000000000000000000000000A97F7900F3DD
      C400F8E3C600F6DFBF00F5DCB800F4D9B200F3D7AC00F3D4A700F2D2A000F0CF
      9A00F0CE9800F0CE9800F0CE9800F0CE9800F0CE9800F0CE9800F1CF9800EFCD
      9700986B66000000000000000000000000000000000000000000000000009463
      5A00EFD6C600F7E7C600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC6
      9400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093655F00ECD5C200F4DEC000F0D8
      B700E9CCAB00D9BD9900C9AD8900C1A57F00C6A67E00D1AF7F00DAB47F00E1B7
      7D00E3BA7D00E7BC7E00E9BD7F00E9BD7F00EABF7F00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000005
      B7000005B7000005B70000000000000000000000000000000000A97F7A00F2DE
      C800F7E3CA00F5DFC200F4DCBC00F3DAB600F2D7B100F1D4AB00F1D2A500F0CF
      9F00EFCD9A00EECC9700EECC9700EECC9700EECC9700EECC9700EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000000000009463
      5A00EFDEC600F7E7C600F7DEBD00F7DEB500F7D6B500F7D6AD00EFCEA500EFCE
      9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093655F00EFDAC500F6E1C600F2DA
      BC00E6CEAF00222123003E3935008C7960009D876700AA8F6B00B89A6F00C7A4
      7400D1AB7500DEB57900E5BB7D00E7BC7E00EABF7F00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000005B70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000005B7000000000000000000000000000000000000000000A97F7A00F2E0
      CE00F8E7CF00F5E2C800F5DEC200F4DCBC00F3DAB700F2D7B100F1D4AB00F1D2
      A500F0CFA000EFCD9A00EECC9700EECC9700EECC9700EECC9700EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000000000009463
      6300F7DECE00FFE7CE00F7E7C600F7DEBD00F7DEB500F7D6B500EFCEA500DEBD
      9400D6B58C00D6B58400DEB58400E7BD8400EFBD8400EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093656000F0DECB00F7E5CE00F4DE
      C500EAD4B6003C3835001F1F2100182A330034434400836F56008E7759009E83
      5F00B2926800C7A36F00D9B17600E3BA7D00E7BC7E00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000005B7000005
      B700000000000000000000000000000000000000000000000000A97F7A00F3E3
      D200F9E9D400F6E4CD0099330000993300009933000099330000993300009933
      00009933000099330000993300009933000099330000EECC9700EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000000000009463
      6300F7E7D600FFEFD600F7E7CE00F7DEC600F7DEBD00F7DEBD00DEC6A500BDA5
      8400AD947300A58C6B00BD9C7300DEB58400EFC68C00EFBD8400EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000095666000F2E2D300FAEAD700F6E3
      CE00F0DAC200AC9D8A00113B4E0004689A00064F75000C3C52003A4948007764
      4C0089725300A4865F00BC996900D1AB7300E1B77900E3BA7B009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000005
      B7000005B7000005B7000005B7000005B7000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000A97F7B00F4E6
      D800FAECDA00F8E7D30099330000FEFEFE00FEFEFE00FEFEFE00FEFEFE00DFE5
      FE00325BFC00EEF1FE00FEFEFE00FEFEFE0099330000EECC9700EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000000000009C6B
      6300F7E7DE00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEBD00004A0000004A
      0000004A0000004A0000A58C6B00D6B58400EFC68C00EFC68C00EFBD8400EFBD
      7B00E7BD7B009C6B6300000000000000000098696300F2E6DA00FAEEDE00F7E7
      D400F4E1CA00EBD8BD001A3E4D00036A9D00056798001B506E002A3440004135
      38006A5542007E694C00987D5800B2916300CCA66E00DAB177009D6D5F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000006F6000005B7000005B7000005B7000005B70000000000000000000000
      000000000000000000000005B7000005B7000005B7000005B700000000000000
      0000000000000000000000000000000000000000000000000000AA807B00F5E9
      DD00FBEFE000F8EAD90099330000FEFEFE00FEFEFE00FEFEFE00AFBFFD001342
      FB000335FB00A0B2FD00FEFEFE00FEFEFE0099330000EECC9700EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000000000009C6B
      6300F7EFE700FFF7E700FFEFDE00F7E7CE00E7D6BD00DECEB500004A00000894
      100000940800004A0000A58C6B00C6AD8400D6B58400DEB58400E7BD8400EFBD
      8400E7BD7B009C6B630000000000000000009E6E6400F4EAE100FBF2E600F8EB
      DC00F7E6D300F3E0CA0074868600045983003150650095606000AA6E6E00965D
      5D00643B3A0065524000766347008E745100A9895D00C09C690096695A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000005B7000005B700000000000000
      00000005B7000005B7000005B7000005B7000005B70000000000000000000000
      0000000000000000000000000000000000000000000000000000AD837D00F5EC
      E300FBF2E600F9EDDE0099330000FEFEFE00FEFEFE00718DFC000335FB000335
      FB000335FB00224EFB00FEFEFE00FEFEFE0099330000EECC9900EFCD9700EDCB
      9600986B6600000000000000000000000000000000000000000000000000A573
      6300F7EFEF00FFF7EF00FFEFE700E7DECE00C6B5A500AD9C8C00004A0000089C
      1800089C1000004A000094846B00A58C6B00A58C6B00BD9C7300DEB58400EFC6
      8C00E7BD84009C6B63000000000000000000A3726600F6EEE900FCF6ED00F8EE
      E300F7EADA00F7E6D300F0DECB000B4159008C5B5B00CC8E8E00BB7E7E00AA6E
      6E00965D5D00643B3A0064513E006F5D4300826C4B009A7E5500865D51000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000005B7000005B7000005
      B7000005B7000005B7000005B7000005B7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B2887E00F7EF
      E800FCF5EC00FAEFE40099330000EEF1FE00325BFC000335FB000335FB00718D
      FC001342FB000335FB00AFBFFD00FEFEFE0099330000F0CF9F00EFCD9A00EDCA
      9600986B6600000000000000000000000000000000000000000000000000A573
      6B00FFF7F700FFFFF700FFF7EF00004A0000004A0000004A0000004A000010A5
      210008A51800004A0000004A0000004A0000004A0000A58C6B00D6B58400EFC6
      8C00EFBD84009C6B63000000000000000000A7756800F8F3F000FEFBF600FBF3
      EA00F8EEE300F8EBDC00F6E6D1004E6C76009C696900DC9D9D00CB8C8C00BA7D
      7D00A96D6D00915959005A35350062503D006A5841007B664800735046000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000006F6000005
      B7000006F6000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B68B8000F8F2
      EE00FDF8F100FAF3EA0099330000224EFB000335FB001342FB00AFBFFD00FEFE
      FE008099FC000335FB00224EFB00FEFEFE0099330000F0D1A400F0D09F00EDCB
      9800986B6600000000000000000000000000000000000000000000000000AD7B
      6B00FFF7F700FFFFFF00FFFFF700004A000021C6420021C6420018BD390018B5
      310010AD290010A5210008A51800089C1000004A0000AD947300D6B58C00EFCE
      9400EFC68C00A57363000000000000000000AC796900FAF6F400FFFFFE00FDF8
      F300FBF2E900F8EEE300F8EBDA00F4E3D0007B504F00E2A4A400DC9D9D00CB8C
      8C00BA7D7D00A96D6D008C5757005A353500604F3D006C59410062443C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000006F6000005B70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BA8E8200FAF6
      F400FEFCF800FCF6F00099330000A0B2FD00325BFC00CFD8FD00FEFEFE00FEFE
      FE00EEF1FE001342FB000335FB008099FC0099330000F1D4AA00F1D2A500EECD
      9E00986B6600000000000000000000000000000000000000000000000000B57B
      6B00FFF7F700FFFFFF00FFFFFF00004A000029D6520029CE4A0021C6420018BD
      390018B5310010B5290010AD210010A52100004A0000BDA58400DEBD9400EFCE
      9C00EFC69400A57363000000000000000000B17E6B00FAF6F400FFFFFF00FFFE
      FB00FEF7F000FBF3EA00FAEEE300F8EAD900E1CCBB007B504F00E2A3A300DC9D
      9D00CA8B8B00B87B7B00A76C6C008B5656005A35350066523F00583F37000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000006F6000005
      B7000005B7000006F6000006F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BE928300FBF8
      F700FFFFFE00FEFAF60099330000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00A0B2FD000335FB000335FB007D332F00F2D7B000F2D5AB00EFCF
      A400986B6600000000000000000000000000000000000000000000000000B584
      6B00FFF7F700FFFFFF00FFFFFF00004A0000004A0000004A0000004A000021CE
      4A0021C64200004A0000004A0000004A0000004A0000E7C6A500EFCEA500F7CE
      A500EFCE9C009C7363000000000000000000B6816C00FAF6F400FFFFFF00FFFF
      FF00FFFCFB00FEF7F200FBF3EA00F8EEE300F8EBDC00E1CCBB0073484700E1A3
      A300DA9C9C00C98B8B00B87B7B00A76C6C008B5656005D383600533C35000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000006F6000005B7000006
      F6000006F6000006F6000005B7000006F6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2968500FBF8
      F700FFFFFF00FFFEFC0099330000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE005274FC000335FB000C35EB00E4CFB900F2D7B000F0D2
      A800986B6600000000000000000000000000000000000000000000000000BD84
      6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700004A000029D6
      5A0029CE5200004A0000AD9C8C00DECEB500F7DEBD00F7DEB500F7D6AD00EFD6
      A500CEB594008C6B63000000000000000000BB846E00FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFEFB00FEF7F200FBF3EA00FAEEE300F8EAD900BBA196007348
      4700E1A1A100DA9A9A00C98B8B00B77A7A00A66B6B008B5555005A3535000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000006F6000006F6000006F6000005B7000006F6000000
      0000000000000006F6000006F6000006F6000006F60000000000000000000000
      0000000000000000000000000000000000000000000000000000C6998600FBF8
      F700FFFFFF00FFFFFF0099330000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00EEF1FE00325BFC000335FB003054EF00F4DAB600F1D5
      AE00986B6600000000000000000000000000000000000000000000000000C68C
      6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004A000031DE
      630031DE5A00004A0000C6B5A500E7D6BD00F7DEC600F7DEBD00E7CEAD00C6B5
      9400A5947B00846363000000000000000000C0896F00FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2E900FAEEE300F8EBDA00BBA1
      960073484700E1A1A100D99A9A00C78A8A00B77A7A00A66B6B008B5555005A35
      3500000000000000000000000000000000000000000000000000000000000000
      0000000000000006F6000006F6000005B7000006F6000006F600000000000000
      000000000000000000000006F6000006F6000006F6000006F600000000000000
      0000000000000000000000000000000000000000000000000000CA9C8800FBF8
      F700FFFFFF00FFFFFF0099330000993300009933000099330000993300009933
      00009933000099330000993300007D332F000C35EB000335FB000335FB00D9C4
      A700986B6600000000000000000000000000000000000000000000000000C68C
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004A0000004A
      0000004A0000004A0000E7DECE00F7E7CE00FFEFD600E7D6BD00BDAD9C00A59C
      8C00A5948400846B63000000000000000000C58C7000FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FDF8F300FBF3EA00F8EEE300F8EA
      D900BCA1960091606000EBAAAA00D9999900C78A8A00B6797900804E4E004148
      5500354756000000000000000000000000000000000000000000000000000000
      00000006F6000006F6000006F6000006F6000006F60000000000000000000000
      0000000000000000000000000000000000000006F6000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000CEA08900FCF9
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FEF9F500FCF5EF00FBF2
      E900FAF0E300F9ECDD00F8E9D700F8E6D100F6E4CC000335FB000335FB000335
      FB000335FB00000000000000000000000000000000000000000000000000CE94
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7E700EFD6C6009C635A009C635A0094635A009463
      5A0094635A009C6B5A000000000000000000CB917300FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7F000FBF2E900FBF2
      E600ECD5C20084544C0091606000EBAAAA00D9999900534E5700028AC40000AA
      EA0000A6E6000087C40000000000000000000000000000000000000000000006
      F6000006F6000006F6000006F6000006F6000000000000000000000000000000
      000000000000000000000000000000000000000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000D2A38A00FCF9
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFDFC00FDFAF500FCF6
      EF00FAF2E900FAEFE200FAEDDE00FBEEDB00E7DBC900C8BDAF000335FB000335
      FB000335FB000335FB000335FB0000000000000000000000000000000000CE94
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFFFEF00DEC6B5009C635A00DEA56B00DE9C4A00E794
      3900EF8C2100A56B6B000000000000000000CF967400FBF7F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FCF7F000FFFA
      EF00DAC0B6009F675B00AA78560091606000C2898900097BAB0000BDFF0000BD
      FF0000A6E600001C9D00000082000000000000000000000000000006F6000006
      F6000006F6000006F6000006F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000006
      F600000000000000000000000000000000000000000000000000D7A78C00FCF9
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FDF9
      F400FCF5EE00FCF5EB00EEDDD100B4817600B4817600B4817600B4817600B481
      76000335FB000335FB000335FB0000000000000000000000000000000000D69C
      7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700DEC6BD009C635A00EFB57300EFAD5200F7A5
      3100A56B6B00000000000000000000000000D4987500FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FFFE
      F700DDC4BC009F675B00EAB47400B77D460073474700009FDE0000BDFF00008C
      D100001C9D00010D9D00010A970000008200000000000006F6000006F6000006
      F6000006F6000006F60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DAAB8D00FCF9
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFD
      FB00FDF9F400FFFBF300E3CEC600B4817600E3B58500E5AD6A00E9A65400EFA0
      3900B8828500000000000000000000000000000000000000000000000000D69C
      7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEC6C6009C635A00EFB57300EFA55200A56B
      6B0000000000000000000000000000000000D4987500FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DDC7C2009F675B00EAB27300EFA751007A494A000093D10000B1F200012B
      A7000725DC000420B800021DB100010A9700000000000006F6000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEAD8E00FDFA
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFDFC00FFFEF900E5D1CB00B4817600EFC48D00F3BB6D00F8B45000B882
      850000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6CE009C635A00EFB57300A56B6B000000
      000000000000000000000000000000000000D4987500FFFFFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E2D0CE009F675B00EDB57200A5686B0000000000000000000084C1000C21
      BF002D4FF6000F2ECC00031EB10000058F00000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEAD8E00FDFA
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E5D4D000B4817600EFC38C00F3BA6C00B88285000000
      000000000000000000000000000000000000000000000000000000000000D694
      7300E7C6AD00E7C6B500E7C6B500E7C6B500E7C6B500E7C6AD00DEBDAD00DEBD
      AD00DEBDAD00D6B5AD00D6B5AD00C69C94009C635A00A56B6B00000000000000
      000000000000000000000000000000000000CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E68009F675B00A5686B00000000000000000000000000000000001624
      BF005270FC001839E30001099700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEAD8E00FFFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E9DBD900B4817600F1C58B00B8828500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001322BD00050DA50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DAA48200DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA4
      8200DAA48200DAA48200DAA48200B4817600B882850000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000600000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFF000000000000000000000FFF00000
      0000000000000000FFF000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000010000000000000000000000030000000000
      0000000000007F00000000000000000000007F00000000000000000000007F00
      000000000000000000007F00000000000000000000007F000000000000000000
      00007F00000000000000000000007F00000000000000000000007F0000000000
      0000000000007F000000000000000000FFC3FFFFFFFFE00003FFFFFFFF81FFFF
      FFFFE00003C00007FF00FFE00007E00003C00007FE007FC00003E00003C00007
      FC003FC00003E00003C00007F8001FC00003E00003C00007F0000FC00003E000
      03C00007E00007C00003E00003C00007C00003C00003E00003C00007800001C0
      0003E00003C00007000000C00003E00003C00007000000C00003E00003C00007
      000000C00003E00003C00007000000C00003E00003C00007800001C00003E000
      03C00007C00003C00003E00003C00007E00007C00003E00003C00007F0000FC0
      0003E00003C00007F8001FC00003E00003C00007FC003FC00003E00007C00007
      FE007FC00003E0000FC0000FFF00FFE00007E0001FC0001FFF81FFFFFFFFE000
      3FC0003FFFC3FFFFFFFFFFFFFFC0007FE00003FFFFFFFFFFFFFFFFFFE0000300
      001FFFFFF9C00007E0000300001FFFFFF1C00007E0000300001FC7FFE3C00007
      E0000300001FC3FF87C00007E0000300001FC1FF0FC00007E0000300001FE0FE
      1FC00007E0000300001FF07C3FC00007E0000300001FFC307FC00007E0000300
      001FFE00FFC00007E0000300001FFF01FFC00007E0000300001FFF83FFC00007
      E0000300001FFF01FFC00007E0000300001FFE00FFC00007E0000300001FFC18
      7FC00007E0000300000FF83C3FC00007E00003000007F07F1FC00007E0000300
      0003E0FF8FC00001E00003000001C1FFEFC00001E0000700000083FFFFC00007
      E0000F00000087FFFFC0000FE0001F0000C08FFFFFC0001FE0003F0001E1FFFF
      FFC0003FFFFFFFFFFFF3FFFFFFC0007F00000000000000000000000000000000
      000000000000}
  end
  object StoredProc: TpFIBStoredProc
    Database = LocalDatabase
    Transaction = LocalWriteTransaction
    Left = 520
    Top = 160
  end
  object SelSet: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    DataSource = FactDataSource
    AfterOpen = PlanQueryAfterOpen
    Left = 552
    Top = 160
    poSQLINT64ToBCD = True
  end
end
