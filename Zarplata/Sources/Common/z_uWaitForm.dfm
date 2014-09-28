object zWaitForm: TzWaitForm
  Left = 833
  Top = 634
  BorderStyle = bsNone
  Caption = 'zWaitForm'
  ClientHeight = 66
  ClientWidth = 431
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 0
    Top = 59
    Width = 431
    Height = 7
    Align = alBottom
    Progress = 0
    ShowText = False
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 431
    Height = 59
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clGradientActiveCaption
    Enabled = False
    TabOrder = 0
    object Memo: TcxMemo
      Left = 2
      Top = 2
      Width = 427
      Height = 55
      Align = alClient
      ParentColor = True
      ParentFont = False
      Properties.Alignment = taCenter
      Properties.ReadOnly = True
      Style.BorderStyle = ebsUltraFlat
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.HotTrack = True
      Style.TransparentBorder = False
      TabOrder = 0
    end
  end
end
