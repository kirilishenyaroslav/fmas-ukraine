object DateInputForm: TDateInputForm
  Left = 658
  Top = 352
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1060#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1087#1083#1072#1090#1110#1078#1085#1086#1075#1086' '#1076#1086#1088#1091#1095#1077#1085#1085#1103
  ClientHeight = 149
  ClientWidth = 179
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object cxButton1: TcxButton
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    Default = True
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 88
    Top = 104
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object DateEdit: TcxDateEdit
    Left = 8
    Top = 24
    Width = 153
    Height = 21
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = clMoneyGreen
    TabOrder = 2
  end
  object NumEdit: TcxTextEdit
    Left = 72
    Top = 64
    Width = 89
    Height = 21
    Enabled = False
    Style.Color = clSilver
    TabOrder = 3
  end
  object cxCheckBox1: TcxCheckBox
    Left = 8
    Top = 64
    Width = 65
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = cxCheckBox1PropertiesChange
    Properties.Caption = #1053#1086#1084#1077#1088
    TabOrder = 4
  end
end
