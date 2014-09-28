object FormOptions: TFormOptions
  Left = 225
  Top = 263
  BorderStyle = bsDialog
  Caption = 'FormOptions'
  ClientHeight = 116
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 405
    Height = 81
    Align = alTop
    Shape = bsFrame
  end
  object YesBtn: TcxButton
    Left = 208
    Top = 88
    Width = 91
    Height = 22
    Action = YesAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 304
    Top = 88
    Width = 89
    Height = 22
    Action = CancelAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object LabelDateForm: TcxLabel
    Left = 24
    Top = 34
    Width = 169
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Caption = #1044#1072#1090#1072' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103':'
  end
  object DateEdit: TcxDateEdit
    Left = 200
    Top = 32
    Width = 122
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DateButtons = [btnToday]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
  end
  object ActionList: TActionList
    Left = 32
    Top = 80
    object YesAction: TAction
      Caption = 'YesAction'
      ShortCut = 16464
      OnExecute = YesActionExecute
    end
    object CancelAction: TAction
      Caption = 'CancelAction'
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
end
