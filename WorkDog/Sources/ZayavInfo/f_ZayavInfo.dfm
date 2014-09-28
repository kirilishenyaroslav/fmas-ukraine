object frmZayavInfo: TfrmZayavInfo
  Left = 450
  Top = 273
  BorderStyle = bsDialog
  Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1088'/'#1088#1072#1093#1091#1085#1082#1072#1084
  ClientHeight = 286
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 248
    Width = 385
    Height = 5
    Shape = bsBottomLine
  end
  object cxButton_ok: TcxButton
    Left = 305
    Top = 257
    Width = 92
    Height = 25
    Caption = #1054#1050
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = cxButton_okClick
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      08000000000000010000C40E0000C40E0000000100000000000000000000FFFF
      FF0000FF000000840000C8D0D40084848400FFFFFF0000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040404040404
      0404040404040404040404040404040404040404040404040404040404040404
      0404040404040404040404040404040400040404040404040404040404040400
      0300040404040404040404040404000302030004040404040404040404000202
      0202030004040404040404040002020505020203000404040404040405020504
      0405020203000404040404040405040404040502020300040404040404040404
      0404040502020300040404040404040404040404050202000404040404040404
      0404040404050200040404040404040404040404040405040404040404040404
      0404040404040404040404040404040404040404040404040404}
    UseSystemPaint = False
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 64
    Width = 385
    Height = 177
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'sum'
          Column = sum
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = cxGridTableViewStyleSheet1
      object mfo: TcxGridDBColumn
        Caption = #1052#1060#1054
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 59
        DataBinding.FieldName = 'MFO_DONNU'
      end
      object rate_acc_native: TcxGridDBColumn
        Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        SortOrder = soAscending
        Width = 136
        DataBinding.FieldName = 'RATE_ACC_DONNU'
      end
      object sum: TcxGridDBColumn
        Caption = #1057#1091#1084#1072
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 95
        DataBinding.FieldName = 'sum'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 385
    Height = 57
    Alignment = alTopLeft
    Caption = #1042#1110#1076#1110#1073#1088#1072#1090#1080'  '#1076#1072#1085#1110' '#1087#1086
    TabOrder = 2
    object cxRadioButton_fltr: TcxRadioButton
      Left = 8
      Top = 24
      Width = 73
      Height = 17
      Caption = #1060#1110#1083#1100#1090#1088#1091
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = cxRadioButton_fltrClick
    end
    object cxRadioButton_period: TcxRadioButton
      Left = 96
      Top = 24
      Width = 73
      Height = 17
      Caption = #1055#1077#1088#1110#1086#1076#1091
      TabOrder = 1
      OnClick = cxRadioButton_periodClick
    end
    object cxDateEdit_beg: TcxDateEdit
      Left = 176
      Top = 24
      Width = 97
      Height = 21
      Enabled = False
      Style.Color = clMoneyGreen
      TabOrder = 2
      OnExit = cxDateEdit_begExit
    end
    object cxDateEdit_end: TcxDateEdit
      Left = 288
      Top = 24
      Width = 89
      Height = 21
      Enabled = False
      Style.Color = clMoneyGreen
      TabOrder = 3
      OnExit = cxDateEdit_endExit
    end
  end
  object pFIBDatabase: TpFIBDatabase
    DefaultTransaction = pFIBTransactionRead
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 48
    Top = 96
  end
  object pFIBDataSet: TpFIBDataSet
    Database = pFIBDatabase
    Transaction = pFIBTransactionRead
    Left = 112
    Top = 96
    poSQLINT64ToBCD = True
  end
  object pFIBTransactionRead: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TARollback
    Left = 80
    Top = 96
  end
  object DataSource: TDataSource
    DataSet = pFIBDataSet
    Left = 16
    Top = 96
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 16
    Top = 128
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
end
