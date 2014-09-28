object FormFilterSeriesWaybill: TFormFilterSeriesWaybill
  Left = 462
  Top = 327
  BorderStyle = bsToolWindow
  Caption = #1042#1110#1076#1073#1110#1088' '#1083#1080#1089#1090#1110#1074' '#1079#1072' '#1089#1077#1088#1110#1103#1084#1080
  ClientHeight = 177
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 522
    Height = 65
    Align = alTop
    Caption = #1042#1110#1076#1073#1110#1088' '#1083#1080#1089#1090#1110#1074' '#1079#1072' '#1089#1077#1088#1110#1103#1084#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 168
    Top = 144
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 256
    Top = 144
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 72
    Width = 521
    Height = 65
    Caption = #1086#1073#1077#1088#1110#1090#1100' '#1087#1077#1088#1110#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      Left = 104
      Top = 24
      Width = 10
      Height = 16
      Caption = #1079
    end
    object Label2: TLabel
      Left = 280
      Top = 24
      Width = 19
      Height = 16
      Caption = #1087#1086
    end
    object DateBegDateEdit: TcxDateEdit
      Left = 120
      Top = 24
      Width = 121
      Height = 24
      TabOrder = 0
    end
    object DateEndDateEdit: TcxDateEdit
      Left = 304
      Top = 24
      Width = 121
      Height = 24
      TabOrder = 1
    end
  end
end
