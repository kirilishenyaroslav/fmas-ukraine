object Fsp_ist_form_add: TFsp_ist_form_add
  Left = 305
  Top = 187
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080
  ClientHeight = 108
  ClientWidth = 376
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
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 361
    Height = 57
    Shape = bsFrame
  end
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
  object FullNameEdit: TcxTextEdit
    Left = 16
    Top = 32
    Width = 345
    Height = 21
    Properties.MaxLength = 60
    Style.Color = clMoneyGreen
    TabOrder = 0
    OnKeyPress = FullNameEditKeyPress
  end
  object OkButton2: TcxButton
    Left = 16
    Top = 72
    Width = 137
    Height = 25
    Caption = #1044#1086#1076#1072#1090#1080' '#1103#1082' '#1076#1086#1095#1110#1088#1085#1110#1081
    TabOrder = 1
    OnClick = OkButton2Click
  end
  object OKButton: TcxButton
    Left = 168
    Top = 72
    Width = 91
    Height = 25
    Caption = #1044#1086#1076#1072#1090#1080
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 272
    Top = 72
    Width = 89
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = CancelButtonClick
  end
end
