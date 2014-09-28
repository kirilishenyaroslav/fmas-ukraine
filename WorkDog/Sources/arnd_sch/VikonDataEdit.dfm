object VikonEdit: TVikonEdit
  Left = 889
  Top = 766
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103
  ClientHeight = 203
  ClientWidth = 383
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 2
    Top = 2
    Width = 375
    Height = 167
    Brush.Style = bsClear
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 140
    Height = 13
    Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1074#1080#1082#1086#1085#1072#1074#1094#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 120
    Width = 133
    Height = 13
    Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1076#1072#1090#1091' '#1072#1082#1090#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DateBeg: TcxDateEdit
    Left = 8
    Top = 136
    Width = 89
    Height = 21
    Style.Color = clMoneyGreen
    TabOrder = 0
  end
  object ApplyButton: TcxButton
    Left = 217
    Top = 175
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    ModalResult = 1
    TabOrder = 1
    OnClick = ApplyButtonClick
  end
  object CancelButton: TcxButton
    Left = 294
    Top = 175
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    TabOrder = 2
  end
  object cxButton1: TcxButton
    Left = 140
    Top = 175
    Width = 75
    Height = 25
    Caption = #1047#1073#1077#1088#1077#1075#1090#1080
    ModalResult = 8
    TabOrder = 3
    OnClick = cxButton1Click
  end
  object OldEdit: TcxMemo
    Left = 8
    Top = 24
    Width = 361
    Height = 89
    TabOrder = 4
  end
end
