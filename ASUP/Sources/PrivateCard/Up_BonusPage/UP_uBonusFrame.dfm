object fmPCardBonusPage: TfmPCardBonusPage
  Left = 0
  Top = 0
  Width = 723
  Height = 435
  TabOrder = 0
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 44
    Align = alTop
    TabOrder = 0
    object cxCheckBox1: TcxCheckBox
      Left = 196
      Top = -1
      Width = 193
      Height = 21
      AutoSize = False
      Constraints.MinWidth = 170
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox1PropertiesChange
      Properties.Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1110#1089#1090#1086#1088#1110#1102
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object cxCheckBox2: TcxCheckBox
      Left = 196
      Top = 14
      Width = 183
      Height = 21
      AutoSize = False
      Constraints.MinWidth = 170
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox2PropertiesChange
      Properties.Caption = #1044#1078#1077#1088#1077#1083#1072' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object OnDateEx: TcxDateEdit
      Left = 72
      Top = 2
      Width = 121
      Height = 21
      Properties.OnChange = OnDatePropertiesChange
      Style.BorderColor = clInfoBk
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object cxCheckBox5: TcxCheckBox
      Left = 366
      Top = -1
      Width = 239
      Height = 21
      AutoSize = False
      Constraints.MinWidth = 170
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox5PropertiesChange
      Properties.Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1086' '#1088#1110#1074#1085#1102' '#1072#1082#1090#1091#1072#1083#1100#1085#1086#1089#1090#1110
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object LevelEdit: TcxButtonEdit
      Left = 370
      Top = 18
      Width = 221
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = LevelEditPropertiesButtonClick
      TabOrder = 4
    end
  end
  object ItemsGrid: TcxGrid
    Left = 0
    Top = 44
    Width = 723
    Height = 152
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
    object ReportDataView: TcxGridDBTableView
      OnKeyDown = ReportDataViewKeyDown
      DataController.DataSource = BonusSource
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
        Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1085#1072#1076#1073#1072#1074#1082#1080'/'#1076#1086#1087#1083#1072#1090#1080
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 288
        DataBinding.FieldName = 'RAISE_NAME'
      end
      object DateBegCol: TcxGridDBColumn
        Caption = #1087#1077#1088#1110#1086#1076' '#1079
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 137
        DataBinding.FieldName = 'B_DATE_BEG'
      end
      object DateEndCol: TcxGridDBColumn
        Caption = #1087#1077#1088#1110#1086#1076' '#1087#1086
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortOrder = soDescending
        Width = 123
        DataBinding.FieldName = 'B_DATE_END'
      end
      object ReportDataViewDBColumn2: TcxGridDBColumn
        Caption = #1057#1091#1084#1086#1074#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 127
        DataBinding.FieldName = 'SUMMA'
      end
      object ReportDataViewDBColumn7: TcxGridDBColumn
        Caption = #1055#1088#1086#1094#1077#1085#1090#1085#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 124
        DataBinding.FieldName = 'PERCENT_STR'
      end
      object ReportDataViewDBColumn3: TcxGridDBColumn
        Caption = #1055#1077#1088#1110#1086#1076' '#1085#1072#1076#1073#1072#1074#1082#1080
        Visible = False
        GroupIndex = 0
        Options.Filtering = False
        SortOrder = soAscending
        DataBinding.FieldName = 'GROUP_ID_BONUS_MOVING'
      end
    end
    object cxGridLevel5: TcxGridLevel
      GridView = ReportDataView
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 301
    Width = 723
    Height = 134
    Align = alBottom
    TabOrder = 2
    object pgc1: TPageControl
      Left = 1
      Top = 1
      Width = 721
      Height = 132
      ActivePage = ts1
      Align = alClient
      TabOrder = 0
      object ts1: TTabSheet
        Caption = #1053#1072#1082#1072#1079
        object Label3: TLabel
          Left = 10
          Top = 25
          Width = 42
          Height = 13
          Caption = #1053#1072#1082#1072#1079':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 12
          Top = 51
          Width = 35
          Height = 13
          Caption = #1044#1072#1090#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 156
          Top = 25
          Width = 48
          Height = 13
          Caption = #1055#1088#1086#1077#1082#1090':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 158
          Top = 51
          Width = 35
          Height = 13
          Caption = #1044#1072#1090#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 311
          Top = 28
          Width = 93
          Height = 13
          Caption = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 313
          Top = 54
          Width = 62
          Height = 13
          Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 87
          Top = 4
          Width = 135
          Height = 13
          Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1086' '#1085#1072#1082#1072#1079#1091':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 511
          Top = 32
          Width = 49
          Height = 13
          Caption = #1055#1086#1089#1072#1076#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 513
          Top = 58
          Width = 34
          Height = 13
          Caption = #1055'.'#1030'.'#1041':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 429
          Top = 4
          Width = 160
          Height = 13
          Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1088#1086' '#1089#1091#1084#1110#1097#1077#1085#1085#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object bvl1: TBevel
          Left = 306
          Top = 0
          Width = 2
          Height = 85
        end
        object cxDBTextEdit3: TcxDBTextEdit
          Left = 55
          Top = 51
          Width = 94
          Height = 21
          DataBinding.DataField = 'DATE_ORDER'
          DataBinding.DataSource = BonusSource
          Style.Color = clInfoBk
          TabOrder = 0
        end
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 55
          Top = 25
          Width = 96
          Height = 21
          DataBinding.DataField = 'NUM_ORDER'
          DataBinding.DataSource = BonusSource
          Style.Color = clInfoBk
          TabOrder = 1
        end
        object cxDBTextEdit1: TcxDBTextEdit
          Left = 201
          Top = 51
          Width = 93
          Height = 21
          DataBinding.DataField = 'DATE_PROJECT'
          DataBinding.DataSource = BonusSource
          Style.Color = clInfoBk
          TabOrder = 2
        end
        object cxDBTextEdit8: TcxDBTextEdit
          Left = 201
          Top = 25
          Width = 95
          Height = 21
          DataBinding.DataField = 'NUM_PROJECT'
          DataBinding.DataSource = BonusSource
          Style.Color = clInfoBk
          TabOrder = 3
        end
        object cxDBTextEdit9: TcxDBTextEdit
          Left = 413
          Top = 28
          Width = 87
          Height = 21
          DataBinding.DataField = 'SOVM_TYPE_POST_NAME'
          DataBinding.DataSource = BonusSource
          Style.Color = clInfoBk
          TabOrder = 4
        end
        object cxDBTextEdit10: TcxDBTextEdit
          Left = 413
          Top = 54
          Width = 87
          Height = 21
          DataBinding.DataField = 'SOVM_DEPARTMENT_NAME'
          DataBinding.DataSource = BonusSource
          Style.Color = clInfoBk
          TabOrder = 5
        end
        object cxDBTextEdit11: TcxDBTextEdit
          Left = 561
          Top = 29
          Width = 122
          Height = 21
          DataBinding.DataField = 'SOVM_NAME_POST'
          DataBinding.DataSource = BonusSource
          Style.Color = clInfoBk
          TabOrder = 6
        end
        object cxDBTextEdit12: TcxDBTextEdit
          Left = 563
          Top = 57
          Width = 119
          Height = 21
          DataBinding.DataField = 'SOVM_FIO'
          DataBinding.DataSource = BonusSource
          Style.Color = clInfoBk
          TabOrder = 7
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 204
    Width = 723
    Height = 97
    Align = alBottom
    TabOrder = 3
    Visible = False
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 721
      Height = 95
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
      object SmView: TcxGridDBTableView
        OnKeyDown = SmViewKeyDown
        DataController.DataSource = SmetsDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = SmViewDBColumn1
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsCustomize.ColumnSorting = False
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
        object SmViewDBColumn2: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1073#1102#1076#1078#1077#1090#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 146
          DataBinding.FieldName = 'SM_KOD'
        end
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = #1041#1102#1076#1078#1077#1090
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 414
          DataBinding.FieldName = 'SM_TITLE'
        end
        object SmViewDBColumn1: TcxGridDBColumn
          Caption = #1089#1091#1084#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 86
          DataBinding.FieldName = 'SUMMA'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = SmView
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 196
    Width = 723
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer8Style'
    AlignSplitter = salBottom
    Control = Panel3
    Visible = False
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 8
    Top = 144
  end
  object BonusSelect: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    *'
      
        'FROM UP_KER_GET_BONUS_INFO_BY_PCARD(:ID_PCARD, :act_date, :id_le' +
        'vel)'
      '')
    Left = 8
    Top = 176
    poSQLINT64ToBCD = True
  end
  object BonusSource: TDataSource
    DataSet = BonusSelect
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
  object SmetsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    DataSource = BonusSource
    Left = 8
    Top = 240
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object SmetsDataSource: TDataSource
    DataSet = SmetsDataSet
    Left = 40
    Top = 240
  end
end
