object frmAddMoving: TfrmAddMoving
  Left = 795
  Top = 282
  Width = 603
  Height = 491
  BorderIcons = [biSystemMenu]
  Caption = #1047#1084#1110#1085#1080#1090#1080
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
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 595
    Height = 417
    ActivePage = cxTabSheet1
    Align = alTop
    TabOrder = 0
    OnChange = cxPageControl1Change
    object cxTabSheet1: TcxTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
      ImageIndex = 0
      object Panel_Top: TPanel
        Left = 0
        Top = 0
        Width = 595
        Height = 73
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object LblDateBegEdit: TcxLabel
          Left = 8
          Top = 3
          Width = 53
          Height = 17
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGreen
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 0
          Caption = #1055#1086#1095#1072#1090#1086#1082':'
        end
        object LblDateEndEdit: TcxLabel
          Left = 178
          Top = 3
          Width = 44
          Height = 17
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGreen
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 1
          Caption = #1050#1110#1085#1077#1094#1100':'
        end
        object cxDateBegEdit: TcxDateEdit
          Left = 64
          Top = 3
          Width = 100
          Height = 21
          Properties.OnChange = cxDateBegEditPropertiesChange
          TabOrder = 2
        end
        object cxDateEndEdit: TcxDateEdit
          Left = 218
          Top = 3
          Width = 100
          Height = 21
          Properties.OnChange = cxDateEndEditPropertiesChange
          TabOrder = 3
        end
        object cbNoDateEnd: TqFBoolControl
          Left = 324
          Top = 3
          Width = 100
          Height = 21
          DisplayName = #1041#1077#1079#1089#1090#1088#1086#1082#1086#1074#1086
          Interval = 120
          Value = False
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          OnChange = cbNoDateEndChange
          Blocked = False
          TabOrder = 4
          AutoSaveToRegistry = False
          StoreAs = StoreAs01
        end
        object Absent: TqFSpravControl
          Left = 6
          Top = 27
          Width = 571
          Height = 21
          FieldName = 'Id_Key'
          DisplayName = #1053#1072' '#1095#1072#1089' '#1074#1110#1076#1089#1091#1090#1085#1100#1086#1075#1086' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072'?'
          Interval = 175
          Value = Null
          LabelColor = clGreen
          Required = False
          Semicolon = False
          Asterisk = False
          Enabled = True
          OnChange = AbsentChange
          Blocked = False
          TabOrder = 6
          AutoSaveToRegistry = False
          OnOpenSprav = AbsentOpenSprav
          DisplayText = ''
          DisplayTextField = 'Away_Info'
        end
        object cxLabel1: TcxLabel
          Left = 6
          Top = 53
          Width = 101
          Height = 17
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGreen
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 7
          Caption = #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1090#1086#1088' '#1064#1056':'
        end
        object IdShr: TcxCurrencyEdit
          Left = 105
          Top = 51
          Width = 67
          Height = 21
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = '0'
          TabOrder = 8
        end
        object ShowButton: TcxButton
          Left = 529
          Top = 52
          Width = 51
          Height = 20
          Caption = '<<'
          TabOrder = 14
          OnClick = ShowButtonClick
        end
        object FindIdShR: TcxButton
          Left = 472
          Top = 52
          Width = 52
          Height = 20
          Action = Act_Find_Id_ShR
          Caption = #1064#1091#1082#1072#1090#1080
          TabOrder = 12
        end
        object cxLabel3: TcxLabel
          Left = 333
          Top = 53
          Width = 93
          Height = 17
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGreen
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 13
          Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1075#1086#1076#1080#1085
        end
        object cntMonth: TcxTextEdit
          Left = 533
          Top = 2
          Width = 33
          Height = 21
          TabOrder = 5
          Visible = False
          OnKeyPress = cntMonthKeyPress
        end
        object cntHours: TcxCurrencyEdit
          Left = 416
          Top = 52
          Width = 51
          Height = 21
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = '0'
          TabOrder = 11
          OnKeyUp = cntHoursKeyUp
        end
        object lblMonth: TcxLabel
          Left = 438
          Top = 3
          Width = 93
          Height = 17
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGreen
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 15
          Visible = False
          Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1084#1110#1089#1103#1094#1110#1074
        end
        object RateCount: TcxCurrencyEdit
          Left = 272
          Top = 51
          Width = 59
          Height = 21
          Properties.DecimalPlaces = 5
          Properties.DisplayFormat = ',0.00000;-,0.00000'
          TabOrder = 10
          OnKeyUp = RateCountKeyUp
        end
        object cxLabel2: TcxLabel
          Left = 175
          Top = 53
          Width = 92
          Height = 17
          ParentColor = False
          ParentFont = False
          Style.Color = clBtnFace
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGreen
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 9
          Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1089#1090#1072#1074#1086#1082
        end
      end
      object Panel_Bottom: TPanel
        Left = 0
        Top = 73
        Width = 577
        Height = 315
        Align = alCustom
        BevelOuter = bvNone
        TabOrder = 1
        object cbIsMainPost: TqFBoolControl
          Left = 438
          Top = 288
          Width = 121
          Height = 21
          DisplayName = #1054#1089#1085#1086#1074#1085#1072' '#1087#1086#1089#1072#1076#1072
          Interval = 120
          Value = False
          LabelColor = clGreen
          Required = True
          Semicolon = False
          Asterisk = False
          Enabled = True
          OnChange = cbIsMainPostChange
          Blocked = False
          TabOrder = 11
          AutoSaveToRegistry = False
          StoreAs = StoreAs01
        end
        object NoteEdit: TqFCharControl
          Left = 6
          Top = 197
          Width = 570
          Height = 21
          DisplayName = #1055#1088#1080#1084#1110#1090#1082#1072
          Interval = 120
          Value = ''
          LabelColor = clGreen
          Required = False
          Semicolon = True
          Asterisk = True
          Enabled = True
          OnChange = NoteEditChange
          Blocked = False
          TabOrder = 8
          AutoSaveToRegistry = False
          MaxLength = 0
        end
        object GroupBox1: TGroupBox
          Left = 6
          Top = 218
          Width = 563
          Height = 65
          Caption = #1059#1084#1086#1074#1080' '#1074#1089#1090#1091#1087#1091' '#1085#1072' '#1087#1086#1089#1072#1076#1091
          TabOrder = 9
          object CondEdit: TqFSpravControl
            Left = 1
            Top = 14
            Width = 552
            Height = 21
            DisplayName = #1059#1084#1086#1074#1072
            Interval = 120
            Value = Null
            LabelColor = clGreen
            Required = False
            Semicolon = True
            Asterisk = True
            Enabled = True
            OnChange = CondEditChange
            Blocked = False
            TabOrder = 0
            AutoSaveToRegistry = False
            OnOpenSprav = CondEditOpenSprav
            DisplayText = ''
          end
          object cxDateBegObrEdit: TcxDateEdit
            Left = 120
            Top = 40
            Width = 121
            Height = 21
            TabOrder = 2
          end
          object cxDateEndObrEdit: TcxDateEdit
            Left = 363
            Top = 40
            Width = 121
            Height = 21
            TabOrder = 4
          end
          object LblDateBegObrEdit: TcxLabel
            Left = 1
            Top = 40
            Width = 98
            Height = 17
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clGreen
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            TabOrder = 1
            Caption = #1055#1086#1095#1072#1090#1086#1082' '#1086#1073#1088#1072#1085#1085#1103':'
          end
          object LblDateEndObrEdit: TcxLabel
            Left = 264
            Top = 40
            Width = 89
            Height = 17
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clGreen
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            TabOrder = 3
            Caption = #1050#1110#1085#1077#1094#1100' '#1086#1073#1088#1072#1085#1085#1103':'
          end
        end
        object FactOkladEdit: TqFSpravControl
          Left = 6
          Top = 53
          Width = 570
          Height = 21
          DisplayName = #1060#1072#1082#1090#1080#1095#1085#1072' '#1087#1086#1089#1072#1076#1072
          Interval = 120
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = True
          Enabled = True
          OnChange = FactOkladEditChange
          Blocked = False
          TabOrder = 2
          AutoSaveToRegistry = False
          OnOpenSprav = FactOkladEditOpenSprav
          DisplayText = ''
        end
        object DepartmentEdit: TqFSpravControl
          Left = 6
          Top = 5
          Width = 570
          Height = 21
          DisplayName = #1055#1110#1076#1088#1086#1079#1076#1110#1083
          Interval = 120
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = True
          Enabled = True
          OnChange = DepartmentEditChange
          Blocked = False
          TabOrder = 0
          AutoSaveToRegistry = False
          OnOpenSprav = DepartmentEditOpenSprav
          DisplayText = ''
        end
        object PayEdit: TqFEnumControl
          Left = 6
          Top = 288
          Width = 235
          Height = 21
          DisplayName = #1054#1087#1083#1072#1090#1072
          Interval = 120
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = True
          Enabled = True
          OnChange = PayEditChange
          Blocked = False
          TabOrder = 10
          AutoSaveToRegistry = False
          Items.Strings = (
            #1054#1082#1083#1072#1076
            #1058#1072#1088#1110#1092)
          ValuesString = '0,1'
        end
        object PayFormEdit: TqFSpravControl
          Left = 6
          Top = 149
          Width = 570
          Height = 21
          DisplayName = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1080
          Interval = 120
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = True
          Enabled = True
          OnChange = PayFormEditChange
          Blocked = False
          TabOrder = 6
          AutoSaveToRegistry = False
          OnOpenSprav = PayFormEditOpenSprav
          DisplayText = ''
        end
        object PersonalTypeEdit: TqFSpravControl
          Left = 6
          Top = 77
          Width = 570
          Height = 21
          DisplayName = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
          Interval = 120
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = True
          Enabled = True
          OnChange = PersonalTypeEditChange
          Blocked = False
          TabOrder = 3
          AutoSaveToRegistry = False
          OnOpenSprav = PersonalTypeEditOpenSprav
          DisplayText = ''
        end
        object PosadOkladEdit: TqFSpravControl
          Left = 6
          Top = 29
          Width = 570
          Height = 21
          DisplayName = #1055#1088#1080#1081#1085#1103#1090' '#1085#1072' '#1087#1086#1089#1072#1076#1091
          Interval = 120
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = True
          Enabled = True
          OnChange = PosadOkladEditChange
          Blocked = False
          TabOrder = 1
          AutoSaveToRegistry = False
          OnOpenSprav = PosadOkladEditOpenSprav
          DisplayText = ''
        end
        object ReasonEdit: TqFCharControl
          Left = 6
          Top = 173
          Width = 570
          Height = 21
          DisplayName = #1055#1110#1076#1089#1090#1072#1074#1072
          Interval = 120
          Value = ''
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = True
          Enabled = True
          OnChange = ReasonEditChange
          Blocked = False
          TabOrder = 7
          AutoSaveToRegistry = False
          MaxLength = 0
        end
        object WorkCondEdit: TqFSpravControl
          Left = 6
          Top = 125
          Width = 570
          Height = 21
          DisplayName = #1059#1084#1086#1074#1080' '#1087#1088#1072#1094#1110
          Interval = 120
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = True
          Enabled = True
          OnChange = WorkCondEditChange
          Blocked = False
          TabOrder = 5
          AutoSaveToRegistry = False
          OnOpenSprav = WorkCondEditOpenSprav
          DisplayText = ''
        end
        object WorkReasonEdit: TqFSpravControl
          Left = 6
          Top = 101
          Width = 570
          Height = 21
          DisplayName = #1055#1110#1076#1089#1090#1072#1074#1072' '#1088#1086#1073#1086#1090#1080
          Interval = 120
          Value = Null
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = True
          Enabled = True
          OnChange = WorkReasonEditChange
          Blocked = False
          TabOrder = 4
          AutoSaveToRegistry = False
          OnOpenSprav = WorkReasonEditOpenSprav
          DisplayText = ''
        end
      end
      object IdShrPanel: TPanel
        Left = 0
        Top = 73
        Width = 579
        Height = 80
        Align = alCustom
        BevelOuter = bvNone
        TabOrder = 2
        Visible = False
        object ItemsGrid: TcxGrid
          Left = 0
          Top = 20
          Width = 579
          Height = 60
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkSoft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TabStop = False
          object PeopleView: TcxGridDBTableView
            DataController.DataSource = ShRDataSource
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsBehavior.CellHints = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderAutoHeight = True
            Styles.StyleSheet = frmMoveOrder.cxGridTableViewStyleSheet1
            object PeopleViewDBColumn3: TcxGridDBColumn
              Caption = #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1090#1086#1088' '#1064#1056
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Width = 89
              DataBinding.FieldName = 'ID_SH_R'
            end
            object PeopleViewDBColumn1: TcxGridDBColumn
              Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1089#1090#1072#1074#1086#1082
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 5
              Properties.DisplayFormat = ',0.00'#1088#39'.'#39';-,0.00'
              Options.Filtering = False
              DataBinding.FieldName = 'RATE_COUNT'
            end
            object PeopleViewDBColumn2: TcxGridDBColumn
              Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1075#1086#1076#1080#1085
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              DataBinding.FieldName = 'HOURS_COUNT'
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = PeopleView
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 579
          Height = 20
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object AddIdShr: TcxButton
            Left = 6
            Top = 2
            Width = 49
            Height = 16
            Caption = '+'
            TabOrder = 0
            OnClick = AddIdShrClick
          end
          object DelIdShR: TcxButton
            Left = 59
            Top = 2
            Width = 49
            Height = 16
            Caption = '-'
            TabOrder = 1
            OnClick = DelIdShRClick
          end
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = #1060#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      ImageIndex = 1
      OnShow = cxTabSheet2Show
      object cxGrid3: TcxGrid
        Left = 0
        Top = 44
        Width = 595
        Height = 324
        Align = alClient
        TabOrder = 0
        object cxGridDBBandedTableView2: TcxGridDBBandedTableView
          OnKeyDown = cxGridDBBandedTableView2KeyDown
          DataController.DataSource = DataSourceSmet
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.BandMoving = False
          OptionsCustomize.ColumnVertSizing = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.BandHeaders = False
          Styles.StyleSheet = frmMoveOrder.GridBandedTableViewStyleSheetDevExpress
          Bands = <
            item
              Width = 226
            end
            item
              Width = 49
            end
            item
              Width = 76
            end
            item
              Width = 60
            end>
          object cxGridDBBandedColumn13: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
            DataBinding.FieldName = 'ID_SMET'
          end
          object cxGridDBBandedColumn14: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
            DataBinding.FieldName = 'ID_SMET_PPS'
          end
          object cxGridDBBandedColumn15: TcxGridDBBandedColumn
            Caption = #1054#1082#1083#1072#1076
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 83
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
            DataBinding.FieldName = 'OKLAD_BASE'
          end
          object cxGridDBBandedColumn16: TcxGridDBBandedColumn
            Caption = #1054#1082#1083#1072#1076' '#1055#1055#1057
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 83
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 1
            DataBinding.FieldName = 'OKLAD_PPS'
          end
          object cxGridDBBandedColumn17: TcxGridDBBandedColumn
            Caption = #1050#1086#1077#1092'.'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 47
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 1
            DataBinding.FieldName = 'KOEFF_PPS'
          end
          object cxGridDBBandedColumn18: TcxGridDBBandedColumn
            Caption = #1057#1090#1072#1074#1082#1072
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 47
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
            DataBinding.FieldName = 'RATE_COUNT'
          end
          object cxGridDBBandedColumn19: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
            DataBinding.FieldName = 'ID_REC'
          end
          object cxGridDBBandedColumn20: TcxGridDBBandedColumn
            Caption = #1041#1102#1076#1078#1077#1090
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 42
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'SMETA_NAME'
          end
          object cxGridDBBandedColumn21: TcxGridDBBandedColumn
            Caption = #1055#1086#1095#1072#1090#1086#1082
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 35
            Position.BandIndex = 3
            Position.ColIndex = 0
            Position.RowIndex = 0
            DataBinding.FieldName = 'DATE_BEG'
          end
          object cxGridDBBandedColumn22: TcxGridDBBandedColumn
            Caption = #1050#1110#1085#1077#1094#1100
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 35
            Position.BandIndex = 3
            Position.ColIndex = 0
            Position.RowIndex = 1
            DataBinding.FieldName = 'DATE_END'
          end
          object cxGridDBBandedColumn23: TcxGridDBBandedColumn
            Caption = #1041#1102#1076#1078#1077#1090' '#1055#1055#1057
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            SortOrder = soAscending
            Width = 246
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 1
            DataBinding.FieldName = 'SMETA_PPS_NAME'
          end
          object cxGridDBBandedColumn24: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
            DataBinding.FieldName = 'DATES_STR'
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBBandedTableView2
        end
      end
      object dxBarDockControl1: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 595
        Height = 44
        Align = dalTop
        BarManager = dxBarManager1
      end
      object BotomPanel: TPanel
        Left = 0
        Top = 368
        Width = 595
        Height = 26
        Align = alBottom
        TabOrder = 2
        object lblHours: TcxLabel
          Left = 8
          Top = 1
          Width = 86
          Height = 17
          TabOrder = 0
          Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1075#1086#1076#1080#1085
        end
        object dbHours: TcxDBCurrencyEdit
          Left = 99
          Top = 1
          Width = 121
          Height = 21
          DataBinding.DataField = 'Hours_Count'
          DataBinding.DataSource = DataSourceSmet
          Properties.DisplayFormat = ',0.00;-,0.00'
          TabOrder = 1
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = #1053#1072#1076#1073#1072#1074#1082#1080'/'#1044#1086#1087#1083#1072#1090#1080
      ImageIndex = 2
      OnShow = cxTabSheet3Show
      object cxGrid6: TcxGrid
        Left = 0
        Top = 44
        Width = 595
        Height = 350
        Align = alClient
        TabOrder = 0
        object cxGridDBBandedTableView4: TcxGridDBBandedTableView
          OnKeyDown = cxGridDBBandedTableView4KeyDown
          DataController.DataSource = DataSourceNad
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.BandMoving = False
          OptionsCustomize.ColumnVertSizing = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.BandHeaders = False
          Styles.StyleSheet = frmMoveOrder.GridBandedTableViewStyleSheetDevExpress
          Bands = <
            item
              Width = 218
            end
            item
              Width = 77
            end
            item
              Width = 66
            end
            item
              Width = 54
            end>
          object cxGridDBBandedColumn25: TcxGridDBBandedColumn
            Caption = #1055#1086#1095#1072#1090#1086#1082
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
            DataBinding.FieldName = 'DATE_BEG'
          end
          object cxGridDBBandedColumn26: TcxGridDBBandedColumn
            Caption = #1050#1110#1085#1077#1094#1100
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 1
            DataBinding.FieldName = 'DATE_END'
          end
          object cxGridDBBandedColumn27: TcxGridDBBandedColumn
            Caption = '%/'#1089#1091#1084#1072
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 3
            Position.ColIndex = 0
            Position.LineCount = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'PERCENT'
          end
          object cxGridDBBandedColumn28: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1072
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
            DataBinding.FieldName = 'SUMMA_SM'
          end
          object cxGridDBBandedColumn29: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
            DataBinding.FieldName = 'ID_RAISE'
          end
          object cxGridDBBandedColumn30: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
            DataBinding.FieldName = 'SOVM_ID_DEPARTMENT'
          end
          object cxGridDBBandedColumn31: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'SOVM_ID_POST_SALARY'
          end
          object cxGridDBBandedColumn32: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
            DataBinding.FieldName = 'SOVM_ID_TYPE_POST'
          end
          object cxGridDBBandedColumn33: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
            DataBinding.FieldName = 'SOVM_KOEFF_PPS'
          end
          object cxGridDBBandedColumn34: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
            DataBinding.FieldName = 'SOVM_ID_PCARD'
          end
          object cxGridDBBandedColumn35: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
            DataBinding.FieldName = 'ID_ORDER_ITEM'
          end
          object cxGridDBBandedColumn36: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
            DataBinding.FieldName = 'ID_SMET'
          end
          object cxGridDBBandedColumn37: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
            DataBinding.FieldName = 'ID_SMET_PPS'
          end
          object cxGridDBBandedColumn38: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
            DataBinding.FieldName = 'SUMMA_SM'
          end
          object cxGridDBBandedColumn39: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1072' '#1055#1055#1057
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 1
            DataBinding.FieldName = 'SUMMA_PPS'
          end
          object cxGridDBBandedColumn40: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
            DataBinding.FieldName = 'ID_REC'
          end
          object cxGridDBBandedColumn41: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
            DataBinding.FieldName = 'DATE_BEG_SM'
          end
          object cxGridDBBandedColumn42: TcxGridDBBandedColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
            DataBinding.FieldName = 'DATE_END_SM'
          end
          object cxGridDBBandedColumn43: TcxGridDBBandedColumn
            Caption = #1041#1102#1076#1078#1077#1090
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            SortOrder = soAscending
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
            DataBinding.FieldName = 'SMETA_NAME'
          end
          object cxGridDBBandedColumn44: TcxGridDBBandedColumn
            Caption = #1041#1102#1076#1078#1077#1090' '#1055#1055#1057
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 1
            DataBinding.FieldName = 'SMETA_PPS_NAME'
          end
          object cxGridDBBandedColumn45: TcxGridDBBandedColumn
            Caption = #1053#1072#1076#1073#1072#1074#1082#1072'/'#1076#1086#1087#1083#1072#1090#1072
            Visible = False
            GroupIndex = 0
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            SortOrder = soAscending
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
            DataBinding.FieldName = 'RAISE_NAME'
          end
        end
        object cxGridLevel5: TcxGridLevel
          GridView = cxGridDBBandedTableView4
        end
      end
      object dxBarDockControl2: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 595
        Height = 44
        Align = dalTop
        BarManager = dxBarManager1
      end
    end
    object TSWorkMode: TcxTabSheet
      Caption = #1056#1077#1078#1080#1084' '#1087#1088#1072#1094#1110
      ImageIndex = 3
      object lblWorkMode: TLabel
        Left = 14
        Top = 11
        Width = 80
        Height = 13
        Caption = #1056#1077#1078#1080#1084' '#1087#1088#1072#1094#1110':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblShift: TLabel
        Left = 12
        Top = 44
        Width = 51
        Height = 13
        Caption = #1047#1089#1091#1074' '#1085#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object WorkModeGrid: TcxGrid
        Left = 2
        Top = 80
        Width = 543
        Height = 79
        TabOrder = 2
        object WorkModeGridTableView: TcxGridTableView
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsView.GroupByBox = False
          object WorkModeGridTableViewColumn1: TcxGridColumn
            Visible = False
          end
          object WorkModeGridTableViewColumn2: TcxGridColumn
            Caption = #1055#1085
          end
          object WorkModeGridTableViewColumn3: TcxGridColumn
            Caption = #1042#1090
          end
          object WorkModeGridTableViewColumn4: TcxGridColumn
            Caption = #1057#1088
          end
          object WorkModeGridTableViewColumn5: TcxGridColumn
            Caption = #1063#1090
          end
          object WorkModeGridTableViewColumn6: TcxGridColumn
            Caption = #1055#1085
          end
          object WorkModeGridTableViewColumn7: TcxGridColumn
            Caption = #1057#1073
          end
          object WorkModeGridTableViewColumn8: TcxGridColumn
            Caption = #1042#1089
          end
        end
        object WorkModeGridTableView1: TcxGridTableView
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsData.Editing = False
          OptionsView.GroupByBox = False
          Styles.StyleSheet = qizzStyle
          object WorkModeGridTableView1Column8: TcxGridColumn
            Styles.Content = stHeader
            Styles.Footer = stHeader
            Styles.Header = stHeader
          end
          object WorkModeGridTableView1Column1: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 80
          end
          object WorkModeGridTableView1Column2: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 80
          end
          object WorkModeGridTableView1Column3: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 80
          end
          object WorkModeGridTableView1Column4: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 80
          end
          object WorkModeGridTableView1Column5: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 80
          end
          object WorkModeGridTableView1Column6: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 80
          end
          object WorkModeGridTableView1Column7: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 80
          end
        end
        object WorkModeGridLevel: TcxGridLevel
          GridView = WorkModeGridTableView1
        end
      end
      object ShiftEdit: TcxSpinEdit
        Left = 67
        Top = 42
        Width = 57
        Height = 21
        Properties.MaxValue = 7.000000000000000000
        Properties.MinValue = -7.000000000000000000
        Properties.OnChange = ShiftEditPropertiesChange
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        TabOrder = 1
      end
      object WorkModeSprav: TcxButtonEdit
        Left = 97
        Top = 8
        Width = 448
        Height = 21
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = WorkModeSpravPropertiesButtonClick
        Style.BorderStyle = ebs3D
        Style.Color = 16114144
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonStyle = btsDefault
        Style.ButtonTransparency = ebtNone
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 417
    Width = 595
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      595
      35)
    object Bevel1: TBevel
      Left = 0
      Top = 160
      Width = 643
      Height = 9
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Panel1: TPanel
      Left = 206
      Top = 3
      Width = 209
      Height = 37
      Anchors = [akTop]
      BevelOuter = bvNone
      TabOrder = 0
      object btnOk: TBitBtn
        Left = 0
        Top = 0
        Width = 97
        Height = 28
        Caption = #1043#1072#1088#1072#1079#1076
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnOkClick
        Glyph.Data = {
          DE060000424DDE060000000000005E0200002800000030000000180000000100
          08000000000080040000C30E0000C30E00008A0000008A00000000000000FFFF
          FF00FF00FF00B73D3D00C1454500C2484800C6535300C6545400C8595900C95D
          5D00CB636300CC666600CD686800CD696900CE6B6B00CE6C6C00CF6E6E00CF6F
          6F00D0717100D1747400D1757500D37B7B00D47D7D00D5808000D8898900D88A
          8A00D98D8D00DA909000DC969600DD989800DE9C9C00DF9F9F00E0A2A2000066
          000008790F000B7E130012A9200013AB220014AB2300118D1D0013AB230014AC
          250014AB240015AC260017AE270018AE290019AF2B00148D21001CB22F001EB4
          32001FB534001A902A0020AA34001D952E001F99310021AB360022AC380021A3
          350026BA3E0024AD3A0025AE3C0024A5390027AF3E0025A63B0028B0400029B1
          410027A73E002EC04A002FC14C002FB34A0037C8570031B04D0036BC55003ABF
          5B003FCE630040CF640048D56F0047CF6D004FDA790050DB7B0055E0820059E2
          89005BE48A00D1D1D100CFCFCF00CCCCCC00C7C7C700C6C6C600C1C1C100C0C0
          C000BFBFBF00BDBDBD00BABABA00B9B9B900B8B8B800B5B5B500B3B3B300B1B1
          B100B0B0B000AEAEAE00ABABAB00AAAAAA00A9A9A900A8A8A800A7A7A700A3A3
          A300A2A2A200A0A0A0009F9F9F009E9E9E009D9D9D009C9C9C009B9B9B009A9A
          9A00999999009898980097979700969696009595950094949400939393009292
          920091919100909090008F8F8F008E8E8E008D8D8D008C8C8C008B8B8B008787
          8700858585008383830082828200818181007A7A7A0076767600727272006565
          6500020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202210202020202020202020202020202020202020202
          0202028902020202020202020202020202020202020202020202213921020202
          0202020202020202020202020202020202028977890202020202020202020202
          020202020202020202213D244021020202020202020202020202020202020202
          0289757C6D890202020202020202020202020202020202022142312D253E2102
          02020202020202020202020202020202897270767A6E89020202020202020202
          020202020202022136433A322E283C2102020202020202020202020202020289
          7D666A6F757A7089020202020202020202020202020221354A46443F2141293B
          210202020202020202020202020289805E616574896C79718902020202020202
          020202020221334E4C4B45210221302B38210202020202020202020202898157
          595D698902897279728902020202020202020202022151504F4821030202212F
          2C37210202020202020202020289545556648986020289847773890202020202
          020202020221475249210A1103020202212D3421020202020202020202896A53
          6389746C860202028976748902020202020202020203214D21100C0A0F030202
          02212E2621020202020202020286895B896D71746E8602020289757A89020202
          0202020203091821150D03120A0F0302020221232A2102020202020286786289
          6870866B746E8602020289877A89020202020203081C1B19140302030E0A0E03
          0202020221272102020202867B5D5F61698602866F746F860202020289858902
          020202031F1E1D160302020203070B0D0302020202212221020202865A5B5C67
          86020202867E727086020202028988890202020313201703020202020202030B
          0D03020202020221210202866A58658602020202020286727086020202020289
          89020202031A030202020202020202030C0A0302020202020221020286608602
          0202020202020286717486020202020202890202020302020202020202020202
          03050A0302020202020202020286020202020202020202028682748602020202
          0202020202020202020202020202020202020306030202020202020202020202
          02020202020202020202867F8602020202020202020202020202020202020202
          0202020304030202020202020202020202020202020202020202028683860202
          0202020202020202020202020202020202020202020303020202020202020202
          0202020202020202020202020286860202020202020202020202020202020202
          0202020202020203020202020202020202020202020202020202020202020286
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202}
        NumGlyphs = 2
      end
      object btnCancel: TBitBtn
        Left = 112
        Top = 0
        Width = 97
        Height = 28
        Cancel = True
        Caption = #1042#1110#1076#1084#1110#1085#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ModalResult = 2
        ParentFont = False
        TabOrder = 1
        OnClick = btnCancelClick
        Glyph.Data = {
          3A070000424D3A07000000000000BA0200002800000030000000180000000100
          08000000000080040000C30E0000C30E0000A1000000A100000000000000FFFF
          FF00FF00FF004172FF004475FF004576FF004676FD003365FF003666FF003867
          FF003869FF003865F7003C6DFF003E6DFF003E6FFF00406EFB004471F8001244
          FF001A4BFF001C4CFF001D4DFF001E4EFF001F4FFF002151FF002251FF002252
          FF002352FF002353FF002454FF002656FF002756FF002757FF002758FF002859
          FF00295AFF002A58FC002B5AFF003160FF003361FF00325EF7000030FF000131
          FF000232FF000333FF000939FF000C3CFF000E3DFF000F3EFF001342FF001443
          FF001444FF001544FF001645FF001646FF001745FF001746FF001747FF001847
          FF001848FF001740F1001948FF001949FF001A48FF001B4AFF001B45F5001D4C
          FF001C45F3001F4DFC001E48F300204FFF002047EF002452FF00244DF100274F
          F000284DE7002C56F4002E51E5003356E500002EFF00002FFF00002EFD00002C
          F900002BF800002BF7000028F2000129EF000331FF000431FD000634FF000830
          F0000C30E6000E38F6001238EF00143CF000173EEF00183FF0001840EF001940
          F0001A42F0001A40EF001B42F0001B42EF001F46F1001D40E4002047F1001E41
          E7001E41E5002144E8002A4CE4000027F1000027F0000023E7000023E4000128
          F0000324E5000D2FE5000E30E4000F32E70000009A00C0C0C000BFBFBF00BEBE
          BE00BCBCBC00BBBBBB00B9B9B900B8B8B800B7B7B700B6B6B600B5B5B500B3B3
          B300B2B2B200B1B1B100B0B0B000AFAFAF00AEAEAE00ADADAD00ACACAC00ABAB
          AB00AAAAAA00A9A9A900A8A8A800A7A7A700A6A6A600A5A5A500A4A4A400A3A3
          A300A2A2A200A1A1A100A0A0A0009F9F9F009E9E9E009D9D9D009C9C9C009A9A
          9A009999990097979700969696009292920091919100909090006B6B6B000202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020276760202020202020202020276
          7602020202020202020202A0A002020202020202020202A0A002020202020202
          020276115A760202020202020202765451760202020202020202A08E9BA00202
          020202020202A09B99A002020202020202761234327376020202020202766E28
          285076020202020202A08A8C8D9BA0020202020202A09C979798A00202020202
          02763B1237357476020202027655284E286F76020202020202A0928A8B8C9BA0
          02020202A09C9797979EA00202020202020276611339357576020276532A5629
          70760202020202020202A092898B8C9AA00202A09A9695969FA0020202020202
          0202027663143C3A5C7676524F4E2A727602020202020202020202A092888A8B
          96A0A0999797969DA002020202020202020202027664153F3D5B57294E286D76
          020202020202020202020202A09188898A94969697979CA00202020202020202
          0202020202766516362E2C582B71760202020202020202020202020202A09187
          8B909294959CA0020202020202020202020202020202764038302F2D59760202
          0202020202020202020202020202A08E8B8D8F9199A002020202020202020202
          0202020202027643413E33315D7602020202020202020202020202020202A089
          888A8C8D94A002020202020202020202020202020276231E18451441155E7602
          02020202020202020202020202A08383868788888893A0020202020202020202
          02020202764B25242268661C45165F76020202020202020202020202A0867F81
          828E8E85878792A002020202020202020202027627082607497676461D181760
          7602020202020202020202A0827D7E7E8BA0A08F84868693A002020202020202
          0202760B0C090A4A76020276691F1A1962760202020202020202A0807B7C7C8F
          A00202A09483858691A002020202020202760F030D0E6C760202020276672147
          1B4276020202020202A07B797A7A8FA002020202A0968385858FA00202020202
          02760605044C76020202020202766A22204476020202020202A07877788DA002
          0202020202A09582838EA00202020202020276104D760202020202020202766B
          48760202020202020202A07A8AA00202020202020202A0928CA0020202020202
          020202767602020202020202020202767602020202020202020202A0A0020202
          02020202020202A0A00202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          020202020202020202020202020202020202020202020202020202020202}
        NumGlyphs = 2
      end
    end
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 192
    Top = 48
  end
  object DataSetNad: TpFIBDataSet
    Database = Database
    Transaction = WriteTransaction
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields]
    SelectSQL.Strings = (
      
        'select * from UP_DT_MAN_BONUS_BUFF_MOV_SEL(:ID_SESSION, :ID_ORDE' +
        'R_ITEM, null, 1)')
    Left = 440
    Top = 65535
    poSQLINT64ToBCD = True
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'password=tpfibdataset'
      'user_name=sysdba')
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 40
    Top = 23
  end
  object DataSourceNad: TDataSource
    DataSet = DataSetNad
    Left = 472
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        BorderStyle = bbsNone
        Caption = 'toolbar'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 460
        FloatTop = 253
        FloatClientWidth = 64
        FloatClientHeight = 132
        IsMainMenu = True
        ItemLinks = <
          item
            Item = btnAdd
            Visible = True
          end
          item
            Item = btnEdit
            Visible = True
          end
          item
            Item = btnDelete
            Visible = True
          end>
        MultiLine = True
        Name = 'toolbar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        BorderStyle = bbsNone
        Caption = 'tollbar2'
        DockControl = dxBarDockControl2
        DockedDockControl = dxBarDockControl2
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 391
        FloatTop = 223
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnAdd
            Visible = True
          end
          item
            Item = btnEditBonusSmet
            Visible = True
          end
          item
            Item = btnDelete
            Visible = True
          end>
        Name = 'tollbar1'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 304
    Top = 96
    DockControlHeights = (
      0
      0
      0
      0)
    object btnAdd: TdxBarLargeButton
      Action = ActAdd
      Category = 0
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
    object btnDelete: TdxBarLargeButton
      Action = ActDel
      Category = 0
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFAFAFAF999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E
        999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C
        9E999C9EFF00FFFF00FFFF00FFAFAFAFFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9
        F9F8F7F7F6F5F5F4F3F3F2F1F1F0EFEFEEEDEDECEBEBEAE9E9E8E6E6E4E1E1E0
        DCDCDBD2D2D1CACACA989B9DFF00FFFF00FFFF00FFAFAFAFFEFEFDF7A95FF2A6
        5BEEA259F5A65AF7A759F7A658F7A557F7A555F7A454F7A353F7A351F7A250F7
        A14FF7A14EF79C45ED9239DB8531BDBDBC939698FF00FFFF00FFFF00FFAFAFAF
        FEFEFDEDA35DDBDBDAD0D0CFE9E9E8F5A75AFEFEFDFEFEFDFEFEFDF7A556FEFE
        FDFEFEFDFEFEFDF7A251F8F8F7EBEBEAADB4D70031DEC2C2C196999BFF00FFFF
        00FFFF00FFAFAFAFFAFAF9D89556002EE4A0A09FC1C1C0E29A55FCFCFBFEFEFD
        FEFEFDF7A657FEFEFDFEFEFDFEFEFDED9C4FD8D8D76974B70031DE0426BAD1D1
        D0989B9DFF00FFFF00FFFF00FFAFAFAFF9F9F81B48FB1B48FB002EE49B9B9ABB
        8048E9E9E8FCFCFBFEFEFDF7A659FEFEFDFEFEFDF4F4F3CF8946002EE40532F5
        1B48FBD38A43DFDFDD999C9EFF00FFFF00FFFF00FFAFAFAFFBFBFA1B48FB3E5E
        FF3E5EFF002EE497683ABB8048E29A55F5A75AF7A75AF7A659ED9F54CF8A4800
        2EE40532F51B48FBCF8844ED9C4CE8E8E7999C9EFF00FFFF00FFFF00FFAFAFAF
        FAFAF9F6AB658C9CF61B48FB3E5EFF002EE49B9B9AC1C1C0E8E8E7EDA158EBEB
        EAAAB1D3002EE40532F51B48FBD5D5D4F4F4F3F6A151EBEBEA999C9EFF00FFFF
        00FFFF00FFAFAFAFF8F8F7F8AE66FEFEFDBAC3FA1B48FB3E5EFF002EE49B9B9A
        BCBCBBC6874B6873B60031DE0532F51B48FBD5D5D4F4F4F3FDFDFCF7A352EEEE
        ED999C9EFF00FFFF00FFFF00FFAFAFAFF6F6F5F8AE66FEFEFDFEFEFDFAFAF91B
        48FB3E5EFF002EE49595940031DE0532F51B48FB1B48FBCF8B4BF4F4F3FDFDFC
        FEFEFDF7A453F0F0EF999C9EFF00FFFF00FFFF00FFAFAFAFF4F4F3F8AE66F8AE
        66F8AE66F8AE66F3A9631B48FB3E5EFF1B48FB1B48FB1B48FB1B48FBC48649EA
        9E57F6A659F7A658F7A557F7A555F2F2F1999C9EFF00FFFF00FFFF00FFAFAFAF
        F2F2F1F8AE66FEFEFDFEFEFDFEFEFDEDA662D2D2D11B48FB1B48FB1B48FB1B48
        FB929291BCBCBBE19954FCFCFBFEFEFDFEFEFDF7A557F4F4F3999C9EFF00FFFF
        00FFFF00FFAFAFAFF0F0EFF8AE66FEFEFDFEFEFDF4F4F3D092561B48FB3E5EFF
        1B48FB1B48FB3E5EFF002EE49B9B9ABB8047E9E9E8FCFCFBFEFEFDF7A658F6F6
        F5999C9EFF00FFFF00FFFF00FFAFAFAFEEEEEDF8AE66FEFEFDF4F4F3D5D5D41B
        48FB3E5EFF1B48FB002EE4002EE41B48FB3E5EFF002EE49F6D3EC4C4C3E9E9E8
        FCFCFBF7A759F8F8F7999C9EFF00FFFF00FFFF00FFAFAFAFEBEBEAF8AE66EEA7
        62D092561B48FB3E5EFF1B48FB002EE4D09256EBA460EEA6611B48FB3E5EFF00
        2EE4A87341BE8248E29A55F5A65AFAFAF9999C9EFF00FFFF00FFFF00FFAFAFAF
        E9E9E8EEA762D5D5D41B48FB3E5EFF1B48FB002EE4D5D5D4F4F4F3F7AD66FEFE
        FDFCFCFB8C9CF61B48FB002EE4ADADACC4C4C3E29A55FBFBFA999C9EFF00FFFF
        00FFFF00FFAFAFAFDEDEDED092561B48FB3E5EFF1B48FB002EE4D5D5D4F4F4F3
        FDFDFCF8AE66FEFEFDFEFEFDFEFEFDBAC3FA1B48FB002EE4B4B4B3C7884BECEC
        EB989B9DFF00FFFF00FFFF00FFADADADCCCCCB1B48FB5B7AFF1B48FB002EE4D0
        9256F4F4F3FDFDFCFEFEFDF8AE66FEFEFDFEFEFDFEFEFDF8AD65FAFAF91B48FB
        002EE4CB8C4EDCDCDB939698FF00FFFF00FFFF00FFAEAEAE1B48FB6482FF1B48
        FB002EE4D09256EEA762F7AD66F8AE66F8AE66F8AE66F8AE66F8AE66F8AE66F8
        AD66F8AD65F5AA62F0A65F002EE4EBEBEA96999BFF00FFFF00FFFF00FFAFAFAF
        D9D9D91B48FB002EE4CACACADFDFDEEAEAE9EDEDECEFEFEEF1F1F0F3F3F2F5F5
        F4F7F7F6F9F9F8FBFBFAFDFDFCFEFEFDFEFEFDFDFDFCFBFBFA989B9DFF00FFFF
        00FFFF00FFAFAFAFD8D8D8DADAD9DADAD9DEDEDEE7E7E6E9E9E8EBEBEAEDEDEC
        EFEFEEF1F1F0F3F3F2F5F5F4F7F7F6F9F9F8FBFBFAFDFDFCFEFEFDFEFEFDFEFE
        FD999C9EFF00FFFF00FFFF00FFAFAFAF999C9E999C9E999C9E999C9E999C9E99
        9C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E
        999C9E999C9E999C9E999C9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object btnView: TdxBarLargeButton
      Caption = #1055#1077#1088#1077#1075#1083#1103#1076
      Category = 0
      Hint = #1055#1077#1088#1077#1075#1083#1103#1076
      Visible = ivAlways
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDDBAA9D0B5AACCB0
        A4DCB7A6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0BDAF
        CCC1BDBCB6B6ADA5A5AF9F9AD5B2A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFE0BDAFDCD1D0D1CFD0C9C6C7BFB8BAADA5A5AD9D99D4B4A4FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFE1BFAFE6DCDAE2E2E3DCDADDD0BCB5C7B2ABBFBABBAFA6A7AC
        9D98D5B4A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFE2C1B1EDE5E2EEEFF3E9E9EBD09174C05223C052
        23C28164BFB8BAAFA7A9AD9D99D3B1A3FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFE2C0B0F2EBE9F4F8FBF3F7FBD3906F
        BA400FBA4111BB4112BB4111C17958C0BABAAFA7A9A99A97D3B1A3FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BDADF4EDE9FBFEFFF8
        FEFFD99F82C25627D9906DDD9C7BDD9C7BD9906DC45424C17653BFBABBAFA7A9
        A99A97D3B1A3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BDADF6ED
        E9FEFFFFFEFFFFDEA68BBC4919BC4919DD9D7EFFFFFFFFFFFFDA9776BD4A1ABF
        4918C27B5BBFB8BAB0A9AAAB9C98D3B1A3FF00FFFF00FFFF00FFFF00FFFF00FF
        E1BFAFF8F0EEFFFFFFFFFFFFE0A588BD4A1ABD4B1CBC4716D17F56FFFFFFFFFF
        FFCF784FBC4718BF4E1EBF4A18C17552C0B7B7B0A9AAA99A97CEAFA1FF00FFFF
        00FFFF00FFE1BCACF8EFEBFFFFFFFFFFFFE7B79DC55926C45424C05122BC4716
        D38159FFFFFFFFFFFFD07A52BC4718BF4E1FBF4E1EBF4918C1724EBDB5B5AFA7
        A9A69997CEAFA1FF00FFE0BAA9F4E9E2FFFFFFFFFFFFEECAB0CF703ACB6833C9
        6430C65C2AC04D1CD4825AFFFFFFFFFFFFD07A52BC4718BF4E1FBF4E1FBF4E1E
        BF4717C17857BFB8BAAFA6A5AA9A97D8B5A5E7CABCFFFFFFFFFFFFFEFBF8DC93
        5DD47A41D17740CF703ACC6935C55926D78A63FFFFFFFFFFFFD07A52BC4718BF
        4E1FBF4E1FBF4E1FBF4C1DC05021C6B0A7BFBABBAFA6A5CBAFA4E7C9BCFFFFFF
        FFFFFFFEFBF8E2A069DA894BD8844AD47D44D1763FCB6730DA926AFFFFFFFFFF
        FFD17D54BC4718BF4E1FBF4E1FBF4E1FBD4A1AC05628D1C0BBC9C6C7BDB6B6D3
        B5A9E0BAA9F6E9E3FFFFFFFFFFFFF4DCC2E19A5CDD8F52DA894FD78248D07239
        E1A37BFFFFFFFFFFFFD5875EC04F1DC0501FBF4E1FBD4B1CBD4A1AD4A088DCDD
        E0D1CFD0CFC0BCE0BAA9FF00FFE1BCACF8EFEAFFFFFFFFFFFFF4DCC0E29E5FDE
        9556DA8E51DC8E56EEC6A9F4DECEF4DDCCD78658C75C28C55A28C0501FBD4B1C
        D89F84E9EDF0E2E2E3DCCFCBE0BBABFF00FFFF00FFFF00FFE1BCACF6EBE5FFFF
        FFFFFFFFF7E2CAE6A667E19A5AE0985CDD9055D9884ED58047D0743CCE6E38CA
        6530C65C28E0AF97F2F7FBEDEFF2E5D9D5E0BBABFF00FFFF00FFFF00FFFF00FF
        FF00FFE0BBABF4E9E2FFFFFFFFFFFFF8E5CEE9AC6DE29D5BE3A56DF7E3D3F6DE
        CEDA8C57D1763DCF6F37E7B79DF8FEFFF4F8FBEDE2DEE0BCACFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFE0BBABF4E9E3FFFFFFFFFFFFFAE9D3E9AB67
        EFC99EFFFFFFFFFFFFE7B287D57D3FE9BB9CFEFFFFFBFEFFF0E9E6E1BFAFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BCACF4E7E1FF
        FFFFFFFFFFF8E6CEEFC086F7E0C2F6DABDE3A065EEC7A5FFFFFFFEFFFFF6EDE9
        E2C0B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFE0BAA9F3E5DEFFFFFFFFFFFFFBEDD7F0C48AEBB77AF4D8B8FFFFFFFF
        FFFFF7EEEAE1BFAFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFE0BAA9F3E5DEFFFFFFFFFFFFFFFEFCFEFB
        F8FFFFFFFFFFFFFAF3F0E2C0B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0BAA9F4E7E1
        FFFFFFFFFFFFFFFFFFFFFFFFFAF3F0E3C2B4FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFE0BAA9F2E0D7FEFCFCFFFEFEF7EEEAE3C2B2FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BCABE6C5B7E7C9BCE1BCABFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object btnEdit: TdxBarLargeButton
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080
      Visible = ivNever
      OnClick = btnEditClick
      AutoGrayScale = False
      HotGlyph.Data = {
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
    object btnEditBonusSmet: TdxBarLargeButton
      Action = EditBonusSmet
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080
      AutoGrayScale = False
      LargeGlyph.Data = {
        36110000424D3611000000000000360800002800000018000000180000000100
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
  end
  object SelectTypePost: TpFIBDataSet
    Database = Database
    Transaction = WriteTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM UP_ACCEPT_GET_TYPE_POST(:Id_Post_Salary, :Id_Depar' +
        'tment, :Act_Date)')
    Left = 48
    Top = 415
    poSQLINT64ToBCD = True
    object SelectTypePostID_TYPE_POST: TFIBIntegerField
      FieldName = 'ID_TYPE_POST'
      Visible = False
    end
    object SelectTypePostNAME_TYPE_POST: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072
      FieldName = 'NAME_TYPE_POST'
      Size = 255
      EmptyStrToNull = True
    end
    object SelectTypePostIS_PED_WORK: TSmallintField
      FieldName = 'IS_PED_WORK'
    end
  end
  object WorkReasonSelect: TpFIBDataSet
    Database = Database
    Transaction = WriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Asup_Ini_Work_Reason')
    Left = 80
    Top = 415
    poSQLINT64ToBCD = True
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 112
    Top = 415
  end
  object DataSourceSmet: TDataSource
    DataSet = DataSetSmet
    Left = 376
  end
  object DataSetSmet: TpFIBDataSet
    Database = Database
    Transaction = WriteTransaction
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields]
    SelectSQL.Strings = (
      
        'select * from UP_DT_MAN_SMET_BUFF_MOV_SEL(:ID_SESSION, 1, null, ' +
        ':ID_ORDER_ITEM)')
    Left = 424
    Top = 407
    poSQLINT64ToBCD = True
  end
  object StoredProcSmet: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 408
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TACommit
    TPBMode = tpbDefault
    Left = 240
    Top = 23
  end
  object DSetSmet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    Left = 520
    Top = 415
    poSQLINT64ToBCD = True
  end
  object PostSalarySelect: TpFIBDataSet
    Database = Database
    Transaction = WriteTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM UP_ACCEPT_GET_POST_FROM_SHTAT(:Id_Department, :Act' +
        '_Date)')
    Left = 16
    Top = 415
    poSQLINT64ToBCD = True
    object PostSalarySelectID_POST_SALARY: TFIBBCDField
      FieldName = 'ID_POST_SALARY'
      Visible = False
      Size = 0
      RoundByScale = True
    end
    object PostSalarySelectID_POST_SALARY_I: TFIBIntegerField
      FieldName = 'ID_POST_SALARY_I'
      Visible = False
    end
    object PostSalarySelectPOST_NAME: TFIBStringField
      DisplayLabel = #1055#1086#1089#1072#1076#1072
      DisplayWidth = 100
      FieldName = 'POST_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object PostSalarySelectSALARY_MIN: TFIBFloatField
      DisplayLabel = #1042#1110#1076
      DisplayWidth = 80
      FieldName = 'SALARY_MIN'
      Visible = False
    end
    object PostSalarySelectNUM_DIGIT: TFIBIntegerField
      DisplayLabel = #1056'-'#1076
      DisplayWidth = 15
      FieldName = 'NUM_DIGIT'
    end
    object PostSalarySelectDISPLAY_NAME: TFIBStringField
      FieldName = 'DISPLAY_NAME'
      Visible = False
      Size = 255
      EmptyStrToNull = True
    end
    object PostSalarySelectNAME_TYPE_POST: TFIBStringField
      DisplayLabel = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
      DisplayWidth = 70
      FieldName = 'NAME_TYPE_POST'
      Size = 50
      EmptyStrToNull = True
    end
    object PostSalarySelectSalary_Max_Str: TStringField
      DisplayLabel = #1057#1091#1084#1072
      DisplayWidth = 30
      FieldName = 'Salary_Max_Str'
    end
    object PostSalarySelectSALARY_MAX: TFIBFloatField
      DisplayLabel = #1057#1091#1084#1072
      DisplayWidth = 20
      FieldName = 'SALARY_MAX'
      Visible = False
    end
    object PostSalarySelectADD_NAME: TFIBStringField
      FieldName = 'ADD_NAME'
      Visible = False
      Size = 255
      EmptyStrToNull = True
    end
    object PostSalarySelectSMETA_FULL_TITLE: TFIBStringField
      DisplayLabel = #1041#1102#1076#1078#1077#1090
      DisplayWidth = 50
      FieldName = 'SMETA_FULL_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
    object PostSalarySelectId_Work_Mode: TIntegerField
      FieldName = 'Id_Work_Mode'
      Visible = False
    end
    object PostSalarySelectWork_Mode_Shift: TIntegerField
      FieldName = 'Count_Day'
      Visible = False
    end
  end
  object ShRDataSource: TDataSource
    DataSet = DSetIdShR
    Left = 128
    Top = 160
  end
  object ActionList1: TActionList
    Left = 240
    Top = 101
    object Act_Find_Id_ShR: TAction
      Caption = 'Act_Find_Id_ShR'
      OnExecute = Act_Find_Id_ShRExecute
    end
    object EditBonusSmet: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ShortCut = 113
      OnExecute = EditBonusSmetExecute
    end
    object ActAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      ShortCut = 45
      OnExecute = ActAddExecute
    end
    object ActDel: TAction
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080
      OnExecute = ActDelExecute
    end
  end
  object InsertShR: TpFIBStoredProc
    Database = Database
    Transaction = trShr
    Left = 72
    Top = 23
  end
  object SmetShR: TpFIBDataSet
    Database = Database
    Transaction = trShr
    Left = 496
    Top = 415
    poSQLINT64ToBCD = True
  end
  object DSetIdShR: TpFIBDataSet
    Database = Database
    Transaction = trShr
    Left = 80
    Top = 143
    poSQLINT64ToBCD = True
  end
  object AcceptSet: TpFIBDataSet
    Database = Database
    Transaction = WriteTransaction
    Left = 384
    Top = 417
    poSQLINT64ToBCD = True
  end
  object StyleRepository: TcxStyleRepository
    Left = 152
    Top = 216
    object stBackground: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object stContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentOdd: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stFilterBox: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object stFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stGroup: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object stGroupByBox: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object stHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stInactive: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object stIncSearch: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object stIndicator: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object stPreview: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stHotTrack: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clMaroon
    end
    object qizzStyle: TcxGridTableViewStyleSheet
      Styles.Background = stBackground
      Styles.Content = stContent
      Styles.ContentEven = stContentEven
      Styles.ContentOdd = stContentOdd
      Styles.Inactive = stInactive
      Styles.IncSearch = stIncSearch
      Styles.Selection = stSelection
      Styles.FilterBox = stFilterBox
      Styles.Footer = stFooter
      Styles.Group = stGroup
      Styles.GroupByBox = stGroupByBox
      Styles.Header = stHeader
      Styles.Indicator = stIndicator
      Styles.Preview = stPreview
      BuiltIn = True
    end
  end
  object WMByPeriodSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    Left = 416
    Top = 280
    poSQLINT64ToBCD = True
  end
  object GetWorkMode: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 272
    Top = 24
    poSQLINT64ToBCD = True
  end
  object UpdBonusSmet: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 120
    Top = 311
  end
  object trShr: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 112
    Top = 23
  end
  object IdShrSelect: TpFIBDataSet
    Database = Database
    Transaction = trShr
    Left = 456
    Top = 407
    poSQLINT64ToBCD = True
  end
end
