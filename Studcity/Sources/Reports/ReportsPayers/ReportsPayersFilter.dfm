object frmReportsPayersFilter: TfrmReportsPayersFilter
  Left = 293
  Top = 164
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmReportsPayersFilter'
  ClientHeight = 473
  ClientWidth = 531
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
  object Label1: TLabel
    Left = 8
    Top = 38
    Width = 69
    Height = 13
    Caption = 'LabelDateRun'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 454
    Width = 531
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object GroupBoxDate: TGroupBox
    Left = 0
    Top = 0
    Width = 531
    Height = 63
    Align = alTop
    TabOrder = 1
    object LabelDateRun: TLabel
      Left = 8
      Top = 12
      Width = 69
      Height = 13
      Caption = 'LabelDateRun'
    end
    object DateTimePickerRun: TDateTimePicker
      Left = 344
      Top = 9
      Width = 177
      Height = 21
      Date = 38406.692908379630000000
      Time = 38406.692908379630000000
      TabOrder = 0
      OnChange = DateTimePickerRunChange
    end
    object CheckBoxDateDoc: TCheckBox
      Left = 8
      Top = 35
      Width = 241
      Height = 22
      Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1086#1087#1083#1072#1090#1099' '#1085#1072' '#1076#1072#1090#1091
      TabOrder = 1
    end
  end
  object GroupBoxMainParam: TGroupBox
    Left = 0
    Top = 63
    Width = 531
    Height = 40
    Align = alTop
    TabOrder = 2
    object ButtonMainParam: TButton
      Left = 8
      Top = 8
      Width = 513
      Height = 25
      Caption = 'ButtonMainParam'
      TabOrder = 0
      OnClick = ButtonMainParamClick
    end
  end
  object GroupBoxButton: TGroupBox
    Left = 0
    Top = 139
    Width = 531
    Height = 36
    Align = alTop
    TabOrder = 3
    object BitBtnOK: TBitBtn
      Left = 216
      Top = 8
      Width = 100
      Height = 25
      TabOrder = 0
      OnClick = BitBtnOKClick
      Kind = bkOK
    end
    object BitBtnCancel: TBitBtn
      Left = 320
      Top = 8
      Width = 100
      Height = 25
      Enabled = False
      TabOrder = 1
      OnClick = BitBtnCancelClick
      Kind = bkCancel
    end
    object BitBtnClose: TBitBtn
      Left = 424
      Top = 8
      Width = 100
      Height = 25
      TabOrder = 2
      OnClick = BitBtnCloseClick
      Kind = bkClose
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 103
    Width = 531
    Height = 36
    Align = alTop
    TabOrder = 4
    object Gauge1: TGauge
      Left = 2
      Top = 15
      Width = 527
      Height = 19
      Align = alClient
      Progress = 0
    end
  end
  object GroupBoxPrintFilter: TGroupBox
    Left = 0
    Top = 236
    Width = 531
    Height = 180
    Align = alBottom
    Caption = 'GroupBoxPrintFilter'
    TabOrder = 5
    object cxGridPrintGroup: TcxGrid
      Left = 2
      Top = 15
      Width = 527
      Height = 163
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
    Top = 416
    Width = 531
    Height = 38
    Align = alBottom
    TabOrder = 6
    object ButtonView: TButton
      Left = 417
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
      Width = 329
      Height = 38
      Columns = 2
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 175
    Width = 531
    Height = 59
    Align = alTop
    TabOrder = 7
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
    object CheckBoxPay: TCheckBox
      Left = 8
      Top = 24
      Width = 201
      Height = 17
      Caption = 'CheckBoxPay'
      TabOrder = 1
    end
    object CheckBoxOverPay: TCheckBox
      Left = 8
      Top = 40
      Width = 201
      Height = 17
      Caption = 'CheckBoxOverPay'
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
    Left = 432
    Top = 89
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 464
    Top = 89
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 432
    Top = 121
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 467
    Top = 123
  end
  object StyleRepository: TcxStyleRepository
    Left = 16
    Top = 273
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
    Left = 112
    Top = 309
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
    Left = 144
    Top = 309
  end
  object DataSourcePrintSetup: TDataSource
    DataSet = RxMemoryDataPrintSetup
    Left = 112
    Top = 278
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Top = 373
  end
end
