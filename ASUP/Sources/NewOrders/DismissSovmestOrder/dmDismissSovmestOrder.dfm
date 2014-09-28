object DM: TDM
  OldCreateOrder = False
  Left = 447
  Top = 208
  Height = 314
  Width = 323
  object LocalWriteTransaction: TpFIBTransaction
    DefaultDatabase = LocalDatabase
    TimeoutAction = TARollback
    Left = 147
    Top = 8
  end
  object LocalReadTransaction: TpFIBTransaction
    DefaultDatabase = LocalDatabase
    TimeoutAction = TARollback
    Left = 35
    Top = 64
  end
  object LocalDatabase: TpFIBDatabase
    DBName = 'server1212:/data2/FMAS-Klug/DonNU/FULL_DB.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = LocalReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 35
    Top = 8
  end
  object ResultDataSource: TDataSource
    DataSet = RxMD_Dismissed
    Left = 240
    Top = 64
  end
  object SelectDismissedInfo: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM ASUP_ORDER_HOL_SOVM_COMP_SEL(:id_order) order by P' +
        'ARENT_DEPARTMENT, name_dep, FIO;')
    AfterOpen = SelectDismissedInfoAfterOpen
    Left = 152
    Top = 112
    poSQLINT64ToBCD = True
    object SelectDismissedInfoTN: TFIBIntegerField
      FieldName = 'TN'
    end
    object SelectDismissedInfoFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 200
      EmptyStrToNull = True
    end
    object SelectDismissedInfoID_MAN: TFIBIntegerField
      FieldName = 'ID_MAN'
    end
    object SelectDismissedInfoID_DEPARTMENT: TFIBIntegerField
      FieldName = 'ID_DEPARTMENT'
    end
    object SelectDismissedInfoNAME_DEP: TFIBStringField
      FieldName = 'NAME_DEP'
      Size = 200
      EmptyStrToNull = True
    end
    object SelectDismissedInfoID_POST: TFIBIntegerField
      FieldName = 'ID_POST'
    end
    object SelectDismissedInfoNAME_POST: TFIBStringField
      FieldName = 'NAME_POST'
      Size = 200
      EmptyStrToNull = True
    end
    object SelectDismissedInfoPERIOD: TFIBStringField
      FieldName = 'PERIOD'
      Size = 200
      EmptyStrToNull = True
    end
    object SelectDismissedInfoDAY_COUNT: TFIBIntegerField
      FieldName = 'DAY_COUNT'
    end
    object SelectDismissedInfoID_MAN_MOVING: TFIBIntegerField
      FieldName = 'ID_MAN_MOVING'
    end
    object SelectDismissedInfoID_MAN_DISMISSION: TFIBIntegerField
      FieldName = 'ID_MAN_DISMISSION'
    end
    object SelectDismissedInfoINTRO: TFIBStringField
      FieldName = 'INTRO'
      Size = 4096
      EmptyStrToNull = True
    end
    object SelectDismissedInfoPARENT_DEPARTMENT: TFIBStringField
      FieldName = 'PARENT_DEPARTMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object SelectDismissedInfoCITY: TFIBStringField
      FieldName = 'CITY'
      Size = 255
      EmptyStrToNull = True
    end
    object SelectDismissedInfoFIRM_NAME: TFIBStringField
      FieldName = 'FIRM_NAME'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object RxMD_Dismissed: TRxMemoryData
    FieldDefs = <
      item
        Name = 'TN'
        DataType = ftInteger
      end
      item
        Name = 'FIO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ID_man'
        DataType = ftInteger
      end
      item
        Name = 'ID_Department'
        DataType = ftInteger
      end
      item
        Name = 'Name_dep'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ID_post'
        DataType = ftInteger
      end
      item
        Name = 'Name_post'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'period'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'day_count'
        DataType = ftInteger
      end
      item
        Name = 'id_man_moving'
        DataType = ftInteger
      end
      item
        Name = 'id_man_dismission'
        DataType = ftInteger
      end>
    BeforeEdit = RxMD_DismissedBeforeEdit
    AfterScroll = RxMD_DismissedAfterScroll
    Left = 152
    Top = 160
    object RxMD_DismissedTN: TIntegerField
      FieldName = 'TN'
    end
    object RxMD_DismissedFIO: TStringField
      DisplayLabel = #1055'.'#1030'.'#1055'/'#1073'.'
      FieldName = 'FIO'
      Size = 200
    end
    object RxMD_DismissedID_man: TIntegerField
      FieldName = 'ID_man'
    end
    object RxMD_DismissedID_Department: TIntegerField
      FieldName = 'ID_Department'
    end
    object RxMD_DismissedName_dep: TStringField
      DisplayLabel = #1055#1110#1076#1088#1086#1079#1076#1110#1083
      FieldName = 'Name_dep'
      Size = 200
    end
    object RxMD_DismissedID_post: TIntegerField
      FieldName = 'ID_post'
    end
    object RxMD_DismissedName_post: TStringField
      DisplayLabel = #1055#1086#1089#1072#1076#1072
      FieldName = 'Name_post'
      Size = 200
    end
    object RxMD_Dismissedperiod: TStringField
      DisplayLabel = #1055#1077#1088#1110#1086#1076
      FieldName = 'period'
      Size = 200
    end
    object RxMD_Dismissedday_count: TIntegerField
      DisplayLabel = #1044#1085#1110
      FieldName = 'day_count'
    end
    object RxMD_Dismissedid_man_moving: TIntegerField
      FieldName = 'id_man_moving'
    end
    object RxMD_Dismissedid_man_dismission: TIntegerField
      FieldName = 'id_man_dismission'
    end
  end
  object pFIBQ_Dismiss: TpFIBQuery
    Database = LocalDatabase
    SQL.Strings = (
      'execute procedure ASUP_ORDER_HOL_SOVM_COMP(:act_date,:id_order);')
    Transaction = LocalWriteTransaction
    Left = 152
    Top = 56
  end
  object WorkQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalWriteTransaction
    Left = 40
    Top = 120
    poSQLINT64ToBCD = True
  end
  object pFIBQ_Edit: TpFIBQuery
    Database = LocalDatabase
    SQL.Strings = (
      
        'execute procedure ASUP_ORDER_HOL_SOVM_COMP_EDIT(:ID_MAN_DISMISSI' +
        'ON,:NOTUSED);')
    Transaction = LocalWriteTransaction
    Left = 152
    Top = 208
  end
end
