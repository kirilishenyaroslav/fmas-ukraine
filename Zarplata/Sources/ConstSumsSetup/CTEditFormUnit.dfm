object CTEditForm: TCTEditForm
  Left = 490
  Top = 418
  BorderStyle = bsDialog
  Caption = 'CTEditForm'
  ClientHeight = 69
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ConstTypeEdit: TcxTextEdit
    Left = 6
    Top = 8
    Width = 360
    Height = 21
    TabOrder = 0
  end
  object cxButton1: TcxButton
    Left = 200
    Top = 38
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    TabOrder = 1
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 90
    Top = 38
    Width = 90
    Height = 25
    Caption = #1047#1073#1077#1088#1077#1075#1090#1080
    ModalResult = 6
    TabOrder = 2
    OnClick = cxButton2Click
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 184
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = DefaultTransaction
    Left = 216
    Top = 65535
  end
  object DB: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 248
    Top = 65534
  end
end
