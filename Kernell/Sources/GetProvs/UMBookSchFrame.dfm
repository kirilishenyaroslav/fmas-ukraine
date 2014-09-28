object SchFrame: TSchFrame
  Left = 0
  Top = 0
  Width = 435
  Height = 266
  Align = alClient
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 137
    Width = 435
    Height = 129
    Align = alBottom
    TabOrder = 0
    object Bevel2: TBevel
      Left = 370
      Top = 8
      Width = 337
      Height = 107
    end
    object Bevel1: TBevel
      Left = 8
      Top = 8
      Width = 361
      Height = 107
    end
    object Label1: TLabel
      Left = 464
      Top = 36
      Width = 149
      Height = 13
      Caption = #1054#1041#1054#1056#1054#1058#1067' '#1055#1054' '#1050#1056#1045#1044#1048#1058#1059
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 136
      Top = 16
      Width = 120
      Height = 13
      Caption = #1057#1040#1051#1068#1044#1054'('#1040#1042#1058#1054#1052#1040#1058')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 21
      Width = 43
      Height = 13
      Caption = #1044#1045#1041#1045#1058
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 308
      Top = 21
      Width = 52
      Height = 13
      Caption = #1050#1056#1045#1044#1048#1058
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 471
      Top = 12
      Width = 140
      Height = 13
      Caption = #1054#1041#1054#1056#1054#1058#1067' '#1055#1054' '#1044#1045#1041#1045#1058#1059
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label6: TLabel
      Left = 16
      Top = 73
      Width = 43
      Height = 13
      Caption = #1044#1045#1041#1045#1058
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label7: TLabel
      Left = 308
      Top = 73
      Width = 52
      Height = 13
      Caption = #1050#1056#1045#1044#1048#1058
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label8: TLabel
      Left = 148
      Top = 67
      Width = 104
      Height = 13
      Caption = #1057#1040#1051#1068#1044#1054'('#1055#1054#1042#1053#1045')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 408
      Top = 52
      Width = 273
      Height = 21
      TabStop = False
      DataBinding.DataField = 'KR_OBOR'
      DataBinding.DataSource = SchListDataSource
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 16
      Top = 37
      Width = 161
      Height = 21
      TabStop = False
      DataBinding.DataField = 'DB_SALDO'
      DataBinding.DataSource = SchListDataSource
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 201
      Top = 37
      Width = 159
      Height = 21
      TabStop = False
      DataBinding.DataField = 'KR_SALDO'
      DataBinding.DataSource = SchListDataSource
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 375
      Top = 12
      Width = 58
      Height = 21
      TabStop = False
      DataBinding.DataField = 'DB_OBOR_SUM'
      DataBinding.DataSource = SchListDataSource
      Style.Color = clInfoBk
      TabOrder = 3
      Visible = False
    end
    object EditKRSaldo: TcxDBButtonEdit
      Left = 201
      Top = 88
      Width = 157
      Height = 21
      TabStop = False
      DataBinding.DataField = 'CUSTOM_KR_SALDO'
      DataBinding.DataSource = SchListDataSource
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = EditDBSaldoPropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 4
      Visible = False
    end
    object EditDBSaldo: TcxDBButtonEdit
      Left = 17
      Top = 88
      Width = 158
      Height = 21
      TabStop = False
      DataBinding.DataField = 'CUSTOM_DB_SALDO'
      DataBinding.DataSource = SchListDataSource
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = EditDBSaldoPropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 5
      Visible = False
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 99
    Width = 435
    Height = 38
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
    end
    object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
      DataController.DataSource = SchListDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'ID_SCH'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1054#1073#1086#1088#1086#1090#1099' '#1087#1086' '#1076#1077#1073#1077#1090#1091'=0.00;'#1054#1073#1086#1088#1086#1090#1099' '#1087#1086' '#1076#1077#1073#1077#1090#1091'=-0.00'
          Kind = skSum
          FieldName = 'DB_OBOR'
          Column = cxGrid1DBBandedTableView1DBBandedColumn3
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxGrid1DBBandedTableView1FocusedRecordChanged
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      Styles.BandBackground = cxStyle1
      Bands = <
        item
          Caption = #1054#1041#1054#1056#1054#1058#1048' '#1055#1054' '#1044#1045#1041#1045#1058#1059
          Width = 700
        end>
      object cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn
        Caption = #1047' '#1082#1088#1077#1076#1080#1090#1072' '#1088#1072#1093#1091#1085#1082#1091
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Width = 96
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'SCH_NUMBER'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn
        Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1088#1072#1093#1091#1085#1082#1091
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Width = 240
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'SCH_TITLE'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn
        Caption = #1054#1073#1086#1088#1086#1090#1080
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.OnChange = cxGrid1DBBandedTableView1DBBandedColumn3PropertiesChange
        Properties.OnEditValueChanged = cxGrid1DBBandedTableView1DBBandedColumn3PropertiesEditValueChanged
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Width = 219
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'DB_OBOR'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn
        Caption = #1057#1090#1072#1088#1077' '#1079#1072#1085#1095#1077#1085#1085#1103
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        SortOrder = soAscending
        Styles.Content = cxStyle4
        Width = 160
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'OLD_DB_OBOR'
      end
    end
    object cxGrid1DBTableView2: TcxGridDBTableView
      DataController.DataSource = DetailSchListDataSource
      DataController.DetailKeyFieldNames = 'ID_SCH'
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'ID_SCH;CAN_EDIT_RECORD;KR_ID_SM;KR_ID_RZ;KR_ID_ST;KR_ID_KEKV'
      DataController.MasterKeyFieldNames = 'ID_SCH'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle5
      Styles.Content = cxStyle5
      Styles.OnGetContentStyle = cxGrid1DBTableView2StylesGetContentStyle
      object cxGrid1DBTableView2DBColumn1: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1089#1084#1077#1090#1099
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Options.Editing = False
        Options.Focusing = False
        Options.Grouping = False
        DataBinding.FieldName = 'SMETA_KOD'
      end
      object cxGrid1DBTableView2DBColumn2: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1088#1072#1079#1076#1077#1083#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Options.Editing = False
        Options.Focusing = False
        Options.Grouping = False
        DataBinding.FieldName = 'RZ_NUM'
      end
      object cxGrid1DBTableView2DBColumn3: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1089#1090#1072#1090#1100#1080
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Options.Editing = False
        Options.Focusing = False
        Options.Grouping = False
        DataBinding.FieldName = 'ST_NUM'
      end
      object cxGrid1DBTableView2DBColumn4: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1050#1069#1050#1047#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Options.Editing = False
        Options.Focusing = False
        Options.Grouping = False
        DataBinding.FieldName = 'KEKV_KODE'
      end
      object cxGrid1DBTableView2DBColumn5: TcxGridDBColumn
        Caption = #1054#1073#1086#1088#1086#1090#1099
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.OnEditValueChanged = cxGrid1DBTableView2DBColumn5PropertiesEditValueChanged
        Options.Editing = False
        Options.Grouping = False
        DataBinding.FieldName = 'DB_OBOR'
      end
      object cxGrid1DBTableView2DBColumn6: TcxGridDBColumn
        Caption = #1057#1090#1072#1088#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Options.Editing = False
        Options.Focusing = False
        Styles.Content = cxStyle6
        DataBinding.FieldName = 'OLD_DB_OBOR'
      end
      object cxGrid1DBTableView2DBColumn7: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'CAN_EDIT_RECORD'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBBandedTableView1
      object cxGrid1Level2: TcxGridLevel
        GridView = cxGrid1DBTableView2
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 55
    Width = 435
    Height = 44
    AutoSize = True
    ButtonHeight = 21
    ButtonWidth = 80
    Caption = 'ToolBar1'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShowCaptions = True
    TabOrder = 2
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = #1054#1073#1085#1086#1074#1080#1090#1080
      ImageIndex = 10
      OnClick = ToolButton1Click
    end
    object ToolButton3: TToolButton
      Left = 80
      Top = 0
      Caption = #1054#1087#1077#1088#1072#1094#1110#1111
      ImageIndex = 17
      OnClick = ToolButton3Click
    end
    object ToolButton2: TToolButton
      Left = 160
      Top = 0
      Caption = #1055#1110#1076#1090#1074#1077#1088#1076#1080#1090#1080
      ImageIndex = 15
      Wrap = True
      OnClick = ToolButton2Click
    end
    object cxCheckBox1: TcxCheckBox
      Left = 0
      Top = 21
      Width = 298
      Height = 21
      TabStop = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1086#1082#1072#1079#1072#1090#1080' '#1088#1072#1093#1091#1085#1082#1080' '#1087#1086' '#1103#1082#1080#1084' '#1108' '#1086#1073#1086#1088#1086#1090#1080
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
      OnClick = cxCheckBox1Click
    end
  end
  object HeaderPanel: TPanel
    Left = 0
    Top = 0
    Width = 435
    Height = 55
    Align = alTop
    Caption = #1043#1054#1051#1054#1042#1053#1040' '#1050#1053#1048#1043#1040' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    DesignSize = (
      435
      55)
    object Label9: TLabel
      Left = 281
      Top = 36
      Width = 5
      Height = 13
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 296
    Top = 152
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clInfoBk
      TextColor = clInactiveCaptionText
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor]
      Color = 16776176
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16776176
      TextColor = clGradientInactiveCaption
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16776176
      TextColor = clRed
    end
  end
  object SchListDataSet: TpFIBDataSet
    AfterOpen = SchListDataSetAfterOpen
    Left = 16
    Top = 144
    poSQLINT64ToBCD = True
  end
  object SchListDataSource: TDataSource
    DataSet = SchListDataSetLocal
    Left = 16
    Top = 112
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 424
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 56
    Top = 424
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 88
    Top = 424
  end
  object SchListDataSetLocal: TRxMemoryData
    FieldDefs = <>
    BeforePost = SchListDataSetLocalBeforePost
    AfterPost = SchListDataSetLocalAfterPost
    Left = 48
    Top = 112
    object SchListDataSetLocalID_SCH: TIntegerField
      FieldName = 'ID_SCH'
    end
    object SchListDataSetLocalSCH_TITLE: TStringField
      FieldName = 'SCH_TITLE'
      Size = 60
    end
    object SchListDataSetLocalSCH_NUMBER: TStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
    end
    object SchListDataSetLocalSCH_FULL: TStringField
      FieldName = 'SCH_FULL'
      Size = 100
    end
    object SchListDataSetLocalSCH_TYPE: TIntegerField
      FieldName = 'SCH_TYPE'
    end
    object SchListDataSetLocalLINK_TO: TIntegerField
      FieldName = 'LINK_TO'
    end
    object SchListDataSetLocalDATE_BEG: TDateField
      FieldName = 'DATE_BEG'
    end
    object SchListDataSetLocalDATE_END: TDateField
      FieldName = 'DATE_END'
    end
    object SchListDataSetLocalTYPE_OBJECT: TIntegerField
      FieldName = 'TYPE_OBJECT'
    end
    object SchListDataSetLocalSCH_OBJ_TYPE_TITLE: TStringField
      FieldName = 'SCH_OBJ_TYPE_TITLE'
      Size = 30
    end
    object SchListDataSetLocalSCH_TYPE_TITLE: TStringField
      FieldName = 'SCH_TYPE_TITLE'
      Size = 30
    end
    object SchListDataSetLocalID_SYSTEM: TIntegerField
      FieldName = 'ID_SYSTEM'
    end
    object SchListDataSetLocalIS_BLOCKED: TIntegerField
      FieldName = 'IS_BLOCKED'
    end
    object SchListDataSetLocalIS_BLOCKED_TEXT: TStringField
      FieldName = 'IS_BLOCKED_TEXT'
    end
    object SchListDataSetLocalOPEN_SCH: TDateField
      FieldName = 'OPEN_SCH'
    end
    object SchListDataSetLocalDB_SALDO: TFloatField
      FieldName = 'DB_SALDO'
    end
    object SchListDataSetLocalKR_SALDO: TFloatField
      FieldName = 'KR_SALDO'
    end
    object SchListDataSetLocalDB_OBOR: TFloatField
      FieldName = 'DB_OBOR'
    end
    object SchListDataSetLocalKR_OBOR: TFloatField
      FieldName = 'KR_OBOR'
    end
    object SchListDataSetLocalOLD_DB_OBOR: TFloatField
      FieldName = 'OLD_DB_OBOR'
    end
    object SchListDataSetLocalDB_OBOR_SUM: TFloatField
      FieldName = 'DB_OBOR_SUM'
    end
    object SchListDataSetLocalSYSTEM_IS_WORKING: TIntegerField
      FieldName = 'SYSTEM_IS_WORKING'
    end
    object SchListDataSetLocalMAIN_SYSTEM_IS_WORKING: TIntegerField
      FieldName = 'MAIN_SYSTEM_IS_WORKING'
    end
    object SchListDataSetLocalID_MAIN_SYSTEM: TIntegerField
      FieldName = 'ID_MAIN_SYSTEM'
    end
    object SchListDataSetLocalMAIN_TYPE_OBJECT: TIntegerField
      FieldName = 'MAIN_TYPE_OBJECT'
    end
    object SchListDataSetLocalCUSTOM_DB_SALDO: TFloatField
      FieldName = 'CUSTOM_DB_SALDO'
    end
    object SchListDataSetLocalCUSTOM_KR_SALDO: TFloatField
      FieldName = 'CUSTOM_KR_SALDO'
    end
    object SchListDataSetLocalID_SALDO: TIntegerField
      FieldName = 'ID_SALDO'
    end
  end
  object MBIniDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from MBOOK_INI_DATA_SELECT')
    Left = 16
    poSQLINT64ToBCD = True
  end
  object DetailSchListDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    AfterOpen = DetailSchListDataSetAfterOpen
    Left = 16
    Top = 168
    poSQLINT64ToBCD = True
  end
  object DetailSchListDataSource: TDataSource
    DataSet = DetailSchListDataSetLocal
    Left = 16
    Top = 200
  end
  object DetailSchListDataSetLocal: TRxMemoryData
    FieldDefs = <>
    Left = 48
    Top = 200
    object DetailSchListDataSetLocalID_RECORD: TIntegerField
      FieldName = 'ID_RECORD'
    end
    object DetailSchListDataSetLocalID_SCH: TIntegerField
      FieldName = 'ID_SCH'
    end
    object DetailSchListDataSetLocalOPEN_SCH: TDateField
      FieldName = 'OPEN_SCH'
    end
    object DetailSchListDataSetLocalCAN_EDIT_RECORD: TIntegerField
      FieldName = 'CAN_EDIT_RECORD'
    end
    object DetailSchListDataSetLocalKR_ID_SM: TIntegerField
      FieldName = 'KR_ID_SM'
    end
    object DetailSchListDataSetLocalKR_ID_RZ: TIntegerField
      FieldName = 'KR_ID_RZ'
    end
    object DetailSchListDataSetLocalKR_ID_ST: TIntegerField
      FieldName = 'KR_ID_ST'
    end
    object DetailSchListDataSetLocalKR_ID_KEKV: TIntegerField
      FieldName = 'KR_ID_KEKV'
    end
    object DetailSchListDataSetLocalSMETA_KOD: TIntegerField
      FieldName = 'SMETA_KOD'
    end
    object DetailSchListDataSetLocalRZ_NUM: TIntegerField
      FieldName = 'RZ_NUM'
    end
    object DetailSchListDataSetLocalKEKV_KODE: TIntegerField
      FieldName = 'KEKV_KODE'
    end
    object DetailSchListDataSetLocalST_NUM: TIntegerField
      FieldName = 'ST_NUM'
    end
    object DetailSchListDataSetLocalDB_OBOR: TFloatField
      FieldName = 'DB_OBOR'
    end
    object DetailSchListDataSetLocalOLD_DB_OBOR: TFloatField
      FieldName = 'OLD_DB_OBOR'
    end
  end
end
