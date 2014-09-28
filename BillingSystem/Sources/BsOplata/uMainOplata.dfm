object frmMainOplata: TfrmMainOplata
  Left = 388
  Top = 319
  Width = 800
  Height = 600
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1087#1072#1095#1082#1072#1084#1080
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
  object Panel1: TPanel
    Left = 38
    Top = 48
    Width = 458
    Height = 518
    Align = alClient
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 456
      Height = 136
      Align = alTop
      TabOrder = 0
      object DateEditBeg: TcxDateEdit
        Left = 89
        Top = 32
        Width = 152
        Height = 21
        Style.Color = clWindow
        TabOrder = 0
      end
      object DateEditEnd: TcxDateEdit
        Left = 253
        Top = 32
        Width = 148
        Height = 21
        Style.Color = clWindow
        TabOrder = 1
      end
      object LabelDatePack: TcxLabel
        Left = 8
        Top = 33
        Width = 81
        Height = 17
        AutoSize = False
        TabOrder = 2
        Caption = #1044#1072#1090#1072' '#1087#1072#1095#1082#1080
      end
      object LabelName_file: TcxLabel
        Left = 8
        Top = 8
        Width = 81
        Height = 17
        AutoSize = False
        TabOrder = 3
        Caption = #1053#1072#1079#1074#1072' '#1092#1072#1081#1083#1091
      end
      object LabelNumbPack: TcxLabel
        Left = 252
        Top = 8
        Width = 73
        Height = 17
        AutoSize = False
        TabOrder = 4
        Caption = #1053#1086#1084#1077#1088' '#1087#1072#1095#1082#1080
      end
      object TextEditNumbPack: TcxTextEdit
        Left = 326
        Top = 7
        Width = 115
        Height = 21
        TabOrder = 5
      end
      object LabelPackSys: TcxLabel
        Left = 9
        Top = 107
        Width = 192
        Height = 17
        AutoSize = False
        TabOrder = 6
        Caption = #1055#1077#1088#1110#1086#1076', '#1076#1086' '#1103#1082#1086#1075#1086' '#1074#1110#1076#1085#1086#1089#1080#1090#1100#1089#1103' '#1087#1072#1095#1082#1072
      end
      object BoxNameFile: TcxLookupComboBox
        Left = 89
        Top = 7
        Width = 152
        Height = 21
        Properties.DropDownHeight = 100
        Properties.DropDownListStyle = lsEditList
        Properties.IncrementalFiltering = False
        Properties.KeyFieldNames = 'id_dt_pack'
        Properties.ListColumns = <
          item
            FieldName = 'name_file_import'
          end
          item
            FieldName = 'numb_pack'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DataSourceNameFile
        Properties.OnInitPopup = BoxNameFilePropertiesInitPopup
        TabOrder = 7
        OnClick = BoxNameFileClick
        OnEnter = BoxNameFileClick
        OnKeyUp = BoxNameFileKeyUp
      end
      object cxSpinEditYear: TcxSpinEdit
        Left = 351
        Top = 105
        Width = 65
        Height = 21
        Properties.MaxValue = 2999.000000000000000000
        Properties.MinValue = 2000.000000000000000000
        Properties.ReadOnly = False
        TabOrder = 8
        Value = 2000
      end
      object cxComboBoxMonth: TcxComboBox
        Left = 208
        Top = 105
        Width = 141
        Height = 21
        Properties.DropDownListStyle = lsEditFixedList
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
        TabOrder = 9
      end
      object ComboBoxProp: TcxComboBox
        Left = 88
        Top = 57
        Width = 153
        Height = 21
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          #1042#1089#1110
          #1054#1087#1083#1072#1090#1072
          #1057#1091#1073#1089#1110#1076#1110#1103)
        TabOrder = 10
      end
      object ComboBoxStatePack: TcxComboBox
        Left = 88
        Top = 81
        Width = 153
        Height = 21
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          #1042#1089#1110
          #1055#1110#1076#1087#1080#1089#1072#1085#1110
          #1053#1077#1087#1110#1076#1087#1080#1089#1072#1085#1110)
        TabOrder = 11
      end
      object LabelPackState: TcxLabel
        Left = 8
        Top = 82
        Width = 81
        Height = 17
        AutoSize = False
        TabOrder = 12
        Caption = #1057#1090#1072#1085' '#1087#1072#1095#1082#1080
      end
      object LabelPackProp: TcxLabel
        Left = 8
        Top = 60
        Width = 81
        Height = 17
        AutoSize = False
        TabOrder = 13
        Caption = #1058#1080#1087' '#1087#1072#1095#1082#1080
      end
    end
    object GridPack: TcxGrid
      Left = 1
      Top = 137
      Width = 456
      Height = 380
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object GridPackDBView: TcxGridDBTableView
        DataController.DataSource = DSPack
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'ID_DT_PACK'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnCustomDrawCell = GridPackDBViewCustomDrawCell
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = DevExpress_Style
        object GridPackDBViewDBColumn1: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088' '#1087#1072#1095#1082#1080
          SortOrder = soAscending
          Width = 81
          DataBinding.FieldName = 'NUMB_PACK'
        end
        object GridPackDBViewDBColumn2: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072' '#1092#1072#1081#1083#1091
          Width = 87
          DataBinding.FieldName = 'NAME_FILE_IMPORT'
        end
        object GridPackDBViewDBColumn7: TcxGridDBColumn
          Caption = #1055#1077#1088#1110#1086#1076' '#1089#1080#1089#1090#1077#1084#1080
          Width = 74
          DataBinding.FieldName = 'MONTH_YEAR'
        end
        object GridPackDBViewDBColumn3: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1076#1086#1076#1072#1074#1072#1085#1085#1103'\'#1110#1084#1087#1086#1088#1090#1091' '#1087#1072#1095#1082#1080
          SortOrder = soAscending
          Width = 174
          DataBinding.FieldName = 'DATE_CURRENT'
        end
        object GridPackDBViewDBColumn4: TcxGridDBColumn
          Caption = #1050'-'#1090#1100' '#1079#1072#1087#1080#1089#1110#1074
          Width = 36
          DataBinding.FieldName = 'ALL_COUNT_REC_PACK'
        end
        object GridPackDBViewDBColumn5: TcxGridDBColumn
          Caption = #1057#1091#1084#1072' '#1079#1072#1087#1080#1089#1110#1074
          Visible = False
          Width = 76
          DataBinding.FieldName = 'ALL_SUM_OPL_PACK'
        end
        object GridPackDBViewDBColumn6: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'IS_SIGNED'
        end
      end
      object GridPackLevel: TcxGridLevel
        GridView = GridPackDBView
      end
    end
  end
  object Panel2: TPanel
    Left = 496
    Top = 48
    Width = 296
    Height = 518
    Align = alRight
    TabOrder = 1
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 1
      Width = 8
      Height = 516
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 100
      MinSize = 100
      Control = Panel2
    end
    object GridPersAcc: TcxGrid
      Left = 9
      Top = 1
      Width = 286
      Height = 516
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object cxGridDBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourcePersAcc
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = DevExpress_Style
        object cxGridDBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1054#1089#1086#1073#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
          Width = 116
          DataBinding.FieldName = 'CLIENT_ACCOUNT'
        end
        object cxGridDBTableView1DBColumn3: TcxGridDBColumn
          Caption = #1055#1086#1095'. '#1087#1077#1088#1110#1086#1076#1091
          Width = 83
          DataBinding.FieldName = 'DATE_BEG_PERIOD_FOR_ACC'
        end
        object cxGridDBTableView1DBColumn4: TcxGridDBColumn
          Caption = #1050#1110#1085'. '#1087#1077#1088#1110#1086#1076#1091
          Width = 80
          DataBinding.FieldName = 'DATE_END_PERIOD_FOR_ACC'
        end
        object cxGridDBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1057#1091#1084#1072
          Width = 45
          DataBinding.FieldName = 'SUM_OPL'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 452
        FloatTop = 379
        FloatClientWidth = 62
        FloatClientHeight = 40
        IsMainMenu = True
        ItemLinks = <
          item
            Item = dxBarLargeButtonAdd
            Visible = True
          end
          item
            Item = dxBarLargeButtonEdit
            Visible = True
          end
          item
            Item = dxBarLargeButtonDel
            Visible = True
          end
          item
            Item = BarLargeButtonView
            Visible = True
          end
          item
            Item = dxBarLargeButton5
            Visible = True
          end
          item
            Item = BarLargeButtonSign
            Visible = True
          end
          item
            Item = BarLargeButtonUnsign
            Visible = True
          end
          item
            Item = dxBarLargeButton6
            Visible = True
          end>
        MultiLine = True
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        ShowMark = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'FilterBar'
        DockedDockingStyle = dsLeft
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsLeft
        FloatLeft = 404
        FloatTop = 341
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            Item = dxBarLargeButton7
            Visible = True
          end
          item
            Item = dxBarLargeButton8
            Visible = True
          end
          item
            Item = dxBarLargeButton9
            Visible = True
          end
          item
            Item = dxBarLargeButton10
            Visible = True
          end
          item
            Item = dxBarLargeButton11
            Visible = True
          end
          item
            Item = dxBarLargeButton12
            Visible = True
          end>
        Name = 'FilterBar'
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Images = ImageList
    LargeImages = ImageList
    NotDocking = [dsNone]
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 552
    Top = 8
    DockControlHeights = (
      38
      0
      48
      0)
    object dxBarLargeButtonAdd: TdxBarLargeButton
      Action = ActionAdd
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080
      ButtonStyle = bsDropDown
      DropDownMenu = PopupMenuAdd
      AutoGrayScale = False
    end
    object SubItemAddByImport: TdxBarSubItem
      Action = ActAddByHand
      Category = 0
      ItemLinks = <>
    end
    object SubItemAddByHand: TdxBarSubItem
      Action = ActionAddByImport
      Category = 0
      ItemLinks = <>
    end
    object dxBarLargeButtonEdit: TdxBarLargeButton
      Action = ActionChange
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080
      AutoGrayScale = False
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarLargeButtonDel: TdxBarLargeButton
      Action = ActionDel
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080
      AutoGrayScale = False
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = ActAddByHand
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1074#1088#1091#1095#1085#1091
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Action = ActionAddByImport
      Category = 0
      Hint = #1030#1084#1087#1086#1088#1090#1091#1074#1072#1090#1080' '#1076#1072#1085#1110
    end
    object dxBarLargeButton5: TdxBarLargeButton
      Action = ActionRefresh
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton6: TdxBarLargeButton
      Action = ActionClose
      Category = 0
      AutoGrayScale = False
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object BarLargeButtonSign: TdxBarLargeButton
      Action = ActionSign
      Category = 0
      AutoGrayScale = False
    end
    object BarLargeButtonUnsign: TdxBarLargeButton
      Action = ActionUnsign
      Category = 0
      AutoGrayScale = False
    end
    object BarLargeButtonView: TdxBarLargeButton
      Action = ActionView
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = ActionFilter
      Category = 0
      AllowAllUp = True
      ShowCaption = False
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = ActionClear
      Category = 0
      AutoGrayScale = False
      ShowCaption = False
    end
    object dxBarLargeButton7: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00993300009933
        0000993300009933000099330000993300009933000099330000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000993300007B3E2900984D
        1B00AA551200B1580E00B1580E00AB5711009A4E19007E402700993300009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00993300009933000086432300B65C0C00D1690000D46B
        0000D36A0000D16A0000D1690000D36A0000D46B0000D1690000BB5F0B008D46
        20009933000099330000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00993300007B3E2900A8561300D56C0000D36A0000CB660100CA65
        0100C9640000CB660100CB660100CB660100CB660100CB660000D16A0000D86C
        0000AC5711009933000099330000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF009933000083422400AE571000D66C0000CD680000CA660100CB660100CB66
        0100CB660100CB660100CB660100CB660100CB660100CB660100CB660100CB67
        0000D96D0000AE5710009933000099330000FF00FF00FF00FF00FF00FF00FF00
        FF0099330000AF590E00D46B0000CC660000CB660100CB660100CB660100CB66
        0100CB660100CB660100CB660100CB660100CB660100CB660100CB660100CB66
        0100CA650100D96C0000AC57110099330000FF00FF00FF00FF00FF00FF009933
        0000A2511500D1690000CC670000CB660100CB660100CB670200CB660100CB66
        0100D0741800D5843400D5843400D5843400D5843400D27B2500CB660100CB66
        0100CB660100CB660100D66B00008D46200099330000FF00FF00FF00FF009933
        0000BE600800D26A0200CD6A0700CE6B0800CE6E0B00CC670200E1A66A00F9F0
        E700FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00EFD1B400CB660100CB66
        0100CB660100CA660100D2690000BA5E090099330000FF00FF00D6820000A754
        1400CF6E0900D2721000D2761500D3771900D4791B00EDC9A400FEFEFE00FEFE
        FE00F9EDE200F4E1CD00F4E0CC00F4E0CB00F4E0CB00E8BC9000CB660100CB66
        0100CB660100CB660100CB660100D36A00007F3F270099330000D6820000B75F
        1300D87A1700D57C2000D77F2400D8812800E3A66600FEFEFE00FBF5EF00E09C
        5700D67A1D00D3761600CF6E0D00CC690400CB660100CB660100CB660100CB66
        0100CB660100CB660100CB660100D46B00009A4F1A0099330000D6820000C26B
        1800DE852900DC863000DC873200DD8A3600F2D3B400FEFEFE00EBB88500DC86
        3000DA832A00D77D2200D3771900D1700E00CC690500CB660100CB660100CB66
        0100CB660100CB660100CB660100D36A0000AA55120099330000D6820000CA76
        2300E3964600E1994D00E1914200E2934400F6E0CA00FEFEFE00E8AA6C00E08F
        3C00DE8B3500DB852D00D77D2300D4771900FEFEFE00CB680300CB660100CB66
        0100CB660100CB660100CA650100D2690000B1580E0099330000D6820000CF7D
        2F00E9A96600EAAE7200E79F5500E79E5300F6D8BB00FEFEFE00F1C89E00E598
        4B00E2934300DF8D3900DB852E00D67F2700FEFEFE00FEFEFE00CC660100CB66
        0100CB660100CB660100CA650100D2690000B1580E0099330000D6820000CF7E
        2F00EDB37900F0C39500ECAE6D00ECA76000F1BC8500FEFDFC00FDFAF700F0BF
        8E00E69A4F00E2934300DE8B3600DC8A3600FEFEFE00FEFEFE00FEFEFE00CB66
        0100CB660100CB660100CB660100D36A0000AA55120099330000D6820000CB76
        2500EFB67D00F5D3B000F3C29000F1B16F00F1B27100F8D8B800FEFEFE00FEFE
        FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
        FE00E5B28000CB660100CB660100D46B0000984D1C0099330000D6820000D682
        0000ECAE7000F7D8B900FADBBB00F6C18D00F6BD8100F7BC7F00F7CCA200FBED
        DF00FEFDFC00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
        FE00E5B28000CB660100CC660000D16900007C3F280099330000FF00FF00D682
        0000DF954C00F8D1AA00FBEAD700FADBBB00FCCC9800FBC38800F7C08700F2B1
        7000EDA96400E8A05500E3954600E0934400FEFEFE00FEFEFE00FEFEFE00CB67
        0200CB660100CA660100D36A0000B85D0A0099330000FF00FF00FF00FF00D682
        0000D6820000F3C08B00FCE5CD00FDEFE000FEDFBE00FCCA9300F7C18800F2B3
        7200EDA96400E8A05600E2954600DF8F3D00FEFEFE00FEFEFE00CE6D0B00CB67
        0200CB660100CC660000D66B00008744230099330000FF00FF00FF00FF00FF00
        FF00D6820000DA8D4200FAD2A800FDEDDD00FEF2E600FBDDBE00F8CA9D00F0B0
        6E00ECA76000E79E5300E2934300DD8A3600FEFEFE00D3771900CE6C0900CB66
        0200CC670000D86C0000A452140099330000FF00FF00FF00FF00FF00FF00FF00
        FF00D6820000D6820000DD944C00F9D3AC00FCEBD900FEF2E600FAE5CF00F6D4
        B000F0B98300E8A45D00E2994C00DE8F3E00DA893600D7842F00D27C2400D172
        1100D86C0000A65214006A35310099330000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D6820000D6820000DA8F4600F5C69600FBDFC200FBEBDB00FBEB
        DB00F8E2CC00F2D4B500EFC89F00EBBD8E00E8B58200E3A66800DE8F3E00D676
        1600A75313006F392D0099330000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00D6820000D6820000D6820000E09E5D00F0C08E00F5D1
        AA00F7D8B900F6D8BA00F4D2AF00EFC59900E9B17700DC944A00C06E2400974E
        20009933000099330000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00D6820000D6820000D6820000C980
        3B00D28F5100D5955800D1905300C9824400B56C31009C552600884525009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D6820000D682
        0000D6820000D6820000D6820000D6820000D6820000D6820000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ImageIndex = 20
      AutoGrayScale = False
      ShowCaption = False
    end
    object dxBarLargeButton8: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00993300009933
        0000993300009933000099330000993300009933000099330000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0099330000993300007B3E2900984D
        1B00AA551200B1580E00B1580E00AB5711009A4E19007E402700993300009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00993300009933000086432300B65C0C00D1690000D46B
        0000D36A0000D16A0000D1690000D36A0000D46B0000D1690000BB5F0B008D46
        20009933000099330000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00993300007B3E2900A8561300D56C0000D36A0000CB660100CA65
        0100C9640000CB660100CB660100CB660100CB660100CB660000D16A0000D86C
        0000AC5711009933000099330000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF009933000083422400AE571000D66C0000CD680000CA660100CB660100CB66
        0100CB660100CB660100CB660100CB660100CB660100CB660100CB660100CB67
        0000D96D0000AE5710009933000099330000FF00FF00FF00FF00FF00FF00FF00
        FF0099330000AF590E00D46B0000CC660000CB660100CB660100CB660100CB66
        0100CB660100CB660100CB660100CB660100CB660100CB660100CB660100CB66
        0100CA650100D96C0000AC57110099330000FF00FF00FF00FF00FF00FF009933
        0000A2511500D1690000CC670000CB660100CB660100CB670200CB660100D27B
        2500D5843300D5843400D5843400D5843400D0741900CB660100CB660100CB66
        0100CB660100CB660100D66B00008D46200099330000FF00FF00FF00FF009933
        0000BE600800D26A0200CD6A0700CE6B0800CE6E0B00CC670200CE6B0700EFD2
        B500FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00F9F0E600DFA36600CB66
        0100CB660100CA660100D2690000BA5E090099330000FF00FF00D6820000A754
        1400CF6E0900D2721000D2761500D3771900D4791B00D2721000D4761800EBC2
        9800F5E1CE00F4E1CD00F4E0CC00F4E0CB00F8ECE000FEFEFE00FEFEFE00EBC5
        9F00CB660100CB660100CB660100D36A00007F3F270099330000D6820000B75F
        1300D87A1700D57C2000D77F2400D8812800D9832A00D77C2000D9802700D77E
        2300D67A1D00D3761600CF6E0D00CC690400CB660100D78A3D00FAF3EC00FEFE
        FE00D9914800CB660100CB660100D46B00009A4F1A0099330000D6820000C26B
        1800DE852900DC863000DC873200DD8A3600DE8C3900DD872E00DE893500DC86
        3000DA832A00D77D2200D3771900D1700E00CC690500CB660100DFA36600FEFE
        FE00EBC59F00CB660100CB660100D36A0000AA55120099330000D6820000CA76
        2300E3964600E1994D00E1914200E2934400E3954700E3954600E2924200E08F
        3C00FEFEFE00DB852D00D77D2300D4771900CF6F0D00CB680300D6883A00FEFE
        FE00F0D3B700CB660100CA650100D2690000B1580E0099330000D6820000CF7D
        2F00E9A96600EAAE7200E79F5500E79E5300E9A05600E8A05500E79D5100FEFE
        FE00FEFEFE00DF8E3B00DB852E00D67D2400D3751600CE6B0800E2AA7200FEFE
        FE00EAC19900CB660100CA650100D2690000B1580E0099330000D6820000CF7E
        2F00EDB37900F0C39500ECAE6D00ECA76000EDAA6400EDA96300FEFEFE00FEFE
        FE00FEFEFE00E4994E00DE8B3600DA832A00D67A1D00E09F5D00FCF7F200FDFC
        FB00D6863700CB660100CB660100D36A0000AA55120099330000D6820000CB76
        2500EFB67D00F5D3B000F3C29000F1B16F00F8D8B800FEFEFE00FEFEFE00FEFE
        FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00E5B3
        8100CB660100CB660100CB660100D46B0000984D1C0099330000D6820000D682
        0000ECAE7000F7D8B900FADBBB00F6C18D00FADEC000FEFEFE00FEFEFE00FEFE
        FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFDFB00F5E1CD00DD9A5600CB67
        0100CB660100CB660100CC660000D16900007C3F280099330000FF00FF00D682
        0000DF954C00F8D1AA00FBEAD700FADBBB00FCCC9800FBC38800FEFEFE00FEFE
        FE00FEFEFE00E9A65F00E3954600DE8C3800D9822A00D4781B00CE6D0A00CB67
        0200CB660100CA660100D36A0000B85D0A0099330000FF00FF00FF00FF00D682
        0000D6820000F3C08B00FCE5CD00FDEFE000FEDFBE00FCCA9300F7C18800FEFE
        FE00FEFEFE00E9A25A00E2954600DE8C3800D9822A00D4781B00CE6D0B00CB67
        0200CB660100CC660000D66B00008744230099330000FF00FF00FF00FF00FF00
        FF00D6820000DA8D4200FAD2A800FDEDDD00FEF2E600FBDDBE00F8CA9D00F0B0
        6E00FEFEFE00E79E5300E2934300DD8A3600D8812800D3771900CE6C0900CB66
        0200CC670000D86C0000A452140099330000FF00FF00FF00FF00FF00FF00FF00
        FF00D6820000D6820000DD944C00F9D3AC00FCEBD900FEF2E600FAE5CF00F6D4
        B000F0B98300E8A45D00E2994C00DE8F3E00DA893600D7842F00D27C2400D172
        1100D86C0000A65214006A35310099330000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D6820000D6820000DA8F4600F5C69600FBDFC200FBEBDB00FBEB
        DB00F8E2CC00F2D4B500EFC89F00EBBD8E00E8B58200E3A66800DE8F3E00D676
        1600A75313006F392D0099330000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00D6820000D6820000D6820000E09E5D00F0C08E00F5D1
        AA00F7D8B900F6D8BA00F4D2AF00EFC59900E9B17700DC944A00C06E2400974E
        20009933000099330000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00D6820000D6820000D6820000C980
        3B00D28F5100D5955800D1905300C9824400B56C31009C552600884525009933
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D6820000D682
        0000D6820000D6820000D6820000D6820000D6820000D6820000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ImageIndex = 15
      AutoGrayScale = False
      ShowCaption = False
    end
    object dxBarLargeButton9: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 16
      AutoGrayScale = False
      ShowCaption = False
    end
    object dxBarLargeButton10: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 17
      AutoGrayScale = False
      ShowCaption = False
    end
    object dxBarLargeButton11: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 18
      ShowCaption = False
    end
    object dxBarLargeButton12: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 19
      ShowCaption = False
    end
  end
  object PopupMenuAdd: TdxBarPopupMenu
    BarManager = dxBarManager1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemLinks = <
      item
        Item = dxBarLargeButton3
        Visible = True
      end
      item
        Item = dxBarLargeButton4
        Visible = True
      end>
    UseOwnFont = True
    UseRecentItems = True
    Left = 520
    Top = 8
  end
  object OplataActList: TActionList
    Images = ImageList
    Left = 672
    Top = 8
    object ActAddByHand: TAction
      Caption = #1044#1086#1076#1072#1090#1080' '#1074#1088#1091#1095#1085#1091
      ImageIndex = 0
      OnExecute = ActAddByHandExecute
    end
    object ActionAddByImport: TAction
      Caption = #1030#1084#1087#1086#1088#1090#1091#1074#1072#1090#1080' '#1076#1072#1085#1110
      ImageIndex = 0
      OnExecute = ActionAddByImportExecute
    end
    object ActionChange: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ImageIndex = 1
      OnExecute = ActionChangeExecute
    end
    object ActionDel: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ImageIndex = 2
      OnExecute = ActionDelExecute
    end
    object ActionAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      ImageIndex = 0
      OnExecute = ActAddByHandExecute
    end
    object ActionRefresh: TAction
      Caption = #1054#1085#1086#1074#1080#1090#1080
      ImageIndex = 3
      OnExecute = ActionRefreshExecute
    end
    object ActionClose: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ImageIndex = 5
      OnExecute = ActionCloseExecute
    end
    object ActionView: TAction
      Caption = #1055#1077#1088#1077#1075#1083#1103#1076
      ImageIndex = 12
      OnExecute = ActionViewExecute
    end
    object ActionSign: TAction
      Caption = #1055#1110#1076#1087#1080#1089#1072#1090#1080
      ImageIndex = 10
      OnExecute = ActionSignExecute
    end
    object ActionUnsign: TAction
      Caption = #1056#1086#1079#1087#1110#1076#1087#1080#1089#1072#1090#1080
      ImageIndex = 11
      OnExecute = ActionUnsignExecute
    end
    object ActionFilter: TAction
      Caption = 'ActionFilter'
      ImageIndex = 14
      OnExecute = ActionFilterExecute
    end
    object ActionClear: TAction
      Caption = 'ActionClear'
      ImageIndex = 13
      OnExecute = ActionClearExecute
    end
  end
  object DataSetPack: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    OnEndScroll = DataSetPackEndScroll
    SelectSQL.Strings = (
      'select * from bs_dt_pack_sel('#39'1'#39',1,'#39'1'#39','#39'1'#39',1,1,1,1)')
    Left = 232
    Top = 432
    poSQLINT64ToBCD = True
    object DataSetPackID_DT_PACK: TFIBBCDField
      FieldName = 'ID_DT_PACK'
      Size = 0
      RoundByScale = True
    end
    object DataSetPackNUMB_PACK: TFIBBCDField
      FieldName = 'NUMB_PACK'
      currency = True
      Size = 0
      RoundByScale = True
    end
    object DataSetPackNAME_FILE_IMPORT: TFIBStringField
      FieldName = 'NAME_FILE_IMPORT'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetPackDATE_CURRENT: TFIBDateField
      FieldName = 'DATE_CURRENT'
    end
    object DataSetPackALL_COUNT_REC_PACK: TFIBIntegerField
      FieldName = 'ALL_COUNT_REC_PACK'
    end
    object DataSetPackALL_SUM_OPL_PACK: TFIBBCDField
      FieldName = 'ALL_SUM_OPL_PACK'
      Size = 2
      RoundByScale = True
    end
    object DataSetPackIS_SIGNED: TFIBSmallIntField
      FieldName = 'IS_SIGNED'
    end
    object DataSetPackKOD_PERIOD_SYSTEM: TFIBSmallIntField
      FieldName = 'KOD_PERIOD_SYSTEM'
    end
    object DataSetPackADD_BY_HAND: TFIBSmallIntField
      FieldName = 'ADD_BY_HAND'
    end
    object DataSetPackMONTH_INT: TFIBIntegerField
      FieldName = 'MONTH_INT'
    end
    object DataSetPackYEAR_INT: TFIBIntegerField
      FieldName = 'YEAR_INT'
    end
    object DataSetPackMONTH_YEAR: TFIBStringField
      FieldName = 'MONTH_YEAR'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetPackNAME_DOC_PROP: TFIBStringField
      FieldName = 'NAME_DOC_PROP'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetPackID_DOC_PROP: TFIBIntegerField
      FieldName = 'ID_DOC_PROP'
    end
    object DataSetPackID_DOCUMENT: TFIBBCDField
      FieldName = 'ID_DOCUMENT'
      Size = 0
      RoundByScale = True
    end
  end
  object DSPack: TDataSource
    DataSet = DataSetPack
    Left = 272
    Top = 432
  end
  object Styles: TcxStyleRepository
    Left = 640
    Top = 8
    object BackGround: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object FocusedRecord: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 11037222
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clDefault
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Header: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object DesabledRecord: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor]
      Color = 13875838
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor]
      Color = 15850428
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15850428
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14531001
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxGridTableViewStyleSheet2: TcxGridTableViewStyleSheet
      Styles.Background = BackGround
      Styles.Content = BackGround
      Styles.ContentEven = cxStyle22
      Styles.ContentOdd = cxStyle23
      Styles.Inactive = DesabledRecord
      Styles.Selection = FocusedRecord
      Styles.Header = Header
      BuiltIn = True
    end
    object DevExpress_Style: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle24
      Styles.Content = cxStyle25
      Styles.ContentEven = cxStyle26
      Styles.ContentOdd = cxStyle27
      Styles.Inactive = cxStyle33
      Styles.IncSearch = cxStyle34
      Styles.Selection = cxStyle37
      Styles.FilterBox = cxStyle28
      Styles.Footer = cxStyle29
      Styles.Group = cxStyle30
      Styles.GroupByBox = cxStyle31
      Styles.Header = cxStyle32
      Styles.Indicator = cxStyle35
      Styles.Preview = cxStyle36
      BuiltIn = True
    end
  end
  object DataSetPersAcc: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    SelectSQL.Strings = (
      'select * from BS_DT_ALLOCATION_ACCOUNTS_SEL(1)')
    DataSource = DSPack
    Left = 536
    Top = 336
    poSQLINT64ToBCD = True
    object DataSetPersAccID_DT_ALLOC_PERS_AC: TFIBBCDField
      FieldName = 'ID_DT_ALLOC_PERS_AC'
      Size = 0
      RoundByScale = True
    end
    object DataSetPersAccSUM_OPL: TFIBBCDField
      FieldName = 'SUM_OPL'
      currency = True
      Size = 2
      RoundByScale = True
    end
    object DataSetPersAccDATE_OPL: TFIBDateField
      FieldName = 'DATE_OPL'
    end
    object DataSetPersAccDATE_OBR: TFIBDateField
      FieldName = 'DATE_OBR'
    end
    object DataSetPersAccID_REC_BUFF: TFIBBCDField
      FieldName = 'ID_REC_BUFF'
      Size = 0
      RoundByScale = True
    end
    object DataSetPersAccID_PERSONAL_ACCOUNT: TFIBBCDField
      FieldName = 'ID_PERSONAL_ACCOUNT'
      Size = 0
      RoundByScale = True
    end
    object DataSetPersAccDATE_BEG_PERIOD_FOR_ACC: TFIBDateField
      FieldName = 'DATE_BEG_PERIOD_FOR_ACC'
    end
    object DataSetPersAccDATE_END_PERIOD_FOR_ACC: TFIBDateField
      FieldName = 'DATE_END_PERIOD_FOR_ACC'
    end
    object DataSetPersAccCLIENT_ACCOUNT: TFIBBCDField
      FieldName = 'CLIENT_ACCOUNT'
      currency = True
      Size = 0
      RoundByScale = True
    end
    object DataSetPersAccNAME_CASH_TYPE: TFIBStringField
      FieldName = 'NAME_CASH_TYPE'
      Size = 50
      EmptyStrToNull = True
    end
    object DataSetPersAccNOTE_CASH_TYPE: TFIBStringField
      FieldName = 'NOTE_CASH_TYPE'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetPersAccNAME_KASSA_APP: TFIBStringField
      FieldName = 'NAME_KASSA_APP'
      Size = 50
      EmptyStrToNull = True
    end
    object DataSetPersAccNOTE_KASSA_APP: TFIBStringField
      FieldName = 'NOTE_KASSA_APP'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object DataSourcePersAcc: TDataSource
    DataSet = DataSetPersAcc
    Left = 576
    Top = 336
  end
  object TransRead: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 607
    Top = 7
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = TransRead
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 577
    Top = 9
  end
  object DataSetIni: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    Left = 417
    Top = 57
    poSQLINT64ToBCD = True
  end
  object ImageList: TImageList
    Height = 24
    Width = 24
    Left = 704
    Top = 8
    Bitmap = {
      494C010115001800040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000006000000090000000010020000000000000D8
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009933000099330000993300009933
      0000993300009933000099330000993300000000000000000000000000000000
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
      0000000000000000000099330000993300007B3E2900984D1B00AA551200B158
      0E00B1580E00AB5711009A4E19007E4027009933000099330000000000000000
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
      0000993300009933000086432300B65C0C00D1690000D46B0000D36A0000D16A
      0000D1690000D36A0000D46B0000D1690000BB5F0B008D462000993300009933
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      00007B3E2900A8561300D56C0000D36A0000CB660100CA650100C9640000CB66
      0100CB660100CB660100CB660100CB660000D16A0000D86C0000AC5711009933
      0000993300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000993300008342
      2400AE571000D66C0000CD680000CA660100CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100CB660100CB660100CB670000D96D0000AE57
      1000993300009933000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099330000AF59
      0E00D46B0000CC660000CB660100CB660100CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100CB660100CB660100CB660100CA650100D96C
      0000AC5711009933000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000A2511500D169
      0000CC670000CB660100CB660100CB670200CB660100CB660100D0741800D584
      3400D5843400D5843400D5843400D27B2500CB660100CB660100CB660100CB66
      0100D66B00008D46200099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000BE600800D26A
      0200CD6A0700CE6B0800CE6E0B00CC670200E1A66A00F9F0E700FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00EFD1B400CB660100CB660100CB660100CA66
      0100D2690000BA5E090099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000A7541400CF6E0900D272
      1000D2761500D3771900D4791B00EDC9A400FEFEFE00FEFEFE00F9EDE200F4E1
      CD00F4E0CC00F4E0CB00F4E0CB00E8BC9000CB660100CB660100CB660100CB66
      0100CB660100D36A00007F3F2700993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000B75F1300D87A1700D57C
      2000D77F2400D8812800E3A66600FEFEFE00FBF5EF00E09C5700D67A1D00D376
      1600CF6E0D00CC690400CB660100CB660100CB660100CB660100CB660100CB66
      0100CB660100D46B00009A4F1A00993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000C26B1800DE852900DC86
      3000DC873200DD8A3600F2D3B400FEFEFE00EBB88500DC863000DA832A00D77D
      2200D3771900D1700E00CC690500CB660100CB660100CB660100CB660100CB66
      0100CB660100D36A0000AA551200993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000CA762300E3964600E199
      4D00E1914200E2934400F6E0CA00FEFEFE00E8AA6C00E08F3C00DE8B3500DB85
      2D00D77D2300D4771900FEFEFE00CB680300CB660100CB660100CB660100CB66
      0100CA650100D2690000B1580E00993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000CF7D2F00E9A96600EAAE
      7200E79F5500E79E5300F6D8BB00FEFEFE00F1C89E00E5984B00E2934300DF8D
      3900DB852E00D67F2700FEFEFE00FEFEFE00CC660100CB660100CB660100CB66
      0100CA650100D2690000B1580E00993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000CF7E2F00EDB37900F0C3
      9500ECAE6D00ECA76000F1BC8500FEFDFC00FDFAF700F0BF8E00E69A4F00E293
      4300DE8B3600DC8A3600FEFEFE00FEFEFE00FEFEFE00CB660100CB660100CB66
      0100CB660100D36A0000AA551200993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000CB762500EFB67D00F5D3
      B000F3C29000F1B16F00F1B27100F8D8B800FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00E5B28000CB66
      0100CB660100D46B0000984D1C00993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000D6820000ECAE7000F7D8
      B900FADBBB00F6C18D00F6BD8100F7BC7F00F7CCA200FBEDDF00FEFDFC00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00E5B28000CB66
      0100CC660000D16900007C3F2800993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6820000DF954C00F8D1
      AA00FBEAD700FADBBB00FCCC9800FBC38800F7C08700F2B17000EDA96400E8A0
      5500E3954600E0934400FEFEFE00FEFEFE00FEFEFE00CB670200CB660100CA66
      0100D36A0000B85D0A0099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6820000D6820000F3C0
      8B00FCE5CD00FDEFE000FEDFBE00FCCA9300F7C18800F2B37200EDA96400E8A0
      5600E2954600DF8F3D00FEFEFE00FEFEFE00CE6D0B00CB670200CB660100CC66
      0000D66B00008744230099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6820000DA8D
      4200FAD2A800FDEDDD00FEF2E600FBDDBE00F8CA9D00F0B06E00ECA76000E79E
      5300E2934300DD8A3600FEFEFE00D3771900CE6C0900CB660200CC670000D86C
      0000A45214009933000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6820000D682
      0000DD944C00F9D3AC00FCEBD900FEF2E600FAE5CF00F6D4B000F0B98300E8A4
      5D00E2994C00DE8F3E00DA893600D7842F00D27C2400D1721100D86C0000A652
      14006A3531009933000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D682
      0000D6820000DA8F4600F5C69600FBDFC200FBEBDB00FBEBDB00F8E2CC00F2D4
      B500EFC89F00EBBD8E00E8B58200E3A66800DE8F3E00D6761600A75313006F39
      2D00993300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6820000D6820000D6820000E09E5D00F0C08E00F5D1AA00F7D8B900F6D8
      BA00F4D2AF00EFC59900E9B17700DC944A00C06E2400974E2000993300009933
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
      00000000000000000000D6820000D6820000D6820000C9803B00D28F5100D595
      5800D1905300C9824400B56C31009C5526008845250099330000000000000000
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
      000000000000000000000000000000000000D6820000D6820000D6820000D682
      0000D6820000D6820000D6820000D68200000000000000000000000000000000
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
      000000000000FEFEFE00FDFDFD00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFF00FAFBFB00F9F9
      F900F9FAFA00F9F9FA00FAF9F900FEFDFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000EAEAEA00C7C7
      C700EAEAEA00000000000000000000000000FEFEFE00FEFEFE00000000000000
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
      000000000000000000000000000000000000FEFEFE0000000000BEBEBE00A5A5
      A500A5A3A300B6B6B600DADADA00F7F7F700000000000000000000000000FEFE
      FE00FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDFEFF0043617E00363636003738
      39003636390040363600E6CFAA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000E0E0E000A2A1A100B1B0
      B000AEAEAE00A8A7A7009C9B9B00A5A4A400C6C6C500EAEAEA00000000000000
      000000000000FEFEFE00FEFEFE00000000000000000000000000000000000000
      000000000000000000000000000000000000E7FDFF00042C5300000000000000
      00000000000001000000DEBF8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700A0A0A000717171007878
      7800757474007776760079797900777676006E6D6C007E7D7C00AAAAA900D8D8
      D800F6F6F6000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E9FEFF0012385C00020202000304
      0500020206000F020200E0C29400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F0F0F00000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000FCFDFD00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FEFDFC000000
      0000FEFEFE0000000000FEFEFE0000000000FCFDFD00FDFCFB0000000000FEFE
      FE00FFFFFE000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE0000000000CCCBCB005D5A5A00565353005655
      5500585555005856550058565500595656005A58570058565500555251005F5D
      5C008B898800BFBEBE00ECECEC00FDFDFD000000000000000000000000000000
      000000000000000000000000000000000000E9FEFF0013395D00040404000405
      06000404070010040400E0C29400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F0F0F0000000000FCFCFC0000000000000000000000
      000000000000000000000000000000000000CECECE001E1E1E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFEFE0000000000FDFDFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE0000000000ECECEC0089868600545353006C6C6C00514F
      4F00585655005452510056545300595756005A58570059575600585656005554
      530053504F00514D4C0097959300FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000E7FDFF0000274E00000000000000
      00000000000000000000DDBD8B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000F0F0F0000000000FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00FEFFFF00000000000000000000000000000000000000000014141400FEFF
      FF00FDFDFD00FEFFFF0000000000000000000000000000000000000000000000
      0000FFFFFE000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FCFCFC00B7B6B6005C5A5A005D5C5C00555353005452
      5200616161005553530054525200545252005451500056535200595756005856
      56005B5858005C585700DCDBDB00000000000000000000000000000000000000
      000000000000000000000000000000000000F1FEFF0071879D00686868006869
      690068686A006F676800ECDABE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000F0F0F0000000000FCFCFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FEFFFF00FEFEFE00CCDBDB000000000000000000DEDBDB00FEFEFE00FFFE
      FE00FEFEFE00FCFCFD00FFFFFB00CCDBDB000000000000000000CCDBDB00FBFA
      FB00FFFFFD000000000000000000000000000000000000000000000000000000
      0000FEFEFE0000000000DBDBDB00777575005250500063626200555353005C5B
      5B0052515100504E4D005B5A5A00585656005856550059575600514E4D005754
      530055515000ACABAA0000000000FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F0F0F0000000000FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFB0000000000000000000000000000000000FCFDFF000000
      0000FCFEFE00FFFDFA00FEFEFE00FEFEFE00000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
      0000FEFEFE00F4F4F400A3A2A200555354006C6B6B0054535300555353005B5A
      5A00535251005C5B5B0059585700504D4C005554530056545400585655005C5B
      5A0073717000F8F8F800FDFDFD00FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000FDFEFE0044668300131414001617
      170013131400281C1300F9E1C200FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F0F0F000000
      0000FCFCFC000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FEFFFF00FEFBF900FDFEFE000000000000000000FEFEFE00FCFBFC00FDFD
      FE00FCFAFA00F5FFFF00CCDBDB0000000000000000000000000000000000FCFB
      FC00FFFFFE00000000000000000000000000000000000000000000000000FEFE
      FE0000000000C9C8C8006F6D6E00555454005D5C5C0055545400636262005857
      57005452510058575600514F4F005A5959005C5B5B00504D4C00585756005552
      5100DADAD90000000000FDFDFD00000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFF0036597B00000000000000
      00000000000001000000BE9B7200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000909
      0900000000006565650000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFCFA0000000000000000000000000000000000FBFBFD00FBFB
      FA0000000000CCDBDB000000020000000000000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000FEFEFE000000
      0000E7E7E7009492920053515100676767005857570059585800595858005150
      50005C5A5A005A585800565454005A595800504D4C005A5857005B595800A4A3
      A20000000000FDFDFD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008AAACF00000001000505
      020002020200010201001E0B0400BFA98C0000000000FCFCFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000F0F0F00ABABAB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFCFA00000000000000000000000000FEFEFE00FEFEFE00FEFE
      FE00CCDBDB00000000000000000000000000000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000FEFEFE00FDFD
      FD00B7B6B60068676700636363005A595900545151005F5E5E00575555005C5A
      5A005D5C5C00504E4D005A5858005A595900565555005B5A5A006C6A6900F6F6
      F600FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900F2FDFD003E5E87000000
      0000020200000101020000000100050000009A755C00FFFFF500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000F0F
      0F00F0F0F0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFCFA00000000000000000000000000FDFEFF0000000000CCDB
      DB00000000000000000000000000CCDBDB00000000000000000000000000FCFB
      FC00FFFFFE0000000000000000000000000000000000FDFDFD0000000000D7D7
      D6008A8788005856550061605F0056555400605F5E005D5C5C0056555500605F
      5F00585656005C5A5A0063626200524F4F005B5959005A575600D4D3D3000000
      0000FDFDFD00000000000000000000000000000000000000000000000000FFFE
      FF00000000000000000000000000000000000000000000000000F4FFFF005178
      960000000000010000000201010000020300000000007E574000FFFBEE00FCFD
      FD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F0F0F00F0F0
      F000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFCFA00FEFFFF000000000000000000FFFFFD00CCDBDB000000
      00000A00000000000000CCDBDB00FEFDFD00000000000000000000000000FCFB
      FC00FFFFFE00000000000000000000000000FEFEFE00FEFEFE00F5F5F500A6A4
      A500676466005B5858005C5A5A005B595800656669005B5A5A005B5956005F5E
      5C005755540062606000545251005A5858005A5958009B99980000000000FDFD
      FD0000000000000000000000000000000000000000000000000000000000FEFF
      FE00FAFDFF00E7E8EB00E6E5E400DFE6E600758A9C008F717100FFF3E3000000
      00008EA8BC00010A250000000000010001000305040000000000A8805500FFFF
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F0F0F00F0F0F0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFCFA00000000000000000000000000CCDBDB00000000000000
      000000000000CCDBDB00F5F8FA00FFFFFE00000000000000000000000000FCFB
      FC00FFFFFE00000000000000000000000000FCFCFC0000000000BFBFBE008987
      870081847F006D6D6B005D5B5B0057545400848796009CA3B800898E9D006C6D
      74005E5C5C005F5E5D005B5959006261610067646300F3F3F300FEFEFE00FEFE
      FE0000000000000000000000000000000000000000000000000000000000FFFE
      FD00E6FBFF001426540005050500050607000000000005000000F5D7B200F9FA
      FC000000000098BDDD0000011800010100000202020001020200361B0700FEF2
      DA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000F0F0F00F0F0F000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CCDBDB00FBFBFE00FAFAF90000000000000000000000000000000000FCFB
      FC00FFFFFE0000000000000000000000000000000000DCDDDD0075737400929A
      9000B4C6AF009FAA9800929B8D007D827A0068696500676668007D7E8A008B8F
      9F00615F5F00585553005C5A580058555400CCCBCB0000000000FDFDFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000365C8300000000000102020006050500010405008A6C4A00FFFF
      FE0000000000B3D3F0000001180001000000010101000000000021150200FAE2
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000F0F0F00F0F0F00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FEFF
      FF00FEFEFE00FEFBFA00FEFEFE0000000000000000000000020000000000CCDB
      DB00FAFCFF00FEFDFC00F8FAFC00FCFDFD000000000000000000FDFDFC00FBFA
      FA00FFFEFE00FEFEFE00FFFFFE000000000000000000C9C9CA00848485008693
      86009DB09B009CAB96009EAE97009AA8920095A28F00838C7D0072776D006262
      5D005A5857005C585800595654009392910000000000FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008AB0D4000000030004040300000000000000000000000000564A
      3C0061616100162133000000000001010100020100000101020045250D00FEF6
      E200000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F0F0F00000000000000000000000000000000000000
      000000000000000000000000000000000000CECECE000B0B0B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CCDBDB00FDFF
      FF00FDFCFB0000000000FFFFFE0000000000000000000000000000000000FEFF
      FF00FFFFFD0000000000000000000000000000000000DADADA005D5C5C003D39
      3B00414140005B615B007C877C00909F8E0098A8940097A7920095A491008A96
      850080897C006E726A0057555400EEEEEE0000000000FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E8F9FF0018375A00000000000405050001020200000000000000
      0000000000000000000001010100020202000204050000000000B99166000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F0F0F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000005050500000000000000
      0000000000000000000000000000000000000000000000000000FDFEFE00FEFF
      FF00FDFCFB00FDFCFB00CCDBDB000000000000000000CCDBDB0000000000FDFB
      FB00FEFEFE00FDFEFF00FDFCFB00CCDBDB000000000000000000CCDBDB00FDFC
      FB00FFFEFD00FEFDFD00FFFFFE00000000000000000000000000F1F1F000CACA
      CA008C8A8A00494444002722230031302F004E534E00707B7100859385008B9A
      890092A18E0074807400BEBDBD0000000000FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFEFC00C1D9F2000F1D3D000000000000000000040302000707
      0600070707000505060000000000000000000000000081674600FFF9F100FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFE00FEFF
      FF00FDFCFB00000000000000000000000000000000000000000000000000FFFF
      FE00FCFDFE00FEFEFF0000000000000000000000000000000000000000000000
      0000FFFEFF00FDFDFD00FFFFFE00000000000000000000000000000000000000
      000000000000F7F7F700D4D4D40099969600534F5000262122002E2C2C005054
      5000687269007F807E0000000000FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D5E1F30057687700212A3000000000000000
      00000000000000000000120A00003F383200B3A28D00FFFFF800FDFFFF00FEFE
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD0000000000FEFE
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFE000000000000000000000000000000000000000000FEFEFE00FDFD
      FD00FDFDFD00000000000000000000000000FCFCFC00DEDEDE00A8A7A700635F
      6000413D3E00E9E9E90000000000FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0FBFF00B3B5B900B3B3
      B300B4B4B400B3B3B300DFD4C7000000000000000000FCFDFF00FEFEFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE000000
      0000FDFEFE00FAFAFA00FAFAFA00FAFAFA00FDFCFB0000000000FEFEFE000000
      0000FEFEFE0000000000FCFDFE00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FEFD
      FC0000000000FEFEFE00FFFFFE00000000000000000000000000000000000000
      00000000000000000000FDFDFD00FDFDFD000000000000000000000000000000
      0000F2F2F2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFDFE00FCFCFB00FFFFFD0000000000000000000000
      00000000000000000000FCFCFC00FCFBFB00FFFEFE0000000000FFFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC00FBFBFB000000
      000000000000FEFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000FDFEFE00F8F9
      F900F8F8F800F9F9F900F8F8F800FCFBFA0000000000FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CC680300CC680300CC680300CC680300CC680300CC68
      0300CC680300CC680300CC680300CC680300CC680300CC680300CC680300CC68
      0300CC680300CC680300CC680300CC6803000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FDFDFD00FCFCFC00FCFCFC00FDFDFD00FEFEFE00000000000000
      000000000000000000000000000000000000000000000000000000000000FFF9
      F500FFF9F5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009933000099330000993300009933
      0000993300009933000099330000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CC670100FEF8F100FFFBF400FEF1E200FDEEDA00FEEB
      D100FDE6C900FDE2C100FDDFBA00FDDCB400FDD9AE00FDD7AC00FDD7AB00FDD7
      AB00FDD7AB00FDD7AB00FDD7AB00CC6803000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC00F4F4F400F2F2
      F200EFEFEF00ECECEC00ECECEC00ECECEC00EDEDED00EEEEEE00F0F0F000F9F9
      F900FCFCFC00000000000000000000000000F9F3EE0000000000F7F0EC00CAC5
      C300A4A19F00DBD5D300F9F3EE0000000000F9F3EE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000993300007B3E2900984D1B00AA551200B158
      0E00B1580E00AB5711009A4E19007E4027009933000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CC670100FFF9F100FEF6EA00FFF1E200FEEEDA00FFEB
      D100FEE6C900FEE2C100FEDFBA00FEDCB400FED9AE00FED7AC00FED7AB00FED7
      AB00FED7AB00FED7AB00FED7AB00CC6803000000000000000000000000000000
      00000000000000000000FBFBFB00F1F1F100ECECEC00E8E8E80023ABCA0025AB
      C8005DB8CD00D0D1D200D1D1D100D1D1D100D3D3D300D6D6D600D9D9D900E1E1
      E100E6E6E600EAEAEA00F4F4F400FBFBFB000000000000000000DBD5D300A5A3
      A200898787009C9A9800E5E0DC00F9F3EE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000993300009933000086432300B65C0C00D1690000D46B0000D36A0000D16A
      0000D1690000D36A0000D46B0000D1690000BB5F0B008D462000993300009933
      000000000000000000000000000000000000CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100CB660100CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100CB660100CB660100CB660100FED7AB00FED7
      AB00FED7AB00FED7AB00FED7AB00CC6803000000000000000000000000000000
      000000000000FCFCFC00F7F7F700ECECEC00E7E7E700C0D8DD005CCBDF0051BF
      D70049C5DC0008A2C30052AFC400A6BEC300C8C8C800CCCCCC00D0D0D000DADA
      DA00DFDFDF00E4E4E400EFEFEF00F4F4F400F9F3EE0000000000DBD5D300D3CE
      CC00A5A3A2008C8A8A00B0ACAB00F2EAE5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      00007B3E2900A8561300D56C0000D36A0000CB660100CA650100C9640000CB66
      0100CB660100CB660100CB660100CB660000D16A0000D86C0000AC5711009933
      000099330000000000000000000000000000CB660100FFFFFF00FFFBF400FFF7
      EB00FFF3E300FFEFDA00FFEBD100FFE7C900FFE4C200FFE1BB00FFDEB600FFDC
      B300FFDCB300FFDCB300FFDCB300FFDCB300FFE5C000CB660100FED8AC00FED7
      AB00FED7AB00FED7AB00FED7AB00CC6803000000000000000000000000000000
      000000000000FBFBFB00F5F5F500EAEAEA00E4E5E50026ABCA0075CFE10044CC
      E00061D1E40078D8E70057C9DD0004A0C500A2BCC200C7C7C700CCCCCC00D7D7
      D700DDDDDD00E2E2E200EDEDED00F3F3F3000000000000000000EFE9E500D3CE
      CC00CAC5C3009C9A98008C8A8A00C5C1BF00F7F0EC0000000000F9F3EE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000993300008342
      2400AE571000D66C0000CD680000CA660100CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100CB660100CB660100CB670000D96D0000AE57
      100099330000993300000000000000000000CB660100FFFFFF00FEF9F100FFF4
      EA00FEF1E200FFEEDA00FEEAD200FEE6C900FEE2C200FEDEBA00FEDBB400FED9
      AF00FED7AB00FED7AB00FED7AB00FED7AB00FFE0B800CB660100FED9AF00FED7
      AC00FED7AB00FED7AB00FED7AB00CC6803000000000000000000000000000000
      00000000000000000000FAFAFA00EFF0F0001AAACA0057D1E30007BED70028BC
      D60007B1D10048CFE30002A4C60047D1E30013A9CB002BB7D20012A7C700DFDF
      DF00E4E4E400E9E9E900F3F3F300F8F8F80000000000F9F3EE00FFF9F500E4DE
      DA00CAC5C300BCBABA008C8A8A00908E8E00DBD5D300F9F3EE0000000000F9F3
      EE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099330000AF59
      0E00D46B0000CC660000CB660100CB660100CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100CB660100CB660100CB660100CA650100D96C
      0000AC571100993300000000000000000000CB660100FFFFFF00FFFCF700FFF8
      F100FFF5EB00FEF1E300FFEEDB00FEEAD200FEE6CA00FEE2C200FEDEBB00FEDB
      B400FED9AE00FED7AB00FED7AB00FED7AB00FFE0B800CB660100FEDBB300FED8
      AE00FED7AC00FED7AB00FED7AB00CC6803000000000000000000000000000000
      0000000000000000000000000000B3DFE90021B2CE0064D5E60019C8E10009AA
      CC001ACDE70013ADCD001CC0DA0042C8DD001CC4DB0089E2EE006CD5E50066C0
      D300ECECEC00F0F0F000F9F9F900FEFEFE000000000000000000F9F3EE00FFF9
      F500DBD5D300CAC5C300B4B0AF0084838300A5A3A200EDE6E200F9F3EE00F7F0
      EC00F9F3EE00F9F3EE00F9F3EE00F9F3EE000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000A2511500D169
      0000CC670000CB660100CB660100CB670200CB660100D27B2500D5843300D584
      3400D5843400D5843400D0741900CB660100CB660100CB660100CB660100CB66
      0100D66B00008D4620009933000000000000CB660100FFFFFF00FFFEFD00FFFC
      F700FFF9F200FFF5EB00FEF2E300FEEEDB00FFEAD300FEE6CB00FEE2C200FEDE
      BB00FEDCB500FED9AF00FED7AC00FED7AB00FFE0B800CB660100FEDDB800FEDA
      B100FED7AD00FED8AB00FED7AB00CC6803000000000000000000000000000000
      000000000000000000000000000054C1D80040C7DC0038C8DD0013C1DC0012BD
      DB0035DBF00007ABCD0042D1E5000CA7CA0033CDE00050D4E4003CC0D90030B4
      D1006FC8DB00F9FAFA000000000000000000000000000000000000000000F9F3
      EE00FFF9F500DBD5D300CAC5C300A5A3A20084838300C4BEBC0000000000FFFD
      F800FFF9F500FFF9F500FFF9F500FFF9F5000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000BE600800D26A
      0200CD6A0700CE6B0800CE6E0B00CC670200CE6B0700EFD2B500FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00F9F0E600DFA36600CB660100CB660100CA66
      0100D2690000BA5E09009933000000000000CB660100FFFFFF00FFFFFF00FFFE
      FD00FFFCF800FFF9F300FFF6EB00FEF3E300FFEEDB00FFEAD300FFE6CB00FFE2
      C400FEDFBC00FEDCB500FED9AF00FED8AC00FFE0B800CB660100FFE0BD00FEDC
      B600FFD9B000FED8AC00FED7AB00CC6803000000000000000000000000000000
      00000000000000000000000000001AADCB006FDDEB0015C7E2001BC3E00036E3
      FA0021C7E20031C9E20008B4D20013C4DC0007ACCC0031C1D80097E4EF001FAD
      CC00ACE0EC000000000000000000000000000000000000000000000000000000
      0000F9F3EE00FFF9F500D3CECC00CABEBC008C8A8A008A888600C5C1BF00B9B5
      B300A19D9C00969392009C9A9800C4BEBC00EDE6E200F9F3EE00000000000000
      000000000000000000000000000000000000D6820000A7541400CF6E0900D272
      1000D2761500D3771900D4791B00D2721000D4761800EBC29800F5E1CE00F4E1
      CD00F4E0CC00F4E0CB00F8ECE000FEFEFE00FEFEFE00EBC59F00CB660100CB66
      0100CB660100D36A00007F3F270099330000CB660100FFFFFF00FFFFFF00FFFF
      FF00FFFEFE00FFFCF800FEF9F300FEF7ED00FFF2E400FEEFDC00FEEBD300FFE7
      CC00FFE2C300FEDEBC00FFDDB500FED9B000FFE0B900CB660100FFE2C200FEDE
      BB00FFDCB400FED9AF00FED7AB00CC6803000000000000000000000000000000
      00000000000000000000000000002DB9D30061DCED0023D4ED002FD4EE003CDF
      F70014B7D70016BBD80013C9DF0030C8DD003BC8DD009AE4EE0048BED600F6FC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D9CFCE00B9B5B3006F6F6F007B7878009693
      9200AAA5A200AAA5A20094918E007776750084838300D3CECC00F7F0EC000000
      0000F9F3EE00000000000000000000000000D6820000B75F1300D87A1700D57C
      2000D77F2400D8812800D9832A00D77C2000D9802700D77E2300D67A1D00D376
      1600CF6E0D00CC690400CB660100D78A3D00FAF3EC00FEFEFE00D9914800CB66
      0100CB660100D46B00009A4F1A0099330000CB660100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFE00FFFCF900FFFAF400FFF6EC00FFF2E400FEEEDC00FFEB
      D400FEE6CC00FFE3C400FEE0BD00FFDCB600FFE2BE00CB660100FEE4C800FEE1
      C000FEDFB900FEDBB300FED8AD00CC6803000000000000000000000000000000
      00000000000000000000000000003BC4DC005AE0F10031E0F80048E2F80030CB
      E7002DD1EC001ACBE40028C8DF0003B3D00091E0EC002EB2D000A3DDEA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F9F3EE0000000000F9F3EE00AAA8A800B0ACAB00DCD3CC00F7F0
      EC0000000000FFF9F500F9F3EE00E2D9D4009A9795007B787800D3CECC00F9F3
      EE0000000000F9F3EE000000000000000000D6820000C26B1800DE852900DC86
      3000DC873200DD8A3600DE8C3900DD872E00DE893500DC863000DA832A00D77D
      2200D3771900D1700E00CC690500CB660100DFA36600FEFEFE00EBC59F00CB66
      0100CB660100D36A0000AA55120099330000CB660100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFE00FFFDFA00FFF9F400FEF6ED00FEF2E500FEEF
      DE00FFECD500FFE7CC00FEE3C500FFDFBD00FFE5C400CB660100FEE8CE00FFE4
      C600FEE0BF00FFDDB800FEDAB100CC6803000000000000000000000000000000
      00000000000000000000DADAE9004DCFE50065EAFC004EE6FC0053DBF0004EE3
      F70033DBF40014C6DE0050D3E40074D5E600D7F0F60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFF9F500CFCAC800AAA5A200EADDD200F8EEE300F8EE
      E300F9F3EE00F7F0EC00F9F3EE00FAEFE900F5E3DF009C9897008A888600E4DE
      DA000000000000000000F9F3EE0000000000D6820000CA762300E3964600E199
      4D00E1914200E2934400E3954700E3954600E2924200E08F3C00FEFEFE00DB85
      2D00D77D2300D4771900CF6F0D00CB680300D6883A00FEFEFE00F0D3B700CB66
      0100CA650100D2690000B1580E0099330000CB660100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFCFA00FFFAF400FFF6ED00FFF3
      E600FFEFDE00FEEBD500FEE7CE00FEE4C500FFE8CB00CB660100FEEBD300FFE6
      CA00FEE2C300FFDEBC00FEDBB400CC6803000000000000000000000000000000
      000000000000B5B5D3000A0B74000D5AA0008EE8F80089EFFE0064E5F90050E6
      FC0035E3F90063DBEA005CCDDE0025AFCD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F2EAE500AAA5A200D9CEC400F9E9DB00F5E9DC00F8EE
      E300F2EAE500F8EEE300F8EEE300F2EAE500F7E6E200E6D4D10081807F00B9B5
      B300F9F3EE00000000000000000000000000D6820000CF7D2F00E9A96600EAAE
      7200E79F5500E79E5300E9A05600E8A05500E79D5100FEFEFE00FEFEFE00DF8E
      3B00DB852E00D67D2400D3751600CE6B0800E2AA7200FEFEFE00EAC19900CB66
      0100CA650100D2690000B1580E0099330000CB660100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFDFA00FFF9F400FFF6
      EE00FFF3E700FEF0DE00FEEBD600FEE8CE00FFECD400CB660100FFEDD900FEE8
      D000FEE5C900FEE1C100FEDDB800CC6803000000000000000000000000000000
      0000000000001F1F80000000AA0002088900020E75004E92C1007AEEFD0048E7
      FD004DE4F70044C1D90037B7D200EFF9FB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F3EE00FFF9F500D3CECC00ABA29B00F4DECA00F6E4D200F9E9DB00F9E9
      DB00F9E9DB00F9E9DB00F9E9DB00F9E9DB00F5E9DC00F9E2DA00AAA5A2009693
      9200F2EAE500000000000000000000000000D6820000CF7E2F00EDB37900F0C3
      9500ECAE6D00ECA76000EDAA6400EDA96300FEFEFE00FEFEFE00FEFEFE00E499
      4E00DE8B3600DA832A00D67A1D00E09F5D00FCF7F200FDFCFB00D6863700CB66
      0100CB660100D36A0000AA55120099330000CB660100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00FFFDFA00FFFA
      F400FFF7EE00FFF3E600FEF0DF00FEECD700FFF1DD00CB660100FFF0DF00FEEC
      D700FEE8CE00FEE5C600FFE0BF00CC6701000000000000000000000000000000
      000005A2C50022A3C600174193001011AE003333E3004B4BF40003087200053F
      90002EB1CF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F3EE00FFF9F500BCBABA00B7AA9E00F4DECA00F6E4D200F9E9DB00FBE8
      D600FBE8D600FBE8D600FBE8D600F9E9DB00F5E9DC00F9E2DA00CABEBC00908E
      8E00EAE3DF00000000000000000000000000D6820000CB762500EFB67D00F5D3
      B000F3C29000F1B16F00F8D8B800FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00E5B38100CB660100CB66
      0100CB660100D46B0000984D1C0099330000CB660100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFD00FFFBF400FFFFFC00CB660100FFF2E500FEEF
      DC00FEEAD500FEE8CD00FFE2C400CC6701000000000000000000000000000000
      000002A1C4002CBFD7005DDCED0011248400101688004545DF002B2BD2000E0E
      7B00BCBCD8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F3EE00FFF9F500B4B0AF00B5A59600F9DDC300FBE6D300FBE8D600FBE6
      D300FBE6D300FBE6D300FBE8D600F9E9DB00F9E9DB00F9E2DA00D1BCB600908E
      8E00EAE3DF00000000000000000000000000D6820000D6820000ECAE7000F7D8
      B900FADBBB00F6C18D00FADEC000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFDFB00F5E1CD00DD9A5600CB670100CB660100CB66
      0100CC660000D16900007C3F280099330000CB660100F3BE7A00F2BD7A00F2BD
      7A00F2BD7A00F2BD7A00F2BD7A00F2BD7A00F2BD7A00F2BD7A00F2BD7A00F2BC
      7900F2BC7700F2BB7400F2B97100F2B76E00F3BB7200CB660100FFF5EB00FEF2
      E200FEEDDB00FEEAD300FFE5CA00CC6701000000000000000000000000000000
      0000DBF2F600179FC20010A5C8008EEFFC005193C4000D1379001A1AB2000D0D
      7400EEEEF5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F3EE00FFF9F500C5C1BF00A4968A00F4D6BA00FADCBE00F9DDC300F9DD
      C300F9DDC300FBE0C700FCE4CC00FCE4CC00F7E3CE00FADDCC00CEBBB4009C9A
      9800F2EAE50000000000000000000000000000000000D6820000DF954C00F8D1
      AA00FBEAD700FADBBB00FCCC9800FBC38800FEFEFE00FEFEFE00FEFEFE00E9A6
      5F00E3954600DE8C3800D9822A00D4781B00CE6D0A00CB670200CB660100CA66
      0100D36A0000B85D0A009933000000000000CD660000D1630000D0630000D063
      0000D0630000D0630000D0630000D0630000D0630000D0630000D0630000D063
      0000D0630000D0630000D0630000D0640000D1640000CD670000FFF8F000FFF4
      E800FEF1E100FEEDD900FEE9D000CC6701000000000000000000000000000000
      0000106396004292C2002E89C100188FBD00059FC30047C5DC00E0F3F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DCD8D600928B8300E3C2A200FCE4CC00F9DDC300FADC
      BE00FADCBE00FADCBE00F9DDC300F9DDC300F7E3CE00FADDCC00BAAEA800AAA8
      A8000000000000000000000000000000000000000000D6820000D6820000F3C0
      8B00FCE5CD00FDEFE000FEDFBE00FCCA9300F7C18800FEFEFE00FEFEFE00E9A2
      5A00E2954600DE8C3800D9822A00D4781B00CE6D0B00CB670200CB660100CC66
      0000D66B000087442300993300000000000000000000CB660100CB660100CB66
      0100CB660100CB660100CB660100CB660100CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100CB660100CB660100FFFDFB00FFFAF400FFF7
      EE00FFF4E700FEF0DE00FFEBD500CC680300000000000000000000000000FDFE
      FE003E8CBB005DA7D500107CBF002378AE005192B70070CBDE00FCFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F3EE0000000000F6EEEA00ACA8A600B1967B00FCE4CC00FBE6D300FCE4
      CC00FCE4CC00FCE4CC00FCE4CC00FBE6D300FBE6D300EDD2BB009C989700D3CE
      CC00FFF9F500F9F3EE00F9F3EE00000000000000000000000000D6820000DA8D
      4200FAD2A800FDEDDD00FEF2E600FBDDBE00F8CA9D00F0B06E00FEFEFE00E79E
      5300E2934300DD8A3600D8812800D3771900CE6C0900CB660200CC670000D86C
      0000A45214009933000000000000000000000000000000000000000000000000
      00000000000000000000CC670100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFD00FFFBF700FFF9
      F100FFF6EB00FFF2E300FFEDDA00CC68030000000000000000000000000085B0
      CA008DC1E1002186C5001982C30011649800CEDFE90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DBD5D3009D918700C6AA9100FCE4CC00FFE8
      CE00FCE4CC00FCE4CC00FCE4CC00FBE6D300EDD2BB00B3A8A000B4B1B000F9F3
      EE0000000000F9F3EE0000000000000000000000000000000000D6820000D682
      0000DD944C00F9D3AC00FCEBD900FEF2E600FAE5CF00F6D4B000F0B98300E8A4
      5D00E2994C00DE8F3E00DA893600D7842F00D27C2400D1721100D86C0000A652
      14006A3531009933000000000000000000000000000000000000000000000000
      00000000000000000000CC670100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFBF400FFFFFC00CC68030000000000000000004787B0005FA0
      C70019689A0012689E0097C6E300B1CCDC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F0EC00CCC9C7009D918700B7A08C00DBC2
      A900EDD2BB00F4D6BA00EACEB300D2B8A100ABA29B00B4B1B000F2EAE5000000
      0000F9F3EE00000000000000000000000000000000000000000000000000D682
      0000D6820000DA8F4600F5C69600FBDFC200FBEBDB00FBEBDB00F8E2CC00F2D4
      B500EFC89F00EBBD8E00E8B58200E3A66800DE8F3E00D6761600A75313006F39
      2D00993300000000000000000000000000000000000000000000000000000000
      00000000000000000000CC670100D8730200D7720200D7720200D7720200D772
      0200D7720200D7720200D7720200D7720200D7720200D7720200D7720200D772
      0200D7720200D7720200D8730200CC68030000000000000000000E6296007AB0
      D100ECEEEE0019689A006BA7CD00FDFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F0EC00D3CECC00AAA5A2009D91
      8700A2918200A2918200A4968A00AAA5A200CAC5C300F6EEEA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6820000D6820000D6820000E09E5D00F0C08E00F5D1AA00F7D8B900F6D8
      BA00F4D2AF00EFC59900E9B17700DC944A00C06E2400974E2000993300009933
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CC680300CC680300CC680300CC680300CC680300CC68
      0300CC680300CC680300CC680300CC680300CC680300CC680300CC680300CC68
      0300CC680300CC680300CC680300CC68030000000000000000001E6D9E0093C1
      DE00126497002F79A7003580AD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F9F3EE00F9F3EE0000000000F6EEEA00E4DE
      DA00D3CECC00D3CECC00DCD8D600F2EAE500FFF9F50000000000F9F3EE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6820000D6820000D6820000C9803B00D28F5100D595
      5800D1905300C9824400B56C31009C5526008845250099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CC680300CC680300CC680300CC680300CC68
      0300CC680300CC680300CC680300CC680300CC680300CC680300CC680300CC68
      0300CC680300CC680300CC670100000000000000000000000000F8FAFC005B94
      B80017679A005F97BA00EAF1F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6EEEA00F6EEEA00F6EEEA00F6EE
      EA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00F9F3EE00FFF9
      F500FFFDF800FFFDF800FFF9F500F9F3EE00F6EEEA00F6EEEA00F6EEEA00F6EE
      EA00F6EEEA00F6EEEA00F6EEEA00F6EEEA000000000000000000000000000000
      000000000000000000000000000000000000D6820000D6820000D6820000D682
      0000D6820000D6820000D6820000D68200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D590080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000099CC000099CC000099CC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000081BD000081BD000081BD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009365
      5E00EFD3B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB9700EFC79100EEC5
      8900EBC18200EBC08000EBC08000EBC08000EBC08000EBC08000EBC08000EDC1
      8000EABF7F0080504B0000000000000000000000000000000000000000000000
      0000000000000099CC000099CC000099CC00009CCF000099CC0000A3D600AB72
      6600AB726600AB726600AB726600AB726600AB726600AB726600AB726600AB72
      6600AB726600AB726600AB726600AB7266000000000000000000000000000000
      0000000000000081BD000081BD000081BD000084C1000081BD00008CCA000081
      BD000081BD000081BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006C6A6A006C6A6A006C6A6A0000000000000000000000
      0000000000006C6A6A006C6A6A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009365
      5F00EED4B800F4DABB00F2D5B100F0D1AA00EFCFA300EECB9D00EDC79600EDC5
      8F00EBC18800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF
      7F00E7BC7E0080504B00000000000000000000000000000000000099CC000099
      CC000099CC0000A3D60000B6E90000C2F50000BFF2000099CC0000CCFF00A77B
      7500FFE2C500FEDFBF00FEDDBA00FEDAB500FED7B100FED5AC00FED3A700FED1
      A300FECFA000FECE9D00FECC9A00986B660000000000000000000081BD000081
      BD000081BD000090CE0000A3E20000B6F70000ADEE000081BD0000BDFF0000B6
      F70000A3E2000090CE000081BD000081BD000081BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006C6A6A00B0ADAD00969293008E8A8B006C6A6A006C6A6A00817E
      7F006C6A6A00DDDCDC00D0CFCF006C6A6A006C6A6A006C6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000009365
      5F00EED7C000F6E0C100F2D9B800F2D4B100F0D1AA00EFCFA400EECB9D00EDC7
      9600EDC58F00EBC1890090605B0090605B0090605B0090605B0090605B009060
      5B00E7BC7E0080504B0000000000000000000099CC000099CC0019B1DC0024C5
      EC0022D4FC0013D2FF0005CEFF0000CCFF0000BFF2000099CC0000CCFF00AA7E
      7600FFE7CE00FFE3C800FEE0C400FEDEBE00FEDBB900FED9B300FED6AE00FED4
      AA00FED2A600FED0A200FECE9E00986B66000081BD000287C1000FA3D50013B5
      E60012C7FB0009C6FF0001C0FF0000BDFF0000ADEE000081BD0000BDFF0000BD
      FF0000BDFF0000BDFF0000BAFB0000A6E6000093D1000081BD000081BD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006C6A6A00D5D4D400C6C4C400A19F9F00A19F9F00A19F9F00838182005C5B
      5B00BCBCBC00CECECE00CFCFCF00D1D1D100D3D3D300CAC9C9006C6A6A006C6A
      6A006C6A6A000000000000000000000000000000000000000000000000009365
      5F00EFDAC500F7E2C700F3DCBF00F2D8B700F2D4B000F0D1AA00EFCEA300EECB
      9C00EDC79500EDC58F00EBC18900E9BD8100E9BD7F00E9BD7F00E9BD7F00EABF
      7F00E7BC7E0080504B0000000000000000000099CC0057DCF20065EEFE0053E8
      FE0042E2FF002DD5F0001CD0F0000DD0FF0002C0F2000099CC0000CCFF00AC81
      7700FFEBD700B4858200B4858200B4858200B4858200B4858200B4858200B485
      8200B4858200B4858200FED1A400986B66000081BD003ED3EE004BE9FE003BE1
      FE002BD9FF001DD3FF0010CBFF0006C4FF0001AFEE000081BD0000BDFF0000BD
      FF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000ADEE000081BD000000
      0000000000000000000000000000000000000000000000000000000000006C6A
      6A00D8D7D700E0DEDE00C0BFBF00A19F9F00A19F9F00A19F9F00626060000000
      000000000000161616005D5D5D00A9A9A900CACACA00CACACA00CACACA00CACA
      CA00C1C0C0006C6A6A006C6A6A006C6A6A000000000000000000000000009365
      6000F0DECC00F8E6CF00F6E0C600F3DCBD00F2D8B700F2D5B100F0D1AA00EFCE
      A300EECB9C00EDC7960090605B0090605B0090605B0090605B0090605B009060
      5B00E7BC7E0080504B0000000000000000000099CC006CE3F20082F7FE0071F2
      FE005FECFE0011821C002DC4C2002BDAFF0015C6F2000099CC0011821C00B084
      7800FFF0E000FEEDDB00FFEAD600FFE8D000FFE5CA00FFE2C500FEDFBF00FEDC
      BA00FEDAB500FED7B000FED5AB00986B66000081BD0052DCEE006AF6FE0057EE
      FE0046E6FE0035DEFE0027D8FF0018D0FF000AB6EE000081BD0000BDFF0000BD
      FF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000ADEE000081BD000000
      00000000000000000000000000000000000000000000000000006C6A6A00D3D3
      D300D4D3D300CFCFCF008C8A8A00817F7F00817F7F00817F7F006C6A6A001414
      140008080800000000000000000000000000161616005D5D5D00A9A9A900CACA
      CA00CACACA00B7B6B600B7B6B6006C6A6A000000000000000000000000009566
      6000F2E2D300FAEAD700F6E3CE00F4DEC500F3DCBF00F2D8B800F0D4B100F0D1
      AA00EFCEA300EECB9D00EDC79700EDC59000EBC18900E9BD8100E9BD7F00EABF
      7F00E7BC7E0080504B0000000000000000000099CC0073E6F20098FFFE008DFB
      FE007CF6FE0011821C0027A5750048E4FF002BCEF2000099CC0011821C001182
      1C00FFF4E900B4858200B4858200B4858200B4858200B4858200B4858200B485
      8200B4858200B4858200FED8B300986B66000081BD0058DEEE0080FFFE0076FB
      FE0065F3FE0052EBFE0041E5FE0031DDFF0018C0EE000081BD0000BDFF0000BD
      FF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000ADEE000081BD000000
      000000000000000000000000000000000000000000006C6A6A00CACACA00CACA
      CA00C6C6C6008E8C8C00B8B5B500B6B4B400A19F9F00A19F9F009F9D9D009997
      97009390910082808000525050002B2A2A000808080000000000000000001616
      160064646400817E7F006C6A6A00000000000000000000000000000000009869
      6300F2E6DA0090605B0090605B00F6E2CB0090605B0090605B00F2D8B7009060
      5B0090605B00EFCEA30090605B0090605B00EDC58F0090605B0090605B00EABF
      7F00E7BC7E0080504B0000000000000000000099CC0073E6F20099FFFE0099FF
      FE0095FEFE0011821C0011821C005FE6EF0041D5F2000099CC0011821C001CA6
      2E0011821C00FEF6EC00FEF3E700FFF1E200FFEEDD00FFEBD700FFE9D200FFE6
      CC00FFE3C700FFE0C200FEDDBC00986B66000081BD0058DEEE0081FFFE0081FF
      FE007FFEFE0072F8FE005FF2FE004DEAFE002AC9EE000081BD0000BDFF0000BD
      FF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000ADEE000081BD000000
      000000000000000000000000000000000000000000006C6A6A00CACACA00C5C5
      C5008E8C8C00D7D4D400F7F6F600F6F4F400F2F0F000E0DEDE00CAC7C700B6B5
      B500A5A3A300A19F9F00A19F9F009E9A9C009390910068656600232223000303
      030019191900999797006C6A6A00000000000000000000000000000000009E6E
      6400F4EAE100FBF2E600F8EADC00F7E6D300F6E2CC00F4E0C600F3DCBF00F2D8
      B700F2D5B000F0D1AA00EFCEA400EDCB9C00EDC79600EBC58F00EBC18800EABF
      8200E7BB7E0080504B0000000000000000000099CC0073E6F20099FFFE0099FF
      FE0099FFFE0011821C003EBD600011821C002BA88A00018F9C00038D60001CA6
      2E001CA62E0011821C00B4858200B4858200B4858200B4858200B4858200B485
      8200B4858200B4858200FFE2C500986B66000081BD0058DEEE0081FFFE0081FF
      FE0081FFFE0081FFFE007BFCFE0047D7EE001DAFD9000081BD0000A3E2009657
      4B0096574B0096574B0096574B0096574B0096574B0096574B0096574B009657
      4B0096574B0096574B0096574B0096574B00000000006C6A6A00C5C5C5008E8C
      8C00E7E6E600F7F6F600F7F6F600F6F4F400F2F0F000EEEDED00EAEAEA00E7E6
      E600E3E2E200D4D3D300C2C1C100AFADAD00A19F9F00A19F9F00999797008280
      80006C6A6A009F9D9D006C6A6A0000000000000000000000000000000000A372
      6600F6EEE900FCF6ED00F8EFE300F7EADA00F7E6D300F6E2CC00F4DEC500F3DC
      BD00F2D8B600F0D5B000F0D1AA00EFCEA300EECA9C00EDC79500EBC48E00EBC2
      8800E7BC800080504B0000000000000000000099CC0073E6F20099FFFE007CEC
      F50056D2E80030B6D00011821C0056DE84003FC3620031B54D0028AE400027B7
      3F001AAA2C001CA62E0011821C00FFF8F200FFF6ED00FFF4E900FFF2E400FEEF
      DF00FEECDA00FEE9D400FEE7CE00986B66000081BD0058DEEE0076F7FA0058DE
      EE0034BDDD00149FCE000081BD000081BD000081BD000081BD000081BD009160
      5A00FED8B500FED5AF00FFD1A900FECEA100FECB9C00FEC99600FEC59100FEC2
      8E00FEC18900FEC08400FEBD820080504B00000000006C6A6A008E8C8C00EFEE
      EE00F7F6F600F7F6F600F7F6F600F6F4F400D5D3D400867B7E00958B8E00C1BF
      BF00DDDCDC00E0E0E000DCDCDC00D8D8D800D1D1D100C2C1C100B2B0B000A19F
      9F009C9999006C6A6A006C6A6A0000000000000000000000000000000000A775
      6800F8F3F00090605B0090605B0090605B0090605B0090605B0090605B00F4E0
      C500F3DCBD00F2D8B700F2D4B100F0D1A900EFCEA300EDCB9C00EDC79500EDC5
      8F00E9BF870080504B0000000000000000000099CC001DACD5000A9FCF000099
      CC000099CC00009CCF0001A1B80011821C0048CE6F0046D16D003AC75B002EBD
      4A0022B3380011821C00B4858200B4858200B4858200B4858200B4858200B485
      8200B4858200B4858200FEEBD800986B66000081BD000890C5000081BD000081
      BD000081BD000088C5000097D50000A6E60000A6E6000081BD0000BAFB009160
      5A00FFDEC000FFDCBA00FED7B400FFD4AC00FED1A500FECE9F00FECA9A00FEC7
      9500FEC49000FEC28A00FEC1870080504B00000000006C6A6A00CECBCC00F7F6
      F600F7F6F600F7F6F600F7F6F600CFCBCC00AFACAD00ADABAB009E9898008379
      7B0075696B0089808100ABA5A600C7C6C600D5D5D500D1D1D100CECECE00C9C7
      C700BBBABA00A6A4A4006C6A6A0000000000000000000000000000000000AC79
      6900FAF6F400FFFFFE00FEF8F300FBF2EA00F8EEE300F8EBDA00F7E6D300F7E2
      CC00F6E0C500F3DCBF00F2D8B700F2D4B000F0D1AA00EFCEA300EECB9C00EEC9
      9600EAC18E0080504B0000000000000000000099CC000099CC0011ACD90018BA
      E60014C9F50007CEFF0000CCFF0000C6F000039B8100168F3D0011821C0035C3
      540011821C00D0E4D000FFFFFF00FFFEFE00FFFDFB00FFFBF700FFF9F300FFF7
      EF00EEE6DB00DFD5C900D4C8BC00986B66000081BD00048CC5000CA1D5000FB2
      E6000BC0F70003C1FF0000BDFF0000BDFF0000ADEE000081BD0000BDFF009160
      5A00FFE5CB00A06B6800A06B6800A06B6800A06B6800A06B6800A06B6800A06B
      6800A06B6800A06B6800FEC48E0080504B0000000000000000006C6A6A006C6A
      6A00CECBCC00EDEBEB00AFA4A5006B5D5F00766A6C0083787A009C969700ACAA
      AA00B2B0B000ABA7A9009891920081777800847A7D00938C8E00BFBFBF00CBCB
      CB00CACACA00C0C0C0006C6A6A0000000000000000000000000000000000B17E
      6B00FAF6F40090605B0090605B0090605B0090605B0090605B0090605B009060
      5B0090605B0090605B0090605B00F2D8B600F2D4B000F0D1A900EFCEA100EECB
      9C00EBC5920080504B0000000000000000000099CC004DD9F20057E9FE0046E3
      FF0034DDFF0023D8FF0011D2FF0004CDFF0000BFF2000099CC0011821C001182
      1C00CAD8C200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FFFCFA00FFFB
      F600D5CFCA00CBC4BD00D4CCC300986B66000081BD0036CFEE0041E3FE0031DD
      FF0022D5FF0015CEFF0009C6FF0002C0FF00046B0B000081BD0000BDFF009160
      5A00FFEBD700FEE7D000FEE3C900FEE0C200FFDCBB00FED8B500FED5AD00FED3
      A700FFCFA100FECB9C00FEC9960080504B000000000000000000000000000000
      00006C6A6A006C6A6A00BD828100AF8A73007D5E510066545600655457006D5E
      62006D5E620089808100A09A9C00AFACAD00B2B0B000A49FA000CAC9CA00CBCB
      CB00B7B6B6006C6A6A000000000000000000000000000000000000000000B681
      6C00FAF6F400FFFFFF00FFFFFF00FFFCFB00FEF7F200FBF3EB00F8EEE300F8EB
      DC00F7E6D300F6E3CC00F6DEC500F3DCBD00F3D8B600F2D4AF00F0D1A900F0CF
      A300EDC9990080504B0000000000000000000099CC0063E0F20075F3FE0063ED
      FE0052E7FE0040E1FF002FDCFF001DD6FF000BC3F2000099CC0011821C006CA7
      9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFD
      FC00AB726600AB726600AB726600AB7266000081BD004BD8EE005EF0FE004DEA
      FE003CE2FE002CDAFF001ED3FF00046B0B00046B0B000081BD0000BDFF009160
      5A00FFF0E200A06B6800A06B6800A06B6800A06B6800A06B6800A06B6800A06B
      6800A06B6800A06B6800FFCCA00080504B000000000000000000000000000000
      00000000000000000000BD828100FFD4AB00FFD0A100FFCB9800D5A57B00A178
      5C007B665F0060505300665659006F6265008E868700CECCCC00CFCFCF00A5A4
      A4006C6A6A00000000000000000000000000000000000000000000000000BB84
      6E00FAF6F40090605B0090605B0090605B0090605B0090605B0090605B009060
      5B0090605B0090605B0090605B00F6DEC400F3DABC00F2D8B600F0D4AF00EFD0
      A700CEB4910080504B0000000000000000000099CC0072E5F20092FDFE0082F7
      FE006FF1FE005EEBFE004CE5FF003BE0FF0021CAF2000099CC0000CCFF00DAAD
      8B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AB726600FFF1E300F6A73700000000000081BD0058DDEE007BFCFE006BF6
      FE0059EFFE0047E7FE00046B0B001DA93500035D07000081BD0000BDFF009666
      5C00FFF4EB00FFF2E600FFEFE000FFEBD900FFE9D300FFE6CC00FEE2C500FEDE
      BD00FEDAB700FED7B000FED3AA0080504B000000000000000000000000000000
      00000000000000000000BD828100FFD9B200FFD4A900FFCFA000FFCA9700FFC6
      8E00FFC18600FFBF8100FFC08400BD8281006C6A6A006C6A6A006C6A6A006C6A
      6A0000000000000000000000000000000000000000000000000000000000C089
      6F00FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2
      EA00FAEEE200F8EBDA00F7E6D300F6E2CB00F6DEC400F3DCBD00E5CEAF00C4B0
      9600A1927F0080504B0000000000000000000099CC0073E6F20099FFFE0097FE
      FE008DFBFE007CF6FE006AEFFE0058E9FE0037D2F2000099CC0000CCFF00DFB1
      8D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AB726600F6A7370000000000000000000081BD0058DEEE0081FFFE0080FF
      FE0077FBFE00046B0B002CBC4F0028BF4A0018A92D00036D400000958C009D6C
      5E00FFFAF600A06B6800A06B6800A06B6800A06B6800A06B6800A06B6800A06B
      6800A06B68009F6A6700FFD9B60080504B000000000000000000000000000000
      00000000000000000000BD828100FFDDBA00FFD8B100FFD3A700FFCE9E00FFCA
      9600FFC58C00FFC08400FFC08400BD8281000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C58C
      7000FBF7F400FFFFFF0090605B0090605B0090605B0090605B0090605B009060
      5B0090605B0090605B00F8EAD900F8E7D400FAE9D000E0D0BA00B8AB9A00A79C
      8B00A497860080504B0000000000000000000099CC0073E6F20099FFFE0099FF
      FE0099FFFE0095FEFE0087F9FE0076F3FE004DD9F2000099CC0000CCFF00E2B4
      8E00DCA88700DCA88700DCA88700DCA88700DCA88700DCA88700DCA88700DCA8
      8700AB7266000000000000000000000000000081BD0058DEEE0081FFFE0081FF
      FE00046B0B0030C056003BD469002DC451001CAD35000D9A1C00046B0B00046B
      0B00A5BF9D00FFFCF700FFFAF300FFF6ED00FFF3E900FFF0E200FEEBDA00FBE7
      D300FAE2CA00FCE1C500F8D9BD007F504B000000000000000000000000000000
      000000000000BD828100FFE5CB00FFE1C200FFDCB800FFD7AF00FFD3A600FFCE
      9D00FFC99500FFC48B00BD828100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CB91
      7300FBF7F40090605B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
      FB00FCF7F000FBF2E90090605B00E9D3C4009E675B0098665B0095655B009665
      5B0096655B009868590000000000000000000099CC0073E6F20099FFFE0099FF
      FE0099FFFE0073E6F2004DCCE50022B1D900089FCF000099CC00009CCF0037A3
      C1006EA4AD006EADB6006EBAC3006CB8C20069B5C10065A6B3007096A000BD8D
      7C00000000000000000000000000000000000081BD0058DEEE0081FFFE0081FF
      FE0062E6F200046B0B0030C0560032C9580020B43B00119E2100078F0F00058C
      0D00066F0C00C2DCC400A06B6800A06B6800A06B6800A06B6800A06B68009F6A
      67009C6865009A676400F0D9C1007A4D48000000000000000000000000000000
      000000000000BD828100FFEAD400FFE5CA00FFE0C000FFDAB700FFD7AD00FFD1
      A500FFCC9C00FFC79200BD828100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CF96
      7400FBF7F60090605B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCFA00FCF7F00090605B00DAC0B6009F675B00DAA16B00DD984F00E290
      3A00EA892300A5686B0000000000000000000099CC004DCCE5004DCCE50026B3
      D9000099CC000099CC0013A6D20039BFDF005AD7EB0054DBF2002BC4E8000DAD
      DC0001A0D2000099CC000099CC0000A6D90000B3E60000ACDF000099CC000000
      0000000000000000000000000000000000000081BD0023ADD500149FCE000388
      C1000081BD000388C100046B0B0029B84B00046B0B00239D6A0010864B000774
      1600058C0D00046B0B00FFFFFF00FFFEFC00FFFBFA00FFFAF400FFF7EF00FFF4
      EA00E9DED000D5C9BA00C7B8AA00734843000000000000000000000000000000
      000000000000BD828100FFEEDC00FFE9D100FFE3C900FFE0BF00FFDAB600FFD5
      AC00FFD0A300F7C29700BD828100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D498
      7500FCF8F60090605B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFCFB0090605B00DDC4BC009F675B00EAB47400EFA95200F6A0
      3600A5686B000000000000000000000000000099CC000099CC000099CC000A9F
      CF0043C6E20086F2F80099FFFE0099FFFE0092FDFE0071F2FE004BE5FF0027D9
      FF0005CEFF0000BFF20000A9DC000099CC000099CC000099CC000099CC000000
      0000000000000000000000000000000000000081BD000081BD000081BD000890
      C50023ADD50058DEEE0076F7FA00046B0B0007680D0055EEFE0032DDFF00C58F
      6D001B691700046B0B00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FFFCF800FFFA
      F300C9C1BB00BCB4AB00C7BDB200734843000000000000000000000000000000
      0000BD828100FFF7EE00FFF2E300FFEDDA00FFE7D000FFE3C700FFDEBD00FFD9
      B400FFD4AB00BD82810000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D498
      7500FCF8F600FFFFFF0090605B0090605B0090605B0090605B0090605B009060
      5B0090605B0090605B00FFFFFF00DDC7C2009F675B00EAB27300EFA75100A568
      6B0000000000000000000000000000000000000000000099CC000099CC000099
      CC000099CC000099CC001DACD50030B9DC0049CBE50040CBE80022BBE2000AA9
      D9000099CC000099CC000099CC000099CC000099CC0000000000000000000000
      00000000000000000000000000000000000000000000000000000081BD000081
      BD000081BD000081BD000081BD000890C500046B0B0018A9D5000692C900CE97
      7000C9CAB100046B0B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFC
      FB0096574B0096574B0096574B0096574B00000000000000000000000000BD82
      8100FFFAF300FFFAF300FFF6ED00FFF0E200FFEBD900FFE7CF00FFE2C500FFDD
      BC00F2C7A900BD82810000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D498
      7500FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E2D0CE009F675B00EDB57200A5686B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000099CC000099CC000099CC000099CC000099CC000099
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000081BD000081BD000081BD000081BD00D59D
      7400FFFFFF00046B0B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF0096574B00FFEDDA00F391210000000000000000000000000000000000BD82
      8100BD828100BD828100BD828100FFF4EB00FFF0E100FFEBD700FFE6CE00FBDC
      C000BD8281000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E68009F675B00A5686B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DCA3
      7600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0096574B00F391210000000000000000000000000000000000000000000000
      0000000000000000000000000000BD828100BD828100BD828100BD828100BD82
      8100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DCA3
      7600D1926D00D1926D00D1926D00D1926D00D1926D00D1926D00D1926D00D192
      6D0096574B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001F1F21001F1F2100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B008C4B4B00914B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000096919000736E
      6E00AF7D7E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001F1F21001F1F2100182A33000F2C3A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000824B4B00824B4B00894B4B009C4B4C00B64B4C00BD4B4C009F4B
      4C004E1E1F000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000979291006C6C7000174B
      820032608900AF7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000113B4E0004689A00064F750007395300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B009A4D4E00AF4E4F00C14E4F00C04D4E00BF4C4D00BF4C4D009F4B
      4C004E1E1F00994B4B00824B4B00824B4B00824B4B00824B4B00824B4B00824B
      4B00824B4B00824B4B00000000000000000000000000838686003A79B1001A81
      FF000D62BC003B5F7F00B07D7D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000BC4B0000BC4B0000BC4B
      0000BB4B0000B649000017343C00036A9D00056798001B506E002A3440003F2F
      30005B270300702D00008C380000A7430000B5480000BB4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000000000000000000000000000000000000000
      000000000000000000000000000000000000004B000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00C5545500C9545500C7535400C6525300C5515200C4505100C24F5000A04C
      4D004E1E1F00FE8B8C00FC929300FB9A9C00FAA3A400F8AAAB00F7B1B100F7B5
      B600F7B5B600824B4B000000000000000000000000002698FF003DB0FF00349D
      FF001C7EF8000C62BA00395E7F00B07B7D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEF3E700FEF0E200FEEE
      DD00FEEAD700FAE3CE0075868600045983003150650095606000AA6E6E00965D
      5D00643B3B00755E4B00967B5F00BD9A7500E0B58700F3C29000FBC99500FECB
      9600FECB9600FECB9600BC4B0000000000000000000000000000000000000000
      0000000000000000000000000000004B0000118C1F00004B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00CE585900CC575800CB565700CA555600C9545500C7535400C6525300A34E
      4F004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B00000000000000000000000000000000002996FF0042AD
      FE00349AFF001C7EF8000C60B800405F7F00B17D7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEF7EE00FEF4EA00FEF2
      E500FEEFDE00FCEBD800F4E0CB000A4059008C5B5B00CC8E8E00BB7E7E00AA6E
      6E00965D5D00643B3B00755E4B00967B5F00BD9A7500E0B58700F3C49100FBC9
      9500FECB9600FECB9600BC4B0000000000000000000000000000000000000000
      00000000000000000000004B0000138F230007931000169C2800004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00D15B5C00D05A5B00CF595A00CE585900CC575800CB565700CA555600A550
      50004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000002A96
      FE0041AFFE00349AFF001C7EF8000C5FB8003E5F7E00B07B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEFAF600FEF8F200FEF6
      ED00FEF3E700FEF0E100FAEAD7004D6C75009C696900DC9D9D00CB8C8C00BA7D
      7D00A96D6D00915959005B353500755E4C00967D6000BD9C7600E0B58900F4C5
      9200FBC99500FECB9600BC4B0000000000000000000000000000000000000000
      000000000000004B0000159127000FA01D000B99160008961100159A2700004B
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00D55E5F00D55E5F00D45D5E00D35C5D00D15B5C00D05A5B00CF595A00A651
      52004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      00002A97FE0041AFFE00349AFF001A7BF8000B5FB70044627F00A97A7E000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEFCFB00B85B2D006E2D
      13006E2D13006E2D13006D2D13006B2B1200794D4C00E2A4A400DC9D9D00CB8C
      8C00BA7D7D00A96D6D008C5757005A343200653C16007F4D1700A0621D00BF73
      2300CF7D2600FCCA9600BC4B0000000000000000000000000000000000000000
      0000004B00000F811C001AAF310014A727000FA11F000C9A1800089612001399
      2500004B00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00DA636400D9626300D8606200D75F6000D55E5F00D45D5E00D35C5D00A953
      54004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000002C98FE0041ADFE00349CFF00197BF6000C5EB6002B587F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEFEFE00AD350900E94B
      2F00F7634400F86B4D00F4685500DE452D00682C16007A4F4F00E2A3A300DC9D
      9D00CA8B8B00B87B7B00A76C6C008B5656005B35350076604F009A816600C2A0
      7B00E5BB8F00F6C79600BB4B000000000000000000000000000000000000004B
      00000E7D1A0028C0480021B83D001BB0330013902400004B0000169D29000997
      130013982300004B000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00DE666700DD656600DC646500DA636400D9626300D8606200D75F6000AB55
      55004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000000000002D99FE0041ADFE00339CFF00287FE7003D607B000000
      0000000000000000000099696400996964009969640099696400996964000000
      000000000000000000000000000000000000BC4B0000FEFEFE00BA390F00F769
      4600F8654500FCD9D400FBC6BC00E5593A006D2D1300DDCBC20073474700E1A3
      A300DA9C9C00C98B8B00B87B7B00A76C6C008B5656005D3836007D6A55009C83
      6800C2A17E00E3BB9000B6490000000000000000000000000000004B00000C77
      170035CF5E002FC9540028C149001B9F3100004B000000000000004B00000D9E
      1B000997140011972200004B0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00E2696A00E1686900E0676800DE666700E06D6E00E6909100DC646500AC56
      57004E1E1F0058A55B001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      00000000000000000000000000002D9AFE004BB5FF008CBDED00AC9F96006C56
      550093665F0099696400DDCCAB00FFFFD900FFFFD900FFFFD700E9D5B6009969
      640099696400000000000000000000000000BC4B0000FEFEFE00E1896E00F86C
      4900FBA99800FFFFFF00FBBDB000FA6E4B00C7917600FAF0E70091400C007347
      4700E1A1A100DA9A9A00C98B8B00B77A7A00A66B6B008B5555005C352F00683F
      1300824F1800C1A07F00A7430000000000000000000000000000004B00003FD9
      6F003BD7680036D0600020AA3B00004B0000000000000000000000000000004B
      0000097411000A99150011962000004B00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00E76D6E00E66C6D00E56B6C00E36A6B00EEA6A700FFFFFF00EB9C9C00AF58
      59004E1E1F00EECEAF00B7EBAA005ED377005ED3770045CA670045CA670045CA
      6700F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1ADA500B687
      7500CCAB8C00FFFFD300FFFFD300FFFFD000FFFFCF00FFFFD000FFFFD300FFFF
      E200D4BAA400996964000000000000000000BC4B0000FEFEFE00FEFEFE00558A
      D8001B77B0001B7AB4002379AA00B4B5C700F3EBE200FCF7F000BB4B0000B7A0
      9A0073474700E1A1A100D99A9A00C78A8A00B77A7A00A66B6B008B5555005B35
      35007A6A57009982680090390000000000000000000000000000004B00001C9C
      340041DC700023AD4100004B0000000000000000000000000000000000000000
      000000000000004B00000B99160010951F00004B000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00EB707200EA6F7000E96E6F00E76D6E00F2A9AA00FFFFFF00EB959600B15A
      5A004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300D9F6BD00D9F6
      BD00F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000996B6500D4AF
      8F00FFEFB000FBEDB800FFFFCF00FFFFCE00FFFFCF00FFFFD700FFFFDC00FFFF
      EA00FFFFFF00D3BBB8009969640000000000BC4B0000FEFEFE006EB8FC002890
      FA002890FA002890FA002890FA003296F800E6E7E700FEFBF800BB4B0000FAF3
      EB00B7A19C0091606000EBAAAA00D9999900C7898900B6797900804E4E004148
      5500354756007A6A5700722D000000000000000000000000000000000000004B
      00002EC15200004B000000000000000000000000000000000000000000000000
      00000000000000000000004B00000C9A180009961200004B0000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00EF747500EE737400ED727300EB707200EA6F7000EF909100E76D6E00B25B
      5C004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099696400FFEA
      A600F2C78F00FAEBB600FFFFD000FFFFCF00FFFFD300FFFFE500FFFFF200FFFF
      FA00FFFFFC00FFFFFE009969640000000000BC4B0000FEFEFE00187DB400309C
      FB00309CFB00309CFB00309CFB00157BB600BDDAEE00FEFCFC00BC4B0000FCFA
      F400D17F26009F5E280091606000EBAAAA00D9999900534E5700028AC40000AA
      EA0000A6E6000087C4005A240000000000000000000000000000000000000000
      0000004B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B00000464080009961300004B00000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F3777800F3777800F2767700F0757600EF747500EE737400ED727300B55D
      5D004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099696400E6C9A000F6CA
      8B00EEBA7F00FBE7B400FFFFD000FFFFCF00FFFFD700FFFFEB00FFFFFE00FFFF
      FC00FFFFF200FFFFE500D8C6A50099696400BC4B0000FEFEFE00055A970033A0
      FB0033A0FB0033A0FB0033A0FB001278B000BAD8E900FEFEFE00BC4B0000FEFC
      FB00FCFAF700FAF6EF00B7A39E0091606000C2898900097BAB0000BDFF0000BD
      FF0000A6E600001C9D0000008200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B000007740E00004B
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F87B7D00F77A7B00F6797A00F4787900F3777800F2767700F0757600B75F
      5F004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099696400FFEFAD00F0BC
      7D00EBB07500F7DDA700FEFCCB00FFFFD100FFFFD500FFFFE600FFFFF600FFFF
      F600FFFFE600FFFFD700FFFFDA0099696400BC4B0000FEFEFE004588AF00055A
      9700085F9F00085F9F00116EB50013639700FEFEFE00FEFEFE00BC4B0000FEFE
      FE00FEFCFB00FCFAF700FAF6F000B6A19F0073474700009FDE0000BDFF00008C
      D100001C9D00010D9D00010A9700000082000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B0000035E
      0600004B0000000000000000000000000000000000000000000000000000824B
      4B00FC7F8000FB7E7F00FA7D7E00F87B7D00F77A7B00F6797A00F4787900B860
      62004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099696400FFF0AF00EFBA
      7B00E9A56A00F2C98F00FCEFBC00FFFFD100FFFFD300FFFFD900FFFFE100FFFF
      E200FFFFD900FFFFD300FFFFDA0099696400BC4B0000FEFEFE00EAF2F700669F
      BF0006558900004B820028739F00C0D8E300FEFEFE00FEFEFE00BC4B0000FEFE
      FE00D5812700D5812700D5812700D17F260089512B000093D10000B1F200012B
      A7000725DC000420B800021DB100010A97000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004B0000004B00000000000000000000000000000000000000000000824B
      4B00FF818200FF818200FE808100FC7F8000FC7F8000FB7E7F00FA7D7E00BB63
      63004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099696400FFF2B200F3C4
      8400E99E6300EDB57A00F4D79F00FCF4C200FFFFD100FFFFD300FFFFD300FFFF
      D300FFFFD000FFFFCF00FFFFD80099696400BC4B0000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00BC4B0000FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FCFBFB00FAF7F400F3EFE9000084C1000C21
      BF002D4FF6000F2ECC00031EB10000058F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B000000000000000000000000000000000000824B
      4B00FF818200FF818200FF818200FF818200FF818200FE808100FE808100BD65
      65004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099696400E6C9A000FCDE
      9E00EFBA7E00EEB77900EFC28400F6DAA100FBF2BF00FFFFCF00FFFFD100FFFF
      D000FFFFD000FFFFD100D9C6A50099696400BC4B0000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00BC4B0000FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FCFBFB00FBFAF700F4F2EE001624
      BF005270FC001839E30001099700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F77E7F00FF818200FF818200FF818200FF818200FF818200FF818200BF66
      66004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099696400FFFE
      C200FBEBCA00F6D7AC00F0C18600EFBF8200F3CC9500FAE3AD00FCF0BC00FBF4
      C100FEF6C400FFFFD4009969640000000000BC4B0000D9640100D9640100D964
      0100D9640100D9640100D9640100D9640100D9640100D9640100D9640100D964
      0100D9640100D9640100D9640100D9640100D9640100D9640100D7630100D568
      06001322BD00050DA500A1410000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B00AF5E5F00D56F7000FF818200FF818200FF818200FF818200BF66
      66004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099696400D7BB
      9E00FFFFFF00FEF7EE00F6D8AC00EDB47400E9A76B00EDB47800F0C48A00F6D4
      9C00FFF4B600D3B799009969640000000000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BB4B
      0000B8490000B5480000B5480000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000824B4B00824B4B0091515200B6626300EE7A7B00FF818200BF66
      66004E1E1F00914B4B00824B4B00824B4B00824B4B00824B4B00824B4B00824B
      4B00824B4B00824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009969
      6400CEB6AF00FFFFFF00FFF4CB00F6CF9000F0BC7D00F2BF8100F7CE9000FFED
      A900D4B1930099696400000000000000000000000000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BB4B0000BB4B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B00985555009F58
      58004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009969640099696400E1C9A000FFF7B500FFF2AF00FFF2B100E9CCA4009969
      6400996964000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099696400996964009969640099696400996964000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009263
      5D00A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009365
      5E00EFD3B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB9700EFC79100EEC5
      8900EBC18200EBC08000EBC08000EBC08000EBC08000EBC08000EBC08000EDC1
      8000EABF7F009F6F6000000000000000000093655E00A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A46769000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B70000000000000000000000000092635D008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      590080504B000000000000000000000000000000000000000000000000009365
      5F00EED4B800F4DABB00F2D5B100F0D1AA00EFCFA300EECB9D00EDC79600EDC5
      8F00EBC18800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF
      7F00E7BC7E009F6F6000000000000000000093655F00EED4B800F4DABB00F2D5
      B100EDCEA700E6C79D00E1C09300DEBB8C00E1BB8800E5BC8400E7BC8100E7BC
      7E00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC7E009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000005B7000005B7000005B70000000000000000000000000093655E00EFD3
      B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB9700EFC79100EEC58900EBC1
      8200EBC08000EBC08000EBC08000EBC08000EBC08000EBC08000EDC18000EABF
      7F0080504B000000000000000000000000000000000000000000000000009365
      5F00EED7C000F6E0C100F2D9B800F2D4B100F0D1AA00EFCFA400EECB9D00EDC7
      9600EDC58F00EBC18900EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF
      7F00E7BC7E009F6F6000000000000000000093655F00EED7C000F4DEC000F0D8
      B700E9CCAB00D9BD9900C9AD8900C1A57F00C6A67E00D1AF7F00DAB47F00E1B7
      7D00E3BA7D00E7BC7E00E9BD7F00E9BD7F00EABF7F00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000005
      B7000005B7000005B7000000000000000000000000000000000093655F00EED4
      B800F4DABB00F2D5B100F0D1AA00EFCFA300EECB9D00EDC79600EDC58F00EBC1
      8800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000009365
      5F00EFDAC500F7E2C700F3DCBF00F2D8B700F2D4B000F0D1AA00EFCEA300EECB
      9C00EDC79500EDC58F00EBC18900E9BD8100E9BD7F00E9BD7F00E9BD7F00EABF
      7F00E7BC7E009F6F6000000000000000000093655F00EFDAC500F6E1C600F0D9
      BC00E6CEAF00222123003E3935008C7960009D876700AA8F6B00B89A6F00C7A4
      7400D1AB7500DEB57900E5BB7D00E7BC7E00EABF7F00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000005B70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000005B700000000000000000000000000000000000000000093655F00EED7
      C000F6E0C100F2D9B800F2D4B100F0D1AA00EFCFA400EECB9D00EDC79600EDC5
      8F00EBC18900EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000009365
      6000F0DECC00F8E6CF00F6E0C600F3DCBD00F2D8B700F2D5B100EACCA600DDBF
      9700D7B78D00D6B38700DBB68500E5BC8600E9BF8200E9BD7F00E9BD7F00EABF
      7F00E7BC7E009F6F6000000000000000000093656000F0DECC00F7E5CE00F4DE
      C500EAD4B6003C3835001F1F2100182A330034434400836F56008E7759009E83
      5F00B2926800C7A36F00D9B17600E3BA7D00E7BC7E00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000005B7000005
      B70000000000000000000000000000000000000000000000000093655F00EFDA
      C500F7E2C700F3DCBF00F2D8B70000700000F0D1AA00EFCEA300B1B874000070
      00000070000000700000ADAD6000E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000009566
      6000F2E2D300FAEAD700F6E3CE00F4DEC500F3DCBF00F2D8B800DEC4A400BAA2
      8400A8917200A78E6E00B89B7500DBB68500EBC18900E9BD8100E9BD7F00EABF
      7F00E7BC7E009F6F6000000000000000000095666000F2E2D300FAEAD700F6E3
      CE00F0DAC200AC9D8A00113B4E0004689A00064F75000C3C52003A4948007764
      4C0089725300A4865F00BC996900D1AB7300E1B77900E3BA7B009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000005
      B7000005B7000005B7000005B7000005B7000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000005B7000005B7000000
      000000000000000000000000000000000000000000000000000093656000F0DE
      CC00F8E6CF00F6E0C600F3DCBD000070000004750300B2BD7F0000700000B1B8
      7400EDC79600B0B46B0000700000ADAF6200E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000009869
      6300F2E6DA00FAEEDE00F7E7D400F6E2CB00F4E0C500F3DCBF00004B0000004B
      0000004B0000004B0000A78E6E00D6B38700EDC58F00EBC18900E9BD8100EABF
      7F00E7BC7E009F6F6000000000000000000098696300F2E6DA00FAEEDE00F7E7
      D400F4E1CA00EBD8BD001A3E4D00036A9D00056798001B506E002A3440004135
      38006A5542007E694C00987D5800B2916300CCA66E00DAB177009D6D5F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000006F6000005B7000005B7000005B7000005B70000000000000000000000
      000000000000000000000005B7000005B7000005B7000005B700000000000000
      000000000000000000000000000000000000000000000000000095666000F2E2
      D300FAEAD700F6E3CE00F4DEC500007000000070000000700000B2BD7F00EFCE
      A300EECB9D00EDC79700B0B46B0000700000E9BD8100E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000009E6E
      6400F4EAE100FBF2E600F8EADC00F1E1CE00E4D1BD00DCCAB300004B00000895
      110006900E00004B0000A18B6F00C4A88100D6B38700D9B68400E5BC8500EABF
      8200E7BB7E009F6F600000000000000000009E6E6400F4EAE100FBF2E600F8EA
      DC00F7E6D300F3E0CA0074868600045983003150650095606000AA6E6E00965D
      5D00643B3A0065524000766347008E745100A9895D00C09C690096695A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000005B7000005B700000000000000
      00000005B7000005B7000005B7000005B7000005B70000000000000000000000
      000000000000000000000000000000000000000000000000000098696300F2E6
      DA00FAEEDE00F7E7D400F6E2CB0000700000007000000070000000700000F0D1
      A900EFCEA300EECB9D00EDC7960000700000EBC18900E9BD8100EABF7F00E7BC
      7E0080504B00000000000000000000000000000000000000000000000000A372
      6600F6EEE900FCF6ED00F8EFE300E5D9CA00C0B3A400AD9F8F00004B00000C9D
      19000A981400004B000096826A00A18B6E00A78E6E00B89B7400D9B58300EBC2
      8800E7BC80009F6F60000000000000000000A3726600F6EEE900FCF6ED00F8EF
      E300F7EADA00F7E6D300F0DDC9000B4159008C5B5B00CC8E8E00BB7E7E00AA6E
      6E00965C5C00643B3A0064513E006F5D4300826C4B009A7E5500865D51000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000005B7000005B7000005
      B7000005B7000005B7000005B7000005B7000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009E6E6400F4EA
      E100FBF2E600F8EADC00F7E6D300007000000070000000700000007000000070
      0000F0D1AA00EFCEA400EDCB9C00EDC79600EBC58F00EBC18800EABF8200E7BB
      7E0080504B00000000000000000000000000000000000000000000000000A775
      6800F8F3F000FEFBF600FBF3EB00004B0000004B0000004B0000004B000011A6
      24000EA11D00004B0000004B0000004B0000004B0000A68E6E00D6B38600EDC5
      8F00E9BF87009F6F62000000000000000000A7756800F8F3F000FEFBF600FBF3
      EB00F8EEE300F8EBDC00F6E6D1004E6C76009C696900DD9D9D00CB8C8C00BA7D
      7D00A96D6D00915959005A35340062503D006A5841007B664800735046000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000006F6000005
      B7000006F6000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A3726600F6EE
      E900FCF6ED00F8EFE300F7EADA00F7E6D300F6E2CC00F4DEC500F3DCBD00F2D8
      B600F0D5B000F0D1AA00EFCEA300EECA9C00EDC79500EBC48E00EBC28800E7BC
      800080504B00000000000000000000000000000000000000000000000000AC79
      6900FAF6F400FFFFFE00FEF8F300004B000025C7470020C140001CBA380018B2
      300014AC290011A522000DA01C000A9A1700004B0000A8917200D7B78D00EEC9
      9600EAC18E00A07063000000000000000000AC796900FAF6F400FFFFFE00FEF8
      F300FBF2EA00F8EEE300F8EBDA00F4E3D0007B504F00E2A4A400DC9D9D00CA8C
      8C00BA7D7D00A96D6D008C5757005A353400604F3D006C59410062443C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000006F6000005B70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A7756800F8F3
      F000FEFBF600FBF3EB00F8EEE300F8EBDC00F7E7D300F6E2CC00F4E0C5000070
      000000700000007000000070000000700000EDCB9C00EDC79500EDC58F00E9BF
      870080504B00000000000000000000000000000000000000000000000000B17E
      6B00FAF6F400FFFFFF00FFFEFB00004B00002CD3550028CC4D0023C545001FBF
      3E001BB7350017B02E0013AB270010A52000004B0000BAA28300DDBF9500EECB
      9C00EBC59200A07264000000000000000000B17E6B00FAF6F400FFFFFF00FFFE
      FB00FEF7F000FBF3EA00FAEFE300F8EADA00E1CCBB007B504F00E2A3A300DC9C
      9C00CA8B8B00B87B7B00A76C6C008C5656005A35350066523F00583F37000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000006F6000005
      B7000005B7000006F6000006F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AC796900FAF6
      F400FFFFFE00FEF8F300FBF2EA0000700000F8EBDA00F7E6D300F7E2CC00F6E0
      C50000700000007000000070000000700000EFCEA300EECB9C00EEC99600EAC1
      8E0080504B00000000000000000000000000000000000000000000000000B681
      6C00FAF6F400FFFFFF00FFFFFF00004B0000004B0000004B0000004B000027CB
      4B0022C44300004B0000004B0000004B0000004B0000E0C4A200EACCA500F0CF
      A300EDC999009D7065000000000000000000B6816C00FAF6F400FFFFFF00FFFF
      FF00FFFCFB00FEF7F200FBF3EB00F8EEE300F8EBDC00E1CCBB0073484700E1A3
      A300DA9C9C00C98B8B00B87B7B00A76C6C008B5656005D383600533C35000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000006F6000005B7000006
      F6000006F6000006F6000005B7000006F6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B17E6B00FAF6
      F400FFFFFF00FFFEFB00FEF7F00000700000BAD4AA00F8EADA00F7E7D300F6E2
      CB00B7C79200007000000070000000700000F0D1A900EFCEA100EECB9C00EBC5
      920080504B00000000000000000000000000000000000000000000000000BB84
      6E00FAF6F400FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7F200004B00002DD4
      580029CF5200004B0000AD9F8E00DEC8B100F3DABC00F2D8B600F0D4AF00EFD0
      A700CEB49100896A63000000000000000000BB846E00FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFEFB00FEF7F200FBF3EA00FAEEE300F8EADA00BBA196007348
      4700E1A1A100DA9A9A00C98A8A00B77A7A00A66B6B008B5555005A3535000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000006F6000006F6000006F6000005B7000006F6000000
      0000000000000006F6000006F6000006F6000006F60000000000000000000000
      0000000000000000000000000000000000000000000000000000B6816C00FAF6
      F400FFFFFF00FFFFFF00FFFCFB00BCDAB40000700000B8D3AA00F8EBDC00B7CC
      9D0000700000B7C792000475030000700000F2D4AF00F0D1A900F0CFA300EDC9
      990080504B00000000000000000000000000000000000000000000000000C089
      6F00FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00004B000034DE
      650030D95E00004B0000C0B3A400E4D1BC00F6DEC400F3DCBD00E5CEAF00C4B0
      9600A1927F00806762000000000000000000C0896F00FBF7F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2EA00FAEEE200F8EBDA00BBA1
      960073484700E0A1A100D99A9A00C78A8A00B77A7A00A66B6B008A5555005B35
      3500000000000000000000000000000000000000000000000000000000000000
      0000000000000006F6000006F6000005B7000006F6000006F600000000000000
      000000000000000000000006F6000006F6000006F6000006F600000000000000
      0000000000000000000000000000000000000000000000000000BB846E00FAF6
      F400FFFFFF00FFFFFF00FFFFFF00FFFEFB00BCDAB40000700000007000000070
      0000B7CC9D00F6E2CB00F6DEC40000700000F2D8B600F0D4AF00EFD0A700CEB4
      910080504B00000000000000000000000000000000000000000000000000C58C
      7000FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004B0000004B
      0000004B0000004B0000E6D9C900F2E2CF00FAE9D000E0D0BA00B8AB9A00A79C
      8B00A4978600846964000000000000000000C58C7000FBF7F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FCF8F200FBF3EA00F8EEE200F8EA
      D900BCA1960091606000EBAAAA00D9999900C7898900B6797900804E4E004148
      5500354756000000000000000000000000000000000000000000000000000000
      00000006F6000006F6000006F6000006F6000006F60000000000000000000000
      0000000000000000000000000000000000000006F6000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000C0896F00FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2EA00FAEE
      E200F8EBDA00F7E6D300F6E2CB00F6DEC400F3DCBD00E5CEAF00C4B09600A192
      7F0080504B00000000000000000000000000000000000000000000000000CB91
      7300FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
      FB00FCF7F000FBF2E900FBF2E500E9D3C4009E675B0098665B0095655B009665
      5B0096655B00986859000000000000000000CB917300FBF7F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7F000FBF2E900FBF2
      E500E9D3C40084544C0091606000EAAAAA00D8999900534E5700028AC40000AA
      EA0000A6E6000087C40000000000000000000000000000000000000000000006
      F6000006F6000006F6000006F6000006F6000000000000000000000000000000
      000000000000000000000000000000000000000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000C58C7000FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FCF8F200FBF3
      EA00F8EEE200F8EAD900F8E7D400FAE9D000E0D0BA00B8AB9A00A79C8B00A497
      860080504B00000000000000000000000000000000000000000000000000CF96
      7400FBF7F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCFA00FCF7F000FFFAEF00DAC0B6009F675B00DAA16B00DD984F00E290
      3A00EA892300A5686B000000000000000000CF967400FBF7F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFA00FCF7F000FFFA
      EF00DAC0B6009F675B00AA78560090606000C2898900097BAB0000BDFF0000BD
      FF0000A6E600001C9D00000082000000000000000000000000000006F6000006
      F6000006F6000006F6000006F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000006
      F600000000000000000000000000000000000000000000000000CB917300FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7
      F000FBF2E900FBF2E500E9D3C400A0675B00A0675B00A0675B00A0675B00A067
      5B00A0675B00000000000000000000000000000000000000000000000000D498
      7500FCF8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFCFB00FFFEF700DDC4BC009F675B00EAB47400EFA95200F6A0
      3600A5686B00000000000000000000000000D4987500FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FFFE
      F700DDC4BC009F675B00EAB47400B77D460073474700009FDE0000BDFF00008C
      D100001C9D00010D9D00010A970000008200000000000006F6000006F6000006
      F6000006F6000006F60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CF967400FBF7
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
      FA00FCF7F000FFFAEF00DAC0B600A0675B00DAA16B00DD984F00E2903A00EA89
      2300A5686B00000000000000000000000000000000000000000000000000D498
      7500FCF8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DDC7C2009F675B00EAB27300EFA75100A568
      6B0000000000000000000000000000000000D4987500FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DDC7C2009F675B00EAB27300EFA751007A494A000093D10000B1F200012B
      A7000725DC000420B800021DB100010A9700000000000006F6000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCFB00FFFEF700DDC4BC00A0675B00EAB47400EFA95200F6A03600A568
      6B0000000000000000000000000000000000000000000000000000000000D498
      7500FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E2D0CE009F675B00EDB57200A5686B000000
      000000000000000000000000000000000000D4987500FFFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E2D0CE009F675B00EDB57200A5686B0000000000000000000084C1000C21
      BF002D4FF6000F2ECC00031EB10000058F00000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DDC7C200A0675B00EAB27300EFA75100A5686B000000
      000000000000000000000000000000000000000000000000000000000000D395
      7000E6C2AC00E7C6B000E7C6B000E6C4B000E3C2B000E1C0AF00DEBDAD00DCBC
      AC00D8BAAC00D5B7AB00D3B5AB00C09990009F675B00A5686B00000000000000
      000000000000000000000000000000000000CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E68009F675B00A5686B00000000000000000000000000000000001624
      BF005270FC001839E30001099700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987500FFFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E2D0CE00A0675B00EDB57200A5686B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001322BD00050DA50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800A0675B00A5686B0000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000900000000100010000000000C00600000000000000000000
      000000000000000000000000FFFFFF00FF00FF000000000000000000FC003F00
      0000000000000000F0000F000000000000000000E00007000000000000000000
      C00003000000000000000000C000030000000000000000008000010000000000
      0000000080000100000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000100000000000000000080000100
      0000000000000000C00003000000000000000000C00003000000000000000000
      E00007000000000000000000F0000F000000000000000000FC003F0000000000
      00000000FF00FF000000000000000000FFF8FFFF80FFFFFFFFFFFFFFFF473FFF
      FFFFFFFFFFFFFFFFFF40E7FF01FFFFFFFFFFFFFFFE8039FF01FFFC003FFFFFFF
      FF0007FF01FFFC003FE81527FD0000FF01FFFC7F3FFFFAFFFA0000FF01FFFE3F
      FFE00007F80001FF01FFFF1FFFE00007F40002FFFEFFFF8FFFFA5027F00000FF
      00FFFFC7FFE00027E80005FF01FFFFE3FFFA4827D0000BFF80BFFFE3FFFA0027
      C00007FF003FFFC7FFFA2027A00017EFC00FFF8FFFF8002700002FE0100FFF1F
      FFFA002740000FE0080FFE3FFFFE012780005FF8080FFC7FFFC000018000BFF8
      000FFCFF3FFE05278000BFF8001FFC003FC02001C0017FF8000FFC003FC00001
      F802FFFE000FFFFFFFFFAFF7C702FFFF819FFFFFFFD05409FCF7FFFC7C5FFFFF
      FFFFFFFFFF9BFFFF40BFFFFFFFFFFFFFFC0000FFF03FE7FFFFFF00FFFC0000FF
      8007417FFFFC003FFC0000FC0000C0FFFFF0000F000000F8000040FFFFE00007
      000000F80000C05FFFC00003000000FC0000802FFFC00003000000FE0000C000
      FF800001000000FE0003E020FF800001000000FE0007F0003F000000000000FE
      000FFE0017000000000000FE001FFA080B000000000000FC007FFC000D000000
      000000F800FFFC0007000000000000F800FFF00007000000000000F007FFF000
      07000000000000F007FFF00007000000000000F007FFF00007800001000000F0
      1FFFFC000F800001800000E01FFFF40001C00003FC0000E07FFFFE000BC00003
      FC0000C0FFFFFE0017E00007FC0000C0FFFFFF003FF0000FFC0000C1FFFFFE40
      5FFC003FFE0001C1FFFF000000FF00FFFFFFFFE00003FF1FFFFF1FFFFFFFFFE0
      0003F80000F803FFFC79FFE00003C00000C0007FF8003FE0000300000000001F
      F00007E0000300000000001FE00000E0000300000000001FC00000E000030000
      0000001F800001E0000300000000001F800001E00003000000000000800001E0
      0003000000000000800001E00003000000000000800001E00003000000000000
      C00001E00003000000000000F00003E00003000000000000FC0007E000030000
      01000000FC000FE00003000003000000FC00FFE00003000007000000F801FFE0
      000300000F000000F801FFE0000300001F000000F801FFE0000700001F000000
      F003FFE0000F80007FC00000E003FFE0001FFC0FFFFE0001E007FFE0003FFFFF
      FFFFE003FE0FFFFFFFFFFFFFFFFFE007FFFFFFFFE7FFFFFFFFF9FFFFFFFFFFFF
      07FFC7FFFFF87FFFFFFFFFF807FF83FFFFFC3FFFFFFFFFE0000381FFFF000001
      FF7FFFE0000380FFFF000001FE3FFFE00003C07FFF000001FC1FFFE00003E03F
      FF000001F80FFFE00003F01FFF000001F007FFE00003F81FFF000001E003FFE0
      0003FC1C1F000001C041FFE00003FE0007000001C0E0FFE00003FFC003000001
      C1F87FE00003FFC001000001E3FC3FE00003FFC001000001F7FE1FE00003FF80
      00000001FFFF8FE00003FF8000000000FFFFC7E00003FF8000000000FFFFF3E0
      0003FF8000000000FFFFFDE00003FF8000000001FFFFFFE00003FFC001000001
      FFFFFFE00003FFC001000001FFFFFFF80003FFE003800003FFFFFFFF07FFFFF0
      07FFFFFFFFFFFFFFE7FFFFFC1FFFFFFFE00003FFFFFFFFFFFFFFFFFFE0000300
      001FFFFFF9C00007E0000300001FFFFFF1C00007E0000300001FC7FFE3C00007
      E0000300001FC3FF87C00007E0000300001FC1FF0FC00007E0000300001FE0FE
      1FC00007E0000300001FF07C3FC00007E0000300001FFC307FC00007E0000300
      001FFE00FFC00007E0000300001FFF01FFC00007E0000300001FFF83FFC00007
      E0000300001FFF01FFC00007E0000300001FFE00FFC00007E0000300001FFC18
      7FC00007E0000300000FF83C3FC00007E00003000007F07F1FC00007E0000300
      0003E0FF8FC00007E00003000001C1FFEFC00007E0000700000083FFFFC00007
      E0000F00000087FFFFC0000FE0001F0000C08FFFFFC0001FE0003F0001E1FFFF
      FFC0003FFFFFFFFFFFF3FFFFFFC0007F00000000000000000000000000000000
      000000000000}
  end
  object StoredProc: TpFIBStoredProc
    Left = 168
    Top = 248
  end
  object DataSetCheckErr: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    SelectSQL.Strings = (
      'select * from BS_SELECT_ERRORS_PACK_SIGN(1)')
    Left = 375
    Top = 3
    poSQLINT64ToBCD = True
    object DataSetCheckErrERROR_MESSAGE: TFIBStringField
      FieldName = 'ERROR_MESSAGE'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetCheckErrID_DT_ALLOC_PERS_AC: TFIBBCDField
      FieldName = 'ID_DT_ALLOC_PERS_AC'
      Size = 0
      RoundByScale = True
    end
    object DataSetCheckErrSUM_OPL: TFIBBCDField
      FieldName = 'SUM_OPL'
      Size = 2
      RoundByScale = True
    end
    object DataSetCheckErrSUM_ALLOC_ALL: TFIBBCDField
      FieldName = 'SUM_ALLOC_ALL'
      Size = 2
      RoundByScale = True
    end
    object DataSetCheckErrFLAG_ALLOC_ER: TFIBIntegerField
      FieldName = 'FLAG_ALLOC_ER'
    end
    object DataSetCheckErrCLIENT_ACCOUNT: TFIBBCDField
      FieldName = 'CLIENT_ACCOUNT'
      Size = 0
      RoundByScale = True
    end
    object DataSetCheckErrFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetCheckErrMONTH_SYS: TFIBIntegerField
      FieldName = 'MONTH_SYS'
    end
    object DataSetCheckErrYEAR_SYS: TFIBIntegerField
      FieldName = 'YEAR_SYS'
    end
    object DataSetCheckErrKOD_ERROR: TFIBIntegerField
      FieldName = 'KOD_ERROR'
    end
    object DataSetCheckErrNAME_ERROR: TFIBStringField
      FieldName = 'NAME_ERROR'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object TimeEnter: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TimeEnterTimer
    Left = 284
    Top = 247
  end
  object DataSetNameFile: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    Left = 129
    Top = 57
    poSQLINT64ToBCD = True
  end
  object DataSourceNameFile: TDataSource
    DataSet = DataSetNameFile
    Left = 161
    Top = 57
  end
end
