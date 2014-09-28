object frmReportsNarush: TfrmReportsNarush
  Left = 688
  Top = 253
  Width = 540
  Height = 431
  Caption = 'frmReportsNarush'
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
    Top = 374
    Width = 524
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
    Width = 524
    Height = 35
    Align = alTop
    TabOrder = 1
    object LabelDateRun: TLabel
      Left = 8
      Top = 12
      Width = 69
      Height = 13
      Caption = 'LabelDateRun'
    end
    object LabelDateEnd: TLabel
      Left = 288
      Top = 12
      Width = 69
      Height = 13
      Caption = 'LabelDateRun'
    end
    object DateTimePickerRun: TDateTimePicker
      Left = 152
      Top = 9
      Width = 129
      Height = 21
      Date = 38406.692908379630000000
      Time = 38406.692908379630000000
      TabOrder = 0
    end
    object DateTimePickerEnd: TDateTimePicker
      Left = 328
      Top = 9
      Width = 129
      Height = 21
      Date = 38406.692908379630000000
      Time = 38406.692908379630000000
      TabOrder = 1
    end
  end
  object GroupBoxMainParam: TGroupBox
    Left = 0
    Top = 35
    Width = 524
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
    Top = 111
    Width = 524
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
    object cxCheckBoxPrintUkrName: TcxCheckBox
      Left = 8
      Top = 10
      Width = 185
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 3
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 75
    Width = 524
    Height = 36
    Align = alTop
    TabOrder = 4
    object Gauge1: TGauge
      Left = 2
      Top = 15
      Width = 520
      Height = 19
      Align = alClient
      Progress = 0
    end
  end
  object GroupBoxPrintFilter: TGroupBox
    Left = 0
    Top = 149
    Width = 524
    Height = 187
    Align = alBottom
    Caption = 'GroupBoxPrintFilter'
    TabOrder = 5
    object cxGridPrintGroup: TcxGrid
      Left = 2
      Top = 15
      Width = 520
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
    Top = 336
    Width = 524
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
    Top = 24
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 464
    Top = 24
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 432
    Top = 56
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 467
    Top = 58
  end
  object StyleRepository: TcxStyleRepository
    Left = 16
    Top = 208
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
    Top = 244
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
    Top = 244
  end
  object DataSourcePrintSetup: TDataSource
    DataSet = RxMemoryDataPrintSetup
    Left = 112
    Top = 278
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 48
    Top = 210
  end
end
