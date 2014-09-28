object Add_Country_Form: TAdd_Country_Form
  Left = 319
  Top = 317
  BorderStyle = bsDialog
  ClientHeight = 67
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object NameTE: TcxTextEdit
    Left = 88
    Top = 7
    Width = 273
    Height = 21
    Properties.CharCase = ecUpperCase
    TabOrder = 0
  end
  object NameLbl: TcxLabel
    Left = 36
    Top = 8
    Width = 51
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Caption = #1050#1088#1072#1111#1085#1072':'
  end
  object AcceptBtn: TcxButton
    Left = 115
    Top = 36
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 2
    OnClick = AcceptActionExecute
  end
  object CancelBtn: TcxButton
    Left = 211
    Top = 36
    Width = 75
    Height = 25
    Action = CancelAction
    TabOrder = 3
  end
  object ActionList: TActionList
    Left = 64
    Top = 32
    object AcceptAction: TAction
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      ShortCut = 121
      OnExecute = AcceptActionExecute
    end
    object CancelAction: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 296
    Top = 32
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 360
    Top = 32
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 328
    Top = 32
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 32
    poSQLINT64ToBCD = True
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Top = 32
  end
end
