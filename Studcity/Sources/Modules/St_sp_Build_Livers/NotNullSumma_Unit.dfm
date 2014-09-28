object frmNotNullSumma: TfrmNotNullSumma
  Left = 545
  Top = 273
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1042#1074#1077#1076#1110#1090#1100' '#1085#1077#1085#1091#1083#1100#1086#1074#1091' '#1089#1091#1084#1091
  ClientHeight = 89
  ClientWidth = 214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 0
    Width = 187
    Height = 26
    Alignment = taCenter
    Caption = #1057#1091#1084#1072', '#1103#1082#1091' '#1073#1091#1083#1086' '#1087#1088#1080#1089#1083#1072#1085#1086' '#1108' '#1085#1091#1083#1100#1086#1074#1086#1102#13#10#1074#1074#1077#1076#1110#1090#1100' '#1085#1077#1085#1091#1083#1100#1086#1074#1091' '#1089#1091#1084#1091
    WordWrap = True
  end
  object cxCurrencyEdit1: TcxCurrencyEdit
    Left = 40
    Top = 29
    Width = 129
    Height = 21
    Properties.DisplayFormat = '0,00 '#1075#1088#1085
    Style.Color = clMoneyGreen
    TabOrder = 0
    OnKeyPress = cxCurrencyEdit1KeyPress
  end
  object cxButton1: TcxButton
    Left = 24
    Top = 58
    Width = 75
    Height = 25
    Caption = #1058#1072#1082
    TabOrder = 1
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 112
    Top = 58
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 2
    OnClick = cxButton2Click
  end
end
