object frmDocEdit: TfrmDocEdit
  Left = 426
  Top = 223
  BorderStyle = bsDialog
  Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
  ClientHeight = 300
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 11
    Top = 5
    Width = 68
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = #1055#1088#1086#1075#1088#1072#1084#1072
  end
  object cxButtonEdit2: TcxButtonEdit
    Left = 11
    Top = 26
    Width = 417
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
    TabOrder = 1
  end
  object cxLabel2: TcxLabel
    Left = 11
    Top = 53
    Width = 74
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Caption = #1058#1080#1087' '#1082#1086#1096#1090#1110#1074
  end
  object cxButtonEdit1: TcxButtonEdit
    Left = 11
    Top = 74
    Width = 417
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    TabOrder = 3
  end
  object cxLabel3: TcxLabel
    Left = 11
    Top = 105
    Width = 105
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = #1054#1087#1080#1089' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
  end
  object cxMemo1: TcxMemo
    Left = 11
    Top = 125
    Width = 417
    Height = 41
    TabOrder = 5
  end
  object cxLabel4: TcxLabel
    Left = 13
    Top = 176
    Width = 105
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
    Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
  end
  object cxDateEdit1: TcxDateEdit
    Left = 13
    Top = 195
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object cxLabel5: TcxLabel
    Left = 173
    Top = 176
    Width = 105
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 8
    Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
  end
  object cxTextEdit1: TcxTextEdit
    Left = 176
    Top = 195
    Width = 121
    Height = 21
    TabOrder = 9
    Text = '1'
  end
  object cxButton1: TcxButton
    Left = 136
    Top = 270
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 10
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 216
    Top = 270
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 11
    OnClick = cxButton2Click
  end
  object cxRadioButton1: TcxRadioButton
    Left = 22
    Top = 240
    Width = 113
    Height = 17
    Caption = #1050#1086#1096#1090#1086#1088#1080#1089
    Checked = True
    TabOrder = 12
    TabStop = True
  end
  object cxRadioButton2: TcxRadioButton
    Left = 148
    Top = 240
    Width = 277
    Height = 17
    Caption = #1044#1086#1074#1110#1076#1082#1072' '#1087#1088#1086' '#1074#1085#1077#1089#1077#1085#1085#1103' '#1079#1084#1110#1085' '#1074' '#1082#1086#1096#1090#1086#1088#1080#1089
    TabOrder = 13
  end
end
