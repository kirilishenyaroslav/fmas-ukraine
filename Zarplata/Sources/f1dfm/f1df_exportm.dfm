object BankExportForm: TBankExportForm
  Left = 415
  Top = 766
  BorderStyle = bsDialog
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1073#1072#1085#1082
  ClientHeight = 103
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
  object FileNameEdit: TcxButtonEdit
    Left = 8
    Top = 8
    Width = 473
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = FileNameEditPropertiesButtonClick
    TabOrder = 0
  end
  object StartBtn: TcxButton
    Left = 206
    Top = 64
    Width = 75
    Height = 25
    Caption = #1042#1080#1075#1088#1091#1079#1080#1090#1080
    TabOrder = 1
    OnClick = StartBtnClick
  end
  object ProgressBar: TcxProgressBar
    Left = 8
    Top = 36
    Width = 473
    Height = 21
    TabOrder = 2
  end
  object ResultDataset: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT ID_MAN,TN,FIO,SUMMA'
      'FROM '
      'UV_SHEET_TO_BANK_ALLDATA(?ID_SESSION)'
      'ORDER BY TN'
      '')
    Left = 96
    Top = 40
    poSQLINT64ToBCD = True
  end
  object DbfExport: THalcyonDataSet
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
    Top = 8
  end
  object NewDbfTableCreate: TCreateHalcyonDataSet
    AutoOverwrite = True
    CreateFields.Strings = (
      'NP;N;5;0'
      'PERIOD;N;1;0'
      'RIK;N;4;0'
      'KOD;C;10;0'
      'TYP;N;1;0'
      'TIN;C;10;0'
      'S_NAR;N;12;2'
      'S_DOX;N;12;2'
      'S_TAXN;N;12;2'
      'S_TAXP;N;12;2'
      'OZN_DOX;N;3;0'
      'D_PRIYN;D;8;0'
      'D_ZVILN;D;8;0'
      'OZN_PILG;N;2;0'
      'OZNAKA;N;1;0')
    DBFTable = DbfExport
    DBFType = DBaseIV
    Left = 24
    Top = 40
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'dbf'
    Left = 24
    Top = 72
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = DefaultTransaction
    Left = 64
    Top = 73
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 64
    Top = 41
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 64
    Top = 9
  end
end
