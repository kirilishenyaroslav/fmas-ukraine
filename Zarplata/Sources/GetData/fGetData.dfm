object FZForm: TFZForm
  Left = 207
  Top = 222
  BorderStyle = bsNone
  Caption = 'FZForm'
  ClientHeight = 182
  ClientWidth = 350
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
  object PanelData: TPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 145
    Align = alTop
    BevelOuter = bvLowered
    Caption = #1055#1077#1088#1077#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1073#1091#1092#1077#1088'?'
    Color = 13546423
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object YesBtn: TcxButton
    Left = 192
    Top = 152
    Width = 75
    Height = 25
    Caption = #1058#1072#1082
    TabOrder = 1
    OnClick = YesBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 272
    Top = 152
    Width = 75
    Height = 25
    Caption = #1042#1080#1081#1090#1080
    TabOrder = 2
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object DB: TpFIBDatabase
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 152
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 40
    Top = 152
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = Transaction
    Left = 72
    Top = 152
  end
end
