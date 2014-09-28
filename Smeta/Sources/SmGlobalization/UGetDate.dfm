object frmGetDate: TfrmGetDate
  Left = 354
  Top = 258
  Width = 412
  Height = 136
  Caption = 'frmGetDate'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 68
    Width = 404
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 200
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
    Width = 404
    Height = 68
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 374
      Height = 16
      Caption = #1047#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1079#1074#1110#1090' '#1087#1086' '#1073#1102#1076#1078#1077#1090#1072#1093', '#1103#1082#1110' '#1092#1091#1085#1082#1094#1110#1086#1085#1091#1102#1090#1100' '#1085#1072' '#1076#1072#1090#1091' '
    end
    object cxDateEdit1: TcxDateEdit
      Left = 136
      Top = 32
      Width = 249
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 0
    end
  end
end
