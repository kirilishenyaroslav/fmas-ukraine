object frmFilterAge: TfrmFilterAge
  Left = 404
  Top = 262
  Width = 381
  Height = 162
  Caption = #1060#1110#1083#1100#1090#1088' '#1085#1072' '#1074#1110#1082
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
    Top = 109
    Width = 373
    Height = 19
    Panels = <>
  end
  object cxButtonEnter: TcxButton
    Left = 144
    Top = 72
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    Default = True
    TabOrder = 1
    OnClick = cxButtonEnterClick
  end
  object cxButtonCancel: TcxButton
    Left = 240
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
    Width = 329
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
    object cxLabel2: TcxLabel
      Left = 144
      Top = 16
      Width = 20
      Height = 17
      TabOrder = 1
      Caption = #1087#1086
    end
    object cxSpinEditBegin: TcxSpinEdit
      Left = 24
      Top = 14
      Width = 109
      Height = 21
      TabOrder = 2
    end
    object cxSpinEditEnd: TcxSpinEdit
      Left = 174
      Top = 14
      Width = 121
      Height = 21
      TabOrder = 3
    end
  end
end
