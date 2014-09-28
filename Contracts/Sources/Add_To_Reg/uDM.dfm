object DM: TDM
  OldCreateOrder = False
  Left = 518
  Top = 215
  Height = 219
  Width = 264
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = Tran_Read
    DefaultUpdateTransaction = Tran_write
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 32
  end
  object DataSet_Reg: TpFIBDataSet
    Database = DB
    Transaction = Tran_Read
    UpdateTransaction = Tran_write
    Left = 136
    Top = 8
    poSQLINT64ToBCD = True
  end
  object Tran_Read: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 64
    Top = 8
  end
  object Tran_write: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 64
    Top = 56
  end
  object Proc_add: TpFIBStoredProc
    Database = DB
    Transaction = Tran_write
    Left = 136
    Top = 56
  end
  object Source1: TDataSource
    DataSet = DataSet_Reg
    Left = 200
    Top = 8
  end
end
