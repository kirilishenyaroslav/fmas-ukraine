object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 124
  Height = 215
  Width = 383
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 48
    Top = 32
  end
  object DSetYears: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    Left = 184
    Top = 32
    poSQLINT64ToBCD = True
  end
  object TransRead: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 48
    Top = 112
  end
  object TransWrite: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 112
  end
  object StorProc: TpFIBStoredProc
    Database = DB
    Transaction = TransWrite
    Left = 112
    Top = 32
  end
  object DSourceYears: TDataSource
    DataSet = DSetYears
    Left = 184
    Top = 112
  end
  object RxMemDataYearsEDBO: TRxMemoryData
    FieldDefs = <>
    Left = 280
    Top = 32
  end
end
