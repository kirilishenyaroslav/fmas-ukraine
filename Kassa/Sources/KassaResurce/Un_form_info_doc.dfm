object fmUnFormInfoDoc: TfmUnFormInfoDoc
  Left = 338
  Top = 298
  Width = 516
  Height = 160
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 328
    Top = 96
    Width = 123
    Height = 25
    Cancel = True
    Caption = 'cxButton1'
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxTextEdit1: TcxTextEdit
    Left = 176
    Top = 8
    Width = 305
    Height = 21
    Properties.ReadOnly = True
    TabOrder = 1
  end
  object cxTextEdit2: TcxTextEdit
    Left = 176
    Top = 32
    Width = 305
    Height = 21
    Properties.ReadOnly = True
    TabOrder = 2
  end
  object cxTextEdit3: TcxTextEdit
    Left = 176
    Top = 56
    Width = 305
    Height = 21
    Properties.ReadOnly = True
    TabOrder = 3
  end
  object cxLabel1: TcxLabel
    Left = 7
    Top = 10
    Width = 169
    Height = 17
    AutoSize = False
    TabOrder = 4
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 34
    Width = 165
    Height = 17
    AutoSize = False
    TabOrder = 5
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 58
    Width = 169
    Height = 17
    AutoSize = False
    TabOrder = 6
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'user_name=SYSDBA')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 88
  end
  object DataSet: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    Left = 48
    Top = 88
    poSQLINT64ToBCD = True
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 80
    Top = 88
  end
end
