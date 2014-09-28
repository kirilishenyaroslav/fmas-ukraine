object frmImportMain: TfrmImportMain
  Left = 317
  Top = 40
  Width = 634
  Height = 647
  Caption = #1030#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1080#1093' '#1079' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1100#1082#1086#1111' '#1089#1080#1089#1090#1077#1084#1080
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 579
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 160
      Top = 496
      Width = 74
      Height = 13
      Caption = 'DocCountLable'
    end
    object CheckRegUch: TcxCheckBox
      Left = 32
      Top = 1
      Width = 209
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1089#1080#1089#1090#1077#1084' => '#1088#1077#1075#1110#1089#1090#1088#1110#1074' '#1086#1073#1083#1110#1082#1091
      TabOrder = 0
    end
    object PrRegUch: TProgressBar
      Left = 40
      Top = 20
      Width = 257
      Height = 16
      TabOrder = 1
    end
    object CheckKEKV: TcxCheckBox
      Left = 32
      Top = 48
      Width = 209
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1082#1086#1076#1110#1074' '#1074#1080#1076#1072#1090#1082#1110#1074
      TabOrder = 2
    end
    object PrKekv: TProgressBar
      Left = 40
      Top = 67
      Width = 257
      Height = 16
      TabOrder = 3
    end
    object CheckProperties: TcxCheckBox
      Left = 328
      Top = 42
      Width = 209
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1074#1083#1072#1089#1090#1080#1074#1086#1089#1090#1077#1081
      TabOrder = 4
    end
    object PrProperties: TProgressBar
      Left = 336
      Top = 66
      Width = 257
      Height = 16
      TabOrder = 5
    end
    object CheckSch: TcxCheckBox
      Left = 32
      Top = 86
      Width = 209
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1088#1072#1093#1091#1085#1082#1110#1074
      TabOrder = 6
    end
    object PrBal: TProgressBar
      Left = 40
      Top = 110
      Width = 257
      Height = 16
      TabOrder = 7
    end
    object CheckOper: TcxCheckBox
      Left = 328
      Top = 86
      Width = 209
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1086#1087#1077#1088#1072#1094#1110#1081
      TabOrder = 8
    end
    object PrOper: TProgressBar
      Left = 336
      Top = 110
      Width = 257
      Height = 16
      TabOrder = 9
    end
    object CheckBudget: TcxCheckBox
      Left = 32
      Top = 138
      Width = 209
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1082#1086#1096#1090#1086#1088#1080#1089#1110#1074
      TabOrder = 10
    end
    object PrBu: TProgressBar
      Left = 40
      Top = 162
      Width = 257
      Height = 16
      TabOrder = 11
    end
    object CheckDocProv: TcxCheckBox
      Left = 32
      Top = 493
      Width = 129
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074
      TabOrder = 12
    end
    object PrDoc: TProgressBar
      Left = 40
      Top = 517
      Width = 585
      Height = 16
      TabOrder = 13
    end
    object CheckBudgetPer: TcxCheckBox
      Left = 32
      Top = 194
      Width = 273
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1087#1077#1088#1110#1086#1076#1110#1074' '#1092#1091#1085#1082#1094#1110#1086#1085#1091#1074#1072#1085#1085#1103' '#1082#1086#1096#1090#1086#1088#1080#1089#1110#1074
      TabOrder = 14
    end
    object PrBuPeriod: TProgressBar
      Left = 40
      Top = 214
      Width = 257
      Height = 16
      TabOrder = 15
    end
    object CheckBuStru: TcxCheckBox
      Left = 32
      Top = 242
      Width = 209
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1089#1090#1088#1091#1082#1090#1091#1088#1080' '#1082#1086#1096#1090#1086#1088#1080#1089#1110#1074
      TabOrder = 16
    end
    object PrBuStru: TProgressBar
      Left = 40
      Top = 262
      Width = 257
      Height = 16
      TabOrder = 17
    end
    object CheckBuDoc: TcxCheckBox
      Left = 33
      Top = 368
      Width = 329
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1087#1083#1072#1085#1086#1074#1080#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074' '#1082#1086#1096#1090#1086#1088#1080#1089#1110#1074
      TabOrder = 18
    end
    object PrBuDoc: TProgressBar
      Left = 40
      Top = 387
      Width = 257
      Height = 16
      Enabled = False
      TabOrder = 19
    end
    object CheckBuPValues: TcxCheckBox
      Left = 32
      Top = 453
      Width = 273
      Height = 21
      Enabled = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1079#1072#1083#1080#1096#1082#1110#1074' '#1082#1086#1096#1090#1086#1088#1080#1089#1110#1074' '#1085#1072' '#1087#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091
      TabOrder = 20
    end
    object PrBuPValues: TProgressBar
      Left = 40
      Top = 472
      Width = 257
      Height = 16
      Enabled = False
      TabOrder = 21
    end
    object CheckBuCalc: TcxCheckBox
      Left = 320
      Top = 449
      Width = 297
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1092#1086#1088#1084#1091#1083' '#1087#1077#1088#1077#1088#1072#1093#1091#1074#1072#1085#1100' '#1087#1086' '#1082#1086#1096#1090#1086#1088#1080#1089#1072#1084
      TabOrder = 22
    end
    object PrBuCalc: TProgressBar
      Left = 324
      Top = 472
      Width = 277
      Height = 16
      TabOrder = 23
    end
    object PrProv: TProgressBar
      Left = 40
      Top = 536
      Width = 585
      Height = 16
      TabOrder = 24
    end
    object CheckRazdSt: TcxCheckBox
      Left = 327
      Top = 1
      Width = 209
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1056#1086#1079#1076#1110#1083#1110#1074'/'#1089#1090#1072#1090#1077#1081
      TabOrder = 25
    end
    object PrRazdSt: TProgressBar
      Left = 334
      Top = 20
      Width = 259
      Height = 16
      TabOrder = 26
    end
    object CheckBuGr: TcxCheckBox
      Left = 32
      Top = 283
      Width = 209
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1075#1088#1091#1087' '#1082#1086#1096#1090#1086#1088#1080#1089#1110#1074
      TabOrder = 27
    end
    object PrBuGr: TProgressBar
      Left = 40
      Top = 303
      Width = 257
      Height = 16
      TabOrder = 28
    end
    object CheckBuPKV: TcxCheckBox
      Left = 336
      Top = 280
      Width = 209
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1087#1088#1086#1075#1088#1072#1084' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      TabOrder = 29
    end
    object PrBuPKV: TProgressBar
      Left = 344
      Top = 300
      Width = 257
      Height = 16
      TabOrder = 30
    end
    object CheckBuFnds: TcxCheckBox
      Left = 32
      Top = 322
      Width = 209
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1075#1088#1091#1087' '#1082#1086#1096#1090#1086#1088#1080#1089#1110#1074' + '#1092#1086#1085#1076#1110#1074
      TabOrder = 31
    end
    object PrBuFnds: TProgressBar
      Left = 40
      Top = 342
      Width = 257
      Height = 16
      TabOrder = 32
    end
    object CheckPkvRsch: TcxCheckBox
      Left = 336
      Top = 321
      Width = 265
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1087#1088#1086#1075#1088#1072#1084' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103' + '#1088#1072#1093#1091#1085#1082#1110#1074
      TabOrder = 33
    end
    object PrPkvRsch: TProgressBar
      Left = 344
      Top = 341
      Width = 257
      Height = 16
      TabOrder = 34
    end
    object CheckBuVal: TcxCheckBox
      Left = 33
      Top = 402
      Width = 272
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1092#1072#1082#1090#1080#1095#1085#1080#1093' '#1087#1086#1082#1072#1079#1085#1080#1082#1110#1074' '#1082#1086#1096#1090#1086#1088#1080#1089#1110#1074
      TabOrder = 35
    end
    object PrBuVal: TProgressBar
      Left = 40
      Top = 421
      Width = 257
      Height = 16
      Enabled = False
      TabOrder = 36
    end
    object CheckBuMVal: TcxCheckBox
      Left = 321
      Top = 402
      Width = 296
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1030#1084#1087#1086#1088#1090' '#1092#1072#1082#1090#1080#1095#1085#1080#1093' '#1087#1086#1082#1072#1079#1085#1080#1082#1110#1074' '#1082#1086#1096#1090#1086#1088#1080#1089#1110#1074'('#1097#1086#1084#1110#1089#1103#1094#1103')'
      TabOrder = 37
    end
    object PrBuMVal: TProgressBar
      Left = 328
      Top = 421
      Width = 257
      Height = 16
      Enabled = False
      TabOrder = 38
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 579
    Width = 626
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 464
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1086#1095#1072#1090#1080
      Enabled = False
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 544
      Top = 8
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 320
      Top = 8
      Width = 137
      Height = 25
      Caption = #1042#1089#1090#1072#1085#1086#1074#1080#1090#1080' '#1082#1086#1085#1085#1077#1082#1090
      TabOrder = 2
      OnClick = cxButton3Click
    end
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 567
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 48
    Top = 567
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 80
    Top = 567
  end
end
