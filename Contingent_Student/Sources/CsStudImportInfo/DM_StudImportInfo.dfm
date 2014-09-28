object DM: TDM
  OldCreateOrder = False
  Left = 500
  Top = 299
  Height = 283
  Width = 367
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 112
    Top = 8
  end
  object DSource_EdboStud: TDataSource
    Left = 40
    Top = 120
  end
  object RxMemoryDataPeople: TRxMemoryData
    FieldDefs = <>
    Left = 192
    Top = 64
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
    Left = 256
    Top = 8
  end
  object RxMem_EdboStud: TRxMemoryData
    FieldDefs = <>
    Left = 40
    Top = 64
    object RxMem_EdboStudId_PersonEducation: TIntegerField
      FieldName = 'Id_PersonEducation'
    end
    object RxMem_EdboStudId_PersonEducationForm: TIntegerField
      FieldName = 'Id_PersonEducationForm'
    end
    object RxMem_EdboStudPersonEducationFormName: TStringField
      FieldName = 'PersonEducationFormName'
      Size = 100
    end
    object RxMem_EdboStudPersonEducationDateBegin: TDateField
      FieldName = 'PersonEducationDateBegin'
    end
    object RxMem_EdboStudPersonEducationDateEnd: TDateField
      FieldName = 'PersonEducationDateEnd'
    end
    object RxMem_EdboStudUniversityFacultetKode: TStringField
      FieldName = 'UniversityFacultetKode'
      Size = 100
    end
    object RxMem_EdboStudUniversityFacultetFullName: TStringField
      FieldName = 'UniversityFacultetFullName'
      Size = 250
    end
    object RxMem_EdboStudQualificationName: TStringField
      FieldName = 'QualificationName'
      Size = 100
    end
    object RxMem_EdboStudPersonCodeU: TStringField
      FieldName = 'PersonCodeU'
      Size = 100
    end
    object RxMem_EdboStudFIO: TStringField
      FieldName = 'FIO'
      Size = 250
    end
    object RxMem_EdboStudCourseName: TStringField
      FieldName = 'CourseName'
    end
    object RxMem_EdboStudId_PersonEducationHistoryOrders: TIntegerField
      FieldName = 'Id_PersonEducationHistoryOrders'
    end
    object RxMem_EdboStudPersonEducationHistoryOrdersNum: TStringField
      FieldName = 'PersonEducationHistoryOrdersNum'
      Size = 50
    end
    object RxMem_EdboStudPersonEducationHistoryOrdDate: TDateField
      FieldName = 'PersonEducationHistoryOrdDate'
    end
    object RxMem_EdboStudUniversityGroupFullName: TStringField
      FieldName = 'UniversityGroupFullName'
      Size = 250
    end
    object RxMem_EdboStudSpecSpecialityName: TStringField
      FieldName = 'SpecSpecialityName'
      Size = 250
    end
    object RxMem_EdboStudId_PersonEducationPaymentType: TIntegerField
      FieldName = 'Id_PersonEducationPaymentType'
    end
    object RxMem_EdboStudId_Course: TIntegerField
      FieldName = 'Id_Course'
    end
    object RxMem_EdboStudId_Qualification: TIntegerField
      FieldName = 'Id_Qualification'
    end
    object RxMem_EdboStudSpecCode: TStringField
      FieldName = 'SpecCode'
      Size = 100
    end
    object RxMem_EdboStudIsSecondHigher: TIntegerField
      FieldName = 'IsSecondHigher'
    end
    object RxMem_EdboStudId_UniversityGroup: TIntegerField
      FieldName = 'Id_UniversityGroup'
    end
    object RxMem_EdboStudId_PersonEducationHistoryType: TIntegerField
      FieldName = 'Id_PersonEducationHistoryType'
    end
    object RxMem_EdboStudIs_SyncWithDB: TBooleanField
      FieldName = 'Is_SyncWithDB'
    end
    object RxMem_EdboStudFirstname: TStringField
      FieldName = 'Firstname'
      Size = 50
    end
    object RxMem_EdboStudLastName: TStringField
      FieldName = 'LastName'
      Size = 50
    end
    object RxMem_EdboStudMiddleName: TStringField
      FieldName = 'MiddleName'
      Size = 50
    end
    object RxMem_EdboStudFPasportNumber: TStringField
      FieldName = 'PasportNumber'
      Size = 10
    end
    object RxMem_EdboStudPasportSeries: TStringField
      FieldName = 'PasportSeries'
      Size = 10
    end
    object RxMem_EdboStudPasportIssued: TStringField
      FieldName = 'PasportIssued'
      Size = 250
    end
    object RxMem_EdboStudId_Person: TIntegerField
      FieldName = 'Id_Person'
    end
    object RxMem_EdboStudPasportDate: TDateTimeField
      FieldName = 'PasportDate'
    end
    object RxMem_EdboStudId_PersonSex: TIntegerField
      FieldName = 'Id_PersonSex'
    end
    object RxMem_EdboStudBirthday: TDateTimeField
      FieldName = 'Birthday'
    end
    object RxMem_EdboStudResident: TIntegerField
      FieldName = 'Resident'
    end
    object RxMem_EdboStudInn: TStringField
      FieldName = 'Inn'
      Size = 10
    end
  end
  object SyncStorProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 112
    Top = 64
  end
  object SyncTrans: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 288
    Top = 72
  end
  object MemoryDataSeasons: TRxMemoryData
    FieldDefs = <>
    Left = 128
    Top = 192
    object MemoryDataSeasonsId_PersonRequestSeasons: TIntegerField
      FieldName = 'Id_PersonRequestSeasons'
    end
    object MemoryDataSeasonsNameSeasons: TStringField
      FieldName = 'NameSeasons'
      Size = 50
    end
  end
  object DataSourceSeason: TDataSource
    DataSet = MemoryDataSeasons
    Left = 40
    Top = 192
  end
end
