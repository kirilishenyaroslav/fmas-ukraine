object fltReeUrzb: TfltReeUrzb
  Left = 673
  Top = 326
  BorderStyle = bsDialog
  Caption = #1060#1110#1083#1100#1090#1088' '#1085#1072' '#1102#1088#1080#1076#1080#1095#1085#1110' '#1079#1086#1073#1086#1074#39#1103#1079#1072#1085#1085#1103
  ClientHeight = 215
  ClientWidth = 485
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TcxButton
    Left = 160
    Top = 184
    Width = 113
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080' '#1092#1110#1083#1100#1090#1088
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object DelButton: TcxButton
    Left = 280
    Top = 184
    Width = 113
    Height = 25
    Caption = #1057#1082#1072#1089#1091#1074#1072#1090#1080' '#1092#1110#1083#1100#1090#1088
    TabOrder = 1
    OnClick = DelButtonClick
  end
  object RollButton: TcxButton
    Left = 400
    Top = 184
    Width = 83
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 2
    OnClick = RollButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 481
    Height = 177
    Alignment = alTopLeft
    TabOrder = 3
    object cxCheckDateRee: TcxCheckBox
      Left = 8
      Top = 8
      Width = 169
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1077#1088#1110#1086#1076' '#1088#1077#1108#1089#1090#1088#1091' '#1079'           '#1087#1086
      TabOrder = 0
      OnClick = cxCheckDateReeClick
    end
    object cxDateEdit1: TcxDateEdit
      Left = 8
      Top = 32
      Width = 89
      Height = 21
      Enabled = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object cxDateEdit2: TcxDateEdit
      Left = 144
      Top = 32
      Width = 89
      Height = 21
      Enabled = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clMoneyGreen
      TabOrder = 2
    end
    object cxCheckSumRee: TcxCheckBox
      Left = 256
      Top = 8
      Width = 217
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1057#1091#1084#1072' '#1088#1077#1108#1089#1090#1088#1091' '#1074#1110#1076'        '#1076#1086
      TabOrder = 3
      OnClick = cxCheckSumReeClick
    end
    object cxCurrencyEditSumRee1: TcxCurrencyEdit
      Left = 256
      Top = 32
      Width = 89
      Height = 21
      Enabled = False
      Properties.DisplayFormat = ',0.00;-,0.00'
      Style.Color = clMoneyGreen
      TabOrder = 4
    end
    object cxCurrencyEditSumRee2: TcxCurrencyEdit
      Left = 376
      Top = 32
      Width = 97
      Height = 21
      Enabled = False
      Properties.DisplayFormat = ',0.00;-,0.00'
      Style.Color = clMoneyGreen
      TabOrder = 5
    end
    object cxCheckRegNum: TcxCheckBox
      Left = 8
      Top = 64
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1053#1086#1084#1077#1088' '#1088#1077#1108#1089#1090#1088#1091
      TabOrder = 6
      OnClick = cxCheckRegNumClick
    end
    object cxTextEditNumRee: TcxTextEdit
      Left = 8
      Top = 88
      Width = 121
      Height = 21
      Enabled = False
      Style.Color = clMoneyGreen
      TabOrder = 7
    end
    object cxCheckNumDog: TcxCheckBox
      Left = 144
      Top = 64
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1091
      TabOrder = 8
      OnClick = cxCheckNumDogClick
    end
    object cxTextEditNumDog: TcxTextEdit
      Left = 144
      Top = 88
      Width = 121
      Height = 21
      Enabled = False
      Style.Color = clMoneyGreen
      TabOrder = 9
    end
    object cxCheckReeNumDog: TcxCheckBox
      Left = 8
      Top = 120
      Width = 169
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1056#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1080#1081' '#8470' '#1076#1086#1075#1086#1074#1086#1088#1091
      TabOrder = 10
      OnClick = cxCheckReeNumDogClick
    end
    object cxTextEditDogReeNum: TcxTextEdit
      Left = 8
      Top = 140
      Width = 161
      Height = 21
      Enabled = False
      Style.Color = clMoneyGreen
      TabOrder = 11
    end
    object cxCheckDogSum: TcxCheckBox
      Left = 256
      Top = 120
      Width = 209
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1057#1091#1084#1072' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1074#1110#1076'      '#1076#1086
      TabOrder = 12
      OnClick = cxCheckDogSumClick
    end
    object cxTextCurrencyDogSum1: TcxCurrencyEdit
      Left = 256
      Top = 144
      Width = 89
      Height = 21
      Enabled = False
      Properties.DisplayFormat = ',0.00;-,0.00'
      Style.Color = clMoneyGreen
      TabOrder = 13
    end
    object cxTextCurrencyDogSum2: TcxCurrencyEdit
      Left = 384
      Top = 144
      Width = 89
      Height = 21
      Enabled = False
      Properties.DisplayFormat = ',0.00;-,0.00'
      Style.Color = clMoneyGreen
      TabOrder = 14
    end
  end
  object ActionList1: TActionList
    Left = 8
    Top = 184
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = fltExecute
    end
    object act1: TAction
      Caption = 'act1'
      ShortCut = 27
      OnExecute = closeExecute
    end
  end
end
