object FEditCntWorkers: TFEditCntWorkers
  Left = 551
  Top = 470
  BorderStyle = bsDialog
  Caption = 'FEditCntWorkers'
  ClientHeight = 93
  ClientWidth = 205
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
    Width = 205
    Height = 57
    Align = alTop
    Style = bsRaised
  end
  object SpinEditCntShtat: TcxSpinEdit
    Left = 144
    Top = 8
    Width = 57
    Height = 21
    ParentFont = False
    Properties.CanEdit = False
    Properties.MaxValue = 10000.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Value = 1
  end
  object SpinEditCntSovmest: TcxSpinEdit
    Left = 144
    Top = 32
    Width = 57
    Height = 21
    ParentFont = False
    Properties.CanEdit = False
    Properties.MaxValue = 10000.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Value = 1
  end
  object LabelCntShtat: TcxLabel
    Left = 2
    Top = 10
    Width = 143
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object YesBtn: TcxButton
    Left = 128
    Top = 64
    Width = 75
    Height = 25
    Caption = 'YesBtn'
    Default = True
    ModalResult = 6
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
  end
  object LabelCntSovmest: TcxLabel
    Left = 2
    Top = 34
    Width = 143
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
  end
end
