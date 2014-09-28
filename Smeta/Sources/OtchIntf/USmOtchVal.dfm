object frmGetOtchislVal: TfrmGetOtchislVal
  Left = 371
  Top = 222
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1087#1077#1088#1077#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084
  ClientHeight = 142
  ClientWidth = 411
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
  object Label1: TLabel
    Left = 39
    Top = 15
    Width = 129
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1072
  end
  object Label2: TLabel
    Left = 39
    Top = 44
    Width = 129
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091
  end
  object Label3: TLabel
    Left = 87
    Top = 82
    Width = 176
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1055#1088#1086#1094#1077#1085#1090' '#1074#1110#1076#1088#1072#1093#1091#1074#1072#1085#1085#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbMonthBeg: TcxComboBox
    Left = 176
    Top = 13
    Width = 130
    Height = 24
    Properties.DropDownListStyle = lsFixedList
    Style.Color = clInfoBk
    TabOrder = 0
  end
  object cbYearBeg: TcxComboBox
    Left = 310
    Top = 12
    Width = 88
    Height = 24
    Properties.DropDownListStyle = lsFixedList
    Style.Color = clInfoBk
    TabOrder = 1
  end
  object cbMonthEnd: TcxComboBox
    Left = 174
    Top = 44
    Width = 133
    Height = 24
    Properties.DropDownListStyle = lsFixedList
    Style.Color = clInfoBk
    TabOrder = 2
  end
  object cbYearEnd: TcxComboBox
    Left = 313
    Top = 44
    Width = 86
    Height = 24
    Properties.DropDownListStyle = lsFixedList
    Style.Color = clInfoBk
    TabOrder = 3
  end
  object cxCalcEdit1: TcxCalcEdit
    Left = 266
    Top = 78
    Width = 133
    Height = 24
    EditValue = '0'
    Style.Color = clInfoBk
    TabOrder = 4
  end
  object cxButton1: TcxButton
    Left = 244
    Top = 112
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 5
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 324
    Top = 112
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 6
    OnClick = cxButton2Click
  end
end
