object frmMainReportPercentPay: TfrmMainReportPercentPay
  Left = 497
  Top = 224
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmMainReportPercentPay'
  ClientHeight = 377
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 0
    Top = 80
    Width = 319
    Height = 19
    Progress = 0
  end
  object cxGroupBoxPeriodStud: TcxGroupBox
    Left = 0
    Top = 0
    Width = 320
    Height = 45
    Alignment = alTopLeft
    Caption = 'cxGroupBoxPeriodStud'
    TabOrder = 8
  end
  object cxButtonFilter: TcxButton
    Left = 0
    Top = 48
    Width = 320
    Height = 25
    Caption = 'cxButtonFilter'
    TabOrder = 1
    OnClick = cxButtonFilterClick
  end
  object cxButtonRun: TcxButton
    Left = 0
    Top = 102
    Width = 100
    Height = 25
    Caption = 'cxButtonRun'
    Default = True
    TabOrder = 2
    OnClick = cxButtonRunClick
  end
  object cxButtonCancel: TcxButton
    Left = 144
    Top = 102
    Width = 75
    Height = 25
    Caption = 'cxButtonCancel'
    TabOrder = 3
    Visible = False
  end
  object cxButtonQuit: TcxButton
    Left = 245
    Top = 102
    Width = 75
    Height = 25
    Caption = 'cxButtonQuit'
    TabOrder = 4
    OnClick = cxButtonQuitClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 358
    Width = 321
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object cxButtonView: TcxButton
    Left = 0
    Top = 325
    Width = 318
    Height = 25
    Caption = 'cxButtonView'
    TabOrder = 7
    OnClick = cxButtonViewClick
  end
  object cxLabelPriodBegin: TcxLabel
    Left = 8
    Top = 17
    Width = 114
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
  end
  object cxLabelPeriodEnd: TcxLabel
    Left = 157
    Top = 17
    Width = 111
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
  end
  object cxDateEditPeriodEnd: TcxDateEdit
    Left = 181
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object cxDateEditPeriodBegin: TcxDateEdit
    Left = 29
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Grid: TcxGrid
    Left = 1
    Top = 136
    Width = 318
    Height = 185
    TabOrder = 6
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    object GridDBView: TcxGridDBTableView
      DataController.DataModeController.GridMode = True
      DataController.DataModeController.SmartRefresh = True
      DataController.DataSource = DataSourcePrintSetup
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DevExpress_Style
      object SelectField: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        DataBinding.FieldName = 'RxSelectField'
      end
      object NameField: TcxGridDBColumn
        Options.Editing = False
        DataBinding.FieldName = 'RxNameField'
      end
    end
    object GridLevel: TcxGridLevel
      GridView = GridDBView
    end
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 56
    Top = 173
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 88
    Top = 173
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 120
    Top = 173
  end
  object Styles: TcxStyleRepository
    Left = 616
    Top = 160
    object BackGround: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object FocusedRecord: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 11037222
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clDefault
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Header: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object DesabledRecord: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 13875838
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = 15850428
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15850428
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
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14531001
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object Default_StyleSheet: TcxGridTableViewStyleSheet
      Styles.Background = BackGround
      Styles.Content = BackGround
      Styles.ContentEven = cxStyle1
      Styles.ContentOdd = cxStyle2
      Styles.Inactive = DesabledRecord
      Styles.Selection = FocusedRecord
      Styles.Header = Header
      BuiltIn = True
    end
    object DevExpress_Style: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle3
      Styles.Content = cxStyle4
      Styles.ContentEven = cxStyle5
      Styles.ContentOdd = cxStyle6
      Styles.Inactive = cxStyle12
      Styles.IncSearch = cxStyle13
      Styles.Selection = cxStyle16
      Styles.FilterBox = cxStyle7
      Styles.Footer = cxStyle8
      Styles.Group = cxStyle9
      Styles.GroupByBox = cxStyle10
      Styles.Header = cxStyle11
      Styles.Indicator = cxStyle14
      Styles.Preview = cxStyle15
      BuiltIn = True
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 24
    Top = 200
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 152
    Top = 173
  end
  object pFIBDataSetSetup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from cn_ini_print_report')
    Left = 56
    Top = 200
    poSQLINT64ToBCD = True
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from cn_ini_print_report')
    Left = 72
    Top = 336
    poSQLINT64ToBCD = True
  end
  object DataSourcePrintSetup: TDataSource
    DataSet = RxMemoryDataPrintSetup
    Left = 72
    Top = 302
  end
  object pFIBDataSetPrintSetup: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from cn_ini_print_setup'
      'order by ORD_FIELD DESC')
    Left = 72
    Top = 268
    poSQLINT64ToBCD = True
  end
  object RxMemoryDataPrintSetup: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxSelectField'
        DataType = ftSmallint
      end
      item
        Name = 'RxNameField'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'RxNameVariant'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RxLenghtField'
        DataType = ftInteger
      end
      item
        Name = 'RxOrdFileds'
        DataType = ftSmallint
      end>
    Left = 104
    Top = 268
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 200
    Top = 275
    object cxStyle17: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 11037222
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clDefault
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor]
      Color = 13875838
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor]
      Color = 15850428
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15850428
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14531001
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Styles.Background = cxStyle17
      Styles.Content = cxStyle17
      Styles.ContentEven = cxStyle21
      Styles.ContentOdd = cxStyle22
      Styles.Inactive = cxStyle20
      Styles.Selection = cxStyle18
      Styles.Header = cxStyle19
      BuiltIn = True
    end
    object cxGridTableViewStyleSheet2: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle23
      Styles.Content = cxStyle24
      Styles.ContentEven = cxStyle25
      Styles.ContentOdd = cxStyle26
      Styles.Inactive = cxStyle32
      Styles.IncSearch = cxStyle33
      Styles.Selection = cxStyle36
      Styles.FilterBox = cxStyle27
      Styles.Footer = cxStyle28
      Styles.Group = cxStyle29
      Styles.GroupByBox = cxStyle30
      Styles.Header = cxStyle31
      Styles.Indicator = cxStyle34
      Styles.Preview = cxStyle35
      BuiltIn = True
    end
  end
  object ActionList1: TActionList
    Left = 216
    Top = 176
    object ActionRun: TAction
      Caption = 'ActionRun'
      ShortCut = 121
      OnExecute = ActionRunExecute
    end
    object ActionView: TAction
      Caption = 'ActionView'
      ShortCut = 123
      OnExecute = ActionViewExecute
    end
    object ActionParam: TAction
      Caption = 'ActionParam'
      ShortCut = 118
      OnExecute = ActionParamExecute
    end
    object isDebug_act: TAction
      Caption = 'isDebug_act'
      ShortCut = 57412
      OnExecute = isDebug_actExecute
    end
  end
  object pFIBDataSetInitDate: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select PUB_SYS_DATA.cn_date_start,PUB_SYS_DATA.cn_end_month from' +
        ' PUB_SYS_DATA')
    Left = 184
    Top = 173
    poSQLINT64ToBCD = True
  end
end
