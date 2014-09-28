object frmType_Kat_AE: TfrmType_Kat_AE
  Left = 505
  Top = 263
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1090#1080#1087' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
  ClientHeight = 144
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OKButton: TcxButton
    Left = 144
    Top = 112
    Width = 83
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 232
    Top = 112
    Width = 81
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 305
    Height = 97
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object ShortEdit: TcxTextEdit
      Left = 8
      Top = 64
      Width = 153
      Height = 21
      BeepOnEnter = False
      Properties.MaxLength = 20
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = ShortEditKeyPress
    end
    object ShortNameLabel: TcxLabel
      Left = 8
      Top = 48
      Width = 72
      Height = 17
      TabStop = False
      TabOrder = 3
      Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
    end
    object NameLabel: TcxLabel
      Left = 8
      Top = 8
      Width = 84
      Height = 17
      TabStop = False
      TabOrder = 4
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object NameEdit: TcxTextEdit
      Left = 8
      Top = 24
      Width = 289
      Height = 21
      BeepOnEnter = False
      Properties.MaxLength = 45
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = NameEditKeyPress
    end
    object MonthOplCheck: TcxCheckBox
      Left = 168
      Top = 64
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.ReadOnly = False
      Properties.Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086#1084#1077#1089#1103#1095#1085#1086
      Style.BorderStyle = ebsUltraFlat
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      TabOrder = 2
    end
  end
end
