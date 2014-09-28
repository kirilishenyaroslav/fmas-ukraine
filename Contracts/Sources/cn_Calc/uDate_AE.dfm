object frmDate_AE: TfrmDate_AE
  Left = 415
  Top = 240
  Width = 253
  Height = 187
  Caption = #1044#1086#1076#1072#1090#1080'/'#1047#1084#1110#1085#1080#1090#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Date_beg_Edit: TcxDateEdit
    Left = 112
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    EditValue = 0d
  end
  object Date_End_Edit: TcxDateEdit
    Left = 112
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 1
    EditValue = 0d
  end
  object Date_Pay_Edit: TcxDateEdit
    Left = 112
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 2
    EditValue = 0d
  end
  object OK_Button: TcxButton
    Left = 32
    Top = 120
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 3
    OnClick = OK_ButtonClick
  end
  object Cancel_Button: TcxButton
    Left = 128
    Top = 120
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 4
    OnClick = Cancel_ButtonClick
  end
  object Date_Beg_Label: TcxLabel
    Left = 8
    Top = 16
    Width = 88
    Height = 17
    TabOrder = 5
    Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
  end
  object Date_End_Label: TcxLabel
    Left = 8
    Top = 48
    Width = 92
    Height = 17
    TabOrder = 6
    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103
  end
  object Date_Pay_Label: TcxLabel
    Left = 8
    Top = 80
    Width = 87
    Height = 17
    TabOrder = 7
    Caption = #1044#1072#1090#1072' '#1089#1087#1083#1072#1090#1080
  end
end
