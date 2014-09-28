object frPCardHolidaysPage: TfrPCardHolidaysPage
  Left = 0
  Top = 0
  Width = 866
  Height = 546
  TabOrder = 0
  object HolidaysGrid: TcxGrid
    Left = 0
    Top = 24
    Width = 866
    Height = 297
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object PlanHolidayDataView: TcxGridDBTableView
      OnKeyDown = PlanHolidayDataViewKeyDown
      DataController.DataSource = PlanTreeSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'DAY_COUNT'
          Column = Col6
        end
        item
          Format = '0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'USED_DAY_COUNT'
          Column = Col7
        end
        item
          Format = '0.00;-0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'NOT_USED_DAY_COUNT'
          Column = Col8
        end>
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
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = qizzStyle
      Styles.ContentEven = stContent
      Styles.ContentOdd = stContent
      object Col0: TcxGridDBColumn
        Caption = #1058#1088#1091#1076#1086#1074#1080#1081' '#1076#1086#1075#1086#1074#1110#1088
        Visible = False
        GroupIndex = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        SortOrder = soAscending
        Width = 203
        DataBinding.FieldName = 'WORK_DOG_STR'
      end
      object Col2: TcxGridDBColumn
        Caption = #1055#1077#1088#1110#1086#1076' '#1088#1086#1073#1086#1090#1080' '#1079
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 34
        DataBinding.FieldName = 'PERIOD_BEG'
      end
      object Col3: TcxGridDBColumn
        Caption = #1055#1077#1088#1110#1086#1076' '#1088#1086#1073#1086#1090#1080' '#1087#1086
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 83
        DataBinding.FieldName = 'PERIOD_END'
      end
      object Col4: TcxGridDBColumn
        Caption = #1047#1072' '#1087#1077#1088#1110#1086#1076' '#1079
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortOrder = soAscending
        Width = 123
        DataBinding.FieldName = 'PLAN_DATE_BEG'
      end
      object Col5: TcxGridDBColumn
        Caption = #1047#1072' '#1087#1077#1088#1110#1086#1076' '#1087#1086
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 162
        DataBinding.FieldName = 'PLAN_DATE_END'
      end
      object Col1: TcxGridDBColumn
        Caption = #1042#1110#1076#1087#1091#1089#1090#1082#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 77
        DataBinding.FieldName = 'TYPE_HOLIDAY_NAME'
      end
      object Col6: TcxGridDBColumn
        Caption = #1055#1083#1072#1085#1086#1074#1072' '#1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1076#1085#1110#1074
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 134
        DataBinding.FieldName = 'DAY_COUNT'
      end
      object Col7: TcxGridDBColumn
        Caption = #1060#1072#1082#1090#1080#1095#1085#1086' '#1074#1080#1082#1086#1088#1080#1089#1090#1072#1085#1086' '#1076#1085#1110#1074
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortOrder = soDescending
        Width = 121
        DataBinding.FieldName = 'USED_DAY_COUNT'
      end
      object Col8: TcxGridDBColumn
        Caption = #1053#1077' '#1074#1080#1082#1086#1088#1080#1089#1090#1072#1085#1086' '#1076#1085#1110#1074
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 74
        DataBinding.FieldName = 'NOT_USED_DAY_COUNT'
      end
      object Col9: TcxGridDBColumn
        Caption = #1053#1077' '#1074#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1076#1085#1110#1074
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 98
      end
      object PlanHolidayDataViewDBColumn1: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'IS_STRIKE'
      end
    end
    object cxGridLevel5: TcxGridLevel
      GridView = PlanHolidayDataView
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 866
    Height = 24
    Align = alTop
    TabOrder = 1
    object cxCB_ShowOld: TcxCheckBox
      Left = 9
      Top = 1
      Width = 240
      Height = 21
      AutoSize = False
      Constraints.MinWidth = 170
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCB_ShowOldPropertiesChange
      Properties.Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1090#1110#1083#1100#1082#1080' '#1085#1077' '#1074#1080#1082#1086#1088#1080#1089#1090#1072#1085#1110
      State = cbsChecked
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object cxCheckBox2: TcxCheckBox
      Left = 449
      Top = 1
      Width = 193
      Height = 21
      AutoSize = False
      Constraints.MinWidth = 170
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox2PropertiesChange
      Properties.Caption = #1051#1086#1082#1072#1083#1100#1085#1080#1081' '#1092#1110#1083#1100#1090#1088' '#1074' '#1090#1072#1073#1083#1080#1094#1110
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object cxCheckBox3: TcxCheckBox
      Left = 251
      Top = 0
      Width = 199
      Height = 21
      AutoSize = False
      Constraints.MinWidth = 170
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox3PropertiesChange
      Properties.Caption = #1055#1072#1085#1077#1083#1100' '#1076#1083#1103' '#1075#1088#1091#1087#1091#1074#1072#1085#1085#1103
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 370
    Width = 866
    Height = 176
    Align = alBottom
    BevelInner = bvNone
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object OView: TcxGridDBTableView
      OnKeyDown = OViewKeyDown
      DataController.DataSource = OrdersDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'DAY_COUNT'
          Column = day_count
        end>
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
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = qizzStyle
      Styles.ContentEven = stContent
      Styles.ContentOdd = stContent
      object OViewDBColumn3: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1085#1072#1082#1072#1079#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 125
        DataBinding.FieldName = 'FULL_TYPE_NAME'
      end
      object OViewDBColumn4: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 77
        DataBinding.FieldName = 'SHORT_NAME'
      end
      object day_count: TcxGridDBColumn
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1076#1085#1110#1074
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 66
        DataBinding.FieldName = 'DAY_COUNT'
      end
      object OViewDBColumn6: TcxGridDBColumn
        Caption = #1047#1072' '#1103#1082#1080#1081' '#1087#1077#1088#1110#1086#1076
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 155
        DataBinding.FieldName = 'PERIOD_TERMS'
      end
      object OViewDBColumn5: TcxGridDBColumn
        Caption = #1055#1077#1088#1110#1086#1076' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 176
        DataBinding.FieldName = 'HOLIDAY_TERMS'
      end
      object cxGridDBColumn1: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1072#1079#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 73
        DataBinding.FieldName = 'NUM_ORDER'
      end
      object cxGridDBColumn2: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1085#1072#1082#1072#1079#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 64
        DataBinding.FieldName = 'DATE_ORDER'
      end
      object OViewDBColumn1: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1077#1082#1090#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 61
        DataBinding.FieldName = 'NUM_PROJECT'
      end
      object OViewDBColumn2: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1087#1088#1086#1077#1082#1090#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 58
        DataBinding.FieldName = 'DATE_PROJECT'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = OView
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 362
    Width = 866
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer8Style'
    AlignSplitter = salBottom
    Control = cxGrid1
  end
  object Panel3: TPanel
    Left = 0
    Top = 321
    Width = 866
    Height = 41
    Align = alBottom
    TabOrder = 4
    object Label1: TLabel
      Left = 5
      Top = 1
      Width = 203
      Height = 13
      Caption = #1047#1072#1081#1084#1072#1085#1072' '#1087#1086#1089#1072#1076#1072' '#1074' '#1087#1083#1072#1085#1086#1074#1086#1074#1086#1084#1091' '#1087#1077#1088#1110#1086#1076#1110':'
    end
    object Label2: TLabel
      Left = 563
      Top = 1
      Width = 6
      Height = 39
      Align = alRight
      Caption = '  '
      OnMouseMove = Label2MouseMove
    end
    object cxDBMemo1: TcxDBMemo
      Left = 569
      Top = 1
      Width = 296
      Height = 39
      Align = alRight
      DataBinding.DataField = 'NOTE'
      DataBinding.DataSource = PlanTreeSource
      Style.Color = clInfoBk
      TabOrder = 0
      Visible = False
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 5
      Top = 17
      Width = 564
      Height = 21
      DataBinding.DataField = 'period_post'
      DataBinding.DataSource = PlanTreeSource
      Style.Color = clInfoBk
      TabOrder = 1
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 48
    Top = 136
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
    object stContentStrike: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsStrikeOut]
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
  object ActionList1: TActionList
    Left = 80
    Top = 136
    object BonusesAct: TAction
      ShortCut = 16450
    end
    object ActFactDaysEdit: TAction
      Caption = 'ActFactDaysEdit'
      OnExecute = ActFactDaysEditExecute
    end
  end
  object DB: TpFIBDatabase
    DBName = '127.0.0.1:D:/Bases/Test/Test.IB'
    DBParams.Strings = (
      'password='
      'user_name=sysdba'
      'lc_ctype=win1251'
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 16
    Top = 176
  end
  object HolidaysSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT'#9'* FROM UP_KER_GET_MOVING_INFO_BY_PCARD(:Id_PCard,:act_dat' +
        'e)'
      'order by ID_WORK_DOG_MOVING asc;')
    Left = 80
    Top = 176
    poSQLINT64ToBCD = True
  end
  object PlanTreeSource: TDataSource
    DataSet = HolidaysSelect
    Left = 80
    Top = 240
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 48
    Top = 176
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 16
    Top = 208
  end
  object OrderDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = PlanTreeSource
    Left = 16
    Top = 240
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object OrdersDataSource: TDataSource
    DataSet = OrderDataSet
    Left = 48
    Top = 240
  end
end
