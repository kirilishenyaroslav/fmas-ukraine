object SchOborotForm: TSchOborotForm
  Left = 424
  Top = 371
  Width = 463
  Height = 267
  Caption = #1054#1073#1086#1088#1086#1090#1080' '#1079#1072' '#1088#1072#1093#1091#1085#1082#1072#1084#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl3: TLabel
    Left = 48
    Top = 154
    Width = 25
    Height = 13
    Caption = #1047#1074#1110#1090
  end
  object cxButton1: TcxButton
    Left = 238
    Top = 198
    Width = 117
    Height = 25
    Action = actClose
    TabOrder = 0
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
    Left = 82
    Top = 197
    Width = 117
    Height = 25
    Action = actPrint
    TabOrder = 1
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
    Top = 196
    Width = 23
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = ''
    TabOrder = 2
    Visible = False
  end
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 447
    Height = 189
    ActivePage = ts1
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object ts1: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1110' '#1086#1087#1094#1110#1111
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
      object lbl4: TLabel
        Left = 246
        Top = 20
        Width = 15
        Height = 13
        Caption = #1087#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 10
        Top = 46
        Width = 49
        Height = 13
        Caption = #1056#1072#1093#1091#1085#1082#1080
      end
      object lbl5: TLabel
        Left = 283
        Top = 114
        Width = 91
        Height = 13
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1082#1086#1087#1110#1081
      end
      object lbl7: TLabel
        Left = 11
        Top = 74
        Width = 25
        Height = 13
        Caption = #1047#1074#1110#1090
      end
      object cxMonthBeg: TcxComboBox
        Left = 77
        Top = 17
        Width = 89
        Height = 21
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 12
        Properties.Items.Strings = (
          #1089#1110#1095#1077#1085#1100
          #1083#1102#1090#1080#1081
          #1073#1077#1088#1077#1079#1077#1085#1100
          #1082#1074#1110#1090#1077#1085#1100
          #1090#1088#1072#1074#1077#1085#1100
          #1095#1077#1088#1074#1077#1085#1100
          #1083#1080#1087#1077#1085#1100
          #1089#1077#1088#1087#1077#1085#1100
          #1074#1077#1088#1077#1089#1077#1085#1100
          #1078#1086#1074#1090#1077#1085#1100
          #1083#1080#1089#1090#1086#1087#1072#1076
          #1075#1088#1091#1076#1077#1085#1100)
        Properties.ReadOnly = False
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfUltraFlat
        TabOrder = 0
      end
      object cxYearBeg: TcxSpinEdit
        Left = 171
        Top = 17
        Width = 65
        Height = 21
        ParentFont = False
        Properties.MaxValue = 2200.000000000000000000
        Properties.MinValue = 1899.000000000000000000
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfUltraFlat
        TabOrder = 1
        Value = 1899
      end
      object cxMonthEnd: TcxComboBox
        Left = 278
        Top = 17
        Width = 89
        Height = 21
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 12
        Properties.Items.Strings = (
          #1089#1110#1095#1077#1085#1100
          #1083#1102#1090#1080#1081
          #1073#1077#1088#1077#1079#1077#1085#1100
          #1082#1074#1110#1090#1077#1085#1100
          #1090#1088#1072#1074#1077#1085#1100
          #1095#1077#1088#1074#1077#1085#1100
          #1083#1080#1087#1077#1085#1100
          #1089#1077#1088#1087#1077#1085#1100
          #1074#1077#1088#1077#1089#1077#1085#1100
          #1078#1086#1074#1090#1077#1085#1100
          #1083#1080#1089#1090#1086#1087#1072#1076
          #1075#1088#1091#1076#1077#1085#1100)
        Properties.ReadOnly = False
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfUltraFlat
        TabOrder = 2
      end
      object cxYearEnd: TcxSpinEdit
        Left = 375
        Top = 17
        Width = 65
        Height = 21
        ParentFont = False
        Properties.MaxValue = 2200.000000000000000000
        Properties.MinValue = 1899.000000000000000000
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfUltraFlat
        TabOrder = 3
        Value = 1899
      end
      object cxSch: TcxButtonEdit
        Left = 77
        Top = 44
        Width = 365
        Height = 21
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxSchPropertiesButtonClick
        TabOrder = 4
      end
      object cxPrintForm: TcxComboBox
        Left = 77
        Top = 73
        Width = 363
        Height = 21
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #1054#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100
          #1054#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1079#1072' '#1082#1086#1096#1090#1086#1088#1080#1089#1072#1084#1080
          #1056#1086#1079#1075#1086#1088#1085#1091#1090#1072' '#1086#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100
          #1056#1086#1079#1075#1086#1088#1085#1091#1090#1072' '#1086#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' ('#1079' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084#1080')'
          #1052#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1081' '#1086#1088#1076#1077#1088
          #1044#1086#1076#1072#1090#1086#1082' '#1076#1086' '#1043#1086#1083#1086#1074#1085#1086#1110' '#1082#1085#1080#1075#1080' ('#1088#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1088#1072#1093#1091#1085#1082#1110#1074')'
          #1052#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1081' '#1086#1088#1076#1077#1088' '#1079#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084#1080
          #1056#1086#1079#1075#1086#1088#1085#1091#1090#1072' '#1086#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1073#1077#1079' '#8470' '#1076#1086#1075#1086#1074#1086#1088#1091
          #1052#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1081' '#1086#1088#1076#1077#1088' '#1073#1077#1079' '#8470' '#1076#1086#1075#1086#1074#1086#1088#1091
          #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1088#1072#1093#1091#1085#1082#1110#1074' '#1087#1086' '#1089#1090#1072#1090#1090#1103#1084' '#1074#1080#1090#1088#1072#1090)
        Properties.OnChange = cxPrintFormPropertiesChange
        TabOrder = 5
      end
      object chbPrinter: TcxCheckBox
        Left = 79
        Top = 106
        Width = 160
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1085#1072' '#1087#1088#1080#1085#1090#1077#1088
        TabOrder = 6
      end
      object cxCopies: TcxSpinEdit
        Left = 394
        Top = 110
        Width = 48
        Height = 21
        Properties.CanEdit = False
        Properties.MaxValue = 50.000000000000000000
        Properties.MinValue = 1.000000000000000000
        TabOrder = 7
        Value = 1
      end
      object chbChoosePrinter: TcxCheckBox
        Left = 81
        Top = 131
        Width = 155
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1042#1080#1073#1088#1072#1090#1080' '#1087#1088#1080#1085#1090#1077#1088
        TabOrder = 8
      end
    end
    object ts2: TTabSheet
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ImageIndex = 1
      ParentFont = False
      object lbl6: TLabel
        Left = 14
        Top = 6
        Width = 202
        Height = 13
        Caption = #1053#1072#1103#1074#1085#1110#1089#1090#1100' '#1090#1072' '#1087#1086#1088#1103#1076#1086#1082' '#1075#1088#1091#1087#1091#1074#1072#1085#1085#1103
      end
      object lbl8: TLabel
        Left = 11
        Top = 35
        Width = 12
        Height = 13
        Caption = '1.'
      end
      object lbl9: TLabel
        Left = 11
        Top = 57
        Width = 12
        Height = 13
        Caption = '2.'
      end
      object lbl10: TLabel
        Left = 11
        Top = 83
        Width = 12
        Height = 13
        Caption = '3.'
      end
      object lbl11: TLabel
        Left = 11
        Top = 107
        Width = 12
        Height = 13
        Caption = '4.'
      end
      object cx_1: TcxComboBox
        Left = 32
        Top = 31
        Width = 121
        Height = 21
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #1050#1086#1096#1090#1086#1088#1080#1089
          #1056#1086#1079#1076#1110#1083
          #1057#1090#1072#1090#1090#1103
          #1050#1045#1050#1042)
        Properties.OnChange = cx_1PropertiesChange
        TabOrder = 0
      end
      object cx_2: TcxComboBox
        Left = 33
        Top = 56
        Width = 121
        Height = 21
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #1050#1086#1096#1090#1086#1088#1080#1089
          #1056#1086#1079#1076#1110#1083
          #1057#1090#1072#1090#1090#1103
          #1050#1045#1050#1042)
        Properties.OnChange = cx_2PropertiesChange
        TabOrder = 1
      end
      object cx_3: TcxComboBox
        Left = 33
        Top = 82
        Width = 121
        Height = 21
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #1050#1086#1096#1090#1086#1088#1080#1089
          #1056#1086#1079#1076#1110#1083
          #1057#1090#1072#1090#1090#1103
          #1050#1045#1050#1042)
        Properties.OnChange = cx_3PropertiesChange
        TabOrder = 2
      end
      object cx_4: TcxComboBox
        Left = 33
        Top = 106
        Width = 121
        Height = 21
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #1050#1086#1096#1090#1086#1088#1080#1089
          #1056#1086#1079#1076#1110#1083
          #1057#1090#1072#1090#1090#1103
          #1050#1045#1050#1042)
        Properties.OnChange = cx_4PropertiesChange
        TabOrder = 3
      end
      object cb_4: TcxCheckBox
        Left = 169
        Top = 108
        Width = 23
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = cb_4PropertiesChange
        Properties.Caption = ''
        TabOrder = 4
      end
      object cb_3: TcxCheckBox
        Left = 169
        Top = 87
        Width = 23
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = cb_3PropertiesChange
        Properties.Caption = ''
        TabOrder = 5
      end
      object cb_2: TcxCheckBox
        Left = 169
        Top = 58
        Width = 23
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = cb_2PropertiesChange
        Properties.Caption = ''
        TabOrder = 6
      end
      object cb_1: TcxCheckBox
        Left = 169
        Top = 32
        Width = 23
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = True
        Properties.OnChange = cb_1PropertiesChange
        Properties.Caption = ''
        TabOrder = 7
      end
    end
  end
  object DataSetFullSch: TpFIBDataSet
    Database = DatabaseWork
    Transaction = Transaction
    SelectSQL.Strings = (
      
        'SELECT SUM(IN_DB_SUMMA) AS S1, SUM(IN_KR_SUMMA) AS S2, SUM(OUT_D' +
        'B_SUMMA) AS S3, SUM(OUT_KR_SUMMA) AS S4'
      'FROM PC_TMP_OBOROT WHERE ID_SESSION = :id')
    Left = 390
    poSQLINT64ToBCD = True
    object DataSetFullSchS1: TFIBBCDField
      FieldName = 'S1'
      Size = 2
      RoundByScale = True
    end
    object DataSetFullSchS2: TFIBBCDField
      FieldName = 'S2'
      Size = 2
      RoundByScale = True
    end
    object DataSetFullSchS3: TFIBBCDField
      FieldName = 'S3'
      Size = 2
      RoundByScale = True
    end
    object DataSetFullSchS4: TFIBBCDField
      FieldName = 'S4'
      Size = 2
      RoundByScale = True
    end
  end
  object ds_podchin_1: TpFIBDataSet
    Database = DatabaseWork
    Transaction = Transaction
    Left = 361
    Top = 65535
    poSQLINT64ToBCD = True
  end
  object DatabaseWork: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 231
    Top = 65534
  end
  object DataSetWork: TpFIBDataSet
    Database = DatabaseWork
    Transaction = Transaction
    Left = 419
    poSQLINT64ToBCD = True
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DatabaseWork
    TimeoutAction = TARollback
    Left = 169
    Top = 65534
  end
  object actlst1: TActionList
    Left = 330
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
  object StPr: TpFIBStoredProc
    Left = 264
    Top = 65534
  end
  object RxMemoryData: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ID_SCH'
        DataType = ftInteger
      end
      item
        Name = 'SCH_NUMBER'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SCH_TITLE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ON_CHECK'
        DataType = ftInteger
      end>
    Left = 295
    Top = 65535
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = DataSetWork
    Left = 360
    Top = 196
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 48
    Top = 194
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = ds_podchin
    Left = 393
    Top = 196
  end
  object ds_podchin: TpFIBDataSet
    Database = DatabaseWork
    Transaction = Transaction
    Left = 200
    Top = 65535
    poSQLINT64ToBCD = True
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    DataSet = ds_podchin_1
    Left = 423
    Top = 197
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40023.426448206000000000
    ReportOptions.LastChange = 41465.395683553200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var n, m:integer;'
      'procedure MasterData2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  n:=n+1;'
      '  if n=1 then Memo44.Visible:=True'
      '  else Memo44.Visible:=False;'
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  n:=0;'
      '  m:=0;'
      'end;'
      ''
      'procedure MasterData3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   m:=m+1;'
      '  if m=1 then Memo45.Visible:=True'
      '  else Memo45.Visible:=False;'
      'end;'
      ''
      'procedure ReportSummary1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   PageHeader1.Visible:=false;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 19
    Top = 195
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end
      item
        DataSet = frxDBDataset3
        DataSetName = 'frxDBDataset3'
      end>
    Variables = <
      item
        Name = 'ORG_NAME'
        Value = #39#1044#1086#1085#1053#1059#1045#1058' '#39
      end
      item
        Name = 'ORG_SHORT_NAME'
        Value = #39'36'#39
      end
      item
        Name = 'ORG_KOD_OKPO'
        Value = #39'01566057'#39
      end
      item
        Name = 'PERIOD'
        Value = #39#1050#1042#1030#1058#1045#1053#1068'  2010'#39
      end
      item
        Name = 'MONTH1'
        Value = #39#1058#1056#1040#1042#1045#1053#1068#39
      end
      item
        Name = 'YEAR1'
        Value = '2011'
      end
      item
        Name = 'MONTH2'
        Value = #39#1058#1056#1040#1042#1045#1053#1068#39
      end
      item
        Name = 'YEAR2'
        Value = '2011'
      end
      item
        Name = 'SYSTEM_SCH'
        Value = #39' 675/04'#39
      end
      item
        Name = 'USER'
        Value = #39#1064#1072#1084#1072#1088#1110#1085#1072' '#1051#1102#1076#1084#1080#1083#1072' '#1040#1085#1072#1090#1086#1083#1110#1111#1074#1085#1072#39
      end
      item
        Name = 'SCH_FILTR'
        Value = #39#39
      end
      item
        Name = 'IN_DB_SUMMA'
        Value = #39'0'#39
      end
      item
        Name = 'IN_KR_SUMMA'
        Value = #39'1051870,23'#39
      end
      item
        Name = 'OUT_DB_SUMMA'
        Value = #39'0'#39
      end
      item
        Name = 'OUT_KR_SUMMA'
        Value = #39'923961,28'#39
      end
      item
        Name = 'TIP'
        Value = #39'409'#39
      end
      item
        Name = 'DEBIT_KREDIT'
        Value = #39#1082#1088#1077#1076#1080#1090#1086#1088#1072#1084#1080#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 234.330860000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo35: TfrxMemoView
          Left = 26.456710000000000000
          Top = 7.559060000000000000
          Width = 306.141930000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ORG_NAME]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 26.456710000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081
            #1082#1086#1076' '#1028#1044#1056#1055#1054#1059)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 128.504020000000000000
          Top = 30.236240000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ORG_KOD_OKPO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Top = 109.606370000000000000
          Width = 721.890230000000000000
          Height = 52.913420000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1045#1052#1054#1056#1030#1040#1051#1068#1053#1048#1049' '#1054#1056#1044#1045#1056' '#8470' [ORG_SHORT_NAME]'
            '('#1088#1072#1093#1091#1085#1082#1080': [SYSTEM_SCH] )')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Top = 170.078850000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1079#1072' '#1087#1077#1088#1110#1086#1076' [MONTH1] [YEAR1] - [MONTH2] [YEAR2]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Top = 188.976500000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1082#1086#1087#1080#1095#1091#1074#1072#1083#1100#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1079#1072' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1072#1084#1080' '#1079' '#1110#1085#1096#1080#1084#1080' [DEBIT_KREDIT]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 593.386210000000000000
          Top = 79.370130000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo43: TfrxMemoView
          Left = 487.559370000000000000
          Top = 79.370130000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1050#1086#1076' '#1079#1072' '#1044#1050#1059#1044)
        end
        object Memo26: TfrxMemoView
          Top = 211.653680000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1060#1110#1083#1100#1090#1088' '#1088#1072#1093#1091#1085#1082#1091': [SCH_FILTR]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 1243.465370000000000000
        Width = 718.110700000000000000
        object Memo24: TfrxMemoView
          Left = 11.338590000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1088#1091#1082#1091': [Now]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 506.457020000000000000
          Top = 3.779529999999910000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1057#1090#1086#1088'. [<Page#>] '#1110#1079' [TotalPages#]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 457.323130000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo7: TfrxMemoView
          Left = 192.756030000000000000
          Width = 73.700787400000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."IN_D_S"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 266.456692913386000000
          Width = 73.700787400000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."IN_K_S"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 340.157700000000000000
          Width = 113.385773070000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."D_S"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 453.543600000000000000
          Width = 113.385773070000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."K_S"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 566.929500000000000000
          Width = 75.590551181102400000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[<frxDBDataset1."OUT_D_S">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."OUT_K_S"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 26.456710000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."FIO"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 75.590600000000000000
        ParentFont = False
        Top = 275.905690000000000000
        Width = 718.110700000000000000
        object Memo13: TfrxMemoView
          Left = 192.756030000000000000
          Width = 147.401572360000000000
          Height = 60.472480000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' '
            #1087#1086#1095#1072#1090#1086#1082' '#1084#1110#1089#1103#1094#1103' '#1079#1072
            #1089#1091#1073#1088#1072#1093#1091#1085#1082#1086#1084
            '('#1076#1077#1073#1077#1090',  '#1082#1088#1077#1076#1080#1090')')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 26.456710000000000000
          Width = 166.299320000000000000
          Height = 60.472480000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072
            #1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111' ('#1091#1089#1090#1072#1085#1086#1074#1080'),'
            #1076#1072#1090#1072', '#8470
            #1076#1086#1082#1091#1084#1077#1085#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Width = 26.456710000000000000
          Height = 60.472480000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470
            #1079'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 340.157700000000000000
          Width = 113.385900000000000000
          Height = 60.472480000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090#1086#1074#1072'  '#1089#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 453.543600000000000000
          Width = 113.385900000000000000
          Height = 60.472480000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090#1086#1074#1072' '#1089#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 60.472480000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072
            #1082#1110#1085#1077#1094#1100' '#1084#1110#1089#1103#1094#1103' '#1079#1072
            #1089#1091#1073#1088#1072#1093#1091#1085#1082#1086#1084' ('#1076#1077#1073#1077#1090', '
            #1082#1088#1077#1076#1080#1090')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Top = 60.472480000000000000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
        end
        object Memo18: TfrxMemoView
          Left = 26.456710000000000000
          Top = 60.472480000000000000
          Width = 166.299320000000000000
          Height = 15.118120000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
        end
        object Memo19: TfrxMemoView
          Left = 192.756030000000000000
          Top = 60.472480000000000000
          Width = 147.401670000000000000
          Height = 15.118120000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3')
        end
        object Memo20: TfrxMemoView
          Left = 340.157700000000000000
          Top = 60.472480000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4')
        end
        object Memo21: TfrxMemoView
          Left = 453.543600000000000000
          Top = 60.472480000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '5')
        end
        object Memo22: TfrxMemoView
          Left = 566.929500000000000000
          Top = 60.472480000000000000
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '6')
        end
      end
      object Memo41: TfrxMemoView
        Left = 434.645950000000000000
        Top = 7.559060000000000000
        Width = 257.008040000000000000
        Height = 68.031540000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1058#1080#1087#1086#1074#1072' '#1092#1086#1088#1084#1072' '#8470' [TIP]-'#1072#1074#1090' ('#1073#1102#1076#1078#1077#1090')'
          #1047#1072#1090#1074#1077#1088#1076#1078#1077#1085#1086' '
          #1085#1072#1082#1072#1079#1086#1084' '#1044#1077#1088#1078#1072#1074#1085#1086#1075#1086' '#1082#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072' '#1059#1082#1088#1072#1111#1085#1080' '
          #1074#1110#1076' 27 '#1083#1080#1087#1085#1103' 2000'#1088'.  '#8470' 68')
        ParentFont = False
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 411.968770000000000000
        Visible = False
        Width = 718.110700000000000000
        Condition = '<frxDBDataset1."ID_SCH">=<frxDBDataset1."ID_SCH">'
      end
      object GroupFooter1: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 498.897960000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086'        ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 192.756030000000000000
          Width = 73.700787400000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_D_S">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 266.456692910000000000
          Width = 73.700787400000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_K_S">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 340.157700000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."D_S">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 453.543600000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."K_S">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 566.929500000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_D_S">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_K_S">)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 60.472480000000000000
        ParentFont = False
        Top = 540.472790000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Top = 15.118120000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' '#1087#1086#1095#1072#1090#1086#1082' '#1084#1110#1089#1103#1094#1103':')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 355.275820000000000000
          Top = 15.118120000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1044#1077#1073#1077#1090':')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 551.811380000000000000
          Top = 15.118120000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090':')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 449.764070000000000000
          Top = 41.574830000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1057#1091#1073#1088#1072#1093#1091#1085#1086#1082)
        end
        object Memo55: TfrxMemoView
          Left = 642.520100000000000000
          Top = 41.574830000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1057#1091#1084#1072)
        end
        object Memo82: TfrxMemoView
          Left = 400.630180000000000000
          Top = 15.118120000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[IN_DB_SUMMA]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 604.724800000000000000
          Top = 15.118120000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[IN_KR_SUMMA]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 623.622450000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData2OnBeforePrint'
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object Memo44: TfrxMemoView
          Width = 445.984540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1044#1077#1073#1077#1090' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1091' [SYSTEM_SCH] '#1076#1086' '#1082#1088#1077#1076#1080#1090#1091' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1110#1074':')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 449.764070000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[frxDBDataset2."DB_SCH_NUMBER"]')
        end
        object Memo57: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset2."D_S"]')
        end
      end
      object Footer1: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 665.197280000000000000
        Width = 718.110700000000000000
        object Memo58: TfrxMemoView
          Left = 449.764070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1056#1072#1079#1086#1084':')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset2."D_S">)]')
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 30.236240000000000000
        ParentFont = False
        Top = 706.772110000000000000
        Width = 718.110700000000000000
        object Memo86: TfrxMemoView
          Left = 449.764070000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1057#1091#1073#1088#1072#1093#1091#1085#1086#1082)
        end
        object Memo87: TfrxMemoView
          Left = 642.520100000000000000
          Top = 11.338590000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1057#1091#1084#1072)
        end
      end
      object MasterData3: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 759.685530000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData3OnBeforePrint'
        DataSet = frxDBDataset3
        DataSetName = 'frxDBDataset3'
        RowCount = 0
        object Memo45: TfrxMemoView
          Width = 445.984540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1091' [SYSTEM_SCH] '#1076#1086' '#1076#1077#1073#1077#1090#1091' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1110#1074':')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 449.764070000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[frxDBDataset3."KR_SCH_NUMBER"]')
        end
        object Memo61: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset3."K_S"]')
        end
      end
      object Footer2: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 124.724490000000000000
        ParentFont = False
        Top = 801.260360000000000000
        Width = 718.110700000000000000
        object Memo62: TfrxMemoView
          Left = 449.764070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1056#1072#1079#1086#1084':')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset3."K_S">)]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 355.275590550000000000
          Top = 34.015608900000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1044#1077#1073#1077#1090':')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 551.811023620000000000
          Top = 34.015608900000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090':')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Top = 34.015770000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' '#1082#1110#1085#1077#1094#1100' '#1084#1110#1089#1103#1094#1103':')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Top = 86.929190000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1057#1091#1084#1072' '#1086#1073#1086#1088#1086#1090#1110#1074' '#1079#1072' '#1084#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1084' '#1086#1088#1076#1077#1088#1086#1084':')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 400.629921260000000000
          Top = 34.015770000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[OUT_DB_SUMMA]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 604.724409450000000000
          Top = 34.015770000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[OUT_KR_SUMMA]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 551.811380000000000000
          Top = 83.149660000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[SUM(<frxDBDataset3."K_S">)]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 234.330860000000000000
        ParentFont = False
        Top = 986.457330000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportSummary1OnBeforePrint'
        object Memo6: TfrxMemoView
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100)
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 120.944960000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo47: TfrxMemoView
          Left = 366.614410000000000000
          Top = 0.000000000000002665
          Width = 347.716760000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '/[USER]/')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 143.622140000000000000
          Top = 18.897650000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '('#1087#1086#1089#1072#1076#1072')')
        end
        object Memo65: TfrxMemoView
          Left = 257.008040000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo66: TfrxMemoView
          Left = 279.685220000000000000
          Top = 18.897650000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089')')
        end
        object Memo67: TfrxMemoView
          Left = 506.457020000000000000
          Top = 22.677180000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '('#1055#1030#1041')')
        end
        object Memo68: TfrxMemoView
          Top = 60.472480000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1055#1077#1088#1077#1074#1110#1088#1080#1074)
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 120.944960000000000000
          Top = 60.472480000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo70: TfrxMemoView
          Left = 366.614410000000000000
          Top = 60.472480000000000000
          Width = 347.716760000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo71: TfrxMemoView
          Left = 143.622140000000000000
          Top = 79.370130000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '('#1087#1086#1089#1072#1076#1072')')
        end
        object Memo72: TfrxMemoView
          Left = 257.008040000000000000
          Top = 60.472480000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo73: TfrxMemoView
          Left = 279.685220000000000000
          Top = 79.370130000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089')')
        end
        object Memo74: TfrxMemoView
          Left = 506.457020000000000000
          Top = 83.149660000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '('#1055#1030#1041')')
        end
        object Memo75: TfrxMemoView
          Top = 113.385900000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1043#1086#1083#1086#1074#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088)
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 366.614410000000000000
          Top = 113.385900000000000000
          Width = 347.716760000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo77: TfrxMemoView
          Left = 257.008040000000000000
          Top = 113.385900000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo78: TfrxMemoView
          Left = 279.685220000000000000
          Top = 132.283550000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089')')
        end
        object Memo79: TfrxMemoView
          Left = 506.457020000000000000
          Top = 136.063080000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '('#1055#1030#1041')')
        end
        object Memo80: TfrxMemoView
          Left = 3.779530000000000000
          Top = 200.314836141732000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '"__"_________________ 20__'#1088'.')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 464.882190000000000000
          Top = 200.315090000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1044#1086#1076#1072#1090#1086#1082' '#1085#1072' ___________ '#1072#1088#1082#1091#1096#1072#1093)
          ParentFont = False
        end
      end
    end
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 4
    Top = 144
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 36
    Top = 144
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
    Left = 4
    Top = 112
  end
end
