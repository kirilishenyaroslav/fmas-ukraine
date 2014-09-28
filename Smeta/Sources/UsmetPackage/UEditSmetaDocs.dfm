object frmEditSmetaDocs: TfrmEditSmetaDocs
  Left = 216
  Top = 220
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1084' '#1087#1083#1072#1085#1091#1074#1072#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1091
  ClientHeight = 266
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 8
    Top = -24
    Width = 489
    Height = 249
  end
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 150
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 33
    Top = 55
    Width = 150
    Height = 18
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 34
    Top = 88
    Width = 150
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 272
    Top = 120
    Width = 68
    Height = 16
    Caption = #1055#1110#1076#1089#1090#1072#1074#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 328
    Top = 234
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 408
    Top = 234
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 1
    OnClick = Button2Click
  end
  object EdNum: TEdit
    Left = 190
    Top = 24
    Width = 296
    Height = 24
    Color = clInfoBk
    MaxLength = 149
    TabOrder = 2
  end
  object DocDate: TDateTimePicker
    Left = 191
    Top = 55
    Width = 294
    Height = 24
    Date = 0.646944270833046000
    Time = 0.646944270833046000
    Color = clInfoBk
    DateFormat = dfLong
    TabOrder = 3
  end
  object cbDocType: TComboBox
    Left = 190
    Top = 88
    Width = 294
    Height = 22
    Style = csOwnerDrawFixed
    Color = clInfoBk
    ItemHeight = 16
    TabOrder = 4
    Items.Strings = (
      #1041#1102#1076#1078#1077#1090
      #1050#1086#1088#1077#1075#1091#1074#1072#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1091)
  end
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 120
    Width = 249
    Height = 97
    Caption = #1042#1083#1072#1089#1090#1080#1074#1086#1089#1090#1110' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object RadioButton1: TRadioButton
    Left = 32
    Top = 139
    Width = 209
    Height = 17
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1087#1110#1076#1090#1074#1077#1088#1076#1078#1077#1085#1086
    Checked = True
    TabOrder = 6
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 32
    Top = 165
    Width = 209
    Height = 17
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1077' '#1087#1110#1076#1090#1074#1077#1088#1076#1078#1077#1085#1086
    TabOrder = 7
  end
  object RadioButton3: TRadioButton
    Left = 32
    Top = 191
    Width = 193
    Height = 17
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1072' '#1085#1077#1084#1072#1108
    TabOrder = 8
  end
  object Memo1: TMemo
    Left = 272
    Top = 144
    Width = 217
    Height = 73
    Color = clInfoBk
    TabOrder = 9
  end
end
