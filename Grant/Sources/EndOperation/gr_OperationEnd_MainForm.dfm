object FgrOperationEnd: TFgrOperationEnd
  Left = 319
  Top = 136
  BorderStyle = bsSingle
  Caption = #1047#1072#1074#1077#1088#1096#1077#1085#1085#1103' '#1086#1087#1077#1088#1072#1094#1110#1111
  ClientHeight = 68
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox: TcxGroupBox
    Left = 1
    Top = 26
    Width = 568
    Height = 41
    Alignment = alTopLeft
    TabOrder = 0
    object SaveBtn: TcxButton
      Left = 151
      Top = 10
      Width = 84
      Height = 25
      Caption = 'SaveBtn'
      TabOrder = 0
      OnClick = SaveBtnClick
      LookAndFeel.Kind = lfFlat
    end
    object DelBtn: TcxButton
      Left = 255
      Top = 10
      Width = 84
      Height = 25
      Caption = 'DelBtn'
      TabOrder = 1
      OnClick = DelBtnClick
      LookAndFeel.Kind = lfFlat
    end
    object CancelBtn: TcxButton
      Left = 359
      Top = 10
      Width = 84
      Height = 25
      Caption = 'CancelBtn'
      TabOrder = 2
      OnClick = CancelBtnClick
      LookAndFeel.Kind = lfFlat
    end
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 7
    Width = 0
    Height = 4
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clRed
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Caption = ''
  end
  object DB: TpFIBDatabase
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 80
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'wait'
      'no_rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 168
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 208
  end
end
