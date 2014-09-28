object frAllHolidaysPage: TfrAllHolidaysPage
  Left = 0
  Top = 0
  Width = 807
  Height = 378
  TabOrder = 0
  object HolidaysGrid: TcxGrid
    Left = 0
    Top = 26
    Width = 807
    Height = 278
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
      OnKeyDown = ReportDataViewKeyDown
      OnKeyUp = ReportDataViewKeyUp
      DataController.DataSource = PlanTreeSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = ReportDataViewCellClick
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
        Width = 115
        DataBinding.FieldName = 'WORK_DOG_STR'
      end
      object ReportDataViewDBColumn7: TcxGridDBColumn
        Caption = #1042#1110#1076#1087#1091#1089#1090#1082#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 179
        DataBinding.FieldName = 'TYPE_HOLIDAY_NAME'
      end
      object ReportDataViewDBColumn2: TcxGridDBColumn
        Caption = #1044#1085#1110
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 53
        DataBinding.FieldName = 'DAY_COUNT'
      end
      object ReportDataViewDBColumn11: TcxGridDBColumn
        Caption = #1047#1072' '#1103#1082#1080#1081' '#1087#1077#1088#1110#1086#1076
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 140
        DataBinding.FieldName = 'PERIOD_TERM'
      end
      object ReportDataViewDBColumn4: TcxGridDBColumn
        Caption = #1055#1086#1095#1072#1090#1086#1082' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortOrder = soAscending
        Width = 101
        DataBinding.FieldName = 'HOLIDAY_BEG'
      end
      object ReportDataViewDBColumn5: TcxGridDBColumn
        Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 87
        DataBinding.FieldName = 'HOLIDAY_END'
      end
      object ReportDataViewDBColumn10: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1077#1082#1090#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 60
        DataBinding.FieldName = 'NUM_PROJECT'
      end
      object ReportDataViewDBColumn9: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1087#1088#1086#1077#1082#1090#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 59
        DataBinding.FieldName = 'DATE_PROJECT'
      end
      object ReportDataViewDBColumn3: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1072#1079#1091
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 90
        DataBinding.FieldName = 'NUM_ORDER'
      end
      object ReportDataViewDBColumn6: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1085#1072#1082#1072#1079#1091
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 74
        DataBinding.FieldName = 'DATE_ORDER'
      end
      object ReportDataViewDBColumn8: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1085#1072#1082#1072#1079#1091
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 64
        DataBinding.FieldName = 'TYPE_NAME_FULL'
      end
    end
    object cxGridLevel5: TcxGridLevel
      GridView = ReportDataView
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 807
    Height = 26
    Align = alTop
    TabOrder = 1
    object EditNote: TSpeedButton
      Left = 664
      Top = 1
      Width = 137
      Height = 22
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1087#1088#1080#1084#1110#1090#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = EditNoteClick
    end
    object cxCheckBox2: TcxCheckBox
      Left = 301
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
      TabOrder = 0
    end
    object cxCheckBox3: TcxCheckBox
      Left = 492
      Top = 1
      Width = 170
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
      TabOrder = 1
    end
    object cxCB_ShowOld: TcxCheckBox
      Left = 1
      Top = 1
      Width = 304
      Height = 21
      AutoSize = False
      Constraints.MinWidth = 170
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCB_ShowOldPropertiesChange
      Properties.Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1083#1080#1096#1077' '#1072#1082#1090#1091#1072#1083#1100#1085#1110' '#1090#1088#1091#1076#1086#1074#1110' '#1076#1086#1075#1086#1074#1086#1088#1080
      State = cbsChecked
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 304
    Width = 807
    Height = 74
    Align = alBottom
    TabOrder = 2
    object NoteLabel: TLabel
      Left = 1
      Top = 1
      Width = 805
      Height = 72
      Align = alClient
    end
    object Label1: TLabel
      Left = 5
      Top = 5
      Width = 241
      Height = 13
      Caption = #1047#1072#1081#1084#1072#1085#1072' '#1087#1086#1089#1072#1076#1072' '#1074' '#1087#1083#1072#1085#1086#1074#1086#1074#1086#1084#1091' '#1087#1077#1088#1110#1086#1076#1110':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 4
      Top = 48
      Width = 95
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1077#1082#1090#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 206
      Top = 48
      Width = 86
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1088#1086#1077#1082#1090#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 5
      Top = 21
      Width = 796
      Height = 21
      DataBinding.DataField = 'PERIOD_POST'
      DataBinding.DataSource = PlanTreeSource
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxDBTextEdit8: TcxDBTextEdit
      Left = 105
      Top = 45
      Width = 95
      Height = 21
      DataBinding.DataField = 'NUM_PROJECT'
      DataBinding.DataSource = PlanTreeSource
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 297
      Top = 45
      Width = 93
      Height = 21
      DataBinding.DataField = 'DATE_PROJECT'
      DataBinding.DataSource = PlanTreeSource
      Style.Color = clInfoBk
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
    Left = 16
    Top = 240
    poSQLINT64ToBCD = True
  end
  object PlanTreeSource: TDataSource
    DataSet = HolidaysSelect
    Left = 48
    Top = 240
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 48
    Top = 208
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 16
    Top = 208
  end
  object SelManHLF: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 48
    Top = 176
    poSQLINT64ToBCD = True
  end
  object UpdSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 80
    Top = 176
    poSQLINT64ToBCD = True
  end
end
