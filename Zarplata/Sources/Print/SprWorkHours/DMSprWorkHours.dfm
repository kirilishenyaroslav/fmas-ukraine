object FDMSprWorkHours: TFDMSprWorkHours
  OldCreateOrder = False
  Left = 531
  Top = 251
  Height = 380
  Width = 338
  object pFIBDatabase1: TpFIBDatabase
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 48
    Top = 8
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 48
    Top = 64
  end
  object DSetWorkHours: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    Left = 48
    Top = 120
    poSQLINT64ToBCD = True
  end
  object ReportDSETWorkHours: TfrxDBDataset
    UserName = 'ReportDSETWorkHours'
    CloseDataSource = False
    DataSet = DSetWorkHours
    Left = 48
    Top = 176
  end
  object Report: TfrxReport
    Version = '3.15'
    DataSet = ReportDSETWorkHours
    DataSetName = 'ReportDSETWorkHours'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 41486.624541145840000000
    ReportOptions.LastChange = 41486.624541145840000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 48
    Top = 240
    Datasets = <>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 209.973333333333300000
      PaperHeight = 296.968333333333300000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
end
