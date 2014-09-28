object frmConfRazd: TfrmConfRazd
  Left = 355
  Top = 230
  BorderStyle = bsDialog
  Caption = #1050#1086#1085#1092#1110#1075#1091#1088#1072#1094#1110#1103' '#1088#1086#1073#1086#1090#1080' '#1110#1079' '#1089#1090#1072#1090#1090#1103#1084#1080' '#1088#1086#1079#1076#1110#1083#1091
  ClientHeight = 151
  ClientWidth = 467
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
    Top = 110
    Width = 467
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 384
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 467
    Height = 110
    Align = alClient
    TabOrder = 1
    object cxRadioGroup1: TcxRadioGroup
      Left = 24
      Top = 16
      Width = 433
      Height = 81
      ItemIndex = 0
      ParentFont = False
      Properties.Items = <
        item
          Caption = #1044#1072#1074#1072#1090#1080' '#1085#1072' '#1074#1080#1073#1086#1088' '#1074#1089#1110' '#1089#1090#1072#1090#1090#1110' '#1073#1102#1076#1078#1077#1090#1091
        end
        item
          Caption = #1044#1072#1074#1072#1090#1080' '#1085#1072' '#1074#1080#1073#1086#1088' '#1090#1110#1083#1100#1082#1110' '#1079#1072#1087#1083#1072#1085#1086#1074#1072#1085#1110' '#1089#1090#1072#1090#1090#1110' '#1073#1102#1076#1078#1077#1090#1091
        end>
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
      Caption = #1044#1083#1103' '#1074#1080#1073#1086#1088#1091
    end
  end
end
