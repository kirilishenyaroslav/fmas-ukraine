object DocWorkOstMnaKartForm: TDocWorkOstMnaKartForm
  Left = 377
  Top = 235
  Width = 400
  Height = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 392
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
      object cxGrid1DBTableView1ID_MNA_KART: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_MNA_KART'
      end
      object cxGrid1DBTableView1MNA_INV_NUM: TcxGridDBColumn
        Caption = #1030#1085#1074#1077#1085#1090'. '#8470
        Width = 85
        DataBinding.FieldName = 'MNA_INV_NUM'
      end
      object cxGrid1DBTableView1NNUM_FULL: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1085#1082#1083'. '#8470
        Width = 139
        DataBinding.FieldName = 'NNUM_FULL'
      end
      object cxGrid1DBTableView1ZAVNUM: TcxGridDBColumn
        Caption = #1047#1072#1074#1086#1076#1089#1100#1082#1080#1081' '#8470
        Width = 166
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
    Left = 131
    Top = 283
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
      'FROM MAT_GET_MNA_KART_BY_ID_POS(:ID_POS, :ID_OST, 1)')
    Left = 8
    Top = 176
    poSQLINT64ToBCD = True
    object KartDataSetID_MNA_KART: TFIBBCDField
      FieldName = 'ID_MNA_KART'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetMNA_INV_NUM: TFIBStringField
      FieldName = 'MNA_INV_NUM'
      Size = 10
      EmptyStrToNull = True
    end
    object KartDataSetNNUM_FULL: TFIBStringField
      FieldName = 'NNUM_FULL'
      Size = 25
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
