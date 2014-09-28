object _dmInvalid: T_dmInvalid
  OldCreateOrder = False
  Left = 564
  Top = 285
  Height = 198
  Width = 287
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'sql_role_name=')
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
  object InvalidSelect: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_GET_PCARD_ADD_PROPS(:Id_PCard)')
    AfterOpen = InvalidSelectAfterOpen
    Left = 144
    Top = 8
    poSQLINT64ToBCD = True
  end
  object InvalidSource: TDataSource
    DataSet = InvalidSelect
    Left = 224
    Top = 8
  end
  object DeleteQuery: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'execute procedure ASUP_DT_add_prop_delete(:id_rec);')
    Transaction = DefaultTransaction
    Left = 144
    Top = 104
  end
  object InsertUpdate: TpFIBQuery
    Database = DB
    SQL.Strings = (
      
        'execute procedure ASUP_DT_add_prop_INSERT (:ID_pcard, :ID_prop, ' +
        ':DATE_BEG, :DATE_END);')
    Transaction = DefaultTransaction
    Left = 144
    Top = 56
  end
end
