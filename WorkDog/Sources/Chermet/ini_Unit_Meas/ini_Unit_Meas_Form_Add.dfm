object ini_Unit_Meas_Form_Add1: Tini_Unit_Meas_Form_Add1
  Left = 385
  Top = 238
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103' '#1086#1076#1080#1085#1080#1094#1110' '#1074#1080#1084#1110#1088#1091
  ClientHeight = 247
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 113
    Height = 13
    Caption = #1043#1088#1091#1087#1072' '#1086#1076#1080#1085#1080#1094#1100' '#1074#1080#1084#1110#1088#1091':'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 112
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1086#1076#1080#1085#1080#1094#1110' '#1074#1080#1084#1110#1088#1091':'
  end
  object Label3: TLabel
    Left = 16
    Top = 112
    Width = 149
    Height = 13
    Caption = #1057#1090#1080#1089#1083#1072' '#1085#1072#1079#1074#1072' '#1086#1076#1080#1085#1080#1094#1110' '#1074#1080#1084#1110#1088#1091':'
  end
  object Label4: TLabel
    Left = 16
    Top = 160
    Width = 57
    Height = 13
    Caption = #1050#1086#1077#1092#1110#1094#1110#1108#1085#1090':'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 257
    Height = 201
    Shape = bsFrame
    Style = bsRaised
  end
  object Name_Group_UnitM: TcxButtonEdit
    Left = 16
    Top = 32
    Width = 241
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    TabOrder = 0
    OnClick = Name_Group_UnitMButtonClick
  end
  object Name_Unit_Meas: TcxTextEdit
    Left = 16
    Top = 80
    Width = 241
    Height = 21
    TabOrder = 1
    OnKeyPress = Name_Unit_MeasKeyPress
  end
  object Short_Name: TcxTextEdit
    Left = 16
    Top = 128
    Width = 241
    Height = 21
    TabOrder = 2
    OnKeyPress = Short_NameKeyPress
  end
  object Coefficient: TcxTextEdit
    Left = 16
    Top = 176
    Width = 241
    Height = 21
    TabOrder = 3
    Text = '1'
    OnKeyPress = CoefficientKeyPress
  end
  object Button1: TcxButton
    Left = 110
    Top = 216
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TcxButton
    Left = 190
    Top = 216
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 5
    OnClick = Button2Click
  end
  object ActionList1: TActionList
    Left = 40
    Top = 216
    object ActionExit: TAction
      Caption = 'ActionExit'
      ShortCut = 27
      OnExecute = ActionExitExecute
    end
  end
end
