object Fini_type_street_form_add: TFini_type_street_form_add
  Left = 275
  Top = 103
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080
  ClientHeight = 146
  ClientWidth = 277
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
    Left = 8
    Top = 16
    Width = 77
    Height = 13
    Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 103
    Height = 13
    Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1072' '#1085#1072#1079#1074#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FullNameEdit: TcxTextEdit
    Left = 8
    Top = 32
    Width = 265
    Height = 21
    BeepOnEnter = False
    Properties.MaxLength = 60
    Style.StyleController = dm.EditStyleController1
    TabOrder = 0
    OnKeyPress = FullNameEditKeyPress
  end
  object OKButton: TcxButton
    Left = 88
    Top = 112
    Width = 91
    Height = 25
    Caption = #1044#1086#1076#1072#1090#1080
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 184
    Top = 112
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object ShortNameEdit: TcxTextEdit
    Left = 8
    Top = 72
    Width = 265
    Height = 21
    BeepOnEnter = False
    Properties.MaxLength = 40
    Style.StyleController = dm.EditStyleController1
    TabOrder = 3
    OnKeyPress = ShortNameEditKeyPress
  end
end
