object frmEditvalute: TfrmEditvalute
  Left = 372
  Top = 271
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1074#1072#1083#1102#1090#1110
  ClientHeight = 150
  ClientWidth = 475
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
    Top = 109
    Width = 475
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 312
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 392
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 475
    Height = 109
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 80
      Top = 28
      Width = 87
      Height = 16
      Caption = #1050#1086#1076' '#1074#1072#1083#1102#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 72
      Top = 66
      Width = 111
      Height = 16
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxTextEdit1: TcxTextEdit
      Left = 200
      Top = 24
      Width = 121
      Height = 21
      Properties.MaxLength = 4
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxTextEdit2: TcxTextEdit
      Left = 200
      Top = 64
      Width = 249
      Height = 21
      Properties.MaxLength = 100
      Style.Color = clInfoBk
      TabOrder = 1
    end
  end
end
