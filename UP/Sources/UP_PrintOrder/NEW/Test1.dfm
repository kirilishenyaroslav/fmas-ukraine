object Form1: TForm1
  Left = 190
  Top = 112
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 248
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object D: TpFIBDatabase
    DBName = 'O:\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = T
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 136
    Top = 72
  end
  object T: TpFIBTransaction
    DefaultDatabase = D
    TimeoutAction = TARollback
    Left = 200
    Top = 72
  end
end
