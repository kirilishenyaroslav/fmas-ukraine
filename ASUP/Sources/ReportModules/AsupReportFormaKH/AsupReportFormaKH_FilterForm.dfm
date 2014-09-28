object FormOptions: TFormOptions
  Left = 356
  Top = 257
  BorderStyle = bsDialog
  Caption = 'FormOptions'
  ClientHeight = 110
  ClientWidth = 389
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
    Width = 389
    Height = 73
    Align = alTop
    Shape = bsFrame
  end
  object YesBtn: TcxButton
    Left = 192
    Top = 80
    Width = 91
    Height = 22
    Action = YesAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 288
    Top = 80
    Width = 89
    Height = 22
    Action = CancelAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object LabelDateForm: TcxLabel
    Left = 136
    Top = 42
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
    TabOrder = 2
    Caption = #1044#1072#1090#1072' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103':'
  end
  object DateEdit: TcxDateEdit
    Left = 264
    Top = 40
    Width = 122
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 12
    Width = 137
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = #1042#1095#1077#1085#1080#1081' '#1089#1090#1091#1087#1110#1085#1100':'
  end
  object StupComboBox: TcxComboBox
    Left = 152
    Top = 8
    Width = 233
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
  end
  object ActionList: TActionList
    Left = 152
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
  end
end
