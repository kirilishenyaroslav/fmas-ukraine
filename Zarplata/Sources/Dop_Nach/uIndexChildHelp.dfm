object IndexChildHelpForm: TIndexChildHelpForm
  Left = 307
  Top = 289
  BorderStyle = bsDialog
  Caption = #1030#1085#1076#1077#1082#1089#1072#1094#1110#1103' '#1076#1086#1087#1086#1084#1086#1075#1080' '#1076#1086' 3-'#1093' '#1088#1086#1082#1110#1074
  ClientHeight = 86
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PercentLabel: TLabel
    Left = 8
    Top = 8
    Width = 98
    Height = 13
    Caption = #1055#1088#1086#1094#1077#1085#1090' '#1110#1085#1076#1077#1082#1089#1072#1094#1110#1111':'
  end
  object PercentEdit: TcxTextEdit
    Left = 8
    Top = 24
    Width = 129
    Height = 21
    TabOrder = 0
  end
  object OkBtn: TcxButton
    Left = 152
    Top = 56
    Width = 75
    Height = 25
    Caption = #1030#1085#1076#1077#1082#1089#1091#1074#1072#1090#1080
    ModalResult = 1
    TabOrder = 1
    OnClick = OkBtnClick
  end
  object CancelBtn: TcxButton
    Left = 240
    Top = 56
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    TabOrder = 2
  end
end
