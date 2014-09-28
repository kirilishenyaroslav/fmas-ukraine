object FPeoplePrint: TFPeoplePrint
  Left = 428
  Top = 175
  Width = 304
  Height = 139
  Caption = 'Print'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object FioRadioBtn: TcxRadioButton
    Left = 24
    Top = 16
    Width = 113
    Height = 17
    Caption = #1060#1048#1054
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object TinRadioBtn: TcxRadioButton
    Left = 160
    Top = 16
    Width = 113
    Height = 17
    Caption = #1053#1072#1083#1086#1075#1086#1074#1099#1081' '#1085#1086#1084#1077#1088
    TabOrder = 1
  end
  object OkBtn: TcxButton
    Left = 40
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = OkBtnClick
  end
  object CancelBtn: TcxButton
    Left = 176
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = CancelBtnClick
  end
  object TypePaymentRadioBtn: TcxRadioButton
    Left = 24
    Top = 48
    Width = 113
    Height = 17
    Caption = #1058#1080#1087' '#1074#1099#1087#1083#1072#1090#1099
    TabOrder = 4
  end
end
