object DocWorkOstInvKartForm: TDocWorkOstInvKartForm
  Left = 497
  Top = 152
  Width = 500
  Height = 513
  Color = 16776176
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 283
    Width = 71
    Height = 13
    Caption = #1055#1086#1095#1072#1090#1082'.'#1094#1110#1085#1072
  end
  object lbl1: TLabel
    Left = 9
    Top = 305
    Width = 75
    Height = 13
    Caption = #1055#1086#1095#1072#1090#1082'.'#1079#1085#1086#1089
  end
  object lbl2: TLabel
    Left = 8
    Top = 327
    Width = 78
    Height = 13
    Caption = #1047#1072#1083#1080#1096#1082'. '#1094#1110#1085#1072
  end
  object lbl3: TLabel
    Left = 9
    Top = 351
    Width = 60
    Height = 13
    Caption = #1057#1091#1084'. '#1079#1085#1086#1089
  end
  object lbl4: TLabel
    Left = 8
    Top = 373
    Width = 81
    Height = 13
    Caption = #1041#1072#1083'. '#1074#1072#1088#1090#1110#1089#1090#1100
  end
  object lbl5: TLabel
    Left = 249
    Top = 281
    Width = 88
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072#1083'. '#1094#1110#1085#1080
  end
  object lbl6: TLabel
    Left = 248
    Top = 303
    Width = 93
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1087#1088#1080#1073#1091#1090#1082'.'
  end
  object lbl7: TLabel
    Left = 247
    Top = 325
    Width = 98
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1095'. '#1077#1082#1089#1087#1083
  end
  object lbl8: TLabel
    Left = 247
    Top = 348
    Width = 98
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1085#1086#1074#1083#1077#1085#1085#1103
  end
  object lbl9: TLabel
    Left = 248
    Top = 371
    Width = 96
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1080#1083#1091#1095#1077#1085#1085#1103
  end
  object lbl10: TLabel
    Left = 8
    Top = 397
    Width = 68
    Height = 13
    Caption = #1058#1080#1087' '#1082#1072#1088#1090#1082#1080
  end
  object lbl11: TLabel
    Left = 250
    Top = 395
    Width = 80
    Height = 13
    Caption = #1043#1088#1091#1087#1072' '#1082#1072#1088#1090#1082#1080
  end
  object lbl12: TLabel
    Left = 250
    Top = 418
    Width = 85
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1082#1080
  end
  object lbl13: TLabel
    Left = 10
    Top = 422
    Width = 56
    Height = 13
    Caption = #1055#1088#1080#1084#1110#1090#1082#1072
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 492
    Height = 273
    Align = alTop
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = KartDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle10
      Styles.Content = cxStyle10
      Styles.Selection = cxStyle5
      Styles.Footer = cxStyle2
      Styles.Header = cxStyle11
      object cxGrid1DBTableView1ID_INV_KART: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_INV_KART'
      end
      object cxGrid1DBTableView1INV_NUM_FULL: TcxGridDBColumn
        Caption = #1030#1085#1074'.'#1085#1086#1084#1077#1088
        Width = 74
        DataBinding.FieldName = 'INV_NUM_FULL'
      end
      object cxGrid1DBTableView1ZAVNUM: TcxGridDBColumn
        Caption = #1047#1072#1074'.'#1085#1086#1084#1077#1088
        Width = 76
        DataBinding.FieldName = 'ZAVNUM'
      end
      object cxGrid1DBTableView1MODE: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'MODE'
      end
      object cxGrid1DBTableView1BEG_IZNOS: TcxGridDBColumn
        Caption = #1055#1086#1095#1072#1090#1082'. '#1079#1085#1086#1089
        Visible = False
        Width = 85
        DataBinding.FieldName = 'BEG_IZNOS'
      end
      object cxGrid1DBTableView1BEG_PRICE: TcxGridDBColumn
        Caption = #1055#1086#1095#1072#1090#1082'. '#1094#1110#1085#1072
        Visible = False
        Width = 83
        DataBinding.FieldName = 'BEG_PRICE'
      end
      object cxGrid1DBTableView1DATE_EXPL: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1087#1086#1095'. '#1077#1082#1089#1087#1083'.'
        Visible = False
        Width = 63
        DataBinding.FieldName = 'DATE_EXPL'
      end
      object cxGrid1DBTableView1DATE_OPR: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1086#1087#1088#1080#1073'.'
        Visible = False
        Width = 82
        DataBinding.FieldName = 'DATE_OPR'
      end
      object cxGrid1DBTableView1DATE_OST: TcxGridDBColumn
        Visible = False
        Width = 78
        DataBinding.FieldName = 'DATE_OST'
      end
      object cxGrid1DBTableView1DATE_OUT: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1074#1080#1083#1091#1095#1077#1085#1085#1103
        Visible = False
        Width = 95
        DataBinding.FieldName = 'DATE_OUT'
      end
      object cxGrid1DBTableView1DATE_UPDATE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1086#1085#1086#1074#1083#1077#1085#1085#1103
        Visible = False
        Width = 50
        DataBinding.FieldName = 'DATE_UPDATE'
      end
      object cxGrid1DBTableView1KARTNUM: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1082#1080
        Visible = False
        Width = 89
        DataBinding.FieldName = 'KARTNUM'
      end
      object cxGrid1DBTableView1OST_IZNOS: TcxGridDBColumn
        Caption = #1057#1091#1084'. '#1079#1085#1086#1089
        Visible = False
        Width = 47
        DataBinding.FieldName = 'OST_IZNOS'
      end
      object cxGrid1DBTableView1OST_PRICE: TcxGridDBColumn
        Caption = #1047#1072#1083#1080#1096#1082'. '#1094#1110#1085#1072
        Visible = False
        Width = 50
        DataBinding.FieldName = 'OST_PRICE'
      end
      object cxGrid1DBTableView1TIP_KART: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1082#1072#1088#1090#1082#1080
        Visible = False
        SortOrder = soAscending
        Width = 78
        DataBinding.FieldName = 'TIP_KART'
      end
      object cxGrid1DBTableView1GRPNUM: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1075#1088#1091#1087#1080
        Visible = False
        Width = 82
        DataBinding.FieldName = 'GRPNUM'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object CancelButton: TcxButton
    Left = 174
    Top = 450
    Width = 130
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 1
    OnClick = CancelButtonClick
    Glyph.Data = {
      36080000424D3608000000000000360000002800000020000000100000000100
      2000000000000008000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A00174AFD00103BF40000009A00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A00002CF8000030FC0000009A00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B00A8A8A800A0A0A0006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B009A9A9A009C9C9C006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A001A47F8001A4CFF00123BF10000009A00FF00FF00FF00FF000000
      9A00012DF6000132FF00002AF30000009A00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B00A7A7A700AAAAAA009F9F9F006B6B6B00FF00FF00FF00FF006B6B
      6B00999999009E9E9E00979797006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A001C47F6001B4DFF00143EF40000009A0000009A00002D
      F8000134FF00032BF20000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B00A7A7A700ABABAB00A2A2A2006B6B6B006B6B6B009A9A
      9A009E9E9E00989898006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000009A001D48F6001D50FF00103DFB000431FE000132
      FF00002CF60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF006B6B6B00A7A7A700ACACAC00A3A3A3009F9F9F009E9E
      9E00999999006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000009A001A48F9001342FF000C3CFF000733
      F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF006B6B6B00A7A7A700A7A7A700A3A3A3009C9C
      9C006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000009A00214EFC001D4BFF001847FF001743
      F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF006B6B6B00ACACAC00ACACAC00A9A9A900A4A4
      A4006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000009A002E5BF9002C5FFF00224DF800204BF8002355
      FF001B46F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF006B6B6B00B1B1B100B3B3B300ABABAB00AAAAAA00AFAF
      AF00A6A6A6006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A003664FA00386BFF002D59F40000009A0000009A00224C
      F4002558FF001D49F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B00B6B6B600B9B9B900AEAEAE006B6B6B006B6B6B00A9A9
      A900B0B0B000A7A7A7006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A004071FA004274FF00325DF10000009A00FF00FF00FF00FF000000
      9A00224DF100275AFF00204CF80000009A00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B00BBBBBB00BEBEBE00AFAFAF006B6B6B00FF00FF00FF00FF006B6B
      6B00A7A7A700B1B1B100AAAAAA006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A00497AFC003B66F30000009A00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A002550F4002655FA0000009A00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B00C0C0C000B5B5B5006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B00AAAAAA00AEAEAE006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    NumGlyphs = 2
    UseSystemPaint = False
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 89
    Top = 280
    Width = 112
    Height = 21
    DataBinding.DataField = 'BEG_PRICE'
    DataBinding.DataSource = KartDataSource
    TabOrder = 2
  end
  object cxDBTextEdit2: TcxDBTextEdit
    Left = 90
    Top = 303
    Width = 111
    Height = 21
    DataBinding.DataField = 'BEG_IZNOS'
    DataBinding.DataSource = KartDataSource
    TabOrder = 3
  end
  object cxDBTextEdit3: TcxDBTextEdit
    Left = 90
    Top = 326
    Width = 111
    Height = 21
    DataBinding.DataField = 'OST_PRICE'
    DataBinding.DataSource = KartDataSource
    TabOrder = 4
  end
  object cxDBTextEdit4: TcxDBTextEdit
    Left = 90
    Top = 349
    Width = 111
    Height = 21
    DataBinding.DataField = 'OST_IZNOS'
    DataBinding.DataSource = KartDataSource
    TabOrder = 5
  end
  object cxDBTextEdit5: TcxDBTextEdit
    Left = 90
    Top = 371
    Width = 111
    Height = 21
    DataBinding.DataField = 'BAL_PRICE'
    DataBinding.DataSource = KartDataSource
    TabOrder = 6
  end
  object cxDBTextEdit6: TcxDBTextEdit
    Left = 353
    Top = 279
    Width = 112
    Height = 21
    DataBinding.DataField = 'DATE_OST'
    DataBinding.DataSource = KartDataSource
    TabOrder = 7
  end
  object cxDBTextEdit7: TcxDBTextEdit
    Left = 354
    Top = 301
    Width = 112
    Height = 21
    DataBinding.DataField = 'DATE_OPR'
    DataBinding.DataSource = KartDataSource
    TabOrder = 8
  end
  object cxDBTextEdit8: TcxDBTextEdit
    Left = 354
    Top = 323
    Width = 112
    Height = 21
    DataBinding.DataField = 'DATE_EXPL'
    DataBinding.DataSource = KartDataSource
    TabOrder = 9
  end
  object cxDBTextEdit9: TcxDBTextEdit
    Left = 355
    Top = 346
    Width = 112
    Height = 21
    DataBinding.DataField = 'DATE_UPDATE'
    DataBinding.DataSource = KartDataSource
    TabOrder = 10
  end
  object cxDBTextEdit10: TcxDBTextEdit
    Left = 355
    Top = 369
    Width = 112
    Height = 21
    DataBinding.DataField = 'DATE_OUT'
    DataBinding.DataSource = KartDataSource
    TabOrder = 11
  end
  object cxDBTextEdit11: TcxDBTextEdit
    Left = 90
    Top = 394
    Width = 111
    Height = 21
    DataBinding.DataField = 'TIP_KART'
    DataBinding.DataSource = KartDataSource
    TabOrder = 12
  end
  object cxDBTextEdit12: TcxDBTextEdit
    Left = 355
    Top = 392
    Width = 111
    Height = 21
    DataBinding.DataField = 'GRPNUM'
    DataBinding.DataSource = KartDataSource
    TabOrder = 13
  end
  object cxDBTextEdit13: TcxDBTextEdit
    Left = 355
    Top = 414
    Width = 111
    Height = 21
    DataBinding.DataField = 'KARTNUM'
    DataBinding.DataSource = KartDataSource
    TabOrder = 14
  end
  object cxDBTextEdit14: TcxDBTextEdit
    Left = 90
    Top = 418
    Width = 111
    Height = 21
    DataBinding.DataField = 'NOTE'
    DataBinding.DataSource = KartDataSource
    TabOrder = 15
  end
  object KartDataSource: TDataSource
    DataSet = KartDataSet
    Left = 48
    Top = 176
  end
  object StyleRepository: TcxStyleRepository
    Left = 16
    Top = 120
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
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
  object KartDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = WorkTransaction
    SelectSQL.Strings = (
      'SELECT * '
      'FROM MAT_GET_INV_KART_BY_ID_POS(:ID_POS, :ID_OST, 1)')
    Left = 8
    Top = 174
    poSQLINT64ToBCD = True
    object KartDataSetID_INV_KART: TFIBBCDField
      FieldName = 'ID_INV_KART'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetINV_NUM_FULL: TFIBStringField
      FieldName = 'INV_NUM_FULL'
      Size = 10
      EmptyStrToNull = True
    end
    object KartDataSetZAVNUM: TFIBStringField
      FieldName = 'ZAVNUM'
      Size = 30
      EmptyStrToNull = True
    end
    object KartDataSetMODE: TFIBIntegerField
      FieldName = 'MODE'
    end
    object KartDataSetKARTNUM: TFIBIntegerField
      FieldName = 'KARTNUM'
    end
    object KartDataSetTIP_KART: TFIBStringField
      FieldName = 'TIP_KART'
      Size = 1
      EmptyStrToNull = True
    end
    object KartDataSetBEG_PRICE: TFIBIntegerField
      FieldName = 'BEG_PRICE'
    end
    object KartDataSetBEG_IZNOS: TFIBIntegerField
      FieldName = 'BEG_IZNOS'
    end
    object KartDataSetOST_PRICE: TFIBIntegerField
      FieldName = 'OST_PRICE'
    end
    object KartDataSetOST_IZNOS: TFIBIntegerField
      FieldName = 'OST_IZNOS'
    end
    object KartDataSetDATE_OST: TFIBDateField
      FieldName = 'DATE_OST'
    end
    object KartDataSetDATE_OPR: TFIBDateField
      FieldName = 'DATE_OPR'
    end
    object KartDataSetDATE_EXPL: TFIBDateField
      FieldName = 'DATE_EXPL'
    end
    object KartDataSetDATE_UPDATE: TFIBDateField
      FieldName = 'DATE_UPDATE'
    end
    object KartDataSetDATE_OUT: TFIBDateField
      FieldName = 'DATE_OUT'
    end
    object KartDataSetGRPNUM: TFIBStringField
      FieldName = 'GRPNUM'
      Size = 1
      EmptyStrToNull = True
    end
    object KartDataSetBAL_PRICE: TFIBIntegerField
      FieldName = 'BAL_PRICE'
    end
    object KartDataSetNOTE: TFIBStringField
      FieldName = 'NOTE'
      Size = 500
      EmptyStrToNull = True
    end
  end
  object WorkTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 8
    Top = 208
  end
  object WorkDatabase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = WorkTransaction
    DefaultUpdateTransaction = WorkTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 8
    Top = 240
  end
end
