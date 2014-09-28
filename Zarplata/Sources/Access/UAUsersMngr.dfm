object frmUsersMngr: TfrmUsersMngr
  Left = 322
  Top = 276
  BorderStyle = bsDialog
  Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1088#1086' '#1072#1074#1090#1086#1088#1080#1079#1086#1074#1072#1085#1080#1093' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110#1074
  ClientHeight = 410
  ClientWidth = 647
  Color = 13881809
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 369
    Width = 647
    Height = 41
    Align = alBottom
    Color = 13881809
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 312
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 647
    Height = 369
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 305
      Top = 1
      Width = 6
      Height = 367
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 304
      Height = 367
      Align = alLeft
      TabOrder = 0
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 302
        Height = 56
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 1
          Top = 1
          Width = 300
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110' '#1089#1080#1089#1090#1077#1084#1080
        end
        object cxButton3: TcxButton
          Left = 184
          Top = 24
          Width = 107
          Height = 25
          Caption = #1040#1074#1090#1086#1088#1080#1079#1091#1074#1072#1090#1080
          TabOrder = 0
          OnClick = cxButton3Click
        end
      end
      object ListGrid: TcxGrid
        Left = 1
        Top = 57
        Width = 302
        Height = 309
        Align = alClient
        TabOrder = 1
        object ListGridTabView: TcxGridDBTableView
          DataController.DataSource = AllUsersDataSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #1042#1089#1100#1075#1086':0'
              Kind = skCount
              FieldName = 'TN'
              Column = FIOColumn
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.StyleSheet = GridTableViewStyleSheetDevExpress
          object FIOColumn: TcxGridDBColumn
            Caption = #1055#1030#1041
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 359
            DataBinding.FieldName = 'FULL_NAME'
          end
        end
        object ListGridLevel1: TcxGridLevel
          GridView = ListGridTabView
        end
      end
    end
    object Panel6: TPanel
      Left = 311
      Top = 1
      Width = 335
      Height = 367
      Align = alClient
      TabOrder = 1
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 333
        Height = 56
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label2: TLabel
          Left = 1
          Top = 1
          Width = 331
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = #1040#1074#1090#1086#1088#1080#1079#1086#1074#1072#1085#1110' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110' '#1089#1080#1089#1090#1077#1084#1080
        end
        object cxButton4: TcxButton
          Left = 136
          Top = 24
          Width = 153
          Height = 25
          Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080' '#1072#1074#1090#1086#1088#1080#1079#1072#1094#1110#1102
          TabOrder = 0
          OnClick = cxButton4Click
        end
      end
      object cxGrid1: TcxGrid
        Left = 1
        Top = 57
        Width = 333
        Height = 309
        Align = alClient
        TabOrder = 1
        object cxGridDBTableView1: TcxGridDBTableView
          DataController.DataSource = AuthUsersDataSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #1042#1089#1100#1075#1086':0'
              Kind = skCount
              FieldName = 'TN'
              Column = cxGridDBColumn1
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.StyleSheet = GridTableViewStyleSheetDevExpress
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = #1055#1030#1041
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 359
            DataBinding.FieldName = 'FULL_NAME'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 176
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 56
    Top = 176
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 88
    Top = 176
  end
  object AllUsersDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * '
      '  from Z_DO_AUTHENTIFICATION_U')
    Left = 24
    Top = 208
    poSQLINT64ToBCD = True
  end
  object AuthUsersDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * '
      '  from Z_DO_AUTHENTIFICATION_AU')
    Left = 56
    Top = 208
    poSQLINT64ToBCD = True
  end
  object AllUsersDataSource: TDataSource
    DataSet = AllUsersDataSet
    Left = 24
    Top = 240
  end
  object AuthUsersDataSource: TDataSource
    DataSet = AuthUsersDataSet
    Left = 56
    Top = 240
  end
  object Styles: TcxStyleRepository
    Left = 384
    Top = 8
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Color = 10382168
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
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
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
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13249860
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
end
