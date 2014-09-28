object fmGetID: TfmGetID
  Left = 1001
  Top = 501
  Width = 219
  Height = 119
  Caption = 'Debug'
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
  object cxID: TcxTextEdit
    Left = 80
    Top = 12
    Width = 97
    Height = 21
    TabOrder = 0
    Text = '0'
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 16
    Width = 72
    Height = 17
    TabOrder = 1
    Caption = 'ID_SESSION'
  end
  object cxButton1: TcxButton
    Left = 8
    Top = 48
    Width = 185
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = cxButton1Click
  end
end
