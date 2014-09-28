object TypeFavAdd: TTypeFavAdd
  Left = 385
  Top = 271
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TypeFavAdd'
  ClientHeight = 215
  ClientWidth = 228
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
    Width = 227
    Height = 218
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 133
      Height = 26
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
    object Label3: TLabel
      Left = 8
      Top = 88
      Width = 128
      Height = 13
      Caption = #1060#1086#1088#1084#1072' '#1086#1073#1088#1086#1073#1082#1080' '#1087#1086#1089#1083#1091#1075#1080':'
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
      TabOrder = 0
    end
    object NameEditShort: TcxTextEdit
      Left = 8
      Top = 64
      Width = 209
      Height = 21
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object cxButton2: TcxButton
      Left = 64
      Top = 192
      Width = 75
      Height = 20
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      TabOrder = 3
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 144
      Top = 192
      Width = 75
      Height = 20
      Caption = #1042#1110#1076#1084#1110#1085#1072
      ModalResult = 2
      TabOrder = 4
    end
    object cxCheckBox3: TcxCheckBox
      Left = 8
      Top = 124
      Width = 217
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.ReadOnly = False
      Properties.Caption = #1052#1086#1078#1083#1080#1074#1086' '#1088#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1089#1091#1084#1084#1091
      TabOrder = 2
    end
    object NdsBox: TcxCheckBox
      Left = 8
      Top = 140
      Width = 217
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.ReadOnly = False
      Properties.Caption = #1044#1086#1076#1072#1074#1072#1090#1080' '#1055#1044#1042
      TabOrder = 5
    end
    object DblNdsBox: TcxCheckBox
      Left = 8
      Top = 156
      Width = 217
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.ReadOnly = False
      Properties.Caption = #1044#1086#1076#1072#1074#1072#1090#1080' '#1087#1086#1076#1074#1086#1108#1085#1080#1081' '#1055#1044#1042
      TabOrder = 6
    end
    object FormBox: TcxComboBox
      Left = 8
      Top = 104
      Width = 209
      Height = 21
      Style.Color = clMoneyGreen
      TabOrder = 7
    end
    object TarBox: TcxCheckBox
      Left = 8
      Top = 172
      Width = 217
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.ReadOnly = False
      Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1090#1072#1088#1080#1092
      TabOrder = 8
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
    Left = 272
    Top = 168
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = MainDB
    TimeoutAction = TARollback
    Left = 272
    Top = 8
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Database = MainDB
    Transaction = pFIBTransaction1
    Left = 272
    Top = 136
  end
  object ActionList1: TActionList
    Left = 272
    Top = 39
    object Action1: TAction
      Caption = 'Esc'
      ShortCut = 27
    end
  end
  object SaveProc: TpFIBStoredProc
    Database = MainDB
    Transaction = pFIBTransaction2
    Left = 272
    Top = 72
  end
  object pFIBTransaction2: TpFIBTransaction
    DefaultDatabase = MainDB
    TimeoutAction = TARollback
    Left = 272
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
  object pFIBQuery1: TpFIBQuery
    Database = MainDB
    Transaction = pFIBTransaction1
    Left = 328
    Top = 40
  end
end
