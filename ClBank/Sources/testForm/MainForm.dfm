object frmMainForm: TfrmMainForm
  Left = 211
  Top = 151
  Width = 783
  Height = 540
  Caption = #1057#1080#1089#1090#1077#1084#1072' "'#1050#1083#1080#1077#1085#1090'-'#1073#1072#1085#1082'"'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 224
    Top = 136
    object N1: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1047#1072#1087#1091#1089#1082
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      OnClick = N3Click
    end
    object N5: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = N5Click
    end
    object N21: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' 2'
      OnClick = N21Click
    end
    object N4: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N4Click
    end
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = TransactionRead
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 128
    Top = 96
  end
  object TransactionRead: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 160
    Top = 96
  end
  object TransactionWrite: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 128
    Top = 128
  end
end
