object FZPrintAccList: TFZPrintAccList
  Left = 364
  Top = 261
  Width = 308
  Height = 103
  Caption = 'FZPrintAccList'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbFind]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1047#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
    ReportOptions.CreateDate = 38447.623025902780000000
    ReportOptions.LastChange = 38447.654057152780000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Datasets = <>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  object frxDSetGlobalData: TfrxDBDataset
    UserName = 'frxDSetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 40
  end
  object frxDSetShtatRas: TfrxDBDataset
    UserName = 'frxDSetShtatRas'
    CloseDataSource = False
    DataSet = DSetShtatRas
    Left = 72
  end
  object frxDSetPrivileges: TfrxDBDataset
    UserName = 'frxDSetPrivileges'
    CloseDataSource = False
    DataSet = DSetPrivileges
    Left = 136
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Top = 40
  end
  object DSetPrivileges: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 136
    Top = 40
    poSQLINT64ToBCD = True
  end
  object DSetAccNarList: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 104
    Top = 40
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSetShtatRas: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 72
    Top = 40
    poSQLINT64ToBCD = True
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 40
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 208
    Top = 40
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 208
  end
  object DSetAccUdList: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 168
    Top = 40
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object frxUserDataSet: TfrxUserDataSet
    UserName = 'frxUserDataSet'
    Left = 264
  end
end
