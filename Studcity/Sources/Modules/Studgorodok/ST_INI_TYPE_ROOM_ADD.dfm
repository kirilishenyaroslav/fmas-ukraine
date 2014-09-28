object ST_INI_TYPE_ROOM_ADD_Form: TST_INI_TYPE_ROOM_ADD_Form
  Left = 633
  Top = 249
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = ' '#1090#1080#1087#1072' '#1082#1086#1084#1085#1072#1090#1099
  ClientHeight = 142
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OKButton: TcxButton
    Left = 104
    Top = 112
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 184
    Top = 112
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 249
    Height = 97
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object NameLabel: TcxLabel
      Left = 8
      Top = 8
      Width = 84
      Height = 17
      TabOrder = 3
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object NameEdit: TcxTextEdit
      Left = 8
      Top = 24
      Width = 153
      Height = 21
      BeepOnEnter = False
      Properties.MaxLength = 45
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = NameEditKeyPress
    end
    object PeopleLabel: TcxLabel
      Left = 8
      Top = 48
      Width = 113
      Height = 17
      TabOrder = 4
      Caption = #1052#1072#1082#1089' '#1095#1080#1089#1083#1086' '#1078#1080#1090#1077#1083#1077#1081
    end
    object PeopleEdit: TcxTextEdit
      Left = 8
      Top = 64
      Width = 81
      Height = 21
      BeepOnEnter = False
      Properties.Alignment.Horz = taRightJustify
      Properties.MaxLength = 3
      Style.Color = clInfoBk
      TabOrder = 2
      OnKeyPress = PeopleEditKeyPress
    end
    object PlaceLabel: TcxLabel
      Left = 160
      Top = 48
      Width = 87
      Height = 17
      Properties.Alignment.Horz = taCenter
      TabOrder = 5
      Caption = #1055#1083#1086#1097#1072#1076#1100', '#1084'.'#1082#1074'.'
    end
    object Short_NameEdit: TcxTextEdit
      Left = 168
      Top = 24
      Width = 73
      Height = 21
      BeepOnEnter = False
      Properties.MaxLength = 4
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = Short_NameEditKeyPress
    end
    object ShortLabel: TcxLabel
      Left = 168
      Top = 8
      Width = 72
      Height = 17
      TabOrder = 6
      Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
    end
    object PlaceEdit: TcxCurrencyEdit
      Left = 160
      Top = 64
      Width = 81
      Height = 21
      Properties.DisplayFormat = '0.000'
      Style.Color = clInfoBk
      TabOrder = 7
    end
  end
end
