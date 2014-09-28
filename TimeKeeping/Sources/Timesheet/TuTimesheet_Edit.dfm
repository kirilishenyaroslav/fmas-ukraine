object FormEditTsh: TFormEditTsh
  Left = 638
  Top = 426
  BorderStyle = bsDialog
  Caption = #1060#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1090#1072#1073#1077#1083#1103
  ClientHeight = 159
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 128
    Width = 325
    Height = 31
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 163
      Top = 3
      Width = 75
      Height = 25
      Action = ActionYes
      Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 243
      Top = 3
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
    end
  end
  object GroupBox: TcxGroupBox
    Left = 0
    Top = 65
    Width = 321
    Height = 62
    Alignment = alTopLeft
    TabOrder = 1
    object RadioButtonTemplet: TcxRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = #1055#1086' '#1096#1072#1073#1083#1086#1085#1091
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButtonDog: TcxRadioButton
      Left = 120
      Top = 16
      Width = 113
      Height = 17
      Caption = #1055#1086' '#1076#1086#1075#1086#1074#1086#1088#1091
      TabOrder = 1
    end
    object EditTemOrDog: TcxButtonEdit
      Left = 9
      Top = 32
      Width = 296
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = EditTemOrDogPropertiesButtonClick
      TabOrder = 2
    end
  end
  object GroupBoxPeriod: TcxGroupBox
    Left = 0
    Top = 0
    Width = 321
    Height = 65
    Alignment = alTopLeft
    Caption = #1055#1077#1088#1110#1086#1076
    TabOrder = 2
    object Label1: TLabel
      Left = 9
      Top = 18
      Width = 18
      Height = 13
      Caption = #1056#1110#1082':'
    end
    object Label2: TLabel
      Left = 121
      Top = 18
      Width = 38
      Height = 13
      Caption = #1052#1110#1089#1103#1094#1100':'
    end
    object Label3: TLabel
      Left = 65
      Top = 42
      Width = 6
      Height = 13
      Caption = #1089
    end
    object Label4: TLabel
      Left = 161
      Top = 42
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object EditYear: TcxSpinEdit
      Left = 32
      Top = 14
      Width = 57
      Height = 21
      TabOrder = 0
    end
    object EditMonth: TcxComboBox
      Left = 160
      Top = 14
      Width = 137
      Height = 21
      TabOrder = 1
    end
    object EditFrom: TcxSpinEdit
      Left = 80
      Top = 40
      Width = 49
      Height = 21
      Properties.MaxValue = 1.000000000000000000
      Properties.MinValue = 1.000000000000000000
      TabOrder = 2
      Value = 1
    end
    object EditTo: TcxSpinEdit
      Left = 184
      Top = 40
      Width = 49
      Height = 21
      TabOrder = 3
      Value = 30
    end
  end
  object ActionList: TActionList
    Left = 44
    Top = 112
    object ActionYes: TAction
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 13
      OnExecute = ActionYesExecute
    end
    object ActionCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
end
