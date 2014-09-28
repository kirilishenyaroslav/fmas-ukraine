object UP_AcceptForm: TUP_AcceptForm
  Left = 342
  Top = 179
  AutoSize = True
  BorderStyle = bsDialog
  ClientHeight = 396
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 642
    Height = 355
    ActivePage = TsWorkMode
    Align = alClient
    TabOrder = 0
    object TS_Main: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
      OnMouseDown = TS_MainMouseDown
      object DateEndCheck: TqFLogicCheck
        Left = 368
        Top = 56
        Width = 36
        Height = 20
        OnCheck = DateEndCheckCheck
        LightControl = DateEnd
      end
      object qFSimpleCheck1: TqFSimpleCheck
        Left = DateBeg
        Top = 40
        Width = 36
        Height = 21
        Right = DateEnd
      end
      object AcceptAbsentCheck: TqFLogicCheck
        Left = 464
        Top = 64
        Width = 36
        Height = 21
        OnCheck = AcceptAbsentCheckCheck
      end
      object Count_month_check: TqFLogicCheck
        Left = 416
        Top = 56
        Width = 36
        Height = 21
        OnCheck = Count_month_checkCheck
      end
      object qFSC_FIO: TqFSpravControl
        Left = 8
        Top = 8
        Width = 609
        Height = 21
        FieldName = 'id_pcard'
        DisplayName = #1055#1030#1055'/'#1073
        Interval = 60
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 0
        AutoSaveToRegistry = True
        OnOpenSprav = qFSC_FIOOpenSprav
        DisplayText = ''
        DisplayTextField = 'FIO'
        OnKeyDown = qFSC_FIOKeyDown
      end
      object DateBeg: TqFDateControl
        Left = 13
        Top = 40
        Width = 139
        Height = 21
        FieldName = 'date_beg'
        DisplayName = #1047
        Interval = 40
        Value = 0
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        OnChange = DateBegChange
        Blocked = False
        TabOrder = 1
        AutoSaveToRegistry = True
        CheckDateIsEmpty = False
      end
      object DateEnd: TqFDateControl
        Left = 180
        Top = 40
        Width = 143
        Height = 21
        FieldName = 'Date_End'
        DisplayName = #1055#1086
        Interval = 44
        Value = 0
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        OnChange = DateEndChange
        Blocked = False
        TabOrder = 2
        AutoSaveToRegistry = True
        CheckDateIsEmpty = False
      end
      object qFSC_Department: TqFSpravControl
        Left = 8
        Top = 139
        Width = 609
        Height = 21
        FieldName = 'id_department'
        DisplayName = #1055#1110#1076#1088#1086#1079#1076#1110#1083
        Interval = 140
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 14
        AutoSaveToRegistry = True
        OnOpenSprav = qFSC_DepartmentOpenSprav
        DisplayText = ''
        DisplayTextField = 'Department_Name'
      end
      object qFSC_Post: TqFSpravControl
        Left = 8
        Top = 171
        Width = 609
        Height = 21
        FieldName = 'id_post_salary'
        DisplayName = #1055#1088#1080#1081#1085#1103#1090' '#1085#1072' '#1087#1086#1089#1072#1076#1091
        Interval = 140
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        OnChange = qFSC_PostChange
        Blocked = False
        TabOrder = 15
        AutoSaveToRegistry = False
        OnOpenSprav = qFSC_PostOpenSprav
        DisplayText = ''
        DisplayTextField = 'Post_Name'
      end
      object qFSC_WReason: TqFSpravControl
        Left = 8
        Top = 267
        Width = 609
        Height = 21
        FieldName = 'ID_WORK_REASON'
        DisplayName = #1055#1110#1076#1089#1090#1072#1074#1072' '#1088#1086#1073#1086#1090#1080
        Interval = 140
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        OnChange = qFSC_WReasonChange
        Blocked = False
        TabOrder = 18
        AutoSaveToRegistry = True
        OnOpenSprav = qFSC_WReasonOpenSprav
        DisplayText = ''
        DisplayTextField = 'Name_Work_Reason'
      end
      object qFSC_PostFact: TqFSpravControl
        Left = 8
        Top = 203
        Width = 609
        Height = 21
        FieldName = 'id_post_salary_real'
        DisplayName = #1060#1072#1082#1090#1080#1095#1085#1072' '#1087#1086#1089#1072#1076#1072
        Interval = 140
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        OnChange = qFSC_PostFactChange
        Blocked = False
        TabOrder = 16
        AutoSaveToRegistry = False
        OnOpenSprav = qFSC_PostFactOpenSprav
        DisplayText = ''
        DisplayTextField = 'Real_Post_Name'
      end
      object UnLimit: TqFBoolControl
        Left = 348
        Top = 39
        Width = 97
        Height = 21
        DisplayName = #1041#1077#1079#1089#1090#1088#1086#1082#1086#1074#1086
        Interval = 120
        Value = True
        LabelColor = clGreen
        Required = True
        Semicolon = False
        Asterisk = False
        Enabled = True
        OnChange = UnLimitChange
        Default = 'True'
        Blocked = False
        TabOrder = 3
        AutoSaveToRegistry = True
        StoreAs = StoreAs01
      end
      object qFSC_TypePost: TqFSpravControl
        Left = 8
        Top = 235
        Width = 609
        Height = 21
        FieldName = 'id_type_post'
        DisplayName = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
        Interval = 140
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        OnChange = qFSC_TypePostChange
        Blocked = False
        TabOrder = 17
        AutoSaveToRegistry = False
        OnOpenSprav = qFSC_TypePostOpenSprav
        DisplayText = ''
        DisplayTextField = 'Name_Type_Post'
      end
      object Reason: TqFCharControl
        Left = 152
        Top = 299
        Width = 465
        Height = 21
        FieldName = 'Reason'
        DisplayName = #1055#1110#1076#1089#1090#1072#1074#1072
        Interval = 105
        Value = ''
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 20
        AutoSaveToRegistry = True
        MaxLength = 0
      end
      object qFBC_IsPostMain: TqFBoolControl
        Left = 8
        Top = 299
        Width = 121
        Height = 21
        FieldName = 'IS_POST_MAIN'
        DisplayName = #1054#1089#1085#1086#1074#1085#1072' '#1087#1086#1089#1072#1076#1072
        Interval = 120
        Value = True
        LabelColor = clGreen
        Required = True
        Semicolon = False
        Asterisk = False
        Enabled = True
        Default = '1'
        Blocked = False
        TabOrder = 19
        AutoSaveToRegistry = True
        StoreAs = StoreAs01
      end
      object Absent: TqFSpravControl
        Left = 4
        Top = 107
        Width = 613
        Height = 21
        FieldName = 'Id_Pcard_Away'
        DisplayName = #1053#1072' '#1095#1072#1089' '#1074#1110#1076#1089#1091#1090#1085#1100#1086#1075#1086' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072'?'
        Interval = 210
        Value = Null
        LabelColor = clGreen
        Required = False
        Semicolon = False
        Asterisk = False
        Enabled = True
        OnChange = AbsentChange
        Blocked = False
        TabOrder = 13
        AutoSaveToRegistry = False
        OnOpenSprav = AbsentOpenSprav
        DisplayText = ''
        DisplayTextField = 'Away_Info'
      end
      object Id_Type_Away: TqFInvisControl
        Left = 220
        Top = 62
        Width = 81
        Height = 17
        FieldName = 'Id_Type_Away'
        DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
        Interval = 120
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 21
        AutoSaveToRegistry = False
      end
      object Id_Key: TqFInvisControl
        Left = 312
        Top = 64
        Width = 41
        Height = 17
        FieldName = 'Id_Key'
        DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
        Interval = 120
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 22
        AutoSaveToRegistry = False
      end
      object Absent_Date_Beg: TqFInvisControl
        Left = 0
        Top = 65
        Width = 97
        Height = 21
        FieldName = 'Absent_Date_Beg'
        DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
        Interval = 120
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 23
        AutoSaveToRegistry = False
      end
      object Absent_Date_End: TqFInvisControl
        Left = 104
        Top = 64
        Width = 97
        Height = 21
        FieldName = 'Absent_Date_End'
        DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
        Interval = 120
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 24
        AutoSaveToRegistry = False
      end
      object IdShrEdit: TcxTextEdit
        Left = 127
        Top = 74
        Width = 84
        Height = 21
        Style.Color = 16114144
        Style.LookAndFeel.Kind = lfFlat
        TabOrder = 5
        OnKeyPress = IdShrEditKeyPress
      end
      object lblIdShr: TcxLabel
        Left = 8
        Top = 74
        Width = 115
        Height = 17
        ParentFont = False
        Properties.ShadowedColor = clBtnFace
        Properties.Transparent = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 4
        Caption = #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1090#1086#1088' '#1064#1056
      end
      object lblRateCnt: TcxLabel
        Left = 221
        Top = 76
        Width = 51
        Height = 17
        ParentFont = False
        Properties.ShadowedColor = clBtnFace
        Properties.Transparent = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 6
        Caption = #1057#1090#1072#1074#1082#1080
      end
      object btnSearchShr: TcxButton
        Left = 486
        Top = 74
        Width = 75
        Height = 21
        Caption = #1064#1091#1082#1072#1090#1080
        TabOrder = 10
        OnClick = btnSearchShrClick
        LookAndFeel.Kind = lfUltraFlat
      end
      object RateCntEdit: TcxCurrencyEdit
        Left = 272
        Top = 75
        Width = 69
        Height = 21
        Properties.DecimalPlaces = 5
        Properties.DisplayFormat = ',0.00000;-,0.00000'
        Properties.OnChange = RateCntEditPropertiesChange
        Properties.OnEditValueChanged = RateCntEditPropertiesEditValueChanged
        Style.Color = 16114144
        Style.LookAndFeel.Kind = lfFlat
        TabOrder = 7
      end
      object btnShowShrGrid: TcxButton
        Left = 573
        Top = 74
        Width = 41
        Height = 21
        Caption = '<<'
        TabOrder = 11
        OnClick = btnShowShrGridClick
        LookAndFeel.Kind = lfUltraFlat
      end
      object pnlIdShrGrid: TPanel
        Left = 8
        Top = 104
        Width = 607
        Height = 89
        TabOrder = 12
        Visible = False
        object pnlbtn: TPanel
          Left = 1
          Top = 1
          Width = 605
          Height = 18
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object btnAddIdShr: TcxButton
            Left = 0
            Top = 0
            Width = 40
            Height = 16
            Hint = #1044#1086#1076#1072#1090#1080
            Caption = '+'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = btnAddIdShrClick
          end
          object btnDelIdShr: TcxButton
            Left = 45
            Top = 0
            Width = 40
            Height = 16
            Hint = #1042#1080#1076#1072#1083#1080#1090#1080
            Caption = '-'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnDelIdShrClick
          end
        end
        object ShrGrid: TcxGrid
          Left = 1
          Top = 19
          Width = 605
          Height = 69
          Align = alClient
          TabOrder = 1
          object ShrGridDBView: TcxGridDBTableView
            OnKeyDown = ShrGridDBViewKeyDown
            DataController.DataSource = ShrDataSource
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            Styles.StyleSheet = qizzStyle
            object ShrGridDBViewDBColumn1: TcxGridDBColumn
              Caption = #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1090#1086#1088' '#1064#1056
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              SortOrder = soAscending
              DataBinding.FieldName = 'ID_SH_R'
            end
            object ShrGridDBViewDBColumn2: TcxGridDBColumn
              Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1089#1090#1072#1074#1086#1082
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 5
              Properties.DisplayFormat = ',0.00000;-,0.00000'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              DataBinding.FieldName = 'RATE_COUNT'
            end
            object ShrGridDBViewDBColumn3: TcxGridDBColumn
              Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1075#1086#1076#1080#1085
              Visible = False
              Options.Filtering = False
              DataBinding.FieldName = 'HOURS_COUNT'
            end
          end
          object ShrGridLevel: TcxGridLevel
            GridView = ShrGridDBView
          end
        end
      end
      object lblMonthCnt: TcxLabel
        Left = 461
        Top = 41
        Width = 111
        Height = 17
        ParentFont = False
        Properties.ShadowedColor = clBtnFace
        Properties.Transparent = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 25
        Visible = False
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1084#1110#1089#1103#1094#1110#1074
      end
      object month_hours_count: TqFInvisControl
        Left = 528
        Top = 56
        Width = 97
        Height = 17
        FieldName = 'month_hours_count'
        DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
        Interval = 120
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 26
        AutoSaveToRegistry = False
      end
      object HoursCntEdit: TcxCurrencyEdit
        Left = 406
        Top = 75
        Width = 68
        Height = 21
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.OnChange = HoursCntEditPropertiesChange
        Properties.OnEditValueChanged = HoursCntEditPropertiesEditValueChanged
        Style.Color = 16114144
        Style.LookAndFeel.Kind = lfFlat
        TabOrder = 9
      end
      object lblHoursCnt: TcxLabel
        Left = 354
        Top = 76
        Width = 51
        Height = 17
        ParentFont = False
        Properties.ShadowedColor = clBtnFace
        Properties.Transparent = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 8
        Caption = #1043#1086#1076#1080#1085#1080
      end
      object Month_Count: TcxMaskEdit
        Left = 573
        Top = 40
        Width = 41
        Height = 21
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d+'
        Properties.MaxLength = 0
        Properties.OnChange = Month_CountPropertiesChange
        Properties.OnEditValueChanged = Month_CountPropertiesEditValueChanged
        Style.BorderStyle = ebsFlat
        Style.Color = 16114144
        TabOrder = 27
        Text = '0'
        Visible = False
      end
    end
    object TS_Additional: TTabSheet
      Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1086
      ImageIndex = 1
      object qFSC_WCond: TqFSpravControl
        Left = 8
        Top = 16
        Width = 465
        Height = 21
        FieldName = 'ID_WORK_CONDITION'
        DisplayName = #1059#1084#1086#1074#1080' '#1087#1088#1072#1094#1110
        Interval = 105
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        OnChange = qFSC_WCondChange
        Blocked = False
        TabOrder = 0
        AutoSaveToRegistry = True
        OnOpenSprav = qFSC_WCondOpenSprav
        DisplayText = ''
        DisplayTextField = 'Name_Work_Cond'
      end
      object qFSC_PayForm: TqFSpravControl
        Left = 8
        Top = 56
        Width = 465
        Height = 21
        FieldName = 'ID_PAY_FORM'
        DisplayName = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1080
        Interval = 105
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        OnChange = qFSC_PayFormChange
        Blocked = False
        TabOrder = 1
        AutoSaveToRegistry = True
        OnOpenSprav = qFSC_PayFormOpenSprav
        DisplayText = ''
        DisplayTextField = 'Name_Pay_Form'
      end
      object qFCC_Note: TqFCharControl
        Left = 8
        Top = 96
        Width = 465
        Height = 21
        FieldName = 'note'
        DisplayName = #1055#1088#1080#1084#1110#1090#1082#1072
        Interval = 105
        Value = ''
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 2
        AutoSaveToRegistry = False
        MaxLength = 0
      end
      object qFIC_TestT: TqFIntControl
        Left = 8
        Top = 240
        Width = 209
        Height = 21
        FieldName = 'TRIAL_TERM'
        DisplayName = #1042#1080#1087#1088#1086#1073#1085#1080#1081' '#1090#1077#1088#1084#1110#1085
        Interval = 150
        Value = Null
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 4
        AutoSaveToRegistry = False
        MaxLength = 10
        NegativeAllowed = False
        ZeroAllowed = False
      end
      object qFIC_StajT: TqFIntControl
        Left = 272
        Top = 240
        Width = 209
        Height = 21
        FieldName = 'TRAINING_TERM'
        DisplayName = #1057#1090#1088#1086#1082' '#1089#1090#1072#1078#1091#1074#1072#1085#1085#1103
        Interval = 150
        Value = Null
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 5
        AutoSaveToRegistry = False
        MaxLength = 10
        NegativeAllowed = False
        ZeroAllowed = False
      end
      object cxGroupBox1: TcxGroupBox
        Left = 8
        Top = 136
        Width = 481
        Height = 89
        Alignment = alTopLeft
        Caption = #1059#1084#1086#1074#1080' '#1074#1089#1090#1091#1087#1091' '#1085#1072' '#1087#1086#1089#1072#1076#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object qFSC_Acception: TqFSpravControl
          Left = 8
          Top = 28
          Width = 465
          Height = 21
          FieldName = 'id_accept_cond'
          DisplayName = #1059#1084#1086#1074#1072
          Interval = 110
          Value = Null
          LabelColor = clGreen
          Required = False
          Semicolon = True
          Asterisk = True
          Enabled = True
          Blocked = False
          TabOrder = 0
          AutoSaveToRegistry = False
          OnOpenSprav = qFSC_AcceptionOpenSprav
          DisplayText = ''
          DisplayTextField = 'Name_Accept_Cond'
        end
        object qFDC_AccEnd: TqFDateControl
          Left = 260
          Top = 60
          Width = 210
          Height = 21
          FieldName = 'accept_end'
          DisplayName = #1050#1110#1085#1077#1094#1100' '#1086#1073#1088#1072#1085#1085#1103
          Interval = 115
          Value = 0
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = False
          Enabled = True
          Blocked = False
          TabOrder = 2
          AutoSaveToRegistry = False
          CheckDateIsEmpty = False
        end
        object qFDC_AccBeg: TqFDateControl
          Left = 8
          Top = 60
          Width = 210
          Height = 21
          FieldName = 'accept_beg'
          DisplayName = #1055#1086#1095#1072#1090#1086#1082' '#1086#1073#1088#1072#1085#1085#1103
          Interval = 115
          Value = 0
          LabelColor = clGreen
          Required = True
          Semicolon = True
          Asterisk = False
          Enabled = True
          Blocked = False
          TabOrder = 1
          AutoSaveToRegistry = False
          CheckDateIsEmpty = False
        end
      end
      object qFEC_IsTarif: TqFEnumControl
        Left = 8
        Top = 272
        Width = 193
        Height = 21
        FieldName = 'IS_TARIF'
        DisplayName = #1054#1087#1083#1072#1090#1072
        Interval = 80
        Value = 0
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Default = '0'
        Blocked = False
        TabOrder = 6
        AutoSaveToRegistry = True
        Items.Strings = (
          #1054#1082#1083#1072#1076
          #1058#1072#1088#1080#1092)
        ValuesString = '0,1'
      end
      object qFBC_Bonuses: TqFBoolControl
        Left = 264
        Top = 272
        Width = 217
        Height = 21
        DisplayName = #1044#1086#1076#1072#1074#1072#1090#1080' '#1085#1072#1076#1073#1072#1074#1082#1080'/'#1076#1086#1087#1083#1072#1090#1080
        Interval = 120
        Value = True
        LabelColor = clGreen
        Required = True
        Semicolon = False
        Asterisk = False
        Enabled = True
        Default = 'True'
        Blocked = False
        TabOrder = 7
        AutoSaveToRegistry = False
        StoreAs = StoreAs01
      end
    end
    object TS_FinSources: TTabSheet
      Caption = #1060#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      ImageIndex = 2
      object cxG_OrdAcc: TcxGrid
        Left = 0
        Top = 53
        Width = 634
        Height = 274
        Align = alClient
        TabOrder = 0
        object FinView: TcxGridDBTableView
          OnKeyUp = FinViewKeyUp
          DataController.DataSource = DS_Smets
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.StyleSheet = qizzStyle
          object FinViewSMETA_NAME: TcxGridDBColumn
            Width = 189
            DataBinding.FieldName = 'SMETA_NAME'
          end
          object FinViewHoursCount: TcxGridDBColumn
            Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1075#1086#1076#1080#1085
            Visible = False
            DataBinding.FieldName = 'HOURS_COUNT'
          end
          object FinViewRATE_COUNT: TcxGridDBColumn
            Width = 68
            DataBinding.FieldName = 'RATE_COUNT'
          end
          object FinViewOKLAD_BASE: TcxGridDBColumn
            Width = 63
            DataBinding.FieldName = 'OKLAD_BASE'
          end
          object FinViewKOEFF_PPS: TcxGridDBColumn
            Width = 58
            DataBinding.FieldName = 'KOEFF_PPS'
          end
          object FinViewSMETA_PPS_NAME: TcxGridDBColumn
            Width = 126
            DataBinding.FieldName = 'SMETA_PPS_NAME'
          end
          object FinViewOKLAD_PPS: TcxGridDBColumn
            Width = 62
            DataBinding.FieldName = 'OKLAD_PPS'
          end
          object FinViewDATES_STR: TcxGridDBColumn
            Visible = False
            GroupIndex = 0
            SortOrder = soAscending
            DataBinding.FieldName = 'DATES_STR'
          end
        end
        object cxG_OrdAccLevel1: TcxGridLevel
          GridView = FinView
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 634
        Height = 53
        Align = alTop
        TabOrder = 1
        DesignSize = (
          634
          53)
        object SpeedButton2: TSpeedButton
          Left = 0
          Top = 2
          Width = 57
          Height = 50
          Action = A_Add
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFF9966669966669966669966669966669966669966669966669966669966
            66996666996666996666996666996666996666996666FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF969696999999999999999999999999999999999999999999999999
            999999999999999999999999999999999999999999999999FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF996666F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6FFCC99FF
            CC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC66996666FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF969696DDDDDDDDDDDDD7D7D7D7D7D7CCCCCCCCCCCCCCCC
            CCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF996666F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6
            FFCC99FFCC99FFCC99FFCC66FFCC66FFCC66FFCC66FFCC66CCCC66996666FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF969696DDDDDDDDDDDDDDDDDDD7D7D7D7D7D7CC
            CCCCCCCCCCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0969696
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666FFCCCCFFECCCF0CAA6F0CAA6F0CA
            A6F0CAA6F0CAA6FFCC99FFCC99FFCC99FFCC66FFCC66FFCC66FFCC66CCCC6699
            6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3DDDDDDDDDDDDDDDDDD
            D7D7D7D7D7D7CCCCCCCCCCCCCCCCCCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCCF0CAA6F0
            CAA6F0CAA6F0CAA6F0CAA6F0CAA6FFCC99FFCC99FFCC99FFCC66FFCC66FFCC66
            CCCC66996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3E3E3E3DDDD
            DDDDDDDDDDDDDDD7D7D7D7D7D7CCCCCCCCCCCCCCCCCCC0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCC
            FFECCCF0CAA6F0CAA6F0CAA6CCCC99CCCC99CCCC99CCCC99CCCC99FFCC99FFCC
            66FFCC66CCCC66996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3E3
            E3E3E3E3E3DDDDDDDDDDDDD7D7D7C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666EAEA
            EAFFECCCFFECCCFFECCCFFECCC003300003300003300003300999966CCCC99FF
            CC99FFCC99FFCC66CCCC66996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696
            EAEAEAEAEAEAE3E3E3E3E3E3E3E3E3868686868686868686868686969696C0C0
            C0CCCCCCC0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            6666EAEAEAFFECCCFFECCCF0CAA6F0CAA6003300009900009900003300999966
            CC9999CCCC99CCCC99FFCC99CCCC66996666FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF999999EAEAEAEAEAEAE3E3E3D7D7D7CCCCCC868686B2B2B2A4A0A086868696
            9696B2B2B2C0C0C0C0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF996666F1F1F1F1F1F1D7D7D7B2B2B2A4A0A00033000099330099000033
            00999966999966999966CCCC99FFCC99CCCC99996666FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF999999F1F1F1F1F1F1DDDDDDB2B2B2A4A0A0868686B2B2B2B2B2B2
            868686868686868686969696C0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF996666F8F8F8F1F1F100330000330000330000330000993300
            9933003300003300003300003300CCCC99FFCC99FFCC99996666FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF999999F1F1F1F1F1F1868686868686868686868686B2B2
            B2B2B2B2868686868686868686868686C0C0C0CCCCCCC0C0C0969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF996666F8F8F8F8F8F800330033CC3333CC3333CC33
            33CC33009933009933009933009900003300CCCC99F0CAA6FFCC99996666FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFF868686CCCCCCCCCCCCC0
            C0C0C0C0C0C0C0C0B2B2B2B2B2B2B2B2B2868686C0C0C0CCCCCCCCCCCC999999
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC6666F8F8F8FFFFFF00330033CC6633CC
            3333CC3333CC3333CC3300CC33009933009933003300CCCC99F0CAA6F0CAA699
            6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFF868686D7D7D7
            D7D7D7CCCCCCCCCCCCC0C0C0C0C0C0C0C0C0B2B2B2868686C0C0C0D7D7D7CCCC
            CC999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFF00330000
            330000330000330033CC3333CC33003300003300003300003300F0CAA6F0CAA6
            F0CAA6996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFF8686
            86868686868686868686D7D7D7CCCCCC868686868686868686868686D7D7D7D7
            D7D7CCCCCC999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFF
            FFFFFFFFFFFFF8F8F800330033CC6633CC66003300A4A0A0F0CAA6FFECCCF0CA
            A6F0CAA6CCCC99996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF868686DDDDDDD7D7D7868686A4A0A0CCCCCCE3E3E3
            DDDDDDD7D7D7C0C0C0868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8
            F8FFFFFFFFFFFFFFFFFFFFFFFF00330033CC6633CC66003300B2B2B2F0CAA6FF
            ECCCF0CAA6CCCC99999966996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686DDDDDDDDDDDD868686B2B2B2D7D7
            D7E3E3E3D7D7D7C0C0C0A4A0A0868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC
            9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFF003300003300003300003300D7D7D7
            FFECCCFFECCCB2B2B2999999969696996666FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686868686DD
            DDDDE3E3E3EAEAEAC0C0C0B2B2B2B2B2B2868686FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F1F1
            F1F1F1F1FFCCCC996666996666996666996666996666FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F1F1F1F1F1F1DDDDDD969696969696969696969696969696FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF8F8F8CBCBCB996666FF9966FF9933996666FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFDDDDDD969696B2B2B2A4A0A0999999FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFCCCCCC996666FF9966996666FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDD969696B2B2B2999999FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7996666996666FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3969696999999FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F0CAA6F0CAA6F0CAA6F0
            CAA6F0CAA6F0CAA6F0CAA6F0CAA6C0C0C0C0C0C0CC9999996666FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2B2B2B2B2B2B2B2B2
            B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object SpeedButton3: TSpeedButton
          Left = 57
          Top = 2
          Width = 65
          Height = 50
          Action = A_Modif
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9966
            6699666699666699666699666699666699666699666699666699666699666699
            6666996666996666996666996666996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            9696969999999999999999999999999999999999999999999999999999999999
            99999999999999999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF996666F0CAA6FFECCCF0CAA6F0CAA6F0CAA6CCCC99CCCC99CCCC99CCCC99
            CCCC66FFCC66FFCC66FFCC66FFCC66FFCC66996666FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF969696DDDDDDE3E3E3DDDDDDD7D7D7CCCCCCC0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF996666FFCCCCFFECCCF0CAA6F0CAA6CC9999CC9966CC9966CC99
            66CCCC66CCCC66CCCC66CCCC66FFCC66FFCC66FFCC66996666FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF969696E3E3E3E3E3E3DDDDDDD7D7D7C0C0C0C0C0C0B2B2B2
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0969696FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCCFFECCCF0CAA639393999666699
            9966999966CC9966CC9966CC9966CCCC66CCCC66CCCC66FFCC66996666FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3E3E3E3DDDDDDD7D7D78686868686
            86999999A4A0A0B2B2B2B2B2B2B2B2B2C0C0C0C0C0C0C0C0C0C0C0C0969696FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCCFFECCCF0CAA61C1C1C
            292929424242996666996666999966CC9966CC9966CCCC66CCCC66CCCC669966
            66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3EAEAEAE3E3E3DDDDDD66
            6666666666868686868686868686969696A4A0A0B2B2B2C0C0C0C0C0C0C0C0C0
            969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666EAEAEAFFECCCFFECCCFFEC
            CC393939006699006699336666393939393939666633666633996666CC9966CC
            9966996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696EAEAEAF1F1F1EAEAEA
            E3E3E3808080868686868686868686808080666666777777808080969696A4A0
            A0B2B2B2969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666EAEAEAF1F1F1FF
            ECCCFFECCC808080006699336666996666996666996666663333555555666633
            996666999966996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999EAEAEAF1F1
            F1EAEAEAEAEAEAB2B2B2868686666666969696A4A0A096969666666666666680
            8080868686999999969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666F1F1F1
            F1F1F1F1F1F1EAEAEAFFECCC003366996666CC9999CC66669966669966666633
            33666633666633996633996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999F1
            F1F1F1F1F1F1F1F1EAEAEAE3E3E3555555868686C0C0C0B2B2B2A4A0A0969696
            666666666666777777868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9966
            66F8F8F8F8F8F8F1F1F1F1F1F1FFECCC336666996666CC9999CC9999CC666699
            6666996666663333666633666633666633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            999999F1F1F1FFFFFFF1F1F1F1F1F1EAEAEA868686999999CCCCCCC0C0C0B2B2
            B2A4A0A0868686666666666666666666777777FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF996666F8F8F8FFFFFFF8F8F8F1F1F1FFECCCFFECCC5F5F5FCC9999CC9999
            CC9999CC6666996666996666663333663333663333FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFA4A0A0FFFFFFFFFFFFFFFFFFF1F1F1EAEAEAEAEAEA808080D7D7D7CC
            CCCCC0C0C0B2B2B2A4A0A0868686666666666666666666FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFCC6666F8F8F8FFFFFFFFFFFFF8F8F8F1F1F1FFECCCF0CAA65F5F
            5FCC9999CC9999CC9999CC6666996666996666663333663333FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1EAEAEADDDDDD
            808080CCCCCCCCCCCCC0C0C0B2B2B2A4A0A0868686666666666666FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFF1F1F1F1F1F1FF
            ECCCF0CAA6663333CC9999CC9999CC9999CC6666996666996666663333FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1F1
            F1EAEAEADDDDDD777777CCCCCCCCCCCCC0C0C0B2B2B2A4A0A08686865F5F5FFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFF8F8F8
            F1F1F1F1F1F1FFECCCCC9999663333CC9999CC9999CC9999CC66669966666633
            33FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF1F1F1F1F1F1EAEAEAC0C0C0777777CCCCCCCCCCCCC0C0C0B2B2B2999999
            666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFF
            FFFFFFFFF8F8F8F1F1F1F1F1F1FFECCCCC9999663333CC9999CC9999CC9999CC
            6666996666663333FFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF1F1F1F1F1F1EAEAEAC0C0C0777777CCCCCCCCCCCCC0C0
            C0B2B2B2868686777777FFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFF8F8F8F1F1F1F1F1F1FFECCCCC9999996666F0CAA6
            CC9999CC99999933334D4D4D424242FFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1F1F1EAEAEAC0C0C0969696D7
            D7D7CCCCCCC0C0C0868686777777666666FFFFFFFFFFFFFFFFFFCC9966F8F8F8
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F1F1F1F1F1F1FFCCCC9966
            33996666F0CAA6CC99990099CC0099FF0099CC0099CCFFFFFFFFFFFFB2B2B2FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1F1F1DDDDDD
            868686969696D7D7D7C0C0C0808080868686868686777777FFFFFFFFFFFFCC99
            66F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8CB
            CBCB996666FFCC66CC663366333300CCFF0099CC003399000099000099000080
            B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFDDDDDD969696C0C0C09696968686868686868080806666666666666666665F
            5F5FCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFCCCCCC996666FFCC66FF99665F5F5F00CCFF0033990033CC0033CC0033
            CC000099B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFDDDDDD969696C0C0C0B2B2B2808080868686666666868686808080
            777777666666CC9966FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFD7D7D7996666FFCC66996666FFFFFF0099CC0033CC3333FF00
            33CC0033CC000080B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE3E3E3969696C0C0C0999999FFFFFF777777868686B2B2
            B2868686777777666666CC9966CC9966CC9966CC9966CC9966CC9966CC9966CC
            9966CC9966CC9966CC9966CC9966996666996666FFFFFFFFFFFFFFFFFF0033CC
            6666FF3333CC000099FFFFFFB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
            B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2969696999999FFFFFFFFFFFFFFFFFF86
            8686C0C0C0999999666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF0033CC000099FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF868686777777FFFFFFFFFFFF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object SpeedButton4: TSpeedButton
          Left = 122
          Top = 2
          Width = 64
          Height = 50
          Action = A_Del
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CCFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000
            CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686
            868686FFFFFFFFFFFFFFFFFF0000CC0000CC0000CCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC00
            00CCFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686868686
            86868686FFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000CCFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC
            0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86868686
            8686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000CC0000CC
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000
            CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86868686868686868686
            8686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686
            868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            FF0000CC0000CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC00
            00CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            999999868686868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686868686
            86868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF0000CC0000CC0000CC0000CCFFFFFFFFFFFF0000CC0000CC0000CC
            0000CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF868686868686868686868686FFFFFFFFFFFF86868686868686
            8686868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000CC0000CC0000CC0000CC0000
            CC0000CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686868686868686868686
            868686868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000FF0000CC00
            00FF0000CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686868686869999998686
            86999999868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC
            0000CC0000FF0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86868686
            8686868686999999868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000
            CC0000FF0000CC0000CC0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686
            868686999999868686868686999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC00
            00CC0000FF0000CC0000FF0000FF0000FF0000CC0000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686
            86868686999999868686999999999999999999868686999999FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF
            0000FF0000FF0000CC0000FFFFFFFFFFFFFF0000FF0000FF0000FF0000FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            9999999999999999868686999999FFFFFFFFFFFF999999999999999999999999
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF0000FF0000CC0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF00
            00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF999999868686999999999999FFFFFFFFFFFFFFFFFFFFFFFF9999999999
            99999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF999999999999999999FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object SpeedButton5: TSpeedButton
          Left = 218
          Top = 2
          Width = 65
          Height = 50
          Action = RefreshAction
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF99666699666699666699666699666699666699666699666699666699
            6666996666996666996666996666996666996666996633FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF9999999999999999999999999999999999999999999999
            99999999999999999999999999999999999999999999999999969696FFFFFFFF
            FFFFFFFFFFFFFFFF996666F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6FFCC99
            FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC66996633FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0E3E3E3E3E3E3DDDDDDDDDDDDDDDDDDD7
            D7D7D7D7D7CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC969696
            FFFFFFFFFFFFFFFFFFFFFFFF996666F0CAA6FFECCCF0CAA6F0CAA6F0CAA6F0CA
            A6FFCC99FFCC99FFCC99FFCC66FFCC66FFCC66FFCC66FFCC66CCCC66996633FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0E3E3E3EAEAEAE3E3E3DDDDDD
            DDDDDDD7D7D7D7D7D7D7D7D7CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
            CC969696FFFFFFFFFFFFFFFFFFFFFFFF996666FFCCCCFFECCCF0CAA6F0CAA6F0
            CAA6F0CAA6F0CAA6FFCC99FFCC99FFCC99FFCC66FFCC66FFCC66FFCC66CCCC66
            996633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0EAEAEAEAEAEAE3E3
            E3E3E3E3DDDDDDDDDDDDD7D7D7D7D7D7D7D7D7CCCCCCCCCCCCCCCCCCCCCCCCCC
            CCCCCCCCCC969696FFFFFFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCCF0CAA6
            008000F0CAA6F0CAA6CCCC66008000008000008000999966FFCC66FFCC66FFCC
            66CCCC66996633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0EAEAEAEA
            EAEAE3E3E3B2B2B2E3E3E3DDDDDDB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2CCCCCC
            CCCCCCCCCCCCCCCCCC969696FFFFFFFFFFFFFFFFFFFFFFFF996666FFECCCFFEC
            CCFFECCC008000008000008000CCCC66F0CAA6F0CAA6F0CAA6CCCC66008000FF
            CC99FFCC66CCCC66996633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0
            F1F1F1F1F1F1EAEAEAB2B2B2B2B2B2B2B2B2C0C0C0DDDDDDDDDDDDD7D7D7B2B2
            B2B2B2B2CCCCCCCCCCCCCCCCCC969696FFFFFFFFFFFFFFFFFFFFFFFF996666EA
            EAEAFFECCCFFECCC008000008000008000008000F0CAA6F0CAA6F0CAA6F0CAA6
            008000FFCC99FFCC66CCCC66996633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFA4A0A0F1F1F1F1F1F1EAEAEAB2B2B2B2B2B2B2B2B2B2B2B2DDDDDDDDDDDDDD
            DDDDD7D7D7B2B2B2D7D7D7CCCCCCCCCCCC969696FFFFFFFFFFFFFFFFFFFFFFFF
            996666EAEAEAF1F1F1FFECCC008000008000008000008000008000F0CAA6F0CA
            A6F0CAA6F0CAA6FFCC99FFCC99CCCC66996633FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFA4A0A0F1F1F1FFFFFFF1F1F1B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
            E3E3E3DDDDDDDDDDDDD7D7D7D7D7D7CCCCCCCCCCCC969696FFFFFFFFFFFFFFFF
            FFFFFFFF996666F1F1F1F1F1F1EAEAEAFFECCCFFECCCFFECCCFFECCCF0CAA6F0
            CAA6F0CAA6F0CAA6F0CAA6F0CAA6FFCC99CCCC99996633FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFF1F1F1F1F1F1EAEAEAEAEAEAEAEA
            EAE3E3E3E3E3E3E3E3E3DDDDDDDDDDDDD7D7D7D7D7D7CCCCCC969696FFFFFFFF
            FFFFFFFFFFFFFFFF996666F8F8F8F8F8F8F1F1F1FFECCCFFECCCFFECCCFFECCC
            008000008000008000008000008000F0CAA6FFCC99FFCC99996633FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFF1F1F1F1F1F1EA
            EAEAEAEAEAB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2DDDDDDD7D7D7D7D7D7969696
            FFFFFFFFFFFFFFFFFFFFFFFF996666F8F8F8FFFFFFF1F1F1008000FFECCCFFEC
            CCFFECCCFFECCC008000008000008000008000F0CAA6F0CAA6FFCC99996633FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFB2B2B2
            F1F1F1F1F1F1EAEAEAEAEAEAB2B2B2B2B2B2B2B2B2B2B2B2DDDDDDD7D7D7D7D7
            D7969696FFFFFFFFFFFFFFFFFFFFFFFFCC6666F8F8F8FFFFFFF8F8F8008000C0
            DCC0FFECCCFFECCCFFECCCCCCC99008000008000008000F0CAA6F0CAA6F0CAA6
            996633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFF
            FFB2B2B2D7D7D7F1F1F1F1F1F1EAEAEACCCCCCB2B2B2B2B2B2B2B2B2DDDDDDDD
            DDDDD7D7D7969696FFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFF
            C0DCC0008000C0DCC0FFECCCCCCC99008000CCCC99008000008000F0CAA6F0CA
            A6F0CAA6996633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFF
            FFFFFFFFFFDDDDDDB2B2B2D7D7D7F1F1F1CCCCCCB2B2B2CCCCCCB2B2B2B2B2B2
            E3E3E3DDDDDDDDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFF
            FFFFFFFFFFFFFFC0DCC0008000008000008000CCCC99FFECCCFFECCC008000F0
            CAA6F0CAA6CCCC99996633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2
            FFFFFFFFFFFFFFFFFFFFFFFFDDDDDDB2B2B2B2B2B2B2B2B2CCCCCCEAEAEAEAEA
            EAB2B2B2E3E3E3DDDDDDCCCCCC969696FFFFFFFFFFFFFFFFFFFFFFFFCC9966F8
            F8F8FFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F1F1F1F1F1F1FFECCCFFECCCFFECCC
            FFECCCFFECCCCCCC99999966996633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1
            F1F1EAEAEAEAEAEAEAEAEACCCCCCB2B2B2969696FFFFFFFFFFFFFFFFFFFFFFFF
            CC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F1F1F1F1F1F1FFEC
            CCFFECCCFFECCCF0CAA6999999969696996633FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F1F1F1F1F1F1F1F1F1F1F1F1E3E3E3C0C0C0B2B2B2969696FFFFFFFFFFFFFFFF
            FFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
            F8F8F8F8F8F0CAA6996666CC9966CC9933FF9933996666FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFDDDDDDA4A0A0C0C0C0B2B2B2A4A0A0B2B2B2FFFFFFFF
            FFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF8F8F8CBCBCB996666FFCC66FF9933996666FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3A4A0A0CCCCCCB2B2B2B2B2B2FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCC996666FFCC66996666FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3A4A0A0CCCCCCB2B2B2FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7996666FFCC66FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAA4A0A0CCCCCCFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966CC9966CC9966CC9966
            CC9966CC9966CC9966CC9966CC9966CC9966CC9966CC9966996666996666FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A4A0A0
            B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
        end
        object SpeedButton6: TSpeedButton
          Left = 735
          Top = 2
          Width = 65
          Height = 50
          Anchors = [akRight]
          Caption = #1047#1072#1082#1088#1080#1090#1080
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333292929FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686777777
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99333399333399333399333329
            2929FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9696969696968686868686
            86777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333993333993333CC3333CC3333
            993333292929FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96969696969686868696969699
            9999868686777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333993333993333CC3333CC3333CC33
            33CC333399333329292999333399333399333399333399333399333399333399
            3333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696969696969696999999999999
            9999999999998686867777779999999696969696969696969696969696969696
            96969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333CC6666CC6666CC6666CC
            6666CC6666CC3366993333292929FF9999FF9999FF9999FF9999F0CAA6F0CAA6
            F0CAA6993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696A4A0A0A4A0A0A4A0
            A0999999999999999999868686777777D7D7D7D7D7D7D7D7D7DDDDDDDDDDDDDD
            DDDDDDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333CC6666CC6666
            CC6666CC6666CC6666CC666699333329292933993333CC3333CC3333CC3333CC
            3333CC33F0CAA6993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696A4A0A0A4
            A0A0A4A0A0A4A0A0A4A0A0A4A0A0868686777777999999969696969696969696
            969696969696DDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333CC66
            66CC6666CC6666CC6666CC6666CC666699666629292933993333CC3333CC3333
            CC3333CC3333CC33F0CAA6993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696
            B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A0A09696967777779999999696969696
            96969696969696969696DDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            3333CC6666CC6666CC6666CC6666CC6666CC666699666629292933993333CC33
            33CC3333CC3333CC3333CC33F0CAA6993333FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF969696B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B296969677777799999996
            9696969696969696969696969696DDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF993333CC6666CC6666CC6666CC6666CC6666CC66669966662929293399
            3333CC3333CC3333CC3333CC3333CC33F0CAA6993333FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF969696B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2969696777777
            999999969696969696969696969696969696DDDDDD969696FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF993333CC6666CC6666CC6666CC6666CC9999CC666699666629
            292966996633CC3333CC3333CC3333CC3333CC33F0CAA6993333FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF969696B2B2B2B2B2B2B2B2B2B2B2B2CCCCCCB2B2B29696
            96777777A4A0A0969696969696969696969696969696DDDDDD969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF993333CC6666CC6666CC6666FF9999FFFFFFFF9999
            996666292929F0CAA6C0DCC066CC6666CC6633CC6633CC66F0CAA6993333FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF969696C0C0C0C0C0C0B2B2B2D7D7D7FFFFFFD7
            D7D7999999777777DDDDDDDDDDDDC0C0C0C0C0C0B2B2B2B2B2B2DDDDDD969696
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333FF6666FF6666CC6666FF9999FFFF
            FFFF9999CC6666292929F0CAA6FFFFCCFFFFCCFFFFCCCCFFCCCCFFCCF0CAA699
            3333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696C0C0C0C0C0C0C0C0C0DDDDDD
            FFFFFFCCCCCC999999777777DDDDDDEAEAEAEAEAEAEAEAEAE3E3E3E3E3E3DDDD
            DD969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333FF6666FF6666FF6666FF
            6666FF9999CC6666CC6666292929F0CAA6FFFFCCFFFFCCFFFFCCFFFFCCFFFFCC
            F0CAA6993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696C0C0C0C0C0C0C0C0
            C0C0C0C0CCCCCCC0C0C0999999777777DDDDDDEAEAEAEAEAEAEAEAEAEAEAEAEA
            EAEADDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333FF6666FF6666
            FF6666FF6666FF6666FF6666CC6666292929F0CAA6FFFFCCFFFFCCFFFFCCFFFF
            CCFFFFCCF0CAA6993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0999999777777DDDDDDEAEAEAEAEAEAEAEAEA
            EAEAEAEAEAEADDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333FF66
            66FF6666FF6666FF6666FF6666FF6666CC6666292929F0CAA6FFFFCCFFFFCCFF
            FFCCFFFFCCFFFFCCF0CAA6993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A4A0A0777777DDDDDDEAEAEAEAEA
            EAEAEAEAEAEAEAEAEAEADDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            3333FF6699FF6666FF6666FF6666FF6666FF6666CC6666292929F0CAA6FFFFCC
            FFFFCCFFFFCCFFFFCCFFFFCCF0CAA6993333FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF969696CCCCCCCCCCCCC0C0C0C0C0C0C0C0C0C0C0C0A4A0A0777777DDDDDDEA
            EAEAEAEAEAEAEAEAEAEAEAEAEAEADDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF993333FF9999FF9999FF6699FF6699FF6666FF6666CC6666292929F0CA
            A6FFFFCCFFFFCCFFFFCCFFFFCCFFFFCCF0CAA6993333FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF969696CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCA4A0A0777777
            DDDDDDEAEAEAEAEAEAEAEAEAEAEAEAEAEAEADDDDDD969696FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF993333FF6666FF9999FF9999FF9999FF9999FF9999CC666629
            2929F0CAA6FFFFCCFFFFCCFFFFCCFFFFCCFFFFCCF0CAA6993333FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF969696C0C0C0CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCA4A0
            A0777777DDDDDDEAEAEAEAEAEAEAEAEAEAEAEAEAEAEADDDDDD969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF993333993333CC6666FF9999FF9999FF9999FF9999
            CC6666292929F0CAA6FFFFCCFFFFCCFFFFCCFFFFCCFFFFCCF0CAA6993333FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF969696969696B2B2B2CCCCCCCCCCCCCCCCCCCC
            CCCCA4A0A0777777DDDDDDEAEAEAEAEAEAEAEAEAEAEAEAEAEAEADDDDDD969696
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333996666CC6666FF66
            66FF9999CC666629292999333399333399333399333399333399333399333399
            3333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696999999A4A0A0
            C0C0C0CCCCCCA4A0A07777779999999696969696969696969696969696969696
            96969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            3333993333996666996666292929FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF969696969696868686969696777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF993333292929FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF969696777777FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
        end
      end
    end
    object BonusPage: TTabSheet
      Caption = #1053#1072#1076#1073#1072#1074#1082#1080
      ImageIndex = 3
      object cxGrid1: TcxGrid
        Left = 0
        Top = 53
        Width = 634
        Height = 274
        Align = alClient
        TabOrder = 0
        object BonusView: TcxGridDBTableView
          OnKeyUp = BonusViewKeyUp
          DataController.DataSource = UPAcceptDM.AcceptBonusSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.StyleSheet = qizzStyle
          object BonusViewDATE_BEG: TcxGridDBColumn
            Visible = False
            DataBinding.FieldName = 'DATE_BEG'
          end
          object BonusViewDATE_END: TcxGridDBColumn
            Visible = False
            DataBinding.FieldName = 'DATE_END'
          end
          object BonusViewRAISE_NAME: TcxGridDBColumn
            Width = 174
            DataBinding.FieldName = 'RAISE_NAME'
          end
          object BonusViewPERCENT: TcxGridDBColumn
            Width = 51
            DataBinding.FieldName = 'PERCENT'
          end
          object BonusViewSUMMA: TcxGridDBColumn
            Visible = False
            DataBinding.FieldName = 'SUMMA'
          end
          object BonusViewID_ORDER_ITEM: TcxGridDBColumn
            Visible = False
            DataBinding.FieldName = 'ID_ORDER_ITEM'
          end
          object BonusViewDATES_STR: TcxGridDBColumn
            Visible = False
            GroupIndex = 0
            SortOrder = soAscending
            Width = 105
            DataBinding.FieldName = 'DATES_STR'
          end
          object BonusViewBONUS_SUMMA: TcxGridDBColumn
            Width = 99
            DataBinding.FieldName = 'BONUS_SUMMA'
          end
          object BonusViewSMETA_TITLE: TcxGridDBColumn
            Width = 115
            DataBinding.FieldName = 'SMETA_TITLE'
          end
          object BonusViewBONUS_SUMMA_PPS: TcxGridDBColumn
            Caption = #1057#1091#1084#1072' '#1087#1110#1076#1074'.'
            Width = 67
            DataBinding.FieldName = 'BONUS_SUMMA_PPS'
          end
          object BonusViewSMETA_PPS_TITLE: TcxGridDBColumn
            Width = 109
            DataBinding.FieldName = 'SMETA_PPS_TITLE'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = BonusView
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 634
        Height = 53
        Align = alTop
        TabOrder = 1
        DesignSize = (
          634
          53)
        object AddButton: TSpeedButton
          Left = 0
          Top = 2
          Width = 57
          Height = 50
          Action = AddBonus
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFF9966669966669966669966669966669966669966669966669966669966
            66996666996666996666996666996666996666996666FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF969696999999999999999999999999999999999999999999999999
            999999999999999999999999999999999999999999999999FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF996666F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6FFCC99FF
            CC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC66996666FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF969696DDDDDDDDDDDDD7D7D7D7D7D7CCCCCCCCCCCCCCCC
            CCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF996666F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6
            FFCC99FFCC99FFCC99FFCC66FFCC66FFCC66FFCC66FFCC66CCCC66996666FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF969696DDDDDDDDDDDDDDDDDDD7D7D7D7D7D7CC
            CCCCCCCCCCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0969696
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666FFCCCCFFECCCF0CAA6F0CAA6F0CA
            A6F0CAA6F0CAA6FFCC99FFCC99FFCC99FFCC66FFCC66FFCC66FFCC66CCCC6699
            6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3DDDDDDDDDDDDDDDDDD
            D7D7D7D7D7D7CCCCCCCCCCCCCCCCCCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCCF0CAA6F0
            CAA6F0CAA6F0CAA6F0CAA6F0CAA6FFCC99FFCC99FFCC99FFCC66FFCC66FFCC66
            CCCC66996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3E3E3E3DDDD
            DDDDDDDDDDDDDDD7D7D7D7D7D7CCCCCCCCCCCCCCCCCCC0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCC
            FFECCCF0CAA6F0CAA6F0CAA6CCCC99CCCC99CCCC99CCCC99CCCC99FFCC99FFCC
            66FFCC66CCCC66996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3E3
            E3E3E3E3E3DDDDDDDDDDDDD7D7D7C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666EAEA
            EAFFECCCFFECCCFFECCCFFECCC003300003300003300003300999966CCCC99FF
            CC99FFCC99FFCC66CCCC66996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696
            EAEAEAEAEAEAE3E3E3E3E3E3E3E3E3868686868686868686868686969696C0C0
            C0CCCCCCC0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            6666EAEAEAFFECCCFFECCCF0CAA6F0CAA6003300009900009900003300999966
            CC9999CCCC99CCCC99FFCC99CCCC66996666FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF999999EAEAEAEAEAEAE3E3E3D7D7D7CCCCCC868686B2B2B2A4A0A086868696
            9696B2B2B2C0C0C0C0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF996666F1F1F1F1F1F1D7D7D7B2B2B2A4A0A00033000099330099000033
            00999966999966999966CCCC99FFCC99CCCC99996666FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF999999F1F1F1F1F1F1DDDDDDB2B2B2A4A0A0868686B2B2B2B2B2B2
            868686868686868686969696C0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF996666F8F8F8F1F1F100330000330000330000330000993300
            9933003300003300003300003300CCCC99FFCC99FFCC99996666FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF999999F1F1F1F1F1F1868686868686868686868686B2B2
            B2B2B2B2868686868686868686868686C0C0C0CCCCCCC0C0C0969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF996666F8F8F8F8F8F800330033CC3333CC3333CC33
            33CC33009933009933009933009900003300CCCC99F0CAA6FFCC99996666FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFF868686CCCCCCCCCCCCC0
            C0C0C0C0C0C0C0C0B2B2B2B2B2B2B2B2B2868686C0C0C0CCCCCCCCCCCC999999
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC6666F8F8F8FFFFFF00330033CC6633CC
            3333CC3333CC3333CC3300CC33009933009933003300CCCC99F0CAA6F0CAA699
            6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFF868686D7D7D7
            D7D7D7CCCCCCCCCCCCC0C0C0C0C0C0C0C0C0B2B2B2868686C0C0C0D7D7D7CCCC
            CC999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFF00330000
            330000330000330033CC3333CC33003300003300003300003300F0CAA6F0CAA6
            F0CAA6996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFF8686
            86868686868686868686D7D7D7CCCCCC868686868686868686868686D7D7D7D7
            D7D7CCCCCC999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFF
            FFFFFFFFFFFFF8F8F800330033CC6633CC66003300A4A0A0F0CAA6FFECCCF0CA
            A6F0CAA6CCCC99996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF868686DDDDDDD7D7D7868686A4A0A0CCCCCCE3E3E3
            DDDDDDD7D7D7C0C0C0868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8
            F8FFFFFFFFFFFFFFFFFFFFFFFF00330033CC6633CC66003300B2B2B2F0CAA6FF
            ECCCF0CAA6CCCC99999966996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686DDDDDDDDDDDD868686B2B2B2D7D7
            D7E3E3E3D7D7D7C0C0C0A4A0A0868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC
            9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFF003300003300003300003300D7D7D7
            FFECCCFFECCCB2B2B2999999969696996666FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686868686DD
            DDDDE3E3E3EAEAEAC0C0C0B2B2B2B2B2B2868686FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F1F1
            F1F1F1F1FFCCCC996666996666996666996666996666FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F1F1F1F1F1F1DDDDDD969696969696969696969696969696FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF8F8F8CBCBCB996666FF9966FF9933996666FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFDDDDDD969696B2B2B2A4A0A0999999FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFCCCCCC996666FF9966996666FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDD969696B2B2B2999999FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7996666996666FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3969696999999FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F0CAA6F0CAA6F0CAA6F0
            CAA6F0CAA6F0CAA6F0CAA6F0CAA6C0C0C0C0C0C0CC9999996666FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2B2B2B2B2B2B2B2B2
            B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object ModifyButton: TSpeedButton
          Left = 57
          Top = 2
          Width = 65
          Height = 50
          Action = ModifyBonus
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9966
            6699666699666699666699666699666699666699666699666699666699666699
            6666996666996666996666996666996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            9696969999999999999999999999999999999999999999999999999999999999
            99999999999999999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF996666F0CAA6FFECCCF0CAA6F0CAA6F0CAA6CCCC99CCCC99CCCC99CCCC99
            CCCC66FFCC66FFCC66FFCC66FFCC66FFCC66996666FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF969696DDDDDDE3E3E3DDDDDDD7D7D7CCCCCCC0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF996666FFCCCCFFECCCF0CAA6F0CAA6CC9999CC9966CC9966CC99
            66CCCC66CCCC66CCCC66CCCC66FFCC66FFCC66FFCC66996666FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF969696E3E3E3E3E3E3DDDDDDD7D7D7C0C0C0C0C0C0B2B2B2
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0969696FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCCFFECCCF0CAA639393999666699
            9966999966CC9966CC9966CC9966CCCC66CCCC66CCCC66FFCC66996666FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3E3E3E3DDDDDDD7D7D78686868686
            86999999A4A0A0B2B2B2B2B2B2B2B2B2C0C0C0C0C0C0C0C0C0C0C0C0969696FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCCFFECCCF0CAA61C1C1C
            292929424242996666996666999966CC9966CC9966CCCC66CCCC66CCCC669966
            66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3EAEAEAE3E3E3DDDDDD66
            6666666666868686868686868686969696A4A0A0B2B2B2C0C0C0C0C0C0C0C0C0
            969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666EAEAEAFFECCCFFECCCFFEC
            CC393939006699006699336666393939393939666633666633996666CC9966CC
            9966996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696EAEAEAF1F1F1EAEAEA
            E3E3E3808080868686868686868686808080666666777777808080969696A4A0
            A0B2B2B2969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666EAEAEAF1F1F1FF
            ECCCFFECCC808080006699336666996666996666996666663333555555666633
            996666999966996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999EAEAEAF1F1
            F1EAEAEAEAEAEAB2B2B2868686666666969696A4A0A096969666666666666680
            8080868686999999969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666F1F1F1
            F1F1F1F1F1F1EAEAEAFFECCC003366996666CC9999CC66669966669966666633
            33666633666633996633996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999F1
            F1F1F1F1F1F1F1F1EAEAEAE3E3E3555555868686C0C0C0B2B2B2A4A0A0969696
            666666666666777777868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9966
            66F8F8F8F8F8F8F1F1F1F1F1F1FFECCC336666996666CC9999CC9999CC666699
            6666996666663333666633666633666633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            999999F1F1F1FFFFFFF1F1F1F1F1F1EAEAEA868686999999CCCCCCC0C0C0B2B2
            B2A4A0A0868686666666666666666666777777FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF996666F8F8F8FFFFFFF8F8F8F1F1F1FFECCCFFECCC5F5F5FCC9999CC9999
            CC9999CC6666996666996666663333663333663333FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFA4A0A0FFFFFFFFFFFFFFFFFFF1F1F1EAEAEAEAEAEA808080D7D7D7CC
            CCCCC0C0C0B2B2B2A4A0A0868686666666666666666666FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFCC6666F8F8F8FFFFFFFFFFFFF8F8F8F1F1F1FFECCCF0CAA65F5F
            5FCC9999CC9999CC9999CC6666996666996666663333663333FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1EAEAEADDDDDD
            808080CCCCCCCCCCCCC0C0C0B2B2B2A4A0A0868686666666666666FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFF1F1F1F1F1F1FF
            ECCCF0CAA6663333CC9999CC9999CC9999CC6666996666996666663333FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1F1
            F1EAEAEADDDDDD777777CCCCCCCCCCCCC0C0C0B2B2B2A4A0A08686865F5F5FFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFF8F8F8
            F1F1F1F1F1F1FFECCCCC9999663333CC9999CC9999CC9999CC66669966666633
            33FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF1F1F1F1F1F1EAEAEAC0C0C0777777CCCCCCCCCCCCC0C0C0B2B2B2999999
            666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFF
            FFFFFFFFF8F8F8F1F1F1F1F1F1FFECCCCC9999663333CC9999CC9999CC9999CC
            6666996666663333FFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF1F1F1F1F1F1EAEAEAC0C0C0777777CCCCCCCCCCCCC0C0
            C0B2B2B2868686777777FFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFF8F8F8F1F1F1F1F1F1FFECCCCC9999996666F0CAA6
            CC9999CC99999933334D4D4D424242FFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1F1F1EAEAEAC0C0C0969696D7
            D7D7CCCCCCC0C0C0868686777777666666FFFFFFFFFFFFFFFFFFCC9966F8F8F8
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F1F1F1F1F1F1FFCCCC9966
            33996666F0CAA6CC99990099CC0099FF0099CC0099CCFFFFFFFFFFFFB2B2B2FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1F1F1DDDDDD
            868686969696D7D7D7C0C0C0808080868686868686777777FFFFFFFFFFFFCC99
            66F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8CB
            CBCB996666FFCC66CC663366333300CCFF0099CC003399000099000099000080
            B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFDDDDDD969696C0C0C09696968686868686868080806666666666666666665F
            5F5FCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFCCCCCC996666FFCC66FF99665F5F5F00CCFF0033990033CC0033CC0033
            CC000099B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFDDDDDD969696C0C0C0B2B2B2808080868686666666868686808080
            777777666666CC9966FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFD7D7D7996666FFCC66996666FFFFFF0099CC0033CC3333FF00
            33CC0033CC000080B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE3E3E3969696C0C0C0999999FFFFFF777777868686B2B2
            B2868686777777666666CC9966CC9966CC9966CC9966CC9966CC9966CC9966CC
            9966CC9966CC9966CC9966CC9966996666996666FFFFFFFFFFFFFFFFFF0033CC
            6666FF3333CC000099FFFFFFB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
            B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2969696999999FFFFFFFFFFFFFFFFFF86
            8686C0C0C0999999666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF0033CC000099FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF868686777777FFFFFFFFFFFF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object DeleteButton: TSpeedButton
          Left = 122
          Top = 2
          Width = 64
          Height = 50
          HelpType = htKeyword
          Action = DelBonus
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CCFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000
            CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686
            868686FFFFFFFFFFFFFFFFFF0000CC0000CC0000CCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC00
            00CCFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686868686
            86868686FFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000CCFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC
            0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86868686
            8686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000CC0000CC
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000
            CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86868686868686868686
            8686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686
            868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            FF0000CC0000CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC00
            00CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            999999868686868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686868686
            86868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF0000CC0000CC0000CC0000CCFFFFFFFFFFFF0000CC0000CC0000CC
            0000CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF868686868686868686868686FFFFFFFFFFFF86868686868686
            8686868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000CC0000CC0000CC0000CC0000
            CC0000CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686868686868686868686
            868686868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000FF0000CC00
            00FF0000CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686868686869999998686
            86999999868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC
            0000CC0000FF0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86868686
            8686868686999999868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000
            CC0000FF0000CC0000CC0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686
            868686999999868686868686999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC00
            00CC0000FF0000CC0000FF0000FF0000FF0000CC0000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686
            86868686999999868686999999999999999999868686999999FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF
            0000FF0000FF0000CC0000FFFFFFFFFFFFFF0000FF0000FF0000FF0000FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            9999999999999999868686999999FFFFFFFFFFFF999999999999999999999999
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF0000FF0000CC0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF00
            00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF999999868686999999999999FFFFFFFFFFFFFFFFFFFFFFFF9999999999
            99999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF999999999999999999FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object RefreshButton: TSpeedButton
          Left = 218
          Top = 2
          Width = 65
          Height = 50
          Action = RefreshAction
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF99666699666699666699666699666699666699666699666699666699
            6666996666996666996666996666996666996666996633FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF9999999999999999999999999999999999999999999999
            99999999999999999999999999999999999999999999999999969696FFFFFFFF
            FFFFFFFFFFFFFFFF996666F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6FFCC99
            FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC66996633FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0E3E3E3E3E3E3DDDDDDDDDDDDDDDDDDD7
            D7D7D7D7D7CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC969696
            FFFFFFFFFFFFFFFFFFFFFFFF996666F0CAA6FFECCCF0CAA6F0CAA6F0CAA6F0CA
            A6FFCC99FFCC99FFCC99FFCC66FFCC66FFCC66FFCC66FFCC66CCCC66996633FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0E3E3E3EAEAEAE3E3E3DDDDDD
            DDDDDDD7D7D7D7D7D7D7D7D7CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
            CC969696FFFFFFFFFFFFFFFFFFFFFFFF996666FFCCCCFFECCCF0CAA6F0CAA6F0
            CAA6F0CAA6F0CAA6FFCC99FFCC99FFCC99FFCC66FFCC66FFCC66FFCC66CCCC66
            996633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0EAEAEAEAEAEAE3E3
            E3E3E3E3DDDDDDDDDDDDD7D7D7D7D7D7D7D7D7CCCCCCCCCCCCCCCCCCCCCCCCCC
            CCCCCCCCCC969696FFFFFFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCCF0CAA6
            008000F0CAA6F0CAA6CCCC66008000008000008000999966FFCC66FFCC66FFCC
            66CCCC66996633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0EAEAEAEA
            EAEAE3E3E3B2B2B2E3E3E3DDDDDDB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2CCCCCC
            CCCCCCCCCCCCCCCCCC969696FFFFFFFFFFFFFFFFFFFFFFFF996666FFECCCFFEC
            CCFFECCC008000008000008000CCCC66F0CAA6F0CAA6F0CAA6CCCC66008000FF
            CC99FFCC66CCCC66996633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0
            F1F1F1F1F1F1EAEAEAB2B2B2B2B2B2B2B2B2C0C0C0DDDDDDDDDDDDD7D7D7B2B2
            B2B2B2B2CCCCCCCCCCCCCCCCCC969696FFFFFFFFFFFFFFFFFFFFFFFF996666EA
            EAEAFFECCCFFECCC008000008000008000008000F0CAA6F0CAA6F0CAA6F0CAA6
            008000FFCC99FFCC66CCCC66996633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFA4A0A0F1F1F1F1F1F1EAEAEAB2B2B2B2B2B2B2B2B2B2B2B2DDDDDDDDDDDDDD
            DDDDD7D7D7B2B2B2D7D7D7CCCCCCCCCCCC969696FFFFFFFFFFFFFFFFFFFFFFFF
            996666EAEAEAF1F1F1FFECCC008000008000008000008000008000F0CAA6F0CA
            A6F0CAA6F0CAA6FFCC99FFCC99CCCC66996633FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFA4A0A0F1F1F1FFFFFFF1F1F1B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
            E3E3E3DDDDDDDDDDDDD7D7D7D7D7D7CCCCCCCCCCCC969696FFFFFFFFFFFFFFFF
            FFFFFFFF996666F1F1F1F1F1F1EAEAEAFFECCCFFECCCFFECCCFFECCCF0CAA6F0
            CAA6F0CAA6F0CAA6F0CAA6F0CAA6FFCC99CCCC99996633FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFF1F1F1F1F1F1EAEAEAEAEAEAEAEA
            EAE3E3E3E3E3E3E3E3E3DDDDDDDDDDDDD7D7D7D7D7D7CCCCCC969696FFFFFFFF
            FFFFFFFFFFFFFFFF996666F8F8F8F8F8F8F1F1F1FFECCCFFECCCFFECCCFFECCC
            008000008000008000008000008000F0CAA6FFCC99FFCC99996633FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFF1F1F1F1F1F1EA
            EAEAEAEAEAB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2DDDDDDD7D7D7D7D7D7969696
            FFFFFFFFFFFFFFFFFFFFFFFF996666F8F8F8FFFFFFF1F1F1008000FFECCCFFEC
            CCFFECCCFFECCC008000008000008000008000F0CAA6F0CAA6FFCC99996633FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFB2B2B2
            F1F1F1F1F1F1EAEAEAEAEAEAB2B2B2B2B2B2B2B2B2B2B2B2DDDDDDD7D7D7D7D7
            D7969696FFFFFFFFFFFFFFFFFFFFFFFFCC6666F8F8F8FFFFFFF8F8F8008000C0
            DCC0FFECCCFFECCCFFECCCCCCC99008000008000008000F0CAA6F0CAA6F0CAA6
            996633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFF
            FFB2B2B2D7D7D7F1F1F1F1F1F1EAEAEACCCCCCB2B2B2B2B2B2B2B2B2DDDDDDDD
            DDDDD7D7D7969696FFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFF
            C0DCC0008000C0DCC0FFECCCCCCC99008000CCCC99008000008000F0CAA6F0CA
            A6F0CAA6996633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFF
            FFFFFFFFFFDDDDDDB2B2B2D7D7D7F1F1F1CCCCCCB2B2B2CCCCCCB2B2B2B2B2B2
            E3E3E3DDDDDDDDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFF
            FFFFFFFFFFFFFFC0DCC0008000008000008000CCCC99FFECCCFFECCC008000F0
            CAA6F0CAA6CCCC99996633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2
            FFFFFFFFFFFFFFFFFFFFFFFFDDDDDDB2B2B2B2B2B2B2B2B2CCCCCCEAEAEAEAEA
            EAB2B2B2E3E3E3DDDDDDCCCCCC969696FFFFFFFFFFFFFFFFFFFFFFFFCC9966F8
            F8F8FFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F1F1F1F1F1F1FFECCCFFECCCFFECCC
            FFECCCFFECCCCCCC99999966996633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1
            F1F1EAEAEAEAEAEAEAEAEACCCCCCB2B2B2969696FFFFFFFFFFFFFFFFFFFFFFFF
            CC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F1F1F1F1F1F1FFEC
            CCFFECCCFFECCCF0CAA6999999969696996633FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F1F1F1F1F1F1F1F1F1F1F1F1E3E3E3C0C0C0B2B2B2969696FFFFFFFFFFFFFFFF
            FFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
            F8F8F8F8F8F0CAA6996666CC9966CC9933FF9933996666FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFDDDDDDA4A0A0C0C0C0B2B2B2A4A0A0B2B2B2FFFFFFFF
            FFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF8F8F8CBCBCB996666FFCC66FF9933996666FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3A4A0A0CCCCCCB2B2B2B2B2B2FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCC996666FFCC66996666FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3A4A0A0CCCCCCB2B2B2FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7996666FFCC66FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAA4A0A0CCCCCCFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966CC9966CC9966CC9966
            CC9966CC9966CC9966CC9966CC9966CC9966CC9966CC9966996666996666FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A4A0A0
            B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 735
          Top = 2
          Width = 65
          Height = 50
          Anchors = [akRight]
          Caption = #1047#1072#1082#1088#1080#1090#1080
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333292929FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686777777
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99333399333399333399333329
            2929FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9696969696968686868686
            86777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333993333993333CC3333CC3333
            993333292929FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96969696969686868696969699
            9999868686777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333993333993333CC3333CC3333CC33
            33CC333399333329292999333399333399333399333399333399333399333399
            3333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696969696969696999999999999
            9999999999998686867777779999999696969696969696969696969696969696
            96969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333CC6666CC6666CC6666CC
            6666CC6666CC3366993333292929FF9999FF9999FF9999FF9999F0CAA6F0CAA6
            F0CAA6993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696A4A0A0A4A0A0A4A0
            A0999999999999999999868686777777D7D7D7D7D7D7D7D7D7DDDDDDDDDDDDDD
            DDDDDDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333CC6666CC6666
            CC6666CC6666CC6666CC666699333329292933993333CC3333CC3333CC3333CC
            3333CC33F0CAA6993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696A4A0A0A4
            A0A0A4A0A0A4A0A0A4A0A0A4A0A0868686777777999999969696969696969696
            969696969696DDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333CC66
            66CC6666CC6666CC6666CC6666CC666699666629292933993333CC3333CC3333
            CC3333CC3333CC33F0CAA6993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696
            B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A0A09696967777779999999696969696
            96969696969696969696DDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            3333CC6666CC6666CC6666CC6666CC6666CC666699666629292933993333CC33
            33CC3333CC3333CC3333CC33F0CAA6993333FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF969696B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B296969677777799999996
            9696969696969696969696969696DDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF993333CC6666CC6666CC6666CC6666CC6666CC66669966662929293399
            3333CC3333CC3333CC3333CC3333CC33F0CAA6993333FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF969696B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2969696777777
            999999969696969696969696969696969696DDDDDD969696FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF993333CC6666CC6666CC6666CC6666CC9999CC666699666629
            292966996633CC3333CC3333CC3333CC3333CC33F0CAA6993333FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF969696B2B2B2B2B2B2B2B2B2B2B2B2CCCCCCB2B2B29696
            96777777A4A0A0969696969696969696969696969696DDDDDD969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF993333CC6666CC6666CC6666FF9999FFFFFFFF9999
            996666292929F0CAA6C0DCC066CC6666CC6633CC6633CC66F0CAA6993333FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF969696C0C0C0C0C0C0B2B2B2D7D7D7FFFFFFD7
            D7D7999999777777DDDDDDDDDDDDC0C0C0C0C0C0B2B2B2B2B2B2DDDDDD969696
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333FF6666FF6666CC6666FF9999FFFF
            FFFF9999CC6666292929F0CAA6FFFFCCFFFFCCFFFFCCCCFFCCCCFFCCF0CAA699
            3333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696C0C0C0C0C0C0C0C0C0DDDDDD
            FFFFFFCCCCCC999999777777DDDDDDEAEAEAEAEAEAEAEAEAE3E3E3E3E3E3DDDD
            DD969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333FF6666FF6666FF6666FF
            6666FF9999CC6666CC6666292929F0CAA6FFFFCCFFFFCCFFFFCCFFFFCCFFFFCC
            F0CAA6993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696C0C0C0C0C0C0C0C0
            C0C0C0C0CCCCCCC0C0C0999999777777DDDDDDEAEAEAEAEAEAEAEAEAEAEAEAEA
            EAEADDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333FF6666FF6666
            FF6666FF6666FF6666FF6666CC6666292929F0CAA6FFFFCCFFFFCCFFFFCCFFFF
            CCFFFFCCF0CAA6993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0999999777777DDDDDDEAEAEAEAEAEAEAEAEA
            EAEAEAEAEAEADDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333FF66
            66FF6666FF6666FF6666FF6666FF6666CC6666292929F0CAA6FFFFCCFFFFCCFF
            FFCCFFFFCCFFFFCCF0CAA6993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A4A0A0777777DDDDDDEAEAEAEAEA
            EAEAEAEAEAEAEAEAEAEADDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            3333FF6699FF6666FF6666FF6666FF6666FF6666CC6666292929F0CAA6FFFFCC
            FFFFCCFFFFCCFFFFCCFFFFCCF0CAA6993333FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF969696CCCCCCCCCCCCC0C0C0C0C0C0C0C0C0C0C0C0A4A0A0777777DDDDDDEA
            EAEAEAEAEAEAEAEAEAEAEAEAEAEADDDDDD969696FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF993333FF9999FF9999FF6699FF6699FF6666FF6666CC6666292929F0CA
            A6FFFFCCFFFFCCFFFFCCFFFFCCFFFFCCF0CAA6993333FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF969696CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCA4A0A0777777
            DDDDDDEAEAEAEAEAEAEAEAEAEAEAEAEAEAEADDDDDD969696FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF993333FF6666FF9999FF9999FF9999FF9999FF9999CC666629
            2929F0CAA6FFFFCCFFFFCCFFFFCCFFFFCCFFFFCCF0CAA6993333FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF969696C0C0C0CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCA4A0
            A0777777DDDDDDEAEAEAEAEAEAEAEAEAEAEAEAEAEAEADDDDDD969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF993333993333CC6666FF9999FF9999FF9999FF9999
            CC6666292929F0CAA6FFFFCCFFFFCCFFFFCCFFFFCCFFFFCCF0CAA6993333FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF969696969696B2B2B2CCCCCCCCCCCCCCCCCCCC
            CCCCA4A0A0777777DDDDDDEAEAEAEAEAEAEAEAEAEAEAEAEAEAEADDDDDD969696
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333996666CC6666FF66
            66FF9999CC666629292999333399333399333399333399333399333399333399
            3333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696999999A4A0A0
            C0C0C0CCCCCCA4A0A07777779999999696969696969696969696969696969696
            96969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            3333993333996666996666292929FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF969696969696868686969696777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF993333292929FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF969696777777FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
        end
      end
    end
    object TsWorkMode: TTabSheet
      Caption = #1056#1077#1078#1080#1084' '#1087#1088#1072#1094#1110
      ImageIndex = 4
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
        Left = 40
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
      object lblWorkModeAccept: TLabel
        Left = 16
        Top = 80
        Width = 239
        Height = 13
        Caption = #1042#1080#1075#1083#1103#1076' '#1075#1088#1072#1092#1110#1082#1072' '#1088#1086#1073#1086#1090#1080' '#1079' '#1076#1072#1090#1080' '#1087#1088#1080#1081#1086#1084#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ShiftEdit: TcxSpinEdit
        Left = 98
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
      object WorkModeGrid: TcxGrid
        Left = 16
        Top = 104
        Width = 626
        Height = 57
        TabOrder = 2
        object WorkModeGridTableView: TcxGridTableView
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsView.GroupByBox = False
          Styles.StyleSheet = qizzStyle
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
      object WorkModeSprav: TcxButtonEdit
        Left = 99
        Top = 8
        Width = 342
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
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.ButtonStyle = btsDefault
        Style.ButtonTransparency = ebtNone
        TabOrder = 0
      end
      object ShiftControl: TqFInvisControl
        Left = 165
        Top = 42
        Width = 92
        Height = 21
        FieldName = 'Work_Mode_Shift'
        DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 3
        AutoSaveToRegistry = False
      end
      object IdWorkModeControl: TqFInvisControl
        Left = 447
        Top = 8
        Width = 82
        Height = 21
        FieldName = 'Id_Work_Mode'
        DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 4
        AutoSaveToRegistry = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 355
    Width = 642
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object FormControl: TqFFormControl
      Left = 264
      Top = 8
      Width = 60
      Height = 21
      ControlsOwner = Owner
      InsertSQL.Strings = (
        'EXECUTE PROCEDURE UP_DT_MAN_MOVING_BUFF_ACC_INS ('
        '   :DATE_BEG,'
        '   :DATE_END,'
        '    :ID_PCARD,'
        '    :ID_DEPARTMENT,'
        '    :IS_TARIF,'
        '    :ID_POST_SALARY_REAL,'
        '    :ID_POST_SALARY,'
        '    :ID_TYPE_POST,'
        '    :IS_POST_MAIN,'
        '    :ID_WORK_REASON,'
        '    :ID_WORK_CONDITION,'
        '    :ID_PAY_FORM,'
        '    :ID_MAN_HOSPITAL,'
        '    :ID_MAN_HOLIDAY,'
        '    :TRIAL_TERM,'
        '    :TRAINING_TERM,'
        '    :KEY_SESSION,'
        '    :ID_ACCEPT_COND,'
        '    :ACCEPT_BEG,'
        '    :ACCEPT_END,'
        '    :NOTE,'
        '    :NUM_ITEM,'
        '    :NUM_SUB_ITEM,'
        '    :ID_ORDER,'
        '    :ID_ORDER_TYPE,'
        '    :REASON,'
        '    :Id_Type_Away,'
        '    :Id_PCard_Away,'
        '    :Id_Key,'
        '    :Id_Work_Mode,'
        '    :Work_Mode_Shift, '
        '   :month_hours_count'
        ')')
      UpdateSQL.Strings = (
        'execute procedure UP_DT_MAN_MOVING_BUFF_ACC_upd (:key_session,'
        '   :DATE_BEG,'
        '   :DATE_END,'
        '   :where,'
        '    :ID_PCARD,'
        '    :ID_DEPARTMENT,'
        '    :IS_TARIF,'
        '    :ID_POST_SALARY_REAL,'
        '    :ID_POST_SALARY,'
        '    :ID_TYPE_POST,'
        '    :IS_POST_MAIN,'
        '    :ID_WORK_REASON,'
        '    :ID_WORK_CONDITION,'
        '    :ID_PAY_FORM,'
        '    :ID_MAN_HOSPITAL,'
        '    :ID_MAN_HOLIDAY,'
        '    :TRIAL_TERM,'
        '    :TRAINING_TERM,'
        '    :ID_ACCEPT_COND,'
        '    :ACCEPT_BEG,'
        '    :ACCEPT_END,'
        '    :REASON,'
        '    :NOTE,'
        '    :Id_Type_Away,'
        '    :Id_PCard_Away,'
        '    :Id_Key,'
        '    :Id_Work_Mode,'
        '    :Work_Mode_Shift,'
        '    :month_hours_count)')
      SelectSQL.Strings = (
        'SELECT * FROM UP_DT_MAN_MOVING_BUFF_SELECT(:where)')
      AddCaption = #1055#1088#1080#1081#1085#1103#1090#1080
      ModifyCaption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1087#1088#1080#1081#1086#1084
      InfoCaption = #1053#1072#1082#1072#1079' '#1085#1072' '#1087#1088#1080#1081#1086#1084
      DatabaseEventBefore = FormControlDatabaseEventBefore
      DatabaseEventAfter = FormControlDatabaseEventAfter
      Mode = fmAdd
      CheckWhere = True
      CloseForm = False
      ShowErrorDialog = False
      ShowDebugInfoInOk = False
    end
    object OkButton: TBitBtn
      Left = 80
      Top = 4
      Width = 177
      Height = 30
      Action = AcceptAction
      Caption = #1055#1110#1076#1090#1074#1077#1088#1076#1080#1090#1080' '#1079#1084#1110#1085#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      Glyph.Data = {
        8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
        180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003300FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0033000099
        33003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
        969696666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00330000
        9933009900009933003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6666
        66969696868686999999666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003300
        009933009933009900009900009933003300FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66
        6666999999999999969696969696999999666666FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0033
        0033CC3333CC3333CC33009933003300009933009900009933003300FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        666666C0C0C0B2B2B2B2B2B2969696666666999999969696999999666666FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        330000800033CC6633CC33339933003300FFFFFF003300009933009900009933
        003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF666666868686C0C0C0C0C0C0A4A0A0666666FFFFFF66666699999996969699
        9999666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF00330033CC6633CC66339933003300993333FFFFFFFFFFFF0033000080
        00009900009933003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF666666CCCCCCC0C0C0B2B2B2666666808080FFFFFFFFFFFF666666
        868686969696999999666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF003300339933339933003300CC3333CC6666993333FFFFFFFF
        FFFFFFFFFF003300009900009933FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF666666A4A0A0B2B2B2666666969696999999808080FFFF
        FFFFFFFFFFFFFF666666969696969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF993333003300003300CC6666CC3333CC3333CC6666
        993333FFFFFFFFFFFFFFFFFF003300009933003300FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF80808066666666666699999999999996969699
        9999808080FFFFFFFFFFFFFFFFFF666666969696666666FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF993333CC3333CC6666CC6666CC3333993333CC66
        66CC3333CC6666993333FFFFFFFFFFFFFFFFFF003300009900003300FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080969696B2B2B2A4A0A0999999808080
        A4A0A0969696999999808080FFFFFFFFFFFFFFFFFF666666969696666666FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF993333CC3333CC6666CC6666CC6666993333FF
        FFFF993333CC6666CC3333CC6666993333FFFFFFFFFFFFFFFFFF003300008000
        003300FFFFFFFFFFFFFFFFFFFFFFFF808080969696C0C0C0B2B2B2A4A0A08080
        80FFFFFF808080999999969696999999808080FFFFFFFFFFFFFFFFFF66666686
        8686666666FFFFFFFFFFFFFFFFFFFFFFFF993333CC9999CC9999CC9999993333
        FFFFFFFFFFFFFFFFFF993333CC3333CC3333CC3333993333FFFFFFFFFFFFFFFF
        FF003300006600003300FFFFFFFFFFFFFFFFFF808080C0C0C0C0C0C0C0C0C080
        8080FFFFFFFFFFFFFFFFFF808080868686999999999999808080FFFFFFFFFFFF
        FFFFFF666666777777666666FFFFFFFFFFFFFFFFFF993333CC6666CC9999CC66
        66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333CC3333CC3333993333FF
        FFFFFFFFFFFFFFFFFFFFFF003300003300FFFFFFFFFFFF808080A4A0A0C0C0C0
        B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080809999999999998080
        80FFFFFFFFFFFFFFFFFFFFFFFF666666666666FFFFFFFFFFFFFFFFFF993333CC
        6666993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333CC3333
        CC3333993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003300FFFFFFFFFFFF8080
        80B2B2B2808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808099
        9999969696808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666FFFFFFFFFFFF
        FFFFFF993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF993333CC3333CC3333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF808080868686969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFCC3333993333FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686808080FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333993333FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
        3333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
    end
    object CancelButton: TBitBtn
      Left = 385
      Top = 3
      Width = 144
      Height = 30
      Caption = #1042#1110#1076#1084#1110#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      OnClick = CancelButtonClick
      Glyph.Data = {
        8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
        180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000066000066FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000066000066
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6666
        66666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66
        6666666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660033FF0033FF
        0033FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660000CC0000
        FF0000FF0000FF000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666B2
        B2B2B2B2B2A4A0A0969696666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
        969696999999999999999999666666FFFFFFFFFFFFFFFFFFFFFFFF0000660000
        CC0033FF0033FF0033FF0000CC000066FFFFFFFFFFFFFFFFFF0000660000CC00
        00FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        666666A4A0A0B2B2B2B2B2B2B2B2B2969696666666FFFFFFFFFFFFFFFFFF6666
        66969696999999999999999999969696666666FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF0000660000CC0033FF0033FF0033FF0000CC000066FFFFFF0000660000CC
        0000FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF666666A4A0A0B2B2B2B2B2B2B2B2B2999999666666FFFFFF66
        6666999999999999999999999999969696666666FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF0000660000CC0033FF0033FF0033FF0000CC0000660000
        CC0000FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4A0A0B2B2B2B2B2B2B2B2B2999999
        666666999999999999999999999999969696666666FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660000CC0033FF0033FF0033FF00
        00FF0000FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4A0A0B2B2B2B2B2
        B2B2B2B2999999999999999999999999969696666666FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660000CC0033FF
        0033FF0000FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4
        A0A0B2B2B2B2B2B2A4A0A0A4A0A0999999969696666666FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        660033CC0033FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF666666A4A0A0B2B2B2A4A0A0A4A0A0999999666666FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        00660033CC0033FF0033FF0033FF0033FF0033FF0000CC000066FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF666666B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A0A0666666FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000660033CC0033FF0033FF0033FF0033CC0033FF0033FF0033FF0000CC0000
        66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF666666B2B2B2B2B2B2B2B2B2B2B2B2A4A0A0B2B2B2B2B2B2B2B2B2
        A4A0A0666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0000660033CC0033FF0033FF0033FF0033CC0000660033CC0033FF0033FF00
        33FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF666666B2B2B2C0C0C0B2B2B2B2B2B2B2B2B2666666A4A0A0B2B2
        B2B2B2B2B2B2B2A4A0A0666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF0000660033CC0033FF0033FF0033FF0033CC000066FFFFFF0000660000CC
        0033FF0033FF0033FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF666666B2B2B2C0C0C0C0C0C0C0C0C0A4A0A0666666FFFFFF66
        6666A4A0A0B2B2B2B2B2B2B2B2B2A4A0A0666666FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF0000660033CC0033FF0033FF0033FF0033CC000066FFFFFFFFFFFFFFFF
        FF0000660000CC0033FF0033FF0033FF0033CC000066FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF666666C0C0C0C0C0C0C0C0C0C0C0C0A4A0A0666666FFFFFF
        FFFFFFFFFFFF666666999999B2B2B2B2B2B2B2B2B2A4A0A0666666FFFFFFFFFF
        FFFFFFFFFFFFFF0000663333FF3333FF3333FF0033CC000066FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000660000CC0033FF0033FF0033CC000066FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF666666C0C0C0C0C0C0C0C0C0A4A0A0666666FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF666666999999B2B2B2B2B2B2A4A0A0666666FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000663333CC0033CC000066FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660033CC0033CC000066FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666C0C0C0B2B2B2666666FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4A0A0B2B2B2666666
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
    end
    object KeySession: TqFInvisControl
      Left = 544
      Top = 8
      Width = 81
      Height = 21
      FieldName = 'KEY_SESSION'
      DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
      Interval = 120
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = True
      Enabled = True
      Blocked = False
      TabOrder = 2
      AutoSaveToRegistry = False
    end
    object qFIC_NumItem: TqFInvisControl
      Left = 328
      Top = 16
      Width = 49
      Height = 21
      FieldName = 'num_item'
      DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
      Interval = 120
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = True
      Enabled = True
      Blocked = False
      TabOrder = 3
      AutoSaveToRegistry = False
    end
    object qFIC_NumSubItem: TqFInvisControl
      Left = 304
      Top = 0
      Width = 73
      Height = 21
      FieldName = 'num_sub_item'
      DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
      Interval = 120
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = True
      Enabled = True
      Blocked = False
      TabOrder = 4
      AutoSaveToRegistry = False
    end
    object qFIC_IdOrder: TqFInvisControl
      Left = 0
      Top = 24
      Width = 65
      Height = 21
      FieldName = 'id_order'
      DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
      Interval = 120
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = True
      Enabled = True
      Blocked = False
      TabOrder = 5
      AutoSaveToRegistry = False
    end
    object qFIC_IdType: TqFInvisControl
      Left = 0
      Top = 0
      Width = 65
      Height = 21
      FieldName = 'id_order_type'
      DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
      Interval = 120
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = True
      Enabled = True
      Blocked = False
      TabOrder = 6
      AutoSaveToRegistry = False
    end
  end
  object AL_OrdAcc: TActionList
    Images = IL_OrdAcc
    Left = 400
    Top = 320
    object A_Add: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      Hint = #1044#1086#1076#1072#1090#1080' '#1076#1078#1077#1088#1077#1083#1086' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      ImageIndex = 0
      ShortCut = 45
    end
    object A_Modif: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1076#1078#1077#1088#1077#1083#1086' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      ImageIndex = 1
      ShortCut = 113
    end
    object A_Del: TAction
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080
      Hint = #1042#1080#1083#1091#1095#1080#1090#1080' '#1076#1078#1077#1088#1077#1083#1086' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      ImageIndex = 2
      ShortCut = 46
      OnExecute = A_DelExecute
    end
    object AcceptAction: TAction
      Caption = #1055#1110#1076#1090#1074#1077#1088#1076#1080#1090#1080' '#1079#1084#1110#1085#1080
      ShortCut = 121
      OnExecute = AcceptActionExecute
    end
    object RefreshAction: TAction
      Caption = #1054#1085#1086#1074#1080#1090#1080
      Hint = #1054#1085#1086#1074#1080#1090#1080' '#1076#1072#1085#1110
      ImageIndex = 3
    end
    object AddBonus: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = AddBonusExecute
    end
    object ModifyBonus: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = ModifyBonusExecute
    end
    object DeleteBonus: TAction
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080
    end
    object AuxAction: TAction
      Caption = 'AuxAction'
      ShortCut = 8315
      OnExecute = AuxActionExecute
    end
    object DelBonus: TAction
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080
      OnExecute = DelBonusExecute
    end
  end
  object IL_OrdAcc: TImageList
    Height = 24
    ShareImages = True
    Width = 24
    Left = 440
    Top = 320
    Bitmap = {
      494C010104000900040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000060000000480000000100200000000000006C
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFD6B500F7DEB500F7D6AD00F7D6A500F7CE9C00EFCE9400EFC69400EFC6
      8C00EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFC6
      8400EFBD7B009C6B6300000000000000000093655F00A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A46769000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFD6BD00F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC69400EFC6
      8C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093655F00EED4B800F2DABC00F2D5
      B100EDCEA700E6C79D00E1C09300DEBB8C00E1BB8800E5BC8400E7BC8100E7BC
      7E00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC7E009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000005B7000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFD6C600F7E7C600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC6
      9400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093655F00ECD5C200F4DEC000F0D8
      B700E9CCAB00D9BD9900C9AD8900C1A57F00C6A67E00D1AF7F00DAB47F00E1B7
      7D00E3BA7D00E7BC7E00E9BD7F00E9BD7F00EABF7F00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000005
      B7000005B7000005B70000000000000000000000000000000000996666009966
      6600996666009966660099666600996666009966660099666600996666009966
      6600996666009966660099666600996666009966660099666600996633000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFDEC600F7E7C600F7DEBD00F7DEB500F7D6B500F7D6AD00EFCEA500EFCE
      9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093655F00EFDAC500F6E1C600F2DA
      BC00E6CEAF00222123003E3935008C7960009D876700AA8F6B00B89A6F00C7A4
      7400D1AB7500DEB57900E5BB7D00E7BC7E00EABF7F00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000005B70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000005B700000000000000000000000000000000000000000099666600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600FFCC9900FFCC9900FFCC
      9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC6600996633000000
      0000000000000000000000000000000000000000000000000000000000009463
      6300F7DECE00FFE7CE00F7E7C600F7DEBD00F7DEB500F7D6B500EFCEA500DEBD
      9400D6B58C00D6B58400DEB58400E7BD8400EFBD8400EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093656000F0DECB00F7E5CE00F4DE
      C500EAD4B6003C3835001F1F2100182A330034434400836F56008E7759009E83
      5F00B2926800C7A36F00D9B17600E3BA7D00E7BC7E00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000005B7000005
      B70000000000000000000000000000000000000000000000000099666600F0CA
      A600FFECCC00F0CAA600F0CAA600F0CAA600F0CAA600FFCC9900FFCC9900FFCC
      9900FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600CCCC6600996633000000
      0000000000000000000000000000000000000000000000000000000000009463
      6300F7E7D600FFEFD600F7E7CE00F7DEC600F7DEBD00F7DEBD00DEC6A500BDA5
      8400AD947300A58C6B00BD9C7300DEB58400EFC68C00EFBD8400EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000095666000F2E2D300FAEAD700F6E3
      CE00F0DAC200AC9D8A00113B4E0004689A00064F75000C3C52003A4948007764
      4C0089725300A4865F00BC996900D1AB7300E1B77900E3BA7B009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000005
      B7000005B7000005B7000005B7000005B7000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000005B7000005B7000000
      000000000000000000000000000000000000000000000000000099666600FFCC
      CC00FFECCC00F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600FFCC9900FFCC
      9900FFCC9900FFCC6600FFCC6600FFCC6600FFCC6600CCCC6600996633000000
      0000000000000000000000000000000000000000000000000000000000009C6B
      6300F7E7DE00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEBD00004A0000004A
      0000004A0000004A0000A58C6B00D6B58400EFC68C00EFC68C00EFBD8400EFBD
      7B00E7BD7B009C6B6300000000000000000098696300F2E6DA00FAEEDE00F7E7
      D400F4E1CA00EBD8BD001A3E4D00036A9D00056798001B506E002A3440004135
      38006A5542007E694C00987D5800B2916300CCA66E00DAB177009D6D5F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000006F6000005B7000005B7000005B7000005B70000000000000000000000
      000000000000000000000005B7000005B7000005B7000005B700000000000000
      000000000000000000000000000000000000000000000000000099666600FFEC
      CC00FFECCC00F0CAA60000800000F0CAA600F0CAA600CCCC6600008000000080
      00000080000099996600FFCC6600FFCC6600FFCC6600CCCC6600996633000000
      0000000000000000000000000000000000000000000000000000000000009C6B
      6300F7EFE700FFF7E700FFEFDE00F7E7CE00E7D6BD00DECEB500004A00000894
      100000940800004A0000A58C6B00C6AD8400D6B58400DEB58400E7BD8400EFBD
      8400E7BD7B009C6B630000000000000000009E6E6400F4EAE100FBF2E600F8EB
      DC00F7E6D300F3E0CA0074868600045983003150650095606000AA6E6E00965D
      5D00643B3A0065524000766347008E745100A9895D00C09C690096695A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000005B7000005B700000000000000
      00000005B7000005B7000005B7000005B7000005B70000000000000000000000
      000000000000000000000000000000000000000000000000000099666600FFEC
      CC00FFECCC00FFECCC00008000000080000000800000CCCC6600F0CAA600F0CA
      A600F0CAA600CCCC660000800000FFCC9900FFCC6600CCCC6600996633000000
      000000000000000000000000000000000000000000000000000000000000A573
      6300F7EFEF00FFF7EF00FFEFE700E7DECE00C6B5A500AD9C8C00004A0000089C
      1800089C1000004A000094846B00A58C6B00A58C6B00BD9C7300DEB58400EFC6
      8C00E7BD84009C6B63000000000000000000A3726600F6EEE900FCF6ED00F8EE
      E300F7EADA00F7E6D300F0DECB000B4159008C5B5B00CC8E8E00BB7E7E00AA6E
      6E00965D5D00643B3A0064513E006F5D4300826C4B009A7E5500865D51000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000005B7000005B7000005
      B7000005B7000005B7000005B7000005B7000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099666600EAEA
      EA00FFECCC00FFECCC0000800000008000000080000000800000F0CAA600F0CA
      A600F0CAA600F0CAA60000800000FFCC9900FFCC6600CCCC6600996633000000
      000000000000000000000000000000000000000000000000000000000000A573
      6B00FFF7F700FFFFF700FFF7EF00004A0000004A0000004A0000004A000010A5
      210008A51800004A0000004A0000004A0000004A0000A58C6B00D6B58400EFC6
      8C00EFBD84009C6B63000000000000000000A7756800F8F3F000FEFBF600FBF3
      EA00F8EEE300F8EBDC00F6E6D1004E6C76009C696900DC9D9D00CB8C8C00BA7D
      7D00A96D6D00915959005A35350062503D006A5841007B664800735046000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000006F6000005
      B7000006F6000005B7000005B700000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099666600EAEA
      EA00F1F1F100FFECCC000080000000800000008000000080000000800000F0CA
      A600F0CAA600F0CAA600F0CAA600FFCC9900FFCC9900CCCC6600996633000000
      000000000000000000000000000000000000000000000000000000000000AD7B
      6B00FFF7F700FFFFFF00FFFFF700004A000021C6420021C6420018BD390018B5
      310010AD290010A5210008A51800089C1000004A0000AD947300D6B58C00EFCE
      9400EFC68C00A57363000000000000000000AC796900FAF6F400FFFFFE00FDF8
      F300FBF2E900F8EEE300F8EBDA00F4E3D0007B504F00E2A4A400DC9D9D00CB8C
      8C00BA7D7D00A96D6D008C5757005A353500604F3D006C59410062443C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000006F6000005B70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099666600F1F1
      F100F1F1F100EAEAEA00FFECCC00FFECCC00FFECCC00FFECCC00F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600FFCC9900CCCC9900996633000000
      000000000000000000000000000000000000000000000000000000000000B57B
      6B00FFF7F700FFFFFF00FFFFFF00004A000029D6520029CE4A0021C6420018BD
      390018B5310010B5290010AD210010A52100004A0000BDA58400DEBD9400EFCE
      9C00EFC69400A57363000000000000000000B17E6B00FAF6F400FFFFFF00FFFE
      FB00FEF7F000FBF3EA00FAEEE300F8EAD900E1CCBB007B504F00E2A3A300DC9D
      9D00CA8B8B00B87B7B00A76C6C008B5656005A35350066523F00583F37000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000006F6000005
      B7000005B7000006F6000006F600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099666600F8F8
      F800F8F8F800F1F1F100FFECCC00FFECCC00FFECCC00FFECCC00008000000080
      0000008000000080000000800000F0CAA600FFCC9900FFCC9900996633000000
      000000000000000000000000000000000000000000000000000000000000B584
      6B00FFF7F700FFFFFF00FFFFFF00004A0000004A0000004A0000004A000021CE
      4A0021C64200004A0000004A0000004A0000004A0000E7C6A500EFCEA500F7CE
      A500EFCE9C009C7363000000000000000000B6816C00FAF6F400FFFFFF00FFFF
      FF00FFFCFB00FEF7F200FBF3EA00F8EEE300F8EBDC00E1CCBB0073484700E1A3
      A300DA9C9C00C98B8B00B87B7B00A76C6C008B5656005D383600533C35000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000006F6000005B7000006
      F6000006F6000006F6000005B7000006F6000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099666600F8F8
      F80000000000F1F1F10000800000FFECCC00FFECCC00FFECCC00FFECCC000080
      0000008000000080000000800000F0CAA600F0CAA600FFCC9900996633000000
      000000000000000000000000000000000000000000000000000000000000BD84
      6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700004A000029D6
      5A0029CE5200004A0000AD9C8C00DECEB500F7DEBD00F7DEB500F7D6AD00EFD6
      A500CEB594008C6B63000000000000000000BB846E00FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFEFB00FEF7F200FBF3EA00FAEEE300F8EAD900BBA196007348
      4700E1A1A100DA9A9A00C98B8B00B77A7A00A66B6B008B5555005A3535000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000006F6000006F6000006F6000005B7000006F6000000
      0000000000000006F6000006F6000006F6000006F60000000000000000000000
      0000000000000000000000000000000000000000000000000000CC666600F8F8
      F80000000000F8F8F80000800000C0DCC000FFECCC00FFECCC00FFECCC00CCCC
      9900008000000080000000800000F0CAA600F0CAA600F0CAA600996633000000
      000000000000000000000000000000000000000000000000000000000000C68C
      6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004A000031DE
      630031DE5A00004A0000C6B5A500E7D6BD00F7DEC600F7DEBD00E7CEAD00C6B5
      9400A5947B00846363000000000000000000C0896F00FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2E900FAEEE300F8EBDA00BBA1
      960073484700E1A1A100D99A9A00C78A8A00B77A7A00A66B6B008B5555005A35
      3500000000000000000000000000000000000000000000000000000000000000
      0000000000000006F6000006F6000005B7000006F6000006F600000000000000
      000000000000000000000006F6000006F6000006F6000006F600000000000000
      0000000000000000000000000000000000000000000000000000CC996600F8F8
      F8000000000000000000C0DCC00000800000C0DCC000FFECCC00CCCC99000080
      0000CCCC99000080000000800000F0CAA600F0CAA600F0CAA600996633000000
      000000000000000000000000000000000000000000000000000000000000C68C
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004A0000004A
      0000004A0000004A0000E7DECE00F7E7CE00FFEFD600E7D6BD00BDAD9C00A59C
      8C00A5948400846B63000000000000000000C58C7000FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FDF8F300FBF3EA00F8EEE300F8EA
      D900BCA1960091606000EBAAAA00D9999900C78A8A00B6797900804E4E004148
      5500354756000000000000000000000000000000000000000000000000000000
      00000006F6000006F6000006F6000006F6000006F60000000000000000000000
      0000000000000000000000000000000000000006F6000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000CC996600F8F8
      F800000000000000000000000000C0DCC000008000000080000000800000CCCC
      9900FFECCC00FFECCC0000800000F0CAA600F0CAA600CCCC9900996633000000
      000000000000000000000000000000000000000000000000000000000000CE94
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7E700EFD6C6009C635A009C635A0094635A009463
      5A0094635A009C6B5A000000000000000000CB917300FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7F000FBF2E900FBF2
      E600ECD5C20084544C0091606000EBAAAA00D9999900534E5700028AC40000AA
      EA0000A6E6000087C40000000000000000000000000000000000000000000006
      F6000006F6000006F6000006F6000006F6000000000000000000000000000000
      000000000000000000000000000000000000000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000CC996600F8F8
      F80000000000000000000000000000000000F8F8F800F1F1F100F1F1F100FFEC
      CC00FFECCC00FFECCC00FFECCC00FFECCC00CCCC990099996600996633000000
      000000000000000000000000000000000000000000000000000000000000CE94
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFFFEF00DEC6B5009C635A00DEA56B00DE9C4A00E794
      3900EF8C2100A56B6B000000000000000000CF967400FBF7F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FCF7F000FFFA
      EF00DAC0B6009F675B00AA78560091606000C2898900097BAB0000BDFF0000BD
      FF0000A6E600001C9D00000082000000000000000000000000000006F6000006
      F6000006F6000006F6000006F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000006
      F600000000000000000000000000000000000000000000000000CC996600F8F8
      F8000000000000000000000000000000000000000000F8F8F800F1F1F100F1F1
      F100FFECCC00FFECCC00FFECCC00F0CAA6009999990096969600996633000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700DEC6BD009C635A00EFB57300EFAD5200F7A5
      3100A56B6B00000000000000000000000000D4987500FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FFFE
      F700DDC4BC009F675B00EAB47400B77D460073474700009FDE0000BDFF00008C
      D100001C9D00010D9D00010A970000008200000000000006F6000006F6000006
      F6000006F6000006F60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC996600F8F8
      F80000000000000000000000000000000000000000000000000000000000F8F8
      F800F8F8F800F0CAA60099666600CC996600CC993300FF993300996666000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEC6C6009C635A00EFB57300EFA55200A56B
      6B0000000000000000000000000000000000D4987500FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DDC7C2009F675B00EAB27300EFA751007A494A000093D10000B1F200012B
      A7000725DC000420B800021DB100010A9700000000000006F6000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC996600F8F8
      F800000000000000000000000000000000000000000000000000000000000000
      0000F8F8F800CBCBCB0099666600FFCC6600FF99330099666600000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6CE009C635A00EFB57300A56B6B000000
      000000000000000000000000000000000000D4987500FFFFFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E2D0CE009F675B00EDB57200A5686B0000000000000000000084C1000C21
      BF002D4FF6000F2ECC00031EB10000058F00000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC996600F8F8
      F800000000000000000000000000000000000000000000000000000000000000
      000000000000CCCCCC0099666600FFCC66009966660000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D694
      7300E7C6AD00E7C6B500E7C6B500E7C6B500E7C6B500E7C6AD00DEBDAD00DEBD
      AD00DEBDAD00D6B5AD00D6B5AD00C69C94009C635A00A56B6B00000000000000
      000000000000000000000000000000000000CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E68009F675B00A5686B00000000000000000000000000000000001624
      BF005270FC001839E30001099700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC9966000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D7D7D70099666600FFCC66000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001322BD00050DA50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC996600CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600CC996600CC99660099666600996666000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000480000000100010000000000600300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
      00000000000000000000000000000000E00003FFFFFFFFFFFFFFFFFFE0000300
      001FFFFFF9FFFFFFE0000300001FFFFFF1FFFFFFE0000300001FC7FFE3C0001F
      E0000300001FC3FF87C0001FE0000300001FC1FF0FC0001FE0000300001FE0FE
      1FC0001FE0000300001FF07C3FC0001FE0000300001FFC307FC0001FE0000300
      001FFE00FFC0001FE0000300001FFF01FFC0001FE0000300001FFF83FFC0001F
      E0000300001FFF01FFC0001FE0000300001FFE00FFC8001FE0000300001FFC18
      7FC8001FE0000300000FF83C3FCC001FE00003000007F07F1FCE001FE0000300
      0003E0FF8FCF001FE00003000001C1FFEFCF801FE0000700000083FFFFCFE01F
      E0000F00000087FFFFCFF03FE0001F0000C08FFFFFCFF87FE0003F0001E1FFFF
      FFDFF8FFFFFFFFFFFFF3FFFFFFC000FF00000000000000000000000000000000
      000000000000}
  end
  object DS_Smets: TDataSource
    DataSet = UPAcceptDM.Smets
    Left = 220
    Top = 200
  end
  object ActionControl: TqFActionControl
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE UP_DT_MAN_SMET_BUFF_ACC_DEL :where')
    SelectDataSet = UPAcceptDM.Smets
    KeyFields = 'ID_REC'
    RefreshAction = RefreshAction
    Database = UPAcceptDM.DB
    AddFormClass = 'TUP_AccAddSmetaForm'
    AddAction = A_Add
    ModifyAction = A_Modif
    BeforePrepare = ActionControlBeforePrepare
    AfterRefresh = ActionControlAfterRefresh
    CanEdit = ActionControlCanEdit
    Left = 108
    Top = 184
  end
  object StyleRepository: TcxStyleRepository
    Left = 392
    Top = 192
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
  object ShrDataSource: TDataSource
    Left = 260
    Top = 200
  end
end
