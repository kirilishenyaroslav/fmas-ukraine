object frmTableParams: TfrmTableParams
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1090#1072#1073#1077#1083#1100#1085#1086#1075#1086' '#1086#1073#1083#1110#1082#1091
  ClientHeight = 446
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 120
    Height = 13
    Caption = #1055#1086#1082#1072#1079#1091#1074#1072#1090#1080' '#1075#1086#1076#1080#1085#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 152
    Height = 13
    Caption = #1056#1086#1079#1084#1110#1088' '#1082#1083#1110#1090#1080#1085#1086#1082' '#1091' '#1090#1072#1073#1077#1083#1110':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 56
    Top = 72
    Width = 46
    Height = 13
    Caption = #1074#1080#1089#1086#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 184
    Top = 72
    Width = 49
    Height = 13
    Caption = #1096#1080#1088#1080#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DecBox: TComboBox
    Left = 152
    Top = 12
    Width = 193
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = #1079' '#1076#1077#1089#1103#1090#1080#1084#1080' '#1076#1086#1083#1103#1084#1080' '#1075#1086#1076#1080#1085#1080
    Items.Strings = (
      #1079' '#1076#1077#1089#1103#1090#1080#1084#1080' '#1076#1086#1083#1103#1084#1080' '#1075#1086#1076#1080#1085#1080
      #1079' '#1093#1074#1080#1083#1080#1085#1072#1084#1080' '#1090#1072' '#1089#1077#1082#1091#1085#1076#1072#1084#1080)
  end
  object Height: TSpinEdit
    Left = 120
    Top = 67
    Width = 49
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 24
  end
  object Width: TSpinEdit
    Left = 248
    Top = 67
    Width = 49
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 32
  end
end
