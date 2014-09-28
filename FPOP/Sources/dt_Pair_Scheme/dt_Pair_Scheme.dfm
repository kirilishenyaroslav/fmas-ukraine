object dt_Pair_Scheme_Form: Tdt_Pair_Scheme_Form
  Left = 228
  Top = 148
  Width = 724
  Height = 544
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1079#1074#39#1103#1079#1082#1110#1074' '#1084#1110#1078' '#1086#1073#39#1108#1082#1090#1072#1084#1080' '#1074#1086#1076#1086#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainPanel: TPanel
    Left = 0
    Top = 34
    Width = 716
    Height = 476
    Align = alClient
    TabOrder = 0
    object RightPanel: TPanel
      Left = 363
      Top = 137
      Width = 352
      Height = 338
      Align = alClient
      BevelOuter = bvNone
      Color = 15451300
      TabOrder = 0
      object Label3: TLabel
        Left = 0
        Top = 0
        Width = 352
        Height = 13
        Align = alTop
        Caption = #1042#1080#1093#1110#1076#1085#1110' '#1079#1074#39#1103#1079#1082#1080':'
      end
      object OutputTreeList: TcxTreeList
        Left = 0
        Top = 39
        Width = 352
        Height = 299
        Styles.StyleSheet = dm.TreeListStyleSheetDevExpress
        Align = alClient
        Bands = <
          item
            Caption.AlignHorz = taCenter
            Caption.Text = #1053#1072#1079#1074#1072
            Width = 244
          end
          item
            Caption.AlignHorz = taCenter
            Caption.Text = #1063#1072#1089#1090#1082#1072
            Width = 105
          end>
        BufferedPaint = True
        Color = clBtnFace
        LookAndFeel.Kind = lfUltraFlat
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsBehavior.ImmediateEditor = False
        OptionsBehavior.DragCollapse = False
        OptionsBehavior.ExpandOnIncSearch = True
        OptionsBehavior.Sorting = False
        OptionsBehavior.MultiSort = False
        OptionsBehavior.ShowHourGlass = False
        OptionsCustomizing.BandCustomizing = False
        OptionsCustomizing.BandVertSizing = False
        OptionsCustomizing.ColumnCustomizing = False
        OptionsCustomizing.ColumnMoving = False
        OptionsCustomizing.ColumnVertSizing = False
        OptionsData.Editing = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsView.CellTextMaxLineCount = -1
        OptionsView.ShowEditButtons = ecsbFocused
        OptionsView.Bands = True
        OptionsView.ColumnAutoWidth = True
        ParentColor = False
        Preview.MaxLineCount = 2
        TabOrder = 0
        object cxTreeList1cxTreeListColumn9: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          DataBinding.ValueType = 'String'
          Options.Sorting = False
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
          Width = 115
        end
        object cxTreeList1cxTreeListColumn10: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          DataBinding.ValueType = 'String'
          Options.Sorting = False
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
          Width = 75
        end
        object cxTreeList1cxTreeListColumn11: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          DataBinding.ValueType = 'String'
          Options.Sorting = False
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
          Width = 75
        end
        object cxTreeList1cxTreeListColumn12: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Caption.AlignHorz = taCenter
          Caption.Text = #1054#1073#39#1108#1082#1090#1091
          DataBinding.ValueType = 'String'
          Options.Sorting = False
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          Width = 124
        end
        object cxTreeList1cxTreeListColumn13: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          DataBinding.ValueType = 'String'
          Options.Sorting = False
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
          Width = 75
        end
        object cxTreeList1cxTreeListColumn14: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Caption.AlignHorz = taCenter
          Caption.Text = #1055#1088#1086#1076#1091#1082#1094#1110#1111
          DataBinding.ValueType = 'String'
          Options.Sorting = False
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Width = 121
        end
        object cxTreeList1cxTreeListColumn15: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Caption.AlignHorz = taCenter
          Caption.Text = #1074#1093#1086#1076#1091
          DataBinding.ValueType = 'String'
          Options.Sorting = False
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 1
          Width = 55
        end
        object cxTreeList1cxTreeListColumn16: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Caption.AlignHorz = taCenter
          Caption.Text = #1074#1080#1093#1086#1076#1091
          DataBinding.ValueType = 'String'
          Options.Sorting = False
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 1
          Width = 50
        end
      end
      object OutBarDockControl: TdxBarDockControl
        Left = 0
        Top = 13
        Width = 352
        Height = 26
        Align = dalTop
        BarManager = BarManager
        Color = 15451300
        ParentColor = False
        UseOwnColor = True
      end
    end
    object LeftPanel: TPanel
      Left = 1
      Top = 137
      Width = 354
      Height = 338
      Align = alLeft
      BevelOuter = bvNone
      Color = 15451300
      TabOrder = 1
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 354
        Height = 13
        Align = alTop
        Caption = #1042#1093#1110#1076#1085#1110' '#1079#1074#39#1103#1079#1082#1080':'
      end
      object InputTreeList: TcxTreeList
        Left = 0
        Top = 39
        Width = 354
        Height = 299
        Styles.StyleSheet = dm.TreeListStyleSheetDevExpress
        Align = alClient
        Bands = <
          item
            Caption.AlignHorz = taCenter
            Caption.Text = #1053#1072#1079#1074#1072
            Width = 243
          end
          item
            Caption.AlignHorz = taCenter
            Caption.Text = #1063#1072#1089#1090#1082#1072
            Width = 105
          end>
        BufferedPaint = True
        Color = clBtnFace
        LookAndFeel.Kind = lfUltraFlat
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsBehavior.ImmediateEditor = False
        OptionsBehavior.DragCollapse = False
        OptionsBehavior.ExpandOnIncSearch = True
        OptionsBehavior.Sorting = False
        OptionsBehavior.MultiSort = False
        OptionsBehavior.ShowHourGlass = False
        OptionsCustomizing.BandCustomizing = False
        OptionsCustomizing.BandVertSizing = False
        OptionsCustomizing.ColumnCustomizing = False
        OptionsCustomizing.ColumnMoving = False
        OptionsCustomizing.ColumnVertSizing = False
        OptionsData.Editing = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsView.CellTextMaxLineCount = -1
        OptionsView.ShowEditButtons = ecsbFocused
        OptionsView.Bands = True
        OptionsView.ColumnAutoWidth = True
        ParentColor = False
        Preview.MaxLineCount = 2
        TabOrder = 0
        object cxTreeList1cxTreeListColumn1: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          DataBinding.ValueType = 'String'
          Options.Sorting = False
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
          Width = 114
        end
        object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          DataBinding.ValueType = 'String'
          Options.Sorting = False
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
          Width = 114
        end
        object cxTreeList1cxTreeListColumn3: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          DataBinding.ValueType = 'String'
          Options.Sorting = False
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
          Width = 114
        end
        object cxTreeList1cxTreeListColumn4: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Caption.AlignHorz = taCenter
          Caption.Text = #1054#1073#39#1108#1082#1090#1091
          DataBinding.ValueType = 'String'
          Options.Sorting = False
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          Width = 125
        end
        object cxTreeList1cxTreeListColumn5: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          DataBinding.ValueType = 'String'
          Options.Sorting = False
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
          Width = 114
        end
        object cxTreeList1cxTreeListColumn6: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Caption.AlignHorz = taCenter
          Caption.Text = #1055#1088#1086#1076#1091#1082#1094#1110#1111
          DataBinding.ValueType = 'String'
          Options.Sorting = False
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Width = 121
        end
        object cxTreeList1cxTreeListColumn7: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Caption.AlignHorz = taCenter
          Caption.Text = #1074#1093#1086#1076#1091
          DataBinding.ValueType = 'String'
          Options.Sorting = False
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 1
          Width = 54
        end
        object cxTreeList1cxTreeListColumn8: TcxTreeListColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Caption.AlignHorz = taCenter
          Caption.Text = #1074#1080#1093#1086#1076#1091
          DataBinding.ValueType = 'String'
          Options.Sorting = False
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 1
          Width = 52
        end
      end
      object InBarDockControl: TdxBarDockControl
        Left = 0
        Top = 13
        Width = 354
        Height = 26
        Align = dalTop
        BarManager = BarManager
        Color = 15451300
        ParentColor = False
        UseOwnColor = True
      end
    end
    object CentralPanel: TPanel
      Left = 1
      Top = 1
      Width = 714
      Height = 128
      Align = alTop
      TabOrder = 2
      object TreeList: TcxDBTreeList
        Left = 1
        Top = 1
        Width = 712
        Height = 126
        Styles.StyleSheet = dm.TreeListStyleSheetDevExpress
        Align = alClient
        Bands = <
          item
            Caption.Text = 'Band1'
            Width = 600
          end>
        BufferedPaint = False
        DataController.DataSource = DataSource
        DataController.ParentField = 'LINKTO'
        DataController.KeyField = 'ID_TYPE_OBJECT'
        OptionsBehavior.Sorting = False
        OptionsCustomizing.BandVertSizing = False
        OptionsCustomizing.ColumnVertSizing = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        RootValue = -1
        TabOrder = 0
        OnCustomDrawCell = TreeListCustomDrawCell
        OnFocusedNodeChanged = TreeListFocusedNodeChanged
        object ID_TYPE_OBJECT_COLUMN: TcxDBTreeListColumn
          Caption.Text = 'ID_TYPE_OBJECT'
          DataBinding.FieldName = 'ID_TYPE_OBJECT'
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
        end
        object ID_OBJECT_COLUMN: TcxDBTreeListColumn
          Caption.Text = 'ID_OBJECT'
          DataBinding.FieldName = 'ID_OBJECT'
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
        end
        object NAME_COLUMN: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.AlignVert = vaCenter
          Caption.Text = #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1091
          DataBinding.FieldName = 'NAME'
          Options.Sorting = False
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          Width = 367
        end
        object LINKTO_COLUMN: TcxDBTreeListColumn
          Caption.Text = 'LINKTO'
          DataBinding.FieldName = 'LINKTO'
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
        end
        object ID_DEPARTMENT_COLUMN: TcxDBTreeListColumn
          Caption.Text = 'ID_DEPARTMENT'
          DataBinding.FieldName = 'ID_DEPARTMENT'
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
        end
        object NAME_DEPARTMENT_COLUMN: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.AlignVert = vaCenter
          Caption.Text = #1053#1072#1079#1074#1072' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1091
          DataBinding.FieldName = 'NAME_DEPARTMENT'
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Width = 228
        end
        object FOR_PLAN_COLUMN: TcxDBTreeListColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Caption.AlignHorz = taCenter
          Caption.AlignVert = vaCenter
          Caption.Text = #1042#1082#1083#1102#1095#1080#1090#1080' '#1076#1086' '#1087#1083#1072#1085#1091
          DataBinding.FieldName = 'FOR_PLAN'
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Width = 115
        end
      end
    end
    object Splitter: TcxSplitter
      Left = 355
      Top = 137
      Width = 8
      Height = 338
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.ShadowStartColor = clSkyBlue
      AutoSnap = True
      ResizeUpdate = True
      Control = LeftPanel
    end
    object Splitter1: TcxSplitter
      Left = 1
      Top = 129
      Width = 714
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.ShadowStartColor = clSkyBlue
      AlignSplitter = salTop
      AutoSnap = True
      ResizeUpdate = True
      Control = CentralPanel
      Color = clBtnFace
      ParentColor = False
    end
  end
  object Query: TpFIBQuery
    Database = dm.DataBase
    Transaction = dm.ReadTransaction
    Left = 220
    Top = 8
  end
  object StoredProc: TpFIBStoredProc
    Database = dm.DataBase
    Transaction = dm.WriteTransaction
    Left = 248
    Top = 8
  end
  object Query1: TpFIBQuery
    Database = dm.DataBase
    Transaction = dm.ReadTransaction
    Left = 192
    Top = 8
  end
  object ActionList: TActionList
    Left = 304
    Top = 8
    object ActionMod: TAction
      Caption = 'ModRecord'
      ShortCut = 115
    end
    object ActionDel: TAction
      Caption = 'DeleteRecord'
      ShortCut = 119
    end
    object ActionAdd: TAction
      Caption = 'AddRecord'
      ShortCut = 118
    end
    object ActionSel: TAction
      Caption = 'SelectRecord'
      ShortCut = 123
    end
    object ActionRefresh: TAction
      Caption = 'ActionRefresh'
      ShortCut = 116
    end
    object ActionExit: TAction
      Caption = 'ActionExit'
      ShortCut = 27
      OnExecute = ActionExitExecute
    end
  end
  object DataSet: TpFIBDataSet
    Database = dm.DataBase
    Transaction = dm.ReadTransaction
    SelectSQL.Strings = (
      'select * from PROC_SP_OBJECT_SEL')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 408
    Top = 101
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 360
    Top = 101
  end
  object BarManager: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'MainPanel'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 62
        FloatClientHeight = 80
        ItemLinks = <
          item
            Item = RefreshButton
            Visible = True
          end
          item
            Item = CloseButton
            Visible = True
          end>
        Name = 'MainPanel'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'InPanel'
        DockControl = InBarDockControl
        DockedDockControl = InBarDockControl
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = AddInputButton
            Visible = True
          end
          item
            Item = EditInputButton
            Visible = True
          end
          item
            Item = DelInputButton
            Visible = True
          end
          item
            BeginGroup = True
            Item = SaveInputButton
            Visible = True
          end
          item
            Item = CancelInputButton
            Visible = True
          end>
        Name = 'InPanel'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'OutPanel'
        DockControl = OutBarDockControl
        DockedDockControl = OutBarDockControl
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = AddOutputButton
            Visible = True
          end
          item
            Item = EditOutputButton
            Visible = True
          end
          item
            Item = DelOutputButton
            Visible = True
          end
          item
            Item = SaveOutputButton
            Visible = True
          end
          item
            Item = CancelOutputButton
            Visible = True
          end>
        Name = 'OutPanel'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 489
    Top = 98
    DockControlHeights = (
      0
      0
      34
      0)
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object RefreshButton: TdxBarLargeButton
      Caption = #1042#1110#1076#1085#1086#1074#1080#1090#1080
      Category = 0
      Hint = #1042#1110#1076#1085#1086#1074#1080#1090#1080
      Visible = ivAlways
      OnClick = RefreshButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000017000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        0000FF00FFFF00FF92635D8E5D598E5D598E5D598E5D598E5D598E5D598E5D59
        8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598050
        4BFF00FFFF00FF000000FF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0
        CE9EEFCB97EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080
        EDC180EABF7F80504BFF00FFFF00FF000000FF00FFFF00FF93655FEED4B8F4DA
        BBF2D5B1F0D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9BD7FE9
        BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FF000000FF00FFFF00FF
        93655FEED7C0F6E0C1F2D9B8F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC58FEBC1
        89EABF82E9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FF00
        0000FF00FFFF00FF93655FEFDAC5F7E2C7F3DCBFF2D8B7007000F0D1AAEFCEA3
        B1B874007000007000007000ADAD60E9BD7FE9BD7FE9BD7FEABF7FE7BC7E8050
        4BFF00FFFF00FF000000FF00FFFF00FF936560F0DECCF8E6CFF6E0C6F3DCBD00
        7000047503B2BD7F007000B1B874EDC796B0B46B007000ADAF62E9BD7FE9BD7F
        EABF7FE7BC7E80504BFF00FFFF00FF000000FF00FFFF00FF956660F2E2D3FAEA
        D7F6E3CEF4DEC5007000007000007000B2BD7FEFCEA3EECB9DEDC797B0B46B00
        7000E9BD81E9BD7FEABF7FE7BC7E80504BFF00FFFF00FF000000FF00FFFF00FF
        986963F2E6DAFAEEDEF7E7D4F6E2CB007000007000007000007000F0D1A9EFCE
        A3EECB9DEDC796007000EBC189E9BD81EABF7FE7BC7E80504BFF00FFFF00FF00
        0000FF00FFFF00FF9E6E64F4EAE1FBF2E6F8EADCF7E6D3007000007000007000
        007000007000F0D1AAEFCEA4EDCB9CEDC796EBC58FEBC188EABF82E7BB7E8050
        4BFF00FFFF00FF000000FF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3F7EADAF7
        E6D3F6E2CCF4DEC5F3DCBDF2D8B6F0D5B0F0D1AAEFCEA3EECA9CEDC795EBC48E
        EBC288E7BC8080504BFF00FFFF00FF000000FF00FFFF00FFA77568F8F3F0FEFB
        F6FBF3EBF8EEE3F8EBDCF7E7D3F6E2CCF4E0C500700000700000700000700000
        7000EDCB9CEDC795EDC58FE9BF8780504BFF00FFFF00FF000000FF00FFFF00FF
        AC7969FAF6F4FFFFFEFEF8F3FBF2EA007000F8EBDAF7E6D3F7E2CCF6E0C50070
        00007000007000007000EFCEA3EECB9CEEC996EAC18E80504BFF00FFFF00FF00
        0000FF00FFFF00FFB17E6BFAF6F4FFFFFFFFFEFBFEF7F0007000BAD4AAF8EADA
        F7E7D3F6E2CBB7C792007000007000007000F0D1A9EFCEA1EECB9CEBC5928050
        4BFF00FFFF00FF000000FF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFBBC
        DAB4007000B8D3AAF8EBDCB7CC9D007000B7C792047503007000F2D4AFF0D1A9
        F0CFA3EDC99980504BFF00FFFF00FF000000FF00FFFF00FFBB846EFAF6F4FFFF
        FFFFFFFFFFFFFFFFFEFBBCDAB4007000007000007000B7CC9DF6E2CBF6DEC400
        7000F2D8B6F0D4AFEFD0A7CEB49180504BFF00FFFF00FF000000FF00FFFF00FF
        C0896FFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFEF7F2FBF2EAFAEEE2F8EB
        DAF7E6D3F6E2CBF6DEC4F3DCBDE5CEAFC4B096A1927F80504BFF00FFFF00FF00
        0000FF00FFFF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFB
        FCF8F2FBF3EAF8EEE2F8EAD9F8E7D4FAE9D0E0D0BAB8AB9AA79C8BA497868050
        4BFF00FFFF00FF000000FF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C4A0675BA0675BA0675B
        A0675BA0675BA0675BFF00FFFF00FF000000FF00FFFF00FFCF9674FBF7F6FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B6A0
        675BDAA16BDD984FE2903AEA8923A5686BFF00FFFF00FF000000FF00FFFF00FF
        D49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
        FBFFFEF7DDC4BCA0675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FF00
        0000FF00FFFF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFDDC7C2A0675BEAB273EFA751A5686BFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CEA0675BEDB572A5686B
        FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFCF8E68CF8E68CF8E
        68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68A0
        675BA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000}
      ShowCaption = False
    end
    object CloseButton: TdxBarLargeButton
      Caption = #1047#1072#1083#1080#1096#1080#1090#1080
      Category = 0
      Hint = #1047#1072#1083#1080#1096#1080#1090#1080
      Visible = ivAlways
      OnClick = CloseButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E
        1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B
        8C4B4B914B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B89
        4B4B9C4B4CB64B4CBD4B4C9F4B4C4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B
        4B9A4D4EAF4E4FC14E4FC04D4EBF4C4DBF4C4D9F4B4C4E1E1F994B4B824B4B82
        4B4B824B4B824B4B824B4B824B4B824B4B824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BC55455C95455C75354C65253C55152C45051C24F50A04C4D4E1E
        1FFE8B8CFC9293FB9A9CFAA3A4F8AAABF7B1B1F7B5B6F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BCE5859CC5758CB5657CA5556C95455C75354
        C65253A34E4F4E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BD15B5CD05A5BCF595ACE
        5859CC5758CB5657CA5556A550504E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C
        1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BD55E
        5FD55E5FD45D5ED35C5DD15B5CD05A5BCF595AA651524E1E1F3F9E4C1EBC4C1E
        BC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BDA6364D96263D86062D75F60D55E5FD45D5ED35C5DA953544E1E
        1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BDE6667DD6566DC6465DA6364D96263D86062
        D75F60AB55554E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BE2696AE16869E06768DE
        6667E06D6EE69091DC6465AC56574E1E1F58A55B1EBC4C1EBC4C1EBC4C1EBC4C
        1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BE76D
        6EE66C6DE56B6CE36A6BEEA6A7FFFFFFEB9C9CAF58594E1E1FEECEAFB7EBAA5E
        D3775ED37745CA6745CA6745CA67F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BEB7072EA6F70E96E6FE76D6EF2A9AAFFFFFFEB9596B15A5A4E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3D9F6BDD9F6BDF7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BEF7475EE7374ED7273EB7072EA6F70EF9091
        E76D6EB25B5C4E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF37778F37778F27677F0
        7576EF7475EE7374ED7273B55D5D4E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3
        FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF87B
        7DF77A7BF6797AF47879F37778F27677F07576B75F5F4E1E1FEECEAFFFFFD3FF
        FFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BFC7F80FB7E7FFA7D7EF87B7DF77A7BF6797AF47879B860624E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BFF8182FF8182FE8081FC7F80FC7F80FB7E7F
        FA7D7EBB63634E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BFF8182FF8182FF8182FF
        8182FF8182FE8081FE8081BD65654E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3
        FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF77E
        7FFF8182FF8182FF8182FF8182FF8182FF8182BF66664E1E1FEECEAFFFFFD3FF
        FFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4B824B4BAF5E5FD56F70FF8182FF8182FF8182FF8182BF66664E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B915152B66263EE7A7B
        FF8182BF66664E1E1F914B4B824B4B824B4B824B4B824B4B824B4B824B4B824B
        4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF824B4B824B4B9855559F58584E1E1FFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ShowCaption = False
    end
    object AddInputButton: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080' '#1074#1093#1110#1076#1085#1080#1081' '#1086#1073#39#1108#1082#1090' '#1074#1086#1076#1086#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1074#1093#1110#1076#1085#1080#1081' '#1086#1073#39#1108#1082#1090' '#1074#1086#1076#1086#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FFB7938AFEEFDAF6E0C6F2DABCF2D5B2EF
        D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFC09E95FFFBF0F8EADCF6E3CFF4E0C6F2
        D9BCF2D5B1F0D0A9EDCB9EEDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
        C6A49AFFFFFCFAF0E6F8EADAF7E5CFF4E0C5F2DABAF2D5B1F0D0A7EECB9DEBC7
        93F2C98CA46769FF00FFFF00FFFF00FFCBA99EFFFFFFFEF7F2FAEFE6F8EAD9F7
        E3CFF6E0C5F2DABBF2D4B1F0D0A7EECC9EF3CE97A46769FF00FFFF00FFFF00FF
        CFAC9FFFFFFFFFFEFCFCF6F0FAEFE6F7EADAF6E3CFF4E0C5F3D9BBF3D4B0F0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFD4B0A1FFFFFFFFFFFFFFFEFCFEF7F0FA
        EFE5F8EAD9F7E5CEF6DEC4F3D9B8F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
        D9B5A1FFFFFFFFFFFFFFFFFFFFFEFCFCF7F0FAEFE5F8E9D9F8E7D1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDDB7A4FFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFCFCF6EFFCF3E6EDD8C9B68A7BA17B6F9C7667A46769FF00FFFF00FFFF00FF
        E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5B88265F8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EA
        CAB6EACAB6EACAB6E3C2B1A56B5FFF00FFFF00FFFF00FFFF00FF}
      OnClick = AddInputButtonClick
    end
    object CancelInputButton: TdxBarButton
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080' '#1079#1084#1110#1085#1080
      Category = 0
      Hint = #1042#1110#1076#1084#1110#1085#1080#1090#1080' '#1079#1084#1110#1085#1080
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001DE80010DC00006EFF00FFFF
        00FFFF00FFFF00FF00006E0004E20008E700006EFF00FFFF00FFFF00FFFF00FF
        00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
        DB00006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001ADF0020EB0013DC00
        006E00006E0005E2000BEB0004DA00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E001BE300
        16EB0011EB000ADF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E062DE30430EB00
        20E2001EE20027EB0019DF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E1442E41645EB092ED900006EFF
        00FFFF00FF00006E0020D9012CEB001FE200006EFF00FFFF00FFFF00FFFF00FF
        00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
        E400006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = CancelInputButtonClick
    end
    object SaveInputButton: TdxBarButton
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080' '#1079#1084#1110#1085#1080
      Category = 0
      Hint = #1055#1088#1080#1081#1085#1103#1090#1080' '#1079#1084#1110#1085#1080
      Visible = ivAlways
      Glyph.Data = {
        76030000424D7603000000000000360000002800000011000000100000000100
        1800000000004003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF00FF00FFFF00FFFF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF
        00FF004B000F9E1C0F9D1E004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FF004B001CB13511A4220C9C1911
        A021004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00
        FFFF00FF004B002EC65224BC43139224004B000D931A0E9D1D004B00FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FF004B0035CA5E39D4651CA1
        34004B00FF00FF004B000A86150F991C004B00FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF00FF00FFFF00FF004B0029B548004B00FF00FFFF00FFFF00FFFF00
        FF004B000C9518004B00FF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
        FF00FF004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00098611004B
        00FF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00
        FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF004B00004B00FF00FFFF00FF00FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00}
      OnClick = SaveInputButtonClick
    end
    object DelInputButton: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1074#1093#1110#1076#1085#1080#1081' '#1086#1073#39#1108#1082#1090' '#1074#1086#1076#1086#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1074#1093#1110#1076#1085#1080#1081' '#1086#1073#39#1108#1082#1090' '#1074#1086#1076#1086#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FFB7938AFEEFDAF6E0C6F2DABCF2D5B2EF
        D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFC09E95FFFBF0F8EADCF6E3CFF4E0C6F2
        D9BCF2D5B1F0D0A9EDCB9EEDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
        C6A49AFFFFFCFAF0E6F8EADAF7E5CFF4E0C5F2DABA6E6ED46E6ED46E6ED4EBC7
        93F2C98CA46769FF00FFFF00FFFF00FF00018B6E6ED46E6ED4FAEFE6F8EAD9F7
        E3CF6E6ED400018B00018B6E6ED4EECC9EF3CE97A46769FF00FFFF00FFFF00FF
        6E6ED400018B00018B6E6ED4FAEFE66E6ED400018B00018B6E6ED4F3D4B0F0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFD4B0A16E6ED400018B00018B6E6ED400
        018B00018B6E6ED4F6DEC4F3D9B8F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
        D9B5A1FFFFFF6E6ED400018B00018B00018B6E6ED4F8E9D9F8E7D1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDDB7A4FFFFFFFFFFFF6E6ED400018B00
        018B00018BFCF3E6EDD8C9B68A7BA17B6F9C7667A46769FF00FFFF00FFFF00FF
        E2BCA5FFFFFF6E6ED400018B00018B6E6ED400018B00018BDAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE6BFA76E6ED400018B00018B6E6ED4FF
        FFFF6E6ED400018B00018BB88265F8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E4BCA400018B00018B6E6ED4FAF3EFF8F2EFF7F2EF6E6ED400018B6E6ED4C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EA
        CAB6EACAB6EACAB66E6ED400018BFF00FFFF00FFFF00FFFF00FF}
      OnClick = DelInputButtonClick
    end
    object EditInputButton: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1074#1093#1110#1076#1085#1080#1081' '#1086#1073#39#1108#1082#1090' '#1074#1086#1076#1086#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1074#1093#1110#1076#1085#1080#1081' '#1086#1073#39#1108#1082#1090' '#1074#1086#1076#1086#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFA46769A46769A46769A46769A46769A46769A46769A4
        6769A46769A46769A46769A46769A46769FF00FFFF00FFFF00FFA46769FCEACE
        F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
        69FF00FFFF00FFFF00FFA0675BFEEFDAF6E0C6302D2D212527374546998468AD
        926FC2A074DCB27AE7BC7EEFC481A46769FF00FFFF00FFFF00FFA0675BFFF4E5
        F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
        69FF00FFFF00FFFF00FFA7756BFFFBF0F8EADCEEDDCA22576C165E82745D657D
        52545E3F39867258A78C66CEAA73A06567FF00FFFF00FFFF00FFA7756BFFFFFC
        FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
        5EFF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2FAEFE6F0E5D56B5D62E9A4A1CF
        9090B27575875353583C357A6950815354FF00FFFF00FFFF00FFBC8268FFFFFF
        FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
        4EFF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFFFFEFCFEF7F0FAEFE5E1CEC087
        5958E1A1A1CC8E8EB07474865151633B3CFF00FFFF00FFFF00FFD1926DFFFFFF
        FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
        423E4145FF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFC
        F3E6CFB5AA976666EFAAA98C6D731E799F0C98BD0C98BDFF00FFDA9D75FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
        F0008EDE000F95000081E7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDCC7C5A56B5FD1914F068FC10393DE0320BA0318B2010B99E7AB79FBF4F0
        FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
        BF2F45ED1031D3010A95E7AB79D1926DD1926DD1926DD1926DD1926DD1926DD1
        926DD1926DA56B5FFF00FFFF00FFFF00FF2732D00C19B4FF00FF}
      OnClick = EditInputButtonClick
    end
    object AddOutputButton: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080' '#1074#1080#1093#1110#1076#1085#1080#1081' '#1086#1073#39#1108#1082#1090' '#1074#1086#1076#1086#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1074#1080#1093#1110#1076#1085#1080#1081' '#1086#1073#39#1108#1082#1090' '#1074#1086#1076#1086#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FFB7938AFEEFDAF6E0C6F2DABCF2D5B2EF
        D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFC09E95FFFBF0F8EADCF6E3CFF4E0C6F2
        D9BCF2D5B1F0D0A9EDCB9EEDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
        C6A49AFFFFFCFAF0E6F8EADAF7E5CFF4E0C5F2DABAF2D5B1F0D0A7EECB9DEBC7
        93F2C98CA46769FF00FFFF00FFFF00FFCBA99EFFFFFFFEF7F2FAEFE6F8EAD9F7
        E3CFF6E0C5F2DABBF2D4B1F0D0A7EECC9EF3CE97A46769FF00FFFF00FFFF00FF
        CFAC9FFFFFFFFFFEFCFCF6F0FAEFE6F7EADAF6E3CFF4E0C5F3D9BBF3D4B0F0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFD4B0A1FFFFFFFFFFFFFFFEFCFEF7F0FA
        EFE5F8EAD9F7E5CEF6DEC4F3D9B8F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
        D9B5A1FFFFFFFFFFFFFFFFFFFFFEFCFCF7F0FAEFE5F8E9D9F8E7D1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDDB7A4FFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFCFCF6EFFCF3E6EDD8C9B68A7BA17B6F9C7667A46769FF00FFFF00FFFF00FF
        E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5B88265F8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EA
        CAB6EACAB6EACAB6E3C2B1A56B5FFF00FFFF00FFFF00FFFF00FF}
      OnClick = AddOutputButtonClick
    end
    object CancelOutputButton: TdxBarButton
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080' '#1079#1084#1110#1085#1080
      Category = 0
      Hint = #1042#1110#1076#1084#1110#1085#1080#1090#1080' '#1079#1084#1110#1085#1080
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001DE80010DC00006EFF00FFFF
        00FFFF00FFFF00FF00006E0004E20008E700006EFF00FFFF00FFFF00FFFF00FF
        00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
        DB00006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001ADF0020EB0013DC00
        006E00006E0005E2000BEB0004DA00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E001BE300
        16EB0011EB000ADF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E062DE30430EB00
        20E2001EE20027EB0019DF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E1442E41645EB092ED900006EFF
        00FFFF00FF00006E0020D9012CEB001FE200006EFF00FFFF00FFFF00FFFF00FF
        00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
        E400006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = CancelOutputButtonClick
    end
    object SaveOutputButton: TdxBarButton
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080' '#1079#1084#1110#1085#1080
      Category = 0
      Hint = #1055#1088#1080#1081#1085#1103#1090#1080' '#1079#1084#1110#1085#1080
      Visible = ivAlways
      Glyph.Data = {
        76030000424D7603000000000000360000002800000011000000100000000100
        1800000000004003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF00FF00FFFF00FFFF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF
        00FF004B000F9E1C0F9D1E004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FF004B001CB13511A4220C9C1911
        A021004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00
        FFFF00FF004B002EC65224BC43139224004B000D931A0E9D1D004B00FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FF004B0035CA5E39D4651CA1
        34004B00FF00FF004B000A86150F991C004B00FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF00FF00FFFF00FF004B0029B548004B00FF00FFFF00FFFF00FFFF00
        FF004B000C9518004B00FF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
        FF00FF004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00098611004B
        00FF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00
        FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF004B00004B00FF00FFFF00FF00FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00}
      OnClick = SaveOutputButtonClick
    end
    object DelOutputButton: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1074#1080#1093#1110#1076#1085#1080#1081' '#1086#1073#39#1108#1082#1090' '#1074#1086#1076#1086#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1074#1080#1093#1110#1076#1085#1080#1081' '#1086#1073#39#1108#1082#1090' '#1074#1086#1076#1086#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FFB7938AFEEFDAF6E0C6F2DABCF2D5B2EF
        D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFC09E95FFFBF0F8EADCF6E3CFF4E0C6F2
        D9BCF2D5B1F0D0A9EDCB9EEDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
        C6A49AFFFFFCFAF0E6F8EADAF7E5CFF4E0C5F2DABA6E6ED46E6ED46E6ED4EBC7
        93F2C98CA46769FF00FFFF00FFFF00FF00018B6E6ED46E6ED4FAEFE6F8EAD9F7
        E3CF6E6ED400018B00018B6E6ED4EECC9EF3CE97A46769FF00FFFF00FFFF00FF
        6E6ED400018B00018B6E6ED4FAEFE66E6ED400018B00018B6E6ED4F3D4B0F0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFD4B0A16E6ED400018B00018B6E6ED400
        018B00018B6E6ED4F6DEC4F3D9B8F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
        D9B5A1FFFFFF6E6ED400018B00018B00018B6E6ED4F8E9D9F8E7D1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDDB7A4FFFFFFFFFFFF6E6ED400018B00
        018B00018BFCF3E6EDD8C9B68A7BA17B6F9C7667A46769FF00FFFF00FFFF00FF
        E2BCA5FFFFFF6E6ED400018B00018B6E6ED400018B00018BDAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE6BFA76E6ED400018B00018B6E6ED4FF
        FFFF6E6ED400018B00018BB88265F8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E4BCA400018B00018B6E6ED4FAF3EFF8F2EFF7F2EF6E6ED400018B6E6ED4C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EA
        CAB6EACAB6EACAB66E6ED400018BFF00FFFF00FFFF00FFFF00FF}
      OnClick = DelOutputButtonClick
    end
    object EditOutputButton: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1074#1080#1093#1110#1076#1085#1080#1081' '#1086#1073#39#1108#1082#1090' '#1074#1086#1076#1086#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1074#1080#1093#1110#1076#1085#1080#1081' '#1086#1073#39#1108#1082#1090' '#1074#1086#1076#1086#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFA46769A46769A46769A46769A46769A46769A46769A4
        6769A46769A46769A46769A46769A46769FF00FFFF00FFFF00FFA46769FCEACE
        F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
        69FF00FFFF00FFFF00FFA0675BFEEFDAF6E0C6302D2D212527374546998468AD
        926FC2A074DCB27AE7BC7EEFC481A46769FF00FFFF00FFFF00FFA0675BFFF4E5
        F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
        69FF00FFFF00FFFF00FFA7756BFFFBF0F8EADCEEDDCA22576C165E82745D657D
        52545E3F39867258A78C66CEAA73A06567FF00FFFF00FFFF00FFA7756BFFFFFC
        FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
        5EFF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2FAEFE6F0E5D56B5D62E9A4A1CF
        9090B27575875353583C357A6950815354FF00FFFF00FFFF00FFBC8268FFFFFF
        FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
        4EFF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFFFFEFCFEF7F0FAEFE5E1CEC087
        5958E1A1A1CC8E8EB07474865151633B3CFF00FFFF00FFFF00FFD1926DFFFFFF
        FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
        423E4145FF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFC
        F3E6CFB5AA976666EFAAA98C6D731E799F0C98BD0C98BDFF00FFDA9D75FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
        F0008EDE000F95000081E7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDCC7C5A56B5FD1914F068FC10393DE0320BA0318B2010B99E7AB79FBF4F0
        FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
        BF2F45ED1031D3010A95E7AB79D1926DD1926DD1926DD1926DD1926DD1926DD1
        926DD1926DA56B5FFF00FFFF00FFFF00FF2732D00C19B4FF00FF}
      OnClick = EditOutputButtonClick
    end
  end
end
