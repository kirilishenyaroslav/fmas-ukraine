object Period_Add_Form: TPeriod_Add_Form
  Left = 895
  Top = 737
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091
  ClientHeight = 232
  ClientWidth = 256
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
  object Shape1: TShape
    Left = 8
    Top = 8
    Width = 233
    Height = 177
    Brush.Style = bsClear
  end
  object Label1: TLabel
    Left = 16
    Top = 19
    Width = 85
    Height = 13
    Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091':'
  end
  object Label2: TLabel
    Left = 128
    Top = 19
    Width = 99
    Height = 13
    Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091':'
  end
  object Label3: TLabel
    Left = 96
    Top = 185
    Width = 174
    Height = 13
    Caption = #1065#1086#1084#1110#1089#1103#1095#1085#1072' '#1089#1091#1084#1072' '#1089#1087#1083#1072#1090#1080' '#1079#1072' '#1087#1077#1088#1110#1086#1076':'
    Visible = False
  end
  object Date_Beg_Edit: TcxDateEdit
    Left = 16
    Top = 32
    Width = 105
    Height = 21
    Properties.ImmediatePost = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = clMoneyGreen
    TabOrder = 0
    OnKeyPress = Date_Beg_EditKeyPress
  end
  object Date_End_Edit: TcxDateEdit
    Left = 128
    Top = 32
    Width = 105
    Height = 21
    Properties.ImmediatePost = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = clMoneyGreen
    TabOrder = 1
    OnKeyPress = Date_End_EditKeyPress
  end
  object ApplyButton: TcxButton
    Left = 8
    Top = 190
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 4
    OnClick = ApplyButtonClick
  end
  object CancelButton: TcxButton
    Left = 166
    Top = 190
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 5
    OnClick = CancelButtonClick
  end
  object RadioGroup: TcxRadioGroup
    Left = 16
    Top = 56
    Width = 217
    Height = 97
    ItemIndex = 1
    Properties.Items = <
      item
        Caption = #1056#1086#1079#1088#1072#1093#1091#1074#1072#1090#1080' '#1097#1086#1084#1110#1089#1103#1095#1085#1091' '#1089#1091#1084#1091' '#1079' '#1091#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084' '#1110#1085#1076#1077#1082#1089#1072' '#1110#1085#1092#1083#1103#1094#1110#1111
      end
      item
        Caption = #1047#1072#1076#1072#1090#1080' '#1097#1086#1084#1110#1089#1103#1095#1085#1091' '#1089#1091#1084#1091' '#1086#1087#1083#1072#1090#1080' '#1079#1072' '#1087#1077#1088#1110#1086#1076
      end>
    Properties.WordWrap = True
    Properties.OnChange = RadioGroupPropertiesChange
    TabOrder = 2
    Caption = ''
  end
  object Summa_Edit: TcxCurrencyEdit
    Left = 16
    Top = 157
    Width = 217
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00;-,0.00'
    Properties.Nullable = False
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = clMoneyGreen
    TabOrder = 3
    OnKeyPress = Summa_EditKeyPress
  end
  object ActionList1: TActionList
    Left = 88
    Top = 200
    object Action3: TAction
      Caption = 'Exit'
      ShortCut = 27
      OnExecute = Action3Execute
    end
  end
  object DataSet: TpFIBDataSet
    Database = Arnd_Contract_Add_Form.Database
    Transaction = Arnd_Contract_Add_Form.ReadTransaction
    UpdateTransaction = Arnd_Contract_Add_Form.WriteTransaction
    Left = 120
    Top = 208
    poSQLINT64ToBCD = True
  end
end
