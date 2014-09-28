object DModule: TDModule
  OldCreateOrder = False
  Left = 488
  Top = 262
  Height = 610
  Width = 430
  object DB: TpFIBDatabase
    DefaultTransaction = RTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object RTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 8
  end
  object DSetMain: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    DefaultFormats.NumericDisplayFormat = '#,##.'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 25
    Top = 73
    poSQLINT64ToBCD = True
  end
  object DSourceMain: TDataSource
    DataSet = DSetMain
    Left = 104
    Top = 72
  end
  object StTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 184
    Top = 8
  end
  object DSource: TDataSource
    DataSet = DSetWork
    Left = 344
    Top = 128
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StTransaction
    Left = 248
    Top = 8
  end
  object DSetCalendar: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 248
    Top = 72
    poSQLINT64ToBCD = True
  end
  object DSetWork: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 248
    Top = 128
    poSQLINT64ToBCD = True
  end
  object DSourceHoliday: TDataSource
    DataSet = DSetHoliday
    Left = 104
    Top = 136
  end
  object DSetException: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    DefaultFormats.DisplayFormatTime = 'hh:mm '
    Left = 31
    Top = 199
    poSQLINT64ToBCD = True
  end
  object DSetHoliday: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    DefaultFormats.DisplayFormatTime = 'hh:mm '
    Left = 24
    Top = 136
    poSQLINT64ToBCD = True
  end
  object DSourceException: TDataSource
    DataSet = DSetException
    Left = 128
    Top = 200
  end
  object DSetCalendarById: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 256
    Top = 200
    poSQLINT64ToBCD = True
  end
  object DSourceTree1: TDataSource
    DataSet = DSetTree1
    Left = 104
    Top = 312
  end
  object DSetTree1: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 32
    Top = 312
    poSQLINT64ToBCD = True
  end
  object DSourceTree2: TDataSource
    DataSet = DSetTree2
    Left = 104
    Top = 360
  end
  object DSetTree2: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    DataSource = DSourceTree1
    Left = 32
    Top = 360
    poSQLINT64ToBCD = True
  end
  object DSourceTreeTrans: TDataSource
    DataSet = DSetTreeTrans
    Left = 104
    Top = 424
  end
  object DSetTreeTrans: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 32
    Top = 424
    poSQLINT64ToBCD = True
  end
  object DSetMainTrans: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    DataSource = DSourceMain
    DefaultFormats.NumericDisplayFormat = '#,##'
    DefaultFormats.NumericEditFormat = '#,##'
    DefaultFormats.DisplayFormatTime = 'hh:mm '
    Left = 42
    Top = 250
    poSQLINT64ToBCD = True
  end
  object DSourceMainTrans: TDataSource
    DataSet = DSetMainTrans
    Left = 122
    Top = 250
  end
end
