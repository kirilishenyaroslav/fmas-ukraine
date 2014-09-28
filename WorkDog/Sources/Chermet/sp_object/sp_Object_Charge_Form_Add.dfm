object sp_Object_Charge_Form_Add1: Tsp_Object_Charge_Form_Add1
  Left = 403
  Top = 233
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'sp_Object_Charge_Form_Add1'
  ClientHeight = 200
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 8
    Top = 72
    Width = 265
    Height = 89
    Shape = bsFrame
    Style = bsRaised
  end
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 265
    Height = 57
    Shape = bsFrame
    Style = bsRaised
  end
  object Label2: TLabel
    Left = 144
    Top = 19
    Width = 87
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 19
    Width = 71
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 32
    Top = 81
    Width = 70
    Height = 13
    Caption = #1054#1073#39#1108#1084' '#1074#1080#1090#1088#1072#1090':'
  end
  object Label4: TLabel
    Left = 32
    Top = 120
    Width = 84
    Height = 13
    Caption = #1042#1110#1076#1089#1086#1090#1086#1082' '#1074#1080#1090#1088#1072#1090':'
  end
  object OK_Btn: TcxButton
    Left = 117
    Top = 168
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 0
    OnClick = Button1Click
  end
  object Cancel_Btn: TcxButton
    Left = 198
    Top = 168
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 1
  end
  object DateTimePicker1: TcxDateEdit
    Left = 16
    Top = 32
    Width = 120
    Height = 21
    TabOrder = 2
    OnKeyPress = DateTimePicker1KeyPress
  end
  object DateTimePicker2: TcxDateEdit
    Left = 144
    Top = 32
    Width = 120
    Height = 21
    TabOrder = 3
    OnKeyPress = DateTimePicker2KeyPress
  end
  object VolumeEdit: TcxTextEdit
    Left = 32
    Top = 93
    Width = 233
    Height = 21
    TabOrder = 4
    Text = '0'
    OnKeyPress = VolumeEditKeyPress
  end
  object PercentEdit: TcxTextEdit
    Left = 32
    Top = 132
    Width = 233
    Height = 21
    TabOrder = 5
    Text = '0'
    OnKeyPress = VolumeEditKeyPress
  end
  object VolumeButton: TcxRadioButton
    Left = 14
    Top = 94
    Width = 17
    Height = 17
    TabOrder = 6
    OnClick = VolumeButtonClick
  end
  object PercentButton: TcxRadioButton
    Left = 14
    Top = 134
    Width = 17
    Height = 17
    TabOrder = 7
    OnClick = VolumeButtonClick
  end
  object ActionList: TActionList
    Left = 40
    Top = 168
    object ActionExit: TAction
      Caption = 'ActionExit'
      ShortCut = 27
      OnExecute = ActionExitExecute
    end
  end
end
