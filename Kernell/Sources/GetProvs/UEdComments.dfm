object frmEditComments: TfrmEditComments
  Left = 355
  Top = 271
  BorderStyle = bsDialog
  Caption = #1050#1086#1084#1077#1085#1090#1072#1088' '#1087#1086' '#1087#1088#1086#1074#1086#1076#1094#1110
  ClientHeight = 228
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 470
    Height = 187
    Align = alClient
    TabOrder = 0
    object cxMemo1: TcxMemo
      Left = 1
      Top = 1
      Width = 468
      Height = 185
      Align = alClient
      Properties.MaxLength = 999
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 187
    Width = 470
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 384
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
end
