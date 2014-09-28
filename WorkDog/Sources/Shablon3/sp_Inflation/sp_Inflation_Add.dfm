object sp_Inflation_Add_Form: Tsp_Inflation_Add_Form
  Left = 427
  Top = 307
  BorderStyle = bsDialog
  Caption = 'sp_Inflation_Add_Form'
  ClientHeight = 135
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 10
    Top = 6
    Width = 277
    Height = 89
    Brush.Style = bsClear
  end
  object Label1: TLabel
    Left = 24
    Top = 11
    Width = 71
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091':'
  end
  object Label2: TLabel
    Left = 152
    Top = 11
    Width = 87
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103':'
  end
  object Label3: TLabel
    Left = 24
    Top = 51
    Width = 78
    Height = 13
    Caption = #1030#1085#1076#1077#1082#1089' '#1110#1085#1092#1083#1103#1094#1110#1111':'
  end
  object DateBegEdit: TcxDateEdit
    Left = 24
    Top = 24
    Width = 121
    Height = 21
    Style.Color = 16247513
    TabOrder = 0
    OnKeyPress = DateBegEditKeyPress
  end
  object DateEndEdit: TcxDateEdit
    Left = 152
    Top = 24
    Width = 121
    Height = 21
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = 16247513
    TabOrder = 1
    OnKeyPress = DateEndEditKeyPress
  end
  object IndexEdit: TcxCurrencyEdit
    Left = 24
    Top = 64
    Width = 249
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 4
    Properties.DisplayFormat = ',0.0000;-,0.0000'
    Properties.Nullable = False
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = 16247513
    TabOrder = 2
    OnKeyPress = IndexEditKeyPress
  end
  object ApplyButton: TcxButton
    Left = 128
    Top = 104
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 3
    OnClick = ApplyButtonClick
  end
  object CancelButton: TcxButton
    Left = 212
    Top = 104
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 4
    OnClick = CancelButtonClick
  end
end
