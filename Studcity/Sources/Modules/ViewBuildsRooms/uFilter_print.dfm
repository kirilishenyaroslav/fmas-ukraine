object frmFilter_print: TfrmFilter_print
  Left = 1071
  Top = 240
  Width = 335
  Height = 211
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1088#1091#1082#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 16
    Top = 8
    Width = 78
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = #1043#1091#1088#1090#1086#1078#1080#1090#1086#1082
  end
  object cxLabel2: TcxLabel
    Left = 16
    Top = 32
    Width = 56
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Caption = #1050#1110#1084#1085#1072#1090#1072
  end
  object cxCheckBox1: TcxCheckBox
    Left = 16
    Top = 64
    Width = 193
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1087#1086#1088#1086#1078#1085#1110' '#1082#1110#1084#1085#1072#1090#1080
    State = cbsChecked
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object onPrint: TcxCheckBox
    Left = 16
    Top = 88
    Width = 169
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1085#1072' '#1087#1088#1080#1085#1090#1077#1088
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
  end
  object cxCheckBox3: TcxCheckBox
    Left = 16
    Top = 112
    Width = 137
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1080#1073#1088#1072#1090#1080' '#1087#1088#1080#1085#1090#1077#1088
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
  end
  object cxLabel3: TcxLabel
    Left = 216
    Top = 64
    Width = 99
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1082#1086#1087#1110#1081
  end
  object kol_exampl: TcxSpinEdit
    Left = 256
    Top = 80
    Width = 57
    Height = 21
    ParentFont = False
    Properties.MaxValue = 100.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
    Value = 1
  end
  object ComboBox_Builds: TcxComboBox
    Left = 104
    Top = 8
    Width = 209
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.ReadOnly = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
  end
  object TextEdit_Room: TcxTextEdit
    Left = 104
    Top = 32
    Width = 209
    Height = 21
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 8
  end
  object Button_Print: TcxButton
    Left = 56
    Top = 144
    Width = 75
    Height = 25
    Caption = #1044#1088#1091#1082
    TabOrder = 9
    OnClick = Button_PrintClick
  end
  object Button_Cancel: TcxButton
    Left = 208
    Top = 144
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 10
    OnClick = Button_CancelClick
  end
  object DataSet_Filter: TpFIBDataSet
    Database = frmMainFormViewBuildsRooms.Database
    Transaction = frmMainFormViewBuildsRooms.ReadTransaction
    Left = 8
    Top = 144
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
    ReportOptions.CreateDate = 40715.619849895830000000
    ReportOptions.LastChange = 40715.619849895830000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 136
    Top = 144
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 144
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = DataSet_Filter
    Left = 296
    Top = 144
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
    Left = 216
    Top = 112
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 256
    Top = 112
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 288
    Top = 112
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
    Left = 176
    Top = 112
  end
  object ActionList1: TActionList
    Left = 176
    Top = 80
    object Action_Debug: TAction
      Caption = 'Action_Debug'
      OnExecute = Action_DebugExecute
    end
  end
end
