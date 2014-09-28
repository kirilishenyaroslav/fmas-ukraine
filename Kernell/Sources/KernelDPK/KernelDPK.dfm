object frmDocsInfo: TfrmDocsInfo
  Left = 106
  Top = 181
  Width = 736
  Height = 468
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1084
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
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 105
    Width = 728
    Height = 38
    AutoSize = True
    ButtonHeight = 36
    ButtonWidth = 60
    Caption = 'ToolBar1'
    Flat = True
    Images = SmallImages
    ShowCaptions = True
    TabOrder = 0
    object AddButton: TToolButton
      Left = 0
      Top = 0
      Hint = #1053#1086#1074#1091#1102' '#1087#1088#1086#1074#1086#1076#1082#1091
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = AddButtonClick
    end
    object DelButton: TToolButton
      Left = 60
      Top = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1050#1045#1050#1047
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
    end
    object UpdateButton: TToolButton
      Left = 120
      Top = 0
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1050#1045#1050#1047
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
    end
    object ViewButton: TToolButton
      Left = 180
      Top = 0
      Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1050#1045#1050#1047#1091
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ImageIndex = 11
      ParentShowHint = False
      ShowHint = True
    end
    object RefreshButton: TToolButton
      Left = 240
      Top = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103#1102' '#1089' '#1089#1077#1088#1074#1077#1088#1072
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
      OnClick = RefreshButtonClick
    end
    object ToolButton1: TToolButton
      Left = 300
      Top = 0
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 16
    end
    object ToolButton14: TToolButton
      Left = 360
      Top = 0
      Width = 109
      Caption = 'ToolButton14'
      Enabled = False
      ImageIndex = 7
      Style = tbsSeparator
    end
    object CloseButton: TToolButton
      Left = 469
      Top = 0
      Hint = #1042#1099#1093#1086#1076
      Caption = #1042#1099#1093#1086#1076
      Enabled = False
      ImageIndex = 6
      ParentShowHint = False
      ShowHint = True
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 143
    Width = 728
    Height = 298
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.AlwaysShowEditor = True
      OptionsBehavior.CellHints = True
      OptionsCustomize.GroupRowSizing = True
      OptionsData.Editing = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      end
      object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      end
      object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072
      end
      object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
      end
    end
    object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
      DataController.DataSource = ProvsDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxGrid1DBBandedTableView1FocusedRecordChanged
      OptionsView.CellAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Bands = <
        item
          Caption = #1044#1077#1073#1077#1090
          Width = 407
        end
        item
          Caption = #1050#1088#1077#1076#1080#1090
          Width = 419
        end
        item
          Caption = #1057#1091#1084#1084#1099
          Width = 177
        end>
      object cxGrid1DBBandedTableView1DBBandedColumn14: TcxGridDBBandedColumn
        Caption = #1050#1045#1050#1047
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxGrid1DBBandedTableView1DBBandedColumn14PropertiesButtonClick
        Width = 56
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
        DataBinding.FieldName = 'DB_ID_KEKV_NUM'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn
        Caption = #1057#1095#1077#1090
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxGrid1DBBandedTableView1DBBandedColumn1PropertiesButtonClick
        Width = 45
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'DB_ID_SCH_NUM'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn
        Caption = #1057#1084#1077#1090#1072
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxGrid1DBBandedTableView1DBBandedColumn2PropertiesButtonClick
        Width = 83
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'DB_ID_SM_NUM'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn
        Caption = #1056#1072#1079#1076#1077#1083
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Options.Editing = False
        Width = 69
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'DB_ID_RZ_NUM'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn
        Caption = #1057#1090#1072#1100#1103
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Options.Editing = False
        Width = 57
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'DB_ID_ST_NUM'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn
        Caption = #1050#1045#1050#1047
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxGrid1DBBandedTableView1DBBandedColumn5PropertiesButtonClick
        Width = 63
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
        DataBinding.FieldName = 'KR_ID_KEKV_NUM'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn
        Caption = #1057#1095#1077#1090
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxGrid1DBBandedTableView1DBBandedColumn6PropertiesButtonClick
        Width = 50
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'KR_ID_SCH_NUM'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn
        Caption = #1057#1084#1077#1090#1072
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxGrid1DBBandedTableView1DBBandedColumn7PropertiesButtonClick
        Width = 73
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'KR_ID_SM_NUM'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn
        Caption = #1056#1072#1079#1076#1077#1083
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Options.Editing = False
        Width = 75
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'KR_ID_RZ_NUM'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn
        Caption = #1057#1090#1072#1090#1100#1103
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Options.Editing = False
        Width = 74
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'KR_ID_ST_NUM'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn11: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1084#1072
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxGrid1DBBandedTableView1DBBandedColumn11PropertiesButtonClick
        Width = 68
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'SUMMA'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn12: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1084#1072' '#1074' '#1074#1072#1083#1102#1090#1077
        Visible = False
        Width = 74
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DBBandedColumn13: TcxGridDBBandedColumn
        Caption = #1042#1072#1083#1102#1090#1072
        Visible = False
        Width = 71
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DBBandedColumn10: TcxGridDBBandedColumn
        Caption = #1040#1085#1072#1083#1080#1090#1080#1082#1072
        PropertiesClassName = 'TcxPopupEditProperties'
        Properties.PopupAutoSize = False
        Properties.PopupControl = cxGrid2
        Properties.PopupMinWidth = 300
        Properties.PopupWidth = 350
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
        DataBinding.FieldName = 'DB_AN_TEXT'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn15: TcxGridDBBandedColumn
        Caption = #1040#1085#1072#1083#1080#1090#1080#1082#1072
        PropertiesClassName = 'TcxPopupEditProperties'
        Width = 84
        Position.BandIndex = 1
        Position.ColIndex = 5
        Position.RowIndex = 0
        DataBinding.FieldName = 'KR_AN_TEXT'
      end
    end
    object cxGrid1CardView1: TcxGridCardView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      object cxGrid1CardView1CardViewRow1: TcxGridCardViewRow
        Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1072#1103' '#1089#1084#1077#1090#1072
      end
      object cxGrid1CardView1CardViewRow2: TcxGridCardViewRow
        Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1072#1103' '#1088#1072#1079#1076#1077#1083
      end
      object cxGrid1CardView1CardViewRow3: TcxGridCardViewRow
        Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1072#1103' '#1089#1090#1072#1090#1100#1103
      end
      object cxGrid1CardView1CardViewRow4: TcxGridCardViewRow
        Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1072#1103' '#1089#1095#1077#1090
      end
      object cxGrid1CardView1CardViewRow5: TcxGridCardViewRow
        Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1099#1081' '#1050#1045#1050#1047
      end
      object cxGrid1CardView1CardViewRow6: TcxGridCardViewRow
        Caption = #1044#1077#1073#1077#1090#1086#1074#1072#1103' '#1089#1084#1077#1090#1072
      end
      object cxGrid1CardView1CardViewRow7: TcxGridCardViewRow
        Caption = #1044#1077#1073#1077#1090#1086#1074#1072#1103' '#1088#1072#1079#1076#1077#1083
      end
      object cxGrid1CardView1CardViewRow8: TcxGridCardViewRow
        Caption = #1044#1077#1073#1077#1090#1086#1074#1072#1103' '#1089#1090#1072#1090#1100#1103
      end
      object cxGrid1CardView1CardViewRow9: TcxGridCardViewRow
        Caption = #1044#1077#1073#1077#1090#1086#1074#1072#1103' '#1089#1095#1077#1090
      end
      object cxGrid1CardView1CardViewRow10: TcxGridCardViewRow
        Caption = #1044#1077#1073#1077#1090#1086#1074#1072#1103' '#1050#1045#1050#1047
      end
    end
    object cxGrid1DBCardView1: TcxGridDBCardView
      DataController.DataSource = DetailDataSource
      DataController.DetailKeyFieldNames = 'ID_PROV'
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'ID_PROV'
      DataController.MasterKeyFieldNames = 'ID_PROV'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      object cxGrid1DBCardView1DBCardViewRow1: TcxGridDBCardViewRow
      end
      object cxGrid1DBCardView1DBCardViewRow2: TcxGridDBCardViewRow
      end
      object cxGrid1DBCardView1DBCardViewRow3: TcxGridDBCardViewRow
      end
      object cxGrid1DBCardView1DBCardViewRow4: TcxGridDBCardViewRow
      end
      object cxGrid1DBCardView1DBCardViewRow5: TcxGridDBCardViewRow
      end
      object cxGrid1DBCardView1DBCardViewRow6: TcxGridDBCardViewRow
      end
      object cxGrid1DBCardView1DBCardViewRow7: TcxGridDBCardViewRow
      end
      object cxGrid1DBCardView1DBCardViewRow8: TcxGridDBCardViewRow
      end
      object cxGrid1DBCardView1DBCardViewRow9: TcxGridDBCardViewRow
      end
      object cxGrid1DBCardView1DBCardViewRow10: TcxGridDBCardViewRow
      end
    end
    object cxGrid1DBCardView2: TcxGridDBCardView
      DataController.DataSource = DetailDataSource
      DataController.DetailKeyFieldNames = 'ID_PROV'
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'ID_PROV'
      DataController.MasterKeyFieldNames = 'ID_PROV'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.CardWidth = 600
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Styles.ContentEven = cxStyle12
      Styles.ContentOdd = cxStyle13
      Styles.CaptionRow = cxStyle1
      object cxGrid1DBCardView2DBCardViewRow1: TcxGridDBCardViewRow
        Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1099#1081' '#1089#1095#1077#1090
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        CaptionAlignmentHorz = taRightJustify
        CaptionAlignmentVert = vaCenter
        Options.Editing = False
        Styles.Content = cxStyle5
        DataBinding.FieldName = 'KR_ID_SCH_FULL'
      end
      object cxGrid1DBCardView2DBCardViewRow2: TcxGridDBCardViewRow
        Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1072#1103' '#1089#1084#1077#1090#1072
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        CaptionAlignmentHorz = taRightJustify
        CaptionAlignmentVert = vaCenter
        Options.Editing = False
        Styles.Content = cxStyle5
        DataBinding.FieldName = 'KR_ID_SM_FULL'
      end
      object cxGrid1DBCardView2DBCardViewRow3: TcxGridDBCardViewRow
        Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1072#1103' '#1088#1072#1079#1076#1077#1083
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        CaptionAlignmentHorz = taRightJustify
        CaptionAlignmentVert = vaCenter
        Options.Editing = False
        Styles.Content = cxStyle5
        DataBinding.FieldName = 'KR_ID_RZ_FULL'
      end
      object cxGrid1DBCardView2DBCardViewRow4: TcxGridDBCardViewRow
        Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1072#1103' '#1089#1090#1072#1090#1100#1103
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        CaptionAlignmentHorz = taRightJustify
        CaptionAlignmentVert = vaCenter
        Options.Editing = False
        Styles.Content = cxStyle5
        DataBinding.FieldName = 'KR_ID_ST_FULL'
      end
      object cxGrid1DBCardView2DBCardViewRow5: TcxGridDBCardViewRow
        Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1099#1081' '#1050#1045#1050#1047
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        CaptionAlignmentHorz = taRightJustify
        CaptionAlignmentVert = vaCenter
        Options.Editing = False
        Styles.Content = cxStyle5
        DataBinding.FieldName = 'KR_ID_KEKV_FULL'
      end
      object cxGrid1DBCardView2DBCardViewRow6: TcxGridDBCardViewRow
        Caption = #1044#1077#1073#1077#1090#1086#1074#1099#1081' '#1089#1095#1077#1090
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxGrid1DBBandedTableView1DBBandedColumn1PropertiesButtonClick
        CaptionAlignmentHorz = taRightJustify
        CaptionAlignmentVert = vaCenter
        Options.Editing = False
        DataBinding.FieldName = 'DB_ID_SCH_FULL'
      end
      object cxGrid1DBCardView2DBCardViewRow7: TcxGridDBCardViewRow
        Caption = #1044#1077#1073#1077#1090#1086#1074#1072#1103' '#1089#1084#1077#1090#1072
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        CaptionAlignmentHorz = taRightJustify
        CaptionAlignmentVert = vaCenter
        Options.Editing = False
        DataBinding.FieldName = 'DB_ID_SM_FULL'
      end
      object cxGrid1DBCardView2DBCardViewRow8: TcxGridDBCardViewRow
        Caption = #1044#1077#1073#1077#1090#1086#1074#1072#1103' '#1089#1090#1072#1090#1100#1103
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        CaptionAlignmentHorz = taRightJustify
        CaptionAlignmentVert = vaCenter
        Options.Editing = False
        DataBinding.FieldName = 'DB_ID_RZ_FULL'
      end
      object cxGrid1DBCardView2DBCardViewRow9: TcxGridDBCardViewRow
        Caption = #1044#1077#1073#1077#1090#1086#1074#1099#1081' '#1088#1072#1079#1076#1077#1083
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        CaptionAlignmentHorz = taRightJustify
        CaptionAlignmentVert = vaCenter
        Options.Editing = False
        DataBinding.FieldName = 'DB_ID_ST_FULL'
      end
      object cxGrid1DBCardView2DBCardViewRow10: TcxGridDBCardViewRow
        Caption = #1044#1077#1073#1077#1090#1086#1074#1099#1081' '#1050#1045#1050#1047
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        CaptionAlignmentHorz = taRightJustify
        CaptionAlignmentVert = vaCenter
        Options.Editing = False
        DataBinding.FieldName = 'DB_ID_KEKV_FULL'
      end
    end
    object cxGrid1DBCardView3: TcxGridDBCardView
      DataController.DataSource = DetailDataSource
      DataController.DetailKeyFieldNames = 'ID_PROV'
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'ID_PROV'
      DataController.MasterKeyFieldNames = 'ID_PROV'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      object cxGrid1DBCardView3DBCardViewRow1: TcxGridDBCardViewRow
        Options.Editing = False
      end
      object cxGrid1DBCardView3DBCardViewRow2: TcxGridDBCardViewRow
        Options.Editing = False
      end
      object cxGrid1DBCardView3DBCardViewRow3: TcxGridDBCardViewRow
        Options.Editing = False
      end
      object cxGrid1DBCardView3DBCardViewRow4: TcxGridDBCardViewRow
        Options.Editing = False
      end
      object cxGrid1DBCardView3DBCardViewRow5: TcxGridDBCardViewRow
        Options.Editing = False
      end
      object cxGrid1DBCardView3DBCardViewRow6: TcxGridDBCardViewRow
        Options.Editing = False
      end
      object cxGrid1DBCardView3DBCardViewRow7: TcxGridDBCardViewRow
        Options.Editing = False
      end
      object cxGrid1DBCardView3DBCardViewRow8: TcxGridDBCardViewRow
        Options.Editing = False
      end
      object cxGrid1DBCardView3DBCardViewRow9: TcxGridDBCardViewRow
        Options.Editing = False
      end
      object cxGrid1DBCardView3DBCardViewRow10: TcxGridDBCardViewRow
        Options.Editing = False
      end
    end
    object cxGrid1DBTableView2: TcxGridDBTableView
      DataController.DataSource = DBTemplatesDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      object cxGrid1DBTableView2DBColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE1_CHAR'
      end
      object cxGrid1DBTableView2DBColumn2: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE2_CHAR'
      end
      object cxGrid1DBTableView2DBColumn3: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE3_CHAR'
      end
      object cxGrid1DBTableView2DBColumn4: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE4_CHAR'
      end
      object cxGrid1DBTableView2DBColumn5: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE5_CHAR'
      end
      object cxGrid1DBTableView2DBColumn6: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE6_CHAR'
      end
      object cxGrid1DBTableView2DBColumn7: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE7_CHAR'
      end
      object cxGrid1DBTableView2DBColumn8: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE8_CHAR'
      end
      object cxGrid1DBTableView2DBColumn9: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE9_CHAR'
      end
      object cxGrid1DBTableView2DBColumn10: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE10_CHAR'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBBandedTableView1
      object cxGrid1Level2: TcxGridLevel
        Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1087#1088#1086#1074#1086#1076#1082#1077
        GridView = cxGrid1DBCardView2
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 728
    Height = 105
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 83
      Height = 13
      Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object Label2: TLabel
      Left = 16
      Top = 44
      Width = 91
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object Label3: TLabel
      Left = 31
      Top = 72
      Width = 76
      Height = 13
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object Label4: TLabel
      Left = 328
      Top = 16
      Width = 91
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object Label5: TLabel
      Left = 328
      Top = 40
      Width = 140
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1074' '#1074#1072#1083#1102#1090#1077
    end
    object Label6: TLabel
      Left = 328
      Top = 64
      Width = 95
      Height = 13
      Caption = #1042#1072#1083#1102#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object DocType: TDBLookupComboBox
      Left = 120
      Top = 70
      Width = 173
      Height = 19
      Color = clInfoBk
      Ctl3D = False
      KeyField = 'ID_TYPE_DOC'
      ListField = 'TYPE_DOC_TITLE'
      ListSource = TypeDataSource
      ParentCtl3D = False
      TabOrder = 0
    end
    object DocDate: TcxDateEdit
      Left = 119
      Top = 14
      Width = 174
      Height = 21
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object NumDoc: TcxTextEdit
      Left = 119
      Top = 40
      Width = 173
      Height = 21
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object cxTextEdit1: TcxTextEdit
      Left = 487
      Top = 37
      Width = 175
      Height = 21
      Enabled = False
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 3
    end
    object cxTextEdit2: TcxTextEdit
      Left = 487
      Top = 61
      Width = 175
      Height = 21
      Enabled = False
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 4
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 488
      Top = 14
      Width = 175
      Height = 21
      DataBinding.DataField = 'SUMMA'
      DataBinding.DataSource = DocInfoDataSource
      Style.Color = clInfoBk
      TabOrder = 5
    end
  end
  object cxGrid2: TcxGrid
    Left = 568
    Top = 48
    Width = 177
    Height = 81
    TabOrder = 3
    Visible = False
    object cxGrid2DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid2DBTableView1DblClick
      OnKeyDown = cxGrid2DBTableView1KeyDown
      DataController.DataSource = DBTemplatesDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.Background = cxStyle4
      Styles.Content = cxStyle4
      object cxGrid2DBTableView1DBColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE1_CHAR'
      end
      object cxGrid2DBTableView1DBColumn2: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE2_CHAR'
      end
      object cxGrid2DBTableView1DBColumn3: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE3_CHAR'
      end
      object cxGrid2DBTableView1DBColumn4: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE4_CHAR'
      end
      object cxGrid2DBTableView1DBColumn5: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE5_CHAR'
      end
      object cxGrid2DBTableView1DBColumn6: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE6_CHAR'
      end
      object cxGrid2DBTableView1DBColumn7: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE7_CHAR'
      end
      object cxGrid2DBTableView1DBColumn8: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE8_CHAR'
      end
      object cxGrid2DBTableView1DBColumn9: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE9_CHAR'
      end
      object cxGrid2DBTableView1DBColumn10: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE10_CHAR'
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object cxGrid3: TcxGrid
    Left = 560
    Top = 64
    Width = 177
    Height = 81
    TabOrder = 4
    Visible = False
    object cxGridDBTableView1: TcxGridDBTableView
      OnDblClick = cxGridDBTableView1DblClick
      OnKeyDown = cxGridDBTableView1KeyDown
      DataController.DataSource = KrTemplatesDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.Background = cxStyle4
      Styles.Content = cxStyle4
      object cxGridDBColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE1_CHAR'
      end
      object cxGridDBColumn2: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE2_CHAR'
      end
      object cxGridDBColumn3: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE3_CHAR'
      end
      object cxGridDBColumn4: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE4_CHAR'
      end
      object cxGridDBColumn5: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE5_CHAR'
      end
      object cxGridDBColumn6: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE6_CHAR'
      end
      object cxGridDBColumn7: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE7_CHAR'
      end
      object cxGridDBColumn8: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE8_CHAR'
      end
      object cxGridDBColumn9: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE9_CHAR'
      end
      object cxGridDBColumn10: TcxGridDBColumn
        DataBinding.FieldName = 'ID_AN_TYPE_VALUE10_CHAR'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object WorkDatabase: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 56
    Top = 200
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Top = 200
  end
  object ProvsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 24
    Top = 232
    poSQLINT64ToBCD = True
  end
  object StyleRepository: TcxStyleRepository
    Left = 176
    Top = 208
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      Color = clGradientInactiveCaption
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
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
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
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
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
  object SmallImages: TImageList
    Left = 144
    Top = 208
    Bitmap = {
      494C010111001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000500000000100180000000000003C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000B78183A47874A47874A478
      74A47874A47874A47874A47874A47874A47874A47874A47874986B6600000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000B78183FDEFD9F6E3CBF5DF
      C2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC97F3D199986B6600000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000B48176FEF3E39933009933
      00993300993300993300993300993300993300EECC97F3D199986B6600000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000B48176FFF7EB993300FEFE
      FEFEFEFEFEFEFE8EA4FDB8C6FDFEFEFE993300EFCD99F3D198986B6600000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000BA8E85FFFCF4993300FEFE
      FEFAFBFE7E98FC0335FB597AFCFEFEFE993300F0D0A1F3D29B986B6600000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000BA8E85FFFFFD993300D6DE
      FE4368FC0335FB4066FC0436FBD9E0FE993300F0D4A9F5D5A3986B6600000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000CB9A82FFFFFF9933005274
      FC1442FBBCC9FDEFF2FE1A47FB4F72FC973304F2D8B2F6D9AC986B6600000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000CB9A82FFFFFF993300E4EA
      FED9E0FEFEFEFEFEFEFE98ACFD0335FB643459F4DBB9F8DDB4986B6600000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000DCA887FFFFFF993300FEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFE5677FC0335FBF7E1C2F0DAB7986B6600000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000DCA887FFFFFF9933009933
      009933009933009933009933008F33112235C80335FBC6BCA9986B6600000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000E3B18EFFFFFFFFFFFFFFFF
      FFFFFFFFFFFEFDFDF8F3FDF6ECF1E1D5B481760335FB0335FB0335FB00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000E3B18EFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9B48176E8B270ECA54A0335FB00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000EDBD92FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFE4D4D2B48176FAC577CD937700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000EDBD92FCF7F4FCF7F3FBF6
      F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB48176CF9B8600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000EDBD92DAA482DAA482DAA4
      82DAA482DAA482DAA482DAA482DAA482B4817600000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000096675E9F6F609F6F609F6F609F6F609F6F609F6F609F6F60
      9F6F609F6F609F6F609F6F609F6F600000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A67A75A67A75A67A75A67A75A67A
      75A67A75A67A75A67A75A67A75A67A7500000000000000000000000000000000
      000000000000000099695FF6E0BFF4DDB8F3DAB4F3D7ADF2D5A7F0D3A3F0D09E
      EECC99EECA93EDC990EDC68C9F6F600000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FFFF00FFFF000000008C5A5A8C5A5A000000FFFF00FFFF00
      0000008C5A5A8C5A5A8C5A5A8C5A5A000000A67A75F1E1D6EEDBCDECD6C5EAD1
      BDE7CCB5E5C8ADE3C3A5E0BF9DA67A750000000000000000000335FB00000000
      00000000000000009D6C60F6E3C6F6E1C1F4DDBBF3DCB4008100F2D5AAF0D3A4
      F0CF9FEFCC99EFCB95EEC9909F6F600000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FFFF00FFFF00000000F7DECEF7DEC6000000FFFF00FFFF00
      000000F7DEC6EFDECEF7EFDE8C5A5A000000A67A75FCF7F2FAF1E7F9ECDCF7E7
      D2F5E2C8F4DDBEF3D8B4F1D4A9A67A750000000000000335FB0335FB00000000
      0000000000000000A16E60F7E6CEF6E5C7F4E1C1008100008100008100F3D5AB
      F0D3A5EFD19FEFCE9AEFCB969F6F600000000000000000000000000000000000
      0000000000848300000000000000000000000000000000000000000000000000
      0000000000000000FFFFFFFFFF00000000000000000000000000FFFFFFFFFF00
      000000F7DEC6EFDECEF7EFDE8C5A5A000000A67A75A67A75A67A75A67A75A67A
      75A67A75A67A75A67A75A67A75A67A750000000000000000000000000330E200
      0000000000000000A67262F8EAD4F7E7CE008100307A2A5F924B00810050883C
      F2D5ABF0D3A5F0D0A0EFCF9C9F6F600000000000000000000000000000000000
      0000848300FFFE00848300000000000000000000000000000000000000000000
      0000000000848484000000000000000000FFD6A5FFD6A5FFD6A5000000000000
      848484FFD6A5FFD6A5F7E7CE8C5A5A0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000003
      35FB000000000000AB7663FAEEDAFAEBD5008100EFE2C2F6E2C2A7B883008100
      008100EDD4A9F0D4A6F0D1A19F6F6000000000000000000000000000000000FF
      FE00FFFE00FFFE00FFFE00848300000000000000000000000000000000000000
      0000000000000000000000B58C8CFFF7E7F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6
      F7DEC6000000F7E7CEF7E7CE000000000000A67A75A67A75A67A75A67A75A67A
      75A67A75A67A75A67A75A67A75A67A7500000000000000000000000000000000
      0000000000000000B07864FAF0E2FAEEDCF8EBD5F8E9D0F7E6CAF6E3C5E6D8B4
      008100008100F2D7ADF2D4A79F6F6000000000000000000000000000FFFE00FF
      FE84848484848400FFFE00FFFE00848300000000000000000000000000000000
      0000000000000000000000000000F7EFDEF7DECE000000F7DEC6F7DEC6F7DEC6
      F7DEC6F7DEC6000000EFDECE000000000000A67A75F1E1D6EEDBCDECD6C5EAD1
      BDE7CCB5E5C8ADE3C3A5E0BF9DA67A750000000000000000000335FB00000000
      0000000000000000B57D64FCF3E7FBF0E3FAEFDDFAEDD8F7E9D1F8E6CBF6E3C5
      F6E1C0F4DEBAF4DAB5F3D7AD9F6F6000000000000000000084848400FFFE8484
      8400000000000084848400FFFE00FFFE00848300000000000000000000000000
      0000000000000000000000B58C8C000000FFD6A5000000FFD6A5FFD6A5FFD6A5
      FFD6A5FFD6A5FFD6A5000000000000000000A67A75FCF7F2FAF1E7F9ECDCF7E7
      D2F5E2C8F4DDBEF3D8B4F1D4A9A67A750000000000000335FB0335FB00000000
      0000000000000000BB8065FCF7EDD58127D58127D58127D58127D58127D58127
      D58127D58127D58127F3DAB69F6F600000000000000000000000008484840000
      0000000000000000000084848400FFFE00FFFE00848300000000000000000000
      0000000000000000000000B58C8CFFF7EF000000000000F7DEC6F7DEC6F7DEC6
      F7DEC6F7DEBDF7E7CEEFDECE9C6B6B000000A67A75A67A75A67A75A67A75A67A
      75A67A75A67A75A67A75A67A75A67A750000000000000000000000000330E200
      0000000000000000C08366FCF8F3FCF7EFFCF4EAFBF2E5FBEFDEF8EDD9F8EBD4
      F8E7CEF7E3C7F6E1C2F4DEBB9F6F600000000000000000000000000000000000
      0000000000000000000000000084848400FFFE00FFFE00848300000000000000
      0000000000000000000000B58C8CFFF7EFF7E7CEF7DEC6F7DEC6F7DEC6F7DEC6
      F7DEC6F7DEC6F7E7D6EFDECE9C6B6B0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000003
      35FB000000000000C48767FEFBF8FEFAF3FEF7EFFCF4EAFBF2E6FAEFE0F8EDDA
      F8EAD4F7E9CFF7E5C9F6E2C49F6F600000000000000000000000000000000000
      0000000000000000000000000000000084848400FFFE00FFFE00000000000000
      0000000000000000000000B58C8CFFFFF7FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5
      FFD6A5FFD6A5FFD6A5EFDECE9C6B6B000000A67A75A67A75A67A75A67A75A67A
      75A67A75A67A75A67A75A67A75A67A7500000000000000000000000000000000
      0000000000000000C98967FEFCFBD58127D58127D58127D58127D58127D58127
      D58127D58127D58127F7E5CA9F6F600000000000000000000000000000000000
      0000000000000000000000000000000000000084848400FFFE00000000000000
      0000000000000000000000B58C8CFFFFF7FFE7D6FFE7D6FFE7D6FFE7D6FFE7D6
      FFE7D6B58C8CB58C8CB58C8C9C6B6B000000A67A75F1E1D6EEDBCDECD6C5EAD1
      BDE7CCB5E5C8ADE3C3A5E0BF9DA67A750000000000000000000335FB00000000
      0000000000000000CC8B68FFFFFFFFFEFCFEFCFAFEFBF4FEF8F0FCF6EDFCF4E7
      FAF2E2FAEFDCF8EDD7F8EAD19F6F600000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000B58C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
      FFFFF7B58C8CFFFFFFC68C7B000000000000A67A75FCF7F2FAF1E7F9ECDCF7E7
      D2F5E2C8F4DDBEF3D8B4F1D4A9A67A750000000000000335FB0335FB00000000
      0000000000000000CF8E68FFFFFFFFFFFFFFFFFCFFFCFAFEFBF6FEF8F0FCF7EE
      FBF4E9FBF2E3FBEFDDF8EDD89F6F600000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000B58C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFB58C8CC68C7B000000000000000000A67A75A67A75A67A75A67A75A67A
      75A67A75A67A75A67A75A67A75A67A750000000000000000000000000330E200
      0000000000000000CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68
      CF8E68CF8E68CF8E68CF8E68CF8E680000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000B58C8CB58C8CB58C8CB58C8CB58C8CB58C8CB58C8C
      B58C8CB58C8C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000003
      35FB000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0053464553464553464553464553464553464500000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000EF4200AD29009C3100C8D0D4C8D0D4C8D0D4C8D0D4
      000000EF4200AD2900AD2900732900732900000000000000000000B58E7BB592
      84F7E3D6EFE3DEEFE3DEF7E7DEF7E3D6BDA69C53464553464500000000000000
      0000000000393939393939393939393939393939393939393939393939393939
      39393939393900000000000000000000000000000097736BB3887FB1847CB184
      7CB1847CB1857DB1857DB1857EB0857DAE857EAA837CB08580B48A7C875D5600
      0000FF9C18FFF7E7000000EF4200AD29009C3100C8D0D4C8D0D4C8D0D4C8D0D4
      FF9C18FFF7E7AD2900AD2900732900732900000000000000BDA69CF7E7DEFFF3
      F7E7DBD6DEB29CD6A68CE7C7BDEFEBEFF7F3F7F7E3D6E7CBBD53464500000000
      0000393939808080808080808080808080808080848484848484848484848484
      848484393939393939000000000000000000000000B3938CF1DCCAFCDBC4FCDA
      C6FCDBC7FAD5BAFED6BCFFD4B6FAD3B6F6CFB0F1CDAEF5CEA8FDCFAD9D706A00
      0000FF9C18FFF7E7000000EF4200AD29009C3100C8D0D4C8D0D4C8D0D4C8D0D4
      FF9C18FFF7E7AD2900AD2900732900732900000000BDA69CF7EBE7FFFFFFC68E
      73BD5D29BD5D29DEB29CBD5D29BD5D29D69E84F7F3F7F7E7DED6C7BD53464500
      0000393939393939393939393939393939393939393939393939393939393939
      393939393939393939393939000000000000000000B39690ECE8D6FFF2D4E4E6
      BEE3E1B9FFEAD3F4E1B6E9E3AFFDDDB7FDD8ADFAD5A7F6D6A2FCD8B6A0727200
      0000FF9C18FF9C18000000EF4200AD29009C3100C8D0D4C8D0D4C8D0D4C8D0D4
      000000000000AD2900AD2900732900732900000000BDA69CFFFFFFCE6D42BD5D
      29BD5D29C6A294FFFFFFE78252BD5D29BD5D29D69673FFFBF7F7E3D653464500
      0000393939C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C5C5C5C5C5C5C5C5C5C5C5C5
      C5C5C5848484393939393939000000000000000000BB9F90ECEFE5FFFAECA9D3
      8F009A00029B05009800009D00009300269D23D5CD98FFD7ACFED7BA9E707000
      0000FF9C18FF9C18000000EF4200AD29009C3100C8D0D4C8D0D4C8D0D4C8D0D4
      000000000000AD2900AD2900732900732900BDA69CFFFBFFDE9E7BBD5D29CE65
      31CE6531CE6939D68A63CE6531CE6531BD5D29BD5D29E7CBBDF7EFEFDECBC653
      4645393939C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000FF0000FF000000FF0000FF
      C5C5C5848484848484393939393939000000000000C0A498EFF1EAFFFBF4AAD8
      9900940000980010A0169CCE91AFC7912FA8265FB54FF6DAB1FFDEC69E717000
      0000FF9C18000000000000EF4200AD2900AD2900732900732900FF9C18FF9C18
      000000000000AD2900AD2900732900732900D6C7BDFFF7F7C66131BD5D29CE65
      31BD5D29CE8663F7E7DED66939BD5D29CE6531BD5D29CE7142FFFFFFE7CBBD53
      4645393939C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C5C5C5C5C5C5C5C5C5C5C5C5
      C5C5C5848484848484848484393939000000000000C4A7A0EFF5E9FFFCF7B3DC
      A3019D010DA10B1DA41C51B143F0E5C4F4E2C35FB45BD9D29DFFDDC6A77A7400
      0000FF9C18000000F7FFFFEF4200AD29009C3100732900732900FF9C18F7FFFF
      000000000000AD2900AD2900732900732900D6C7BDF7DFD6BD5D29CE6531CE65
      31BD5D29D68252FFFBFFE7AE94BD5D29BD5D29CE6531BD5D29FFEFEFF7DFD653
      4645000000393939393939393939393939393939393939393939393939393939
      393939C5C5C5848484848484393939000000000000CAACA1F4FAF2F2F7E5DCEB
      CEFBF4E6F5F3DFF9F1DAFEE7CDFEEBD8FFECDBF7E6CDF0DEB6FEDAC1AB7D7500
      0000FF9C18000000F7FFFFEF4200AD29009C3100732900FFC65AFF9C18F7FFFF
      000000000000AD2900AD2900732900732900D6C7BDF7D7CECE6531CE6531CE65
      31CE6531BD5D29DEAA94FFF7F7EF9E73BD5D29CE6531BD5D29F7F3EFEFE3DE53
      4645000000000000B58C8CFFFFFFF7E7CEF7E7CEF7E7CEF7E7CEF7E7CEF7E7CE
      FFFFFF9C6B6BC5C5C5848484393939000000000000D2B5A0F6FAFAE6F7E18AD3
      88EDF3DFFFFCF9C0DEAA4AB03953B44349B13CC5D59FFFE8D0FDE1CCAA7E7600
      0000FFA539FFA539F7FFFFEF4200AD29009C3100732900FFC65AFF9C18F7FFFF
      000000000000AD2900AD29008C39218C3921D6C7BDFFEFE7D66939CE6531CE65
      31BD5D29BD5D29BD5D29E7CFC6FFFFFFD66939CE6531CE6939FFFBFFF7DFD653
      4645000000000000B58C8CFFFFFFFFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5
      FFFFF79C6B6B393939393939000000000000000000D1B4A1F4FAF8FFFFFD8FCF
      9149B951E2EFD8FFF9EA63BB64009300009100AAD08DFFEED9FEDFCAAC7F7700
      0000C8D0D4FFA539FFA539EF4200EF4200AD29007329008C3921FFA539FF9C18
      000000000000AD29008C39218C3921C8D0D4D6C7BDFFFFFFF79A6BD66939CE8E
      6BF7EBE7D68252BD5D29D69673FFFFFFE78E5ABD5D29EF9263FFFFFFD6C7BD53
      4645000000000000B58C8CFFFFFFFFF7EFF7E7CEF7DEC6F7E7CEF7DEC6F7E7CE
      FFFFF79C6B6B000000000000000000000000000000DBBDA3F6FDFAFFFFFFE9F4
      E53AAA3518A5195FC05936AD33009900009500AAD48FFFF6E2FCDCC8AF847D00
      0000C8D0D4C8D0D4FFA539FFF7E7EF4200AD29007329008C3921FFA539FFF7E7
      0000000000008C39218C3921C8D0D4C8D0D4000000D6C7BDFFEBDEEF8652E782
      52F7F7F7FFFFFFDEBAADFFFFFFF7F7F7DE7142D67139FFF3EFF7E7E753464500
      0000000000000000000000B58C8CFFFFF7FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5
      FFD6A5FFFFFF9C6B6B000000000000000000000000E1C3A3F6FDFBF8FCF8FFFF
      FFC4EBCC21AA2500950000940012A4140D9F11A5CC8BFFCAC0F8ADA1AC7E7600
      0000C8D0D4C8D0D4FFA539FFA539EF4200EF42008C39218C3921FFA539FFA539
      0000000000008C3921C8D0D4C8D0D4C8D0D4000000D6C7BDFFFFFFFFEFD6FFAA
      73EFAA8CEFE3DEEFEFEFF7E7E7FFA67BF78E5AF7DBCEFFFFFFD6C7BD00000000
      0000000000000000000000B58C8CFFFFF7FFFFF7FFE7D6FFE7D6FFE7D6FFE7D6
      FFE7D6FFFFFF9C6B6B000000000000000000000000E6C9A9F9FFFEF8FCF8F8FC
      F8F8FCF8FBFEFAFFFFFFFFFFFFFEFEF8FFFFFEC9AA97D49752C79A7AC3AEA200
      0000C8D0D4C8D0D4FFA539FFA539EF4200EF42008C39218C3921FFA539FFA539
      0000000000008C3921C8D0D4C8D0D4C8D0D4000000000000D6C7BDFFFFFFFFFF
      FFFFF3C6FFDFADFFD39CFFC794FFD7ADFFFFFFFFFFFFD6C7BD00000000000000
      0000000000000000000000000000B58C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF9C6B6B000000000000000000E8CBACFBFFFFFAFFFFFAFF
      FFFAFFFFFAFEFDF9FEFDF4FBFBF3FBF8F7FFFCC6AA98D09E73DCC9B600000000
      0000C8D0D4C8D0D4C8D0D4FFA539FF9C18EF42008C3921C8D0D4C8D0D4FFA539
      0000000000008C3921C8D0D4C8D0D4C8D0D4000000000000000000D6C7BDD6C7
      BDFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFDECBC6D6C7BD00000000000000000000
      0000000000000000000000000000000000B58C8CB58C8CB58C8CB58C8CB58C8C
      B58C8CB58C8CB58C8C9C6B6B000000000000000000E7C29DE1C6A5E2C6A6E2C6
      A6E2C6A6E2C4A4E1C3A3DDC1A1DCC0A0DEC3A3C29C84DECCB800000000000000
      0000C8D0D4C8D0D4C8D0D4FFA539F7FFFFEF42008C3921C8D0D4C8D0D4FFA539
      F7FFFF0000008C3921C8D0D4C8D0D4C8D0D40000000000000000000000000000
      00DECBC6D6C7BDD6C7BDD6C7BDD6C7BD00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8D0D4C8D0D4C8D0D4FFCE63FFCE63FFA539FFA539C8D0D4C8D0D4FFCE63
      FFA539FFA5398C3921C8D0D4C8D0D4C8D0D40000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000008C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A
      8C5A5A8C5A5A0000000000000000000000000000000000000000000000000000
      000000009C31009C310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000B58C8C8C5A
      5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A00
      0000000000F7EFDEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6EFDECE
      F7EFDE8C5A5A0000000000000000000000000000000000000000000000000000
      00000000FFEFA5FFEFA55A31185A311800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5636BA5636B
      000000000000000000000000000000000000000000000000000000B58C8CF7EF
      DEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6EFDECEF7EFDE8C5A5A00
      0000000000F7EFDEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6EFDECE
      F7EFDE8C5A5A0000000000000000000000000000000000000000000000000000
      00000000FFEFA5FFEFA5FFE78CFFE78C31313100000000000000000000000000
      0000000000000000000000000000000000000000000000A5636B848484A5636B
      000000000000000000000000000000000000000000000000000000B58C8CF7EF
      DEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6EFDECEF7EFDE8C5A5A00
      0000000000FFF7E7FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5
      F7E7CE8C5A5A0000000000000000000000000000000000000000000000000000
      00FF6331FFEFA5FFEFA5FFE78CFFE78CFFC65A3131319C31009C310000000000
      0000000000000000000000000000000000000000A5636BCECED6848484A5636B
      000000000000000000000000000000000000000000000000000000B58C8CFFF7
      E7FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5F7E7CE8C5A5A00
      0000000000FFF7E7F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEBDF7E7CE
      F7E7CE8C5A5A000000000000000000000000000000000000000000000000FF31
      FFFF6331FFEFA5FFEFA5FFE78CFFE78CFFC65AFF9C00FF9C639C310000000000
      0000000000000000000000000000000000000000A5636BEFEFEF848484A5636B
      0000000000000000000000000000000000000000000000000000FFB58C8CFFF7
      E7F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEBDF7E7CEF7E7CE8C5A5A00
      0000000000F7EFDEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6EFDECE
      EFDECE8C5A5A0000000000000000000000000000000000000000000000000000
      00FF6331FFEFA5FFEFA5000000080808FFC65AFF9C00FF9C639C310000000000
      0000000000000000000000000000000000000000A5636BEFEFEF848484A5636B
      0000000000000000000000000000000000000000000000000000FF000084F7EF
      DEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC60000FFEFDECEEFDECE8C5A5A00
      0000000000FFF7E7454545FFD6A5454545FFD6A51F1F1FFFD6A5FFD6A5FFD6A5
      EFDECE9C6B630000000000000000000000000000000000000808080000000000
      00FF6331FFEFA5FFEFA5FFDE84FFDE84FFC65AFF9C00FF9C639C310000000000
      0000000000000000000000000000000000000000A5736BEFEFEF848484A5636B
      0000000000000000000000000000000000000000000000000000000000FF0000
      84FFD6A5FFD6A5FFD6A5FFD6A5FFD6A50000840000FFFFD6A5EFDECE9C6B6300
      0000000000FFF7EFF7DEC6F7DEC6F7DEC61F1F1F1F1F1FF7DEC6F7DEBDF7E7CE
      EFDECE9C6B6B0000000000000000000000000000000000000000000000000000
      00FF6331F7FFFFFFDE84FFDE84FFDE84FFC65AFF9C00FF9C639C310000000000
      0000000000000000000000000000000000000000BD846BEFEFEF848484A5636B
      0000000000000000000000000000000000000000000000000000006C6CFF0000
      84F7DEC6F7DEC6F7DEC6F7DEC60000840000FFF7DEBDF7E7CEEFDECE9C6B6B00
      0000000000FFF7EFF7E7CEF7DEC61F1F1F1F1F1F1F1F1FF7DEC6F7DEC6F7E7D6
      EFDECE9C6B6B000000000000000000000000000000FFFFCEFFFFBDFFC65AFFA5
      10FF9C00F7FFFFFFEFA5FFDE84FFDE84FFC65AFF9C00FF9C639C310000000000
      0000000000000000000000000000000000000000D6946BEFEFEF848484A5636B
      000000000000000000000000000000000000000000000000000000B58C8C0000
      FF000084F7DEC6F7DEC60000840000FFF7DEC6F7DEC6F7E7D6EFDECE9C6B6B00
      0000000000FFFFF7FFD6A51F1F1F84848400FFFF1F1F1FFFD6A5FFD6A5FFD6A5
      EFDECE9C6B6B0000000000000000000000000000000000000000000000000000
      00080808F7FFFFFFFFFFFFDE84FFDE84FFC65AFF9C00FF9C639C310000000000
      0000000000000000000000000000000000BD7B5AEFEFEFCECED6848484424242
      A5636B000000000000000000000000000000000000000000000000B58C8CFFFF
      F70000FF0000840000840000FFFFD6A5FFD6A5FFD6A5FFD6A5EFDECE9C6B6B00
      0000000000FFFFF7FFE7D61F1F1FC6C6C600FFFF1F1F1FFFE7D6000000000000
      0000009C6B6B0000000000000000000000000000000000000000000000000000
      00FF6331F7FFFFFFFFFFFFDE84FFDE84FFC65AFF9C00FF9C639C310000000000
      0000000000000000000000000000BD7B5AEFEFEFCECED6BDBDBD8C8C8C5A5A5A
      424242A5636B000000000000000000000000000000000000000000B58C8CFFFF
      F70000FF0000FF0000FFFFE7D6FFE7D6FFE7D6B58C8CB58C8CB58C8C9C6B6B00
      0000000000FFFFFF1F1F1F84848400FFFF1F1F1FFFFFF7FFFFF7000000FFFFFF
      C68C7BC8D0D4000000000000000000000000000000000000000000000000FF31
      FFFF6331C65A00FFFFFFFFDE84FFDE84FFC65AFF9C00FF9C009C310000000000
      0000000000000000000000BD7B5AEFEFEFEFEFEFC6C6C6ADADAD8C8C8C737373
      5A5A5A424242A5636B000000000000000000000000000000000000B58C8C0000
      FF0000840000FF000084FFFFFFFFFFF7FFFFF7B58C8CFFFFFFC68C7B00000000
      0000000000454545848484C6C6C600FFFF1F1F1FFFFFFFFFFFFF000000C68C7B
      C8D0D4C8D0D40000000000000000000000000000000000000000000000000000
      00FF6331FFD673C65A00C65A00CE6363FFC65AFF9C00FF9C009C310000000000
      0000000000000000BD7B5AEFEFEFEFEFEFCECED6BDBDBD9C9C9C848484848484
      7373735A5A5A424242A5636B0000000000000000000000000000FF0000FF0000
      84FFFFFFFFFFFF0000FF000084FFFFFFFFFFFFB58C8CC68C7B00000000000000
      00000000001F1F1F1F1F1F00FFFF1F1F1F000000000000000000000000C8D0D4
      C8D0D4C8D0D40000000000000000000000000000000000000000000000000000
      00FF6331FFD673FFD673FFD673C65A00CE6363FF9C00FF9C009C310000000000
      0000000000BD7B5AEFEFEFEFEFEFCECED6C6C6C6C6C6C6848484848484848484
      8484847373735A5A5A424242A5636B0000000000000000FF0000FFB58C8CB58C
      8CB58C8CB58C8CB58C8C0000FF000084B58C8CB58C8C00000000000000000000
      00001F1F1F0000840000841F1F1FC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D40000000000000000000000000000000000000000000000000000
      00FF6331FFDE84FFDE84FFDE84FFDE84C65A00C65A00C65A009C310000000000
      0000D6946BD6946BD6946BD6946BD6946BD6946BD6946BD6946BD6946BD6946B
      D6946BD6946BD6946BD6946BD6946BD6946B0000000000000000000000000000
      000000000000000000000000000000FF0000FF00000000000000000000000000
      0000C8D0D41F1F1F1F1F1F1F1F1FC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D40000000000000000000000000000000000000000000000000000
      00FF6331FF6331FF6331FF6331FF6331FF6331FF6331FF6331FF633100000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000B58C8C8C5A
      5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A00
      0000000000000000000000000000B58C8C8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A
      8C5A5A8C5A5A8C5A5A8C5A5A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000B58C8CF7EF
      DEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6EFDECEF7EFDE8C5A5A00
      0000000000000000000000000000B58C8CFFF7E7F7EFDEF7EFDEF7EFDEF7EFDE
      F7EFDEF7EFDEF7E7CE8C5A5A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000B58C8CF7EF
      DEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6EFDECEF7EFDE8C5A5A00
      0000000000000000000000000000B58C8CF7EFDEF7DECEF7DEC6F7DEC6F7DEC6
      F7DEC6EFDECEEFDECE8C5A5A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000B58C8CFFF7
      E7FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5F7E7CE8C5A5A00
      0000000000000000000000000000B58C8CFFF7E7FFD6A5FFD6A5FFD6A5FFD6A5
      FFD6A5FFD6A5EFDECE8C5A5A0000000000000000000000000000840000848484
      8400000000000000000000000000000000000000008400008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000B58C8CFFF7
      E7F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEBDF7E7CEF7E7CE8C5A5A00
      0000B58C8C8C5A5A8C5A5A8C5A5AB58C8CFFF7EFF7DEC6F7DEC6F7DEC6F7DEC6
      F7DEBDF7E7CEEFDECE9C6B630000000000000000000000000000840000840000
      8484848400000000000000000000000000008400008484848400000000000000
      0000000000000000000000000000000000000000008400000000000000000000
      000000000000000000000000000000000000000000000000000000B58C8CF7EF
      DEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6EFDECEEFDECE8C5A5A00
      0000B58C8CFFF7E7F7EFDEF7EFDEB58C8CFFF7EFF7E7CEF7DEC6F7DEC6F7DEC6
      F7DEC6F7E7D6EFDECE9C6B6B0000000000000000000000000000000000840000
      8400008484848400000000000000008400008400008400000000000000000000
      000000000000000000000000000000000000840000FF00008400000000000000
      000000000000000000000000000000000000000000000000000000B58C8CFFF7
      E7FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5EFDECE9C6B6300
      0000B58C8CF7EFDEF7DECEF7DEC6B58C8CFFFFF7FFD6A5FFD6A5FFD6A54C804C
      4C804C4C804C4C804CA57B730000000000000000000000000000000000000000
      8400008400008484848400008400008400008400000000000000000000000000
      000000000000000000000000000000FF0000FF0000FF0000FF00008400000000
      000000000000000000000000000000000000000000000000000000B58C8C8585
      8500FFFFF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEBDF7E7CEEFDECE9C6B6B00
      0000B58C8CFFF7E7FFD6A5FFD6A5B58C8CFFFFF7FFE7D6FFE7D6F7E7D64C804C
      52AE5752AE574C804CA57B730000000000000000000000000000000000000000
      0000008400008400008400008400008400000000000000000000000000000000
      000000000000000000000000FF0000FF0084848484848400FF0000FF00008400
      00000000000000000000000000000000000000000000FFFF000000B58C8C8585
      8500FFFFF7DEC600FFFF00FFFFF7DEC6F7DEC6F7DEC6F7E7D6EFDECE9C6B6B00
      0000B58C8CFFF7EFF7DEC6F7DEC6B58C8CFFFFFFFFFFFF4C804C4C804C4C804C
      52AE5752AE574C804C4C804C4C804C0000000000000000000000000000000000
      000000000000840000FF00008484848400000000000000000000000000000000
      000000000000000084848400FF0084848400000000000084848400FF0000FF00
      00840000000000000000000000000000000000000085858500FFFFB58C8C8585
      8500FFFF00FFFF858585FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5EFDECE9C6B6B00
      0000B58C8CFFF7EFF7E7CEF7DEC6B58C8CFFFFFFFFFFFF4C804C52AE5752AE57
      52AE5752AE5752AE5752AE574C804C0000000000000000000000000000000000
      0000008400008400008400008400008484848400000000000000000000000000
      000000000000000000000084848400000000000000000000000084848400FF00
      00FF0000840000000000000000000000000000000000000085858500FFFF8585
      8500FFFF85858500FFFF00FFFF00FFFFFFE7D6B58C8CB58C8CB58C8C9C6B6B00
      0000B58C8CFFFFF7FFD6A5FFD6A5B58C8CFFFFFFFFFFFF4C804C69CA8069CA80
      69CA8052AE5752AE5752AE574C804C0000000000000000000000000000000000
      8400008400008400000000008400008400008484848400000000000000000000
      0000000000000000000000000000000000000000000000000000000000848484
      00FF0000FF0000840000000000000000000085858585858585858585858500FF
      FF858585858585858585858585FFFFF7FFFFF7B58C8CFFFFFFC68C7B00000000
      0000B58C8CFFFFF7FFE7D6FFE7D6B58C8CB58C8CB58C8C4C804C4C804C4C804C
      69CA8052AE574C804C4C804C4C804C0000000000000000000000000000840000
      8400008400000000000000000000008400008400008484848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      84848400FF0000FF0000000000000000000000000000000000FFFF85858500FF
      FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFB58C8CC68C7B00000000000000
      0000B58C8CFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7EFDEDED6C6C6BDADAD4C804C
      69CA8052AE574C804C0000000000000000000000000000000000840000840000
      8400000000000000000000000000000000008400008400008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000084848400FF0000000000000000000000000000FFFF85858500FFFF8585
      8500FFFF85858500FFFFB58C8CB58C8CB58C8CB58C8C00000000000000000000
      0000B58C8CFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7B58C8CB58C8CB58C8C4C804C
      4C804C4C804C4C804C0000000000000000000000000000000000840000840000
      0000000000000000000000000000000000000000008400008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400000000000000000000000085858500FFFF0000008585
      8500FFFF00000085858500FFFF00000000000000000000000000000000000000
      0000B58C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB58C8CEFB56BC68C7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008585
      8500FFFF00000000000000000000000000000000000000000000000000000000
      0000B58C8CB58C8CB58C8CB58C8CB58C8CB58C8CB58C8CBD8484000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00FFFF0000000000008003000000000000
      8003000000000000800300000000000080030000000000008003000000000000
      8003000000000000800300000000000080030000000000008003000000000000
      8003000000000000800300000000000080030000000000008007000000000000
      800F000000000000801F000000000000FFFFFFFFFFFFC001FFFFCF3F0021C001
      FFFF80010029C001FDFF80010021C001F8FF80010021C001F07F8001FFFEC001
      E03FC0010021C001C01FE0010029C001C60FE0010021C001EF07E0010021C001
      FF83E001FFFEC001FFC3E0010021C001FFE3E0010029C001FFF7E0030021C001
      FFFFE0070021C001FFFFE00FFFFEFFFFF81FFFFFFFFFE020E007800F80012000
      C003000780012000800100038001203080010003800120300000000180016030
      000000018001403000008001800140300000C001800100300000C00380010030
      0000C00F800100308001E007800100308003E00780010030C007F00380030030
      E00FF80380070010F83FFFFFFFFF0000FFFF800FFCFFFFFFE001800FFC3FFF3F
      E001800FFC1FFE3FE001800FF803FC3FE001800FF003FC3FC001800FF803FC3F
      C001800FD803FC3FE001800FD803FC3FE001800F0003FC3FE001800F8003F81F
      E00180EFD803F00FE001808FD003E007E003808FF803C003C007878FF8038001
      800F000FF8030000FF9F000FF803FFFFE001F003FFFFFFFFE001F003FFFFFFFF
      E001F003FFFFFFFFE001F003C7E7FDFFE0010003C3C7F8FFE0010003E18FF07F
      E0010003F01FE03FE0010003F83FC01FA0010001FC3FC60F80010001F81FEF07
      C0010001F10FFF8300030001E387FFC3C0070007C7C7FFE3800F0007CFE7FFF7
      927F007FFFFFFFFFF3FF00FFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 24
    Top = 200
  end
  object ProvsDataSource: TDataSource
    DataSet = ProvsDataSet
    Left = 56
    Top = 232
  end
  object DetailDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    DataSource = ProvsDataSource
    Left = 24
    Top = 264
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object DetailDataSource: TDataSource
    DataSet = DetailDataSet
    Left = 56
    Top = 264
  end
  object DBTemplatesDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    DataSource = ProvsDataSource
    AfterOpen = DBTemplatesDataSetAfterOpen
    Left = 24
    Top = 296
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object DBTemplatesDataSource: TDataSource
    DataSet = DBTemplatesDataSet
    Left = 56
    Top = 296
  end
  object ColAnInfoDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 24
    Top = 328
    poSQLINT64ToBCD = True
  end
  object KrTemplatesDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    DataSource = ProvsDataSource
    AfterOpen = KrTemplatesDataSetAfterOpen
    Left = 24
    Top = 360
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object KrTemplatesDataSource: TDataSource
    DataSet = KrTemplatesDataSet
    Left = 56
    Top = 360
  end
  object ActionList1: TActionList
    Left = 112
    Top = 208
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 16424
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 16422
      OnExecute = Action2Execute
    end
    object InsertAction: TAction
      Caption = 'InsertAction'
      ShortCut = 45
      OnExecute = AddButtonClick
    end
    object EditSumAction: TAction
      Caption = 'EditSumAction'
      ShortCut = 16467
      OnExecute = EditSumActionExecute
    end
  end
  object TypeDocDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from PUB_INI_TYPE_DOC')
    Left = 296
    Top = 64
    poSQLINT64ToBCD = True
  end
  object TypeDataSource: TDataSource
    DataSet = TypeDocDataSet
    Left = 328
    Top = 64
  end
  object InfoDoc: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 24
    Top = 392
    poSQLINT64ToBCD = True
  end
  object DocInfoDataSource: TDataSource
    DataSet = InfoDoc
    Left = 56
    Top = 392
  end
end
