object FormTypeWork_Edit: TFormTypeWork_Edit
  Left = 404
  Top = 264
  Width = 572
  Height = 139
  Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1103'['#1058#1080#1087#1080' '#1074#1080#1093#1086#1076#1110#1074']'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 82
    Width = 564
    Height = 30
    Align = alBottom
    TabOrder = 0
    object ButtonYes: TcxButton
      Left = 395
      Top = 4
      Width = 75
      Height = 25
      Action = ActionYes
      TabOrder = 0
    end
    object ButtonCancel: TcxButton
      Left = 475
      Top = 4
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
    end
  end
  object cxLabel1: TcxLabel
    Left = 14
    Top = 8
    Width = 82
    Height = 17
    Properties.Alignment.Horz = taRightJustify
    TabOrder = 1
    Caption = #1053#1072#1110#1084#1077#1085#1091#1074#1072#1085#1085#1103':'
  end
  object EditName: TcxTextEdit
    Left = 95
    Top = 7
    Width = 459
    Height = 21
    TabOrder = 2
  end
  object cxGroupBox1: TcxGroupBox
    Left = 6
    Top = 31
    Width = 539
    Height = 40
    Alignment = alTopLeft
    TabOrder = 3
    object CheckBoxPaid: TcxCheckBox
      Left = 300
      Top = 11
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.ValueChecked = 'T'
      Properties.ValueUnchecked = 'F'
      Properties.Caption = #1054#1087#1083#1072#1095#1091#1074#1072#1083#1100#1085#1080#1081
      State = cbsChecked
      TabOrder = 0
    end
    object CheckBoxVihod: TcxCheckBox
      Left = 417
      Top = 11
      Width = 120
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.ValueChecked = 'T'
      Properties.ValueUnchecked = 'F'
      Properties.Caption = #1042#1080#1093#1110#1076
      TabOrder = 1
    end
    object EditShorName: TcxTextEdit
      Left = 104
      Top = 10
      Width = 82
      Height = 21
      TabOrder = 2
    end
    object EditNum: TcxSpinEdit
      Left = 235
      Top = 12
      Width = 49
      Height = 21
      TabOrder = 3
    end
    object cxLabel3: TcxLabel
      Left = 191
      Top = 12
      Width = 45
      Height = 17
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 4
      Caption = #1053#1086#1084#1077#1088':'
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 12
      Width = 98
      Height = 17
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 5
      Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1072' '#1085#1072#1079#1074#1072':'
    end
  end
  object ActionList: TActionList
    Left = 65532
    object ActionYes: TAction
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      ShortCut = 121
      OnExecute = ActionYesExecute
    end
    object ActionCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
end
