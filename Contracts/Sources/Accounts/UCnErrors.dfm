object frmGetErrors: TfrmGetErrors
  Left = 337
  Top = 204
  BorderStyle = bsDialog
  Caption = #1055#1110#1076' '#1095#1072#1089' '#1087#1088#1086#1074#1077#1076#1077#1085#1085#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1091' '#1074#1080#1085#1080#1082#1083#1080' '#1087#1086#1084#1080#1083#1082#1080
  ClientHeight = 114
  ClientWidth = 427
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 427
    Height = 114
    Align = alClient
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 168
      Top = 80
      Width = 89
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxMemo1: TcxMemo
      Left = 16
      Top = 16
      Width = 401
      Height = 57
      Properties.ReadOnly = False
      Style.Color = clBtnFace
      TabOrder = 1
    end
  end
end
