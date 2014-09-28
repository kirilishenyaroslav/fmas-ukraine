object Substate_Add_Form: TSubstate_Add_Form
  Left = 349
  Top = 132
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = ' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
  ClientHeight = 96
  ClientWidth = 179
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 132
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1103
    Transparent = True
  end
  object OkButton: TcxButton
    Left = 16
    Top = 64
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    Default = True
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 96
    Top = 64
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object Name_Edit: TcxTextEdit
    Left = 8
    Top = 24
    Width = 169
    Height = 21
    AutoSize = False
    BeepOnEnter = False
    Properties.AutoSelect = False
    Properties.CharCase = ecUpperCase
    Properties.MaxLength = 20
    Style.Color = clInfoBk
    TabOrder = 0
  end
end
