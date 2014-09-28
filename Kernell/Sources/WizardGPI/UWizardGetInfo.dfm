object frmGetData: TfrmGetData
  Left = 310
  Top = 173
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1052#1072#1089#1090#1077#1088' '#1074#1099#1073#1086#1088#1072' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1076#1083#1103' '#1087#1088#1086#1074#1086#1076#1082#1080
  ClientHeight = 473
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object cxGrid1: TcxGrid
    Left = 0
    Top = 246
    Width = 671
    Height = 186
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      DataController.DataSource = ObjectsDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      Styles.IncSearch = cxStyle2
      Styles.Header = cxStyle3
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1073#1102#1076#1078#1077#1090#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortOrder = soAscending
        Width = 120
        DataBinding.FieldName = 'SMETA_KOD'
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1073#1102#1076#1078#1077#1090#1072
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 299
        DataBinding.FieldName = 'SMETA_TITLE'
      end
      object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1073#1102#1076#1078#1077#1090#1072
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 246
        DataBinding.FieldName = 'GROUP_TITLE'
      end
    end
    object cxGrid1DBTableView2: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView2DblClick
      DataController.DataSource = ObjectsDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      Styles.IncSearch = cxStyle2
      Styles.Header = cxStyle3
      object cxGrid1DBTableView2DBColumn1: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortOrder = soAscending
        Width = 218
        DataBinding.FieldName = 'OBJECT_NUM'
      end
      object cxGrid1DBTableView2DBColumn2: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 438
        DataBinding.FieldName = 'OBJECT_TITLE'
      end
    end
    object cxGrid1DBTableView3: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView3DblClick
      DataController.DataSource = ObjectsDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      object cxGrid1DBTableView3DBColumn1: TcxGridDBColumn
      end
      object cxGrid1DBTableView3DBColumn2: TcxGridDBColumn
      end
      object cxGrid1DBTableView3DBColumn3: TcxGridDBColumn
      end
      object cxGrid1DBTableView3DBColumn4: TcxGridDBColumn
      end
      object cxGrid1DBTableView3DBColumn5: TcxGridDBColumn
      end
    end
    object cxGrid1DBTableView4: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView4DblClick
      DataController.DataSource = ObjectsDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      Styles.Header = cxStyle3
      object cxGrid1DBTableView4DBColumn1: TcxGridDBColumn
        Options.Filtering = False
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE1_CHAR'
      end
      object cxGrid1DBTableView4DBColumn2: TcxGridDBColumn
        Options.Filtering = False
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE2_CHAR'
      end
      object cxGrid1DBTableView4DBColumn3: TcxGridDBColumn
        Options.Filtering = False
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE3_CHAR'
      end
      object cxGrid1DBTableView4DBColumn4: TcxGridDBColumn
        Options.Filtering = False
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE4_CHAR'
      end
      object cxGrid1DBTableView4DBColumn5: TcxGridDBColumn
        Options.Filtering = False
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE5_CHAR'
      end
      object cxGrid1DBTableView4DBColumn6: TcxGridDBColumn
        Options.Filtering = False
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE6_CHAR'
      end
      object cxGrid1DBTableView4DBColumn7: TcxGridDBColumn
        Options.Filtering = False
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE7_CHAR'
      end
      object cxGrid1DBTableView4DBColumn8: TcxGridDBColumn
        Options.Filtering = False
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE8_CHAR'
      end
      object cxGrid1DBTableView4DBColumn9: TcxGridDBColumn
        Options.Filtering = False
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE9_CHAR'
      end
      object cxGrid1DBTableView4DBColumn10: TcxGridDBColumn
        Options.Filtering = False
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE10_CHAR'
      end
    end
    object FacedProvsView: TcxGridDBTableView
      DataController.DataSource = ObjectsDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      Styles.Header = cxStyle3
      object FacedProvsViewDBColumn1: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 139
        DataBinding.FieldName = 'DOC_DATE'
      end
      object FacedProvsViewDBColumn2: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 155
        DataBinding.FieldName = 'DOC_NUM'
      end
      object FacedProvsViewDBColumn3: TcxGridDBColumn
        Caption = #1057#1091#1084#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 143
        DataBinding.FieldName = 'SUMMA_PROV'
      end
      object FacedProvsViewDBColumn4: TcxGridDBColumn
        Caption = #1057#1091#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 148
        DataBinding.FieldName = 'SUMMA_DOC'
      end
      object FacedProvsViewDBColumn5: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 124
        DataBinding.FieldName = 'ID_DOC_TYPE_V'
      end
      object FacedProvsViewDBColumn6: TcxGridDBColumn
        Caption = #1050#1086#1084#1077#1085#1090#1072#1088
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 104
        DataBinding.FieldName = 'COMMENT'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
      Visible = False
    end
    object cxGrid1Level2: TcxGridLevel
      GridView = cxGrid1DBTableView2
      Visible = False
    end
    object cxGrid1Level3: TcxGridLevel
      GridView = cxGrid1DBTableView4
      Visible = False
    end
    object FacedLevel: TcxGridLevel
      GridView = FacedProvsView
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 432
    Width = 671
    Height = 41
    Align = alBottom
    TabOrder = 1
    object OKButton: TcxButton
      Left = 306
      Top = 8
      Width = 97
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 0
      OnClick = OKButtonClick
    end
    object BackButton: TcxButton
      Left = 202
      Top = 8
      Width = 98
      Height = 25
      Caption = #1053#1072#1079#1072#1076
      TabOrder = 1
      OnClick = BackButtonClick
      DropDownMenu = PopupMenu1
    end
    object CloseButton: TcxButton
      Left = 408
      Top = 8
      Width = 257
      Height = 25
      Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100' '#1088#1072#1073#1086#1090#1091
      TabOrder = 2
      OnClick = CloseButtonClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 223
    Width = 671
    Height = 23
    Align = alTop
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1073#1102#1076#1078#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object InfoPanel: TPanel
    Left = 0
    Top = 0
    Width = 671
    Height = 223
    Align = alTop
    TabOrder = 3
    object Bevel1: TBevel
      Left = 8
      Top = 31
      Width = 322
      Height = 187
    end
    object Bevel2: TBevel
      Left = 337
      Top = 31
      Width = 326
      Height = 186
    end
    object lbDBtitle: TLabel
      Left = 137
      Top = 13
      Width = 46
      Height = 16
      Caption = #1044#1077#1073#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSchDb: TLabel
      Left = 15
      Top = 37
      Width = 112
      Height = 16
      Caption = #1057#1095#1077#1090' '#1073#1072#1083#1083#1072#1085#1089#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSchKr: TLabel
      Left = 345
      Top = 37
      Width = 112
      Height = 16
      Caption = #1057#1095#1077#1090' '#1073#1072#1083#1083#1072#1085#1089#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbKRtitle: TLabel
      Left = 473
      Top = 13
      Width = 54
      Height = 16
      Caption = #1050#1088#1077#1076#1080#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSmDb: TLabel
      Left = 15
      Top = 85
      Width = 58
      Height = 16
      Caption = #1041#1102#1076#1078#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbRzDb: TLabel
      Left = 15
      Top = 111
      Width = 56
      Height = 16
      Caption = #1056#1072#1079#1076#1077#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbStDb: TLabel
      Left = 15
      Top = 138
      Width = 52
      Height = 16
      Caption = #1057#1090#1072#1090#1100#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSMkr: TLabel
      Left = 345
      Top = 85
      Width = 58
      Height = 16
      Caption = #1041#1102#1076#1078#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbRzKr: TLabel
      Left = 345
      Top = 111
      Width = 56
      Height = 16
      Caption = #1056#1072#1079#1076#1077#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbStKr: TLabel
      Left = 345
      Top = 138
      Width = 52
      Height = 16
      Caption = #1057#1090#1072#1090#1100#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbKVdb: TLabel
      Left = 15
      Top = 165
      Width = 84
      Height = 16
      Caption = #1050#1086#1076' '#1079#1072#1090#1088#1072#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbKVKr: TLabel
      Left = 345
      Top = 165
      Width = 84
      Height = 16
      Caption = #1050#1086#1076' '#1079#1072#1090#1088#1072#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbAnDb: TLabel
      Left = 15
      Top = 193
      Width = 85
      Height = 16
      Caption = #1040#1085#1072#1083#1080#1090#1080#1082#1072' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbAnKr: TLabel
      Left = 346
      Top = 192
      Width = 85
      Height = 16
      Caption = #1040#1085#1072#1083#1080#1090#1080#1082#1072' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object edDBSchNum: TcxTextEdit
      Left = 209
      Top = 37
      Width = 110
      Height = 22
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderColor = clScrollBar
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInactiveCaptionText
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 0
    end
    object edDBSchTitle: TcxTextEdit
      Left = 121
      Top = 61
      Width = 198
      Height = 22
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInactiveCaptionText
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 1
    end
    object edKrSchTitle: TcxTextEdit
      Left = 454
      Top = 61
      Width = 198
      Height = 22
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInactiveCaptionText
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 2
    end
    object edKrSchNum: TcxTextEdit
      Left = 542
      Top = 37
      Width = 110
      Height = 22
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInactiveCaptionText
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 3
    end
    object edDBSm: TcxTextEdit
      Left = 108
      Top = 85
      Width = 211
      Height = 22
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.Color = clInactiveCaptionText
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 4
    end
    object edDBRz: TcxTextEdit
      Left = 108
      Top = 111
      Width = 211
      Height = 22
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.Color = clInactiveCaptionText
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 5
    end
    object edDbSt: TcxTextEdit
      Left = 108
      Top = 138
      Width = 211
      Height = 22
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.Color = clInactiveCaptionText
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 6
    end
    object edKrSm: TcxTextEdit
      Left = 442
      Top = 85
      Width = 211
      Height = 22
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.Color = clInactiveCaptionText
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 7
    end
    object edKrSt: TcxTextEdit
      Left = 442
      Top = 138
      Width = 211
      Height = 22
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.Color = clInactiveCaptionText
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 8
    end
    object edKrRz: TcxTextEdit
      Left = 442
      Top = 111
      Width = 211
      Height = 22
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.Color = clInactiveCaptionText
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 9
    end
    object edDBKV: TcxTextEdit
      Left = 108
      Top = 165
      Width = 211
      Height = 22
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = clInactiveCaptionText
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 10
    end
    object edKrKV: TcxTextEdit
      Left = 442
      Top = 165
      Width = 211
      Height = 22
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = clInactiveCaptionText
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 11
    end
    object edKrAn: TcxTextEdit
      Left = 442
      Top = 192
      Width = 211
      Height = 22
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = clInactiveCaptionText
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 12
      Visible = False
    end
    object edDBAn: TcxTextEdit
      Left = 108
      Top = 193
      Width = 211
      Height = 22
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = clInactiveCaptionText
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 13
      Visible = False
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 16
    Top = 280
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clInfoBk
      TextColor = clRed
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = 4707838
    end
  end
  object ObjectsDataSet: TpFIBDataSet
    Left = 16
    Top = 240
    poSQLINT64ToBCD = True
  end
  object ObjectsDataSource: TDataSource
    DataSet = ObjectsDataSet
    Left = 48
    Top = 280
  end
  object ActionList1: TActionList
    Left = 16
    Top = 320
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 27
      OnExecute = Action2Execute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 152
    Top = 304
    object N1: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1089#1080#1089#1090#1077#1084#1099' '#1091#1095#1077#1090#1072
      ShortCut = 16433
    end
    object N2: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1075#1083#1072#1074#1085#1086#1075#1086' '#1089#1095#1077#1090#1072
      ShortCut = 16434
    end
    object N3: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1089#1095#1077#1090#1072' '#1076#1083#1103' '#1082#1086#1088#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1080#1080
      ShortCut = 16435
    end
    object N5: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1073#1102#1076#1078#1077#1090#1072
      ShortCut = 16436
    end
    object N6: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1088#1072#1079#1076#1077#1083#1072
      ShortCut = 16437
    end
    object N7: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1089#1090#1072#1090#1100#1080
      ShortCut = 16438
    end
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 16
    Top = 393
  end
  object ColAnInfoDataSet: TpFIBDataSet
    Left = 16
    Top = 360
    poSQLINT64ToBCD = True
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 16
    Top = 432
  end
end
