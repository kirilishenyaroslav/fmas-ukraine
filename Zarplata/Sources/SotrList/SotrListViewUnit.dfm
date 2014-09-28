object SotrListViewForm: TSotrListViewForm
  Left = 23
  Top = 82
  Width = 1032
  Height = 742
  Caption = 'SotrListViewForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DockControl: TdxBarDockControl
    Left = 0
    Top = 55
    Width = 1024
    Height = 3
    Align = dalTop
    AllowDocking = False
  end
  object Panel: TPanel
    Left = 345
    Top = 58
    Width = 679
    Height = 649
    Align = alClient
    TabOrder = 2
    object MovingPanel: TPanel
      Left = 1
      Top = 1
      Width = 677
      Height = 387
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object ManMovingGridHeader: TLabel
        Left = 0
        Top = 0
        Width = 677
        Height = 16
        Align = alTop
        Caption = 'ManMovingGridHeader'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SotrDetailsGrid: TcxGrid
        Left = 0
        Top = 16
        Width = 677
        Height = 313
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object SotrDetailsGridDBTableView: TcxGridDBTableView
          DataController.DataModeController.SmartRefresh = True
          DataController.DataSource = ManMovingDataSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          Filtering.CustomizeDialog = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsSelection.CellSelect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = GridTableViewStyleSheetDevExpress
          object PeriodBegColumn: TcxGridDBColumn
            MinWidth = 30
            Width = 78
          end
          object PeriodEndColumn: TcxGridDBColumn
            MinWidth = 30
            Width = 72
          end
          object PostNameColumn: TcxGridDBColumn
            MinWidth = 200
            Width = 371
          end
          object PaymentColumn: TcxGridDBColumn
            MinWidth = 35
            Options.Filtering = False
            Width = 63
          end
          object RMovingColumn: TcxGridDBColumn
            Caption = '---'
            Visible = False
            OnGetDisplayText = RMovingColumnGetDisplayText
            GroupIndex = 0
            Hidden = True
            MinWidth = 64
            Options.Sorting = False
            SortOrder = soAscending
          end
          object SovmestColumn: TcxGridDBColumn
            Caption = #1058#1080#1087' '#1087#1088#1072#1094#1110
            Visible = False
            Width = 78
          end
        end
        object SotrDetailsGridBandedTV: TcxGridDBBandedTableView
          OnKeyDown = SotrDetailsGridBandedTVKeyDown
          DataController.DataSource = ManMovingDataSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          Filtering.CustomizeDialog = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.BandMoving = False
          OptionsCustomize.BandSizing = False
          OptionsSelection.CellSelect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.BandHeaders = False
          Styles.StyleSheet = GridBandedTableViewStyleSheetDevExpress
          Bands = <
            item
              Caption = #1047#1072#1075#1072#1083#1100#1085#1110' '#1076#1072#1085#1110
              Width = 524
            end
            item
              Caption = #1054#1082#1083#1072#1076#1080
              Width = 86
            end
            item
              Caption = #1050#1086#1096#1090'.'
              Width = 49
            end>
          object PeriodBegBandColumn: TcxGridDBBandedColumn
            Caption = #1047
            Visible = False
            GroupIndex = 0
            SortOrder = soAscending
            Width = 84
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object PeriodEndBandColumn: TcxGridDBBandedColumn
            Caption = #1055#1086
            Width = 60
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.LineCount = 2
            Position.RowIndex = 0
          end
          object PostNameBandColumn: TcxGridDBBandedColumn
            Caption = #1055#1086#1089#1072#1076#1072
            Width = 321
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.LineCount = 2
            Position.RowIndex = 0
          end
          object FullOkladBandColumn: TcxGridDBBandedColumn
            Caption = #1054#1082#1083#1072#1076' '#1079#1072#1075#1072#1083#1086#1084
            Options.Filtering = False
            Options.IncSearch = False
            Options.Grouping = False
            SortOrder = soAscending
            Width = 69
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.LineCount = 2
            Position.RowIndex = 0
          end
          object StavkaBandColumn: TcxGridDBBandedColumn
            Caption = #1057#1090#1072#1074#1082#1072
            Options.Filtering = False
            Options.IncSearch = False
            Options.Grouping = False
            Width = 40
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.LineCount = 2
            Position.RowIndex = 0
          end
          object BaseOkladBandColumn: TcxGridDBBandedColumn
            Caption = #1041#1072#1079#1086#1074#1080#1081
            Options.Filtering = False
            Options.IncSearch = False
            Options.Grouping = False
            Width = 86
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object PPSOkladBandColumn: TcxGridDBBandedColumn
            Caption = #1055#1055#1057
            OnGetDisplayText = PPSOkladBandColumnGetDisplayText
            Options.Filtering = False
            Options.Grouping = False
            Options.Sorting = False
            Styles.Content = cxStyle1
            Width = 86
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 1
          end
          object SmetaBandColumn: TcxGridDBBandedColumn
            Caption = #1041#1072#1079'.'
            Width = 49
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object PPSSmetaBandColumn: TcxGridDBBandedColumn
            Caption = #1055#1055#1057
            OnGetDisplayText = PPSSmetaBandColumnGetDisplayText
            Styles.Content = cxStyle1
            Width = 49
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 1
          end
          object NameSovmestBandColumn: TcxGridDBBandedColumn
            Caption = #1058#1080#1087' '#1087#1088#1072#1094#1110
            Visible = False
            GroupIndex = 1
            SortOrder = soAscending
            Width = 57
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
        end
        object SotrDetailsGridLevel: TcxGridLevel
          GridView = SotrDetailsGridBandedTV
        end
      end
      object MovDetailsPanel: TPanel
        Left = 0
        Top = 329
        Width = 677
        Height = 58
        Align = alBottom
        TabOrder = 1
        object DepartmentLabel: TLabel
          Left = 16
          Top = 8
          Width = 97
          Height = 13
          Caption = 'DepartmentLabel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object NumOrderLabel: TLabel
          Left = 16
          Top = 40
          Width = 88
          Height = 13
          Caption = 'NumOrderLabel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DepartmentText: TDBText
          Left = 152
          Top = 8
          Width = 91
          Height = 13
          AutoSize = True
          DataSource = ManMovingDataSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object NumOrderText: TDBText
          Left = 152
          Top = 40
          Width = 82
          Height = 13
          AutoSize = True
          DataSource = ManMovingDataSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object KlassOrRarzText: TDBText
          Left = 152
          Top = 24
          Width = 65
          Height = 17
          DataSource = ManMovingDataSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 112
          Height = 13
          Caption = #1050#1083#1072#1089#1089' '#1072#1073#1086' '#1088#1086#1079#1088#1103#1076':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 256
          Top = 40
          Width = 84
          Height = 13
          Caption = #1052#1110#1089#1094#1077' '#1088#1086#1073#1086#1090#1080':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object NameSovmestText: TDBText
          Left = 344
          Top = 40
          Width = 113
          Height = 17
          DataSource = ManMovingDataSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object SotrMainPageControl: TPageControl
      Left = 1
      Top = 396
      Width = 677
      Height = 252
      ActivePage = ManHolidayPage
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object ManBonusPage: TTabSheet
        Caption = 'ManBonusPage'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        object ManBonusGridHeader: TLabel
          Left = 0
          Top = 0
          Width = 154
          Height = 16
          Align = alTop
          Caption = 'ManBonusGridHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ManBonusGrid: TcxGrid
          Left = 0
          Top = 16
          Width = 669
          Height = 208
          Align = alClient
          TabOrder = 0
          object ManBonusGridDBTableView: TcxGridDBTableView
            DataController.DataSource = ManBonusDataSource
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsCustomize.ColumnFiltering = False
            OptionsSelection.CellSelect = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            Styles.StyleSheet = GridTableViewStyleSheetDevExpress
            object KodVidoplColumn: TcxGridDBColumn
              Caption = #1050#1086#1076
              Width = 47
            end
            object BonusNameColumn: TcxGridDBColumn
              Width = 217
            end
            object MoneyColumn: TcxGridDBColumn
              Width = 35
            end
            object BonusBegColumn: TcxGridDBColumn
              Width = 35
            end
            object BonusEndColumn: TcxGridDBColumn
              Width = 35
            end
            object OrderNumColumn: TcxGridDBColumn
              Width = 35
            end
          end
          object ManBonusUniverTV: TcxGridDBBandedTableView
            DataController.DataSource = ManBonusDataSource
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsSelection.CellSelect = False
            OptionsView.CellAutoHeight = True
            OptionsView.GroupByBox = False
            Styles.StyleSheet = GridBandedTableViewStyleSheetDevExpress
            Bands = <
              item
                Width = 452
              end
              item
                Width = 99
              end
              item
                Width = 100
              end>
            object UniverVOKodColumn: TcxGridDBBandedColumn
              Caption = #1042#1054
              Width = 31
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.LineCount = 2
              Position.RowIndex = 0
            end
            object UniverVONameColumn: TcxGridDBBandedColumn
              Caption = #1053#1072#1079#1074#1072
              Width = 216
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.LineCount = 2
              Position.RowIndex = 0
            end
            object UniverDateBegColumn: TcxGridDBBandedColumn
              Caption = #1047
              Width = 60
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.LineCount = 2
              Position.RowIndex = 0
            end
            object UniverDateEndColumn: TcxGridDBBandedColumn
              Caption = #1055#1086
              Width = 79
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.LineCount = 2
              Position.RowIndex = 0
            end
            object UniverMainSummColumn: TcxGridDBBandedColumn
              Caption = #1041#1072#1079#1086#1074#1072' '#1089#1091#1084#1084#1072
              Width = 115
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object UniverPPSSummColumn: TcxGridDBBandedColumn
              Caption = #1057#1091#1084#1084#1072' '#1055#1055#1057
              OnGetDisplayText = UniverPPSSummColumnGetDisplayText
              Styles.Content = cxStyle1
              Width = 111
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.RowIndex = 1
            end
            object UniverMainSmetaColumn: TcxGridDBBandedColumn
              Caption = #1041#1072#1079'. '#1082#1086#1096#1090'.'
              Position.BandIndex = 2
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object UniverPPSSmetaColumn: TcxGridDBBandedColumn
              Caption = #1050#1086#1096#1090'. '#1055#1055#1057
              OnGetDisplayText = UniverPPSSmetaColumnGetDisplayText
              SortOrder = soAscending
              Styles.Content = cxStyle1
              Position.BandIndex = 2
              Position.ColIndex = 0
              Position.RowIndex = 1
            end
            object UniverOrderNum: TcxGridDBBandedColumn
              Caption = #1053#1072#1082#1072#1079' '#8470
              Width = 61
              Position.BandIndex = 0
              Position.ColIndex = 4
              Position.LineCount = 2
              Position.RowIndex = 0
            end
            object UniverPercentColumn: TcxGridDBBandedColumn
              Caption = '%'
              OnGetDisplayText = UniverPercentColumnGetDisplayText
              Width = 45
              Position.BandIndex = 0
              Position.ColIndex = 5
              Position.LineCount = 2
              Position.RowIndex = 0
            end
          end
          object ManBonusGridLevel: TcxGridLevel
            GridView = ManBonusUniverTV
          end
        end
      end
      object ManHospitalPage: TTabSheet
        Caption = 'ManHospitalPage'
        ImageIndex = 1
        OnShow = ManHospitalPageShow
        object ManHospitalGrid: TcxGrid
          Left = 0
          Top = 41
          Width = 669
          Height = 183
          Align = alClient
          TabOrder = 0
          object ManHospitalGridDBTableView: TcxGridDBTableView
            DataController.DataSource = ManHospitalDataSource
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsCustomize.ColumnFiltering = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            Styles.StyleSheet = GridTableViewStyleSheetDevExpress
            object DateBegColumn: TcxGridDBColumn
            end
            object DateEndColumn: TcxGridDBColumn
            end
            object SeriaColumn: TcxGridDBColumn
            end
            object NumColumn: TcxGridDBColumn
            end
            object PercentColumn: TcxGridDBColumn
            end
            object ReestrNumColumn: TcxGridDBColumn
              Caption = #8470' '#1056#1077#1108#1089#1090#1088#1072
            end
          end
          object ManHospitalGridLevel1: TcxGridLevel
            GridView = ManHospitalGridDBTableView
          end
        end
        object ManHospToolBar: TPanel
          Left = 0
          Top = 0
          Width = 669
          Height = 41
          Align = alTop
          TabOrder = 1
          object ShowHospAvgBtn: TButton
            Left = 8
            Top = 8
            Width = 185
            Height = 25
            Caption = 'ShowAvgPaymnet'
            TabOrder = 0
            OnClick = ShowHospAvgBtnClick
          end
        end
      end
      object ManHolidayPage: TTabSheet
        Caption = 'ManHolidayPage'
        ImageIndex = 2
        OnShow = ManHolidayPageShow
        object ManHolidayGrid: TcxGrid
          Left = 0
          Top = 41
          Width = 669
          Height = 183
          Align = alClient
          TabOrder = 0
          object ManHolidayGridDBTableView1: TcxGridDBTableView
            DataController.DataSource = ManHolidayDataSource
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsCustomize.ColumnFiltering = False
            OptionsSelection.CellSelect = False
            OptionsView.CellAutoHeight = True
            OptionsView.GroupByBox = False
            Styles.StyleSheet = GridTableViewStyleSheetDevExpress
            object HolidayNameColumn: TcxGridDBColumn
              Width = 301
            end
            object HolDateBegColumn: TcxGridDBColumn
            end
            object HolDateEndColumn: TcxGridDBColumn
              Width = 70
            end
            object HolPeriodBegColumn: TcxGridDBColumn
            end
            object HolPeriodEndColumn: TcxGridDBColumn
            end
            object HolidayOrderNumColumn: TcxGridDBColumn
              Caption = #1053#1072#1082#1072#1079' '#8470
            end
          end
          object ManHolidayGridLevel1: TcxGridLevel
            GridView = ManHolidayGridDBTableView1
          end
        end
        object ManHolidayToolBar: TPanel
          Left = 0
          Top = 0
          Width = 669
          Height = 41
          Align = alTop
          TabOrder = 1
          object ShowHolAvgBtn: TButton
            Left = 8
            Top = 8
            Width = 185
            Height = 25
            Caption = 'ShowCaption'
            TabOrder = 0
            OnClick = ShowHolAvgBtnClick
          end
          object AvgEditBtn: TButton
            Left = 200
            Top = 8
            Width = 137
            Height = 25
            Caption = #1056#1077#1076'. '#1089#1077#1088#1077#1076#1085#1108
            TabOrder = 1
            OnClick = AvgEditBtnClick
          end
          object PrintAvgHolBtn: TButton
            Left = 344
            Top = 8
            Width = 137
            Height = 25
            Caption = #1044#1088#1091#1082
            TabOrder = 2
            OnClick = PrintAvgHolBtnClick
          end
        end
      end
    end
    object cxSplitter2: TcxSplitter
      Left = 1
      Top = 388
      Width = 677
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      AlignSplitter = salBottom
      Control = SotrMainPageControl
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 337
    Top = 58
    Width = 8
    Height = 649
    HotZoneClassName = 'TcxMediaPlayer9Style'
    Control = SotrGridPanel
  end
  object SotrGridPanel: TPanel
    Left = 0
    Top = 58
    Width = 337
    Height = 649
    Align = alLeft
    TabOrder = 7
    object SotrDetailsPanel: TPanel
      Left = 1
      Top = 588
      Width = 335
      Height = 60
      Align = alBottom
      TabOrder = 0
      object TinLabel: TLabel
        Left = 8
        Top = 8
        Width = 27
        Height = 13
        Caption = #1050#1086#1076':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TinDBtext: TDBText
        Left = 40
        Top = 8
        Width = 65
        Height = 17
        DataSource = DataSource
      end
      object Label2: TLabel
        Left = 136
        Top = 8
        Width = 111
        Height = 13
        Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BirthDateText: TDBText
        Left = 256
        Top = 8
        Width = 65
        Height = 17
        DataSource = DataSource
      end
      object Label3: TLabel
        Left = 8
        Top = 32
        Width = 43
        Height = 13
        Caption = #1055#1086#1096#1091#1082':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SearchEdit: TEdit
        Left = 56
        Top = 30
        Width = 265
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnChange = SearchEditChange
      end
    end
    object SotrListGrid: TcxGrid
      Left = 1
      Top = 1
      Width = 335
      Height = 587
      Align = alClient
      TabOrder = 1
      object SotrListTableView: TcxGridDBTableView
        OnKeyPress = SotrListTableViewKeyPress
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnHorzSizing = False
        OptionsData.Editing = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object TNColumn: TcxGridDBColumn
          MinWidth = 50
          Width = 50
        end
        object FamiliaColumn: TcxGridDBColumn
          MinWidth = 90
          Width = 90
        end
        object ImyaColumn: TcxGridDBColumn
          MinWidth = 70
          Options.Filtering = False
          Width = 70
        end
        object OtchestvoColumn: TcxGridDBColumn
          MinWidth = 100
          Options.Filtering = False
          Options.Sorting = False
          Width = 100
        end
      end
      object SotrListGridLevel1: TcxGridLevel
        GridView = SotrListTableView
      end
    end
  end
  object SotrListDataSet: TpFIBDataSet
    Database = MainDataBase
    Transaction = ReadTransaction
    AfterOpen = SotrListDataSetAfterOpen
    AfterScroll = SotrListDataSetAfterScroll
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 16
    Top = 400
    poSQLINT64ToBCD = True
    dcForceMasterRefresh = True
    dcForceOpen = True
  end
  object DataSource: TDataSource
    DataSet = SotrListDataSet
    Left = 16
    Top = 352
  end
  object ManMovingDataSource: TDataSource
    DataSet = DetailsDataSet
    Left = 200
    Top = 120
  end
  object DetailsDataSet: TpFIBDataSet
    Database = MainDataBase
    Transaction = ReadTransaction
    OnEndScroll = DetailsDataSetEndScroll
    AfterOpen = DetailsDataSetAfterOpen
    Left = 240
    Top = 120
    poSQLINT64ToBCD = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object ManBonusDataSet: TpFIBDataSet
    Database = MainDataBase
    Transaction = ReadTransaction
    AfterOpen = ManBonusDataSetAfterOpen
    Left = 239
    Top = 159
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object ManBonusDataSource: TDataSource
    DataSet = ManBonusDataSet
    Left = 200
    Top = 160
  end
  object BarManager: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'ButtonsControlBar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 287
        FloatTop = 193
        FloatClientWidth = 73
        FloatClientHeight = 176
        ItemLinks = <
          item
            Item = RefreshBtn
            Visible = True
          end
          item
            Item = ShowFilterBtn
            Visible = True
          end
          item
            Item = CardBtn
            Visible = True
          end>
        Name = 'ButtonsControlBar'
        NotDocking = [dsNone]
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
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
    DockColor = clActiveBorder
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 512
    Top = 16
    DockControlHeights = (
      0
      0
      55
      0)
    object SelectBtn: TdxBarLargeButton
      Align = iaRight
      Caption = 'SelectBtn'
      Category = 0
      Hint = 'SelectBtn'
      Visible = ivAlways
      ShortCut = 121
      OnClick = SelectBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00118C1F004B00
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B0013
        8F23079310169C28004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF004B001591270FA01D0B9916089611159A27004B00FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF004B000F811C1AAF3114A7270FA11F0C9A18089612139925004B
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF004B000E7D1A28C04821B83D1BB033139024004B00
        169D29099713139823004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF004B000C771735CF5E2FC95428C1491B
        9F31004B00FF00FF004B000D9E1B099714119722004B00FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B003FD96F3BD7
        6836D06020AA3B004B00FF00FFFF00FFFF00FF004B000974110A991511962000
        4B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        004B001C9C3441DC7023AD41004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF004B000B991610951F004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF004B002EC152004B00FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF004B000C9A18099612004B00FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00046408099613
        004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF004B0007740E004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00035E06004B00FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B
        00004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object RefreshBtn: TdxBarLargeButton
      Caption = 'RefreshBtn'
      Category = 0
      Hint = 'RefreshBtn'
      Visible = ivAlways
      ShortCut = 116
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FF92635DA46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769A46769A46769A46769A46769A46769A46769A46769FF00FFFF
        00FFFF00FFFF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0CE9EEFCB97
        EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080EDC180EABF
        7F9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED4B8F4DABBF2D5B1F0
        D1AAA5BB70E0C793DEC48CEDC58FEBC188EABF82E9BD7FE9BD7FE9BD7FE9BD7F
        E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED7
        C0F6E0C1F2D9B8F2D4B1C0C588008201E0C79352A035259217259116519D2EB2
        B262DABB77E9BD7FE9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF93655FEFDAC5F7E2C7F3DCBFF2D8B7E3D0A50082010686050082010082
        010082010082010082017AA643DABB77E9BD7FEABF7FE7BC7E9F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FF936560F0DECCF8E6CFF6E0C6F3DCBDE3D4AC008201
        008201008201008201008201008201008201008201AFB15FE9BD7FEABF7FE7BC
        7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2D3FAEAD7F6E3CEF4
        DEC5E5D8B200820100820100820126931BB2BC76B1BA72529F33008201249015
        E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF986963F2E6
        DAFAEEDEF7E7D4F6E2CBE5DAB80082010082010082011C9014E1CA99E0C793DE
        C48C90AF57068604E9BD81EABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF9E6E64F4EAE1FBF2E6F8EADCF7E6D3E6DDC00082010082010082010082
        01008201E1CA9AEDCB9CEDC796EBC58F5FC065EABF82E7BB7E9F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3F7EADAE7E1C6E6DDC0
        E5D9B8E5D8B2E3D4ABE2D1A5E2CE9FEFCEA3EECA9CEDC7955FC065EBC288E7BC
        809F6F60FF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3F0FEFBF6FBF3EB5F
        C065F8EBDCF7E7D3F6E2CCE5DAB8E5D8B2E3D4ACE3D0A6E2CE9EE1CA99DEC792
        EDC795EDC58FE9BF879F6F62FF00FFFF00FFFF00FFFF00FFFF00FFAC7969FAF6
        F4FFFFFEFEF8F35FC065F8EEE3F8EBDAF7E6D3E7DDC000820100820100820100
        8201008201E1CA99EECB9CEEC996EAC18EA07063FF00FFFF00FFFF00FFFF00FF
        FF00FFB17E6BFAF6F4FFFFFFFFFEFBFEF7F006880698CB8BE9E5CCE7E2C6E6DD
        BF1C9217008201008201008201E2CE9EEFCEA1EECB9CEBC592A07264FF00FFFF
        00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFB289D27008201
        56B04FBAD5A5BAD19E279821008201008201008201E3D0A4F0D1A9F0CFA3EDC9
        999D7065FF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFFFFFFFFFFFF
        FFFFBFE3BC008201008201008201008201008201008201008201008201E3D4AB
        F0D4AFEFD0A7CEB491896A63FF00FFFF00FFFF00FFFF00FFFF00FFC0896FFBF7
        F4FFFFFFFFFFFFFFFFFFEFF8EF87CC8400820100820100820100820100820106
        8706008201E5D8B2E5CEAFC4B096A1927F806762FF00FFFF00FFFF00FFFF00FF
        FF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFEFF8EFC4E5C157B554289C
        25279A2456AF4CE9E2C7008201B2C495B8AB9AA79C8BA49786846964FF00FFFF
        00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFBFCF7F0FBF2E9FBF2E5DACFB7956856696C4095655B96655B9665
        5B986859FF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7F6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B69F675BDAA16B
        DD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FFFF00FFD49875FCF8
        F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFFFEF7DD
        C4BC9F675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFDDC7C29F675BEAB273EFA751A5686BFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CE9F675BEDB572A5686BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E68CF8E68CF8E68CF
        8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E689F675BA5686B
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object ExitBtn: TdxBarLargeButton
      Align = iaRight
      Caption = 'ExitBtn'
      Category = 0
      Hint = 'ExitBtn'
      Visible = ivAlways
      ShortCut = 119
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66666933
        34FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666
        A36666A76666693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666A0
        6666B06667C66667CC6667B36667693334FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A66
        66AF6869C0696ACF696ACE6869CD6768CD6768B36667693334AE66669A66669A
        66669A66669A66669A66669A66669A66669A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666D26F70D56F70D46E6FD36D6ED26C6DD16B6CD06A6BB467686933
        34FEA2A3FDA8A9FCAFB0FBB6B7FABCBDF9C2C2F9C5C6F9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666D97374D87273D77172D67071D56F70D46E6F
        D36D6EB6696A69333459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666DC7677DB7576DA7475D9
        7374D87273D77172D67071B86B6B69333459B26733CB6733CB6733CB6733CB67
        33CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666DF79
        7ADF797ADE7879DD7778DC7677DB7576DA7475B96C6D69333459B26733CB6733
        CB6733CB6733CB6733CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666E37D7EE27C7DE17B7CE07A7BDF797ADE7879DD7778BB6E6F6933
        3459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666E68081E57F80E47E7FE37D7EE27C7DE17B7C
        E07A7BBD707069333459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666E98384E88283E78182E6
        8081E78788ECA6A7E47E7FBE717269333473B87633CB6733CB6733CB6733CB67
        33CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666ED87
        88EC8687EB8586EA8485F2B9BAFFFFFFF0B0B0C07374693334F2D9C0C7F0BC79
        DD9079DD9060D68160D68160D681F9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666F08A8BEF898AEE8889ED8788F5BBBCFFFFFFF0AAABC275756933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDE2F8CCE2F8CCF9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666F38D8EF28C8DF18B8CF08A8BEF898AF3A6A7
        ED8788C37677693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666F69091F69091F58F90F4
        8E8FF38D8EF28C8DF18B8CC57878693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDD
        FFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666FA94
        95F99394F89293F79192F69091F58F90F48E8FC77A7A693334F2D9C0FFFFDDFF
        FFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666FD9798FC9697FB9596FA9495F99394F89293F79192C87B7C6933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666FF999AFF999AFE9899FD9798FD9798FC9697
        FB9596CA7D7D693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666FF999AFF999AFF999AFF
        999AFF999AFE9899FE9899CC7F7F693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDD
        FFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666F996
        97FF999AFF999AFF999AFF999AFF999AFF999ACD8080693334F2D9C0FFFFDDFF
        FFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A66669A6666C0797ADF898AFF999AFF999AFF999AFF999ACD80806933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666A76C6DC67C7DF29394
        FF999ACD8080693334A766669A66669A66669A66669A66669A66669A66669A66
        669A6666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF9A66669A6666AD7070B37373693334FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object BarEditLocate: TdxBarEdit
      Caption = 'BarEditLocate'
      Category = 0
      Hint = 'BarEditLocate'
      Visible = ivAlways
      Width = 100
    end
    object LocateNextBtn: TdxBarButton
      Caption = '  LocateNextBtn'
      Category = 0
      Hint = '  LocateNextBtn'
      Visible = ivAlways
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF02558E0B5B
        890B669802558EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        086EA919749C0505050202020D344605649DFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF02558E1597D523BDFE3C7A88EEB47A664F3A00000016475FFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF035B930973AF23BDFE23BDFE3C7A88FFBF81FFBF8134291F0A
        0D0F176A9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF004B820E81BD23BDFE0E81BD24BDFE30C1FE3A8EADEEB4
        7AFFBF81987452020202417EA0FF00FFFF00FF00386C186C9F004B82FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF05649D1AA6E523BDFE26BFFE137DB658CEFF
        7AD8FF99E0FF97846CFFBF81BF9167020202377598004B822C81B14A87A40B0D
        0F0D1F2905578BFF00FFFF00FFFF00FFFF00FF0973AF23BDFE2AC0FE41C7FE64
        D0FF2B84B696D9F7C2EDFFDCF4FFE1EAEF907F6C694F371D34402076A768C5EE
        60D0FF437481866749010101071924004B82FF00FF02558E096CA631C2FE4DCA
        FE6FD4FF90DDFFAFE7FFABD8EE3E86AFF2FBFFEBF8FFD3F2FFA9DEF74392BF05
        7EB23DB1E637C4FE27BFFE3C7A88FFBF8152402E010101044169055D961F93CE
        359ACE7AD8FF9AE1FFB8EAFFD4F2FFEAF8FFF2FBFF1B86B41984B44BA5CC2D84
        B4046FA400588F0198CB1CA6E523BDFE23BDFE1C84ACEEB47ABF91670000000D
        5882004B827BD1F72376A7C2EDFFDDF4FFEFFAFFEFFAFFDCF4FFBFEBFF77C2E6
        0D84B80189BD0179AF0198CB006BA10193C613A5E123BDFE23BDFE23BDFE6D7A
        6CBF91670000000B527B004B82CBEFFF6AA5C6609DBFEBF8FFD1F0FFB4E7FF95
        DEFF75D5FF55CCFF36C4FE0E8BC7015A92017FB4006298018EC10388BF23BDFE
        23BDFE23BDFE23B2EE3B666C02203102558E004B8272A9C6C2E0EE1767981365
        9849A1CE46A6D549C9FE2FC1FE24BDFE23BDFE23BDFE1FB6F60E86C20277AD01
        89BD018EC10A91CA1FB6F60F96D40679B5005B9500386CFF00FFFF00FF004B82
        004B82FF00FFFF00FF04568E158AC51390CE1390CE1FB6F623BDFE23BDFE23BD
        FE23BDFE1FB6F61390CE005187005B8F00386CFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF04629A1597D50973AF
        0E81BD0A88C40679B501659E00518800386CFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF005991016099004A80FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      PaintStyle = psCaptionGlyph
      ShortCut = 118
    end
    object InsertBtn: TdxBarLargeButton
      Caption = 'InsertBtn'
      Category = 0
      Hint = 'InsertBtn'
      Visible = ivAlways
      ShortCut = 113
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFA97C79B78183B78183B78183B78183B78183B78183B78183B78183B781
        83B78183B78183B78183B78183B78183B78183B78183B78183B78183FF00FFFF
        00FFFF00FFFF00FFFF00FFAE7781F3DDC4F8E3C6F6DFBFF5DCB8F4D9B2F3D7AC
        F3D4A7F2D2A0F0CF9AF0CE98F0CE98F0CE98F0CE98F0CE98F0CE98F1CF98EFCD
        97B88183FF00FFFF00FFFF00FFFF00FFFF00FFAE7782F2DEC8F7E3CAF5DFC2F4
        DCBCF3DAB6F2D7B1F1D4ABF1D2A5F0CF9FEFCD9AEECC97EECC97EECC97EECC97
        EECC97EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FFFF00FFAE7782F2E0
        CEF8E7CFF5E2C8F5DEC2F4DCBCF3DAB7F2D7B1F1D4ABF1D2A5F0CFA0EFCD9AEE
        CC97EECC97EECC97EECC97EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FF
        FF00FFAE7782F3E3D2F9E9D4F6E4CDF5E1C7F5DEC1F4DCBCF3D9B6F2D7B0F1D4
        AAF1D2A5F0CFA0EECC99EECC97EECC97EECC97EFCD97EDCB96B88183FF00FFFF
        00FFFF00FFFF00FFFF00FFAE7783F4E6D8FAECDAF8E7D3F6E4CCF5E1C7F5DFC2
        F4DCBCF3D9B6F2D7B0F1D4ABF1D2A6F0CFA0EECD9AEECC97EECC97EFCD97EDCB
        96B88183FF00FFFF00FFFF00FFFF00FFFF00FFAF7883F5E9DDFBEFE0F8EAD9F7
        E6D2F6E4CDF5E1C8F4DEC2F4DCBCF3D9B6F2D7B1F1D4ACF1D2A6F0CFA0EECC99
        EECC97EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FFFF00FFB27B85F5EC
        E3FBF2E6F9EDDEF8E9D7F7E7D2F6E4CDF5E1C7F5DFC1F4DCBBF3D9B6F2D7B1F1
        D4ABF1D2A5F0CFA0EECC99EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FF
        FF00FFB78086F7EFE8FCF5ECFAEFE4F9ECDDF8E9D8F7E7D3F6E4CDF5E1C7F5DF
        C1F4DCBCF3D9B7F1D7B0F1D4ABF0D2A5F0CF9FEFCD9AEDCA96B88183FF00FFFF
        00FFFF00FFFF00FFFF00FFBB8388F8F2EEFDF8F1FAF3EAF9EFE3F9ECDDF8E9D8
        F7E6D2F6E4CCF5E1C6F4DFC1F4DCBCF3D9B6F2D6B0F1D4AAF0D1A4F0D09FEDCB
        98B88183FF00FFFF00FFFF00FFFF00FFFF00FFBE8689FAF6F4FEFCF8FCF6F0FA
        F2EAFAF0E4F9EDDDF8E9D8F7E7D2F6E4CCF5E1C7F5DEC2F4DCBBF3D9B6F1D7B0
        F1D4AAF1D2A5EECD9EB88184FF00FFFF00FFFF00FFFF00FFFF00FFC2898AFBF8
        F7FFFFFEFEFAF6FCF5EFFAF2EAFAF0E3F9ECDDF9E9D8F8E7D2F6E4CDF5E1C7F5
        DEC1F4DCBCF3D9B6F2D7B0F2D5ABEFCFA4B98285FF00FFFF00FFFF00FFFF00FF
        FF00FFC68D8CFBF8F7FFFFFFFFFEFCFEF9F4FCF6EFFBF3EAFAEFE3F9EDDDF8E9
        D7F8E7D2F6E4CDF5E1C6F5DEC1F4DCBBF3D9B5F2D7B0F0D2A8B98386FF00FFFF
        00FFFF00FFFF00FFFF00FFCA908DFBF8F7FFFFFFFFFFFFFFFDFCFEF9F5FCF6F0
        FAF2EAFAF0E4F9ECDDF8EAD8F8E6D2F6E4CCF6E1C6F5DEC0F4DCBBF4DAB6F1D5
        AEB58286FF00FFFF00FFFF00FFFF00FFFF00FFCD938FFBF8F7FFFFFFFFFFFFFF
        FFFFFFFEFCFEF9F5FCF6EFFBF2EAFAEFE3F9ECDDF8E9D7F8E6D1F6E3CBF5E1C6
        F4DEC0F3DBBAD9C4A7A47E83FF00FFFF00FFFF00FFFF00FFFF00FFD19790FCF9
        F7FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFEF9F5FCF5EFFBF2E9FAF0E3F9ECDDF8
        E9D7F8E6D1F6E4CCEBD9C0D1C1ABB5A8979C7C81FF00FFFF00FFFF00FFFF00FF
        FF00FFD59A91FCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFDFAF5FCF6
        EFFAF2E9FAEFE2FAEDDEFBEEDBE7DBC9C8BDAFBAB0A2B7AC9DA07E83FF00FFFF
        00FFFF00FFFF00FFFF00FFDA9D93FCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFCFDF9F4FCF5EEFCF5EBEEDDD1B28176AD8076AA7F76AB7F76AB7F
        76AF7F77FF00FFFF00FFFF00FFFF00FFFF00FFDDA194FCF9F8FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFDF9F4FFFBF3E3CEC6B38176E3B585
        E5AD6AE9A654EFA039B88285FF00FFFF00FFFF00FFFF00FFFF00FFE0A395FDFA
        F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFFFEF9E5
        D1CBB38176EFC48DF3BB6DF8B450B88285FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFE0A395FDFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFE5D4D0B38176EFC38CF3BA6CB88285FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFE0A395FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DBD9B38176F1C58BB88285FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEA78CECD0BEEDD3C1EDD3C1EC
        D1C1EAD0C1E8CEC0E6CCBFE4CBBEE1C9BEDFC7BDDDC5BDCEAEA6B38176B88285
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object DeleteBtn: TdxBarLargeButton
      Caption = 'DeleteBtn'
      Category = 0
      Hint = 'DeleteBtn'
      Visible = ivAlways
      ShortCut = 114
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0732DE0732DE0732DEFF00FFFF00FFFF00FF0732DE0732DE0732
        DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FF
        0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00FFFF00FFFF
        00FFFF00FFFF00FF0732DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DE07
        32DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE
        0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335
        FB0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF0732DE07
        32DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00FFFF00FF0732
        DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE
        0732DE0732DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF0732DE0732DE0335FB0732DE0335FB0732DE0732DEFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0335FB0732DEFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0335FB0732DE0732
        DE0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0335FB
        0732DE0335FB0335FB0335FB0732DE0335FBFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB03
        35FB0335FB0732DE0335FBFF00FFFF00FF0335FB0335FB0335FB0335FBFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0335FB0335FB0732DE0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB03
        35FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0335FBFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335
        FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB
        0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object UpdateBtn: TdxBarLargeButton
      Caption = 'UpdateBtn'
      Category = 0
      Hint = 'UpdateBtn'
      Visible = ivAlways
      ShortCut = 115
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF0022212300534E5700FF00FF0041353800A4676900A5686B007A494A005A35
        35008B555500804E4E0091595900965D5D008B565600734747008C5757009560
        6000AA6E6E00A96D6D00A76C6C00A66B6B008C5B5B0091606000B77A7A00B679
        7900B87B7B00BB7E7E00BA7D7D009C696900CB8C8C00CA8B8B00C98B8B00C78A
        8A00CC8E8E00DA9A9A00D9999900C2898900D99A9A00DC9D9D00E1A1A100DA9C
        9C00E2A3A300EBAAAA00E2A4A400E1A3A300643B3A00734847007B504F005D38
        360093656000E2D0CE009566600093655F009869630084544C009F675B009E6E
        6400A3726600DDC7C200FBF7F6009D6D5F00865D51007350460062443C00A775
        68009F6F6000AC796900583F3700533C3500DDC4BC0096695A00B17E6B00FFFC
        FB00BB846E00B6816C00BCA19600DAC0B600BBA19600CB917300C58C7000C089
        6F00FCF8F600FAF6F400CF8E6800D4987500CF967400F6EEE900F8F3F000AA78
        56003C383500FEF7F200ECD5C200E1CCBB003E3935006A554200F2E2D300FAEE
        E300F4EAE100B77D460066523F0064513E0065524000EFDAC500F2E6DA00FBF2
        E900FEF7F000FDF8F300EAB2730062503D00604F3D00EED4B800F0DAC200F6E3
        CE00F0DECB00F7E6D300F4E3D000F8EEE300FBF3EA00EFA75100EDB57200EAB4
        7400F2D5B100E9CCAB00F4DEC500F4E1CA00F3E0CA00F7E7D400FAEAD700F8EA
        D900F7EADA00F8EBDC008E745100E5BC8400A4865F00B29268009E835F00E1BB
        88006C594100897253006A5841008E775900DEBB8C00AA8F6B00C6A67E007764
        4C00E1C09300C1A57F00836F5600E6C79D00C9AD89008C796000EDCEA700D9BD
        9900E6CEAF00F2DABC00EAD4B600F4DEC000AC9D8A00F6E1C600F7E5CE00F6E6
        D100F8EBDA00FAEEDE00FBF2E600E1B77900EABF7F00CCA66E00E9BD7F00E7BC
        7E00E5BB7D00DEB57900DAB17700D9B17600E3BA7D00D1AB7300C09C6900A989
        5D009A7E5500E7BC8100E1B77D00C7A36F00BC996900B2916300D1AB7500826C
        4B00987D5800DAB47F00C7A474007B664800B89A6F007E694C00766347006F5D
        4300D1AF7F009D876700F0D8B700EBD8BD00FCF6ED00FCF7F000E3BA7B00FEFB
        F600FFFAEF00FFFEFB00FFFEF700FFFFFE003A494800748686003443440000BD
        FF0000B1F2004E6C760000AAEA0000A6E600009FDE000093D100097BAB001A3E
        4D000087C4000084C100028AC4000B4159000C3C5200113B4E00008CD100036A
        9D0004689A000459830005679800064F7500182A33001B506E00315065003547
        56002A34400041485500012BA700001C9D002D4FF6005270FC00021DB100031E
        B1000420B8000725DC000F2ECC001839E3000C21BF00010D9D001322BD001624
        BF0001099700010A9700050DA50000058F00000082001F1F2100040404040404
        0404040404040404040404040404040404043506060606060606060606060606
        06060606060404040404356F9B7A9895928E8985B3A9A8A8A8A8A6A942040404
        0404355C9DC47B99969390C2BBB4AEA9A8A8A6A942040404040435679F9B9A02
        5E97C38FBEBCB8ABAAA9A6A94204040404043272A07C9C5AFFE6D0948D8887B5
        ADAEA9A942040404040434608071709EDFE2E5DECE918B86B6AFA5C842040404
        04043668A37F7DC5D9E1E4E7EA055FBFBAB7A7AC3D04040404043962A483737E
        CFE3E811120D2E66C084B1B04704040404043A57C675827372DD16221B120D2E
        65C1B9B23E04040404044158C9767583A1D31D271E1C130C096D8CBD3F040404
        04044353CD6B6975A274302C271E1C1310096E8A400404040404485301CB6A76
        61815D302A271F1A140E09644404040404044B530101495B7675835D2F2D2920
        1A140E314504040404044A53010101CB5B7661814E2F28232018150A09040404
        0404515301010101CB5B6961A24E2F28262118150A0904040404505301010101
        01496B7675814C172B2421190BEBE90404044F53010101010101CBC769A45C37
        172B2403DCD4D5DA0404563C0101010101010149C7CA4D38591725D8D1D1D5ED
        FE045552010101010101010149CC463879630FD6D1E0EDF7FBFE555201010101
        0101010101013B386C7708D7D2ECF3F2F0FB55CD010101010101010101013338
        78070404DBF6EEF4F1FD54545454545454545454545454380704040404F9EFF5
        FA040404040404040404040404040404040404040404F8FC0404}
    end
    object UpdateAllBtn: TdxBarLargeButton
      Caption = 'UpdateAllBtn'
      Category = 0
      Hint = 'UpdateAllBtn'
      Visible = ivAlways
      ShortCut = 16499
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00383739006E697200FF00FF005B4E5200B8828500B781830093646500764E
        4E0098696900A7747400AB777700A2717100A1707000AB787800A3727200BB87
        8700B9858500BC888800AA7B7B00A3767600A77B7B00C9959500C7939300CA96
        9600B0838300D6A2A200D8A4A400D7A3A300D4A1A100D0A0A000E5B1B100E4B0
        B000E3AFAF00E2AEAE00E9B6B600E8B5B500F0BCBC00E7B5B500EFBCBC00754E
        4D007E555400754F4E008C636200946B6A0078525000A97F7A00AA807B00A97F
        7900AD837D00E9DBD9009C6F6700B3817600B2887E00E5D4D000BA8E8200B68B
        80006E564F00B1877A009D786C008C6B61007C5F560073595100E5D1CB00B389
        7B00AB837500BE928300FCF9F800FBF8F700C2968500E3CEC600CA9C8800C699
        8600CEA08900CAB5AB00FAF6F400FFFDFC00D7A78C00D2A38A00DAA48200DEAD
        8E00DAAB8D00EEDDD100F8F2EE00FDFAF800FCF9F700BC91710056524F00FEF9
        F500E8D8CA00F7EFE800FCF5EF0084705D00F2E0CE00F4E6D80058534E00F5E9
        DD00FAEFE400FBF2E900F5ECE300FAF2EA00FCF6F000FEFAF600FFFDFB00C795
        6100806D59007E6C58007F6D5A007B6A5700F2DEC800F4E3D000F3E3D200F4E5
        D500FAEFE3007C6B5700EED8BD00BEB1A100F7E6D200F7E8D600F6E7D600F7EA
        DB00F9ECDD00FAF0E400F9EFE300FCF6EF00F3BA6C00F1C58B00EFC38C00EFC4
        8D00B79D7A0086745C00D3B99600907E67009B897100A3927B00F1D9BA00E2CC
        AE00F5DFC200F4E1C700ECD9C000F7E3CA00F4E2CB00F8E8D300F9EBD900FBEF
        E000F9EDDE00FAF0E300FBF2E600FCF5EC00FDF9F400CEB08300C3A77D00BBA0
        7800EDCB9900D4B68900CBAE8300A48D6C00EBCB9C00E3C49700D4B78D00C3A8
        8200AD95730094806300E8CA9F00DCC09700B29B7A00968367008F7D6200A08B
        6E0084735B00E6CAA300BCA58500A4907400E8CEA900CFB89700ECD4B100D5BF
        A000EFDEC600F7E6CE00F0E1CC00FCF5EB00FDF8F100E8C79200E2C28F00D8B9
        8800EECC9700EDCB9600EBCA9500E6C59200E3C29000DCBD8C00EAC99500AF96
        7000E8C79500DCBD8E009A866600C8AF890089785E00B19E8100FDFAF500FFFB
        F300FEFCF800FFFEFC00FFFEF900FFFFFE00546463008D9D9D004D5E5F0000CC
        FF0000C2F50000BCEF0000B9EC0000B3E60000A9DC00009ED100019CCF0007A1
        D1001594BD0069868F0000A3DC000A84B1000B749B00185B74000C82AF000D81
        AD00106A8E001A566D00225569002E5868002C424C002F6B88004A6B7F004F62
        7100424D5A000443BA005C6370000130B1000732C2000833C2000C36C8001E47
        D800113CE4002B53EA00456AF8006D8AFD001A37CD00041CB1000316AC000515
        AC002538CC00293BCD00020EA5000E1BB80000009A0035353700040404040404
        0404040404040404040404040404040404043107070707070707070707070707
        070707070704040404042F6E8D8A88B0AEABA49E9ABBBABABABABABB41040404
        04042F5EB38B7489B1AF84A59FC2C0BBBABABABB4104040404042F708F8E8C02
        6087C7ACC5A0C3BDBCBBBABB4104040404042F5F9076B258FFE6D086ADA6A19B
        B8C0BBBB410404040404306191906F75E4E0E2E3CE85A9829CBFB7C041040404
        04043264949277B4E5DDE1E7EA055DA7A298B9BE3B0404040404365B95627A78
        CFDEE814130F2A6CA89D99974204040404043954B6657C7A71DF151C19130C2A
        6BC6C4C13C0404040404384CCA66657B7ADB1A201D17110B2973AAA33D040404
        04044345CD675C6593792D24201D171110296D833E0404040404464501CB597D
        63725A2D24211B17110D096A3F0404040404494501014D5966657B5A2C24211B
        17110D2E3A04040404044845010101CB597D63724B2C25221E18120E2B040404
        04044A5601010101CB595C63934B2C27221E18120E09040404044F5601010101
        014DC87D63724B1626231E180AECE90404044E56010101010101CB965CB55334
        16282303D9D3D4D704045244010101010101016896C9473557161FDAD1D1D4ED
        FE04515501010101010101014DCC403581692CD5D1DCEDF7F8FE515501010101
        0101010101013735807E08D6D2EBF2F0EEF851CD010101010101010101013335
        7F060404D8F6F4F1EFFC50505050505050505050505050350604040404FBF5F3
        F9040404040404040404040404040404040404040404FAFD0404}
    end
    object SpravBtn: TdxBarLargeButton
      Caption = 'SpravBtn'
      Category = 0
      Hint = 'SpravBtn'
      Visible = ivAlways
      ShortCut = 16497
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FF92635DA46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769A46769A46769A46769A46769A46769A46769FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF92635DEFE0CCEFE0CCEFE0CCEFE0CCEFE0CCEFE0CC
        EFE0CCEFE0CCEBD9C1EBD9C1EBD9C1EBD9C1EBD9C1EBD9C1EBD9C1EBD9C1A467
        69FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF92635DEFE0CCEEDECBFCEAD7FC
        EAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7
        EBD9C1EBD9C1A46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF92635DEFE1
        D0EFE0CEFEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FE
        BD82FEBD82FEBD82EBD9C1EBD9C1A46769FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF92635DF0E3D4F0E2D1EFE1CFEFE0CEEEDECBEEDDC9EDDCC7EDDCC5EBDA
        C2EBD9C1EBD9C1EBD9C1EBD9C1EBD9C1EBD9C1EBD9C1A46769FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF92635DF0E5D7EFE2D4FCEAD7FCEAD7FCEAD7FCEAD7
        FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7EAD8C0EAD8C0A467
        69FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF92635DE7DDD0E7DCCFFEBD82FE
        BD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82
        E1CFB8E1CFB8A46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E6E64CEC6
        BCCEC5BACEC4B7CCC2B7CBC1B5CBC0B4CAC0B1CABFAFCABDADCABCACCABBAAC9
        BAA7C9B8A6C7B7A5C7B7A4C7B7A4A46769FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF895F56A19A95A09993A09891A09790A0978E9F978C9E968B9E958A9D93
        899D93879C92869C92849C91829C90829C8F819A8E808E595BFF00FFFF00FFFF
        00FF8C38168C38168C38168C38168C38168C38168C38168C38168C38168C3816
        8C38168C38168C38168C38168C38168C38168C38168C38168C38168C38168C38
        168C38168C38168C38168C3816FF00FFFF00FFA77568E0D9D3E0D9D0DED7CFDE
        D7CEDDD4CBDDD4C9DDD3C7DDD0C5DCD0C4DACEC1DACEBFD9CEBDD9CCBCD8CABA
        D8CAB7D8C9B6A46769FF00FFFF00FF8C38168C3816FF00FFFF00FFA77568D1CC
        C7D1CAC5CC5A2ACC5A2ACC5A2ACC5A2ACC5A2ACC5A2ACC5A2ACC5A2ACC5A2ACC
        5A2ACC5A2ACC5A2AC9BCADC9BBABA46769FF00FFFF00FF8C38168C3816FF00FF
        FF00FF996D5CA4A19DA3A09CF3BB9FF3BB9FF3BB9FF3BB9FF3BB9FF3BB9FF3BB
        9FF3BB9FF3BB9FF3BB9FF3BB9FF3BB9F9D958A9D93888E595BFF00FFFF00FF8C
        38168C38168C38168C38168C38168C38168C38168C38168C38168C38168C3816
        8C38168C38168C38168C38168C38168C38168C38168C38168C38168C38168C38
        168C38168C38168C3816FF00FFFF00FFFF00FFB17E6BFFFEFCFFFEFCFFFEFCFF
        FEFCFFFEFCFAF4EFFAF4EFF8F2EAF8F2EAF6EDE5F6EDE5F4EDE2F4EDE2F3E6D9
        F3E6D9F3E6D9A46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBB846EFEFC
        FBFCFBF8FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FC
        EAD7FCEAD7FCEAD7F2E6DAF2E5D8A46769FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC0896FFFFFFFFFFFFFFEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD
        82FEBD82FEBD82FEBD82FEBD82FEBD82F3EADEF3E9DDA46769FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFC58C70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4EDE2F4EBE0A467
        69FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCB9173FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFCFEFBF8FEFAF6FBF7F3FAF6F0FAF4EFF8F3EDF8F0EAF7EFE9
        F7EEE6F4EDE3A46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF9674FFFF
        FFFFFFFFFCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FC
        EAD7FCEAD7FCEAD7F7F0EAF7EFE7A46769FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFD49875FFFFFFFFFFFFFEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD
        82FEBD82FEBD82FEBD82FEBD82FEBD82F8F3EDF8F2EAA46769FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFD49875FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFEFBF8FCFAF6FBF7F3FAF6F0F8F3EEA467
        69FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD49875FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFCFAFEFAF7
        FCF8F4FAF6F2A46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD49876CF8E
        68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF
        8E68CF8E68CF8E68CF8E68CF8E68956662FF00FFFF00FFFF00FF}
    end
    object FilterButton: TdxBarLargeButton
      Caption = 'FilterBtn'
      Category = 0
      Hint = 'FilterBtn'
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000830B0000830B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA4785AFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFA4785AA4785AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA4785ABC9B7CA4785AFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFA4785AC5966EDFA777A4785AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFA4785AC99F7CE5AA79F5B37EA57F61BB
        8A68BB8A68BB8A68BB8A68BB8A68BB8A68BB8A68A57F61FF00FFFF00FFA4785A
        B88C66E5AA79F5B37EF5B37EF5B37EF5B37EF5B37EF5B37EF5B37EF5B37EE3A8
        76D69F72A4785AFF00FFA4785AA98C71CD9E77E5AA79F5B37EF4BF96F8D9C1F8
        D9C1F8E0CDF8E0CDF4D0B2F5D8C1E0A779D29C6FA4785AFF00FFFF00FFA4785A
        B88A63CD9E77E5AA79F8E5D7EDCCB2E8BF9FE4B997E2B794E1B593DDAF8AD09E
        75C2926AA4785AFF00FFFF00FFFF00FFA4785AB98A64CD9E77E5AA79A57F61BB
        8A68BB8A68BB8A68BB8A68BB8A68BB8A68BB8A68A57F61FF00FFFF00FFFF00FF
        FF00FFA4785AAF8868CD9E77A4785AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA4785AAC8A6FA4785AFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFA4785AA4785AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA4785AFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      AutoGrayScale = False
      HotGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF298C29298C29298C2929
        8C29319C31319C31319C31319C31319C31319C310B770B0B770B0B770B0B770B
        0D890D0B770BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3994
        39298C2931A53131A53121A52131A53139AD3939AD3939AD39107B10319C3131
        94290D890D319C310D890D0D890D0B770BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF299C29298C2942BD4231AD3142BD424ABD4A52C652A1E290399C
        398CBD7B399C399CDE8C42BD4231AD310D890D0D890D0B770BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF39943929AD2939B5394ABD4A5AC65A
        6BCE6BA1E29052A54AFFF5EC4AA542B5E7A552C65242BD42299C290D890D0B77
        0BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF299C294A
        BD4A5AC65A6BCE6BA1E29052A54AFFF5ECFFFFFF84BD7BB5E7A563CE6352C652
        31A5310B770BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF398C314ABD4A63CE63A1E29052A54AFFF5ECFFFFFFFFFFFF84B5849C
        DE8C73CE735AC65A319C310B770BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF398C3152B5524A9C42FFE2C3FFECD7FFEC
        D7FFE2C394B57B7BCE7B7BD67B52B5520B770BFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A8C4218734A
        3984AD217BBD217BBD428CAD42846363BD630B770B0B770BFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF2F94DA41A6E73FA4E6399EE12F94DA107BB5FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF2F94DA49AEED47ACEC43A8E941A6E7399EE12F94DA10
        7BB5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF2F94DA4FB4F24FB4F24DB2F049AEED43A8
        E93FA4E63499DD298CE7268AD0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2F94DA55BAF655BAF6
        51B6F34DB2F047ACEC41A6E73EA3E52F94DA107BB5FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1E628918
        7BC65BC0FA59BEF955BAF64FB4F249AEED43A8E93EA3E52F94DA107BB5FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF25688F187BC661C6FF5BC0FA55BAF64FB4F249AEED43A8E93EA3E52F
        94DA397394FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF2F71963274992F94DA59BEF955BAF64FB4F249AE
        ED43A8E93EA3E52F94DA1E6289FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF397A9E3C7DA13C7DA13C7DA1
        397A9E327499286B9121658C175C842994CE145A82FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4080A347
        86A94786A94786A94080A3397A9E2F719625688F1E6289145A82FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF5895B6609CBD5895B64786A93C7DA1327499286B911E628914
        5A82FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5895B6609CBD4786A93C7DA13274
        99286B91145A82FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5895B6
        4786A93C7DA1327499286B91FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object ShowFilterBtn: TdxBarLargeButton
      Caption = 'ShowFilterBtn'
      Category = 0
      Hint = 'ShowFilterBtn'
      Visible = ivAlways
      ShortCut = 114
      OnClick = ShowFilterBtnClick
      AutoGrayScale = False
      HotGlyph.Data = {
        66090000424D660900000000000036000000280000001C0000001C0000000100
        1800000000003009000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1D6E85FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF1D6E8517576AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1D6E856BA7B9
        17576AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF1D6E857CB4C4498FA317576AFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF1D6E857CB4C4498FA317576AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1D6E857CB4C4498FA317
        576AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF1D6E857CB4C4498FA317576AFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1D6E
        856BA7B9498FA317576AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1D6E856BA7B9498FA317576AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF1D6D8462A1B35195A8498FA340899D17576AFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1D6D8462A1B36BA7B95195A8
        498FA340899D38839817576AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF1D6C837CB4C46BA7B95A9BAE5195A8498FA340899D3883982F7D92
        17576AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1D6C837CB4C46BA7B962
        A1B35A9BAE5195A8498FA340899D3883982F7D9227778D17576AFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF1D6C837CB4C47CB4C46BA7B962A1B35A9BAE5195A8498FA340
        899D3883982F7D9227778D1F718817576AFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1D6C8291C3D291C3
        D291C3D27CB4C46BA7B917576A17576A17576A40899D3883982F7D9227778D1F
        71881F718817576AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF1C6B81BDE3EEA7D3E091C3D217576A17576A17576A9CDE
        FF9CDEFF009CCE17576A17576A17576A17576A1F71881F71881F718817576AFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C6B81
        1D6C821D6C8317576A9CFFFF9CFFFF00BDFF9CDEFF9CDEFF9CDEFF009CCE0000
        9C00009C6BA7B917576A17576A1F718817576AFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C6B8138839838839800BDFFE9FFFF
        9CFFFF9CFFFF00A5EF9CDEFF009CCE0000C800009C0000C800009C6BA7B96BA7
        B917576A17576AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF1D6C821D6C8338839800A5EFE9FFFF9CFFFF9CFFFF00A5EF
        0000C800009C0000DE0000DE0000C800009C17576AFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF633131CE
        63001D6C831D6C8300A5EFE9FFFF00BDFF0000B40000B40000DE0000DE0000DE
        0000DE0000C800009CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF633131CE6300CE6300CE63009C310000
        BDFF0000B48B9EF1718BED0000B40000DE0000DE0000DE00009CFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF633131FFAD4A9C31009C3100CE6300CE63009C31000000B48B9EF171
        8BED0000B40000DE00009CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF633131633131FFCE
        9CFFAD4AD68400D68400D684006331310000B40000B40000B40000B4FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF633131633131FFCE9CFFCE9C6331316331
        31FF00FFFF00FF0000B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF633131633131FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF}
    end
    object CardBtn: TdxBarLargeButton
      Caption = #1050#1072#1088#1090#1082#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
      Category = 0
      Hint = #1050#1072#1088#1090#1082#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
      Visible = ivAlways
      Glyph.Data = {
        66090000424D660900000000000036000000280000001C0000001C0000000100
        18000000000030090000330B0000330B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFB58484B58484B58484B58484B58484B58484B58484B58484B5
        8484B58484B58484B58484B58484B58484B58484B58484B58484B58484B58484
        B58484B58484B58484FF00FFFF00FFFF00FFFF00FFFF00FFCEADA5FEFEFDFEFE
        FDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFCFCFBFAFAF9F8F8F7F6F6F5F4F4F3F2
        F2F1F0F0EFEEEEEDECECEBEAEAE9E8E8E7E4E4E3DFDFDEDBDBDAD6D6D6B58484
        FF00FFFF00FFFF00FFEFCEC6FEFEFDFEFEFDFEFEFDBC0C18B80C18B40B17B00B
        16AC0B16A80A15A40A14A00A149E0A149B09139909139609129309129109128E
        08118B0811890810860810DBDBDADBDBDAD6D6D6B58484FF00FFFF00FFEFCEC6
        FEFEFDFEFEFD0090F434ACFF30AAFF2CA8FF28A6FF24A4FF20A3FF1EA2FF1BA1
        FF19A0FF169FFF149EFF119DFF0F9CFF0C9BFF0A9AFF0799FF0598FF0090F400
        90F4DFDFDEDBDBDAB58484FF00FFFF00FFEFCEC6FEFEFD0090F434ACFF38AEFF
        34ACFF30AAFF2CA8FF28A6FF24A4FF20A3FF1EA2FF1BA1FF19A0FF169FFF149E
        FF119DFF0F9CFF0C9BFF0A9AFF0799FF0598FF0090F40090F4DFDFDEB58484FF
        00FFFF00FFEFCEC6FEFEFD0090F434ACFF3DAFFF38AEFF34ACFF30AAFF2CA8FF
        28A6FF24A4FF20A3FF1EA2FF1BA1FF19A0FF169FFF149EFF119DFF0F9CFF0C9B
        FF0A9AFF0799FF0090F40090F4E4E4E3B58484FF00FFFF00FFEFCEC6FEFEFDFE
        FEFDFEFEFDFEFEFDFEFEFDFEFEFD965C0FA499A2FFFFFF840810A77C5DD2CAC8
        840810840810D2CAC8840810FFFFFFFFFFFF840810F1F1F0EEEEEDECECEBEAEA
        E9E8E8E7B58484FF00FFFF00FFEFCEC6FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
        FEFD840810840810FFFFFFA77C5D840810965C0FC5AD9BA77C5D840810840810
        A77C5DA77C5D840810F3F3F2F1F1F0EFEFEEEDEDECEBEBEAB58484FF00FFFF00
        FFEFCEC6FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD840810840810D2CAC8E9
        E6E4840810FFFFFFFFFFFFA77C5D840810D2CAC8840810A77C5D840810F5F5F4
        F3F3F2F1F1F0EFEFEEEDEDECB58484FF00FFFF00FFEFCEC6FEFEFDFEFEFDFEFE
        FDFEFEFDFEFEFDFEFEFD840810D2CAC8840810FFFFFF840810D2CAC884081084
        0810FFFFFFFFFFFFA499A2A77C5D840810F7F7F6F5F5F4F3F3F2F1F1F0EFEFEE
        B58484FF00FFFF00FFEFCEC6FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD8408
        10D2CAC8A77C5D840810A499A2A77C5D965C0F840810D2CAC8A499A2FFFFFF84
        0810840810F9F9F8F7F7F6F5F5F4F3F3F2F1F1F0B58484FF00FFFF00FFEFCEC6
        FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDA77C5DA77C5DFFFFFFFFFFFFA77C5DD2CA
        C8A77C5DFFFFFFA77C5D965C0FD2CAC8FFFFFFA77C5DA499A2FBFBFAF9F9F8F7
        F7F6F5F5F4F3F3F2B58484FF00FFFF00FFEFCEC6FEFEFDFCC0C4B10B16AD0B16
        AA0A15A60A15A30A14A00A149E0A149C09139A09139809139609129409129209
        129008118E08118C08118A0810880810860810840810FCC0C4F5F5F4B58484FF
        00FFFF00FFEFCEC6FEFEFDFCC0C4B40B17B10B16AD0B16AA0A15A60A15A30A14
        A00A149E0A149C09139A09139809139609129409129209129008118E08118C08
        118A0810880810860810FCC0C4F8F8F7B58484FF00FFFF00FFEFCEC6FEFEFDFC
        C0C4B80C18B40B17B10B16AD0B16AA0A15A60A15A30A14A00A149E0A149C0913
        9A09139809139609129409129209129008118E08118C08118A0810880810FCC0
        C4FAFAF9B58484FF00FFFF00FFEFCEC6FEFEFDFEFEFDFCC0C4B80C18B40B17B1
        0B16AD0B16AA0A15A60A15A30A14A00A149E0A149C09139A0913980913960912
        9409129209129008118E08118C0811FCC0C4FEFEFDFCFCFBB58484FF00FFFF00
        FFFF00FFEFCEC6FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
        FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FEFEFDFEFEFDFEFEFDCEADA5FF00FFFF00FFFF00FFFF00FFFF00FFEFCEC6EFCE
        C6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EF
        CEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF}
      OnClick = CardBtnClick
      AutoGrayScale = False
      HotGlyph.Data = {
        66090000424D660900000000000036000000280000001C0000001C0000000100
        18000000000030090000330B0000330B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFB58484B58484B58484B58484B58484B58484B58484B58484B5
        8484B58484B58484B58484B58484B58484B58484B58484B58484B58484B58484
        B58484B58484B58484FF00FFFF00FFFF00FFFF00FFFF00FFCEADA5FEFEFDFEFE
        FDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFCFCFBFAFAF9F8F8F7F6F6F5F4F4F3F2
        F2F1F0F0EFEEEEEDECECEBEAEAE9E8E8E7E4E4E3DFDFDEDBDBDAD6D6D6B58484
        FF00FFFF00FFFF00FFEFCEC6FEFEFDFEFEFDFEFEFDBC0C18B80C18B40B17B00B
        16AC0B16A80A15A40A14A00A149E0A149B09139909139609129309129109128E
        08118B0811890810860810DBDBDADBDBDAD6D6D6B58484FF00FFFF00FFEFCEC6
        FEFEFDFEFEFD0090F434ACFF30AAFF2CA8FF28A6FF24A4FF20A3FF1EA2FF1BA1
        FF19A0FF169FFF149EFF119DFF0F9CFF0C9BFF0A9AFF0799FF0598FF0090F400
        90F4DFDFDEDBDBDAB58484FF00FFFF00FFEFCEC6FEFEFD0090F434ACFF38AEFF
        34ACFF30AAFF2CA8FF28A6FF24A4FF20A3FF1EA2FF1BA1FF19A0FF169FFF149E
        FF119DFF0F9CFF0C9BFF0A9AFF0799FF0598FF0090F40090F4DFDFDEB58484FF
        00FFFF00FFEFCEC6FEFEFD0090F434ACFF3DAFFF38AEFF34ACFF30AAFF2CA8FF
        28A6FF24A4FF20A3FF1EA2FF1BA1FF19A0FF169FFF149EFF119DFF0F9CFF0C9B
        FF0A9AFF0799FF0090F40090F4E4E4E3B58484FF00FFFF00FFEFCEC6FEFEFDFE
        FEFDFEFEFDFEFEFDFEFEFDFEFEFD965C0FA499A2FFFFFF840810A77C5DD2CAC8
        840810840810D2CAC8840810FFFFFFFFFFFF840810F1F1F0EEEEEDECECEBEAEA
        E9E8E8E7B58484FF00FFFF00FFEFCEC6FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
        FEFD840810840810FFFFFFA77C5D840810965C0FC5AD9BA77C5D840810840810
        A77C5DA77C5D840810F3F3F2F1F1F0EFEFEEEDEDECEBEBEAB58484FF00FFFF00
        FFEFCEC6FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD840810840810D2CAC8E9
        E6E4840810FFFFFFFFFFFFA77C5D840810D2CAC8840810A77C5D840810F5F5F4
        F3F3F2F1F1F0EFEFEEEDEDECB58484FF00FFFF00FFEFCEC6FEFEFDFEFEFDFEFE
        FDFEFEFDFEFEFDFEFEFD840810D2CAC8840810FFFFFF840810D2CAC884081084
        0810FFFFFFFFFFFFA499A2A77C5D840810F7F7F6F5F5F4F3F3F2F1F1F0EFEFEE
        B58484FF00FFFF00FFEFCEC6FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD8408
        10D2CAC8A77C5D840810A499A2A77C5D965C0F840810D2CAC8A499A2FFFFFF84
        0810840810F9F9F8F7F7F6F5F5F4F3F3F2F1F1F0B58484FF00FFFF00FFEFCEC6
        FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDA77C5DA77C5DFFFFFFFFFFFFA77C5DD2CA
        C8A77C5DFFFFFFA77C5D965C0FD2CAC8FFFFFFA77C5DA499A2FBFBFAF9F9F8F7
        F7F6F5F5F4F3F3F2B58484FF00FFFF00FFEFCEC6FEFEFDFCC0C4B10B16AD0B16
        AA0A15A60A15A30A14A00A149E0A149C09139A09139809139609129409129209
        129008118E08118C08118A0810880810860810840810FCC0C4F5F5F4B58484FF
        00FFFF00FFEFCEC6FEFEFDFCC0C4B40B17B10B16AD0B16AA0A15A60A15A30A14
        A00A149E0A149C09139A09139809139609129409129209129008118E08118C08
        118A0810880810860810FCC0C4F8F8F7B58484FF00FFFF00FFEFCEC6FEFEFDFC
        C0C4B80C18B40B17B10B16AD0B16AA0A15A60A15A30A14A00A149E0A149C0913
        9A09139809139609129409129209129008118E08118C08118A0810880810FCC0
        C4FAFAF9B58484FF00FFFF00FFEFCEC6FEFEFDFEFEFDFCC0C4B80C18B40B17B1
        0B16AD0B16AA0A15A60A15A30A14A00A149E0A149C09139A0913980913960912
        9409129209129008118E08118C0811FCC0C4FEFEFDFCFCFBB58484FF00FFFF00
        FFFF00FFEFCEC6FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
        FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FEFEFDFEFEFDFEFEFDCEADA5FF00FFFF00FFFF00FFFF00FFFF00FFEFCEC6EFCE
        C6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EF
        CEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF}
      LargeGlyph.Data = {
        66090000424D660900000000000036000000280000001C0000001C0000000100
        18000000000030090000330B0000330B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFB58484B58484B58484B58484B58484B58484B58484B58484B5
        8484B58484B58484B58484B58484B58484B58484B58484B58484B58484B58484
        B58484B58484B58484FF00FFFF00FFFF00FFFF00FFFF00FFCEADA5FEFEFDFEFE
        FDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFCFCFBFAFAF9F8F8F7F6F6F5F4F4F3F2
        F2F1F0F0EFEEEEEDECECEBEAEAE9E8E8E7E4E4E3DFDFDEDBDBDAD6D6D6B58484
        FF00FFFF00FFFF00FFEFCEC6FEFEFDFEFEFDFEFEFDBC0C18B80C18B40B17B00B
        16AC0B16A80A15A40A14A00A149E0A149B09139909139609129309129109128E
        08118B0811890810860810DBDBDADBDBDAD6D6D6B58484FF00FFFF00FFEFCEC6
        FEFEFDFEFEFD0090F434ACFF30AAFF2CA8FF28A6FF24A4FF20A3FF1EA2FF1BA1
        FF19A0FF169FFF149EFF119DFF0F9CFF0C9BFF0A9AFF0799FF0598FF0090F400
        90F4DFDFDEDBDBDAB58484FF00FFFF00FFEFCEC6FEFEFD0090F434ACFF38AEFF
        34ACFF30AAFF2CA8FF28A6FF24A4FF20A3FF1EA2FF1BA1FF19A0FF169FFF149E
        FF119DFF0F9CFF0C9BFF0A9AFF0799FF0598FF0090F40090F4DFDFDEB58484FF
        00FFFF00FFEFCEC6FEFEFD0090F434ACFF3DAFFF38AEFF34ACFF30AAFF2CA8FF
        28A6FF24A4FF20A3FF1EA2FF1BA1FF19A0FF169FFF149EFF119DFF0F9CFF0C9B
        FF0A9AFF0799FF0090F40090F4E4E4E3B58484FF00FFFF00FFEFCEC6FEFEFDFE
        FEFDFEFEFDFEFEFDFEFEFDFEFEFD965C0FA499A2FFFFFF840810A77C5DD2CAC8
        840810840810D2CAC8840810FFFFFFFFFFFF840810F1F1F0EEEEEDECECEBEAEA
        E9E8E8E7B58484FF00FFFF00FFEFCEC6FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
        FEFD840810840810FFFFFFA77C5D840810965C0FC5AD9BA77C5D840810840810
        A77C5DA77C5D840810F3F3F2F1F1F0EFEFEEEDEDECEBEBEAB58484FF00FFFF00
        FFEFCEC6FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD840810840810D2CAC8E9
        E6E4840810FFFFFFFFFFFFA77C5D840810D2CAC8840810A77C5D840810F5F5F4
        F3F3F2F1F1F0EFEFEEEDEDECB58484FF00FFFF00FFEFCEC6FEFEFDFEFEFDFEFE
        FDFEFEFDFEFEFDFEFEFD840810D2CAC8840810FFFFFF840810D2CAC884081084
        0810FFFFFFFFFFFFA499A2A77C5D840810F7F7F6F5F5F4F3F3F2F1F1F0EFEFEE
        B58484FF00FFFF00FFEFCEC6FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD8408
        10D2CAC8A77C5D840810A499A2A77C5D965C0F840810D2CAC8A499A2FFFFFF84
        0810840810F9F9F8F7F7F6F5F5F4F3F3F2F1F1F0B58484FF00FFFF00FFEFCEC6
        FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDA77C5DA77C5DFFFFFFFFFFFFA77C5DD2CA
        C8A77C5DFFFFFFA77C5D965C0FD2CAC8FFFFFFA77C5DA499A2FBFBFAF9F9F8F7
        F7F6F5F5F4F3F3F2B58484FF00FFFF00FFEFCEC6FEFEFDFCC0C4B10B16AD0B16
        AA0A15A60A15A30A14A00A149E0A149C09139A09139809139609129409129209
        129008118E08118C08118A0810880810860810840810FCC0C4F5F5F4B58484FF
        00FFFF00FFEFCEC6FEFEFDFCC0C4B40B17B10B16AD0B16AA0A15A60A15A30A14
        A00A149E0A149C09139A09139809139609129409129209129008118E08118C08
        118A0810880810860810FCC0C4F8F8F7B58484FF00FFFF00FFEFCEC6FEFEFDFC
        C0C4B80C18B40B17B10B16AD0B16AA0A15A60A15A30A14A00A149E0A149C0913
        9A09139809139609129409129209129008118E08118C08118A0810880810FCC0
        C4FAFAF9B58484FF00FFFF00FFEFCEC6FEFEFDFEFEFDFCC0C4B80C18B40B17B1
        0B16AD0B16AA0A15A60A15A30A14A00A149E0A149C09139A0913980913960912
        9409129209129008118E08118C0811FCC0C4FEFEFDFCFCFBB58484FF00FFFF00
        FFFF00FFEFCEC6FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
        FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FEFEFDFEFEFDFEFEFDCEADA5FF00FFFF00FFFF00FFFF00FFFF00FFEFCEC6EFCE
        C6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EF
        CEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6EFCEC6FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF}
    end
  end
  object ManHospitalDataset: TpFIBDataSet
    Database = MainDataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      
        '    MH.ID_MAN_HOSP,MH.ID_PCARD, MH.SERIA,MH.NOMER,MH.ILNESS_NOTE' +
        'S, MH.DATE_BEG,'
      
        '    MH.DATE_END, MH.VOPL, MH.ID_PARENT, MH."PERCENT",MH.KOD,MH.I' +
        'LLNESS_TYPE,'
      
        '    MH.ENDING, MH.ID_ILLCAUSE, MH.ID_WORK_MODE, MH.SHIFT, MH.HOS' +
        'P_VERSION,'
      
        '    DHR.num_reestr ||'#39'\'#39'|| CAST (EXTRACT(YEAR FROM DHR.date_rees' +
        'tr) AS VARCHAR(4)) as num_reestr'
      'FROM MAN_HOSPITAL MH'
      'LEFT JOIN hosp_reestr_data HRD ON MH.id_man_hosp=HRD.id_hosp'
      'left JOIN dt_hosp_reestr DHR   ON HRD.id_reestr=DHR.id_reestr'
      'WHERE ID_PCARD=:ID_PCARD')
    DataSource = DataSource
    AfterOpen = ManHospitalDatasetAfterOpen
    Left = 240
    Top = 232
    poSQLINT64ToBCD = True
  end
  object ManHospitalDataSource: TDataSource
    DataSet = ManHospitalDataset
    Left = 200
    Top = 232
  end
  object ManHolidayDataSource: TDataSource
    DataSet = ManHolidayDataSet
    Left = 200
    Top = 288
  end
  object ManHolidayDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT * FROM Z_GET_MAN_HOLIDAYS(:RMOVING)')
    DataSource = ManMovingDataSource
    AfterOpen = ManHolidayDataSetAfterOpen
    Left = 240
    Top = 288
    poSQLINT64ToBCD = True
  end
  object GetBegEndQuery: TpFIBQuery
    Database = MainDataBase
    SQL.Strings = (
      'SELECT DATE_BEG,DATE_END FROM Z_GET_BEG_END(:RMOVING);')
    Transaction = ReadTransaction
    Left = 200
    Top = 336
  end
  object MainDataBase: TpFIBDatabase
    DBName = 'localhost:DneprActual'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 8
    Top = 88
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = MainDataBase
    TimeoutAction = TACommit
    Left = 40
    Top = 88
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 541
    Top = 16
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clGradientInactiveCaption
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
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object PPSStyle: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsItalic]
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
    object GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle18
      Styles.ContentEven = cxStyle19
      Styles.ContentOdd = cxStyle20
      Styles.Inactive = cxStyle26
      Styles.IncSearch = cxStyle27
      Styles.Selection = cxStyle30
      Styles.FilterBox = cxStyle21
      Styles.Footer = cxStyle22
      Styles.Group = cxStyle23
      Styles.GroupByBox = cxStyle24
      Styles.Header = cxStyle25
      Styles.Indicator = cxStyle28
      Styles.Preview = cxStyle29
      Styles.BandBackground = cxStyle16
      Styles.BandHeader = cxStyle17
      BuiltIn = True
    end
  end
  object GetCurPeriod: TpFIBQuery
    Database = MainDataBase
    SQL.Strings = (
      'SELECT YEAR_SET,MONTH_SET'
      'FROM   Z_SETUP')
    Transaction = ReadTransaction
    Left = 152
    Top = 151
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object GetMonthBoundsQuery: TpFIBQuery
    Database = MainDataBase
    SQL.Strings = (
      'SELECT  MONTH_BEG,MONTH_END '
      'FROM GET_MONTH_BOUNDS(:YEAR,:MONTH)')
    Transaction = ReadTransaction
    Left = 152
    Top = 120
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object GetSystemQuery: TpFIBQuery
    Database = MainDataBase
    SQL.Strings = (
      'SELECT IS_UNIVER'
      'FROM Z_SETUP')
    Transaction = ReadTransaction
    Left = 152
    Top = 192
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object GetHandsAvgQuery: TpFIBDataSet
    Database = MainDataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT AVG_SUM'
      'FROM Z_HOLIDAYS_HANDS_AVG '
      'WHERE ID_MAN_HOLIDAY=?ID_MAN_HOLIDAY')
    Left = 704
    Top = 479
    poSQLINT64ToBCD = True
    object GetHandsAvgQueryAVG_SUM: TFIBBCDField
      FieldName = 'AVG_SUM'
      Size = 2
      RoundByScale = True
    end
  end
  object UpdateAvgQuery: TpFIBQuery
    Database = MainDataBase
    SQL.Strings = (
      'EXECUTE PROCEDURE Z_UPDATE_HOL_AVG_PAYMENT(:ID_MAN_HOLIDAY,'
      ':AVG_SUM)')
    Transaction = WriteTransaction
    Left = 742
    Top = 478
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = MainDataBase
    TimeoutAction = TARollback
    Left = 80
    Top = 87
  end
end
