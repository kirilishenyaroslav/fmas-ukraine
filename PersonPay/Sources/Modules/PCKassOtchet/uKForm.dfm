object KassForm: TKassForm
  Left = 372
  Top = 340
  Width = 399
  Height = 208
  Caption = 'KassForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 10
    Top = 20
    Width = 52
    Height = 13
    Caption = #1055#1077#1088#1110#1086#1076' '#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl7: TLabel
    Left = 11
    Top = 42
    Width = 25
    Height = 13
    Caption = #1047#1074#1110#1090
  end
  object lbl5: TLabel
    Left = 219
    Top = 82
    Width = 91
    Height = 13
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1082#1086#1087#1110#1081
  end
  object Label1: TLabel
    Left = 222
    Top = 19
    Width = 15
    Height = 13
    Caption = #1087#1086
  end
  object cxPrintForm: TcxComboBox
    Left = 77
    Top = 41
    Width = 300
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      #1050#1072#1089#1086#1074#1080#1081' '#1079#1074#1110#1090)
    TabOrder = 0
  end
  object chbPrinter: TcxCheckBox
    Left = 15
    Top = 74
    Width = 160
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1085#1072' '#1087#1088#1080#1085#1090#1077#1088
    TabOrder = 1
  end
  object chbChoosePrinter: TcxCheckBox
    Left = 17
    Top = 99
    Width = 155
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1080#1073#1088#1072#1090#1080' '#1087#1088#1080#1085#1090#1077#1088
    TabOrder = 2
  end
  object cxCopies: TcxSpinEdit
    Left = 330
    Top = 78
    Width = 48
    Height = 21
    Properties.CanEdit = False
    Properties.MaxValue = 50.000000000000000000
    Properties.MinValue = 1.000000000000000000
    TabOrder = 3
    Value = 1
  end
  object cxDateBeg: TcxDateEdit
    Left = 80
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object cxDateEnd: TcxDateEdit
    Left = 256
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object cxButton1: TcxButton
    Left = 222
    Top = 134
    Width = 117
    Height = 25
    Action = actClose
    TabOrder = 6
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DD99D99DDDDDDDDDD99DD999DDDDDDDD99DDD9999DDDDDD99DDDDD9999DDDD99
      DDDDDDDD999D999DDDDDDDDDD99999DDDDDDDDDDDD999DDDDDDDDDDDD99999DD
      DDDDDDDD999DD99DDDDDDDD999DDDD99DDDDDD999DDDDDD99DDDD999DDDDDDDD
      D9DD999DDDDDDDDDDDDD99DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
    UseSystemPaint = False
  end
  object cxButton2: TcxButton
    Left = 66
    Top = 133
    Width = 117
    Height = 25
    Action = actPrint
    TabOrder = 7
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDD77DD77DD
      DDDDDDD788777F777DDDDD7F8887778F8777D78888870000787D788888888770
      0077788FFFFFF888877778FFF88888FF8887D77F877888888887DDD787777788
      887DDDDD8F88888777DDDDDD8F88888DDDDDDDD8FFF888DDDDDDDDD8FFFF88DD
      DDDDDD8FFFFF88DDDDDDDD888FFF8DDDDDDDDDDDD888DDDDDDDD}
    UseSystemPaint = False
  end
  object cxCheckEdit: TcxCheckBox
    Left = 0
    Top = 149
    Width = 23
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = ''
    TabOrder = 8
    Visible = False
  end
  object DatabaseWork: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=wiN1251')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 224
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 41142.632693657400000000
    ReportOptions.LastChange = 41142.632693657400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 3
    Top = 3
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
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 32
    Top = 2
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = DataSetWork
    Left = 64
    Top = 4
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DatabaseWork
    TimeoutAction = TARollback
    Left = 97
    Top = 65534
  end
  object StPr: TpFIBStoredProc
    Database = DatabaseWork
    Left = 160
    Top = 65534
  end
  object actlst1: TActionList
    Left = 194
    Top = 65533
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ShortCut = 27
      OnExecute = actCloseExecute
    end
    object actPrint: TAction
      Caption = #1044#1088#1091#1082
      ShortCut = 16464
      OnExecute = actPrintExecute
    end
    object actdesigne: TAction
      Caption = 'actdesigne'
      ShortCut = 57412
      OnExecute = actdesigneExecute
    end
  end
  object DataSetWork: TpFIBDataSet
    Database = DatabaseWork
    Transaction = Transaction
    Left = 131
    poSQLINT64ToBCD = True
  end
end
