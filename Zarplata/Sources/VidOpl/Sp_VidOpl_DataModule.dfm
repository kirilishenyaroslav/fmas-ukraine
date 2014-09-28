object DMVidOpl: TDMVidOpl
  OldCreateOrder = False
  Left = 186
  Top = 153
  Height = 405
  Width = 624
  object DB: TpFIBDatabase
    DefaultTransaction = RTransaction
    DefaultUpdateTransaction = RTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object DSetUD1: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 80
    Top = 8
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSetUD2: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    DataSource = DSourceUD1
    Left = 80
    Top = 64
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object RTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 464
    Top = 64
  end
  object WTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 464
    Top = 8
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WTransaction
    Left = 384
    Top = 64
  end
  object DSourceUD2: TDataSource
    DataSet = DSetUD2
    Left = 168
    Top = 64
  end
  object DSourceUD1: TDataSource
    DataSet = DSetUD1
    Left = 168
    Top = 8
  end
  object DSetNar1: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 80
    Top = 114
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSourceNar1: TDataSource
    DataSet = DSetNar1
    Left = 168
    Top = 114
  end
  object DSourceNar2: TDataSource
    DataSet = DSetNar2
    Left = 168
    Top = 170
  end
  object DSetNar2: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    DataSource = DSourceNar1
    Left = 80
    Top = 170
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSetCor1: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 80
    Top = 221
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSourceCor1: TDataSource
    DataSet = DSetCor1
    Left = 168
    Top = 221
  end
  object DSetConsts1: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 80
    Top = 268
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSourceConsts1: TDataSource
    DataSet = DSetConsts1
    Left = 168
    Top = 268
  end
end
