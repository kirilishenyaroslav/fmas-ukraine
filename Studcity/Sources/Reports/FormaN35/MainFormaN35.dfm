object frmMainFormaN35: TfrmMainFormaN35
  Left = 443
  Top = 416
  Width = 378
  Height = 110
  Caption = 'frmMainFormaN35'
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
  object cxLabelStatus: TcxLabel
    Left = 5
    Top = 8
    Width = 361
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = 
      'cxLabelStatus                                                   ' +
      '                 '
  end
  object cxButton1: TcxButton
    Left = 200
    Top = 32
    Width = 75
    Height = 25
    Caption = #1054#1050
    Default = True
    TabOrder = 1
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 287
    Top = 32
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 2
    OnClick = cxButton2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 62
    Width = 370
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object cxCheckBoxFamily: TcxCheckBox
    Left = 0
    Top = 32
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1088#1091#1082' '#1076#1083#1103' '#1089#1077#1084#39#1111
    TabOrder = 4
    Visible = False
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
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    DataSet = pFIBDataSet
    Left = 248
    Top = 16
  end
  object pFIBDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from ST_PRINT_FORMAN35(:param_people) ')
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
    OnAfterPrintReport = frxReportAfterPrintReport
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
    Left = 312
    Top = 32
    object ActionDesigned: TAction
      Caption = 'ActionDesigned'
      ShortCut = 57412
      OnExecute = ActionDesignedExecute
    end
  end
  object pFIBDataSetF35: TpFIBDataSet
    Database = pFIBDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from ST_DT_LIST_ROVD_PRINT_FORMA35(:param_id_list)')
    Left = 312
    poSQLINT64ToBCD = True
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = pFIBDataSetF35
    Left = 344
    Top = 32
  end
  object pFIBStoredProc: TpFIBStoredProc
    Left = 216
    Top = 48
  end
end
