object frmEnumTypeEdit: TfrmEnumTypeEdit
  Left = 363
  Top = 303
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1075#1088#1091#1087#1072#1084#1080' '#1072#1085#1072#1083#1110#1090#1080#1082#1080
  ClientHeight = 109
  ClientWidth = 396
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
    Width = 396
    Height = 68
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 233
      Height = 13
      AutoSize = False
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1075#1088#1091#1087#1080' '#1072#1085#1072#1083#1110#1090#1080#1082#1080
    end
    object cxTextEdit1: TcxTextEdit
      Left = 48
      Top = 32
      Width = 305
      Height = 21
      Style.Color = clInfoBk
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 68
    Width = 396
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 312
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
end
