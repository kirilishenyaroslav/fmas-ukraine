object frmRepDate: TfrmRepDate
  Left = 735
  Top = 251
  BorderStyle = bsDialog
  Caption = #1058#1077#1088#1084#1110#1085
  ClientHeight = 112
  ClientWidth = 266
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
  object DateBegEdit: TcxDateEdit
    Left = 0
    Top = 32
    Width = 121
    Height = 21
    Properties.ShowTime = False
    Style.Color = clMoneyGreen
    TabOrder = 0
  end
  object DateEndEdit: TcxDateEdit
    Left = 136
    Top = 32
    Width = 121
    Height = 21
    Properties.ShowTime = False
    Style.Color = clMoneyGreen
    TabOrder = 1
  end
  object cxLabel1: TcxLabel
    Left = 0
    Top = 16
    Width = 15
    Height = 17
    TabOrder = 2
    Caption = #1047
  end
  object cxLabel2: TcxLabel
    Left = 136
    Top = 16
    Width = 22
    Height = 17
    TabOrder = 3
    Caption = #1055#1086
  end
  object cxButton1: TcxButton
    Left = 48
    Top = 72
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    Default = True
    TabOrder = 4
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 128
    Top = 72
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 5
    OnClick = cxButton2Click
  end
end
