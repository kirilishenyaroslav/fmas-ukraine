object frmMainReportsView: TfrmMainReportsView
  Left = 642
  Top = 329
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  ClientHeight = 102
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 344
    Height = 102
    Align = alClient
    TabOrder = 0
    Visible = False
    object Animate1: TAnimate
      Left = 9
      Top = 16
      Width = 96
      Height = 60
      CommonAVI = aviDeleteFile
      StopFrame = 24
    end
    object cxLabel1: TcxLabel
      Left = 112
      Top = 40
      Width = 202
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #1046#1076#1080#1090#1077'. '#1048#1076#1077#1090' '#1086#1073#1088#1072#1073#1086#1090#1082#1072' '#1076#1072#1085#1085#1099#1093'!'
    end
  end
  object pFIBDataSetPrintMaster: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    Left = 144
    Top = 8
    poSQLINT64ToBCD = True
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=sysdba')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Top = 32
  end
  object RxMemoryData: TRxMemoryData
    Active = True
    FieldDefs = <>
    Left = 248
    Top = 8
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38516.665087581000000000
    ReportOptions.LastChange = 41236.605773298610000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  flagnewPage:Double;'
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if MemoName_Fak.Visible = true then'
      '  begin'
      
        '    if (flagnewPage<><frxDBDatasetDetails."ID_FAK">) and (flagne' +
        'wPage<>0)then'
      '      begin'
      '        Engine.NewPage();'
      '      end;'
      '    flagnewPage := <frxDBDatasetDetails."ID_FAK">;'
      '  end;'
      'end;'
      '   if <Page#>=1 then PageHeader1.visible:=false'
      '  else PageHeader1.visible:=true;'
      'end;'
      'begin'
      '  flagnewPage:=0;'
      ''
      'end.')
    StoreInDFM = False
    Left = 176
    Top = 72
    Datasets = <
      item
        DataSet = frxDBDatasetDetails
        DataSetName = 'frxDBDatasetDetails'
      end
      item
        DataSet = frxDBDatasetMaster
        DataSetName = 'frxDBDatasetMaster'
      end>
    Variables = <
      item
        Name = 'BUILDS'
        Value = #39#1054#1073#1097#1077#1078#1080#1090#1080#1077#39
      end
      item
        Name = 'FAK'
        Value = #39#1060#1072#1082#1091#1083#1100#1090#1077#1090#39
      end
      item
        Name = 'KURS'
        Value = #39#1050#1091#1088#1089#39
      end
      item
        Name = 'CATPAY'
        Value = #39#1050#1072#1090#1077#1075#1086#1088#1103' '#1086#1087#1083#1072#1090#1099#39
      end
      item
        Name = 'TYPELIVE'
        Value = #39#1058#1080#1087' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103#39
      end
      item
        Name = 'CLASSLIVE'
        Value = #39#1050#1083#1072#1089#1089' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103#39
      end
      item
        Name = 'NAMEREPORT'
        Value = #39#1056#1077#1077#1089#1090#1088' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1087#1088#1086#1078#1080#1074#1072#1102#1097#1080#1093#39
      end
      item
        Name = 'DATEROJ'
        Value = #39#1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103#39
      end
      item
        Name = 'BEGPROPI'
        Value = #39#1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1087#1088#1086#1087#1080#1089#1082#1080#39
      end
      item
        Name = 'ENDPROPI'
        Value = #39#1044#1072#1090#1072' '#1082#1086#1085#1094#1072' '#1087#1088#1086#1087#1080#1089#1082#1080#39
      end
      item
        Name = 'ROOM'
        Value = #39#1050#1086#1084#1085#1072#1090#1072#39
      end
      item
        Name = 'FIO'
        Value = #39#1060'.'#1048'.'#1054'.'#39
      end
      item
        Name = 'NN'
        Value = #39#8470' '#1087'/'#1087#39
      end
      item
        Name = 'VNAMEREPORT'
        Value = #39#1056#1077#1077#1089#1090#1088' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1087#1088#1086#1078#1080#1074#1072#1102#1097#1080#1093#39
      end
      item
        Name = 'VPAGE'
        Value = #39#1057#1090#1088#39
      end
      item
        Name = 'DATERUN'
        Value = #39'01.06.2006'#39
      end>
    Style = <>
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 144
    Top = 72
  end
  object pFIBDataSetPrintDetail: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    DataSource = DataSourceMaster
    Left = 144
    Top = 40
    poSQLINT64ToBCD = True
  end
  object DataSourceMaster: TDataSource
    DataSet = pFIBDataSetPrintMaster
    Left = 112
    Top = 8
  end
  object frxDBDatasetDetails: TfrxDBDataset
    UserName = 'frxDBDatasetDetails'
    CloseDataSource = False
    DataSet = pFIBDataSetPrintDetail
    Left = 176
    Top = 40
  end
  object frxDBDatasetMaster: TfrxDBDataset
    UserName = 'frxDBDatasetMaster'
    CloseDataSource = False
    DataSet = pFIBDataSetPrintMaster
    Left = 176
    Top = 8
  end
  object pFIBStoredProcSaveRX: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 32
    Top = 32
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 32
  end
  object pFIBDataSetPrintMasterRX: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    Left = 312
    Top = 8
    poSQLINT64ToBCD = True
  end
  object frxDBDatasetMasterRX: TfrxDBDataset
    UserName = 'frxDBDatasetMasterRX'
    CloseDataSource = False
    DataSet = pFIBDataSetPrintMasterRX
    Left = 280
    Top = 8
  end
  object TimerReports: TTimer
    Enabled = False
    OnTimer = TimerReportsTimer
    Left = 208
    Top = 72
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Top = 64
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 32
    Top = 64
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    ShowProgress = True
    Left = 240
    Top = 40
  end
  object frxXLSExport2: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 272
    Top = 40
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 240
    Top = 72
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
    Left = 272
    Top = 72
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    Left = 304
    Top = 56
  end
end
