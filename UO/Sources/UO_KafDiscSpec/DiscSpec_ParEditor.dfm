object fParEditor: TfParEditor
  Left = 379
  Top = 271
  BorderStyle = bsDialog
  Caption = 'fParEditor'
  ClientHeight = 111
  ClientWidth = 328
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
    Left = 8
    Top = 68
    Width = 329
    Height = 2
  end
  object mePercent: TcxMaskEdit
    Left = 230
    Top = 23
    Width = 93
    Height = 24
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '(100)|(\d?\d ([,]\d\d?\d?\d?)?)'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Text = '0'
  end
  object lPercent: TcxLabel
    Left = 2
    Top = 25
    Width = 225
    Height = 20
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Caption = #1042#1074#1077#1076#1110#1090#1100' '#1087#1088#1086#1094#1077#1085#1090' '#1095#1072#1089#1091
  end
  object btnOk: TcxButton
    Left = 96
    Top = 80
    Width = 75
    Height = 25
    Action = OkAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object btnCancel: TcxButton
    Left = 184
    Top = 80
    Width = 75
    Height = 25
    Action = CancelAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object ActionList1: TActionList
    Left = 40
    Top = 32
    object OkAction: TAction
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      ShortCut = 121
      OnExecute = OkActionExecute
    end
    object CancelAction: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
end
