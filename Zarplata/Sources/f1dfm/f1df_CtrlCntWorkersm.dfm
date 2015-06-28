object FEditCntWorkers: TFEditCntWorkers
  Left = 476
  Top = 349
  BorderStyle = bsDialog
  Caption = 'FEditCntWorkers'
  ClientHeight = 94
  ClientWidth = 366
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
    Width = 366
    Height = 57
    Align = alTop
    Style = bsRaised
  end
  object SpinEditCntShtat: TcxSpinEdit
    Left = 304
    Top = 8
    Width = 57
    Height = 21
    ParentFont = False
    Properties.MaxValue = 10000.000000000000000000
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Value = 1
  end
  object SpinEditCntSovmest: TcxSpinEdit
    Left = 304
    Top = 32
    Width = 57
    Height = 21
    ParentFont = False
    Properties.MaxValue = 10000.000000000000000000
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
    Width = 295
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Caption = 'LabelCntShtat'
  end
  object YesBtn: TcxButton
    Left = 288
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
    Width = 295
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
