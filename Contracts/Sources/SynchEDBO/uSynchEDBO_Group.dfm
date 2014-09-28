object frmSynchEDBO_Group: TfrmSynchEDBO_Group
  Left = 550
  Top = 398
  Width = 443
  Height = 159
  Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103' '#1079#1074#39#1103#1079#1082#1080' '#1075#1088#1091#1087
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TcxButton
    Left = 238
    Top = 89
    Width = 87
    Height = 25
    Caption = #1047#1074#39#1103#1079#1072#1090#1080
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 331
    Top = 89
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Width = 243
    Height = 17
    TabOrder = 2
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1075#1088#1091#1087#1080' '#1079' '#1089#1080#1089#1090#1077#1084#1080' '#1045#1044#1041#1054
  end
  object TextEdit_name_group_edbo: TcxTextEdit
    Left = 8
    Top = 24
    Width = 409
    Height = 21
    Properties.ReadOnly = True
    Style.Color = 16311512
    TabOrder = 3
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 48
    Width = 146
    Height = 17
    TabOrder = 4
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1075#1088#1091#1087#1080
  end
  object ButtonEdit_name_group: TcxButtonEdit
    Left = 8
    Top = 64
    Width = 409
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEdit_name_groupPropertiesButtonClick
    Style.Color = 16311512
    TabOrder = 5
  end
end
