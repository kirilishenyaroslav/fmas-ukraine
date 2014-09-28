object uvFormSheet: TuvFormSheet
  Left = 163
  Top = 397
  BorderStyle = bsNone
  Caption = 'uvFormSheet'
  ClientHeight = 73
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object PanelSheet: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 73
    Align = alClient
    BevelInner = bvSpace
    BevelOuter = bvLowered
    Caption = 'PanelSheet'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pFIBDataSet1: TpFIBDataSet
    Left = 88
    Top = 32
    poSQLINT64ToBCD = True
  end
end
