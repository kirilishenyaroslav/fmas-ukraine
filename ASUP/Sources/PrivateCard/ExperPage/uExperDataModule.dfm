object dmExper: TdmExper
  OldCreateOrder = False
  Left = 393
  Top = 177
  Height = 202
  Width = 311
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=sysdba')
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 56
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 56
    Top = 56
  end
  object ExperSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_MAN_Staj_S(:Id_PCard)')
    Left = 144
    Top = 8
    poSQLINT64ToBCD = True
  end
  object ExperSource: TDataSource
    DataSet = ExperSelect
    Left = 224
    Top = 8
  end
  object InsertUpdate: TpFIBQuery
    Database = DB
    SQL.Strings = (
      
        'execute procedure ASUP_man_Exper_i (:ID_PCARD,:ID_Regard,:date_b' +
        'eg,:num_doc,:id);')
    Transaction = DefaultTransaction
    Left = 56
    Top = 112
  end
  object DeleteQ: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'execute procedure ASUP_MAN_STAJ_D(:ID_MAN, :ID_STAJ);')
    Transaction = DefaultTransaction
    Left = 144
    Top = 112
  end
  object OrderDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 144
    Top = 56
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object HistExperSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 224
    Top = 56
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object ManCalcStajDSet: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 216
    Top = 112
    poSQLINT64ToBCD = True
  end
  object StorProc: TpFIBStoredProc
    Database = DB
    Transaction = DefaultTransaction
    Left = 16
    Top = 104
  end
end
