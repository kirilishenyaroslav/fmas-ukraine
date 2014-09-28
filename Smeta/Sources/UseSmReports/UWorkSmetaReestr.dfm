object frmSmetaSpr: TfrmSmetaSpr
  Left = 275
  Top = 164
  Width = 497
  Height = 310
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cbMonth: TComboBox
    Left = 110
    Top = 50
    Width = 113
    Height = 22
    Style = csOwnerDrawFixed
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
    TabStop = False
  end
  object cbYear: TComboBox
    Left = 223
    Top = 50
    Width = 88
    Height = 22
    Style = csOwnerDrawFixed
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
    TabStop = False
  end
  object WorkDatabase: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 41
    Top = 10
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 9
    Top = 11
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 8
    Top = 44
  end
  object SmetaDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 8
    Top = 80
    poSQLINT64ToBCD = True
  end
  object SmetaSource: TDataSource
    DataSet = SmetaDataSet
    Left = 40
    Top = 80
  end
end
