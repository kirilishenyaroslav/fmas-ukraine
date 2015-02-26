object FzPerosnification2010Export: TFzPerosnification2010Export
  Left = 559
  Top = 376
  BorderStyle = bsDialog
  Caption = #1045#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1080#1093' '#1076#1083#1103' '#1087#1088#1086#1075#1088#1072#1084#1080' '#1087#1077#1088#1089#1086#1085#1110#1092#1110#1082#1072#1094#1110#1111
  ClientHeight = 128
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
  object FilePath: TcxButtonEdit
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
    Left = 158
    Top = 96
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
    TabOrder = 4
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
    Caption = #1054#1073#1077#1088#1110#1090#1100' '#1096#1083#1103#1093' '#1076#1083#1103' '#1077#1082#1089#1087#1086#1088#1090#1091' '#1074' '#1092#1072#1081#1083
  end
  object ProgressBar2: TcxProgressBar
    Left = 8
    Top = 71
    Width = 473
    Height = 21
    TabOrder = 5
  end
  object BtnCaption: TcxButton
    Left = 254
    Top = 95
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 2
    OnClick = BtnCaptionClick
  end
  object DSetT5: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT ID_MAN,TN,FIO,SUMMA'
      'FROM '
      'UV_SHEET_TO_BANK_ALLDATA(?ID_SESSION)'
      'ORDER BY TN'
      '')
    Left = 272
    Top = 64
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DbfExportT5: THalcyonDataSet
    AutoFlush = True
    DatabaseName = 'C:\Development\Bank'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TranslateASCII = False
    UseDeleted = False
    UserID = 0
    Left = 23
    Top = 9
  end
  object NewDbfTableCreateT5: TCreateHalcyonDataSet
    AutoOverwrite = True
    CreateFields.Strings = (
      'ROWNUM;N;6;0'
      'NUMIDENT;C;10;0'
      'LN;C;100;0'
      'NM;C;100;0'
      'FTN;C;100;0'
      'START_DT;N;2;0'
      'END_DT;N;2;0')
    DBFTable = DbfExportT5
    DBFType = DBaseIV
    Left = 24
    Top = 40
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
  object DSetT6: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT ID_MAN,TN,FIO,SUMMA'
      'FROM '
      'UV_SHEET_TO_BANK_ALLDATA(?ID_SESSION)'
      'ORDER BY TN'
      '')
    Left = 304
    Top = 64
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DbfExportT6: THalcyonDataSet
    AutoFlush = False
    DatabaseName = 'C:\Development\Bank'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'z1290809.dbf'
    TranslateASCII = False
    UseDeleted = False
    UserID = 0
    Left = 56
    Top = 8
  end
  object NewDbfTableCreateT6: TCreateHalcyonDataSet
    AutoOverwrite = True
    CreateFields.Strings = (
      'ROWNUM;N;6;0'
      'NUMIDENT;C;10;0'
      'LN;C;100;0'
      'NM;C;100;0'
      'FTN;C;100;0'
      'ZO;N;2;0'
      'ZIC;N;2;0'
      'SUM_TOTAL;N;16;2'
      'SUM_MAX;N;16;2'
      'SUM_INS;N;16;2'
      'OTK;N;1;0'
      'EXP;N;1;0')
    DBFTable = DbfExportT6
    DBFType = FoxPro2
    Left = 56
    Top = 40
  end
  object DSetT7: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 336
    Top = 64
    poSQLINT64ToBCD = True
  end
  object DSetT8: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 368
    Top = 64
    poSQLINT64ToBCD = True
  end
  object DSetT9: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 400
    Top = 64
    poSQLINT64ToBCD = True
  end
  object DSetT10: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 432
    Top = 64
    poSQLINT64ToBCD = True
  end
  object DbfExportT7: THalcyonDataSet
    AutoFlush = False
    DatabaseName = 'C:\Development\Bank'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'z1290809.dbf'
    TranslateASCII = False
    UseDeleted = False
    UserID = 0
    Left = 88
    Top = 8
  end
  object DbfExportT8: THalcyonDataSet
    AutoFlush = False
    DatabaseName = 'C:\Development\Bank'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'z1290809.dbf'
    TranslateASCII = False
    UseDeleted = False
    UserID = 0
    Left = 120
    Top = 8
  end
  object DbfExportT9: THalcyonDataSet
    AutoFlush = False
    DatabaseName = 'C:\Development\Bank'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'z1290809.dbf'
    TranslateASCII = False
    UseDeleted = False
    UserID = 0
    Left = 152
    Top = 8
  end
  object DbfExportT10: THalcyonDataSet
    AutoFlush = False
    DatabaseName = 'C:\Development\Bank'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'z1290809.dbf'
    TranslateASCII = False
    UseDeleted = False
    UserID = 0
    Left = 184
    Top = 8
  end
  object NewDbfTableCreateT7: TCreateHalcyonDataSet
    AutoOverwrite = True
    CreateFields.Strings = (
      'ROWNUM;N;6;0'
      'NUMIDENT;C;10;0'
      'LN;C;100;0'
      'NM;C;100;0'
      'FTN;C;100;0'
      'ZO;N;2;0'
      'ZIC;N;2;0'
      'PAY_MNTH;N;2;0'
      'PAY_YEAR;N;4;0'
      'PAY_TP;N;1;0'
      'SUM_TOTAL;N;16;2'
      'SUM_MAX;N;16;2'
      'SUM_INS;N;16;2'
      'OTK;N;1;0'
      'EXP;N;1;0')
    DBFTable = DbfExportT7
    DBFType = DBaseIV
    Left = 88
    Top = 40
  end
  object NewDbfTableCreateT8: TCreateHalcyonDataSet
    AutoOverwrite = True
    CreateFields.Strings = (
      'ROWNUM;N;6;0'
      'NUMIDENT;C;10;0'
      'LN;C;251;0'
      'NM;C;251;0'
      'FTN;C;251;0'
      'C_PID;C;9;0'
      'DAYS;N;2;0'
      'START_DT;N;2;0'
      'STOP_DT;N;2;0'
      'NORMZ;N;3;0'
      'HH;N;3;0'
      'MM;N;2;0'
      'SEASON;N;1;0'
      'NORMA;N;3;0')
    DBFTable = DbfExportT8
    DBFType = DBaseIV
    Left = 120
    Top = 40
  end
  object NewDbfTableCreateT9: TCreateHalcyonDataSet
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
    DBFTable = DbfExportT9
    DBFType = DBaseIV
    Left = 152
    Top = 40
  end
  object NewDbfTableCreateT10: TCreateHalcyonDataSet
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
    DBFTable = DbfExportT10
    DBFType = DBaseIV
    Left = 184
    Top = 40
  end
  object SaveDialog1: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' DBF(*.dbf)|*.dbf|'#1042#1089#1077' '#1092#1072#1081#1083#1099'(*.*)|*.*'
    Left = 80
    Top = 96
  end
end
