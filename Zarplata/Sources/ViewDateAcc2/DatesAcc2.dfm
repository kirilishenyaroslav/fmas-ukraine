object FZDateAcc2: TFZDateAcc2
  Left = 244
  Top = 9
  Width = 1024
  Height = 738
  Caption = #1058#1077#1089#1090#1086#1074#1080#1081' '#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 48
    Width = 1008
    Height = 28
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 3
      Top = 7
      Width = 124
      Height = 13
      Caption = #1055#1077#1088#1110#1086#1076' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1072' '#1079
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 251
      Top = 8
      Width = 15
      Height = 13
      Caption = #1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DateBeg: TDateTimePicker
      Left = 136
      Top = 5
      Width = 104
      Height = 21
      Date = 41200.613534791670000000
      Time = 41200.613534791670000000
      Enabled = False
      TabOrder = 0
      OnChange = DateBegChange
      OnExit = DateBegExit
      OnKeyPress = DateBegKeyPress
    end
    object DateEnd: TDateTimePicker
      Left = 276
      Top = 5
      Width = 104
      Height = 21
      Date = 41200.613534791670000000
      Time = 41200.613534791670000000
      Enabled = False
      TabOrder = 1
      OnExit = DateEndExit
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 76
    Width = 329
    Height = 603
    Align = alLeft
    TabOrder = 1
    object Grid1: TcxGrid
      Left = 1
      Top = 1
      Width = 327
      Height = 368
      Align = alTop
      BorderStyle = cxcbsNone
      TabOrder = 0
      object Grid1View1: TcxGridDBTableView
        OnKeyPress = Grid1View1KeyPress
        DataController.DataSource = DatesAcc2Dm.DSource1
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'id_man'
        DataController.MasterKeyFieldNames = 'FIO'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'ID_MAN'
            Column = Grid1ClTin
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = Grid1ClFIO
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.Indicator = True
        Preview.Place = ppTop
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        Styles.OnGetContentStyle = Grid1View1StylesGetContentStyle
        object Grid1ClTn: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 55
          DataBinding.FieldName = 'TN'
        end
        object Grid1ClFIO: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortOrder = soAscending
          Width = 176
          DataBinding.FieldName = 'FIO'
        end
        object Grid1ClTin: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 84
          DataBinding.FieldName = 'TIN'
        end
        object Grid1Clidman: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'P1'
        end
      end
      object Grid1Level1: TcxGridLevel
        GridView = Grid1View1
      end
    end
    object Grid2: TcxGrid
      Left = 1
      Top = 369
      Width = 327
      Height = 233
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 1
      object Grid2View1: TcxGridDBTableView
        DataController.DataSource = DatesAcc2Dm.DSource2
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'ID_GROUP_ACCOUNT'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object Grid2ClKodSetup: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = Grid2ClKodSetupGetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 47
          DataBinding.FieldName = 'KOD_SETUP_2'
          IsCaptionAssigned = True
        end
        object Grid2ClDateAcc: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 79
          DataBinding.FieldName = 'DATE_ACC'
          IsCaptionAssigned = True
        end
        object Grid2ClTypeAcc: TcxGridDBColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortOrder = soAscending
          Width = 97
          DataBinding.FieldName = 'TYPE_ACC'
          IsCaptionAssigned = True
        end
      end
      object Grid2Level1: TcxGridLevel
        GridView = Grid2View1
      end
    end
  end
  object Panel3: TPanel
    Left = 337
    Top = 76
    Width = 671
    Height = 603
    Align = alClient
    TabOrder = 3
    object Grid3: TcxGrid
      Left = 1
      Top = 1
      Width = 669
      Height = 414
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = cxcbsNone
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      object Grid3DBBandedTableView1: TcxGridDBBandedTableView
        DataController.DataSource = DatesAcc2Dm.DSource3
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems.OnSummary = Grid3DBBandedTableView1DataControllerSummaryDefaultGroupSummaryItemsSummary
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = Grid3ClSumma
          end>
        DataController.Summary.FooterSummaryItems.OnSummary = Grid3DBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'summa'
            Column = Grid3ClSumma
          end
          item
            Kind = skCount
            FieldName = 'KOD_VIDOPL'
            Column = Grid3ClVidOpl
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.HeaderAutoHeight = True
        OptionsView.Indicator = True
        OptionsView.BandHeaders = False
        Preview.Place = ppTop
        Preview.Visible = True
        Styles.StyleSheet = GridBandedTableViewStyleSheetDevExpress
        Bands = <
          item
          end>
        object Grid3ClVo: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 53
          Position.BandIndex = 0
          Position.ColIndex = 7
          Position.RowIndex = 0
          DataBinding.FieldName = 'KOD_VIDOPL'
          IsCaptionAssigned = True
        end
        object Grid3ClVidOpl: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 177
          Position.BandIndex = 0
          Position.ColIndex = 8
          Position.RowIndex = 0
          DataBinding.FieldName = 'NAME_VIDOPL'
          IsCaptionAssigned = True
        end
        object Grid3ClSumma: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 164
          Position.BandIndex = 0
          Position.ColIndex = 9
          Position.RowIndex = 0
          DataBinding.FieldName = 'SUMMA'
          IsCaptionAssigned = True
        end
        object Grid3ClP1: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 'T'
          Properties.ValueUnchecked = 'F'
          Visible = False
          OnGetDisplayText = Grid3ClP1GetDisplayText
          GroupIndex = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          SortOrder = soDescending
          Width = 23
          Position.BandIndex = 0
          Position.ColIndex = 11
          Position.RowIndex = 0
          DataBinding.FieldName = 'P1'
          IsCaptionAssigned = True
        end
        object Grid3ClDepartment: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 41
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'KOD_DEPARTMENT'
          IsCaptionAssigned = True
        end
        object Grid3ClSmeta: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 34
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'KOD_SMETA'
          IsCaptionAssigned = True
        end
        object Grid3ClKodSetup3: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = Grid3ClKodSetup3GetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          SortOrder = soAscending
          Width = 69
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'KOD_SETUP3'
          IsCaptionAssigned = True
        end
        object Grid3ClReCount: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 'T'
          Properties.ValueUnchecked = 'F'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 46
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'P_OLD'
          IsCaptionAssigned = True
        end
        object Grid3ClNDay: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = Grid3ClNDayGetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 43
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'NDAY'
          IsCaptionAssigned = True
        end
        object Grid3ClClock: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = Grid3ClClockGetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 71
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
          DataBinding.FieldName = 'CLOCK'
          IsCaptionAssigned = True
        end
        object Grid3ClStavkaPercent: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 149
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 0
          DataBinding.FieldName = 'STAVKA_PERCENT'
          IsCaptionAssigned = True
        end
        object Grid3ClKodSetTaxGroup: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          OnGetDisplayText = Grid3ClKodSetup3GetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 79
          Position.BandIndex = 0
          Position.ColIndex = 10
          Position.RowIndex = 0
          DataBinding.FieldName = 'KOD_SET_TAX_GROUP'
        end
      end
      object Grid3Level1: TcxGridLevel
        GridView = Grid3DBBandedTableView1
      end
    end
    object Grid5: TcxGrid
      Left = 1
      Top = 423
      Width = 669
      Height = 104
      Align = alBottom
      TabOrder = 1
      object Grid5DBTableView1: TcxGridDBTableView
        DataController.DataSource = DatesAcc2Dm.DSource5
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = Grid5ClSumma
          end
          item
            Kind = skCount
            FieldName = 'TYPE_SHEET'
            Column = Grid5ClTypeSheet
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Editing = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object Grid5ClKodSheet: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Width = 108
          DataBinding.FieldName = 'KOD_SHEET'
        end
        object Grid5ClTypeSheet: TcxGridDBColumn
          Width = 105
          DataBinding.FieldName = 'TYPE_SHEET'
        end
        object Grid5ClSumma: TcxGridDBColumn
          Width = 90
          DataBinding.FieldName = 'SUMMA'
        end
        object Grid5ClSmetaKod: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Width = 90
          DataBinding.FieldName = 'SMETA_KOD'
        end
        object Grid5ClDep: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Width = 83
          DataBinding.FieldName = 'DEPARTMENT_KOD'
        end
        object Grid5ClReestr: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Width = 75
          DataBinding.FieldName = 'ID_REESTR'
        end
        object Grid5ClNameViplata: TcxGridDBColumn
          Width = 71
          DataBinding.FieldName = 'NAME_VIPLATA'
        end
      end
      object Grid5Level1: TcxGridLevel
        GridView = Grid5DBTableView1
      end
    end
    object PanelGrid3DopData: TPanel
      Left = 1
      Top = 535
      Width = 669
      Height = 67
      Align = alBottom
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 2
      object DBMaskEditDepartment: TcxDBMaskEdit
        Left = 560
        Top = 23
        Width = 374
        Height = 21
        DataBinding.DataField = 'NAME_DEPARTMENT'
        DataBinding.DataSource = DatesAcc2Dm.DSource3
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
      end
      object DBMaskEditSmeta: TcxDBMaskEdit
        Left = 86
        Top = 44
        Width = 374
        Height = 21
        DataBinding.DataField = 'NAME_SMETA'
        DataBinding.DataSource = DatesAcc2Dm.DSource3
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
      end
      object LabelDepartment: TcxLabel
        Left = 467
        Top = 3
        Width = 90
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 2
      end
      object LabelSmeta: TcxLabel
        Left = 8
        Top = 45
        Width = 77
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 3
      end
      object DBMaskEditPost: TcxDBMaskEdit
        Left = 86
        Top = 2
        Width = 374
        Height = 21
        DataBinding.DataField = 'NAME_POST'
        DataBinding.DataSource = DatesAcc2Dm.DSource3
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 4
      end
      object LabelPost: TcxLabel
        Left = 8
        Top = 4
        Width = 77
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 5
      end
      object DBMaskEditCategory: TcxDBMaskEdit
        Left = 86
        Top = 23
        Width = 374
        Height = 21
        DataBinding.DataField = 'NAME_CATEGORY'
        DataBinding.DataSource = DatesAcc2Dm.DSource3
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 6
      end
      object LabelCategory: TcxLabel
        Left = 7
        Top = 25
        Width = 77
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 7
      end
      object cxDBMaskEdit1: TcxDBMaskEdit
        Left = 560
        Top = 2
        Width = 374
        Height = 21
        DataBinding.DataField = 'kod_department'
        DataBinding.DataSource = DatesAcc2Dm.DSource3
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 8
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 527
      Width = 669
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      AlignSplitter = salBottom
      Control = PanelGrid3DopData
    end
    object cxSplitter2: TcxSplitter
      Left = 1
      Top = 415
      Width = 669
      Height = 8
      HotZoneClassName = 'TcxXPTaskBarStyle'
      AlignSplitter = salBottom
      Control = Grid5
    end
  end
  object cxSplitter3: TcxSplitter
    Left = 329
    Top = 76
    Width = 8
    Height = 603
    HotZoneClassName = 'TcxXPTaskBarStyle'
    Control = Panel1
  end
  object Panel4: TPanel
    Left = 0
    Top = 679
    Width = 1008
    Height = 21
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = True
    TabOrder = 8
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
        Caption = 'Child1Buttons'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarLargeButton3
            Visible = True
          end
          item
            Item = dxBarLargeButton4
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            BeginGroup = True
            Item = RefreshBtn
            Visible = True
          end
          item
            Item = ShowGroupBoxBtn
            Visible = True
          end
          item
            Item = ExitBtn
            Visible = True
          end>
        Name = 'Child1Buttons'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'LocateBar'
        DockedDockingStyle = dsBottom
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsBottom
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemLinks = <>
        Name = 'LocateBar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = True
        UseRestSpace = True
        Visible = False
        WholeRow = False
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clActiveBorder
    PopupMenuLinks = <>
    Style = bmsOffice11
    SunkenBorder = True
    UseSystemFont = True
    Left = 560
    Top = 240
    DockControlHeights = (
      0
      0
      48
      0)
    object RefreshBtn: TdxBarLargeButton
      Caption = #1054#1085#1086#1074#1080#1090#1080
      Category = 0
      Visible = ivAlways
      ShortCut = 116
      OnClick = RefreshBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FF92635DA46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769A46769A46769A46769A46769A46769A46769A46769FF00FFFF
        00FFFF00FFFF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0CE9EEFCB97
        EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080EDC180EABF
        7F9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED4B8F4DABBF2D5B1F0
        D1AAA5BB70E0C793DEC48CEDC58FEBC188EABF82E9BD7FE9BD7FE9BD7FE9BD7F
        E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED7
        C0F6E0C1F2D9B8F2D4B1C0C588008201E0C79352A035259217259116519D2EB2
        B262DABB77E9BD7FE9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF93655FEFDAC5F7E2C7F3DCBFF2D8B7E3D0A50082010686050082010082
        010082010082010082017AA643DABB77E9BD7FEABF7FE7BC7E9F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FF936560F0DECCF8E6CFF6E0C6F3DCBDE3D4AC008201
        008201008201008201008201008201008201008201AFB15FE9BD7FEABF7FE7BC
        7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2D3FAEAD7F6E3CEF4
        DEC5E5D8B200820100820100820126931BB2BC76B1BA72529F33008201249015
        E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF986963F2E6
        DAFAEEDEF7E7D4F6E2CBE5DAB80082010082010082011C9014E1CA99E0C793DE
        C48C90AF57068604E9BD81EABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF9E6E64F4EAE1FBF2E6F8EADCF7E6D3E6DDC00082010082010082010082
        01008201E1CA9AEDCB9CEDC796EBC58F5FC065EABF82E7BB7E9F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3F7EADAE7E1C6E6DDC0
        E5D9B8E5D8B2E3D4ABE2D1A5E2CE9FEFCEA3EECA9CEDC7955FC065EBC288E7BC
        809F6F60FF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3F0FEFBF6FBF3EB5F
        C065F8EBDCF7E7D3F6E2CCE5DAB8E5D8B2E3D4ACE3D0A6E2CE9EE1CA99DEC792
        EDC795EDC58FE9BF879F6F62FF00FFFF00FFFF00FFFF00FFFF00FFAC7969FAF6
        F4FFFFFEFEF8F35FC065F8EEE3F8EBDAF7E6D3E7DDC000820100820100820100
        8201008201E1CA99EECB9CEEC996EAC18EA07063FF00FFFF00FFFF00FFFF00FF
        FF00FFB17E6BFAF6F4FFFFFFFFFEFBFEF7F006880698CB8BE9E5CCE7E2C6E6DD
        BF1C9217008201008201008201E2CE9EEFCEA1EECB9CEBC592A07264FF00FFFF
        00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFB289D27008201
        56B04FBAD5A5BAD19E279821008201008201008201E3D0A4F0D1A9F0CFA3EDC9
        999D7065FF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFFFFFFFFFFFF
        FFFFBFE3BC008201008201008201008201008201008201008201008201E3D4AB
        F0D4AFEFD0A7CEB491896A63FF00FFFF00FFFF00FFFF00FFFF00FFC0896FFBF7
        F4FFFFFFFFFFFFFFFFFFEFF8EF87CC8400820100820100820100820100820106
        8706008201E5D8B2E5CEAFC4B096A1927F806762FF00FFFF00FFFF00FFFF00FF
        FF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFEFF8EFC4E5C157B554289C
        25279A2456AF4CE9E2C7008201B2C495B8AB9AA79C8BA49786846964FF00FFFF
        00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFBFCF7F0FBF2E9FBF2E5DACFB7956856696C4095655B96655B9665
        5B986859FF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7F6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B69F675BDAA16B
        DD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FFFF00FFD49875FCF8
        F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFFFEF7DD
        C4BC9F675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFDDC7C29F675BEAB273EFA751A5686BFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CE9F675BEDB572A5686BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E68CF8E68CF8E68CF
        8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E689F675BA5686B
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object ExitBtn: TdxBarLargeButton
      Align = iaRight
      Caption = #1042#1080#1093#1110#1076
      Category = 0
      Visible = ivAlways
      ShortCut = 27
      OnClick = ExitBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66666933
        34FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666
        A36666A76666693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666A0
        6666B06667C66667CC6667B36667693334FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A66
        66AF6869C0696ACF696ACE6869CD6768CD6768B36667693334AE66669A66669A
        66669A66669A66669A66669A66669A66669A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666D26F70D56F70D46E6FD36D6ED26C6DD16B6CD06A6BB467686933
        34FEA2A3FDA8A9FCAFB0FBB6B7FABCBDF9C2C2F9C5C6F9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666D97374D87273D77172D67071D56F70D46E6F
        D36D6EB6696A69333459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666DC7677DB7576DA7475D9
        7374D87273D77172D67071B86B6B69333459B26733CB6733CB6733CB6733CB67
        33CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666DF79
        7ADF797ADE7879DD7778DC7677DB7576DA7475B96C6D69333459B26733CB6733
        CB6733CB6733CB6733CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666E37D7EE27C7DE17B7CE07A7BDF797ADE7879DD7778BB6E6F6933
        3459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666E68081E57F80E47E7FE37D7EE27C7DE17B7C
        E07A7BBD707069333459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666E98384E88283E78182E6
        8081E78788ECA6A7E47E7FBE717269333473B87633CB6733CB6733CB6733CB67
        33CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666ED87
        88EC8687EB8586EA8485F2B9BAFFFFFFF0B0B0C07374693334F2D9C0C7F0BC79
        DD9079DD9060D68160D68160D681F9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666F08A8BEF898AEE8889ED8788F5BBBCFFFFFFF0AAABC275756933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDE2F8CCE2F8CCF9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666F38D8EF28C8DF18B8CF08A8BEF898AF3A6A7
        ED8788C37677693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666F69091F69091F58F90F4
        8E8FF38D8EF28C8DF18B8CC57878693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDD
        FFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666FA94
        95F99394F89293F79192F69091F58F90F48E8FC77A7A693334F2D9C0FFFFDDFF
        FFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666FD9798FC9697FB9596FA9495F99394F89293F79192C87B7C6933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666FF999AFF999AFE9899FD9798FD9798FC9697
        FB9596CA7D7D693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666FF999AFF999AFF999AFF
        999AFF999AFE9899FE9899CC7F7F693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDD
        FFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666F996
        97FF999AFF999AFF999AFF999AFF999AFF999ACD8080693334F2D9C0FFFFDDFF
        FFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A66669A6666C0797ADF898AFF999AFF999AFF999AFF999ACD80806933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666A76C6DC67C7DF29394
        FF999ACD8080693334A766669A66669A66669A66669A66669A66669A66669A66
        669A6666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF9A66669A6666AD7070B37373693334FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object FilterBtn: TdxBarLargeButton
      Caption = 'FilterBtn'
      Category = 0
      Hint = 'FilterBtn'
      Visible = ivAlways
      ShortCut = 115
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        0800000000004002000000000000000000000001000000000000FF00FF00004B
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
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000001010101
        0000000000000000000000000000000000000005426049190100000000000000
        0000000000000000000000054260491901000000000000000000000000000000
        0000000542604919010000000000000000000000000000000000000542544919
        0100000000000000000000000000000000000005426049190100000000000000
        0000000000000000000000053E41312601000000000000000000000000000000
        0000052A443830241C0100000000000000000000000000000005344B44363023
        1B100100000000000000000000000000053D4F463C362C221B19100100000000
        00000000000000053F524E463C322C1E1919191001000000000000000000053F
        61514E443832242219191919100100000000000000053F6155504C443830241D
        191919191910010000000000052A482A2A210E0D0D0505050505050808101001
        00000005010105050A101F206E66635F143F372A271201010100050510101717
        17172430326E656465155461616161480601000508175B5A5856173032386E67
        6767154837285E010100000000596B6A5C5817010101016E67150101015E5E13
        0000000000596F6C6A5A170000000000680000006D5E5D13130000000059706F
        6B5B1800000000000000006D6D5D5D5D13130000000059595959000000000000
        000000006D6D5D131300000000000000000000000000000000000000006D5E13
        000000000000000000000000000000000000000000005E000000}
    end
    object PrintBtn: TdxBarLargeButton
      Align = iaRight
      Caption = 'PrintBtn'
      Category = 0
      Hint = 'PrintBtn'
      Visible = ivAlways
      ButtonStyle = bsDropDown
      ShortCut = 16500
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C
        6A6A6C6A6AFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF6C6A6AB0ADAD9692938E8A8B6C6A6A6C6A6A817E7F6C6A6ADDDCDCD0CFCF6C
        6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF6C6A6AD5D4D4C6C4C4A19F9FA19F9FA19F9F8381825C5B5BBCBC
        BCCECECECFCFCFD1D1D1D3D3D3CAC9C96C6A6A6C6A6A6C6A6AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6C6A6AD8D7D7E0DEDEC0BFBFA19F9FA19F9FA19F9F
        6260600000000000001616165D5D5DA9A9A9CACACACACACACACACACACACAC1C0
        C06C6A6A6C6A6A6C6A6AFF00FFFF00FF6C6A6AD3D3D3D4D3D3CFCFCF8C8A8A81
        7F7F817F7F817F7F6C6A6A1414140808080000000000000000001616165D5D5D
        A9A9A9CACACACACACAB7B6B6B7B6B66C6A6AFF00FF6C6A6ACACACACACACAC6C6
        C68E8C8CB8B5B5B6B4B4A19F9FA19F9F9F9D9D9997979390918280805250502B
        2A2A080808000000000000161616646464817E7F6C6A6AFF00FFFF00FF6C6A6A
        CACACAC5C5C58E8C8CD7D4D4F7F6F6F6F4F4F2F0F0E0DEDECAC7C7B6B5B5A5A3
        A3A19F9FA19F9F9E9A9C9390916865662322230303031919199997976C6A6AFF
        00FFFF00FF6C6A6AC5C5C58E8C8CE7E6E6F7F6F6F7F6F6F6F4F4F2F0F0EEEDED
        EAEAEAE7E6E6E3E2E2D4D3D3C2C1C1AFADADA19F9FA19F9F9997978280806C6A
        6A9F9D9D6C6A6AFF00FFFF00FF6C6A6A8E8C8CEFEEEEF7F6F6F7F6F6F7F6F6F6
        F4F4D5D3D4867B7E958B8EC1BFBFDDDCDCE0E0E0DCDCDCD8D8D8D1D1D1C2C1C1
        B2B0B0A19F9F9C99996C6A6A6C6A6AFF00FFFF00FF6C6A6ACECBCCF7F6F6F7F6
        F6F7F6F6F7F6F6CFCBCCAFACADADABAB9E989883797B75696B898081ABA5A6C7
        C6C6D5D5D5D1D1D1CECECEC9C7C7BBBABAA6A4A46C6A6AFF00FFFF00FFFF00FF
        6C6A6A6C6A6ACECBCCEDEBEBAFA4A56B5D5F766A6C83787A9C9697ACAAAAB2B0
        B0ABA7A9989192817778847A7D938C8EBFBFBFCBCBCBCACACAC0C0C06C6A6AFF
        00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6ABD8281AF8A737D5E51665456
        6554576D5E626D5E62898081A09A9CAFACADB2B0B0A49FA0CAC9CACBCBCBB7B6
        B66C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FF
        D4ABFFD0A1FFCB98D5A57BA1785C7B665F6050536656596F62658E8687CECCCC
        CFCFCFA5A4A46C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFBD8281FFD9B2FFD4A9FFCFA0FFCA97FFC68EFFC186FFBF81FFC084BD
        82816C6A6A6C6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFBD8281FFDDBAFFD8B1FFD3A7FFCE9EFFCA96FFC5
        8CFFC084FFC084BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFE5CBFFE1C2FFDCB8FFD7AF
        FFD3A6FFCE9DFFC995FFC48BBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFEAD4FF
        E5CAFFE0C0FFDAB7FFD7ADFFD1A5FFCC9CFFC792BD8281FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFBD8281FFEEDCFFE9D1FFE3C9FFE0BFFFDAB6FFD5ACFFD0A3F7C297BD8281FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFBD8281FFF7EEFFF2E3FFEDDAFFE7D0FFE3C7FFDEBDFFD9B4FFD4
        ABBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFBD8281FFFAF3FFFAF3FFF6EDFFF0E2FFEBD9FFE7CF
        FFE2C5FFDDBCF2C7A9BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281BD8281BD8281BD8281FF
        F4EBFFF0E1FFEBD7FFE6CEFBDCC0BD8281FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFBD8281BD8281BD8281BD8281BD8281FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object ShowGroupBoxBtn: TdxBarLargeButton
      Caption = 'ShowGroupBoxBtn'
      Category = 0
      Visible = ivAlways
      ButtonStyle = bsChecked
      DropDownEnabled = False
      Down = True
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0F6E9F0F6E9FFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF1273A32097C1189CC60F6E9FFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1676A639A9D132A7CE24
        A1CA179BC60F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877A64FB4
        D650BDE042B7DC32A7CE24A1CA179BC60F6E9FFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        1B78A766BEDC6CCAE75EC3E350BDE042B7DC31A7CD24A1CA179BC60F6E9FFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF1E7AA87CC8E287D6EE7AD0EA61AEC6487C8D4DB4D542B6DC31A7CD
        24A0CA179BC60F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF217BA893D2E8A3E3F595DDF287D6EE6297A846636E4B
        84974DB4D541B6DC30A7CD24A0CA179BC60F6E9FFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877A6BFF0FCA9DEED33333394DD
        F187D6EE69AABE5792A53D58624DB4D541B6DC30A7CD23A0CA169BC60F6E9FFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877A6
        333333B0E9F9A2E3F594DDF186D6EE6197A85EA4BB40616C4CB4D540B6DC30A7
        CD23A0CA169BC60F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF1877A6BEF0FCB0E9F933333394DDF186D6EE69AABE44636E
        436A774FBCDF40B6DC2FA6CD23A0CA169BC60F6E9FFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877A6333333A8DEECA2E3F594
        DCF186D6EE65A0B33E50585096AD4EBCDF40B6DC2FA6CD22A0C9159AC60F6E9F
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877
        A6BDF0FCAFE9F833333394DCF185D6EE70BCD46AC9E65CC3E34EBCDF40B5DB2F
        A6CD22A0C9159AC60F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF1877A6333333A1E2F5A1E2F593DCF185D6EE77CFEA69C9
        E65BC2E34EBCDF40B5DB2FA6CD219FC9159AC60F6E9FFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877A6BCEFFCAFE9F8333333
        8CD1E585D5ED77CFEA69C9E65BC2E34DBCDF40B5DB2FA6CD219FC9149AC60F6E
        9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF18
        77A6333333A0E2F4A0E2F493DCF185D5ED77CFEA68C8E65BC2E34DBCDF3FB5DB
        2FA6CD219FC9149AC50F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF1877A6BCEFFCAEE9F833333392DCF185D5ED77CFEA68
        C8E65AC2E24DBCDF3FB5DB2FA6CD219FC9149AC50F6E9FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877A6333333AEE9F892DC
        F192DCF184D5ED76CFE968C8E65AC2E24CBBDF3EB5DB2FA5CD219FC91399C50F
        6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        1877A6AEE8F8AEE8F833333391DBF184D5ED76CEE968C8E65AC2E24CBBDF3EB5
        DB2EA5CC1A8BB60F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF1877A6333333A6DDECAEE9F891DBF183D5ED76CEE9
        68C8E65AC1E24BBBDF2C9AC50F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877A6ADE8F8ADE8F833
        333391DBF183D5ED75CEE967C8E63EA2C90F6E9FFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF1877A6333333ADE8F890DBF090DBF083D5ED4FAACD0F6E9FFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF1877A6BAEEFB9FE1F49FE1F460B2D20F6E9FFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877A6BAEEFB71BAD6
        0F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF1877A60F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = ShowGroupBoxBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0F6E9F0F6E9FFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF1273A32097C1189CC60F6E9FFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1676A639A9D132A7CE24
        A1CA179BC60F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877A64FB4
        D650BDE042B7DC32A7CE24A1CA179BC60F6E9FFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        1B78A766BEDC6CCAE75EC3E350BDE042B7DC31A7CD24A1CA179BC60F6E9FFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF1E7AA87CC8E287D6EE7AD0EA61AEC6487C8D4DB4D542B6DC31A7CD
        24A0CA179BC60F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF217BA893D2E8A3E3F595DDF287D6EE6297A846636E4B
        84974DB4D541B6DC30A7CD24A0CA179BC60F6E9FFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877A6BFF0FCA9DEED33333394DD
        F187D6EE69AABE5792A53D58624DB4D541B6DC30A7CD23A0CA169BC60F6E9FFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877A6
        333333B0E9F9A2E3F594DDF186D6EE6197A85EA4BB40616C4CB4D540B6DC30A7
        CD23A0CA169BC60F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF1877A6BEF0FCB0E9F933333394DDF186D6EE69AABE44636E
        436A774FBCDF40B6DC2FA6CD23A0CA169BC60F6E9FFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877A6333333A8DEECA2E3F594
        DCF186D6EE65A0B33E50585096AD4EBCDF40B6DC2FA6CD22A0C9159AC60F6E9F
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877
        A6BDF0FCAFE9F833333394DCF185D6EE70BCD46AC9E65CC3E34EBCDF40B5DB2F
        A6CD22A0C9159AC60F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF1877A6333333A1E2F5A1E2F593DCF185D6EE77CFEA69C9
        E65BC2E34EBCDF40B5DB2FA6CD219FC9159AC60F6E9FFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877A6BCEFFCAFE9F8333333
        8CD1E585D5ED77CFEA69C9E65BC2E34DBCDF40B5DB2FA6CD219FC9149AC60F6E
        9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF18
        77A6333333A0E2F4A0E2F493DCF185D5ED77CFEA68C8E65BC2E34DBCDF3FB5DB
        2FA6CD219FC9149AC50F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF1877A6BCEFFCAEE9F833333392DCF185D5ED77CFEA68
        C8E65AC2E24DBCDF3FB5DB2FA6CD219FC9149AC50F6E9FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877A6333333AEE9F892DC
        F192DCF184D5ED76CFE968C8E65AC2E24CBBDF3EB5DB2FA5CD219FC91399C50F
        6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        1877A6AEE8F8AEE8F833333391DBF184D5ED76CEE968C8E65AC2E24CBBDF3EB5
        DB2EA5CC1A8BB60F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF1877A6333333A6DDECAEE9F891DBF183D5ED76CEE9
        68C8E65AC1E24BBBDF2C9AC50F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877A6ADE8F8ADE8F833
        333391DBF183D5ED75CEE967C8E63EA2C90F6E9FFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF1877A6333333ADE8F890DBF090DBF083D5ED4FAACD0F6E9FFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF1877A6BAEEFB9FE1F49FE1F460B2D20F6E9FFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1877A6BAEEFB71BAD6
        0F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF1877A60F6E9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object PrintSmetaBtn: TdxBarLargeButton
      Caption = #1044#1088#1091#1082' '#1091' '#1088#1086#1079#1088#1110#1079#1110' '#1082#1086#1096#1090#1086#1088#1080#1089#1091
      Category = 0
      Hint = #1044#1088#1091#1082' '#1091' '#1088#1086#1079#1088#1110#1079#1110' '#1082#1086#1096#1090#1086#1088#1080#1089#1091
      Visible = ivAlways
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF006C6A6A006C6A6A006C6A6A00FF00
        FF00FF00FF00FF00FF00FF00FF006C6A6A006C6A6A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006C6A6A00B0ADAD00969293008E8A8B006C6A
        6A006C6A6A00817E7F006C6A6A00DDDCDC00D0CFCF006C6A6A006C6A6A006C6A
        6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006C6A6A00D5D4D400C6C4C400A19F9F00A19F9F00A19F
        9F00838182005C5B5B00BCBCBC00CECECE00CFCFCF00D1D1D100D3D3D300CAC9
        C9006C6A6A006C6A6A006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006C6A6A00D8D7D700E0DEDE00C0BFBF00A19F9F00A19F9F00A19F
        9F00626060000000000000000000161616005D5D5D00A9A9A900CACACA00CACA
        CA00CACACA00CACACA00C1C0C0006C6A6A006C6A6A006C6A6A00FF00FF00FF00
        FF006C6A6A00D3D3D300D4D3D300CFCFCF008C8A8A00817F7F00817F7F00817F
        7F006C6A6A001414140008080800000000000000000000000000161616005D5D
        5D00A9A9A900CACACA00CACACA00B7B6B600B7B6B6006C6A6A00FF00FF006C6A
        6A00CACACA00CACACA00C6C6C6008E8C8C00B8B5B500B6B4B400A19F9F00A19F
        9F009F9D9D00999797009390910082808000525050002B2A2A00080808000000
        0000000000001616160064646400817E7F006C6A6A00FF00FF00FF00FF006C6A
        6A00CACACA00C5C5C5008E8C8C00D7D4D400F7F6F600F6F4F400F2F0F000E0DE
        DE00CAC7C700B6B5B500A5A3A300A19F9F00A19F9F009E9A9C00939091006865
        6600232223000303030019191900999797006C6A6A00FF00FF00FF00FF006C6A
        6A00C5C5C5008E8C8C00E7E6E600F7F6F600F7F6F600F6F4F400F2F0F000EEED
        ED00EAEAEA00E7E6E600E3E2E200D4D3D300C2C1C100AFADAD00A19F9F00A19F
        9F0099979700828080006C6A6A009F9D9D006C6A6A00FF00FF00FF00FF006C6A
        6A008E8C8C00EFEEEE00F7F6F600F7F6F600F7F6F600F6F4F400D5D3D400867B
        7E00958B8E00C1BFBF00DDDCDC00E0E0E000DCDCDC00D8D8D800D1D1D100C2C1
        C100B2B0B000A19F9F009C9999006C6A6A006C6A6A00FF00FF00FF00FF006C6A
        6A00CECBCC00F7F6F600F7F6F600F7F6F600F7F6F600CFCBCC00AFACAD00ADAB
        AB009E98980083797B0075696B0089808100ABA5A600C7C6C600D5D5D500D1D1
        D100CECECE00C9C7C700BBBABA00A6A4A4006C6A6A00FF00FF00FF00FF00FF00
        FF006C6A6A006C6A6A00CECBCC00EDEBEB00AFA4A5006B5D5F00766A6C008378
        7A009C969700ACAAAA00B2B0B000ABA7A9009891920081777800847A7D00938C
        8E00BFBFBF00CBCBCB00CACACA00C0C0C0006C6A6A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006C6A6A006C6A6A00BD828100AF8A73007D5E51006654
        5600655457006D5E62006D5E620089808100A09A9C00AFACAD00B2B0B000A49F
        A000CAC9CA00CBCBCB00B7B6B6006C6A6A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFD4AB00FFD0A100FFCB
        9800D5A57B00A1785C007B665F0060505300665659006F6265008E868700CECC
        CC00CFCFCF00A5A4A4006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFD9B200FFD4A900FFCF
        A000FFCA9700FFC68E00FFC18600FFBF8100FFC08400BD8281006C6A6A006C6A
        6A006C6A6A006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFDDBA00FFD8B100FFD3
        A700FFCE9E00FFCA9600FFC58C00FFC08400FFC08400BD828100FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFE5CB00FFE1C200FFDCB800FFD7
        AF00FFD3A600FFCE9D00FFC99500FFC48B00BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFEAD400FFE5CA00FFE0C000FFDA
        B700FFD7AD00FFD1A500FFCC9C00FFC79200BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFEEDC00FFE9D100FFE3C900FFE0
        BF00FFDAB600FFD5AC00FFD0A300F7C29700BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BD828100FFF7EE00FFF2E300FFEDDA00FFE7D000FFE3
        C700FFDEBD00FFD9B400FFD4AB00BD828100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD828100FFFAF300FFFAF300FFF6ED00FFF0E200FFEBD900FFE7
        CF00FFE2C500FFDDBC00F2C7A900BD828100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD828100BD828100BD828100BD828100FFF4EB00FFF0E100FFEB
        D700FFE6CE00FBDCC000BD828100FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100BD828100BD82
        8100BD828100BD828100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      OnClick = PrintSmetaBtnClick
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
        FF00FF00FF00FF00FF00FF00FF00FF00FF006C6A6A006C6A6A006C6A6A00FF00
        FF00FF00FF00FF00FF00FF00FF006C6A6A006C6A6A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006C6A6A00B0ADAD00969293008E8A8B006C6A
        6A006C6A6A00817E7F006C6A6A00DDDCDC00D0CFCF006C6A6A006C6A6A006C6A
        6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006C6A6A00D5D4D400C6C4C400A19F9F00A19F9F00A19F
        9F00838182005C5B5B00BCBCBC00CECECE00CFCFCF00D1D1D100D3D3D300CAC9
        C9006C6A6A006C6A6A006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006C6A6A00D8D7D700E0DEDE00C0BFBF00A19F9F00A19F9F00A19F
        9F00626060000000000000000000161616005D5D5D00A9A9A900CACACA00CACA
        CA00CACACA00CACACA00C1C0C0006C6A6A006C6A6A006C6A6A00FF00FF00FF00
        FF006C6A6A00D3D3D300D4D3D300CFCFCF008C8A8A00817F7F00817F7F00817F
        7F006C6A6A001414140008080800000000000000000000000000161616005D5D
        5D00A9A9A900CACACA00CACACA00B7B6B600B7B6B6006C6A6A00FF00FF006C6A
        6A00CACACA00CACACA00C6C6C6008E8C8C00B8B5B500B6B4B400A19F9F00A19F
        9F009F9D9D00999797009390910082808000525050002B2A2A00080808000000
        0000000000001616160064646400817E7F006C6A6A00FF00FF00FF00FF006C6A
        6A00CACACA00C5C5C5008E8C8C00D7D4D400F7F6F600F6F4F400F2F0F000E0DE
        DE00CAC7C700B6B5B500A5A3A300A19F9F00A19F9F009E9A9C00939091006865
        6600232223000303030019191900999797006C6A6A00FF00FF00FF00FF006C6A
        6A00C5C5C5008E8C8C00E7E6E600F7F6F600F7F6F600F6F4F400F2F0F000EEED
        ED00EAEAEA00E7E6E600E3E2E200D4D3D300C2C1C100AFADAD00A19F9F00A19F
        9F0099979700828080006C6A6A009F9D9D006C6A6A00FF00FF00FF00FF006C6A
        6A008E8C8C00EFEEEE00F7F6F600F7F6F600F7F6F600F6F4F400D5D3D400867B
        7E00958B8E00C1BFBF00DDDCDC00E0E0E000DCDCDC00D8D8D800D1D1D100C2C1
        C100B2B0B000A19F9F009C9999006C6A6A006C6A6A00FF00FF00FF00FF006C6A
        6A00CECBCC00F7F6F600F7F6F600F7F6F600F7F6F600CFCBCC00AFACAD00ADAB
        AB009E98980083797B0075696B0089808100ABA5A600C7C6C600D5D5D500D1D1
        D100CECECE00C9C7C700BBBABA00A6A4A4006C6A6A00FF00FF00FF00FF00FF00
        FF006C6A6A006C6A6A00CECBCC00EDEBEB00AFA4A5006B5D5F00766A6C008378
        7A009C969700ACAAAA00B2B0B000ABA7A9009891920081777800847A7D00938C
        8E00BFBFBF00CBCBCB00CACACA00C0C0C0006C6A6A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006C6A6A006C6A6A00BD828100AF8A73007D5E51006654
        5600655457006D5E62006D5E620089808100A09A9C00AFACAD00B2B0B000A49F
        A000CAC9CA00CBCBCB00B7B6B6006C6A6A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFD4AB00FFD0A100FFCB
        9800D5A57B00A1785C007B665F0060505300665659006F6265008E868700CECC
        CC00CFCFCF00A5A4A4006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFD9B200FFD4A900FFCF
        A000FFCA9700FFC68E00FFC18600FFBF8100FFC08400BD8281006C6A6A006C6A
        6A006C6A6A006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFDDBA00FFD8B100FFD3
        A700FFCE9E00FFCA9600FFC58C00FFC08400FFC08400BD828100FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFE5CB00FFE1C200FFDCB800FFD7
        AF00FFD3A600FFCE9D00FFC99500FFC48B00BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFEAD400FFE5CA00FFE0C000FFDA
        B700FFD7AD00FFD1A500FFCC9C00FFC79200BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFEEDC00FFE9D100FFE3C900FFE0
        BF00FFDAB600FFD5AC00FFD0A300F7C29700BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BD828100FFF7EE00FFF2E300FFEDDA00FFE7D000FFE3
        C700FFDEBD00FFD9B400FFD4AB00BD828100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD828100FFFAF300FFFAF300FFF6ED00FFF0E200FFEBD900FFE7
        CF00FFE2C500FFDDBC00F2C7A900BD828100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD828100BD828100BD828100BD828100FFF4EB00FFF0E100FFEB
        D700FFE6CE00FBDCC000BD828100FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100BD828100BD82
        8100BD828100BD828100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object BtnPrintPeriod: TdxBarLargeButton
      Caption = #1044#1088#1091#1082' '#1079#1072' '#1087#1077#1088#1110#1086#1076
      Category = 0
      Hint = #1044#1088#1091#1082' '#1079#1072' '#1087#1077#1088#1110#1086#1076
      Visible = ivAlways
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF006C6A6A006C6A6A006C6A6A00FF00
        FF00FF00FF00FF00FF00FF00FF006C6A6A006C6A6A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006C6A6A00B0ADAD00969293008E8A8B006C6A
        6A006C6A6A00817E7F006C6A6A00DDDCDC00D0CFCF006C6A6A006C6A6A006C6A
        6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006C6A6A00D5D4D400C6C4C400A19F9F00A19F9F00A19F
        9F00838182005C5B5B00BCBCBC00CECECE00CFCFCF00D1D1D100D3D3D300CAC9
        C9006C6A6A006C6A6A006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006C6A6A00D8D7D700E0DEDE00C0BFBF00A19F9F00A19F9F00A19F
        9F00626060000000000000000000161616005D5D5D00A9A9A900CACACA00CACA
        CA00CACACA00CACACA00C1C0C0006C6A6A006C6A6A006C6A6A00FF00FF00FF00
        FF006C6A6A00D3D3D300D4D3D300CFCFCF008C8A8A00817F7F00817F7F00817F
        7F006C6A6A001414140008080800000000000000000000000000161616005D5D
        5D00A9A9A900CACACA00CACACA00B7B6B600B7B6B6006C6A6A00FF00FF006C6A
        6A00CACACA00CACACA00C6C6C6008E8C8C00B8B5B500B6B4B400A19F9F00A19F
        9F009F9D9D00999797009390910082808000525050002B2A2A00080808000000
        0000000000001616160064646400817E7F006C6A6A00FF00FF00FF00FF006C6A
        6A00CACACA00C5C5C5008E8C8C00D7D4D400F7F6F600F6F4F400F2F0F000E0DE
        DE00CAC7C700B6B5B500A5A3A300A19F9F00A19F9F009E9A9C00939091006865
        6600232223000303030019191900999797006C6A6A00FF00FF00FF00FF006C6A
        6A00C5C5C5008E8C8C00E7E6E600F7F6F600F7F6F600F6F4F400F2F0F000EEED
        ED00EAEAEA00E7E6E600E3E2E200D4D3D300C2C1C100AFADAD00A19F9F00A19F
        9F0099979700828080006C6A6A009F9D9D006C6A6A00FF00FF00FF00FF006C6A
        6A008E8C8C00EFEEEE00F7F6F600F7F6F600F7F6F600F6F4F400D5D3D400867B
        7E00958B8E00C1BFBF00DDDCDC00E0E0E000DCDCDC00D8D8D800D1D1D100C2C1
        C100B2B0B000A19F9F009C9999006C6A6A006C6A6A00FF00FF00FF00FF006C6A
        6A00CECBCC00F7F6F600F7F6F600F7F6F600F7F6F600CFCBCC00AFACAD00ADAB
        AB009E98980083797B0075696B0089808100ABA5A600C7C6C600D5D5D500D1D1
        D100CECECE00C9C7C700BBBABA00A6A4A4006C6A6A00FF00FF00FF00FF00FF00
        FF006C6A6A006C6A6A00CECBCC00EDEBEB00AFA4A5006B5D5F00766A6C008378
        7A009C969700ACAAAA00B2B0B000ABA7A9009891920081777800847A7D00938C
        8E00BFBFBF00CBCBCB00CACACA00C0C0C0006C6A6A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006C6A6A006C6A6A00BD828100AF8A73007D5E51006654
        5600655457006D5E62006D5E620089808100A09A9C00AFACAD00B2B0B000A49F
        A000CAC9CA00CBCBCB00B7B6B6006C6A6A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFD4AB00FFD0A100FFCB
        9800D5A57B00A1785C007B665F0060505300665659006F6265008E868700CECC
        CC00CFCFCF00A5A4A4006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFD9B200FFD4A900FFCF
        A000FFCA9700FFC68E00FFC18600FFBF8100FFC08400BD8281006C6A6A006C6A
        6A006C6A6A006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFDDBA00FFD8B100FFD3
        A700FFCE9E00FFCA9600FFC58C00FFC08400FFC08400BD828100FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFE5CB00FFE1C200FFDCB800FFD7
        AF00FFD3A600FFCE9D00FFC99500FFC48B00BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFEAD400FFE5CA00FFE0C000FFDA
        B700FFD7AD00FFD1A500FFCC9C00FFC79200BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFEEDC00FFE9D100FFE3C900FFE0
        BF00FFDAB600FFD5AC00FFD0A300F7C29700BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BD828100FFF7EE00FFF2E300FFEDDA00FFE7D000FFE3
        C700FFDEBD00FFD9B400FFD4AB00BD828100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD828100FFFAF300FFFAF300FFF6ED00FFF0E200FFEBD900FFE7
        CF00FFE2C500FFDDBC00F2C7A900BD828100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD828100BD828100BD828100BD828100FFF4EB00FFF0E100FFEB
        D700FFE6CE00FBDCC000BD828100FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100BD828100BD82
        8100BD828100BD828100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
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
        FF00FF00FF00FF00FF00FF00FF00FF00FF006C6A6A006C6A6A006C6A6A00FF00
        FF00FF00FF00FF00FF00FF00FF006C6A6A006C6A6A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006C6A6A00B0ADAD00969293008E8A8B006C6A
        6A006C6A6A00817E7F006C6A6A00DDDCDC00D0CFCF006C6A6A006C6A6A006C6A
        6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006C6A6A00D5D4D400C6C4C400A19F9F00A19F9F00A19F
        9F00838182005C5B5B00BCBCBC00CECECE00CFCFCF00D1D1D100D3D3D300CAC9
        C9006C6A6A006C6A6A006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006C6A6A00D8D7D700E0DEDE00C0BFBF00A19F9F00A19F9F00A19F
        9F00626060000000000000000000161616005D5D5D00A9A9A900CACACA00CACA
        CA00CACACA00CACACA00C1C0C0006C6A6A006C6A6A006C6A6A00FF00FF00FF00
        FF006C6A6A00D3D3D300D4D3D300CFCFCF008C8A8A00817F7F00817F7F00817F
        7F006C6A6A001414140008080800000000000000000000000000161616005D5D
        5D00A9A9A900CACACA00CACACA00B7B6B600B7B6B6006C6A6A00FF00FF006C6A
        6A00CACACA00CACACA00C6C6C6008E8C8C00B8B5B500B6B4B400A19F9F00A19F
        9F009F9D9D00999797009390910082808000525050002B2A2A00080808000000
        0000000000001616160064646400817E7F006C6A6A00FF00FF00FF00FF006C6A
        6A00CACACA00C5C5C5008E8C8C00D7D4D400F7F6F600F6F4F400F2F0F000E0DE
        DE00CAC7C700B6B5B500A5A3A300A19F9F00A19F9F009E9A9C00939091006865
        6600232223000303030019191900999797006C6A6A00FF00FF00FF00FF006C6A
        6A00C5C5C5008E8C8C00E7E6E600F7F6F600F7F6F600F6F4F400F2F0F000EEED
        ED00EAEAEA00E7E6E600E3E2E200D4D3D300C2C1C100AFADAD00A19F9F00A19F
        9F0099979700828080006C6A6A009F9D9D006C6A6A00FF00FF00FF00FF006C6A
        6A008E8C8C00EFEEEE00F7F6F600F7F6F600F7F6F600F6F4F400D5D3D400867B
        7E00958B8E00C1BFBF00DDDCDC00E0E0E000DCDCDC00D8D8D800D1D1D100C2C1
        C100B2B0B000A19F9F009C9999006C6A6A006C6A6A00FF00FF00FF00FF006C6A
        6A00CECBCC00F7F6F600F7F6F600F7F6F600F7F6F600CFCBCC00AFACAD00ADAB
        AB009E98980083797B0075696B0089808100ABA5A600C7C6C600D5D5D500D1D1
        D100CECECE00C9C7C700BBBABA00A6A4A4006C6A6A00FF00FF00FF00FF00FF00
        FF006C6A6A006C6A6A00CECBCC00EDEBEB00AFA4A5006B5D5F00766A6C008378
        7A009C969700ACAAAA00B2B0B000ABA7A9009891920081777800847A7D00938C
        8E00BFBFBF00CBCBCB00CACACA00C0C0C0006C6A6A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006C6A6A006C6A6A00BD828100AF8A73007D5E51006654
        5600655457006D5E62006D5E620089808100A09A9C00AFACAD00B2B0B000A49F
        A000CAC9CA00CBCBCB00B7B6B6006C6A6A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFD4AB00FFD0A100FFCB
        9800D5A57B00A1785C007B665F0060505300665659006F6265008E868700CECC
        CC00CFCFCF00A5A4A4006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFD9B200FFD4A900FFCF
        A000FFCA9700FFC68E00FFC18600FFBF8100FFC08400BD8281006C6A6A006C6A
        6A006C6A6A006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFDDBA00FFD8B100FFD3
        A700FFCE9E00FFCA9600FFC58C00FFC08400FFC08400BD828100FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFE5CB00FFE1C200FFDCB800FFD7
        AF00FFD3A600FFCE9D00FFC99500FFC48B00BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFEAD400FFE5CA00FFE0C000FFDA
        B700FFD7AD00FFD1A500FFCC9C00FFC79200BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFEEDC00FFE9D100FFE3C900FFE0
        BF00FFDAB600FFD5AC00FFD0A300F7C29700BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BD828100FFF7EE00FFF2E300FFEDDA00FFE7D000FFE3
        C700FFDEBD00FFD9B400FFD4AB00BD828100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD828100FFFAF300FFFAF300FFF6ED00FFF0E200FFEBD900FFE7
        CF00FFE2C500FFDDBC00F2C7A900BD828100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD828100BD828100BD828100BD828100FFF4EB00FFF0E100FFEB
        D700FFE6CE00FBDCC000BD828100FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100BD828100BD82
        8100BD828100BD828100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = #1042#1110#1076#1086#1084#1110#1089#1090#1100' '#1087#1088#1086' '#1092#1072#1082#1090#1080#1095#1085#1077' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103
      Category = 0
      Hint = #1042#1110#1076#1086#1084#1110#1089#1090#1100' '#1087#1088#1086' '#1092#1072#1082#1090#1080#1095#1085#1077' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103
      Visible = ivAlways
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF006C6A6A006C6A6A006C6A6A00FF00
        FF00FF00FF00FF00FF00FF00FF006C6A6A006C6A6A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006C6A6A00B0ADAD00969293008E8A8B006C6A
        6A006C6A6A00817E7F006C6A6A00DDDCDC00D0CFCF006C6A6A006C6A6A006C6A
        6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006C6A6A00D5D4D400C6C4C400A19F9F00A19F9F00A19F
        9F00838182005C5B5B00BCBCBC00CECECE00CFCFCF00D1D1D100D3D3D300CAC9
        C9006C6A6A006C6A6A006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006C6A6A00D8D7D700E0DEDE00C0BFBF00A19F9F00A19F9F00A19F
        9F00626060000000000000000000161616005D5D5D00A9A9A900CACACA00CACA
        CA00CACACA00CACACA00C1C0C0006C6A6A006C6A6A006C6A6A00FF00FF00FF00
        FF006C6A6A00D3D3D300D4D3D300CFCFCF008C8A8A00817F7F00817F7F00817F
        7F006C6A6A001414140008080800000000000000000000000000161616005D5D
        5D00A9A9A900CACACA00CACACA00B7B6B600B7B6B6006C6A6A00FF00FF006C6A
        6A00CACACA00CACACA00C6C6C6008E8C8C00B8B5B500B6B4B400A19F9F00A19F
        9F009F9D9D00999797009390910082808000525050002B2A2A00080808000000
        0000000000001616160064646400817E7F006C6A6A00FF00FF00FF00FF006C6A
        6A00CACACA00C5C5C5008E8C8C00D7D4D400F7F6F600F6F4F400F2F0F000E0DE
        DE00CAC7C700B6B5B500A5A3A300A19F9F00A19F9F009E9A9C00939091006865
        6600232223000303030019191900999797006C6A6A00FF00FF00FF00FF006C6A
        6A00C5C5C5008E8C8C00E7E6E600F7F6F600F7F6F600F6F4F400F2F0F000EEED
        ED00EAEAEA00E7E6E600E3E2E200D4D3D300C2C1C100AFADAD00A19F9F00A19F
        9F0099979700828080006C6A6A009F9D9D006C6A6A00FF00FF00FF00FF006C6A
        6A008E8C8C00EFEEEE00F7F6F600F7F6F600F7F6F600F6F4F400D5D3D400867B
        7E00958B8E00C1BFBF00DDDCDC00E0E0E000DCDCDC00D8D8D800D1D1D100C2C1
        C100B2B0B000A19F9F009C9999006C6A6A006C6A6A00FF00FF00FF00FF006C6A
        6A00CECBCC00F7F6F600F7F6F600F7F6F600F7F6F600CFCBCC00AFACAD00ADAB
        AB009E98980083797B0075696B0089808100ABA5A600C7C6C600D5D5D500D1D1
        D100CECECE00C9C7C700BBBABA00A6A4A4006C6A6A00FF00FF00FF00FF00FF00
        FF006C6A6A006C6A6A00CECBCC00EDEBEB00AFA4A5006B5D5F00766A6C008378
        7A009C969700ACAAAA00B2B0B000ABA7A9009891920081777800847A7D00938C
        8E00BFBFBF00CBCBCB00CACACA00C0C0C0006C6A6A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006C6A6A006C6A6A00BD828100AF8A73007D5E51006654
        5600655457006D5E62006D5E620089808100A09A9C00AFACAD00B2B0B000A49F
        A000CAC9CA00CBCBCB00B7B6B6006C6A6A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFD4AB00FFD0A100FFCB
        9800D5A57B00A1785C007B665F0060505300665659006F6265008E868700CECC
        CC00CFCFCF00A5A4A4006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFD9B200FFD4A900FFCF
        A000FFCA9700FFC68E00FFC18600FFBF8100FFC08400BD8281006C6A6A006C6A
        6A006C6A6A006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFDDBA00FFD8B100FFD3
        A700FFCE9E00FFCA9600FFC58C00FFC08400FFC08400BD828100FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFE5CB00FFE1C200FFDCB800FFD7
        AF00FFD3A600FFCE9D00FFC99500FFC48B00BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFEAD400FFE5CA00FFE0C000FFDA
        B700FFD7AD00FFD1A500FFCC9C00FFC79200BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFEEDC00FFE9D100FFE3C900FFE0
        BF00FFDAB600FFD5AC00FFD0A300F7C29700BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BD828100FFF7EE00FFF2E300FFEDDA00FFE7D000FFE3
        C700FFDEBD00FFD9B400FFD4AB00BD828100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD828100FFFAF300FFFAF300FFF6ED00FFF0E200FFEBD900FFE7
        CF00FFE2C500FFDDBC00F2C7A900BD828100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD828100BD828100BD828100BD828100FFF4EB00FFF0E100FFEB
        D700FFE6CE00FBDCC000BD828100FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100BD828100BD82
        8100BD828100BD828100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object BarBtnShortPrint: TdxBarButton
      Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1072' '#1092#1086#1088#1084#1072
      Category = 0
      Hint = #1057#1082#1086#1088#1086#1095#1077#1085#1072' '#1092#1086#1088#1084#1072
      Visible = ivAlways
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF006C6A6A006C6A6A006C6A6A00FF00
        FF00FF00FF00FF00FF00FF00FF006C6A6A006C6A6A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006C6A6A00B0ADAD00969293008E8A8B006C6A
        6A006C6A6A00817E7F006C6A6A00DDDCDC00D0CFCF006C6A6A006C6A6A006C6A
        6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006C6A6A00D5D4D400C6C4C400A19F9F00A19F9F00A19F
        9F00838182005C5B5B00BCBCBC00CECECE00CFCFCF00D1D1D100D3D3D300CAC9
        C9006C6A6A006C6A6A006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006C6A6A00D8D7D700E0DEDE00C0BFBF00A19F9F00A19F9F00A19F
        9F00626060000000000000000000161616005D5D5D00A9A9A900CACACA00CACA
        CA00CACACA00CACACA00C1C0C0006C6A6A006C6A6A006C6A6A00FF00FF00FF00
        FF006C6A6A00D3D3D300D4D3D300CFCFCF008C8A8A00817F7F00817F7F00817F
        7F006C6A6A001414140008080800000000000000000000000000161616005D5D
        5D00A9A9A900CACACA00CACACA00B7B6B600B7B6B6006C6A6A00FF00FF006C6A
        6A00CACACA00CACACA00C6C6C6008E8C8C00B8B5B500B6B4B400A19F9F00A19F
        9F009F9D9D00999797009390910082808000525050002B2A2A00080808000000
        0000000000001616160064646400817E7F006C6A6A00FF00FF00FF00FF006C6A
        6A00CACACA00C5C5C5008E8C8C00D7D4D400F7F6F600F6F4F400F2F0F000E0DE
        DE00CAC7C700B6B5B500A5A3A300A19F9F00A19F9F009E9A9C00939091006865
        6600232223000303030019191900999797006C6A6A00FF00FF00FF00FF006C6A
        6A00C5C5C5008E8C8C00E7E6E600F7F6F600F7F6F600F6F4F400F2F0F000EEED
        ED00EAEAEA00E7E6E600E3E2E200D4D3D300C2C1C100AFADAD00A19F9F00A19F
        9F0099979700828080006C6A6A009F9D9D006C6A6A00FF00FF00FF00FF006C6A
        6A008E8C8C00EFEEEE00F7F6F600F7F6F600F7F6F600F6F4F400D5D3D400867B
        7E00958B8E00C1BFBF00DDDCDC00E0E0E000DCDCDC00D8D8D800D1D1D100C2C1
        C100B2B0B000A19F9F009C9999006C6A6A006C6A6A00FF00FF00FF00FF006C6A
        6A00CECBCC00F7F6F600F7F6F600F7F6F600F7F6F600CFCBCC00AFACAD00ADAB
        AB009E98980083797B0075696B0089808100ABA5A600C7C6C600D5D5D500D1D1
        D100CECECE00C9C7C700BBBABA00A6A4A4006C6A6A00FF00FF00FF00FF00FF00
        FF006C6A6A006C6A6A00CECBCC00EDEBEB00AFA4A5006B5D5F00766A6C008378
        7A009C969700ACAAAA00B2B0B000ABA7A9009891920081777800847A7D00938C
        8E00BFBFBF00CBCBCB00CACACA00C0C0C0006C6A6A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006C6A6A006C6A6A00BD828100AF8A73007D5E51006654
        5600655457006D5E62006D5E620089808100A09A9C00AFACAD00B2B0B000A49F
        A000CAC9CA00CBCBCB00B7B6B6006C6A6A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFD4AB00FFD0A100FFCB
        9800D5A57B00A1785C007B665F0060505300665659006F6265008E868700CECC
        CC00CFCFCF00A5A4A4006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFD9B200FFD4A900FFCF
        A000FFCA9700FFC68E00FFC18600FFBF8100FFC08400BD8281006C6A6A006C6A
        6A006C6A6A006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFDDBA00FFD8B100FFD3
        A700FFCE9E00FFCA9600FFC58C00FFC08400FFC08400BD828100FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFE5CB00FFE1C200FFDCB800FFD7
        AF00FFD3A600FFCE9D00FFC99500FFC48B00BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFEAD400FFE5CA00FFE0C000FFDA
        B700FFD7AD00FFD1A500FFCC9C00FFC79200BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFEEDC00FFE9D100FFE3C900FFE0
        BF00FFDAB600FFD5AC00FFD0A300F7C29700BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BD828100FFF7EE00FFF2E300FFEDDA00FFE7D000FFE3
        C700FFDEBD00FFD9B400FFD4AB00BD828100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD828100FFFAF300FFFAF300FFF6ED00FFF0E200FFEBD900FFE7
        CF00FFE2C500FFDDBC00F2C7A900BD828100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD828100BD828100BD828100BD828100FFF4EB00FFF0E100FFEB
        D700FFE6CE00FBDCC000BD828100FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100BD828100BD82
        8100BD828100BD828100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = #1055#1086#1095#1072#1090#1080' '#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082
      Category = 0
      Visible = ivAlways
      DropDownMenu = RozrahMenu
      OnClick = dxBarLargeButton2Click
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
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000660000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000066000021A335000066
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000066000024A5390012A9200028B0
        400000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000066000027A73E001EB4320018AE290013AB
        220027AF3E0000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00006600001F9931002EC04A0026BA3E001FB5340019AF
        2B0013AB230025AE3C0000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00006600001D952E003FCE630037C857002FC14C0025A63B000066
        000029B1410014AC250024AD3A0000660000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00006600001A902A004FDA790048D56F0040CF64002FB34A0000660000FF00
        FF00006600001CB22F0015AC260022AC380000660000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000066000059E2890055E0820050DB7B0036BC550000660000FF00FF00FF00
        FF00FF00FF0000660000148D210017AE270021AB360000660000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000066000031B04D005BE48A003ABF5B0000660000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000066000018AE290020AA340000660000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000066000047CF6D0000660000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000066000019AF2B0014AB23000066
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00006600000B7E130014AB
        240000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000066
        0000118D1D0000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000066000008790F0000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0000660000FF00FF00FF00FF00FF00
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
    object dxBarLargeButton3: TdxBarLargeButton
      Caption = #1060#1080#1083#1100#1090#1088
      Category = 0
      Hint = #1060#1080#1083#1100#1090#1088
      Visible = ivNever
      OnClick = dxBarLargeButton3Click
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
    object dxBarButton2: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080
      Visible = ivNever
      DropDownMenu = DeleteMenu
      OnClick = dxBarLargeButton4Click
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
    object dxBarButton3: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1074#1089#1110#1093
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1074#1089#1110#1093
      Visible = ivAlways
    end
    object dxBarButton4: TdxBarButton
      Caption = #1042#1080#1076#1080#1083#1080#1090#1080' '#1074#1089#1110#1093
      Category = 0
      Hint = #1042#1080#1076#1080#1083#1080#1090#1080' '#1074#1089#1110#1093
      Visible = ivAlways
      DropDownMenu = DeleteMenu
      OnClick = dxBarButton4Click
    end
    object dxBarButton5: TdxBarButton
      Caption = #1056#1086#1079#1088#1072#1093#1091#1074#1072#1090#1080' '#1074#1089#1110#1093
      Category = 0
      Hint = #1056#1086#1079#1088#1072#1093#1091#1074#1072#1090#1080' '#1074#1089#1110#1093
      Visible = ivAlways
      DropDownMenu = DeleteMenu
      OnClick = dxBarButton5Click
    end
  end
  object ActionList: TActionList
    Left = 257
    Top = 238
    object ActionSystem: TAction
      Caption = 'ActionSystem'
      ShortCut = 49242
      OnExecute = ActionSystemExecute
    end
  end
  object Styles: TcxStyleRepository
    Left = 520
    Top = 232
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
      Color = 15400938
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
      Color = 8535838
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
  object DeleteMenu: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Visible = True
      end
      item
        Item = dxBarButton4
        Visible = True
      end>
    UseOwnFont = False
    Left = 504
    Top = 8
  end
  object RozrahMenu: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Visible = True
      end
      item
        Item = dxBarButton5
        Visible = True
      end>
    UseOwnFont = False
    Left = 552
    Top = 8
  end
end
