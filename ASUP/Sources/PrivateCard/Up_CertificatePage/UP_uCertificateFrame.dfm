object fmCertificatePage: TfmCertificatePage
  Left = 0
  Top = 0
  Width = 799
  Height = 426
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 311
    Width = 799
    Height = 115
    Align = alBottom
    TabOrder = 0
    object Label7: TLabel
      Left = 1
      Top = 5
      Width = 68
      Height = 13
      Caption = #1044#1072#1090#1072' '#1076#1088#1091#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 313
      Top = 3
      Width = 288
      Height = 13
      Caption = #1055#1030#1041' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072', '#1103#1082#1080#1081' '#1085#1072#1076#1088#1091#1082#1091#1074#1072#1074' '#1087#1086#1089#1074#1110#1076#1095#1077#1085#1085#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 313
      Top = 57
      Width = 255
      Height = 13
      Caption = #1055#1030#1041' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072', '#1103#1082#1080#1081' '#1074#1080#1076#1072#1074' '#1087#1086#1089#1074#1110#1076#1095#1077#1085#1085#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 1
      Top = 71
      Width = 207
      Height = 13
      Caption = #1055#1086#1089#1083#1110#1076#1086#1074#1085#1110#1089#1090#1100' '#1094#1080#1092#1088' ('#1079#1110' '#1096#1090#1088#1080#1093#1082#1086#1076#1091')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 1
      Top = 27
      Width = 254
      Height = 13
      Caption = #1060#1072#1082#1090#1080#1095#1085#1072' '#1076#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1076#1110#1111' '#1087#1086#1089#1074#1110#1076#1095#1077#1085#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxDBTextEdit7: TcxDBTextEdit
      Left = 3
      Top = 88
      Width = 129
      Height = 21
      DataBinding.DataField = 'DIGITAL_KOD_SHT'
      DataBinding.DataSource = HistDataSource
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object cxDBTextEdit10: TcxDBTextEdit
      Left = 313
      Top = 77
      Width = 396
      Height = 21
      DataBinding.DataField = 'USER_CR'
      DataBinding.DataSource = HistDataSource
      Style.Color = clInfoBk
      TabOrder = 4
    end
    object cxDBTextEdit8: TcxDBTextEdit
      Left = 3
      Top = 45
      Width = 129
      Height = 21
      DataBinding.DataField = 'Date_Finished_Certificate'
      DataBinding.DataSource = CertificateSource
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object cxDBTextEdit9: TcxDBTextEdit
      Left = 313
      Top = 24
      Width = 393
      Height = 21
      DataBinding.DataField = 'USER_CR'
      DataBinding.DataSource = HistDataSource
      Style.Color = clInfoBk
      TabOrder = 3
    end
    object cxDBTextEdit11: TcxDBTextEdit
      Left = 77
      Top = 3
      Width = 129
      Height = 21
      DataBinding.DataField = 'DATE_PRINT'
      DataBinding.DataSource = CertificateSource
      Style.Color = clInfoBk
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 799
    Height = 36
    Align = alTop
    TabOrder = 1
    object Btn_Show: TSpeedButton
      Left = 192
      Top = 3
      Width = 161
      Height = 30
      Caption = #1042#1080#1076#1072#1074#1072#1090#1080' '#1087#1086#1089#1074#1110#1076#1095#1077#1085#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object DatePeriods: TSpeedButton
      Left = 400
      Top = 3
      Width = 201
      Height = 30
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1087#1077#1088#1110#1086#1076' '#1076#1110#1111' '#1087#1086#1089#1074#1110#1076#1095#1077#1085#1085#1103
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = DatePeriodsClick
    end
    object DateVidachi: TSpeedButton
      Left = 632
      Top = 3
      Width = 137
      Height = 30
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1076#1072#1090#1091' '#1074#1080#1076#1072#1095#1110
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = DateVidachiClick
    end
    object cxCB_ShowOld: TcxCheckBox
      Left = 8
      Top = 6
      Width = 177
      Height = 21
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.ReadOnly = True
      Properties.Caption = #1042#1080#1076#1072#1074#1072#1090#1080' '#1087#1086#1089#1074#1110#1076#1095#1077#1085#1085#1103
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 218
    Width = 799
    Height = 93
    Align = alBottom
    TabOrder = 2
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 797
      Height = 91
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
      object HistView: TcxGridDBTableView
        DataController.DataSource = HistDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
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
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = qizzStyle
        Styles.ContentEven = stContent
        Styles.ContentOdd = stContent
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = #1055#1030#1041
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 243
          DataBinding.FieldName = 'USER_CR'
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = #1050#1086#1084#1087#39#1102#1090#1077#1088
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 127
          DataBinding.FieldName = 'NAME_COMP'
        end
        object HistViewDBColumn1: TcxGridDBColumn
          Caption = 'IP-'#1072#1076#1088#1077#1089#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 147
          DataBinding.FieldName = 'IP_ADRESS_COMP'
        end
        object HistViewDBColumn3: TcxGridDBColumn
          Caption = #1063#1072#1089' '#1090#1072' '#1076#1072#1090#1072' '#1079#1084#1110#1085#1080
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 106
          DataBinding.FieldName = 'SYS_TIME'
        end
        object HistViewDBColumn4: TcxGridDBColumn
          Caption = #1042#1080#1076#1072#1074#1072#1090#1080' '#1087#1086#1089#1074#1110#1076#1095#1077#1085#1085#1103
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayChecked = '1'
          Properties.DisplayUnchecked = '0'
          Properties.DisplayGrayed = 'Null'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 150
          DataBinding.FieldName = 'IS_PR'
        end
      end
      object L: TcxGridLevel
        GridView = HistView
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 36
    Width = 799
    Height = 182
    Align = alClient
    TabOrder = 3
    object ItemsGrid: TcxGrid
      Left = 1
      Top = 1
      Width = 797
      Height = 172
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
        DataController.DataSource = CertificateSource
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
        object ReportDataViewDBColumn9: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088' '#1087#1086#1089#1074#1110#1076#1095#1077#1085#1085#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 85
          DataBinding.FieldName = 'NOM_SER'
        end
        object ReportDataViewDBColumn6: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1076#1110#1111
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 88
          DataBinding.FieldName = 'DATE_BEG'
        end
        object ReportDataViewDBColumn7: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1076#1110#1111
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 93
          DataBinding.FieldName = 'DATE_END'
        end
        object ReportDataViewDBColumn1: TcxGridDBColumn
          Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 159
          DataBinding.FieldName = 'DEPARTMENT_NAME'
        end
        object ReportDataViewDBColumn2: TcxGridDBColumn
          Caption = #1052#1110#1089#1094#1077' '#1088#1086#1073#1086#1090#1080
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 166
          DataBinding.FieldName = 'NAME_POST'
        end
        object ReportDataViewDBColumn3: TcxGridDBColumn
          Caption = #1057#1090#1072#1074#1082#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 79
          DataBinding.FieldName = 'RATE_COUNT'
        end
        object ReportDataViewDBColumn4: TcxGridDBColumn
          Caption = #1057#1077#1088#1110#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 65
          DataBinding.FieldName = 'SERIYA'
        end
        object ReportDataViewDBColumn5: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 58
          DataBinding.FieldName = 'NOMER'
        end
        object ReportDataViewDBColumn8: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1074#1080#1076#1072#1095#1110
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 89
          DataBinding.FieldName = 'DATE_VIDACHI'
        end
      end
      object cxGridLevel5: TcxGridLevel
        GridView = ReportDataView
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 173
      Width = 797
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer8Style'
      AlignSplitter = salBottom
      Control = Panel3
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
  object ActionList1: TActionList
    Left = 80
    Top = 136
    object BonusesAct: TAction
      ShortCut = 16450
    end
    object onclickAction: TAction
      Caption = 'onclickAction'
      OnExecute = onclickActionExecute
    end
    object checker_click: TAction
      Caption = 'checker_click'
      OnExecute = checker_clickExecute
    end
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'password='
      'user_name=sysdba'
      'lc_ctype=win1251'
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 16
    Top = 176
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
    TPBMode = tpbRepeatableRead
    Left = 16
    Top = 208
  end
  object pFIBDS_Format: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select stavki_disp_format from ini_asup_consts;')
    Left = 48
    Top = 208
    poSQLINT64ToBCD = True
    object pFIBDS_FormatSTAVKI_DISP_FORMAT: TFIBStringField
      FieldName = 'STAVKI_DISP_FORMAT'
      Size = 25
      EmptyStrToNull = True
    end
  end
  object CheckerSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 16
    Top = 248
    poSQLINT64ToBCD = True
  end
  object DBFoto: TpFIBDatabase
    DefaultTransaction = FIBTrans
    DefaultUpdateTransaction = FIBTrans
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 440
    Top = 64
  end
  object FotoSet: TpFIBDataSet
    Database = DBFoto
    Transaction = FIBTrans
    Left = 472
    Top = 64
    poSQLINT64ToBCD = True
  end
  object FIBTrans: TpFIBTransaction
    DefaultDatabase = DBFoto
    TimeoutAction = TARollback
    Left = 504
    Top = 64
  end
  object CertificateSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    AfterScroll = CertificateSelectAfterScroll
    Left = 160
    Top = 120
    poSQLINT64ToBCD = True
  end
  object HistDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 56
    Top = 248
    poSQLINT64ToBCD = True
  end
  object HistDataSource: TDataSource
    DataSet = HistDataSet
    Left = 88
    Top = 248
  end
  object CertificateSource: TDataSource
    DataSet = CertificateSelect
    Left = 24
    Top = 128
  end
end
