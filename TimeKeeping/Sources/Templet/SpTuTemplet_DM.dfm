object DM: TDM
  OldCreateOrder = False
  Left = 469
  Height = 581
  Width = 510
  object TransactionR: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 96
    Top = 8
  end
  object DB: TpFIBDatabase
    DefaultTransaction = TransactionR
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = TransactionW
    Left = 248
    Top = 8
  end
  object DSetTemplet: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 24
    Top = 72
    poSQLINT64ToBCD = True
  end
  object TransactionW: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 192
    Top = 8
  end
  object DSourceTemplet: TDataSource
    DataSet = DSetTemplet
    Left = 104
    Top = 72
  end
  object DSetTempletDep: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    DataSource = DSourceTemplet
    Left = 200
    Top = 72
    poSQLINT64ToBCD = True
  end
  object DSourceTempletDep: TDataSource
    DataSet = DSetTempletDep
    Left = 296
    Top = 72
  end
  object DSetTempletCat: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    DataSource = DSourceTemplet
    Left = 200
    Top = 128
    poSQLINT64ToBCD = True
  end
  object DSourceTempletCat: TDataSource
    DataSet = DSetTempletCat
    Left = 296
    Top = 128
  end
  object DSetTempletDog: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    DataSource = DSourceTemplet
    Left = 200
    Top = 184
    poSQLINT64ToBCD = True
  end
  object DSourceTempletDog: TDataSource
    DataSet = DSetTempletDog
    Left = 296
    Top = 184
  end
  object DSetTempletBalDep: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 208
    Top = 240
    poSQLINT64ToBCD = True
  end
  object DSourceTempletBalDep: TDataSource
    DataSet = DSetTempletBalDep
    Left = 312
    Top = 240
  end
  object DSetCat: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 32
    Top = 288
    poSQLINT64ToBCD = True
  end
  object DSourceCat: TDataSource
    DataSet = DSetCat
    Left = 96
    Top = 288
  end
  object DSourceTempletBalCat: TDataSource
    DataSet = DSetTempletBalCat
    Left = 312
    Top = 288
  end
  object DSetTempletBalCat: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 200
    Top = 288
    poSQLINT64ToBCD = True
  end
  object DSetTemp: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 224
    Top = 392
    poSQLINT64ToBCD = True
  end
  object DSourceTemp: TDataSource
    DataSet = DSetTemp
    Left = 344
    Top = 392
  end
  object DSourceWorkContract: TDataSource
    DataSet = DSetWorkContract
    Left = 96
    Top = 352
  end
  object DSetWorkContract: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 32
    Top = 352
    poSQLINT64ToBCD = True
  end
  object DSourceEditWarning: TDataSource
    DataSet = DsetEditWarning
    Left = 104
    Top = 443
  end
  object DsetEditWarning: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 34
    Top = 443
    poSQLINT64ToBCD = True
  end
end
