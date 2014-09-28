object FormOptions: TFormOptions
  Left = 313
  Top = 252
  BorderStyle = bsDialog
  Caption = 'FormOptions'
  ClientHeight = 120
  ClientWidth = 438
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
    Width = 438
    Height = 73
    Align = alTop
    Shape = bsFrame
  end
  object DateEdit: TcxDateEdit
    Left = 203
    Top = 28
    Width = 122
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DateButtons = [btnToday]
    Properties.MaxDate = 55153.000000000000000000
    Properties.MinDate = 36526.000000000000000000
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    EditValue = 38762d
  end
  object LabelDate: TcxLabel
    Left = 56
    Top = 28
    Width = 121
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Caption = #1044#1072#1090#1072' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103':'
  end
  object YesBtn: TcxButton
    Left = 144
    Top = 88
    Width = 91
    Height = 22
    Action = YesAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
  end
  object ExpBtn: TcxButton
    Left = 240
    Top = 88
    Width = 91
    Height = 22
    Action = Export
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 336
    Top = 88
    Width = 89
    Height = 22
    Action = CancelAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    LookAndFeel.Kind = lfFlat
  end
  object ActionList: TActionList
    Left = 64
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
    object Export: TAction
      Caption = 'Export'
      ShortCut = 120
      OnExecute = ExportExecute
    end
  end
end
