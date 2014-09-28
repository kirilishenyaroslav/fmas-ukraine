object DM: TDM
  OldCreateOrder = False
  Left = 391
  Top = 103
  Height = 258
  Width = 229
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 72
  end
  object DSetMain: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    UpdateTransaction = TransactionWrite
    SelectSQL.Strings = (
      '')
    Left = 168
    Top = 8
    poSQLINT64ToBCD = True
  end
  object DSourceMain: TDataSource
    DataSet = DSetMain
    Left = 120
    Top = 8
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 32
    Top = 120
  end
  object StProcTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 168
  end
  object TransactionWrite: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 160
    Top = 64
  end
end
