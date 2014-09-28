object AddForm: TAddForm
  Left = 248
  Top = 259
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080
  ClientHeight = 80
  ClientWidth = 521
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 116
    Height = 13
    Caption = #1052#1110#1089#1094#1077' '#1074#1080#1076#1072#1095#1110' '#1087#1072#1089#1087#1086#1088#1090#1072':'
  end
  object VidanEdit: TcxTextEdit
    Left = 8
    Top = 24
    Width = 505
    Height = 21
    Properties.CharCase = ecUpperCase
    TabOrder = 0
  end
  object OkButton: TcxButton
    Left = 312
    Top = 48
    Width = 97
    Height = 25
    Action = OkAction
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    ModalResult = 1
    TabOrder = 1
  end
  object CancelButton: TcxButton
    Left = 416
    Top = 48
    Width = 97
    Height = 25
    Action = CancelAction
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    TabOrder = 2
  end
  object ActionList1: TActionList
    Left = 192
    Top = 40
    object OkAction: TAction
      Caption = 'OkAction'
      ShortCut = 121
      OnExecute = OkActionExecute
    end
    object CancelAction: TAction
      Caption = 'CancelAction'
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
end
