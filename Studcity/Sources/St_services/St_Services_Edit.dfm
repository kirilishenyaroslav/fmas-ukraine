object frmServiceEdit: TfrmServiceEdit
  Left = 471
  Top = 274
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1087#1086#1089#1083#1091#1075#1086#1102
  ClientHeight = 125
  ClientWidth = 248
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 118
    Height = 13
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1087#1086#1089#1083#1091#1075#1080
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 72
    Height = 13
    Caption = #1064#1080#1092#1088' '#1087#1086#1089#1083#1091#1075#1080
  end
  object cxTextEdit1: TcxTextEdit
    Left = 8
    Top = 21
    Width = 233
    Height = 21
    Properties.MaxLength = 255
    TabOrder = 0
  end
  object cxTextEdit2: TcxTextEdit
    Left = 8
    Top = 64
    Width = 233
    Height = 21
    TabOrder = 1
  end
  object cxButton1: TcxButton
    Left = 72
    Top = 96
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 168
    Top = 96
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = cxButton2Click
  end
end
