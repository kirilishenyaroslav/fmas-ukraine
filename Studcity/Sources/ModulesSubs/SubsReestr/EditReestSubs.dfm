object frmEditReestrSubs: TfrmEditReestrSubs
  Left = 223
  Top = 60
  Width = 773
  Height = 632
  Caption = #1053#1086#1074#1099#1081' '#1089#1087#1080#1089#1086#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 337
    Top = 33
    Height = 428
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 579
    Width = 765
    Height = 19
    Panels = <>
  end
  object cxGridPR: TcxGrid
    Left = 0
    Top = 33
    Width = 337
    Height = 428
    Align = alLeft
    TabOrder = 1
    object cxGridPRDBTableView1: TcxGridDBTableView
      OnKeyDown = cxGridPRDBTableView1KeyDown
      DataController.DataSource = DataSourcePr
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1050#1110#1083#1100#1082#1110#1089#1090#1100':0'
          Kind = skCount
          FieldName = 'RxPRFIO'
          Column = FIOPr
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Background = frmMainFormListSubs.cxStyleYellow
      Styles.StyleSheet = frmMainFormListSubs.GridTableViewStyleSheetDevExpress
      Styles.Content = frmMainFormListSubs.cxStyleYellow
      Styles.ContentEven = frmMainFormListSubs.cxStyleYellow
      Styles.ContentOdd = frmMainFormListSubs.cxStyleYellow
      Styles.Inactive = frmMainFormListSubs.cxStyleSilver
      Styles.IncSearch = frmMainFormListSubs.cxStyleYellow
      Styles.Selection = frmMainFormListSubs.cxStyle4
      Styles.FilterBox = frmMainFormListSubs.cxStyleYellow
      Styles.Footer = frmMainFormListSubs.cxStyleBorder
      Styles.Group = frmMainFormListSubs.cxStyleYellow
      Styles.GroupByBox = frmMainFormListSubs.cxStyleYellow
      Styles.Header = frmMainFormListSubs.cxStyleBorder
      Styles.Indicator = frmMainFormListSubs.cxStyleYellow
      Styles.NewItemRowInfoText = frmMainFormListSubs.cxStyleYellow
      Styles.Preview = frmMainFormListSubs.cxStyleYellow
      object FIOPr: TcxGridDBColumn
        SortOrder = soAscending
        Width = 303
        DataBinding.FieldName = 'RxPRFIO'
      end
    end
    object cxGridPRLevel1: TcxGridLevel
      GridView = cxGridPRDBTableView1
    end
  end
  object cxGridList: TcxGrid
    Left = 465
    Top = 33
    Width = 300
    Height = 428
    Align = alClient
    TabOrder = 2
    object cxGridListDBTableView1: TcxGridDBTableView
      OnKeyDown = cxGridListDBTableView1KeyDown
      DataController.DataSource = DataSourceList
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1050#1110#1083#1100#1082#1110#1089#1090#1100':0'
          Kind = skCount
          FieldName = 'RxFIO'
          Column = FIOList
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Background = frmMainFormListSubs.cxStyleYellow
      Styles.StyleSheet = frmMainFormListSubs.GridTableViewStyleSheetDevExpress
      Styles.Content = frmMainFormListSubs.cxStyleYellow
      Styles.ContentEven = frmMainFormListSubs.cxStyleYellow
      Styles.ContentOdd = frmMainFormListSubs.cxStyleYellow
      Styles.Inactive = frmMainFormListSubs.cxStyleSilver
      Styles.IncSearch = frmMainFormListSubs.cxStyleYellow
      Styles.Selection = frmMainFormListSubs.cxStyle4
      Styles.FilterBox = frmMainFormListSubs.cxStyleYellow
      Styles.Footer = frmMainFormListSubs.cxStyleBorder
      Styles.Group = frmMainFormListSubs.cxStyleYellow
      Styles.GroupByBox = frmMainFormListSubs.cxStyleYellow
      Styles.Header = frmMainFormListSubs.cxStyleBorder
      Styles.Indicator = frmMainFormListSubs.cxStyleYellow
      Styles.NewItemRowInfoText = frmMainFormListSubs.cxStyleYellow
      Styles.Preview = frmMainFormListSubs.cxStyleYellow
      object FIOList: TcxGridDBColumn
        SortOrder = soAscending
        Width = 270
        DataBinding.FieldName = 'RxFIO'
      end
    end
    object cxGridListLevel1: TcxGridLevel
      GridView = cxGridListDBTableView1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 765
    Height = 33
    Align = alTop
    TabOrder = 3
    object LabelDateStart: TLabel
      Left = 8
      Top = 16
      Width = 86
      Height = 13
      Caption = 'LabelDateStart'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelBuilds: TLabel
      Left = 439
      Top = 12
      Width = 66
      Height = 13
      Caption = 'LabelBuilds'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DateTimePickerDatestart: TDateTimePicker
      Left = 168
      Top = 8
      Width = 145
      Height = 21
      Date = 38428.458169456020000000
      Time = 38428.458169456020000000
      Color = 15204351
      TabOrder = 0
      OnChange = DateTimePickerDatestartChange
      OnExit = DateTimePickerDatestartExit
      OnKeyDown = DateTimePickerDatestartKeyDown
    end
    object DBLookupComboBoxBuilds: TDBLookupComboBox
      Left = 568
      Top = 8
      Width = 193
      Height = 21
      Color = 15204351
      KeyField = 'ID_BUILD'
      ListField = 'SHORT_NAME'
      ListSource = DataSourceBuilds
      TabOrder = 1
      OnExit = DBLookupComboBoxBuildsExit
    end
  end
  object GroupBox2: TGroupBox
    Left = 340
    Top = 33
    Width = 125
    Height = 428
    Align = alLeft
    TabOrder = 4
    object ButtonRihgtAll: TcxButton
      Left = 12
      Top = 31
      Width = 105
      Height = 25
      Caption = 'ButtonRihgtAll'
      TabOrder = 0
      OnClick = ButtonRihgtAllClick
    end
    object ButtonLeftOne: TcxButton
      Left = 12
      Top = 55
      Width = 105
      Height = 25
      Caption = 'ButtonLeftOne'
      TabOrder = 1
      OnClick = ButtonLeftOneClick
    end
    object ButtonLeftAll: TcxButton
      Left = 12
      Top = 79
      Width = 105
      Height = 25
      Caption = 'ButtonLeftAll'
      TabOrder = 2
      OnClick = ButtonLeftAllClick
    end
    object ButtonSave: TcxButton
      Left = 12
      Top = 327
      Width = 105
      Height = 25
      Caption = 'ButtonSave'
      Default = True
      TabOrder = 3
      OnClick = ButtonSaveClick
    end
    object ButtonClose: TcxButton
      Left = 12
      Top = 351
      Width = 105
      Height = 25
      Cancel = True
      Caption = 'ButtonClose'
      TabOrder = 4
      OnClick = ButtonCloseClick
    end
  end
  object PanelProgress: TPanel
    Left = 264
    Top = 208
    Width = 257
    Height = 65
    Caption = 'PanelProgress'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Visible = False
    object GaugeProress: TGauge
      Left = 8
      Top = 40
      Width = 241
      Height = 20
      Progress = 0
    end
  end
  object cxMemoError: TcxMemo
    Left = 0
    Top = 461
    Width = 765
    Height = 118
    Align = alBottom
    Properties.ReadOnly = True
    Style.Color = clSilver
    TabOrder = 6
    Visible = False
  end
  object ButtonRihgtOne: TcxButton
    Left = 352
    Top = 40
    Width = 105
    Height = 25
    Caption = 'ButtonRihgtOne'
    TabOrder = 7
    OnClick = ButtonRihgtOneClick
  end
  object pFIBDataSetPR: TpFIBDataSet
    SelectSQL.Strings = (
      'select distinct *'
      'from '
      
        'ST_DT_LISTSUBS_PR_PEOPLE_SUBS(:param_list,:param_date,:param_bui' +
        'ld)'
      'order by FIO')
    Left = 96
    Top = 208
    poSQLINT64ToBCD = True
  end
  object DataSourceList: TDataSource
    DataSet = RxMemoryDataList
    Left = 552
    Top = 208
  end
  object pFIBDataSetList: TpFIBDataSet
    Database = frmMainFormListSubs.Database
    Transaction = frmMainFormListSubs.ReadTransaction
    SelectSQL.Strings = (
      
        'select st_dt_pfio.familia||'#39' '#39'||st_dt_pfio.imya||'#39' '#39'||st_dt_pfio' +
        '.otchestvo as FIO,st_dt_slate.*,'
      'st_dt_pfio.id_kod'
      'from st_dt_pfio,st_dt_slate'
      'where st_dt_pfio.id_kod=st_dt_slate.id_kod'
      'and st_dt_slate.id_list=:param_list'
      'order by familia,imya,otchestvo')
    Left = 520
    Top = 208
    poSQLINT64ToBCD = True
  end
  object DataSourcePr: TDataSource
    DataSet = RxMemoryDataPR
    Left = 128
    Top = 208
  end
  object RxMemoryDataList: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxFIO'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'RxFlagNew'
        DataType = ftInteger
      end
      item
        Name = 'RxID_PEOPLE'
        DataType = ftVariant
      end
      item
        Name = 'RxSUMMA'
        DataType = ftVariant
      end>
    Left = 584
    Top = 208
  end
  object DataSourceBuilds: TDataSource
    DataSet = pFIBDataSetBuilds
    Left = 592
    Top = 8
  end
  object pFIBDataSetBuilds: TpFIBDataSet
    Database = frmMainFormListSubs.Database
    Transaction = frmMainFormListSubs.ReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from st_sp_builds')
    Left = 624
    Top = 8
    poSQLINT64ToBCD = True
  end
  object pFIBDataSetDATAList: TpFIBDataSet
    Database = frmMainFormListSubs.Database
    Transaction = frmMainFormListSubs.ReadTransaction
    SelectSQL.Strings = (
      'select st_dt_slsub.*'
      'from st_dt_slsub'
      'where st_dt_slsub.id_list=:param_list')
    Left = 380
    Top = 176
    poSQLINT64ToBCD = True
  end
  object RxMemoryDataPR: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxPRID_PEOPLE'
        DataType = ftVariant
      end
      item
        Name = 'RxPRFIO'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'RxPRSumma'
        DataType = ftVariant
      end>
    Left = 160
    Top = 208
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = frmMainFormListSubs.Database
    Transaction = frmMainFormListSubs.WriteTransaction
    Left = 412
    Top = 296
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 256
    Top = 152
  end
  object pFIBDataSetConfig: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from st_ini')
    Left = 428
    Top = 177
    poSQLINT64ToBCD = True
  end
end
