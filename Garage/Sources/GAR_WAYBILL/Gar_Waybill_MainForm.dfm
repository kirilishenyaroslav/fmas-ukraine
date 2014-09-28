object FMainWayBill: TFMainWayBill
  Left = 37
  Top = 188
  Width = 1187
  Height = 706
  Caption = #1056#1077#1077#1089#1090#1088' '#1087#1091#1090#1077#1074#1099#1093' '#1083#1080#1089#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 48
    Width = 1171
    Height = 433
    Align = alTop
    BevelInner = bvSpace
    BorderStyle = cxcbsNone
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    object cxGridDBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'FIO'
          Column = cxGridDBTableView1DBColumn13
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxGridDBTableView1FocusedRecordChanged
      Filtering.MaxDropDownCount = 20
      OptionsBehavior.IncSearch = True
      OptionsBehavior.PullFocusing = True
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.IndicatorWidth = 11
      Preview.MaxLineCount = 0
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.OnGetContentStyle = cxGridDBTableView1StylesGetContentStyle
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      object cxGridDBTableView1DBColumn16: TcxGridDBColumn
        Caption = #1060#1086#1088#1084#1072
        OnGetDisplayText = cxGridDBTableView1DBColumn16GetDisplayText
        HeaderAlignmentHorz = taCenter
        Width = 59
        DataBinding.FieldName = 'ID_FORMA_OUT'
      end
      object cxGridDBTableView1DBColumn13: TcxGridDBColumn
        Caption = #1060'. '#1048'. '#1054'.'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 196
        DataBinding.FieldName = 'FIO'
      end
      object cxGridDBTableView1DBColumn15: TcxGridDBColumn
        Caption = #1053#1072#1080#1084'. '#1072#1074#1090#1086
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 164
        DataBinding.FieldName = 'NAME_AVTO'
      end
      object cxGridDBTableView1DBColumn6: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
        PropertiesClassName = 'TcxDateEditProperties'
        HeaderAlignmentHorz = taCenter
        SortOrder = soAscending
        Width = 96
        DataBinding.FieldName = 'DATE_BEG_OUT'
      end
      object cxGridDBTableView1DBColumn7: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1082#1086#1085#1094#1072
        PropertiesClassName = 'TcxDateEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 89
        DataBinding.FieldName = 'DATE_END_OUT'
      end
      object cxGridDBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1050#1086#1083'. '#1090#1086#1087#1083'. '#1074' '#1085#1072#1095#1072#1083#1077
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 69
        DataBinding.FieldName = 'TOPL_COUNT_BEG'
      end
      object cxGridDBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1050#1086#1083'. '#1090#1086#1087#1083'. '#1074' '#1082#1086#1085#1094#1077
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 67
        DataBinding.FieldName = 'TOPL_COUNT_END'
      end
      object cxGridDBTableView1DBColumn3: TcxGridDBColumn
        Caption = #1058#1086#1087#1083'. '#1074#1099#1076#1072#1085#1086
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 68
        DataBinding.FieldName = 'TOPL_COUNT'
      end
      object cxGridDBTableView1DBColumn8: TcxGridDBColumn
        Caption = #1052#1072#1088#1082#1072' '#1090#1086#1087#1083#1080#1074#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        HeaderAlignmentHorz = taCenter
        Width = 58
        DataBinding.FieldName = 'marka_topl'
      end
      object cxGridDBTableView1DBColumn4: TcxGridDBColumn
        Caption = #1055#1086#1082'. '#1086#1076#1086#1084#1077#1090#1088#1072' '#1074' '#1085#1072#1095'.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 104
        DataBinding.FieldName = 'SPIDOMETR_BEG'
      end
      object cxGridDBTableView1DBColumn5: TcxGridDBColumn
        Caption = #1055#1086#1082'. '#1086#1076#1086#1084#1077#1090#1088#1072' '#1074' '#1082#1086#1085'.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 102
        DataBinding.FieldName = 'SPIDOMETR_END'
      end
      object cxGridDBTableView1DBColumn9: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1088#1072#1089#1095#1077#1090#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        OnGetDisplayText = cxGridDBTableView1DBColumn9GetDisplayText
        HeaderAlignmentHorz = taCenter
        Width = 99
        DataBinding.FieldName = 'CALC_METOD'
      end
      object cxGridDBTableView1DBColumn10: TcxGridDBColumn
        Caption = #1059#1095#1090#1077#1085
        Visible = False
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'CLOSE_WAYBILL'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object cxGrid2: TcxGrid
    Left = 697
    Top = 481
    Width = 474
    Height = 23
    Align = alClient
    BevelInner = bvSpace
    BorderStyle = cxcbsNone
    TabOrder = 3
    LookAndFeel.Kind = lfUltraFlat
    object cxGridDBTableView3: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'Name_Marka'
          Column = cxGridDBColumn1
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      Filtering.MaxDropDownCount = 20
      OptionsBehavior.IncSearch = True
      OptionsBehavior.PullFocusing = True
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.IndicatorWidth = 11
      Preview.MaxLineCount = 0
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
      object cxGridDBColumn1: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1085#1072#1076#1073#1072#1074#1082#1080
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        SortOrder = soAscending
        Width = 130
        DataBinding.FieldName = 'NAME'
      end
      object cxGridDBColumn3: TcxGridDBColumn
        Caption = #1042#1077#1083#1080#1095#1080#1085#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 81
        DataBinding.FieldName = 'VALUE_FACTOR'
      end
    end
    object cxGridLevel3: TcxGridLevel
      GridView = cxGridDBTableView3
    end
  end
  object cxSplitter2: TcxSplitter
    Left = 689
    Top = 481
    Width = 8
    Height = 23
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 100
    Control = cxGrid3
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 504
    Width = 1171
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 100
    AlignSplitter = salBottom
    Control = Panel1
  end
  object Panel1: TPanel
    Left = 0
    Top = 512
    Width = 1171
    Height = 136
    Align = alBottom
    TabOrder = 5
    object DBMaskEditPost: TcxDBMaskEdit
      Left = 425
      Top = 100
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object cxDBMaskEdit1: TcxDBMaskEdit
      Left = 712
      Top = 76
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object LabelPost: TcxLabel
      Left = 603
      Top = 77
      Width = 105
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 2
      Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072':'
    end
    object cxLabel1: TcxLabel
      Left = 299
      Top = 100
      Width = 123
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 3
      Caption = #1050#1086#1083#1086#1085#1072':'
    end
    object cxLabel2: TcxLabel
      Left = 878
      Top = 53
      Width = 132
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 4
      Caption = #1056#1077#1078'. '#1088#1072#1073'. '#1074#1086#1076#1080#1090'.:'
    end
    object cxDBMaskEdit3: TcxDBMaskEdit
      Left = 1014
      Top = 52
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
    object cxLabel3: TcxLabel
      Left = 603
      Top = 101
      Width = 105
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 6
      Caption = #1055#1088#1086#1089#1090#1086#1081':'
    end
    object cxDBMaskEdit2: TcxDBMaskEdit
      Left = 712
      Top = 100
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
    end
    object cxDBMaskEdit4: TcxDBMaskEdit
      Left = 712
      Top = 28
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 8
    end
    object cxDBMaskEdit5: TcxDBMaskEdit
      Left = 712
      Top = 4
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 9
    end
    object cxLabel4: TcxLabel
      Left = 603
      Top = 5
      Width = 105
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 10
      Caption = #1055#1088#1080#1094#1077#1087'1:'
    end
    object cxLabel5: TcxLabel
      Left = 603
      Top = 29
      Width = 105
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 11
      Caption = #1055#1088#1080#1094#1077#1087'2:'
    end
    object cxDBMaskEdit6: TcxDBMaskEdit
      Left = 425
      Top = 28
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 12
    end
    object cxDBMaskEdit7: TcxDBMaskEdit
      Left = 425
      Top = 4
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 13
    end
    object cxLabel6: TcxLabel
      Left = 316
      Top = 5
      Width = 105
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 14
      Caption = #1042#1088#1077#1084#1103'  '#1085#1072#1095#1072#1083#1072':'
    end
    object cxLabel7: TcxLabel
      Left = 316
      Top = 29
      Width = 105
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 15
      Caption = #1042#1088#1077#1084#1103'  '#1082#1086#1085#1094#1072':'
    end
    object cxLabel8: TcxLabel
      Left = 888
      Top = 28
      Width = 122
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 16
      Caption = #1057#1086#1087#1088#1086#1074#1086#1078#1076#1077#1085#1080#1077':'
    end
    object cxLabel9: TcxLabel
      Left = 886
      Top = 77
      Width = 122
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 17
      Caption = #1047#1072#1076#1072#1085#1080#1077' '#1074#1086#1076#1080#1090#1077#1083#1102':'
    end
    object cxDBMaskEdit8: TcxDBMaskEdit
      Left = 1014
      Top = 27
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 18
    end
    object cxDBMaskEdit9: TcxDBMaskEdit
      Left = 1014
      Top = 76
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 19
    end
    object cxLabel10: TcxLabel
      Left = 594
      Top = 53
      Width = 114
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 20
      Caption = #1055#1086#1088#1103#1076#1086#1082' '#1074#1099#1087'. '#1079#1072#1076'.:'
    end
    object cxDBMaskEdit10: TcxDBMaskEdit
      Left = 712
      Top = 52
      Width = 156
      Height = 21
      DataBinding.DataField = 'ORDER_TASK_TXT'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 21
    end
    object cxLabel11: TcxLabel
      Left = 880
      Top = 4
      Width = 130
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 22
      Caption = #1056#1077#1079'. '#1088#1072#1073'. '#1089' '#1087#1088#1080#1094#1077#1087#1086#1084':'
    end
    object cxDBMaskEdit11: TcxDBMaskEdit
      Left = 1014
      Top = 3
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 23
    end
    object cxDBMaskEdit12: TcxDBMaskEdit
      Left = 126
      Top = 4
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 24
    end
    object cxDBMaskEdit14: TcxDBMaskEdit
      Left = 126
      Top = 78
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 25
    end
    object cxDBMaskEdit15: TcxDBMaskEdit
      Left = 126
      Top = 53
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 26
    end
    object cxLabel12: TcxLabel
      Left = 18
      Top = 30
      Width = 105
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 27
      Caption = #1056#1072#1089#1093#1086#1076' '#1085#1072' 100 '#1082#1084':'
    end
    object cxLabel13: TcxLabel
      Left = 8
      Top = 79
      Width = 114
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 28
      Caption = #1056#1072#1089#1093'. '#1090#1086#1087#1083'. '#1092#1072#1082#1090#1080#1095'.:'
    end
    object cxLabel14: TcxLabel
      Left = -9
      Top = 53
      Width = 132
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 29
      Caption = #1056#1072#1089#1093'. '#1090#1086#1087#1083'. '#1087#1086' '#1085#1086#1088#1084#1077':'
    end
    object cxLabel15: TcxLabel
      Left = 1
      Top = 4
      Width = 123
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 30
      Caption = #1055#1088#1086#1073#1077#1075':'
    end
    object cxDBMaskEdit13: TcxDBMaskEdit
      Left = 126
      Top = 28
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 31
    end
    object cxLabel16: TcxLabel
      Left = 1
      Top = 103
      Width = 122
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 32
      Caption = #1042#1088#1077#1084#1103' '#1088#1072#1073'. '#1072#1074#1090#1086#1084'.'
    end
    object cxDBMaskEdit16: TcxDBMaskEdit
      Left = 126
      Top = 102
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 33
    end
    object cxLabel17: TcxLabel
      Left = 315
      Top = 53
      Width = 105
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 34
      Caption = #1057#1077#1088#1080#1103':'
    end
    object cxDBMaskEdit17: TcxDBMaskEdit
      Left = 425
      Top = 52
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 35
    end
    object cxLabel18: TcxLabel
      Left = 318
      Top = 77
      Width = 102
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 36
      Caption = #1053#1086#1084#1077#1088':'
    end
    object cxDBMaskEdit18: TcxDBMaskEdit
      Left = 425
      Top = 76
      Width = 156
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 37
    end
  end
  object dxStatusBar2: TdxStatusBar
    Left = 0
    Top = 648
    Width = 1171
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'F10 - '#1044#1086#1076#1072#1090#1080' '#1074#1080#1087#1083#1072#1090#1080
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'F2 - '#1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'Del - '#1042#1080#1076#1072#1083#1080#1090#1080' '#1075#1088#1091#1087#1091
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'F6-'#1054#1095#1080#1089#1090#1080#1090#1080
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'Esc - '#1074#1080#1093#1110#1076
      end>
    PaintStyle = stpsOffice11
    LookAndFeel.Kind = lfStandard
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object cxGrid3: TcxGrid
    Left = 0
    Top = 481
    Width = 689
    Height = 23
    Align = alLeft
    BevelInner = bvSpace
    BorderStyle = cxcbsNone
    TabOrder = 10
    TabStop = False
    LookAndFeel.Kind = lfUltraFlat
    object cxGridDBTableView2: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'Name_Marka'
          Column = cxGridDBColumn2
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      Filtering.MaxDropDownCount = 20
      OptionsBehavior.IncSearch = True
      OptionsBehavior.PullFocusing = True
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.IndicatorWidth = 11
      Preview.MaxLineCount = 0
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
      object cxGridDBColumn2: TcxGridDBColumn
        Caption = #1044#1083#1080#1085#1072
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        SortOrder = soAscending
        Width = 139
        DataBinding.FieldName = 'MILAGE'
      end
      object cxGridDBTableView2DBColumn1: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1085#1072#1076#1073#1072#1074#1082#1080
        HeaderAlignmentHorz = taCenter
        Width = 163
        DataBinding.FieldName = 'NAME_FACTOR'
      end
      object cxGridDBTableView2DBColumn2: TcxGridDBColumn
        Caption = #1042#1077#1083#1080#1095#1080#1085#1072
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 112
        DataBinding.FieldName = 'VALUE_FACTOR'
      end
      object cxGridDBTableView2DBColumn3: TcxGridDBColumn
        Caption = #1056#1072#1089#1093#1086#1076' '#1087#1086' '#1085#1086#1088#1084#1077
        HeaderAlignmentHorz = taCenter
        Width = 139
        DataBinding.FieldName = 'consumption_norma'
      end
    end
    object cxGridLevel2: TcxGridLevel
      GridView = cxGridDBTableView2
    end
  end
  object BarManager: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'CtrlBar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 34
        FloatClientHeight = 142
        ItemLinks = <
          item
            Item = dxBarButton1
            Visible = True
          end
          item
            Item = dxBarLargeBtnAdd5
            Visible = True
          end
          item
            Item = LBtnUpdate
            Visible = True
          end
          item
            Item = LBtnDeletePayment
            Visible = True
          end
          item
            Item = RefreshBtn
            Visible = True
          end
          item
            Item = dxBarLargeButton5
            Visible = True
          end
          item
            Item = dxBarLargeButton2
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end>
        Name = 'CtrlBar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clActiveBorder
    LargeIcons = True
    LookAndFeel.Kind = lfUltraFlat
    PopupMenuLinks = <>
    Style = bmsOffice11
    SunkenBorder = True
    UseSystemFont = True
    Left = 528
    Top = 96
    DockControlHeights = (
      0
      0
      48
      0)
    object DeleteBtn: TdxBarLargeButton
      Align = iaRight
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1075#1088#1091#1087#1091
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1075#1088#1091#1087#1091
      Visible = ivAlways
      ShortCut = 46
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0732DE0732DE0732DEFF00FFFF00FFFF00FF0732DE0732DE0732
        DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FF
        0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00FFFF00FFFF
        00FFFF00FFFF00FF0732DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DE07
        32DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE
        0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335
        FB0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF0732DE07
        32DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00FFFF00FF0732
        DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE
        0732DE0732DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF0732DE0732DE0335FB0732DE0335FB0732DE0732DEFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0335FB0732DEFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0335FB0732DE0732
        DE0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0335FB
        0732DE0335FB0335FB0335FB0732DE0335FBFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB03
        35FB0335FB0732DE0335FBFF00FFFF00FF0335FB0335FB0335FB0335FBFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0335FB0335FB0732DE0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB03
        35FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0335FBFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335
        FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB
        0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object AddManBtn: TdxBarLargeButton
      Align = iaRight
      Caption = #1044#1086#1076#1072#1090#1080' '#1075#1088#1091#1087#1091
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1075#1088#1091#1087#1091
      Visible = ivAlways
      ShortCut = 16429
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFA97C79B78183B78183B78183B78183B78183B78183B78183B78183B781
        83B78183B78183B78183B78183B78183B78183B78183B78183B78183FF00FFFF
        00FFFF00FFFF00FFFF00FFAE7781F3DDC4F8E3C6F6DFBFF5DCB8F4D9B2F3D7AC
        F3D4A7F2D2A0F0CF9AF0CE98F0CE98F0CE98F0CE98F0CE98F0CE98F1CF98EFCD
        97B88183FF00FFFF00FFFF00FFFF00FFFF00FFAE7782F2DEC8F7E3CAF5DFC2F4
        DCBCF3DAB6F2D7B1F1D4ABF1D2A5F0CF9FEFCD9AEECC97EECC97EECC97EECC97
        EECC97EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FFFF00FFAE7782F2E0
        CEF8E7CFF5E2C8F5DEC2F4DCBCF3DAB7F2D7B1F1D4ABF1D2A5F0CFA0EFCD9AEE
        CC97EECC97EECC97EECC97EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FF
        FF00FFAE7782F3E3D2F9E9D4F6E4CDF5E1C7F5DEC1F4DCBCF3D9B6F2D7B0F1D4
        AAF1D2A5F0CFA0EECC99EECC97EECC97EECC97EFCD97EDCB96B88183FF00FFFF
        00FFFF00FFFF00FFFF00FFAE7783F4E6D8FAECDAF8E7D3F6E4CCF5E1C7F5DFC2
        F4DCBCF3D9B6F2D7B0F1D4ABF1D2A6F0CFA0EECD9AEECC97EECC97EFCD97EDCB
        96B88183FF00FFFF00FFFF00FFFF00FFFF00FFAF7883F5E9DDFBEFE0F8EAD9F7
        E6D2F6E4CDF5E1C8F4DEC2F4DCBCF3D9B6F2D7B1F1D4ACF1D2A6F0CFA0EECC99
        EECC97EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FFFF00FFB27B85F5EC
        E3FBF2E6F9EDDEF8E9D7F7E7D2F6E4CDF5E1C7F5DFC1F4DCBBF3D9B6F2D7B1F1
        D4ABF1D2A5F0CFA0EECC99EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FF
        FF00FFB78086F7EFE8FCF5ECFAEFE4F9ECDDF8E9D8F7E7D3F6E4CDF5E1C7F5DF
        C1F4DCBCF3D9B7F1D7B0F1D4ABF0D2A5F0CF9FEFCD9AEDCA96B88183FF00FFFF
        00FFFF00FFFF00FFFF00FFBB8388F8F2EEFDF8F1FAF3EAF9EFE3F9ECDDF8E9D8
        F7E6D2F6E4CCF5E1C6F4DFC1F4DCBCF3D9B6F2D6B0F1D4AAF0D1A4F0D09FEDCB
        98B88183FF00FFFF00FFFF00FFFF00FFFF00FFBE8689FAF6F4FEFCF8FCF6F0FA
        F2EAFAF0E4F9EDDDF8E9D8F7E7D2F6E4CCF5E1C7F5DEC2F4DCBBF3D9B6F1D7B0
        F1D4AAF1D2A5EECD9EB88184FF00FFFF00FFFF00FFFF00FFFF00FFC2898AFBF8
        F7FFFFFEFEFAF6FCF5EFFAF2EAFAF0E3F9ECDDF9E9D8F8E7D2F6E4CDF5E1C7F5
        DEC1F4DCBCF3D9B6F2D7B0F2D5ABEFCFA4B98285FF00FFFF00FFFF00FFFF00FF
        FF00FFC68D8CFBF8F7FFFFFFFFFEFCFEF9F4FCF6EFFBF3EAFAEFE3F9EDDDF8E9
        D7F8E7D2F6E4CDF5E1C6F5DEC1F4DCBBF3D9B5F2D7B0F0D2A8B98386FF00FFFF
        00FFFF00FFFF00FFFF00FFCA908DFBF8F7FFFFFFFFFFFFFFFDFCFEF9F5FCF6F0
        FAF2EAFAF0E4F9ECDDF8EAD8F8E6D2F6E4CCF6E1C6F5DEC0F4DCBBF4DAB6F1D5
        AEB58286FF00FFFF00FFFF00FFFF00FFFF00FFCD938FFBF8F7FFFFFFFFFFFFFF
        FFFFFFFEFCFEF9F5FCF6EFFBF2EAFAEFE3F9ECDDF8E9D7F8E6D1F6E3CBF5E1C6
        F4DEC0F3DBBAD9C4A7A47E83FF00FFFF00FFFF00FFFF00FFFF00FFD19790FCF9
        F7FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFEF9F5FCF5EFFBF2E9FAF0E3F9ECDDF8
        E9D7F8E6D1F6E4CCEBD9C0D1C1ABB5A8979C7C81FF00FFFF00FFFF00FFFF00FF
        FF00FFD59A91FCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFDFAF5FCF6
        EFFAF2E9FAEFE2FAEDDEFBEEDBE7DBC9C8BDAFBAB0A2B7AC9DA07E83FF00FFFF
        00FFFF00FFFF00FFFF00FFDA9D93FCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFCFDF9F4FCF5EEFCF5EBEEDDD1B28176AD8076AA7F76AB7F76AB7F
        76AF7F77FF00FFFF00FFFF00FFFF00FFFF00FFDDA194FCF9F8FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFDF9F4FFFBF3E3CEC6B38176E3B585
        E5AD6AE9A654EFA039B88285FF00FFFF00FFFF00FFFF00FFFF00FFE0A395FDFA
        F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFFFEF9E5
        D1CBB38176EFC48DF3BB6DF8B450B88285FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFE0A395FDFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFE5D4D0B38176EFC38CF3BA6CB88285FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFE0A395FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DBD9B38176F1C58BB88285FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEA78CECD0BEEDD3C1EDD3C1EC
        D1C1EAD0C1E8CEC0E6CCBFE4CBBEE1C9BEDFC7BDDDC5BDCEAEA6B38176B88285
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Align = iaRight
      Caption = #1042#1099#1093#1086#1076
      Category = 0
      Hint = #1042#1099#1093#1086#1076
      Visible = ivAlways
      ShortCut = 46
      OnClick = dxBarLargeButton2Click
      AutoGrayScale = False
      LargeGlyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A66660069333400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009A6666009A66
        6600A3666600A766660069333400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF009A6666009A666600A0666600B0666700C666
        6700CC666700B366670069333400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A6666009A666600AF686900C0696A00CF696A00CE686900CD67
        6800CD676800B366670069333400AE6666009A6666009A6666009A6666009A66
        66009A6666009A6666009A6666009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A666600D26F7000D56F7000D46E6F00D36D6E00D26C6D00D16B
        6C00D06A6B00B467680069333400FEA2A300FDA8A900FCAFB000FBB6B700FABC
        BD00F9C2C200F9C5C600F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A666600D9737400D8727300D7717200D6707100D56F7000D46E
        6F00D36D6E00B6696A006933340059B2670033CB670033CB670033CB670033CB
        670033CB670033CB6700F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A666600DC767700DB757600DA747500D9737400D8727300D771
        7200D6707100B86B6B006933340059B2670033CB670033CB670033CB670033CB
        670033CB670033CB6700F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A666600DF797A00DF797A00DE787900DD777800DC767700DB75
        7600DA747500B96C6D006933340059B2670033CB670033CB670033CB670033CB
        670033CB670033CB6700F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A666600E37D7E00E27C7D00E17B7C00E07A7B00DF797A00DE78
        7900DD777800BB6E6F006933340059B2670033CB670033CB670033CB670033CB
        670033CB670033CB6700F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A666600E6808100E57F8000E47E7F00E37D7E00E27C7D00E17B
        7C00E07A7B00BD7070006933340059B2670033CB670033CB670033CB670033CB
        670033CB670033CB6700F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A666600E9838400E8828300E7818200E6808100E7878800ECA6
        A700E47E7F00BE7172006933340073B8760033CB670033CB670033CB670033CB
        670033CB670033CB6700F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A666600ED878800EC868700EB858600EA848500F2B9BA00FFFF
        FF00F0B0B000C073740069333400F2D9C000C7F0BC0079DD900079DD900060D6
        810060D6810060D68100F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A666600F08A8B00EF898A00EE888900ED878800F5BBBC00FFFF
        FF00F0AAAB00C275750069333400F2D9C000FFFFDD00FFFFDD00FFFFDD00FFFF
        DD00E2F8CC00E2F8CC00F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A666600F38D8E00F28C8D00F18B8C00F08A8B00EF898A00F3A6
        A700ED878800C376770069333400F2D9C000FFFFDD00FFFFDD00FFFFDD00FFFF
        DD00FFFFDD00FFFFDD00F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A666600F6909100F6909100F58F9000F48E8F00F38D8E00F28C
        8D00F18B8C00C578780069333400F2D9C000FFFFDD00FFFFDD00FFFFDD00FFFF
        DD00FFFFDD00FFFFDD00F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A666600FA949500F9939400F8929300F7919200F6909100F58F
        9000F48E8F00C77A7A0069333400F2D9C000FFFFDD00FFFFDD00FFFFDD00FFFF
        DD00FFFFDD00FFFFDD00F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A666600FD979800FC969700FB959600FA949500F9939400F892
        9300F7919200C87B7C0069333400F2D9C000FFFFDD00FFFFDD00FFFFDD00FFFF
        DD00FFFFDD00FFFFDD00F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A666600FF999A00FF999A00FE989900FD979800FD979800FC96
        9700FB959600CA7D7D0069333400F2D9C000FFFFDD00FFFFDD00FFFFDD00FFFF
        DD00FFFFDD00FFFFDD00F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A666600FF999A00FF999A00FF999A00FF999A00FF999A00FE98
        9900FE989900CC7F7F0069333400F2D9C000FFFFDD00FFFFDD00FFFFDD00FFFF
        DD00FFFFDD00FFFFDD00F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A666600F9969700FF999A00FF999A00FF999A00FF999A00FF99
        9A00FF999A00CD80800069333400F2D9C000FFFFDD00FFFFDD00FFFFDD00FFFF
        DD00FFFFDD00FFFFDD00F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A6666009A666600C0797A00DF898A00FF999A00FF999A00FF99
        9A00FF999A00CD80800069333400F2D9C000FFFFDD00FFFFDD00FFFFDD00FFFF
        DD00FFFFDD00FFFFDD00F9C5C6009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF009A6666009A666600A76C6D00C67C7D00F293
        9400FF999A00CD80800069333400A76666009A6666009A6666009A6666009A66
        66009A6666009A6666009A6666009A666600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009A6666009A66
        6600AD707000B373730069333400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009A66660069333400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object dxBarLargeBtnAdd5: TdxBarLargeButton
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      Visible = ivAlways
      ShortCut = 121
      OnClick = dxBarLargeBtnAdd5Click
      AutoGrayScale = False
      LargeGlyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00A97C7900B7818300B7818300B7818300B7818300B7818300B781
        8300B7818300B7818300B7818300B7818300B7818300B7818300B7818300B781
        8300B7818300B7818300B7818300B7818300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AE778100F3DDC400F8E3C600F6DFBF00F5DCB800F4D9B200F3D7
        AC00F3D4A700F2D2A000F0CF9A00F0CE9800F0CE9800F0CE9800F0CE9800F0CE
        9800F0CE9800F1CF9800EFCD9700B8818300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AE778200F2DEC800F7E3CA00F5DFC200F4DCBC00F3DAB600F2D7
        B100F1D4AB00F1D2A500F0CF9F00EFCD9A00EECC9700EECC9700EECC9700EECC
        9700EECC9700EFCD9700EDCB9600B8818300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AE778200F2E0CE00F8E7CF00F5E2C800F5DEC200F4DCBC00F3DA
        B700F2D7B100F1D4AB00F1D2A500F0CFA000EFCD9A00EECC9700EECC9700EECC
        9700EECC9700EFCD9700EDCB9600B8818300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AE778200F3E3D200F9E9D400F6E4CD00F5E1C700F5DEC100F4DC
        BC00F3D9B600F2D7B000F1D4AA00F1D2A500F0CFA000EECC9900EECC9700EECC
        9700EECC9700EFCD9700EDCB9600B8818300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AE778300F4E6D800FAECDA00F8E7D300F6E4CC00F5E1C700F5DF
        C200F4DCBC00F3D9B600F2D7B000F1D4AB00F1D2A600F0CFA000EECD9A00EECC
        9700EECC9700EFCD9700EDCB9600B8818300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AF788300F5E9DD00FBEFE000F8EAD900F7E6D200F6E4CD00F5E1
        C800F4DEC200F4DCBC00F3D9B600F2D7B100F1D4AC00F1D2A600F0CFA000EECC
        9900EECC9700EFCD9700EDCB9600B8818300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00B27B8500F5ECE300FBF2E600F9EDDE00F8E9D700F7E7D200F6E4
        CD00F5E1C700F5DFC100F4DCBB00F3D9B600F2D7B100F1D4AB00F1D2A500F0CF
        A000EECC9900EFCD9700EDCB9600B8818300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00B7808600F7EFE800FCF5EC00FAEFE400F9ECDD00F8E9D800F7E7
        D300F6E4CD00F5E1C700F5DFC100F4DCBC00F3D9B700F1D7B000F1D4AB00F0D2
        A500F0CF9F00EFCD9A00EDCA9600B8818300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BB838800F8F2EE00FDF8F100FAF3EA00F9EFE300F9ECDD00F8E9
        D800F7E6D200F6E4CC00F5E1C600F4DFC100F4DCBC00F3D9B600F2D6B000F1D4
        AA00F0D1A400F0D09F00EDCB9800B8818300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BE868900FAF6F400FEFCF800FCF6F000FAF2EA00FAF0E400F9ED
        DD00F8E9D800F7E7D200F6E4CC00F5E1C700F5DEC200F4DCBB00F3D9B600F1D7
        B000F1D4AA00F1D2A500EECD9E00B8818400FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C2898A00FBF8F700FFFFFE00FEFAF600FCF5EF00FAF2EA00FAF0
        E300F9ECDD00F9E9D800F8E7D200F6E4CD00F5E1C700F5DEC100F4DCBC00F3D9
        B600F2D7B000F2D5AB00EFCFA400B9828500FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C68D8C00FBF8F700FFFFFF00FFFEFC00FEF9F400FCF6EF00FBF3
        EA00FAEFE300F9EDDD00F8E9D700F8E7D200F6E4CD00F5E1C600F5DEC100F4DC
        BB00F3D9B500F2D7B000F0D2A800B9838600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00CA908D00FBF8F700FFFFFF00FFFFFF00FFFDFC00FEF9F500FCF6
        F000FAF2EA00FAF0E400F9ECDD00F8EAD800F8E6D200F6E4CC00F6E1C600F5DE
        C000F4DCBB00F4DAB600F1D5AE00B5828600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00CD938F00FBF8F700FFFFFF00FFFFFF00FFFFFF00FFFEFC00FEF9
        F500FCF6EF00FBF2EA00FAEFE300F9ECDD00F8E9D700F8E6D100F6E3CB00F5E1
        C600F4DEC000F3DBBA00D9C4A700A47E8300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D1979000FCF9F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
        FC00FEF9F500FCF5EF00FBF2E900FAF0E300F9ECDD00F8E9D700F8E6D100F6E4
        CC00EBD9C000D1C1AB00B5A897009C7C8100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D59A9100FCF9F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFDFC00FDFAF500FCF6EF00FAF2E900FAEFE200FAEDDE00FBEEDB00E7DB
        C900C8BDAF00BAB0A200B7AC9D00A07E8300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00DA9D9300FCF9F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFEFC00FDF9F400FCF5EE00FCF5EB00EEDDD100B2817600AD80
        7600AA7F7600AB7F7600AB7F7600AF7F7700FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00DDA19400FCF9F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFDFB00FDF9F400FFFBF300E3CEC600B3817600E3B5
        8500E5AD6A00E9A65400EFA03900B8828500FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E0A39500FDFAF800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFDFC00FFFEF900E5D1CB00B3817600EFC4
        8D00F3BB6D00F8B45000B8828500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E0A39500FDFAF800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E5D4D000B3817600EFC3
        8C00F3BA6C00B8828500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E0A39500FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9DBD900B3817600F1C5
        8B00B8828500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00DEA78C00ECD0BE00EDD3C100EDD3C100ECD1C100EAD0C100E8CE
        C000E6CCBF00E4CBBE00E1C9BE00DFC7BD00DDC5BD00CEAEA600B3817600B882
        8500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object dxBarButton1: TdxBarButton
      Category = 0
      Visible = ivAlways
    end
    object LBtnUpdate: TdxBarLargeButton
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Category = 0
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      Visible = ivAlways
      ShortCut = 113
      OnClick = LBtnUpdateClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        360D0000424D360D000000000000360400002800000018000000180000000100
        200000000000000900000000000000000000000100000000000000000000FFFF
        FF0022212300534E5700FF00FF0041353800A4676900A5686B007A494A005A35
        35008B555500804E4E0091595900965D5D008B565600734747008C5757009560
        6000AA6E6E00A96D6D00A76C6C00A66B6B008C5B5B0091606000B77A7A00B679
        7900B87B7B00BB7E7E00BA7D7D009C696900CB8C8C00CA8B8B00C98B8B00C78A
        8A00CC8E8E00DA9A9A00D9999900C2898900D99A9A00DC9D9D00E1A1A100DA9C
        9C00E2A3A300EBAAAA00E2A4A400E1A3A300643B3A00734847007B504F005D38
        360093656000E2D0CE009566600093655F009869630084544C009F675B009E6E
        6400A3726600DDC7C200FBF7F6009D6D5F00865D51007350460062443C00A775
        68009F6F6000AC796900583F3700533C3500DDC4BC0096695A00B17E6B00FFFC
        FB00BB846E00B6816C00BCA19600DAC0B600BBA19600CB917300C58C7000C089
        6F00FCF8F600FAF6F400CF8E6800D4987500CF967400F6EEE900F8F3F000AA78
        56003C383500FEF7F200ECD5C200E1CCBB003E3935006A554200F2E2D300FAEE
        E300F4EAE100B77D460066523F0064513E0065524000EFDAC500F2E6DA00FBF2
        E900FEF7F000FDF8F300EAB2730062503D00604F3D00EED4B800F0DAC200F6E3
        CE00F0DECB00F7E6D300F4E3D000F8EEE300FBF3EA00EFA75100EDB57200EAB4
        7400F2D5B100E9CCAB00F4DEC500F4E1CA00F3E0CA00F7E7D400FAEAD700F8EA
        D900F7EADA00F8EBDC008E745100E5BC8400A4865F00B29268009E835F00E1BB
        88006C594100897253006A5841008E775900DEBB8C00AA8F6B00C6A67E007764
        4C00E1C09300C1A57F00836F5600E6C79D00C9AD89008C796000EDCEA700D9BD
        9900E6CEAF00F2DABC00EAD4B600F4DEC000AC9D8A00F6E1C600F7E5CE00F6E6
        D100F8EBDA00FAEEDE00FBF2E600E1B77900EABF7F00CCA66E00E9BD7F00E7BC
        7E00E5BB7D00DEB57900DAB17700D9B17600E3BA7D00D1AB7300C09C6900A989
        5D009A7E5500E7BC8100E1B77D00C7A36F00BC996900B2916300D1AB7500826C
        4B00987D5800DAB47F00C7A474007B664800B89A6F007E694C00766347006F5D
        4300D1AF7F009D876700F0D8B700EBD8BD00FCF6ED00FCF7F000E3BA7B00FEFB
        F600FFFAEF00FFFEFB00FFFEF700FFFFFE003A494800748686003443440000BD
        FF0000B1F2004E6C760000AAEA0000A6E600009FDE000093D100097BAB001A3E
        4D000087C4000084C100028AC4000B4159000C3C5200113B4E00008CD100036A
        9D0004689A000459830005679800064F7500182A33001B506E00315065003547
        56002A34400041485500012BA700001C9D002D4FF6005270FC00021DB100031E
        B1000420B8000725DC000F2ECC001839E3000C21BF00010D9D001322BD001624
        BF0001099700010A9700050DA50000058F00000082001F1F2100FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0093655F00A467
        6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
        6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
        6900A4676900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0093655F00EED4
        B800F2DABC00F2D5B100EDCEA700E6C79D00E1C09300DEBB8C00E1BB8800E5BC
        8400E7BC8100E7BC7E00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
        7E009F6F6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0093655F00ECD5
        C200F4DEC000F0D8B700E9CCAB00D9BD9900C9AD8900C1A57F00C6A67E00D1AF
        7F00DAB47F00E1B77D00E3BA7D00E7BC7E00E9BD7F00E9BD7F00EABF7F00E7BC
        7E009F6F6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0093655F00EFDA
        C500F6E1C600F2DABC00E6CEAF00222123003E3935008C7960009D876700AA8F
        6B00B89A6F00C7A47400D1AB7500DEB57900E5BB7D00E7BC7E00EABF7F00E7BC
        7E009F6F6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0093656000F0DE
        CB00F7E5CE00F4DEC500EAD4B6003C3835001F1F2100182A330034434400836F
        56008E7759009E835F00B2926800C7A36F00D9B17600E3BA7D00E7BC7E00E7BC
        7E009F6F6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0095666000F2E2
        D300FAEAD700F6E3CE00F0DAC200AC9D8A00113B4E0004689A00064F75000C3C
        52003A49480077644C0089725300A4865F00BC996900D1AB7300E1B77900E3BA
        7B009F6F6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0098696300F2E6
        DA00FAEEDE00F7E7D400F4E1CA00EBD8BD001A3E4D00036A9D00056798001B50
        6E002A344000413538006A5542007E694C00987D5800B2916300CCA66E00DAB1
        77009D6D5F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009E6E6400F4EA
        E100FBF2E600F8EBDC00F7E6D300F3E0CA007486860004598300315065009560
        6000AA6E6E00965D5D00643B3A0065524000766347008E745100A9895D00C09C
        690096695A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A3726600F6EE
        E900FCF6ED00F8EEE300F7EADA00F7E6D300F0DECB000B4159008C5B5B00CC8E
        8E00BB7E7E00AA6E6E00965D5D00643B3A0064513E006F5D4300826C4B009A7E
        5500865D5100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A7756800F8F3
        F000FEFBF600FBF3EA00F8EEE300F8EBDC00F6E6D1004E6C76009C696900DC9D
        9D00CB8C8C00BA7D7D00A96D6D00915959005A35350062503D006A5841007B66
        480073504600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AC796900FAF6
        F400FFFFFE00FDF8F300FBF2E900F8EEE300F8EBDA00F4E3D0007B504F00E2A4
        A400DC9D9D00CB8C8C00BA7D7D00A96D6D008C5757005A353500604F3D006C59
        410062443C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B17E6B00FAF6
        F400FFFFFF00FFFEFB00FEF7F000FBF3EA00FAEEE300F8EAD900E1CCBB007B50
        4F00E2A3A300DC9D9D00CA8B8B00B87B7B00A76C6C008B5656005A3535006652
        3F00583F3700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B6816C00FAF6
        F400FFFFFF00FFFFFF00FFFCFB00FEF7F200FBF3EA00F8EEE300F8EBDC00E1CC
        BB0073484700E1A3A300DA9C9C00C98B8B00B87B7B00A76C6C008B5656005D38
        3600533C3500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BB846E00FAF6
        F400FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF3EA00FAEEE300F8EA
        D900BBA1960073484700E1A1A100DA9A9A00C98B8B00B77A7A00A66B6B008B55
        55005A353500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C0896F00FAF6
        F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2E900FAEE
        E300F8EBDA00BBA1960073484700E1A1A100D99A9A00C78A8A00B77A7A00A66B
        6B008B5555005A353500FF00FF00FF00FF00FF00FF00FF00FF00C58C7000FAF6
        F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FDF8F300FBF3
        EA00F8EEE300F8EAD900BCA1960091606000EBAAAA00D9999900C78A8A00B679
        7900804E4E004148550035475600FF00FF00FF00FF00FF00FF00CB917300FAF6
        F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7
        F000FBF2E900FBF2E600ECD5C20084544C0091606000EBAAAA00D9999900534E
        5700028AC40000AAEA0000A6E6000087C400FF00FF00FF00FF00CF967400FBF7
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
        FB00FCF7F000FFFAEF00DAC0B6009F675B00AA78560091606000C2898900097B
        AB0000BDFF0000BDFF0000A6E600001C9D0000008200FF00FF00D4987500FCF8
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFCFB00FFFEF700DDC4BC009F675B00EAB47400B77D460073474700009F
        DE0000BDFF00008CD100001C9D00010D9D00010A970000008200D4987500FCF8
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00DDC7C2009F675B00EAB27300EFA751007A494A000093
        D10000B1F200012BA7000725DC000420B800021DB100010A9700D4987500FFFF
        FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E2D0CE009F675B00EDB57200A5686B00FF00FF00FF00
        FF000084C1000C21BF002D4FF6000F2ECC00031EB10000058F00CF8E6800CF8E
        6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
        6800CF8E6800CF8E6800CF8E68009F675B00A5686B00FF00FF00FF00FF00FF00
        FF00FF00FF001624BF005270FC001839E30001099700FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF001322BD00050DA500FF00FF00FF00FF00}
    end
    object LBtnDeletePayment: TdxBarLargeButton
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Category = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Visible = ivAlways
      ShortCut = 46
      OnClick = LBtnDeletePaymentClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000732DE000732DE00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000732DE000732DE000732DE00FF00FF00FF00FF00FF00
        FF000732DE000732DE000732DE00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000732DE000732DE000732DE00FF00FF00FF00FF00FF00FF00FF00
        FF000732DE000732DE000732DE000732DE00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000732
        DE000732DE000732DE000732DE00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000732DE000732DE000732DE000732DE000732DE00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000732DE000732
        DE000732DE000732DE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000732DE000732DE000732DE000732DE000732DE00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000732DE000732DE000732
        DE000732DE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000335FB000732DE000732DE000732DE000732DE00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000732DE000732DE000732DE000732
        DE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000732DE000732DE000732DE000732
        DE00FF00FF00FF00FF000732DE000732DE000732DE000732DE000732DE00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000732DE000732DE000732
        DE000732DE000732DE000732DE000732DE000732DE000732DE00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000732DE000732
        DE000335FB000732DE000335FB000732DE000732DE00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000732
        DE000732DE000732DE000335FB000732DE00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000732DE000732
        DE000335FB000732DE000732DE000335FB000335FB00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000732DE000732DE000335
        FB000732DE000335FB000335FB000335FB000732DE000335FB00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000335FB000335FB000335FB000732
        DE000335FB00FF00FF00FF00FF000335FB000335FB000335FB000335FB00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000335FB000335FB000732DE000335FB000335
        FB00FF00FF00FF00FF00FF00FF00FF00FF000335FB000335FB000335FB000335
        FB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000335FB000335FB000335FB000335FB000335FB00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000335FB000335
        FB000335FB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000335FB000335FB000335FB000335FB000335FB00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000335
        FB000335FB000335FB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000335FB000335FB000335FB000335FB000335FB00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000335FB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000335
        FB000335FB000335FB000335FB000335FB00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000335
        FB000335FB000335FB000335FB00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000335
        FB000335FB000335FB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object BtnSave: TdxBarLargeButton
      Align = iaRight
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Category = 0
      Hint = #1042#1099#1073#1088#1072#1090#1100
      Visible = ivNever
      AllowAllUp = True
      AutoGrayScale = False
      LargeGlyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000118C1F00004B
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000138F230007931000169C
        2800004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00004B0000159127000FA01D000B9916000896
        1100159A2700004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00004B00000F811C001AAF310014A727000FA11F000C9A
        18000896120013992500004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00004B00000E7D1A0028C0480021B83D001BB0330013902400004B
        0000169D29000997130013982300004B0000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00004B00000C77170035CF5E002FC9540028C149001B9F3100004B0000FF00
        FF00004B00000D9E1B000997140011972200004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00004B00003FD96F003BD7680036D0600020AA3B00004B0000FF00FF00FF00
        FF00FF00FF00004B0000097411000A99150011962000004B0000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00004B00001C9C340041DC700023AD4100004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00004B00000B99160010951F00004B0000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00004B00002EC15200004B0000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00004B00000C9A180009961200004B
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000046408000996
        1300004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B
        000007740E00004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00004B0000035E0600004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00004B0000004B0000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Category = 0
      Enabled = False
      Visible = ivAlways
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Category = 0
      Enabled = False
      Visible = ivAlways
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Category = 0
      Enabled = False
      Visible = ivAlways
    end
    object dxBarLargeButton6: TdxBarLargeButton
      Category = 0
      Enabled = False
      Visible = ivAlways
      AutoGrayScale = False
      LargeGlyph.Data = {
        36110000424D3611000000000000360800002800000018000000180000000100
        2000000000000009000000000000000000000001000000000000FF00FF00004B
        0000004E000000580000005E0000015D0400055E080000620000006600000260
        050001690200006F000004640A0005670D00076A0F0000730000007600000376
        08000C731500760376000A4A52000D5862000D5A6400C47B0000FF7E00000081
        0000018603000289060003810800048E0A0005910E00078612000A8C1B001080
        1E0007961300099816000A9A19000C9D1D00149110001488230019932B001C9A
        3100189D33001E9E34000DA021000EA324000FA4280010A5280011A72C001CA9
        2F0013AB300015AD35001DA5390016B0390018B23D0020A5390019B641001BB8
        45001CB845001DBB49001FBF4D0023AC400032A54B0028B4450027B548002EBB
        550028CC4F0021C2500023C5530026C9560029CD5A0033CC580034CC59002FD7
        51002FD850002DD35E002FD7620031D9640034DD670036E16A003BE76F003EEB
        730041EF760045F67B0045F67F0047F87E00DAAB1F00E0B73B00E0B83B00E2AB
        6F00E3C15200E5C65B00E7C96600FC00FC00FF78FF0000A6BD0045F6800049FB
        80004BFE820000B1CA0000C4E00000C9E30000CCE90000D7F40054E6F7007FFA
        F800EDD78A00EFDC9800F6E9BD00FA95FA0081FFFE00F8F2D400FFFFFF000000
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
        0000000000000000000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00004B0000004B0000004B0000004B0000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015D
        040028CC4F0045F680002FD7510000810000004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015D
        040028CC4F0045F680002FD7510000810000004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015D
        040028CC4F0045F680002FD7510000810000004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015D
        040028CC4F0045F67F002FD7510000810000004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015D
        040028CC4F0045F680002FD7510000810000004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015D
        040032A54B002EBB55001CA92F0014911000004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015D0400189D
        330023C5530019B6410011A72C000A9A190003810800004B0000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015D04001DA539002DD3
        5E0023C5530018B23D0011A72C00099816000289060000760000004B0000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00015D040023AC400036E16A0029CD
        5A001FBF4D0018B23D000DA0210007961300028906000081000000760000004B
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00015D040028B4450041EF760034DD670029CD
        5A001FBF4D0013AB30000DA0210005910E000081000000810000008100000076
        0000004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00015D040028B4450049FB80003EEB730034DD670023C5
        530019B6410013AB30000A9A1900079613000081000000810000008100000081
        000000760000004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00015D040028B4450049FB800047F87E003BE76F002FD7620023C5
        530019B6410011A72C000A9A1900048E0A000081000000810000008100000081
        00000081000000760000004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00015D0400189D330034CC5900189D3300189D330010801E00076A0F000567
        0D0005670D00015D0400015D0400015D0400015D0400015D0400015D04000066
        0000006600000076000000760000004B0000FF00FF00FF00FF00FF00FF00015D
        0400004B0000004B0000015D0400015D04000169020000760000078612000A8C
        1B0081FFFE0000CCE90000B1CA0000A6BD000A4A520028B4450020A53900189D
        3300148823000C731500004B0000004B0000004B0000FF00FF00015D0400015D
        04000076000000760000C47B0000C47B0000C47B0000C47B00000A9A190011A7
        2C0013AB300081FFFE0000C9E30000C4E00000C9E3000D58620045F67F0049FB
        800049FB800049FB800049FB800034CC5900055E0800004B0000FF00FF00015D
        040000660000C47B0000E5C65B00E3C15200E0B83B00DAAB1F00C47B000011A7
        2C0013AB300019B6410081FFFE0000D7F40000D7F40000D7F4000D58620034CC
        590020A5390019932B00FF78FF00004B0000004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00E2AB6F00EFDC9800EDD78A00E7C96600E0B83B00C47B0000004B
        0000004B0000004B0000004B000081FFFE0000D7F4000D586200004B0000004B
        0000004B0000FF78FF00FF78FF0076037600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E2AB6F00F8F2D400F6E9BD00EDD78A00E3C15200C47B0000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0054E6F700FF00FF00FF00FF00FF00
        FF00FA95FA00FF78FF00FC00FC007603760076037600FF00FF00FF00FF00FF00
        FF00FF00FF00E2AB6F00FFFFFF00F8F2D400EFDC9800E5C65B00FF7E0000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FA95
        FA00FA95FA00FC00FC00FC00FC00FC00FC007603760076037600FF00FF00FF00
        FF00FF00FF00FF00FF00E2AB6F00E2AB6F00E2AB6F00E2AB6F00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FA95FA00FA95FA00FC00FC007603760076037600FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FA95FA00FF78FF0076037600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF78FF00FF00FF00FF00FF00FF00FF00}
    end
    object dxBarLargeButton7: TdxBarLargeButton
      Category = 0
      Enabled = False
      Visible = ivAlways
    end
    object dxBarLargeButton8: TdxBarLargeButton
      Category = 0
      Enabled = False
      Visible = ivAlways
    end
    object dxBarLargeButton9: TdxBarLargeButton
      Category = 0
      Enabled = False
      Visible = ivAlways
    end
    object RefreshBtn: TdxBarLargeButton
      Action = ActionUpate
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Category = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      AutoGrayScale = False
      LargeGlyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF0092635D00A4676900A4676900A4676900A4676900A4676900A467
        6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
        6900A4676900A4676900A4676900A4676900FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0093655E00EFD3B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB
        9700EFC79100EEC58900EBC18200EBC08000EBC08000EBC08000EBC08000EBC0
        8000EBC08000EDC18000EABF7F009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0093655F00EED4B800F4DABB00F2D5B100F0D1AA00A5BB7000E0C7
        9300DEC48C00EDC58F00EBC18800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD
        7F00E9BD7F00EABF7F00E7BC7E009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0093655F00EED7C000F6E0C100F2D9B800F2D4B100C0C588000082
        0100E0C7930052A035002592170025911600519D2E00B2B26200DABB7700E9BD
        7F00E9BD7F00EABF7F00E7BC7E009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0093655F00EFDAC500F7E2C700F3DCBF00F2D8B700E3D0A5000082
        01000686050000820100008201000082010000820100008201007AA64300DABB
        7700E9BD7F00EABF7F00E7BC7E009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0093656000F0DECC00F8E6CF00F6E0C600F3DCBD00E3D4AC000082
        010000820100008201000082010000820100008201000082010000820100AFB1
        5F00E9BD7F00EABF7F00E7BC7E009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0095666000F2E2D300FAEAD700F6E3CE00F4DEC500E5D8B2000082
        0100008201000082010026931B00B2BC7600B1BA7200529F3300008201002490
        1500E9BD7F00EABF7F00E7BC7E009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0098696300F2E6DA00FAEEDE00F7E7D400F6E2CB00E5DAB8000082
        010000820100008201001C901400E1CA9900E0C79300DEC48C0090AF57000686
        0400E9BD8100EABF7F00E7BC7E009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009E6E6400F4EAE100FBF2E600F8EADC00F7E6D300E6DDC0000082
        010000820100008201000082010000820100E1CA9A00EDCB9C00EDC79600EBC5
        8F005FC06500EABF8200E7BB7E009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A3726600F6EEE900FCF6ED00F8EFE300F7EADA00E7E1C600E6DD
        C000E5D9B800E5D8B200E3D4AB00E2D1A500E2CE9F00EFCEA300EECA9C00EDC7
        95005FC06500EBC28800E7BC80009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A7756800F8F3F000FEFBF600FBF3EB005FC06500F8EBDC00F7E7
        D300F6E2CC00E5DAB800E5D8B200E3D4AC00E3D0A600E2CE9E00E1CA9900DEC7
        9200EDC79500EDC58F00E9BF87009F6F6200FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AC796900FAF6F400FFFFFE00FEF8F3005FC06500F8EEE300F8EB
        DA00F7E6D300E7DDC0000082010000820100008201000082010000820100E1CA
        9900EECB9C00EEC99600EAC18E00A0706300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00B17E6B00FAF6F400FFFFFF00FFFEFB00FEF7F0000688060098CB
        8B00E9E5CC00E7E2C600E6DDBF001C921700008201000082010000820100E2CE
        9E00EFCEA100EECB9C00EBC59200A0726400FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00B6816C00FAF6F400FFFFFF00FFFFFF00FFFCFB00289D27000082
        010056B04F00BAD5A500BAD19E0027982100008201000082010000820100E3D0
        A400F0D1A900F0CFA300EDC999009D706500FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BB846E00FAF6F400FFFFFF00FFFFFF00FFFFFF00BFE3BC000082
        010000820100008201000082010000820100008201000082010000820100E3D4
        AB00F0D4AF00EFD0A700CEB49100896A6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C0896F00FBF7F400FFFFFF00FFFFFF00FFFFFF00EFF8EF0087CC
        840000820100008201000082010000820100008201000687060000820100E5D8
        B200E5CEAF00C4B09600A1927F0080676200FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C58C7000FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF8
        EF00C4E5C10057B55400289C2500279A240056AF4C00E9E2C70000820100B2C4
        9500B8AB9A00A79C8B00A497860084696400FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00CB917300FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFEFB00FCF7F000FBF2E900FBF2E500DACFB70095685600696C
        400095655B0096655B0096655B0098685900FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00CF967400FBF7F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFCFA00FCF7F000FFFAEF00DAC0B6009F675B00DAA1
        6B00DD984F00E2903A00EA892300A5686B00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D4987500FCF8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FFFEF700DDC4BC009F675B00EAB4
        7400EFA95200F6A03600A5686B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D4987500FCF8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDC7C2009F675B00EAB2
        7300EFA75100A5686B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D4987500FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2D0CE009F675B00EDB5
        7200A5686B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
        6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E68009F675B00A568
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object dxBarLargeButton5: TdxBarLargeButton
      Caption = #1060#1080#1083#1100#1090#1088
      Category = 0
      Hint = #1060#1080#1083#1100#1090#1088
      Visible = ivAlways
      ShortCut = 118
      OnClick = dxBarLargeButton5Click
      AutoGrayScale = False
      LargeGlyph.Data = {
        360D0000424D360D000000000000360400002800000018000000180000000100
        2000000000000009000000000000000000000001000000000000FF00FF00004B
        0000004E000000580000005E0000015D0400055E080000620000006600000260
        050001690200006F000004640A0005670D00076A0F0000730000007600000376
        08000C731500760376000A4A52000D5862000D5A6400C47B0000FF7E00000081
        0000018603000289060003810800048E0A0005910E00078612000A8C1B001080
        1E0007961300099816000A9A19000C9D1D00149110001488230019932B001C9A
        3100189D33001E9E34000DA021000EA324000FA4280010A5280011A72C001CA9
        2F0013AB300015AD35001DA5390016B0390018B23D0020A5390019B641001BB8
        45001CB845001DBB49001FBF4D0023AC400032A54B0028B4450027B548002EBB
        550028CC4F0021C2500023C5530026C9560029CD5A0033CC580034CC59002FD7
        51002FD850002DD35E002FD7620031D9640034DD670036E16A003BE76F003EEB
        730041EF760045F67B0045F67F0047F87E00DAAB1F00E0B73B00E0B83B00E2AB
        6F00E3C15200E5C65B00E7C96600FC00FC00FF78FF0000A6BD0045F6800049FB
        80004BFE820000B1CA0000C4E00000C9E30000CCE90000D7F40054E6F7007FFA
        F800EDD78A00EFDC9800F6E9BD00FA95FA0081FFFE00F8F2D400FFFFFF000000
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
        0000000000000000000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00004B0000004B0000004B0000004B0000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015D
        040028CC4F0045F680002FD7510000810000004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015D
        040028CC4F0045F680002FD7510000810000004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015D
        040028CC4F0045F680002FD7510000810000004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015D
        040028CC4F0045F67F002FD7510000810000004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015D
        040028CC4F0045F680002FD7510000810000004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015D
        040032A54B002EBB55001CA92F0014911000004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015D0400189D
        330023C5530019B6410011A72C000A9A190003810800004B0000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015D04001DA539002DD3
        5E0023C5530018B23D0011A72C00099816000289060000760000004B0000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00015D040023AC400036E16A0029CD
        5A001FBF4D0018B23D000DA0210007961300028906000081000000760000004B
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00015D040028B4450041EF760034DD670029CD
        5A001FBF4D0013AB30000DA0210005910E000081000000810000008100000076
        0000004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00015D040028B4450049FB80003EEB730034DD670023C5
        530019B6410013AB30000A9A1900079613000081000000810000008100000081
        000000760000004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00015D040028B4450049FB800047F87E003BE76F002FD7620023C5
        530019B6410011A72C000A9A1900048E0A000081000000810000008100000081
        00000081000000760000004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00015D0400189D330034CC5900189D3300189D330010801E00076A0F000567
        0D0005670D00015D0400015D0400015D0400015D0400015D0400015D04000066
        0000006600000076000000760000004B0000FF00FF00FF00FF00FF00FF00015D
        0400004B0000004B0000015D0400015D04000169020000760000078612000A8C
        1B0081FFFE0000CCE90000B1CA0000A6BD000A4A520028B4450020A53900189D
        3300148823000C731500004B0000004B0000004B0000FF00FF00015D0400015D
        04000076000000760000C47B0000C47B0000C47B0000C47B00000A9A190011A7
        2C0013AB300081FFFE0000C9E30000C4E00000C9E3000D58620045F67F0049FB
        800049FB800049FB800049FB800034CC5900055E0800004B0000FF00FF00015D
        040000660000C47B0000E5C65B00E3C15200E0B83B00DAAB1F00C47B000011A7
        2C0013AB300019B6410081FFFE0000D7F40000D7F40000D7F4000D58620034CC
        590020A5390019932B00FF78FF00004B0000004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00E2AB6F00EFDC9800EDD78A00E7C96600E0B83B00C47B0000004B
        0000004B0000004B0000004B000081FFFE0000D7F4000D586200004B0000004B
        0000004B0000FF78FF00FF78FF0076037600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E2AB6F00F8F2D400F6E9BD00EDD78A00E3C15200C47B0000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0054E6F700FF00FF00FF00FF00FF00
        FF00FA95FA00FF78FF00FC00FC007603760076037600FF00FF00FF00FF00FF00
        FF00FF00FF00E2AB6F00FFFFFF00F8F2D400EFDC9800E5C65B00FF7E0000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FA95
        FA00FA95FA00FC00FC00FC00FC00FC00FC007603760076037600FF00FF00FF00
        FF00FF00FF00FF00FF00E2AB6F00E2AB6F00E2AB6F00E2AB6F00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FA95FA00FA95FA00FC00FC007603760076037600FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FA95FA00FF78FF0076037600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF78FF00FF00FF00FF00FF00FF00FF00}
    end
    object dxBarGroup1: TdxBarGroup
      Items = (
        'DeleteBtn'
        'AddManBtn')
    end
  end
  object ActionList1: TActionList
    Left = 240
    Top = 117
    object ActionUpate: TAction
      Caption = 'ActionUpate'
      ShortCut = 116
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
      OnExecute = ActionUpateExecute
    end
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 49220
      OnExecute = Action1Execute
    end
  end
  object Styles: TcxStyleRepository
    Left = 440
    Top = 24
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clGradientActiveCaption
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Color = clGradientActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWindowText
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = clActiveCaption
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
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
      Font.Style = [fsBold]
      TextColor = clGreen
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clTeal
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 8535838
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
    object GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle18
      Styles.ContentEven = cxStyle19
      Styles.ContentOdd = cxStyle20
      Styles.Inactive = cxStyle26
      Styles.IncSearch = cxStyle27
      Styles.Selection = cxStyle30
      Styles.FilterBox = cxStyle21
      Styles.Footer = cxStyle22
      Styles.Group = cxStyle23
      Styles.GroupByBox = cxStyle24
      Styles.Header = cxStyle25
      Styles.Indicator = cxStyle28
      Styles.Preview = cxStyle29
      Styles.BandBackground = cxStyle16
      Styles.BandHeader = cxStyle17
      BuiltIn = True
    end
  end
end
