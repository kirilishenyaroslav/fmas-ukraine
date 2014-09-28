object Fini_type_men_ADD: TFini_type_men_ADD
  Left = 297
  Top = 182
  BorderStyle = bsDialog
  ClientHeight = 128
  ClientWidth = 320
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
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 305
    Height = 81
    Shape = bsFrame
  end
  object LabelTitle: TLabel
    Left = 20
    Top = 16
    Width = 45
    Height = 13
    Caption = #1055#1086#1089#1072#1076#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object NameEdit: TcxTextEdit
    Left = 16
    Top = 32
    Width = 289
    Height = 21
    BeepOnEnter = False
    Properties.MaxLength = 30
    Style.Color = clMoneyGreen
    TabOrder = 0
    OnKeyPress = NameEditKeyPress
  end
  object OKButton: TcxButton
    Left = 128
    Top = 96
    Width = 91
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 222
    Top = 96
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object MainAccountCheck: TcxCheckBox
    Left = 16
    Top = 56
    Width = 161
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1043#1086#1083#1086#1074#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088
    TabOrder = 3
  end
  object ChiefCheck: TcxCheckBox
    Left = 208
    Top = 56
    Width = 97
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1050#1077#1088#1110#1074#1085#1080#1082
    TabOrder = 4
  end
end
