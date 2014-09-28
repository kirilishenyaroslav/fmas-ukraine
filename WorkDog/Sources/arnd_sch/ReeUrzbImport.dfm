object FormExport: TFormExport
  Left = 504
  Top = 233
  Width = 826
  Height = 605
  Caption = #1045#1082#1089#1087#1086#1088#1090' '#1074' '#1089#1080#1089#1090#1077#1084#1091' "'#1054#1073#1083#1110#1082' '#1087#1086#1076#1072#1090#1082#1086#1074#1080#1093' '#1085#1072#1082#1083#1072#1076#1085#1080#1093'"'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 509
    Width = 810
    Height = 58
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 576
      Top = 19
      Width = 85
      Height = 25
      Action = Action1
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 673
      Top = 19
      Width = 88
      Height = 25
      Action = Action2
      TabOrder = 1
    end
    object cxLabel1: TcxLabel
      Left = 40
      Top = 3
      Width = 304
      Height = 17
      TabOrder = 2
      Caption = '- '#1079#1072#1087#1080#1089' '#1085#1077' '#1073#1091#1076#1077' '#1077#1082#1089#1087#1086#1088#1090#1086#1074#1072#1085', '#1088#1077#1108#1089#1090#1088' '#1085#1077' '#1110#1089#1085#1091#1108' '
    end
    object cxImage1: TcxImage
      Left = 19
      Top = 2
      Width = 20
      Height = 19
      Style.Color = 8421631
      TabOrder = 3
    end
    object cxImage2: TcxImage
      Left = 19
      Top = 20
      Width = 20
      Height = 19
      Style.Color = 4440060
      TabOrder = 4
    end
    object cxLabel2: TcxLabel
      Left = 40
      Top = 21
      Width = 256
      Height = 17
      TabOrder = 5
      Caption = '- '#1079#1072#1087#1080#1089' '#1085#1077' '#1073#1091#1076#1077' '#1077#1082#1089#1087#1086#1088#1090#1086#1074#1072#1085', '#1088#1077#1108#1089#1090#1088' '#1087#1110#1076#1087#1080#1089#1072#1085#1080#1081'.'
    end
    object cxLabel3: TcxLabel
      Left = 40
      Top = 40
      Width = 329
      Height = 17
      TabOrder = 6
      Caption = '- '#1079#1072#1087#1080#1089' '#1073#1091#1076#1077' '#1087#1086#1074#1090#1086#1088#1085#1086' '#1077#1082#1089#1087#1086#1088#1090#1086#1074#1072#1085', '#1088#1077#1077#1089#1090#1088' '#1074#1078#1077' '#1110#1089#1085#1091#1108' '#1074' '#1089#1080#1089#1090#1077#1084#1110'.'
    end
    object cxImage3: TcxImage
      Left = 19
      Top = 38
      Width = 20
      Height = 19
      Style.Color = 16777111
      TabOrder = 7
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 810
    Height = 33
    Align = alTop
    Caption = #1045#1082#1089#1087#1086#1088#1090' '#1074' '#1089#1080#1089#1090#1077#1084#1091' "'#1054#1073#1083#1110#1082' '#1087#1086#1076#1072#1090#1082#1086#1074#1080#1093' '#1085#1072#1082#1083#1072#1076#1085#1080#1093'"'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 33
    Width = 810
    Height = 476
    Align = alClient
    BevelInner = bvNone
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
    object cxGrid2TableView1: TcxGridTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ShowEditButtons = gsebForFocusedRecord
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = cxGridTableViewStyleSheet1
      Styles.OnGetContentStyle = cxGrid2TableView1StylesGetContentStyle
      object cxGrid2TableView1ColumnNumRee: TcxGridColumn
        Caption = #1053#1086#1084#1077#1088' '#1088#1077#1108#1089#1090#1088#1091
        Options.Editing = False
        Width = 72
      end
      object cxGrid2TableView1ColumnIs_signature: TcxGridColumn
        Caption = #1055#1110#1076#1087#1080#1089
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = True
        Properties.ValueChecked = 1
        Properties.ValueGrayed = 'null'
        Properties.ValueUnchecked = 0
        Options.Editing = False
        Options.Filtering = False
        Width = 65
      end
      object cxGrid2TableView1ColumnPeriod: TcxGridColumn
        Caption = #1055#1077#1088#1110#1086#1076
        Options.Editing = False
        Width = 50
      end
      object cxGrid2TableView1ColumnNumSch: TcxGridColumn
        Caption = #1055#1086#1090#1086#1095#1085#1080#1081' '#1085#1086#1084#1077#1088
        Options.Editing = False
        Width = 63
      end
      object cxGrid2TableView1ColumnNumReeTi: TcxGridColumn
        Caption = #1055#1077#1088#1077#1076#1073#1072#1095#1077#1085#1080#1081' '#1085#1086#1084#1077#1088
        SortOrder = soAscending
        Width = 93
      end
      object cxGrid2TableView1ColumnDataSch: TcxGridColumn
        Caption = #1044#1072#1090#1072' '#1074#1080#1087#1080#1089#1082#1080
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 87
      end
      object cxGrid2TableView1ColumnContragent: TcxGridColumn
        Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
        Width = 378
      end
      object cxGrid2TableView1ColumIdSch: TcxGridColumn
        Visible = False
        Width = 55
      end
      object cxGrid2TableView1ColumnTypeRow: TcxGridColumn
        Visible = False
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGrid2TableView1
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 784
    Top = 184
    object cxStyle27: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14084566
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clYellow
      TextColor = clBlack
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle49: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle50: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle51: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle52: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle53: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle54: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle55: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle56: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle57: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle58: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle59: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle60: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle61: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle62: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle63: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle64: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle65: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle66: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle67: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle68: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 8421631
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 4440060
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = 16777111
    end
    object TreeListStyleSheetDevExpress: TcxTreeListStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle27
      Styles.Content = cxStyle31
      Styles.Inactive = cxStyle35
      Styles.Selection = cxStyle39
      Styles.BandBackground = cxStyle28
      Styles.BandHeader = cxStyle29
      Styles.ColumnHeader = cxStyle30
      Styles.ContentEven = cxStyle32
      Styles.ContentOdd = cxStyle33
      Styles.Footer = cxStyle34
      Styles.IncSearch = cxStyle36
      Styles.Indicator = cxStyle37
      Styles.Preview = cxStyle38
      BuiltIn = True
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle27
      Styles.Content = cxStyle31
      Styles.ContentEven = cxStyle32
      Styles.ContentOdd = cxStyle33
      Styles.Inactive = cxStyle35
      Styles.IncSearch = cxStyle36
      Styles.Selection = cxStyle39
      Styles.FilterBox = cxStyle30
      Styles.Footer = cxStyle34
      Styles.Group = cxStyle40
      Styles.GroupByBox = cxStyle30
      Styles.Header = cxStyle30
      Styles.Indicator = cxStyle37
      Styles.Preview = cxStyle38
      BuiltIn = True
    end
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=SYSDBA'
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 128
    Top = 142
  end
  object DataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from DOG_DT_ARND_SCH_SEL(:id_group,:id_user)')
    Left = 128
    Top = 96
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = DataSet
    Left = 96
    Top = 96
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 32
    Top = 94
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 64
    Top = 94
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 192
    Top = 96
  end
  object ActionList1: TActionList
    Left = 328
    Top = 264
    object Action1: TAction
      Caption = #1045#1082#1089#1087#1086#1088#1090#1091#1074#1072#1090#1080
      ShortCut = 13
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1072
      ShortCut = 27
      OnExecute = Action2Execute
    end
  end
end
