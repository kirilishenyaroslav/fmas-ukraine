object frmNewSmWay: TfrmNewSmWay
  Left = 341
  Top = 269
  BorderStyle = bsDialog
  Caption = #1042#1080#1073#1077#1088#1110#1090#1100' '#1074#1072#1088#1110#1072#1085#1090' '#1089#1090#1074#1086#1088#1077#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1091
  ClientHeight = 127
  ClientWidth = 494
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
    Top = 86
    Width = 494
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
  object cxRadioGroup1: TcxRadioGroup
    Left = 0
    Top = 0
    Width = 494
    Height = 86
    Align = alClient
    ItemIndex = 1
    Properties.Items = <
      item
        Caption = #1053#1086#1074#1080#1081' '#1073#1102#1076#1078#1077#1090
      end
      item
        Caption = #1053#1086#1074#1080#1081' '#1073#1102#1076#1078#1077#1090' '#1079#1072' '#1096#1072#1073#1083#1086#1085#1086#1084
      end>
    TabOrder = 1
    Caption = ''
  end
end
