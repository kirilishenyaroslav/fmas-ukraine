object frmGetOrderInfo: TfrmGetOrderInfo
  Left = 370
  Top = 288
  BorderStyle = bsDialog
  Caption = #1042#1074#1077#1076#1110#1090#1100' '#1072#1090#1088#1080#1073#1091#1090#1080' '#1085#1072#1082#1072#1082#1079#1091' '#1076#1083#1103' '#1074#1080#1073#1086#1088#1091
  ClientHeight = 101
  ClientWidth = 325
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
  object lbl1: TLabel
    Left = 41
    Top = 5
    Width = 91
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1077#1082#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 188
    Top = 7
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1088#1086#1077#1082#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnl1: TPanel
    Left = 0
    Top = 60
    Width = 325
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 89
      Top = 10
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 170
      Top = 10
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object cxtxtdtNum: TcxTextEdit
    Left = 37
    Top = 23
    Width = 121
    Height = 21
    Style.Color = clInfoBk
    TabOrder = 1
  end
  object OnDateEx1: TcxDateEdit
    Left = 186
    Top = 22
    Width = 121
    Height = 21
    Style.Color = clInfoBk
    TabOrder = 2
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 59
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 48
    Top = 59
  end
  object ReadDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 80
    Top = 58
    poSQLINT64ToBCD = True
  end
  object cxprprtstr1: TcxPropertiesStore
    Components = <
      item
        Component = cxtxtdtNum
        Properties.Strings = (
          'Text')
      end
      item
        Component = OnDateEx1
        Properties.Strings = (
          'Date')
      end>
    StorageName = 'cxprprtstr1'
    Left = 7
    Top = 6
  end
end
