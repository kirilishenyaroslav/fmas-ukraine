object frmSetPeriod: TfrmSetPeriod
  Left = 324
  Top = 352
  Width = 383
  Height = 144
  Caption = #1057#1074#1086#1081#1089#1090#1074#1086' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1085#1072' '#1087#1077#1088#1080#1086#1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCanResize = FormCanResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 129
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 129
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
  end
  object Button1: TButton
    Left = 200
    Top = 82
    Width = 82
    Height = 25
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 286
    Top = 82
    Width = 81
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object cbMonthBeg: TComboBox
    Left = 150
    Top = 8
    Width = 130
    Height = 22
    Style = csOwnerDrawFixed
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 2
  end
  object cbYearBeg: TComboBox
    Left = 280
    Top = 8
    Width = 88
    Height = 22
    Style = csOwnerDrawFixed
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 3
  end
  object cbMonthEnd: TComboBox
    Left = 150
    Top = 38
    Width = 130
    Height = 22
    Style = csOwnerDrawFixed
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 4
  end
  object cbYearEnd: TComboBox
    Left = 280
    Top = 38
    Width = 88
    Height = 22
    Style = csOwnerDrawFixed
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 5
  end
end
