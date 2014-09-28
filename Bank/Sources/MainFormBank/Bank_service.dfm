object fmBankService: TfmBankService
  Left = 277
  Top = 145
  Width = 578
  Height = 379
  Caption = #1057#1077#1088#1074#1080#1089
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    570
    345)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 16
    Width = 553
    Height = 105
    Alignment = alTopLeft
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1077#1088#1077#1089#1095#1077#1090' '#1089#1072#1083#1100#1076#1086
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 16
      Top = 16
      Width = 124
      Height = 17
      TabOrder = 0
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1089#1072#1083#1100#1076#1086' '#1089' '
    end
    object cxDateEdit1: TcxDateEdit
      Left = 144
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object cxButton1: TcxButton
      Left = 287
      Top = 71
      Width = 170
      Height = 25
      Caption = #1053#1072#1095#1072#1090#1100' '#1087#1077#1088#1077#1089#1095#1077#1090
      TabOrder = 2
      OnClick = cxButton1Click
    end
    object cxDateEdit2: TcxDateEdit
      Left = 288
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object cxLabel2: TcxLabel
      Left = 265
      Top = 18
      Width = 20
      Height = 17
      TabOrder = 4
      Caption = #1087#1086
    end
    object cxTextEdit1: TcxTextEdit
      Left = 144
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object cxCheckBox1: TcxCheckBox
      Left = 72
      Top = 40
      Width = 65
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1087#1086' '#1088'/'#1089
      TabOrder = 6
    end
  end
  object cxButton2: TcxButton
    Left = 440
    Top = 280
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=SYSDBA'
      'user_name=masterkey')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 72
    Top = 80
  end
  object DataSet: TpFIBDataSet
    Left = 112
    Top = 80
    poSQLINT64ToBCD = True
  end
  object Transaction: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 152
    Top = 80
  end
  object StoredProc: TpFIBStoredProc
    Left = 184
    Top = 80
  end
end
