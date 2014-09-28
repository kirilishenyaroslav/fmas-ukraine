object ErrSchFrm: TErrSchFrm
  Left = 635
  Top = 829
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1055#1086#1084#1080#1083#1082#1072'!'
  ClientHeight = 127
  ClientWidth = 389
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
  object Label9: TLabel
    Left = 9
    Top = 10
    Width = 161
    Height = 16
    Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object RahLbl: TLabel
    Left = 177
    Top = 10
    Width = 17
    Height = 16
    Caption = 'L1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 9
    Top = 29
    Width = 150
    Height = 16
    Caption = #1085#1077' '#1074#1110#1076#1087#1086#1074#1110#1076#1072#1108' '#1073#1102#1076#1078#1077#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BgtLbl: TLabel
    Left = 167
    Top = 29
    Width = 17
    Height = 16
    Caption = 'L2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 9
    Top = 50
    Width = 189
    Height = 16
    Caption = #1079' '#1103#1082#1086#1075#1086' '#1074#1110#1076#1073#1091#1074#1072#1108#1090#1100#1089#1103' '#1089#1087#1083#1072#1090#1072'!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object cxButton_cancel: TcxButton
    Left = 145
    Top = 95
    Width = 112
    Height = 25
    Caption = #1047#1084#1110#1085#1080#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = cxButton_cancelClick
    UseSystemPaint = False
  end
  object cxButton1: TcxButton
    Left = 265
    Top = 95
    Width = 112
    Height = 25
    Cancel = True
    Caption = #1030#1075#1085#1086#1088#1091#1074#1072#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = cxButton1Click
    UseSystemPaint = False
  end
  object cxComboBox1: TcxComboBox
    Left = 8
    Top = 72
    Width = 369
    Height = 21
    TabOrder = 2
    Text = 'cxComboBox1'
  end
end
