object FVoplTypeControl: TFVoplTypeControl
  Left = 293
  Top = 213
  BorderStyle = bsDialog
  Caption = 'FVoplTypeControl'
  ClientHeight = 134
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 86
    Width = 537
    Height = 3
    Style = bsRaised
  end
  object MaskEditFullName: TcxMaskEdit
    Left = 8
    Top = 32
    Width = 537
    Height = 21
    ParentFont = False
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '.?.?.?.?.?.?.?.?.?.?'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 0
  end
  object LabelFullName: TcxLabel
    Left = 8
    Top = 8
    Width = 537
    Height = 24
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
  end
  object YesBtn: TcxButton
    Left = 176
    Top = 104
    Width = 81
    Height = 25
    Action = Action1
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 280
    Top = 104
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object CBoxDays: TcxCheckBox
    Left = 8
    Top = 56
    Width = 537
    Height = 24
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.ValueChecked = 'T'
    Properties.ValueUnchecked = 'F'
    Properties.Caption = #1044#1085#1110
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
  end
  object ActionList1: TActionList
    Left = 440
    Top = 72
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
  end
end
