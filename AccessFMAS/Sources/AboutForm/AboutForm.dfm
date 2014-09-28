object FormAbout: TFormAbout
  Left = 294
  Top = 171
  BorderStyle = bsDialog
  Caption = #1055#1088#1086' '#1087#1088#1086#1075#1088#1072#1084#1091
  ClientHeight = 414
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    510
    414)
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonOk: TButton
    Left = 427
    Top = 383
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 0
    OnClick = ButtonOkClick
  end
  object MemoInfo: TMemo
    Left = 8
    Top = 8
    Width = 494
    Height = 361
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBtnFace
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 24
    Top = 24
  end
end
