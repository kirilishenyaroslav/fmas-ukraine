object frmSelectNewObjType: TfrmSelectNewObjType
  Left = 433
  Top = 249
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080' '#1074' '#1089#1090#1088#1091#1082#1090#1091#1088#1091' '#1082#1086#1096#1090#1086#1088#1080#1089#1072
  ClientHeight = 103
  ClientWidth = 281
  Color = clMenu
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Button1: TButton
    Left = 40
    Top = 67
    Width = 75
    Height = 25
    Caption = #1042#1080#1073#1088#1072#1090#1080
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 67
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 1
    OnClick = Button2Click
  end
  object RadioButton1: TRadioButton
    Left = 80
    Top = 8
    Width = 177
    Height = 17
    Caption = #1053#1086#1074#1080#1081' '#1088#1086#1079#1076#1110#1083
    Checked = True
    TabOrder = 2
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 80
    Top = 32
    Width = 185
    Height = 17
    Caption = #1053#1086#1074#1080#1081' '#1082#1086#1096#1090#1086#1088#1080#1089
    TabOrder = 3
  end
  object ActionList1: TActionList
    Left = 328
    Top = 8
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 27
      OnExecute = Action2Execute
    end
  end
end
