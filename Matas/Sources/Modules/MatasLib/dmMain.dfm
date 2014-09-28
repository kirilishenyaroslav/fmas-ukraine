object dmMatas: TdmMatas
  OldCreateOrder = False
  Left = 310
  Top = 211
  Height = 285
  Width = 362
  object fdbMatas: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = ftrReadTransaction
    DefaultUpdateTransaction = ftrWriteTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 48
    Top = 20
  end
  object ftrReadTransaction: TpFIBTransaction
    DefaultDatabase = fdbMatas
    TimeoutAction = TACommit
    Left = 48
    Top = 72
  end
  object ftrWriteTransaction: TpFIBTransaction
    DefaultDatabase = fdbMatas
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 48
    Top = 128
  end
  object IniDataSet: TpFIBDataSet
    Database = fdbMatas
    Transaction = ftrReadTransaction
    UpdateTransaction = ftrWriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_INI')
    Left = 47
    Top = 185
    poSQLINT64ToBCD = True
  end
  object MatasStoredProc: TpFIBStoredProc
    Database = fdbMatas
    SQL.Strings = (
      'EXECUTE PROCEDURE MAT_INI_UPDATE (?NEW_DATE_REC)')
    Transaction = ftrWriteTransaction
    StoredProcName = 'MAT_INI_UPDATE'
    Left = 128
    Top = 16
  end
  object SetDataSet: TpFIBDataSet
    Database = fdbMatas
    Transaction = ftrReadTransaction
    UpdateTransaction = ftrWriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_SETUP')
    Left = 120
    Top = 184
    poSQLINT64ToBCD = True
  end
  object MatasFibErrorHandler: TpFibErrorHandler
    Options = [oeException, oeForeignKey, oeLostConnect, oeCheck, oeUniqueViolation]
    Left = 256
    Top = 16
  end
  object MatasWorkDataSet: TpFIBDataSet
    Database = fdbMatas
    Transaction = ftrReadTransaction
    UpdateTransaction = ftrWriteTransaction
    Left = 256
    Top = 80
    poSQLINT64ToBCD = True
  end
end
