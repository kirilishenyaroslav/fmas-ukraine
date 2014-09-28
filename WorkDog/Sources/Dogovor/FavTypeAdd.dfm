object TypeFavAdd: TTypeFavAdd
  Left = 319
  Top = 366
  BorderStyle = bsSingle
  Caption = 'TypeFavAdd'
  ClientHeight = 153
  ClientWidth = 224
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = -4
    Width = 225
    Height = 157
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 133
      Height = 17
      Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1072' '#1085#1072#1079#1074#1072' '#1087#1086#1089#1083#1091#1075#1080':'#13#10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 137
      Height = 13
      Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072' '#1090#1080#1087#1072' '#1087#1086#1089#1083#1091#1075#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object NameEditFull: TcxTextEdit
      Left = 8
      Top = 24
      Width = 209
      Height = 21
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object NameEditShort: TcxTextEdit
      Left = 8
      Top = 64
      Width = 209
      Height = 21
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 56
      Top = 128
      Width = 75
      Height = 20
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      ModalResult = 1
      TabOrder = 4
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 136
      Top = 128
      Width = 75
      Height = 20
      Caption = #1042#1110#1076#1084#1110#1085#1072
      ModalResult = 2
      TabOrder = 5
    end
    object cxCheckBox1: TcxCheckBox
      Left = 8
      Top = 100
      Width = 217
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.ReadOnly = False
      Properties.Caption = #1056#1086#1079#1088#1072#1093#1086#1074#1091#1108#1090#1089#1103' '#1085#1072' '#1073#1072#1079#1110' '#1083#1110#1095#1080#1083#1100#1085#1080#1082#1110#1074
      TabOrder = 3
    end
    object cxCheckBox2: TcxCheckBox
      Left = 8
      Top = 84
      Width = 217
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.ReadOnly = False
      Properties.Caption = #1060#1110#1082#1089#1086#1074#1072#1085#1072' '#1087#1083#1072#1090#1072' '#1079#1072' '#1084#1110#1089#1103#1094#1100
      TabOrder = 2
    end
  end
  object MainDB: TpFIBDatabase
    DBName = 'E:\HAI_ARND\Base\FULL_DB.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = pFIBTransaction1
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 232
    Top = 168
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = MainDB
    TimeoutAction = TARollback
    Left = 232
    Top = 8
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Database = MainDB
    Transaction = pFIBTransaction1
    Left = 232
    Top = 136
  end
  object ActionList1: TActionList
    Left = 232
    Top = 39
    object Action1: TAction
      Caption = 'Esc'
      ShortCut = 27
    end
  end
  object SaveProc: TpFIBStoredProc
    Database = MainDB
    Transaction = pFIBTransaction2
    Left = 232
    Top = 72
  end
  object pFIBTransaction2: TpFIBTransaction
    DefaultDatabase = MainDB
    TimeoutAction = TARollback
    Left = 232
    Top = 104
  end
  object ActionList2: TActionList
    Left = 328
    Top = 8
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 27
      OnExecute = Action2Execute
    end
  end
end
