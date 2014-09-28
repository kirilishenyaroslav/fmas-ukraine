object dt_Stage_Add_Form: Tdt_Stage_Add_Form
  Left = 384
  Top = 256
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091
  ClientHeight = 104
  ClientWidth = 279
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
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 265
    Height = 57
    Shape = bsFrame
    Style = bsRaised
  end
  object Label2: TLabel
    Left = 16
    Top = 16
    Width = 71
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091':'
  end
  object Label3: TLabel
    Left = 144
    Top = 16
    Width = 87
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103':'
  end
  object DateTimePicker1: TcxDateEdit
    Left = 16
    Top = 32
    Width = 121
    Height = 21
    Style.StyleController = dm.EditStyleController1
    TabOrder = 0
  end
  object DateTimePicker2: TcxDateEdit
    Left = 144
    Top = 32
    Width = 121
    Height = 21
    Style.StyleController = dm.EditStyleController1
    TabOrder = 1
  end
  object Button1: TcxButton
    Left = 116
    Top = 72
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    Default = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TcxButton
    Left = 198
    Top = 72
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 3
    OnClick = Button2Click
  end
end
