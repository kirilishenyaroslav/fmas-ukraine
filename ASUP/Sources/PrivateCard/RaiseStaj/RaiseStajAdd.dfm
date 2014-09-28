object AddRaise: TAddRaise
  Left = 306
  Top = 205
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080' '#1085#1072#1076#1073#1072#1074#1082#1080' '#1079#1072' '#1089#1090#1072#1078
  ClientHeight = 243
  ClientWidth = 531
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 141
    Top = 16
    Width = 38
    Height = 16
    Caption = #1057#1090#1072#1078
  end
  object Label2: TLabel
    Left = 37
    Top = 48
    Width = 141
    Height = 16
    Caption = #1053#1072#1076#1073#1072#1074#1082#1072'/'#1076#1086#1087#1083#1072#1090#1072
  end
  object Label3: TLabel
    Left = 69
    Top = 80
    Width = 110
    Height = 16
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1088#1086#1082#1110#1074
  end
  object Label4: TLabel
    Left = 37
    Top = 112
    Width = 140
    Height = 16
    Caption = #1055#1088#1086#1094#1077#1085#1090' '#1085#1072#1076#1073#1072#1074#1082#1080
  end
  object Label5: TLabel
    Left = 85
    Top = 152
    Width = 94
    Height = 16
    Caption = #1055#1077#1088#1110#1086#1076' '#1076#1110#1111'   '#1079
  end
  object Label6: TLabel
    Left = 319
    Top = 150
    Width = 19
    Height = 16
    Caption = #1087#1086
  end
  object cxCalcEdit1: TcxCalcEdit
    Left = 192
    Top = 77
    Width = 121
    Height = 24
    EditValue = '0'
    Style.Color = clInfoBk
    TabOrder = 0
  end
  object cxCalcEdit2: TcxCalcEdit
    Left = 192
    Top = 109
    Width = 121
    Height = 24
    EditValue = '0'
    Style.Color = clInfoBk
    TabOrder = 1
  end
  object cxDateEdit1: TcxDateEdit
    Left = 192
    Top = 146
    Width = 121
    Height = 24
    Style.Color = clInfoBk
    TabOrder = 2
    EditValue = '01.01.1900'
  end
  object cxDateEdit2: TcxDateEdit
    Left = 344
    Top = 146
    Width = 121
    Height = 24
    Style.Color = clInfoBk
    TabOrder = 3
    EditValue = '31.12.2150'
  end
  object cxButtonEdit1: TcxButtonEdit
    Left = 192
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
    TabOrder = 4
  end
  object cxLookupComboBox1: TcxLookupComboBox
    Left = 193
    Top = 13
    Width = 320
    Height = 24
    Properties.KeyFieldNames = 'ID_STAJ'
    Properties.ListColumns = <
      item
        Caption = #1057#1090#1072#1078
        FieldName = 'NAME_STAJ'
      end>
    Properties.ListSource = DM.StajDataSource
    Style.Color = clInfoBk
    TabOrder = 5
  end
  object cxButton1: TcxButton
    Left = 120
    Top = 208
    Width = 113
    Height = 25
    Caption = #1054#1050
    TabOrder = 6
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 320
    Top = 208
    Width = 121
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 7
    OnClick = cxButton2Click
  end
end
