object frmVer_dog: TfrmVer_dog
  Left = 602
  Top = 382
  Width = 318
  Height = 215
  Caption = #1055#1077#1088#1077#1074#1110#1088#1082#1072' '#1082#1086#1088#1077#1082#1090#1085#1086#1089#1090#1110' '#1079#1072#1087#1086#1074#1085#1077#1085#1085#1103' '#1076#1086#1075#1086#1074#1086#1088#1091
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
  object Label1: TLabel
    Left = 187
    Top = 32
    Width = 3
    Height = 13
  end
  object Button_ok: TcxButton
    Left = 40
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Button_ok'
    TabOrder = 0
    OnClick = Button_okClick
  end
  object Button_cancel: TcxButton
    Left = 200
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Button_cancel'
    TabOrder = 1
    OnClick = Button_cancelClick
  end
  object Date_edit_Date_beg: TcxDateEdit
    Left = 24
    Top = 56
    Width = 121
    Height = 24
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 2
    EditValue = 0d
  end
  object Date_edit_Date_end: TcxDateEdit
    Left = 176
    Top = 56
    Width = 121
    Height = 24
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 3
    EditValue = 0d
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 32
    Width = 146
    Height = 20
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 4
    Caption = #1055#1086#1095#1072#1090#1086#1082' '#1076#1110#1111' '#1076#1086#1075#1086#1074#1086#1088#1091
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 56
    Width = 16
    Height = 20
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 5
    Caption = #1079
  end
  object cxLabel3: TcxLabel
    Left = 152
    Top = 58
    Width = 24
    Height = 20
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 6
    Caption = #1076#1086
  end
  object CheckBox_form: TcxCheckBox
    Left = 24
    Top = 88
    Width = 273
    Height = 24
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1085#1072' '#1092#1086#1088#1084#1091
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 7
  end
  object CheckBox_projects: TcxCheckBox
    Left = 24
    Top = 112
    Width = 273
    Height = 24
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072' '#1074#1080#1082#1083#1102#1095#1077#1085#1085#1103#1084' '#1087#1088#1086#1077#1082#1090#1110#1074
    State = cbsChecked
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 8
  end
  object All_work_dog_chek: TcxCheckBox
    Left = 8
    Top = 8
    Width = 289
    Height = 24
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = All_work_dog_chekPropertiesChange
    Properties.Caption = #1059#1089#1110' '#1076#1110#1102#1095#1110' '#1076#1086#1075#1086#1074#1086#1088#1080
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 9
  end
  object DataSet_read: TpFIBDataSet
    Left = 136
    Top = 144
    poSQLINT64ToBCD = True
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40025.470392430560000000
    ReportOptions.LastChange = 40025.470392430560000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 264
    Top = 144
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
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
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 200
    Top = 144
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = DataSet_read
    Left = 168
    Top = 144
  end
  object ActionList1: TActionList
    Left = 232
    Top = 144
    object IsDebugMode_act: TAction
      Caption = 'IsDebugMode_act'
      ShortCut = 57412
      OnExecute = IsDebugMode_actExecute
    end
  end
end
