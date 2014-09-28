object dmFamily: TdmFamily
  OldCreateOrder = False
  Left = 393
  Top = 177
  Height = 198
  Width = 287
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
  object FamilySelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from ASUP_MAN_FRELATION_S(:ID_PCARD) ')
    Left = 144
    Top = 8
    poSQLINT64ToBCD = True
  end
  object FamilySource: TDataSource
    DataSet = FamilySelect
    Left = 224
    Top = 8
  end
end
