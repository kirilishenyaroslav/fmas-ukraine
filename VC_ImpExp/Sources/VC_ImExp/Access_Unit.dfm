object frmAccess: TfrmAccess
  Left = 608
  Top = 374
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1042#1062'-'#1048#1069
  ClientHeight = 146
  ClientWidth = 160
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = -1
    Width = 73
    Height = 13
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
  end
  object Label2: TLabel
    Left = 8
    Top = 39
    Width = 38
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object LoginEdit: TcxTextEdit
    Left = 8
    Top = 15
    Width = 145
    Height = 21
    AutoSize = False
    BeepOnEnter = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.Color = 14400923
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = 6570797
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 0
    OnKeyPress = LoginEditKeyPress
  end
  object PasswordEdit: TcxTextEdit
    Left = 8
    Top = 54
    Width = 145
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.EchoMode = eemPassword
    Style.Color = 14400923
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = 10382153
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.NativeStyle = False
    Style.Shadow = False
    TabOrder = 1
    OnKeyDown = PasswordEditKeyDown
  end
  object cxButton1: TcxButton
    Left = 9
    Top = 112
    Width = 68
    Height = 25
    Caption = #1042#1093#1086#1076
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 84
    Top = 112
    Width = 68
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object SafePassword_CheckBox: TcxCheckBox
    Left = 9
    Top = 82
    Width = 142
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1055#1086#1084#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
    Style.BorderColor = 4194368
    Style.BorderStyle = ebsUltraFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = 9723683
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.Shadow = False
    TabOrder = 4
  end
end
