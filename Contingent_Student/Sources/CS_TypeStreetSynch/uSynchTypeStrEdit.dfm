object fmSynchTypeStrEdit: TfmSynchTypeStrEdit
  Left = 448
  Top = 393
  Width = 453
  Height = 197
  Caption = #1047#1074#39#1103#1079#1086#1082' '#1090#1080#1087#1110#1074' '#1074#1091#1083#1080#1094#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 8
    Top = 46
    Width = 133
    Height = 17
    TabOrder = 0
    Caption = #1053#1072#1079#1074#1072' '#1090#1080#1087#1091' '#1074#1091#1083#1080#1094#1110' '#1028#1044#1041#1054
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 4
    Width = 137
    Height = 17
    AutoSize = False
    TabOrder = 1
    Caption = #1053#1072#1079#1074#1072' '#1090#1080#1087#1091' '#1074#1091#1083#1080#1094#1110
  end
  object ButtonEdit_TypeStr: TcxButtonEdit
    Left = 8
    Top = 20
    Width = 409
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEdit_TypeStrPropertiesButtonClick
    Style.Color = 16311512
    TabOrder = 2
    OnKeyPress = TextEdit_typeStr_edboKeyPress
  end
  object OkButton: TcxButton
    Left = 238
    Top = 122
    Width = 87
    Height = 25
    Caption = #1047#1074#39#1103#1079#1072#1090#1080
    TabOrder = 3
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 331
    Top = 122
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1042#1080#1081#1090#1080
    TabOrder = 4
    OnClick = CancelButtonClick
  end
  object CheckBoxDefault: TcxCheckBox
    Left = 8
    Top = 96
    Width = 265
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1074#1072#1090#1080' '#1079#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
    TabOrder = 5
  end
  object ButtonEditStreetType: TcxButtonEdit
    Left = 8
    Top = 62
    Width = 409
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEditStreetTypePropertiesButtonClick
    Style.Color = 16311512
    TabOrder = 6
    OnKeyPress = TextEdit_typeStr_edboKeyPress
  end
end
