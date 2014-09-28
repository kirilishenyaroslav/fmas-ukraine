object frmReportsPrintOrder: TfrmReportsPrintOrder
  Left = 378
  Top = 427
  Width = 430
  Height = 111
  Caption = #1054#1088#1076#1077#1088' '#1085#1072' '#1087#1086#1089#1077#1083#1077#1085#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 256
    Top = 32
    Width = 75
    Height = 25
    Caption = #1044#1088#1091#1082
    Default = True
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 340
    Top = 32
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 63
    Width = 422
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object pFIBDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 72
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TARollback
    Left = 72
    Top = 48
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TACommit
    Left = 104
    Top = 16
  end
  object frxDBDatasetFio: TfrxDBDataset
    UserName = 'frxDBDatasetFio'
    CloseDataSource = False
    DataSet = pFIBDataSet
    Left = 248
    Top = 16
  end
  object pFIBDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from ST_PRINT_PEOPLE_ORDER(:param_people) ')
    Left = 216
    Top = 16
    poSQLINT64ToBCD = True
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38574.593894120370000000
    ReportOptions.LastChange = 38574.593894120370000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 152
    Top = 48
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 120
    Top = 48
  end
  object ActionList1: TActionList
    Left = 248
    Top = 48
    object Designer: TAction
      Caption = 'Designer'
      ShortCut = 57412
      OnExecute = DesignerExecute
    end
  end
  object pFIBStoredProc: TpFIBStoredProc
    Left = 216
    Top = 48
  end
end
