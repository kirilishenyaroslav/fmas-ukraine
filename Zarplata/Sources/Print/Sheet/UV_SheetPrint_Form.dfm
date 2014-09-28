object FPrintVed: TFPrintVed
  Left = 379
  Top = 272
  Width = 435
  Height = 87
  Caption = 'FPrintVed'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DataBase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'lc_ctype=win1251'
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
  end
  object DSetSetup: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    SHORT_NAME,'
      '    HEADER_POST,'
      '    GLBUHG_POST_SHORT'
      'FROM'
      '    Z_SETUP')
    Left = 48
    poSQLINT64ToBCD = True
  end
  object DSetGrSheet: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      '    UV_PRINT_SHEETONE'
      '    ('
      '    3,2'
      '    ) ')
    Left = 8
    Top = 32
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 104
    Top = 32
  end
  object DSetSheet: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      '    UV_PRINT_SHEETONE_DATA'
      '    ('
      '    ?ID_GRSHEET'
      '    ) ')
    DataSource = DSourceGrSheet
    Left = 72
    Top = 32
    poSQLINT64ToBCD = True
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbFind, pbPageSetup, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38463.583245856490000000
    ReportOptions.LastChange = 38463.583396226850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportGetValue
    OnStartReport = 'frxReportOnStartReport'
    Left = 296
    Datasets = <>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  object frxDBDSetSetup: TfrxDBDataset
    UserName = 'frxDBDSetSetup'
    CloseDataSource = False
    DataSet = DSetSetup
    Left = 328
  end
  object frxDBDSetSheet: TfrxDBDataset
    UserName = 'frxDBDSetSheet'
    CloseDataSource = False
    DataSet = DSetSheet
    Left = 328
    Top = 32
  end
  object frxDBDSetGrSheet: TfrxDBDataset
    UserName = 'frxDBDSetGrSheet'
    CloseDataSource = False
    DataSet = DSetGrSheet
    Left = 296
    Top = 32
  end
  object DSourceGrSheet: TDataSource
    DataSet = DSetGrSheet
    Left = 40
    Top = 32
  end
end
