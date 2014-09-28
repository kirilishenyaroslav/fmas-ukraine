object FormAddOtch: TFormAddOtch
  Left = 533
  Top = 268
  BorderStyle = bsToolWindow
  ClientHeight = 447
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 200
    Top = 376
    Width = 14
    Height = 13
    Caption = #1074#1110#1076
  end
  object Label2: TLabel
    Left = 56
    Top = 376
    Width = 44
    Height = 13
    Caption = #1085#1072#1082#1072#1079' '#8470
  end
  object LabelPIB: TLabel
    Left = 120
    Top = 42
    Width = 257
    Height = 16
    AutoSize = False
    Caption = 'LabelPIB'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelCard: TLabel
    Left = 152
    Top = 96
    Width = 58
    Height = 13
    Caption = 'LabelCard'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelTypeDoc: TLabel
    Left = 152
    Top = 120
    Width = 83
    Height = 13
    Caption = 'LabelTypeDoc'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelSummaDoc: TLabel
    Left = 152
    Top = 144
    Width = 95
    Height = 13
    Caption = 'LabelSummaDoc'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EditNumDog: TEdit
    Left = 104
    Top = 376
    Width = 73
    Height = 21
    TabOrder = 0
    Text = 'EditNumDog'
  end
  object cxDateDogEdit: TcxDateEdit
    Left = 224
    Top = 376
    Width = 121
    Height = 21
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 1
  end
  object cxButton1: TcxButton
    Left = 224
    Top = 416
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 312
    Top = 416
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object cxLabel1: TcxLabel
    Left = 24
    Top = 40
    Width = 34
    Height = 20
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = #1055#1030#1041
  end
  object cxLabel2: TcxLabel
    Left = 24
    Top = 64
    Width = 94
    Height = 20
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    Caption = #1058#1080#1087' '#1074#1080#1087#1083#1072#1090
  end
  object cxGridBudget: TcxGrid
    Left = 24
    Top = 168
    Width = 353
    Height = 200
    TabOrder = 6
    Visible = False
    object cxGridBudgetDBTableView1: TcxGridDBTableView
      DataController.DataSource = DSourceBudget
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleYellow
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = cxStyle4
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle17
      Styles.FilterBox = cxStyleYellow
      Styles.Footer = cxStyleYellow
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      Styles.Indicator = cxStylemalinYellow
      Styles.NewItemRowInfoText = cxStyleYellow
      Styles.Preview = cxStyleYellow
      object cxGridBudgetDBTableView1DB_ALL_KOD: TcxGridDBColumn
        Caption = #1041#1102#1076#1078#1077#1090'/'#1056#1086#1079#1076#1110#1083'/'#1057#1090#1072#1090#1090#1103
        Options.Filtering = False
        Width = 174
        DataBinding.FieldName = 'ALL_KOD'
      end
      object cxGridBudgetDBTableView1DB_KEKV_KOD: TcxGridDBColumn
        Caption = #1050#1045#1050#1042
        Options.Filtering = False
        SortOrder = soDescending
        Width = 83
        DataBinding.FieldName = 'KEKV_KOD'
      end
      object cxGridBudgetDBTableView1DB_SUMMA: TcxGridDBColumn
        Caption = #1057#1091#1084#1072
        Options.Filtering = False
        Width = 70
        DataBinding.FieldName = 'SUMMA'
      end
    end
    object cxGridBudgetLevel1: TcxGridLevel
      GridView = cxGridBudgetDBTableView1
    end
  end
  object cxButtonEditTypeViplat: TcxButtonEdit
    Left = 120
    Top = 64
    Width = 257
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxButtonEditTypeViplatPropertiesButtonClick
    TabOrder = 7
    Text = 'cxButtonEditTypeViplat'
  end
  object cxLabel3: TcxLabel
    Left = 24
    Top = 88
    Width = 61
    Height = 20
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 8
    Caption = #1050#1072#1088#1090#1082#1072
  end
  object cxGridBudgeti: TcxGrid
    Left = 24
    Top = 168
    Width = 353
    Height = 201
    BevelInner = bvNone
    TabOrder = 9
    LookAndFeel.Kind = lfFlat
    object cxGridBudgetiTableView1: TcxGridTableView
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
      Styles.Background = cxStyleYellow
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = cxStyle4
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle17
      Styles.FilterBox = cxStyleYellow
      Styles.Footer = cxStyleYellow
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      Styles.Indicator = cxStylemalinYellow
      Styles.NewItemRowInfoText = cxStyleYellow
      Styles.Preview = cxStyleYellow
      object cxGridBudgetiTableView1_ALL_KOD: TcxGridColumn
        Caption = #1041#1102#1076#1078#1077#1090'/'#1056#1086#1079#1076#1110#1083'/'#1057#1090#1072#1090#1090#1103
        Options.Editing = False
        Width = 72
      end
      object cxGridBudgetiTableView1_KEKV_KOD: TcxGridColumn
        Caption = #1050#1045#1050#1042
        Options.Editing = False
        Options.Filtering = False
        Width = 65
      end
      object cxGridBudgetiTableView1_SUMMA: TcxGridColumn
        Caption = #1057#1091#1084#1072
        SortOrder = soAscending
        Width = 50
      end
      object cxGridBudgetiTableView1_ID_ALL_PROV: TcxGridColumn
        Visible = False
      end
      object cxGridBudgetiTableView1_id_sm: TcxGridColumn
        Visible = False
      end
      object cxGridBudgetiTableView1_id_razd: TcxGridColumn
        Visible = False
      end
      object cxGridBudgetiTableView1_id_st: TcxGridColumn
        Visible = False
      end
      object cxGridBudgetiTableView1_ID_KEKV: TcxGridColumn
        Visible = False
      end
    end
    object cxGridBudgetiLevel1: TcxGridLevel
      GridView = cxGridBudgetiTableView1
    end
  end
  object LabelNumDateDoc: TcxLabel
    Left = 24
    Top = 8
    Width = 369
    Height = 20
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
    Caption = #1055#1030#1041
  end
  object cxLabel5: TcxLabel
    Left = 24
    Top = 114
    Width = 119
    Height = 20
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
    Caption = #1090#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
  end
  object cxLabel6: TcxLabel
    Left = 24
    Top = 142
    Width = 129
    Height = 20
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 12
    Caption = #1089#1091#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
  end
  object DSetBudget: TpFIBDataSet
    Left = 152
    Top = 416
    poSQLINT64ToBCD = True
  end
  object Database: TpFIBDatabase
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 416
  end
  object Trans: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 80
    Top = 416
  end
  object DSourceBudget: TDataSource
    DataSet = DSetBudget
    Left = 184
    Top = 416
  end
  object StyleRepository: TcxStyleRepository
    Left = 792
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
  object TransWrite: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 112
    Top = 416
  end
  object pFIBStoredProc: TpFIBStoredProc
    Left = 24
    Top = 384
  end
end
