object frmAUsers: TfrmAUsers
  Left = 272
  Top = 260
  BorderStyle = bsDialog
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1110#1103' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
  ClientHeight = 127
  ClientWidth = 273
  Color = 13881809
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 3
    Width = 112
    Height = 16
    Caption = #1057#1090#1072#1088#1080#1081' '#1087#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 88
    Top = 44
    Width = 105
    Height = 16
    Caption = #1053#1086#1074#1080#1081' '#1087#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LoginEditOld: TcxTextEdit
    Left = 46
    Top = 20
    Width = 193
    Height = 21
    Properties.EchoMode = eemPassword
    Style.Color = 16776176
    TabOrder = 0
  end
  object LoginEditNew: TcxTextEdit
    Left = 46
    Top = 61
    Width = 193
    Height = 21
    Properties.EchoMode = eemPassword
    Style.Color = 16776176
    TabOrder = 1
  end
  object cxButton1: TcxButton
    Left = 64
    Top = 96
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 144
    Top = 96
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = cxButton2Click
  end
end
