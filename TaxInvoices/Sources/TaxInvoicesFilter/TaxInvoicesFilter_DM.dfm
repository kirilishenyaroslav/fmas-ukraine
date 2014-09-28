object TaxInvoicesFilterDM: TTaxInvoicesFilterDM
  OldCreateOrder = False
  Left = 803
  Top = 236
  Height = 567
  Width = 400
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 16
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 224
    Top = 16
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 320
    Top = 16
  end
  object UserDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 64
    Top = 80
    poSQLINT64ToBCD = True
  end
  object CustomerDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 80
    poSQLINT64ToBCD = True
  end
  object CustomerVidNaklDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 64
    Top = 144
    poSQLINT64ToBCD = True
  end
  object CustomerOtrNaklDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 64
    Top = 200
    poSQLINT64ToBCD = True
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 41095.069001712960000000
    ReportOptions.LastChange = 41095.069001712960000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 320
    Top = 136
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 320
    Top = 72
  end
  object CustomerVidNaklfrxDBDset: TfrxDBDataset
    UserName = 'CustomerVidNaklfrxDBDset'
    CloseDataSource = False
    DataSet = CustomerVidNaklDSet
    Left = 216
    Top = 136
  end
  object CustomerOtrNaklfrxDBDataset: TfrxDBDataset
    UserName = 'CustomerOtrNaklfrxDBDataset'
    CloseDataSource = False
    DataSet = CustomerOtrNaklDSet
    Left = 216
    Top = 200
  end
  object SubdivisionFilterDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 64
    Top = 256
    poSQLINT64ToBCD = True
  end
  object SubdivisionFilterfrxDBDset: TfrxDBDataset
    UserName = 'SubdivisionFilterfrxDBDset'
    CloseDataSource = False
    DataSet = SubdivisionFilterDSet
    Left = 216
    Top = 256
  end
  object BudgetDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 64
    Top = 304
    poSQLINT64ToBCD = True
  end
  object BudgetfrxDBDset: TfrxDBDataset
    UserName = 'BudgetfrxDBDset'
    CloseDataSource = False
    DataSet = BudgetDSet
    Left = 216
    Top = 304
  end
  object TypeNaklDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 64
    Top = 360
    poSQLINT64ToBCD = True
  end
  object TypeNaklfrxDBDSet: TfrxDBDataset
    UserName = 'TypeNaklfrxDBDSet'
    CloseDataSource = False
    DataSet = TypeNaklDSet
    Left = 216
    Top = 360
  end
  object SubdivisionDSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 64
    Top = 408
    poSQLINT64ToBCD = True
  end
  object SubdivisionDSource: TDataSource
    DataSet = MemoryData
    Left = 216
    Top = 408
  end
  object MemoryData: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ID_SUBDIVISION'
        DataType = ftInteger
      end
      item
        Name = 'NAME_SUBDIVISION'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CHECK'
        DataType = ftInteger
      end>
    Left = 312
    Top = 408
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 320
    Top = 208
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 320
    Top = 264
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 320
    Top = 312
  end
end
