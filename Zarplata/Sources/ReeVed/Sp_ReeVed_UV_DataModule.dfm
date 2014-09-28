object DM_ReeVed: TDM_ReeVed
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 632
  Top = 320
  Height = 305
  Width = 373
  object DataBase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 13
    Top = 32
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 85
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 85
    Top = 56
  end
  object DataSetParent: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UV_REE_VED_SELECT')
    Left = 173
    poSQLINT64ToBCD = True
  end
  object DataSetChildParent: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UV_GRSHEET_SELECT_REE(?ID_REESTR)')
    DataSource = DataSourceParent
    Left = 173
    Top = 56
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DataSetChild: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UV_SHEET_LIST_PEOPLE(:ID_GRSHEET)')
    DataSource = DataSourceChildParent
    Left = 173
    Top = 112
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DataSourceParent: TDataSource
    DataSet = DataSetParent
    Left = 269
  end
  object DataSourceChildParent: TDataSource
    DataSet = DataSetChildParent
    Left = 269
    Top = 56
  end
  object DataSourceChild: TDataSource
    DataSet = DataSetChild
    Left = 269
    Top = 112
  end
  object StoredProc: TpFIBStoredProc
    Database = DataBase
    Transaction = WriteTransaction
    Left = 21
    Top = 96
  end
  object DataSetSheetData: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UV_SHEETPRO_SELECTMAN(?ID_SHEET)')
    DataSource = DataSourceChild
    Left = 173
    Top = 162
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DataSourceSheetData: TDataSource
    DataSet = DataSetSheetData
    Left = 269
    Top = 162
  end
  object ExportToBankDataSet: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT ID_MAN,TN,FIO,SUMMA'
      'FROM '
      'UV_SHEET_TO_BANK_ALLDATA(?ID_SESSION)'
      'ORDER BY TN'
      '')
    Left = 176
    Top = 216
    poSQLINT64ToBCD = True
  end
  object DSetSheetToBankCheck: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    Left = 48
    Top = 160
    poSQLINT64ToBCD = True
  end
end
