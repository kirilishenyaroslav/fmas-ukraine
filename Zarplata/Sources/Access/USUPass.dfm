object frmSuperUserPass: TfrmSuperUserPass
  Left = 456
  Top = 453
  BorderStyle = bsDialog
  Caption = #1042#1074#1077#1076#1077#1085#1085#1103' '#1087#1072#1088#1086#1083#1102
  ClientHeight = 92
  ClientWidth = 207
  Color = 13881809
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
    Left = 39
    Top = 6
    Width = 132
    Height = 16
    Caption = 'SuperUser '#1087#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxButton1: TcxButton
    Left = 25
    Top = 55
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 105
    Top = 55
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object PassEdit: TcxTextEdit
    Left = 5
    Top = 28
    Width = 193
    Height = 21
    Properties.EchoMode = eemPassword
    Style.Color = 16776176
    TabOrder = 2
  end
end
