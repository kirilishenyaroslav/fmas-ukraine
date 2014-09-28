object MainForm: TMainForm
  Left = 186
  Top = 107
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1092#1072#1081#1083#1086#1074' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081
  ClientHeight = 218
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 113
    Height = 13
    Caption = #1060#1072#1081#1083' '#1089#1086' '#1089#1082#1088#1080#1087#1090#1086#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 101
    Height = 13
    Caption = #1058#1080#1087' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 128
    Width = 114
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 160
    Width = 105
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FileEdit: TEdit
    Left = 8
    Top = 32
    Width = 353
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object OpenFileButton: TButton
    Left = 368
    Top = 30
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = OpenFileButtonClick
  end
  object DateEdit: TDateTimePicker
    Left = 168
    Top = 156
    Width = 105
    Height = 21
    Date = 38436.590754837960000000
    Time = 38436.590754837960000000
    TabOrder = 2
  end
  object Button1: TButton
    Left = 128
    Top = 190
    Width = 185
    Height = 25
    Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1092#1072#1081#1083' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
    TabOrder = 3
    OnClick = Button1Click
  end
  object NumberEdit: TCheckEdit
    Left = 168
    Top = 124
    Width = 105
    Height = 21
    MaxLength = 8
    TabOrder = 4
    InputSet = isDigits
  end
  object SystemBox: TComboBox
    Left = 8
    Top = 84
    Width = 441
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object OpenDialog: TOpenDialog
    Left = 320
  end
  object SaveDialog: TSaveDialog
    Left = 352
  end
end
