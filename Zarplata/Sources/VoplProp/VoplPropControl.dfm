object FVoplPropControl: TFVoplPropControl
  Left = 293
  Top = 213
  BorderStyle = bsDialog
  Caption = 'FVoplPropControl'
  ClientHeight = 104
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
    Top = 62
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
    Properties.MaskKind = emkRegExpr
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
    TabOrder = 1
  end
  object YesBtn: TcxButton
    Left = 176
    Top = 72
    Width = 81
    Height = 25
    Caption = 'Yes'
    Default = True
    TabOrder = 2
    OnClick = YesBtnClick
    LookAndFeel.Kind = lfUltraFlat
  end
  object CancelBtn: TcxButton
    Left = 280
    Top = 72
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfUltraFlat
  end
end
