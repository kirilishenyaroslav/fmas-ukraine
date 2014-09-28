object fmKassaDayInfoReport: TfmKassaDayInfoReport
  Left = 418
  Top = 319
  Width = 569
  Height = 181
  Caption = 'fmKassaDayInfoReport'
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
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Width = 545
    Height = 33
    AutoSize = False
    ParentFont = False
    Properties.WordWrap = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = ''
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 40
    Width = 545
    Height = 41
    AutoSize = False
    ParentFont = False
    Properties.WordWrap = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Caption = ''
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 88
    Width = 545
    Height = 41
    AutoSize = False
    ParentFont = False
    Properties.WordWrap = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Caption = ''
  end
  object Database: TpFIBDatabase
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 184
    Top = 32
  end
  object DataSetInfo: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    SelectSQL.Strings = (
      'select * from KASSA_GET_OTCHET_INFO('#39'26.03.2009'#39','#39'1'#39')')
    Left = 144
    Top = 24
    poSQLINT64ToBCD = True
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 104
    Top = 24
  end
end
