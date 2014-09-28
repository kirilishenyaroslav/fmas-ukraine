object Fini_type_place_form_add: TFini_type_place_form_add
  Left = 320
  Top = 218
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100
  ClientHeight = 145
  ClientWidth = 296
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
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 105
    Height = 13
    Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
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
    Width = 75
    Height = 13
    Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
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
    Height = 97
    Shape = bsFrame
  end
  object FullNameEdit: TcxTextEdit
    Left = 16
    Top = 32
    Width = 265
    Height = 21
    BeepOnEnter = False
    Properties.MaxLength = 60
    Style.Color = clMoneyGreen
    TabOrder = 0
    OnKeyPress = FullNameEditKeyPress
  end
  object OKButton: TcxButton
    Left = 104
    Top = 112
    Width = 91
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 198
    Top = 112
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object ShortNameEdit: TcxTextEdit
    Left = 16
    Top = 72
    Width = 265
    Height = 21
    BeepOnEnter = False
    Properties.MaxLength = 40
    Style.Color = clMoneyGreen
    TabOrder = 3
    OnKeyPress = ShortNameEditKeyPress
  end
end
