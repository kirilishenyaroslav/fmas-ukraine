object CountersAdd: TCountersAdd
  Left = 471
  Top = 256
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1051#1110#1095#1080#1083#1100#1085#1080#1082#1080
  ClientHeight = 187
  ClientWidth = 229
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 2
    Top = 2
    Width = 223
    Height = 151
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
    Top = 49
    Width = 94
    Height = 13
    Caption = #1052#1080#1085#1091#1083#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080':'
  end
  object Label3: TLabel
    Left = 8
    Top = 73
    Width = 98
    Height = 13
    Caption = #1055#1086#1090#1086#1095#1085#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080':'
  end
  object Label4: TLabel
    Left = 8
    Top = 97
    Width = 49
    Height = 13
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100':'
  end
  object Label6: TLabel
    Left = 8
    Top = 128
    Width = 37
    Height = 13
    Caption = #1057#1091#1084#1084#1072':'
  end
  object Bevel1: TBevel
    Left = 10
    Top = 117
    Width = 207
    Height = 4
    Shape = bsFrame
    Style = bsRaised
  end
  object PeriodStr: TLabel
    Left = 48
    Top = 8
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 27
    Width = 36
    Height = 13
    Caption = #1058#1072#1088#1080#1092':'
  end
  object FavLabel: TLabel
    Left = 56
    Top = 26
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CountEdit: TcxCurrencyEdit
    Left = 136
    Top = 93
    Width = 81
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00;-,0.00'
    Properties.Nullable = False
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = clMoneyGreen
    TabOrder = 1
  end
  object SumEdit: TcxCurrencyEdit
    Left = 112
    Top = 124
    Width = 105
    Height = 21
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 4
    Properties.DisplayFormat = ',0.0000'#39#39';-,0.0000'#39#39
    Properties.ReadOnly = True
    Style.Color = clMoneyGreen
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Shadow = False
    TabOrder = 2
    OnKeyPress = SumEditKeyPress
  end
  object ApplyButton: TcxButton
    Left = 67
    Top = 158
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 3
    OnClick = ApplyButtonClick
  end
  object CancelButton: TcxButton
    Left = 149
    Top = 158
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    TabOrder = 4
  end
  object OldEdit: TcxTextEdit
    Left = 136
    Top = 46
    Width = 81
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Style.Color = clMoneyGreen
    TabOrder = 0
    OnKeyPress = OldEditKeyPress
  end
  object CurEdit: TcxTextEdit
    Left = 137
    Top = 69
    Width = 80
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Style.BorderStyle = ebsUltraFlat
    Style.Color = clMoneyGreen
    TabOrder = 5
    OnKeyPress = CurEditKeyPress
  end
  object ActionList1: TActionList
    Left = 24
    Top = 152
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 27
      OnExecute = Action1Execute
    end
  end
end
