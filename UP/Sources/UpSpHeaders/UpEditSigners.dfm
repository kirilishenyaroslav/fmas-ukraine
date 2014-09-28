object frmEditSignInfo: TfrmEditSignInfo
  Left = 337
  Top = 264
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1087#1110#1076#1087#1080#1089#1091#1102#1095#1080#1084' '#1085#1072#1082#1072#1079#1080
  ClientHeight = 150
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 9
    Top = 25
    Width = 117
    Height = 13
    Caption = #1055'.'#1030'.'#1041'. '#1087#1110#1076#1087#1080#1089#1091#1102#1095#1086#1075#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 81
    Top = 70
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
  object FioText: TcxTextEdit
    Left = 139
    Top = 23
    Width = 292
    Height = 21
    Properties.MaxLength = 4096
    Style.Color = clInfoBk
    TabOrder = 0
  end
  object PostText: TcxTextEdit
    Left = 139
    Top = 66
    Width = 291
    Height = 21
    Properties.MaxLength = 4096
    Style.Color = clInfoBk
    TabOrder = 1
  end
  object btnCancel: TcxButton
    Left = 237
    Top = 105
    Width = 75
    Height = 25
    Action = ActCancel
    TabOrder = 3
  end
  object btnOk: TcxButton
    Left = 156
    Top = 105
    Width = 75
    Height = 25
    Action = ActOk
    TabOrder = 2
  end
  object EditActionList: TActionList
    Left = 368
    Top = 96
    object ActOk: TAction
      Caption = #1043#1072#1088#1072#1079#1076
      SecondaryShortCuts.Strings = (
        'enter')
      OnExecute = ActOkExecute
    end
    object ActCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1072
      SecondaryShortCuts.Strings = (
        'esc')
      OnExecute = ActCancelExecute
    end
  end
end
