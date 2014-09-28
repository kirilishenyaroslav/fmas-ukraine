object FormOptions: TFormOptions
  Left = 223
  Top = 207
  BorderStyle = bsDialog
  Caption = 'FormOptions'
  ClientHeight = 130
  ClientWidth = 477
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
    Width = 477
    Height = 89
    Align = alTop
    Shape = bsFrame
  end
  object YesBtn: TcxButton
    Left = 280
    Top = 104
    Width = 91
    Height = 22
    Action = YesAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 376
    Top = 104
    Width = 89
    Height = 22
    Action = CancelAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object cxLabel1: TcxLabel
    Left = 176
    Top = 35
    Width = 41
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
    Caption = #1056#1110#1082':'
  end
  object cxSpinYear: TcxSpinEdit
    Left = 240
    Top = 32
    Width = 57
    Height = 21
    TabOrder = 3
    Value = 2006
    OnKeyDown = cxSpinYearKeyDown
    OnKeyUp = cxSpinYearKeyUp
  end
  object ActionList: TActionList
    Left = 112
    Top = 96
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
  end
end
