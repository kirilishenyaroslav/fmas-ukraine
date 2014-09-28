object frmEditValue: TfrmEditValue
  Left = 408
  Top = 308
  BorderStyle = bsDialog
  Caption = #1047#1085#1072#1095#1077#1085#1085#1103' '#1087#1086#1082#1072#1079#1085#1080#1082#1072
  ClientHeight = 193
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 29
    Top = 9
    Width = 33
    Height = 13
    Caption = #1056#1086#1079#1076#1110#1083
  end
  object Label2: TLabel
    Left = 29
    Top = 48
    Width = 28
    Height = 13
    Caption = #1050#1045#1050#1042
  end
  object Label3: TLabel
    Left = 30
    Top = 106
    Width = 87
    Height = 13
    Caption = #1057#1091#1084#1072' '#1072#1089#1080#1075#1085#1091#1074#1072#1085#1100
  end
  object cxButton1: TcxButton
    Left = 136
    Top = 163
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 216
    Top = 163
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object cxButtonEdit1: TcxButtonEdit
    Left = 29
    Top = 25
    Width = 377
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    TabOrder = 2
  end
  object cxButtonEdit2: TcxButtonEdit
    Left = 29
    Top = 64
    Width = 377
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
    TabOrder = 3
  end
  object cxCalcEdit1: TcxCalcEdit
    Left = 123
    Top = 102
    Width = 283
    Height = 21
    EditValue = 0.000000000000000000
    TabOrder = 4
  end
end
