object frmMainReportsMail: TfrmMainReportsMail
  Left = 526
  Top = 200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmMainReportsMail'
  ClientHeight = 211
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 0
    Top = 80
    Width = 321
    Height = 19
    Progress = 0
  end
  object cxGroupBoxPeriodStud: TcxGroupBox
    Left = 0
    Top = 0
    Width = 322
    Height = 45
    Alignment = alTopLeft
    Caption = 'cxGroupBoxPeriodStud'
    TabOrder = 0
    object cxLabelPriodBegin: TcxLabel
      Left = 8
      Top = 17
      Width = 114
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object cxLabelPeriodEnd: TcxLabel
      Left = 157
      Top = 17
      Width = 111
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object cxDateEditPeriodBegin: TcxDateEdit
      Left = 29
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object cxDateEditPeriodEnd: TcxDateEdit
      Left = 181
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  object cxButtonFilter: TcxButton
    Left = 0
    Top = 48
    Width = 320
    Height = 25
    Caption = 'cxButtonFilter'
    TabOrder = 1
    OnClick = cxButtonFilterClick
  end
  object cxButtonRun: TcxButton
    Left = 0
    Top = 102
    Width = 113
    Height = 25
    Caption = 'cxButtonRun'
    TabOrder = 2
    OnClick = cxButtonRunClick
  end
  object cxButtonQuit: TcxButton
    Left = 245
    Top = 102
    Width = 75
    Height = 25
    Caption = 'cxButtonQuit'
    TabOrder = 3
    OnClick = cxButtonQuitClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 192
    Width = 324
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 100
      end>
  end
  object cxRadioGrouptypeRep: TcxRadioGroup
    Left = -1
    Top = 133
    Width = 320
    Height = 32
    ItemIndex = 0
    Properties.Columns = 2
    Properties.Items = <
      item
      end>
    TabOrder = 4
    Caption = ''
  end
  object cxButtonView: TcxButton
    Left = 3
    Top = 165
    Width = 318
    Height = 25
    Caption = 'cxButtonView'
    TabOrder = 5
    OnClick = cxButtonViewClick
  end
  object cxButtonCancel: TcxButton
    Left = 120
    Top = 102
    Width = 81
    Height = 25
    Caption = 'cxButtonCancel'
    TabOrder = 7
    Visible = False
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 205
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 72
    Top = 189
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 72
    Top = 221
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Top = 192
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 104
    Top = 221
  end
  object pFIBDataSetSetup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from cn_ini_print_report')
    Left = 136
    Top = 192
    poSQLINT64ToBCD = True
  end
  object ActionList1: TActionList
    Left = 264
    Top = 208
    object ActionRun: TAction
      Caption = 'ActionRun'
      ShortCut = 121
      OnExecute = ActionRunExecute
    end
    object ActionView: TAction
      Caption = 'ActionView'
      ShortCut = 123
      OnExecute = ActionViewExecute
    end
    object ActionParam: TAction
      Caption = 'ActionParam'
      ShortCut = 118
      OnExecute = ActionParamExecute
    end
    object isDebug_act: TAction
      Caption = 'isDebug_act'
      ShortCut = 57412
      OnExecute = isDebug_actExecute
    end
  end
  object pFIBDataSetInitDate: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select PUB_SYS_DATA.cn_date_start,PUB_SYS_DATA.cn_end_month from' +
        ' PUB_SYS_DATA')
    Left = 104
    Top = 189
    poSQLINT64ToBCD = True
  end
  object DataSetReports: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 208
    Top = 256
    poSQLINT64ToBCD = True
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DataSet = frxDBDataset1
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1047#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
    ReportOptions.CreateDate = 40625.486528495370000000
    ReportOptions.LastChange = 40625.486528495370000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 144
    Top = 256
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 112
    Top = 256
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = DataSetReports
    Left = 176
    Top = 256
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
    Left = 112
    Top = 296
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 152
    Top = 296
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    Left = 192
    Top = 296
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 224
    Top = 296
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
    Left = 256
    Top = 296
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 288
    Top = 296
  end
end
