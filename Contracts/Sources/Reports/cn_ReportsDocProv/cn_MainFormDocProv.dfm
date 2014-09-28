object frmMainFormDocProv: TfrmMainFormDocProv
  Left = 468
  Top = 186
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmMainFormDocProv'
  ClientHeight = 480
  ClientWidth = 323
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
    Top = 99
    Width = 319
    Height = 19
    Progress = 0
  end
  object cxGroupBoxPeriodStud: TcxGroupBox
    Left = 0
    Top = 0
    Width = 322
    Height = 67
    Alignment = alTopLeft
    Caption = 'cxGroupBoxPeriodStud'
    TabOrder = 0
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
      TabOrder = 2
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
      TabOrder = 3
    end
    object cxDateEditPeriodBegin: TcxDateEdit
      Left = 29
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object cxDateEditPeriodEnd: TcxDateEdit
      Left = 181
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object cxCheckBoxNotExistsProvGet: TcxCheckBox
      Left = 0
      Top = 40
      Width = 247
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 4
    end
  end
  object cxButtonFilter: TcxButton
    Left = 0
    Top = 69
    Width = 320
    Height = 25
    Caption = 'cxButtonFilter'
    TabOrder = 1
    OnClick = cxButtonFilterClick
  end
  object cxButtonQuit: TcxButton
    Left = 245
    Top = 123
    Width = 75
    Height = 25
    Caption = 'cxButtonQuit'
    TabOrder = 4
    OnClick = cxButtonQuitClick
  end
  object cxButtonCancel: TcxButton
    Left = 120
    Top = 123
    Width = 81
    Height = 25
    Caption = 'cxButtonCancel'
    TabOrder = 3
    Visible = False
  end
  object cxButtonRun: TcxButton
    Left = 0
    Top = 123
    Width = 100
    Height = 25
    Caption = 'cxButtonRun'
    Default = True
    TabOrder = 2
    OnClick = cxButtonRunClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 152
    Width = 320
    Height = 35
    Alignment = alTopLeft
    TabOrder = 5
  end
  object cxCheckBoxSm: TcxCheckBox
    Left = 8
    Top = 162
    Width = 153
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1057' '#1088#1072#1079#1073#1080#1074#1082#1086#1081' '#1087#1086' '#1089#1084#1077#1090#1072#1084
    State = cbsChecked
    TabOrder = 6
  end
  object cxCheckBoxSch: TcxCheckBox
    Left = 160
    Top = 161
    Width = 161
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1057' '#1088#1072#1079#1073#1080#1074#1082#1086#1081' '#1087#1086' '#1089#1095#1077#1090#1072#1084
    TabOrder = 7
  end
  object Grid: TcxGrid
    Left = 1
    Top = 191
    Width = 318
    Height = 169
    TabOrder = 8
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
  object cxRadioGrouptypeRep: TcxRadioGroup
    Left = -1
    Top = 367
    Width = 320
    Height = 52
    ItemIndex = 0
    Properties.Columns = 2
    Properties.Items = <
      item
      end
      item
      end
      item
      end
      item
      end>
    TabOrder = 9
    Caption = ''
  end
  object cxButtonView: TcxButton
    Left = 0
    Top = 428
    Width = 318
    Height = 25
    Caption = 'cxButtonView'
    TabOrder = 10
    OnClick = cxButtonViewClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 461
    Width = 323
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 72
    Top = 239
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 104
    Top = 239
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 239
  end
  object Styles: TcxStyleRepository
    Left = 200
    Top = 282
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
    Top = 275
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
    Top = 275
  end
  object DataSourcePrintSetup: TDataSource
    DataSet = RxMemoryDataPrintSetup
    Left = 72
    Top = 309
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 40
    Top = 327
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 168
    Top = 239
  end
  object pFIBDataSetSetup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from cn_ini_print_report')
    Left = 72
    Top = 343
    poSQLINT64ToBCD = True
  end
  object ActionList1: TActionList
    Left = 200
    Top = 239
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
    object ActionDebug: TAction
      Caption = 'ActionDebug'
      ShortCut = 49220
      OnExecute = ActionDebugExecute
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
    Left = 232
    Top = 239
    poSQLINT64ToBCD = True
  end
end
