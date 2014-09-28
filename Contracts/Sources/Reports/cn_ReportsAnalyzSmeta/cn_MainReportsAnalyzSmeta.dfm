object frmReportsAnalyzSmeta: TfrmReportsAnalyzSmeta
  Left = 491
  Top = 363
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmReportsAnalyzSmeta'
  ClientHeight = 253
  ClientWidth = 327
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 0
    Top = 80
    Width = 319
    Height = 19
    Progress = 0
  end
  object cxGroupBoxPeriodStud: TcxGroupBox
    Left = 0
    Top = 0
    Width = 321
    Height = 45
    Alignment = alTopLeft
    Caption = 'cxGroupBoxPeriodStud'
    TabOrder = 0
    object cxLabelPriodBegin: TcxLabel
      Left = 8
      Top = 17
      Width = 114
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object cxLabelPeriodEnd: TcxLabel
      Left = 157
      Top = 17
      Width = 111
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
  end
  object cxButtonFilter: TcxButton
    Left = 0
    Top = 48
    Width = 320
    Height = 25
    Caption = 'cxButtonFilter'
    TabOrder = 2
    OnClick = cxButtonFilterClick
  end
  object cxButtonRun: TcxButton
    Left = 0
    Top = 102
    Width = 100
    Height = 25
    Caption = 'cxButtonRun'
    Default = True
    TabOrder = 3
    OnClick = cxButtonRunClick
  end
  object cxButtonCancel: TcxButton
    Left = 112
    Top = 102
    Width = 75
    Height = 25
    Caption = 'cxButtonCancel'
    TabOrder = 4
    Visible = False
  end
  object cxButtonQuit: TcxButton
    Left = 237
    Top = 102
    Width = 75
    Height = 25
    Caption = 'cxButtonQuit'
    TabOrder = 5
    OnClick = cxButtonQuitClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 234
    Width = 327
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object cxButtonView: TcxButton
    Left = 0
    Top = 171
    Width = 318
    Height = 25
    Caption = 'cxButtonView'
    TabOrder = 6
    OnClick = cxButtonViewClick
  end
  object cxDateEditPeriodEnd: TcxDateEdit
    Left = 180
    Top = 15
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object cxDateEditPeriodBegin: TcxDateEdit
    Left = 20
    Top = 15
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object cxButtonDOC: TcxButton
    Left = 0
    Top = 203
    Width = 318
    Height = 25
    Caption = 'cxButtonDOC'
    Enabled = False
    TabOrder = 7
    OnClick = cxButtonDOCClick
  end
  object cxRadioGrouptypeRep: TcxRadioGroup
    Left = -1
    Top = 127
    Width = 320
    Height = 32
    ItemIndex = 0
    Properties.Columns = 2
    Properties.Items = <
      item
      end
      item
      end>
    TabOrder = 10
    Caption = ''
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 104
    Top = 20
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 136
    Top = 20
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 168
    Top = 20
  end
  object Styles: TcxStyleRepository
    Left = 184
    Top = 55
    object BackGround: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object FocusedRecord: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 11037222
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clDefault
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Header: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object DesabledRecord: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 13875838
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = 15850428
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15850428
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
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14531001
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object Default_StyleSheet: TcxGridTableViewStyleSheet
      Styles.Background = BackGround
      Styles.Content = BackGround
      Styles.ContentEven = cxStyle1
      Styles.ContentOdd = cxStyle2
      Styles.Inactive = DesabledRecord
      Styles.Selection = FocusedRecord
      Styles.Header = Header
      BuiltIn = True
    end
    object DevExpress_Style: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle3
      Styles.Content = cxStyle4
      Styles.ContentEven = cxStyle5
      Styles.ContentOdd = cxStyle6
      Styles.Inactive = cxStyle12
      Styles.IncSearch = cxStyle13
      Styles.Selection = cxStyle16
      Styles.FilterBox = cxStyle7
      Styles.Footer = cxStyle8
      Styles.Group = cxStyle9
      Styles.GroupByBox = cxStyle10
      Styles.Header = cxStyle11
      Styles.Indicator = cxStyle14
      Styles.Preview = cxStyle15
      BuiltIn = True
    end
  end
  object pFIBDataSetPrintSetup: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from cn_ini_print_setup'
      'order by ORD_FIELD DESC')
    Left = 104
    Top = 56
    poSQLINT64ToBCD = True
  end
  object RxMemoryDataPrintSetup: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxSelectField'
        DataType = ftSmallint
      end
      item
        Name = 'RxNameField'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'RxNameVariant'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RxLenghtField'
        DataType = ftInteger
      end
      item
        Name = 'RxOrdFileds'
        DataType = ftSmallint
      end>
    Left = 136
    Top = 56
  end
  object DataSourcePrintSetup: TDataSource
    DataSet = RxMemoryDataPrintSetup
    Left = 64
    Top = 50
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 280
    Top = 41
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 200
    Top = 20
  end
  object pFIBDataSetSetup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from cn_ini_print_report')
    Left = 32
    Top = 63
    poSQLINT64ToBCD = True
  end
  object ActionList1: TActionList
    Left = 200
    Top = 56
    object ActionRun: TAction
      Caption = 'ActionRun'
      ShortCut = 121
      OnExecute = ActionRunExecute
    end
    object ActionView: TAction
      Caption = 'ActionView'
      ShortCut = 123
      OnExecute = ActionViewExecute
    end
    object ActionParam: TAction
      Caption = 'ActionParam'
      ShortCut = 118
      OnExecute = ActionParamExecute
    end
    object ActionDebug: TAction
      Caption = 'ActionDebug'
      ShortCut = 49220
      OnExecute = ActionDebugExecute
    end
    object isDebug_act: TAction
      Caption = 'isDebug_act'
      ShortCut = 57412
      OnExecute = isDebug_actExecute
    end
  end
  object pFIBDataSetInitDate: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select PUB_SYS_DATA.cn_date_start,PUB_SYS_DATA.cn_end_month from' +
        ' PUB_SYS_DATA')
    Left = 232
    Top = 21
    poSQLINT64ToBCD = True
  end
  object pFIBDataSetToDoc: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 104
    Top = 136
    poSQLINT64ToBCD = True
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT d.SMETA_KOD, d.SMETA_TITLE, s.NAME_FACULT, s.NAME_SPEC, s' +
        '.NAME_FORM_STUD, s.NAME_KAT_STUD, s.FIO, s.NUM_DOG, d.SUMMA_F_PE' +
        'RE'
      'from CN_TMP_REPORT_PAY_DOC_PROV d'
      'inner join cn_tmp_report_stud s on s.ID_STUD=d.ID_STUD'
      
        'where d.id_session=:ID_SESSION and s.ID_SESSION=:ID_SESSION and ' +
        'd.SUMMA_F_PERE<>0'
      'and not exists('
      'select id_stud from CN_TMP_REPORT_PAY_DOC_PROV r'
      'where r.id_session=:ID_SESSION and r.ID_STUD=d.ID_STUD'
      'group by 1'
      'having count(*)>1)'
      
        'order by d.SMETA_KOD, s.NAME_FACULT, s.NAME_SPEC, s.NAME_FORM_ST' +
        'UD, s.NAME_KAT_STUD, s.FIO')
    Left = 256
    Top = 136
    poSQLINT64ToBCD = True
    object pFIBDataSet1SMETA_KOD: TFIBIntegerField
      FieldName = 'SMETA_KOD'
    end
    object pFIBDataSet1NAME_FACULT: TFIBStringField
      FieldName = 'NAME_FACULT'
      Size = 60
      EmptyStrToNull = True
    end
    object pFIBDataSet1NAME_SPEC: TFIBStringField
      FieldName = 'NAME_SPEC'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSet1NAME_FORM_STUD: TFIBStringField
      FieldName = 'NAME_FORM_STUD'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSet1NAME_KAT_STUD: TFIBStringField
      FieldName = 'NAME_KAT_STUD'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSet1FIO: TFIBStringField
      FieldName = 'FIO'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSet1NUM_DOG: TFIBStringField
      FieldName = 'NUM_DOG'
      Size = 75
      EmptyStrToNull = True
    end
    object pFIBDataSet1SUMMA_F_PERE: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'SUMMA_F_PERE'
      DisplayFormat = '#,##0.000000'
      EditFormat = '0.000000'
      Size = 6
      RoundByScale = True
    end
    object pFIBDataSet1SMETA_TITLE: TFIBStringField
      FieldName = 'SMETA_TITLE'
      Size = 180
      EmptyStrToNull = True
    end
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40016.585660081000000000
    ReportOptions.LastChange = 40360.689579525460000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    Left = 256
    Top = 168
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = pFIBDataSet1
    Left = 256
    Top = 200
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 72
    Top = 208
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 104
    Top = 208
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 144
    Top = 208
  end
end
