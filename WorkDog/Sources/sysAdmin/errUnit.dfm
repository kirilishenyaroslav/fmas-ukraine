object frmError: TfrmError
  Left = 192
  Top = 103
  BorderStyle = bsDialog
  Caption = #1059#1074#1072#1075#1072'!'
  ClientHeight = 113
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object errMemo: TcxMemo
    Left = 8
    Top = 8
    Width = 401
    Height = 65
    ParentFont = False
    Properties.Alignment = taCenter
    Properties.ReadOnly = True
    Style.Color = clBtnFace
    Style.Edges = []
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    Style.Shadow = False
    TabOrder = 0
  end
  object OKButton: TcxButton
    Left = 160
    Top = 80
    Width = 97
    Height = 25
    Caption = #1054#1050
    Default = True
    TabOrder = 1
    OnClick = OKButtonClick
  end
end
