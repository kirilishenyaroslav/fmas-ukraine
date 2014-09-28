object frmSmetaGroup: TfrmSmetaGroup
  Left = 261
  Top = 156
  Width = 1002
  Height = 529
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1075#1088#1091#1087' '#1073#1102#1076#1078#1077#1090#1110#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 986
    Height = 41
    AutoSize = True
    ButtonHeight = 39
    ButtonWidth = 71
    Caption = 'ToolBar1'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Images = SmallImages
    ParentFont = False
    ShowCaptions = True
    TabOrder = 0
    object AddButton: TToolButton
      Left = 0
      Top = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1075#1088#1091#1087#1091' '#1073#1102#1076#1078#1077#1090#1110#1074
      Caption = #1044#1086#1076#1072#1090#1080
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = AddButtonClick
    end
    object DelButton: TToolButton
      Left = 71
      Top = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1075#1088#1091#1087#1091' '#1073#1102#1076#1078#1077#1090#1110#1074
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = DelButtonClick
    end
    object UpdateButton: TToolButton
      Left = 142
      Top = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1075#1088#1091#1087#1091' '#1073#1102#1076#1078#1077#1090#1110#1074
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = UpdateButtonClick
    end
    object ToolButton14: TToolButton
      Left = 213
      Top = 0
      Width = 34
      Caption = 'ToolButton14'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 247
      Top = 0
      Caption = #1044#1088#1091#1082
      DropdownMenu = PopupMenu1
      ImageIndex = 9
      Style = tbsDropDown
    end
    object ToolButton3: TToolButton
      Left = 333
      Top = 0
      Hint = #1054#1085#1086#1074#1080#1090#1080' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1102' '#1079' '#1089#1077#1088#1074#1077#1088#1072
      Caption = #1054#1085#1086#1074#1080#1090#1080
      ImageIndex = 10
      OnClick = ToolButton3Click
    end
    object ToolButton2: TToolButton
      Left = 404
      Top = 0
      Hint = #1042#1080#1073#1088#1072#1090#1080' '#1075#1088#1091#1087#1091' '#1073#1102#1076#1078#1077#1090
      Caption = #1042#1080#1073#1088#1072#1090#1080
      ImageIndex = 3
      OnClick = ToolButton2Click
    end
    object CloseButton: TToolButton
      Left = 475
      Top = 0
      Hint = #1047#1072#1074#1077#1088#1096#1080#1090#1080' '#1088#1086#1073#1086#1090#1091' '#1079' '#1075#1088#1091#1087#1072#1084#1080' '#1073#1102#1076#1078#1077#1090#1110#1074
      Caption = #1042#1080#1093#1110#1076
      ImageIndex = 6
      ParentShowHint = False
      ShowHint = True
      OnClick = CloseButtonClick
    end
  end
  object DockSite: TdxDockSite
    Left = 0
    Top = 41
    Width = 986
    Height = 450
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ManagerFont = False
    Align = alClient
    DockType = 0
    OriginalWidth = 986
    OriginalHeight = 450
    object dxLayoutDockSite1: TdxLayoutDockSite
      Left = 0
      Top = 0
      Width = 448
      Height = 450
      DockType = 1
      OriginalWidth = 300
      OriginalHeight = 200
      object dxLayoutDockSite2: TdxLayoutDockSite
        Left = 0
        Top = 0
        Width = 448
        Height = 450
        DockType = 1
        OriginalWidth = 300
        OriginalHeight = 200
      end
      object DockPanelTree: TdxDockPanel
        Left = 0
        Top = 0
        Width = 448
        Height = 450
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ManagerFont = False
        AllowDockClients = []
        AllowFloating = True
        AllowDock = [dtRight]
        AutoHide = False
        Caption = #1056#1077#1108#1089#1090#1088' '#1075#1088#1091#1087' '#1073#1102#1076#1078#1077#1090#1110#1074
        CaptionButtons = []
        Dockable = False
        DockType = 1
        OriginalWidth = 49
        OriginalHeight = 81
        object dxBarDockControl1: TdxBarDockControl
          Left = 0
          Top = 425
          Width = 444
          Height = 3
          Align = dalBottom
          AllowDocking = False
        end
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 444
          Height = 425
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          PopupMenu = PopupMenu2
          TabOrder = 1
          LookAndFeel.Kind = lfStandard
          object GrView: TcxGridDBTableView
            OnDblClick = GrViewDblClick
            DataController.DataSource = GroupDataSource
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsBehavior.AlwaysShowEditor = True
            OptionsBehavior.CellHints = True
            OptionsCustomize.GroupRowSizing = True
            OptionsData.Editing = False
            OptionsSelection.CellSelect = False
            OptionsView.GroupByBox = False
            OptionsView.HeaderAutoHeight = True
            Styles.Background = back
            Styles.Content = back
            Styles.Header = cxStyle1
            object GrViewDBColumn2: TcxGridDBColumn
              Caption = #1050#1086#1076' '#1075#1088#1091#1087#1080
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              SortOrder = soAscending
              Styles.Content = back
              Width = 105
              DataBinding.FieldName = 'GROUP_KOD'
            end
            object GrViewDBColumn1: TcxGridDBColumn
              Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1075#1088#1091#1087#1080
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Styles.Content = back
              Width = 213
              DataBinding.FieldName = 'GROUP_TITLE'
            end
            object GrViewDBColumn3: TcxGridDBColumn
              Caption = #1063#1080' '#1076#1086#1089#1090#1091#1087#1085#1072' '#1085#1072' '#1074#1080#1073#1110#1088'?'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayUnchecked = 'False'
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Styles.Content = back
              Width = 140
              DataBinding.FieldName = 'ENABLED'
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = GrView
          end
        end
      end
    end
    object DockPanelGrid: TdxDockPanel
      Left = 448
      Top = 0
      Width = 538
      Height = 450
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ManagerFont = False
      AllowFloating = True
      AllowDock = [dtRight]
      AutoHide = False
      Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1091' '#1075#1088#1091#1087#1110' '#1073#1102#1076#1078#1077#1090#1110#1074
      CaptionButtons = [cbHide]
      Dockable = False
      DockType = 4
      OriginalWidth = 538
      OriginalHeight = 81
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 534
        Height = 428
        Align = alClient
        Caption = 'Panel3'
        TabOrder = 0
        OnResize = Panel3Resize
        object PageControl1: TPageControl
          Left = 1
          Top = 1
          Width = 532
          Height = 426
          ActivePage = TabSheet1
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object FndSheet: TTabSheet
            Caption = #1060#1086#1085#1076#1080
            object ToolBar2: TToolBar
              Left = 0
              Top = 0
              Width = 524
              Height = 41
              AutoSize = True
              ButtonHeight = 39
              ButtonWidth = 71
              Caption = 'ToolBar1'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Images = SmallImages
              ParentFont = False
              ShowCaptions = True
              TabOrder = 0
              object ToolButton5: TToolButton
                Left = 0
                Top = 0
                Hint = #1044#1086#1076#1072#1090#1080' '#1092#1086#1085#1076#1080
                Caption = #1044#1086#1076#1072#1090#1080
                ImageIndex = 1
                ParentShowHint = False
                ShowHint = True
                OnClick = ToolButton5Click
              end
              object ToolButton6: TToolButton
                Left = 71
                Top = 0
                Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1092#1086#1085#1076#1080
                Caption = #1042#1080#1076#1072#1083#1080#1090#1080
                ImageIndex = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = ToolButton6Click
              end
              object ToolButton7: TToolButton
                Left = 142
                Top = 0
                Hint = #1047#1084#1110#1085#1080#1090#1080' '#1092#1086#1085#1076#1080
                Caption = #1047#1084#1110#1085#1080#1090#1080
                ImageIndex = 5
                ParentShowHint = False
                ShowHint = True
                OnClick = ToolButton7Click
              end
            end
            object cxGrid2: TcxGrid
              Left = 0
              Top = 41
              Width = 524
              Height = 354
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              PopupMenu = PopupMenu3
              TabOrder = 1
              LookAndFeel.Kind = lfStandard
              object cxGridDBTableView1: TcxGridDBTableView
                DataController.DataSource = FondsDataSource
                DataController.Filter.Criteria = {FFFFFFFF0000000000}
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                NavigatorButtons.ConfirmDelete = False
                OptionsBehavior.AlwaysShowEditor = True
                OptionsBehavior.CellHints = True
                OptionsCustomize.GroupRowSizing = True
                OptionsData.Editing = False
                OptionsSelection.CellSelect = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                OptionsView.HeaderAutoHeight = True
                Styles.Background = back
                Styles.Content = back
                Styles.Header = cxStyle1
                object cxGridDBTableView1DBColumn1: TcxGridDBColumn
                  Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  SortOrder = soAscending
                  Width = 81
                  DataBinding.FieldName = 'DATE_BEG'
                end
                object cxGridDBTableView1DBColumn2: TcxGridDBColumn
                  Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  Width = 83
                  DataBinding.FieldName = 'DATE_END'
                end
                object cxGridDBColumn1: TcxGridDBColumn
                  Caption = #1044#1086#1093#1086#1076#1080
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  Styles.Content = back
                  Width = 94
                  DataBinding.FieldName = 'ID_PRIH_SCH_TEXT'
                end
                object cxGridDBColumn2: TcxGridDBColumn
                  Caption = #1042#1080#1076#1072#1090#1082#1080
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  Styles.Content = back
                  Width = 89
                  DataBinding.FieldName = 'ID_RASH_SCH_TEXT'
                end
                object cxGridDBTableView1DBColumn3: TcxGridDBColumn
                  Caption = #1042#1080#1076#1072#1090#1082#1080' '#1087#1086' '#1051'.'#1053'.'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  Width = 87
                  DataBinding.FieldName = 'ID_SCH_LL_TEXT'
                end
                object cxGridDBTableView1DBColumn4: TcxGridDBColumn
                  Caption = #1042#1080#1076#1072#1090#1082#1080' '#1087#1086' '#1051'.'#1053'.'#1074' '#1053'.'#1042'.'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  Width = 86
                  DataBinding.FieldName = 'ID_SCH_LL_NV_TEXT'
                end
              end
              object cxGridLevel1: TcxGridLevel
                GridView = cxGridDBTableView1
              end
            end
          end
          object TabSheet2: TTabSheet
            Caption = #1055#1088#1086#1075#1088#1072#1084#1080
            ImageIndex = 1
            object ToolBar3: TToolBar
              Left = 0
              Top = 0
              Width = 524
              Height = 41
              AutoSize = True
              ButtonHeight = 39
              ButtonWidth = 71
              Caption = 'ToolBar1'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Images = SmallImages
              ParentFont = False
              ShowCaptions = True
              TabOrder = 0
              object ToolButton8: TToolButton
                Left = 0
                Top = 0
                Hint = #1053#1086#1074#1099#1081' '#1050#1045#1050#1047
                Caption = #1044#1086#1076#1072#1090#1080
                ImageIndex = 1
                ParentShowHint = False
                ShowHint = True
                OnClick = ToolButton8Click
              end
              object ToolButton9: TToolButton
                Left = 71
                Top = 0
                Hint = #1059#1076#1072#1083#1080#1090#1100' '#1050#1045#1050#1047
                Caption = #1042#1080#1076#1072#1083#1080#1090#1080
                ImageIndex = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = ToolButton9Click
              end
              object ToolButton10: TToolButton
                Left = 142
                Top = 0
                Caption = #1047#1084#1110#1085#1080#1090#1080
                ImageIndex = 5
                OnClick = ToolButton10Click
              end
            end
            object cxGrid3: TcxGrid
              Left = 0
              Top = 41
              Width = 524
              Height = 264
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              PopupMenu = PopupMenu4
              TabOrder = 1
              LookAndFeel.Kind = lfStandard
              object cxGridDBTableView2: TcxGridDBTableView
                DataController.DataSource = G_PKVDataSource
                DataController.Filter.Criteria = {FFFFFFFF0000000000}
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                NavigatorButtons.ConfirmDelete = False
                OptionsBehavior.AlwaysShowEditor = True
                OptionsBehavior.CellHints = True
                OptionsCustomize.GroupRowSizing = True
                OptionsData.Editing = False
                OptionsSelection.CellSelect = False
                OptionsView.CellAutoHeight = True
                OptionsView.GroupByBox = False
                OptionsView.HeaderAutoHeight = True
                Styles.Background = back
                Styles.Content = back
                Styles.Header = cxStyle1
                object cxGridDBColumn3: TcxGridDBColumn
                  Caption = #1050#1086#1076' '#1087#1088#1086#1075#1088#1072#1084#1080
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  Width = 84
                  DataBinding.FieldName = 'PKV_KOD'
                end
                object cxGridDBTableView2DBColumn3: TcxGridDBColumn
                  Caption = #1050#1086#1076' '#1090#1080#1087#1091' '#1082#1086#1096#1090#1110#1074
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  Width = 100
                  DataBinding.FieldName = 'TYPE_FINANCE_CODE'
                end
                object cxGridDBColumn4: TcxGridDBColumn
                  Caption = #1055#1088#1086#1075#1088#1072#1084#1072
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  Visible = False
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  Width = 93
                  DataBinding.FieldName = 'PKV_TITLE'
                end
                object cxGridDBTableView2DBColumn4: TcxGridDBColumn
                  Caption = #1053#1072#1079#1074#1072' '#1052#1054
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  Width = 71
                  DataBinding.FieldName = 'MO_CHAR'
                end
                object cxGridDBTableView2DBColumn1: TcxGridDBColumn
                  Caption = #1055#1086#1095#1072#1090#1086#1082
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  SortOrder = soAscending
                  Width = 83
                  DataBinding.FieldName = 'DATE_BEG'
                end
                object cxGridDBTableView2DBColumn2: TcxGridDBColumn
                  Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  Width = 84
                  DataBinding.FieldName = 'DATE_END'
                end
              end
              object cxGridLevel2: TcxGridLevel
                GridView = cxGridDBTableView2
              end
            end
            object Panel1: TPanel
              Left = 0
              Top = 305
              Width = 524
              Height = 90
              Align = alBottom
              TabOrder = 2
              object Label1: TLabel
                Left = 1
                Top = 1
                Width = 522
                Height = 16
                Align = alTop
                Caption = #1042' '#1087#1077#1088#1110#1086#1076#1110' '#1087#1088#1080#1074#39#1103#1079#1072#1085#1072' '#1076#1086' '#1087#1072#1088#1072#1084#1077#1090#1088#1110#1074
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGreen
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object PageControl2: TPageControl
                Left = 1
                Top = 17
                Width = 522
                Height = 72
                ActivePage = TabSheet4
                Align = alClient
                TabOrder = 0
                object TabSheet3: TTabSheet
                  Caption = #1087#1088#1086#1075#1088#1072#1084#1072
                  object cxDBMemo1: TcxDBMemo
                    Left = 0
                    Top = 0
                    Width = 334
                    Height = 41
                    Align = alClient
                    DataBinding.DataField = 'PKV_TITLE'
                    DataBinding.DataSource = G_PKVDataSource
                    Style.Color = clInfoBk
                    TabOrder = 0
                  end
                end
                object TabSheet4: TTabSheet
                  Caption = #1090#1080#1087' '#1082#1086#1096#1090#1110#1074
                  ImageIndex = 1
                  object cxDBMemo2: TcxDBMemo
                    Left = 0
                    Top = 0
                    Width = 514
                    Height = 41
                    Align = alClient
                    DataBinding.DataField = 'TEXT_TYPE_FINANCE'
                    DataBinding.DataSource = G_PKVDataSource
                    Style.Color = clInfoBk
                    TabOrder = 0
                  end
                end
              end
            end
          end
          object BankSchSheet: TTabSheet
            Caption = #1056#1072#1093#1091#1085#1082#1080
            ImageIndex = 2
            object ToolBar4: TToolBar
              Left = 0
              Top = 0
              Width = 524
              Height = 41
              AutoSize = True
              ButtonHeight = 39
              ButtonWidth = 71
              Caption = 'ToolBar1'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Images = SmallImages
              ParentFont = False
              ShowCaptions = True
              TabOrder = 0
              object ToolButton1: TToolButton
                Left = 0
                Top = 0
                Hint = #1053#1086#1074#1099#1081' '#1050#1045#1050#1047
                Caption = #1044#1086#1076#1072#1090#1080
                ImageIndex = 1
                ParentShowHint = False
                ShowHint = True
                OnClick = ToolButton1Click
              end
              object ToolButton11: TToolButton
                Left = 71
                Top = 0
                Hint = #1059#1076#1072#1083#1080#1090#1100' '#1050#1045#1050#1047
                Caption = #1042#1080#1076#1072#1083#1080#1090#1080
                ImageIndex = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = ToolButton11Click
              end
              object ToolButton12: TToolButton
                Left = 142
                Top = 0
                Caption = #1047#1084#1110#1085#1080#1090#1080
                ImageIndex = 5
                OnClick = ToolButton12Click
              end
            end
            object cxGrid4: TcxGrid
              Left = 0
              Top = 41
              Width = 524
              Height = 265
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              PopupMenu = PopupMenu4
              TabOrder = 1
              LookAndFeel.Kind = lfStandard
              object cxGridDBTableView3: TcxGridDBTableView
                DataController.DataSource = SchDataSource
                DataController.Filter.Criteria = {FFFFFFFF0000000000}
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                NavigatorButtons.ConfirmDelete = False
                OptionsBehavior.AlwaysShowEditor = True
                OptionsBehavior.CellHints = True
                OptionsCustomize.GroupRowSizing = True
                OptionsData.Editing = False
                OptionsSelection.CellSelect = False
                OptionsView.CellAutoHeight = True
                OptionsView.GroupByBox = False
                OptionsView.HeaderAutoHeight = True
                Styles.Background = back
                Styles.Content = back
                Styles.Header = cxStyle1
                object cxGridDBColumn10: TcxGridDBColumn
                  Caption = #1053#1086#1084#1077#1088' '#1088#1072#1093#1091#1085#1082#1091
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  Width = 122
                  DataBinding.FieldName = 'sch_number'
                end
                object cxGridDBColumn9: TcxGridDBColumn
                  Caption = #1052#1060#1054
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  Width = 83
                  DataBinding.FieldName = 'sch_mfo'
                end
                object cxGridDBColumn7: TcxGridDBColumn
                  Caption = #1055#1086#1095#1072#1090#1086#1082
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  SortOrder = soAscending
                  Width = 111
                  DataBinding.FieldName = 'DATE_BEG'
                end
                object cxGridDBColumn8: TcxGridDBColumn
                  Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  Width = 90
                  DataBinding.FieldName = 'DATE_END'
                end
                object cxGridDBTableView3DBColumn1: TcxGridDBColumn
                  Caption = #1042#1080#1076#1072#1090#1082#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082' '#1079#1072' '#1079#1072#1084#1086#1074#1095#1077#1085#1085#1103#1084
                  PropertiesClassName = 'TcxCheckBoxProperties'
                  Properties.DisplayUnchecked = 'False'
                  Properties.ValueChecked = 1
                  Properties.ValueUnchecked = 0
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  Width = 139
                  DataBinding.FieldName = 'isdefault'
                end
              end
              object cxGridLevel3: TcxGridLevel
                GridView = cxGridDBTableView3
              end
            end
            object cxDBMemo3: TcxDBMemo
              Left = 0
              Top = 306
              Width = 524
              Height = 89
              Align = alBottom
              DataBinding.DataField = 'name_mfo'
              DataBinding.DataSource = SchDataSource
              Style.Color = clInfoBk
              TabOrder = 2
            end
          end
          object TabSheet1: TTabSheet
            Caption = #1056#1086#1079#1087#1086#1076#1110#1083' '#1072#1089#1080#1075#1085#1091#1074#1072#1085#1100
            ImageIndex = 3
            object ToolBar5: TToolBar
              Left = 0
              Top = 0
              Width = 524
              Height = 41
              AutoSize = True
              ButtonHeight = 39
              ButtonWidth = 71
              Caption = 'ToolBar1'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Images = SmallImages
              ParentFont = False
              ShowCaptions = True
              TabOrder = 0
              object ToolButton13: TToolButton
                Left = 0
                Top = 0
                Hint = #1044#1086#1076#1072#1090#1080' '#1092#1086#1085#1076#1080
                Caption = #1044#1086#1076#1072#1090#1080
                ImageIndex = 1
                ParentShowHint = False
                ShowHint = True
                OnClick = ToolButton13Click
              end
              object ToolButton15: TToolButton
                Left = 71
                Top = 0
                Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1092#1086#1085#1076#1080
                Caption = #1042#1080#1076#1072#1083#1080#1090#1080
                ImageIndex = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = ToolButton15Click
              end
              object ToolButton16: TToolButton
                Left = 142
                Top = 0
                Caption = #1047#1084#1110#1085#1080#1090#1080
                ImageIndex = 5
                OnClick = ToolButton16Click
              end
            end
            object Panel2: TPanel
              Left = 0
              Top = 136
              Width = 524
              Height = 259
              Align = alBottom
              TabOrder = 1
              object ToolBar6: TToolBar
                Left = 1
                Top = 1
                Width = 522
                Height = 41
                AutoSize = True
                ButtonHeight = 39
                ButtonWidth = 71
                Caption = 'ToolBar1'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Images = SmallImages
                ParentFont = False
                ShowCaptions = True
                TabOrder = 0
                object ToolButton17: TToolButton
                  Left = 0
                  Top = 0
                  Hint = #1044#1086#1076#1072#1090#1080' '#1092#1086#1085#1076#1080
                  Caption = #1044#1086#1076#1072#1090#1080
                  ImageIndex = 1
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = ToolButton17Click
                end
                object ToolButton18: TToolButton
                  Left = 71
                  Top = 0
                  Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1092#1086#1085#1076#1080
                  Caption = #1042#1080#1076#1072#1083#1080#1090#1080
                  ImageIndex = 2
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = ToolButton18Click
                end
                object ToolButton19: TToolButton
                  Left = 142
                  Top = 0
                  Hint = #1047#1084#1110#1085#1080#1090#1080' '#1092#1086#1085#1076#1080
                  Caption = #1047#1084#1110#1085#1080#1090#1080
                  ImageIndex = 5
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = ToolButton19Click
                end
              end
              object cxGrid6: TcxGrid
                Left = 1
                Top = 42
                Width = 522
                Height = 216
                Align = alClient
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                PopupMenu = PopupMenu4
                TabOrder = 1
                LookAndFeel.Kind = lfStandard
                object cxGridDBTableView5: TcxGridDBTableView
                  OnDblClick = cxGridDBTableView5DblClick
                  DataController.DataSource = FormulaDataSource
                  DataController.Filter.Criteria = {FFFFFFFF0000000000}
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  NavigatorButtons.ConfirmDelete = False
                  OptionsBehavior.AlwaysShowEditor = True
                  OptionsBehavior.CellHints = True
                  OptionsCustomize.GroupRowSizing = True
                  OptionsData.Editing = False
                  OptionsSelection.CellSelect = False
                  OptionsView.CellAutoHeight = True
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.HeaderAutoHeight = True
                  Styles.Background = back
                  Styles.Content = back
                  Styles.Header = cxStyle1
                  object cxGridDBTableView5DBColumn1: TcxGridDBColumn
                    Caption = #1058#1080#1087' '#1086#1073#39#1108#1082#1090#1091' '#1076#1078#1077#1088#1077#1083#1072
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    Properties.Alignment.Vert = taVCenter
                    HeaderAlignmentHorz = taCenter
                    HeaderAlignmentVert = vaCenter
                    Options.Filtering = False
                    SortOrder = soAscending
                    Width = 94
                    DataBinding.FieldName = 'TYPE_SOURCE_OBJ_TEXT'
                  end
                  object cxGridDBColumn11: TcxGridDBColumn
                    Caption = #1044#1078#1077#1088#1077#1083#1086
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    Properties.Alignment.Vert = taVCenter
                    Visible = False
                    GroupIndex = 0
                    HeaderAlignmentHorz = taCenter
                    HeaderAlignmentVert = vaCenter
                    Options.Filtering = False
                    SortOrder = soAscending
                    Width = 133
                    DataBinding.FieldName = 'SOURCE_RAZD_ST_FULL'
                  end
                  object cxGridDBColumn13: TcxGridDBColumn
                    Caption = #1058#1080#1087' '#1086#1073#39#1108#1082#1090#1091' '#1087#1088#1080#1081#1084#1072#1095#1072
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    Properties.Alignment.Vert = taVCenter
                    HeaderAlignmentHorz = taCenter
                    HeaderAlignmentVert = vaCenter
                    Options.Filtering = False
                    Width = 111
                    DataBinding.FieldName = 'TYPE_TARGET_OBJ_TEXT'
                  end
                  object cxGridDBColumn12: TcxGridDBColumn
                    Caption = #1054#1073#39#1108#1082#1090' '#1087#1088#1080#1081#1084#1072#1095
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taLeftJustify
                    Properties.Alignment.Vert = taVCenter
                    HeaderAlignmentHorz = taCenter
                    HeaderAlignmentVert = vaCenter
                    Options.Filtering = False
                    Width = 221
                    DataBinding.FieldName = 'TARGET_RAZD_ST_FULL'
                  end
                  object cxGridDBColumn14: TcxGridDBColumn
                    Caption = #1042#1110#1076#1089#1086#1090#1086#1082' '#1074#1110#1076' '#1076#1078#1077#1088#1077#1083#1072
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    Properties.Alignment.Vert = taVCenter
                    HeaderAlignmentHorz = taCenter
                    HeaderAlignmentVert = vaCenter
                    Options.Filtering = False
                    Width = 74
                    DataBinding.FieldName = 'PERCENT_FROM_SOURCE'
                  end
                end
                object cxGridLevel5: TcxGridLevel
                  GridView = cxGridDBTableView5
                end
              end
            end
            object cxSplitter1: TcxSplitter
              Left = 0
              Top = 128
              Width = 524
              Height = 8
              HotZoneClassName = 'TcxMediaPlayer8Style'
              AlignSplitter = salBottom
              Control = Panel2
            end
            object Panel4: TPanel
              Left = 0
              Top = 41
              Width = 524
              Height = 87
              Align = alClient
              TabOrder = 3
              object cxGrid5: TcxGrid
                Left = 1
                Top = 1
                Width = 522
                Height = 85
                Align = alClient
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                PopupMenu = PopupMenu4
                TabOrder = 0
                LookAndFeel.Kind = lfStandard
                object cxGridDBTableView4: TcxGridDBTableView
                  OnDblClick = cxGridDBTableView4DblClick
                  DataController.DataSource = AssPeriodsDataSource
                  DataController.Filter.Criteria = {FFFFFFFF0000000000}
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  NavigatorButtons.ConfirmDelete = False
                  OnFocusedRecordChanged = cxGridDBTableView4FocusedRecordChanged
                  OptionsBehavior.AlwaysShowEditor = True
                  OptionsBehavior.CellHints = True
                  OptionsCustomize.GroupRowSizing = True
                  OptionsData.Editing = False
                  OptionsSelection.CellSelect = False
                  OptionsView.CellAutoHeight = True
                  OptionsView.GroupByBox = False
                  OptionsView.HeaderAutoHeight = True
                  Styles.Background = back
                  Styles.Content = back
                  Styles.Header = cxStyle1
                  object cxGridDBColumn5: TcxGridDBColumn
                    Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1076#1110#1111' '#1092#1086#1088#1084#1091#1083#1080
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    Properties.Alignment.Vert = taVCenter
                    HeaderAlignmentHorz = taCenter
                    HeaderAlignmentVert = vaCenter
                    Options.Filtering = False
                    SortOrder = soAscending
                    Width = 159
                    DataBinding.FieldName = 'DATE_BEG'
                  end
                  object cxGridDBColumn6: TcxGridDBColumn
                    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1076#1110#1111' '#1092#1086#1088#1084#1091#1083#1080
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.Alignment.Horz = taCenter
                    Properties.Alignment.Vert = taVCenter
                    HeaderAlignmentHorz = taCenter
                    HeaderAlignmentVert = vaCenter
                    Options.Filtering = False
                    Width = 184
                    DataBinding.FieldName = 'DATE_END'
                  end
                end
                object cxGridLevel4: TcxGridLevel
                  GridView = cxGridDBTableView4
                end
              end
            end
          end
        end
      end
    end
  end
  object SmallImages: TImageList
    Left = 8
    Top = 280
    Bitmap = {
      494C010112001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7818300A4787400A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400986B6600000000000000000000000000CB690800CB690800CB69
      0800CB690800CB690800CB690800CB690800CB690800CB690800CB690800CB69
      0800CB690800CB690800CB690800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7818300FDEFD900F6E3
      CB00F5DFC200F4DBBA00F2D7B200F1D4A900F1D0A200EECC9900EECC9700EECC
      9700F3D19900986B6600000000000000000000000000CB680600FFFFFF00FFFF
      FF00FFFFFF0082C97600FFEFDA00FFEFDA00FFEFDA00C4945B008B843300FFDA
      B400FFDAB400FFDAB400CB670400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4817600FEF3E3009933
      000099330000993300009933000099330000993300009933000099330000EECC
      9700F3D19900986B6600000000000000000000000000CB690800FFFFFF00FFFF
      FF00FFFFFF0082C97600FFEFDA00FFF0DD00FFEED200958A87001D637A008C82
      7600DEBE9B00FFDAB400CC680600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4817600FFF7EB009933
      0000FEFEFE00FEFEFE00FEFEFE008EA4FD00B8C6FD00FEFEFE0099330000EFCD
      9900F3D19800986B6600000000000000000000000000C96704008AC77B0081C6
      740081C6760057B346007DC0660081C0660081C0630069AE5B00567D8900B381
      8700756550006D904B00C9680400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA8E8500FFFCF4009933
      0000FEFEFE00FAFBFE007E98FC000335FB00597AFC00FEFEFE0099330000F0D0
      A100F3D29B00986B6600000000000000000000000000CB680700F1F6EB00F1F9
      F000F1F9F0007CC57000E3EBD100F1ECD500F1E7CA00E8E1B90075955900EBAA
      AF00B48283007B635200CF640000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA8E8500FFFFFD009933
      0000D6DEFE004368FC000335FB004066FC000436FB00D9E0FE0099330000F0D4
      A900F5D5A300986B6600000000000000000000000000CB680700FFFFFA00FDFD
      FF00F9F9FF007DC47B00F4F7E800FFFDF200FFF5EC00FBECD40081BE6200E6B1
      AF00E2A9AE00C27E7C0085764C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CB9A8200FFFFFF009933
      00005274FC001442FB00BCC9FD00EFF2FE001A47FB004F72FC0097330400F2D8
      B200F6D9AC00986B6600000000000000000000000000D3690000A2A1F5005F60
      F2004B4BEA003843D4007D7DF900BAC9D900B9DE9F00ABD2940069BA5300B3D1
      91009C9B6A008E98A00013ACD500002CB4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CB9A8200FFFFFF009933
      0000E4EAFE00D9E0FE00FEFEFE00FEFEFE0098ACFD000335FB0064345900F4DB
      B900F8DDB400986B66000000000000000000000000008062B1006162D800ACA6
      C600B4AEC400BAB5CF007674CF002F43CA0088B1AF00B2DD9E0068BA5600B4D9
      A300C0D0950088BFBA000E74E7000C1AB8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DCA88700FFFFFF009933
      0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE005677FC000335FB00F7E1
      C200F0DAB700986B660000000000000000005B5BFB006F75F400DEDED200FFF3
      BE00F7CD9900FCD49F00FFFBDC008785CC00746DFF00F1F1F50087C97400FFFD
      FF00FFF3E500FFEBC800785F8600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DCA88700FFFFFF009933
      000099330000993300009933000099330000993300008F3311002235C8000335
      FB00C6BCA900986B660000000000000000005B5BFB00B3B2E000FFFFDE00FEFD
      D600FCF7D100F7DCAB00F2CA9500DFD1C2005354D900C4C8EE0092CF7600FFFA
      F400FEF0DE00FEE8C900C1641600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E3B18E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFD00FDF8F300FDF6EC00F1E1D500B48176000335
      FB000335FB000335FB0000000000000000006867F700C0C9EA00FFFFF800FFFF
      E2009D9E8E004A4D4D006F665800B6ABAB005B60DE00A8615100D9730300D471
      0700D4710700D471070000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E3B18E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FFFEF900E3CFC900B4817600E8B2
      7000ECA54A000335FB0000000000000000006060FA00C3C3E700FFFFFF00FFFF
      F600E1E1C7007A7B6E00C3AC8500EDD7BB004E58EB00A45A4900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4D4D200B4817600FAC5
      7700CD9377000000000000000000000000006060FA009692EA00FAF7F000FFFF
      FF00FFFFFF00F5F5E600BAB59200A9A5C5004549FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200FCF7F400FCF7
      F300FBF6F300FBF6F300FAF5F300F9F5F300F9F5F300E1D0CE00B4817600CF9B
      860000000000000000000000000000000000000000006162FC009A97E700E5E1
      EB00EFF7F400F2F6F800B9B8E4005253EE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200DAA48200DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200B48176000000
      00000000000000000000000000000000000000000000000000004F50FE005A58
      F4006564EE005656F1004040FB00000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000096675E009F6F
      60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F
      60009F6F60009F6F60009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000000000000000000000000000000000099695F00F6E0
      BF00F4DDB800F3DAB400F3D7AD00F2D5A700F0D3A300F0D09E00EECC9900EECA
      9300EDC99000EDC68C009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000000000008C5A5A008C5A5A0000000000FFFF0000FFFF0000000000008C5A
      5A008C5A5A008C5A5A008C5A5A0000000000A67A7500F1E1D600EEDBCD00ECD6
      C500EAD1BD00E7CCB500E5C8AD00E3C3A500E0BF9D00A67A7500000000000000
      0000000000000335FB00000000000000000000000000000000009D6C6000F6E3
      C600F6E1C100F4DDBB00F3DCB40000810000F2D5AA00F0D3A400F0CF9F00EFCC
      9900EFCB9500EEC990009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      000000000000F7DECE00F7DEC60000000000FFFF0000FFFF000000000000F7DE
      C600EFDECE00F7EFDE008C5A5A0000000000A67A7500FCF7F200FAF1E700F9EC
      DC00F7E7D200F5E2C800F4DDBE00F3D8B400F1D4A900A67A7500000000000000
      00000335FB000335FB0000000000000000000000000000000000A16E6000F7E6
      CE00F6E5C700F4E1C100008100000081000000810000F3D5AB00F0D3A500EFD1
      9F00EFCE9A00EFCB96009F6F6000000000000000000000000000000000000000
      0000000000000000000000848300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      000000000000000000000000000000000000FFFFFF00FFFF000000000000F7DE
      C600EFDECE00F7EFDE008C5A5A0000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000330E200000000000000000000000000A6726200F8EA
      D400F7E7CE0000810000307A2A005F924B000081000050883C00F2D5AB00F0D3
      A500F0D0A000EFCF9C009F6F6000000000000000000000000000000000000000
      0000000000000084830000FFFE00008483000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      000000000000FFD6A500FFD6A500FFD6A500000000000000000084848400FFD6
      A500FFD6A500F7E7CE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000335FB000000000000000000AB766300FAEE
      DA00FAEBD50000810000EFE2C200F6E2C200A7B883000081000000810000EDD4
      A900F0D4A600F0D1A1009F6F6000000000000000000000000000000000000000
      000000FFFE0000FFFE0000FFFE0000FFFE000084830000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC6000000
      0000F7E7CE00F7E7CE000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      0000000000000000000000000000000000000000000000000000B0786400FAF0
      E200FAEEDC00F8EBD500F8E9D000F7E6CA00F6E3C500E6D8B400008100000081
      0000F2D7AD00F2D4A7009F6F60000000000000000000000000000000000000FF
      FE0000FFFE00848484008484840000FFFE0000FFFE0000848300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7EFDE00F7DECE0000000000F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C60000000000EFDECE000000000000000000A67A7500F1E1D600EEDBCD00ECD6
      C500EAD1BD00E7CCB500E5C8AD00E3C3A500E0BF9D00A67A7500000000000000
      0000000000000335FB0000000000000000000000000000000000B57D6400FCF3
      E700FBF0E300FAEFDD00FAEDD800F7E9D100F8E6CB00F6E3C500F6E1C000F4DE
      BA00F4DAB500F3D7AD009F6F60000000000000000000000000008484840000FF
      FE008484840000000000000000008484840000FFFE0000FFFE00008483000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C0000000000FFD6A50000000000FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500000000000000000000000000A67A7500FCF7F200FAF1E700F9EC
      DC00F7E7D200F5E2C800F4DDBE00F3D8B400F1D4A900A67A7500000000000000
      00000335FB000335FB0000000000000000000000000000000000BB806500FCF7
      ED00D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700D5812700F3DAB6009F6F6000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000FFFE0000FFFE000084
      830000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7EF000000000000000000F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B6B0000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000330E200000000000000000000000000C0836600FCF8
      F300FCF7EF00FCF4EA00FBF2E500FBEFDE00F8EDD900F8EBD400F8E7CE00F7E3
      C700F6E1C200F4DEBB009F6F6000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFE0000FF
      FE0000848300000000000000000000000000000000000000000000000000B58C
      8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000335FB000000000000000000C4876700FEFB
      F800FEFAF300FEF7EF00FCF4EA00FBF2E600FAEFE000F8EDDA00F8EAD400F7E9
      CF00F7E5C900F6E2C4009F6F6000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FE0000FFFE00000000000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B0000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      0000000000000000000000000000000000000000000000000000C9896700FEFC
      FB00D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700D5812700F7E5CA009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFE00000000000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B0000000000A67A7500F1E1D600EEDBCD00ECD6
      C500EAD1BD00E7CCB500E5C8AD00E3C3A500E0BF9D00A67A7500000000000000
      0000000000000335FB0000000000000000000000000000000000CC8B6800FFFF
      FF00FFFEFC00FEFCFA00FEFBF400FEF8F000FCF6ED00FCF4E700FAF2E200FAEF
      DC00F8EDD700F8EAD1009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000000000000000000000000000B58C
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B000000000000000000A67A7500FCF7F200FAF1E700F9EC
      DC00F7E7D200F5E2C800F4DDBE00F3D8B400F1D4A900A67A7500000000000000
      00000335FB000335FB0000000000000000000000000000000000CF8E6800FFFF
      FF00FFFFFF00FFFFFC00FFFCFA00FEFBF600FEF8F000FCF7EE00FBF4E900FBF2
      E300FBEFDD00F8EDD8009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C
      8C00C68C7B00000000000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000330E200000000000000000000000000CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000335FB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005346450053464500534645005346450053464500534645000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D40000000000EF42
      0000AD290000AD2900007329000073290000000000000000000000000000B58E
      7B00B5928400F7E3D600EFE3DE00EFE3DE00F7E7DE00F7E3D600BDA69C005346
      4500534645000000000000000000000000000000000039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900000000000000000000000000000000000000000097736B00B3887F00B184
      7C00B1847C00B1847C00B1857D00B1857D00B1857E00B0857D00AE857E00AA83
      7C00B0858000B48A7C00875D560000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400FF9C1800FFF7
      E700AD290000AD29000073290000732900000000000000000000BDA69C00F7E7
      DE00FFF3F700E7DBD600DEB29C00D6A68C00E7C7BD00EFEBEF00F7F3F700F7E3
      D600E7CBBD005346450000000000000000003939390080808000808080008080
      8000808080008080800084848400848484008484840084848400848484003939
      39003939390000000000000000000000000000000000B3938C00F1DCCA00FCDB
      C400FCDAC600FCDBC700FAD5BA00FED6BC00FFD4B600FAD3B600F6CFB000F1CD
      AE00F5CEA800FDCFAD009D706A0000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400FF9C1800FFF7
      E700AD290000AD290000732900007329000000000000BDA69C00F7EBE700FFFF
      FF00C68E7300BD5D2900BD5D2900DEB29C00BD5D2900BD5D2900D69E8400F7F3
      F700F7E7DE00D6C7BD0053464500000000003939390039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      39003939390039393900000000000000000000000000B3969000ECE8D600FFF2
      D400E4E6BE00E3E1B900FFEAD300F4E1B600E9E3AF00FDDDB700FDD8AD00FAD5
      A700F6D6A200FCD8B600A072720000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400000000000000
      0000AD290000AD290000732900007329000000000000BDA69C00FFFFFF00CE6D
      4200BD5D2900BD5D2900C6A29400FFFFFF00E7825200BD5D2900BD5D2900D696
      7300FFFBF700F7E3D600534645000000000039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C5C5C500C5C5C500C5C5C500C5C5C500C5C5C5008484
      84003939390039393900000000000000000000000000BB9F9000ECEFE500FFFA
      EC00A9D38F00009A0000029B050000980000009D000000930000269D2300D5CD
      9800FFD7AC00FED7BA009E70700000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400000000000000
      0000AD290000AD2900007329000073290000BDA69C00FFFBFF00DE9E7B00BD5D
      2900CE653100CE653100CE693900D68A6300CE653100CE653100BD5D2900BD5D
      2900E7CBBD00F7EFEF00DECBC6005346450039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000FF000000FF00000000FF000000FF00C5C5C5008484
      84008484840039393900393939000000000000000000C0A49800EFF1EA00FFFB
      F400AAD89900009400000098000010A016009CCE9100AFC791002FA826005FB5
      4F00F6DAB100FFDEC6009E71700000000000FF9C18000000000000000000EF42
      0000AD290000AD2900007329000073290000FF9C1800FF9C1800000000000000
      0000AD290000AD2900007329000073290000D6C7BD00FFF7F700C6613100BD5D
      2900CE653100BD5D2900CE866300F7E7DE00D6693900BD5D2900CE653100BD5D
      2900CE714200FFFFFF00E7CBBD005346450039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C5C5C500C5C5C500C5C5C500C5C5C500C5C5C5008484
      84008484840084848400393939000000000000000000C4A7A000EFF5E900FFFC
      F700B3DCA300019D01000DA10B001DA41C0051B14300F0E5C400F4E2C3005FB4
      5B00D9D29D00FFDDC600A77A740000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C3100007329000073290000FF9C1800F7FFFF00000000000000
      0000AD290000AD2900007329000073290000D6C7BD00F7DFD600BD5D2900CE65
      3100CE653100BD5D2900D6825200FFFBFF00E7AE9400BD5D2900BD5D2900CE65
      3100BD5D2900FFEFEF00F7DFD600534645000000000039393900393939003939
      390039393900393939003939390039393900393939003939390039393900C5C5
      C5008484840084848400393939000000000000000000CAACA100F4FAF200F2F7
      E500DCEBCE00FBF4E600F5F3DF00F9F1DA00FEE7CD00FEEBD800FFECDB00F7E6
      CD00F0DEB600FEDAC100AB7D750000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD2900007329000073290000D6C7BD00F7D7CE00CE653100CE65
      3100CE653100CE653100BD5D2900DEAA9400FFF7F700EF9E7300BD5D2900CE65
      3100BD5D2900F7F3EF00EFE3DE00534645000000000000000000B58C8C00FFFF
      FF00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00FFFFFF009C6B
      6B00C5C5C50084848400393939000000000000000000D2B5A000F6FAFA00E6F7
      E1008AD38800EDF3DF00FFFCF900C0DEAA004AB0390053B4430049B13C00C5D5
      9F00FFE8D000FDE1CC00AA7E760000000000FFA53900FFA53900F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD2900008C3921008C392100D6C7BD00FFEFE700D6693900CE65
      3100CE653100BD5D2900BD5D2900BD5D2900E7CFC600FFFFFF00D6693900CE65
      3100CE693900FFFBFF00F7DFD600534645000000000000000000B58C8C00FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFFF7009C6B
      6B003939390039393900000000000000000000000000D1B4A100F4FAF800FFFF
      FD008FCF910049B95100E2EFD800FFF9EA0063BB64000093000000910000AAD0
      8D00FFEED900FEDFCA00AC7F770000000000C8D0D400FFA53900FFA53900EF42
      0000EF420000AD290000732900008C392100FFA53900FF9C1800000000000000
      0000AD2900008C3921008C392100C8D0D400D6C7BD00FFFFFF00F79A6B00D669
      3900CE8E6B00F7EBE700D6825200BD5D2900D6967300FFFFFF00E78E5A00BD5D
      2900EF926300FFFFFF00D6C7BD00534645000000000000000000B58C8C00FFFF
      FF00FFF7EF00F7E7CE00F7DEC600F7E7CE00F7DEC600F7E7CE00FFFFF7009C6B
      6B000000000000000000000000000000000000000000DBBDA300F6FDFA00FFFF
      FF00E9F4E5003AAA350018A519005FC0590036AD33000099000000950000AAD4
      8F00FFF6E200FCDCC800AF847D0000000000C8D0D400C8D0D400FFA53900FFF7
      E700EF420000AD290000732900008C392100FFA53900FFF7E700000000000000
      00008C3921008C392100C8D0D400C8D0D40000000000D6C7BD00FFEBDE00EF86
      5200E7825200F7F7F700FFFFFF00DEBAAD00FFFFFF00F7F7F700DE714200D671
      3900FFF3EF00F7E7E7005346450000000000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFF
      FF009C6B6B0000000000000000000000000000000000E1C3A300F6FDFB00F8FC
      F800FFFFFF00C4EBCC0021AA2500009500000094000012A414000D9F1100A5CC
      8B00FFCAC000F8ADA100AC7E760000000000C8D0D400C8D0D400FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D40000000000D6C7BD00FFFFFF00FFEF
      D600FFAA7300EFAA8C00EFE3DE00EFEFEF00F7E7E700FFA67B00F78E5A00F7DB
      CE00FFFFFF00D6C7BD000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFFFF700FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFFF
      FF009C6B6B0000000000000000000000000000000000E6C9A900F9FFFE00F8FC
      F800F8FCF800F8FCF800FBFEFA00FFFFFF00FFFFFF00FEFEF800FFFFFE00C9AA
      9700D4975200C79A7A00C3AEA20000000000C8D0D400C8D0D400FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D4000000000000000000D6C7BD00FFFF
      FF00FFFFFF00FFF3C600FFDFAD00FFD39C00FFC79400FFD7AD00FFFFFF00FFFF
      FF00D6C7BD000000000000000000000000000000000000000000000000000000
      0000B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C6B6B00000000000000000000000000E8CBAC00FBFFFF00FAFF
      FF00FAFFFF00FAFFFF00FAFEFD00F9FEFD00F4FBFB00F3FBF800F7FFFC00C6AA
      9800D09E7300DCC9B6000000000000000000C8D0D400C8D0D400C8D0D400FFA5
      3900FF9C1800EF4200008C392100C8D0D400C8D0D400FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D400000000000000000000000000D6C7
      BD00D6C7BD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBFF00DECBC600D6C7
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C009C6B6B00000000000000000000000000E7C29D00E1C6A500E2C6
      A600E2C6A600E2C6A600E2C4A400E1C3A300DDC1A100DCC0A000DEC3A300C29C
      8400DECCB800000000000000000000000000C8D0D400C8D0D400C8D0D400FFA5
      3900F7FFFF00EF4200008C392100C8D0D400C8D0D400FFA53900F7FFFF000000
      00008C392100C8D0D400C8D0D400C8D0D4000000000000000000000000000000
      000000000000DECBC600D6C7BD00D6C7BD00D6C7BD00D6C7BD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C8D0D400C8D0D400C8D0D400FFCE
      6300FFCE6300FFA53900FFA53900C8D0D400C8D0D400FFCE6300FFA53900FFA5
      39008C392100C8D0D400C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C3100009C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA5005A3118005A311800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5636B00A5636B00000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA500FFE78C00FFE78C00313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5636B0084848400A5636B00000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A000000000000000000FFF7E700FFD6A500FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A003131
      31009C3100009C31000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00CECED60084848400A5636B00000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500F7E7CE008C5A5A000000000000000000FFF7E700F7DEC600F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7CE00F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000000000000000FF00B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00F7E7CE008C5A5A000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00EFDECE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA5000000000008080800FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      8400F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC6000000
      FF00EFDECE00EFDECE008C5A5A000000000000000000FFF7E70045454500FFD6
      A50045454500FFD6A5001F1F1F00FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6300000000000000000000000000000000000000000000000000080808000000
      000000000000FF633100FFEFA500FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000A5736B00EFEFEF0084848400A5636B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000008400FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500000084000000
      FF00FFD6A500EFDECE009C6B63000000000000000000FFF7EF00F7DEC600F7DE
      C600F7DEC6001F1F1F001F1F1F00F7DEC600F7DEBD00F7E7CE00EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFDE8400FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000BD846B00EFEFEF0084848400A5636B00000000000000
      0000000000000000000000000000000000000000000000000000000000006C6C
      FF0000008400F7DEC600F7DEC600F7DEC600F7DEC600000084000000FF00F7DE
      BD00F7E7CE00EFDECE009C6B6B000000000000000000FFF7EF00F7E7CE00F7DE
      C6001F1F1F001F1F1F001F1F1F00F7DEC600F7DEC600F7E7D600EFDECE009C6B
      6B000000000000000000000000000000000000000000FFFFCE00FFFFBD00FFC6
      5A00FFA51000FF9C0000F7FFFF00FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000D6946B00EFEFEF0084848400A5636B00000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C000000FF0000008400F7DEC600F7DEC600000084000000FF00F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B000000000000000000FFFFF700FFD6A5001F1F
      1F008484840000FFFF001F1F1F00FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      00000000000008080800F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      000000000000BD7B5A00EFEFEF00CECED6008484840042424200A5636B000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF0000008400000084000000FF00FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B000000000000000000FFFFF700FFE7D6001F1F
      1F00C6C6C60000FFFF001F1F1F00FFE7D6000000000000000000000000009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000BD7B5A00EFEFEF00CECED600BDBDBD008C8C8C005A5A5A0042424200A563
      6B0000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF000000FF000000FF00FFE7D600FFE7D600FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B000000000000000000FFFFFF001F1F1F008484
      840000FFFF001F1F1F00FFFFF700FFFFF70000000000FFFFFF00C68C7B00C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100C65A0000FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C00009C3100000000000000000000000000000000000000000000BD7B
      5A00EFEFEF00EFEFEF00C6C6C600ADADAD008C8C8C00737373005A5A5A004242
      4200A5636B00000000000000000000000000000000000000000000000000B58C
      8C000000FF00000084000000FF0000008400FFFFFF00FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B000000000000000000000000004545450084848400C6C6
      C60000FFFF001F1F1F00FFFFFF00FFFFFF0000000000C68C7B00C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300C65A0000C65A0000CE636300FFC65A00FF9C
      0000FF9C00009C31000000000000000000000000000000000000BD7B5A00EFEF
      EF00EFEFEF00CECED600BDBDBD009C9C9C008484840084848400737373005A5A
      5A0042424200A5636B00000000000000000000000000000000000000FF000000
      FF0000008400FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00B58C
      8C00C68C7B00000000000000000000000000000000001F1F1F001F1F1F0000FF
      FF001F1F1F0000000000000000000000000000000000C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300FFD67300FFD67300C65A0000CE636300FF9C
      0000FF9C00009C310000000000000000000000000000BD7B5A00EFEFEF00EFEF
      EF00CECED600C6C6C600C6C6C600848484008484840084848400848484007373
      73005A5A5A0042424200A5636B0000000000000000000000FF000000FF00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C000000FF0000008400B58C8C00B58C
      8C00000000000000000000000000000000001F1F1F0000008400000084001F1F
      1F00C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFDE8400FFDE8400FFDE8400FFDE8400C65A0000C65A
      0000C65A00009C3100000000000000000000D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000C8D0D4001F1F1F001F1F1F001F1F
      1F00C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF63310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000000000000000
      0000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7E7CE008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600EFDE
      CE00EFDECE008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500F7E7CE008C5A5A00000000000000000000000000000000000000
      0000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500EFDECE008C5A5A0000000000000000000000000000000000000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00F7E7CE008C5A5A0000000000B58C8C008C5A5A008C5A5A008C5A
      5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7
      CE00EFDECE009C6B630000000000000000000000000000000000000084000000
      8400000084008484840000000000000000000000000000000000000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00EFDECE008C5A5A0000000000B58C8C00FFF7E700F7EFDE00F7EF
      DE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7E7
      D600EFDECE009C6B6B0000000000000000000000000000000000000000000000
      8400000084000000840084848400000000000000000000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000FF0000008400000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B630000000000B58C8C00F7EFDE00F7DECE00F7DE
      C600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A5004C804C004C804C004C80
      4C004C804C00A57B730000000000000000000000000000000000000000000000
      0000000084000000840000008400848484000000840000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF00000084000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008585850000FFFF00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B6B0000000000B58C8C00FFF7E700FFD6A500FFD6
      A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D6004C804C0052AE570052AE
      57004C804C00A57B730000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF0000848484008484840000FF000000FF000000840000000000000000
      0000000000000000000000000000000000000000000000FFFF0000000000B58C
      8C008585850000FFFF00F7DEC60000FFFF0000FFFF00F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B0000000000B58C8C00FFF7EF00F7DEC600F7DE
      C600B58C8C00FFFFFF00FFFFFF004C804C004C804C004C804C0052AE570052AE
      57004C804C004C804C004C804C00000000000000000000000000000000000000
      00000000000000000000000084000000FF000000840084848400000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      00008484840000000000000000008484840000FF000000FF0000008400000000
      000000000000000000000000000000000000000000008585850000FFFF00B58C
      8C008585850000FFFF0000FFFF0085858500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B0000000000B58C8C00FFF7EF00F7E7CE00F7DE
      C600B58C8C00FFFFFF00FFFFFF004C804C0052AE570052AE570052AE570052AE
      570052AE570052AE57004C804C00000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000FF000000FF00000084
      00000000000000000000000000000000000000000000000000008585850000FF
      FF008585850000FFFF008585850000FFFF0000FFFF0000FFFF00FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B0000000000B58C8C00FFFFF700FFD6A500FFD6
      A500B58C8C00FFFFFF00FFFFFF004C804C0069CA800069CA800069CA800052AE
      570052AE570052AE57004C804C00000000000000000000000000000000000000
      0000000084000000840000008400000000000000840000008400000084008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FF000000FF
      0000008400000000000000000000000000008585850085858500858585008585
      850000FFFF0085858500858585008585850085858500FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B000000000000000000B58C8C00FFFFF700FFE7D600FFE7
      D600B58C8C00B58C8C00B58C8C004C804C004C804C004C804C0069CA800052AE
      57004C804C004C804C004C804C00000000000000000000000000000000000000
      8400000084000000840000000000000000000000000000008400000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      000000FF0000000000000000000000000000000000000000000000FFFF008585
      850000FFFF0000FFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C
      8C00C68C7B00000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD004C804C0069CA800052AE
      57004C804C000000000000000000000000000000000000000000000084000000
      8400000084000000000000000000000000000000000000000000000084000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FF00000000000000000000000000000000000000FFFF008585850000FF
      FF008585850000FFFF008585850000FFFF00B58C8C00B58C8C00B58C8C00B58C
      8C0000000000000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C004C804C004C804C004C80
      4C004C804C000000000000000000000000000000000000000000000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000000000008585850000FFFF000000
      00008585850000FFFF00000000008585850000FFFF0000000000000000000000
      000000000000000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008585850000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00BD8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000008003800100000000
      8003800100000000800380010000000080038001000000008003800100000000
      8003800100000000800380000000000080038000000000008003000100000000
      800300010000000080030003000000008003003F000000008007007F00000000
      800F80FF00000000801FC1FF00000000FFFFFFFFFFFFC001FFFFCF3F0021C001
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
  object cxStyleRepository1: TcxStyleRepository
    Left = 40
    Top = 280
    object back: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object column_gray: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object periods: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 41
    Top = 251
  end
  object WorkDatabase: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 9
    Top = 248
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 72
    Top = 252
  end
  object GroupDataSource: TDataSource
    DataSet = GroupDataSet
    Left = 40
    Top = 152
  end
  object OpenDialog1: TOpenDialog
    Left = 8
    Top = 64
  end
  object GroupDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from PUB_SMETA_GROUP_SELECT')
    Left = 8
    Top = 152
    poSQLINT64ToBCD = True
  end
  object FondsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from PUB_DT_SM_GR_FND_SELECT(?ID_GROUP)')
    DataSource = GroupDataSource
    Left = 9
    Top = 183
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object FondsDataSource: TDataSource
    DataSet = FondsDataSet
    Left = 42
    Top = 182
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38316.403727256900000000
    ReportOptions.LastChange = 38580.399817233800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo10OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   ;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 8
    Top = 118
    Datasets = <
      item
        DataSet = FondDataset
        DataSetName = 'FondsDataset'
      end>
    Variables = <
      item
        Name = ' Budgets'
        Value = Null
      end
      item
        Name = 'SM'
        Value = ''
      end
      item
        Name = 'RZ'
        Value = ''
      end
      item
        Name = 'ST'
        Value = ''
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Color = clWhite
      object ReportTitle1: TfrxReportTitle
        Height = 29.118120000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 3.417440000000000000
          Top = 0.866109999999999100
          Width = 710.551640000000000000
          Height = 23.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1074#1103#1079#1082#1072' '#1075#1088#1091#1087#1087' '#1073#1102#1076#1078#1077#1090#1086#1074' '#1082' '#1092#1086#1085#1076#1072#1084)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 21.708720000000000000
        ParentFont = False
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        DataSet = FondDataset
        DataSetName = 'FondsDataset'
        RowCount = 0
        Stretched = True
        object Memo8: TfrxMemoView
          Left = 527.244094490000000000
          Width = 92.976377950000000000
          Height = 21.212598430000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[FondsDataSet."DATE_BEG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Width = 61.984244650000000000
          Height = 21.212598430000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 620.976377950000000000
          Width = 95.622047240000000000
          Height = 21.299212600000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[FondsDataSet."DATE_END"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 317.480520000000000000
          Width = 103.976377950000000000
          Height = 21.212598430000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[FondsDataSet."ID_PRIH_SCH_TEXT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 422.086890000000000000
          Width = 103.976377950000000000
          Height = 21.212598430000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[FondsDataSet."ID_RASH_SCH_TEXT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Height = 61.677180000000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        RowCount = 1
        object Memo12: TfrxMemoView
          Left = 527.370203230000000000
          Top = 36.338590000000010000
          Width = 92.811380000000000000
          Height = 23.897610940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1095#1072#1083#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 620.945270000000000000
          Top = 36.338590000000010000
          Width = 95.527830000000000000
          Height = 23.897610940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1085#1077#1094)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 510.307360000000000000
          Width = 206.638220000000000000
          Height = 36.795260940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1077#1088#1080#1086#1076)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 72.590600000000000000
          Width = 245.149970000000000000
          Height = 60.472440940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1043#1088#1091#1087#1087#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Width = 73.291590000000000000
          Height = 60.472440940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1076)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 319.260050000000000000
          Top = 36.338590000000010000
          Width = 104.811380000000000000
          Height = 23.897610940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1093#1086#1076)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 424.173706770000000000
          Top = 36.338590000000010000
          Width = 101.527830000000000000
          Height = 23.897610940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1089#1093#1086#1076)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 319.094856770000000000
          Width = 206.638220000000000000
          Height = 36.795260940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076#1099)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 366.614410000000000000
        Width = 718.110700000000000000
        object Memo36: TfrxMemoView
          Left = 616.063390000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1089#1090#1088'. [Page]')
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 21.677180000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        Condition = 'FondsDataset."SM_GR_KOD"'
        KeepTogether = True
        OutlineText = 'FondsDataset."SM_GR_KOD"'
        Stretched = True
        object Memo13: TfrxMemoView
          Width = 73.322834650000000000
          Height = 21.212598430000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[FondsDataSet."SM_GR_KOD"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 72.944881890000000000
          Width = 178.015748030000000000
          Height = 21.212598430000000000
          StretchMode = smActualHeight
          AllowHTMLTags = True
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Memo.Strings = (
            '[FondsDataSet."SM_GR_TITLE"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 251.787570000000000000
          Width = 464.882190000000000000
          Height = 20.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftRight, ftTop]
        end
      end
      object MasterData3: TfrxMasterData
        Height = 22.677180000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        RowCount = 1
        object Memo16: TfrxMemoView
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object FondDataset: TfrxDBDataset
    UserName = 'FondsDataset'
    CloseDataSource = False
    DataSet = PrintDataSet
    Left = 40
    Top = 118
  end
  object PrintDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from PUB_DT_SM_GR_FND_SELECT_EX')
    Left = 104
    Top = 118
    poSQLINT64ToBCD = True
  end
  object PopupMenu1: TPopupMenu
    Images = SmallImages
    Left = 72
    Top = 118
    object N1: TMenuItem
      Caption = #1056#1077#1108#1089#1090#1088
      ImageIndex = 9
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1043#1088#1091#1087#1080' '#1073#1102#1076#1078#1077#1090#1110#1074' + '#1092#1086#1085#1076#1080' ('#1073#1072#1083#1072#1085#1089#1086#1074#1110' '#1088#1072#1093#1091#1085#1082#1080')'
      ImageIndex = 9
      OnClick = N2Click
    end
  end
  object G_PKVDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from BU_SM_GR_PKV_SELECT(?ID_GROUP)')
    DataSource = GroupDataSource
    Left = 8
    Top = 214
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object G_PKVDataSource: TDataSource
    DataSet = G_PKVDataSet
    Left = 40
    Top = 214
  end
  object PopupMenu2: TPopupMenu
    Images = SmallImages
    Left = 72
    Top = 145
    object N3: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080' '#1075#1088#1091#1087#1091' '#1073#1102#1076#1078#1077#1090#1110#1074
      ImageIndex = 1
      ShortCut = 45
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1075#1088#1091#1087#1091' '#1073#1102#1076#1078#1077#1090#1110#1074
      ImageIndex = 2
      ShortCut = 46
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1075#1088#1091#1087#1091' '#1073#1102#1076#1078#1077#1090#1110#1074
      ImageIndex = 5
      ShortCut = 113
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N15: TMenuItem
      Caption = #1041#1102#1076#1078#1077#1090' '#1079#1072' '#1079#1072#1084#1086#1074#1095#1077#1085#1085#1103#1084' '#1076#1083#1103' '#1073#1072#1085#1082#1091' '
      OnClick = N15Click
    end
    object N7: TMenuItem
      Caption = #1054#1085#1086#1074#1080#1090#1080' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1102' '#1079' '#1089#1077#1088#1077#1074#1077#1088#1072
      ImageIndex = 10
      ShortCut = 116
      OnClick = N7Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Caption = #1047#1072#1074#1077#1088#1096#1077#1085#1085#1103' '#1088#1086#1073#1086#1090#1080' '#1079' '#1075#1088#1091#1087#1072#1084#1080' '#1073#1102#1076#1078#1077#1090#1110#1074
      ImageIndex = 6
      ShortCut = 16499
      OnClick = N9Click
    end
  end
  object PopupMenu3: TPopupMenu
    Images = SmallImages
    Left = 397
    Top = 157
    object N10: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080' '#1092#1086#1085#1076
      ImageIndex = 1
      ShortCut = 45
      OnClick = N10Click
    end
    object N11: TMenuItem
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1092#1086#1085#1076
      ImageIndex = 2
      ShortCut = 46
      OnClick = N11Click
    end
    object N12: TMenuItem
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1092#1086#1085#1076
      ImageIndex = 5
      ShortCut = 113
      OnClick = N12Click
    end
  end
  object PopupMenu4: TPopupMenu
    Images = SmallImages
    Left = 104
    Top = 153
    object N13: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080' '#1087#1088#1086#1075#1088#1072#1084#1091' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      ImageIndex = 1
      ShortCut = 45
      OnClick = N13Click
    end
    object N14: TMenuItem
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1087#1088#1086#1075#1088#1072#1084#1091' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      ImageIndex = 2
      ShortCut = 46
      OnClick = N14Click
    end
  end
  object ActionList1: TActionList
    Left = 104
    Top = 185
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 16397
      OnExecute = Action1Execute
    end
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 8
    Top = 313
  end
  object SchDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    DataSource = GroupDataSource
    Left = 48
    Top = 369
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object SchDataSource: TDataSource
    DataSet = SchDataSet
    Left = 80
    Top = 369
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    ShowProgress = True
    Left = 152
    Top = 105
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 184
    Top = 105
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 216
    Top = 105
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 248
    Top = 105
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 280
    Top = 105
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 312
    Top = 105
  end
  object AssPeriodsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    DataSource = GroupDataSource
    Left = 104
    Top = 217
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object AssPeriodsDataSource: TDataSource
    DataSet = AssPeriodsDataSet
    Left = 104
    Top = 257
  end
  object FormulaDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    DataSource = AssPeriodsDataSource
    Left = 104
    Top = 297
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object FormulaDataSource: TDataSource
    DataSet = FormulaDataSet
    Left = 136
    Top = 297
  end
end
