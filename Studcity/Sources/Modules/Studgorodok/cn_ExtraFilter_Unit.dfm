object frmExtraFilter: TfrmExtraFilter
  Left = 403
  Top = 189
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmExtraFilter'
  ClientHeight = 201
  ClientWidth = 272
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 272
    Height = 161
    Align = alTop
    TabOrder = 0
    object Params_Button: TcxButton
      Left = 25
      Top = 20
      Width = 220
      Height = 21
      Caption = #1042#1080#1073#1110#1088' '#1087#1072#1088#1072#1084#1077#1090#1088#1110#1074
      TabOrder = 0
      OnClick = Params_ButtonClick
    end
    object Date_Beg_Check: TcxCheckBox
      Left = 8
      Top = 47
      Width = 209
      Height = 21
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = Date_Beg_CheckPropertiesChange
      Properties.Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1088#1086#1087#1080#1089#1082#1080
      TabOrder = 1
    end
    object Date_beg_z: TcxDateEdit
      Left = 24
      Top = 67
      Width = 97
      Height = 21
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 2
      EditValue = 2d
    end
    object Date_Beg_po: TcxDateEdit
      Left = 161
      Top = 67
      Width = 97
      Height = 21
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 3
      EditValue = 420031d
    end
    object Date_End_Check: TcxCheckBox
      Left = 8
      Top = 96
      Width = 217
      Height = 21
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = Date_End_CheckPropertiesChange
      Properties.Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1088#1086#1087#1080#1089#1082#1080
      TabOrder = 4
    end
    object Date_End_Z: TcxDateEdit
      Left = 24
      Top = 120
      Width = 97
      Height = 21
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 5
      EditValue = 2d
    end
    object Date_End_Po: TcxDateEdit
      Left = 161
      Top = 120
      Width = 97
      Height = 21
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 6
      EditValue = 420031d
    end
  end
  object OkButton: TcxButton
    Left = 88
    Top = 168
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 180
    Top = 168
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
