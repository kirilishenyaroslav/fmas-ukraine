object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 124
  Height = 232
  Width = 247
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40150.618934513890000000
    ReportOptions.LastChange = 40150.618934513890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 96
    Top = 80
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object DBDataset: TfrxDBDataset
    UserName = 'DBDataset'
    CloseDataSource = False
    DataSet = DataSet
    Left = 168
    Top = 80
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 24
    Top = 136
  end
  object DB: TpFIBDatabase
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 24
  end
  object DataSet: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    Left = 96
    Top = 24
    poSQLINT64ToBCD = True
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 24
    Top = 80
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 136
  end
  object DataSet1: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    Left = 168
    Top = 24
    poSQLINT64ToBCD = True
  end
  object DBDataset1: TfrxDBDataset
    UserName = 'DBDataset1'
    CloseDataSource = False
    DataSet = DataSet1
    Left = 96
    Top = 136
  end
end
