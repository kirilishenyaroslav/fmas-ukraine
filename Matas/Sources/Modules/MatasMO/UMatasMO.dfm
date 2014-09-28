object fmMatasMO: TfmMatasMO
  Left = 353
  Top = 526
  BorderStyle = bsDialog
  Caption = 'fmMatasMO'
  ClientHeight = 305
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelPeriod: TLabel
    Left = 7
    Top = 13
    Width = 68
    Height = 13
    Caption = 'LabelPeriod'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelPo: TLabel
    Left = 249
    Top = 13
    Width = 47
    Height = 13
    Caption = 'LabelPo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 244
    Top = 227
    Width = 91
    Height = 13
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1082#1086#1087#1110#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 6
    Top = 38
    Width = 49
    Height = 13
    Caption = #1056#1072#1093#1091#1085#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 1
    Top = 64
    Width = 450
    Height = 152
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = pm1
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      DataController.DataModeController.SmartRefresh = True
      DataController.DataSource = DataSourceTransit
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.Options = [soSelectedRecords]
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleBG
      Styles.Content = cxStyleBG
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Options.Filtering = False
        SortOrder = soAscending
        Width = 303
        DataBinding.FieldName = 'REG_TITLE'
        IsCaptionAssigned = True
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Options.Filtering = False
        Width = 145
        DataBinding.FieldName = 'REG_SHORT'
        IsCaptionAssigned = True
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxComboBoxS: TcxComboBox
    Left = 88
    Top = 8
    Width = 102
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 12
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    OnKeyPress = cxComboBoxSKeyPress
  end
  object cxSpinEditS: TcxSpinEdit
    Left = 192
    Top = 8
    Width = 57
    Height = 21
    ParentFont = False
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object cxComboBoxPo: TcxComboBox
    Left = 276
    Top = 8
    Width = 102
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 12
    Properties.ItemHeight = 12
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
    OnKeyPress = cxComboBoxPoKeyPress
  end
  object cxSpinEditPo: TcxSpinEdit
    Left = 382
    Top = 8
    Width = 57
    Height = 21
    ParentFont = False
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
  end
  object cxButtonOk: TcxButton
    Left = 97
    Top = 271
    Width = 125
    Height = 25
    Action = ActionOk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
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
  object cxButtonCancel: TcxButton
    Left = 240
    Top = 271
    Width = 125
    Height = 25
    Action = ActionCancel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
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
  object cxCopies: TcxSpinEdit
    Left = 358
    Top = 223
    Width = 49
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.MaxValue = 999.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Properties.ReadOnly = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
    Value = 1
  end
  object cxCheckOnPrinter: TcxCheckBox
    Left = 16
    Top = 224
    Width = 169
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1085#1072' '#1087#1088#1080#1085#1090#1077#1088
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 8
  end
  object cxSelectPrinter: TcxCheckBox
    Left = 16
    Top = 248
    Width = 153
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1080#1073#1088#1072#1090#1080' '#1087#1088#1080#1085#1090#1077#1088
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 9
  end
  object cxCheckBoxDis: TcxCheckBox
    Left = -1
    Top = 281
    Width = 25
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = ''
    TabOrder = 10
  end
  object cxSch: TcxButtonEdit
    Left = 91
    Top = 33
    Width = 305
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxSchPropertiesButtonClick
    TabOrder = 11
  end
  object cxButton1: TcxButton
    Left = 404
    Top = 33
    Width = 34
    Height = 23
    TabOrder = 12
    OnClick = cxButton1Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF2B90EF278DE7FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2A8FEC27
      8CED2489E42388DD1E84D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF298FD63DA2EB3EA3F0379CEA2186DA1A81D1187ECA157C
      C41177BBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3CA2E158BDF260
      C4F93D9EE557BCF73398DF1E83CD1076BC0B73B40B72AF086FAAFF00FFFF00FF
      FF00FFFF00FF046B164AB0F953B7F72F87D163C7FB3D9EE55BBFFB55BAFA3499
      DE2D93D80F76B3066DA7FF00FFFF00FFFF00FF187D5F2B7A83046B162884DE3C
      99D9227BCE40A0EA5ABEFE4FB2F556B9FF56B9FF46AAF3FF00FFFF00FFFF00FF
      0F7D153CBE6131C64831C64831C648046B16046B162D87B63998E844A5F052B6
      FF52B5FFFF00FFFF00FFFF00FF15872231AF4A62F99250EB6F31C6481DA74623
      987631C64831C648046B16046B16FF00FFFF00FFFF00FFFF00FFFF00FF30AD48
      2BA6414FE77837D0531AB427029D01009B0010A41E32B97246A7ACFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF0A75102AAE3F22BC32049A060094000C
      A118027804027804FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      259E3942DC640B9F110077000278040B8717FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF1D912C44DE680FA315006F00FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF13831D43D964
      12AB1C007300FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF1C9A2A1AB127007900FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF18A024027F04
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    UseSystemPaint = False
  end
  object pFIBDatabaseMO: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=tpfibdataset'
      'user_name=SYSDBA')
    DefaultTransaction = pFIBTransactionR
    SQLDialect = 3
    Timeout = 0
    SaveDBParams = False
    WaitForRestoreConnect = 0
    Left = 48
    Top = 97
  end
  object ActionList1: TActionList
    Left = 352
    Top = 104
    object ActionOk: TAction
      Caption = 'ActionOk'
      ShortCut = 13
      OnExecute = ActionOkExecute
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
    object actParam: TAction
      Caption = #1047#1072#1076#1072#1090#1080' '#1087#1072#1088#1072#1084#1077#1090#1088#1080
      OnExecute = actParamExecute
    end
  end
  object pFIBDataSetSelToGrid: TpFIBDataSet
    Database = pFIBDatabaseMO
    Transaction = pFIBTransactionR
    SelectSQL.Strings = (
      'select * from MAT_SEL_INFO_FOR_MEMORD')
    Left = 80
    Top = 96
    poSQLINT64ToBCD = True
    object pFIBDataSetSelToGridREG_TITLE: TFIBStringField
      FieldName = 'REG_TITLE'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetSelToGridREG_SHORT: TFIBStringField
      FieldName = 'REG_SHORT'
      Size = 16
      EmptyStrToNull = True
    end
    object pFIBDataSetSelToGridID_REG: TFIBBCDField
      FieldName = 'ID_REG'
      Size = 0
      RoundByScale = True
    end
  end
  object DataSourceTransit: TDataSource
    DataSet = pFIBDataSetSelToGrid
    Left = 112
    Top = 96
  end
  object pFIBTransactionR: TpFIBTransaction
    DefaultDatabase = pFIBDatabaseMO
    TimeoutAction = TARollback
    Left = 80
    Top = 128
  end
  object cxStyleRepositoryMO: TcxStyleRepository
    Left = 144
    Top = 56
    object cxStyleBG: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
  end
  object pFIBDataSetSelMainInfo: TpFIBDataSet
    Database = pFIBDatabaseMO
    Transaction = pFIBTransactionR
    SelectSQL.Strings = (
      'select * from MAT_PRINT_MEMORD(13,'#39'01.08.2006'#39','#39'31.08.2006'#39')')
    Left = 160
    Top = 128
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSetSelMainInfo
    Left = 112
    Top = 128
  end
  object frxReportMO: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.DoubleBuffered = False
    PreviewOptions.MDIChild = True
    PreviewOptions.Modal = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39037.389708472200000000
    ReportOptions.LastChange = 41326.485325868050000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 192
    Top = 128
    Datasets = <
      item
        DataSet = frxDBDatasetDb
        DataSetName = 'frxDBDatasetDb'
      end
      item
        DataSet = frxDBDatasetKr
        DataSetName = 'frxDBDatasetKr'
      end
      item
        DataSet = frxDBDatasetMO
        DataSetName = 'frxDBDatasetMO'
      end>
    Variables = <
      item
        Name = 'USTANOVA'
        Value = #39#1044#1086#1085#1053#1059#1045#1058' '#39
      end
      item
        Name = 'OKUD'
        Value = #39'01566057'#39
      end
      item
        Name = 'DKUD'
        Value = #39#39
      end
      item
        Name = 'NAME_FORM'
        Value = #39#1052#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1081' '#1086#1088#1076#1077#1088' '#8470' 16'#39
      end
      item
        Name = 'NAZVA'
        Value = #39#1053#1072#1082#1086#1087#1080#1095#1091#1074#1072#1083#1100#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1087#1086#1079#1072#1073#1072#1083#1072#1085#1089#1086#1074#1086#1075#1086' '#1086#1073#1083#1110#1082#1091#39
      end
      item
        Name = 'NUMAKT'
        Value = #39#39
      end
      item
        Name = 'PERIOD'
        Value = #39#1079' '#1089#1110#1095#1077#1085#1100' 2011p. '#1087#1086' '#1073#1077#1088#1077#1079#1077#1085#1100' 2012p.'#39
      end
      item
        Name = 'SCHS'
        Value = #39#1060#1110#1083#1100#1090#1088' '#1079#1072' '#1088#1072#1093#1091#1085#1082#1072#1084#1080' 6/01;6/02;8/01;8/02;'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 529.134200000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetMO
        DataSetName = 'frxDBDatasetMO'
        RowCount = 0
        Stretched = True
        object Memo26: TfrxMemoView
          Width = 40.000000000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 40.000000000000000000
          Width = 226.299320000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMO."NAME_NOMN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 620.000000000000000000
          Width = 100.000000000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetMO."SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 535.000000000000000000
          Width = 85.000000000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDatasetMO."DB_SCH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 450.000000000000000000
          Width = 85.000000000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDatasetMO."KR_SCH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 266.299320000000000000
          Width = 183.700680000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[<frxDBDatasetMO."KOL_MAT">] '#1096#1090'.  ([<frxDBDatasetMO."SUMMA">])'
            
              '[<frxDBDatasetMO."NAME_DOC">] '#8470'[<frxDBDatasetMO."NUM_DOC">] '#1074#1110#1076' ' +
              '[<frxDBDatasetMO."DATE_DOC">]   ')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 306.708720000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Width = 423.307086614173000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[USTANOVA]')
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 170.078850000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '('#1085#1072#1079#1074#1072' '#1091#1089#1090#1072#1085#1086#1074#1080')')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 483.779840000000000000
          Width = 234.330860000000000000
          Height = 79.370130000000000000
          Memo.Strings = (
            #1047#1072#1090#1074#1077#1088#1076#1078#1077#1085#1086
            #1053#1072#1082#1072#1079' '#1044#1077#1088#1078#1072#1074#1085#1086#1075#1086' '#1082#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072
            #1059#1082#1088#1072#1111#1085#1080
            '05.06.03 '#1088'. '#8470' 117')
        end
        object Memo5: TfrxMemoView
          Left = 18.897650000000000000
          Top = 52.913420000000000000
          Width = 113.385900000000000000
          Height = 30.236240000000000000
          Memo.Strings = (
            #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1082#1086#1076
            #1079#1072' '#1028#1044#1056#1055#1054#1059)
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 136.063080000000000000
          Top = 52.913420000000000000
          Width = 94.488250000000000000
          Height = 30.236240000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[OKUD]')
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 483.779840000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 30.236240000000000000
          Memo.Strings = (
            #1050#1086#1076' '#1079#1072' '#1044#1050#1059#1044)
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 585.827150000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 30.236240000000000000
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[DKUD]')
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Top = 143.622140000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[NAME_FORM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Top = 166.299320000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[PERIOD]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Top = 188.976500000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[NAZVA]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Top = 234.897650000000000000
          Width = 40.000000000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1079'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 40.000000000000000000
          Top = 234.897650000000000000
          Width = 226.299320000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1072' '
            #1079#1072#1073#1072#1083#1072#1085#1089#1086#1074#1086#1075#1086' '#1086#1073#1083#1110#1082#1091' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 620.000000000000000000
          Top = 234.897650000000000000
          Width = 100.000000000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 535.000000000000000000
          Top = 234.897650000000000000
          Width = 85.000000000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090
            #1089#1091#1073#1088#1072#1093#1091#1085#1082#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 450.000000000000000000
          Top = 234.897650000000000000
          Width = 85.000000000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090
            #1089#1091#1073#1088#1072#1093#1091#1085#1082#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 266.299320000000000000
          Top = 234.897650000000000000
          Width = 183.700680000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1076#1093#1086#1076#1078#1077#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Top = 284.031540000000000000
          Width = 40.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 40.000000000000000000
          Top = 284.031540000000000000
          Width = 226.299320000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 620.000000000000000000
          Top = 284.031540000000000000
          Width = 100.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 535.000000000000000000
          Top = 284.031540000000000000
          Width = 85.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 450.000000000000000000
          Top = 284.031540000000000000
          Width = 85.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 266.299320000000000000
          Top = 284.031540000000000000
          Width = 183.700680000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 3.779530000000000000
          Top = 211.653680000000000000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SCHS]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Top = 506.457020000000000000
        Visible = False
        Width = 718.110700000000000000
        Condition = 'frxDBDatasetMO."ALL_INFO_DOC"'
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 15.000000000000000000
        Top = 574.488560000000000000
        Width = 718.110700000000000000
        object Memo28: TfrxMemoView
          Left = 100.157480310000000000
          Width = 350.000000000000000000
          Height = 15.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.Strings = (
            #1056#1072#1079#1086#1084)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 620.000000000000000000
          Width = 100.000000000000000000
          Height = 15.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetMO."SUMMA">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Width = 40.000000000000000000
          Height = 15.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 40.000000000000000000
          Width = 60.000000000000000000
          Height = 15.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 450.000000000000000000
          Width = 85.000000000000000000
          Height = 15.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 534.764070000000000000
          Width = 85.000000000000000000
          Height = 15.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 98.267780000000000000
        Top = 347.716760000000000000
        Width = 718.110700000000000000
        PrintOnFirstPage = False
        object Memo30: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1089#1090#1086#1088'. [Page#]')
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Top = 4.000000000000000000
          Width = 618.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[NAME_FORM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Top = 26.456710000000000000
          Width = 40.000000000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1079'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 40.000000000000000000
          Top = 26.456710000000000000
          Width = 226.299320000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1072' '
            #1079#1072#1073#1072#1083#1072#1085#1089#1086#1074#1086#1075#1086' '#1086#1073#1083#1110#1082#1091' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 620.000000000000000000
          Top = 26.456710000000000000
          Width = 100.000000000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 535.000000000000000000
          Top = 26.456710000000000000
          Width = 85.000000000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090
            #1089#1091#1073#1088#1072#1093#1091#1085#1082#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 450.000000000000000000
          Top = 26.456710000000000000
          Width = 85.000000000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090
            #1089#1091#1073#1088#1072#1093#1091#1085#1082#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 266.299320000000000000
          Top = 26.456710000000000000
          Width = 183.700680000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1076#1093#1086#1076#1078#1077#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Top = 75.590600000000000000
          Width = 40.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 40.000000000000000000
          Top = 75.590600000000000000
          Width = 226.299320000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 620.000000000000000000
          Top = 75.590600000000000000
          Width = 100.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 535.000000000000000000
          Top = 75.590600000000000000
          Width = 85.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 450.000000000000000000
          Top = 75.590600000000000000
          Width = 85.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 266.299320000000000000
          Top = 75.590600000000000000
          Width = 183.700680000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      PrintOnPreviousPage = True
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetKr
        DataSetName = 'frxDBDatasetKr'
        RowCount = 0
        object Memo31: TfrxMemoView
          Left = 291.023810000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDatasetKr."KR_SCH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 415.748300000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetKr."SUMMA_KR"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 293.637910000000000000
        Top = 578.268090000000000000
        Width = 718.110700000000000000
        object Memo34: TfrxMemoView
          Left = 75.590600000000000000
          Top = 36.000000000000000000
          Width = 188.976500000000000000
          Height = 37.795300000000000000
          Memo.Strings = (
            #1057#1091#1084#1072' '#1086#1073#1086#1088#1086#1090#1110#1074' '#1079#1072
            #1084#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1084' '#1086#1088#1076#1077#1088#1086#1084':')
        end
        object Memo36: TfrxMemoView
          Left = 75.590600000000000000
          Top = 92.692949999999900000
          Width = 634.961040000000000000
          Height = 169.165430000000000000
          Memo.Strings = (
            
              #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100': _________________   _________________   ____________' +
              '____________'
            
              '                            ('#1087#1086#1089#1072#1076#1072')                      ('#1087#1110#1076#1087#1080 +
              #1089')                 ('#1110#1085#1110#1094#1110#1072#1083#1080' '#1110' '#1087#1088#1110#1079#1074#1080#1097#1077')'
            ''
            
              #1055#1077#1088#1077#1074#1110#1088#1080#1074'  : _________________   _________________   ___________' +
              '_____________'
            
              '                            ('#1087#1086#1089#1072#1076#1072')                      ('#1087#1110#1076#1087#1080 +
              #1089')                 ('#1110#1085#1110#1094#1110#1072#1083#1080' '#1110' '#1087#1088#1110#1079#1074#1080#1097#1077')'
            ''
            
              #1043#1086#1083#1086#1074#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088': _________________   _________________   ____' +
              '____________________'
            
              '                                        ('#1087#1086#1089#1072#1076#1072')                ' +
              '      ('#1087#1110#1076#1087#1080#1089')                ('#1110#1085#1110#1094#1110#1072#1083#1080' '#1110' '#1087#1088#1110#1079#1074#1080#1097#1077')'
            ''
            
              '"___" _______________ 20___ '#1088'.                                  ' +
              '                               '#1044#1086#1076#1072#1090#1086#1082' '#1085#1072' ____ '#1072#1088#1082#1091#1096#1072#1093)
        end
        object Memo44: TfrxMemoView
          Left = 415.748300000000000000
          Top = 39.779530000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetDb."SUMMA_DB">)]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 291.023810000000000000
          Top = 39.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1056#1072#1079#1086#1084':')
        end
      end
      object Header1: TfrxHeader
        Height = 75.000000000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        object Memo37: TfrxMemoView
          Top = 37.795300000000000000
          Width = 230.551330000000000000
          Height = 30.236240000000000000
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086' '#1076#1086' '#1082#1088#1077#1076#1080#1090#1091
            #1089#1091#1073#1088#1072#1093#1091#1085#1082#1110#1074':')
        end
        object Memo38: TfrxMemoView
          Left = 291.023810000000000000
          Top = 37.795300000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1073#1088#1072#1093#1091#1085#1086#1082)
        end
        object Memo39: TfrxMemoView
          Left = 415.748300000000000000
          Top = 37.795300000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1057#1091#1084#1072)
        end
      end
      object Header2: TfrxHeader
        Height = 61.574830000000000000
        Top = 347.716760000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        object Memo33: TfrxMemoView
          Top = 20.000000000000000000
          Width = 188.976500000000000000
          Height = 34.015770000000000000
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086' '#1076#1086' '#1076#1077#1073#1077#1090#1091
            #1089#1091#1073#1088#1072#1093#1091#1085#1082#1110#1074':')
        end
        object Memo32: TfrxMemoView
          Left = 291.023810000000000000
          Top = 20.000000000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1073#1088#1072#1093#1091#1085#1086#1082)
        end
        object Memo41: TfrxMemoView
          Left = 415.748300000000000000
          Top = 20.000000000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1057#1091#1084#1072)
        end
      end
      object MasterData3: TfrxMasterData
        Height = 18.897650000000000000
        Top = 476.220780000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetDb
        DataSetName = 'frxDBDatasetDb'
        RowCount = 0
        object Memo42: TfrxMemoView
          Left = 291.023810000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDatasetDb."DB_SCH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 415.748300000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetDb."SUMMA_DB"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader2: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo50: TfrxMemoView
          Left = 624.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1089#1090#1086#1088'. [Page#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 200.315090000000000000
        Visible = False
        Width = 718.110700000000000000
        Condition = 'frxDBDatasetMO."KR_ID_DOC"'
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 37.795275590000000000
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        object Memo64: TfrxMemoView
          Left = 415.748300000000000000
          Top = 11.338590000000000000
          Width = 136.063080000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetKr."SUMMA_KR">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 291.023810000000000000
          Top = 11.338590000000000000
          Width = 124.724490000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1079#1086#1084':')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 430.866420000000000000
        Visible = False
        Width = 718.110700000000000000
        Condition = 'frxDBDatasetMO."KR_ID_DOC"'
      end
      object GroupFooter3: TfrxGroupFooter
        Height = 37.795280470000000000
        Top = 517.795610000000000000
        Width = 718.110700000000000000
        object Memo66: TfrxMemoView
          Left = 415.748300000000000000
          Top = 11.338590000000000000
          Width = 136.063080000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetDb."SUMMA_DB">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 291.023810000000000000
          Top = 11.338590000000000000
          Width = 124.724490000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1079#1086#1084':')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDatasetMO: TfrxDBDataset
    UserName = 'frxDBDatasetMO'
    CloseDataSource = False
    DataSet = pFIBDataSetSelMainInfo
    Left = 296
    Top = 128
  end
  object pFIBDataSetSelMainForKr: TpFIBDataSet
    Database = pFIBDatabaseMO
    Transaction = pFIBTransactionR
    SelectSQL.Strings = (
      
        'select * from MAT_PRINT_MEMORD_SUM_KR(13,'#39'01.08.2006'#39','#39'31.08.200' +
        '6'#39')')
    Left = 224
    Top = 96
    poSQLINT64ToBCD = True
  end
  object frxDBDatasetKr: TfrxDBDataset
    UserName = 'frxDBDatasetKr'
    CloseDataSource = False
    DataSet = pFIBDataSetSelMainForKr
    Left = 224
    Top = 128
  end
  object frxDBDatasetDb: TfrxDBDataset
    UserName = 'frxDBDatasetDb'
    CloseDataSource = False
    DataSet = pFIBDataSetSelMainForDb
    Left = 256
    Top = 128
  end
  object pFIBDataSetSelMainForDb: TpFIBDataSet
    Database = pFIBDatabaseMO
    Transaction = pFIBTransactionR
    SelectSQL.Strings = (
      
        'select * from MAT_PRINT_MEMORD_SUM_DB(13,'#39'01.08.2006'#39','#39'31.08.200' +
        '6'#39')')
    Left = 256
    Top = 96
    poSQLINT64ToBCD = True
  end
  object pm1: TPopupMenu
    Left = 40
    Top = 136
    object N1: TMenuItem
      Action = actParam
      Bitmap.Data = {
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
    end
  end
  object DS_Param: TpFIBDataSet
    Database = pFIBDatabaseMO
    Transaction = pFIBTransactionR
    Left = 40
    Top = 182
    poSQLINT64ToBCD = True
  end
  object Tr_Params: TpFIBTransaction
    DefaultDatabase = pFIBDatabaseMO
    TimeoutAction = TARollback
    Left = 72
    Top = 182
  end
  object StPr_Params: TpFIBStoredProc
    Database = pFIBDatabaseMO
    Transaction = Tr_Params
    Left = 104
    Top = 183
  end
  object ds_11_12: TpFIBDataSet
    Database = pFIBDatabaseMO
    Transaction = pFIBTransactionR
    Left = 139
    Top = 182
    poSQLINT64ToBCD = True
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 198
    Top = 91
  end
end
