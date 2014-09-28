object TestForm: TTestForm
  Left = 104
  Top = 92
  Width = 696
  Height = 480
  Caption = #1058#1077#1089#1090' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 89
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 264
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object SelectOneButton: TButton
      Left = 24
      Top = 8
      Width = 185
      Height = 25
      Caption = #1042#1099#1073#1086#1088#1082#1072' '#1086#1076#1085#1086#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      TabOrder = 0
      OnClick = SelectOneButtonClick
    end
  end
  object OutMemo: TMemo
    Left = 0
    Top = 89
    Width = 688
    Height = 144
    Align = alTop
    TabOrder = 1
  end
  object MultiSelect: TButton
    Left = 24
    Top = 32
    Width = 187
    Height = 25
    Caption = #1052#1085#1086#1078#1077#1089#1090#1074#1077#1085#1085#1099#1081' '#1074#1099#1073#1086#1088
    TabOrder = 2
    OnClick = MultiSelectClick
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
    SQLDialect = 3
    Timeout = 0
    Left = 88
    Top = 64
  end
  object MainMenu1: TMainMenu
    Left = 320
    Top = 112
    object OpenSpravItem: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
      OnClick = OpenSpravItemClick
    end
  end
end
