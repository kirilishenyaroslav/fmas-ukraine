object frmShablonAdd: TfrmShablonAdd
  Left = 466
  Top = 215
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1096#1072#1073#1083#1086#1085
  ClientHeight = 194
  ClientWidth = 321
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
  object NameEdit: TcxTextEdit
    Left = 16
    Top = 32
    Width = 289
    Height = 21
    Style.Color = clMoneyGreen
    TabOrder = 0
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 16
    Width = 51
    Height = 17
    TabOrder = 1
    Caption = #1053#1072#1079#1074#1072
  end
  object CommentEdit: TcxMemo
    Left = 16
    Top = 72
    Width = 289
    Height = 65
    Style.Color = clMoneyGreen
    TabOrder = 2
  end
  object cxLabel2: TcxLabel
    Left = 16
    Top = 56
    Width = 70
    Height = 17
    TabOrder = 3
    Caption = #1050#1086#1084#1077#1085#1090#1072#1088#1080#1081
  end
  object cxButton1: TcxButton
    Left = 144
    Top = 153
    Width = 75
    Height = 25
    Caption = #1044#1086#1076#1072#1090#1080
    Default = True
    TabOrder = 4
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 224
    Top = 153
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 5
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 16
    Top = 153
    Width = 121
    Height = 25
    Caption = #1044#1086#1076#1072#1090#1080' '#1103#1082' '#1087#1110#1076#1083#1077#1075#1083#1080#1081
    TabOrder = 6
    OnClick = cxButton3Click
  end
end
