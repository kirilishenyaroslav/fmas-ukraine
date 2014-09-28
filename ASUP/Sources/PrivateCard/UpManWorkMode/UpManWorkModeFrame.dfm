object frmManWorkMode: TfrmManWorkMode
  Left = 0
  Top = 0
  Width = 839
  Height = 600
  TabOrder = 0
  OnResize = FrameResize
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 839
    Height = 28
    Align = alTop
    TabOrder = 0
    object WMDateBeg: TcxDateEdit
      Left = 56
      Top = 3
      Width = 95
      Height = 21
      Properties.OnChange = WMDateBegPropertiesChange
      TabOrder = 1
    end
    object WMDateEnd: TcxDateEdit
      Left = 223
      Top = 3
      Width = 95
      Height = 21
      Properties.OnChange = WMDateEndPropertiesChange
      TabOrder = 3
    end
    object lblWMBeg: TcxLabel
      Left = 3
      Top = 5
      Width = 50
      Height = 17
      ParentFont = False
      Properties.ShadowedColor = clBtnFace
      Properties.Transparent = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Caption = #1044#1072#1090#1072' '#1079
    end
    object lblWMEnd: TcxLabel
      Left = 166
      Top = 5
      Width = 57
      Height = 17
      ParentFont = False
      Properties.ShadowedColor = clBtnFace
      Properties.Transparent = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      TabOrder = 2
      Caption = #1044#1072#1090#1072' '#1087#1086
    end
    object lblFilter: TcxLabel
      Left = 342
      Top = 5
      Width = 176
      Height = 17
      ParentFont = False
      Properties.ShadowedColor = clBtnFace
      Properties.Transparent = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Caption = #1051#1086#1082#1072#1083#1100#1085#1080#1081' '#1092#1110#1083#1100#1090#1088' '#1074' '#1090#1072#1073#1083#1080#1094#1110
    end
    object lblGroupBox: TcxLabel
      Left = 543
      Top = 5
      Width = 149
      Height = 17
      ParentFont = False
      Properties.ShadowedColor = clBtnFace
      Properties.Transparent = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
      Caption = #1055#1072#1085#1077#1083#1100' '#1076#1083#1103' '#1075#1088#1091#1087#1091#1074#1072#1085#1085#1103
    end
    object LocFilterCheck: TcxCheckBox
      Left = 326
      Top = 3
      Width = 21
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = LocFilterCheckPropertiesChange
      TabOrder = 4
    end
    object cxGroupBox: TcxCheckBox
      Left = 524
      Top = 3
      Width = 21
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxGroupBoxPropertiesChange
      Properties.Caption = ''
      TabOrder = 6
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 28
    Width = 839
    Height = 367
    Align = alClient
    Caption = 'Panel4'
    TabOrder = 1
    object WMGrid: TcxGrid
      Left = 1
      Top = 1
      Width = 837
      Height = 357
      Align = alClient
      TabOrder = 0
      object WMGridDBTableView: TcxGridDBTableView
        OnKeyDown = WMGridDBTableViewKeyDown
        DataController.DataSource = ManWorkModeSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsData.Editing = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = qizzStyle
        object WMGridDBTableViewDBColumn1: TcxGridDBColumn
          Caption = #1055#1077#1088#1110#1086#1076
          Visible = False
          GroupIndex = 0
          Options.Filtering = False
          SortOrder = soAscending
          DataBinding.FieldName = 'NAME_POST_PERIOD'
        end
        object WMGridDBTableViewDBColumn2: TcxGridDBColumn
          Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
          Visible = False
          GroupIndex = 1
          Options.Filtering = False
          SortOrder = soAscending
          DataBinding.FieldName = 'NAME_DEPARTMENT'
        end
        object WMGridDBTableViewDBColumn3: TcxGridDBColumn
          Caption = #1055#1086#1089#1072#1076#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 40
          DataBinding.FieldName = 'NAME_POST'
        end
        object WMGridDBTableViewDBColumn4: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 40
          DataBinding.FieldName = 'DATE_BEG'
        end
        object WMGridDBTableViewDBColumn5: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1082#1110#1085#1094#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 40
          DataBinding.FieldName = 'DATE_END'
        end
        object WMGridDBTableViewDBColumn6: TcxGridDBColumn
          Caption = #1056#1077#1078#1080#1084' '#1087#1088#1072#1094#1110
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 150
          DataBinding.FieldName = 'WORK_MODE_NAME'
        end
        object WMGridDBTableViewDBColumn7: TcxGridDBColumn
          Caption = #1047#1089#1091#1074
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 40
          DataBinding.FieldName = 'WORK_MODE_SHIFT_STR'
        end
      end
      object WMGridLevel1: TcxGridLevel
        GridView = WMGridDBTableView
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 358
      Width = 837
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer8Style'
      AlignSplitter = salBottom
      Control = Panel1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 395
    Width = 839
    Height = 205
    Align = alBottom
    TabOrder = 2
    object NoteGrid: TcxGrid
      Left = 459
      Top = 25
      Width = 379
      Height = 179
      Align = alClient
      TabOrder = 0
      object NoteGridDBTableView: TcxGridDBTableView
        OnKeyDown = NoteGridDBTableViewKeyDown
        DataController.DataSource = NoteDSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsData.Editing = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = qizzStyle
        object NoteGridDBTableViewDBColumn1: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1074#1080#1093#1086#1076#1091
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 70
          DataBinding.FieldName = 'Vihod_Name'
        end
        object NoteGridDBTableViewDBColumn2: TcxGridDBColumn
          Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1076#1110#1085#1074
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 43
          DataBinding.FieldName = 'vihod_num'
        end
        object NoteGridDBTableViewDBColumn3: TcxGridDBColumn
          Caption = #1055#1088#1080#1084#1110#1090#1082#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 120
          DataBinding.FieldName = 'note'
        end
        object NoteGridDBTableViewDBColumn4: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1090#1072' '#1095#1072#1089' '#1089#1090#1074#1086#1088#1077#1085#1085#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 50
          DataBinding.FieldName = 'date_create'
        end
      end
      object NoteGridLevel: TcxGridLevel
        GridView = NoteGridDBTableView
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 837
      Height = 24
      Align = alTop
      TabOrder = 1
      object cbMonth: TcxComboBox
        Left = 56
        Top = 1
        Width = 121
        Height = 21
        Properties.OnChange = cbMonthPropertiesChange
        TabOrder = 1
      end
      object YearEdit: TcxSpinEdit
        Left = 209
        Top = 1
        Width = 57
        Height = 21
        Properties.MaxValue = 9999.000000000000000000
        Properties.MinValue = 1900.000000000000000000
        Properties.OnChange = YearEditPropertiesChange
        TabOrder = 3
        Value = 1900
      end
      object lblYear: TcxLabel
        Left = 183
        Top = 1
        Width = 27
        Height = 17
        ParentFont = False
        Properties.ShadowedColor = clBtnFace
        Properties.Transparent = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 2
        Caption = #1056#1110#1082
      end
      object lblMonth: TcxLabel
        Left = 8
        Top = 1
        Width = 50
        Height = 17
        ParentFont = False
        Properties.ShadowedColor = clBtnFace
        Properties.Transparent = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
        Caption = #1052#1110#1089#1103#1094#1100
      end
      object NYearEdit: TcxSpinEdit
        Left = 664
        Top = 1
        Width = 70
        Height = 21
        Properties.MaxValue = 9999.000000000000000000
        Properties.MinValue = 1900.000000000000000000
        Properties.OnChange = NYearEditPropertiesChange
        TabOrder = 4
        Value = 1900
      end
      object NMonthBox: TcxComboBox
        Left = 511
        Top = 2
        Width = 121
        Height = 21
        Properties.OnChange = NMonthBoxPropertiesChange
        TabOrder = 5
      end
      object lblNYear: TcxLabel
        Left = 639
        Top = 3
        Width = 27
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
        Caption = #1056#1110#1082
      end
      object lblNMonth: TcxLabel
        Left = 461
        Top = 3
        Width = 50
        Height = 17
        ParentFont = False
        Properties.ShadowedColor = clBtnFace
        Properties.Transparent = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 7
        Caption = #1052#1110#1089#1103#1094#1100
      end
    end
    object CalendarGrid: TStringGrid
      Left = 1
      Top = 25
      Width = 458
      Height = 179
      Align = alLeft
      Color = 13828095
      ColCount = 7
      FixedColor = 16776434
      FixedCols = 0
      RowCount = 7
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnDrawCell = CalendarGridDrawCell
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 32
    Top = 88
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
    Left = 32
    Top = 120
    object BonusesAct: TAction
      ShortCut = 16450
    end
    object ActFactDaysEdit: TAction
      Caption = 'ActFactDaysEdit'
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
    Top = 88
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Top = 152
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Top = 120
  end
  object ManWorkModeInfo: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 64
    Top = 120
    poSQLINT64ToBCD = True
  end
  object ManWorkModeInfoSource: TDataSource
    DataSet = ManWorkModeInfo
    Left = 96
    Top = 120
  end
  object ManWorkModeSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    OnEndScroll = ManWorkModeSelectEndScroll
    Left = 64
    Top = 88
    poSQLINT64ToBCD = True
  end
  object ManWorkModeSource: TDataSource
    DataSet = ManWorkModeSelect
    Left = 96
    Top = 88
  end
  object WMDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 152
    poSQLINT64ToBCD = True
  end
  object DSetNotes: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 96
    Top = 152
    poSQLINT64ToBCD = True
  end
  object NoteDSource: TDataSource
    DataSet = DSetNotes
    Left = 136
    Top = 152
  end
end
