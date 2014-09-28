object DM: TDM
  OldCreateOrder = False
  Left = 520
  Top = 512
  Height = 308
  Width = 275
  object DB: TpFIBDatabase
    DBName = 'D:\DB\Buhg\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = RTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 8
  end
  object RTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    UserKindTransaction = 'read'
    Left = 40
    Top = 56
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    SelectSQL.Strings = (
      'SELECT * FROM GAR_SP_MARKA_S')
    Left = 40
    Top = 112
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    Left = 40
    Top = 168
  end
  object RWTransaction: TpFIBTransaction
    TimeoutAction = TARollback
    UserKindTransaction = 'read'
    Left = 120
    Top = 56
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Left = 120
    Top = 113
  end
end
