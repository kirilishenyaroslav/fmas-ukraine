object dmDepartments: TdmDepartments
  OldCreateOrder = False
  Left = 326
  Top = 7
  Height = 366
  Width = 534
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 120
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 216
    Top = 8
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 312
    Top = 8
  end
  object SelectDepartments: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SQLScreenCursor = crSQLWait
    SelectSQL.Strings = (
      
        'SELECT * FROM GET_DEPARTMENTS_WITH_DEL(:Root, :Actual_Date, :Sho' +
        'w_Deleted, :Id_Prop)')
    AfterScroll = SelectDepartmentsAfterScroll
    OnCalcFields = SelectDepartmentsCalcFields
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 32
    Top = 104
    poSQLINT64ToBCD = True
    object SelectDepartmentsID_DEPARTMENT: TFIBIntegerField
      FieldName = 'ID_DEPARTMENT'
    end
    object SelectDepartmentsID_PARENT: TFIBIntegerField
      FieldName = 'ID_PARENT'
    end
    object SelectDepartmentsNAME_SHORT: TFIBStringField
      FieldName = 'NAME_SHORT'
      Size = 50
      EmptyStrToNull = True
    end
    object SelectDepartmentsDISPLAY_ORDER: TFIBIntegerField
      FieldName = 'DISPLAY_ORDER'
    end
    object SelectDepartmentsDISPLAY_ORDER2: TFIBIntegerField
      FieldName = 'DISPLAY_ORDER2'
    end
    object SelectDepartmentsNAME_FULL: TFIBStringField
      FieldName = 'NAME_FULL'
      Size = 255
      EmptyStrToNull = True
    end
    object SelectDepartmentsPATH: TFIBStringField
      FieldName = 'PATH'
      Size = 50
      EmptyStrToNull = True
    end
    object SelectDepartmentsDEPARTMENT_CODE: TFIBStringField
      FieldName = 'DEPARTMENT_CODE'
      Size = 10
      EmptyStrToNull = True
    end
    object SelectDepartmentsDISPLAY_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'DISPLAY_NAME'
      Size = 255
      Calculated = True
    end
    object SelectDepartmentsIs_Deleted: TIntegerField
      FieldName = 'Is_Deleted'
      Visible = False
    end
    object SelectDepartmentsUse_End: TDateTimeField
      FieldName = 'Use_End'
    end
  end
  object MoveQuery: TpFIBQuery
    Database = Database
    SQL.Strings = (
      'EXECUTE PROCEDURE Sp_Department_Move :Id_Department, :Direction,'
      ':Kind')
    Transaction = WriteTransaction
    Left = 120
    Top = 104
  end
  object GetRoot: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT Current_Department FROM Ini_Asup_Consts')
    Left = 216
    Top = 104
    poSQLINT64ToBCD = True
  end
  object DepTypesSelect: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Sp_Dep_Type')
    Left = 312
    Top = 104
    poSQLINT64ToBCD = True
    object DepTypesSelectID_DEP_TYPE: TFIBIntegerField
      FieldName = 'ID_DEP_TYPE'
      Visible = False
    end
    object DepTypesSelectNAME_DEP_TYPE: TFIBStringField
      DisplayLabel = #1058#1080#1087' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1091
      FieldName = 'NAME_DEP_TYPE'
      EmptyStrToNull = True
    end
  end
  object DepartmentsReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40015.506412754600000000
    ReportOptions.LastChange = 40695.561853252300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo2OnBeforePrint(Sender: TfrxComponent);'
      'var'
      'f :boolean;'
      'begin'
      '       Memo2.Left := <ReportDBSet."OUT_LEVEL">*20-20;'
      
        '       Memo2.Width := Memo2.Width-<ReportDBSet."OUT_LEVEL">*20+2' +
        '0;'
      '       f:=true;'
      ''
      '       if <ReportDBSet."OUT_LEVEL">=1 then'
      '       begin'
      '               f:=false;'
      '               Memo2.color:=$00CCCCCC;'
      '               Memo2.Font.Size:=12;'
      '               Memo2.Font.Style:=1;'
      '       end;'
      '       Line2.Visible := f;'
      '       if <ReportDBSet."OUT_LEVEL">=2 then'
      '       begin'
      '               f:=false;'
      '               Memo2.color:=$00DDDDDD;'
      '               Memo2.Font.Size:=12;'
      '               Memo2.Font.Style:=3;'
      '       end;'
      '       Line3.Visible := f;'
      '       if <ReportDBSet."OUT_LEVEL">=3 then'
      '       begin'
      '               f:=false;'
      '               Memo2.color:=$00FFFFFF;'
      '               Memo2.Font.Size:=10;'
      '               Memo2.Font.Style:=0;'
      '       end;'
      '       Line4.Visible := f;'
      '       if <ReportDBSet."OUT_LEVEL">=4 then'
      '       begin'
      '               f:=false;'
      '               Memo2.color:=$00FFFFFF;'
      '               Memo2.Font.Size:=10;'
      '               Memo2.Font.Style:=0;'
      '       end;'
      '       Line5.Visible := f;'
      '       if <ReportDBSet."OUT_LEVEL">=5 then f:=false;'
      '       Line6.Visible := f;'
      '       if <PRINT_ID>='#39'1'#39' then'
      '       begin'
      '               Memo7.Font.Size:=Memo2.Font.Size;'
      '               Memo7.Color:=Memo2.Color;'
      '       end;'
      '       Memo8.Color:=Memo2.Color;'
      '       Memo8.Font.Size:=Memo2.Font.Size;'
      'end;'
      ''
      'procedure DepartmentsReportOnStartReport(Sender: TfrxComponent);'
      'begin'
      '       Memo8.Frame.Typ:=Memo8.Frame.Typ+ftTop;'
      '       Memo8.Frame.Typ:=Memo8.Frame.Typ+ftBottom;'
      '       if <PRINT_ID>='#39'1'#39' then'
      '       begin'
      '               Memo8.left:=Memo2.Width-Memo7.Width;'
      '               Memo2.Width:=Memo2.Width-Memo8.Width;'
      '               Memo8.Width:=Memo8.Width+2;'
      '               Memo2.Memo:=Memo5.Memo;'
      '               Memo7.Visible:=true;'
      '               Memo8.Frame.Typ:=Memo8.Frame.Typ+ftLeft;'
      '              // Memo2.Width:=Memo2.Width-Memo7.Width;'
      '       end'
      '       else'
      '       begin'
      '          Memo2.Width:=Memo2.Width+2;'
      '          Memo8.Frame.Typ:=Memo8.Frame.Typ+ftRight;'
      '       end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnStartReport = 'DepartmentsReportOnStartReport'
    Left = 32
    Top = 184
    Datasets = <
      item
        DataSet = ReportDBSet
        DataSetName = 'ReportDBSet'
      end>
    Variables = <
      item
        Name = ' 1'
        Value = Null
      end
      item
        Name = 'TITLE'
        Value = Null
      end
      item
        Name = 'DEP_DATE'
        Value = Null
      end
      item
        Name = 'PRINT_ID'
        Value = Null
      end>
    Style = <>
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 224
    Top = 184
  end
  object DepartmentsDS: TfrxDBDataset
    UserName = 'DepartmentsDS'
    CloseDataSource = False
    DataSet = SelectDepartments
    Left = 128
    Top = 184
  end
  object DepPropDS: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM PUB_DEP_PROPERTIES_S(:Id_Department)')
    Left = 312
    Top = 184
    poSQLINT64ToBCD = True
    object DepPropDSID_PROPERTY: TFIBIntegerField
      FieldName = 'ID_PROPERTY'
      Visible = False
    end
    object DepPropDSNAME_PROPERTY: TFIBStringField
      DisplayLabel = #1042#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100
      FieldName = 'NAME_PROPERTY'
      Size = 50
      EmptyStrToNull = True
    end
    object DepPropDSDATE_BEG: TFIBDateField
      DisplayLabel = #1044#1110#1108' '#1079
      FieldName = 'DATE_BEG'
    end
    object DepPropDSDATE_END: TFIBDateField
      DisplayLabel = #1044#1110#1108' '#1087#1086
      FieldName = 'DATE_END'
    end
  end
  object DepPropDataSource: TDataSource
    DataSet = DepPropDS
    Left = 416
    Top = 184
  end
  object SpDepProp: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Sp_Dep_Prop ORDER BY Name_Property')
    Left = 400
    Top = 8
    poSQLINT64ToBCD = True
    object SpDepPropID_PROPERTY: TFIBIntegerField
      FieldName = 'ID_PROPERTY'
      Visible = False
    end
    object SpDepPropNAME_PROPERTY: TFIBStringField
      DisplayLabel = #1042#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100
      FieldName = 'NAME_PROPERTY'
      Size = 50
      EmptyStrToNull = True
    end
  end
  object DeleteProp: TpFIBQuery
    Database = Database
    SQL.Strings = (
      
        'EXECUTE PROCEDURE PUB_DEP_PROPERTIES_D :Id_Department, :Id_Prope' +
        'rty, :Date_Beg')
    Transaction = WriteTransaction
    Left = 400
    Top = 104
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 472
    Top = 104
  end
  object RestoreQuery: TpFIBQuery
    Database = Database
    SQL.Strings = (
      'EXECUTE PROCEDURE Pub_Sp_Department_Restore(:Id_Department)')
    Transaction = WriteTransaction
    Left = 32
    Top = 248
  end
  object TeleportDepartment: TpFIBQuery
    Database = Database
    SQL.Strings = (
      
        'EXECUTE PROCEDURE SP_DEPARTMENT_TELEPORT :Id_Department, :Where_' +
        'Department')
    Transaction = WriteTransaction
    Left = 128
    Top = 248
  end
  object PrintProp: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from SP_DEPARTMENT_PRINT(:in_date, :in_id_dep) d')
    Left = 312
    Top = 248
    poSQLINT64ToBCD = True
  end
  object ReportDBSet: TfrxDBDataset
    UserName = 'ReportDBSet'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_OBJECT=ID_OBJECT'
      'OUT_FULL_NAME=OUT_FULL_NAME'
      'OUT_FULL_NAME_ID=OUT_FULL_NAME_ID'
      'OUT_NAME=OUT_NAME'
      'OUT_LEVEL=OUT_LEVEL'
      'OUT_PREFICS=OUT_PREFICS'
      'DEPARTMENT_CODE=DEPARTMENT_CODE')
    DataSet = PrintProp
    Left = 224
    Top = 256
  end
end
