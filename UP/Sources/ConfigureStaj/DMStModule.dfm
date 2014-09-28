object DModule: TDModule
  OldCreateOrder = False
  Left = 274
  Top = 189
  Height = 429
  Width = 646
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 88
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 32
    Top = 24
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 90
    Top = 24
  end
  object SelectStaj: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 24
    Top = 200
    poSQLINT64ToBCD = True
  end
  object SelectStajSource: TDataSource
    DataSet = SelectStaj
    Left = 96
    Top = 200
  end
  object StajTypePostSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      
        'select * from UP_CONF_TP_STAJ_SEL(:id_staj, :date_beg, :date_end' +
        ')')
    Left = 24
    Top = 152
    poSQLINT64ToBCD = True
  end
  object DSStajTypePost: TDataSource
    DataSet = StajTypePostSet
    Left = 96
    Top = 152
  end
  object CatSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'select * from sp_type_post')
    Left = 24
    Top = 248
    poSQLINT64ToBCD = True
  end
  object CatDs: TDataSource
    DataSet = CatSet
    Left = 88
    Top = 248
  end
  object StorProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 24
    Top = 312
  end
  object PeopleCalcDS: TDataSource
    DataSet = PeopleCalcSet
    Left = 280
    Top = 16
  end
  object PeopleCalcSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      
        'select * from up_people_calc_staj_sel(:id_staj, :date_beg, :date' +
        '_end)')
    Left = 200
    Top = 16
    poSQLINT64ToBCD = True
  end
  object PeopleNCalcSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      
        'select * from up_people_ncalc_staj_sel(:id_staj, :date_beg, :dat' +
        'e_end)')
    Left = 200
    Top = 80
    poSQLINT64ToBCD = True
  end
  object PeopleNCalcDS: TDataSource
    DataSet = PeopleNCalcSet
    Left = 280
    Top = 80
  end
  object PeopleTempDS: TDataSource
    DataSet = FilterDataSet
    Left = 288
    Top = 152
  end
  object PeopleTempSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'select * from up_peopl_calc_tmp_stj_sel(:key_session)')
    Left = 200
    Top = 152
    poSQLINT64ToBCD = True
  end
  object TempClear: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 200
    Top = 216
    poSQLINT64ToBCD = True
  end
  object TypePost: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'select * from UP_POST_STAJ_CONF_SEL')
    Left = 208
    Top = 272
    poSQLINT64ToBCD = True
  end
  object TypePostDS: TDataSource
    DataSet = TypePost
    Left = 288
    Top = 272
  end
  object FilterDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 208
    Top = 328
    poSQLINT64ToBCD = True
  end
end
