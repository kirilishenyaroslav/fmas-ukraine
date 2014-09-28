object fmBankServicePereschet: TfmBankServicePereschet
  Left = 328
  Top = 257
  Width = 514
  Height = 191
  Caption = #1060#1086#1088#1084#1072' '#1087#1077#1088#1077#1088#1072#1093#1091#1085#1082#1091' '#1089#1072#1083#1100#1076#1086' '#1079#1072' '#1087#1077#1088#1110#1086#1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    498
    153)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 16
    Width = 480
    Height = 81
    Alignment = alTopLeft
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1077#1088#1077#1089#1095#1077#1090' '#1089#1072#1083#1100#1076#1086
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 16
      Top = 21
      Width = 185
      Height = 17
      AutoSize = False
      TabOrder = 0
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1089#1072#1083#1100#1076#1086' '#1089' '
    end
    object DateBeg: TcxDateEdit
      Left = 201
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object DateEnd: TcxDateEdit
      Left = 345
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object cxLabel2: TcxLabel
      Left = 322
      Top = 23
      Width = 20
      Height = 17
      TabOrder = 3
      Caption = #1087#1086
    end
    object cxLabel3: TcxLabel
      Left = 16
      Top = 47
      Width = 115
      Height = 17
      TabOrder = 4
      Caption = #1041#1072#1083#1072#1085#1089#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082' '
    end
  end
  object ButtonClose: TcxButton
    Left = 336
    Top = 112
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = ButtonCloseClick
  end
  object ButtonEditSch: TcxButtonEdit
    Left = 209
    Top = 61
    Width = 264
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEditSchPropertiesButtonClick
    Style.Color = clWindow
    TabOrder = 2
  end
  object ButtonPereschet: TcxButton
    Left = 135
    Top = 111
    Width = 170
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1087#1077#1088#1077#1089#1095#1077#1090
    TabOrder = 3
    OnClick = ButtonPereschetClick
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=SYSDBA'
      'user_name=masterkey')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 112
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 88
    Top = 112
  end
  object StoredProc: TpFIBStoredProc
    Left = 120
    Top = 112
  end
  object DataSetKOdSys: TpFIBDataSet
    Left = 56
    Top = 112
    poSQLINT64ToBCD = True
  end
end
