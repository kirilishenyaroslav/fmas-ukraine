object frmSmGlObjectEdit: TfrmSmGlObjectEdit
  Left = 348
  Top = 210
  BorderStyle = bsDialog
  Caption = #1056#1072#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1091#1079#1072#1075#1072#1083#1100#1085#1077#1085#1086#1084#1091' '#1073#1102#1076#1078#1077#1090#1091
  ClientHeight = 161
  ClientWidth = 435
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
    Top = 120
    Width = 435
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 264
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 344
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
    Width = 435
    Height = 120
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 261
      Height = 16
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1091#1079#1072#1075#1072#1083#1100#1085#1077#1085#1086#1075#1086' '#1073#1102#1076#1078#1077#1090#1072
    end
    object cxCheckBox1: TcxCheckBox
      Left = 22
      Top = 85
      Width = 137
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1044#1086#1076#1072#1090#1080' '#1074' '#1082#1086#1088#1110#1085#1100
      TabOrder = 0
    end
    object ObjectName: TcxTextEdit
      Left = 24
      Top = 48
      Width = 385
      Height = 24
      Properties.MaxLength = 100
      Style.Color = clInfoBk
      TabOrder = 1
    end
  end
end
