object Form3: TForm3
  Left = 459
  Top = 255
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1086#1089#1083#1091#1075#1080
  ClientHeight = 121
  ClientWidth = 211
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 2
    Top = 2
    Width = 207
    Height = 87
    Brush.Style = bsClear
  end
  object Label3: TLabel
    Left = 13
    Top = 33
    Width = 49
    Height = 13
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100':'
  end
  object Label1: TLabel
    Left = 13
    Top = 9
    Width = 36
    Height = 13
    Caption = #1058#1072#1088#1080#1092':'
  end
  object Label2: TLabel
    Left = 13
    Top = 57
    Width = 37
    Height = 13
    Caption = #1057#1091#1084#1084#1072':'
  end
  object Edizm: TLabel
    Left = 176
    Top = 33
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 56
    Top = 9
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
    Left = 160
    Top = 32
    Width = 39
    Height = 13
    Caption = 'Label5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CountEdit: TcxCurrencyEdit
    Left = 72
    Top = 29
    Width = 81
    Height = 21
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 4
    Properties.DisplayFormat = ',0.0000'#39#39';-,0.0000'#39#39
    Properties.Nullable = False
    Properties.UseLeftAlignmentOnEditing = False
    Properties.OnChange = CountEditPropertiesChange
    Style.Color = clMoneyGreen
    TabOrder = 0
    OnKeyPress = CountEditKeyPress
  end
  object ApplyButton: TcxButton
    Left = 58
    Top = 94
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 1
    OnClick = ApplyButtonClick
  end
  object CancelButton: TcxButton
    Left = 134
    Top = 94
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    TabOrder = 2
  end
  object SumEdit: TcxCurrencyEdit
    Left = 72
    Top = 56
    Width = 81
    Height = 21
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
    Style.Color = clMoneyGreen
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Shadow = False
    TabOrder = 3
    OnKeyPress = SumEditKeyPress
  end
  object ActionList1: TActionList
    Left = 160
    Top = 48
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 27
      OnExecute = Action1Execute
    end
  end
end
