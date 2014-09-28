object frmSynchEDBO_Spec_AE: TfrmSynchEDBO_Spec_AE
  Left = 666
  Top = 335
  Width = 440
  Height = 287
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1080#1077' '#1089#1074#1103#1079#1077#1081' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1077#1081
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
    Top = 217
    Width = 87
    Height = 25
    Caption = #1057#1074#1103#1079#1072#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 331
    Top = 217
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
    Width = 261
    Height = 17
    TabOrder = 2
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1080' '#1080#1079' '#1089#1080#1089#1090#1077#1084#1099' '#1045#1044#1041#1054
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
    Top = 88
    Width = 164
    Height = 17
    TabOrder = 4
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1080
  end
  object ButtonEdit_Spec: TcxButtonEdit
    Left = 8
    Top = 104
    Width = 409
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEdit_SpecPropertiesButtonClick
    Style.Color = 16311512
    TabOrder = 5
    OnKeyPress = ButtonEdit_SpecKeyPress
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 48
    Width = 261
    Height = 17
    TabOrder = 6
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1085#1072#1087#1088#1103#1084#1082#1091' '#1079' '#1089#1080#1089#1090#1077#1084#1080' '#1045#1044#1041#1054
  end
  object TextEdit_Direction_Name_EDBO: TcxTextEdit
    Left = 8
    Top = 64
    Width = 409
    Height = 21
    Properties.ReadOnly = True
    Style.Color = 16311512
    TabOrder = 7
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 128
    Width = 165
    Height = 17
    TabOrder = 8
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1082#1072#1090#1077#1075#1086#1088#1110#1111' '#1045#1044#1041#1054
  end
  object TextEdit_kat_stud_edbo: TcxTextEdit
    Left = 9
    Top = 144
    Width = 408
    Height = 21
    Properties.ReadOnly = True
    Style.Color = 16311512
    TabOrder = 9
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 168
    Width = 181
    Height = 17
    TabOrder = 10
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1082#1072#1090#1077#1075#1086#1088#1110#1111' '#1085#1072#1074#1095#1072#1085#1085#1103
  end
  object ButtonEdit_kat_stud: TcxButtonEdit
    Left = 9
    Top = 184
    Width = 408
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEdit_kat_studPropertiesButtonClick
    Style.Color = 16311512
    TabOrder = 11
  end
end
