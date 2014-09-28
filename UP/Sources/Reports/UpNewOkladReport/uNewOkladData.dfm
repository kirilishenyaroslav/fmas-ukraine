object NewOkladsData: TNewOkladsData
  OldCreateOrder = False
  Left = 368
  Top = 183
  Height = 178
  Width = 295
  object Database: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 32
    Top = 88
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 136
    Top = 88
  end
  object ReportDS: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SElECT * FROM UP_NEW_OKLAD_REPORT(:Id_Order)')
    Left = 136
    Top = 8
    poSQLINT64ToBCD = True
  end
  object FactShtatDataset: TfrxDBDataset
    UserName = 'FactShtatDataset'
    CloseDataSource = False
    OpenDataSource = False
    DataSet = ReportDS
    Left = 216
    Top = 8
  end
  object Report: TfrxReport
    Version = '3.15'
    DataSet = FactShtatDataset
    DataSetName = 'FactShtatDataset'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38901.781220150460000000
    ReportOptions.LastChange = 38901.806801203710000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    Left = 216
    Top = 88
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
