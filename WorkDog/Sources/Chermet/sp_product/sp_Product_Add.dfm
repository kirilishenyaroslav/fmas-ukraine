object sp_Product_Add_Form: Tsp_Product_Add_Form
  Left = 340
  Top = 232
  BorderStyle = bsDialog
  Caption = 'sp_Product_Add_Form'
  ClientHeight = 295
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  DesignSize = (
    361
    295)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 7
    Width = 345
    Height = 170
    Shape = bsFrame
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 84
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1087#1088#1086#1076#1091#1082#1094#1110#1111':'
  end
  object Bevel2: TBevel
    Left = 8
    Top = 182
    Width = 345
    Height = 74
    Anchors = [akLeft, akBottom]
    Shape = bsFrame
    Style = bsRaised
  end
  object NameUnitMeasLabel: TLabel
    Left = 16
    Top = 56
    Width = 112
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1086#1076#1080#1085#1080#1094#1110' '#1074#1080#1084#1110#1088#1091':'
  end
  object KindRadioGroup: TcxRadioGroup
    Left = 16
    Top = 89
    Width = 161
    Height = 81
    Anchors = [akTop]
    Properties.Items = <
      item
        Caption = #1044#1086#1076#1072#1090#1080' '#1090#1080#1087' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      end
      item
        Caption = #1044#1086#1076#1072#1090#1080' '#1087#1088#1086#1076#1091#1082#1094#1110#1102
      end>
    Properties.OnChange = KindRadioGroupPropertiesChange
    TabOrder = 1
    Caption = ''
  end
  object NameEdit: TcxTextEdit
    Left = 16
    Top = 32
    Width = 329
    Height = 21
    Properties.MaxLength = 60
    TabOrder = 0
  end
  object LevelRadioGroup: TcxRadioGroup
    Left = 184
    Top = 89
    Width = 161
    Height = 81
    Anchors = [akTop]
    Properties.Items = <
      item
        Caption = #1044#1086#1076#1072#1090#1080' '#1085#1072' '#1090#1086#1084#1091' '#1078' '#1088#1110#1074#1085#1110
      end
      item
        Caption = #1044#1086#1076#1072#1090#1080' '#1085#1072' '#1088#1110#1074#1077#1085#1100' '#1085#1080#1078#1095#1077
      end>
    TabOrder = 2
    Caption = ''
  end
  object CancelButton: TcxButton
    Left = 278
    Top = 264
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    TabOrder = 3
  end
  object OkButton: TcxButton
    Left = 192
    Top = 264
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 4
    OnClick = OkButtonClick
  end
  object CheckBox1: TcxCheckBox
    Left = 16
    Top = 184
    Width = 121
    Height = 21
    Anchors = [akLeft, akBottom]
    Properties.DisplayUnchecked = 'False'
    Properties.ReadOnly = False
    Properties.ValueChecked = 1
    Properties.ValueUnchecked = 0
    Properties.Caption = #1043#1086#1083#1086#1074#1085#1072' '#1087#1088#1086#1076#1091#1082#1094#1110#1103
    TabOrder = 5
  end
  object CheckBox2: TcxCheckBox
    Left = 16
    Top = 200
    Width = 177
    Height = 21
    Anchors = [akLeft, akBottom]
    Properties.DisplayUnchecked = 'False'
    Properties.ReadOnly = False
    Properties.ValueChecked = 1
    Properties.ValueUnchecked = 0
    Properties.Caption = #1055#1086#1090#1088#1077#1073#1091#1108' '#1082#1072#1090#1077#1075#1086#1088#1110#1102' '#1087#1086#1082#1091#1087#1094#1103
    TabOrder = 6
  end
  object CheckBox3: TcxCheckBox
    Left = 17
    Top = 216
    Width = 153
    Height = 21
    Anchors = [akLeft, akBottom]
    Properties.DisplayUnchecked = 'False'
    Properties.ReadOnly = False
    Properties.ValueChecked = 1
    Properties.ValueUnchecked = 0
    Properties.Caption = #1062#1110#1085#1072' '#1084#1086#1078#1077' '#1079#1084#1110#1085#1102#1074#1072#1090#1080#1089#1103
    TabOrder = 7
  end
  object CheckBox4: TcxCheckBox
    Left = 17
    Top = 232
    Width = 193
    Height = 21
    Anchors = [akLeft, akBottom]
    Properties.DisplayUnchecked = 'False'
    Properties.ReadOnly = False
    Properties.ValueChecked = 1
    Properties.ValueUnchecked = 0
    Properties.Caption = #1055#1086#1090#1088#1077#1073#1091#1108' '#1086#1073#39#1108#1082#1090' '#1074#1086#1076#1086#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
    TabOrder = 8
  end
  object NameUnitMeasEdit: TcxButtonEdit
    Left = 16
    Top = 69
    Width = 329
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = NameUnitMeasEditPropertiesButtonClick
    TabOrder = 9
  end
end
