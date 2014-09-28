object frmConfigExports: TfrmConfigExports
  Left = 385
  Top = 104
  Width = 492
  Height = 667
  Caption = '\'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 30
    Width = 109
    Height = 13
    Caption = 'RxLabelName_Section'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 484
    Height = 71
    Align = alTop
    TabOrder = 0
    object RxLabelDBF: TLabel
      Left = 9
      Top = 52
      Width = 60
      Height = 13
      Caption = 'RxLabelDBF'
    end
    object RxLabelName_Section: TLabel
      Left = 9
      Top = 8
      Width = 109
      Height = 13
      Caption = 'RxLabelName_Section'
    end
    object LabelNAME_BANK: TLabel
      Left = 9
      Top = 32
      Width = 92
      Height = 13
      Caption = 'LabelNAME_BANK'
    end
    object FEDBName: TFilenameEdit
      Left = 163
      Top = 49
      Width = 281
      Height = 20
      FileEditStyle = fsComboBox
      Filter = '*.*|*.*'
      DialogTitle = #1055#1091#1090#1100' '#1082' '#1092#1072#1083#1091
      Color = 15204351
      NumGlyphs = 1
      TabOrder = 1
      OnExit = FEDBNameExit
    end
    object cxTextEditName_Section: TcxTextEdit
      Left = 163
      Top = 4
      Width = 280
      Height = 21
      Properties.MaxLength = 20
      Style.Color = 15204351
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 280
    Width = 484
    Height = 353
    Align = alBottom
    TabOrder = 3
    object LabelInSum: TLabel
      Left = 7
      Top = 141
      Width = 56
      Height = 13
      Caption = 'LabelInSum'
    end
    object LabelOutSum: TLabel
      Left = 7
      Top = 157
      Width = 64
      Height = 13
      Caption = 'LabelOutSum'
    end
    object BitBtnSave: TBitBtn
      Left = -4
      Top = 300
      Width = 105
      Height = 25
      Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 17
      OnClick = BitBtnSaveClick
      Kind = bkAll
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 333
      Width = 482
      Height = 19
      Panels = <>
    end
    object ButtonGet: TButton
      Left = 105
      Top = 301
      Width = 90
      Height = 23
      Caption = #1047#1072#1073#1086#1088
      TabOrder = 18
      OnClick = ButtonGetClick
    end
    object PanelDBF: TPanel
      Left = 280
      Top = 132
      Width = 185
      Height = 81
      TabOrder = 9
      Visible = False
      object DBLookupListBoxDBF: TDBLookupListBox
        Left = 1
        Top = 1
        Width = 183
        Height = 69
        Align = alClient
        Color = 15204351
        KeyField = 'RxMemoryDataDBFFieldDBF'
        ListField = 'RxMemoryDataDBFFieldDBF'
        ListSource = DataSourceDBF
        TabOrder = 0
        OnDblClick = DBLookupListBoxDBFDblClick
      end
    end
    object ButtonClose: TButton
      Left = 402
      Top = 301
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'ButtonClose'
      TabOrder = 19
      OnClick = ButtonCloseClick
    end
    object cxCheckBoxCheckDate: TcxCheckBox
      Left = 0
      Top = 45
      Width = 281
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 3
    end
    object cxCheckBoxCheckDublicate: TcxCheckBox
      Left = 0
      Top = 59
      Width = 305
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 4
    end
    object cxCheckBoxModiSum: TcxCheckBox
      Left = 0
      Top = 73
      Width = 313
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 5
    end
    object cxCheckBoxUSE_MFO: TcxCheckBox
      Left = 0
      Top = 87
      Width = 305
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 7
      OnClick = cxCheckBoxUSE_MFOClick
    end
    object cxCalcEditINSUM: TcxCalcEdit
      Left = 135
      Top = 138
      Width = 145
      Height = 21
      Enabled = False
      Properties.Precision = 1
      Style.Color = 15204351
      TabOrder = 11
    end
    object cxCalcEditOUT_SUM: TcxCalcEdit
      Left = 135
      Top = 158
      Width = 145
      Height = 21
      Enabled = False
      Properties.Precision = 1
      Style.Color = 15204351
      TabOrder = 12
    end
    object cxButtonEditMFO: TcxButtonEdit
      Left = 184
      Top = 85
      Width = 265
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditMFOPropertiesButtonClick
      Style.Color = cl3DLight
      TabOrder = 6
    end
    object cxCheckBoxINOUT_SUM: TcxCheckBox
      Left = 0
      Top = 119
      Width = 432
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 10
      OnClick = cxCheckBoxINOUT_SUMClick
    end
    object cxCheckBox_USE_A_B: TcxCheckBox
      Left = 0
      Top = 103
      Width = 377
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1042#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1074#1072#1090#1080' '#1087#1088#1080#1074#39#1103#1079#1082#1091' '#1076#1086' '#1089#1090#1088#1091#1082#1090#1091#1088#1080' '#1092#1072#1081#1083#1091
      TabOrder = 8
    end
    object cxCheckBoxConstName: TcxCheckBox
      Left = 0
      Top = 15
      Width = 449
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1086#1089#1090#1110#1081#1085#1077' '#1110#1084#39#1103' '#1092#1072#1081#1083#1091
      TabOrder = 1
    end
    object cxCheckBoxUseKazn: TcxCheckBox
      Left = 0
      Top = 30
      Width = 449
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1042#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1074#1072#1090#1080' '#1082#1072#1079#1085#1072#1095#1077#1081#1089#1100#1082#1091' '#1085#1072#1079#1074#1091' '#1092#1072#1081#1083#1091' '
      TabOrder = 2
    end
    object cxCheckBoxConvertString: TcxCheckBox
      Left = 0
      Top = -1
      Width = 449
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1050#1086#1085#1074#1077#1088#1090#1091#1074#1072#1090#1080' '#1090#1077#1082#1089#1090#1086#1074#1110' '#1076#1072#1085#1085#1110
      TabOrder = 0
    end
    object cxCheckBoxNotDelete: TcxCheckBox
      Left = 0
      Top = 175
      Width = 432
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1072#1083#1080#1096#1072#1090#1080' '#1092#1072#1081#1083' '#1087#1110#1089#1083#1103' '#1110#1084#1087#1086#1088#1090#1091
      TabOrder = 13
      OnClick = cxCheckBoxINOUT_SUMClick
    end
    object cxCheckBoxChooseFile: TcxCheckBox
      Left = 0
      Top = 194
      Width = 169
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1042#1080#1073#1080#1088#1072#1090#1080' '#1092#1072#1081#1083' '#1076#1083#1103' '#1110#1084#1087#1086#1088#1090#1091
      TabOrder = 14
      OnClick = cxCheckBoxINOUT_SUMClick
    end
    object cxCheckBoxUSENative: TcxCheckBox
      Left = 0
      Top = 213
      Width = 432
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1042#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1074#1072#1090#1080' '#1089#1087#1077#1094#1110#1072#1083#1100#1085#1077' '#1079#1085#1072#1095#1077#1085#1085#1103' '#1088#1072#1093#1091#1085#1082#1091
      TabOrder = 15
      OnClick = cxCheckBoxINOUT_SUMClick
    end
    object cxCheckBoxAutomat: TcxCheckBox
      Left = 0
      Top = 229
      Width = 432
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1042#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1074#1072#1090#1080' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1085#1077' '#1076#1086#1076#1072#1074#1072#1085#1085#1103' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1110#1074
      TabOrder = 16
      OnClick = cxCheckBoxINOUT_SUMClick
    end
    object DirectoryEdit1: TDirectoryEdit
      Left = 168
      Top = 194
      Width = 297
      Height = 21
      Color = 15204351
      NumGlyphs = 1
      TabOrder = 21
    end
    object cxTextEdit1: TcxTextEdit
      Left = 231
      Top = 263
      Width = 153
      Height = 21
      Style.Color = 15204351
      TabOrder = 22
    end
    object cxCheckBox1: TcxCheckBox
      Left = 0
      Top = 263
      Width = 224
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1057#1087#1077#1094#1110#1072#1083#1100#1085#1080#1081' '#1088#1072#1093#1091#1085#1086#1082' '#1082#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072
      TabOrder = 23
      OnClick = cxCheckBoxINOUT_SUMClick
    end
    object cxCheckBox2: TcxCheckBox
      Left = 0
      Top = 245
      Width = 432
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1042#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1074#1072#1090#1080' '#1087#1077#1088#1077#1074#1110#1088#1082#1091' '#1088#1072#1093#1091#1085#1082#1091', '#1052#1060#1054' '#1090#1072' '#1028#1044#1056#1055#1054#1059
      TabOrder = 24
      OnClick = cxCheckBoxINOUT_SUMClick
    end
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 71
    Width = 484
    Height = 209
    Align = alClient
    TabOrder = 2
    object cxGridDBTableView: TcxGridDBTableView
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnMoving = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleYellow
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = cxStyle4
      Styles.IncSearch = cxStyleYellow
      Styles.Selection = cxStyle13
      Styles.FilterBox = cxStyleYellow
      Styles.Footer = cxStyleYellow
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      Styles.Indicator = cxStyleYellow
      Styles.NewItemRowInfoText = cxStyleYellow
      Styles.Preview = cxStyleYellow
      object GridSPParam: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 241
        DataBinding.FieldName = 'RXSPParam'
        IsCaptionAssigned = True
      end
      object GridFieldDBF: TcxGridDBColumn
        PropertiesClassName = 'TcxPopupEditProperties'
        Properties.PopupControl = PanelDBF
        Properties.ReadOnly = True
        Width = 226
        DataBinding.FieldName = 'RXFieldDBF'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView
    end
  end
  object cxTextEditNAME_BANK: TcxTextEdit
    Left = 163
    Top = 26
    Width = 280
    Height = 21
    Properties.MaxLength = 20
    Style.Color = 15204351
    TabOrder = 1
  end
  object pFIBDB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = pFIBTr
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 128
  end
  object pFIBTr: TpFIBTransaction
    DefaultDatabase = pFIBDB
    TimeoutAction = TARollback
    Left = 48
    Top = 128
  end
  object pFIBSP: TpFIBStoredProc
    Database = pFIBDB
    Transaction = pFIBTr
    Left = 88
    Top = 128
  end
  object HDataSet: THalcyonDataSet
    AutoFlush = False
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = '"C:\Documents and Settings\Alex\'#1056#1072#1073#1086#1095#1080#1081' '#1089#1090#1086#1083'\impexp.dbf"'
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 8
    Top = 160
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryDataSP
    Left = 184
    Top = 129
  end
  object RxMemoryDataSP: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RXSPParam'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'RXFieldDBF'
        DataType = ftString
        Size = 1000
      end>
    Left = 224
    Top = 129
  end
  object pFIBDataSetSP: TpFIBDataSet
    Database = pFIBDB
    Transaction = pFIBTr
    SelectSQL.Strings = (
      'select *'
      'from RDB$PROCEDURES'
      'where RDB$PROCEDURE_NAME='#39'CLBANK_TMP_BUFFER_INSERT'#39)
    Left = 128
    Top = 129
    poSQLINT64ToBCD = True
  end
  object DataSourceSP: TDataSource
    DataSet = RxMemoryDataDBF
    Left = 256
    Top = 88
  end
  object DataSourceDBF: TDataSource
    DataSet = RxMemoryDataDBF
    Left = 192
    Top = 208
  end
  object RxMemoryDataDBF: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxMemoryDataDBFFieldDBF'
        DataType = ftString
        Size = 200
      end>
    Left = 224
    Top = 208
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDB
    TimeoutAction = TARollback
    Left = 48
    Top = 160
  end
  object StyleRepository: TcxStyleRepository
    Left = 224
    Top = 160
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyleYellow: TcxStyle
      AssignedValues = [svColor]
      Color = 15204351
    end
    object cxStyleFontBlack: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleMalin: TcxStyle
      AssignedValues = [svColor]
      Color = 4194368
    end
    object cxStyleBorder: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveBorder
    end
    object cxStylemalinYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4194368
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15204351
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleGrid: TcxStyle
      AssignedValues = [svColor]
      Color = 10485760
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle4
      Styles.Content = cxStyle5
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Inactive = cxStyle13
      Styles.IncSearch = cxStyle14
      Styles.Selection = cxStyle17
      Styles.FilterBox = cxStyle8
      Styles.Footer = cxStyle9
      Styles.Group = cxStyle10
      Styles.GroupByBox = cxStyle11
      Styles.Header = cxStyle12
      Styles.Indicator = cxStyle15
      Styles.Preview = cxStyle16
      BuiltIn = True
    end
  end
  object pFIBDataSetLaunch: TpFIBDataSet
    Database = pFIBDB
    Transaction = pFIBTr
    SelectSQL.Strings = (
      'select *'
      'from clbank_ini_param,clbank_ini'
      'where clbank_ini_param.id_bank=:param_bank'
      'and clbank_ini_param.id_bank=clbank_ini.id_bank')
    Left = 224
    Top = 88
    poSQLINT64ToBCD = True
  end
end
