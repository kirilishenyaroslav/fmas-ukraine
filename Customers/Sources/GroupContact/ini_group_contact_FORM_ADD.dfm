object Fini_group_contact_ADD: TFini_group_contact_ADD
  Left = 327
  Top = 214
  BorderStyle = bsDialog
  ClientHeight = 115
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 125
    Height = 13
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1075#1088#1091#1087#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 281
    Height = 65
    Shape = bsFrame
  end
  object NameEdit: TcxTextEdit
    Left = 16
    Top = 40
    Width = 265
    Height = 21
    Properties.MaxLength = 20
    Style.Color = clMoneyGreen
    TabOrder = 0
    OnKeyPress = NameEditKeyPress
  end
  object OKButton: TcxButton
    Left = 104
    Top = 80
    Width = 91
    Height = 25
    Caption = #1044#1086#1076#1072#1090#1080
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 198
    Top = 80
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1047#1084#1110#1085#1080#1090#1080
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
