object fmAvanceOtchet: TfmAvanceOtchet
  Left = 353
  Top = 321
  Width = 915
  Height = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 899
    Height = 93
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 895
      end
      item
        Control = Panel4
        ImageIndex = -1
        MinHeight = 51
        Width = 895
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 882
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 84
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Images = ImageList
      ShowCaptions = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = ActionAdd
      end
      object ToolButton2: TToolButton
        Left = 84
        Top = 0
        Action = ActionChange
      end
      object ToolButton3: TToolButton
        Left = 168
        Top = 0
        Action = ActionDelete
      end
      object ToolButton4: TToolButton
        Left = 252
        Top = 0
        Action = ActionShowDoc
      end
      object ToolButton5: TToolButton
        Left = 336
        Top = 0
        Action = ActionClon
      end
      object ToolButton6: TToolButton
        Left = 420
        Top = 0
        Caption = 'ActionPrint'
        DropdownMenu = PopupMenuPrint
        ImageIndex = 10
        OnClick = ActionPrintFioExecute
      end
      object ToolButton7: TToolButton
        Left = 504
        Top = 0
        Width = 39
        Caption = 'ToolButton7'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton8: TToolButton
        Left = 543
        Top = 0
        Action = ActionRefresh
      end
      object ToolButton9: TToolButton
        Left = 627
        Top = 0
        Action = ActionFind
      end
      object ToolButton10: TToolButton
        Left = 711
        Top = 0
        Action = ActionExit
      end
    end
    object Panel4: TPanel
      Left = 9
      Top = 38
      Width = 882
      Height = 51
      Align = alClient
      TabOrder = 1
      object cxCheckBoxTo: TcxCheckBox
        Left = 464
        Top = 19
        Width = 42
        Height = 21
        TabStop = False
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = ' '#1087#1086' '
        TabOrder = 0
        OnClick = cxCheckBoxToClick
      end
      object cxDateEnd: TcxDateEdit
        Left = 514
        Top = 19
        Width = 121
        Height = 21
        TabStop = False
        Enabled = False
        Properties.DateButtons = [btnToday]
        Properties.ReadOnly = False
        TabOrder = 1
        OnEditing = cxDateEndEditing
      end
      object cxComboBoxSystem: TcxComboBox
        Left = 5
        Top = 18
        Width = 188
        Height = 21
        TabStop = False
        Properties.DropDownListStyle = lsFixedList
        Properties.ReadOnly = False
        Style.Color = 16776176
        TabOrder = 2
        OnClick = cxComboBoxSystemClick
      end
      object cxLabelPer: TcxLabel
        Left = 200
        Top = 20
        Width = 84
        Height = 17
        TabOrder = 3
        Caption = #1055#1077#1088#1080#1086#1076' '#1086#1090#1073#1086#1088#1072
      end
      object cxLabel9: TcxLabel
        Left = 4
        Top = 3
        Width = 103
        Height = 17
        TabOrder = 4
        Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1080#1089#1090#1077#1084#1091
      end
      object cxButtonFilter: TcxButton
        Left = 648
        Top = 4
        Width = 97
        Height = 41
        Caption = #1092#1110#1083#1100#1090#1088#1091#1074#1072#1090#1080
        TabOrder = 5
        TabStop = False
        Visible = False
        OnClick = cxButtonFilterClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000430B0000430B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFA88D8DFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA08281A8
          8D8DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFA08281DBD6D6A88D8DFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA08281DB
          D6D6A08281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFA08281DBD6D6A08281FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA08281DB
          D6D6B5A0A0A08281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFA08281DBD6D6BBA9A9B5A0A0AE9796A08281FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA08281DBD6D6C5B7B7BB
          A9A9B5A0A0AE9796A88D8DA08281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFA08281DBD6D6D0C6C6C5B7B7A48887A48887AE9796A88D8DA18483A082
          81FF00FFFF00FFFF00FFFF00FFFF00FFA08281E6E6E6DBD6D6A48887A488876F
          B1CDA48887A08281A08281A184839B7B7AA08281FF00FFFF00FFFF00FFFF00FF
          A08281A0828146A5BCA4FFFF45D0FD8AD7FD45A8E30022AC1725AC397092A082
          81A08281FF00FFFF00FFFF00FFFF00FFFF00FFA0828132A5CDA4EBFB8AF5FD45
          C5F60022BF0000BE0000CC1725AC5D8E9CFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFAA521058695740778767C5F61E4DD2191ECA0000D90000DE0000C58D8D
          D3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC07331AC4100B74C007E604C41
          2E997084E8191ECA0000CF7171CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF744747DCA372ECA544AF68109F71533838C43838C48D8DDDFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB99E98976554CBBABAFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Layout = blGlyphTop
        UseSystemPaint = False
      end
      object cxDateBegin: TcxDateEdit
        Left = 333
        Top = 19
        Width = 121
        Height = 21
        TabStop = False
        Enabled = False
        Properties.ReadOnly = False
        TabOrder = 6
        OnEditing = cxDateBeginEditing
      end
      object cxCheckBoxFrom: TcxCheckBox
        Left = 290
        Top = 19
        Width = 41
        Height = 21
        TabStop = False
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = False
        Properties.Caption = 'c'
        TabOrder = 7
        OnClick = cxCheckBoxFromClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 93
    Width = 511
    Height = 421
    Align = alClient
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 1
      Top = 289
      Width = 509
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object cxGridMain: TcxGrid
      Left = 1
      Top = 1
      Width = 509
      Height = 288
      Align = alClient
      PopupMenu = Popup
      TabOrder = 0
      object cxGridMainDBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourceMain
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00 ;-,0.00'
            Kind = skSum
            FieldName = 'R_SUM_AO'
            Column = cxGridMainDBTableView1DBColumn5
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleYellow
        Styles.Content = cxStyleYellow
        Styles.ContentEven = cxStyleYellow
        Styles.ContentOdd = cxStyleYellow
        Styles.Inactive = cxStyle4
        Styles.IncSearch = cxStyleYellow
        Styles.Selection = cxStyleMalin
        Styles.FilterBox = cxStyleBorder
        Styles.Footer = cxStyleBorder
        Styles.Group = cxStyleYellow
        Styles.GroupByBox = cxStyleYellow
        Styles.Header = cxStyleBorder
        Styles.Indicator = cxStyleYellow
        Styles.NewItemRowInfoText = cxStyleYellow
        Styles.Preview = cxStyle4
        object cxGridMainDBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1044#1077#1073#1077#1090'/'#1082#1088#1077#1076#1080#1090
          PropertiesClassName = 'TcxTextEditProperties'
          SortOrder = soAscending
          Width = 24
          DataBinding.FieldName = 'R_DEBET'
        end
        object cxGridMainDBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088
          PropertiesClassName = 'TcxTextEditProperties'
          SortOrder = soAscending
          Width = 92
          DataBinding.FieldName = 'R_ALL_NUMBER'
        end
        object cxGridMainDBTableView1DBColumn3: TcxGridDBColumn
          Caption = #1044#1072#1090#1072
          PropertiesClassName = 'TcxDateEditProperties'
          SortOrder = soAscending
          Width = 40
          DataBinding.FieldName = 'R_DATE_AO'
        end
        object cxGridMainDBTableView1DBColumn7: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          SortOrder = soAscending
          Width = 41
          DataBinding.FieldName = 'R_TN'
        end
        object cxGridMainDBTableView1DBColumn4: TcxGridDBColumn
          Caption = #1060#1048#1054
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 132
          DataBinding.FieldName = 'R_FIO'
        end
        object cxGridMainDBTableView1DBColumn6: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 52
          DataBinding.FieldName = 'R_DOGOVOR'
        end
        object cxGridMainDBTableView1DBColumn5: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072
          Styles.Footer = cxStyleBorder
          Styles.Header = cxStyleBorder
          Width = 75
          DataBinding.FieldName = 'R_SUM_AO'
        end
        object cxGridMainDBTableView1DBColumn8: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          Width = 51
          DataBinding.FieldName = 'NAME_TYPE_DOC'
        end
      end
      object cxGridMainLevel1: TcxGridLevel
        GridView = cxGridMainDBTableView1
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 292
      Width = 509
      Height = 128
      Align = alBottom
      TabOrder = 1
      object Bevel1: TBevel
        Left = 6
        Top = 5
        Width = 622
        Height = 73
      end
      object cxLabelFIO: TcxLabel
        Left = 8
        Top = 8
        Width = 89
        Height = 17
        AutoSize = False
        TabOrder = 0
        Caption = #1055'.'#1030'.'#1041'.'
      end
      object cxLabelKod: TcxLabel
        Left = 8
        Top = 32
        Width = 89
        Height = 17
        AutoSize = False
        TabOrder = 1
        Caption = #1053#1072#1083#1086#1075#1086#1074#1080#1081' '#1082#1086#1076
      end
      object cxLabelPol: TcxLabel
        Left = 328
        Top = 8
        Width = 57
        Height = 17
        AutoSize = False
        TabOrder = 2
        Caption = #1057#1090#1072#1090#1100
      end
      object cxLabelDay: TcxLabel
        Left = 328
        Top = 32
        Width = 105
        Height = 17
        AutoSize = False
        TabOrder = 3
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      end
      object cxLabelPaspart: TcxLabel
        Left = 8
        Top = 56
        Width = 81
        Height = 17
        AutoSize = False
        TabOrder = 4
        Caption = #1055#1072#1089#1087#1086#1088#1090' '#8470
      end
      object cxLabelNumber: TcxLabel
        Left = 328
        Top = 56
        Width = 105
        Height = 17
        AutoSize = False
        TabOrder = 5
        Caption = #1057#1077#1088#1110#1103
      end
      object cxLabelWhy: TcxLabel
        Left = 8
        Top = 80
        Width = 89
        Height = 17
        AutoSize = False
        TabOrder = 6
        Caption = #1054#1089#1085#1086#1074#1072
      end
      object cxLabel1: TcxLabel
        Left = 96
        Top = 8
        Width = 233
        Height = 17
        AutoSize = False
        TabOrder = 7
        Caption = ''
      end
      object cxLabel2: TcxLabel
        Left = 432
        Top = 8
        Width = 185
        Height = 17
        AutoSize = False
        TabOrder = 8
        Caption = ''
      end
      object cxLabel3: TcxLabel
        Left = 96
        Top = 32
        Width = 105
        Height = 17
        AutoSize = False
        TabOrder = 9
        Caption = ''
      end
      object cxLabel4: TcxLabel
        Left = 432
        Top = 32
        Width = 185
        Height = 17
        AutoSize = False
        TabOrder = 10
        Caption = ''
      end
      object cxLabel6: TcxLabel
        Left = 432
        Top = 56
        Width = 193
        Height = 17
        AutoSize = False
        TabOrder = 11
        Caption = ''
      end
      object cxLabel7: TcxLabel
        Left = 96
        Top = 80
        Width = 417
        Height = 17
        AutoSize = False
        TabOrder = 12
        Caption = ''
      end
      object cxLabel5: TcxLabel
        Left = 96
        Top = 56
        Width = 217
        Height = 17
        AutoSize = False
        TabOrder = 13
        Caption = ''
      end
      object cxTextEdit1: TcxTextEdit
        Left = 52
        Top = 102
        Width = 573
        Height = 21
        ParentColor = True
        TabOrder = 14
      end
    end
  end
  object Panel2: TPanel
    Left = 519
    Top = 93
    Width = 380
    Height = 421
    Align = alRight
    TabOrder = 2
    object cxGridRasp: TcxGrid
      Left = 1
      Top = 254
      Width = 378
      Height = 166
      Align = alBottom
      TabOrder = 2
      object cxGridRaspDBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourceRasp
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00 ;-,0.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = cxGridRaspDBTableView1DBColumn2
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleYellow
        Styles.Content = cxStyleYellow
        Styles.ContentEven = cxStyleYellow
        Styles.ContentOdd = cxStyleYellow
        Styles.Inactive = cxStyle4
        Styles.IncSearch = cxStyleYellow
        Styles.Selection = cxStyleMalin
        Styles.FilterBox = cxStyleYellow
        Styles.Footer = cxStyleBorder
        Styles.Group = cxStyleYellow
        Styles.GroupByBox = cxStyleYellow
        Styles.Header = cxStyleBorder
        Styles.Indicator = cxStyleYellow
        Styles.NewItemRowInfoText = cxStyleYellow
        Styles.Preview = cxStyle4
        object cxGridRaspDBTableView1DBColumn3: TcxGridDBColumn
          SortOrder = soAscending
          Width = 49
          DataBinding.FieldName = 'NUM'
        end
        object cxGridRaspDBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072
          Width = 177
          DataBinding.FieldName = 'NAME'
        end
        object cxGridRaspDBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072
          Width = 86
          DataBinding.FieldName = 'SUMMA'
        end
      end
      object cxGridRaspLevel1: TcxGridLevel
        GridView = cxGridRaspDBTableView1
      end
    end
    object cxGridRaznoskka: TcxGrid
      Left = 1
      Top = 1
      Width = 378
      Height = 245
      Align = alClient
      TabOrder = 0
      object cxGridRaznoskkaDBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourceProvodka
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00 ;-,0.00'
            Kind = skSum
            Column = cxGridRaznoskkaDBTableView1DBColumn5
          end
          item
            Format = ',0.00 ;-,0.00'
            Kind = skSum
            FieldName = 'SUMMA_NEOSN'
            Column = cxGridRaznoskkaDBTableView1DBColumn6
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleYellow
        Styles.Content = cxStyleYellow
        Styles.ContentEven = cxStyleYellow
        Styles.ContentOdd = cxStyleYellow
        Styles.Inactive = cxStyle4
        Styles.IncSearch = cxStyleYellow
        Styles.Selection = cxStyleMalin
        Styles.FilterBox = cxStyleYellow
        Styles.Footer = cxStyleBorder
        Styles.Group = cxStyleYellow
        Styles.GroupByBox = cxStyleYellow
        Styles.Header = cxStyleBorder
        Styles.Indicator = cxStyleYellow
        Styles.NewItemRowInfoText = cxStyleYellow
        Styles.Preview = cxStyle4
        object cxGridRaznoskkaDBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1044#1077#1073#1077#1090
          SortOrder = soAscending
          Width = 58
          DataBinding.FieldName = 'DEBET'
        end
        object cxGridRaznoskkaDBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1050#1088#1077#1076#1080#1090
          Width = 43
          DataBinding.FieldName = 'KREDIT'
        end
        object cxGridRaznoskkaDBTableView1DBColumn3: TcxGridDBColumn
          Caption = #1057#1084#1077#1090#1072'/'#1088#1072#1079#1076#1077#1083'/'#1089#1090#1072#1090#1100#1103
          Width = 117
          DataBinding.FieldName = 'ALL_KOD'
        end
        object cxGridRaznoskkaDBTableView1DBColumn4: TcxGridDBColumn
          Caption = #1050#1069#1050#1042
          Width = 32
          DataBinding.FieldName = 'KEKV_KOD'
        end
        object cxGridRaznoskkaDBTableView1DBColumn5: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072
          Width = 62
          DataBinding.FieldName = 'SUMMA'
        end
        object cxGridRaznoskkaDBTableView1DBColumn6: TcxGridDBColumn
          DataBinding.FieldName = 'SUMMA_NEOSN'
        end
      end
      object cxGridRaznoskkaLevel1: TcxGridLevel
        GridView = cxGridRaznoskkaDBTableView1
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 246
      Width = 378
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 100
      AlignSplitter = salBottom
      Control = cxGridRasp
    end
  end
  object cxSplitter2: TcxSplitter
    Left = 511
    Top = 93
    Width = 8
    Height = 421
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 100
    AlignSplitter = salRight
    Control = Panel2
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 514
    Width = 899
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clNavy
        PanelStyle.Font.Height = -13
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clNavy
        PanelStyle.Font.Height = -13
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clNavy
        PanelStyle.Font.Height = -13
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clNavy
        PanelStyle.Font.Height = -13
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clNavy
        PanelStyle.Font.Height = -13
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clNavy
        PanelStyle.Font.Height = -13
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Fixed = False
      end>
    PaintStyle = stpsXP
    SizeGrip = False
    LookAndFeel.NativeStyle = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
  end
  object ActionList: TActionList
    Images = ImageList
    Left = 48
    Top = 121
    object ActionAdd: TAction
      Caption = 'ActionAdd'
      ImageIndex = 1
      ShortCut = 45
      OnExecute = ActionAddExecute
    end
    object ActionChange: TAction
      Caption = 'ActionChange'
      ImageIndex = 4
      ShortCut = 113
      OnExecute = ActionChangeExecute
    end
    object ActionDelete: TAction
      Caption = 'ActionDelete'
      ImageIndex = 3
      ShortCut = 46
      OnExecute = ActionDeleteExecute
    end
    object ActionRefresh: TAction
      Caption = 'ActionRefresh'
      ImageIndex = 7
      ShortCut = 116
      OnExecute = ActionRefreshExecute
    end
    object ActionExit: TAction
      Caption = 'ActionExit'
      ImageIndex = 5
      ShortCut = 27
      OnExecute = ActionExitExecute
    end
    object ActionFind: TAction
      Caption = 'ActionFind'
      ImageIndex = 6
      ShortCut = 16454
      Visible = False
      OnExecute = ActionFindExecute
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ImageIndex = 2
      OnExecute = ActionCancelExecute
    end
    object ActionShow: TAction
      Caption = 'ActionShow'
      ShortCut = 57431
      OnExecute = ActionShowExecute
    end
    object ActionShowDoc: TAction
      Caption = 'ActionShowDoc'
      ImageIndex = 8
      ShortCut = 114
      OnExecute = ActionShowDocExecute
    end
    object ActionClon: TAction
      Caption = 'ActionClon'
      ImageIndex = 9
      OnExecute = ActionClonExecute
    end
    object ActionPrintFio: TAction
      Caption = 'ActionPrint'
      ImageIndex = 10
      OnExecute = ActionPrintFioExecute
    end
    object ActionPrintReestr: TAction
      Caption = 'ActionPrintReestr'
      ImageIndex = 10
      OnExecute = ActionPrintReestrExecute
    end
    object ActionFormReestr: TAction
      Caption = #1056#1077#1108#1089#1090#1088#1080
      ImageIndex = 11
    end
  end
  object ImageList: TImageList
    Left = 80
    Top = 121
    Bitmap = {
      494C01010C000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A87D7800B781
      8300B7818300B7818300B7818300B7818300B7818300B7818300B7818300B781
      8300B7818300B781830000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDBEB30069473100694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100694731000000000039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900000000000000000000000000000000000000000000000000A87D7800F2E6
      D700FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEF
      E000F0E2CF00B781830000000000000000000000000000000000FFFF0000FFFF
      0000000000008C5A5A008C5A5A0000000000FFFF0000FFFF0000000000008C5A
      5A008C5A5A008C5A5A008C5A5A0000000000DDBEB300FFFFFF00B7A29300B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A29300694731003939390084848400848484008484
      8400848484008484840084848400848484008484840084848400848484003939
      3900393939000000000000000000000000000000000000000000A87D7800F3E7
      D900FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC
      9A00F0E2CF00B781830000000000000000000000000000000000FFFF0000FFFF
      000000000000F7DECE00F7DEC60000000000FFFF0000FFFF000000000000F7DE
      C600EFDECE00F7EFDE008C5A5A0000000000DDBEB300FBF9F800FBF9F800F8F5
      F300F4F0ED00F2ECE800EEE7E200ECE3DE00E9DFD800E6DBD300E3D6CE00E0D2
      C900DCCDC300DCCDC300B7A29300694731003939390039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900393939003939390000000000000000000000000000000000A87D7800F3E9
      DE00FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEF
      E000EFE1CE00B781830000000000000000000000000000000000FFFFFF00FFFF
      000000000000000000000000000000000000FFFFFF00FFFF000000000000F7DE
      C600EFDECE00F7EFDE008C5A5A0000000000DDBEB300FEFDFD00D8984000D898
      4000D89840001C1C1C009860600098606000EDE4DF00EAE0DA00E7DBD500E4D7
      D000E0D2CA00E0D2CA00B7A293006947310039393900C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400393939003939390000000000000000000000000000000000A87D7800EDE4
      DA00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC
      9A00E8DAC800B781830000000000000000000000000084848400000000000000
      000000000000FFD6A500FFD6A500FFD6A500000000000000000084848400FFD6
      A500FFD6A500F7E7CE008C5A5A0000000000DDBEB300FEFEFE00FEFEFE00FEFD
      FD00FBFAF900C89898001C1C1C000098C8001C1C1C00EDE4E000EAE0DA00E7DC
      D600E3D6CF00E3D6CF00B7A293006947310039393900C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000FF000000FF00000000FF000000FF00C6C6C6008484
      8400848484003939390039393900000000000000000000000000A07A7100B4AE
      A900B4ADA700B4ACA400B3ACA300B2AAA100B1A9A000B0A89D00B0A89C00B0A6
      9A00B0A59900A47476000000000000000000000000000000000000000000B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC6000000
      0000F7E7CE00F7E7CE000000000000000000DDBEB300FFFFFF00D8984000D898
      4000D8984000C89898000098C8004ABEDF000098C8001C1C1C00D8984000D898
      4000D8984000E7DCD500B7A293006947310039393900C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      840084848400848484003939390000000000A3522800A3522800A3522800A352
      2800A3522800A3522800A3522800A3522800A3522800A3522800A3522800A352
      2800A3522800A3522800A3522800A35228000000000000000000000000000000
      0000F7EFDE00F7DECE0000000000F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C60000000000EFDECE000000000000000000DDBEB300FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FEFEFD000098C80094E4F6004ABEDF000098C8001C1C1C00EDE4
      E000EAE0DA00EAE0DA00B7A29300694731000000000039393900393939003939
      390039393900393939003939390039393900393939003939390039393900C6C6
      C60084848400848484003939390000000000A352280000000000BA8E8200DCD6
      D200D8754200D8754200D8754200D8754200D8754200D8754200D8754200D875
      4200D5CBBF00B781830000000000A3522800000000000000000000000000B58C
      8C0000000000FFD6A50000000000FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500000000000000000000000000DDBEB300FFFFFF00D8984000D898
      4000D8984000D8984000D89840000098C80094E4F6004ABEDF000098C8001C1C
      1C00D8984000EEE6E100B7A29300694731000000000000000000B58C8C00FFFF
      FF00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00FFFFFF009C6B
      6B00C6C6C600848484003939390000000000A352280000000000AE877700B6B4
      B000F6CAB300F6CAB300F6CAB300F6CAB300F6CAB300F6CAB300F6CAB300F6CA
      B300B1AAA100A474760000000000A3522800000000000000000000000000B58C
      8C00FFF7EF000000000000000000F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B6B0000000000DDBEB300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE000098C80094E4F6004ABEDF000098
      C8001C1C1C00F0E9E500B7A29300694731000000000000000000B58C8C00FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFFF7009C6B
      6B00393939003939390000000000000000000000000000000000C2968500FFFE
      FD00FFFEFD00FFFEFD00FBF7F300FAF5EF00FAF5EF00F8F1EB00F7F1E900F6EC
      E200F6ECE200B78183000000000000000000000000000000000000000000B58C
      8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B0000000000DDBEB300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000098C80094E4F6004ABE
      DF008080800000009A00F0E9E500694731000000000000000000B58C8C00FFFF
      FF00FFF7EF00F7E7CE00F7DEC600F7E7CE00F7DEC600F7E7CE00FFFFF7009C6B
      6B00000000000000000000000000000000000000000000000000CA9C8800FDFC
      FA00FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEFE000FDEF
      E000F5ECE300B78183000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B0000000000D8800000D8800000D8800000D880
      0000D8800000D8800000D8800000D8800000D8800000D88000000098C800D2BA
      AC00778C980000009A0000009A00D8800000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFF
      FF009C6B6B000000000000000000000000000000000000000000D2A38A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F1E900B78183000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B0000000000F8980000F8C89000F8980000F898
      0000F8980000F8980000F8980000F8980000F8980000F8980000F89800000030
      F8006D8AFD000030F80000009A0000000000000000000000000000000000B58C
      8C00FFFFF700FFFFF700FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFFF
      FF009C6B6B000000000000000000000000000000000000000000D7A78C00FFFF
      FF00FFFFFF00FFFFFF00FFFEFD00FEFBF800FCF9F600FBF7F300FAF6F100F9F3
      EE00F9F2EC00B78183000000000000000000000000000000000000000000B58C
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B000000000000000000F8980000F8C89000F8C89000F8C8
      9000F8C89000F8C89000F8980000000000000000000000000000000000000000
      00000030F8000030F80000000000000000000000000000000000000000000000
      0000B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C6B6B0000000000000000000000000000000000DEAD8E00FFFF
      FF00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC9A00FECC
      9A00FAF6F100B78183000000000000000000000000000000000000000000B58C
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C
      8C00C68C7B0000000000000000000000000000000000F8980000F8980000F898
      0000F8980000F898000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C009C6B6B0000000000000000000000000000000000DEAD8E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FEFCFA00FCF9
      F600FBF8F400B78183000000000000000000000000000000000000000000B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEAD8F00DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA4
      8200DAA48200AA807C000000000000000000000000008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C3100009C3100000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D60000000000EF42
      0000AD290000AD29000073290000732900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA5005A3118005A311800000000000000
      000000000000000000000000000000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D600FF9C1800FFF7
      E700AD290000AD29000073290000732900000000000094736B00B58C7B00B584
      7B00B5847B00B5847B00B5847B00B5847B00B5847B00B5847B00AD847B00AD84
      7B00B5848400B58C7B00845A52000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA500FFE78C00FFE78C00313131000000
      000000000000000000000000000000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D600FF9C1800FFF7
      E700AD290000AD290000732900007329000000000000B5948C00F7DECE00FFDE
      C600FFDEC600FFDEC600FFD6BD00FFD6BD00FFD6B500FFD6B500F7CEB500F7CE
      AD00F7CEAD00FFCEAD009C736B000000000000000000FFF7E700FFD6A500FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A003131
      31009C3100009C3100000000000000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D600000000000000
      0000AD290000AD290000732900007329000000000000B5949400EFEFD600FFF7
      D600E7E7BD00E7E7BD00FFEFD600F7E7B500EFE7AD00FFDEB500FFDEAD00FFD6
      A500F7D6A500FFDEB500A57373000000000000000000FFF7E700F7DEC600F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7CE00F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D600000000000000
      0000AD290000AD290000732900007329000000000000BD9C9400EFEFE700FFFF
      EF00ADD68C00009C0000009C0000009C0000009C000000940000219C2100D6CE
      9C00FFD6AD00FFD6BD009C7373000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00EFDECE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA5000000000008080800FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C18000000000000000000EF42
      0000AD290000AD2900007329000073290000FF9C1800FF9C1800000000000000
      0000AD290000AD290000732900007329000000000000C6A59C00EFF7EF00FFFF
      F700ADDE9C0000940000009C000010A510009CCE9400ADC6940029AD21005AB5
      4A00F7DEB500FFDEC6009C7373000000000000000000FFF7E70042424200FFD6
      A50042424200FFD6A50018181800FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6300000000000000000000000000000000000000000000000000080808000000
      000000000000FF633100FFEFA500FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C3100007329000073290000FF9C1800F7FFFF00000000000000
      0000AD290000AD290000732900007329000000000000C6A5A500EFF7EF00FFFF
      F700B5DEA500009C000008A5080018A5180052B54200F7E7C600F7E7C6005AB5
      5A00DED69C00FFDEC600A57B73000000000000000000FFF7EF00F7DEC600F7DE
      C600F7DEC6001818180018181800F7DEC600F7DEBD00F7E7CE00EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFDE8400FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD290000732900007329000000000000CEADA500F7FFF700F7F7
      E700DEEFCE00FFF7E700F7F7DE00FFF7DE00FFE7CE00FFEFDE00FFEFDE00F7E7
      CE00F7DEB500FFDEC600AD7B73000000000000000000FFF7EF00F7E7CE00F7DE
      C600181818001818180018181800F7DEC600F7DEC600F7E7D600EFDECE009C6B
      6B000000000000000000000000000000000000000000FFFFCE00FFFFBD00FFC6
      5A00FFA51000FF9C0000F7FFFF00FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FFA53900FFA53900F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD2900008C3921008C39210000000000D6B5A500F7FFFF00E7F7
      E7008CD68C00EFF7DE00FFFFFF00C6DEAD004AB5390052B542004AB53900C6D6
      9C00FFEFD600FFE7CE00AD7B73000000000000000000FFFFF700FFD6A5001818
      18008484840000FFFF0018181800FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      00000000000008080800F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000CED6D600FFA53900FFA53900EF42
      0000EF420000AD290000732900008C392100FFA53900FF9C1800000000000000
      0000AD2900008C3921008C392100CED6D60000000000D6B5A500F7FFFF00FFFF
      FF008CCE94004ABD5200E7EFDE00FFFFEF0063BD63000094000000940000ADD6
      8C00FFEFDE00FFDECE00AD7B73000000000000000000FFFFF700FFE7D6001818
      1800C6C6C60000FFFF0018181800FFE7D6000000000000000000000000009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000CED6D600CED6D600FFA53900FFF7
      E700EF420000AD290000732900008C392100FFA53900FFF7E700000000000000
      00008C3921008C392100CED6D600CED6D60000000000DEBDA500F7FFFF00FFFF
      FF00EFF7E70039AD310018A518005AC65A0031AD3100009C000000940000ADD6
      8C00FFF7E700FFDECE00AD847B000000000000000000FFFFFF00181818008484
      840000FFFF0018181800FFFFF700FFFFF70000000000FFFFFF00C68C7B00CED6
      D600000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100C65A0000FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C00009C3100000000000000000000CED6D600CED6D600FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100CED6D600CED6D600CED6D60000000000E7C6A500F7FFFF00FFFF
      FF00FFFFFF00C6EFCE0021AD2100009400000094000010A51000089C1000A5CE
      8C00FFCEC600FFADA500AD7B730000000000000000004242420084848400C6C6
      C60000FFFF0018181800FFFFFF00FFFFFF0000000000C68C7B00CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300C65A0000C65A0000CE636300FFC65A00FF9C
      0000FF9C00009C3100000000000000000000CED6D600CED6D600FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100CED6D600CED6D600CED6D60000000000E7CEAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEAD
      9400D6945200C69C7B00C6ADA5000000000000000000181818001818180000FF
      FF001818180000000000000000000000000000000000CED6D600CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300FFD67300FFD67300C65A0000CE636300FF9C
      0000FF9C00009C3100000000000000000000CED6D600CED6D600CED6D600FFA5
      3900FF9C1800EF4200008C392100CED6D600CED6D600FFA53900000000000000
      00008C392100CED6D600CED6D600CED6D60000000000EFCEAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00F7FFFF00F7FFFF00C6AD
      9C00D69C7300DECEB50000000000000000001818180000008400000084001818
      1800CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFDE8400FFDE8400FFDE8400FFDE8400C65A0000C65A
      0000C65A00009C3100000000000000000000CED6D600CED6D600CED6D600FFA5
      3900F7FFFF00EF4200008C392100CED6D600CED6D600FFA53900F7FFFF000000
      00008C392100CED6D600CED6D600CED6D60000000000E7C69C00E7C6A500E7C6
      A500E7C6A500E7C6A500E7C6A500E7C6A500DEC6A500DEC6A500DEC6A500C69C
      8400DECEBD00000000000000000000000000CED6D60018181800181818001818
      1800CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF6331000000000000000000CED6D600CED6D600CED6D600FFCE
      6300FFCE6300FFA53900FFA53900CED6D600CED6D600FFCE6300FFA53900FFA5
      39008C392100CED6D600CED6D600CED6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7E7CE008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600EFDE
      CE00EFDECE008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500EFDECE008C5A5A0000000000000000000000000000000000000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      840000008400000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000848400000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C008C5A5A008C5A5A008C5A
      5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7
      CE00EFDECE009C6B630000000000000000000000000000000000000084000000
      8400000084008484840000000000000000000000000000000000000084000000
      840084848400000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500F7E7CE008C5A5A00000000000000000000000000000000000000
      0000000000000084840000FFFF00008484000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7E700F7EFDE00F7EF
      DE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7E7
      D600EFDECE009C6B6B0000000000000000000000000000000000000000000000
      8400000084000000840084848400000000000000000000008400000084000000
      84000000000000000000000000000000000000000000000000000000FF00B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00F7E7CE008C5A5A00000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000084840000000000000000000000
      000000000000000000000000000000000000B58C8C00F7EFDE00F7DECE00F7DE
      C600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A5004A844A004A844A004A84
      4A004A844A00A57B730000000000000000000000000000000000000000000000
      0000000084000000840000008400848484000000840000008400000084000000
      00000000000000000000000000000000000000000000000000000000FF000000
      8400F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC6000000
      FF00EFDECE00EFDECE008C5A5A000000000000000000000000000000000000FF
      FF0000FFFF00848484008484840000FFFF0000FFFF0000848400000000000000
      000000000000000000000000000000000000B58C8C00FFF7E700FFD6A500FFD6
      A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D6004A844A0052AD520052AD
      52004A844A00A57B730000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000008400FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500000084000000
      FF00FFD6A500EFDECE009C6B63000000000000000000000000008484840000FF
      FF008484840000000000000000008484840000FFFF0000FFFF00008484000000
      000000000000000000000000000000000000B58C8C00FFF7EF00F7DEC600F7DE
      C600B58C8C00FFFFFF00FFFFFF004A844A004A844A004A844A0052AD520052AD
      52004A844A004A844A004A844A00000000000000000000000000000000000000
      00000000000000000000000084000000FF000000840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000006B6B
      FF0000008400F7DEC600F7DEC600F7DEC600F7DEC600000084000000FF00F7DE
      BD00F7E7CE00EFDECE009C6B6B00000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000FFFF0000FFFF000084
      840000000000000000000000000000000000B58C8C00FFF7EF00F7E7CE00F7DE
      C600B58C8C00FFFFFF00FFFFFF004A844A0052AD520052AD520052AD520052AD
      520052AD520052AD52004A844A00000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400848484000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C000000FF0000008400F7DEC600F7DEC600000084000000FF00F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000848400000000000000000000000000B58C8C00FFFFF700FFD6A500FFD6
      A500B58C8C00FFFFFF00FFFFFF004A844A006BCE84006BCE84006BCE840052AD
      520052AD520052AD52004A844A00000000000000000000000000000000000000
      0000000084000000840000008400000000000000840000008400000084008484
      840000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF0000008400000084000000FF00FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF00000000000000000000000000B58C8C00FFFFF700FFE7D600FFE7
      D600B58C8C00B58C8C00B58C8C004A844A004A844A004A844A006BCE840052AD
      52004A844A004A844A004A844A00000000000000000000000000000000000000
      8400000084000000840000000000000000000000000000008400000084000000
      840084848400000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF000000FF000000FF00FFE7D600FFE7D600FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFF00000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD004A844A006BCE840052AD
      52004A844A000000000000000000000000000000000000000000000084000000
      8400000084000000000000000000000000000000000000000000000084000000
      840000008400000000000000000000000000000000000000000000000000B58C
      8C000000FF00000084000000FF0000008400FFFFFF00FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C004A844A004A844A004A84
      4A004A844A000000000000000000000000000000000000000000000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      84000000840000000000000000000000000000000000000000000000FF000000
      FF0000008400FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00B58C
      8C00C68C7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C000000FF0000008400B58C8C00B58C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00BD8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFC003CF3F0000800FC003
      800100000007C003800100000003C003800100000003C003800100000001C003
      C001000000010000E001000080014002E0010000C0014002E0010000C003C003
      E0010000C00FC003E0010000E007C003E0010001E007C003E00301F3F003C003
      E00783FFF803C003E00FFFFFFFFFC003800FFCFFE020FFFF800FFC3F20008001
      800FFC1F20008001800FF80320308001800FF00320308001800FF80360308001
      800FD80340308001800FD80340308001800F000300308001800F800300308001
      80EFD80300308001808FD00300308001808FF80300308001878FF80300308003
      000FF80300108007000FF8030000FFFFFFFFF003FFFFFFFFFFFFF003FFFFE001
      FFFFF003FFFFE001FDFFF003C7E7E001F8FF0003C3C7E001F07F0003E18FC001
      E03F0003F01FC001C01F0003F83FE001C60F0001FC3FE001EF070001F81FE001
      FF830001F10FE001FFC30001E387E001FFE30007C7C7E003FFF70007CFE7C007
      FFFF007FFFFF800FFFFF00FFFFFFFF9F00000000000000000000000000000000
      000000000000}
  end
  object Popup: TPopupMenu
    Images = ImageList
    Left = 16
    Top = 185
    object ActionAdd1: TMenuItem
      Action = ActionAdd
    end
    object ActionChange1: TMenuItem
      Action = ActionChange
    end
    object ActionDelete1: TMenuItem
      Action = ActionDelete
    end
    object ActionCancel1: TMenuItem
      Action = ActionCancel
    end
  end
  object DataSourceMain: TDataSource
    DataSet = DataSetMain
    Left = 88
    Top = 285
  end
  object DataSourceRasp: TDataSource
    DataSet = DataSetRasp
    Left = 557
    Top = 394
  end
  object DataSourceProvodka: TDataSource
    DataSet = DataSetProvodka
    Left = 557
    Top = 142
  end
  object StyleRepository: TcxStyleRepository
    Left = 8
    Top = 120
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
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clDefault
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
  object Class_StoredProc: TpFIBStoredProc
    Left = 200
    Top = 197
  end
  object DataSetSelectSystem: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    Left = 24
    Top = 37
    poSQLINT64ToBCD = True
  end
  object DataSetNastroyka: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'SELECT * FROM J4_INI')
    Left = 200
    Top = 141
    poSQLINT64ToBCD = True
    object DataSetNastroykaRAZSCHIFROVKA: TFIBSmallIntField
      FieldName = 'RAZSCHIFROVKA'
    end
    object DataSetNastroykaJ4_SMETA: TFIBBCDField
      FieldName = 'J4_SMETA'
      Size = 0
      RoundByScale = True
    end
    object DataSetNastroykaJ4_RAZDEL: TFIBBCDField
      FieldName = 'J4_RAZDEL'
      Size = 0
      RoundByScale = True
    end
    object DataSetNastroykaJ4_STATE: TFIBBCDField
      FieldName = 'J4_STATE'
      Size = 0
      RoundByScale = True
    end
    object DataSetNastroykaJ4_KEKV: TFIBBCDField
      FieldName = 'J4_KEKV'
      Size = 0
      RoundByScale = True
    end
  end
  object DataSetMain: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'SELECT * FROM J4_DT_AO_SELECT('#39'01.01.2004'#39',1,'#39'31.12.2004'#39')')
    AfterScroll = DataSetMainAfterScroll
    Left = 56
    Top = 285
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
  end
  object DataSetProvodka: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    DataSource = DataSourceMain
    Left = 520
    Top = 141
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
    object DataSetProvodkaSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetProvodkaID_SM: TFIBBCDField
      FieldName = 'ID_SM'
      Size = 0
      RoundByScale = True
    end
    object DataSetProvodkaID_RAZD: TFIBBCDField
      FieldName = 'ID_RAZD'
      Size = 0
      RoundByScale = True
    end
    object DataSetProvodkaID_ST: TFIBBCDField
      FieldName = 'ID_ST'
      Size = 0
      RoundByScale = True
    end
    object DataSetProvodkaID_KEKV: TFIBBCDField
      FieldName = 'ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object DataSetProvodkaID_DOG: TFIBBCDField
      FieldName = 'ID_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetProvodkaKOD_DOG: TFIBBCDField
      FieldName = 'KOD_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetProvodkaID_MAN: TFIBBCDField
      FieldName = 'ID_MAN'
      Size = 0
      RoundByScale = True
    end
    object DataSetProvodkaID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetProvodkaSUMMA_VALUE: TFIBBCDField
      FieldName = 'SUMMA_VALUE'
      Size = 2
      RoundByScale = True
    end
    object DataSetProvodkaID_VALUE: TFIBBCDField
      FieldName = 'ID_VALUE'
      Size = 2
      RoundByScale = True
    end
    object DataSetProvodkaSMETA_KOD: TFIBIntegerField
      FieldName = 'SMETA_KOD'
    end
    object DataSetProvodkaRAZD_NUM: TFIBIntegerField
      FieldName = 'RAZD_NUM'
    end
    object DataSetProvodkaKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object DataSetProvodkaFIO_MAN: TFIBStringField
      DisplayWidth = 150
      FieldName = 'FIO_MAN'
      Size = 62
      EmptyStrToNull = True
    end
    object DataSetProvodkaSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetProvodkaSTAT_KOD: TFIBIntegerField
      FieldName = 'STAT_KOD'
    end
    object DataSetProvodkaID_KASS_SH: TFIBBCDField
      FieldName = 'ID_KASS_SH'
      Size = 0
      RoundByScale = True
    end
    object DataSetProvodkaSCH_KASS_NUMBER: TFIBStringField
      FieldName = 'SCH_KASS_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetProvodkaDEBET: TFIBStringField
      FieldName = 'DEBET'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetProvodkaKREDIT: TFIBStringField
      FieldName = 'KREDIT'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetProvodkaALL_KOD: TFIBStringField
      FieldName = 'ALL_KOD'
      Size = 50
      EmptyStrToNull = True
    end
    object DataSetProvodkaID_ALL_PROV: TFIBBCDField
      FieldName = 'ID_ALL_PROV'
      Size = 0
      RoundByScale = True
    end
    object DataSetProvodkaTITLE_SCH: TFIBStringField
      FieldName = 'TITLE_SCH'
      Size = 80
      EmptyStrToNull = True
    end
    object DataSetProvodkaTITLE_KOR_SCH: TFIBStringField
      FieldName = 'TITLE_KOR_SCH'
      Size = 80
      EmptyStrToNull = True
    end
    object DataSetProvodkaTIN: TFIBStringField
      FieldName = 'TIN'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetProvodkaBIRTHDAY: TFIBDateField
      FieldName = 'BIRTHDAY'
    end
    object DataSetProvodkaTYPE_DOG: TFIBStringField
      FieldName = 'TYPE_DOG'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetProvodkaREG_DOG: TFIBStringField
      FieldName = 'REG_DOG'
      Size = 12
      EmptyStrToNull = True
    end
    object DataSetProvodkaMAIN: TFIBIntegerField
      FieldName = 'MAIN'
    end
    object DataSetProvodkaTITLE_SMETA: TFIBStringField
      FieldName = 'TITLE_SMETA'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetProvodkaTITLE_RZ: TFIBStringField
      FieldName = 'TITLE_RZ'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetProvodkaTITLE_STATE: TFIBStringField
      FieldName = 'TITLE_STATE'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetProvodkaTITLE_KEKV: TFIBStringField
      FieldName = 'TITLE_KEKV'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetProvodkaNAME_CUST: TFIBStringField
      FieldName = 'NAME_CUST'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetProvodkaNUM_DOG: TFIBStringField
      FieldName = 'NUM_DOG'
      EmptyStrToNull = True
    end
    object DataSetProvodkaDATE_DOG: TFIBDateField
      FieldName = 'DATE_DOG'
    end
    object DataSetProvodkaSUMMA_NEOSN: TFIBBCDField
      FieldName = 'SUMMA_NEOSN'
      Size = 2
      RoundByScale = True
    end
  end
  object DataSetRasp: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'Select * from J4_DT_AO_RASPREDELENIE_SELECT(0)')
    DataSource = DataSourceMain
    Left = 520
    Top = 394
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
    object DataSetRaspSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetRaspNUM: TFIBIntegerField
      FieldName = 'NUM'
    end
    object DataSetRaspID_SP_RASP: TFIBBCDField
      FieldName = 'ID_SP_RASP'
      Size = 0
      RoundByScale = True
    end
    object DataSetRaspNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 180
      EmptyStrToNull = True
    end
  end
  object Class_Transaction_Wr: TpFIBTransaction
    DefaultDatabase = DatabaseMain
    TimeoutAction = TARollback
    Left = 168
    Top = 221
  end
  object TransactionRead: TpFIBTransaction
    DefaultDatabase = DatabaseMain
    TimeoutAction = TARollback
    Left = 96
    Top = 221
  end
  object DatabaseMain: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA'
      'sql_role_name=')
    DefaultTransaction = TransactionRead
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 221
  end
  object AvanceMain_FormStorage: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'cxButtonFilter.Colors'
      'cxButtonFilter.Cursor'
      'cxButtonFilter.Default'
      'cxButtonFilter.DragCursor'
      'cxButtonFilter.DragKind'
      'cxButtonFilter.DragMode'
      'cxButtonFilter.Action'
      'cxButtonFilter.DropDownMenu'
      'cxButtonFilter.Enabled'
      'cxCheckBoxFrom.Checked'
      'cxCheckBoxTo.Checked'
      'cxGridRasp.BevelInner'
      'cxGridRasp.BevelKind'
      'cxGridRasp.BevelOuter'
      'cxGridRasp.BevelWidth'
      'cxGridRasp.BorderStyle'
      'cxGridRasp.BorderWidth'
      'cxGridRasp.Constraints'
      'cxGridRasp.Cursor'
      'cxGridRasp.DragCursor'
      'cxGridRasp.DragKind'
      'cxGridRasp.DragMode'
      'cxGridRasp.DragOpening'
      'cxGridRasp.DragOpeningWaitTime'
      'cxGridRasp.Enabled'
      'cxGridRasp.Font'
      'cxGridRasp.Height'
      'cxGridRasp.HelpContext'
      'cxGridRaznoskka.BevelInner'
      'cxGridRaznoskka.BevelKind'
      'cxGridRaznoskka.BevelOuter'
      'cxGridRaznoskka.BevelWidth'
      'cxGridRaznoskka.BorderStyle'
      'cxGridRaznoskka.BorderWidth'
      'Panel1.Width'
      'Panel1.Height'
      'Panel2.Height'
      'Panel2.Width'
      'Panel3.Width'
      'Panel3.Height'
      'Panel4.Height'
      'Panel4.Width'
      'ToolBar1.ButtonHeight'
      'ToolBar1.BorderWidth'
      'ToolBar1.ButtonWidth'
      'Splitter2.AutoSnap'
      'Splitter2.Align'
      'Splitter2.Left'
      'Splitter2.MinSize'
      'Splitter2.Visible'
      'cxGridMainDBTableView1DBColumn2.Properties'
      'cxGridMainDBTableView1DBColumn2.Options'
      'cxGridMainDBTableView1DBColumn1.Options'
      'cxGridMainDBTableView1DBColumn1.Properties'
      'cxGridMainDBTableView1DBColumn1.SortOrder'
      'cxGridMainDBTableView1DBColumn2.SortOrder'
      'cxGridMainDBTableView1DBColumn3.Properties'
      'cxGridMainDBTableView1DBColumn3.Options'
      'cxGridMainDBTableView1DBColumn3.SortOrder'
      'cxGridMainDBTableView1DBColumn4.Options'
      'cxGridMainDBTableView1DBColumn4.Properties'
      'cxGridMainDBTableView1DBColumn4.SortOrder'
      'cxGridMainDBTableView1DBColumn5.Options'
      'cxGridMainDBTableView1DBColumn5.Properties'
      'cxGridMainDBTableView1DBColumn5.SortOrder'
      'cxGridMainDBTableView1DBColumn6.Options'
      'cxGridMainDBTableView1DBColumn6.Properties'
      'cxGridMainDBTableView1DBColumn6.SortOrder'
      'cxGridMainDBTableView1DBColumn7.Options'
      'cxGridMainDBTableView1DBColumn7.Properties'
      'cxGridMainDBTableView1DBColumn7.SortOrder')
    StoredValues = <>
    Left = 280
    Top = 213
  end
  object DataSetSelect: TpFIBDataSet
    Left = 344
    Top = 120
    poSQLINT64ToBCD = True
  end
  object DataSetOborotMenDoc: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      
        'select distinct pk_id,date_doc, num_doc, sum_doc_db,sum_doc_kr,n' +
        'ame from J4_SELECT_OBOROT_BUH_MEN(1,1,'#39'01.06.2011'#39','#39'01.06.2011'#39')'
      'order by date_doc')
    Left = 88
    Top = 41
    poSQLINT64ToBCD = True
    object FIBDateField1: TFIBDateField
      FieldName = 'DATE_DOC'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object FIBStringField2: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 120
      EmptyStrToNull = True
    end
    object FIBStringField3: TFIBStringField
      FieldName = 'NAME'
      Size = 25
      EmptyStrToNull = True
    end
    object FIBBCDField7: TFIBBCDField
      FieldName = 'SUM_DOC_DB'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object FIBBCDField8: TFIBBCDField
      FieldName = 'SUM_DOC_KR'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenDocPK_ID: TFIBBCDField
      FieldName = 'PK_ID'
      Size = 0
      RoundByScale = True
    end
  end
  object DataSetOborotMen: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      
        'select *from J4_SELECT_OBOROT_BUH_MEN(1,1,'#39'01.06.2011'#39','#39'01.06.20' +
        '11'#39')'
      'order by date_doc')
    Left = 120
    Top = 41
    poSQLINT64ToBCD = True
    object DataSetOborotMenSUMMA_DB: TFIBBCDField
      FieldName = 'SUMMA_DB'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenSUMMA_KR: TFIBBCDField
      FieldName = 'SUMMA_KR'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenKOD_SCH: TFIBStringField
      FieldName = 'KOD_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOborotMenDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object DataSetOborotMenNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 120
      EmptyStrToNull = True
    end
    object DataSetOborotMenNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 25
      EmptyStrToNull = True
    end
    object DataSetOborotMenNUM_SCH_KOR: TFIBStringField
      FieldName = 'NUM_SCH_KOR'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOborotMenSM_KOD: TFIBIntegerField
      FieldName = 'SM_KOD'
    end
    object DataSetOborotMenRAZ_KOD: TFIBIntegerField
      FieldName = 'RAZ_KOD'
    end
    object DataSetOborotMenST_KOD: TFIBIntegerField
      FieldName = 'ST_KOD'
    end
    object DataSetOborotMenKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object DataSetOborotMenVH_DEB: TFIBBCDField
      FieldName = 'VH_DEB'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenVH_KR: TFIBBCDField
      FieldName = 'VH_KR'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenVIH_DEB: TFIBBCDField
      FieldName = 'VIH_DEB'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenVIH_KR: TFIBBCDField
      FieldName = 'VIH_KR'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenS_R_S_K: TFIBStringField
      FieldName = 'S_R_S_K'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOborotMenSUM_DOC_DB: TFIBBCDField
      FieldName = 'SUM_DOC_DB'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenSUM_DOC_KR: TFIBBCDField
      FieldName = 'SUM_DOC_KR'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenPK_ID: TFIBBCDField
      FieldName = 'PK_ID'
      Size = 0
      RoundByScale = True
    end
  end
  object DataSetOstatkiMenVh: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      
        'select* from J4_SELECT_OSTATKI_BUH_MEN(1,1,'#39'01.06.2011'#39','#39'01.06.2' +
        '011'#39')'
      'where vh=1')
    Left = 160
    Top = 41
    poSQLINT64ToBCD = True
    object DataSetOstatkiMenVhKOD_SCH: TFIBStringField
      FieldName = 'KOD_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOstatkiMenVhDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object DataSetOstatkiMenVhNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 25
      EmptyStrToNull = True
    end
    object DataSetOstatkiMenVhNUM_SCH_KOR: TFIBStringField
      FieldName = 'NUM_SCH_KOR'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOstatkiMenVhSM_KOD: TFIBIntegerField
      FieldName = 'SM_KOD'
    end
    object DataSetOstatkiMenVhRAZ_KOD: TFIBIntegerField
      FieldName = 'RAZ_KOD'
    end
    object DataSetOstatkiMenVhST_KOD: TFIBIntegerField
      FieldName = 'ST_KOD'
    end
    object DataSetOstatkiMenVhKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object DataSetOstatkiMenVhVH_SUM_DB: TFIBBCDField
      FieldName = 'VH_SUM_DB'
      Size = 2
      RoundByScale = True
    end
    object DataSetOstatkiMenVhVH_SUM_KR: TFIBBCDField
      FieldName = 'VH_SUM_KR'
      Size = 2
      RoundByScale = True
    end
    object DataSetOstatkiMenVhVIH_SUM_DB: TFIBBCDField
      FieldName = 'VIH_SUM_DB'
      Size = 2
      RoundByScale = True
    end
    object DataSetOstatkiMenVhVIH_SUM_KR: TFIBBCDField
      FieldName = 'VIH_SUM_KR'
      Size = 2
      RoundByScale = True
    end
    object DataSetOstatkiMenVhS_R_S_K: TFIBStringField
      FieldName = 'S_R_S_K'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOstatkiMenVhVH: TFIBIntegerField
      FieldName = 'VH'
    end
  end
  object DataSetOstatkiMenVih: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      
        'select *from J4_SELECT_OSTATKI_BUH_MEN(1,1,'#39'01.06.2011'#39','#39'01.06.2' +
        '011'#39')'
      'where vh=0')
    Left = 192
    Top = 41
    poSQLINT64ToBCD = True
    object DataSetOstatkiMenVihKOD_SCH: TFIBStringField
      FieldName = 'KOD_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOstatkiMenVihDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object DataSetOstatkiMenVihNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 25
      EmptyStrToNull = True
    end
    object DataSetOstatkiMenVihNUM_SCH_KOR: TFIBStringField
      FieldName = 'NUM_SCH_KOR'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOstatkiMenVihSM_KOD: TFIBIntegerField
      FieldName = 'SM_KOD'
    end
    object DataSetOstatkiMenVihRAZ_KOD: TFIBIntegerField
      FieldName = 'RAZ_KOD'
    end
    object DataSetOstatkiMenVihST_KOD: TFIBIntegerField
      FieldName = 'ST_KOD'
    end
    object DataSetOstatkiMenVihKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object DataSetOstatkiMenVihVH_SUM_DB: TFIBBCDField
      FieldName = 'VH_SUM_DB'
      Size = 2
      RoundByScale = True
    end
    object DataSetOstatkiMenVihVH_SUM_KR: TFIBBCDField
      FieldName = 'VH_SUM_KR'
      Size = 2
      RoundByScale = True
    end
    object DataSetOstatkiMenVihVIH_SUM_DB: TFIBBCDField
      FieldName = 'VIH_SUM_DB'
      Size = 2
      RoundByScale = True
    end
    object DataSetOstatkiMenVihVIH_SUM_KR: TFIBBCDField
      FieldName = 'VIH_SUM_KR'
      Size = 2
      RoundByScale = True
    end
    object DataSetOstatkiMenVihS_R_S_K: TFIBStringField
      FieldName = 'S_R_S_K'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOstatkiMenVihVH: TFIBIntegerField
      FieldName = 'VH'
    end
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40710.576530844900000000
    ReportOptions.LastChange = 40711.568789780100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      
        '  if (<mon_beg>=<mon_end>) and  (inttostr(<year_beg>)=inttostr(<' +
        'year_end>))'
      '  then'
      
        '  memo2.text := '#39#1079#1072' '#39'+ <mon_beg> + '#39' '#39' +inttostr(<year_beg>) +'#39' ' +
        #1088#1086#1082#1091#39
      
        '  else memo2.text := '#39#1079#1072' '#39'+ <mon_beg>+ '#39' '#39' +inttostr(<year_beg>)' +
        ' +'#39' '#1088#1086#1082#1091' - '#39'+'#39' '#39'+<mon_end>+ '#39' '#39' +inttostr(<year_end>) +'#39' '#1088#1086#1082#1091#39';'
      ''
      'end;'
      ''
      'procedure MasterData2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if memo'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 304
    Top = 145
    Datasets = <
      item
        DataSet = frxDBDatasetDoc
        DataSetName = 'frxDBDatasetDoc'
      end
      item
        DataSet = frxDBDatasetOstVh
        DataSetName = 'frxDBDatasetOstVh'
      end
      item
        DataSet = frxDBDatasetOstVih
        DataSetName = 'frxDBDatasetOstVih'
      end
      item
        DataSet = frxDBDatasetProv
        DataSetName = 'frxDBDatasetProv'
      end>
    Variables = <
      item
        Name = 'date_beg'
        Value = #39'01.05.2011'#39
      end
      item
        Name = 'date_end'
        Value = #39'01.06.2011'#39
      end
      item
        Name = 'tn'
        Value = #39'175458'#39
      end
      item
        Name = 'fio'
        Value = #39#1052#1054#1030#1057#1045#1028#1053#1050#1054' '#1054#1051#1068#1043#1040' '#1055#1040#1042#1051#1030#1042#1053#1040#39
      end
      item
        Name = 'inn'
        Value = #39'3225202626'#39
      end
      item
        Name = 'mon_beg'
        Value = #39#1090#1088#1072#1074#1077#1085#1100#39
      end
      item
        Name = 'mon_end'
        Value = #39#1090#1088#1072#1074#1077#1085#1100#39
      end
      item
        Name = 'year_beg'
        Value = '2011'
      end
      item
        Name = 'year_end'
        Value = '2011'
      end>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      PaperWidth = 148.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 11
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 139.842610000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 483.779840000000000000
        object Memo1: TfrxMemoView
          Top = 7.559059999999999000
          Width = 483.779840000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            
              #1055#1077#1088#1089#1086#1085#1110#1092#1110#1082#1086#1074#1072#1085#1110' '#1076#1072#1085#1110' '#1087#1088#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1080' '#1090#1072' '#1082#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1110#1102' '#1087#1110#1076#1079#1074#1110#1090#1085#1086#1111' ' +
              #1086#1089#1086#1073#1080)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 49.133889999999990000
          Width = 483.779840000000000000
          Height = 22.677180000000000000
          OnBeforePrint = 'Memo2OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1079#1072)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 71.811070000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1055#1110#1076#1079#1074#1110#1090#1085#1072' '#1086#1089#1086#1073#1072)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 117.165430000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1055#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1085#1086#1084#1077#1088)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 132.283550000000000000
          Top = 75.590599999999990000
          Width = 347.716760000000000000
          Height = 41.574830000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '<i><u>[fio]</u></i>')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 132.283550000000000000
          Top = 117.165430000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic, fsUnderline]
          Memo.Strings = (
            '[inn]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 226.771800000000000000
          Top = 117.165430000000000000
          Width = 347.716760000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            ' ('#1058#1053'  <i><u>[tn]</u></i> )')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 325.039580000000000000
        Width = 483.779840000000000000
        DataSet = frxDBDatasetDoc
        DataSetName = 'frxDBDatasetDoc'
        RowCount = 0
        Stretched = True
        object Memo8: TfrxMemoView
          Left = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetDoc."SUM_DOC_KR"]')
        end
        object Memo9: TfrxMemoView
          Left = 226.771800000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetDoc."DATE_DOC"]')
        end
        object Memo10: TfrxMemoView
          Left = 83.149660000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetDoc."NUM_DOC"]')
        end
        object Memo11: TfrxMemoView
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetDoc."NAME"]')
        end
        object Memo12: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetDoc."SUM_DOC_DB"]')
        end
      end
      object Header1: TfrxHeader
        Height = 83.149660000000000000
        Top = 219.212740000000000000
        Width = 483.779840000000000000
        object Memo13: TfrxMemoView
          Width = 483.779840000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1082#1091#1084#1077#1085#1090#1080)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Top = 22.677179999999990000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo15: TfrxMemoView
          Left = 306.141930000000000000
          Top = 22.677179999999990000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
        end
        object Memo16: TfrxMemoView
          Left = 393.071120000000000000
          Top = 22.677179999999990000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
        end
        object Memo17: TfrxMemoView
          Top = 41.574830000000020000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' [date_beg]:')
        end
        object Memo18: TfrxMemoView
          Left = 306.141930000000000000
          Top = 41.574830000000020000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetProv."VH_DEB"]')
        end
        object Memo19: TfrxMemoView
          Left = 393.071120000000000000
          Top = 41.574830000000020000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetProv."VH_KR"]')
        end
        object Memo35: TfrxMemoView
          Left = 393.071120000000000000
          Top = 64.252009999999970000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
        end
        object Memo36: TfrxMemoView
          Left = 226.771800000000000000
          Top = 64.252009999999970000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072)
        end
        object Memo37: TfrxMemoView
          Left = 83.149660000000000000
          Top = 64.252009999999970000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1086#1084#1077#1088)
        end
        object Memo38: TfrxMemoView
          Top = 64.252009999999970000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1080#1087)
        end
        object Memo39: TfrxMemoView
          Left = 306.141930000000000000
          Top = 64.252009999999970000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
        end
        object Line3: TfrxLineView
          Top = 64.252009999999970000
          Width = 480.000310000000000000
          Frame.Style = fsDouble
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object Footer1: TfrxFooter
        Height = 60.472480000000000000
        Top = 366.614410000000000000
        Width = 483.779840000000000000
        object Memo20: TfrxMemoView
          Top = 22.677180000000020000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' [date_end]:')
        end
        object Memo21: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<frxDBDatasetDoc."SUM_DOC_DB">,MasterData1)]')
        end
        object Memo22: TfrxMemoView
          Left = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<frxDBDatasetDoc."SUM_DOC_KR">,MasterData1)]')
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 56.692950000000000000
          Width = 476.220780000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
        end
        object Memo60: TfrxMemoView
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1079#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084#1080':')
        end
        object Memo61: TfrxMemoView
          Left = 306.141930000000000000
          Top = 22.677180000000020000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetProv."VIH_DEB"]')
        end
        object Memo62: TfrxMemoView
          Left = 393.071120000000000000
          Top = 22.677180000000020000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetProv."VIH_KR"]')
        end
        object Line2: TfrxLineView
          Top = 22.677180000000020000
          Width = 480.000310000000000000
          Frame.Style = fsDouble
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object Header2: TfrxHeader
        Height = 60.472480000000000000
        Top = 449.764070000000000000
        Width = 483.779840000000000000
        object Memo23: TfrxMemoView
          Width = 483.779840000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1110#1103)
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Top = 22.677180000000020000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1042#1093#1110#1076#1085#1080#1081' '#1079#1072#1083#1080#1096#1086#1082' '#1085#1072' [date_beg]:')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 143.622140000000000000
          Top = 41.574830000000020000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1073'/'#1088'/'#1089#1090'/'#1050#1045#1050#1042)
        end
        object Memo26: TfrxMemoView
          Left = 306.141930000000000000
          Top = 41.574830000000020000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
        end
        object Memo27: TfrxMemoView
          Top = 41.574830000000020000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1086#1082)
        end
        object Memo28: TfrxMemoView
          Left = 393.071120000000000000
          Top = 41.574830000000020000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 532.913730000000000000
        Width = 483.779840000000000000
        OnBeforePrint = 'MasterData2OnBeforePrint'
        DataSet = frxDBDatasetOstVh
        DataSetName = 'frxDBDatasetOstVh'
        RowCount = 0
        Stretched = True
        object Memo29: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000010000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'VH_SUM_DB'
          DataSet = frxDBDatasetOstVh
          DataSetName = 'frxDBDatasetOstVh'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetOstVh."VH_SUM_DB"]')
        end
        object Memo30: TfrxMemoView
          Left = 393.071120000000000000
          Width = 86.929190000000010000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'VH_SUM_KR'
          DataSet = frxDBDatasetOstVh
          DataSetName = 'frxDBDatasetOstVh'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetOstVh."VH_SUM_KR"]')
        end
        object Memo31: TfrxMemoView
          Left = 143.622140000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'S_R_S_K'
          DataSet = frxDBDatasetOstVh
          DataSetName = 'frxDBDatasetOstVh'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetOstVh."S_R_S_K"]')
        end
        object Memo32: TfrxMemoView
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'KOD_SCH'
          DataSet = frxDBDatasetOstVh
          DataSetName = 'frxDBDatasetOstVh'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetOstVh."KOD_SCH"]')
        end
      end
      object Footer2: TfrxFooter
        Height = 18.897650000000000000
        Top = 574.488560000000000000
        Width = 483.779840000000000000
        object Memo63: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<frxDBDatasetOstVh."VH_SUM_DB">,MasterData2)]')
        end
        object Memo64: TfrxMemoView
          Left = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<frxDBDatasetOstVh."VH_SUM_KR">,MasterData2)]')
        end
        object Memo65: TfrxMemoView
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1074#1093#1110#1076#1085#1080#1081' '#1079#1072#1083#1080#1096#1086#1082':')
        end
      end
      object Header3: TfrxHeader
        Height = 56.692950000000000000
        Top = 616.063390000000000000
        Width = 483.779840000000000000
        object Memo33: TfrxMemoView
          Left = 143.622140000000000000
          Top = 18.897650000000000000
          Width = 162.519790000000000000
          Height = 37.795300000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1073'/'#1088'/'#1089#1090'/'#1050#1045#1050#1042)
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 306.141930000000000000
          Top = 37.795300000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
        end
        object Memo40: TfrxMemoView
          Left = 393.071120000000000000
          Top = 37.795300000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
        end
        object Memo41: TfrxMemoView
          Left = 306.141930000000000000
          Top = 18.897650000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
        end
        object Memo42: TfrxMemoView
          Top = 18.897650000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1082#1080)
        end
        object Memo44: TfrxMemoView
          Top = 37.795300000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
        end
        object Memo45: TfrxMemoView
          Left = 71.811070000000000000
          Top = 37.795300000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
        end
        object Memo43: TfrxMemoView
          Left = 3.779530000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1050#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1110#1103)
          ParentFont = False
        end
      end
      object Footer3: TfrxFooter
        Height = 18.897650000000000000
        Top = 737.008350000000000000
        Width = 483.779840000000000000
        object Memo66: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<frxDBDatasetProv."SUMMA_DB">,MasterData3)]')
        end
        object Memo67: TfrxMemoView
          Left = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<frxDBDatasetProv."SUMMA_KR">,MasterData3)]')
        end
        object Memo68: TfrxMemoView
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1054#1073#1086#1088#1086#1090#1080':')
        end
      end
      object MasterData3: TfrxMasterData
        Height = 18.897650000000000000
        Top = 695.433520000000000000
        Width = 483.779840000000000000
        DataSet = frxDBDatasetProv
        DataSetName = 'frxDBDatasetProv'
        RowCount = 0
        Stretched = True
        object Memo46: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetProv."SUMMA_DB"]')
        end
        object Memo47: TfrxMemoView
          Left = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetProv."SUMMA_KR"]')
        end
        object Memo48: TfrxMemoView
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'NUM_SCH_KOR'
          DataSet = frxDBDatasetProv
          DataSetName = 'frxDBDatasetProv'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetProv."NUM_SCH_KOR"]')
        end
        object Memo49: TfrxMemoView
          Left = 71.811070000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'KOD_SCH'
          DataSet = frxDBDatasetProv
          DataSetName = 'frxDBDatasetProv'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetProv."KOD_SCH"]')
        end
        object Memo50: TfrxMemoView
          Left = 143.622140000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetProv."S_R_S_K"]')
        end
      end
      object Header4: TfrxHeader
        Height = 37.795300000000000000
        Top = 778.583180000000000000
        Width = 483.779840000000000000
        object Memo51: TfrxMemoView
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1042#1080#1093#1110#1076#1085#1080#1081' '#1079#1072#1083#1080#1096#1086#1082' '#1085#1072' [date_end]:')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 143.622140000000000000
          Top = 18.897650000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1073'/'#1088'/'#1089#1090'/'#1050#1045#1050#1042)
        end
        object Memo53: TfrxMemoView
          Left = 306.141930000000000000
          Top = 18.897650000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
        end
        object Memo54: TfrxMemoView
          Top = 18.897650000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1086#1082)
        end
        object Memo55: TfrxMemoView
          Left = 393.071120000000000000
          Top = 18.897650000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
        end
      end
      object MasterData4: TfrxMasterData
        Height = 18.897650000000000000
        Top = 839.055660000000000000
        Width = 483.779840000000000000
        DataSet = frxDBDatasetOstVih
        DataSetName = 'frxDBDatasetOstVih'
        RowCount = 0
        Stretched = True
        object Memo56: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'VIH_SUM_DB'
          DataSet = frxDBDatasetOstVih
          DataSetName = 'frxDBDatasetOstVih'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetOstVih."VIH_SUM_DB"]')
        end
        object Memo57: TfrxMemoView
          Left = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetOstVih
          DataSetName = 'frxDBDatasetOstVih'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetOstVih."VIH_SUM_KR"]')
        end
        object Memo58: TfrxMemoView
          Left = 143.622140000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'S_R_S_K'
          DataSet = frxDBDatasetOstVih
          DataSetName = 'frxDBDatasetOstVih'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetOstVih."S_R_S_K"]')
        end
        object Memo59: TfrxMemoView
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'KOD_SCH'
          DataSet = frxDBDatasetOstVih
          DataSetName = 'frxDBDatasetOstVih'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetOstVih."KOD_SCH"]')
        end
      end
      object Footer4: TfrxFooter
        Height = 18.897650000000000000
        Top = 880.630490000000000000
        Width = 483.779840000000000000
        object Memo69: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<frxDBDatasetOstVih."VIH_SUM_DB">,MasterData4)]')
        end
        object Memo70: TfrxMemoView
          Left = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<frxDBDatasetOstVih."VIH_SUM_KR">,MasterData4)]')
        end
        object Memo71: TfrxMemoView
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1074#1080#1093#1110#1076#1085#1080#1081' '#1079#1072#1083#1080#1096#1086#1082':')
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 960.000620000000000000
        Width = 483.779840000000000000
        object Memo72: TfrxMemoView
          Left = 404.409710000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1089#1090#1086#1088'. [Page#]')
        end
      end
    end
  end
  object frxDBDatasetDoc: TfrxDBDataset
    UserName = 'frxDBDatasetDoc'
    CloseDataSource = False
    DataSet = DataSetOborotMenDoc
    Left = 344
    Top = 145
  end
  object frxDBDatasetProv: TfrxDBDataset
    UserName = 'frxDBDatasetProv'
    CloseDataSource = False
    FieldAliases.Strings = (
      'SUMMA_DB=SUMMA_DB'
      'SUMMA_KR=SUMMA_KR'
      'KOD_SCH=KOD_SCH'
      'DATE_DOC=DATE_DOC'
      'NUM_DOC=NUM_DOC'
      'NAME=NAME'
      'NUM_SCH_KOR=NUM_SCH_KOR'
      'SM_KOD=SM_KOD'
      'RAZ_KOD=RAZ_KOD'
      'ST_KOD=ST_KOD'
      'KEKV_KOD=KEKV_KOD'
      'VH_DEB=VH_DEB'
      'VH_KR=VH_KR'
      'VIH_DEB=VIH_DEB'
      'VIH_KR=VIH_KR'
      'S_R_S_K=S_R_S_K'
      'SUM_DOC_DB=SUM_DOC_DB'
      'SUM_DOC_KR=SUM_DOC_KR')
    DataSet = DataSetOborotMen
    Left = 376
    Top = 145
  end
  object frxDBDatasetOstVh: TfrxDBDataset
    UserName = 'frxDBDatasetOstVh'
    CloseDataSource = False
    FieldAliases.Strings = (
      'KOD_SCH=KOD_SCH'
      'DATE_DOC=DATE_DOC'
      'NAME=NAME'
      'NUM_SCH_KOR=NUM_SCH_KOR'
      'SM_KOD=SM_KOD'
      'RAZ_KOD=RAZ_KOD'
      'ST_KOD=ST_KOD'
      'KEKV_KOD=KEKV_KOD'
      'VH_SUM_DB=VH_SUM_DB'
      'VH_SUM_KR=VH_SUM_KR'
      'VIH_SUM_DB=VIH_SUM_DB'
      'VIH_SUM_KR=VIH_SUM_KR'
      'S_R_S_K=S_R_S_K'
      'VH=VH')
    DataSet = DataSetOstatkiMenVh
    Left = 408
    Top = 145
  end
  object frxDBDatasetOstVih: TfrxDBDataset
    UserName = 'frxDBDatasetOstVih'
    CloseDataSource = False
    FieldAliases.Strings = (
      'KOD_SCH=KOD_SCH'
      'DATE_DOC=DATE_DOC'
      'NAME=NAME'
      'NUM_SCH_KOR=NUM_SCH_KOR'
      'SM_KOD=SM_KOD'
      'RAZ_KOD=RAZ_KOD'
      'ST_KOD=ST_KOD'
      'KEKV_KOD=KEKV_KOD'
      'VH_SUM_DB=VH_SUM_DB'
      'VH_SUM_KR=VH_SUM_KR'
      'VIH_SUM_DB=VIH_SUM_DB'
      'VIH_SUM_KR=VIH_SUM_KR'
      'S_R_S_K=S_R_S_K'
      'VH=VH')
    DataSet = DataSetOstatkiMenVih
    Left = 448
    Top = 145
  end
  object PopupMenuPrint: TPopupMenu
    Images = ImageList
    Left = 497
    Top = 24
    object PrintByFIO: TMenuItem
      Action = ActionPrintFio
      Visible = False
    end
    object PrintReestr: TMenuItem
      Action = ActionPrintReestr
    end
  end
  object DataSetDates: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    Left = 184
    Top = 149
    poSQLINT64ToBCD = True
  end
  object DSetIni: TpFIBDataSet
    Left = 56
    Top = 317
    poSQLINT64ToBCD = True
  end
end
