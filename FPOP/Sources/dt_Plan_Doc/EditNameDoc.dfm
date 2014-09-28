object EditNameDocForm: TEditNameDocForm
  Left = 367
  Top = 247
  BorderStyle = bsDialog
  Caption = #1047#1084#1110#1085#1072' '#1085#1072#1079#1074#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
  ClientHeight = 153
  ClientWidth = 395
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
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 377
    Height = 105
    Shape = bsFrame
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 16
    Top = 20
    Width = 91
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1091':'
  end
  object Label5: TLabel
    Left = 200
    Top = 62
    Width = 177
    Height = 13
    Caption = #1054#1076#1080#1085#1080#1094#1103' '#1074#1080#1084#1110#1088#1091' '#1074#1072#1088#1090#1086#1089#1090#1110' '#1087#1088#1086#1076#1091#1082#1094#1110#1111':'
  end
  object Label3: TLabel
    Left = 16
    Top = 64
    Width = 141
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1090#1074#1086#1088#1077#1085#1085#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1091':'
  end
  object Name_Doc: TcxTextEdit
    Left = 16
    Top = 35
    Width = 360
    Height = 21
    Properties.MaxLength = 60
    Style.StyleController = dm.EditStyleController1
    TabOrder = 0
  end
  object Cost_Unit_Meas: TcxButtonEdit
    Left = 200
    Top = 81
    Width = 177
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = Cost_Unit_MeasPropertiesButtonClick
    Style.StyleController = dm.EditStyleController1
    TabOrder = 1
  end
  object DateTimePicker1: TcxDateEdit
    Left = 16
    Top = 80
    Width = 177
    Height = 21
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.StyleController = dm.EditStyleController1
    TabOrder = 2
  end
  object OkButton: TcxButton
    Left = 232
    Top = 120
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    Default = True
    TabOrder = 3
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 312
    Top = 120
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    TabOrder = 4
  end
end
