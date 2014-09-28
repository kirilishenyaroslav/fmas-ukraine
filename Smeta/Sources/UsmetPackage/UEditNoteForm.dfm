object frmEditNote: TfrmEditNote
  Left = 226
  Top = 300
  Width = 498
  Height = 210
  Caption = #1044#1086#1074#1110#1076#1082#1086#1074#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1086#1073#39#1108#1082#1090#1072' '#1089#1090#1088#1091#1082#1090#1091#1088#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 142
    Width = 490
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 157
      Top = 7
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 236
      Top = 7
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object cxMemo1: TcxMemo
    Left = 0
    Top = 0
    Width = 490
    Height = 142
    Align = alClient
    Properties.MaxLength = 4095
    Style.Color = clInfoBk
    TabOrder = 1
  end
end
