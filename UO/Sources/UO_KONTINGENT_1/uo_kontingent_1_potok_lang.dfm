object fmuo_kontingent_1_potok_lang: Tfmuo_kontingent_1_potok_lang
  Left = 367
  Top = 274
  Width = 361
  Height = 173
  Caption = #1042#1110#1082#1085#1086' '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103' '#1084#1086#1074#1080
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
  object cxButtonEdit1: TcxButtonEdit
    Left = 24
    Top = 24
    Width = 321
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    TabOrder = 0
  end
  object cxTextEdit1: TcxTextEdit
    Left = 24
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyPress = cxTextEdit1KeyPress
  end
  object cxLabel1: TcxLabel
    Left = 24
    Top = 8
    Width = 51
    Height = 17
    TabOrder = 4
    Caption = #1052#1086#1074#1072
  end
  object cxLabel2: TcxLabel
    Left = 24
    Top = 55
    Width = 54
    Height = 17
    TabOrder = 5
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
  end
  object cxButton1: TcxButton
    Left = 72
    Top = 103
    Width = 137
    Height = 25
    Caption = 'F10 - '#1055#1088#1080#1081#1085#1103#1090#1080
    Default = True
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 216
    Top = 103
    Width = 129
    Height = 25
    Cancel = True
    Caption = 'Esc - '#1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object ActionList1: TActionList
    Left = 240
    Top = 56
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
  end
end
