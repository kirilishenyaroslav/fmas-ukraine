object dmMoveReport: TdmMoveReport
  OldCreateOrder = False
  Left = 321
  Top = 110
  Height = 185
  Width = 329
  object DB: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 16
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 88
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 88
  end
  object MoveDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM Asup_Moves_Report(:Root_Department, :Date_Beg, :Da' +
        'te_End)')
    Left = 136
    Top = 16
    poSQLINT64ToBCD = True
  end
  object CurrentDepartment: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT Current_Department FROM Ini_Asup_Consts')
    Left = 232
    Top = 16
    poSQLINT64ToBCD = True
  end
  object GetSign: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Get_Shtat_Prop_People(:Id_Shtat_Prop, :Cur_Date)')
    Left = 232
    Top = 88
    poSQLINT64ToBCD = True
  end
end
