object frmLgots_AE: TfrmLgots_AE
  Left = 525
  Top = 305
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmLgots_AE'
  ClientHeight = 152
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TcxButton
    Left = 118
    Top = 121
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 211
    Top = 121
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 297
    Height = 113
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object NameLabel: TLabel
      Left = 8
      Top = 48
      Width = 54
      Height = 13
      Caption = 'NameLabel'
      Transparent = True
    end
    object Name_Edit: TcxTextEdit
      Left = 8
      Top = 62
      Width = 281
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 255
      Style.Color = clWindow
      TabOrder = 1
    end
    object TextEdit_lgot_kod: TcxTextEdit
      Left = 8
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Label_lgot_kod: TcxLabel
      Left = 8
      Top = 8
      Width = 76
      Height = 17
      TabOrder = 2
      Caption = #1064#1080#1092#1088' '#1083#1100#1075#1086#1090#1099
    end
    object CheckBox_delet: TcxCheckBox
      Left = 8
      Top = 88
      Width = 185
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1072#1087#1080#1089#1100' '#1091#1076#1072#1083#1077#1085#1072
      TabOrder = 3
    end
  end
end
