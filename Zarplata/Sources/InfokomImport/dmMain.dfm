object MainDM: TMainDM
  OldCreateOrder = False
  Left = 823
  Top = 271
  Height = 354
  Width = 373
  object MainDataBase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = MainDataBase
    TimeoutAction = TARollback
    Left = 120
    Top = 8
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = MainDataBase
    TimeoutAction = TARollback
    Left = 224
    Top = 8
  end
  object InsertProc: TpFIBStoredProc
    Database = MainDataBase
    Transaction = WriteTransaction
    Left = 32
    Top = 88
  end
  object INFOKOM: THalcyonDataSet
    AutoFlush = False
    DatabaseName = 'C:\Share'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'september.dbf'
    TranslateASCII = False
    UseDeleted = False
    UserID = 0
    Left = 120
    Top = 88
  end
end
