object FormTimesheet_Main: TFormTimesheet_Main
  Left = 0
  Top = 236
  Width = 1280
  Height = 758
  Caption = 'FormTimesheet_Main'
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
  object Splitter1: TSplitter
    Left = 177
    Top = 46
    Width = 8
    Height = 533
  end
  object Panel1: TPanel
    Left = 0
    Top = 46
    Width = 177
    Height = 533
    Cursor = crHandPoint
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvNone
    Color = 16776176
    Ctl3D = True
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 1
      Top = 369
      Width = 175
      Height = 12
      Cursor = crVSplit
      Align = alTop
    end
    object GridTempletOrPeriod: TcxGrid
      Left = 1
      Top = 1
      Width = 175
      Height = 368
      Align = alTop
      TabOrder = 0
      object GridTempletOrPeriodDBTableView1: TcxGridDBTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsSelection.HideFocusRect = False
        OptionsSelection.HideSelection = True
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        object GridTempletOrPeriodDBTableView1DBColumn1: TcxGridDBColumn
          Options.Editing = False
          Options.Filtering = False
          Options.Grouping = False
          Options.Moving = False
          Width = 206
          DataBinding.FieldName = 'NAME'
        end
      end
      object GridTempletOrPeriodLevel1: TcxGridLevel
        GridView = GridTempletOrPeriodDBTableView1
      end
    end
    object GridPeriodType: TcxGrid
      Left = 1
      Top = 381
      Width = 175
      Height = 146
      Align = alClient
      TabOrder = 1
      object GridPeriodTypeDBTableView1: TcxGridDBTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = GridPeriodTypeDBTableView1FocusedRecordChanged
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRect = False
        OptionsSelection.HideSelection = True
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = #1054#1087#1080#1089
          PropertiesClassName = 'TcxMaskEditProperties'
          Options.Editing = False
          Options.Filtering = False
          Options.Grouping = False
          SortOrder = soDescending
          Width = 178
          DataBinding.FieldName = 'NAME_TIMESHEET_TYPE'
        end
        object GridPeriodTypeDBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1055#1080#1076#1087#1080#1089
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Options.Editing = False
          Options.Filtering = False
          Options.Grouping = False
          Width = 31
          DataBinding.FieldName = 'SIGNed'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = GridPeriodTypeDBTableView1
      end
    end
    object BarDockLocate: TdxBarDockControl
      Left = 1
      Top = 527
      Width = 175
      Height = 5
      Align = dalBottom
      BarManager = BarManager
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 579
    Width = 1272
    Height = 145
    Align = alBottom
    TabOrder = 1
    object StatusBar2: TdxStatusBar
      Left = 1
      Top = 24
      Width = 1270
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Text = #1044#1086#1083#1078#1085#1086#1089#1090#1100': '
          Width = 300
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Text = #1047#1072' '#1088#1077#1078#1080#1084#1086#1084
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Text = #1047#1072' '#1083#1102#1076#1080#1085#1086#1102
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Text = #1047#1072' '#1088#1077#1078#1080#1084#1086#1084
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clBtnFace
          PanelStyle.EllipsisType = dxetSmartPath
          Text = #1047#1072' '#1083#1102#1076#1080#1085#1086#1102
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Text = #1047#1072' '#1088#1077#1078#1080#1084#1086#1084
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Text = #1047#1072' '#1083#1102#1076#1080#1085#1086#1102
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 130
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
        end>
      PaintStyle = stpsOffice11
      LookAndFeel.Kind = lfStandard
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object StatusBar3: TdxStatusBar
      Left = 1
      Top = 44
      Width = 1270
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Text = #1057#1090#1072#1074#1082#1072': '
          Width = 300
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taRightJustify
          Text = #1059#1089#1100#1086#1075#1086':'
          Width = 80
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clBtnFace
          PanelStyle.EllipsisType = dxetSmartPath
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Bevel = dxpbRaised
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clYellow
          PanelStyle.Font.Charset = DEFAULT_CHARSET
          PanelStyle.Font.Color = clWindowText
          PanelStyle.Font.Height = -11
          PanelStyle.Font.Name = 'MS Sans Serif'
          PanelStyle.Font.Style = []
          PanelStyle.ParentFont = False
          Bevel = dxpbRaised
          BiDiMode = bdRightToLeftNoAlign
          ParentBiDiMode = False
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Text = #1055#1086#1095#1072#1090#1086#1082' '#1088#1086#1073#1086#1090#1080
          Width = 90
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
        end>
      PaintStyle = stpsOffice11
      LookAndFeel.Kind = lfStandard
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object StatusBar5: TdxStatusBar
      Left = 1
      Top = 84
      Width = 1270
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Text = #1044#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103': '
          Width = 300
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taRightJustify
          Text = #1053#1110#1095#1085#1110':'
          Width = 80
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clBtnFace
          PanelStyle.EllipsisType = dxetSmartPath
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Text = #1059#1089#1100#1086#1075#1086' '#1075#1086#1076#1080#1085
          Width = 90
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
        end>
      PaintStyle = stpsOffice11
      LookAndFeel.Kind = lfStandard
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object StatusBar4: TdxStatusBar
      Left = 1
      Top = 64
      Width = 1270
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          Width = 300
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taRightJustify
          Text = #1057#1074#1103#1090#1082#1086#1074#1110':'
          Width = 80
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clBtnFace
          PanelStyle.EllipsisType = dxetSmartPath
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Text = #1050#1110#1085#1077#1094#1100' '#1088#1086#1073#1086#1090#1080
          Width = 90
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
        end>
      PaintStyle = stpsOffice11
      LookAndFeel.Kind = lfStandard
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object StatusBar1: TdxStatusBar
      Left = 1
      Top = 4
      Width = 1270
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          Width = 300
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Visible = False
          Width = 102
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Text = #1059' '#1076#1085#1103#1093
          Width = 150
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Text = #1059' '#1075#1086#1076#1080#1085#1072#1093
          Width = 150
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Width = 150
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clBtnFace
          PanelStyle.EllipsisType = dxetSmartPath
          Visible = False
          Width = 100
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
        end>
      PaintStyle = stpsOffice11
      LookAndFeel.Kind = lfStandard
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object StatusBar6: TdxStatusBar
      Left = 1
      Top = 104
      Width = 1270
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          Width = 300
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taRightJustify
          Text = #1053#1110#1095#1085#1110' '#1091' '#1089#1074#1103#1090#1072':'
          Width = 80
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clBtnFace
          PanelStyle.EllipsisType = dxetSmartPath
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Text = #1053#1110#1095#1085#1080#1093' '#1075#1086#1076#1080#1085
          Width = 90
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
        end>
      PaintStyle = stpsOffice11
      LookAndFeel.Kind = lfStandard
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object StatusBar7: TdxStatusBar
      Left = 1
      Top = 124
      Width = 1270
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          Width = 300
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taRightJustify
          Text = #1059' '#1074#1080#1093#1110#1076#1085#1110':'
          Width = 80
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clBtnFace
          PanelStyle.EllipsisType = dxetSmartPath
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
        end>
      PaintStyle = stpsOffice11
      LookAndFeel.Kind = lfStandard
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
  end
  object PageControl1: TPageControl
    Left = 185
    Top = 46
    Width = 1087
    Height = 533
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    TabOrder = 6
    TabPosition = tpBottom
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1079
        Height = 507
        Align = alClient
        Caption = 'Panel3'
        TabOrder = 0
        object GridHeader: TcxGrid
          Left = 1
          Top = 1
          Width = 1077
          Height = 96
          Align = alTop
          TabOrder = 0
          object GridHeaderBandedTableView1: TcxGridBandedTableView
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsBehavior.FocusCellOnCycle = True
            OptionsSelection.InvertSelect = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.GroupByBox = False
            OptionsView.BandHeaders = False
            Styles.Header = StyleDM.cxStyle25
            Styles.OnGetHeaderStyle = GridHeaderBandedTableView1StylesGetHeaderStyle
            Styles.BandHeader = StyleDM.cxStyle15
            Bands = <
              item
                Width = 412
              end
              item
                Width = 415
              end
              item
                Width = 231
              end>
            object GridColTN: TcxGridBandedColumn
              Caption = #1058#1072#1073#1077#1083#1100#1085#1080#1081' '#1085#1086#1084#1077#1088
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle18
              Width = 87
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.LineCount = 4
              Position.RowIndex = 1
            end
            object GridColFio: TcxGridBandedColumn
              Caption = #1055'. '#1030'. '#1041'.'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              SortOrder = soAscending
              Styles.Header = StyleDM.cxStyle18
              Width = 263
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.LineCount = 4
              Position.RowIndex = 1
            end
            object GridHeaderBandedTableView1BandedColumn3: TcxGridBandedColumn
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle18
              Width = 31
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
              IsCaptionAssigned = True
            end
            object GridHeaderBandedTableView1BandedColumn5: TcxGridBandedColumn
              Caption = #1042#1110#1076#1084#1110#1090#1082#1080' '#1087#1088#1086' '#1103#1074#1082#1080' '#1090#1072' '#1085#1077#1103#1074#1082#1080' '#1079#1072' '#1095#1080#1089#1083#1072#1084#1080' '#1084#1110#1089#1103#1094#1103' ('#1075#1086#1076#1080#1085')'
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle11
              Width = 67
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object Col1: TcxGridBandedColumn
              Caption = '1'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object Col2: TcxGridBandedColumn
              Caption = '2'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 1
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object Col30: TcxGridBandedColumn
              Caption = '30'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 14
              Position.LineCount = 2
              Position.RowIndex = 2
            end
            object Col3: TcxGridBandedColumn
              Caption = '3'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 2
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object Col4: TcxGridBandedColumn
              Caption = '4'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 3
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object Col5: TcxGridBandedColumn
              Caption = '5'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 25
              Position.BandIndex = 1
              Position.ColIndex = 4
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object Col6: TcxGridBandedColumn
              Caption = '6'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 5
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object Col7: TcxGridBandedColumn
              Caption = '7'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 6
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object Col8: TcxGridBandedColumn
              Caption = '8'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 7
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object Col9: TcxGridBandedColumn
              Caption = '9'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 25
              Position.BandIndex = 1
              Position.ColIndex = 8
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object Col10: TcxGridBandedColumn
              Caption = '10'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 9
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object Col11: TcxGridBandedColumn
              Caption = '11'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 27
              Position.BandIndex = 1
              Position.ColIndex = 10
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object Col12: TcxGridBandedColumn
              Caption = '12'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 11
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object Col15: TcxGridBandedColumn
              Caption = '15'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 14
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object ColX: TcxGridBandedColumn
              Caption = 'X'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 15
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object Col17: TcxGridBandedColumn
              Caption = '17'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 1
              Position.LineCount = 2
              Position.RowIndex = 2
            end
            object Col20: TcxGridBandedColumn
              Caption = '20'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 25
              Position.BandIndex = 1
              Position.ColIndex = 4
              Position.LineCount = 2
              Position.RowIndex = 2
            end
            object Col21: TcxGridBandedColumn
              Caption = '21'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 5
              Position.LineCount = 2
              Position.RowIndex = 2
            end
            object Col19: TcxGridBandedColumn
              Caption = '19'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 3
              Position.LineCount = 2
              Position.RowIndex = 2
            end
            object Col18: TcxGridBandedColumn
              Caption = '18'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 2
              Position.LineCount = 2
              Position.RowIndex = 2
            end
            object Col31: TcxGridBandedColumn
              Caption = '31'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 15
              Position.LineCount = 2
              Position.RowIndex = 2
            end
            object Col29: TcxGridBandedColumn
              Caption = '29'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 13
              Position.LineCount = 2
              Position.RowIndex = 2
            end
            object Col16: TcxGridBandedColumn
              Caption = '16'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.LineCount = 2
              Position.RowIndex = 2
            end
            object Col14: TcxGridBandedColumn
              Caption = '14'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 13
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object Col13: TcxGridBandedColumn
              Caption = '13'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 12
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object Col23: TcxGridBandedColumn
              Caption = '23'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 7
              Position.LineCount = 2
              Position.RowIndex = 2
            end
            object Col24: TcxGridBandedColumn
              Caption = '24'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 25
              Position.BandIndex = 1
              Position.ColIndex = 8
              Position.LineCount = 2
              Position.RowIndex = 2
            end
            object Col26: TcxGridBandedColumn
              Caption = '26'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 27
              Position.BandIndex = 1
              Position.ColIndex = 10
              Position.LineCount = 2
              Position.RowIndex = 2
            end
            object Col27: TcxGridBandedColumn
              Caption = '27'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 11
              Position.LineCount = 2
              Position.RowIndex = 2
            end
            object Col25: TcxGridBandedColumn
              Caption = '25'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 9
              Position.LineCount = 2
              Position.RowIndex = 2
            end
            object Col22: TcxGridBandedColumn
              Caption = '22'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 6
              Position.LineCount = 2
              Position.RowIndex = 2
            end
            object Col28: TcxGridBandedColumn
              Caption = '28'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 26
              Position.BandIndex = 1
              Position.ColIndex = 12
              Position.LineCount = 2
              Position.RowIndex = 2
            end
            object GridHeaderBandedTableView1BandedColumn38: TcxGridBandedColumn
              Caption = #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1079#1072' '#1084#1110#1089#1103#1094#1100
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle18
              Position.BandIndex = 2
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object ColSexH: TcxGridBandedColumn
              Caption = #1057#1090#1072#1090#1100' ('#1095'/'#1078')'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle18
              Width = 35
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.LineCount = 4
              Position.RowIndex = 1
            end
            object GridHeaderBandedTableView1BandedColumn39: TcxGridBandedColumn
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle18
              Width = 38
              Position.BandIndex = 2
              Position.ColIndex = 5
              Position.LineCount = 4
              Position.RowIndex = 1
            end
            object GridHeaderBandedTableView1BandedColumn40: TcxGridBandedColumn
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle18
              Width = 39
              Position.BandIndex = 2
              Position.ColIndex = 4
              Position.LineCount = 4
              Position.RowIndex = 1
            end
            object GridHeaderBandedTableView1BandedColumn41: TcxGridBandedColumn
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle18
              Width = 38
              Position.BandIndex = 2
              Position.ColIndex = 3
              Position.LineCount = 4
              Position.RowIndex = 1
            end
            object GridHeaderBandedTableView1BandedColumn42: TcxGridBandedColumn
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle18
              Width = 38
              Position.BandIndex = 2
              Position.ColIndex = 1
              Position.LineCount = 4
              Position.RowIndex = 1
            end
            object GridHeaderBandedTableView1BandedColumn43: TcxGridBandedColumn
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle18
              Width = 39
              Position.BandIndex = 2
              Position.ColIndex = 0
              Position.LineCount = 4
              Position.RowIndex = 1
            end
            object GridHeaderBandedTableView1BandedColumn44: TcxGridBandedColumn
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle18
              Width = 39
              Position.BandIndex = 2
              Position.ColIndex = 2
              Position.LineCount = 4
              Position.RowIndex = 1
            end
            object GridHeaderBandedTableView1BandedColumn45: TcxGridBandedColumn
              Caption = 'N '#1087'/'#1087
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle18
              Width = 27
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.LineCount = 4
              Position.RowIndex = 1
            end
          end
          object GridThDBBandedTableView1: TcxGridDBBandedTableView
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnFocusedItemChanged = GridThDBBandedTableView1FocusedItemChanged
            OnFocusedRecordChanged = GridThDBBandedTableView1FocusedRecordChanged
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.HideFocusRect = False
            OptionsSelection.HideSelection = True
            OptionsSelection.InvertSelect = False
            OptionsSelection.MultiSelect = True
            OptionsView.GroupByBox = False
            Styles.Background = StyleDM.cxStyle1
            Styles.ContentEven = StyleDM.cxStyle5
            Styles.ContentOdd = StyleDM.cxStyle7
            Styles.Selection = StyleDM.cxStyle14
            Styles.OnGetContentStyle = GridThDBBandedTableView1StylesGetContentStyle
            Bands = <
              item
                Width = 89
              end
              item
                Width = 896
              end
              item
                Width = 99
              end>
            object ColNum: TcxGridDBBandedColumn
              Caption = '0'
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              SortOrder = soAscending
              Width = 39
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.LineCount = 4
              Position.RowIndex = 0
            end
            object GridThDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 5
              Position.LineCount = 4
              Position.RowIndex = 0
            end
            object GridThDBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 6
              Position.LineCount = 4
              Position.RowIndex = 0
            end
            object GridThDBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 4
              Position.LineCount = 4
              Position.RowIndex = 0
            end
            object GridThDBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 3
              Position.LineCount = 4
              Position.RowIndex = 0
            end
            object GridThDBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 2
              Position.LineCount = 4
              Position.RowIndex = 0
            end
            object GridThDBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.LineCount = 4
              Position.RowIndex = 0
            end
            object GridThDBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 9
              Position.LineCount = 4
              Position.RowIndex = 0
            end
            object GridThDBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 8
              Position.LineCount = 4
              Position.RowIndex = 0
            end
            object GridThDBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 10
              Position.LineCount = 4
              Position.RowIndex = 0
            end
            object GridThDBBandedTableView1DBBandedColumn10: TcxGridDBBandedColumn
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 11
              Position.LineCount = 4
              Position.RowIndex = 0
            end
            object GridThDBBandedTableView1DBBandedColumn11: TcxGridDBBandedColumn
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 7
              Position.LineCount = 4
              Position.RowIndex = 0
            end
            object GridThDBBandedTableView1DBBandedColumn12: TcxGridDBBandedColumn
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 1
              Position.LineCount = 4
              Position.RowIndex = 0
            end
            object GridThDBBandedTableView1DBBandedColumn13: TcxGridDBBandedColumn
              Options.Editing = False
              Options.Filtering = False
              Width = 25
              Position.BandIndex = 2
              Position.ColIndex = 0
              Position.LineCount = 4
              Position.RowIndex = 0
            end
            object GridThDBBandedTableView1DBBandedColumn14: TcxGridDBBandedColumn
              Options.Editing = False
              Options.Filtering = False
              Width = 25
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.LineCount = 4
              Position.RowIndex = 0
            end
          end
          object GridHeaderLevel1: TcxGridLevel
            GridView = GridHeaderBandedTableView1
          end
        end
        object GridTh: TcxGrid
          Left = 1
          Top = 97
          Width = 1077
          Height = 409
          Align = alClient
          TabOrder = 1
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          object GridThLevel1: TcxGridLevel
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 1079
        Height = 507
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        object cxGridLevel2: TcxGridLevel
          GridView = GridThDBBandedTableView1
        end
      end
    end
  end
  object BarManager: TdxBarManager
    AllowReset = False
    AutoDockColor = False
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
        BorderStyle = bbsNone
        Caption = 'ButtonsControlBar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 894
        FloatTop = 108
        FloatClientWidth = 71
        FloatClientHeight = 318
        ItemLinks = <
          item
            Item = ButtonInsert
            Visible = True
          end
          item
            Item = ButtonUpdate
            Visible = True
          end
          item
            BeginGroup = True
            Item = ButtonDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = ButtonRefresh
            Visible = True
          end
          item
            Item = ButtonRedeFined
            Visible = True
          end
          item
            Item = ButtonSigned
            Visible = True
          end
          item
            Item = ButtonPrint
            Visible = True
          end
          item
            Item = ButtonExit
            Visible = True
          end>
        Name = 'ButtonsControlBar'
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
    LookAndFeel.Kind = lfUltraFlat
    PopupMenuLinks = <>
    Style = bmsOffice11
    SunkenBorder = True
    UseSystemFont = True
    Left = 680
    Top = 8
    DockControlHeights = (
      0
      0
      46
      0)
    object ButtonRefresh: TdxBarLargeButton
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Category = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      Visible = ivAlways
      ShortCut = 116
      OnClick = ButtonRefreshClick
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
    object ButtonExit: TdxBarLargeButton
      Align = iaRight
      Caption = #1042#1099#1093#1086#1076
      Category = 0
      Hint = #1042#1099#1093#1086#1076
      Visible = ivAlways
      ShortCut = 27
      OnClick = ButtonExitClick
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
    object ButtonInsert: TdxBarLargeButton
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      Visible = ivAlways
      ShortCut = 16429
      OnClick = ButtonInsertClick
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
    object ButtonDelete: TdxBarLargeButton
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Category = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Visible = ivAlways
      ShortCut = 46
      OnClick = ButtonDeleteClick
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
    object ButtonUpdate: TdxBarLargeButton
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Category = 0
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      Visible = ivAlways
      ShortCut = 113
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
    object ButtonSigned: TdxBarLargeButton
      Caption = #1055#1086#1076#1087#1080#1089#1072#1090#1100
      Category = 0
      Hint = #1055#1086#1076#1087#1080#1089#1072#1090#1100
      Visible = ivAlways
      OnClick = ButtonSignedClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0009721300FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000972130009721300FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0093655E00BA8E
        7E00BA8E7E00BB8B7900BB8C7900BB8A7500BB8A7500BB887000BC887000BC89
        7200C48C7700B9846F00097213002EBC550009721300AF816500C28278009E67
        6900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0098696500F7D9
        B700FFE1B900FFD9AF00FFD5A700FFD19E00FFD19E00FFD39100FFD48B00FFD4
        8B00EDBF82000972130021A53F004DE581000973140009741400097414000974
        1400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0098696500F7D9
        BC00FFE0BE00FEDAB500FFD9AF00FFDDA700F4C79C00B79497008974A1008B76
        7E000972130029B750004BE07D0048DC770046D8740031C25B0023A640001789
        2800036C0A00015D0400FF00FF00FF00FF00FF00FF00FF00FF0098696500F8DC
        C400FFE5C700FFE0BE00FFE4B400977E99001F27A700001BDD000019D3000972
        130030BF50004DE27F0048DC770048D9760045D770003FD1660037CC5D0032C6
        550027B541000F801A00015D0400FF00FF00FF00FF00FF00FF0098696500F7E0
        CA00FFE5C700FFEAC1008974A1000111C700001CF700001AFF002659A4000972
        13003FD46C004BE07D0047DA770045D7700041D36A003BCE630032C655002DC0
        4A0028BB42001FB035000D841800015D0400FF00FF00FF00FF0098696500F8E3
        D100FFF7D700A698B6000115CE000021FF000024FF005372FF00E6EBFF00B3CF
        B6000972130039CC620049DD790041D36A0030BB4D001F9D34001B962D001897
        29001AA02D001AAA2D0015A9270008790F00FF00FF00FF00FF0098696500FBEA
        D800FBEAD8003642C0000020FB00001FFF003C5EFF00F6F7FF00D4DEFF00BDC6
        FF00B3CFB6000972130030BB4D003FD76900097213007A864B009E8E5A004360
        2F000162040006740E000D971A000A93140003630600FF00FF009D6E6700FFF3
        E200CFBFCC000A20CA00062FFF000023FF003C5EFF006781FF007D96FF00667B
        FF00C2CBFF00527BB800097213002EBD3D00097213008C777F00E7AC85009966
        6600FF00FF00FF00FF0004670800088E1100046E0900FF00FF00A5756B00FFFF
        EE006F6DBC00011CDC000F39FF000C34FF00032BFF00042AFF009EB2FF00D9E1
        FF00F3F6FF003656FF00011FDD0009721300097213005C5B7F00E0A47F009966
        6600FF00FF00FF00FF00FF00FF0004700A0005750B00FF00FF00A5756B00FFFF
        F3006F6DBC000320DD001640FF000E37FF00133CFF00BDCBFF00FFFFFF00F6F7
        FF005778FF000023FF000023FF000026EE00097213005C5B7F00E0A47F009365
        6300FF00FF00FF00FF00FF00FF0003640600036A0900FF00FF00AB7A6C00FFFE
        F8009796D5000B25D4001A47FF000E37FF005576FF00E6EBFF00CCD8FF006382
        FF00001FFF00032BFF000128FF000026FF000019EB0070639800E6AC7F009163
        6000FF00FF00FF00FF00FF00FF00FF00FF0002600500FF00FF00B17E6B00FEFA
        F600FBF7F6002338D0001843FF00133FFF006382FF00D4DEFF00A1B5FF009EB2
        FF00A3B7FF002348FF00032BFF00032BFF00001AD400B7949700E6AC7F009263
        6000FF00FF00FF00FF00FF00FF00FF00FF00025F0500FF00FF00B9846F00FAF6
        F400FFFFFF008487D1000C2DE300234FFF00234FFF00BDCBFF00FFFFFF00FFFF
        FF00A3B7FF001139FF000C37FF000020E90035359D00FFD5A700D5A68A009163
        6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BC877000FAF6
        F400FFFFFF00F0EEF4003541C0001035EE001A47FF002854FF0091AAFF007B96
        FF001843FF00113EFF00042BF6002430B100CEACA600FFE4B400D5A68A009162
        5E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C28C7400FAF6
        F400FFFFFF00FFFFFF00EAE7F3005F67CC002439D0001035EE000E35F3000C31
        F0000C31F0001028CF00494DB500E5CEBC00FFEAC200FFE1B900D0AA96009162
        5E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C9907500FAF6
        F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCD9EE009796D5006C70CB006C70
        CB008883C200CFC0CC00FFF2D400FFF2D400FFE5C900FFEAC200D0AA96009160
        5E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C9907500FBF7
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFB00FFFF
        F300FFFFEE00E5CEBC00CB9F8F00C6978800C6988800C6988800B68373009365
        5E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D3997700FBF7
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
        F800FFFFFB00CCABA400A4695800CA906600CB8A5400D0823900D0823900FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D59A7700FCF8
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00CCABA400B2796300EEB67000EFA95300EF9C3900FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D59A7700FCF8
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00CEAFA900B0766200EEB67000EFA95300FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D5997700FAF2
        ED00FEFAF800FCF8F600FCF8F600FBF7F600FBF7F600FAF6F400FAF6F400FAF6
        F400FFFFFF00CCABA400B2796300DAA56E00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D3936F00D599
        7700D59A7700D59A7700D3997700CE957600C9907500C28C7400C1887200BC87
        7000B6837300A9746700B17E6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object ButtonRedeFined: TdxBarLargeButton
      Caption = #1055#1077#1088#1077#1092#1086#1088#1084
      Category = 0
      Hint = #1055#1077#1088#1077#1092#1086#1088#1084
      Visible = ivAlways
      OnClick = ButtonRedeFinedClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF0001560300047E0A00058A0C0005810C0007910F00079110000786
        0F0009951300087E1100196E1E000A951500098413000B9817000D9C1B000F9C
        1D000E9E1D0011A3210011A0210010911F0013A4240013A1230015AA280014A4
        270015A728001290220016AA290016A62A0015A1280024712F0017A12C00169A
        2A0019AB2F001CB235001BAC32001BAC3300199D2E001CAD34001FB538001DA1
        340022B73E0022B63E0023BB410023B7410025BA430026BB440026BB450029C4
        4A0025AC420024A442002CC54E002ABC4C002DC652002DC4510028AC46002EC5
        530030C9560031C9580030C655002EBD520033CA5A0030BB540038D0630035C3
        5B0038D0640036CA620039D1660038CC64003BD368003ACE670036BF5E003FDC
        6E003ED96E003ED76D0040DA70003FD76E0043E2770042E0760041DC7300FCFE
        FF00ABBBFE00E6EBFF003658FB005473FC007B93FC001033FA002042FB00011F
        FA000222FA000728FA0000008200000000000000000000000000000000000000
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
        020203030303030302025C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C03372D241703
        02025C595A5B57585455565253515151515C0342392E270302025C595A5B5758
        5455565253515151515C034B443C300302025C595A5B57585455565253515151
        515C034B4B463B0302025C595A5B57585455565253515151515C030303030303
        02025C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C0202020202020202020202020202
        0202020202020202020202020202030302020202020202020202020202020202
        020202020203454703030202020202020202020202020202020202020203494C
        4D3F03030202020202020202020203030202020203293A3E404A4F0303020202
        02020202020333030202020203282B2F36320303020202020202020203481F03
        020202030B161D252A2603020202020202020203453803020202020303030314
        19231B0302020202020303504103020202020202020203030F111C1503030303
        033D4E4303020202020202020202020303080D12181E202C3134350302020202
        0202020202020202030305070A10131A22210302020202020202020202020202
        0203030C0406090E030302020202020202020202020202020202020303030303
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202}
    end
    object ButtonPrint: TdxBarLargeButton
      Caption = #1044#1088#1091#1082
      Category = 0
      Hint = #1044#1088#1091#1082
      Visible = ivAlways
      OnClick = ButtonPrintClick
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
  end
  object Styles: TcxStyleRepository
    Left = 744
    Top = 8
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13885950
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlue
    end
    object StyleOutPut: TcxStyle
      AssignedValues = [svBitmap, svColor, svFont, svTextColor]
      Color = 13827759
      Bitmap.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF0045434600FF00FF002322230022212200201F20004F4D4F00CAC6CA004746
        4700756F7400696367004C494B00B29DA90089838600575355002D2B2C009892
        9500413F4000F6F0F300C1A7B2005F525700E3DEE000B7939F00322F30003A37
        38003F3C3D00403D3E0066636400C3C0C100A1838B009C828900746D6F003531
        32007E7A7B00BDB9BA009E898E00A78B91008A737800C3B0B400443F40005D58
        5900D9D4D500816B6F00BFAFB200BDB2B4007B757600B7B1B200BCB5B600B68F
        9300584F500062595A0069616200978F9000A0989900CBBFC000897777009481
        81004C454500867A7A0049434300645C5C003F3A3A008076760035313100A59A
        9A004F4A4A00312E2E00DACECE00353232003B38380027252500252323008B84
        84002C2A2A00D4CBCB00A49D9D008C868600625E5E005F5B5B002F2D2D00E3DB
        DB005552520038363600363434001D1C1C00ABA6A600A4A0A0009E9A9A005351
        510028272700F3EEEE00DCD7D700B1ADAD00AEAAAA0058565600A09D9D003938
        3800FFFCFC00FAF7F7009290900083818100424141005756560079676600BFAD
        AC00A5979600C5B8B700CABDBC007B6A68008B7A78007A706F0081787700C0B7
        B600DDD4D300504847005A535200928A89008F888700C3BCBB00EDE5E4006256
        5400A4939000AB9A9700413B3A004E484700ACA09E00817B7A009E989700BDB7
        B600BCB6B500BBB5B4008F807D0062585600B5A7A40046414000AF9E9A00A696
        92005D5553002F2B2A00766D6B003C383700413D3C00716D6C0073686500766B
        68005D5654007A73710076625C003F3C3B004A47460068656400F1EBE9009174
        6800998F8B00CFC5C100A2817200B58C78006B65620036343300403E3D008B86
        83009E8C7E00837E7A00181716002726250025242300333231002F2E2D003D3C
        3B003C3B3A004B4A49007A644D00786E6300FFC989008A745B00D2B68E006A62
        540046454300FFE6AA00FFF7E300FFFFD7002F2F2E003E3E3D003D3D3C004343
        420040403F005E604E00585B4D006C6F62003334320089B26A004D58470077BB
        5A003C683A00494A4900007801000EAF1A00094D0D0051A4560005A013001195
        1E00037D1200057E13002D57320027AD390007A52100079D1F0015BF310009B6
        2B0013C03600107A26000D932D000EAC350011AF390019C0490025C551000059
        22000EA8500028D57200019F520024AA6C0032845E0073BBA30046977E004DCE
        C20032353500151616001B1C1C001E1F1F000087AC00006884000F5A6E001315
        1600161819006C7980000084D800181A1C0011121300292B2D001F2021001516
        180017181A00333539005252560019191A0058585B001D1D1E00232324007070
        7200414141002D2D2D00252525001B1B1B001313130010101000030303030303
        030303030303030303030303F1F7F806EA0303030303E3281A55A4EEE9ED4A28
        543E3C79686EA285EA030303E38D7C8A3B96193C343B1F2517319D9C6D333991
        F50303F7337A8A527E6F34B92724A3BDC0C2E8E8E7D9B12B550303FF6A7B8A59
        868C0C661FC6CAD4C8DCECECDCC4BB26E50303FF6A883D5FA159FA6625C4C8D8
        D8E6ECDAC5CBBC39050303FF7E869E4F22BA35120DCAC8C9DDE6DAD0D2CEBC1F
        470303FF86698F4F7FA0411B14D3D2CFD4E0CDD5D6D1C21E4A0303FF2D6B7029
        65B7801A27DEDBD7C1B3B0BFC7D4CC25540303FF6C9BA3595E97B8952CE0E1DF
        B09D9C9994C0C089460303FF37447FAB773064AA5BEBEBEB2E0A0A200B15327D
        400303FF4B78490981815DA9562E74421A53454318214A03030303FF71084E96
        822F23A5051019521C8CFC5A75B60303030303FF22AD8BC35E83641267BE6709
        293CA7619AB603030303EFF3A2AEAC020E714E57015C589307A7A5059AA80303
        0303E20FB0B5AF59F92F4208019878165C777E7676A803030303A03313B5AFF4
        2275590163512A4B9B376C7241E503030303537398B4B1F6368A600101625B78
        514B774C42030303030303433F913A93883E651D1D2356114D8FAB283A030303
        0303030387E5E5408E9F1048A4049287FE9538888950F2030303030303030303
        030303030303FD39393242843855F1F0030303030303030303030303030303F7
        E484907CA604FB550303030303030303030303030303030303E5558EB276A355
        0303030303030303030303030303030303030304555555030303}
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object StyleHoliday: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14870782
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBtnText
    end
    object StyleSimple: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15912375
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object StyleSimple1: TcxStyle
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      BuiltIn = True
    end
    object GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      BuiltIn = True
    end
  end
end
