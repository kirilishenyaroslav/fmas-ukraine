object frmReestr_filter: TfrmReestr_filter
  Left = 388
  Top = 161
  Width = 290
  Height = 187
  Caption = #1060#1110#1083#1100#1090#1088
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
  object cxDateEdit1: TcxDateEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object cxDateEdit2: TcxDateEdit
    Left = 152
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object cxCheckBox1: TcxCheckBox
    Left = 8
    Top = 56
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = cxCheckBox1PropertiesChange
    Properties.Caption = #1044#1110#1102#1095#1110
    State = cbsChecked
    TabOrder = 2
  end
  object cxCheckBox2: TcxCheckBox
    Left = 8
    Top = 80
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = cxCheckBox2PropertiesChange
    Properties.Caption = #1053#1077' '#1076#1110#1102#1095#1110
    State = cbsChecked
    TabOrder = 3
  end
  object cxCheckBox3: TcxCheckBox
    Left = 152
    Top = 56
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = cxCheckBox3PropertiesChange
    Properties.Caption = #1060#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072
    State = cbsChecked
    TabOrder = 4
  end
  object cxCheckBox4: TcxCheckBox
    Left = 152
    Top = 80
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = cxCheckBox4PropertiesChange
    Properties.Caption = #1070#1088#1080#1076#1080#1095#1085#1072' '#1086#1089#1086#1073#1072
    State = cbsChecked
    TabOrder = 5
  end
  object cxButton1: TcxButton
    Left = 112
    Top = 120
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 6
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 200
    Top = 120
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 7
    OnClick = cxButton2Click
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 0
    Width = 81
    Height = 17
    TabOrder = 8
    Caption = #1044#1110#1103' '#1076#1086#1075#1086#1074#1086#1088#1091
  end
end
