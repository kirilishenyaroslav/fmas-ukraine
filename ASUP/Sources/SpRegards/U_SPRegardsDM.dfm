object DMSPRegards: TDMSPRegards
  OldCreateOrder = False
  Left = 381
  Top = 146
  Height = 262
  Width = 369
  object FIBDatabase: TpFIBDatabase
    DefaultTransaction = FIBReadTransaction
    DefaultUpdateTransaction = FIBWriteTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object FIBDataSetFull: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    SelectSQL.Strings = (
      
        'select * from sp_regards_select(:Id_group) order by full_name co' +
        'llate win1251_ua;')
    Left = 224
    poSQLINT64ToBCD = True
  end
  object FIBReadTransaction: TpFIBTransaction
    DefaultDatabase = FIBDatabase
    TimeoutAction = TACommit
    Left = 112
    Top = 8
  end
  object FIBWriteTransaction: TpFIBTransaction
    DefaultDatabase = FIBDatabase
    TimeoutAction = TACommit
    Left = 112
    Top = 64
  end
  object FIBQuery: TpFIBQuery
    Database = FIBDatabase
    Transaction = FIBWriteTransaction
    Left = 312
  end
  object FIBDSAllProp: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    SelectSQL.Strings = (
      'select * from sp_regards_properties order by prop_name;')
    Left = 224
    Top = 96
    poSQLINT64ToBCD = True
  end
  object FIBDSProp: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBReadTransaction
    UpdateTransaction = FIBWriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Sp_Regards_Properties')
    Left = 224
    Top = 144
    poSQLINT64ToBCD = True
  end
  object FIBSPAddReg: TpFIBDataSet
    Database = FIBDatabase
    Transaction = FIBWriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Sp_Regards_Insert(:Id_Reg_Group, :Full_Name,'
      ':Short_Name);')
    Left = 112
    Top = 128
    poSQLINT64ToBCD = True
  end
end
