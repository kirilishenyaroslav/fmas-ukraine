object Add_Street_Form: TAdd_Street_Form
  Left = 319
  Top = 150
  BorderStyle = bsDialog
  ClientHeight = 114
  ClientWidth = 391
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
    Left = 32
    Top = 8
    Width = 55
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
    Caption = #1042#1091#1083#1080#1094#1103':'
  end
  object AcceptBtn: TcxButton
    Left = 115
    Top = 84
    Width = 75
    Height = 25
    Action = AcceptAction
    TabOrder = 2
  end
  object CancelBtn: TcxButton
    Left = 211
    Top = 84
    Width = 75
    Height = 25
    Action = CancelAction
    TabOrder = 3
  end
  object cxLabel1: TcxLabel
    Left = 0
    Top = 32
    Width = 87
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
    TabOrder = 4
    Caption = #1058#1080#1087':'
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 56
    Width = 79
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
    TabOrder = 5
    Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090':'
  end
  object TypeBE: TcxButtonEdit
    Left = 88
    Top = 32
    Width = 273
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = TypeBEPropertiesButtonClick
    TabOrder = 6
  end
  object PlaceBE: TcxButtonEdit
    Left = 88
    Top = 56
    Width = 273
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = PlaceBEPropertiesButtonClick
    TabOrder = 7
  end
  object ActionList: TActionList
    Left = 64
    Top = 80
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
    DBName = 'D:\Yatsishin\FILES\DB\FULL_DB.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=win1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 296
    Top = 80
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 360
    Top = 80
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 328
    Top = 80
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 80
    poSQLINT64ToBCD = True
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Top = 80
  end
end
