object frmPersonEdit: TfrmPersonEdit
  Left = 473
  Top = 272
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1084#1077#1085#1077#1076#1078#1077#1088#1091
  ClientHeight = 125
  ClientWidth = 391
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
    Top = 91
    Width = 391
    Height = 34
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 223
      Top = 4
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 301
      Top = 4
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
    Width = 391
    Height = 91
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 48
      Top = 20
      Width = 81
      Height = 13
      Caption = #1055'.'#1030'.'#1041'. '#1084#1077#1085#1076#1078#1077#1088#1091
    end
    object Label2: TLabel
      Left = 72
      Top = 60
      Width = 38
      Height = 13
      Caption = #1055#1086#1089#1072#1076#1072
    end
    object cxTextEdit1: TcxTextEdit
      Left = 152
      Top = 16
      Width = 225
      Height = 21
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxTextEdit2: TcxTextEdit
      Left = 152
      Top = 56
      Width = 225
      Height = 21
      Style.Color = clInfoBk
      TabOrder = 1
    end
  end
end
