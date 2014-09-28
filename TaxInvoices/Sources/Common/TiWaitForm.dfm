object WaitForm: TWaitForm
  Left = 372
  Top = 401
  BorderStyle = bsNone
  Caption = 'WaitForm'
  ClientHeight = 61
  ClientWidth = 431
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 431
    Height = 61
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
      Height = 57
      Align = alClient
      ParentFont = False
      Properties.Alignment = taCenter
      Properties.ReadOnly = True
      Style.BorderStyle = ebsUltraFlat
      Style.Color = 14544605
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clHotLight
      Style.Font.Height = -16
      Style.Font.Name = 'Courier New'
      Style.Font.Style = [fsBold]
      Style.HotTrack = True
      Style.TransparentBorder = False
      TabOrder = 0
    end
  end
end
