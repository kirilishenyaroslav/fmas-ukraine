object DM_IE: TDM_IE
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 914
  Top = 135
  Height = 564
  Width = 348
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 88
    Top = 65528
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 40
  end
  object DataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 166
    Top = 65528
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 278
    Top = 40
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 232
  end
  object ReadDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 174
    Top = 40
    poSQLINT64ToBCD = True
  end
  object GlobalDataR: TADOConnection
    CommandTimeout = 99999999
    ConnectionTimeout = 9999999
    LoginPrompt = False
    Mode = cmRead
    Provider = 'SQLOLEDB.1'
    Left = 264
    Top = 152
  end
  object id_ref_I_dset: TADOStoredProc
    Connection = GlobalDataRW
    ExecuteOptions = [eoExecuteNoRecords]
    CommandTimeout = 99999999
    ProcedureName = 'n_dolg_insert;1'
    Parameters = <>
    Left = 88
    Top = 200
  end
  object AmodelkaR: TADOConnection
    CommandTimeout = 99999999
    ConnectionTimeout = 9999999
    LoginPrompt = False
    Mode = cmRead
    Provider = 'SQLOLEDB.1'
    Left = 256
    Top = 408
  end
  object exch_IU_dset: TADOStoredProc
    Connection = AmodelkaRW
    ExecuteOptions = [eoExecuteNoRecords]
    CommandTimeout = 99999999
    ProcedureName = 'n_dolg_insert;1'
    Parameters = <>
    Left = 96
    Top = 400
  end
  object j_app_I_dset: TADOStoredProc
    Connection = GlobalDataRW
    ExecuteOptions = [eoExecuteNoRecords]
    CommandTimeout = 99999999
    Parameters = <>
    Left = 24
    Top = 224
  end
  object app_dset: TADOStoredProc
    Connection = AmodelkaRW
    ExecuteOptions = [eoExecuteNoRecords]
    CommandTimeout = 99999999
    ProcedureName = 'n_dolg_insert;1'
    Parameters = <>
    Left = 32
    Top = 400
  end
  object exch_app_dset: TADOStoredProc
    Connection = GlobalDataRW
    CommandTimeout = 99999999
    ProcedureName = 'n_dolg_insert;1'
    Parameters = <>
    Left = 152
    Top = 224
  end
  object S_dset: TADOStoredProc
    Connection = GlobalDataR
    CommandTimeout = 99999999
    ProcedureName = 'n_dolg_insert;1'
    Parameters = <>
    Left = 264
    Top = 216
  end
  object GetPeopleID_dset: TADOStoredProc
    Connection = GlobalDataRW
    ExecuteOptions = [eoExecuteNoRecords]
    CommandTimeout = 99999999
    ProcedureName = 'n_dolg_insert;1'
    Parameters = <>
    Left = 88
    Top = 272
  end
  object SQ_dset: TADOStoredProc
    Connection = AmodelkaR
    CommandTimeout = 99999999
    ProcedureName = 'n_dolg_insert;1'
    Parameters = <>
    Left = 256
    Top = 464
  end
  object AmodelkaRW: TADOConnection
    CommandTimeout = 99999999
    ConnectionTimeout = 9999999
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'SQLOLEDB.1'
    Left = 64
    Top = 472
  end
  object GlobalDataRW: TADOConnection
    CommandTimeout = 99999999
    ConnectionTimeout = 9999999
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 144
  end
end
