object dmPension: TdmPension
  OldCreateOrder = False
  Left = 393
  Top = 177
  Height = 248
  Width = 346
  object DB: TpFIBDatabase
    DBName = 'E:\TEST_BD\FULL_DB.IB'
    DBParams.Strings = (
      'password=masterkey'
      'user_name=sysdba'
      'lc_ctype=win1251')
    DefaultTransaction = DefaultTransaction
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
  object PensionSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_SP_PENSION_S(:Id_PCard)')
    AfterOpen = PensionSelectAfterOpen
    Left = 144
    Top = 8
    poSQLINT64ToBCD = True
  end
  object PensionSource: TDataSource
    DataSet = PensionSelect
    Left = 224
    Top = 8
  end
  object InsertUpdate: TpFIBQuery
    Database = DB
    SQL.Strings = (
      
        'execute procedure ASUP_SP_PENSION_i (:ID_PCARD,:ID_PENSION_CAT,:' +
        'ID_PENSION_TYPE,:NOTE,:DATE_BEG,:DATE_END,:ID_PENSION_PROP,:DATE' +
        '_START,:DATE_WORK_BEG,:ORDER_NUMB,:DATE_ORDER,:DOKUMENT,:id_sp_p' +
        'ension);')
    Transaction = DefaultTransaction
    Left = 144
    Top = 56
  end
  object DeleteQ: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'execute procedure ASUP_SP_PENSION_D (:id_sp_pension);')
    Transaction = DefaultTransaction
    Left = 144
    Top = 112
  end
  object InfinityDate: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'select INFINITY_DATE'
      'from PUB_SYS_DATA')
    Left = 216
    Top = 64
    poSQLINT64ToBCD = True
    object InfinityDateINFINITY_DATE: TFIBDateTimeField
      FieldName = 'INFINITY_DATE'
    end
  end
  object StorProc: TpFIBStoredProc
    Database = DB
    Transaction = DefaultTransaction
    Left = 64
    Top = 120
  end
end
