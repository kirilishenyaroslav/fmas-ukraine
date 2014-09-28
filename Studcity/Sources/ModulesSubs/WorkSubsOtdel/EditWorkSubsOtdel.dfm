object frmEditWorkSubsOtdel: TfrmEditWorkSubsOtdel
  Left = 346
  Top = 176
  Width = 637
  Height = 493
  Caption = 'frmEditWorkSubsOtdel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 436
    Width = 621
    Height = 19
    Panels = <>
  end
  object cxGridPret: TcxGrid
    Left = 0
    Top = 0
    Width = 249
    Height = 387
    Align = alLeft
    TabOrder = 1
    object cxGridPretDBTableView1: TcxGridDBTableView
      OnKeyDown = cxGridPretDBTableView1KeyDown
      DataController.DataSource = DataSourcePret
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'RxFIO'
          Column = cxGridPretFIO
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = cxGridPretDBTableView1CellClick
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleYellow
      Styles.StyleSheet = GridTableViewStyleSheetDevExpress
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = cxStyleSilver
      Styles.IncSearch = cxStyleYellow
      Styles.Selection = cxStyle4
      Styles.FilterBox = cxStyleYellow
      Styles.Footer = cxStyle4
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      Styles.Indicator = cxStyleYellow
      Styles.NewItemRowInfoText = cxStyleYellow
      Styles.Preview = cxStyleYellow
      object cxGridPretFIO: TcxGridDBColumn
        SortOrder = soAscending
        Width = 153
        DataBinding.FieldName = 'RxFIO'
      end
    end
    object cxGridPretLevel1: TcxGridLevel
      GridView = cxGridPretDBTableView1
    end
  end
  object GroupBox1: TGroupBox
    Left = 249
    Top = 0
    Width = 128
    Height = 387
    Align = alLeft
    TabOrder = 2
    object ButtonRihgtAll: TcxButton
      Left = 12
      Top = 31
      Width = 105
      Height = 25
      Caption = 'ButtonRihgtAll'
      TabOrder = 1
      OnClick = ButtonRihgtAllClick
    end
    object ButtonLeftOne: TcxButton
      Left = 12
      Top = 55
      Width = 105
      Height = 25
      Caption = 'ButtonLeftOne'
      TabOrder = 2
      OnClick = ButtonLeftOneClick
    end
    object ButtonLeftAll: TcxButton
      Left = 12
      Top = 79
      Width = 105
      Height = 25
      Caption = 'ButtonLeftAll'
      TabOrder = 3
      OnClick = ButtonLeftAllClick
    end
    object ButtonSave: TcxButton
      Left = 12
      Top = 327
      Width = 105
      Height = 25
      Caption = 'ButtonSave'
      TabOrder = 4
      OnClick = ButtonSaveClick
    end
    object ButtonClose: TcxButton
      Left = 12
      Top = 351
      Width = 105
      Height = 25
      Cancel = True
      Caption = 'ButtonClose'
      TabOrder = 5
      OnClick = ButtonCloseClick
    end
    object ButtonRihgtOne: TcxButton
      Left = 12
      Top = 8
      Width = 105
      Height = 25
      Caption = 'ButtonRihgtOne'
      TabOrder = 0
      OnClick = ButtonRihgtOneClick
    end
  end
  object cxGridList: TcxGrid
    Left = 377
    Top = 0
    Width = 244
    Height = 387
    Align = alClient
    TabOrder = 3
    object cxGridDBTableView1: TcxGridDBTableView
      OnKeyDown = cxGridDBTableView1KeyDown
      DataController.DataSource = DataSourceWork
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'RxFIO'
          Column = cxGridWorkFIO
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = cxGridDBTableView1CellClick
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleYellow
      Styles.StyleSheet = GridTableViewStyleSheetDevExpress
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = cxStyleSilver
      Styles.IncSearch = cxStyleYellow
      Styles.Selection = cxStyle4
      Styles.FilterBox = cxStyleYellow
      Styles.Footer = cxStyle4
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      Styles.Indicator = cxStyleYellow
      Styles.NewItemRowInfoText = cxStyleYellow
      Styles.Preview = cxStyleYellow
      object cxGridWorkFIO: TcxGridDBColumn
        SortOrder = soAscending
        DataBinding.FieldName = 'RxFIO'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object PanelProgress: TPanel
    Left = 184
    Top = 160
    Width = 257
    Height = 65
    Caption = 'PanelProgress'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Visible = False
    object GaugeProress: TGauge
      Left = 8
      Top = 40
      Width = 241
      Height = 20
      Progress = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 387
    Width = 621
    Height = 49
    Align = alBottom
    TabOrder = 5
    object cxLabel1: TcxLabel
      Left = 8
      Top = 8
      Width = 255
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = 
        'cxLabel1                                                        ' +
        '            '
    end
    object cxLabel2: TcxLabel
      Left = 280
      Top = 8
      Width = 212
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = 'cxLabel2                                      '
    end
    object cxLabel3: TcxLabel
      Left = 8
      Top = 24
      Width = 171
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = 'cxLabel3                                        '
    end
    object cxLabel4: TcxLabel
      Left = 280
      Top = 24
      Width = 220
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = 'cxLabel4                                        '
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 176
    Top = 184
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15451300
      TextColor = clBlack
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
    object cxStyleSilver: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
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
  object pFIBDataSetPret: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT *'
      'FROM st_dt_rzlist'
      'WHERE st_dt_rzlist.id_list=:param_list'
      'AND st_dt_rzlist.id_kod=0'
      'ORDER BY FIO')
    Left = 104
    Top = 136
    poSQLINT64ToBCD = True
  end
  object pFIBDataSetWork: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT *'
      'FROM st_dt_rzlist'
      'WHERE st_dt_rzlist.id_list=:param_list'
      'AND st_dt_rzlist.id_kod<>0'
      'ORDER BY FIO')
    Left = 512
    Top = 136
    poSQLINT64ToBCD = True
  end
  object DataSourcePret: TDataSource
    DataSet = RxMemoryDataPR
    Left = 72
    Top = 136
  end
  object DataSourceWork: TDataSource
    DataSet = RxMemoryDataList
    Left = 480
    Top = 136
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 296
    Top = 256
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
        Name = 'RxID_Key'
        DataType = ftVariant
      end
      item
        Name = 'RxNumB'
        DataType = ftVariant
      end
      item
        Name = 'RxMonth'
        DataType = ftVariant
      end
      item
        Name = 'RxSumma'
        DataType = ftVariant
      end
      item
        Name = 'RxSubs'
        DataType = ftVariant
      end>
    AfterScroll = RxMemoryDataListAfterScroll
    Left = 480
    Top = 168
  end
  object RxMemoryDataPR: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxFIO'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'RxNumB'
        DataType = ftVariant
      end
      item
        Name = 'RxId_Key'
        DataType = ftVariant
      end
      item
        Name = 'RxMonth'
        DataType = ftVariant
      end
      item
        Name = 'RxSumma'
        DataType = ftVariant
      end
      item
        Name = 'RxSubs'
        DataType = ftVariant
      end>
    AfterScroll = RxMemoryDataPRAfterScroll
    Left = 72
    Top = 168
  end
  object pFIBDataSetCorrect: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT st_dt_pfio.*'
      'FROM st_dt_pfio'
      'WHERE st_dt_pfio.nom_act=:param_act')
    Left = 337
    Top = 256
    poSQLINT64ToBCD = True
  end
  object pFIBDataSetGetFamily: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select st_dt_pfio.familia||'#39' '#39'||st_dt_pfio.imya||'#39' '#39'||st_dt_pfio' +
        '.otchestvo as FIO'
      'from st_dt_pfio'
      'where st_dt_pfio.id_kod=:param_kod')
    Left = 480
    Top = 200
    poSQLINT64ToBCD = True
  end
  object ActionList1: TActionList
    Left = 257
    Top = 264
    object ActionSave: TAction
      Caption = 'ActionSave'
      ShortCut = 121
      OnExecute = ActionSaveExecute
    end
  end
end
