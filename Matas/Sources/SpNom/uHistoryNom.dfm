object HistoryNomForm: THistoryNomForm
  Left = 475
  Top = 240
  Width = 664
  Height = 480
  Caption = #1030#1089#1090#1086#1088#1110#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 656
    Height = 60
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 14
      Top = 15
      Width = 38
      Height = 13
      Caption = #1053#1072#1079#1074#1072
    end
    object lbl2: TLabel
      Left = 207
      Top = 40
      Width = 15
      Height = 13
      Caption = #1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxName: TcxTextEdit
      Left = 65
      Top = 11
      Width = 432
      Height = 21
      Properties.ReadOnly = False
      TabOrder = 0
    end
    object cxShow: TcxButton
      Left = 517
      Top = 9
      Width = 120
      Height = 25
      Caption = #1042#1110#1076#1110#1073#1088#1072#1090#1080
      TabOrder = 1
      OnClick = cxShowClick
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        660021A335006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF656565949494656565FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF00660024A53912A92028B040006600FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565659696968F8F8F9E9E9E
        656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660027A73E1E
        B43218AE2913AB2227AF3E006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF6565659999999B9B9B9595959191919D9D9D656565FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0066001F99312EC04A26BA3E1FB53419AF2B13AB2325AE3C0066
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF6565658E8E8EA9A9A9A2A2A29C9C9C969696
        9191919B9B9B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066001D952E3FCE6337C8572F
        C14C25A63B00660029B14114AC2524AD3A006600FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565658B8B
        8BB8B8B8B1B1B1AAAAAA9797976565659F9F9F9292929A9A9A656565FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        0066001A902A4FDA7948D56F40CF642FB34A006600FF00FF0066001CB22F15AC
        2622AC38006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF656565878787C6C6C6C0C0C0B9B9B9A3A3A3656565FF00FF
        656565999999929292999999656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF00660059E28955E08250DB7B36BC5500
        6600FF00FFFF00FFFF00FF006600148D2117AE2721AB36006600FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565CFCFCFCCCC
        CCC7C7C7ABABAB656565FF00FFFF00FFFF00FF65656582828294949498989865
        6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        00660031B04D5BE48A3ABF5B006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF00660018AE2920AA34006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF656565A2A2A2D1D1D1AEAEAE656565FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF656565959595979797656565FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660047CF6D006600FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660019AF2B14AB23006600
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565BDBD
        BD656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF65656596
        9696919191656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF0066000B7E1314AB24006600FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF656565FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF656565767676919191656565FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
        118D1D006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF656565818181656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF00660008790F006600FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565657272726565
        65FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      UseSystemPaint = False
    end
    object Period: TcxCheckBox
      Left = 11
      Top = 36
      Width = 82
      Height = 21
      Properties.DisplayChecked = 'False'
      Properties.OnChange = PeriodPropertiesChange
      Properties.Caption = #1055#1077#1088#1110#1086#1076' '#1079
      State = cbsChecked
      TabOrder = 2
    end
    object cxFilterDateBeg: TcxDateEdit
      Left = 92
      Top = 36
      Width = 110
      Height = 21
      Properties.ShowTime = False
      Style.LookAndFeel.Kind = lfUltraFlat
      TabOrder = 3
      EditValue = 0d
    end
    object cxFilterDateEnd: TcxDateEdit
      Left = 229
      Top = 36
      Width = 110
      Height = 21
      Properties.ShowTime = False
      Style.LookAndFeel.Kind = lfUltraFlat
      TabOrder = 4
      EditValue = 0d
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 60
    Width = 656
    Height = 226
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = ds1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxGrid1DBTableView1FocusedRecordChanged
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Styles.Header = cxStyle8
      object cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1055'/'#1040#1050#1058
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'DATE_DOC'
      end
      object cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1050#1086#1084#1091
        Options.Editing = False
        Options.Filtering = False
        Width = 200
        DataBinding.FieldName = 'FIO_MO_IN'
      end
      object cxgrdbclmnGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Caption = #1042#1110#1076' '#1082#1086#1075#1086
        Options.Editing = False
        Options.Filtering = False
        Width = 200
        DataBinding.FieldName = 'FIO_MO_OUT'
      end
      object cxgrdbclmnGrid1DBTableView1DBColumn4: TcxGridDBColumn
        Caption = #1057#1091#1084#1072
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'SUMMA'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 294
    Width = 656
    Height = 154
    Align = alBottom
    TabOrder = 2
    object cxGrid2DBTableView1: TcxGridDBTableView
      DataController.DataSource = ds2
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Styles.Header = cxStyle8
      object cxgrdbclmnName: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        Options.Editing = False
        Options.Filtering = False
        SortOrder = soAscending
        DataBinding.FieldName = 'NAME'
      end
      object cxgrdbclmnSCH: TcxGridDBColumn
        Caption = #1056#1072#1093#1091#1085#1086#1082
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'SCH_NUMBER'
      end
      object cxgrdbclmnKOL: TcxGridDBColumn
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'KOL_MAT'
      end
      object cxgrdbclmnSumma: TcxGridDBColumn
        Caption = #1057#1091#1084#1072
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'SUMMA'
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 286
    Width = 656
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 100
    AlignSplitter = salBottom
    AutoSnap = True
    ResizeUpdate = True
    Control = cxGrid2
  end
  object StyleRepository: TcxStyleRepository
    Left = 7
    Top = 64
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
  end
  object ds1: TDataSource
    DataSet = DS_History
    Left = 8
    Top = 104
  end
  object DB_History: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = TR_History
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 50
    Top = 106
  end
  object DS_History: TpFIBDataSet
    Database = DB_History
    Transaction = TR_History
    SelectSQL.Strings = (
      'SELECT * FROM MAT_HISTORY_SP_NOM_POS(:PNAME)')
    Left = 92
    Top = 106
    poSQLINT64ToBCD = True
    object DS_HistoryID_DOC: TFIBBCDField
      FieldName = 'ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object DS_HistoryID_TIPD: TFIBBCDField
      FieldName = 'ID_TIPD'
      Size = 0
      RoundByScale = True
    end
    object DS_HistoryTIPD: TFIBStringField
      FieldName = 'TIPD'
      Size = 15
      EmptyStrToNull = True
    end
    object DS_HistoryNAME_TIPD: TFIBStringField
      FieldName = 'NAME_TIPD'
      Size = 50
      EmptyStrToNull = True
    end
    object DS_HistoryKOD_DOC: TFIBSmallIntField
      FieldName = 'KOD_DOC'
    end
    object DS_HistoryNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object DS_HistoryDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object DS_HistoryOSN_ID_TIPD: TFIBBCDField
      FieldName = 'OSN_ID_TIPD'
      Size = 0
      RoundByScale = True
    end
    object DS_HistoryOTIPD: TFIBStringField
      FieldName = 'OTIPD'
      Size = 15
      EmptyStrToNull = True
    end
    object DS_HistoryNAME_OSN: TFIBStringField
      FieldName = 'NAME_OSN'
      Size = 50
      EmptyStrToNull = True
    end
    object DS_HistoryOSN_NUM_DOC: TFIBStringField
      FieldName = 'OSN_NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object DS_HistoryOSN_DATE_DOC: TFIBDateField
      FieldName = 'OSN_DATE_DOC'
    end
    object DS_HistoryID_MO_IN: TFIBBCDField
      FieldName = 'ID_MO_IN'
      Size = 0
      RoundByScale = True
    end
    object DS_HistoryFIO_MO_IN: TFIBStringField
      FieldName = 'FIO_MO_IN'
      Size = 100
      EmptyStrToNull = True
    end
    object DS_HistoryFIO_IN: TFIBStringField
      FieldName = 'FIO_IN'
      Size = 62
      EmptyStrToNull = True
    end
    object DS_HistoryNAME_DEP_IN: TFIBStringField
      FieldName = 'NAME_DEP_IN'
      Size = 255
      EmptyStrToNull = True
    end
    object DS_HistoryID_MO_OUT: TFIBBCDField
      FieldName = 'ID_MO_OUT'
      Size = 0
      RoundByScale = True
    end
    object DS_HistoryFIO_MO_OUT: TFIBStringField
      FieldName = 'FIO_MO_OUT'
      Size = 100
      EmptyStrToNull = True
    end
    object DS_HistoryFIO_OUT: TFIBStringField
      FieldName = 'FIO_OUT'
      Size = 62
      EmptyStrToNull = True
    end
    object DS_HistoryNAME_DEP_OUT: TFIBStringField
      FieldName = 'NAME_DEP_OUT'
      Size = 255
      EmptyStrToNull = True
    end
    object DS_HistoryID_CUST: TFIBBCDField
      FieldName = 'ID_CUST'
      Size = 0
      RoundByScale = True
    end
    object DS_HistoryNAME_CUSTOMER: TFIBStringField
      FieldName = 'NAME_CUSTOMER'
      Size = 180
      EmptyStrToNull = True
    end
    object DS_HistoryOKPO_CUSTOMER: TFIBStringField
      FieldName = 'OKPO_CUSTOMER'
      Size = 16
      EmptyStrToNull = True
    end
    object DS_HistoryNAME_IN: TFIBStringField
      FieldName = 'NAME_IN'
      Size = 255
      EmptyStrToNull = True
    end
    object DS_HistoryNAME_OUT: TFIBStringField
      FieldName = 'NAME_OUT'
      Size = 255
      EmptyStrToNull = True
    end
    object DS_HistorySUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DS_HistorySUMMA_DOC: TFIBBCDField
      FieldName = 'SUMMA_DOC'
      Size = 2
      RoundByScale = True
    end
    object DS_HistoryID_MAN: TFIBBCDField
      FieldName = 'ID_MAN'
      Size = 0
      RoundByScale = True
    end
    object DS_HistoryFIO_MAN: TFIBStringField
      FieldName = 'FIO_MAN'
      Size = 62
      EmptyStrToNull = True
    end
    object DS_HistorySFIO_MAN: TFIBStringField
      FieldName = 'SFIO_MAN'
      Size = 50
      EmptyStrToNull = True
    end
    object DS_HistoryDOV_NUM: TFIBStringField
      FieldName = 'DOV_NUM'
      Size = 15
      EmptyStrToNull = True
    end
    object DS_HistoryDOV_DATE: TFIBDateField
      FieldName = 'DOV_DATE'
    end
    object DS_HistoryDATE_REC: TFIBDateField
      FieldName = 'DATE_REC'
    end
    object DS_HistoryPERIOD: TFIBStringField
      FieldName = 'PERIOD'
      Size = 10
      EmptyStrToNull = True
    end
    object DS_HistoryPUB_ID_DOC: TFIBBCDField
      FieldName = 'PUB_ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object DS_HistoryNUM_REESTR: TFIBStringField
      FieldName = 'NUM_REESTR'
      Size = 15
      EmptyStrToNull = True
    end
    object DS_HistoryDATE_REESTR: TFIBDateField
      FieldName = 'DATE_REESTR'
    end
    object DS_HistoryUSER_NAME: TFIBStringField
      FieldName = 'USER_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DS_HistoryCOMPUTER: TFIBStringField
      FieldName = 'COMPUTER'
      Size = 15
      EmptyStrToNull = True
    end
    object DS_HistoryDATETIME: TFIBDateTimeField
      FieldName = 'DATETIME'
    end
    object DS_HistoryDIR_KOMISSIA: TFIBStringField
      FieldName = 'DIR_KOMISSIA'
      Size = 50
      EmptyStrToNull = True
    end
    object DS_HistoryKOMISSIA: TFIBStringField
      FieldName = 'KOMISSIA'
      Size = 255
      EmptyStrToNull = True
    end
    object DS_HistoryNUM_PRIKAZ_KOMISSIA: TFIBStringField
      FieldName = 'NUM_PRIKAZ_KOMISSIA'
      Size = 15
      EmptyStrToNull = True
    end
    object DS_HistoryDATE_PRIKAZ_KOMISSIA: TFIBDateField
      FieldName = 'DATE_PRIKAZ_KOMISSIA'
    end
    object DS_HistoryDOC_NOTE: TFIBStringField
      FieldName = 'DOC_NOTE'
      Size = 255
      EmptyStrToNull = True
    end
    object DS_HistoryINV_KART_MODE: TFIBIntegerField
      FieldName = 'INV_KART_MODE'
    end
    object DS_HistoryMNA_KART_MODE: TFIBIntegerField
      FieldName = 'MNA_KART_MODE'
    end
    object DS_HistoryIKOL_MAT: TFIBBCDField
      FieldName = 'IKOL_MAT'
      Size = 4
      RoundByScale = True
    end
    object DS_HistoryIKOL_DOC: TFIBBCDField
      FieldName = 'IKOL_DOC'
      Size = 4
      RoundByScale = True
    end
    object DS_HistoryCOUNT_POS: TFIBIntegerField
      FieldName = 'COUNT_POS'
    end
    object DS_HistoryPUB_ID_USER: TFIBBCDField
      FieldName = 'PUB_ID_USER'
      Size = 0
      RoundByScale = True
    end
    object DS_HistoryPUB_USER_NAME: TFIBStringField
      FieldName = 'PUB_USER_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DS_HistoryPUB_USER_FULL_NAME: TFIBStringField
      FieldName = 'PUB_USER_FULL_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DS_HistoryPUB_COMPUTER: TFIBStringField
      FieldName = 'PUB_COMPUTER'
      Size = 255
      EmptyStrToNull = True
    end
    object DS_HistoryPUB_DATETIME: TFIBDateTimeField
      FieldName = 'PUB_DATETIME'
    end
    object DS_HistoryTIP_WORK: TFIBIntegerField
      FieldName = 'TIP_WORK'
    end
  end
  object SP_History: TpFIBStoredProc
    Database = DB_History
    Transaction = TR_History
    Left = 50
    Top = 142
  end
  object TR_History: TpFIBTransaction
    DefaultDatabase = DB_History
    TimeoutAction = TARollback
    Left = 92
    Top = 143
  end
  object DS_Pos: TpFIBDataSet
    Database = DB_History
    Transaction = TR_History
    SelectSQL.Strings = (
      'SELECT * FROM MAT_DT_DOC_POS_SEL(?ID_DOC) ORDER BY NAME')
    DataSource = ds1
    Left = 49
    Top = 334
    poSQLINT64ToBCD = True
  end
  object ds2: TDataSource
    DataSet = DS_Pos
    Left = 14
    Top = 330
  end
end
