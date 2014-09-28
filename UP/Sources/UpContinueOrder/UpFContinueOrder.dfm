object FContinueOrder: TFContinueOrder
  Left = 308
  Top = 101
  Width = 805
  Height = 575
  Caption = 'FContinueOrder'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 507
    Width = 797
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    OnResize = Panel1Resize
    object OkButton: TcxButton
      Left = 536
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      TabOrder = 0
      OnClick = OkButtonClick
      LookAndFeel.Kind = lfFlat
    end
    object CancleBtn: TcxButton
      Left = 616
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      OnClick = CancleBtnClick
      LookAndFeel.Kind = lfFlat
    end
  end
  object cxGridPeople: TcxGrid
    Left = 0
    Top = 44
    Width = 797
    Height = 422
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 2
    OnResize = cxGridPeopleResize
    LookAndFeel.Kind = lfUltraFlat
    RootLevelOptions.DetailTabsPosition = dtpTop
    OnActiveTabChanged = cxGridPeopleActiveTabChanged
    object cxGridPeopleDBTableView1: TcxGridDBTableView
      DataController.DataSource = DSourceFilter
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'ID_ORDER_ITEM'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'TN'
          Column = GridFilterClWorkReason
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnSorting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object GridFilterClNumSubItem: TcxGridDBColumn
        Caption = #1055#1110#1076#1087#1091#1085#1082#1090
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        SortOrder = soAscending
        Width = 81
        DataBinding.FieldName = 'NUM_SUB_ITEM'
      end
      object GridFilterClTn: TcxGridDBColumn
        Caption = #1058#1053
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 54
        DataBinding.FieldName = 'TN'
      end
      object GridFilterClFIO: TcxGridDBColumn
        Caption = #1055'.'#1030'.'#1041'.'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 179
        DataBinding.FieldName = 'FIO'
      end
      object GridFilterClDateBeg: TcxGridDBColumn
        Caption = #1055#1086#1095#1072#1090#1086#1082
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 99
        DataBinding.FieldName = 'DATE_BEG'
      end
      object GridFilterClDateEnd: TcxGridDBColumn
        Caption = #1047#1072#1074#1077#1088#1096#1077#1085#1085#1103
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 82
        DataBinding.FieldName = 'DATE_END'
      end
      object GridFilterClWorkReason: TcxGridDBColumn
        Caption = #1055#1110#1076#1089#1090#1072#1074#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 93
        DataBinding.FieldName = 'NAME_WORK_REASON'
      end
      object GridFilterClId: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_ORDER_ITEM'
      end
      object GridFilterClIdMoving: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_MAN_MOVING'
      end
    end
    object cxGridPeopleDBCardView2: TcxGridDBCardView
      DataController.DataSource = DSourceFilter
      DataController.DetailKeyFieldNames = 'ID_ORDER_ITEM'
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'ID_ORDER_ITEM'
      DataController.MasterKeyFieldNames = 'ID_ORDER_ITEM'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.CardWidth = 500
      object GridFilterCardsClTN: TcxGridDBCardViewRow
        Caption = #1058#1072#1073'. '#1085#1086#1084#1077#1088
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        DataBinding.FieldName = 'TN'
      end
      object GridFilterCardsClFIO: TcxGridDBCardViewRow
        Caption = #1055'.'#1030'.'#1041'.'
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        DataBinding.FieldName = 'FIO'
      end
      object GridFilterCardsClWorkReason: TcxGridDBCardViewRow
        Caption = #1055#1110#1076#1089#1090#1072#1074#1072
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Options.Filtering = False
        DataBinding.FieldName = 'NAME_WORK_REASON'
      end
      object GridFilterCardsClNameDepartment: TcxGridDBCardViewRow
        Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        DataBinding.FieldName = 'DEPARTMENT_NAME'
      end
      object GridFilterCardsClNameTypePost: TcxGridDBCardViewRow
        Caption = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
        Options.Filtering = False
        DataBinding.FieldName = 'NAME_TYPE_POST'
      end
      object GridFilterCardsClDateBeg: TcxGridDBCardViewRow
        Caption = #1055#1086#1095#1072#1090#1086#1082
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DateButtons = []
        Visible = False
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        DataBinding.FieldName = 'DATE_BEG'
      end
      object GridFilterCardsClDateEnd: TcxGridDBCardViewRow
        Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Visible = False
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        DataBinding.FieldName = 'DATE_END'
      end
      object GridFilterCardsClTerm: TcxGridDBCardViewRow
        Caption = #1058#1077#1088#1084#1110#1085' '#1088#1086#1073#1086#1090#1080':'
        DataBinding.FieldName = 'OLD_WORK_TERM'
      end
      object GridFilterCardsClTermNew: TcxGridDBCardViewRow
        Caption = #1053#1086#1074#1080#1081' '#1090#1077#1088#1084#1110#1085' '#1088#1086#1073#1086#1090#1080':'
        DataBinding.FieldName = 'WORK_TERM'
      end
      object GridFilterCardsClIsMainPost: TcxGridDBCardViewRow
        Caption = #1054#1089#1085#1086#1074#1085#1072' '#1087#1086#1089#1072#1076#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        OnGetDisplayText = GridFilterCardsClIsMainPostGetDisplayText
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        DataBinding.FieldName = 'IS_POST_MAIN'
      end
      object GridFilterCardsClPostSalary: TcxGridDBCardViewRow
        Caption = #1055#1086#1089#1072#1076#1086#1074#1080#1081' '#1086#1082#1083#1072#1076
        DataBinding.FieldName = 'post_name'
      end
      object GridFilterCardsClPostSalaryReal: TcxGridDBCardViewRow
        Caption = #1060#1072#1082#1090#1080#1095#1085#1080#1081' '#1086#1082#1083#1072#1076
        DataBinding.FieldName = 'real_post_name'
      end
      object GridFilterCardsClWorkCond: TcxGridDBCardViewRow
        Caption = #1059#1084#1086#1074#1080' '#1088#1086#1073#1086#1090#1080
        DataBinding.FieldName = 'name_work_cond'
      end
      object GridFilterCardsClPayForm: TcxGridDBCardViewRow
        Caption = #1058#1080#1087' '#1086#1087#1083#1072#1090#1080
        DataBinding.FieldName = 'name_pay_form'
      end
      object GridFilterCardsClReason: TcxGridDBCardViewRow
        Caption = #1055#1110#1076#1089#1090#1072#1074#1072
        DataBinding.FieldName = 'reason'
      end
      object GridFilterCardsClAcceptCond: TcxGridDBCardViewRow
        Caption = #1042#1089#1090#1091#1087' '#1085#1072' '#1087#1086#1089#1072#1076#1091
        DataBinding.FieldName = 'name_accept_cond'
      end
      object GridFilterCardsClAcceptBeg: TcxGridDBCardViewRow
        Caption = #1055#1086#1095#1072#1090#1086#1082' '#1074#1089#1090#1091#1087#1091' '#1085#1072' '#1087#1086#1089#1072#1076#1091
        PropertiesClassName = 'TcxDateEditProperties'
        Visible = False
        DataBinding.FieldName = 'ACCEPT_BEG'
      end
      object GridFilterCardsClAcceptEnd: TcxGridDBCardViewRow
        Caption = #1044#1072#1090#1072' '#1087#1077#1088#1077#1086#1073#1088#1072#1085#1085#1103
        PropertiesClassName = 'TcxDateEditProperties'
        Visible = False
        DataBinding.FieldName = 'ACCEPT_END'
      end
      object GridFilterCardsClAcceptTerm: TcxGridDBCardViewRow
        Caption = #1058#1077#1088#1084#1110#1085' '#1087#1086#1089#1072#1076#1080
        DataBinding.FieldName = 'ACCEPT_TERM'
      end
      object GridFilterCardsClHospital: TcxGridDBCardViewRow
        Caption = #1053#1072' '#1095#1072#1089' '#1083#1110#1082#1072#1088#1085#1103#1085#1086#1075#1086
        DataBinding.FieldName = 'hospital_display_text'
      end
      object GridFilterCardsClHoliday: TcxGridDBCardViewRow
        Caption = #1053#1072' '#1095#1072#1089' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
        DataBinding.FieldName = 'holiday_display_text'
      end
    end
    object cxGridPeopleDBBandedTableView1: TcxGridDBBandedTableView
      DataController.DataSource = DSourceSmets
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = #1057#1090#1072#1074#1082#1072' = 0.000'
          Kind = skSum
          FieldName = 'RATE_COUNT'
          Column = GridSmetsClRateCount
        end>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsCustomize.BandMoving = False
      OptionsCustomize.ColumnVertSizing = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.BandHeaders = False
      Bands = <
        item
        end
        item
          Width = 372
        end>
      object GridSmetsClRateCount: TcxGridDBBandedColumn
        Caption = #1057#1090#1072#1074#1082#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.LineCount = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'RATE_COUNT'
      end
      object GridSmetsClKoeffPPS: TcxGridDBBandedColumn
        Caption = #1050#1086#1077#1092#1110#1094#1110#1077#1085#1090
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.LineCount = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'KOEFF_PPS'
      end
      object GridSmetsClKodSmet: TcxGridDBBandedColumn
        Caption = #1050#1086#1076
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 78
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'KOD_SMET'
      end
      object GridSmetsClNameSmet: TcxGridDBBandedColumn
        Caption = #1057#1084#1077#1090#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        SortOrder = soAscending
        Width = 294
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'NAME_SMET'
      end
      object GridSmetsClKodSmetPPS: TcxGridDBBandedColumn
        Caption = #1050#1086#1076' '#1055#1055#1057
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 78
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 1
        DataBinding.FieldName = 'KOD_SMET_PPS'
      end
      object GridSmetsClNameSmetPPS: TcxGridDBBandedColumn
        Caption = #1057#1084#1077#1090#1072' '#1055#1055#1057
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 294
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 1
        DataBinding.FieldName = 'NAME_SMET_PPS'
      end
      object GridSmetsClOkladBae: TcxGridDBBandedColumn
        Caption = #1054#1082#1083#1072#1076
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'OKLAD_BASE'
      end
      object GridSmetsClOkladPPS: TcxGridDBBandedColumn
        Caption = #1054#1082#1083#1072#1076' '#1055#1055#1057
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 1
        DataBinding.FieldName = 'Oklad_pps'
      end
      object GridSmetsClPeriod: TcxGridDBBandedColumn
        Caption = #1055#1077#1088#1110#1086#1076
        Visible = False
        GroupIndex = 0
        SortOrder = soAscending
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'PERIOD'
      end
    end
    object GridBonusView: TcxGridDBBandedTableView
      DataController.DataSource = DSourceBonus
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
      OptionsView.Indicator = True
      OptionsView.BandHeaders = False
      Bands = <
        item
          Width = 420
        end
        item
          Width = 71
        end
        item
          Width = 242
        end
        item
          Width = 83
        end>
      object GridBonusClRaiseName: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072' '#1085#1072#1076#1073#1072#1074#1082#1080
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 173
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.LineCount = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'BONUS_NAME'
      end
      object GridBonusClPercent: TcxGridDBBandedColumn
        Caption = #1042#1110#1076#1089#1086#1090#1086#1082
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 59
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.LineCount = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'PERCENT'
      end
      object GridBonusClSumma: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 104
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'SUMMA'
      end
      object GridBonusClSmetaKod: TcxGridDBBandedColumn
        Caption = #1050#1086#1076
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 80
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'KOD_SMET'
      end
      object GridBonusClSmetaName: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072' '#1089#1084#1077#1090#1080
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 267
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'NAME_SMET'
      end
      object GridBonusClSmetaPPSKod: TcxGridDBBandedColumn
        Caption = #1050#1086#1076' '#1087#1110#1076#1074#1080#1097#1077#1085#1085#1103
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 80
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 1
        DataBinding.FieldName = 'KOD_SMET_PPS'
      end
      object GridBonusClSmetaPPSName: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072' '#1089#1084#1077#1090#1080' '#1087#1110#1076#1074#1080#1097#1077#1085#1085#1103
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 267
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 1
        DataBinding.FieldName = 'NAME_SMET_PPS'
      end
      object GridBonusClSummaPPS: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1072' '#1087#1110#1076#1074#1080#1097#1077#1085#1085#1103
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 104
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 1
        DataBinding.FieldName = 'SUMMA_PPS'
      end
      object GridBonusClPeriod: TcxGridDBBandedColumn
        Caption = #1055#1077#1088#1110#1086#1076' '#1086#1082#1083#1072#1076#1072
        Visible = False
        GroupIndex = 0
        SortOrder = soAscending
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'PERIOD'
      end
      object GridBonusClBonusBeg: TcxGridDBBandedColumn
        Caption = #1055#1086#1095#1072#1090#1086#1082
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 56
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.LineCount = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'BONUS_BEG'
      end
      object GridBonusClBonusEnd: TcxGridDBBandedColumn
        Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 60
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.LineCount = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'BONUS_END'
      end
    end
    object cxGridPeopleLevel1: TcxGridLevel
      Caption = #1055#1077#1088#1077#1084#1110#1097#1077#1085#1085#1103
      GridView = cxGridPeopleDBTableView1
      object cxGridPeopleLevel3: TcxGridLevel
        GridView = cxGridPeopleDBCardView2
      end
    end
    object cxGridPeopleLevel2: TcxGridLevel
      Caption = #1060#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      GridView = cxGridPeopleDBBandedTableView1
    end
    object cxGridPeopleLevel4: TcxGridLevel
      Caption = #1053#1072#1076#1073#1072#1074#1082#1080
      GridView = GridBonusView
    end
  end
  object dxBarDockControl1: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 797
    Height = 44
    Align = dalTop
    BarManager = dxBM_OrdAcc
  end
  object PanelBonuses: TPanel
    Left = 0
    Top = 466
    Width = 797
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 7
    object CheckBoxAddBonuses: TcxCheckBox
      Left = 0
      Top = 0
      Width = 793
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.ValueChecked = 'T'
      Properties.ValueUnchecked = 'F'
      Properties.Caption = #1042#1089#1090#1072#1085#1086#1074#1080#1090#1080' '#1086#1073#1086#1074#39#1103#1079#1082#1086#1074#1110' '#1085#1072#1076#1073#1072#1074#1082#1080
      State = cbsChecked
      TabOrder = 0
    end
    object CheckBoxReSetBonuses: TcxCheckBox
      Left = 0
      Top = 17
      Width = 793
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.ValueChecked = 'T'
      Properties.ValueUnchecked = 'F'
      Properties.Caption = 
        #1044#1086#1076#1072#1090#1080' '#1074#1110#1076#1089#1086#1090#1082#1086#1074#1110' '#1085#1072#1076#1073#1072#1074#1082#1080', '#1074#1089#1090#1072#1085#1086#1074#1083#1077#1085#1110' '#1085#1072' '#1086#1089#1090#1072#1085#1085#1102' '#1076#1072#1090#1091' '#1087#1077#1088#1077#1084#1110#1097#1077 +
        #1085#1085#1103
      State = cbsChecked
      TabOrder = 1
    end
  end
  object DBase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 192
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DBase
    TimeoutAction = TARollback
    Left = 72
    Top = 192
  end
  object dxBM_OrdAcc: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'FilterPeople'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 34
        FloatClientHeight = 90
        ItemLinks = <
          item
            Item = AddBtn
            Visible = True
          end
          item
            Item = DelBtn
            Visible = True
          end
          item
            Item = AddSmetBtn
            Visible = True
          end
          item
            Item = EditSmetBtn
            Visible = True
          end
          item
            Item = DelSmetBtn
            Visible = True
          end
          item
            Item = AddBonusBtn
            Visible = True
          end
          item
            Item = EditBonusBtn
            Visible = True
          end
          item
            Item = DelBonusBtn
            Visible = True
          end
          item
            Item = RefreshBtn
            Visible = True
          end
          item
            Item = dxBarStatic1
            Visible = True
          end
          item
            Item = dxBarStatic3
            Visible = True
          end
          item
            Item = dxBarStatic2
            Visible = True
          end
          item
            Item = DateEditBar
            Visible = True
          end
          item
            Item = dxBarStatic4
            Visible = True
          end
          item
            Item = BarEditFoundation
            UserDefine = [udWidth]
            UserWidth = 144
            Visible = True
          end
          item
            Item = dxBarStatic5
            Visible = True
          end
          item
            Item = ContinueBtn
            Visible = True
          end>
        Name = 'FilterPeople'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        ShowMark = False
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    ShowShortCutInHint = True
    UseSystemFont = True
    Left = 72
    Top = 328
    DockControlHeights = (
      0
      0
      0
      0)
    object AddBtn: TdxBarLargeButton
      Caption = #1044#1086#1076#1072#1090#1080
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080
      Visible = ivAlways
      OnClick = AddBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF00FF00FF00025C0400035D0500025C0500035C0700058F0D00058E0D00058C
        0D0006900F00068E0E0007921100089212000A9716000A9616000B9817000C97
        18000D9C1B000F9C1D000E9D1D000F9D1E00109E200011A0220013A1240014A3
        260015A4280016A72B0018A72C0018AA2F001AAC31001CAF35001CAC33001EB0
        370020B63B0021B53C0022B53E0024BA410025BD440025BA430028BD480029C1
        4B002AC24D002AC04B002DC752002DC653002DC5520030C9560033CC5A0033CA
        5A0034CC5C0036D0600038D3640037CF62003AD367003CD76B003DD86B003FD9
        6F0040DA700041DD730043E17700000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202060606060202020202020202
        0202020202020202020202030108070706020202020202020202020202020202
        0202020301080707060202020202020202020202020202020202020301080707
        0602020202020202020202020202020202020205010807070602020202020202
        020202020202020202020204010A070706020202020202020202020202020202
        02020204010F0C0C060202020202020202020202020606060606060401141010
        040606060606060202020202060134302C2926221B181511120E0C0707070706
        02020202060134302C292622201C1916120E0C07070707060202020206013735
        312E2B27231F1D1A1713110D0B0908060202020206010101010101010124211E
        0101010101010106020202020206060606060604012825250406060606060602
        020202020202020202020206012D2A2A06020202020202020202020202020202
        0202020601322F2F060202020202020202020202020202020202020601363333
        06020202020202020202020202020202020202060139383C0602020202020202
        020202020202020202020206013A3B3C06020202020202020202020202020202
        0202020601010101060202020202020202020202020202020202020206060606
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202}
    end
    object DelBtn: TdxBarLargeButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080
      Visible = ivAlways
      OnClick = DelBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF00FF00FF007C8EDA00A6B0DA000003E1000003E0000001DD000001DC000003
        DC000001D5000003D5000001CF000002CF000001C8000002C8000001C3000002
        C2000001BB000002BA000001B6000001B5000000B0000001AE000000A8000001
        A7000000A3000001A20000009D0000019A00000198000002970000006D00E1E1
        E100000000000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020220202020202020202020
        202020202020020202020202022003050505090B0D0F11131517191B1D1D2002
        02020202022021050606090B0D0F11131517191B1D1F20020202020202202107
        0808080A0C0E10121416181A1C1E200202020202022021212121212121212121
        2104040303032002020202020202202020202020202020202020202020200202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202}
    end
    object ExitBtn: TdxBarLargeButton
      Align = iaRight
      Caption = #1042#1080#1081#1090#1080
      Category = 0
      Hint = #1042#1080#1081#1090#1080
      Visible = ivAlways
      OnClick = ExitBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF00FF00FF004E1E1F00BF4C4D00BD4B4C00C04D4E00C14E4F00C4505100C24F
        5000C5515200B64B4C00C9545500C7535400C6525300CA555600CB565700CE58
        5900CC575800C5545500D05A5B00CF595A00D35C5D00D15B5C00D55E5F00D45D
        5E00D8606200D75F6000AF4E4F00D9626300DD656600DC646500DA636400E067
        6800DE666700E2696A00E1686900E56B6C00E36A6B00E96E6F00E76D6E00E66C
        6D009F4B4C00EA6F7000A04C4D00EB707200A34E4F00EE737400ED7273009C4B
        4C00F2767700F0757600EF747500E06D6E00A6515200F6797A00F4787900F377
        7800A9535400F87B7D00F77A7B00FB7E7F00FA7D7E00AF585900AC5657009A4D
        4E00FF818200FE808100FC7F8000F77E7F00B25B5C00EE7A7B00D56F7000B860
        6200B6626300AF5E5F00FE8B8C0091515200FC929300EF909100FB9A9C00E690
        9100EB959600FAA3A400F8AAAB00F2A9AA00EEA6A700F7B5B600A5505000994B
        4B00AB555500B15A5A00B55D5D00B75F5F00914B4B00BB636300BF666600BD65
        65008C4B4B00894B4B009F58580098555500824B4B00EB9C9C00F7B1B100EECE
        AF00FFFFD300D9F6BD00B7EBAA0058A55B003F9E4C005ED3770045CA67001EBC
        4C00000000000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000020202020202
        02020202026603020202020202020202020202020202020202026666625E0302
        020202020202020202020202020202666663310B052A03020202020202020202
        02020202026666411C070604042A03596666666666666666020202020266130C
        0D0E0A08092C034C4E505354685757660202020202661112100F0C0D0E2E036E
        71717171717157660202020202661714151112100F58036E7171717171715766
        0202020202661818191617141536036E7171717171715766020202020266201D
        1A1B1819163A036E7171717171715766020202020266221E1F201D1A1B5A036E
        71717171717157660202020202662324212235511F40036D7171717171715766
        020202020266282925265601673F03696C6F6F70707057660202020202662D2B
        27285501525B03696A6A6A6A6B6B5766020202020266342F302D2B4F28460369
        6A6A6A6A6A6A576602020202026639393233342F305C03696A6A6A6A6A6A5766
        0202020202663B3C37383932335D03696A6A6A6A6A6A5766020202020266443D
        3E3B3C37384903696A6A6A6A6A6A576602020202026642424344443D3E5F0369
        6A6A6A6A6A6A5766020202020266424242424243436103696A6A6A6A6A6A5766
        020202020266454242424242426003696A6A6A6A6A6A5766020202020266664B
        48424242426003696A6A6A6A6A6A57660202020202020266664D4A474260035E
        6666666666666666020202020202020202026666656403020202020202020202
        0202020202020202020202020266030202020202020202020202}
      ShowCaption = False
    end
    object AddSmetBtn: TdxBarLargeButton
      Action = ActionAddSmet
      Caption = #1044#1086#1076#1072#1090#1080
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      AutoGrayScale = False
      LargeGlyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF0094635A00A5636B00A5636B00A5636B00A5636B00A5636B00A563
        6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
        6B00A5636B00A5636B00A5636B00A5636B00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094635A00EFD6B500F7DEB500F7D6AD00F7D6A500F7CE9C00EFCE
        9400EFC69400EFC68C00EFC68400EFC68400EFC68400EFC68400EFC68400EFC6
        8400EFC68400EFC68400EFBD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094635A00EFD6BD00F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE
        9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD
        7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094635A00EFD6C600F7E7C600F7DEBD00F7D6B500F7D6AD00EFCE
        A500EFCE9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD
        7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094635A00EFDEC600F7E7C600F7DEBD00F7DEB500F7D6B500F7D6
        AD00EFCEA500EFCE9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD
        7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094636300F7DECE00FFE7CE00F7E7C600F7DEBD00F7DEB500F7D6
        B500EFCEA500DEBD9400D6B58C00D6B58400DEB58400E7BD8400EFBD8400EFBD
        7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094636300F7E7D600FFEFD600F7E7CE00F7DEC600F7DEBD00F7DE
        BD00DEC6A500BDA58400AD947300A58C6B00BD9C7300DEB58400EFC68C00EFBD
        8400EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009C6B6300F7E7DE00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DE
        BD00004A0000004A0000004A0000004A0000A58C6B00D6B58400EFC68C00EFC6
        8C00EFBD8400EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009C6B6300F7EFE700FFF7E700FFEFDE00F7E7CE00E7D6BD00DECE
        B500004A00000894100000940800004A0000A58C6B00C6AD8400D6B58400DEB5
        8400E7BD8400EFBD8400E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A5736300F7EFEF00FFF7EF00FFEFE700E7DECE00C6B5A500AD9C
        8C00004A0000089C1800089C1000004A000094846B00A58C6B00A58C6B00BD9C
        7300DEB58400EFC68C00E7BD84009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A5736B00FFF7F700FFFFF700FFF7EF00004A0000004A0000004A
        0000004A000010A5210008A51800004A0000004A0000004A0000004A0000A58C
        6B00D6B58400EFC68C00EFBD84009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AD7B6B00FFF7F700FFFFFF00FFFFF700004A000021C6420021C6
        420018BD390018B5310010AD290010A5210008A51800089C1000004A0000AD94
        7300D6B58C00EFCE9400EFC68C00A5736300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00B57B6B00FFF7F700FFFFFF00FFFFFF00004A000029D6520029CE
        4A0021C6420018BD390018B5310010B5290010AD210010A52100004A0000BDA5
        8400DEBD9400EFCE9C00EFC69400A5736300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00B5846B00FFF7F700FFFFFF00FFFFFF00004A0000004A0000004A
        0000004A000021CE4A0021C64200004A0000004A0000004A0000004A0000E7C6
        A500EFCEA500F7CEA500EFCE9C009C736300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD846B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
        F700004A000029D65A0029CE5200004A0000AD9C8C00DECEB500F7DEBD00F7DE
        B500F7D6AD00EFD6A500CEB594008C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C68C6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00004A000031DE630031DE5A00004A0000C6B5A500E7D6BD00F7DEC600F7DE
        BD00E7CEAD00C6B59400A5947B0084636300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C68C7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00004A0000004A0000004A0000004A0000E7DECE00F7E7CE00FFEFD600E7D6
        BD00BDAD9C00A59C8C00A5948400846B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00CE947300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFF7E700EFD6C6009C635A009C63
        5A0094635A0094635A0094635A009C6B5A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00CE947300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFFFEF00DEC6B5009C635A00DEA5
        6B00DE9C4A00E7943900EF8C2100A56B6B00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D69C7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700DEC6BD009C635A00EFB5
        7300EFAD5200F7A53100A56B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D69C7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C6009C635A00EFB5
        7300EFA55200A56B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D69C7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE009C635A00EFB5
        7300A56B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D6947300E7C6AD00E7C6B500E7C6B500E7C6B500E7C6B500E7C6
        AD00DEBDAD00DEBDAD00DEBDAD00D6B5AD00D6B5AD00C69C94009C635A00A56B
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object EditSmetBtn: TdxBarLargeButton
      Action = ActionEditSmet
      Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
      Category = 0
      Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
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
        BF0001099700010A9700050DA50000058F00000082001F1F2100040404040404
        0404040404040404040404040404040404043506060606060606060606060606
        06060606060404040404356F9B7A9895928E8985B3A9A8A8A8A8A6A942040404
        0404355C9DC47B99969390C2BBB4AEA9A8A8A6A942040404040435679F9B9A02
        5E97C38FBEBCB8ABAAA9A6A94204040404043272A07C9C5AFFE6D0948D8887B5
        ADAEA9A942040404040434608071709EDFE2E5DECE918B86B6AFA5C842040404
        04043668A37F7DC5D9E1E4E7EA055FBFBAB7A7AC3D04040404043962A483737E
        CFE3E811120D2E66C084B1B04704040404043A57C675827372DD16221B120D2E
        65C1B9B23E04040404044158C9767583A1D31D271E1C130C096D8CBD3F040404
        04044353CD6B6975A274302C271E1C1310096E8A400404040404485301CB6A76
        61815D302A271F1A140E09644404040404044B530101495B7675835D2F2D2920
        1A140E314504040404044A53010101CB5B7661814E2F28232018150A09040404
        0404515301010101CB5B6961A24E2F28262118150A0904040404505301010101
        01496B7675814C172B2421190BEBE90404044F53010101010101CBC769A45C37
        172B2403DCD4D5DA0404563C0101010101010149C7CA4D38591725D8D1D1D5ED
        FE045552010101010101010149CC463879630FD6D1E0EDF7FBFE555201010101
        0101010101013B386C7708D7D2ECF3F2F0FB55CD010101010101010101013338
        78070404DBF6EEF4F1FD54545454545454545454545454380704040404F9EFF5
        FA040404040404040404040404040404040404040404F8FC0404}
    end
    object DelSmetBtn: TdxBarLargeButton
      Action = ActionDelSmet
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FF0005B70005B70005
        B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FFFF00FF
        0005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FFFF
        00FFFF00FFFF00FF0005B70005B70005B70005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B700
        05B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006
        F60005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FF0005B700
        05B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FF0005
        B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B70005B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF0005B70005B70006F60005B70006F60005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70006F60005B7FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F60005B70005
        B70006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F6
        0005B70006F60006F60006F60005B70006F6FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60005B70006F6FF00FFFF00FF0006F60006F60006F60006F6FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0006F60006F60005B70006F60006F6FF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0006F6FF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006
        F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F6
        0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object dxBarStatic1: TdxBarStatic
      Category = 0
      Visible = ivAlways
      ShowCaption = False
    end
    object dxBarStatic2: TdxBarStatic
      Category = 0
      Visible = ivAlways
      ShowCaption = False
    end
    object dxBarStatic3: TdxBarStatic
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ShowCaption = False
    end
    object DateEditBar: TdxBarDateCombo
      Align = iaCenter
      Caption = #1055#1088#1086#1076#1086#1074#1078#1080#1090#1080' '#1076#1086':'
      Category = 0
      Hint = #1044#1083#1103' '#1074#1089#1103#1093' '#1086#1073#1088#1072#1085#1080#1093' '#1079#1072#1087#1080#1089#1110#1074' '#1087#1088#1086#1076#1086#1074#1078#1080#1090#1080' '#1090#1077#1088#1084#1110#1085' '#1076#1086':'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      ShowCaption = True
      Width = 100
      ShowClearButton = False
    end
    object ContinueBtn: TdxBarLargeButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1090#1077#1088#1084#1110#1085
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1090#1077#1088#1084#1110#1085
      Visible = ivAlways
      OnClick = ContinueBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF00FF00FF00004B0000035E0600046408000793100008961100089612000997
        130009971400099612000996130007740E000A9915000B991600097411000C9A
        18000D9E1B000FA01D000FA11F000C77170010951F000E7D1A00119620000F81
        1C00118C1F00139823001197220014A727001399250013902400159A2700138F
        2300169D2900169C2800159127001AAF31001BB033001B9F310021B83D001C9C
        340020AA3B0023AD410028C1490028C048002FC954002EC1520035CF5E0036D0
        60003BD768003FD96F0041DC7000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        02020302020202020202020202020202020202020202020202031A0302020202
        0202020202020202020202020202020203210623030202020202020202020202
        020202020202020324130F072003020202020202020202020202020202020319
        251D1411081E03020202020202020202020202020203172D28261F0322091B03
        0202020202020202020202020315302E2C27030203120A1C0302020202020202
        02020202033332312A0302020203100E1803020202020202020202020329342B
        03020202020202030F160302020202020202020202032F030202020202020202
        03110B0302020202020202020202030202020202020202020203050C03020202
        02020202020202020202020202020202020202030D0302020202020202020202
        0202020202020202020202020304030202020202020202020202020202020202
        0202020202020303020202020202020202020202020202020202020202020202
        0302020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202}
      ShowCaption = False
    end
    object RefreshBtn: TdxBarLargeButton
      Caption = #1054#1085#1086#1074#1080#1090#1080
      Category = 0
      Hint = #1054#1085#1086#1074#1080#1090#1080
      Visible = ivAlways
      OnClick = RefreshBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF92635D8E5D598E5D598E5D598E5D598E5D598E5D598E5D59
        8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598050
        4BFF00FFFF00FFFF00FFFF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0
        CE9EEFCB97EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080
        EDC180EABF7F80504BFF00FFFF00FFFF00FFFF00FFFF00FF93655FEED4B8F4DA
        BBF2D5B1F0D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9BD7FE9
        BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF
        93655FEED7C0F6E0C1F2D9B8F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC58FEBC1
        89EABF82E9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF
        00FFFF00FFFF00FF93655FEFDAC5F7E2C7F3DCBFF2D8B7007000F0D1AAEFCEA3
        B1B874007000007000007000ADAD60E9BD7FE9BD7FE9BD7FEABF7FE7BC7E8050
        4BFF00FFFF00FFFF00FFFF00FFFF00FF936560F0DECCF8E6CFF6E0C6F3DCBD00
        7000047503B2BD7F007000B1B874EDC796B0B46B007000ADAF62E9BD7FE9BD7F
        EABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2D3FAEA
        D7F6E3CEF4DEC5007000007000007000B2BD7FEFCEA3EECB9DEDC797B0B46B00
        7000E9BD81E9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF
        986963F2E6DAFAEEDEF7E7D4F6E2CB007000007000007000007000F0D1A9EFCE
        A3EECB9DEDC796007000EBC189E9BD81EABF7FE7BC7E80504BFF00FFFF00FFFF
        00FFFF00FFFF00FF9E6E64F4EAE1FBF2E6F8EADCF7E6D3007000007000007000
        007000007000F0D1AAEFCEA4EDCB9CEDC796EBC58FEBC188EABF82E7BB7E8050
        4BFF00FFFF00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3F7EADAF7
        E6D3F6E2CCF4DEC5F3DCBDF2D8B6F0D5B0F0D1AAEFCEA3EECA9CEDC795EBC48E
        EBC288E7BC8080504BFF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3F0FEFB
        F6FBF3EBF8EEE3F8EBDCF7E7D3F6E2CCF4E0C500700000700000700000700000
        7000EDCB9CEDC795EDC58FE9BF8780504BFF00FFFF00FFFF00FFFF00FFFF00FF
        AC7969FAF6F4FFFFFEFEF8F3FBF2EA007000F8EBDAF7E6D3F7E2CCF6E0C50070
        00007000007000007000EFCEA3EECB9CEEC996EAC18E80504BFF00FFFF00FFFF
        00FFFF00FFFF00FFB17E6BFAF6F4FFFFFFFFFEFBFEF7F0007000BAD4AAF8EADA
        F7E7D3F6E2CBB7C792007000007000007000F0D1A9EFCEA1EECB9CEBC5928050
        4BFF00FFFF00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFBBC
        DAB4007000B8D3AAF8EBDCB7CC9D007000B7C792047503007000F2D4AFF0D1A9
        F0CFA3EDC99980504BFF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFF
        FFFFFFFFFFFFFFFFFEFBBCDAB4007000007000007000B7CC9DF6E2CBF6DEC400
        7000F2D8B6F0D4AFEFD0A7CEB49180504BFF00FFFF00FFFF00FFFF00FFFF00FF
        C0896FFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFEF7F2FBF2EAFAEEE2F8EB
        DAF7E6D3F6E2CBF6DEC4F3DCBDE5CEAFC4B096A1927F80504BFF00FFFF00FFFF
        00FFFF00FFFF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFB
        FCF8F2FBF3EAF8EEE2F8EAD9F8E7D4FAE9D0E0D0BAB8AB9AA79C8BA497868050
        4BFF00FFFF00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C4A0675BA0675BA0675B
        A0675BA0675BA0675BFF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7F6FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B6A0
        675BDAA16BDD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FFFF00FF
        D49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
        FBFFFEF7DDC4BCA0675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFDDC7C2A0675BEAB273EFA751A5686BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CEA0675BEDB572A5686B
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E68CF8E
        68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68A0
        675BA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object BarEditFoundation: TdxBarEdit
      Caption = #1055#1110#1076#1089#1090#1072#1074#1072':'
      Category = 0
      Hint = #1055#1110#1076#1089#1090#1072#1074#1072':'
      Visible = ivAlways
      Text = #1079#1072#1103#1074#1072' %'#1055'.'#1030'.'#1041'.'
      ShowCaption = True
      Width = 100
    end
    object dxBarStatic4: TdxBarStatic
      Category = 0
      Visible = ivAlways
      ShowCaption = False
    end
    object dxBarStatic5: TdxBarStatic
      Category = 0
      Visible = ivAlways
      ShowCaption = False
    end
    object AddBonusBtn: TdxBarLargeButton
      Action = ActionAddBonus
      Caption = #1044#1086#1076#1072#1090#1080
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1085#1072#1076#1073#1072#1074#1082#1091
      AutoGrayScale = False
      LargeGlyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF0094635A00A5636B00A5636B00A5636B00A5636B00A5636B00A563
        6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
        6B00A5636B00A5636B00A5636B00A5636B00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094635A00EFD6B500F7DEB500F7D6AD00F7D6A500F7CE9C00EFCE
        9400EFC69400EFC68C00EFC68400EFC68400EFC68400EFC68400EFC68400EFC6
        8400EFC68400EFC68400EFBD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094635A00EFD6BD00F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE
        9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD
        7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094635A00EFD6C600F7E7C600F7DEBD00F7D6B500F7D6AD00EFCE
        A500EFCE9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD
        7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094635A00EFDEC600F7E7C600F7DEBD00F7DEB500F7D6B500F7D6
        AD00EFCEA500EFCE9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD
        7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094636300F7DECE00FFE7CE00F7E7C600F7DEBD00F7DEB500F7D6
        B500EFCEA500DEBD9400D6B58C00D6B58400DEB58400E7BD8400EFBD8400EFBD
        7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094636300F7E7D600FFEFD600F7E7CE00F7DEC600F7DEBD00F7DE
        BD00DEC6A500BDA58400AD947300A58C6B00BD9C7300DEB58400EFC68C00EFBD
        8400EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009C6B6300F7E7DE00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DE
        BD00004A0000004A0000004A0000004A0000A58C6B00D6B58400EFC68C00EFC6
        8C00EFBD8400EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009C6B6300F7EFE700FFF7E700FFEFDE00F7E7CE00E7D6BD00DECE
        B500004A00000894100000940800004A0000A58C6B00C6AD8400D6B58400DEB5
        8400E7BD8400EFBD8400E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A5736300F7EFEF00FFF7EF00FFEFE700E7DECE00C6B5A500AD9C
        8C00004A0000089C1800089C1000004A000094846B00A58C6B00A58C6B00BD9C
        7300DEB58400EFC68C00E7BD84009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A5736B00FFF7F700FFFFF700FFF7EF00004A0000004A0000004A
        0000004A000010A5210008A51800004A0000004A0000004A0000004A0000A58C
        6B00D6B58400EFC68C00EFBD84009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AD7B6B00FFF7F700FFFFFF00FFFFF700004A000021C6420021C6
        420018BD390018B5310010AD290010A5210008A51800089C1000004A0000AD94
        7300D6B58C00EFCE9400EFC68C00A5736300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00B57B6B00FFF7F700FFFFFF00FFFFFF00004A000029D6520029CE
        4A0021C6420018BD390018B5310010B5290010AD210010A52100004A0000BDA5
        8400DEBD9400EFCE9C00EFC69400A5736300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00B5846B00FFF7F700FFFFFF00FFFFFF00004A0000004A0000004A
        0000004A000021CE4A0021C64200004A0000004A0000004A0000004A0000E7C6
        A500EFCEA500F7CEA500EFCE9C009C736300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD846B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
        F700004A000029D65A0029CE5200004A0000AD9C8C00DECEB500F7DEBD00F7DE
        B500F7D6AD00EFD6A500CEB594008C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C68C6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00004A000031DE630031DE5A00004A0000C6B5A500E7D6BD00F7DEC600F7DE
        BD00E7CEAD00C6B59400A5947B0084636300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C68C7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00004A0000004A0000004A0000004A0000E7DECE00F7E7CE00FFEFD600E7D6
        BD00BDAD9C00A59C8C00A5948400846B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00CE947300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFF7E700EFD6C6009C635A009C63
        5A0094635A0094635A0094635A009C6B5A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00CE947300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFFFEF00DEC6B5009C635A00DEA5
        6B00DE9C4A00E7943900EF8C2100A56B6B00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D69C7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700DEC6BD009C635A00EFB5
        7300EFAD5200F7A53100A56B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D69C7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C6009C635A00EFB5
        7300EFA55200A56B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D69C7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE009C635A00EFB5
        7300A56B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D6947300E7C6AD00E7C6B500E7C6B500E7C6B500E7C6B500E7C6
        AD00DEBDAD00DEBDAD00DEBDAD00D6B5AD00D6B5AD00C69C94009C635A00A56B
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object EditBonusBtn: TdxBarLargeButton
      Action = ActionEditBonus
      Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
      Category = 0
      Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1085#1072#1076#1073#1072#1074#1082#1091
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
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
        BF0001099700010A9700050DA50000058F00000082001F1F2100040404040404
        0404040404040404040404040404040404043506060606060606060606060606
        06060606060404040404356F9B7A9895928E8985B3A9A8A8A8A8A6A942040404
        0404355C9DC47B99969390C2BBB4AEA9A8A8A6A942040404040435679F9B9A02
        5E97C38FBEBCB8ABAAA9A6A94204040404043272A07C9C5AFFE6D0948D8887B5
        ADAEA9A942040404040434608071709EDFE2E5DECE918B86B6AFA5C842040404
        04043668A37F7DC5D9E1E4E7EA055FBFBAB7A7AC3D04040404043962A483737E
        CFE3E811120D2E66C084B1B04704040404043A57C675827372DD16221B120D2E
        65C1B9B23E04040404044158C9767583A1D31D271E1C130C096D8CBD3F040404
        04044353CD6B6975A274302C271E1C1310096E8A400404040404485301CB6A76
        61815D302A271F1A140E09644404040404044B530101495B7675835D2F2D2920
        1A140E314504040404044A53010101CB5B7661814E2F28232018150A09040404
        0404515301010101CB5B6961A24E2F28262118150A0904040404505301010101
        01496B7675814C172B2421190BEBE90404044F53010101010101CBC769A45C37
        172B2403DCD4D5DA0404563C0101010101010149C7CA4D38591725D8D1D1D5ED
        FE045552010101010101010149CC463879630FD6D1E0EDF7FBFE555201010101
        0101010101013B386C7708D7D2ECF3F2F0FB55CD010101010101010101013338
        78070404DBF6EEF4F1FD54545454545454545454545454380704040404F9EFF5
        FA040404040404040404040404040404040404040404F8FC0404}
    end
    object DelBonusBtn: TdxBarLargeButton
      Action = ActionDelBonus
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1085#1072#1076#1073#1072#1074#1082#1091
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FF0005B70005B70005
        B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FFFF00FF
        0005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FFFF
        00FFFF00FFFF00FF0005B70005B70005B70005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B700
        05B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006
        F60005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FF0005B700
        05B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FF0005
        B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B70005B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF0005B70005B70006F60005B70006F60005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70006F60005B7FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F60005B70005
        B70006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F6
        0005B70006F60006F60006F60005B70006F6FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60005B70006F6FF00FFFF00FF0006F60006F60006F60006F6FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0006F60006F60005B70006F60006F6FF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0006F6FF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006
        F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F6
        0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object DSetFilter: TpFIBDataSet
    Database = DBase
    Transaction = ReadTransaction
    Left = 44
    Top = 192
    poSQLINT64ToBCD = True
  end
  object DSourceFilter: TDataSource
    DataSet = DSetFilter
    Left = 100
    Top = 192
  end
  object DSetSmets: TpFIBDataSet
    Database = DBase
    Transaction = ReadTransaction
    DataSource = DSourceFilter
    AfterOpen = DSetSmetsAfterOpen
    Left = 44
    Top = 220
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSourceSmets: TDataSource
    DataSet = DSetSmets
    Left = 100
    Top = 220
  end
  object qFActionControlSmets: TqFActionControl
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE UP_ORDER_MOVE_DEL_SMET :where')
    SelectDataSet = DSetSmets
    KeyFields = 'ID_REC'
    RefreshAction = ActionRefreshSmet
    DeleteAction = ActionDelSmet
    Database = DBase
    AddFormClass = 'TUpEditSmeta'
    AddAction = ActionAddSmet
    ModifyAction = ActionEditSmet
    InfoAction = ActionInfoSmet
    BeforePrepare = qFActionControlSmetsBeforePrepare
    AfterRefresh = qFActionControlSmetsAfterRefresh
    Left = 200
    Top = 512
  end
  object ActionList: TActionList
    Left = 184
    Top = 336
    object ActionAddSmet: TAction
      Caption = 'ActionAdd'
      ShortCut = 45
    end
    object ActionEditSmet: TAction
      Caption = 'ActionEdit'
      ShortCut = 113
    end
    object ActionDelSmet: TAction
      Caption = 'ActionDel'
      ShortCut = 46
    end
    object ActionRefreshSmet: TAction
      Caption = 'ActionRefreshSmet'
      ShortCut = 116
    end
    object ActionInfoSmet: TAction
      Caption = 'ActionInfoSmet'
      ShortCut = 32
    end
    object ActionSystem: TAction
      Caption = 'ActionSystem'
      ShortCut = 49242
      OnExecute = ActionSystemExecute
    end
    object ActionAddBonus: TAction
      Caption = 'ActionAddBonus'
    end
    object ActionEditBonus: TAction
      Caption = 'ActionEditBonus'
    end
    object ActionDelBonus: TAction
      Caption = 'ActionDelBonus'
    end
    object ActionInfoBonus: TAction
      Caption = 'ActionInfoBonus'
    end
    object ActionRefreshBonus: TAction
      Caption = 'ActionRefreshBonus'
    end
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DBase
    TimeoutAction = TARollback
    Left = 72
    Top = 220
  end
  object CheckValidOkladDSet: TpFIBDataSet
    Database = DBase
    Transaction = ReadTransaction
    DataSource = DSourceFilter
    Left = 44
    Top = 276
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object qFActionControlBonus: TqFActionControl
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE UP_ORDER_MOVE_DEL_BONUS :where')
    SelectDataSet = DSetBonus
    KeyFields = 'ID_REC'
    RefreshAction = ActionRefreshBonus
    DeleteAction = ActionDelBonus
    Database = DBase
    AddFormClass = 'TfmBonusEdit'
    AddAction = ActionAddBonus
    ModifyAction = ActionEditBonus
    InfoAction = ActionInfoBonus
    BeforePrepare = qFActionControlBonusBeforePrepare
    AfterRefresh = qFActionControlBonusAfterRefresh
    Left = 240
    Top = 512
  end
  object DSetBonus: TpFIBDataSet
    Database = DBase
    Transaction = ReadTransaction
    DataSource = DSourceFilter
    AfterOpen = DSetBonusAfterOpen
    Left = 44
    Top = 248
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSourceBonus: TDataSource
    DataSet = DSetBonus
    Left = 100
    Top = 248
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGridPeople
    PopupMenus = <
      item
        GridView = cxGridPeopleDBTableView1
        HitTypes = [gvhtGridNone, gvhtGridTab, gvhtNone, gvhtTab, gvhtCell, gvhtExpandButton, gvhtRecord, gvhtNavigator, gvhtPreview, gvhtColumnHeader, gvhtColumnHeaderFilterButton, gvhtFilter, gvhtFooter, gvhtFooterCell, gvhtGroupFooter, gvhtGroupFooterCell, gvhtGroupByBox, gvhtIndicator, gvhtRowIndicator, gvhtRowLevelIndent, gvhtBand, gvhtBandHeader, gvhtRowCaption, gvhtSeparator]
        Index = 0
        PopupMenu = PopupMenuGridPeopleView
      end>
    Left = 304
    Top = 232
  end
  object PopupMenuGridPeopleView: TPopupMenu
    Left = 264
    Top = 232
    object GridPeopleFiltering: TMenuItem
      Caption = #1060#1110#1083#1100#1090#1088
      OnClick = GridPeopleFilteringClick
    end
    object GridPeopleGroupping: TMenuItem
      Caption = #1043#1088#1091#1087#1091#1074#1072#1085#1085#1103
      OnClick = GridPeopleGrouppingClick
    end
    object GridPeopleSorting: TMenuItem
      Caption = #1042#1087#1086#1088#1103#1076#1082#1091#1074#1072#1085#1085#1103
      OnClick = GridPeopleSortingClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object GridPeopleExit: TMenuItem
      Caption = #1042#1080#1093#1110#1076
      OnClick = GridPeopleExitClick
    end
  end
end
