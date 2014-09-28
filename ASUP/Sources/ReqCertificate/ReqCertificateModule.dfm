object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 425
  Top = 260
  Height = 217
  Width = 299
  object frxReqCertificate: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39849.477684270830000000
    ReportOptions.LastChange = 39849.477684270830000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 40
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDesigner: TfrxDesigner
    Restrictions = []
    Left = 40
    Top = 80
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    Left = 112
    Top = 16
  end
end
