object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 594
  Top = 333
  Height = 528
  Width = 374
  object DB: TpFIBDatabase
    DBName = 'D:\WORK\FULL_DB\Alchevsk\FULL_DB.IB'
    DBParams.Strings = (
      'sql_role_name='
      'user_name='
      'password=')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 8
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 24
    Top = 52
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 24
    Top = 104
    poSQLINT64ToBCD = True
  end
  object Report: TfrxReport
    Version = '3.15'
    DataSet = frxDBDataset1
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39113.404820057900000000
    ReportOptions.LastChange = 40912.456459953700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 24
    Top = 272
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 30.000000000000000000
      RightMargin = 20.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = DataSource1
    Left = 24
    Top = 216
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    Left = 24
    Top = 160
  end
  object pFIBDataSet2: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 96
    Top = 104
    poSQLINT64ToBCD = True
  end
  object DataSource2: TDataSource
    DataSet = pFIBDataSet2
    Left = 96
    Top = 160
  end
  object pFIBDataSet3: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 184
    Top = 104
    poSQLINT64ToBCD = True
  end
  object DataSource3: TDataSource
    Left = 184
    Top = 160
  end
  object pFIBDataSet4: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    DataSource = DataSource1
    Left = 264
    Top = 104
    poSQLINT64ToBCD = True
  end
  object frxDBDataset4: TfrxDBDataset
    UserName = 'frxDBDataset4'
    CloseDataSource = False
    DataSource = DataSource4
    Left = 264
    Top = 216
  end
  object DataSource4: TDataSource
    DataSet = pFIBDataSet4
    Left = 264
    Top = 160
  end
  object frxAvtoDBDset: TfrxDBDataset
    UserName = 'frxAvtoDBDset'
    CloseDataSource = False
    DataSet = AvtoDSet
    Left = 264
    Top = 368
  end
  object frxUchastokDSet: TfrxDBDataset
    UserName = 'frxUchastokDSet'
    CloseDataSource = False
    DataSet = UchastokDSet
    Left = 264
    Top = 416
  end
  object AvtoDSet: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    Left = 72
    Top = 368
    poSQLINT64ToBCD = True
  end
  object UchastokDSet: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    DataSource = AvtoDSource
    Left = 72
    Top = 416
    poSQLINT64ToBCD = True
  end
  object AvtoDSource: TDataSource
    DataSet = AvtoDSet
    Left = 168
    Top = 368
  end
  object UchastokDSource: TDataSource
    DataSet = UchastokDSet
    Left = 168
    Top = 416
  end
end
