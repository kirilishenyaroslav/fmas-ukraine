object FgrAccountData: TFgrAccountData
  Left = 641
  Top = 81
  Width = 954
  Height = 589
  Caption = 'FgrAccountData'
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
  object dxBarDockControl2: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 938
    Height = 48
    Align = dalTop
    BarManager = BarManager
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object PanelGrid3: TPanel
    Left = 265
    Top = 84
    Width = 673
    Height = 447
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Grid3: TcxGrid
      Left = 0
      Top = 0
      Width = 673
      Height = 398
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = cxcbsNone
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      object Grid3DBBandedTableView1: TcxGridDBBandedTableView
        DataController.DataSource = DSource3
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
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
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.Indicator = True
        OptionsView.BandHeaders = False
        Preview.Place = ppTop
        Preview.Visible = True
        Bands = <
          item
          end>
        object Grid3ClVo: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Options.Grouping = False
          Width = 31
          Position.BandIndex = 0
          Position.ColIndex = 5
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
          Width = 103
          Position.BandIndex = 0
          Position.ColIndex = 6
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
          Options.Grouping = False
          Width = 78
          Position.BandIndex = 0
          Position.ColIndex = 7
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
          Position.ColIndex = 8
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
          Width = 24
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
          Width = 20
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
          Width = 40
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
          Width = 20
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
          Width = 25
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'NDAY'
          IsCaptionAssigned = True
        end
      end
      object Grid3Level1: TcxGridLevel
        GridView = Grid3DBBandedTableView1
      end
    end
    object PanelGrid3DopData: TPanel
      Left = 0
      Top = 406
      Width = 673
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      OnResize = PanelGrid3DopDataResize
      object DBMaskEditDepartment: TcxDBMaskEdit
        Left = 61
        Top = 2
        Width = 437
        Height = 21
        DataBinding.DataField = 'NAME_DEPARTMENT'
        DataBinding.DataSource = DSource3
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
      end
      object DBMaskEditSmeta: TcxDBMaskEdit
        Left = 61
        Top = 20
        Width = 437
        Height = 21
        DataBinding.DataField = 'NAME_SMETA'
        DataBinding.DataSource = DSource3
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
      end
      object LabelDepartment: TcxLabel
        Left = 0
        Top = 4
        Width = 60
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 2
      end
      object LabelSmeta: TcxLabel
        Left = 0
        Top = 22
        Width = 60
        Height = 17
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 3
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 0
      Top = 398
      Width = 673
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      AlignSplitter = salBottom
      Control = PanelGrid3DopData
    end
  end
  object PanelGrids1and2: TPanel
    Left = 0
    Top = 84
    Width = 257
    Height = 447
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 6
    object SplitterGrids1And2: TSplitter
      Left = 0
      Top = 286
      Width = 257
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Beveled = True
    end
    object Grid2: TcxGrid
      Left = 0
      Top = 289
      Width = 257
      Height = 153
      Align = alBottom
      TabOrder = 0
      object Grid2View1: TcxGridDBTableView
        DataController.DataSource = DSource2
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = Grid2View1FocusedRecordChanged
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
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
          Width = 97
          DataBinding.FieldName = 'TYPE_ACC'
          IsCaptionAssigned = True
        end
      end
      object Grid2Level1: TcxGridLevel
        GridView = Grid2View1
      end
    end
    object Grid1: TcxGrid
      Left = 0
      Top = 0
      Width = 257
      Height = 286
      Align = alClient
      TabOrder = 1
      object Grid1View1: TcxGridDBTableView
        OnKeyPress = Grid1View1KeyPress
        DataController.DataSource = DSource1
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'ID_MAN'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'ID_MAN'
            Column = Grid1ClFIO
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = Grid1ClTin
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        object Grid1ClTin: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 42
          DataBinding.FieldName = 'TIN'
        end
        object Grid1ClFIO: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 136
          DataBinding.FieldName = 'FIO'
        end
      end
      object Grid1Level1: TcxGridLevel
        GridView = Grid1View1
      end
    end
    object BarDockLocate: TdxBarDockControl
      Left = 0
      Top = 442
      Width = 257
      Height = 5
      Align = dalBottom
      BarManager = BarManager
    end
  end
  object cxSplitter2: TcxSplitter
    Left = 257
    Top = 84
    Width = 8
    Height = 447
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 100
    Control = PanelGrids1and2
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 531
    Width = 938
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end>
    PaintStyle = stpsOffice11
    LookAndFeel.Kind = lfStandard
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    OnResize = dxStatusBar1Resize
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
        DockControl = dxBarDockControl2
        DockedDockControl = dxBarDockControl2
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = RefreshBtn
            Visible = True
          end
          item
            BeginGroup = True
            Item = PrintBtn
            Visible = True
          end
          item
            Item = BtnPrintAll
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
        Caption = 'FilterBar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 438
        FloatTop = 208
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = MonthList1
            Visible = True
          end
          item
            Item = YearSpin1
            UserDefine = [udWidth]
            UserWidth = 52
            Visible = True
          end
          item
            Item = dxBarStatic1
            Visible = True
          end
          item
            Item = MonthList2
            Visible = True
          end
          item
            Item = YearSpin2
            UserDefine = [udWidth]
            UserWidth = 50
            Visible = True
          end
          item
            BeginGroup = True
            Item = PersonBtn
            Visible = True
          end
          item
            Item = VObtn
            Visible = True
          end
          item
            Item = DepartmentBtn
            Visible = True
          end
          item
            Item = NotFilterBtn
            Visible = True
          end
          item
            BeginGroup = True
            Item = FilterBtn
            Visible = True
          end
          item
            BeginGroup = True
            Item = EditData
            UserDefine = [udWidth]
            UserWidth = 210
            Visible = True
          end>
        Name = 'FilterBar'
        OneOnRow = True
        Row = 0
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
    DockColor = clActiveBorder
    PopupMenuLinks = <>
    Style = bmsOffice11
    SunkenBorder = True
    UseSystemFont = True
    Left = 280
    DockControlHeights = (
      0
      0
      36
      0)
    object RefreshBtn: TdxBarLargeButton
      Caption = 'RefreshBtn'
      Category = 0
      Hint = 'RefreshBtn'
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
      Caption = 'ExitBtn'
      Category = 0
      Hint = 'ExitBtn'
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
      ShortCut = 119
      OnClick = FilterBtnClick
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
      ShowCaption = False
    end
    object PrintBtn: TdxBarLargeButton
      Align = iaRight
      Caption = 'PrintBtn'
      Category = 0
      Enabled = False
      Hint = 'PrintBtn'
      Visible = ivAlways
      ShortCut = 16500
      OnClick = PrintBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
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
    object PersonBtn: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 4
      ShortCut = 16451
      OnClick = PersonBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF5C24245C25255C25255C25255C25255C25255C25255C2525
        5C25255C25255C25255C25255C25255C25255C25255C25255C25255C25255C25
        255C2323FF00FFFF00FFFF00FF5C24259A3C3A9E3D3B9E3C3A9C3B399A3A3899
        3937983836973735963634963534933533923432923432923432923432923432
        9234329234329234328E32305C2323FF00FFFF00FF6F2C2CC44C4DC24B4CC049
        4ABF4848BD4748BB4546BA4445B74243B54141B44041B23F40B13E3FAF3C3DAD
        3B3CAD3B3CAD3B3CAD3B3CAD3B3CAD3B3C9234325C2525FF00FFFF00FF6F2D2D
        C64E4FC54D4EC24B4CC0494ABF4849BD4748BC4647BA4445B74243B64142B440
        41B44040B13E3FAF3C3DAD3B3CAD3B3CAD3B3CAD3B3CAD3B3C9234325C2525FF
        00FFFF00FF702D2DC95051C74F50C54D4EC24B4CC14A4BBF4849BF4848BC4647
        BA4445B84344B64142B54141B44040B13E3FB03D3EAD3B3CAD3B3CAD3B3CAD3B
        3C9234325C2525FF00FFFF00FF702D2DCA5354CA5353C75152C54F50C44E4FC1
        4A4BD27C7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC87576B03D3E
        AF3C3DAD3B3CAD3B3C9234325C2525FF00FFFF00FF722D2DCF595ACC5758CC55
        55C75253C65051DF9E9FFFFFFFFFFFFFE6B8B8BD4748BB4546BA4445E3B5B6FF
        FFFFC97676B23F40B13E3FAF3C3DAD3B3C9234325C2525FF00FFFF00FF762F2F
        D36364D16062CF5C5DCC5757CA5455FFFFFFFFFFFFF7E8E8C0494ABF4849BD47
        48BC4647BA4445E3B5B6CB7677B44041B44040B13E3FAF3C3D9234325C2525FF
        00FFFF00FF7A3131D86F70D76D6ED36666CE5B5CEBBDBEFFFFFFFFFFFFE8B9BA
        C24B4CC14A4BBF4849BF4848BC4647BA4445B84344B64142B54141B44040B13E
        3F9335335C2525FF00FFFF00FF823334DE8081DD7E7FD86E6FD05E5FF3D6D6FF
        FFFFFFFFFFE09F9FC54D4EC44C4DC14A4BC0494ABF4848BC4647BB4546B84344
        B74243B54141B440409635345C2525FF00FFFF00FF873535E38F8FE38F8FDC78
        79D46465F9EBEBFFFFFFFFFFFFD98282C74F50C64E4FC44C4DC24B4CC0494ABF
        4848BD4748BB4546BA4445B74243B541419636355C2525FF00FFFF00FF8E3737
        E79999E69899E08181D8696AFAEBEBFFFFFFFFFFFFDA8383CA5151C95051C64E
        4FC54D4EC24B4CC0494ABF4849BD4748BC4647BA4445B742439837355C2525FF
        00FFFF00FF923839EA9FA0E9A0A0E28687DA6D6DF5D9DAFFFFFFFFFFFFE4A3A3
        CB5253CA5152C95051C74F50C54D4EC24B4CC14A4BBF4849BF4848BC4647BA44
        459939375C2525FF00FFFF00FF9A3B3CEBA5A6EBA6A6E58C8CDC7072ECB1B1FF
        FFFFFFFFFFEDBEBECE5657CB5455CA5354CA5151C74F50C54D4EC44C4DC14A4B
        C0494ABF4848BC46479A3A385C2525FF00FFFF00FFB13E3FEEA9AAEEABABE993
        95E07677DE7879FFFFFFFFFFFFFAEAEBD35B5CCF5859CC5556CA5354CA5353E9
        BABBD68081C44C4DC24B4CC0494ABF48489D3C3A5C2525FF00FFFF00FFB13E3F
        EFABABEFB2B2EB9C9CE27E7FE28486EFB8B8FFFFFFFFFFFFEFC3C4D36060D15C
        5DCF5758EBBCBDFFFFFFD88383C64E4FC54D4EC24B4CC0494A9E3C3A5C2525FF
        00FFFF00FFB13E3FF0AFAFF0B7B7EEA9A9E58181E58788E38181E79E9FFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD98383C95051C64E4FC54D4EC24B
        4C9F3E3C5C2525FF00FFFF00FFB13E3FF2AFB0F3BCBCF2B7B8EB9696E98F90E6
        8989E38181E17B7DDD7475DA6E6EDA7373D76869D35F60D05859CB5455CA5354
        C95051C74F50C54D4EA03F3D5C2525FF00FFFF00FFB13E3FF2AAAAF4BBBBF4C1
        C2F2BCBCF0B6B6EFB2B2EDAAAAEAA0A0E69697E38B8BE08081DA7373D76768D3
        5D5ECE5758CC5556CA5152CA5151C74F50A3413E5C2525FF00FFFF00FFB13E3F
        F09FA0F2B1B1F4BBBBF4BFC0F2BDBFF2BBBBF0B5B5EEADADEBA3A4E79797E389
        89DE7879DA6C6CD56062D15A5BCF5758CC5354CB5253CA5151A441405C2525FF
        00FFFF00FFB13E3FE36667F09FA0F2A9A9F2B0B0F2B0B1F0AFAFEFAAAAEEA5A5
        EB9C9CE79091E38486DE7778DA6B6BD86363D45C5DD1595ACF5556CE5455CB52
        539F413E5C2525FF00FFFF00FFFF00FFB13E3FB13E3FB13E3FB13E3FB13E3FB1
        3E3FB13E3FB13E3F9E3D3D993A3B9338398F37378936368635358033337A3333
        762F30732D2E722D2D5D2525FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ShowCaption = False
    end
    object VObtn: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 4
      ShortCut = 16450
      OnClick = VObtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF5C24245C25255C25255C25255C25255C25255C25255C2525
        5C25255C25255C25255C25255C25255C25255C25255C25255C25255C25255C25
        255C2323FF00FFFF00FFFF00FF5C24259A3C3A9E3D3B9E3C3A9C3B399A3A3899
        3937983836973735963634963534933533923432923432923432923432923432
        9234329234329234328E32305C2323FF00FFFF00FF6F2C2CC44C4DC24B4CC049
        4ABF4848BD4748BB4546BA4445B74243B54141B44041B23F40B13E3FAF3C3DAD
        3B3CAD3B3CAD3B3CAD3B3CAD3B3CAD3B3C9234325C2525FF00FFFF00FF6F2D2D
        C64E4FC54D4EC24B4CC0494ABF4849BD4748BC4647BA4445B74243B64142B440
        41B44040B13E3FAF3C3DAD3B3CAD3B3CAD3B3CAD3B3CAD3B3C9234325C2525FF
        00FFFF00FF702D2DC95051C74F50C54D4EC24B4CC14A4BBF4849BF4848BC4647
        BA4445B84344B64142B54141B44040B13E3FB03D3EAD3B3CAD3B3CAD3B3CAD3B
        3C9234325C2525FF00FFFF00FF702D2DCA5354CA5353C75152C54F50C44E4FC1
        4A4BC0494ABF4848BC4647BB4546B84344B74243B54141B44040B23F40B03D3E
        AF3C3DAD3B3CAD3B3C9234325C2525FF00FFFF00FF722D2DCF595ACC5758CC55
        55C75253F8E8E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEC
        CFCFB44041B23F40B13E3FAF3C3DAD3B3C9234325C2525FF00FFFF00FF762F2F
        D36364D16062CF5C5DCC5757CA5455E09FA0FFFFFFFFFFFFC0494ABF4849BD47
        48E5B7B7FFFFFFFFFFFFF6E7E7B44041B44040B13E3FAF3C3D9234325C2525FF
        00FFFF00FF7A3131D86F70D76D6ED36666CE5B5CCC5758E1A1A1FFFFFFFFFFFF
        C24B4CC14A4BBF4849BF4848EED0D0FFFFFFFFFFFFCB7677B54141B44040B13E
        3F9335335C2525FF00FFFF00FF823334DE8081DD7E7FD86E6FD05E5FCF5C5DE3
        A2A3FFFFFFFFFFFFC54D4EC44C4DC14A4BC0494AEFD1D1FFFFFFFFFFFFCC7879
        B74243B54141B440409635345C2525FF00FFFF00FF873535E38F8FE38F8FDC78
        79D46465D36364E5A4A5FFFFFFFFFFFFC74F50C64E4FC44C4DF0D1D2FFFFFFFF
        FFFFEED0D1BB4546BA4445B74243B541419636355C2525FF00FFFF00FF8E3737
        E79999E69899E08181D8696AD56667E6A6A7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF7E8E8C0494ABF4849BD4748BC4647BA4445B742439837355C2525FF
        00FFFF00FF923839EA9FA0E9A0A0E28687DA6D6DD86B6CE7A8A9FFFFFFFFFFFF
        CB5253CA5152C95051F8E8E8FFFFFFFFFFFFD27D7EBF4849BF4848BC4647BA44
        459939375C2525FF00FFFF00FF9A3B3CEBA5A6EBA6A6E58C8CDC7072DC7070EA
        ACACFFFFFFFFFFFFCE5657CB5455CA5354CA5151FFFFFFFFFFFFF0D2D2C14A4B
        C0494ABF4848BC46479A3A385C2525FF00FFFF00FFB13E3FEEA9AAEEABABE993
        95E07677DE7879EBB0B0FFFFFFFFFFFFD35B5CCF5859CC5556CA5354FFFFFFFF
        FFFFF1D2D2C44C4DC24B4CC0494ABF48489D3C3A5C2525FF00FFFF00FFB13E3F
        EFABABEFB2B2EB9C9CE27E7FE28486EFB8B8FFFFFFFFFFFFD76667D36060D15C
        5DFFFFFFFFFFFFFFFFFFD88383C64E4FC54D4EC24B4CC0494A9E3C3A5C2525FF
        00FFFF00FFB13E3FF0AFAFF0B7B7EEA9A9E58181FCF0F0FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCB5556CA5353C95051C64E4FC54D4EC24B
        4C9F3E3C5C2525FF00FFFF00FFB13E3FF2AFB0F3BCBCF2B7B8EB9696E98F90E6
        8989E38181E17B7DDD7475DA6E6EDA7373D76869D35F60D05859CB5455CA5354
        C95051C74F50C54D4EA03F3D5C2525FF00FFFF00FFB13E3FF2AAAAF4BBBBF4C1
        C2F2BCBCF0B6B6EFB2B2EDAAAAEAA0A0E69697E38B8BE08081DA7373D76768D3
        5D5ECE5758CC5556CA5152CA5151C74F50A3413E5C2525FF00FFFF00FFB13E3F
        F09FA0F2B1B1F4BBBBF4BFC0F2BDBFF2BBBBF0B5B5EEADADEBA3A4E79797E389
        89DE7879DA6C6CD56062D15A5BCF5758CC5354CB5253CA5151A441405C2525FF
        00FFFF00FFB13E3FE36667F09FA0F2A9A9F2B0B0F2B0B1F0AFAFEFAAAAEEA5A5
        EB9C9CE79091E38486DE7778DA6B6BD86363D45C5DD1595ACF5556CE5455CB52
        539F413E5C2525FF00FFFF00FFFF00FFB13E3FB13E3FB13E3FB13E3FB13E3FB1
        3E3FB13E3FB13E3F9E3D3D993A3B9338398F37378936368635358033337A3333
        762F30732D2E722D2D5D2525FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ShowCaption = False
    end
    object DepartmentBtn: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 4
      ShortCut = 16464
      OnClick = DepartmentBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF5C24245C25255C25255C25255C25255C25255C25255C2525
        5C25255C25255C25255C25255C25255C25255C25255C25255C25255C25255C25
        255C2323FF00FFFF00FFFF00FF5C24259A3C3A9E3D3B9E3C3A9C3B399A3A3899
        3937983836973735963634963534933533923432923432923432923432923432
        9234329234329234328E32305C2323FF00FFFF00FF6F2C2CC44C4DC24B4CC049
        4ABF4848BD4748BB4546BA4445B74243B54141B44041B23F40B13E3FAF3C3DAD
        3B3CAD3B3CAD3B3CAD3B3CAD3B3CAD3B3C9234325C2525FF00FFFF00FF6F2D2D
        C64E4FC54D4EC24B4CC0494ABF4849BD4748BC4647BA4445B74243B64142B440
        41B44040B13E3FAF3C3DAD3B3CAD3B3CAD3B3CAD3B3CAD3B3C9234325C2525FF
        00FFFF00FF702D2DC95051C74F50C54D4EC24B4CC14A4BBF4849BF4848BC4647
        BA4445B84344B64142B54141B44040B13E3FB03D3EAD3B3CAD3B3CAD3B3CAD3B
        3C9234325C2525FF00FFFF00FF702D2DCA5354CA5353C75152FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF6E7E7BB4546B84344F6E7E7FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFAD3B3CAD3B3C9234325C2525FF00FFFF00FF722D2DCF595ACC5758CC55
        55C75253E09FA0FFFFFFFFFFFFDD9B9CBF4848BD4748BB4546BA4445D89898FF
        FFFFFFFFFFE1B4B4B13E3FAF3C3DAD3B3C9234325C2525FF00FFFF00FF762F2F
        D36364D16062CF5C5DCC5757E2A1A2FFFFFFFFFFFFDE9D9DC0494ABF4849BD47
        48BC4647D99999FFFFFFFFFFFFD69797B44040B13E3FAF3C3D9234325C2525FF
        00FFFF00FF7A3131D86F70D76D6ED36666CE5B5CE3A3A4FFFFFFFFFFFFDF9E9E
        C24B4CC14A4BBF4849BF4848DA9A9AFFFFFFFFFFFFD79798B54141B44040B13E
        3F9335335C2525FF00FFFF00FF823334DE8081DD7E7FD86E6FD05E5FE5A6A6FF
        FFFFFFFFFFE09F9FC54D4EC44C4DC14A4BC0494ADC9B9BFFFFFFFFFFFFD89899
        B74243B54141B440409635345C2525FF00FFFF00FF873535E38F8FE38F8FDC78
        79D46465E7AAAAFFFFFFFFFFFFE2A0A0C74F50C64E4FC44C4DC24B4CDD9B9CFF
        FFFFFFFFFFDA999ABA4445B74243B541419636355C2525FF00FFFF00FF8E3737
        E79999E69899E08181D8696AE8ABACFFFFFFFFFFFFE3A0A1CA5151C95051C64E
        4FC54D4EDE9D9DFFFFFFFFFFFFDB9A9BBC4647BA4445B742439837355C2525FF
        00FFFF00FF923839EA9FA0E9A0A0E28687DA6D6DEAAEAFFFFFFFFFFFFFE4A3A3
        CB5253CA5152C95051C74F50DF9E9EFFFFFFFFFFFFDC9B9BBF4848BC4647BA44
        459939375C2525FF00FFFF00FF9A3B3CEBA5A6EBA6A6E58C8CDC7072ECB1B1FF
        FFFFFFFFFFE5A4A4CE5657CB5455CA5354CA5151E09F9FFFFFFFFFFFFFDD9C9D
        C0494ABF4848BC46479A3A385C2525FF00FFFF00FFB13E3FEEA9AAEEABABE993
        95E07677EDB5B6FFFFFFFFFFFFE8A8A8D35B5CCF5859CC5556CA5354E2A1A1FF
        FFFFFFFFFFDF9D9EC24B4CC0494ABF48489D3C3A5C2525FF00FFFF00FFB13E3F
        EFABABEFB2B2EB9C9CE27E7FEFBCBDFFFFFFFFFFFFEBAEAED76667D36060D15C
        5DCF5758E3A1A2FFFFFFFFFFFFE09E9FC54D4EC24B4CC0494A9E3C3A5C2525FF
        00FFFF00FFB13E3FF0AFAFF0B7B7EEA9A9E58181F1BDBEFFFFFFFFFFFFECB2B3
        DA6D6DD86869D76768D15F60E5A5A5FFFFFFFFFFFFEABBBBC64E4FC54D4EC24B
        4C9F3E3C5C2525FF00FFFF00FFB13E3FF2AFB0F3BCBCF2B7B8FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC74F50C54D4EA03F3D5C2525FF00FFFF00FFB13E3FF2AAAAF4BBBBF4C1
        C2F2BCBCF0B6B6EFB2B2EDAAAAEAA0A0E69697E38B8BE08081DA7373D76768D3
        5D5ECE5758CC5556CA5152CA5151C74F50A3413E5C2525FF00FFFF00FFB13E3F
        F09FA0F2B1B1F4BBBBF4BFC0F2BDBFF2BBBBF0B5B5EEADADEBA3A4E79797E389
        89DE7879DA6C6CD56062D15A5BCF5758CC5354CB5253CA5151A441405C2525FF
        00FFFF00FFB13E3FE36667F09FA0F2A9A9F2B0B0F2B0B1F0AFAFEFAAAAEEA5A5
        EB9C9CE79091E38486DE7778DA6B6BD86363D45C5DD1595ACF5556CE5455CB52
        539F413E5C2525FF00FFFF00FFFF00FFB13E3FB13E3FB13E3FB13E3FB13E3FB1
        3E3FB13E3FB13E3F9E3D3D993A3B9338398F37378936368635358033337A3333
        762F30732D2E722D2D5D2525FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ShowCaption = False
    end
    object NotFilterBtn: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 4
      ShortCut = 16463
      OnClick = NotFilterBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF5C24245C25255C25255C25255C25255C25255C25255C2525
        5C25255C25255C25255C25255C25255C25255C25255C25255C25255C25255C25
        255C2323FF00FFFF00FFFF00FF5C24259A3C3A9E3D3B9E3C3A9C3B399A3A3899
        3937983836973735963634963534933533923432923432923432923432923432
        9234329234329234328E32305C2323FF00FFFF00FF6F2C2CC44C4DC24B4CC049
        4ABF4848BD4748BB4546BA4445B74243B54141B44041B23F40B13E3FAF3C3DAD
        3B3CAD3B3CAD3B3CAD3B3CAD3B3CAD3B3C9234325C2525FF00FFFF00FF6F2D2D
        C64E4FC54D4EC24B4CC0494ABF4849BD4748BC4647BA4445B74243B64142B440
        41B44040B13E3FAF3C3DAD3B3CAD3B3CAD3B3CAD3B3CAD3B3C9234325C2525FF
        00FFFF00FF702D2DC95051C74F50C54D4EC24B4CC14A4BBF4849BF4848BC4647
        BA4445B84344B64142B54141B44040B13E3FB03D3EAD3B3CAD3B3CAD3B3CAD3B
        3C9234325C2525FF00FFFF00FF702D2DCA5354CA5353C75152C54F50C44E4FC1
        4A4BC0494ABF4848BC4647BB4546B84344B74243B54141B44040B23F40B03D3E
        AF3C3DAD3B3CAD3B3C9234325C2525FF00FFFF00FF722D2DCF595ACC5758EBBD
        BDFFFFFFE9BBBBC44E4FE7B9B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDCFCFB5
        4141B44041B23F40B13E3FAF3C3DAD3B3C9234325C2525FF00FFFF00FF762F2F
        D36364D16062CF5C5DEBBDBDFFFFFFFFFFFFFFFFFFE7B9B9C0494ABF4849BD47
        48DA9A9AFFFFFFFFFFFFE2B5B5B44041B44040B13E3FAF3C3D9234325C2525FF
        00FFFF00FF7A3131D86F70D76D6ED36666DC898AFFFFFFFFFFFFFFFFFFC54D4E
        C24B4CC14A4BBF4849BF4848BC4647EDD0D0FFFFFFE2B5B5B54141B44040B13E
        3F9335335C2525FF00FFFF00FF823334DE8081DD7E7FD86E6FF9EAEAFFFFFFCC
        5556FFFFFFFFFFFFD57F80C44C4DC14A4BC0494ABF4848BC4647F6E7E7FFFFFF
        B74243B54141B440409635345C2525FF00FFFF00FF873535E38F8FE38F8FE69E
        9FF4D8D8EEC2C2CF595ACA5354F8E9E9FFFFFFE9BABAC44C4DC24B4CC0494ABF
        4848E5B7B8FFFFFFD99999B74243B541419636355C2525FF00FFFF00FF8E3737
        E79999E69899EEBABAFAECECEFC3C4D15D5ECC5556CB5253EABBBBFFFFFFF1D2
        D2C54D4EC24B4CC0494ADC9B9BF6E7E7E5B7B7BA4445B742439837355C2525FF
        00FFFF00FF923839EA9FA0E9A0A0EAA8A9F6DADAF0C5C6D46062CF5859CE5657
        CB5253E2A0A0FFFFFFFFFFFFC54D4EC24B4CE7B8B9FFFFFFDC9B9BBC4647BA44
        459939375C2525FF00FFFF00FF9A3B3CEBA5A6EBA6A6E58C8CFAEDEDFFFFFFD8
        6768D45C5DD05859CE5657CB5455CA5354FFFFFFFFFFFFD57F80FFFFFFFFFFFF
        C0494ABF4848BC46479A3A385C2525FF00FFFF00FFB13E3FEEA9AAEEABABE993
        95EEB4B5FFFFFFFAECECD86566D55F60D35B5CCF5859CC5556CA5354F8E9E9FF
        FFFFFFFFFFDF9D9EC24B4CC0494ABF48489D3C3A5C2525FF00FFFF00FFB13E3F
        EFABABEFB2B2EB9C9CE27E7FEFBCBDFFFFFFFFFFFFF1C5C5D76667D36060D15C
        5DECBDBEFFFFFFFFFFFFFFFFFFF1D2D2C54D4EC24B4CC0494A9E3C3A5C2525FF
        00FFFF00FFB13E3FF0AFAFF0B7B7EEA9A9E58181E58788E38181F7DDDDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFEDBFBFCB5556E2A1A1FFFFFFF8E8E8C54D4EC24B
        4C9F3E3C5C2525FF00FFFF00FFB13E3FF2AFB0F3BCBCF2B7B8EB9696E98F90E6
        8989E38181E17B7DDD7475DA6E6EDA7373D76869D35F60D05859CB5455CA5354
        C95051C74F50C54D4EA03F3D5C2525FF00FFFF00FFB13E3FF2AAAAF4BBBBF4C1
        C2F2BCBCF0B6B6EFB2B2EDAAAAEAA0A0E69697E38B8BE08081DA7373D76768D3
        5D5ECE5758CC5556CA5152CA5151C74F50A3413E5C2525FF00FFFF00FFB13E3F
        F09FA0F2B1B1F4BBBBF4BFC0F2BDBFF2BBBBF0B5B5EEADADEBA3A4E79797E389
        89DE7879DA6C6CD56062D15A5BCF5758CC5354CB5253CA5151A441405C2525FF
        00FFFF00FFB13E3FE36667F09FA0F2A9A9F2B0B0F2B0B1F0AFAFEFAAAAEEA5A5
        EB9C9CE79091E38486DE7778DA6B6BD86363D45C5DD1595ACF5556CE5455CB52
        539F413E5C2525FF00FFFF00FFFF00FFB13E3FB13E3FB13E3FB13E3FB13E3FB1
        3E3FB13E3FB13E3F9E3D3D993A3B9338398F37378936368635358033337A3333
        762F30732D2E722D2D5D2525FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ShowCaption = False
    end
    object EditData: TdxBarEdit
      Align = iaClient
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ReadOnly = True
      Width = 100
    end
    object MonthList1: TdxBarCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 100
      ItemIndex = -1
    end
    object YearSpin1: TdxBarSpinEdit
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 100
      MaxValue = 2100.000000000000000000
      MinValue = 2000.000000000000000000
      Value = 2100.000000000000000000
    end
    object dxBarStatic1: TdxBarStatic
      Caption = '---'
      Category = 0
      Visible = ivAlways
    end
    object MonthList2: TdxBarCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 100
      ItemIndex = -1
    end
    object YearSpin2: TdxBarSpinEdit
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 100
      MaxValue = 2100.000000000000000000
      MinValue = 2000.000000000000000000
      Value = 2000.000000000000000000
    end
    object BtnPrintAll: TdxBarLargeButton
      Caption = #1044#1088#1091#1082' '#1074#1089#1110#1093
      Category = 0
      Enabled = False
      Hint = #1044#1088#1091#1082' '#1074#1089#1110#1093
      Visible = ivAlways
      OnClick = BtnPrintAllClick
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
  end
  object DSource3: TDataSource
    DataSet = DSet3
    Left = 456
    Top = 64
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 456
  end
  object DataBase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 360
    Top = 16
  end
  object DSet3: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UV_SHEET_LIST_PEOPLE(:ID_GRSHEET)')
    DataSource = DSource2
    AfterOpen = DSet3AfterOpen
    Left = 424
    Top = 64
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSet1: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UV_REE_VED_SELECT')
    Left = 424
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 392
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 392
    Top = 32
  end
  object StoredProc: TpFIBStoredProc
    Database = DataBase
    Transaction = WriteTransaction
    Left = 488
    Top = 16
  end
  object DSet2: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UV_SHEET_LIST_PEOPLE(:ID_GRSHEET)')
    DataSource = DSource1
    Left = 424
    Top = 32
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 456
    Top = 32
  end
  object ActionList: TActionList
    Left = 321
    Top = 14
    object ActionSystem: TAction
      Caption = 'ActionSystem'
      ShortCut = 49242
      OnExecute = ActionSystemExecute
    end
  end
end
