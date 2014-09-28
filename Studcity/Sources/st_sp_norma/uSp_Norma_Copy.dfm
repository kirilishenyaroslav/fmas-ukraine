object frm_Norma_Copy: Tfrm_Norma_Copy
  Left = 538
  Top = 363
  Width = 349
  Height = 128
  Caption = #1050#1086#1087#1110#1102#1074#1072#1090#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonEdit_build: TcxButtonEdit
    Left = 8
    Top = 24
    Width = 313
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEdit_buildPropertiesButtonClick
    Style.Color = clInfoBk
    TabOrder = 0
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Width = 67
    Height = 17
    TabOrder = 1
    Caption = #1043#1091#1088#1090#1086#1078#1080#1090#1086#1082
  end
  object cxButton1: TcxButton
    Left = 248
    Top = 56
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 168
    Top = 56
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 3
    OnClick = cxButton2Click
  end
end
