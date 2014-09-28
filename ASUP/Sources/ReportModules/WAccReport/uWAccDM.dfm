object dmWAccReport: TdmWAccReport
  OldCreateOrder = False
  Left = 192
  Top = 110
  Height = 252
  Width = 374
  object Database: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 40
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 40
    Top = 96
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 136
    Top = 96
  end
  object ReportDS: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM Asup_Waccount_Report_AGR(:Filter_Department, :Filt' +
        'er_Pcard, :From_Year,'
      ':From_Month, :To_Year, :To_Month)')
    Left = 144
    Top = 8
    poSQLINT64ToBCD = True
  end
  object frxReportData: TfrxDBDataset
    UserName = 'frxReportData'
    CloseDataSource = False
    DataSet = ReportDS
    Left = 224
    Top = 96
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39065.442434016200000000
    ReportOptions.LastChange = 39065.442434016200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 224
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object AsupParamsDS: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Asup_Get_Params')
    Left = 40
    Top = 168
    poSQLINT64ToBCD = True
  end
  object TotalsDS: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM Asup_Waccount_Report_Tot_AGR(:Filter_Department, :' +
        'Filter_Pcard, :From_Year,'
      ':From_Month, :To_Year, :To_Month)'
      '')
    Left = 152
    Top = 168
    poSQLINT64ToBCD = True
  end
  object frxTotalsData: TfrxDBDataset
    UserName = 'frxTotalsData'
    CloseDataSource = False
    DataSet = TotalsDS
    Left = 248
    Top = 168
  end
end
