object CountersAdd: TCountersAdd
  Left = 350
  Top = 400
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1051#1110#1095#1080#1083#1100#1085#1080#1082#1080
  ClientHeight = 171
  ClientWidth = 187
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 2
    Top = 2
    Width = 183
    Height = 135
    Brush.Style = bsClear
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 37
    Height = 13
    Caption = #1055#1077#1088#1110#1086#1076':'
  end
  object Label2: TLabel
    Left = 8
    Top = 33
    Width = 94
    Height = 13
    Caption = #1052#1080#1085#1091#1083#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080':'
  end
  object Label3: TLabel
    Left = 8
    Top = 57
    Width = 98
    Height = 13
    Caption = #1055#1086#1090#1086#1095#1085#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080':'
  end
  object Label4: TLabel
    Left = 8
    Top = 81
    Width = 49
    Height = 13
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100':'
  end
  object Label6: TLabel
    Left = 8
    Top = 112
    Width = 37
    Height = 13
    Caption = #1057#1091#1084#1084#1072':'
  end
  object Bevel1: TBevel
    Left = 10
    Top = 101
    Width = 167
    Height = 4
    Shape = bsFrame
    Style = bsRaised
  end
  object CurEdit: TcxCurrencyEdit
    Left = 120
    Top = 53
    Width = 57
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00;-,0.00'
    Properties.Nullable = False
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = clMoneyGreen
    TabOrder = 0
  end
  object OldEdit: TcxCurrencyEdit
    Left = 120
    Top = 29
    Width = 57
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00;-,0.00'
    Properties.Nullable = False
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = clMoneyGreen
    TabOrder = 1
  end
  object CountEdit: TcxCurrencyEdit
    Left = 120
    Top = 77
    Width = 57
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00;-,0.00'
    Properties.Nullable = False
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = clMoneyGreen
    TabOrder = 2
  end
  object SumEdit: TcxCurrencyEdit
    Left = 88
    Top = 108
    Width = 89
    Height = 21
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
    Properties.ReadOnly = True
    Style.Color = clMoneyGreen
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Shadow = False
    TabOrder = 3
  end
  object ApplyButton: TcxButton
    Left = 27
    Top = 142
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    ModalResult = 1
    TabOrder = 4
  end
  object CancelButton: TcxButton
    Left = 109
    Top = 142
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    TabOrder = 5
  end
end
