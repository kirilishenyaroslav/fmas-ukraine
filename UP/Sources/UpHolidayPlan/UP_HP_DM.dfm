object HP_DM: THP_DM
  OldCreateOrder = False
  Left = 514
  Top = 214
  Height = 285
  Width = 684
  object pFIBD_HP: TpFIBDatabase
    DBParams.Strings = (
      'login = sysdba'
      'password = masterkey')
    DefaultTransaction = pFIBT_Read
    DefaultUpdateTransaction = pFIBT_Write
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    SaveDBParams = False
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object pFIBT_Read: TpFIBTransaction
    DefaultDatabase = pFIBD_HP
    TimeoutAction = TARollback
    Left = 88
    Top = 8
  end
  object pFIBT_Write: TpFIBTransaction
    DefaultDatabase = pFIBD_HP
    TimeoutAction = TARollback
    Left = 88
    Top = 56
  end
  object pFIBDS_FIO: TpFIBDataSet
    Database = pFIBD_HP
    Transaction = pFIBT_Read
    UpdateTransaction = pFIBT_Write
    SelectSQL.Strings = (
      'select FIO_TN from GET_MAN_FIO(:id_pcard);')
    Left = 168
    Top = 8
    poSQLINT64ToBCD = True
  end
  object pFIBDS_HP_Full: TpFIBDataSet
    Database = pFIBD_HP
    Transaction = pFIBT_Read
    UpdateTransaction = pFIBT_Write
    SelectSQL.Strings = (
      
        'select * from HL_DT_MAN_HOLIDAY_PLAN_SELECT(:id_pcard,:actdate,:' +
        'only_valid)'
      'ORDER BY Work_End, PLAN_PERIOD_END ASC')
    Left = 168
    Top = 56
    poSQLINT64ToBCD = True
  end
  object pFIBQ_Delete: TpFIBQuery
    Database = pFIBD_HP
    SQL.Strings = (
      'execute procedure HL_DT_MAN_HOLIDAY_PLAN_DEL(:where);')
    Transaction = pFIBT_Write
    Left = 168
    Top = 104
  end
  object pFIBDS_SelectPeople: TpFIBDataSet
    Database = pFIBD_HP
    Transaction = pFIBT_Read
    SelectSQL.Strings = (
      'select * from HL_DT_PEOPLE_TMP_SEL(:id_key);')
    Left = 272
    Top = 56
    poSQLINT64ToBCD = True
  end
  object pFIBQ_DeletePeople: TpFIBQuery
    Database = pFIBD_HP
    SQL.Strings = (
      'execute procedure HL_DT_PEOPLE_TMP_DEL(:id_rec,:id_key);')
    Transaction = pFIBT_Write
    Left = 272
    Top = 104
  end
  object pFIBDS_GetIdSession: TpFIBDataSet
    Database = pFIBD_HP
    Transaction = pFIBT_Write
    SelectSQL.Strings = (
      'select id_session from UP_GET_ID_SESSION;')
    Left = 128
    Top = 152
    poSQLINT64ToBCD = True
  end
  object pFIBDS_GetPeriods: TpFIBDataSet
    Database = pFIBD_HP
    Transaction = pFIBT_Write
    SelectSQL.Strings = (
      
        'select * from HL_DT_HOLIDAY_PERIODS_TMP_SEL(:id_key,:act_year,:i' +
        'd_level);')
    Left = 384
    Top = 56
    poSQLINT64ToBCD = True
  end
  object pFIBQ_AddForBuff: TpFIBQuery
    Database = pFIBD_HP
    SQL.Strings = (
      'execute procedure hl_dt_form_rep_buff_ins(:id_key,:id_mh);')
    Transaction = pFIBT_Write
    Left = 496
    Top = 64
  end
  object pFIBDS_GetActBpl: TpFIBDataSet
    Database = pFIBD_HP
    Transaction = pFIBT_Read
    SelectSQL.Strings = (
      'select * from HL_GET_ACT_BPL(:act_date);')
    Left = 384
    Top = 152
    poSQLINT64ToBCD = True
  end
  object pFIBQ_GeneratePeriods: TpFIBQuery
    Database = pFIBD_HP
    SQL.Strings = (
      
        'execute procedure HL_KER_PERIODS_GENERATE_EXT(:id_key,:act_year,' +
        ':id_level);')
    Transaction = pFIBT_Write
    Left = 384
    Top = 8
  end
  object pFIBDS_AddHoliday: TpFIBDataSet
    Database = pFIBD_HP
    Transaction = pFIBT_Write
    SelectSQL.Strings = (
      'Select ID_MAN_HOLIDAY_PLAN_OUT'
      'From HL_DT_MAN_HOLIDAY_PLAN_GEN('
      '    :Id_Type_Holiday, '
      '    :Id_Holiday_Period,'
      '    :Id_Work_Dog_Moving,'
      '    :Period_Beg,'
      '    :Period_End,'
      '    :Days_Count,'
      '    :Used_Days_Count,'
      '    :Can_Delete,'
      '    :Note,'
      '    :Real_Period_End,'
      '    :Real_Days_Count);')
    Left = 384
    Top = 104
    poSQLINT64ToBCD = True
  end
  object pFIBDS_Movings: TpFIBDataSet
    Database = pFIBD_HP
    Transaction = pFIBT_Read
    UpdateTransaction = pFIBT_Write
    SelectSQL.Strings = (
      'select * UP_GET_MAN_MOVINGS2(:id_pcard);')
    Left = 496
    Top = 112
    poSQLINT64ToBCD = True
  end
  object pFIBDS_UsedEditAvaible: TpFIBDataSet
    Database = pFIBD_HP
    Transaction = pFIBT_Read
    UpdateTransaction = pFIBT_Write
    SelectSQL.Strings = (
      'select HOLIDAY_FACT_EDIT_AVAIBLE from UP_SYS_INI_CONSTS;')
    Left = 48
    Top = 112
    poSQLINT64ToBCD = True
  end
  object pFIB_CAN_ADD: TpFIBDataSet
    Database = pFIBD_HP
    Transaction = pFIBT_Read
    UpdateTransaction = pFIBT_Write
    SelectSQL.Strings = (
      'select distinct r.can_add_hol_prop'
      '    from ASUP_INI_REPORTS r ;')
    Left = 272
    Top = 8
    poSQLINT64ToBCD = True
    object pFIB_CAN_ADDCAN_ADD_HOL_PROP: TFIBSmallIntField
      FieldName = 'CAN_ADD_HOL_PROP'
    end
  end
  object HistDataSet: TpFIBDataSet
    Database = pFIBD_HP
    Transaction = pFIBT_Read
    UpdateTransaction = pFIBT_Write
    Left = 496
    Top = 8
    poSQLINT64ToBCD = True
  end
  object HistDataSource: TDataSource
    DataSet = HistDataSet
    Left = 568
    Top = 8
  end
  object DSetGroupHoliday: TpFIBDataSet
    Database = pFIBD_HP
    Transaction = pFIBT_Read
    UpdateTransaction = pFIBT_Write
    SelectSQL.Strings = (
      
        'SELECT DISTINCT ID_GROUP_HOLIDAY, NAME_GROUP FROM HL_SP_GROUP_HO' +
        'LIDAY')
    Left = 288
    Top = 196
    poSQLINT64ToBCD = True
  end
  object DSGroupHoliday: TDataSource
    DataSet = DSetGroupHoliday
    Left = 216
    Top = 196
  end
  object pFIBDS_Consts: TpFIBDataSet
    Database = pFIBD_HP
    Transaction = pFIBT_Read
    UpdateTransaction = pFIBT_Write
    SelectSQL.Strings = (
      
        'select id_group_annual_holiday, use_group_holiday from up_sys_in' +
        'i_consts')
    Left = 496
    Top = 168
    poSQLINT64ToBCD = True
  end
end
