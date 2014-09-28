object frmReestr_DM: TfrmReestr_DM
  OldCreateOrder = False
  Left = 472
  Top = 248
  Height = 267
  Width = 278
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
    Top = 48
  end
  object Tran_Read: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 64
    Top = 24
  end
  object Tran_write: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 72
    Top = 176
  end
  object StorProc_add: TpFIBStoredProc
    Database = DB
    Transaction = Tran_write
    Left = 136
    Top = 176
  end
  object DataSet_Reg: TpFIBDataSet
    Database = DB
    Transaction = Tran_Read
    UpdateTransaction = Tran_write
    Left = 136
    Top = 8
    poSQLINT64ToBCD = True
  end
  object Source_Reg: TDataSource
    DataSet = DataSet_Reg
    Left = 208
    Top = 32
  end
  object DataSet_read: TpFIBDataSet
    Database = DB
    Transaction = Tran_Read
    UpdateTransaction = Tran_write
    Left = 136
    Top = 64
    poSQLINT64ToBCD = True
  end
end
