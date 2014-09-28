object TNaklNumForm: TTNaklNumForm
  Left = 699
  Top = 473
  BorderStyle = bsSingle
  Caption = #1053#1086#1084#1077#1088' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
  ClientHeight = 84
  ClientWidth = 292
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
  object Button1: TButton
    Left = 8
    Top = 56
    Width = 105
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 184
    Top = 56
    Width = 96
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 297
    Height = 49
    TabOrder = 2
    object NumNaklEdit: TEdit
      Left = 8
      Top = 16
      Width = 273
      Height = 25
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 0
    end
    object cxSpinEdit1: TcxSpinEdit
      Left = 8
      Top = 16
      Width = 273
      Height = 21
      Enabled = False
      Style.LookAndFeel.Kind = lfStandard
      TabOrder = 1
      Visible = False
    end
  end
end
