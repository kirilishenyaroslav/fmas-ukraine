object DM_G: TDM_G
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 614
  Top = 338
  Height = 400
  Width = 533
  object DSource1: TDataSource
    DataSet = RxMemoryData1
    Left = 409
    Top = 25
  end
  object DB: TpFIBDatabase
    DBName = 'E:\'#1041#1040#1047#1067' '#1044#1040#1053#1053#1067#1061'\Rabota\Full_db.ib'
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=SYSDBA'
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 64
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 440
    Top = 136
  end
  object StProcTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 144
    Top = 72
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 144
    Top = 144
  end
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <>
    ObjectView = True
    AfterInsert = RxMemoryData1AfterInsert
    Left = 80
    Top = 248
  end
  object DSetMoving: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      '')
    Left = 216
    Top = 186
    poSQLINT64ToBCD = True
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 216
    Top = 90
  end
  object DSetEditPayment: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    AutoCommit = True
    SelectSQL.Strings = (
      '')
    AutoUpdateOptions.UpdateTableName = 'EMPLOYEE'
    AutoUpdateOptions.KeyFields = 'EMP_NO'
    AutoUpdateOptions.GeneratorName = 'EMP_NO_GEN'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Left = 400
    Top = 192
    poSQLINT64ToBCD = True
  end
  object DSourceEditPayment: TDataSource
    DataSet = DSetEditPayment
    Left = 400
    Top = 250
  end
  object StProc2: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 144
    Top = 192
  end
  object StProc3: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 144
    Top = 248
  end
  object StProcImport: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 144
    Top = 304
  end
  object DSetStudSelEdit: TpFIBDataSet
    Database = DB
    Transaction = WriteTransaction
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted, cusUninserted, cusDeletedApplied]
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.AutoParamsToFields = True
    Left = 80
    Top = 192
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSourceStudEdit: TDataSource
    DataSet = RxMemoryData1
    Left = 80
    Top = 298
  end
  object DSetStudSel: TpFIBDataSet
    Database = DB
    Transaction = WriteTransaction
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted]
    DataSource = DSourceEditPayment
    AutoUpdateOptions.CanChangeSQLs = True
    Left = 464
    Top = 232
    poSQLINT64ToBCD = True
  end
  object DSourceStud: TDataSource
    DataSet = DSetStudSel
    Left = 464
    Top = 290
  end
end
