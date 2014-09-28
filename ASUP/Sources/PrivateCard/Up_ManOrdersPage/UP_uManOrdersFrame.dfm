object fmManOrdersPage: TfmManOrdersPage
  Left = 0
  Top = 0
  Width = 723
  Height = 435
  TabOrder = 0
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 56
    Align = alTop
    TabOrder = 0
    object cbLevels: TcxCheckBox
      Left = 10
      Top = 3
      Width = 239
      Height = 21
      AutoSize = False
      Constraints.MinWidth = 170
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cbLevelsPropertiesChange
      Properties.Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1086' '#1088#1110#1074#1085#1102' '#1072#1082#1090#1091#1072#1083#1100#1085#1086#1089#1090#1110
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object LevelEdit: TcxButtonEdit
      Left = 248
      Top = 2
      Width = 221
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = LevelEditPropertiesButtonClick
      TabOrder = 1
    end
    object cbAllOrders: TcxCheckBox
      Left = 10
      Top = 28
      Width = 170
      Height = 21
      AutoSize = False
      Constraints.MinWidth = 170
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cbAllOrdersPropertiesChange
      Properties.Caption = #1042#1089#1110' '#1085#1072#1082#1072#1079#1080
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
  end
  object ManOrdersGrid: TcxGrid
    Left = 0
    Top = 56
    Width = 723
    Height = 379
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object ManOrdersGridDBView: TcxGridDBTableView
      OnKeyDown = ManOrdersGridDBViewKeyDown
      DataController.DataSource = ManOrdersSource
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
      object ManOrdersGridDBViewDBColumn1: TcxGridDBColumn
        Caption = #1055#1110#1076#1089#1090#1072#1074#1072' '#1088#1086#1073#1086#1090#1080
        Visible = False
        GroupIndex = 0
        Options.Filtering = False
        SortOrder = soDescending
        DataBinding.FieldName = 'Work_Reason_Full'
      end
      object ManOrdersGridDBViewDBColumn2: TcxGridDBColumn
        Caption = #1058#1088#1091#1076#1086#1074#1080#1081' '#1076#1086#1075#1086#1074#1086#1088
        Visible = False
        GroupIndex = 1
        Options.Filtering = False
        SortOrder = soAscending
        DataBinding.FieldName = 'Work_Dog_Str'
      end
      object ManOrdersGridDBViewDBColumn3: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1085#1072#1082#1072#1079#1091
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 120
        DataBinding.FieldName = 'TYPE_NAME'
      end
      object ManOrdersGridDBViewDBColumn4: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1072#1079#1091
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 50
        DataBinding.FieldName = 'NUM_ORDER'
      end
      object ManOrdersGridDBViewDBColumn5: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1085#1072#1082#1072#1079#1091
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 60
        DataBinding.FieldName = 'DATE_ORDER'
      end
      object ManOrdersGridDBViewDBColumn6: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1077#1082#1090#1091
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 60
        DataBinding.FieldName = 'NUM_PROJECT'
      end
      object ManOrdersGridDBViewDBColumn7: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1087#1088#1086#1077#1082#1090#1091
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 60
        DataBinding.FieldName = 'DATE_PROJECT'
      end
    end
    object ManOrdersGridLevel: TcxGridLevel
      GridView = ManOrdersGridDBView
    end
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 8
    Top = 144
  end
  object DSetManOrders: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    distinct *'
      
        'FROM UP_KER_GET_ORDERS_INFO_BY_PCARD(:ID_PCARD, :id_level, :show' +
        '_all )'
      '')
    Left = 8
    Top = 176
    poSQLINT64ToBCD = True
  end
  object ManOrdersSource: TDataSource
    DataSet = DSetManOrders
    Left = 40
    Top = 208
  end
  object WorkDatabase: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 40
    Top = 176
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 40
    Top = 144
  end
  object StyleRepository: TcxStyleRepository
    Left = 8
    Top = 208
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
      Font.Style = []
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
      Font.Style = []
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
      Font.Style = []
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
end
