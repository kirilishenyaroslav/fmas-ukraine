object UP_AcceptForm: TUP_AcceptForm
  Left = 280
  Top = 153
  Width = 645
  Height = 508
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    637
    474)
  PixelsPerInch = 96
  TextHeight = 13
  object cxTextEdit1: TcxTextEdit
    Left = 190
    Top = 11
    Width = 121
    Height = 24
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    OnKeyPress = cxTextEdit1KeyPress
  end
  object cxLabel1: TcxLabel
    Left = 6
    Top = 9
    Width = 187
    Height = 25
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -16
    Style.Font.Name = 'Times New Roman'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    Caption = #1056#1086#1079#1084#1110#1088' '#1096#1088#1080#1092#1090#1091' '#1085#1072' '#1076#1088#1091#1082#1091':'
  end
  object cxButton1: TcxButton
    Left = 224
    Top = 421
    Width = 115
    Height = 25
    Action = APrintOrder
    Anchors = [akLeft, akBottom]
    Caption = #1044#1088#1091#1082' '#1085#1072#1082#1072#1079#1091
    Default = True
    TabOrder = 2
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
  object cxButton2: TcxButton
    Left = 352
    Top = 421
    Width = 129
    Height = 25
    Action = APrintOrderV
    Anchors = [akLeft, akBottom]
    Caption = #1044#1088#1091#1082' '#1074#1080#1090#1103#1075#1091
    TabOrder = 3
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
  object cxButton3: TcxButton
    Left = 496
    Top = 421
    Width = 107
    Height = 25
    Action = AExit
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 4
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
  object cxCheckBox1: TcxCheckBox
    Left = 8
    Top = 392
    Width = 249
    Height = 21
    Anchors = [akLeft, akBottom]
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1080#1073#1088#1072#1090#1080' '#1074#1089#1110' '#1087#1091#1085#1082#1090#1080' ( '#1076#1083#1103' '#1074#1080#1090#1103#1075#1091' '#1079' '#1085#1072#1082#1072#1079#1091')'
    State = cbsChecked
    TabOrder = 1
    OnClick = cxCheckBox1Click
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 454
    Width = 637
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Fixed = False
      end>
    PaintStyle = stpsOffice11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 636
    Height = 353
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 7
    object cxGrid1: TcxGrid
      Left = 1
      Top = 33
      Width = 384
      Height = 319
      Align = alClient
      BevelInner = bvLowered
      BevelKind = bkFlat
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid1DBTableView1DblClick
        OnKeyUp = cxGrid1DBTableView1KeyUp
        DataController.DataSource = DataSource1
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleYellow
        Styles.Content = cxStyleYellow
        Styles.ContentEven = cxStyleYellow
        Styles.ContentOdd = cxStyleYellow
        Styles.Inactive = cxStyle4
        Styles.IncSearch = cxStyle11
        Styles.Selection = cxStyle17
        Styles.FilterBox = cxStyleYellow
        Styles.Footer = cxStyleBorder
        Styles.Group = cxStyleYellow
        Styles.GroupByBox = cxStyleYellow
        Styles.Header = cxStyleBorder
        Styles.Indicator = cxStyleYellow
        Styles.NewItemRowInfoText = cxStyleYellow
        Styles.Preview = cxStyleYellow
        object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Options.Sorting = False
          Width = 20
          DataBinding.FieldName = 'print'
          IsCaptionAssigned = True
        end
        object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
          Caption = #8470' '#1087#1091#1085#1082#1090#1091
          Options.Sorting = False
          Width = 31
          DataBinding.FieldName = 'num'
        end
        object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
          Caption = #8470' '#1087#1110#1076#1087#1091#1085#1082#1090#1091
          Options.Sorting = False
          Width = 34
          DataBinding.FieldName = 'num_sub'
        end
        object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072' '#1087#1091#1085#1082#1090#1091
          Width = 290
          DataBinding.FieldName = 'name'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object cxGrid2: TcxGrid
      Left = 385
      Top = 33
      Width = 250
      Height = 319
      Align = alRight
      BevelInner = bvLowered
      BevelKind = bkFlat
      Enabled = False
      TabOrder = 1
      object cxGrid2DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid2DBTableView1DblClick
        OnKeyUp = cxGrid2DBTableView1KeyUp
        DataController.DataSource = DataSource2
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleYellow
        Styles.Content = cxStyleYellow
        Styles.ContentEven = cxStyleYellow
        Styles.ContentOdd = cxStyleYellow
        Styles.Inactive = cxStyle4
        Styles.IncSearch = cxStyle11
        Styles.Selection = cxStyle17
        Styles.FilterBox = cxStyleYellow
        Styles.Footer = cxStyleBorder
        Styles.Group = cxStyleBorder
        Styles.GroupByBox = cxStyleYellow
        Styles.Header = cxStyleBorder
        Styles.Indicator = cxStyleYellow
        Styles.NewItemRowInfoText = cxStyleYellow
        Styles.Preview = cxStyleYellow
        object cxGrid2DBTableView1DBColumn1: TcxGridDBColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          DataBinding.FieldName = 'Print'
          IsCaptionAssigned = True
        end
        object cxGrid2DBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072' '
          DataBinding.FieldName = 'REPORT_TITLE'
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxGrid2DBTableView1
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 634
      Height = 32
      Align = alTop
      TabOrder = 2
      object cxRadioButton1: TcxRadioButton
        Left = 8
        Top = 8
        Width = 297
        Height = 17
        Caption = #1047#1074#1080#1095#1072#1081#1085#1080#1081' '#1076#1088#1091#1082' '#1085#1072#1082#1072#1079#1091
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = cxRadioButton1Click
      end
      object cxRadioButton2: TcxRadioButton
        Left = 376
        Top = 7
        Width = 249
        Height = 17
        Caption = #1047#1086#1074#1085#1080#1096#1085#1110#1081' '#1079#1074#1110#1090
        TabOrder = 1
        OnClick = cxRadioButton2Click
      end
    end
  end
  object cxButton4: TcxButton
    Left = 8
    Top = 421
    Width = 153
    Height = 25
    Action = APereformirPrint
    Anchors = [akLeft, akBottom]
    Caption = #1055#1077#1088#1077#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1085#1072#1082#1072#1079
    TabOrder = 8
    Visible = False
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
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <>
    Left = 304
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA'
      'sql_role_name=')
    DefaultTransaction = Tr
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 344
  end
  object DSOrder: TpFIBDataSet
    Database = DB
    Transaction = Tr
    SelectSQL.Strings = (
      'select * from UP_DT_ORDERS_PRINT_ORDER(1)')
    Left = 352
    Top = 96
    poSQLINT64ToBCD = True
    object DSOrderNUM_ORDER: TFIBStringField
      FieldName = 'NUM_ORDER'
      Size = 10
      EmptyStrToNull = True
    end
    object DSOrderDATE_PROJECT: TFIBDateField
      FieldName = 'DATE_PROJECT'
    end
    object DSOrderHASH_CODE: TFIBStringField
      FieldName = 'HASH_CODE'
      Size = 10
      EmptyStrToNull = True
    end
    object DSOrderHEADER_TEXT: TMemoField
      FieldName = 'HEADER_TEXT'
      BlobType = ftMemo
      Size = 8
    end
    object DSOrderSIGNATURE_TEXT: TMemoField
      FieldName = 'SIGNATURE_TEXT'
      BlobType = ftMemo
      Size = 8
    end
    object DSOrderHEADER_FIO: TFIBStringField
      FieldName = 'HEADER_FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object DSOrderHEADER_POST: TFIBStringField
      FieldName = 'HEADER_POST'
      Size = 50
      EmptyStrToNull = True
    end
    object DSOrderBODY: TMemoField
      FieldName = 'BODY'
      BlobType = ftMemo
      Size = 8
    end
    object DSOrderDATE_ORDER: TFIBDateField
      FieldName = 'DATE_ORDER'
    end
    object DSOrderPRINT_NAME: TFIBStringField
      FieldName = 'PRINT_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DSOrderNAME_PRED: TFIBStringField
      FieldName = 'NAME_PRED'
      Size = 255
      EmptyStrToNull = True
    end
    object DSOrderCITY: TFIBStringField
      FieldName = 'CITY'
      Size = 50
      EmptyStrToNull = True
    end
    object DSOrderNUM_PROJECT: TFIBStringField
      FieldName = 'NUM_PROJECT'
      Size = 10
      EmptyStrToNull = True
    end
    object DSOrderID_LEVEL: TFIBBCDField
      FieldName = 'ID_LEVEL'
      Size = 0
      RoundByScale = True
    end
    object DSOrderDAY_O: TFIBStringField
      FieldName = 'DAY_O'
      Size = 2
      EmptyStrToNull = True
    end
    object DSOrderMONTH_O: TFIBStringField
      FieldName = 'MONTH_O'
      Size = 2
      EmptyStrToNull = True
    end
    object DSOrderYEAR_O: TFIBStringField
      FieldName = 'YEAR_O'
      Size = 4
      EmptyStrToNull = True
    end
  end
  object Tr: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 384
  end
  object frxDBOrder: TfrxDBDataset
    UserName = 'frxDBOrder'
    CloseDataSource = False
    DataSet = DSOrder
    Left = 400
    Top = 96
  end
  object frxR_Order: TfrxReport
    Version = '3.20'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39043.682647013900000000
    ReportOptions.LastChange = 39171.594759652800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  memo2.font.size := <font_doc>;'
      '  memo5.font.size := <font_doc>;'
      '  memo11.font.size := <font_doc>;'
      '  memo12.font.size := <font_doc>;'
      '  memo13.font.size := <font_doc>;'
      '  memo14.font.size := <font_doc>;'
      '  memo10.font.size := <font_doc>;'
      '  memo3.font.size := <font_doc>;'
      '  memo4.font.size := <font_doc>;'
      '  memo6.font.size := <font_doc>;'
      '  memo7.font.size := <font_doc>;'
      '  memo8.font.size := <font_doc>;'
      '  memo9.font.size := <font_doc>;'
      '  memo1.font.size := <font_doc>;'
      ''
      'end;'
      ''
      'procedure Overlay2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <chernetka> = 1'
      '       then memo15.visible := true'
      '       else memo15.visible := false;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 456
    Top = 96
    Datasets = <
      item
        DataSet = frxDBDBottom
        DataSetName = 'frxDBDBottom'
      end
      item
        DataSet = frxDBOrder
        DataSetName = 'frxDBOrder'
      end>
    Variables = <>
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
      LeftMargin = 30.000000000000000000
      RightMargin = 15.000000000000000000
      TopMargin = 20.000000000000000000
      BottomMargin = 20.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 132.283550000000000000
        Top = 18.897650000000000000
        Width = 623.622450000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo3: TfrxMemoView
          Top = 26.456710000000000000
          Width = 680.315400000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116' '#1056#1106' '#1056#1113' '#1056#1106' '#1056#8212)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Width = 680.315400000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBOrder."NAME_PRED"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Top = 94.488250000000000000
          Width = 374.173470000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBOrder."PRINT_NAME"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 423.307360000000000000
          Top = 64.252010000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 268.346630000000000000
          Top = 64.252010000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBOrder."CITY"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 445.984540000000000000
          Top = 64.252010000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[ <frxDBOrder."NUM_ORDER">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 49.133890000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBOrder."DAY_O"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 86.929190000000000000
          Top = 64.252010000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBOrder."MONTH_O"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 188.976500000000000000
          Top = 64.252010000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBOrder."YEAR_O"]'#1057#1026'.')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 37.795300000000000000
          Top = 64.252010000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '"')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 75.590600000000000000
          Top = 64.252010000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '"')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 37.795300000000000000
        Top = 211.653680000000000000
        Width = 623.622450000000000000
        DataSet = frxDBOrder
        DataSetName = 'frxDBOrder'
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo2: TfrxMemoView
          Align = baWidth
          ShiftMode = smDontShift
          Top = 12.094493070000000000
          Width = 623.622450000000000000
          Height = 25.700789840000000000
          StretchMode = smActualHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          GapY = -4.000000000000000000
          HAlign = haBlock
          LineSpacing = 6.000000000000000000
          Memo.UTF8 = (
            '[frxDBOrder."BODY"]')
          ParagraphGap = 30.000000000000000000
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 1039.370750000000000000
        Width = 623.622450000000000000
        object Memo1: TfrxMemoView
          Width = 676.535870000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            
              #1056#1111#1057#1026#1056#1109#1056#181#1056#1108#1057#8218' '#1074#8222#8211' [frxDBOrder."NUM_PROJECT"] ([frxDBOrder."HASH_C' +
              'ODE"]) '#1056#1030#1057#8211#1056#1169' [frxDBOrder."DATE_PROJECT"]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 30.236240000000000000
        Top = 272.126160000000000000
        Width = 623.622450000000000000
        Condition = 'frxDBDBottom."PRINT_NUM"'
        KeepChild = True
        KeepTogether = True
        Stretched = True
        object Memo5: TfrxMemoView
          Top = 11.338590000000010000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Memo.UTF8 = (
            '[frxDBDBottom."L_TYPE_PRINT_NAME"]')
        end
        object Memo10: TfrxMemoView
          Left = 207.874150000000000000
          Top = 11.338590000000010000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Memo.UTF8 = (
            '[frxDBDBottom."C_TYPE_PRINT_NAME"]')
        end
        object Memo11: TfrxMemoView
          Left = 351.496290000000000000
          Top = 11.338590000000010000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Memo.UTF8 = (
            '[frxDBDBottom."R_TYPE_PRINT_NAME"]')
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 325.039580000000000000
        Width = 623.622450000000000000
        DataSet = frxDBDBottom
        DataSetName = 'frxDBDBottom'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo12: TfrxMemoView
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Memo.UTF8 = (
            '[frxDBDBottom."L_SIGNER_POST"]'
            '[frxDBDBottom."L_SIGNER_FIO"]')
        end
        object Memo13: TfrxMemoView
          Left = 207.874150000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Memo.UTF8 = (
            '[frxDBDBottom."C_SIGNER_POST"]'
            '[frxDBDBottom."C_SIGNER_FIO"]')
        end
        object Memo14: TfrxMemoView
          Left = 351.496290000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Memo.UTF8 = (
            '[frxDBDBottom."R_SIGNER_POST"]'
            '[frxDBDBottom."R_SIGNER_FIO"]')
        end
      end
      object Overlay2: TfrxOverlay
        Height = 612.283860000000000000
        Top = 366.614410000000000000
        Width = 623.622450000000000000
        OnBeforePrint = 'Overlay2OnBeforePrint'
        object Memo15: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 143.622139999999000000
          Width = 563.149970000000000000
          Height = 468.661720000000000000
          Visible = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnFace
          Font.Height = -96
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            #1056#167#1056#8226#1056#160#1056#1116#1056#8226#1056#1118#1056#1113#1056#1106)
          ParentFont = False
          Rotation = 45
          VAlign = vaCenter
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 192
    Top = 240
    object APrintOrder: TAction
      Caption = 'APrintOrder'
      ShortCut = 121
      OnExecute = APrintOrderExecute
    end
    object APrintOrderV: TAction
      Caption = 'APrintOrderV'
      OnExecute = APrintOrderVExecute
    end
    object AExit: TAction
      Caption = 'AExit'
      ShortCut = 27
      OnExecute = AExitExecute
    end
    object APereformirPrint: TAction
      Caption = 'APereformirPrint'
      ShortCut = 57393
      OnExecute = APereformirPrintExecute
    end
    object AShowId: TAction
      Caption = 'AShowId'
      ShortCut = 57431
      OnExecute = AShowIdExecute
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 64
    Top = 216
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
  object rx1: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'print'
        DataType = ftInteger
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'num'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'id_items'
        DataType = ftVariant
      end
      item
        Name = 'pereform_body'
        DataType = ftInteger
      end
      item
        Name = 'num_sub'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'type'
        DataType = ftVariant
      end>
    Left = 80
    Top = 168
  end
  object DS: TpFIBDataSet
    Left = 112
    Top = 96
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    DataSet = rx1
    Left = 112
    Top = 168
  end
  object frxReport_V: TfrxReport
    Version = '3.20'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39048.422127268510000000
    ReportOptions.LastChange = 39176.562150405090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo13OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '{    memo1.font.size := <font_doc>;'
      '    memo2.font.size := <font_doc>;'
      '    memo3.font.size := <font_doc>;'
      '    memo4.font.size := <font_doc>;'
      '    memo5.font.size := <font_doc>;'
      '    memo6.font.size := <font_doc>;'
      '    memo7.font.size := <font_doc>;'
      '    memo8.font.size := <font_doc>;'
      '    memo9.font.size := <font_doc>;'
      '    memo10.font.size := <font_doc>;'
      '    memo11.font.size := <font_doc>;'
      '    memo12.font.size := <font_doc>;'
      '    memo13.font.size := <font_doc>;'
      '    memo14.font.size := <font_doc>;'
      '    memo15.font.size := <font_doc>;'
      '    memo16.font.size := <font_doc>;}'
      'end;'
      ''
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    memo1.font.size := <font_doc>;'
      '    memo2.font.size := <font_doc>;'
      '    memo3.font.size := <font_doc>;'
      '    memo4.font.size := <font_doc>;'
      '    memo5.font.size := <font_doc>;'
      '    memo6.font.size := <font_doc>;'
      '    memo7.font.size := <font_doc>;'
      '    memo8.font.size := <font_doc>;'
      '    memo9.font.size := <font_doc>;'
      '    memo10.font.size := <font_doc>;'
      '    memo11.font.size := <font_doc>;'
      '    memo12.font.size := <font_doc>;'
      '    memo13.font.size := <font_doc>;'
      '    memo14.font.size := <font_doc>;'
      '    memo15.font.size := <font_doc>;'
      '    memo16.font.size := <font_doc>;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 472
    Top = 232
    Datasets = <
      item
        DataSet = frxDBDV
        DataSetName = 'frxDBDV'
      end>
    Variables = <>
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
      LeftMargin = 30.000000000000000000
      RightMargin = 15.000000000000000000
      TopMargin = 20.000000000000000000
      BottomMargin = 20.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 41.574830000000000000
        Top = 226.771800000000000000
        Width = 623.622450000000000000
        DataSet = frxDBDV
        DataSetName = 'frxDBDV'
        RowCount = 0
        StartNewPage = True
        Stretched = True
        object Memo13: TfrxMemoView
          Top = 11.338590000000010000
          Width = 623.622450000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          GapX = 1.000000000000000000
          HAlign = haBlock
          LineSpacing = 6.000000000000000000
          Memo.UTF8 = (
            '[frxDBDV."NAME_PUNKT"]'
            '[frxDBDV."BODY"]')
          ParagraphGap = 30.000000000000000000
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 147.401670000000000000
        Top = 18.897650000000000000
        Width = 623.622450000000000000
        OnBeforePrint = 'PageHeader1OnBeforePrint'
        object Memo7: TfrxMemoView
          Top = 30.236240000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1056#152#1056#1118#1056#1031#1056#8220' '#1056#8212' '#1056#1116#1056#1106#1056#1113#1056#1106#1056#8212#1056#1032)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Width = 680.315400000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDV."FIRM_NAME"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 427.086890000000000000
          Top = 60.472480000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 253.228510000000000000
          Top = 60.472480000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDV."CITY"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Top = 105.826840000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDV."PRINT_NAME"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 34.015770000000000000
          Top = 60.472480000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDV."DAY_O"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 68.031540000000000000
          Top = 60.472480000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDV."MONTH_O"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 173.858380000000000000
          Top = 60.472480000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            ' [frxDBDV."YEAR_O"] '#1057#1026'.')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 26.456710000000000000
          Top = 60.472480000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '"')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 60.472480000000000000
          Top = 60.472480000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '"')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 445.984540000000000000
          Top = 60.472480000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDV."NUM_ORDER"]')
          VAlign = vaCenter
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        Height = 132.283550000000000000
        Top = 328.819110000000000000
        Width = 623.622450000000000000
        object Memo1: TfrxMemoView
          Left = 34.015770000000000000
          Top = 22.677180000000020000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            '[frxDBDV."HEADER_POST"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 377.953000000000000000
          Top = 22.677180000000020000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            '[frxDBDV."HEADER_FIO"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Left = 34.015770000000010000
          Top = 71.811069999999970000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            '[frxDBDV."NAME_DEPARTMENT"], [frxDBDV."NAME_POST"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 377.953000000000000000
          Top = 71.811069999999970000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            '[frxDBDV."FIO_INS"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 34.015770000000010000
          Top = 52.913419999999970000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            #1056#8217#1057#8211#1057#1026#1056#1029#1056#1109' : ')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDV: TfrxDBDataset
    UserName = 'frxDBDV'
    CloseDataSource = False
    DataSet = DSV
    Left = 416
    Top = 232
  end
  object DSV: TpFIBDataSet
    Database = DB
    Transaction = Tr
    SelectSQL.Strings = (
      'select * from UP_DT_ORDERS_PRINT_ORDER_V(1, 1)')
    Left = 352
    Top = 232
    poSQLINT64ToBCD = True
    object DSVBODY: TMemoField
      FieldName = 'BODY'
      BlobType = ftMemo
      Size = 8
    end
    object DSVNUM_PUNKT: TFIBIntegerField
      FieldName = 'NUM_PUNKT'
    end
    object DSVNAME_PUNKT: TMemoField
      FieldName = 'NAME_PUNKT'
      BlobType = ftMemo
      Size = 8
    end
    object DSVNAME_POST: TFIBStringField
      FieldName = 'NAME_POST'
      Size = 100
      EmptyStrToNull = True
    end
    object DSVNUM_ORDER: TFIBStringField
      FieldName = 'NUM_ORDER'
      Size = 10
      EmptyStrToNull = True
    end
    object DSVPRINT_NAME: TFIBStringField
      FieldName = 'PRINT_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DSVDATE_ORDER: TFIBDateField
      FieldName = 'DATE_ORDER'
    end
    object DSVHEADER_POST: TFIBStringField
      FieldName = 'HEADER_POST'
      Size = 50
      EmptyStrToNull = True
    end
    object DSVHEADER_FIO: TFIBStringField
      FieldName = 'HEADER_FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object DSVFIRM_NAME: TFIBStringField
      FieldName = 'FIRM_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DSVCITY: TFIBStringField
      FieldName = 'CITY'
      Size = 50
      EmptyStrToNull = True
    end
    object DSVFIO_INS: TFIBStringField
      FieldName = 'FIO_INS'
      Size = 25
      EmptyStrToNull = True
    end
    object DSVDAY_O: TFIBStringField
      FieldName = 'DAY_O'
      Size = 2
      EmptyStrToNull = True
    end
    object DSVMONTH_O: TFIBStringField
      FieldName = 'MONTH_O'
      Size = 2
      EmptyStrToNull = True
    end
    object DSVYEAR_O: TFIBStringField
      FieldName = 'YEAR_O'
      Size = 4
      EmptyStrToNull = True
    end
    object DSVNAME_DEPARTMENT: TFIBStringField
      FieldName = 'NAME_DEPARTMENT'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object DSBottom: TpFIBDataSet
    Database = DB
    Transaction = Tr
    SelectSQL.Strings = (
      'select * from UP_DT_ORDERS_PRINT_ORDER_BOTTOM(1)')
    Left = 352
    Top = 160
    poSQLINT64ToBCD = True
    object DSBottomL_SIGNER_FIO: TFIBStringField
      FieldName = 'L_SIGNER_FIO'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomL_SIGNER_POST: TFIBStringField
      FieldName = 'L_SIGNER_POST'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomL_TYPE_PRINT_NAME: TFIBStringField
      FieldName = 'L_TYPE_PRINT_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomR_SIGNER_FIO: TFIBStringField
      FieldName = 'R_SIGNER_FIO'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomR_SIGNER_POST: TFIBStringField
      FieldName = 'R_SIGNER_POST'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomR_TYPE_PRINT_NAME: TFIBStringField
      FieldName = 'R_TYPE_PRINT_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomC_SIGNER_FIO: TFIBStringField
      FieldName = 'C_SIGNER_FIO'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomC_SIGNER_POST: TFIBStringField
      FieldName = 'C_SIGNER_POST'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomC_TYPE_PRINT_NAME: TFIBStringField
      FieldName = 'C_TYPE_PRINT_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomPRINT_NUM: TFIBIntegerField
      FieldName = 'PRINT_NUM'
    end
  end
  object frxDBDBottom: TfrxDBDataset
    UserName = 'frxDBDBottom'
    CloseDataSource = False
    DataSet = DSBottom
    Left = 408
    Top = 160
  end
  object Stored: TpFIBStoredProc
    Left = 256
    Top = 128
  end
  object TW: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 208
    Top = 120
  end
  object DSItems: TpFIBDataSet
    Left = 192
    Top = 328
    poSQLINT64ToBCD = True
  end
  object DSSelShablon: TpFIBDataSet
    Left = 264
    Top = 336
    poSQLINT64ToBCD = True
  end
  object DSVn: TpFIBDataSet
    Left = 536
    Top = 104
    poSQLINT64ToBCD = True
  end
  object RX: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'id_report'
        DataType = ftVariant
      end
      item
        Name = 'ID_ORDER_TYPE'
        DataType = ftVariant
      end
      item
        Name = 'MODULE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'REPORT_TITLE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Print'
        DataType = ftInteger
      end>
    Left = 488
    Top = 176
  end
  object DataSource2: TDataSource
    DataSet = RX
    Left = 520
    Top = 176
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OpenAfterExport = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 552
    Top = 144
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 552
    Top = 200
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OpenExcelAfterExport = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    Left = 552
    Top = 256
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 512
    Top = 232
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    EmptyLines = True
    Left = 520
    Top = 264
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ShowProgress = True
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
    Left = 592
    Top = 240
  end
end
