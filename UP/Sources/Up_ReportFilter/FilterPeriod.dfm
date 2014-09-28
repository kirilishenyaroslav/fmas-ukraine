object frmPeriod: TfrmPeriod
  Left = 409
  Top = 381
  Width = 386
  Height = 161
  Caption = #1055#1077#1088#1110#1086#1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 104
    Width = 370
    Height = 19
    Panels = <>
  end
  object cxButtonEnter: TcxButton
    Left = 96
    Top = 72
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    Default = True
    TabOrder = 1
    OnClick = cxButtonEnterClick
  end
  object cxButtonCancel: TcxButton
    Left = 192
    Top = 72
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 2
    OnClick = cxButtonCancelClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 353
    Height = 41
    TabOrder = 3
    object cxLabel1: TcxLabel
      Left = 8
      Top = 16
      Width = 15
      Height = 17
      TabOrder = 0
      Caption = #1047
    end
    object cxDateEditbegin: TcxDateEdit
      Left = 22
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object cxLabel2: TcxLabel
      Left = 184
      Top = 16
      Width = 20
      Height = 17
      TabOrder = 2
      Caption = #1087#1086
    end
    object cxDateEditEnd: TcxDateEdit
      Left = 212
      Top = 14
      Width = 121
      Height = 21
      TabOrder = 3
    end
  end
end
