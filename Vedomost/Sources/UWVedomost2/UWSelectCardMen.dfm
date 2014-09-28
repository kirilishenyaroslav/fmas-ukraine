object fmSelectCardMen: TfmSelectCardMen
  Left = 288
  Top = 321
  Width = 855
  Height = 328
  Caption = #1054#1073#1077#1088#1110#1090#1100' '#1082#1072#1088#1090#1082#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 839
    Height = 249
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      DataController.DataSource = DSourceCardMen
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ScrollBars = ssHorizontal
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleYellow
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = cxStyle4
      Styles.IncSearch = cxStyle12
      Styles.Selection = cxStyleMalin
      Styles.FilterBox = cxStyleYellow
      Styles.Footer = cxStyleYellow
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      Styles.Indicator = cxStyleYellow
      Styles.NewItemRowInfoText = cxStyleYellow
      Styles.Preview = cxStyleYellow
      object cxGrid1DBTableView1DB_NUM_LIC_ACCAUNT: TcxGridDBColumn
        Caption = #1057#1050#1056
        Options.Filtering = False
        Width = 107
        DataBinding.FieldName = 'NUM_LIC_ACCAUNT'
      end
      object cxGrid1DBTableView1DB_NUM_DOG: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1091
        MinWidth = 124
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Width = 124
        DataBinding.FieldName = 'NUM_DOG'
      end
      object cxGrid1DBTableView1DB_DATE_DOG: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1091
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        SortOrder = soAscending
        Width = 110
        DataBinding.FieldName = 'DATE_DOG'
      end
      object cxGrid1DBTableView1DB_DATE_BEG: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
        Options.Filtering = False
        Width = 106
        DataBinding.FieldName = 'DATE_BEG'
      end
      object cxGrid1DBTableView1DB_DATE_END: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1082#1110#1085#1094#1103
        Options.Filtering = False
        Width = 83
        DataBinding.FieldName = 'DATE_END'
      end
      object cxGrid1DBTableView1DB_CONTROL_ID: TcxGridDBColumn
        Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1080#1081' '#1110#1076#1077#1085#1090#1080#1092#1110#1082#1072#1090#1086#1088
        Options.Filtering = False
        Width = 157
        DataBinding.FieldName = 'CONTROL_ID'
      end
      object cxGrid1DBTableView1DB_COMENT: TcxGridDBColumn
        Caption = #1050#1086#1084#1077#1085#1090#1072#1088
        Options.Filtering = False
        Width = 131
        DataBinding.FieldName = 'COMENT'
      end
      object cxGrid1DBTableView1DB_SHORT_NAME_TYPE_PAYMENT: TcxGridDBColumn
        Caption = #1041#1072#1085#1082
        Visible = False
        GroupIndex = 0
        Options.Filtering = False
        SortOrder = soAscending
        DataBinding.FieldName = 'SHORT_NAME_TYPE_PAYMENT'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 839
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 120
      Top = 16
      Width = 26
      Height = 16
      Caption = #1055#1030#1041
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelPIB: TLabel
      Left = 152
      Top = 16
      Width = 473
      Height = 16
      AutoSize = False
      Caption = 'LabelPIB'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 8
      Width = 91
      Height = 25
      Caption = #1054#1073#1088#1072#1090#1080
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000FF00FF00004B
        0000098611000A8615000D931A000C9518000C9C19000F991C000E9D1D001392
        240011A0210011A422001CA134001CB1350024BC430029B548002EC6520035CA
        5E0039D465000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000001
        0100000000000000000000000000010808010000000000000000000000010D0B
        080B0100000000000000000001100E0901040801000000000000000111120C01
        000103080100000000000000010F010000000001040100000000000000010000
        0000000001030100000000000000000000000000000001010000000000000000
        0000000000000001010000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 456
    Top = 8
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
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clDefault
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
  object ActionList1: TActionList
    Left = 696
    Top = 8
    object ActionClose: TAction
      Caption = 'ActionClose'
      ShortCut = 27
      OnExecute = ActionCloseExecute
    end
    object ActionTake: TAction
      Caption = 'ActionTake'
      ShortCut = 13
      OnExecute = cxGrid1DBTableView1DblClick
    end
    object ActionShowmes: TAction
      Caption = 'ActionShowmes'
      ShortCut = 57431
    end
  end
  object DSourceCardMen: TDataSource
    DataSet = DSetCardMen
    Left = 616
    Top = 8
  end
  object DSetCardMen: TpFIBDataSet
    Left = 576
    Top = 8
    poSQLINT64ToBCD = True
  end
  object Database: TpFIBDatabase
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 496
    Top = 8
  end
  object Trans: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 536
    Top = 8
  end
  object DSetActiveCard: TpFIBDataSet
    Left = 656
    Top = 8
    poSQLINT64ToBCD = True
  end
end
