object FExport: TFExport
  Left = 397
  Top = 466
  BorderStyle = bsDialog
  Caption = #1045#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1080#1093' '#1076#1083#1103' '#1087#1088#1086#1075#1088#1072#1084#1080' '#1087#1077#1088#1089#1086#1085#1110#1092#1110#1082#1072#1094#1110#1111
  ClientHeight = 170
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object FileNameAnkEdit: TcxButtonEdit
    Left = 8
    Top = 22
    Width = 473
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = FileNameEditPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
  end
  object StartBtn: TcxButton
    Left = 206
    Top = 144
    Width = 75
    Height = 25
    Caption = #1042#1080#1075#1088#1091#1079#1080#1090#1080
    TabOrder = 1
    OnClick = StartBtnClick
  end
  object ProgressBar: TcxProgressBar
    Left = 8
    Top = 46
    Width = 473
    Height = 21
    TabOrder = 2
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = -2
    Width = 473
    Height = 25
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
    Caption = #1054#1073#1077#1088#1110#1090#1100' '#1096#1083#1103#1093' '#1076#1083#1103' '#1077#1082#1089#1087#1086#1088#1090#1091' '#1074' '#1092#1072#1081#1083' '#1072#1085#1082#1077#1090#1085#1080#1093' '#1076#1072#1085#1080#1093
  end
  object cxLabel2: TcxLabel
    Left = 7
    Top = 72
    Width = 473
    Height = 25
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = #1054#1073#1077#1088#1110#1090#1100' '#1096#1083#1103#1093' '#1076#1083#1103' '#1077#1082#1089#1087#1086#1088#1090#1091' '#1074' '#1092#1072#1081#1083' '#1079#1074#1110#1090#1085#1080#1093' '#1076#1072#1085#1080#1093
  end
  object FileNameIndEdit: TcxButtonEdit
    Left = 7
    Top = 96
    Width = 473
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
  end
  object ProgressBar2: TcxProgressBar
    Left = 8
    Top = 119
    Width = 473
    Height = 21
    TabOrder = 6
  end
  object DSetAnk: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT ID_MAN,TN,FIO,SUMMA'
      'FROM '
      'UV_SHEET_TO_BANK_ALLDATA(?ID_SESSION)'
      'ORDER BY TN'
      '')
    Left = 416
    Top = 64
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DbfExportAnk: THalcyonDataSet
    AutoFlush = False
    DatabaseName = 'C:\Development\Bank'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'z1290809.dbf'
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 24
    Top = 48
  end
  object NewDbfTableCreateAnk: TCreateHalcyonDataSet
    AutoOverwrite = True
    CreateFields.Strings = (
      'TIN;C;10;0'
      'FULLN_U;C;30;0'
      'NAME_U;C;15;0'
      'FATH_U;C;20;0'
      'D_ROG;D;8;0'
      'POL;C;1;0'
      'D_TIN;D;8;0'
      'KRPOU;C;8;0'
      'RNPD;N;10;0'
      'DFPV;D;8;0'
      'KOR;C;1;0')
    DBFTable = DbfExportAnk
    DBFType = DBaseIV
    Left = 24
    Top = 80
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'dbf'
    Filter = '*.dbf|*.dbf'
    Left = 24
    Top = 112
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 432
    Top = 33
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 432
    Top = 1
  end
  object DSetInd: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT ID_MAN,TN,FIO,SUMMA'
      'FROM '
      'UV_SHEET_TO_BANK_ALLDATA(?ID_SESSION)'
      'ORDER BY TN'
      '')
    Left = 448
    Top = 64
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DbfExportInd: THalcyonDataSet
    AutoFlush = False
    DatabaseName = 'C:\Development\Bank'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'z1290809.dbf'
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 56
    Top = 48
  end
  object NewDbfTableCreateInd: TCreateHalcyonDataSet
    AutoOverwrite = True
    CreateFields.Strings = (
      'KTF;C;1;0'
      'TIN;C;10;0'
      'ZVIT_R;N;4;0'
      'ZVIT_P;C;1;0'
      'SPLAT_R;N;4;0'
      'KRPOU;C;12;0'
      'OTK;C;1;0'
      'KTSZ;C;1;0'
      'SVR;N;10;2'
      'SVZ;N;10;2'
      'SZ1;N;9;2'
      'SZP1;N;9;2'
      'SL1;N;9;2'
      'SPD1;N;9;2'
      'KD1;N;3;0'
      'SZ2;N;9;2'
      'SZP2;N;9;2'
      'SL2;N;9;2'
      'SPD2;N;9;2'
      'KD2;N;3;0'
      'SZ3;N;9;2'
      'SZP3;N;9;2'
      'SL3;N;9;2'
      'SPD3;N;9;2'
      'KD3;N;3;0'
      'SZ4;N;9;2'
      'SZP4;N;9;2'
      'SL4;N;9;2'
      'SPD4;N;9;2'
      'KD4;N;3;0'
      'SZ5;N;9;2'
      'SZP5;N;9;2'
      'SL5;N;9;2'
      'SPD5;N;9;2'
      'KD5;N;3;0'
      'SZ6;N;9;2'
      'SZP6;N;9;2'
      'SL6;N;9;2'
      'SPD6;N;9;2'
      'KD6;N;3;0'
      'SZ7;N;9;2'
      'SZP7;N;9;2'
      'SL7;N;9;2'
      'SPD7;N;9;2'
      'KD7;N;3;0'
      'SZ8;N;9;2'
      'SZP8;N;9;2'
      'SL8;N;9;2'
      'SPD8;N;9;2'
      'KD8;N;3;0'
      'SZ9;N;9;2'
      'SZP9;N;9;2'
      'SL9;N;9;2'
      'SPD9;N;9;2'
      'KD9;N;3;0'
      'SZ10;N;9;2'
      'SZP10;N;9;2'
      'SL10;N;9;2'
      'SPD10;N;9;2'
      'KD10;N;3;0'
      'SZ11;N;9;2'
      'SZP11;N;9;2'
      'SL11;N;9;2'
      'SPD11;N;9;2'
      'KD11;N;3;0'
      'SZ12;N;9;2'
      'SZP12;N;9;2'
      'SL12;N;9;2'
      'SPD12;N;9;2'
      'KD12;N;3;0'
      'SZ;N;10;2'
      'SZP;N;10;2'
      'SL;N;10;2'
      'SP;N;10;2'
      'KD;N;3;0'
      'DPR;D;8;0'
      'DZR;D;8;0'
      'KPM;N;2;0'
      'KPD;N;2;0'
      'KPLG1;C;8;0'
      'KMZ1;N;2;0'
      'KST1;C;1;0'
      'SSM1;N;2;0'
      'SSD1;N;2;0'
      'SST1;N;3;0'
      'SSG1;N;4;0'
      'SSH1;N;2;0'
      'SSZ1;N;3;0'
      'NST1;N;6;2;'
      'KSZ1;C;1;0'
      'KPLG2;C;8;0'
      'KMZ2;N;2;0'
      'KST2;C;1;0'
      'SSM2;N;2;0'
      'SSD2;N;2;0'
      'SST2;N;3;0'
      'SSG2;N;4;0'
      'SSH2;N;2;0'
      'SSZ2;N;3;0'
      'NST2;N;6;2'
      'KSZ2;C;1;0'
      'KPLG3;C;8;0'
      'KMZ3;N;2;0'
      'KST3;C;1;0'
      'SSM3;N;2;0'
      'SSD3;N;2;0'
      'SST3;N;3;0'
      'SSG3;N;4;0'
      'SSH3;N;2;0'
      'SSZ3;N;3;0'
      'NST3;N;6;2'
      'KSZ3;C;1;0'
      'KPLG4;C;8;0'
      'KMZ4;N;2;0'
      'KST4;C;1;0'
      'SSM4;N;2;0'
      'SSD4;N;2;0'
      'SST4;N;3;0'
      'SSG4;N;4;0'
      'SSH4;N;2;0'
      'SSZ4;N;3;0'
      'NST4;N;6;2'
      'KSZ4;C;1;0'
      'RNPD;N;5;0'
      'DFPV;D;8;0'
      'NPD;N;5;0'
      'DFD;D;8;0'
      'KPFU;C;8;0'
      'NZV;C;1;0'
      'KOP;C;10;0'
      'TOZ;C;6;0')
    DBFTable = DbfExportInd
    DBFType = DBaseIV
    Left = 56
    Top = 80
  end
end
