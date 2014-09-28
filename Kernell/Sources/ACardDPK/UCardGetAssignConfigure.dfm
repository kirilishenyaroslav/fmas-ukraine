object frmAssignConfigureForm: TfrmAssignConfigureForm
  Left = 398
  Top = 282
  Width = 459
  Height = 289
  Caption = #1050#1072#1088#1090#1082#1072' '#1072#1085#1072#1083#1110#1090#1080#1095#1085#1086#1075#1086' '#1086#1073#1083#1110#1082#1091' '#1086#1090#1088#1080#1084#1072#1085#1080#1093' '#1072#1089#1080#1075#1085#1091#1074#1072#1085#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label2: TLabel
    Left = 43
    Top = 140
    Width = 56
    Height = 16
    Caption = #1055#1086#1095#1072#1090#1086#1082
  end
  object Label3: TLabel
    Left = 27
    Top = 166
    Width = 74
    Height = 16
    Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
  end
  object Label4: TLabel
    Left = 51
    Top = 108
    Width = 321
    Height = 16
    Caption = #1055#1077#1088#1110#1086#1076', '#1079#1072' '#1103#1082#1080#1081' '#1090#1088#1077#1073#1072' '#1087#1086#1082#1072#1079#1072#1090#1080' '#1087#1086#1082#1072#1079#1085#1080#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 25
    Top = 42
    Width = 81
    Height = 16
    Caption = #1058#1080#1087' '#1082#1086#1096#1090#1110#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 31
    Top = 15
    Width = 74
    Height = 16
    Caption = #1055#1088#1086#1075#1088#1072#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbMonthBeg: TcxComboBox
    Left = 120
    Top = 136
    Width = 169
    Height = 24
    Properties.DropDownListStyle = lsFixedList
    Properties.ReadOnly = False
    Style.Color = clInfoBk
    TabOrder = 0
  end
  object cbYearBeg: TcxComboBox
    Left = 296
    Top = 144
    Width = 121
    Height = 24
    Properties.DropDownListStyle = lsFixedList
    Style.Color = clInfoBk
    TabOrder = 1
  end
  object cbMonthEnd: TcxComboBox
    Left = 120
    Top = 162
    Width = 169
    Height = 24
    Properties.DropDownListStyle = lsFixedList
    Properties.ReadOnly = False
    Style.Color = clInfoBk
    TabOrder = 2
  end
  object cxButton1: TcxButton
    Left = 288
    Top = 232
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 3
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 368
    Top = 232
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 4
    OnClick = cxButton2Click
  end
  object cxButtonEdit2: TcxButtonEdit
    Left = 120
    Top = 38
    Width = 297
    Height = 24
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
    Style.Color = clInfoBk
    TabOrder = 5
  end
  object cxButtonEdit3: TcxButtonEdit
    Left = 120
    Top = 11
    Width = 297
    Height = 24
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit3PropertiesButtonClick
    Style.Color = clInfoBk
    TabOrder = 6
  end
end
