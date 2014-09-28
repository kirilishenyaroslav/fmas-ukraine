object fmAddForm: TfmAddForm
  Left = 541
  Top = 373
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080' '#1085#1086#1074#1080#1081' '#1088#1077#1108#1089#1090#1088
  ClientHeight = 189
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 114
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1088#1077#1108#1089#1090#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 128
    Top = 64
    Width = 11
    Height = 16
    Caption = #1047
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 120
    Top = 96
    Width = 21
    Height = 16
    Caption = #1055#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxNumReestr: TcxTextEdit
    Left = 152
    Top = 32
    Width = 137
    Height = 21
    TabOrder = 0
  end
  object cxButton1: TcxButton
    Left = 88
    Top = 144
    Width = 75
    Height = 25
    Caption = #1054#1050
    Default = True
    TabOrder = 1
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 184
    Top = 144
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 2
    OnClick = cxButton2Click
  end
  object cxDateBeg: TcxDateEdit
    Left = 152
    Top = 64
    Width = 121
    Height = 21
    Properties.ShowTime = False
    TabOrder = 3
  end
  object cxDateEnd: TcxDateEdit
    Left = 152
    Top = 96
    Width = 121
    Height = 21
    Properties.ShowTime = False
    TabOrder = 4
  end
end
