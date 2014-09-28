object OstInvKartForm: TOstInvKartForm
  Left = 331
  Top = 293
  BorderStyle = bsDialog
  ClientHeight = 474
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 275
    Width = 71
    Height = 13
    Caption = #1055#1086#1095#1072#1090#1082'.'#1094#1110#1085#1072
  end
  object lbl1: TLabel
    Left = 9
    Top = 297
    Width = 75
    Height = 13
    Caption = #1055#1086#1095#1072#1090#1082'.'#1079#1085#1086#1089
  end
  object lbl2: TLabel
    Left = 8
    Top = 319
    Width = 78
    Height = 13
    Caption = #1047#1072#1083#1080#1096#1082'. '#1094#1110#1085#1072
  end
  object lbl3: TLabel
    Left = 9
    Top = 343
    Width = 60
    Height = 13
    Caption = #1057#1091#1084'. '#1079#1085#1086#1089
  end
  object lbl4: TLabel
    Left = 8
    Top = 365
    Width = 81
    Height = 13
    Caption = #1041#1072#1083'. '#1074#1072#1088#1090#1110#1089#1090#1100
  end
  object lbl5: TLabel
    Left = 249
    Top = 273
    Width = 88
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072#1083'. '#1094#1110#1085#1080
  end
  object lbl6: TLabel
    Left = 248
    Top = 295
    Width = 93
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1087#1088#1080#1073#1091#1090#1082'.'
  end
  object lbl7: TLabel
    Left = 247
    Top = 317
    Width = 98
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1095'. '#1077#1082#1089#1087#1083
  end
  object lbl8: TLabel
    Left = 247
    Top = 340
    Width = 98
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1085#1086#1074#1083#1077#1085#1085#1103
  end
  object lbl9: TLabel
    Left = 248
    Top = 363
    Width = 96
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1080#1083#1091#1095#1077#1085#1085#1103
  end
  object lbl10: TLabel
    Left = 8
    Top = 389
    Width = 68
    Height = 13
    Caption = #1058#1080#1087' '#1082#1072#1088#1090#1082#1080
  end
  object lbl11: TLabel
    Left = 250
    Top = 387
    Width = 80
    Height = 13
    Caption = #1043#1088#1091#1087#1072' '#1082#1072#1088#1090#1082#1080
  end
  object lbl12: TLabel
    Left = 250
    Top = 410
    Width = 85
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1082#1080
  end
  object lbl13: TLabel
    Left = 9
    Top = 412
    Width = 56
    Height = 13
    Caption = #1055#1088#1080#1084#1110#1090#1082#1072
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 484
    Height = 265
    Align = alTop
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = KartDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0'
          Kind = skCount
          FieldName = 'ID_INV_KART'
          Column = cxGrid1DBTableView1INV_NUM_FULL
        end>
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
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Styles.Selection = cxStyle5
      Styles.Footer = cxStyle2
      Styles.Header = cxStyle11
      object cxGrid1DBTableView1ID_INV_KART: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_INV_KART'
      end
      object cxGrid1DBTableView1INV_NUM_FULL: TcxGridDBColumn
        DataBinding.FieldName = 'INV_NUM_FULL'
      end
      object cxGrid1DBTableView1ZAVNUM: TcxGridDBColumn
        DataBinding.FieldName = 'ZAVNUM'
      end
      object cxGrid1DBTableView1MODE: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'MODE'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object CancelButton: TcxButton
    Left = 288
    Top = 441
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
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
      9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
      00009A174AFD103BF400009AFF00FFFF00FFFF00FFFF00FF00009A002CF80030
      FC00009AFF00FFFF00FFFF00FFFF00FF6B6B6BA8A8A8A0A0A06B6B6BFF00FFFF
      00FFFF00FFFF00FF6B6B6B9A9A9A9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FF
      00009A1A47F81A4CFF123BF100009AFF00FFFF00FF00009A012DF60132FF002A
      F300009AFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7AAAAAA9F9F9F6B6B6BFF
      00FFFF00FF6B6B6B9999999E9E9E9797976B6B6BFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A1C47F61B4DFF143EF400009A00009A002DF80134FF032BF20000
      9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ABABABA2A2A26B
      6B6B6B6B6B9A9A9A9E9E9E9898986B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF00009A1D48F61D50FF103DFB0431FE0132FF002CF600009AFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ACACACA3
      A3A39F9F9F9E9E9E9999996B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF00009A1A48F91342FF0C3CFF0733F600009AFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7A7
      A7A7A3A3A39C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF00009A214EFC1D4BFF1847FF1743F600009AFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BACACACAC
      ACACA9A9A9A4A4A46B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF00009A2E5BF92C5FFF224DF8204BF82355FF1B46F600009AFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB1B1B1B3B3B3AB
      ABABAAAAAAAFAFAFA6A6A66B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A3664FA386BFF2D59F400009A00009A224CF42558FF1D49F60000
      9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB6B6B6B9B9B9AEAEAE6B
      6B6B6B6B6BA9A9A9B0B0B0A7A7A76B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
      00009A4071FA4274FF325DF100009AFF00FFFF00FF00009A224DF1275AFF204C
      F800009AFF00FFFF00FFFF00FFFF00FF6B6B6BBBBBBBBEBEBEAFAFAF6B6B6BFF
      00FFFF00FF6B6B6BA7A7A7B1B1B1AAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FF
      00009A497AFC3B66F300009AFF00FFFF00FFFF00FFFF00FF00009A2550F42655
      FA00009AFF00FFFF00FFFF00FFFF00FF6B6B6BC0C0C0B5B5B56B6B6BFF00FFFF
      00FFFF00FFFF00FF6B6B6BAAAAAAAEAEAE6B6B6BFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
      9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    NumGlyphs = 2
    UseSystemPaint = False
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 89
    Top = 272
    Width = 112
    Height = 21
    DataBinding.DataField = 'BEG_PRICE'
    DataBinding.DataSource = KartDataSource
    TabOrder = 2
  end
  object cxDBTextEdit2: TcxDBTextEdit
    Left = 90
    Top = 295
    Width = 111
    Height = 21
    DataBinding.DataField = 'BEG_IZNOS'
    DataBinding.DataSource = KartDataSource
    TabOrder = 3
  end
  object cxDBTextEdit3: TcxDBTextEdit
    Left = 90
    Top = 318
    Width = 111
    Height = 21
    DataBinding.DataField = 'OST_PRICE'
    DataBinding.DataSource = KartDataSource
    TabOrder = 4
  end
  object cxDBTextEdit4: TcxDBTextEdit
    Left = 90
    Top = 341
    Width = 111
    Height = 21
    DataBinding.DataField = 'OST_IZNOS'
    DataBinding.DataSource = KartDataSource
    TabOrder = 5
  end
  object cxDBTextEdit5: TcxDBTextEdit
    Left = 90
    Top = 363
    Width = 111
    Height = 21
    DataBinding.DataField = 'BAL_PRICE'
    DataBinding.DataSource = KartDataSource
    TabOrder = 6
  end
  object cxDBTextEdit6: TcxDBTextEdit
    Left = 362
    Top = 271
    Width = 112
    Height = 21
    DataBinding.DataField = 'DATE_OST'
    DataBinding.DataSource = KartDataSource
    TabOrder = 7
  end
  object cxDBTextEdit7: TcxDBTextEdit
    Left = 362
    Top = 293
    Width = 112
    Height = 21
    DataBinding.DataField = 'DATE_OPR'
    DataBinding.DataSource = KartDataSource
    TabOrder = 8
  end
  object cxDBTextEdit8: TcxDBTextEdit
    Left = 362
    Top = 315
    Width = 112
    Height = 21
    DataBinding.DataField = 'DATE_EXPL'
    DataBinding.DataSource = KartDataSource
    TabOrder = 9
  end
  object cxDBTextEdit9: TcxDBTextEdit
    Left = 362
    Top = 338
    Width = 112
    Height = 21
    DataBinding.DataField = 'DATE_UPDATE'
    DataBinding.DataSource = KartDataSource
    TabOrder = 10
  end
  object cxDBTextEdit10: TcxDBTextEdit
    Left = 362
    Top = 361
    Width = 112
    Height = 21
    DataBinding.DataField = 'DATE_OUT'
    DataBinding.DataSource = KartDataSource
    TabOrder = 11
  end
  object cxDBTextEdit11: TcxDBTextEdit
    Left = 90
    Top = 386
    Width = 111
    Height = 21
    DataBinding.DataField = 'TIP_KART'
    DataBinding.DataSource = KartDataSource
    TabOrder = 12
  end
  object cxDBTextEdit12: TcxDBTextEdit
    Left = 363
    Top = 384
    Width = 111
    Height = 21
    DataBinding.DataField = 'GRPNUM'
    DataBinding.DataSource = KartDataSource
    TabOrder = 13
  end
  object cxDBTextEdit13: TcxDBTextEdit
    Left = 363
    Top = 406
    Width = 111
    Height = 21
    DataBinding.DataField = 'KARTNUM'
    DataBinding.DataSource = KartDataSource
    TabOrder = 14
  end
  object cxDBTextEdit14: TcxDBTextEdit
    Left = 90
    Top = 409
    Width = 111
    Height = 21
    DataBinding.DataField = 'NOTE'
    DataBinding.DataSource = KartDataSource
    TabOrder = 15
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
  object KartDataSet: TpFIBDataSet
    Database = OstBaseForm.OstDatabase
    Transaction = OstBaseForm.WriteTransaction
    SelectSQL.Strings = (
      'SELECT * '
      'FROM MAT_GET_INV_KART_BY_ID_POS(:ID_POS, :ID_OST, 1)')
    Left = 96
    Top = 67
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
  object KartDataSource: TDataSource
    DataSet = KartDataSet
    Left = 136
    Top = 64
  end
  object ActionList1: TActionList
    Left = 184
    Top = 56
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 27
      OnExecute = Action1Execute
    end
  end
end
