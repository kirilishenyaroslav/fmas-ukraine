object dmRegards: TdmRegards
  OldCreateOrder = False
  Left = 419
  Top = 177
  Height = 198
  Width = 287
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
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
  object RegardsSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM SP_MAN_REGARDS_SELECT(:Id_PCard)')
    Left = 144
    Top = 8
    poSQLINT64ToBCD = True
  end
  object InsertUpdate: TpFIBQuery
    Database = DB
    SQL.Strings = (
      
        'execute procedure ASUP_man_Regards_i (:ID_PCARD,:ID_Regard,:date' +
        '_beg,:num_doc,:id,:theme_dis);')
    Transaction = DefaultTransaction
    Left = 144
    Top = 56
  end
  object DeleteQ: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'execute procedure ASUP_man_Regards_D (:id_man_Regard);')
    Transaction = DefaultTransaction
    Left = 144
    Top = 112
  end
  object SearchShiftSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 208
    Top = 16
    poSQLINT64ToBCD = True
  end
end
