object frmGroupEdit: TfrmGroupEdit
  Left = 390
  Top = 345
  Width = 366
  Height = 132
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'frmGroupEdit'
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
  object Label1: TLabel
    Left = 16
    Top = 17
    Width = 91
    Height = 16
    Caption = #1030#1085#1074#1072#1083#1110#1076#1085#1110#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object InvEdit: TEdit
    Left = 112
    Top = 15
    Width = 233
    Height = 21
    MaxLength = 255
    TabOrder = 0
  end
  object BtnOk: TBitBtn
    Left = 48
    Top = 56
    Width = 75
    Height = 25
    Action = ActOk
    Caption = #1043#1072#1088#1072#1079#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object BtnCancel: TBitBtn
    Left = 232
    Top = 56
    Width = 75
    Height = 25
    Action = ActCancel
    Caption = #1042#1110#1076#1084#1110#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object ActionList1: TActionList
    Left = 176
    Top = 48
    object ActOk: TAction
      Caption = #1043#1072#1088#1072#1079#1076
      ShortCut = 121
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
