object frmGetPriceInfo: TfrmGetPriceInfo
  Left = 515
  Top = 340
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1087#1088#1077#1081#1089#1082#1091#1088#1072#1085#1090#1091
  ClientHeight = 117
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 583
    Height = 76
    Align = alClient
    TabOrder = 0
    object BegLabel: TLabel
      Left = 4
      Top = 48
      Width = 56
      Height = 16
      Caption = #1055#1086#1095#1072#1090#1086#1082
    end
    object EndLabel: TLabel
      Left = 283
      Top = 48
      Width = 74
      Height = 16
      Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
    end
    object NameLabel: TLabel
      Left = 2
      Top = 13
      Width = 98
      Height = 16
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
    end
    object cbMonthBeg: TcxComboBox
      Left = 65
      Top = 43
      Width = 128
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Properties.ReadOnly = False
      TabOrder = 1
    end
    object cbYearBeg: TcxComboBox
      Left = 195
      Top = 43
      Width = 76
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Properties.ReadOnly = False
      TabOrder = 2
    end
    object Name_price: TcxTextEdit
      Left = 105
      Top = 10
      Width = 472
      Height = 24
      TabOrder = 0
    end
    object cbMonthEnd: TcxComboBox
      Left = 369
      Top = 43
      Width = 128
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Properties.ReadOnly = False
      TabOrder = 3
    end
    object cbYearEnd: TcxComboBox
      Left = 499
      Top = 43
      Width = 76
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Properties.ReadOnly = False
      TabOrder = 4
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 76
    Width = 583
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Ok_button: TcxButton
      Left = 120
      Top = 8
      Width = 120
      Height = 25
      Action = Ok_act
      TabOrder = 0
    end
    object Cancel_button: TcxButton
      Left = 352
      Top = 8
      Width = 120
      Height = 25
      Action = Cancel_act
      TabOrder = 1
    end
  end
  object ActionList1: TActionList
    Left = 288
    Top = 42
    object Ok_act: TAction
      Caption = 'Ok_act'
      ShortCut = 13
      OnExecute = Ok_actExecute
    end
    object Cancel_act: TAction
      Caption = 'Cancel_act'
      ShortCut = 27
      OnExecute = Cancel_actExecute
    end
  end
end
