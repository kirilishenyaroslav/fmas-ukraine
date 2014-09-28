object DM: TDM
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
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 32
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 32
    Top = 24
  end
  object SelectRaise: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_MAN_STAJ_RAISE ')
    Left = 200
    Top = 40
    poSQLINT64ToBCD = True
  end
  object DelStajRaise: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'execute procedure '
      'ASUP_MAN_STAJ_RAISE_DEL (:id_config);')
    Transaction = DefaultTransaction
    Left = 120
    Top = 96
  end
  object SelectCatRaise: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_STAJ_BONUS_CAT_RAI_SELECT ')
    Left = 208
    Top = 96
    poSQLINT64ToBCD = True
  end
  object StajDataSet: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'select * from ini_staj')
    Left = 31
    Top = 143
    poSQLINT64ToBCD = True
  end
  object StajDataSource: TDataSource
    DataSet = StajDataSet
    Left = 136
    Top = 160
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 298
    Top = 96
  end
  object CatDataSet: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT * FROM SP_CATEGORY')
    Left = 33
    Top = 216
    poSQLINT64ToBCD = True
  end
  object CatDataSource: TDataSource
    DataSet = CatDataSet
    Left = 112
    Top = 216
  end
  object PostDataSet: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'select * from UP_STAJ_RAISE_CONFIG_SELECT(:id_config)')
    DataSource = DataSource1
    Left = 223
    Top = 208
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object sp_post: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT DISTINCT * FROM UP_POST_CONFIG_SELECT')
    Left = 289
    Top = 206
    poSQLINT64ToBCD = True
  end
  object PostsDataSource: TDataSource
    DataSet = PostDataSet
    Left = 270
    Top = 273
  end
  object DataSource1: TDataSource
    DataSet = SelectRaise
    Left = 30
    Top = 305
  end
  object DataSource2: TDataSource
    DataSet = SelectCatRaise
    Left = 94
    Top = 307
  end
  object posts_data_source: TDataSource
    DataSet = sp_post
    Left = 231
    Top = 326
  end
  object CatRegSource: TDataSource
    DataSet = CatRegSet
    Left = 432
    Top = 136
  end
  object PostRegSource: TDataSource
    DataSet = PostRegSet
    Left = 440
    Top = 192
  end
  object CatRegSet: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT * FROM UP_ST_ZV_RAISE')
    Left = 440
    Top = 240
    poSQLINT64ToBCD = True
  end
  object PostRegSet: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'select * from UP_STAJ_ST_ZV_CONFIG_SELECT(:ID_CONFIG_ST_ZV)')
    Left = 440
    Top = 296
    poSQLINT64ToBCD = True
  end
end
