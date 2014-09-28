object FormPageMargin: TFormPageMargin
  Left = 380
  Top = 266
  Width = 200
  Height = 264
  Caption = #1055#1086#1083#1103' '#1089#1090#1086#1088#1110#1085#1082#1080
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
  object cxButton1: TcxButton
    Left = 16
    Top = 192
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 104
    Top = 192
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 177
    Height = 169
    Alignment = alTopLeft
    Caption = #1055#1086#1083#1103
    TabOrder = 2
    object Label1: TLabel
      Left = 17
      Top = 24
      Width = 30
      Height = 13
      Caption = #1047#1083#1110#1074#1072':'
    end
    object Label5: TLabel
      Left = 17
      Top = 56
      Width = 38
      Height = 13
      Caption = #1047#1074#1077#1088#1093#1091':'
    end
    object Label6: TLabel
      Left = 17
      Top = 88
      Width = 40
      Height = 13
      Caption = #1057#1087#1088#1072#1074#1072':'
    end
    object Label7: TLabel
      Left = 17
      Top = 120
      Width = 33
      Height = 13
      Caption = #1047#1085#1080#1079#1091':'
    end
    object cbForceMargin: TCheckBox
      Left = 16
      Top = 144
      Width = 113
      Height = 17
      Caption = #1060#1086#1088#1089#1091#1074#1072#1090#1080' '#1087#1086#1083#1103
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object rsLeft: TcxSpinEdit
      Left = 80
      Top = 16
      Width = 55
      Height = 21
      Properties.Increment = 0.100000000000000000
      Properties.ValueType = vtFloat
      TabOrder = 1
    end
    object rsTop: TcxSpinEdit
      Left = 80
      Top = 48
      Width = 55
      Height = 21
      Properties.Increment = 0.100000000000000000
      Properties.ValueType = vtFloat
      TabOrder = 2
    end
    object rsRight: TcxSpinEdit
      Left = 80
      Top = 80
      Width = 55
      Height = 21
      Properties.Increment = 0.100000000000000000
      Properties.ValueType = vtFloat
      TabOrder = 3
    end
    object rsBottom: TcxSpinEdit
      Left = 80
      Top = 112
      Width = 55
      Height = 21
      Properties.Increment = 0.100000000000000000
      Properties.ValueType = vtFloat
      TabOrder = 4
    end
  end
end
