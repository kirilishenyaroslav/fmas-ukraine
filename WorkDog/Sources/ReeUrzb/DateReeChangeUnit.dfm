object Form6: TForm6
  Left = 630
  Top = 479
  Width = 326
  Height = 211
  Caption = #1047#1084#1110#1085#1072' '#1076#1072#1090#1080' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1111'/'#1082#1086#1084#1077#1085#1090#1072#1088#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = -1
    Top = 0
    Width = 308
    Height = 49
    Caption = #1044#1072#1090#1072' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1111' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object cxDateEdit1: TcxDateEdit
      Left = 11
      Top = 19
      Width = 135
      Height = 21
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clMoneyGreen
      Style.LookAndFeel.Kind = lfUltraFlat
      TabOrder = 0
    end
  end
  object grp2: TGroupBox
    Left = -1
    Top = 54
    Width = 308
    Height = 78
    Caption = #1050#1086#1084#1077#1085#1090#1072#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object cxMemo1: TcxMemo
      Left = 12
      Top = 21
      Width = 279
      Height = 48
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 134
    Width = 307
    Height = 38
    TabOrder = 2
    object cxOk: TcxButton
      Left = 14
      Top = 6
      Width = 119
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      TabOrder = 0
      OnClick = cxOkClick
    end
    object cxCancel: TcxButton
      Left = 158
      Top = 6
      Width = 119
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxCancelClick
    end
  end
end
