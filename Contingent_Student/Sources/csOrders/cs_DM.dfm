object DM: TDM
  OldCreateOrder = False
  Left = 340
  Top = 197
  Height = 347
  Width = 680
  object RxMem_EdboOrders: TRxMemoryData
    FieldDefs = <>
    Left = 88
    Top = 56
    object RxMem_EdboOrdersId_PersonEducationHistoryOrders: TIntegerField
      FieldName = 'Id_PersonEducationHistoryOrders'
    end
    object RxMem_EdboOrdersEducationHistoryOrdersNumber: TStringField
      FieldName = 'OrdersNumber'
    end
    object RxMem_EdboOrdersEducationHistoryOrdersDate: TDateTimeField
      FieldName = 'OrdersDate'
    end
    object RxMem_EdboOrdersOrdersDateLastChange: TDateTimeField
      FieldName = 'OrdersDateLastChange'
    end
    object RxMem_EdboOrdersId_HistoryType: TIntegerField
      DisplayWidth = 100
      FieldName = 'Id_HistoryType'
    end
    object RxMem_EdboOrdersTypeName: TStringField
      DisplayWidth = 70
      FieldName = 'TypeName'
      Size = 70
    end
    object RxMem_EdboOrdersTypeDescription: TStringField
      FieldName = 'TypeDescription'
    end
    object RxMem_EdboOrdersId_OrderStatus: TIntegerField
      FieldName = 'Id_OrderStatus'
    end
    object RxMem_EdboOrdersOrderStatusName: TStringField
      FieldName = 'OrderStatusName'
    end
    object RxMem_EdboOrdersIsVerified: TIntegerField
      FieldName = 'IsVerified'
    end
    object RxMem_EdboOrdersId_VerificationHistoryType: TIntegerField
      FieldName = 'Id_VerificationHistoryType'
    end
    object RxMem_EdboOrdersStudCount: TIntegerField
      FieldName = 'StudCount'
    end
    object RxMem_EdboOrdersVerificationHistoryTypeName: TStringField
      FieldName = 'VerificationHistoryTypeName'
    end
    object RxMem_EdboOrdersIs_SyncWithDB: TBooleanField
      FieldName = 'Is_SyncWithDB'
    end
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 88
    Top = 8
  end
  object DSource_EdboOrders: TDataSource
    Left = 88
    Top = 112
  end
  object RxMemoryDataPeople: TRxMemoryData
    FieldDefs = <>
    Left = 192
    Top = 56
  end
  object StorProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 192
    Top = 8
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 192
    Top = 112
  end
  object SyncStorProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 272
    Top = 8
  end
  object ImageSyncDb: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 168
  end
  object ImageSyncWTrans: TpFIBTransaction
    DefaultDatabase = ImageSyncDb
    TimeoutAction = TARollback
    Left = 40
    Top = 216
  end
  object ImageSyncProc: TpFIBStoredProc
    Database = ImageSyncDb
    Transaction = ImageSyncWTrans
    Left = 88
    Top = 176
  end
  object SyncTrans: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 280
    Top = 112
  end
end
