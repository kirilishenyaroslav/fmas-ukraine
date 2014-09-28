object fmKassaService: TfmKassaService
  Left = 454
  Top = 396
  Width = 458
  Height = 148
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
  object cxDateEdit1: TcxDateEdit
    Left = 248
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object cxLabel1: TcxLabel
    Left = 32
    Top = 23
    Width = 0
    Height = 4
    TabOrder = 1
    Caption = ''
  end
  object cxButton1: TcxButton
    Left = 112
    Top = 72
    Width = 113
    Height = 33
    Caption = 'cxButton1'
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 256
    Top = 72
    Width = 113
    Height = 33
    Caption = 'cxButton2'
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=SYSDBA'
      'user_name=masterkey')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Top = 48
  end
  object DataSet: TpFIBDataSet
    Left = 40
    Top = 48
    poSQLINT64ToBCD = True
  end
  object Transaction: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 72
    Top = 48
  end
  object StoredProc: TpFIBStoredProc
    Left = 104
    Top = 48
  end
end
