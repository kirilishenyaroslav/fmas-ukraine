object fmMemorialPrint: TfmMemorialPrint
  Left = 257
  Top = 253
  Width = 800
  Height = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 407
    Width = 784
    Height = 50
    Align = alBottom
    TabOrder = 0
    object cxButtonClose: TcxButton
      Left = 656
      Top = 9
      Width = 121
      Height = 25
      Cancel = True
      Caption = 'cxButtonClose'
      TabOrder = 0
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
    object cxButtonPrint: TcxButton
      Left = 528
      Top = 9
      Width = 115
      Height = 25
      Action = Aprint
      TabOrder = 1
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 53
    Align = alTop
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 400
      Top = 3
      Width = 129
      Height = 22
      Action = APereform
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
    end
    object cxComboBoxMonth: TcxComboBox
      Left = 137
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
      TabOrder = 1
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
      Left = 41
      Top = 3
      Width = 96
      Height = 22
      TabStop = False
      AutoSize = False
      TabOrder = 3
      Caption = #1059#1082#1072#1078#1080#1090#1077' '#1084#1077#1089#1103#1094
    end
    object cxLabel2: TcxLabel
      Left = 291
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
      Left = 335
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
  object Panel3: TPanel
    Left = 0
    Top = 53
    Width = 336
    Height = 354
    Align = alClient
    TabOrder = 2
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 334
      Height = 352
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
          Width = 30
          DataBinding.FieldName = 'print'
        end
        object cxGridDBTableView1DBColumn2: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Width = 82
          DataBinding.FieldName = 'Reg_short'
        end
        object cxGridDBTableView1DBColumn3: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          SortOrder = soAscending
          Width = 81
          DataBinding.FieldName = 'kod_sch'
        end
        object cxGridDBTableView1DBColumn4: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Width = 143
          DataBinding.FieldName = 'title_sch'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  object Panel4: TPanel
    Left = 336
    Top = 53
    Width = 448
    Height = 354
    Align = alRight
    TabOrder = 3
    object cxGrid3: TcxGrid
      Left = 1
      Top = 1
      Width = 446
      Height = 352
      Align = alClient
      BevelKind = bkFlat
      TabOrder = 0
      object cxGrid3DBTableView1: TcxGridDBTableView
        OnKeyUp = cxGrid3DBTableView1KeyUp
        DataController.DataSource = DataSource3
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsView.ScrollBars = ssVertical
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
        object cxGrid3DBTableView1DBColumn1: TcxGridDBColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Width = 60
          DataBinding.FieldName = 'PRINT_MO'
        end
        object cxGrid3DBTableView1DBColumn2: TcxGridDBColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Width = 56
          DataBinding.FieldName = 'PRINT_RAS_SCH'
        end
        object cxGrid3DBTableView1DBColumn4: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Options.Focusing = False
          Width = 56
          DataBinding.FieldName = 'MO_CHAR'
        end
        object cxGrid3DBTableView1DBColumn3: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Options.Focusing = False
          Width = 61
          DataBinding.FieldName = 'TYPE_FINANCE_CODE'
        end
        object cxGrid3DBTableView1DBColumn5: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Options.Focusing = False
          Width = 59
          DataBinding.FieldName = 'REG_KOD'
        end
        object cxGrid3DBTableView1DBColumn6: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Options.Focusing = False
          Width = 59
          DataBinding.FieldName = 'PKV_KOD'
        end
      end
      object cxGrid3Level1: TcxGridLevel
        GridView = cxGrid3DBTableView1
      end
    end
  end
  object DBase: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=sysdba')
    DefaultUpdateTransaction = Tr
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 64
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
    Left = 48
    Top = 56
  end
  object StyleRepository: TcxStyleRepository
    Left = 88
    Top = 80
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
      'select * from BANK_MO('#39'01.01.2000'#39', '#39'01.01.2000'#39', 1, 1, 1, 1)')
    Left = 336
    Top = 264
    poSQLINT64ToBCD = True
    object DSDebetNAME_PRED: TFIBStringField
      FieldName = 'NAME_PRED'
      Size = 180
      EmptyStrToNull = True
    end
    object DSDebetSALDO_BEGIN: TFIBBCDField
      FieldName = 'SALDO_BEGIN'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DSDebetSALDO_END: TFIBBCDField
      FieldName = 'SALDO_END'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DSDebetFLAG_SPRAVKA: TFIBIntegerField
      FieldName = 'FLAG_SPRAVKA'
    end
    object DSDebetNAME_DATE: TFIBStringField
      FieldName = 'NAME_DATE'
      Size = 10
      EmptyStrToNull = True
    end
    object DSDebetSCH_KOD: TFIBStringField
      FieldName = 'SCH_KOD'
      Size = 30
      EmptyStrToNull = True
    end
    object DSDebetSUMMA_COLUMN: TFIBBCDField
      FieldName = 'SUMMA_COLUMN'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DSDebetDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object DSDebetOBOROT: TFIBBCDField
      FieldName = 'OBOROT'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DSDebetSUMMA_ALL: TFIBBCDField
      FieldName = 'SUMMA_ALL'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DSDebetNAME_SCH: TFIBStringField
      FieldName = 'NAME_SCH'
      Size = 100
      EmptyStrToNull = True
    end
    object DSDebetCOUNT_D: TFIBIntegerField
      FieldName = 'COUNT_D'
    end
    object DSDebetCOUNT_K: TFIBIntegerField
      FieldName = 'COUNT_K'
    end
    object DSDebetSUMMA_INTO_MBOOK: TFIBBCDField
      FieldName = 'SUMMA_INTO_MBOOK'
      Size = 2
      RoundByScale = True
    end
    object DSDebetOKPO: TFIBStringField
      FieldName = 'OKPO'
      Size = 16
      EmptyStrToNull = True
    end
    object DSDebetOBOROT_MO: TFIBBCDField
      FieldName = 'OBOROT_MO'
      Size = 2
      RoundByScale = True
    end
    object DSDebetSUMMA_ALL_MO: TFIBBCDField
      FieldName = 'SUMMA_ALL_MO'
      Size = 2
      RoundByScale = True
    end
    object DSDebetCALC_OBOR_IN_DB: TFIBIntegerField
      FieldName = 'CALC_OBOR_IN_DB'
    end
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DataSet = frDBDebet
    DataSetName = 'frDBDebet'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38560.688820173600000000
    ReportOptions.LastChange = 40939.406464652770000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure ColumnFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '     if (<Page#> < <TotalPages#>) then'
      '    begin'
      '        ColumnFooter1.visible := false;'
      '    end else'
      '    begin'
      '        ColumnFooter1.visible := true;'
      '    end;'
      'end;'
      ''
      ''
      ''
      'procedure Memo10OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '     if <kod_ord>='#39'2'#39' then Memo10.text := '#39#1053#1072#1082#1086#1087#1080#1095#1091#1074#1072#1083#1100#1085#1072' '#1074#1110#1076#1086#1084#1110 +
        #1089#1090#1100' '#1088#1091#1093#1091' '#1075#1088#1086#1096#1086#1074#1080#1093' '#1082#1086#1096#1090#1110#1074' '#1079#1072#1075#1072#1083#1100#1085#1086#1075#1086' '#1092#1086#1085#1076#1091' '#1074' '#1086#1088#1075#1072#1085#1072#1093' '#1044#1077#1088#1078#1072#1074#1085#1086#1075#1086' '#1082 +
        #1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072' '#1059#1082#1088#1072#1111#1085#1080' ('#1091#1089#1090#1072#1085#1086#1074#1072#1093' '#1073#1072#1085#1082#1110#1074')'#39
      '     else'
      
        '     if <kod_ord>='#39'3'#39' then Memo10.text := '#39#1053#1072#1082#1086#1087#1080#1095#1091#1074#1072#1083#1100#1085#1072' '#1074#1110#1076#1086#1084#1110 +
        #1089#1090#1100' '#1088#1091#1093#1091' '#1075#1088#1086#1096#1086#1074#1080#1093' '#1082#1086#1096#1090#1110#1074' '#1089#1087#1077#1094#1110#1072#1083#1100#1085#1086#1075#1086' '#1092#1086#1085#1076#1091' '#1074' '#1086#1088#1075#1072#1085#1072#1093' '#1044#1077#1088#1078#1072#1074#1085#1086#1075#1086 +
        ' '#1082#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072' '#1059#1082#1088#1072#1111#1085#1080' ('#1091#1089#1090#1072#1085#1086#1074#1072#1093' '#1073#1072#1085#1082#1110#1074')'#39
      'end;'
      ''
      'procedure Memo7OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '     if <kod_ord>='#39'2'#39' then Memo7.text := '#39'<b>'#1058#1080#1087#1086#1074#1072' '#1092#1086#1088#1084#1072' '#8470' 381-' +
        #1072#1074#1090' ('#1073#1102#1076#1078#1077#1090') </b>'#39
      '     else'
      
        '     if <kod_ord>='#39'3'#39' then Memo7.text := '#39'<b>'#1058#1080#1087#1086#1074#1072' '#1092#1086#1088#1084#1072' '#8470' 382-' +
        #1072#1074#1090' ('#1073#1102#1076#1078#1077#1090') </b>'#39
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
        DataSet = frDBKrredit
        DataSetName = 'frDBKrredit'
      end>
    Variables = <
      item
        Name = 'comp'
        Value = #39'OLGA'#39
      end
      item
        Name = 'id_user'
        Value = #39'509'#39
      end
      item
        Name = 'name_prog'
        Value = #39'2201160'#39
      end
      item
        Name = 'title_prog'
        Value = #39#39
      end
      item
        Name = 'kod_ord'
        Value = #39'2'#39
      end
      item
        Name = 'buk_ord'
        Value = #39#1041#39
      end
      item
        Name = 'mon_year'
        Value = #39#1082#1074#1110#1090#1077#1085#1100' 2011'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 15.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 268.346630000000000000
        Width = 699.213050000000000000
        object Memo1: TfrxMemoView
          Left = 555.490122530000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1086#1088'. </b>[Page#] </b>')
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 226.771800000000000000
        Top = 18.897650000000000000
        Width = 699.213050000000000000
        object Memo5: TfrxMemoView
          Left = 18.897650000000000000
          Top = 26.456710000000000000
          Width = 279.685220000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frDBDebet."NAME_PRED"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = -3.779530000000000000
          Top = 147.401670000000000000
          Width = 699.213050000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[reg_title] - [buk_ord]'
            #1079#1072' [mon_year]'#1088'.')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 491.338900000000000000
          Width = 219.212740000000000000
          Height = 34.015770000000000000
          OnBeforePrint = 'Memo7OnBeforePrint'
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '<b>'#1058#1080#1087#1086#1074#1072' '#1092#1086#1088#1084#1072' '#8470' 381-'#1072#1074#1090' ('#1073#1102#1076#1078#1077#1090') </b>')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 22.677180000000000000
          Top = 94.488250000000000000
          Width = 109.606370000000000000
          Height = 30.236240000000000000
          Memo.Strings = (
            #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081
            #1082#1086#1076' '#1079#1072' '#1028#1044#1056#1055#1054#1059)
        end
        object Memo9: TfrxMemoView
          Left = 139.842610000000000000
          Top = 102.047310000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frDBDebet."OKPO"]')
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 457.323130000000000000
          Top = 102.047310000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1050#1086#1076' '#1079#1072' '#1044#1050#1059#1044)
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 570.709030000000000000
          Top = 102.047310000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 102.047310000000000000
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
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Top = 181.417440000000000000
          Width = 699.213050000000000000
          Height = 41.574830000000000000
          OnBeforePrint = 'Memo10OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            
              #1053#1072#1082#1086#1087#1080#1095#1091#1074#1072#1083#1100#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1088#1091#1093#1091' '#1075#1088#1086#1096#1086#1074#1080#1093' '#1082#1086#1096#1090#1110#1074' '#1079#1072#1075#1072#1083#1100#1085#1086#1075#1086' '#1092#1086#1085#1076#1091' '#1074 +
              ' '#1086#1088#1075#1072#1085#1072#1093' '#1044#1077#1088#1078#1072#1074#1085#1086#1075#1086' '#1082#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072' '#1059#1082#1088#1072#1111#1085#1080' ('#1091#1089#1090#1072#1085#1086#1074#1072#1093' '#1073#1072#1085#1082#1110#1074')')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 491.338900000000000000
          Top = 30.236240000000000000
          Width = 219.212740000000000000
          Height = 45.354360000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1047#1072#1090#1074#1077#1088#1076#1078#1077#1085#1086
            #1085#1072#1082#1072#1079#1086#1084' '#1044#1077#1088#1078#1072#1074#1085#1086#1075#1086' '#1082#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072' '#1059#1082#1088#1072#1111#1085#1080
            #1074#1110#1076' 27 '#1083#1080#1087#1085#1103' 2000 '#1088'. '#8470' 68')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object DBCross1: TfrxDBCrossView
        Top = 302.362400000000000000
        Width = 699.213050000000000000
        Height = 15.118120000000000000
        ColumnLevels = 2
        DownThenAcross = False
        CellFields.Strings = (
          'SUMMA_COLUMN')
        ColumnFields.Strings = (
          'NAME_SCH'
          'SCH_KOD')
        DataSet = frDBDebet
        DataSetName = 'frDBDebet'
        RowFields.Strings = (
          'NAME_DATE')
        Memos = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
          662D38223F3E3C63726F73733E3C63656C6C6D656D6F733E3C546672784D656D
          6F56696577204E616D653D2222204C6566743D2239382220546F703D22353422
          2057696474683D22383022204865696768743D2232322220416C6C6F77457870
          72657373696F6E733D2246616C73652220446973706C6179466F726D61742E44
          6563696D616C536570617261746F723D222C2220446973706C6179466F726D61
          742E466F726D61745374723D2225322E326E2220446973706C6179466F726D61
          742E4B696E643D22666B4E756D657269632220466F6E742E436861727365743D
          22312220466F6E742E436F6C6F723D222D31363737373230382220466F6E742E
          4865696768743D222D31332220466F6E742E4E616D653D22417269616C222046
          6F6E742E5374796C653D223022204672616D652E5479703D2231352220476170
          583D22332220476170593D2233222048416C69676E3D22686152696768742220
          4D656D6F2E546578743D22302C30302220506172656E74466F6E743D2246616C
          736522205374796C653D2263656C6C222056416C69676E3D22766143656E7465
          72222F3E3C2F63656C6C6D656D6F733E3C636F6C756D6E6D656D6F733E3C5466
          72784D656D6F56696577204E616D653D2222205461673D2231303022204C6566
          743D2239382220546F703D223130222057696474683D22383022204865696768
          743D2232322220416C6C6F7745787072657373696F6E733D2246616C73652220
          436F6C6F723D2231363737343334382220466F6E742E436861727365743D2231
          2220466F6E742E436F6C6F723D222D31363737373230382220466F6E742E4865
          696768743D222D31332220466F6E742E4E616D653D22417269616C2220466F6E
          742E5374796C653D223022204672616D652E5479703D2231352220476170583D
          22332220476170593D2233222048416C69676E3D22686143656E74657222204D
          656D6F2E546578743D222220506172656E74466F6E743D2246616C7365222053
          74796C653D22636F6C756D6E222056416C69676E3D22766143656E746572222F
          3E3C546672784D656D6F56696577204E616D653D2222205461673D2231303122
          204C6566743D2239382220546F703D223332222057696474683D223830222048
          65696768743D2232322220416C6C6F7745787072657373696F6E733D2246616C
          73652220436F6C6F723D2231363737343334382220466F6E742E436861727365
          743D22312220466F6E742E436F6C6F723D222D31363737373230382220466F6E
          742E4865696768743D222D31332220466F6E742E4E616D653D22417269616C22
          20466F6E742E5374796C653D223022204672616D652E5479703D223135222047
          6170583D22332220476170593D2233222048416C69676E3D22686143656E7465
          7222204D656D6F2E546578743D222220506172656E74466F6E743D2246616C73
          6522205374796C653D22636F6C756D6E222056416C69676E3D22766143656E74
          6572222F3E3C2F636F6C756D6E6D656D6F733E3C636F6C756D6E746F74616C6D
          656D6F733E3C546672784D656D6F56696577204E616D653D2222205461673D22
          33303022204C6566743D223137382220546F703D223130222057696474683D22
          343722204865696768743D2234342220416C6C6F7745787072657373696F6E73
          3D2246616C73652220436F6C6F723D2231363736333930342220466F6E742E43
          6861727365743D22312220466F6E742E436F6C6F723D222D3136373737323038
          2220466F6E742E4865696768743D222D31332220466F6E742E4E616D653D2241
          7269616C2220466F6E742E5374796C653D223122204672616D652E5479703D22
          31352220476170583D22332220476170593D2233222048416C69676E3D226861
          43656E74657222204D656D6F2E546578743D22D0E0E7EEEC2220506172656E74
          466F6E743D2246616C736522205374796C653D22636F6C6772616E6422205641
          6C69676E3D22766143656E746572222F3E3C546672784D656D6F56696577204E
          616D653D2222205461673D2233303122204C6566743D223136392220546F703D
          223332222057696474683D22333822204865696768743D223232222056697369
          626C653D2246616C73652220416C6C6F7745787072657373696F6E733D224661
          6C73652220436F6C6F723D2231363736333930342220466F6E742E4368617273
          65743D22312220466F6E742E436F6C6F723D222D31363737373230382220466F
          6E742E4865696768743D222D31332220466F6E742E4E616D653D22417269616C
          2220466F6E742E5374796C653D223122204672616D652E5479703D2231352220
          476170583D22332220476170593D2233222048416C69676E3D22686143656E74
          657222204D656D6F2E546578743D22546F74616C2220506172656E74466F6E74
          3D2246616C736522205374796C653D22636F6C746F74616C222056416C69676E
          3D22766143656E746572222F3E3C2F636F6C756D6E746F74616C6D656D6F733E
          3C726F776D656D6F733E3C546672784D656D6F56696577204E616D653D222220
          5461673D2232303022204C6566743D2231302220546F703D2235342220576964
          74683D22383822204865696768743D2232322220416C6C6F7745787072657373
          696F6E733D2246616C73652220436F6C6F723D2231363737343334382220466F
          6E742E436861727365743D22312220466F6E742E436F6C6F723D222D31363737
          373230382220466F6E742E4865696768743D222D31332220466F6E742E4E616D
          653D22417269616C2220466F6E742E5374796C653D223022204672616D652E54
          79703D2231352220476170583D22332220476170593D2233222048416C69676E
          3D22686143656E74657222204D656D6F2E546578743D222220506172656E7446
          6F6E743D2246616C736522205374796C653D22726F77222056416C69676E3D22
          766143656E746572222F3E3C2F726F776D656D6F733E3C726F77746F74616C6D
          656D6F733E3C546672784D656D6F56696577204E616D653D2222205461673D22
          34303022204C6566743D2231302220546F703D223736222057696474683D2238
          3822204865696768743D2232322220416C6C6F7745787072657373696F6E733D
          2246616C73652220436F6C6F723D2231363736333930342220466F6E742E4368
          61727365743D22312220466F6E742E436F6C6F723D222D313637373732303822
          20466F6E742E4865696768743D222D31332220466F6E742E4E616D653D224172
          69616C2220466F6E742E5374796C653D223122204672616D652E5479703D2231
          352220476170583D22332220476170593D2233222048416C69676E3D22686143
          656E74657222204D656D6F2E546578743D22D3F1FCEEE3EE2220506172656E74
          466F6E743D2246616C736522205374796C653D22726F776772616E6422205641
          6C69676E3D22766143656E746572222F3E3C2F726F77746F74616C6D656D6F73
          3E3C63656C6C66756E6374696F6E733E3C6974656D20312F3E3C2F63656C6C66
          756E6374696F6E733E3C636F6C756D6E736F72743E3C6974656D20302F3E3C69
          74656D20302F3E3C2F636F6C756D6E736F72743E3C726F77736F72743E3C6974
          656D20302F3E3C2F726F77736F72743E3C2F63726F73733E}
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 15.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      OnManualBuild = 'Page2OnManualBuild'
      object PageHeader2: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 699.213050000000000000
        object Memo43: TfrxMemoView
          Left = 555.490122530000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1086#1088'. </b>[Page#] </b>')
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 408.189240000000000000
        Width = 699.213050000000000000
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999910000
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
      end
      object DBCross2: TfrxDBCrossView
        Top = 49.133890000000000000
        Width = 699.213050000000000000
        Height = 18.897650000000000000
        ColumnLevels = 2
        DownThenAcross = False
        CellFields.Strings = (
          'SUMMA_COLUMN')
        ColumnFields.Strings = (
          'NAME_SCH'
          'SCH_KOD')
        DataSet = frDBKrredit
        DataSetName = 'frDBKrredit'
        RowFields.Strings = (
          'NAME_DATE')
        Memos = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
          662D38223F3E3C63726F73733E3C63656C6C6D656D6F733E3C546672784D656D
          6F56696577204E616D653D2222204C6566743D2239382220546F703D22353422
          2057696474683D22383022204865696768743D2232322220416C6C6F77457870
          72657373696F6E733D2246616C73652220446973706C6179466F726D61742E44
          6563696D616C536570617261746F723D222C2220446973706C6179466F726D61
          742E466F726D61745374723D2225322E326E2220446973706C6179466F726D61
          742E4B696E643D22666B4E756D657269632220466F6E742E436861727365743D
          22312220466F6E742E436F6C6F723D222D31363737373230382220466F6E742E
          4865696768743D222D31332220466F6E742E4E616D653D22417269616C222046
          6F6E742E5374796C653D223022204672616D652E5479703D2231352220476170
          583D22332220476170593D2233222048416C69676E3D22686152696768742220
          4D656D6F2E546578743D22302C30302220506172656E74466F6E743D2246616C
          736522205374796C653D2263656C6C222056416C69676E3D22766143656E7465
          72222F3E3C2F63656C6C6D656D6F733E3C636F6C756D6E6D656D6F733E3C5466
          72784D656D6F56696577204E616D653D2222205461673D2231303022204C6566
          743D2239382220546F703D223130222057696474683D22383022204865696768
          743D2232322220416C6C6F7745787072657373696F6E733D2246616C73652220
          436F6C6F723D2231363737343334382220466F6E742E436861727365743D2231
          2220466F6E742E436F6C6F723D222D31363737373230382220466F6E742E4865
          696768743D222D31332220466F6E742E4E616D653D22417269616C2220466F6E
          742E5374796C653D223022204672616D652E5479703D2231352220476170583D
          22332220476170593D2233222048416C69676E3D22686143656E74657222204D
          656D6F2E546578743D222220506172656E74466F6E743D2246616C7365222053
          74796C653D22636F6C756D6E222056416C69676E3D22766143656E746572222F
          3E3C546672784D656D6F56696577204E616D653D2222205461673D2231303122
          204C6566743D2239382220546F703D223332222057696474683D223830222048
          65696768743D2232322220416C6C6F7745787072657373696F6E733D2246616C
          73652220436F6C6F723D2231363737343334382220466F6E742E436861727365
          743D22312220466F6E742E436F6C6F723D222D31363737373230382220466F6E
          742E4865696768743D222D31332220466F6E742E4E616D653D22417269616C22
          20466F6E742E5374796C653D223022204672616D652E5479703D223135222047
          6170583D22332220476170593D2233222048416C69676E3D22686143656E7465
          7222204D656D6F2E546578743D222220506172656E74466F6E743D2246616C73
          6522205374796C653D22636F6C756D6E222056416C69676E3D22766143656E74
          6572222F3E3C2F636F6C756D6E6D656D6F733E3C636F6C756D6E746F74616C6D
          656D6F733E3C546672784D656D6F56696577204E616D653D2222205461673D22
          33303022204C6566743D223137382220546F703D223130222057696474683D22
          343722204865696768743D2234342220416C6C6F7745787072657373696F6E73
          3D2246616C73652220436F6C6F723D2231363736333930342220466F6E742E43
          6861727365743D22312220466F6E742E436F6C6F723D222D3136373737323038
          2220466F6E742E4865696768743D222D31332220466F6E742E4E616D653D2241
          7269616C2220466F6E742E5374796C653D223122204672616D652E5479703D22
          31352220476170583D22332220476170593D2233222048416C69676E3D226861
          43656E74657222204D656D6F2E546578743D22D0E0E7EEEC2220506172656E74
          466F6E743D2246616C736522205374796C653D22636F6C6772616E6422205641
          6C69676E3D22766143656E746572222F3E3C546672784D656D6F56696577204E
          616D653D2222205461673D2233303122204C6566743D223136392220546F703D
          223332222057696474683D22333822204865696768743D223232222056697369
          626C653D2246616C73652220416C6C6F7745787072657373696F6E733D224661
          6C73652220436F6C6F723D2231363736333930342220466F6E742E4368617273
          65743D22312220466F6E742E436F6C6F723D222D31363737373230382220466F
          6E742E4865696768743D222D31332220466F6E742E4E616D653D22417269616C
          2220466F6E742E5374796C653D223122204672616D652E5479703D2231352220
          476170583D22332220476170593D2233222048416C69676E3D22686143656E74
          657222204D656D6F2E546578743D22546F74616C2220506172656E74466F6E74
          3D2246616C736522205374796C653D22636F6C746F74616C222056416C69676E
          3D22766143656E746572222F3E3C2F636F6C756D6E746F74616C6D656D6F733E
          3C726F776D656D6F733E3C546672784D656D6F56696577204E616D653D222220
          5461673D2232303022204C6566743D2231302220546F703D2235342220576964
          74683D22383822204865696768743D2232322220416C6C6F7745787072657373
          696F6E733D2246616C73652220436F6C6F723D2231363737343334382220466F
          6E742E436861727365743D22312220466F6E742E436F6C6F723D222D31363737
          373230382220466F6E742E4865696768743D222D31332220466F6E742E4E616D
          653D22417269616C2220466F6E742E5374796C653D223022204672616D652E54
          79703D2231352220476170583D22332220476170593D2233222048416C69676E
          3D22686143656E74657222204D656D6F2E546578743D222220506172656E7446
          6F6E743D2246616C736522205374796C653D22726F77222056416C69676E3D22
          766143656E746572222F3E3C2F726F776D656D6F733E3C726F77746F74616C6D
          656D6F733E3C546672784D656D6F56696577204E616D653D2222205461673D22
          34303022204C6566743D2231302220546F703D223736222057696474683D2238
          3822204865696768743D2232322220416C6C6F7745787072657373696F6E733D
          2246616C73652220436F6C6F723D2231363736333930342220466F6E742E4368
          61727365743D22312220466F6E742E436F6C6F723D222D313637373732303822
          20466F6E742E4865696768743D222D31332220466F6E742E4E616D653D224172
          69616C2220466F6E742E5374796C653D223122204672616D652E5479703D2231
          352220476170583D22332220476170593D2233222048416C69676E3D22686143
          656E74657222204D656D6F2E546578743D22D3F1FCEEE3EE2220506172656E74
          466F6E743D2246616C736522205374796C653D22726F776772616E6422205641
          6C69676E3D22766143656E746572222F3E3C2F726F77746F74616C6D656D6F73
          3E3C63656C6C66756E6374696F6E733E3C6974656D20312F3E3C2F63656C6C66
          756E6374696F6E733E3C636F6C756D6E736F72743E3C6974656D20302F3E3C69
          74656D20302F3E3C2F636F6C756D6E736F72743E3C726F77736F72743E3C6974
          656D20302F3E3C2F726F77736F72743E3C2F63726F73733E}
      end
      object ColumnFooter1: TfrxColumnFooter
        Height = 283.464750000000000000
        Top = 102.047310000000000000
        Width = 699.213050000000000000
        OnBeforePrint = 'ColumnFooter1OnBeforePrint'
        object Memo2: TfrxMemoView
          Left = 15.118120000000000000
          Top = 11.338590000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1054#1073#1086#1088#1086#1090' '#1079#1072' '#1076#1077#1073#1077#1090#1086#1084' : ')
        end
        object Memo3: TfrxMemoView
          Left = 15.118120000000000000
          Top = 30.236240000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1054#1073#1086#1088#1086#1090' '#1079#1072' '#1082#1088#1077#1076#1080#1090#1086#1084' : ')
        end
        object Memo27: TfrxMemoView
          Left = 15.118120000000000000
          Top = 49.133890000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1087#1086#1095#1072#1090#1086#1082' '#1084#1110#1089#1103#1094#1103' :  ')
        end
        object Memo34: TfrxMemoView
          Left = 15.118120000000000000
          Top = 68.031540000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1082#1110#1085#1077#1094#1100' '#1084#1110#1089#1103#1094#1103' :  ')
        end
        object Memo37: TfrxMemoView
          Left = 15.118120000000000000
          Top = 124.724490000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100' :')
        end
        object Memo38: TfrxMemoView
          Left = 260.787570000000000000
          Top = 68.031540000000000000
          Width = 294.803340000000000000
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
            '  [frDBDebet."SALDO_END"]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 260.787570000000000000
          Top = 30.236240000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
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
            '  [frDBDebet."OBOROT"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 260.787570000000000000
          Top = 11.338590000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
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
            '  [frDBDebet."SUMMA_ALL"]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 260.787570000000000000
          Top = 49.133890000000000000
          Width = 294.803340000000000000
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
            '  [frDBDebet."SALDO_BEGIN"]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 15.118120000000000000
          Top = 94.488250000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1057#1091#1084#1072' '#1086#1073#1086#1088#1086#1090#1110#1074' '#1079#1072' '#1084#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1084' '#1086#1088#1076#1077#1088#1086#1084' :  ')
        end
        object Memo47: TfrxMemoView
          Left = 260.787570000000000000
          Top = 94.488250000000000000
          Width = 294.803340000000000000
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
            '[<frDBDebet."SUMMA_ALL_MO">+<frDBDebet."OBOROT_MO">]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 15.118120000000000000
          Top = 158.740260000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1055#1077#1088#1077#1074#1110#1088#1080#1074' :')
        end
        object Memo49: TfrxMemoView
          Left = 15.118120000000000000
          Top = 185.196970000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1043#1086#1083#1086#1074#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088' :')
        end
        object Memo50: TfrxMemoView
          Left = 15.118120000000000000
          Top = 230.551330000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '"____ " _________________ 20 __ '#1088'.')
        end
        object Memo51: TfrxMemoView
          Left = 162.519790000000000000
          Top = 124.724490000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo52: TfrxMemoView
          Left = 162.519790000000000000
          Top = 154.960730000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo53: TfrxMemoView
          Left = 162.519790000000000000
          Top = 185.196970000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo54: TfrxMemoView
          Left = 332.598640000000000000
          Top = 124.724490000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo55: TfrxMemoView
          Left = 332.598640000000000000
          Top = 154.960730000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo56: TfrxMemoView
          Left = 510.236550000000000000
          Top = 185.196970000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo57: TfrxMemoView
          Left = 510.236550000000000000
          Top = 124.724490000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo58: TfrxMemoView
          Left = 510.236550000000000000
          Top = 154.960730000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo59: TfrxMemoView
          Left = 196.535560000000000000
          Top = 139.842610000000000000
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
        object Memo60: TfrxMemoView
          Left = 196.535560000000000000
          Top = 170.078850000000000000
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
        object Memo61: TfrxMemoView
          Left = 196.535560000000000000
          Top = 200.315090000000000000
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
        object Memo62: TfrxMemoView
          Left = 362.834880000000000000
          Top = 139.842610000000000000
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
        object Memo63: TfrxMemoView
          Left = 362.834880000000000000
          Top = 170.078850000000000000
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
        object Memo64: TfrxMemoView
          Left = 510.236550000000000000
          Top = 200.315090000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1110#1085#1110#1094#1110#1072#1083#1080' '#1110' '#1087#1088#1110#1079#1074#1080#1097#1077')')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 510.236550000000000000
          Top = 173.858380000000000000
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
        object Memo66: TfrxMemoView
          Left = 510.236550000000000000
          Top = 139.842610000000000000
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
        object Memo67: TfrxMemoView
          Left = 502.677490000000000000
          Top = 226.771800000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1044#1086#1076#1072#1090#1086#1082' '#1085#1072)
        end
        object Memo68: TfrxMemoView
          Left = 582.047620000000000000
          Top = 226.771800000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
          HAlign = haCenter
        end
        object Memo69: TfrxMemoView
          Left = 612.283860000000000000
          Top = 226.771800000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1072#1088#1082#1091#1096#1072#1093)
        end
        object Memo70: TfrxMemoView
          Left = 332.598640000000000000
          Top = 185.196970000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo71: TfrxMemoView
          Left = 362.834880000000000000
          Top = 200.315090000000000000
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
  object DSKredit: TpFIBDataSet
    Database = DBase
    Transaction = Tr
    SelectSQL.Strings = (
      'select * from BANK_MO1('#39'01.01.2000'#39', '#39'01.01.2000'#39', 1, 1, 1, 1)')
    Left = 336
    Top = 304
    poSQLINT64ToBCD = True
    object DSKreditNAME_PRED: TFIBStringField
      FieldName = 'NAME_PRED'
      Size = 180
      EmptyStrToNull = True
    end
    object DSKreditSALDO_BEGIN: TFIBBCDField
      FieldName = 'SALDO_BEGIN'
      Size = 2
      RoundByScale = True
    end
    object DSKreditSALDO_END: TFIBBCDField
      FieldName = 'SALDO_END'
      Size = 2
      RoundByScale = True
    end
    object DSKreditFLAG_SPRAVKA: TFIBIntegerField
      FieldName = 'FLAG_SPRAVKA'
    end
    object DSKreditNAME_DATE: TFIBStringField
      FieldName = 'NAME_DATE'
      Size = 10
      EmptyStrToNull = True
    end
    object DSKreditSCH_KOD: TFIBStringField
      FieldName = 'SCH_KOD'
      Size = 30
      EmptyStrToNull = True
    end
    object DSKreditSUMMA_COLUMN: TFIBBCDField
      FieldName = 'SUMMA_COLUMN'
      Size = 2
      RoundByScale = True
    end
    object DSKreditDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object DSKreditOBOROT: TFIBBCDField
      FieldName = 'OBOROT'
      Size = 2
      RoundByScale = True
    end
    object DSKreditSUMMA_ALL: TFIBBCDField
      FieldName = 'SUMMA_ALL'
      Size = 2
      RoundByScale = True
    end
    object DSKreditNAME_SCH: TFIBStringField
      FieldName = 'NAME_SCH'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object frDBKrredit: TfrxDBDataset
    UserName = 'frDBKrredit'
    CloseDataSource = False
    DataSet = DSKredit
    Left = 376
    Top = 304
  end
  object DSProverka: TpFIBDataSet
    Left = 432
    Top = 160
    poSQLINT64ToBCD = True
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 416
    Top = 160
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 104
    Top = 240
  end
end
