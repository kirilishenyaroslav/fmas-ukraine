object frmServiceDetail: TfrmServiceDetail
  Left = 532
  Top = 288
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1076#1077#1090#1072#1083#1100#1085#1086#1102' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102
  ClientHeight = 163
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 44
    Top = 79
    Width = 96
    Height = 13
    Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091
  end
  object Label3: TLabel
    Left = 44
    Top = 52
    Width = 82
    Height = 13
    Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091
  end
  object Label1: TLabel
    Left = 44
    Top = 20
    Width = 71
    Height = 13
    Caption = #1056#1086#1079#1076#1110#1083'/'#1089#1090#1072#1090#1090#1103
  end
  object cxButton1: TcxButton
    Left = 144
    Top = 121
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 232
    Top = 121
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object cbMonthBeg: TcxComboBox
    Left = 147
    Top = 48
    Width = 153
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 2
  end
  object cbYearBeg: TcxComboBox
    Left = 307
    Top = 48
    Width = 73
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 3
  end
  object cbYearEnd: TcxComboBox
    Left = 307
    Top = 76
    Width = 73
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 4
  end
  object cbMonthEnd: TcxComboBox
    Left = 147
    Top = 76
    Width = 153
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 5
  end
  object cxButtonEdit1: TcxButtonEdit
    Left = 149
    Top = 16
    Width = 268
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    TabOrder = 6
  end
end
