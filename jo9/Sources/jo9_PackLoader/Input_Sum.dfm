object Input_Sum_Form: TInput_Sum_Form
  Left = 422
  Top = 243
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1059#1074#1077#1076#1110#1090#1100' '#1089#1091#1084#1091
  ClientHeight = 268
  ClientWidth = 209
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ApplyButton: TcxButton
    Left = 8
    Top = 237
    Width = 75
    Height = 28
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 3
    OnClick = ApplyButtonClick
  end
  object CancelButton: TcxButton
    Left = 126
    Top = 237
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 4
    OnClick = CancelButtonClick
  end
  object GroupBox: TcxGroupBox
    Left = 8
    Top = 8
    Width = 193
    Height = 62
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 29
      Height = 13
      Caption = #1057#1091#1084#1072':'
    end
    object fSumCheckBox: TcxCheckBox
      Left = 60
      Top = 40
      Width = 127
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1060#1110#1083#1100#1090#1088#1091#1074#1072#1090#1080' '#1087#1086' '#1089#1091#1084#1110
      TabOrder = 1
      Visible = False
      OnKeyPress = fSumCheckBoxKeyPress
    end
    object SumEdit: TcxCurrencyEdit
      Left = 8
      Top = 22
      Width = 177
      Height = 21
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.Nullable = False
      Properties.UseLeftAlignmentOnEditing = False
      Properties.UseThousandSeparator = True
      Style.Color = 16247513
      TabOrder = 0
      OnKeyPress = SumEditKeyPress
    end
  end
  object CustGroupBox: TcxGroupBox
    Left = 8
    Top = 69
    Width = 193
    Height = 81
    Alignment = alTopLeft
    TabOrder = 1
    TabStop = False
    object CustEdit: TcxTextEdit
      Left = 8
      Top = 45
      Width = 177
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaxLength = 180
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = 16247513
      TabOrder = 1
      OnKeyPress = CustEditKeyPress
    end
    object CustCheckBox: TcxCheckBox
      Left = 4
      Top = 9
      Width = 158
      Height = 34
      Properties.DisplayUnchecked = 'False'
      Properties.MultiLine = True
      Properties.OnChange = CustCheckBoxPropertiesChange
      Properties.Caption = #1042#1089#1090#1072#1085#1086#1074#1080#1090#1080' '#1092#1110#1083#1100#1090#1088' '#1085#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      TabOrder = 0
      OnKeyPress = CustCheckBoxKeyPress
    end
  end
  object RegNumGroupBox: TcxGroupBox
    Left = 7
    Top = 149
    Width = 194
    Height = 81
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object RegNumEdit: TcxTextEdit
      Left = 8
      Top = 45
      Width = 177
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaxLength = 180
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = 16247513
      TabOrder = 1
      OnKeyPress = RegNumEditKeyPress
    end
    object RegNumCheckBox: TcxCheckBox
      Left = 4
      Top = 9
      Width = 181
      Height = 34
      Properties.DisplayUnchecked = 'False'
      Properties.MultiLine = True
      Properties.OnChange = RegNumCheckBoxPropertiesChange
      Properties.Caption = #1042#1089#1090#1072#1085#1086#1074#1080#1090#1080' '#1092#1110#1083#1100#1090#1088' '#1085#1072' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1080#1081' '#1085#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1091
      TabOrder = 0
      OnKeyPress = RegNumCheckBoxKeyPress
    end
  end
  object ActionList: TActionList
    Left = 162
    Top = 77
    object Action1: TAction
      Caption = 'EscAction'
      ShortCut = 27
      OnExecute = Action1Execute
    end
  end
end
