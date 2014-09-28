object BankExportFormXML: TBankExportFormXML
  Left = 648
  Top = 374
  BorderStyle = bsDialog
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1073#1072#1085#1082
  ClientHeight = 100
  ClientWidth = 488
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
  object DSet5: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 272
    Top = 8
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSource5: TDataSource
    DataSet = DSet5
    Left = 160
    Top = 8
  end
end
