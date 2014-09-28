object fmStajEdit: TfmStajEdit
  Left = 327
  Top = 110
  Width = 546
  Height = 134
  BorderIcons = [biSystemMenu]
  Caption = #1044#1086#1076#1072#1090#1080'/'#1047#1084#1110#1085#1080#1090#1080
  Color = clBtnFace
  Constraints.MaxHeight = 134
  Constraints.MaxWidth = 546
  Constraints.MinHeight = 134
  Constraints.MinWidth = 546
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 17
    Top = 25
    Width = 77
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1089#1090#1072#1078#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnl1: TPanel
    Left = 0
    Top = 59
    Width = 538
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 172
      Top = 7
      Width = 75
      Height = 25
      Action = OkAction
      Caption = #1043#1072#1088#1072#1079#1076
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 277
      Top = 7
      Width = 75
      Height = 25
      Action = CancelAction
      TabOrder = 1
    end
  end
  object cxTextEdit1: TcxTextEdit
    Left = 97
    Top = 23
    Width = 432
    Height = 21
    Properties.MaxLength = 4096
    Style.Color = clInfoBk
    TabOrder = 1
  end
  object KeyList: TActionList
    Left = 108
    Top = 52
    object AddAction: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      ImageIndex = 0
      ShortCut = 45
    end
    object CancelAction: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ImageIndex = 9
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
    object EditAction: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Hint = #1055#1077#1088#1077#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1088#1086#1079#1073#1080#1074#1082#1091
      ImageIndex = 1
      ShortCut = 113
    end
    object DeleteAction: TAction
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080
      ImageIndex = 3
      ShortCut = 46
    end
    object RefreshAction: TAction
      Caption = #1054#1085#1086#1074#1080#1090#1080
      ImageIndex = 4
      ShortCut = 116
    end
    object EnterAction: TAction
      Caption = #1042#1080#1073#1088#1072#1090#1080
      ImageIndex = 8
      ShortCut = 13
    end
    object OkAction: TAction
      Caption = 'OkAction'
      ShortCut = 121
      OnExecute = OkActionExecute
    end
  end
end
