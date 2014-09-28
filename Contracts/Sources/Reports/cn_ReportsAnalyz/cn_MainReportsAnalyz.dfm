object frmMainReportsAnalyz: TfrmMainReportsAnalyz
  Left = 643
  Top = 251
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmMainReportsAnalyz'
  ClientHeight = 483
  ClientWidth = 328
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
    Width = 321
    Height = 45
    Alignment = alTopLeft
    Caption = 'cxGroupBoxPeriodStud'
    TabOrder = 0
    object cxDateEditPeriodBegin: TcxDateEdit
      Left = 28
      Top = 15
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object cxDateEditPeriodEnd: TcxDateEdit
      Left = 180
      Top = 15
      Width = 121
      Height = 21
      TabOrder = 1
    end
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
    Left = 128
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
  object Grid: TcxGrid
    Left = 1
    Top = 221
    Width = 315
    Height = 167
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 464
    Width = 328
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object cxRadioGrouptypeRep: TcxRadioGroup
    Left = -1
    Top = 396
    Width = 320
    Height = 32
    ItemIndex = 0
    Properties.Columns = 2
    Properties.Items = <
      item
      end
      item
      end>
    TabOrder = 7
    Caption = ''
  end
  object cxButtonView: TcxButton
    Left = 0
    Top = 427
    Width = 318
    Height = 25
    Caption = 'cxButtonView'
    TabOrder = 8
    OnClick = cxButtonViewClick
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 128
    Width = 321
    Height = 84
    Alignment = alTopLeft
    TabOrder = 5
    object CheckBoxOverPay: TCheckBox
      Left = 8
      Top = 40
      Width = 201
      Height = 17
      Caption = 'CheckBoxOverPay'
      TabOrder = 2
    end
    object CheckBoxPay: TCheckBox
      Left = 8
      Top = 24
      Width = 201
      Height = 17
      Caption = 'CheckBoxPay'
      TabOrder = 1
    end
    object CheckBoxZad: TCheckBox
      Left = 8
      Top = 8
      Width = 193
      Height = 17
      Caption = 'CheckBoxZad'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 56
      Width = 320
      Height = 27
      TabOrder = 3
    end
    object CheckBoxAll: TCheckBox
      Left = 8
      Top = 64
      Width = 201
      Height = 17
      Caption = 'CheckBoxAll'
      TabOrder = 4
      OnClick = CheckBoxAllClick
    end
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 72
    Top = 276
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 104
    Top = 276
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 276
  end
  object Styles: TcxStyleRepository
    Left = 104
    Top = 343
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
  object pFIBDataSetPrintSetup: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from cn_ini_print_setup'
      'order by ORD_FIELD DESC')
    Left = 72
    Top = 312
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
    Top = 312
  end
  object DataSourcePrintSetup: TDataSource
    DataSet = RxMemoryDataPrintSetup
    Left = 72
    Top = 346
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 40
    Top = 359
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 168
    Top = 276
  end
  object pFIBDataSetSetup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from cn_ini_print_report')
    Left = 72
    Top = 375
    poSQLINT64ToBCD = True
  end
  object ActionList1: TActionList
    Left = 201
    Top = 277
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
    Left = 236
    Top = 277
    poSQLINT64ToBCD = True
  end
end
