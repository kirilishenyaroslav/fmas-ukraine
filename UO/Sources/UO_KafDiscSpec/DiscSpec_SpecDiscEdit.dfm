object fSpecDiscEdit: TfSpecDiscEdit
  Left = 258
  Top = 289
  Width = 377
  Height = 132
  BorderIcons = [biSystemMenu]
  Caption = 'fSpecDiscEdit'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object SpecLabel: TcxLabel
    Left = 16
    Top = 22
    Width = 97
    Height = 17
    AutoSize = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    TabOrder = 0
    Caption = #1057#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100
  end
  object SpecBE: TcxButtonEdit
    Left = 120
    Top = 20
    Width = 241
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = SpecBEPropertiesButtonClick
    TabOrder = 1
  end
  object DiscLabel: TcxLabel
    Left = 16
    Top = 46
    Width = 97
    Height = 17
    AutoSize = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    TabOrder = 2
    Caption = #1044#1080#1089#1094#1080#1087#1083#1110#1085#1072
  end
  object DiscBE: TcxButtonEdit
    Left = 120
    Top = 44
    Width = 241
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = DiscBEPropertiesButtonClick
    TabOrder = 3
  end
  object OkButton: TcxButton
    Left = 155
    Top = 75
    Width = 97
    Height = 25
    Action = OkAction
    TabOrder = 4
  end
  object CancelButton: TcxButton
    Left = 263
    Top = 75
    Width = 97
    Height = 25
    Action = CancelAction
    TabOrder = 5
  end
  object ActionList1: TActionList
    Left = 16
    Top = 56
    object OkAction: TAction
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      ShortCut = 121
      OnExecute = OkActionExecute
    end
    object CancelAction: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
  object DB: TpFIBDatabase
    DBName = 'D:\Yatsishin\FILES\DB\UO_FULL_DB_POLTAVA.FDB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 240
    Top = 8
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 240
    Top = 40
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 272
    Top = 40
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 304
    Top = 40
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    Left = 208
    Top = 40
    poSQLINT64ToBCD = True
  end
end
