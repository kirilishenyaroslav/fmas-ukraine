object FFilterStFond: TFFilterStFond
  Left = 741
  Top = 580
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 84
  ClientWidth = 202
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 8
    Top = 55
    Width = 89
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 112
    Top = 55
    Width = 83
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object EditDateBeg: TcxDateEdit
    Left = 8
    Top = 28
    Width = 185
    Height = 21
    ImeMode = imHanguel
    Properties.DateButtons = [btnToday]
    Properties.InputKind = ikMask
    Properties.MaxDate = 55153.000000000000000000
    Properties.MinDate = 36526.000000000000000000
    TabOrder = 2
    EditValue = 38353d
  end
  object cxLabel1: TcxLabel
    Left = 6
    Top = 8
    Width = 50
    Height = 17
    TabOrder = 3
    Caption = #1053#1072' '#1076#1072#1090#1091':'
  end
end
