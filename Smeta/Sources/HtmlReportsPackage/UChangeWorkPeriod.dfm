object frmGetDates: TfrmGetDates
  Left = 277
  Top = 187
  BorderStyle = bsDialog
  Caption = #1050#1086#1085#1092#1110#1075#1088#1072#1094#1110#1103' '#1087#1077#1088#1110#1086#1076#1091', '#1079#1072' '#1103#1082#1080#1081' '#1088#1086#1079#1088#1072#1093#1086#1074#1091#1074#1072#1090#1080' '#1087#1086#1082#1072#1079#1085#1080#1082#1080
  ClientHeight = 177
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 136
    Width = 428
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 136
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 37
      Width = 110
      Height = 16
      Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091
    end
    object Label2: TLabel
      Left = 24
      Top = 84
      Width = 128
      Height = 16
      Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091
    end
    object cxDateEdit1: TcxDateEdit
      Left = 160
      Top = 32
      Width = 241
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxDateEdit2: TcxDateEdit
      Left = 160
      Top = 80
      Width = 241
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 1
    end
  end
end
