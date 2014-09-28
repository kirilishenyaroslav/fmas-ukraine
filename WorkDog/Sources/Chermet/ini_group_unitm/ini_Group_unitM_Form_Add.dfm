object ini_Group_UnitM_Form_Add1: Tini_Group_UnitM_Form_Add1
  Left = 389
  Top = 286
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103' '#1075#1088#1091#1087#1080' '#1086#1076#1080#1085#1080#1094#1100' '#1074#1080#1084#1110#1088#1102#1074#1072#1085#1085#1103
  ClientHeight = 103
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 337
    Height = 57
    Shape = bsFrame
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 180
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1075#1088#1091#1087#1080' '#1086#1076#1080#1085#1080#1094#1100' '#1074#1080#1084#1110#1088#1102#1074#1072#1085#1085#1103':'
  end
  object Name_Group_UnitM: TcxTextEdit
    Left = 16
    Top = 32
    Width = 321
    Height = 21
    TabOrder = 0
    OnKeyPress = Name_Group_UnitMKeyPress
  end
  object ApplyButton: TcxButton
    Left = 192
    Top = 72
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 1
    OnClick = ApplyButtonClick
  end
  object Button2: TcxButton
    Left = 272
    Top = 72
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 2
    OnClick = Button2Click
  end
  object ActionList1: TActionList
    Left = 96
    Top = 80
    object ActionExit: TAction
      Caption = 'ActionExit'
      ShortCut = 27
      OnExecute = ActionExitExecute
    end
  end
end
