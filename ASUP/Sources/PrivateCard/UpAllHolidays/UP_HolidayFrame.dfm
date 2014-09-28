object frAllHolidaysPage: TfrAllHolidaysPage
  Left = 0
  Top = 0
  Width = 655
  Height = 399
  TabOrder = 0
  object HolidaysGrid: TcxGrid
    Left = 0
    Top = 49
    Width = 655
    Height = 350
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
    object ReportDataView: TcxGridDBTableView
      DataController.DataSource = PlanTreeSource
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
      Styles.StyleSheet = qizzStyle
      Styles.ContentEven = stContent
      Styles.ContentOdd = stContent
      object ReportDataViewDBColumn1: TcxGridDBColumn
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
      object ReportDataViewDBColumn7: TcxGridDBColumn
        Caption = #1042#1110#1076#1087#1091#1089#1090#1082#1072
        Visible = False
        GroupIndex = 1
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortOrder = soAscending
        Width = 77
        DataBinding.FieldName = 'TYPE_HOLIDAY_NAME'
      end
      object ReportDataViewDBColumn4: TcxGridDBColumn
        Caption = #1055#1077#1088#1110#1086#1076' '#1088#1086#1073#1086#1090#1080' '#1079
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 33
        DataBinding.FieldName = 'PERIOD_BEG'
      end
      object ReportDataViewDBColumn5: TcxGridDBColumn
        Caption = #1055#1077#1088#1110#1086#1076' '#1088#1086#1073#1086#1090#1080' '#1087#1086
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortOrder = soAscending
        Width = 81
        DataBinding.FieldName = 'PERIOD_END'
      end
      object ReportDataViewDBColumn2: TcxGridDBColumn
        Caption = #1047#1072' '#1087#1077#1088#1110#1086#1076' '#1079
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 80
        DataBinding.FieldName = 'PLAN_DATE_BEG'
      end
      object DateBegCol: TcxGridDBColumn
        Caption = #1047#1072' '#1087#1077#1088#1110#1086#1076' '#1087#1086
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 77
        DataBinding.FieldName = 'PLAN_DATE_END'
      end
      object DateEndCol: TcxGridDBColumn
        Caption = #1055#1083#1072#1085#1086#1074#1072' '#1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1076#1085#1110#1074
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 92
        DataBinding.FieldName = 'DAY_COUNT'
      end
      object ReportDataViewDBColumn3: TcxGridDBColumn
        Caption = #1060#1072#1082#1090#1080#1095#1085#1086' '#1074#1080#1082#1086#1088#1080#1089#1090#1072#1085#1086' '#1076#1085#1110#1074
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 88
        DataBinding.FieldName = 'USED_DAY_COUNT'
      end
      object ReportDataViewDBColumn6: TcxGridDBColumn
        Caption = #1053#1077' '#1074#1080#1082#1086#1088#1080#1089#1090#1072#1085#1086' '#1076#1085#1110#1074
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 82
      end
      object ReportDataViewDBColumn8: TcxGridDBColumn
        Caption = #1053#1077' '#1074#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1076#1085#1110#1074
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 86
      end
    end
    object cxGridLevel5: TcxGridLevel
      GridView = ReportDataView
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 655
    Height = 49
    Align = alTop
    TabOrder = 1
    object cxCB_ShowOld: TcxCheckBox
      Left = 9
      Top = 2
      Width = 240
      Height = 21
      AutoSize = False
      Constraints.MinWidth = 170
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCB_ShowOldPropertiesChange
      Properties.Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1090#1110#1083#1100#1082#1080' '#1085#1077' '#1074#1080#1082#1086#1088#1080#1089#1090#1072#1085#1110
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object cxCheckBox2: TcxCheckBox
      Left = 9
      Top = 26
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
      Top = 25
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
