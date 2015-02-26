object BankExportForm: TBankExportForm
  Left = 425
  Top = 321
  BorderStyle = bsDialog
  Caption = #1045#1082#1089#1087#1086#1088#1090' '#1087#1086#1082#1072#1079#1085#1080#1082#1110#1074' '#1091' '#1073#1072#1085#1082
  ClientHeight = 114
  ClientWidth = 494
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
  object LabelFile: TcxLabel
    Left = 16
    Top = 8
    Width = 465
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.LabelEffect = cxleCool
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = #1060#1072#1081#1083':'
  end
  object ProgressBar: TcxProgressBar
    Left = 16
    Top = 52
    Width = 465
    Height = 21
    TabOrder = 1
  end
  object StartBtn: TcxButton
    Left = 158
    Top = 80
    Width = 83
    Height = 25
    Caption = #1042#1080#1074#1072#1085#1090#1072#1078#1080#1090#1080
    TabOrder = 2
    OnClick = StartBtnClick
  end
  object ExitBtn: TcxButton
    Left = 246
    Top = 80
    Width = 83
    Height = 25
    Caption = #1042#1080#1081#1090#1080
    TabOrder = 3
    OnClick = ExitBtnClick
  end
  object eFileNameEdit: TcxButtonEdit
    Left = 16
    Top = 24
    Width = 465
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = FileNameEditPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 4
  end
  object DSet: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT ID_MAN,TN,FIO,SUMMA'
      'FROM '
      'UV_SHEET_TO_BANK_ALLDATA(?ID_SESSION)'
      'ORDER BY TN'
      '')
    Left = 40
    Top = 56
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
    Left = 8
    Top = 56
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'dbf'
    Filter = 'DBF (*.dbf)|*.dbf|All files (*.*)|*.*'
    Left = 40
    Top = 88
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
    Left = 8
    Top = 88
  end
  object DataSetConst: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT ID_MAN,TN,FIO,SUMMA'
      'FROM '
      'UV_SHEET_TO_BANK_ALLDATA(?ID_SESSION)'
      'ORDER BY TN'
      '')
    Left = 72
    Top = 56
    poSQLINT64ToBCD = True
  end
end
