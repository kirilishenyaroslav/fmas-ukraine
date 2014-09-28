object frmLog: TfrmLog
  Left = 427
  Top = 265
  Width = 550
  Height = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxMemo1: TcxMemo
    Left = 0
    Top = 0
    Width = 542
    Height = 369
    Align = alTop
    Lines.Strings = (
      'cxMemo1')
    TabOrder = 0
  end
  object ExitButton: TcxButton
    Left = 218
    Top = 384
    Width = 105
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = ExitButtonClick
  end
end
