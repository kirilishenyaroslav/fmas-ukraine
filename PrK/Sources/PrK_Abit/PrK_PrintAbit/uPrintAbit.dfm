object FormPrintAbit: TFormPrintAbit
  Left = 402
  Top = 215
  BorderStyle = bsDialog
  Caption = 'FormPrintAbit'
  ClientHeight = 99
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxButtonAbitPrintZAYAVA: TcxButton
    Left = 9
    Top = 35
    Width = 99
    Height = 25
    Cursor = crHandPoint
    Caption = 'cxButtonAbitPrintZAYAVA'
    TabOrder = 0
    OnClick = cxButtonAbitPrintZAYAVAClick
  end
  object cxButtonAbitPrinEKZ_LIST: TcxButton
    Left = 116
    Top = 35
    Width = 97
    Height = 25
    Cursor = crHandPoint
    Caption = 'cxButtonAbitPrinEKZ_LIST'
    TabOrder = 1
    OnClick = cxButtonAbitPrinEKZ_LISTClick
  end
  object cxButtonAbitPrinROSPISKA: TcxButton
    Left = 223
    Top = 35
    Width = 92
    Height = 25
    Cursor = crHandPoint
    Caption = 'cxButtonAbitPrinROSPISKA'
    TabOrder = 2
    OnClick = cxButtonAbitPrinROSPISKAClick
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 72
    Top = 64
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 104
    Top = 64
  end
  object StoredProc1: TpFIBStoredProc
    Database = DB
    Transaction = ReadTransaction
    Left = 136
    Top = 64
  end
end
