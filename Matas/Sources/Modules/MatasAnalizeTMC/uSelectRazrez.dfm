object SelRazr: TSelRazr
  Left = 456
  Top = 135
  Width = 257
  Height = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 107
    Top = 44
    Width = 40
    Height = 13
    Caption = #1056#1110#1074#1077#1085#1100
  end
  object Label2: TLabel
    Left = 8
    Top = 16
    Width = 107
    Height = 13
    Caption = #1054#1073#1088#1072#1090#1080' '#1091' '#1088#1086#1079#1088#1110#1079#1110': '
  end
  object CBGrTMC: TcxCheckBox
    Left = 8
    Top = 40
    Width = 89
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CBGrTMCPropertiesChange
    Properties.Caption = #1043#1088#1091#1087#1080' '#1058#1052#1062
    TabOrder = 0
  end
  object SEUroven: TcxSpinEdit
    Left = 152
    Top = 40
    Width = 65
    Height = 21
    Enabled = False
    Properties.MaxValue = 4.000000000000000000
    Properties.MinValue = 1.000000000000000000
    TabOrder = 1
    Value = 1
  end
  object CBMOL: TcxCheckBox
    Left = 8
    Top = 64
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1052#1054#1051
    TabOrder = 2
  end
  object CBBalSch: TcxCheckBox
    Left = 8
    Top = 88
    Width = 161
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1041#1072#1083#1072#1085#1089#1086#1074#1110' '#1088#1072#1093#1091#1085#1082#1080
    TabOrder = 3
  end
  object CBKorSch: TcxCheckBox
    Left = 9
    Top = 112
    Width = 208
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1050#1086#1088#1088#1077#1089#1087#1086#1085#1076#1077#1085#1089#1082#1110' '#1088#1072#1093#1091#1085#1082#1080
    TabOrder = 4
  end
  object CBByut: TcxCheckBox
    Left = 10
    Top = 136
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1041#1102#1076#1078#1077#1090#1080
    TabOrder = 5
  end
  object CBRozd: TcxCheckBox
    Left = 10
    Top = 160
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1056#1086#1079#1076#1110#1083#1080
    TabOrder = 6
  end
  object CBStat: TcxCheckBox
    Left = 11
    Top = 184
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1057#1090#1072#1090#1090#1110
    TabOrder = 7
  end
  object CBKekv: TcxCheckBox
    Left = 11
    Top = 208
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1050#1045#1050#1042#1080
    TabOrder = 8
  end
  object CBNameTMC: TcxCheckBox
    Left = 11
    Top = 232
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1053#1072#1079#1074#1080' '#1058#1052#1062
    TabOrder = 9
  end
  object cxButton1: TcxButton
    Left = 64
    Top = 264
    Width = 129
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    Default = True
    ModalResult = 1
    TabOrder = 10
    OnClick = cxButton1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD22DDDDD
      DDDDDDDDD77DDDDDDDDDDDDD2222DDDDDDDDDDDD7777DDDDDDDDDDD232222DDD
      DDDDDDD787777DDDDDDDDD27322222DDDDDDDD78877777DDDDDDD27732D2222D
      DDDDD78887D7777DDDDDDD272DDDD222DDDDDD787DDDD777DDDDDDD2DDDDDD22
      2DDDDDD7DDDDDD777DDDDDDDDDDDDDDD22DDDDDDDDDDDDDD77DDDDDDDDDDDDDD
      D22DDDDDDDDDDDDDD77DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
    NumGlyphs = 2
    UseSystemPaint = False
  end
end
