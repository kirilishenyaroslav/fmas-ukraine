object FFilterFormWorkHourse: TFFilterFormWorkHourse
  Left = 670
  Top = 223
  BorderStyle = bsDialog
  Caption = #1040#1085#1072#1083#1110#1090#1080#1095#1085#1072' '#1079#1074#1110#1090#1085#1110#1089#1090#1100' '#1079#1072' '#1075#1086#1076#1080#1085#1072#1084#1080
  ClientHeight = 74
  ClientWidth = 404
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
  object YesBtn: TcxButton
    Left = 232
    Top = 41
    Width = 73
    Height = 23
    Action = actYes
    Caption = #1054#1082
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 312
    Top = 41
    Width = 73
    Height = 23
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object DateBeg: TcxDateEdit
    Left = 72
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object DateEnd: TcxDateEdit
    Left = 264
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object LabelTo: TcxLabel
    Left = 198
    Top = 10
    Width = 61
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    TabOrder = 4
    Caption = #1055#1086':'
  end
  object cxLabel1: TcxLabel
    Left = 6
    Top = 10
    Width = 61
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    TabOrder = 5
    Caption = #1042#1110#1076':'
  end
  object ActionList: TActionList
    Left = 112
    Top = 39
    object actYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      OnExecute = actYesExecute
    end
  end
end
