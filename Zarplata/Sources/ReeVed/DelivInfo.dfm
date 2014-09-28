object frmDelivInfo: TfrmDelivInfo
  Left = 508
  Top = 411
  BorderStyle = bsDialog
  Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1076#1083#1103' '#1088#1086#1079#1087#1086#1076#1110#1083#1091' '#1074#1110#1076#1086#1084#1086#1089#1090#1077#1081' '#1088#1077#1108#1089#1090#1088#1091
  ClientHeight = 233
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 192
    Width = 543
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 304
      Top = 8
      Width = 145
      Height = 25
      Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1080' '#1088#1086#1079#1087#1086#1076#1110#1083
      Enabled = False
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 456
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1080#1093#1110#1076
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Koeff: TcxCalcEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    EditValue = 0.500000000000000000
    Properties.Alignment.Horz = taRightJustify
    TabOrder = 1
  end
  object MinSum: TcxCalcEdit
    Left = 9
    Top = 69
    Width = 121
    Height = 21
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    TabOrder = 2
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 5
    Width = 106
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
    Caption = #1050#1086#1077#1092'. '#1088#1086#1079#1087#1086#1076#1110#1083#1091
  end
  object cxLabel2: TcxLabel
    Left = 9
    Top = 49
    Width = 273
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = #1052#1110#1085#1110#1084#1072#1083#1100#1085#1072' '#1089#1091#1084#1072', '#1103#1082#1072' '#1085#1077' '#1087#1110#1076#1083#1103#1075#1072#1108' '#1088#1086#1079#1087#1086#1076#1110#1083#1091
  end
  object cxButton3: TcxButton
    Left = 304
    Top = 16
    Width = 147
    Height = 25
    Caption = #1056#1086#1079#1087#1086#1076#1110#1083' '#1074#1110#1076#1086#1084#1086#1089#1090#1077#1081
    TabOrder = 5
    OnClick = cxButton3Click
  end
  object cxButton4: TcxButton
    Left = 456
    Top = 16
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    Enabled = False
    TabOrder = 6
    OnClick = cxButton4Click
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 110
    Width = 543
    Height = 82
    Align = alBottom
    TabOrder = 7
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnHorzSizing = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = GridTableViewStyleSheetDevExpress
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1056#1077#1108#1089#1090#1088#1080
        HeaderAlignmentHorz = taCenter
        MinWidth = 64
        DataBinding.FieldName = 'REESTR'
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Focusing = False
        DataBinding.FieldName = 'NACH'
      end
      object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Caption = #1059#1090#1088#1080#1084#1072#1085#1086
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        MinWidth = 64
        DataBinding.FieldName = 'UDERG'
      end
      object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
        Caption = #1044#1086' '#1074#1080#1087#1083#1072#1090#1080
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        MinWidth = 64
        DataBinding.FieldName = 'KVIPL'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 104
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 48
    Top = 104
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 16
    Top = 136
  end
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <>
    Left = 24
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    Left = 64
    Top = 168
  end
  object Styles: TcxStyleRepository
    Left = 208
    Top = 64
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
      Color = 13619151
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
      Color = 8535838
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
