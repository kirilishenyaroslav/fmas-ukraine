object frmCatRaiseStajEdit: TfrmCatRaiseStajEdit
  Left = 353
  Top = 297
  BorderStyle = bsDialog
  Caption = 
    #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1086' '#1076#1086#1087#1091#1089#1090#1080#1084#1110#1081' '#1085#1072#1076#1073#1072#1074#1094#1110' '#1079#1072' '#1089#1090#1072#1078' '#1076#1083#1103' '#1082#1072#1090#1077#1075#1086#1088#1110#1111' '#1087#1077#1088#1089#1086#1085#1072#1083 +
    #1091
  ClientHeight = 162
  ClientWidth = 512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 125
    Top = 16
    Width = 38
    Height = 16
    Caption = #1057#1090#1072#1078
  end
  object Label2: TLabel
    Left = 21
    Top = 48
    Width = 141
    Height = 16
    Caption = #1053#1072#1076#1073#1072#1074#1082#1072'/'#1076#1086#1087#1083#1072#1090#1072
  end
  object Label3: TLabel
    Left = 5
    Top = 80
    Width = 157
    Height = 16
    Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
  end
  object cxButton1: TcxButton
    Left = 104
    Top = 128
    Width = 113
    Height = 25
    Caption = #1054#1050
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 296
    Top = 128
    Width = 121
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object cxLookupComboBox1: TcxLookupComboBox
    Left = 177
    Top = 13
    Width = 199
    Height = 24
    Properties.KeyFieldNames = 'ID_STAJ'
    Properties.ListColumns = <
      item
        Caption = #1057#1090#1072#1078
        FieldName = 'NAME_STAJ'
      end>
    Properties.ListSource = DM.StajDataSource
    Style.Color = clInfoBk
    TabOrder = 2
  end
  object cxButtonEdit1: TcxButtonEdit
    Left = 177
    Top = 43
    Width = 321
    Height = 24
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    Style.Color = clInfoBk
    TabOrder = 3
  end
  object cxLookupComboBox2: TcxLookupComboBox
    Left = 176
    Top = 77
    Width = 320
    Height = 24
    Properties.KeyFieldNames = 'ID_CATEGORY'
    Properties.ListColumns = <
      item
        Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
        FieldName = 'NAME_CATEGORY'
      end>
    Properties.ListSource = DM.CatDataSource
    Style.Color = clInfoBk
    TabOrder = 4
  end
end
