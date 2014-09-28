object Form5: TForm5
  Left = 789
  Top = 412
  Width = 274
  Height = 141
  Caption = #1047#1084#1110#1085#1072' '#1076#1072#1090#1080' '#1090#1072' '#1085#1086#1084#1077#1088#1091' '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label14: TLabel
    Left = 27
    Top = 39
    Width = 72
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1077#1108#1089#1090#1088#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 21
    Top = 10
    Width = 80
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1088#1077#1108#1089#1090#1088#1091':'
  end
  object Panel1: TPanel
    Left = 0
    Top = 62
    Width = 258
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 85
      Top = 8
      Width = 75
      Height = 25
      Action = Action1
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 164
      Top = 8
      Width = 75
      Height = 25
      Action = Action2
      TabOrder = 1
    end
  end
  object Num_edit: TcxTextEdit
    Left = 105
    Top = 8
    Width = 110
    Height = 21
    TabStop = False
    Properties.ReadOnly = False
    Style.Color = clMoneyGreen
    TabOrder = 1
  end
  object DateEdit: TcxDateEdit
    Left = 105
    Top = 36
    Width = 110
    Height = 21
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = clMoneyGreen
    TabOrder = 2
  end
  object ActionList1: TActionList
    Left = 32
    Top = 64
    object Action1: TAction
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      ShortCut = 13
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1072
      ShortCut = 27
      OnExecute = Action2Execute
    end
  end
end
