object frmAllBank: TfrmAllBank
  Left = 312
  Top = 158
  Width = 474
  Height = 480
  Caption = #1056#1077#1077#1089#1090#1088' '#1073#1072#1085#1082#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 466
    Height = 446
    Align = alClient
    TabOrder = 0
    object cxGridAllBank: TcxGrid
      Left = 2
      Top = 15
      Width = 462
      Height = 379
      Align = alClient
      TabOrder = 0
      object cxGridAllBankDBTableView1: TcxGridDBTableView
        OnDblClick = cxGridAllBankDBTableView1DblClick
        OnKeyDown = cxGridAllBankDBTableView1KeyDown
        DataController.DataSource = DataSourceAllBank
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleYellow
        Styles.Content = cxStyleYellow
        Styles.ContentEven = cxStyleYellow
        Styles.ContentOdd = cxStyleYellow
        Styles.Inactive = cxStyle4
        Styles.IncSearch = cxStyleYellow
        Styles.Selection = cxStyle12
        Styles.FilterBox = cxStyleYellow
        Styles.Footer = cxStyleYellow
        Styles.Group = cxStyleYellow
        Styles.GroupByBox = cxStyleYellow
        Styles.Header = cxStyleBorder
        Styles.Indicator = cxStyleYellow
        Styles.NewItemRowInfoText = cxStyleYellow
        Styles.Preview = cxStyleYellow
        object SHORT_NAME: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1073#1072#1085#1082#1072
          Width = 120
          DataBinding.FieldName = 'SHORT_NAME'
        end
        object SECTION: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1073#1072#1085#1082#1072
          DataBinding.FieldName = 'SECTION'
        end
        object LAST_RUNS: TcxGridDBColumn
          Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1079#1072#1087#1091#1089#1082
          DataBinding.FieldName = 'LAST_RUNS'
        end
      end
      object cxGridAllBankLevel1: TcxGridLevel
        GridView = cxGridAllBankDBTableView1
      end
    end
    object GroupBox3: TGroupBox
      Left = 2
      Top = 394
      Width = 462
      Height = 50
      Align = alBottom
      TabOrder = 1
      object LabelSpL: TLabel
        Left = 8
        Top = 16
        Width = 111
        Height = 13
        Caption = #1055#1088#1086#1094#1077#1076#1091#1088#1072' '#1086#1073#1088#1072#1073#1086#1090#1082#1080
      end
      object LabelSP: TLabel
        Left = 128
        Top = 16
        Width = 48
        Height = 13
        Caption = 'LabelSP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelFileL: TLabel
        Left = 8
        Top = 32
        Width = 29
        Height = 13
        Caption = #1060#1072#1081#1083
      end
      object LabelFile: TLabel
        Left = 128
        Top = 32
        Width = 52
        Height = 13
        Caption = 'LabelFile'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object DataBase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 104
    Top = 64
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 144
    Top = 64
  end
  object pFIBDataSetAllBank: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from clbank_ini')
    AfterScroll = pFIBDataSetAllBankAfterScroll
    Left = 184
    Top = 64
    poSQLINT64ToBCD = True
  end
  object DataSourceAllBank: TDataSource
    DataSet = pFIBDataSetAllBank
    Left = 216
    Top = 64
  end
  object StyleRepository: TcxStyleRepository
    Left = 152
    Top = 200
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
end
