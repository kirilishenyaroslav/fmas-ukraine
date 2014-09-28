object frmGetFaced: TfrmGetFaced
  Left = 291
  Top = 195
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1056#1072#1073#1086#1090#1072' '#1089#1086' '#1074#1089#1090#1088#1077#1095#1085#1099#1084#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084#1080
  ClientHeight = 406
  ClientWidth = 725
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 10
    Top = 387
    Width = 90
    Height = 13
    Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 28
    Width = 725
    Height = 280
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
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
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      Styles.IncSearch = cxStyle2
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        SortOrder = soAscending
        Width = 126
        DataBinding.FieldName = 'SMETA_KOD'
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1073#1102#1076#1078#1077#1090#1072
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 313
        DataBinding.FieldName = 'SMETA_TITLE'
      end
      object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1073#1102#1076#1078#1077#1090#1072
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 246
        DataBinding.FieldName = 'GROUP_TITLE'
      end
    end
    object cxGrid1DBTableView2: TcxGridDBTableView
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
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      Styles.IncSearch = cxStyle2
      object cxGrid1DBTableView2DBColumn1: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        SortOrder = soAscending
        Width = 218
        DataBinding.FieldName = 'OBJECT_NUM'
      end
      object cxGrid1DBTableView2DBColumn2: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 438
        DataBinding.FieldName = 'OBJECT_TITLE'
      end
    end
    object cxGrid1DBTableView3: TcxGridDBTableView
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
    object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
      OnDblClick = cxGrid1DBBandedTableView1DblClick
      DataController.DataSource = FacedDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'ID_DOC;ID_PROV'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      Styles.Header = cxStyle3
      Bands = <
        item
          Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          Styles.Header = cxStyle3
          Width = 449
        end
        item
          Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1087#1088#1086#1074#1086#1076#1082#1077
          Styles.Header = cxStyle3
          Width = 442
        end>
      object cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1084#1072
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 119
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'SUMMA_PROV'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn
        Caption = #1041#1102#1076#1078#1077#1090
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 85
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'SM_KOD'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn
        Caption = #1056#1072#1079#1076#1077#1083
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 89
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'RZ_KOD'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn
        Caption = #1057#1090#1072#1090#1100#1103
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 75
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'ST_KOD'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn
        Caption = #1050#1069#1050#1047
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 74
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
        DataBinding.FieldName = 'KV_KOD'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Options.Filtering = False
        Width = 124
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'SUMMA_DOC'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn
        Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Options.Filtering = False
        Width = 112
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'DOC_NUM'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn
        Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Width = 107
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'ID_DOC_TYPE_V'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn
        Caption = #1054#1090#1095#1077#1090#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
        Options.Filtering = False
        Width = 106
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'DATE_REG'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBBandedTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 361
    Width = 725
    Height = 45
    Align = alBottom
    TabOrder = 1
    object OKButton: TcxButton
      Left = 328
      Top = 8
      Width = 193
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1088#1086#1074#1086#1076#1082#1091
      TabOrder = 0
      OnClick = OKButtonClick
    end
    object CloseButton: TcxButton
      Left = 528
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = CloseButtonClick
    end
  end
  object HeaderPanel: TPanel
    Left = 0
    Top = 0
    Width = 725
    Height = 28
    Align = alTop
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1086#1073#1097#1091#1102' '#1087#1088#1086#1074#1086#1076#1082#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 0
    Top = 308
    Width = 725
    Height = 53
    Align = alBottom
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 113
      Height = 13
      Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object cxDBMemo1: TcxDBMemo
      Left = 136
      Top = 8
      Width = 552
      Height = 33
      DataBinding.DataField = 'COMMENT'
      DataBinding.DataSource = FacedDataSource
      Style.Color = clInfoBk
      TabOrder = 0
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 16
    Top = 120
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
  object FacedDataSet: TpFIBDataSet
    Left = 16
    Top = 88
    poSQLINT64ToBCD = True
  end
  object FacedDataSource: TDataSource
    DataSet = FacedDataSet
    Left = 48
    Top = 88
  end
  object ActionList1: TActionList
    Left = 8
    Top = 8
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
end
