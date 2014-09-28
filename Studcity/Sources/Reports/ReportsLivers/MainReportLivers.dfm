object frmMainFormReportsLivers: TfrmMainFormReportsLivers
  Left = 450
  Top = 167
  Width = 601
  Height = 624
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'frmMainFormReportsLivers'
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 567
    Width = 585
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 100
      end>
  end
  object GroupBoxPrintFilter: TGroupBox
    Left = 0
    Top = 342
    Width = 585
    Height = 187
    Align = alBottom
    Caption = 'GroupBoxPrintFilter'
    TabOrder = 6
    object cxGridPrintGroup: TcxGrid
      Left = 2
      Top = 15
      Width = 581
      Height = 170
      Align = alClient
      TabOrder = 0
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
          SortOrder = soDescending
          Width = 393
          DataBinding.FieldName = 'RxNameField'
        end
      end
      object cxGridPrintGroupLevel1: TcxGridLevel
        GridView = cxGridPrintGroupDBTableView1
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 529
    Width = 585
    Height = 38
    Align = alBottom
    TabOrder = 8
    object ButtonView: TButton
      Left = 425
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
      Width = 361
      Height = 38
      Columns = 2
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 585
    Height = 36
    Align = alTop
    TabOrder = 9
    object Gauge1: TGauge
      Left = 2
      Top = 15
      Width = 581
      Height = 19
      Align = alClient
      Progress = 0
    end
  end
  object GroupBoxButton: TGroupBox
    Left = 0
    Top = 76
    Width = 585
    Height = 36
    Align = alTop
    TabOrder = 1
    object BitBtnOK: TBitBtn
      Left = 216
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
  object GroupBoxMainParam: TGroupBox
    Left = 0
    Top = 36
    Width = 585
    Height = 40
    Align = alTop
    TabOrder = 0
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
  object GroupBox1: TGroupBox
    Left = 308
    Top = 109
    Width = 277
    Height = 50
    TabOrder = 3
    object CheckBoxUkr: TCheckBox
      Left = 8
      Top = 8
      Width = 201
      Height = 17
      Caption = 'CheckBoxUkr'
      TabOrder = 0
    end
    object CheckBoxInostr: TCheckBox
      Left = 8
      Top = 24
      Width = 201
      Height = 17
      Caption = 'CheckBoxInostr'
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 110
    Width = 305
    Height = 49
    TabOrder = 2
    object ComboBoxStatus: TComboBox
      Left = 152
      Top = 16
      Width = 145
      Height = 21
      Color = 15204351
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        #1041#1077#1079' '#1087#1088#1086#1087#1080#1089#1082#1080
        #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1085#1099#1081
        #1055#1088#1086#1087#1080#1089#1072#1085
        #1042#1099#1087#1080#1089#1072#1085)
    end
    object cxCheckBoxStatus: TcxCheckBox
      Left = 0
      Top = 16
      Width = 145
      Height = 21
      Properties.DisplayUnchecked = 'False'
      State = cbsChecked
      TabOrder = 0
      OnClick = cxCheckBoxStatusClick
    end
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 200
    Width = 585
    Height = 142
    Align = alBottom
    TabOrder = 5
    object LabelRojBeg: TLabel
      Left = 217
      Top = 20
      Width = 61
      Height = 13
      Caption = 'LabelRojBeg'
    end
    object LabelRegBeg: TLabel
      Left = 217
      Top = 44
      Width = 65
      Height = 13
      Caption = 'LabelRegBeg'
    end
    object LabelPropBeg: TLabel
      Left = 217
      Top = 68
      Width = 67
      Height = 13
      Caption = 'LabelPropBeg'
    end
    object LabelPropEnd: TLabel
      Left = 377
      Top = 66
      Width = 75
      Height = 13
      Caption = 'LabelPropBegin'
    end
    object LabelRegEnd: TLabel
      Left = 377
      Top = 42
      Width = 65
      Height = 13
      Caption = 'LabelRegBeg'
    end
    object LabelRojEnd: TLabel
      Left = 377
      Top = 18
      Width = 69
      Height = 13
      Caption = 'LabelRojBegin'
    end
    object LabelDateRegBeg: TLabel
      Left = 217
      Top = 92
      Width = 67
      Height = 13
      Caption = 'LabelPropBeg'
    end
    object LabelDateRegEnd: TLabel
      Left = 377
      Top = 90
      Width = 75
      Height = 13
      Caption = 'LabelPropBegin'
    end
    object Label1: TLabel
      Left = 217
      Top = 116
      Width = 67
      Height = 13
      Caption = 'LabelPropBeg'
    end
    object Label2: TLabel
      Left = 377
      Top = 114
      Width = 75
      Height = 13
      Caption = 'LabelPropBegin'
    end
    object DateTimePickerDateRojEnd: TDateTimePicker
      Left = 400
      Top = 16
      Width = 122
      Height = 21
      Date = 38424.889488020830000000
      Time = 38424.889488020830000000
      Color = 15204351
      TabOrder = 2
    end
    object DateTimePickerDateRegEnd: TDateTimePicker
      Left = 400
      Top = 40
      Width = 122
      Height = 21
      Date = 38424.890168726850000000
      Time = 38424.890168726850000000
      Color = 15204351
      TabOrder = 6
    end
    object DateTimePickerDatePropEnd: TDateTimePicker
      Left = 400
      Top = 64
      Width = 122
      Height = 21
      Date = 38424.890353009250000000
      Time = 38424.890353009250000000
      Color = 15204351
      TabOrder = 10
    end
    object DateTimePickerDateRojBeg: TDateTimePicker
      Left = 248
      Top = 16
      Width = 122
      Height = 21
      Date = 38424.890883240740000000
      Time = 38424.890883240740000000
      Color = 15204351
      TabOrder = 1
    end
    object DateTimePickerDateRegBeg: TDateTimePicker
      Left = 248
      Top = 40
      Width = 122
      Height = 21
      Date = 38424.891239872680000000
      Time = 38424.891239872680000000
      Color = 15204351
      TabOrder = 5
    end
    object DateTimePickerDatePropBeg: TDateTimePicker
      Left = 248
      Top = 64
      Width = 122
      Height = 21
      Date = 38424.892016412040000000
      Time = 38424.892016412040000000
      Color = 15204351
      TabOrder = 9
    end
    object cxCheckBoxDateRog: TcxCheckBox
      Left = 0
      Top = 16
      Width = 217
      Height = 21
      Properties.DisplayUnchecked = 'False'
      State = cbsChecked
      TabOrder = 0
      OnClick = cxCheckBoxDateRogClick
    end
    object cxCheckBoxDateReg: TcxCheckBox
      Left = 0
      Top = 40
      Width = 217
      Height = 21
      Properties.DisplayUnchecked = 'False'
      State = cbsChecked
      TabOrder = 4
      OnClick = cxCheckBoxDateRegClick
    end
    object cxCheckBoxDateProp: TcxCheckBox
      Left = 0
      Top = 64
      Width = 217
      Height = 21
      Properties.DisplayUnchecked = 'False'
      State = cbsChecked
      TabOrder = 8
      OnClick = cxCheckBoxDatePropClick
    end
    object cxCheckBoxDateRogNo: TcxCheckBox
      Left = 520
      Top = 16
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 3
    end
    object cxCheckBoxDateRegNo: TcxCheckBox
      Left = 520
      Top = 40
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 7
    end
    object cxCheckBoxDatePropNo: TcxCheckBox
      Left = 520
      Top = 64
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 11
      Visible = False
    end
    object cxCheckBoxDateRegHist: TcxCheckBox
      Left = 0
      Top = 88
      Width = 217
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 12
      OnClick = cxCheckBoxDatePropClick
    end
    object DateTimePickerDateRegHistBeg: TDateTimePicker
      Left = 248
      Top = 88
      Width = 122
      Height = 21
      Date = 38424.892016412040000000
      Time = 38424.892016412040000000
      Color = 15204351
      TabOrder = 13
    end
    object DateTimePickerDateRegHistEnd: TDateTimePicker
      Left = 400
      Top = 88
      Width = 122
      Height = 21
      Date = 38424.890353009250000000
      Time = 38424.890353009250000000
      Color = 15204351
      TabOrder = 14
    end
    object CheckBox_date_reside: TcxCheckBox
      Left = 0
      Top = 112
      Width = 217
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 15
      OnClick = cxCheckBoxDatePropClick
    end
    object DateTimePicker_beg_reside: TDateTimePicker
      Left = 248
      Top = 112
      Width = 122
      Height = 21
      Date = 38424.892016412040000000
      Time = 38424.892016412040000000
      Color = 15204351
      TabOrder = 16
    end
    object DateTimePicker_end_reside: TDateTimePicker
      Left = 400
      Top = 112
      Width = 122
      Height = 21
      Date = 38424.890353009250000000
      Time = 38424.890353009250000000
      Color = 15204351
      TabOrder = 17
    end
  end
  object GroupBox6: TGroupBox
    Left = 0
    Top = 167
    Width = 585
    Height = 33
    Align = alBottom
    TabOrder = 4
    object cxCheckBoxOrder: TcxCheckBox
      Left = 0
      Top = 8
      Width = 225
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 0
    end
    object cxCheckBoxPrintUkrName: TcxCheckBox
      Left = 256
      Top = 8
      Width = 249
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 1
    end
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
  object pFIBDataSetPrintSetup: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from st_ini_print_setup'
      'order by ORD_FIELD DESC')
    Left = 128
    Top = 348
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
    Top = 348
  end
  object DataSourcePrintSetup: TDataSource
    DataSet = RxMemoryDataPrintSetup
    Left = 128
    Top = 382
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
    Left = 128
    Top = 216
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 160
    Top = 216
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 163
    Top = 250
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 128
    Top = 248
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 8
    Top = 418
  end
end
