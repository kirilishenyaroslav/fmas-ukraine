object NalogReestrDM: TNalogReestrDM
  OldCreateOrder = False
  Left = 244
  Top = 100
  Height = 324
  Width = 434
  object MainDatabase: TpFIBDatabase
    DBName = 'localhost:DneprActual'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object Styles: TcxStyleRepository
    Left = 160
    Top = 8
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10382168
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13249860
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
  end
  object ReestrDataSet: TpFIBDataSet
    Database = MainDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    zl.ID_REESTR,'
      '    DATE_REG,'
      '    YEAR_SET,'
      '    count(znr.id_reestr)'
      'FROM Z_NALOG_FORMA_REESTRS_LIST zl,z_nalog_reestr znr'
      'where  znr.id_reestr=zl.id_reestr'
      'group by znr.id_reestr, zl.id_reestr,DATE_REG,YEAR_SET')
    Left = 24
    Top = 72
    poSQLINT64ToBCD = True
    object ReestrDataSetID_REESTR: TFIBIntegerField
      FieldName = 'ID_REESTR'
    end
    object ReestrDataSetDATE_REG: TFIBDateField
      FieldName = 'DATE_REG'
    end
    object ReestrDataSetYEAR_SET: TFIBIntegerField
      FieldName = 'YEAR_SET'
    end
    object ReestrDataSetCOUNT: TFIBIntegerField
      FieldName = 'COUNT'
    end
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = MainDatabase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 160
    Top = 72
  end
  object DataSource: TDataSource
    DataSet = ReestrDataSet
    Left = 160
    Top = 128
  end
  object PrintDataSet: TpFIBDataSet
    Database = MainDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      #9'Z_NALOG_REESTR.ID_REESTR,'
      #9'Z_NALOG_REESTR.TN,'
      #9'Z_NALOG_REESTR.NAME_DEP,'
      #9'Z_NALOG_REESTR.FIO,'
      #9'Z_NALOG_REESTR.SOV_DOHOD,'
      #9'Z_NALOG_REESTR.TOTAL_UDER,'
      #9'Z_NALOG_REESTR.SOC_PRIV,'
      #9'Z_NALOG_REESTR.UDER,'
      #9'Z_NALOG_REESTR.NAL_DOHOD,'
      #9'Z_NALOG_REESTR.NAL_NEW,'
      #9'Z_NALOG_REESTR.NAL_FACT,'
      #9'Z_NALOG_REESTR.VOZVR,'
      #9'Z_NALOG_REESTR.DOPL,'
      #9'Z_NALOG_REESTR.KOL_MONTH'
      'FROM Z_NALOG_REESTR'
      'WHERE ID_REESTR=?ID_REESTR'
      'ORDER BY NAME_DEP,TN'
      '')
    Left = 24
    Top = 136
    poSQLINT64ToBCD = True
    object PrintDataSetID_REESTR: TFIBIntegerField
      FieldName = 'ID_REESTR'
    end
    object PrintDataSetTN: TFIBIntegerField
      FieldName = 'TN'
    end
    object PrintDataSetNAME_DEP: TFIBStringField
      FieldName = 'NAME_DEP'
      Size = 255
      EmptyStrToNull = True
    end
    object PrintDataSetFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 60
      EmptyStrToNull = True
    end
    object PrintDataSetSOV_DOHOD: TFIBBCDField
      FieldName = 'SOV_DOHOD'
      Size = 2
      RoundByScale = True
    end
    object PrintDataSetTOTAL_UDER: TFIBBCDField
      FieldName = 'TOTAL_UDER'
      Size = 2
      RoundByScale = True
    end
    object PrintDataSetSOC_PRIV: TFIBBCDField
      FieldName = 'SOC_PRIV'
      Size = 2
      RoundByScale = True
    end
    object PrintDataSetUDER: TFIBBCDField
      FieldName = 'UDER'
      Size = 2
      RoundByScale = True
    end
    object PrintDataSetNAL_DOHOD: TFIBBCDField
      FieldName = 'NAL_DOHOD'
      Size = 2
      RoundByScale = True
    end
    object PrintDataSetNAL_NEW: TFIBBCDField
      FieldName = 'NAL_NEW'
      Size = 2
      RoundByScale = True
    end
    object PrintDataSetNAL_FACT: TFIBBCDField
      FieldName = 'NAL_FACT'
      Size = 2
      RoundByScale = True
    end
    object PrintDataSetVOZVR: TFIBBCDField
      FieldName = 'VOZVR'
      Size = 2
      RoundByScale = True
    end
    object PrintDataSetDOPL: TFIBBCDField
      FieldName = 'DOPL'
      Size = 2
      RoundByScale = True
    end
    object PrintDataSetKOL_MONTH: TFIBIntegerField
      FieldName = 'KOL_MONTH'
    end
  end
  object PrintDataSource: TDataSource
    DataSet = PrintDataSet
    Left = 160
    Top = 192
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = MainDatabase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 264
    Top = 72
  end
  object FillCurrentProc: TpFIBStoredProc
    Database = MainDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE Z_COPY_NALOG_REESTR_TO_CURRENT (?ID_REESTR)')
    Transaction = WriteTransaction
    StoredProcName = 'Z_COPY_NALOG_REESTR_TO_CURRENT'
    Left = 264
    Top = 144
  end
  object DeleteReestrSP: TpFIBStoredProc
    Database = MainDatabase
    SQL.Strings = (
      
        'EXECUTE PROCEDURE Z_DELETE_NALOG_REESTR (?ID_REESTR, ?DELETE_CUR' +
        'RENT)')
    Transaction = WriteTransaction
    StoredProcName = 'Z_DELETE_NALOG_REESTR'
    Left = 32
    Top = 192
  end
end
