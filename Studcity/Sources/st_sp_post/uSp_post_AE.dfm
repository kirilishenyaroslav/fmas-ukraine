object frmPost_AE: TfrmPost_AE
  Left = 505
  Top = 263
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1076#1086#1083#1078#1085#1086#1089#1090#1100
  ClientHeight = 106
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OKButton: TcxButton
    Left = 144
    Top = 72
    Width = 83
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 232
    Top = 72
    Width = 81
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 305
    Height = 57
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object NameLabel: TcxLabel
      Left = 8
      Top = 8
      Width = 142
      Height = 17
      TabStop = False
      TabOrder = 1
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
    end
    object NameEdit: TcxTextEdit
      Left = 8
      Top = 24
      Width = 289
      Height = 21
      BeepOnEnter = False
      Properties.MaxLength = 45
      Style.Color = clInfoBk
      TabOrder = 0
    end
  end
end
