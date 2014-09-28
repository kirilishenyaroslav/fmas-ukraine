object dmTableSigners: TdmTableSigners
  OldCreateOrder = False
  Left = 453
  Top = 265
  Height = 257
  Width = 412
  object SignersSource: TDataSource
    DataSet = SelectTableSigners
    Left = 136
    Top = 16
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 88
  end
  object SelectTableSigners: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM DT_TABLE_SIGNERS_SELECT')
    Left = 40
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 120
    Top = 88
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 216
    Top = 88
  end
  object RealSignersSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DeleteSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT * FROM Dt_Table_Signer_Real_Select(:Id_Table_Signer)')
    DataSource = SignersSource
    Left = 232
    Top = 16
    poSQLINT64ToBCD = True
  end
  object RealSignersSource: TDataSource
    DataSet = RealSignersSelect
    Left = 328
    Top = 16
  end
end
