object FormOptions: TFormOptions
  Left = 194
  Top = 236
  BorderStyle = bsDialog
  Caption = 'FormOptions'
  ClientHeight = 103
  ClientWidth = 408
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
    Width = 408
    Height = 65
    Align = alTop
    Shape = bsFrame
  end
  object DateFormEdit: TcxDateEdit
    Left = 200
    Top = 23
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
    TabOrder = 1
    OnEditing = DateFormEditEditing
  end
  object YesBtn: TcxButton
    Left = 216
    Top = 75
    Width = 91
    Height = 22
    Action = YesAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 312
    Top = 75
    Width = 89
    Height = 22
    Action = CancelAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    LookAndFeel.Kind = lfFlat
  end
  object LabelDateForm: TcxLabel
    Left = 80
    Top = 23
    Width = 117
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = #1044#1072#1090#1072' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103':'
  end
  object FontBtn: TcxButton
    Left = 120
    Top = 75
    Width = 91
    Height = 22
    Action = FontAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
  end
  object ActionList: TActionList
    Left = 16
    Top = 72
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
    object DesRep: TAction
      Caption = 'DesRep'
      OnExecute = DesRepExecute
    end
    object FontAction: TAction
      Caption = 'FontAction'
      OnExecute = FontActionExecute
    end
  end
  object FontDialogs: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 48
    Top = 72
  end
end
