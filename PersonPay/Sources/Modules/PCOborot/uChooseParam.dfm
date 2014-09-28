object ChooseForm: TChooseForm
  Left = 443
  Top = 291
  Width = 403
  Height = 463
  Caption = #1042#1080#1073#1110#1088' '#1087#1072#1088#1072#1084#1077#1090#1088#1110#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 24
    Top = 392
    Width = 5
    Height = 13
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 387
    Height = 144
    Align = alTop
    TabOrder = 0
    object cxPidsum: TcxCheckBox
      Left = 7
      Top = 7
      Width = 156
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxPidsumPropertiesChange
      Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1087#1110#1076#1089#1091#1084#1082#1080
      TabOrder = 0
    end
    object cxPortrate: TcxCheckBox
      Left = 224
      Top = 7
      Width = 156
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxPidsumPropertiesChange
      Properties.Caption = #1050#1085#1080#1078#1082#1086#1074#1080#1081' '#1074#1080#1076' '#1079#1074#1110#1090#1072
      TabOrder = 1
    end
    object cxFiltrMain: TcxCheckBox
      Left = 7
      Top = 34
      Width = 293
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxFiltrMainPropertiesChange
      Properties.Caption = #1042#1088#1072#1093#1086#1074#1091#1074#1072#1090#1080' '#1092#1110#1083#1100#1090#1088' '#1086#1089#1085#1086#1074#1085#1086#1111' '#1092#1086#1088#1084#1080
      TabOrder = 2
    end
    object cxPrintNumDog: TcxCheckBox
      Left = 7
      Top = 60
      Width = 173
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxPrintNumDogPropertiesChange
      Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#8470'  '#1076#1086#1075#1086#1074#1086#1088#1072
      State = cbsChecked
      TabOrder = 3
    end
    object cxMemOrd: TcxCheckBox
      Left = 224
      Top = 60
      Width = 153
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxMemOrdPropertiesChange
      Properties.Caption = #1052#1077#1084#1086#1088#1080#1072#1083#1100#1085#1080#1081' '#1086#1088#1076#1077#1088
      TabOrder = 4
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 144
    Width = 387
    Height = 281
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = ds1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Styles.Header = cxStyle2
      object cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueGrayed = 2
        Properties.ValueUnchecked = 0
        Options.Filtering = False
        Width = 71
        DataBinding.FieldName = 'ON_CHECK'
        IsCaptionAssigned = True
      end
      object cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        Options.Editing = False
        Options.Filtering = False
        SortOrder = soDescending
        Width = 250
        DataBinding.FieldName = 'NAME_FIELD'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxButton1: TcxButton
    Left = 130
    Top = 114
    Width = 125
    Height = 25
    Action = actPrint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FF868484868484FF00FFFF00FF868484868484FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868484BCBABAB5B3B386848486
      8484868484EBEAEA868484868484868484FF00FFFF00FFFF00FFFF00FFFF00FF
      868484E3E2E2B5B3B3B5B3B3B5B3B35150504F4F4F868787CDCDCDE8E9E9C7C6
      C6868484868484868484FF00FF868484DEDDDDD6D6D6A4A3A3A4A3A3A4A3A356
      5555161516121212181818121212939393CACACA868484FF00FF868484D6D6D6
      D6D6D6A4A3A3E0DEDED9D7D7CDCBCBC2C0C0B6B4B49F9D9D7976771212121414
      141313138684848F8C8C868484D6D6D6A4A3A3F3F2F2FFFEFEFCFBFBEAE7E8E6
      E6E6E6E5E5DAD9D9CCCBCBBFBDBDA2A0A07371719391918E8C8C868484A4A3A3
      FFFFFFFEFDFDFBFBFBDFDEDFADA7A9B4ADAEC3BDBED1CECFE0E0E0E1E1E1D4D3
      D3C7C6C6A7A5A5868383FF00FF868484868484F1F0F0C2B9BA93898BA19B9FAB
      A8AAABA6A7B1ACADAFA9AAB2ADAECAC9C9DCDCDCD0D0D0868484FF00FFFF00FF
      FF00FF868484CAA097BA9E87A2897E95817B897C7F928C92A5A2A4BBB6B7D7D6
      D6CFCFCF868484FF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFEAC4FFDDB3EE
      C399D5AE8CC9A786CC9A99989596868484868484FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFCC9A99FFE7C8FFDDBAFFDBB1FFD9A6FFD39FCC9A99FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9D9BFFEDDAFFE7CEFFE2C3FF
      DDB8FFDBAECC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFCC9A99FEF0E1FFECD8FFE6CCFFE1C2FEDDB7CC9A99FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFFFF5FFFFF5FFF0E1FFEBD6FF
      E8CCF6D4BACC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      CC9A99CC9A99CC9A99FCF3E9FCEADAFCE5D0CC9A99FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99CC9A99CC
      9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    UseSystemPaint = False
  end
  object CancelBut: TcxButton
    Left = 259
    Top = 114
    Width = 125
    Height = 25
    Action = actClose
    TabOrder = 3
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF0732DE0732DEFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FF0732DE
      0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732
      DE0732DEFF00FFFF00FFFF00FF0732DE0732DD0732DE0732DEFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF
      0534ED0732DF0732DE0732DEFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DDFF
      00FF0732DD0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF0732DD0633E60633E60633E90732DCFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0633E307
      32E30534EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF0732DD0534ED0533E90434EF0434F5FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0434F40534EF0533EBFF
      00FFFF00FF0434F40335F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF0335FC0534EF0434F8FF00FFFF00FFFF00FFFF00FF0335FC0335FBFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FCFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB
      0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF0335FBFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    UseSystemPaint = False
  end
  object cxButton2: TcxButton
    Left = 2
    Top = 82
    Width = 381
    Height = 25
    Action = actChoose
    TabOrder = 4
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A5636B00A563
      6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A5636B0084848400A563
      6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00A5636B00CECED60084848400A563
      6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00A5636B00EFEFEF0084848400A563
      6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00A5636B00EFEFEF0084848400A563
      6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00A5736B00EFEFEF0084848400A563
      6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00BD846B00EFEFEF0084848400A563
      6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00D6946B00EFEFEF0084848400A563
      6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00BD7B5A00EFEFEF00CECED600848484004242
      4200A5636B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00BD7B5A00EFEFEF00CECED600BDBDBD008C8C8C005A5A
      5A0042424200A5636B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00BD7B5A00EFEFEF00EFEFEF00C6C6C600ADADAD008C8C8C007373
      73005A5A5A0042424200A5636B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00BD7B5A00EFEFEF00EFEFEF00CECED600BDBDBD009C9C9C00848484008484
      8400737373005A5A5A0042424200A5636B00FF00FF00FF00FF00FF00FF00BD7B
      5A00EFEFEF00EFEFEF00CECED600C6C6C600C6C6C60084848400848484008484
      840084848400737373005A5A5A0042424200A5636B00FF00FF00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    UseSystemPaint = False
  end
  object cxButton3: TcxButton
    Left = 2
    Top = 114
    Width = 125
    Height = 25
    Action = actReport
    TabOrder = 5
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB98385B98385B98385B983
      85B98385B98385B98385FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFB98385F6DDB7F4D7ACF3D3A1F1CF98F0CA8FB98385FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA8E85F8E5C98A94D91E47
      F6888ECDF2D19CB98385FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFCB9A82FAEDD91E49F90033FF1E48F6F4D8ABB98385FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDCA887FCF5E98D9DED1E49
      FA8B97E0F6E0BDB98385FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFE3B18EFEFBF6FCF7EDFBF2E4FAEDDAF8E8CEB98385FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEDBD92FFFFFFFEFCFAFDF9
      F2B98384B98384BE8675B78183B78183B78183B78183B78183B78183B78183B7
      8183FF00FFEDBD92FFFFFFFFFFFFFEFDFCB98384D39769FF00FFB78183EED1B1
      E1B894E1B68CDFB180DCAB75EFC686B78183FF00FFEDBD92DCA887DCA887428A
      3EB98384FF00FFFF00FFB78183CA8F6B952B009A3401993401993300E4B57CB7
      8183FF00FFFF00FFFF00FF03750F44D27330AB4AFF00FFFF00FFBA8E85F8EEE5
      A14213972E00942900BD7649FDE5B3B78183FF00FFFF00FF01780949CC725CE7
      8E38C658138E21FF00FFCB9A82FFFFFFD5A992922600A04112ECCCAEFFEFC5B7
      8183FF00FF45812C1097262EA8483ECA6026AF3D199F290A7D12DCA887FFFFFF
      FCF7F5AE5B33CD9574FBF1DEDECBB4B78183FF00FFFF00FFFF00FF03700827B8
      400D8A18FF00FFFF00FFE3B18EFFFFFFFFFFFFEDDBD1F9F2EAB78183B78183B7
      8475FF00FFFF00FFFF00FF097B1114AB25098611FF00FFFF00FFEDBD92FFFFFF
      FFFFFFFFFFFFFDFFFFB78183DC9D64FF00FFFF00FFFF00FF0A88120C91160EA3
      1B077B0DFF00FFFF00FFEDBD92DCA887DCA887DCA887DCA887B78183FF00FFFF
      00FF07800F07800F0490120D9C1907800FFF00FFFF00FFFF00FF}
    UseSystemPaint = False
  end
  object ds1: TDataSource
    DataSet = RxMemoryData
    Left = 14
    Top = 165
  end
  object StyleRepository: TcxStyleRepository
    Left = 227
    Top = 218
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
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
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
      Font.Style = []
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
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
  object actlst1: TActionList
    Left = 296
    Top = 170
    object actPrint: TAction
      Caption = #1044#1088#1091#1082
      OnExecute = actPrintExecute
    end
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      OnExecute = actCloseExecute
    end
    object actChoose: TAction
      Caption = #1042#1110#1076#1073#1110#1088' '#1087#1072#1088#1072#1084#1077#1090#1088#1110#1074' (F7)'
      ShortCut = 118
      OnExecute = actChooseExecute
    end
    object actReport: TAction
      Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080
      OnExecute = actReportExecute
    end
    object acDesighn: TAction
      Caption = 'acDesighn'
      ShortCut = 57412
      OnExecute = acDesighnExecute
    end
  end
  object DataSet: TpFIBDataSet
    Database = DatabaseWork
    Transaction = ReadTr
    SelectSQL.Strings = (
      'SELECT * FROM ST_INI_PRINT_SETUP')
    Left = 301
    Top = 281
    poSQLINT64ToBCD = True
    object DataSetORD_FIELD: TFIBIntegerField
      FieldName = 'ORD_FIELD'
    end
    object DataSetNAME_FIELD: TFIBStringField
      FieldName = 'NAME_FIELD'
      Size = 50
      EmptyStrToNull = True
    end
    object DataSetSELECT_FIELD: TFIBBooleanField
      FieldName = 'SELECT_FIELD'
    end
  end
  object RxMemoryData: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ORD_FIELD'
        DataType = ftInteger
      end
      item
        Name = 'NAME_FIELD'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ON_CHECK'
        DataType = ftInteger
      end>
    Left = 271
    Top = 281
  end
  object DatabaseWork: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTr
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 96
    Top = 253
  end
  object ReadTr: TpFIBTransaction
    DefaultDatabase = DatabaseWork
    TimeoutAction = TARollback
    Left = 195
    Top = 253
  end
  object DataSetReport: TpFIBDataSet
    Database = DatabaseWork
    Transaction = ReadTr
    SelectSQL.Strings = (
      '')
    Left = 131
    Top = 258
    poSQLINT64ToBCD = True
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 166
    Top = 286
  end
  object frReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 40346.479364143500000000
    ReportOptions.LastChange = 40429.556363379600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var n_line:integer;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' if GroupHeader1.visible = true then n_line:=0;'
      'end;'
      ''
      'procedure GroupHeader2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'if GroupHeader2.visible = true then n_line:=0;'
      'end;'
      ''
      'procedure GroupHeader3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'if GroupHeader3.visible = true then  n_line:=0;'
      'end;'
      ''
      'procedure GroupHeader4OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'if GroupHeader4.visible = true then  n_line:=0;'
      'end;'
      ''
      'procedure GroupHeader5OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'if GroupHeader5.visible = true then n_line:=0;'
      'end;'
      ''
      'procedure GroupHeader6OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'if GroupHeader6.visible = true then  n_line:=0;'
      'end;'
      ''
      'procedure GroupHeader7OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'if GroupHeader7.visible = true then  n_line:=0;'
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' if n_line = 0 then'
      '  begin'
      '   memo105.visible:=true;'
      '   memo13.visible:=true;'
      '   memo95.visible:=true;'
      '   memo96.visible:=true;'
      '   memo97.visible:=true;'
      '   memo98.visible:=true;'
      '   memo91.visible:=true;'
      '   memo99.visible:=true;'
      '   memo101.visible:=true;'
      '   memo93.visible:=true;'
      '   memo103.visible:=true;'
      '   memo94.visible:=true;'
      '   memo104.visible:=true;'
      '   memo92.visible:=true;'
      '   memo100.visible:=true;'
      '   memo102.visible:=true;'
      '  end'
      '  else'
      '  begin'
      '   masterdata1.Height:= memo40.height;'
      ''
      '    memo40.top:=0;'
      '    memo21.top:=0;'
      '    memo22.top:=0;'
      '    memo23.top:=0;'
      '    memo24.top:=0;'
      '    memo25.top:=0;'
      '    memo26.top:=0;'
      '    memo27.top:=0;'
      '    memo37.top:=0;'
      '    memo38.top:=0;'
      '    memo39.top:=0;'
      ''
      '  { memo105.top:=0;'
      '   memo13.top:=0;'
      '   memo95.top:=0.5;'
      '   memo96.top:=0.5;'
      '   memo97.top:=0.5;'
      '   memo98.top:=0.5;'
      '   memo91.top:=0;'
      '   memo99.top:=0.5;'
      '   memo101.top:=0.5;'
      '   memo93.top:=0;'
      '   memo103.top:=0.5;'
      '   memo94.top:=0;'
      '   memo104.top:=0.5;'
      '   memo92.top:=0;'
      '   memo100.top:=0.5;'
      '   memo102.top:=0.5;}'
      ''
      '   memo105.visible:=false;'
      '   memo13.visible:=false;'
      '   memo95.visible:=false;'
      '   memo96.visible:=false;'
      '   memo97.visible:=false;'
      '   memo98.visible:=false;'
      '   memo91.visible:=false;'
      '   memo99.visible:=false;'
      '   memo101.visible:=false;'
      '   memo93.visible:=false;'
      '   memo103.visible:=false;'
      '   memo94.visible:=false;'
      '   memo104.visible:=false;'
      '   memo92.visible:=false;'
      '   memo100.visible:=false;'
      '   memo102.visible:=false;'
      ' end;'
      '  n_line:=n_line+1;'
      'end;'
      ''
      'procedure Header1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  PageHeader1.Visible:=False;'
      'end;'
      ''
      'begin'
      ' n_line:=0;'
      'end.')
    Left = 197
    Top = 284
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = 'PERIOD'
        Value = #39#1042#1045#1056#1045#1057#1045#1053#1068'  2010'#39
      end
      item
        Name = 'ORG_NAME'
        Value = #39#1044#1086#1085#1053#1059#1045#1058' '#39
      end
      item
        Name = 'ORG_SHORT_NAME'
        Value = #39#1044#1086#1085#1053#1059#1045#1058#39
      end
      item
        Name = 'ORG_KOD_OKPO'
        Value = #39'01566057'#39
      end
      item
        Name = 'FIO'
        Value = #39#39
      end
      item
        Name = 'SM'
        Value = #39#39
      end
      item
        Name = 'RZ'
        Value = #39#39
      end
      item
        Name = 'ST'
        Value = #39#39
      end
      item
        Name = 'OST'
        Value = #39#39
      end
      item
        Name = 'YEAR_B'
        Value = #39'2010'#39
      end
      item
        Name = 'YEAR_E'
        Value = #39'2010'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo13: TfrxMemoView
          Left = 151.181200000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1078#1077#1088#1077#1083#1072' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103)
          ParentFont = False
        end
        object Memo91: TfrxMemoView
          Left = 317.480520000000000000
          Width = 124.724363070000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1074#1093#1110#1076#1085#1077)
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          Left = 593.386210000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1074#1080#1093#1110#1076#1085#1077)
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          Left = 442.205010000000000000
          Width = 75.590473070000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Left = 517.795610000000000000
          Width = 75.590473070000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          Left = 151.181200000000000000
          Top = 18.897650000000000000
          Width = 38.929116770000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1096#1090'.')
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          Left = 190.110316770000000000
          Top = 18.897650000000000000
          Width = 43.086599530000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1076#1110#1083)
          ParentFont = False
        end
        object Memo97: TfrxMemoView
          Left = 232.818963540000000000
          Top = 18.897650000000000000
          Width = 46.110224020000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090#1072#1090#1090#1103)
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          Left = 278.929045980000000000
          Top = 18.897650000000000000
          Width = 38.551164020000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1045#1050#1042)
          ParentFont = False
        end
        object Memo99: TfrxMemoView
          Left = 317.480520000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          Left = 593.386210000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          Left = 377.953000000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Left = 653.858690000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          Left = 442.205010000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 517.795610000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          Width = 151.181200000000000000
          Height = 37.795300000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1030#1041)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 30.236240000000000000
        Top = 162.519790000000000000
        Visible = False
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = 'frxDBDataset1."NAME_FACUL"'
        object Memo1: TfrxMemoView
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."NAME_FACUL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 30.236220470000000000
        Top = 891.969080000000000000
        Visible = False
        Width = 718.110700000000000000
        Stretched = True
        object Memo84: TfrxMemoView
          Width = 128.504020000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086': ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 317.480520000000000000
          Width = 60.472480000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 377.953000000000000000
          Width = 64.252010000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 442.205010000000000000
          Width = 75.590600000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 517.795610000000000000
          Width = 75.590600000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          Left = 593.386210000000000000
          Width = 60.472480000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 653.858690000000000000
          Width = 64.252010000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 128.504020000000000000
          Width = 188.976500000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_FACUL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 30.236240000000000000
        Top = 215.433210000000000000
        Visible = False
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupHeader2OnBeforePrint'
        Condition = 'frxDBDataset1."NAME_SPEC"'
        object Memo2: TfrxMemoView
          Left = 128.504020000000000000
          Width = 589.606680000000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight]
          Memo.Strings = (
            '[frxDBDataset1."NAME_SPEC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Width = 128.503937010000000000
          Height = 30.236220470000000000
          Frame.Typ = [ftLeft]
          Memo.Strings = (
            #1057#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100':')
          VAlign = vaCenter
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 30.236220470000000000
        Top = 839.055660000000000000
        Visible = False
        Width = 718.110700000000000000
        Stretched = True
        object Memo77: TfrxMemoView
          Width = 128.504020000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 317.480520000000000000
          Width = 60.472480000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 377.953000000000000000
          Width = 64.252010000000000000
          Height = 30.236220470000000000
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 442.205010000000000000
          Width = 75.590600000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 517.795610000000000000
          Width = 75.590600000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 593.386210000000000000
          Width = 60.472480000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 653.858690000000000000
          Width = 64.252010000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 128.504020000000000000
          Width = 188.976500000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_SPEC"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 30.236220470000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupHeader3OnBeforePrint'
        Condition = 'frxDBDataset1."NAME_NATIONAL"'
        object Memo4: TfrxMemoView
          Left = 128.504020000000000000
          Width = 589.606680000000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight]
          Memo.Strings = (
            '[frxDBDataset1."NAME_NATIONAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Width = 128.503937010000000000
          Height = 30.236220470000000000
          Frame.Typ = [ftLeft]
          Memo.Strings = (
            #1043#1088#1086#1084#1072#1076#1103#1085#1089#1090#1074#1086':')
          VAlign = vaCenter
        end
      end
      object GroupFooter3: TfrxGroupFooter
        Height = 30.236220470000000000
        Top = 786.142240000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo70: TfrxMemoView
          Width = 128.504020000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086': ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 317.480520000000000000
          Width = 60.472480000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 377.953000000000000000
          Width = 64.252010000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 442.205010000000000000
          Width = 75.590600000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 517.795610000000000000
          Width = 75.590600000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 593.386210000000000000
          Width = 60.472480000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 653.858690000000000000
          Width = 64.252010000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 128.504020000000000000
          Width = 188.976500000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_NATIONAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader4: TfrxGroupHeader
        Height = 30.236220472440900000
        Top = 321.260050000000000000
        Visible = False
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupHeader4OnBeforePrint'
        Condition = 'frxDBDataset1."NAME_FORM_STUD"'
        object Memo6: TfrxMemoView
          Width = 128.503937010000000000
          Height = 30.236220470000000000
          Frame.Typ = [ftLeft]
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#1085#1072#1074#1095#1072#1085#1085#1103':')
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 128.504020000000000000
          Width = 589.606680000000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight]
          Memo.Strings = (
            '[frxDBDataset1."NAME_FORM_STUD"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter4: TfrxGroupFooter
        Height = 30.236220470000000000
        Top = 733.228820000000000000
        Visible = False
        Width = 718.110700000000000000
        Stretched = True
        object Memo63: TfrxMemoView
          Width = 128.504020000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086': ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 317.480520000000000000
          Width = 60.472480000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 377.953000000000000000
          Width = 64.252010000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 442.205010000000000000
          Width = 75.590600000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 517.795610000000000000
          Width = 75.590600000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 593.386210000000000000
          Width = 60.472480000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 653.858690000000000000
          Width = 64.252010000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 128.504020000000000000
          Width = 188.976500000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_FORM_STUD"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader5: TfrxGroupHeader
        Height = 30.236220470000000000
        Top = 374.173470000000000000
        Visible = False
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupHeader5OnBeforePrint'
        Condition = 'frxDBDataset1."NAME_KAT_STUD"'
        object Memo8: TfrxMemoView
          Width = 128.503937010000000000
          Height = 30.236220470000000000
          Frame.Typ = [ftLeft]
          Memo.Strings = (
            #1050#1072#1090#1077#1075#1086#1088#1110#1103' '#1085#1072#1074#1095#1072#1085#1085#1103':')
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 128.504020000000000000
          Width = 589.606680000000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight]
          Memo.Strings = (
            '[frxDBDataset1."NAME_KAT_STUD"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter5: TfrxGroupFooter
        Height = 30.236220472440900000
        Top = 680.315400000000000000
        Visible = False
        Width = 718.110700000000000000
        Stretched = True
        object Memo56: TfrxMemoView
          Width = 128.504020000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 317.480520000000000000
          Width = 60.472480000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 377.953000000000000000
          Width = 64.252010000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 442.205010000000000000
          Width = 75.590600000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 517.795610000000000000
          Width = 75.590600000000000000
          Height = 30.236220470000000000
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 593.386210000000000000
          Width = 60.472480000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 653.858690000000000000
          Width = 64.252010000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 128.504020000000000000
          Width = 188.976500000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_KAT_STUD"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader6: TfrxGroupHeader
        Height = 30.236220472440900000
        Top = 427.086890000000000000
        Visible = False
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupHeader6OnBeforePrint'
        Condition = 'frxDBDataset1."KURS"'
        object Memo10: TfrxMemoView
          Width = 128.503937010000000000
          Height = 30.236220470000000000
          Frame.Typ = [ftLeft]
          Memo.Strings = (
            #1050#1091#1088#1089':')
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 128.504020000000000000
          Width = 589.606680000000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight]
          Memo.Strings = (
            '[frxDBDataset1."KURS"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter6: TfrxGroupFooter
        Height = 30.236220472440900000
        Top = 627.401980000000000000
        Visible = False
        Width = 718.110700000000000000
        Stretched = True
        object Memo49: TfrxMemoView
          Width = 128.504020000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 317.480520000000000000
          Width = 60.472480000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 377.953000000000000000
          Width = 64.252010000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 442.205010000000000000
          Width = 75.590600000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 517.795610000000000000
          Width = 75.590600000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 593.386210000000000000
          Width = 60.472480000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 653.858690000000000000
          Width = 64.252010000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 128.504020000000000000
          Width = 188.976500000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."KURS"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader7: TfrxGroupHeader
        Height = 30.236220470000000000
        Top = 480.000310000000000000
        Visible = False
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupHeader7OnBeforePrint'
        Condition = 'frxDBDataset1."NAME_GROUP"'
        object Memo12: TfrxMemoView
          Width = 128.504020000000000000
          Height = 30.236220470000000000
          Frame.Typ = [ftLeft]
          Memo.Strings = (
            #1043#1088#1091#1087#1072':')
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 128.504020000000000000
          Width = 589.606680000000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight]
          Memo.Strings = (
            '[frxDBDataset1."NAME_GROUP"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter7: TfrxGroupFooter
        Height = 30.236220470000000000
        Top = 574.488560000000000000
        Visible = False
        Width = 718.110700000000000000
        Stretched = True
        object Memo42: TfrxMemoView
          Width = 128.504020000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086': ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 317.480520000000000000
          Width = 60.472480000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 377.953000000000000000
          Width = 64.252010000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 442.205010000000000000
          Width = 75.590600000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 517.795610000000000000
          Width = 75.590600000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 593.386210000000000000
          Width = 60.472480000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 653.858690000000000000
          Width = 64.252010000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 128.504020000000000000
          Width = 188.976500000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_GROUP"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 532.913730000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo21: TfrxMemoView
          Left = 151.181200000000000000
          Width = 38.929116770000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'SM_KOD'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."SM_KOD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 190.110316770000000000
          Width = 42.708646770000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'RZ_KOD'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."RZ_KOD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 232.818821970000000000
          Width = 46.110224020000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ST_KOD'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."ST_KOD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 278.929045980000000000
          Width = 38.551164020000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'KEKV_KOD'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."KEKV_KOD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 317.480520000000000000
          Width = 60.472426300000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'IN_DB_SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."IN_DB_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 377.953000000000000000
          Width = 64.251946540000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'IN_KR_SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."IN_KR_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 442.205010000000000000
          Width = 75.590473070000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'DB_SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."DB_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 517.795610000000000000
          Width = 75.590473070000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'KR_SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."KR_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 593.386210000000000000
          Width = 60.472416540000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'OUT_DB_SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."OUT_DB_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 653.858690000000000000
          Width = 64.251946540000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'OUT_KR_SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."OUT_KR_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."FIO"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 102.047310000000000000
        Top = 982.677800000000000000
        Width = 718.110700000000000000
        object Memo28: TfrxMemoView
          Left = 52.913420000000000000
          Top = 37.795300000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100)
        end
        object Memo29: TfrxMemoView
          Left = 132.283550000000000000
          Top = 37.795300000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
        end
        object Memo30: TfrxMemoView
          Left = 351.496290000000000000
          Top = 37.795300000000000000
          Width = 362.834880000000000000
          Height = 18.897650000000000000
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 79.370130000000000000
        Width = 718.110700000000000000
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    OpenDataSource = False
    DataSet = DataSetReport
    Left = 231
    Top = 285
  end
  object StorProc: TpFIBStoredProc
    Database = DatabaseWork
    Transaction = ReadTr
    Left = 229
    Top = 253
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    ShowProgress = True
    Left = 103
    Top = 164
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 134
    Top = 164
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 164
    Top = 164
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 196
    Top = 166
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    Left = 225
    Top = 167
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 253
    Top = 164
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    Left = 101
    Top = 198
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 135
    Top = 196
  end
  object ds_podchin: TpFIBDataSet
    Database = DatabaseWork
    Transaction = ReadTr
    Left = 88
    Top = 312
    poSQLINT64ToBCD = True
  end
  object ds_podchin_1: TpFIBDataSet
    Database = DatabaseWork
    Transaction = ReadTr
    Left = 88
    Top = 344
    poSQLINT64ToBCD = True
  end
  object DataSetFullSch: TpFIBDataSet
    Database = DatabaseWork
    Transaction = ReadTr
    Left = 56
    Top = 312
    poSQLINT64ToBCD = True
  end
  object ds_pod: TfrxDBDataset
    UserName = 'ds_pod'
    CloseDataSource = False
    DataSet = ds_podchin
    Left = 56
    Top = 344
  end
  object ds_pod2: TfrxDBDataset
    UserName = 'ds_pod2'
    CloseDataSource = False
    DataSet = ds_podchin_1
    Left = 24
    Top = 344
  end
end
