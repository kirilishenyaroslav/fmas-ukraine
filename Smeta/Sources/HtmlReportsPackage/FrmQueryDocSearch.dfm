object frmDocSearchInfo: TfrmDocSearchInfo
  Left = 314
  Top = 241
  BorderStyle = bsDialog
  Caption = #1053#1072#1076#1072#1090#1080' '#1072#1085#1072#1083#1110#1079' '#1087#1086#1082#1072#1079#1085#1080#1082#1110#1074
  ClientHeight = 145
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label4: TLabel
    Left = 5
    Top = 6
    Width = 212
    Height = 13
    Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1087#1086#1082#1072#1079#1085#1080#1082#1080' '#1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 172
    Top = 29
    Width = 15
    Height = 13
    Caption = #1087#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RadioButton1: TRadioButton
    Left = 8
    Top = 57
    Width = 233
    Height = 17
    Caption = #1059' '#1088#1086#1079#1088#1110#1079#1110' '#1088#1086#1079#1076#1110#1083#1110#1074
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 8
    Top = 89
    Width = 329
    Height = 17
    Caption = #1059' '#1088#1086#1079#1088#1110#1079#1110' '#1088#1086#1079#1076#1110#1083#1110#1074'/'#1089#1090#1072#1090#1077#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object cxButton1: TcxButton
    Left = 145
    Top = 113
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object edtMonthBeg: TcxMRUEdit
    Left = 6
    Top = 26
    Width = 91
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 5
    Properties.ShowEllipsis = False
    Style.Color = clWhite
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'Microsoft Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
  end
  object edtYearBeg: TcxSpinEdit
    Left = 99
    Top = 26
    Width = 70
    Height = 21
    ParentFont = False
    Properties.ValueType = vtInt
    Style.Color = clWhite
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'Microsoft Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
  end
  object edtMonthEnd: TcxMRUEdit
    Left = 189
    Top = 26
    Width = 91
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 5
    Properties.ShowEllipsis = False
    Style.Color = clWhite
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'Microsoft Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
  end
  object edtYearEnd: TcxSpinEdit
    Left = 282
    Top = 26
    Width = 70
    Height = 21
    ParentFont = False
    Properties.ValueType = vtInt
    Style.Color = clWhite
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'Microsoft Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
  end
end
