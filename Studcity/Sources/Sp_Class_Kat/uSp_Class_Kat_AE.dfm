object frmClass_Kat_AE: TfrmClass_Kat_AE
  Left = 661
  Top = 311
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1083#1072#1089#1089' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
  ClientHeight = 144
  ClientWidth = 326
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
    Left = 160
    Top = 112
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 240
    Top = 112
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 305
    Height = 97
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object NameLabel: TcxLabel
      Left = 8
      Top = 8
      Width = 84
      Height = 17
      TabOrder = 0
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
      TabOrder = 1
      OnKeyPress = NameEditKeyPress
    end
    object PeopleLabel: TcxLabel
      Left = 8
      Top = 48
      Width = 77
      Height = 17
      TabOrder = 2
      Caption = #1050#1086#1083'-'#1074#1086' '#1083#1102#1076#1077#1081
    end
    object PlaceLabel: TcxLabel
      Left = 168
      Top = 48
      Width = 70
      Height = 17
      TabOrder = 3
      Caption = #1050#1086#1083'-'#1074#1086' '#1084#1077#1089#1090
    end
    object PeopleEdit: TcxCurrencyEdit
      Left = 8
      Top = 64
      Width = 121
      Height = 21
      Properties.DisplayFormat = '0'
      Style.Color = clInfoBk
      TabOrder = 4
    end
    object PlaceEdit: TcxCurrencyEdit
      Left = 168
      Top = 64
      Width = 121
      Height = 21
      Properties.DisplayFormat = '0'
      Style.Color = clInfoBk
      TabOrder = 5
    end
  end
end
