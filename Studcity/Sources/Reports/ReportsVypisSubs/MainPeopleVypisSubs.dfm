object PeopleVypisSub: TPeopleVypisSub
  Left = 361
  Top = 387
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'PeopleVypisSub'
  ClientHeight = 105
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 86
    Width = 353
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 345
    Height = 41
    TabOrder = 1
    object cxLabelPriod: TcxLabel
      Left = 6
      Top = 13
      Width = 183
      Height = 17
      TabOrder = 0
      Caption = 'cxLabelPriod                                      '
    end
    object cxDateEditPeriod: TDateTimePicker
      Left = 224
      Top = 13
      Width = 114
      Height = 21
      Date = 38813.559506273150000000
      Time = 38813.559506273150000000
      Color = 16776176
      TabOrder = 1
    end
  end
  object cxButtonOK: TcxButton
    Left = 184
    Top = 48
    Width = 75
    Height = 25
    Caption = 'cxButtonOK'
    Default = True
    TabOrder = 2
    OnClick = cxButtonOKClick
  end
  object cxButtonClose: TcxButton
    Left = 264
    Top = 48
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'cxButtonClose'
    TabOrder = 3
    OnClick = cxButtonCloseClick
  end
  object pFIBDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ST_REPORT_VYPIS_SUBS(:param_beg_check)')
    Left = 80
    Top = 44
    poSQLINT64ToBCD = True
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 43
    Top = 44
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 8
    Top = 42
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 10
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 40
    Top = 10
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 120
    Top = 48
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
    ReportOptions.LastChange = 38811.426726979170000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   if <Page#>=1 then PageHeader1.visible:=false'
      '  else PageHeader1.visible:=true;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 152
    Top = 48
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
      end
      item
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
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 30.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 20.000000000000000000
      BottomMargin = 20.000000000000000000
    end
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    DataSet = pFIBDataSet
    Left = 152
    Top = 16
  end
  object ActionList1: TActionList
    Left = 120
    Top = 16
    object ActionDesigned: TAction
      Caption = 'ActionDesigned'
      ShortCut = 57412
      OnExecute = ActionDesignedExecute
    end
  end
end
