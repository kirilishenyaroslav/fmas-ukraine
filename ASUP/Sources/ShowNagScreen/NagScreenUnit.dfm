object NagScreen: TNagScreen
  Left = 224
  Top = 179
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1059#1087#1088#1072#1074#1083#1110#1085#1085#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1086#1084
  ClientHeight = 73
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 8
    Width = 123
    Height = 13
    Caption = #1047#1072#1088#1072#1079' '#1074#1110#1076#1073#1091#1074#1072#1108#1090#1100#1089#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StatusLabel: TLabel
    Left = 104
    Top = 32
    Width = 329
    Height = 33
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Animate1: TAnimate
    Left = 8
    Top = 16
    Width = 80
    Height = 50
    Active = True
    CommonAVI = aviFindFolder
    StopFrame = 29
  end
end
