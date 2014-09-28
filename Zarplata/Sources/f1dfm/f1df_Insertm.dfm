object FInsert: TFInsert
  Left = 398
  Top = 317
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FInsert'
  ClientHeight = 114
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 281
    Height = 81
  end
  object LabelKvartal: TcxLabel
    Left = 8
    Top = 10
    Width = 97
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
  end
  object LabelYear: TcxLabel
    Left = 152
    Top = 10
    Width = 65
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
  end
  object RadioRee: TcxRadioButton
    Left = 24
    Top = 48
    Width = 113
    Height = 17
    Caption = 'RadioRee'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    TabStop = True
  end
  object RadioOst: TcxRadioButton
    Left = 160
    Top = 48
    Width = 113
    Height = 17
    Caption = 'RadioOst'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object YesBtn: TcxButton
    Left = 119
    Top = 88
    Width = 75
    Height = 24
    Caption = 'ActionYes'
    ModalResult = 6
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = YesBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 199
    Top = 88
    Width = 75
    Height = 24
    Caption = 'ActionCancel'
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
end
