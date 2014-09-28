object frmPrint_reestr: TfrmPrint_reestr
  Left = 570
  Top = 310
  Width = 311
  Height = 107
  Caption = #1056#1077#1108#1089#1090#1088' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button_print: TcxButton
    Left = 72
    Top = 24
    Width = 75
    Height = 25
    Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = Button_printClick
  end
  object Button_cancel: TcxButton
    Left = 160
    Top = 24
    Width = 75
    Height = 25
    Caption = #1042#1080#1093#1110#1076
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = Button_cancelClick
  end
  object ActionList1: TActionList
    Left = 8
    Top = 48
    object Act_debug: TAction
      Caption = 'Act_debug'
      ShortCut = 57412
      OnExecute = Act_debugExecute
    end
    object act_exit: TAction
      Caption = 'act_exit'
      ShortCut = 27
      OnExecute = act_exitExecute
    end
    object act_print: TAction
      Caption = 'act_print'
      ShortCut = 16464
      OnExecute = act_printExecute
    end
  end
end
