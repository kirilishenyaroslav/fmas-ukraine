object frmMainReportsSubsPay: TfrmMainReportsSubsPay
  Left = 423
  Top = 301
  Width = 578
  Height = 487
  Caption = #1056#1077#1077#1089#1090' '#1089#1091#1073#1089#1080#1076#1080#1088#1091#1077#1084#1099#1093
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
  object GroupBoxDate: TGroupBox
    Left = 0
    Top = 0
    Width = 562
    Height = 35
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 12
      Width = 53
      Height = 13
      Caption = #1055#1077#1088#1110#1086#1076'    '#1047
    end
    object Label3: TLabel
      Left = 313
      Top = 14
      Width = 12
      Height = 13
      Caption = #1076#1086
    end
    object DateTimePickerBegin: TDateTimePicker
      Left = 128
      Top = 9
      Width = 177
      Height = 21
      Date = 38353.692908379630000000
      Time = 38353.692908379630000000
      TabOrder = 0
    end
    object DateTimePickerEnd: TDateTimePicker
      Left = 328
      Top = 9
      Width = 177
      Height = 21
      Date = 38718.692908379630000000
      Time = 38718.692908379630000000
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 35
    Width = 562
    Height = 36
    Align = alTop
    TabOrder = 1
    object Gauge1: TGauge
      Left = 2
      Top = 15
      Width = 558
      Height = 19
      Align = alClient
      Progress = 0
    end
  end
  object GroupBoxMainParam: TGroupBox
    Left = 0
    Top = 71
    Width = 562
    Height = 40
    Align = alTop
    TabOrder = 2
    object ButtonMainParam: TButton
      Left = 6
      Top = 10
      Width = 555
      Height = 25
      Caption = 'ButtonMainParam'
      TabOrder = 0
      OnClick = ButtonMainParamClick
    end
  end
  object GroupBoxButton: TGroupBox
    Left = 0
    Top = 111
    Width = 562
    Height = 36
    Align = alTop
    TabOrder = 3
    object BitBtnOK: TBitBtn
      Left = 208
      Top = 8
      Width = 129
      Height = 25
      TabOrder = 0
      OnClick = BitBtnOKClick
      Kind = bkOK
    end
    object BitBtnCancel: TBitBtn
      Left = 352
      Top = 8
      Width = 100
      Height = 25
      Enabled = False
      TabOrder = 1
      OnClick = BitBtnCancelClick
      Kind = bkCancel
    end
    object BitBtnClose: TBitBtn
      Left = 456
      Top = 8
      Width = 100
      Height = 25
      TabOrder = 2
      OnClick = BitBtnCloseClick
      Kind = bkClose
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 392
    Width = 562
    Height = 38
    Align = alBottom
    TabOrder = 4
    object ButtonView: TButton
      Left = 457
      Top = 9
      Width = 100
      Height = 25
      Caption = 'ButtonView'
      Enabled = False
      TabOrder = 0
      OnClick = ButtonViewClick
    end
    object RadioGroupTypePrint: TRadioGroup
      Left = 0
      Top = 0
      Width = 303
      Height = 38
      Columns = 2
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 430
    Width = 562
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object cxGridPrintGroup: TcxGrid
    Left = 0
    Top = 203
    Width = 562
    Height = 189
    Align = alClient
    TabOrder = 6
    object cxGridPrintGroupDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSourcePrintSetup
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleYellow
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = cxStyle4
      Styles.IncSearch = cxStyleYellow
      Styles.Selection = cxStyleMalin
      Styles.FilterBox = cxStyleYellow
      Styles.Footer = cxStyleYellow
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      Styles.Indicator = cxStyleYellow
      Styles.NewItemRowInfoText = cxStyleYellow
      Styles.Preview = cxStyleYellow
      object CxSelectField: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 132
        DataBinding.FieldName = 'RxSelectField'
      end
      object CxNameField: TcxGridDBColumn
        Options.Editing = False
        Width = 393
        DataBinding.FieldName = 'RxNameField'
      end
    end
    object cxGridPrintGroupLevel1: TcxGridLevel
      GridView = cxGridPrintGroupDBTableView1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 147
    Width = 562
    Height = 56
    Align = alTop
    TabOrder = 7
    object cxCheckBoxPropi: TcxCheckBox
      Left = 8
      Top = 8
      Width = 257
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1042#1088#1072#1093#1086#1074#1091#1074#1072#1090#1080' '#1087#1088#1086#1087#1080#1089#1082#1091' '#1085#1072' '#1089#1100#1086#1075#1086#1076#1085#1110
      State = cbsChecked
      TabOrder = 0
    end
    object cxCheckBoxDateSubs: TcxCheckBox
      Left = 8
      Top = 32
      Width = 153
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1089#1091#1073#1089#1080#1076#1110#1111
      State = cbsChecked
      TabOrder = 1
      OnClick = cxCheckBoxDateSubsClick
    end
    object DateTimePickerSubs: TDateTimePicker
      Left = 224
      Top = 32
      Width = 186
      Height = 21
      Date = 38777.436962870370000000
      Time = 38777.436962870370000000
      TabOrder = 2
    end
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 64
    Top = 256
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 96
    Top = 256
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 64
    Top = 288
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 99
    Top = 290
  end
  object pFIBDataSetPrintSetup: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from st_ini_print_setup'
      'order by ORD_FIELD DESC')
    Left = 128
    Top = 300
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
    Left = 160
    Top = 300
  end
  object DataSourcePrintSetup: TDataSource
    DataSet = RxMemoryDataPrintSetup
    Left = 128
    Top = 334
  end
  object StyleRepository: TcxStyleRepository
    Left = 40
    Top = 336
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
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
  object Timer1: TTimer
    Enabled = False
    Left = 8
    Top = 338
  end
  object ActionList1: TActionList
    Left = 216
    Top = 272
    object act_debug: TAction
      Caption = 'act_debug'
      ShortCut = 57412
      OnExecute = act_debugExecute
    end
  end
end
