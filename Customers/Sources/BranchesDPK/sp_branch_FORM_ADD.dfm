object Fsp_branch_ADD: TFsp_branch_ADD
  Left = 450
  Top = 294
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080
  ClientHeight = 143
  ClientWidth = 295
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
    Width = 88
    Height = 13
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 281
    Height = 97
    Shape = bsFrame
  end
  object NameEdit: TcxTextEdit
    Left = 16
    Top = 32
    Width = 265
    Height = 21
    Properties.MaxLength = 30
    Style.Color = clMoneyGreen
    TabOrder = 0
    OnKeyPress = NameEditKeyPress
  end
  object KodEdit: TcxTextEdit
    Left = 16
    Top = 72
    Width = 265
    Height = 21
    Properties.MaxLength = 16
    Style.Color = clMoneyGreen
    TabOrder = 1
    OnKeyPress = KodEditKeyPress
  end
  object OKButton: TcxButton
    Left = 101
    Top = 112
    Width = 91
    Height = 25
    Caption = #1044#1086#1076#1072#1090#1080
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 197
    Top = 112
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = CancelButtonClick
  end
end
