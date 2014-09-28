object fmAvanceMemorialZvedPrint: TfmAvanceMemorialZvedPrint
  Left = 437
  Top = 236
  Width = 675
  Height = 579
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object TPanel
    Left = 0
    Top = 456
    Width = 659
    Height = 85
    Align = alBottom
    TabOrder = 0
    object LabelFormirovanie: TLabel
      Left = 16
      Top = 88
      Width = 107
      Height = 13
      Caption = #1092#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1079#1074#1110#1090#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxButtonPrint: TcxButton
      Left = 408
      Top = 52
      Width = 115
      Height = 25
      Action = Aprint
      TabOrder = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000830F0000830F00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A99B9B9B9B
        9B9B9B9B9B9B9B9B9B9B9B9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFA6A8A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF737373696969656563929391FFFFFFAF
        AFAFAFAFAFAFAFAFFFFFFF7B7B754F4F4F545454545454FF00FFFF00FF737373
        93979793979775777590918EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B7B755B5C
        5C787B7B606161545454FF00FF737373939797ADB5B56667665F5F5F77777777
        77777777777777777171715A5A586869697F8282707171545454FF00FF737373
        ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5A2A8A86AA4
        7708B518767878565757FF00FF737373D2D2D2988D91997C809A797BAA8186AA
        7F86AA7E86AD828AA77F859D7C7F8B7D7A5E9063787A7A575858FF00FF737373
        D2D2D2855A62956B6D8A6969896D6D876B6B866A6A886E6D8A706F8D6A699363
        6A9C6C819397975C5D5DFF00FF737373D2D2D26F4952583F415F4C4C74696972
        67677166667166667166665E424254393C8A72749397976C6D6DFF00FF737373
        ADB5B57E686A757272A6A8A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9B6E5F
        61988989ADB5B56C6D6DFF00FFFF00FF7373738E81818F8485A6A8A9FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9B9B9B8473748F85856C6D6DFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFA6A8A9FFFFFFFFFFFFFFFFFFA6A8A99B9B9B9B9B9BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A9FFFFFFFF
        FFFFFFFFFFA6A8A9FFFFFF9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFA6A8A9FFFFFFFCFCFCFFFFFFA6A8A99B9B9BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A99B9B9B9B
        9B9B9B9B9B9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object cxButtonClose: TcxButton
      Left = 528
      Top = 52
      Width = 121
      Height = 25
      Cancel = True
      Caption = 'cxButtonClose'
      TabOrder = 1
      OnClick = cxButtonCloseClick
      Glyph.Data = {
        32040000424D3204000000000000360000002800000014000000110000000100
        180000000000FC030000120B0000120B00000000000000000000C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4B54A009C31009C3100C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4B54A00FFEFA5FFEFA55A31185A3118C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4B54A00FFEFA5FFEFA5FFE78CFFE78C313131313131C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        FF6331B54A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65A3131319C31009C31
        00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF31FFFF6331B5
        4A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65AFF9C00FF9C639C3100C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331B54A00FFEF
        A5FFEFA5000000080808FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4080808C8D0D4C8D0D4FF6331B54A00FFEFA5FFEFA5
        FFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4000000000000C8D0D4C8D0D4FF6331B54A00F7FFFFFFDE84FFDE84FF
        DE84FFDE84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000
        FFFFCE000000000000000000000000B54A00F7FFFFFFEFA5FFDE84FFDE84FFDE
        84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4000000FFFFCEFFFFCEFF
        FFBDFFC65AFFA510FF9C00B54A00F7FFFFFFEFA5FFDE84FFDE84FFCE63FFC65A
        FF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000FFFFCE0000000000
        00000000080808B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF
        9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4080808000000C8D0D4C8D0D4
        FF6331B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C31
        00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4FF31FFFF6331C6
        5A00C65A00FFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C009C3100C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD6
        73C65A00C65A00CE6363FFCE63FFC65AFF9C00FF9C009C3100C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD673FFD673
        FFD673C65A00C65A00CE6363FF9C00FF9C009C3100C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFDE84FFDE84FFDE84FFDE84FF
        DE84FFDE84C65A00C65A00C65A009C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4FF6331FF6331FF6331FF6331FF6331FF6331FF63
        31FF6331FF6331FF6331FF6331C8D0D4C8D0D4C8D0D4}
      UseSystemPaint = False
    end
    object cxLabel5: TcxLabel
      Left = 8
      Top = 13
      Width = 89
      Height = 17
      AutoSize = False
      TabOrder = 2
      Caption = #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100
    end
    object ButtonEditBuh: TcxButtonEdit
      Left = 142
      Top = 13
      Width = 258
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = ButtonEditBuhPropertiesButtonClick
      Style.Color = 15204351
      TabOrder = 3
    end
    object cxLabel6: TcxLabel
      Left = 8
      Top = 37
      Width = 105
      Height = 17
      AutoSize = False
      TabOrder = 4
      Caption = #1055#1077#1088#1077#1074#1110#1088#1080#1074
    end
    object ButtonEditFioCheck: TcxButtonEdit
      Left = 142
      Top = 37
      Width = 258
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = ButtonEditFioCheckPropertiesButtonClick
      Style.Color = 15204351
      TabOrder = 5
    end
    object cxLabel7: TcxLabel
      Left = 8
      Top = 61
      Width = 113
      Height = 17
      AutoSize = False
      TabOrder = 6
      Caption = #1043#1086#1083#1086#1074#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088
    end
    object ButtonEditGlBuhg: TcxButtonEdit
      Left = 142
      Top = 61
      Width = 258
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = ButtonEditGlBuhgPropertiesButtonClick
      Style.Color = 15204351
      TabOrder = 7
    end
    object ProgressBar: TcxProgressBar
      Left = 16
      Top = 104
      Width = 633
      Height = 21
      TabOrder = 8
    end
  end
  object TPanel
    Left = 0
    Top = 0
    Width = 659
    Height = 57
    Align = alTop
    TabOrder = 1
    object cxComboBoxMonth: TcxComboBox
      Left = 105
      Top = 3
      Width = 153
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 12
      Properties.Items.Strings = (
        #1089#1110#1095#1077#1085#1100
        #1083#1102#1090#1080#1081
        #1073#1077#1088#1077#1079#1077#1085#1100
        #1082#1074#1110#1090#1077#1085#1100
        #1090#1088#1072#1074#1077#1085#1100
        #1095#1077#1088#1074#1077#1085#1100
        #1083#1080#1087#1077#1085#1100
        #1089#1077#1088#1087#1077#1085#1100
        #1074#1077#1088#1077#1089#1077#1085#1100
        #1078#1086#1074#1090#1077#1085#1100
        #1083#1080#1089#1090#1086#1087#1072#1076
        #1075#1088#1091#1076#1077#1085#1100)
      TabOrder = 0
    end
    object cxButton1: TcxButton
      Left = 400
      Top = 3
      Width = 129
      Height = 22
      Action = APereform
      TabOrder = 1
      LookAndFeel.Kind = lfStandard
    end
    object cxCheckBoxShow: TcxCheckBox
      Left = 7
      Top = 26
      Width = 284
      Height = 21
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      State = cbsChecked
      TabOrder = 2
    end
    object cxLabel1: TcxLabel
      Left = 9
      Top = 3
      Width = 96
      Height = 22
      TabStop = False
      AutoSize = False
      TabOrder = 3
      Caption = #1059#1082#1072#1078#1080#1090#1077' '#1084#1077#1089#1103#1094
    end
    object cxLabel2: TcxLabel
      Left = 259
      Top = 3
      Width = 39
      Height = 19
      TabStop = False
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 4
      Caption = #1075#1086#1076
    end
    object cxSpinEditYear: TcxSpinEdit
      Left = 303
      Top = 3
      Width = 57
      Height = 21
      Properties.MaxValue = 2999.000000000000000000
      Properties.MinValue = 2004.000000000000000000
      Properties.ReadOnly = False
      TabOrder = 5
      Value = 2004
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 57
    Width = 659
    Height = 399
    Align = alClient
    TabOrder = 2
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 657
      Height = 397
      Align = alClient
      BevelKind = bkFlat
      TabOrder = 0
      object cxGridDBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid1DBTableView1DblClick
        DataController.DataSource = DataSource1
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleYellow
        Styles.Content = cxStyleYellow
        Styles.ContentEven = cxStyleYellow
        Styles.ContentOdd = cxStyleYellow
        Styles.Inactive = cxStyle4
        Styles.IncSearch = cxStyle11
        Styles.Selection = cxStyle17
        Styles.FilterBox = cxStyleBorder
        Styles.Footer = cxStyleBorder
        Styles.Group = cxStyleYellow
        Styles.GroupByBox = cxStyleYellow
        Styles.Header = cxStyleBorder
        Styles.Indicator = cxStyleYellow
        Styles.NewItemRowInfoText = cxStyleYellow
        Styles.Preview = cxStyleYellow
        object cxGridDBTableView1DBColumn1: TcxGridDBColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Width = 31
          DataBinding.FieldName = 'print'
        end
        object cxGridDBTableView1DBColumn2: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Width = 84
          DataBinding.FieldName = 'Reg_short'
        end
        object cxGridDBTableView1DBColumn3: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          SortOrder = soAscending
          Width = 80
          DataBinding.FieldName = 'kod_sch'
        end
        object cxGridDBTableView1DBColumn4: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Width = 150
          DataBinding.FieldName = 'title_sch'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  object DBase: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=sysdba'
      'sql_role_name=')
    DefaultUpdateTransaction = Tr
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 112
    Top = 32
  end
  object Tr: TpFIBTransaction
    DefaultDatabase = DBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 144
    Top = 32
  end
  object StyleRepository: TcxStyleRepository
    Left = 184
    Top = 24
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
  object DataSource1: TDataSource
    DataSet = RXLeft
    Left = 56
    Top = 136
  end
  object DS: TpFIBDataSet
    Left = 176
    Top = 128
    poSQLINT64ToBCD = True
  end
  object RXLeft: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'print'
        DataType = ftSmallint
      end
      item
        Name = 'id_sch'
        DataType = ftVariant
      end
      item
        Name = 'id_ras'
        DataType = ftVariant
      end
      item
        Name = 'kod_sch'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'title_sch'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'kod_ras'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Reg_short'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'id_reg'
        DataType = ftVariant
      end>
    AfterScroll = RXLeftAfterScroll
    Left = 24
    Top = 136
  end
  object TWr: TpFIBTransaction
    DefaultDatabase = DBase
    TimeoutAction = TARollback
    Left = 160
    Top = 80
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = DBase
    Transaction = TWr
    AutoCommit = True
    RefreshTransactionKind = tkUpdateTransaction
    UpdateSQL.Strings = (
      'UPDATE BANK_TEMP_MO SET '
      '    PRINT_MO = ?PRINT_MO,'
      '    PRINT_RAS_SCH = ?PRINT_RAS_SCH'
      ' WHERE     '
      '            ID_SESSION = ?OLD_ID_SESSION'
      '     and ID_SCH = ?OLD_ID_SCH'
      '     and ID_RAS = ?OLD_ID_RAS'
      '     and ID_PKV = ?OLD_ID_PKV'
      '     and ID_TYPE_FINANCE = ?OLD_ID_TYPE_FINANCE'
      '    ')
    RefreshSQL.Strings = (
      'SELECT'
      '    BAN.ID_SESSION,'
      '    BAN.ID_SCH,'
      '    BAN.KOD_SCH,'
      '    BAN.TITLE_SCH,'
      '    BAN.ID_RAS,'
      '    BAN.KOD_RAS,'
      '    BAN.ID_PKV,'
      '    BAN.PKV_TITLE,'
      '    BAN.PKV_KOD,'
      '    BAN.ID_TYPE_FINANCE,'
      '    BAN.TYPE_FINANCE_NAME,'
      '    BAN.TYPE_FINANCE_CODE,'
      '    BAN.MO_CHAR,'
      '    BAN.PRINT_MO,'
      '    BAN.PRINT_RAS_SCH'
      'FROM'
      '    BANK_TEMP_MO BAN'
      ' WHERE '
      '    (    '
      '     BAN.ID_SESSION = ?OLD_ID_SESSION'
      '     and BAN.ID_SCH = ?OLD_ID_SCH'
      '     and BAN.ID_RAS = ?OLD_ID_RAS'
      '     and BAN.ID_PKV = ?OLD_ID_PKV'
      '     and BAN.ID_TYPE_FINANCE = ?OLD_ID_TYPE_FINANCE'
      '    )')
    SelectSQL.Strings = (
      'SELECT'
      '    BAN.ID_SESSION,'
      '    BAN.ID_SCH,'
      '    BAN.KOD_SCH,'
      '    BAN.TITLE_SCH,'
      '    BAN.ID_RAS,'
      '    BAN.KOD_RAS,'
      '    BAN.ID_PKV,'
      '    BAN.PKV_TITLE,'
      '    BAN.PKV_KOD,'
      '    BAN.ID_TYPE_FINANCE,'
      '    BAN.TYPE_FINANCE_NAME,'
      '    BAN.TYPE_FINANCE_CODE,'
      '    BAN.MO_CHAR,'
      '    BAN.PRINT_MO,'
      '    BAN.PRINT_RAS_SCH'
      'FROM'
      '    BANK_TEMP_MO BAN'
      ' WHERE     '
      '     ID_SESSION = ?OLD_ID_SESSION'
      '     and ID_SCH = ?OLD_ID_SCH')
    AutoUpdateOptions.UpdateTableName = 'BANK_TEMP_MO'
    AutoUpdateOptions.ParamsToFieldsLinks.Strings = (
      'ID_SESSION=OLD_ID_SESSION'
      'ID_SCH=OLD_ID_SCH')
    Left = 376
    Top = 112
    poSQLINT64ToBCD = True
  end
  object DataSource3: TDataSource
    DataSet = pFIBDataSet1
    Left = 472
    Top = 112
  end
  object ActionList1: TActionList
    Left = 344
    Top = 168
    object Aprint: TAction
      Caption = 'Aprint'
      ShortCut = 121
      OnExecute = AprintExecute
    end
    object APereform: TAction
      Caption = 'APereform'
      OnExecute = APereformExecute
    end
  end
  object DSPer: TpFIBDataSet
    Left = 144
    Top = 160
    poSQLINT64ToBCD = True
  end
  object TWrite: TpFIBTransaction
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'wait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 224
    Top = 104
  end
  object Query: TpFIBQuery
    Left = 296
    Top = 128
  end
  object DSDebet: TpFIBDataSet
    Database = DBase
    Transaction = Tr
    SelectSQL.Strings = (
      'select * from J4_MO('#39'01.01.2000'#39', '#39'01.01.2000'#39', 1, 1, 1, 1)')
    Left = 336
    Top = 272
    poSQLINT64ToBCD = True
    object DSDebetNAME_PRED: TFIBStringField
      FieldName = 'NAME_PRED'
      Size = 180
      EmptyStrToNull = True
    end
    object DSDebetSALDO_BEGIN_D: TFIBBCDField
      FieldName = 'SALDO_BEGIN_D'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DSDebetSUMMA_INTO_MBOOK: TFIBBCDField
      FieldName = 'SUMMA_INTO_MBOOK'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DSDebetOKPO: TFIBStringField
      FieldName = 'OKPO'
      Size = 16
      EmptyStrToNull = True
    end
    object DSDebetID_MAN: TFIBBCDField
      FieldName = 'ID_MAN'
      Size = 0
      RoundByScale = True
    end
    object DSDebetID_KEKV: TFIBBCDField
      FieldName = 'ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object DSDebetKOD_KEKV: TFIBIntegerField
      FieldName = 'KOD_KEKV'
    end
    object DSDebetTITLE_KEKV: TFIBStringField
      FieldName = 'TITLE_KEKV'
      Size = 180
      EmptyStrToNull = True
    end
    object DSDebetFAMILIYA: TFIBStringField
      DisplayWidth = 40
      FieldName = 'FAMILIYA'
      Size = 40
      EmptyStrToNull = True
    end
    object DSDebetIMYA: TFIBStringField
      DisplayWidth = 40
      FieldName = 'IMYA'
      Size = 40
      EmptyStrToNull = True
    end
    object DSDebetOTCHESTVO: TFIBStringField
      DisplayWidth = 40
      FieldName = 'OTCHESTVO'
      Size = 40
      EmptyStrToNull = True
    end
    object DSDebetTIN: TFIBStringField
      FieldName = 'TIN'
      Size = 10
      EmptyStrToNull = True
    end
    object DSDebetBIRTHDAY: TFIBDateField
      FieldName = 'BIRTHDAY'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object DSDebetTAB_NUM: TFIBIntegerField
      FieldName = 'TAB_NUM'
    end
    object DSDebetSUMMA_DEBET: TFIBBCDField
      FieldName = 'SUMMA_DEBET'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DSDebetSUMMA_KREDIT: TFIBBCDField
      FieldName = 'SUMMA_KREDIT'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DSDebetOST_DEBET: TFIBBCDField
      FieldName = 'OST_DEBET'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DSDebetOST_KREDIT: TFIBBCDField
      FieldName = 'OST_KREDIT'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DSDebetOST_ALL_DEBET: TFIBBCDField
      FieldName = 'OST_ALL_DEBET'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DSDebetOST_ALL_KREDIT: TFIBBCDField
      FieldName = 'OST_ALL_KREDIT'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DSDebetSALDO_BEGIN_K: TFIBBCDField
      FieldName = 'SALDO_BEGIN_K'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DSDebetDB_SCH_NUMBER: TFIBStringField
      FieldName = 'DB_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DSDebetDB_SCH_TITLE: TFIBStringField
      FieldName = 'DB_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DSDebetDB_ID_SCH: TFIBBCDField
      FieldName = 'DB_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DSDebetDB_DATE_REG: TFIBDateField
      FieldName = 'DB_DATE_REG'
    end
    object DSDebetDB_NUM_DOC: TFIBStringField
      FieldName = 'DB_NUM_DOC'
      Size = 120
      EmptyStrToNull = True
    end
    object DSDebetKR_SCH_NUMBER: TFIBStringField
      FieldName = 'KR_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DSDebetKR_SCH_TITLE: TFIBStringField
      FieldName = 'KR_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DSDebetKR_ID_SCH: TFIBBCDField
      FieldName = 'KR_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DSDebetKR_DATE_REG: TFIBDateField
      FieldName = 'KR_DATE_REG'
    end
    object DSDebetKR_NUM_DOC: TFIBStringField
      FieldName = 'KR_NUM_DOC'
      Size = 120
      EmptyStrToNull = True
    end
    object DSDebetSUMMA_DEBET_ALL: TFIBBCDField
      FieldName = 'SUMMA_DEBET_ALL'
      Size = 2
      RoundByScale = True
    end
    object DSDebetSUMMA_KREDIT_ALL: TFIBBCDField
      FieldName = 'SUMMA_KREDIT_ALL'
      Size = 2
      RoundByScale = True
    end
    object DSDebetMAX_DATE_DOC_OST: TFIBDateField
      FieldName = 'MAX_DATE_DOC_OST'
    end
    object DSDebetNUM_DOC_OST: TFIBStringField
      FieldName = 'NUM_DOC_OST'
      Size = 120
      EmptyStrToNull = True
    end
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39034.776816400500000000
    ReportOptions.LastChange = 41282.665338391210000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      ' fio : string;'
      ' s1, s2, s3, s4, s5, s6 : double;'
      ''
      'procedure MasterData1OnAfterCalcHeight(Sender: TfrxComponent);'
      'begin'
      ''
      ''
      'end;'
      ''
      'procedure ReportTitle1OnAfterCalcHeight(Sender: TfrxComponent);'
      'begin'
      '  s1 := 0;'
      '  s2 := 0;'
      '  s3 := 0;'
      '  s4 := 0;'
      '  s5 := 0;'
      '  s6 := 0;'
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  s1 := s1 + <frDBDebet."OST_DEBET">;'
      '  s2 := s2 + <frDBDebet."OST_KREDIT">;'
      '  s3 := s3 + <frDBDebet."SUMMA_DEBET">;'
      '  s4 := s4 + <frDBDebet."SUMMA_KREDIT">;'
      '  s5 := s5 + <frDBDebet."OST_ALL_DEBET">;'
      '  s6 := s6 + <frDBDebet."OST_ALL_KREDIT">;'
      'end;'
      ''
      'procedure Memo3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' s1 := 0;'
      '  s2 := 0;'
      '  s3 := 0;'
      '  s4 := 0;'
      '  s5 := 0;'
      '  s6 := 0;'
      ''
      'end;'
      ''
      'procedure ReportSummary1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure GroupHeader5OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Memo27OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '     if((<frDBDebet."SUMMA_DEBET">=null) or (<frDBDebet."SUMMA_D' +
        'EBET">=0)) then Memo27.text := '#39#39';'
      'end;'
      ''
      'procedure Memo28OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '     if((<frDBDebet."SUMMA_KREDIT">=null) or (<frDBDebet."SUMMA_' +
        'KREDIT">=0)) then Memo28.text :='#39#39';'
      'end;'
      ''
      'procedure Memo105OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '     if((<frDBDebet."SUMMA_DEBET">=null) or (<frDBDebet."SUMMA_D' +
        'EBET">=0)) then Memo105.text := '#39#39';'
      'end;'
      ''
      'procedure Memo106OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '     if((<frDBDebet."SUMMA_KREDIT">=null) or (<frDBDebet."SUMMA_' +
        'KREDIT">=0)) then Memo106.text :='#39#39';'
      'end;'
      ''
      'procedure Memo116OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '     if((<frDBDebet."SUMMA_DEBET">=null) or (<frDBDebet."SUMMA_D' +
        'EBET">=0)) then Memo116.text := '#39#39';'
      'end;'
      ''
      'procedure Memo119OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '     if((<frDBDebet."SUMMA_KREDIT">=null) or (<frDBDebet."SUMMA_' +
        'KREDIT">=0)) then Memo119.text :='#39#39';'
      'end;'
      ''
      'procedure Memo24OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  if((<j4_mo_print_doc_o>='#39'0'#39')or(<frDBDebet."MAX_DATE_DOC_OST">=' +
        'null)or(<frDBDebet."MAX_DATE_DOC_OST">=0)) then Memo24.text :=<f' +
        'rDBDebet."FAMILIYA">+'#39' '#39'+<frDBDebet."IMYA">+'#39' '#39'+<frDBDebet."OTCH' +
        'ESTVO">;'
      ''
      
        '  if((<j4_mo_print_doc_o>='#39'1'#39')and(<frDBDebet."MAX_DATE_DOC_OST">' +
        '<>null)and(<frDBDebet."MAX_DATE_DOC_OST"><>0)) then Memo24.text ' +
        ':=<frDBDebet."FAMILIYA">+'#39' '#39'+<frDBDebet."IMYA">+'#39' '#39'+<frDBDebet."' +
        'OTCHESTVO">+'#39','#39'+#13+datetostr(<frDBDebet."MAX_DATE_DOC_OST">)+'#39',' +
        #39'+#13+'#39#8470' '#39'+<frDBDebet."NUM_DOC_OST">;'
      ''
      'end;'
      ''
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if  (( <PAGE#>=<TotalPages#>) and (<PAGE#><>'#39'1'#39'))  then'
      '  PageHeader1.Visible := false;'
      'end;'
      ''
      'procedure Memo146OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '   if(<j4_mo_bukv_not>='#39'0'#39') then Memo146.text :=<title_ord> +'#39'-'#39 +
        '+ <buk_ord>;'
      '   if(<j4_mo_bukv_not>='#39'1'#39') then Memo146.text :=<title_ord>;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 416
    Top = 288
    Datasets = <
      item
        DataSet = frDBDebet
        DataSetName = 'frDBDebet'
      end
      item
        DataSet = frDBKSch
        DataSetName = 'frDBKSch'
      end
      item
        DataSet = frxDBKSch
        DataSetName = 'frxDBKSch'
      end
      item
        DataSet = frxDNeos
        DataSetName = 'frxDNeos'
      end
      item
        DataSet = frxKNeos
        DataSetName = 'frxKNeos'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 15.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 298.582870000000000000
        Top = 18.897650000000000000
        Width = 699.213050000000000000
        OnAfterCalcHeight = 'ReportTitle1OnAfterCalcHeight'
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 30.236240000000000000
          Width = 370.393940000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[frDBDebet."NAME_PRED"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Top = 105.826840000000000000
          Width = 699.213050000000000000
          Height = 56.692950000000000000
          OnBeforePrint = 'Memo3OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1086#1075#1088#1072#1084#1072' [name_prog] ([title_prog])'
            #1079#1072' [mon_mo] [year_mo] '#1088'.'
            #1053#1072#1082#1086#1087#1080#1095#1091#1074#1072#1083#1100#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1079#1072' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1072#1084#1080' '#1079' '#1087#1110#1076#1079#1074#1110#1090#1085#1080#1084#1080' '#1086#1089#1086#1073#1072#1084#1080)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 491.338900000000000000
          Top = 11.338590000000000000
          Width = 204.094620000000000000
          Height = 83.149660000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '<b>'#1058#1080#1087#1086#1074#1072' '#1092#1086#1088#1084#1072' '#8470' 386-'#1072#1074#1090' ('#1073#1102#1076#1078#1077#1090') </b>'
            ''
            #1047#1072#1090#1074#1077#1088#1076#1078#1077#1085#1086
            #1085#1072#1082#1072#1079#1086#1084' '#1044#1077#1088#1078#1072#1074#1085#1086#1075#1086' '#1082#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072
            #1059#1082#1088#1072#1111#1085#1080
            #1074#1110#1076' 27 '#1083#1080#1087#1085#1103' 2000 '#1088'. '#8470' 68')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 7.559060000000000000
          Top = 166.299320000000000000
          Width = 113.385900000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081
            #1082#1086#1076' '#1079#1072' '#1028#1044#1056#1055#1054#1059)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 120.944960000000000000
          Top = 173.858380000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frDBDebet."OKPO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 442.205010000000000000
          Top = 173.858380000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1050#1086#1076' '#1079#1072' '#1044#1050#1059#1044)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 555.590910000000000000
          Top = 173.858380000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 154.960730000000000000
          Top = 41.574830000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '('#1085#1072#1079#1074#1072' '#1091#1089#1090#1072#1085#1086#1074#1080')')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Top = 211.653680000000000000
          Width = 30.236240000000000000
          Height = 86.929190000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'N '#1079'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 30.236240000000000000
          Top = 211.653680000000000000
          Width = 49.133890000000000000
          Height = 86.929190000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1045#1050#1042)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 79.370130000000000000
          Top = 211.653680000000000000
          Width = 124.724490000000000000
          Height = 86.929190000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103', '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110' '#1087#1110#1076#1079#1074#1110#1090#1085#1086#1111' '#1086#1089#1086#1073#1080', '#1076#1072#1090#1072', '#8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 204.094620000000000000
          Top = 211.653680000000000000
          Width = 128.504020000000000000
          Height = 68.031540000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' '#1087#1086#1095#1072#1090#1086#1082' '#1084#1110#1089#1103#1094#1103' '#1079#1072' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1086#1084' [kod_sch]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 204.094620000000000000
          Top = 279.685220000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 268.346630000000000000
          Top = 279.685220000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 332.598640000000000000
          Top = 211.653680000000000000
          Width = 117.165430000000000000
          Height = 86.929190000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              #1044#1077#1073#1077#1090' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1091' [kod_sch] '#1076#1072#1090#1072', '#8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072', '#1082#1086#1088'.'#1089#1091#1073#1088#1072#1093#1091#1085#1086#1082'-'#1089#1091#1084 +
              #1072', '#1076#1088#1091#1075#1110' '#1079#1072#1087#1080#1089#1080':'#1044','#1050','#1089#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 449.764070000000000000
          Top = 211.653680000000000000
          Width = 120.944960000000000000
          Height = 86.929190000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              #1050#1088#1077#1076#1080#1090' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1091' [kod_sch] '#1076#1072#1090#1072', '#8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072', '#1082#1086#1088'.'#1089#1091#1073#1088#1072#1093#1091#1085#1086#1082'-'#1089#1091 +
              #1084#1072', '#1076#1088#1091#1075#1110' '#1079#1072#1087#1080#1089#1080':'#1044','#1050','#1089#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 570.709030000000000000
          Top = 211.653680000000000000
          Width = 128.504020000000000000
          Height = 68.031540000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' '#1082#1110#1085#1077#1094#1100' '#1084#1110#1089#1103#1094#1103' '#1079#1072' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1086#1084' [kod_sch]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 570.709030000000000000
          Top = 279.685220000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 634.961040000000000000
          Top = 279.685220000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo146: TfrxMemoView
          Top = 90.708720000000000000
          Width = 699.213050000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo146OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[title_ord] - [buk_ord]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 75.590600000000000000
        Top = 464.882190000000000000
        Width = 699.213050000000000000
        OnAfterCalcHeight = 'MasterData1OnAfterCalcHeight'
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frDBDebet
        DataSetName = 'frDBDebet'
        RowCount = 0
        Stretched = True
        object Memo27: TfrxMemoView
          ShiftMode = smDontShift
          Left = 332.598640000000000000
          Width = 117.165430000000000000
          Height = 15.118110236220470000
          OnBeforePrint = 'Memo27OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[<frDBDebet."DB_DATE_REG">],')
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          ShiftMode = smDontShift
          Left = 449.764070000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          OnBeforePrint = 'Memo28OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[<frDBDebet."KR_DATE_REG">],')
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Width = 30.236240000000000000
          Height = 75.590600000000000000
          Frame.Typ = [ftLeft, ftRight]
        end
        object Memo99: TfrxMemoView
          Left = 30.236240000000000000
          Width = 49.133890000000000000
          Height = 75.590600000000000000
          Frame.Typ = [ftLeft, ftRight]
        end
        object Memo100: TfrxMemoView
          Left = 79.370130000000000000
          Width = 124.724490000000000000
          Height = 75.590600000000000000
          Frame.Typ = [ftLeft, ftRight]
        end
        object Memo101: TfrxMemoView
          Left = 204.094620000000000000
          Width = 64.252010000000000000
          Height = 75.590600000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          VAlign = vaCenter
        end
        object Memo102: TfrxMemoView
          Left = 268.346630000000000000
          Width = 64.252010000000000000
          Height = 75.590600000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          VAlign = vaCenter
        end
        object Memo103: TfrxMemoView
          Left = 570.709030000000000000
          Width = 64.252010000000000000
          Height = 75.590600000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          VAlign = vaCenter
        end
        object Memo105: TfrxMemoView
          ShiftMode = smDontShift
          Left = 332.598640000000000000
          Top = 15.118120000000000000
          Width = 117.165430000000000000
          Height = 30.236220470000000000
          OnBeforePrint = 'Memo105OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            #8470' [<frDBDebet."DB_NUM_DOC">],')
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          ShiftMode = smDontShift
          Left = 449.764070000000000000
          Top = 15.118120000000000000
          Width = 120.944960000000000000
          Height = 30.236220470000000000
          OnBeforePrint = 'Memo106OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            #8470' [<frDBDebet."KR_NUM_DOC">],')
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Left = 634.961040000000000000
          Width = 64.252010000000000000
          Height = 75.590600000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          ShiftMode = smDontShift
          Left = 332.598640000000000000
          Top = 41.574830000000000000
          Width = 117.165430000000000000
          Height = 15.118110240000000000
          OnBeforePrint = 'Memo116OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            #1088#1072#1093'. [<frDBDebet."DB_SCH_NUMBER">],')
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          ShiftMode = smDontShift
          Left = 449.764070000000000000
          Top = 45.354360000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          OnBeforePrint = 'Memo119OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            #1088#1072#1093'. [<frDBDebet."KR_SCH_NUMBER">],')
          VAlign = vaCenter
        end
        object Memo127: TfrxMemoView
          ShiftMode = smDontShift
          Left = 332.598640000000000000
          Top = 60.472480000000000000
          Width = 117.165430000000000000
          Height = 15.118110240000000000
          OnBeforePrint = 'Memo27OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[<frDBDebet."SUMMA_DEBET">]')
          VAlign = vaCenter
        end
        object Memo128: TfrxMemoView
          ShiftMode = smDontShift
          Left = 449.764070000000000000
          Top = 60.472480000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          OnBeforePrint = 'Memo128OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[<frDBDebet."SUMMA_KREDIT">]')
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 714.331170000000000000
        Width = 699.213050000000000000
        DataSet = frDBKSch
        DataSetName = 'frDBKSch'
        RowCount = 0
        Stretched = True
        object Memo62: TfrxMemoView
          Left = 434.645950000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frDBKSch."KOD_SCH"]')
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 566.929500000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frDBKSch."SUMMA"]')
          VAlign = vaCenter
        end
      end
      object MasterData3: TfrxMasterData
        Height = 18.897650000000000000
        Top = 854.173780000000000000
        Width = 699.213050000000000000
        DataSet = frxDBKSch
        DataSetName = 'frxDBKSch'
        RowCount = 0
        Stretched = True
        object Memo79: TfrxMemoView
          Left = 434.645950000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBKSch."KOD_SCH"]')
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 566.929500000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBKSch."SUMMA"]')
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 98.267780000000000000
        Top = 593.386210000000000000
        Width = 699.213050000000000000
        Condition = 'frDBKSch."PAR_S"'
        Stretched = True
        object Memo64: TfrxMemoView
          Left = 434.645950000000000000
          Top = 68.031540000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1057#1091#1073#1088#1072#1093#1091#1085#1086#1082)
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 570.709030000000000000
          Top = 68.031540000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 45.354330710000000000
          Top = 68.031540000000000000
          Width = 370.393940000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1044#1077#1073#1077#1090' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1091' [kod_sch] '#1076#1086' '#1082#1088#1077#1076#1080#1090#1091' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1110#1074':')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086' : ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 204.094620000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[s1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 268.346630000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[s2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 332.598640000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[s3]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 449.764070000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[s4]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 570.709030000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[s5]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 634.961040000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[s6]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo136: TfrxMemoView
          Left = 45.354360000000000000
          Top = 34.015770000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' '#1087#1086#1095#1072#1090#1086#1082' '#1084#1110#1089#1103#1094#1103' : ')
          ParentFont = False
        end
        object Memo137: TfrxMemoView
          Left = 309.921460000000000000
          Top = 34.015770000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
        end
        object Memo138: TfrxMemoView
          Left = 502.677490000000000000
          Top = 34.015770000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo139: TfrxMemoView
          Left = 355.275820000000000000
          Top = 34.015770000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frDBDebet."SALDO_BEGIN_D"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo140: TfrxMemoView
          Left = 559.370440000000000000
          Top = 34.015770000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frDBDebet."SALDO_BEGIN_K"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 755.906000000000000000
        Width = 699.213050000000000000
        Stretched = True
        object Memo66: TfrxMemoView
          Left = 434.645950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1056#1072#1079#1086#1084' :')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 566.929500000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[sum(<frDBKSch."SUMMA">, MasterData2)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 26.456710000000000000
        Top = 805.039890000000000000
        Width = 699.213050000000000000
        Condition = 'frxDBKSch."PAR_S2"'
        Stretched = True
        object Memo68: TfrxMemoView
          Left = 434.645950000000000000
          Top = 7.559060000000040000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1057#1091#1073#1088#1072#1093#1091#1085#1086#1082)
        end
        object Memo69: TfrxMemoView
          Left = 566.929500000000000000
          Top = 7.559060000000040000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 45.354360000000000000
          Top = 7.559060000000000000
          Width = 370.393940000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1091' [kod_sch] '#1076#1086' '#1076#1077#1073#1077#1090#1091' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1110#1074':')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 895.748610000000000000
        Width = 699.213050000000000000
        Stretched = True
        object Memo70: TfrxMemoView
          Left = 434.645950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1056#1072#1079#1086#1084' :')
          ParentFont = False
        end
        object Memo71: TfrxMemoView
          Left = 566.929500000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[sum(<frxDBKSch."SUMMA">, MasterData3)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 944.882500000000000000
        Width = 699.213050000000000000
        Condition = 'frxDNeos."PAR_S"'
        object Memo88: TfrxMemoView
          Left = 434.645950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1057#1091#1073#1088#1072#1093#1091#1085#1086#1082)
        end
        object Memo89: TfrxMemoView
          Left = 566.929500000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Left = 45.354360000000000000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1044#1088#1091#1075#1110' '#1079#1072#1087#1080#1089#1080': '#1076#1086' '#1076#1077#1073#1077#1090#1091' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1110#1074':')
          ParentFont = False
        end
      end
      object MasterData4: TfrxMasterData
        Height = 18.897650000000000000
        Top = 986.457330000000000000
        Width = 699.213050000000000000
        DataSet = frxDNeos
        DataSetName = 'frxDNeos'
        RowCount = 0
        object Memo94: TfrxMemoView
          Left = 434.645950000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 566.929500000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          VAlign = vaCenter
        end
      end
      object GroupFooter3: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 1028.032160000000000000
        Width = 699.213050000000000000
        object Memo84: TfrxMemoView
          Left = 434.645950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1056#1072#1079#1086#1084' :')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 566.929500000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[sum(<frxDNeos."SUMMA">, MasterData4)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader4: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 1073.386520000000000000
        Width = 699.213050000000000000
        Condition = 'frxKNeos."PAR_S"'
        object Memo91: TfrxMemoView
          Left = 434.645950000000000000
          Top = 3.779529999999910000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1057#1091#1073#1088#1072#1093#1091#1085#1086#1082)
        end
        object Memo92: TfrxMemoView
          Left = 566.929500000000000000
          Top = 3.779529999999910000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          Left = 45.354360000000000000
          Top = 3.779529999999910000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1044#1088#1091#1075#1110' '#1079#1072#1087#1080#1089#1080': '#1076#1086' '#1082#1088#1077#1076#1080#1090#1091' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1110#1074':')
          ParentFont = False
        end
      end
      object MasterData5: TfrxMasterData
        Height = 18.897650000000000000
        Top = 1118.740880000000000000
        Width = 699.213050000000000000
        DataSet = frxKNeos
        DataSetName = 'frxKNeos'
        RowCount = 0
        object Memo96: TfrxMemoView
          Left = 434.645950000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 566.929500000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          VAlign = vaCenter
        end
      end
      object GroupFooter4: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 1160.315710000000000000
        Width = 699.213050000000000000
        object Memo86: TfrxMemoView
          Left = 434.645950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1056#1072#1079#1086#1084' :')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Left = 566.929500000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[sum(<frxKNeos."SUMMA">, MasterData5)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 306.141930000000000000
        Top = 1243.465370000000000000
        Width = 699.213050000000000000
        OnBeforePrint = 'ReportSummary1OnBeforePrint'
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 11.338590000000000000
          Top = 264.567100000000000000
          Width = 691.653990000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              #1051#1072#1073'."'#1052#1086#1076#1077#1083'.'#1087#1088#1086#1094'.'#1092#1080#1085'.'#1084#1077#1085#1077#1076#1078'."'#1044#1086#1085#1053#1059'. '#1047#1072#1082#1072#1079' '#8470' 20013 '#1086#1090' 02.11.2006 (' +
              'U[id_user][comp]DT [DATE][TIME]) '#1043#1072#1074#1088#1080#1083#1102#1082)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo31: TfrxMemoView
          Left = 37.795300000000000000
          Top = 86.929190000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100' :')
        end
        object Memo32: TfrxMemoView
          Left = 37.795300000000000000
          Top = 37.795300000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1057#1091#1084#1072' '#1086#1073#1086#1088#1086#1090#1110#1074' '#1079#1072' '#1084#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1084' '#1086#1088#1076#1077#1088#1086#1084' :  ')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 434.645950000000000000
          Top = 37.795299999999900000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[frDBDebet."SUMMA_INTO_MBOOK"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 37.795300000000000000
          Top = 136.063080000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1055#1077#1088#1077#1074#1110#1088#1080#1074' :')
        end
        object Memo35: TfrxMemoView
          Left = 37.795300000000000000
          Top = 181.417440000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1043#1086#1083#1086#1074#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088' :')
        end
        object Memo36: TfrxMemoView
          Left = 45.354360000000000000
          Top = 230.551330000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '"____ " _________________ 20 __ '#1088'.')
        end
        object Memo37: TfrxMemoView
          Left = 185.196970000000000000
          Top = 64.252010000000000000
          Width = 222.992270000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[name_post_b]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo38: TfrxMemoView
          Left = 185.196970000000000000
          Top = 113.385900000000000000
          Width = 222.992270000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[name_post_c]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo39: TfrxMemoView
          Left = 185.196970000000000000
          Top = 162.519790000000000000
          Width = 222.992270000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[name_post_g_b]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo40: TfrxMemoView
          Left = 415.748300000000000000
          Top = 86.929190000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo41: TfrxMemoView
          Left = 415.748300000000000000
          Top = 136.063080000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo42: TfrxMemoView
          Left = 415.748300000000000000
          Top = 181.417440000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo43: TfrxMemoView
          Left = 540.472790000000000000
          Top = 86.929190000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[fio_small_b]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 275.905690000000000000
          Top = 102.047310000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '('#1087#1086#1089#1072#1076#1072')')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 279.685220000000000000
          Top = 151.181200000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '('#1087#1086#1089#1072#1076#1072')')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 275.905690000000000000
          Top = 200.315090000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '('#1087#1086#1089#1072#1076#1072')')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 445.984540000000000000
          Top = 102.047310000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 445.984540000000000000
          Top = 151.181200000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 415.748300000000000000
          Top = 196.535560000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 559.370440000000000000
          Top = 102.047310000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '('#1110#1085#1110#1094#1110#1072#1083#1080' '#1110' '#1087#1088#1110#1079#1074#1080#1097#1077')')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 37.795300000000000000
          Top = 3.779530000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' '#1082#1110#1085#1077#1094#1100' '#1084#1110#1089#1103#1094#1103' : ')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 294.803340000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 506.457020000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 340.157700000000000000
          Top = 3.779530000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<frDBDebet."OST_ALL_DEBET">,MAsterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 563.149970000000000000
          Top = 3.779530000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<frDBDebet."OST_ALL_KREDIT">,MAsterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 427.086890000000000000
          Top = 230.551330000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1044#1086#1076#1072#1090#1086#1082' '#1085#1072' ')
        end
        object Memo117: TfrxMemoView
          Left = 502.677490000000000000
          Top = 230.551330000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo118: TfrxMemoView
          Left = 593.386210000000000000
          Top = 230.551330000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1072#1088#1082#1091#1096#1072#1093)
        end
        object Memo52: TfrxMemoView
          Left = 540.472790000000000000
          Top = 177.637910000000000000
          Width = 136.063080000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[fio_small_g_b]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 563.149970000000000000
          Top = 200.315090000000000000
          Width = 105.826840000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '('#1110#1085#1110#1094#1110#1072#1083#1080' '#1110' '#1087#1088#1110#1079#1074#1080#1097#1077')')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 540.472790000000000000
          Top = 136.063080000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[fio_small_c]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 559.370440000000000000
          Top = 154.960730000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '('#1110#1085#1110#1094#1110#1072#1083#1080' '#1110' '#1087#1088#1110#1079#1074#1080#1097#1077')')
          ParentFont = False
        end
      end
      object GroupHeader5: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 423.307360000000000000
        Width = 699.213050000000000000
        OnAfterPrint = 'GroupHeader5OnAfterPrint'
        Condition = 'frDBDebet."ID_MAN"'
        Stretched = True
        object Memo22: TfrxMemoView
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[Line#]')
        end
        object Memo23: TfrxMemoView
          Left = 30.236240000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frDBDebet."KOD_KEKV"]')
        end
        object Memo24: TfrxMemoView
          Left = 79.370130000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo24OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo25: TfrxMemoView
          Left = 204.094620000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frDBDebet."OST_DEBET"]')
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 268.346630000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frDBDebet."OST_KREDIT"]')
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 570.709030000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frDBDebet."OST_ALL_DEBET"]')
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 634.961040000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frDBDebet."OST_ALL_KREDIT"]')
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          ShiftMode = smDontShift
          Left = 332.598640000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[<frDBDebet."SUMMA_DEBET_ALL">]')
          VAlign = vaCenter
        end
        object Memo115: TfrxMemoView
          ShiftMode = smDontShift
          Left = 449.764070000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[<frDBDebet."SUMMA_KREDIT_ALL">]')
          VAlign = vaCenter
        end
      end
      object GroupFooter5: TfrxGroupFooter
        Height = 7.559060000000000000
        Top = 563.149970000000000000
        Visible = False
        Width = 699.213050000000000000
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 340.157700000000000000
        Width = 699.213050000000000000
        OnBeforePrint = 'PageHeader1OnBeforePrint'
        object Memo55: TfrxMemoView
          Width = 30.236240000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 30.236240000000000000
          Width = 49.133890000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo141: TfrxMemoView
          Left = 79.370130000000000000
          Width = 124.724490000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo142: TfrxMemoView
          Left = 204.094620000000000000
          Width = 128.504020000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo143: TfrxMemoView
          Left = 332.598640000000000000
          Width = 117.165430000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo144: TfrxMemoView
          Left = 449.764070000000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo145: TfrxMemoView
          Left = 570.709030000000000000
          Width = 128.504020000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '7')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 1572.284480000000000000
        Width = 699.213050000000000000
        object Memo147: TfrxMemoView
          Left = 551.811380000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1086#1088'. </b>[Page#] </b>')
          VAlign = vaCenter
        end
      end
    end
  end
  object frDBDebet: TfrxDBDataset
    UserName = 'frDBDebet'
    CloseDataSource = False
    DataSet = DSDebet
    Left = 376
    Top = 264
  end
  object DSDSch: TpFIBDataSet
    Database = DBase
    Transaction = Tr
    SelectSQL.Strings = (
      'select * from J4_MO_1('#39'01.01.2000'#39', '#39'01.01.2000'#39', 1, 1, 1, 1)')
    Left = 176
    Top = 272
    poSQLINT64ToBCD = True
  end
  object frDBKSch: TfrxDBDataset
    UserName = 'frDBKSch'
    CloseDataSource = False
    DataSet = DSDSch
    Left = 224
    Top = 272
  end
  object DSProverka: TpFIBDataSet
    Left = 432
    Top = 160
    poSQLINT64ToBCD = True
  end
  object DSKSch: TpFIBDataSet
    Database = DBase
    Transaction = Tr
    SelectSQL.Strings = (
      'select * from J4_MO_2('#39'01.01.2000'#39', '#39'01.01.2000'#39', 1, 1, 1, 1)')
    Left = 176
    Top = 312
    poSQLINT64ToBCD = True
  end
  object frxDBKSch: TfrxDBDataset
    UserName = 'frxDBKSch'
    CloseDataSource = False
    DataSet = DSKSch
    Left = 224
    Top = 312
  end
  object frxDNeos: TfrxDBDataset
    UserName = 'frxDNeos'
    CloseDataSource = False
    DataSet = DBDNeos
    Left = 528
    Top = 264
  end
  object frxKNeos: TfrxDBDataset
    UserName = 'frxKNeos'
    CloseDataSource = False
    DataSet = DBKNeos
    Left = 528
    Top = 312
  end
  object DBDNeos: TpFIBDataSet
    Database = DBase
    Transaction = Tr
    SelectSQL.Strings = (
      'select * from J4_MO_3('#39'01.01.2000'#39', '#39'01.01.2000'#39', 1, 1, 1, 1)')
    Left = 472
    Top = 264
    poSQLINT64ToBCD = True
    object DBDNeosKOD_SCH: TFIBStringField
      FieldName = 'KOD_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DBDNeosTITLE_SCH: TFIBStringField
      FieldName = 'TITLE_SCH'
      Size = 60
      EmptyStrToNull = True
    end
    object DBDNeosID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DBDNeosSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DBDNeosPAR_S: TFIBStringField
      FieldName = 'PAR_S'
      Size = 10
      EmptyStrToNull = True
    end
  end
  object DBKNeos: TpFIBDataSet
    Database = DBase
    Transaction = Tr
    SelectSQL.Strings = (
      'select * from J4_MO_4('#39'01.01.2000'#39', '#39'01.01.2000'#39', 1, 1, 1, 1)')
    Left = 472
    Top = 312
    poSQLINT64ToBCD = True
    object DBKNeosKOD_SCH: TFIBStringField
      FieldName = 'KOD_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DBKNeosTITLE_SCH: TFIBStringField
      FieldName = 'TITLE_SCH'
      Size = 60
      EmptyStrToNull = True
    end
    object DBKNeosID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DBKNeosSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DBKNeosPAR_S: TFIBStringField
      FieldName = 'PAR_S'
      Size = 10
      EmptyStrToNull = True
    end
  end
  object DataSetSigns: TpFIBDataSet
    Database = DBase
    UpdateTransaction = Tr
    Left = 64
    Top = 224
    poSQLINT64ToBCD = True
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 256
    Top = 193
  end
  object DSetZvedSum: TpFIBDataSet
    Database = DBase
    Transaction = TransRead
    BeforeFetchRecord = DSetZvedSumBeforeFetchRecord
    BeforeOpen = DSetZvedSumBeforeOpen
    Left = 48
    Top = 273
    poSQLINT64ToBCD = True
  end
  object DSetZvedTypeFinPkv: TpFIBDataSet
    Database = DBase
    Transaction = TransRead
    BeforeFetchRecord = DSetZvedTypeFinPkvBeforeFetchRecord
    DataSource = DSourceZvedSum
    BeforeOpen = DSetZvedTypeFinPkvBeforeOpen
    Left = 48
    Top = 313
    poSQLINT64ToBCD = True
  end
  object DSourceZvedSum: TDataSource
    DataSet = DSetZvedSum
    Left = 88
    Top = 273
  end
  object TransRead: TpFIBTransaction
    DefaultDatabase = DBase
    TimeoutAction = TARollback
    Left = 16
    Top = 273
  end
  object frxDBDsetZvedSum: TfrxDBDataset
    UserName = 'frxDBDsetZvedSum'
    CloseDataSource = False
    DataSet = DSetZvedSum
    Left = 128
    Top = 273
  end
  object frxDBDsetZvedTypeFinPkv: TfrxDBDataset
    UserName = 'frxDBDsetZvedTypeFinPkv'
    CloseDataSource = False
    DataSet = DSetZvedTypeFinPkv
    Left = 128
    Top = 313
  end
  object frxDBDset: TfrxDBDataset
    UserName = 'frxDBDset'
    CloseDataSource = False
    DataSet = pFIBDSet
    Left = 272
    Top = 313
  end
  object pFIBDSet: TpFIBDataSet
    Left = 272
    Top = 273
    poSQLINT64ToBCD = True
  end
  object pFIBDataSet2: TpFIBDataSet
    Database = DBase
    Transaction = TransRead
    Left = 48
    Top = 345
    poSQLINT64ToBCD = True
  end
end
