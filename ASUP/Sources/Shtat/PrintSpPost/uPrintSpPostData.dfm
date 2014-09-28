object dmPrintSpPost: TdmPrintSpPost
  OldCreateOrder = False
  Left = 460
  Top = 193
  Height = 189
  Width = 277
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 24
    Top = 16
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 128
    Top = 16
  end
  object ReportDS: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM ASUP_SHTAT_POST_REPORT(:Cur_Date, :R1, :R2, :R3, :' +
        'R4, :R5, :R6, :R7, :R8, :R9)')
    Left = 128
    Top = 88
    poSQLINT64ToBCD = True
  end
  object PostSource: TDataSource
    DataSet = ReportDS
    Left = 208
    Top = 88
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TACommit
    Left = 32
    Top = 88
  end
end
