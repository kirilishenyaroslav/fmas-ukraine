object frmEditFormUch: TfrmEditFormUch
  Left = 326
  Top = 228
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1082#1086#1085#1092#1110#1075#1091#1088#1072#1094#1110#1108#1102' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1100#1082#1086#1111' '#1092#1086#1088#1084#1080' '#1086#1073#1083#1110#1082#1091
  ClientHeight = 229
  ClientWidth = 492
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
    Top = 188
    Width = 492
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 408
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 188
    Align = alClient
    TabOrder = 1
    object WorkGroup: TcxRadioGroup
      Left = 16
      Top = 16
      Width = 465
      Height = 49
      ItemIndex = 0
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = #1053#1077' '#1092#1091#1085#1082#1094#1110#1086#1085#1091#1108
        end
        item
          Caption = #1060#1091#1085#1082#1094#1110#1086#1085#1091#1108
        end>
      TabOrder = 0
      Caption = #1060#1091#1085#1082#1094#1110#1086#1085#1091#1074#1072#1085#1085#1103' '#1092#1086#1088#1084#1080' '#1086#1073#1083#1110#1082#1091
    end
    object CheckDogGroup: TcxRadioGroup
      Left = 16
      Top = 72
      Width = 465
      Height = 49
      ItemIndex = 0
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = #1053#1077' '#1086#1073#1086#1074#39#1103#1079#1082#1086#1074#1086
        end
        item
          Caption = #1054#1073#1086#1074#39#1103#1079#1082#1086#1074#1086
        end>
      TabOrder = 1
      Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1072#1085#1072#1083#1110#1090#1080#1082#1086#1102' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1072#1084
    end
    object CheckMenGroup: TcxRadioGroup
      Left = 16
      Top = 128
      Width = 465
      Height = 49
      ItemIndex = 0
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = #1053#1077' '#1086#1073#1086#1074#39#1103#1079#1082#1086#1074#1086
        end
        item
          Caption = #1054#1073#1086#1074#39#1103#1079#1082#1086#1074#1086
        end>
      TabOrder = 2
      Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1072#1085#1072#1083#1110#1090#1080#1082#1086#1102' '#1087#1086' '#1092#1110#1079#1080#1095#1085#1080#1084' '#1086#1089#1086#1073#1072#1084
    end
  end
end
