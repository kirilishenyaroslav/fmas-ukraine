object frmGetPeriod: TfrmGetPeriod
  Left = 397
  Top = 217
  BorderStyle = bsDialog
  Caption = #1058#1088#1077#1073#1072' '#1074#1080#1073#1088#1072#1090#1080' '#1087#1077#1088#1110#1086#1076' '#1074#1080#1076#1072#1083#1077#1085#1085#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
  ClientHeight = 86
  ClientWidth = 344
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
    Top = 45
    Width = 344
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 256
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
    Width = 344
    Height = 45
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object cxDateEdit1: TcxDateEdit
      Left = 64
      Top = 12
      Width = 233
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 0
    end
  end
end
