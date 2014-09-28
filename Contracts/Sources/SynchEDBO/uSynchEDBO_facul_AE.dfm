object frmSynchEDBO_facul_AE: TfrmSynchEDBO_facul_AE
  Left = 479
  Top = 342
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103' '#1079#1074#39#1103#1079#1082#1080' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1110#1074
  ClientHeight = 123
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TcxButton
    Left = 238
    Top = 89
    Width = 87
    Height = 25
    Caption = #1057#1074#1103#1079#1072#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 331
    Top = 89
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Width = 243
    Height = 17
    TabOrder = 2
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1072' '#1080#1079' '#1089#1080#1089#1090#1077#1084#1099' '#1045#1044#1041#1054
  end
  object TextEdit_facul_edbo: TcxTextEdit
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
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1072
  end
  object ButtonEdit_facul: TcxButtonEdit
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
    Properties.OnButtonClick = ButtonEdit_faculPropertiesButtonClick
    Style.Color = 16311512
    TabOrder = 5
    OnKeyPress = ButtonEdit_faculKeyPress
  end
end
