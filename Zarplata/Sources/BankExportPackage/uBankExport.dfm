object BankExportForm: TBankExportForm
  Left = 481
  Top = 326
  BorderStyle = bsDialog
  Caption = #1045#1082#1089#1087#1086#1088#1090' '#1087#1086#1082#1072#1079#1085#1080#1082#1110#1074' '#1091' '#1073#1072#1085#1082
  ClientHeight = 311
  ClientWidth = 490
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
  object SelectFileBox: TGroupBox
    Left = 8
    Top = 8
    Width = 473
    Height = 73
    Caption = #1042#1080#1073#1110#1088' '#1092#1072#1081#1083#1072
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object FileNameEdit: TcxTextEdit
      Left = 8
      Top = 32
      Width = 409
      Height = 21
      Properties.ReadOnly = True
      TabOrder = 0
    end
    object OpenDialogBtn: TcxButton
      Left = 424
      Top = 24
      Width = 33
      Height = 33
      Caption = '...'
      TabOrder = 1
      OnClick = OpenDialogBtnClick
    end
  end
  object ProgressBox: TGroupBox
    Left = 8
    Top = 96
    Width = 473
    Height = 97
    Caption = #1045#1082#1089#1087#1086#1088#1090
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 72
      Top = 12
      Width = 18
      Height = 13
      Caption = #1058#1053':'
    end
    object TnLabel: TLabel
      Left = 96
      Top = 12
      Width = 13
      Height = 13
      Caption = '---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 312
      Top = 12
      Width = 49
      Height = 13
      Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100':'
    end
    object CountLabel: TLabel
      Left = 368
      Top = 12
      Width = 9
      Height = 13
      Caption = '---'
    end
    object ProgressBar: TcxProgressBar
      Left = 72
      Top = 28
      Width = 345
      Height = 21
      TabOrder = 0
    end
    object StartBtn: TcxButton
      Left = 198
      Top = 56
      Width = 83
      Height = 25
      Caption = #1042#1080#1074#1072#1085#1090#1072#1078#1080#1090#1080
      TabOrder = 1
      OnClick = StartBtnClick
    end
  end
  object MainDatabase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 48
    Top = 208
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = MainDatabase
    TimeoutAction = TARollback
    Top = 208
  end
  object ResultDataset: TpFIBDataSet
    Database = MainDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT ID_MAN,TN,FIO,SUMMA'
      'FROM '
      'UV_SHEET_TO_BANK_ALLDATA(?ID_SESSION)'
      'ORDER BY TN'
      '')
    Left = 40
    Top = 112
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
    Top = 112
  end
  object NewDbfTableCreate: TCreateHalcyonDataSet
    AutoOverwrite = True
    CreateFields.Strings = (
      'LSTBL;C;5;0'
      'RLSUM;N;16;2'
      'RLKOD;C;5;0')
    DBFTable = DbfExport
    DBFType = DBaseIV
    Top = 144
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'dbf'
    Left = 40
    Top = 144
  end
  object CreateDBUniver: TCreateHalcyonDataSet
    AutoOverwrite = True
    CreateFields.Strings = (
      'ID_MAN;N;10;0'
      'TN;N;8;0'
      'FIO;C;100;0'
      'SUMMA;N;16;2'
      'TIN;C;10;0'
      'ACCT_CARD;C;16;0')
    DBFTable = DbfExport
    DBFType = DBaseIV
    Left = 88
    Top = 144
  end
end
