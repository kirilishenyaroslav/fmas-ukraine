object dmCalcPlanHoliday: TdmCalcPlanHoliday
  OldCreateOrder = False
  Left = 192
  Top = 114
  Height = 191
  Width = 274
  object dbWork: TpFIBDatabase
    DefaultTransaction = trRead
    DefaultUpdateTransaction = trWrite
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 8
  end
  object dstWork: TpFIBDataSet
    Database = dbWork
    Transaction = trRead
    UpdateTransaction = trWrite
    SelectSQL.Strings = (
      
        'select * from HL_GET_DATA_FOR_CALC_HOLIDAY(:IN_ID_WORK_DOG_MOVIN' +
        'G, :IN_PERIOD_BEG, :IN_PERIOD_END)')
    Left = 56
    Top = 8
    poSQLINT64ToBCD = True
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dbWork
    TimeoutAction = TARollback
    Left = 16
    Top = 56
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dbWork
    TimeoutAction = TARollback
    TPBMode = tpbDefault
    Left = 56
    Top = 56
  end
  object spcWork: TpFIBStoredProc
    Database = dbWork
    Transaction = trWrite
    Left = 136
    Top = 40
  end
end
