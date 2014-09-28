object Form_Shabloni_Prov: TForm_Shabloni_Prov
  Left = 269
  Top = 116
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Form_Shabloni_Prov'
  ClientHeight = 473
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxGridShabloni_Prov: TcxGrid
    Left = 0
    Top = 40
    Width = 575
    Height = 177
    Align = alClient
    TabOrder = 0
    object cxGridShabloni_ProvDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSourceShabloni_Prov
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'ID_TABLE_PUB_SP_PROV'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Styles.Inactive = cxStyle10
      Styles.Selection = cxStyle14
      Styles.Header = cxStyle7
      object ColNAME_SHABLON: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 494
        DataBinding.FieldName = 'NAME_SHABLON_PROVODKI'
      end
      object ColKOD_SHABLONA: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        SortOrder = soAscending
        Width = 42
        DataBinding.FieldName = 'KOD_SHABLONA'
      end
    end
    object cxGridShabloni_ProvLevel1: TcxGridLevel
      GridView = cxGridShabloni_ProvDBTableView1
    end
  end
  object cxSplitterShabloni: TcxSplitter
    Left = 0
    Top = 217
    Width = 575
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 100
    AlignSplitter = salBottom
    Control = GroupBox1
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 225
    Width = 575
    Height = 228
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      575
      228)
    object cxLabelFioMan: TcxLabel
      Left = 4
      Top = 170
      Width = 94
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object cxLabelSCH_NUMBER: TcxLabel
      Left = 6
      Top = 10
      Width = 79
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object cxDBTextEditSCH_NUMBER: TcxDBTextEdit
      Left = 96
      Top = 8
      Width = 102
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DataBinding.DataField = 'SCH_NUMBER'
      DataBinding.DataSource = DataSourceShabloni_Prov
      ParentColor = True
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object cxDBTextEditSMETA_TITLE: TcxDBTextEdit
      Left = 304
      Top = 32
      Width = 262
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DataBinding.DataField = 'SMETA_TITLE'
      DataBinding.DataSource = DataSourceShabloni_Prov
      ParentColor = True
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object cxLabelSMETA_TITLE: TcxLabel
      Left = 197
      Top = 34
      Width = 105
      Height = 18
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object cxLabelRAZD_NUM: TcxLabel
      Left = 6
      Top = 56
      Width = 78
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
    object cxLabelRAZDEL_TITLE: TcxLabel
      Left = 198
      Top = 56
      Width = 104
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
    end
    object cxLabelKEKV_KOD: TcxLabel
      Left = 5
      Top = 102
      Width = 83
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
    end
    object cxDBTextEditRAZD_NUM: TcxDBTextEdit
      Left = 96
      Top = 56
      Width = 102
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DataBinding.DataField = 'RAZDEL_NUM'
      DataBinding.DataSource = DataSourceShabloni_Prov
      ParentColor = True
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 8
    end
    object cxDBTextEditRAZDEL_TITLE: TcxDBTextEdit
      Left = 304
      Top = 56
      Width = 262
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DataBinding.DataField = 'RAZDEL_TITLE'
      DataBinding.DataSource = DataSourceShabloni_Prov
      ParentColor = True
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 9
    end
    object cxDBTextEditKEKV_KOD: TcxDBTextEdit
      Left = 96
      Top = 104
      Width = 102
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DataBinding.DataField = 'KEKV_KOD'
      DataBinding.DataSource = DataSourceShabloni_Prov
      ParentColor = True
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 10
    end
    object cxDBTextEditKEKV_TITLE: TcxDBTextEdit
      Left = 304
      Top = 104
      Width = 262
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DataBinding.DataField = 'KEKV_TITLE'
      DataBinding.DataSource = DataSourceShabloni_Prov
      ParentColor = True
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 11
    end
    object cxLabelKEKV_TITLE: TcxLabel
      Left = 198
      Top = 107
      Width = 106
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 12
    end
    object cxLabelKOD_DOG: TcxLabel
      Left = 5
      Top = 200
      Width = 87
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 13
    end
    object cxDBTextEditSUMMA: TcxDBTextEdit
      Left = 96
      Top = 134
      Width = 103
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'SUMMA'
      DataBinding.DataSource = DataSourceShabloni_Prov
      ParentColor = True
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 14
    end
    object cxLabelSUMMA: TcxLabel
      Left = 5
      Top = 136
      Width = 66
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 15
    end
    object cxTextEditFioMan: TcxTextEdit
      Left = 96
      Top = 168
      Width = 471
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      TabOrder = 16
    end
    object cxLabelSmetaKod: TcxLabel
      Left = 6
      Top = 32
      Width = 79
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 17
    end
    object cxDBTextEditSmetaKod: TcxDBTextEdit
      Left = 96
      Top = 32
      Width = 102
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DataBinding.DataField = 'SMETA_KOD'
      DataBinding.DataSource = DataSourceShabloni_Prov
      ParentColor = True
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 18
    end
    object cxDBTextEditStatiya_Title: TcxDBTextEdit
      Left = 304
      Top = 80
      Width = 262
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DataBinding.DataField = 'STATIYA_TITLE'
      DataBinding.DataSource = DataSourceShabloni_Prov
      ParentColor = True
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 19
    end
    object cxLabelStatiya_Title: TcxLabel
      Left = 197
      Top = 83
      Width = 105
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 20
    end
    object cxLabelStatiya_NUM: TcxLabel
      Left = 5
      Top = 78
      Width = 82
      Height = 18
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 21
    end
    object cxDBTextEditStatiya_NUM: TcxDBTextEdit
      Left = 96
      Top = 80
      Width = 102
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DataBinding.DataField = 'ST_NUM'
      DataBinding.DataSource = DataSourceShabloni_Prov
      ParentColor = True
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 22
    end
    object cxTextEdit1: TcxTextEdit
      Left = 96
      Top = 198
      Width = 471
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ParentColor = True
      TabOrder = 23
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 453
    Width = 575
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
      end>
    PaintStyle = stpsOffice11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 440
    Top = 73
  end
  object pFIBDatabaseShabloni_Prov: TpFIBDatabase
    DBParams.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'sql_role_name='
      'lc_ctype=WIN1251')
    DefaultTransaction = pFIBTransactionRead
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 376
    Top = 72
  end
  object pFIBTransactionRead: TpFIBTransaction
    DefaultDatabase = pFIBDatabaseShabloni_Prov
    TimeoutAction = TARollback
    TPBMode = tpbDefault
    Left = 376
    Top = 104
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = pFIBDatabaseShabloni_Prov
    TimeoutAction = TARollback
    Left = 408
    Top = 104
  end
  object pFIBDataSetShabloni_Prov: TpFIBDataSet
    Database = pFIBDatabaseShabloni_Prov
    Transaction = pFIBTransactionRead
    SelectSQL.Strings = (
      'Select * from PUB_SP_PROV_SEL_FOR_GRID ('#39'01.01.2005'#39', 1, 1, 1)')
    AfterScroll = pFIBDataSetShabloni_ProvAfterScroll
    Left = 272
    Top = 96
    poSQLINT64ToBCD = True
    object pFIBDataSetShabloni_ProvID_TABLE_PUB_SP_PROV: TFIBBCDField
      FieldName = 'ID_TABLE_PUB_SP_PROV'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetShabloni_ProvNAME_SHABLON_PROVODKI: TFIBStringField
      FieldName = 'NAME_SHABLON_PROVODKI'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetShabloni_ProvKOD_SHABLONA: TFIBBCDField
      FieldName = 'KOD_SHABLONA'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetShabloni_ProvVISIBLE_KASSA: TFIBSmallIntField
      FieldName = 'VISIBLE_KASSA'
    end
    object pFIBDataSetShabloni_ProvVISIBLE_BANK: TFIBSmallIntField
      FieldName = 'VISIBLE_BANK'
    end
    object pFIBDataSetShabloni_ProvVISIBLE_AVANCE: TFIBSmallIntField
      FieldName = 'VISIBLE_AVANCE'
    end
    object pFIBDataSetShabloni_ProvID_MAN: TFIBBCDField
      FieldName = 'ID_MAN'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetShabloni_ProvFIO_MAN: TFIBStringField
      FieldName = 'FIO_MAN'
      EmptyStrToNull = True
    end
    object pFIBDataSetShabloni_ProvIMYA_MAN: TFIBStringField
      FieldName = 'IMYA_MAN'
      EmptyStrToNull = True
    end
    object pFIBDataSetShabloni_ProvOTCHESTVO_MAN: TFIBStringField
      FieldName = 'OTCHESTVO_MAN'
      EmptyStrToNull = True
    end
    object pFIBDataSetShabloni_ProvID_SCHET: TFIBBCDField
      FieldName = 'ID_SCHET'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetShabloni_ProvSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetShabloni_ProvSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object pFIBDataSetShabloni_ProvDATE_BEG_SCH: TFIBDateField
      FieldName = 'DATE_BEG_SCH'
    end
    object pFIBDataSetShabloni_ProvDATE_END_SCH: TFIBDateField
      FieldName = 'DATE_END_SCH'
    end
    object pFIBDataSetShabloni_ProvID_SMETA: TFIBBCDField
      FieldName = 'ID_SMETA'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetShabloni_ProvSMETA_TITLE: TFIBStringField
      FieldName = 'SMETA_TITLE'
      Size = 180
      EmptyStrToNull = True
    end
    object pFIBDataSetShabloni_ProvSMETA_KOD: TFIBIntegerField
      FieldName = 'SMETA_KOD'
    end
    object pFIBDataSetShabloni_ProvID_RAZDEL: TFIBBCDField
      FieldName = 'ID_RAZDEL'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetShabloni_ProvRAZDEL_TITLE: TFIBStringField
      FieldName = 'RAZDEL_TITLE'
      Size = 180
      EmptyStrToNull = True
    end
    object pFIBDataSetShabloni_ProvRAZDEL_NUM: TFIBIntegerField
      FieldName = 'RAZDEL_NUM'
    end
    object pFIBDataSetShabloni_ProvID_STATIYA: TFIBBCDField
      FieldName = 'ID_STATIYA'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetShabloni_ProvSTATIYA_TITLE: TFIBStringField
      FieldName = 'STATIYA_TITLE'
      Size = 180
      EmptyStrToNull = True
    end
    object pFIBDataSetShabloni_ProvST_NUM: TFIBIntegerField
      FieldName = 'ST_NUM'
    end
    object pFIBDataSetShabloni_ProvID_KEKV: TFIBBCDField
      FieldName = 'ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetShabloni_ProvKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object pFIBDataSetShabloni_ProvKEKV_TITLE: TFIBStringField
      FieldName = 'KEKV_TITLE'
      Size = 180
      EmptyStrToNull = True
    end
    object pFIBDataSetShabloni_ProvSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetShabloni_ProvID_DOG: TFIBBCDField
      FieldName = 'ID_DOG'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetShabloni_ProvKOD_DOG: TFIBBCDField
      FieldName = 'KOD_DOG'
      Size = 0
      RoundByScale = True
    end
  end
  object DataSourceShabloni_Prov: TDataSource
    DataSet = pFIBDataSetShabloni_Prov
    Left = 304
    Top = 96
  end
  object ActionList1: TActionList
    Images = ImageList
    Left = 440
    Top = 104
    object ActionADD: TAction
      Caption = 'ActionADD'
      Hint = #1053#1072#1078#1072#1090#1080' '#1097#1086#1073' '#1074#1080#1081#1090#1080
      ImageIndex = 1
      ShortCut = 45
      OnExecute = ActionADDExecute
    end
    object ActionChange: TAction
      Caption = 'ActionChange'
      Hint = 'F11'
      ImageIndex = 4
      ShortCut = 113
      OnExecute = ActionChangeExecute
    end
    object ActionDEL: TAction
      Caption = 'ActionDEL'
      Hint = 'Del'
      ImageIndex = 3
      ShortCut = 46
      OnExecute = ActionDELExecute
    end
    object ActionObnov: TAction
      Caption = 'ActionObnov'
      Hint = 'F5'
      ImageIndex = 7
      ShortCut = 116
      OnExecute = ActionObnovExecute
    end
    object ActionVibrat: TAction
      Caption = 'ActionVibrat'
      Hint = 'F4'
      ImageIndex = 0
      ShortCut = 13
      OnExecute = ActionVibratExecute
    end
    object ActionOtmena: TAction
      Caption = 'ActionOtmena'
      Hint = 'F10'
      ImageIndex = 5
      ShortCut = 27
      OnExecute = ActionOtmenaExecute
    end
  end
  object pFIBStoredProcShablon: TpFIBStoredProc
    Database = pFIBDatabaseShabloni_Prov
    Transaction = pFIBTransactionWrite
    Left = 408
    Top = 72
  end
  object StyleRepository: TcxStyleRepository
    Left = 476
    Top = 73
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 209
        FloatTop = 209
        FloatClientWidth = 84
        FloatClientHeight = 144
        ItemLinks = <
          item
            Item = dxBarLargeButton6
            Visible = True
          end
          item
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            Item = dxBarLargeButton3
            Visible = True
          end
          item
            Item = dxBarLargeButton4
            Visible = True
          end
          item
            Item = dxBarLargeButton7
            Visible = True
          end
          item
            Item = dxBarLargeButton8
            Visible = True
          end>
        Name = 'Custom 1'
        NotDocking = [dsNone]
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    HotImages = ImageList
    Images = ImageList
    LargeImages = ImageList
    NotDocking = [dsNone]
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 480
    Top = 8
    DockControlHeights = (
      0
      0
      40
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = ActionADD
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = ActionChange
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = ActionDEL
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Action = ActionVibrat
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton5: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      AutoGrayScale = False
    end
    object dxBarStatic1: TdxBarStatic
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarLargeButton6: TdxBarLargeButton
      Action = ActionADD
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton7: TdxBarLargeButton
      Action = ActionObnov
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton8: TdxBarLargeButton
      Action = ActionOtmena
      Category = 0
      AutoGrayScale = False
    end
  end
  object ImageList: TImageList
    Left = 56
    Top = 121
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900000000000000000000000000000000000000000000000000000000000000
      0000824B4B00824B4B00A64B4B00A94D4D004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003939390080808000808080008080
      8000808080008080800084848400848484008484840084848400848484003939
      3900393939000000000000000000000000000000000000000000824B4B00824B
      4B00B64F5000C24F5000C54D4E00B24D4E004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003939390039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900393939003939390000000000000000000000000000000000824B4B00D458
      5900CB555600C9545500C9525300B74F52004E1E1F00FE8B8C00FB9A9C00F8AA
      AB00F7B5B600F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C5C5C500C5C5C500C5C5C500C5C5C500C5C5C5008484
      8400393939003939390000000000000000000000000000000000824B4B00D75C
      5D00D05A5B00CF595A00CF575800BD5356004E1E1F0023B54A0013C1480016BD
      48000CBC4100F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000FF000000FF00000000FF000000FF00C5C5C5008484
      8400848484003939390039393900000000000000000000000000824B4B00DD63
      6400D75F6000D55E5F00D55C5D00C2575A004E1E1F002AB44D001CBF4C001EBC
      4C0013BC4500F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C5C5C500C5C5C500C5C5C500C5C5C500C5C5C5008484
      8400848484008484840039393900000000000000000000000000824B4B00E368
      6900DD656600DA636400DE666700C6595B004E1E1F0026B1490016BC48001BBB
      490010BB4300F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039393900393939003939
      390039393900393939003939390039393900393939003939390039393900C5C5
      C500848484008484840039393900000000000000000000000000824B4B00EB6D
      6E00E2676800E67E7F00FAD3D400CC6E70004E1E1F00A5D8970050D16F0042C9
      66002DC75800F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B58C8C00FFFF
      FF00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00FFFFFF009C6B
      6B00C5C5C5008484840039393900000000000000000000000000824B4B00F273
      7400E96C6D00EB818200FCD1D300CF6E70004E1E1F00FFF2CC00FFFFD700FFFF
      D400E6FCC700F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B58C8C00FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFFF7009C6B
      6B00393939003939390000000000000000000000000000000000824B4B00F878
      7900F0757600EE727300F0737400D16566004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD700F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B58C8C00FFFF
      FF00FFF7EF00F7E7CE00F7DEC600F7E7CE00F7DEC600F7E7CE00FFFFF7009C6B
      6B00000000000000000000000000000000000000000000000000824B4B00FE7F
      8000F77A7B00F6797A00F7777900D76B6B004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFF
      FF009C6B6B000000000000000000000000000000000000000000824B4B00FF83
      8400FC7F8000FB7E7F00FE7F8000DA6E6F004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFFFF700FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFFF
      FF009C6B6B000000000000000000000000000000000000000000824B4B00FF88
      8900FF828300FF818200FF828300E07374004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C6B6B0000000000000000000000000000000000824B4B00824B
      4B00E2757600FE818200FF868700E57677004E1E1F00FAEBC500FCFBD100FCFB
      CF00FCFBD100F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C009C6B6B0000000000000000000000000000000000000000000000
      0000824B4B009C565700CB6C6D00CF6E6E004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000824B4B00824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C3100009C3100000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D40000000000EF42
      0000AD290000AD29000073290000732900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA5005A3118005A311800000000000000
      000000000000000000000000000000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400FF9C1800FFF7
      E700AD290000AD29000073290000732900000000000097736B00B3887F00B184
      7C00B1847C00B1847C00B1857D00B1857D00B1857E00B0857D00AE857E00AA83
      7C00B0858000B48A7C00875D56000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA500FFE78C00FFE78C00313131000000
      000000000000000000000000000000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400FF9C1800FFF7
      E700AD290000AD290000732900007329000000000000B3938C00F1DCCA00FCDB
      C400FCDAC600FCDBC700FAD5BA00FED6BC00FFD4B600FAD3B600F6CFB000F1CD
      AE00F5CEA800FDCFAD009D706A000000000000000000FFF7E700FFD6A500FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A003131
      31009C3100009C3100000000000000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400000000000000
      0000AD290000AD290000732900007329000000000000B3969000ECE8D600FFF2
      D400E4E6BE00E3E1B900FFEAD300F4E1B600E9E3AF00FDDDB700FDD8AD00FAD5
      A700F6D6A200FCD8B600A07272000000000000000000FFF7E700F7DEC600F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7CE00F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400000000000000
      0000AD290000AD290000732900007329000000000000BB9F9000ECEFE500FFFA
      EC00A9D38F00009A0000029B050000980000009D000000930000269D2300D5CD
      9800FFD7AC00FED7BA009E7070000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00EFDECE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA5000000000008080800FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C18000000000000000000EF42
      0000AD290000AD2900007329000073290000FF9C1800FF9C1800000000000000
      0000AD290000AD290000732900007329000000000000C0A49800EFF1EA00FFFB
      F400AAD89900009400000098000010A016009CCE9100AFC791002FA826005FB5
      4F00F6DAB100FFDEC6009E7170000000000000000000FFF7E70045454500FFD6
      A50045454500FFD6A5001F1F1F00FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6300000000000000000000000000000000000000000000000000080808000000
      000000000000FF633100FFEFA500FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C3100007329000073290000FF9C1800F7FFFF00000000000000
      0000AD290000AD290000732900007329000000000000C4A7A000EFF5E900FFFC
      F700B3DCA300019D01000DA10B001DA41C0051B14300F0E5C400F4E2C3005FB4
      5B00D9D29D00FFDDC600A77A74000000000000000000FFF7EF00F7DEC600F7DE
      C600F7DEC6001F1F1F001F1F1F00F7DEC600F7DEBD00F7E7CE00EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFDE8400FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD290000732900007329000000000000CAACA100F4FAF200F2F7
      E500DCEBCE00FBF4E600F5F3DF00F9F1DA00FEE7CD00FEEBD800FFECDB00F7E6
      CD00F0DEB600FEDAC100AB7D75000000000000000000FFF7EF00F7E7CE00F7DE
      C6001F1F1F001F1F1F001F1F1F00F7DEC600F7DEC600F7E7D600EFDECE009C6B
      6B000000000000000000000000000000000000000000FFFFCE00FFFFBD00FFC6
      5A00FFA51000FF9C0000F7FFFF00FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FFA53900FFA53900F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD2900008C3921008C39210000000000D2B5A000F6FAFA00E6F7
      E1008AD38800EDF3DF00FFFCF900C0DEAA004AB0390053B4430049B13C00C5D5
      9F00FFE8D000FDE1CC00AA7E76000000000000000000FFFFF700FFD6A5001F1F
      1F008484840000FFFF001F1F1F00FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      00000000000008080800F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000C8D0D400FFA53900FFA53900EF42
      0000EF420000AD290000732900008C392100FFA53900FF9C1800000000000000
      0000AD2900008C3921008C392100C8D0D40000000000D1B4A100F4FAF800FFFF
      FD008FCF910049B95100E2EFD800FFF9EA0063BB64000093000000910000AAD0
      8D00FFEED900FEDFCA00AC7F77000000000000000000FFFFF700FFE7D6001F1F
      1F00C6C6C60000FFFF001F1F1F00FFE7D6000000000000000000000000009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000C8D0D400C8D0D400FFA53900FFF7
      E700EF420000AD290000732900008C392100FFA53900FFF7E700000000000000
      00008C3921008C392100C8D0D400C8D0D40000000000DBBDA300F6FDFA00FFFF
      FF00E9F4E5003AAA350018A519005FC0590036AD33000099000000950000AAD4
      8F00FFF6E200FCDCC800AF847D000000000000000000FFFFFF001F1F1F008484
      840000FFFF001F1F1F00FFFFF700FFFFF70000000000FFFFFF00C68C7B00C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100C65A0000FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C00009C3100000000000000000000C8D0D400C8D0D400FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D40000000000E1C3A300F6FDFB00F8FC
      F800FFFFFF00C4EBCC0021AA2500009500000094000012A414000D9F1100A5CC
      8B00FFCAC000F8ADA100AC7E760000000000000000004545450084848400C6C6
      C60000FFFF001F1F1F00FFFFFF00FFFFFF0000000000C68C7B00C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300C65A0000C65A0000CE636300FFC65A00FF9C
      0000FF9C00009C3100000000000000000000C8D0D400C8D0D400FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D40000000000E6C9A900F9FFFE00F8FC
      F800F8FCF800F8FCF800FBFEFA00FFFFFF00FFFFFF00FEFEF800FFFFFE00C9AA
      9700D4975200C79A7A00C3AEA20000000000000000001F1F1F001F1F1F0000FF
      FF001F1F1F0000000000000000000000000000000000C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300FFD67300FFD67300C65A0000CE636300FF9C
      0000FF9C00009C3100000000000000000000C8D0D400C8D0D400C8D0D400FFA5
      3900FF9C1800EF4200008C392100C8D0D400C8D0D400FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D40000000000E8CBAC00FBFFFF00FAFF
      FF00FAFFFF00FAFFFF00FAFEFD00F9FEFD00F4FBFB00F3FBF800F7FFFC00C6AA
      9800D09E7300DCC9B60000000000000000001F1F1F0000008400000084001F1F
      1F00C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFDE8400FFDE8400FFDE8400FFDE8400C65A0000C65A
      0000C65A00009C3100000000000000000000C8D0D400C8D0D400C8D0D400FFA5
      3900F7FFFF00EF4200008C392100C8D0D400C8D0D400FFA53900F7FFFF000000
      00008C392100C8D0D400C8D0D400C8D0D40000000000E7C29D00E1C6A500E2C6
      A600E2C6A600E2C6A600E2C4A400E1C3A300DDC1A100DCC0A000DEC3A300C29C
      8400DECCB800000000000000000000000000C8D0D4001F1F1F001F1F1F001F1F
      1F00C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF6331000000000000000000C8D0D400C8D0D400C8D0D400FFCE
      6300FFCE6300FFA53900FFA53900C8D0D400C8D0D400FFCE6300FFA53900FFA5
      39008C392100C8D0D400C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7E7CE008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600EFDE
      CE00EFDECE008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500EFDECE008C5A5A0000000000000000000000000000000000000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      840000008400000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000848300000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C008C5A5A008C5A5A008C5A
      5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7
      CE00EFDECE009C6B630000000000000000000000000000000000000084000000
      8400000084008484840000000000000000000000000000000000000084000000
      840084848400000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500F7E7CE008C5A5A00000000000000000000000000000000000000
      0000000000000084830000FFFE00008483000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7E700F7EFDE00F7EF
      DE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7E7
      D600EFDECE009C6B6B0000000000000000000000000000000000000000000000
      8400000084000000840084848400000000000000000000008400000084000000
      84000000000000000000000000000000000000000000000000000000FF00B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00F7E7CE008C5A5A00000000000000000000000000000000000000
      000000FFFE0000FFFE0000FFFE0000FFFE000084830000000000000000000000
      000000000000000000000000000000000000B58C8C00F7EFDE00F7DECE00F7DE
      C600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A5004C804C004C804C004C80
      4C004C804C00A57B730000000000000000000000000000000000000000000000
      0000000084000000840000008400848484000000840000008400000084000000
      00000000000000000000000000000000000000000000000000000000FF000000
      8400F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC6000000
      FF00EFDECE00EFDECE008C5A5A000000000000000000000000000000000000FF
      FE0000FFFE00848484008484840000FFFE0000FFFE0000848300000000000000
      000000000000000000000000000000000000B58C8C00FFF7E700FFD6A500FFD6
      A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D6004C804C0052AE570052AE
      57004C804C00A57B730000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000008400FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500000084000000
      FF00FFD6A500EFDECE009C6B63000000000000000000000000008484840000FF
      FE008484840000000000000000008484840000FFFE0000FFFE00008483000000
      000000000000000000000000000000000000B58C8C00FFF7EF00F7DEC600F7DE
      C600B58C8C00FFFFFF00FFFFFF004C804C004C804C004C804C0052AE570052AE
      57004C804C004C804C004C804C00000000000000000000000000000000000000
      00000000000000000000000084000000FF000000840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000006C6C
      FF0000008400F7DEC600F7DEC600F7DEC600F7DEC600000084000000FF00F7DE
      BD00F7E7CE00EFDECE009C6B6B00000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000FFFE0000FFFE000084
      830000000000000000000000000000000000B58C8C00FFF7EF00F7E7CE00F7DE
      C600B58C8C00FFFFFF00FFFFFF004C804C0052AE570052AE570052AE570052AE
      570052AE570052AE57004C804C00000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400848484000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C000000FF0000008400F7DEC600F7DEC600000084000000FF00F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFE0000FF
      FE0000848300000000000000000000000000B58C8C00FFFFF700FFD6A500FFD6
      A500B58C8C00FFFFFF00FFFFFF004C804C0069CA800069CA800069CA800052AE
      570052AE570052AE57004C804C00000000000000000000000000000000000000
      0000000084000000840000008400000000000000840000008400000084008484
      840000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF0000008400000084000000FF00FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FE0000FFFE00000000000000000000000000B58C8C00FFFFF700FFE7D600FFE7
      D600B58C8C00B58C8C00B58C8C004C804C004C804C004C804C0069CA800052AE
      57004C804C004C804C004C804C00000000000000000000000000000000000000
      8400000084000000840000000000000000000000000000008400000084000000
      840084848400000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF000000FF000000FF00FFE7D600FFE7D600FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFE00000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD004C804C0069CA800052AE
      57004C804C000000000000000000000000000000000000000000000084000000
      8400000084000000000000000000000000000000000000000000000084000000
      840000008400000000000000000000000000000000000000000000000000B58C
      8C000000FF00000084000000FF0000008400FFFFFF00FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C004C804C004C804C004C80
      4C004C804C000000000000000000000000000000000000000000000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      84000000840000000000000000000000000000000000000000000000FF000000
      FF0000008400FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00B58C
      8C00C68C7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C000000FF0000008400B58C8C00B58C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00BD8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFE7F00000000800FF07F00000000
      0007C001000000000003C001000000000003C001000000000001C00100000000
      0001C001000000008001C00100000000C001C00100000000C003C00100000000
      C00FC00100000000E007C00100000000E007C00100000000F003C00100000000
      F803F00100000000FFFFFC7F00000000800FFCFFE020FFFF800FFC3F20008001
      800FFC1F20008001800FF80320308001800FF00320308001800FF80360308001
      800FD80340308001800FD80340308001800F000300308001800F800300308001
      80EFD80300308001808FD00300308001808FF80300308001878FF80300308003
      000FF80300108007000FF8030000FFFFFFFFF003FFFFFFFFFFFFF003FFFFE001
      FFFFF003FFFFE001FDFFF003C7E7E001F8FF0003C3C7E001F07F0003E18FC001
      E03F0003F01FC001C01F0003F83FE001C60F0001FC3FE001EF070001F81FE001
      FF830001F10FE001FFC30001E387E001FFE30007C7C7E003FFF70007CFE7C007
      FFFF007FFFFF800FFFFF00FFFFFFFF9F00000000000000000000000000000000
      000000000000}
  end
  object DataSet: TpFIBDataSet
    Left = 384
    Top = 144
    poSQLINT64ToBCD = True
  end
end
