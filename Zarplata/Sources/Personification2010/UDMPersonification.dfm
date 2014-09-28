object DM: TDM
  OldCreateOrder = False
  Left = 969
  Top = 489
  Height = 225
  Width = 311
  object DB: TpFIBDatabase
    DefaultTransaction = TransRead
    DefaultUpdateTransaction = TransRead
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 16
  end
  object PrintDataSet: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    Left = 176
    Top = 16
    poSQLINT64ToBCD = True
  end
  object TransRead: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 16
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40694.654867152780000000
    ReportOptions.LastChange = 40694.654867152780000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 16
    Top = 64
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object DBDataset: TfrxDBDataset
    UserName = 'DBDataset'
    CloseDataSource = False
    DataSet = PrintDataSet
    Left = 176
    Top = 72
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 96
    Top = 64
  end
  object DSetConst: TpFIBDataSet
    Database = DB
    Transaction = TransRead
    Left = 24
    Top = 120
    poSQLINT64ToBCD = True
  end
end
