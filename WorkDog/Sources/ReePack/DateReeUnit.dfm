object DateReeForm: TDateReeForm
  Left = 724
  Top = 354
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076' '#1076#1072#1090#1080
  ClientHeight = 120
  ClientWidth = 202
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
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 73
    Alignment = alTopLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 72
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1077#1108#1089#1090#1088#1091':'
    end
    object ReeDateEdit: TcxDateEdit
      Left = 16
      Top = 32
      Width = 153
      Height = 21
      BeepOnEnter = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clMoneyGreen
      TabOrder = 0
      OnKeyDown = ReeDateEditKeyDown
    end
  end
  object OKButton: TcxButton
    Left = 19
    Top = 88
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    Default = True
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 107
    Top = 88
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042'i'#1076#1084'i'#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
