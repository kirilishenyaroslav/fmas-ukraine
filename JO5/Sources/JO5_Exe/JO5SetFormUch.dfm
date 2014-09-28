object frmSetFormUch: TfrmSetFormUch
  Left = 425
  Top = 374
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1042#1080#1073#1077#1088#1110#1090#1100' '#1092#1086#1088#1084#1091' '#1086#1073#1083#1110#1082#1091
  ClientHeight = 135
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ItemsListBox: TListBox
    Left = 0
    Top = 0
    Width = 382
    Height = 94
    Align = alClient
    BevelInner = bvLowered
    BevelKind = bkFlat
    Color = 16776176
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
    OnDblClick = cxButton1Click
    OnKeyDown = ItemsListBoxKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 94
    Width = 382
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 219
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 299
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 48
    Top = 8
  end
  object FormUchDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 80
    Top = 8
    poSQLINT64ToBCD = True
  end
  object FormUchDataSource: TDataSource
    DataSet = FormUchDataSet
    Left = 112
    Top = 8
  end
end
