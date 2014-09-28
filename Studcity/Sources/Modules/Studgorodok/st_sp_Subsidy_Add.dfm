object Subsidy_Add_Form: TSubsidy_Add_Form
  Left = 428
  Top = 182
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1089#1091#1073#1089#1080#1076#1080#1080
  ClientHeight = 199
  ClientWidth = 316
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
    Left = 152
    Top = 168
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 232
    Top = 168
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 0
    Width = 297
    Height = 161
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object NameLabel: TcxLabel
      Left = 8
      Top = 8
      Width = 84
      Height = 17
      Style.BorderStyle = ebsNone
      TabOrder = 2
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object NameEdit: TcxTextEdit
      Left = 8
      Top = 24
      Width = 281
      Height = 21
      BeepOnEnter = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 50
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = NameEditKeyPress
    end
    object Short_NameEdit: TcxTextEdit
      Left = 8
      Top = 64
      Width = 185
      Height = 21
      BeepOnEnter = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 20
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = Short_NameEditKeyPress
    end
    object ShortLabel: TcxLabel
      Left = 8
      Top = 48
      Width = 72
      Height = 17
      TabOrder = 3
      Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
    end
    object cxGroupBox: TcxGroupBox
      Left = 8
      Top = 88
      Width = 281
      Height = 65
      Alignment = alTopLeft
      Caption = #1055#1077#1088#1080#1086#1076#1099
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 4
      TabStop = False
      object MaxPeriod_Edit: TcxTextEdit
        Left = 96
        Top = 36
        Width = 81
        Height = 21
        BeepOnEnter = False
        Properties.Alignment.Horz = taRightJustify
        Properties.MaxLength = 3
        Style.Color = clInfoBk
        TabOrder = 3
        OnKeyPress = MaxPeriod_EditKeyPress
      end
      object MinPerLabel: TcxLabel
        Left = 8
        Top = 16
        Width = 89
        Height = 17
        AutoSize = False
        TabOrder = 1
        Caption = #1052#1080#1085'. '#1087#1077#1088#1080#1086#1076
      end
      object MinPeriod_Edit: TcxTextEdit
        Left = 8
        Top = 36
        Width = 81
        Height = 21
        BeepOnEnter = False
        Properties.Alignment.Horz = taRightJustify
        Properties.MaxLength = 3
        Style.Color = clInfoBk
        TabOrder = 0
        OnKeyPress = MinPeriod_EditKeyPress
      end
      object MaxPerLabel: TcxLabel
        Left = 96
        Top = 16
        Width = 81
        Height = 17
        AutoSize = False
        TabOrder = 2
        Caption = #1052#1072#1082#1089'. '#1087#1077#1088#1080#1086#1076
      end
      object Month_Edit: TcxTextEdit
        Left = 184
        Top = 36
        Width = 89
        Height = 21
        BeepOnEnter = False
        Properties.Alignment.Horz = taRightJustify
        Properties.MaxLength = 3
        Style.Color = clInfoBk
        TabOrder = 4
        OnKeyPress = Month_EditKeyPress
      end
      object MonthCountLabel: TcxLabel
        Left = 180
        Top = 16
        Width = 98
        Height = 17
        AutoSize = False
        TabOrder = 5
        Caption = #1050#1086#1083'-'#1074#1086' '#1084#1077#1089'.'
      end
    end
  end
end
