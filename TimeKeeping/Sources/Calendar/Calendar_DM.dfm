object DModule: TDModule
  OldCreateOrder = False
  Left = 208
  Top = 172
  Height = 247
  Width = 333
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = StTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 24
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StTransaction
    Left = 112
    Top = 104
  end
  object StTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 40
    Top = 72
  end
  object DSetCalendar: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 168
    Top = 24
    poSQLINT64ToBCD = True
  end
  object DSetWork: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 248
    Top = 24
    poSQLINT64ToBCD = True
  end
  object DSource: TDataSource
    DataSet = DSetWork
    Left = 48
    Top = 128
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 48
  end
  object DSetHoliday: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 256
    Top = 96
    poSQLINT64ToBCD = True
  end
  object DSourceHoliday: TDataSource
    DataSet = DSetHoliday
    Left = 176
    Top = 168
  end
end
