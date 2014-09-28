object Fini_type_contact_ADD: TFini_type_contact_ADD
  Left = 334
  Top = 215
  BorderStyle = bsDialog
  ClientHeight = 103
  ClientWidth = 294
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
    Top = 16
    Width = 89
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
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
    Height = 57
    Shape = bsFrame
  end
  object NameEdit: TcxTextEdit
    Left = 16
    Top = 32
    Width = 265
    Height = 21
    BeepOnEnter = False
    Properties.MaxLength = 20
    Style.Color = clMoneyGreen
    TabOrder = 0
    OnKeyPress = NameEditKeyPress
  end
  object OKButton: TcxButton
    Left = 104
    Top = 72
    Width = 91
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 198
    Top = 72
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
