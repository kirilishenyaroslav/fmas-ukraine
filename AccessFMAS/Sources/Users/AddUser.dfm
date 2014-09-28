object FormAddUser: TFormAddUser
  Left = 479
  Top = 286
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
  ClientHeight = 271
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    429
    271)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 29
    Top = 15
    Width = 118
    Height = 16
    Caption = #1048'`'#1084#1103' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
  end
  object Label2: TLabel
    Left = 79
    Top = 45
    Width = 68
    Height = 16
    Caption = #1055#1086#1074#1085#1077' '#1110#1084'`'#1103
  end
  object Label3: TLabel
    Left = 94
    Top = 73
    Width = 49
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object Label4: TLabel
    Left = 85
    Top = 140
    Width = 60
    Height = 16
    Caption = #1055#1088#1080#1084#1110#1090#1082#1072
  end
  object Label5: TLabel
    Left = 14
    Top = 105
    Width = 131
    Height = 16
    Caption = #1045#1083#1077#1082#1090#1088#1086#1085#1085#1072' '#1072#1076#1088#1077#1089#1072
  end
  object Label6: TLabel
    Left = 152
    Top = 120
    Width = 112
    Height = 13
    Caption = #1074#1110#1085' '#1078#1077' '#1076#1086#1084#1077#1085#1085#1080#1081' '#1083#1086#1075#1110#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object EditUserName: TEdit
    Left = 153
    Top = 11
    Width = 201
    Height = 24
    Color = clWhite
    TabOrder = 0
  end
  object EditUserFullName: TEdit
    Left = 153
    Top = 41
    Width = 201
    Height = 24
    TabStop = False
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 1
  end
  object EditPasswd: TEdit
    Left = 153
    Top = 69
    Width = 121
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PasswordChar = #183
    TabOrder = 3
  end
  object ButtonOk: TButton
    Left = 245
    Top = 241
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1044#1086#1076#1072#1090#1080
    TabOrder = 4
    OnClick = ButtonOkClick
  end
  object ButtonCancel: TButton
    Left = 325
    Top = 241
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 5
    OnClick = ButtonCancelClick
  end
  object Button1: TButton
    Left = 361
    Top = 42
    Width = 49
    Height = 23
    Caption = '...'
    TabOrder = 2
    OnClick = ButtonCallPeopleSprClick
  end
  object edNote: TMemo
    Left = 152
    Top = 144
    Width = 265
    Height = 89
    MaxLength = 100
    TabOrder = 6
  end
  object EditEMAIL: TEdit
    Left = 153
    Top = 101
    Width = 216
    Height = 24
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object WorkQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 16
    Top = 80
  end
end
