object frmDogStatus_AE: TfrmDogStatus_AE
  Left = 500
  Top = 341
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmDogStatus_AE'
  ClientHeight = 192
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TcxButton
    Left = 94
    Top = 161
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 187
    Top = 161
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
    Width = 273
    Height = 145
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object NameLabel: TLabel
      Left = 8
      Top = 8
      Width = 54
      Height = 13
      Caption = 'NameLabel'
      Transparent = True
    end
    object Name_Edit: TcxTextEdit
      Left = 8
      Top = 22
      Width = 257
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 30
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = Name_EditKeyPress
    end
    object IsVisibleReestrCheckBox: TcxCheckBox
      Left = 4
      Top = 48
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 1
      OnKeyPress = IsVisibleReestrCheckBoxKeyPress
    end
    object IsVisibleOplataCheckBox: TcxCheckBox
      Left = 4
      Top = 72
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 2
      OnKeyPress = IsVisibleOplataCheckBoxKeyPress
    end
    object cxCheckBox1: TcxCheckBox
      Left = 4
      Top = 96
      Width = 261
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1042#1082#1083#1102#1095#1072#1090#1080' '#1076#1086' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1085#1086#1075#1086' '#1087#1077#1088#1077#1088#1072#1093#1091#1085#1082#1091
      TabOrder = 3
      OnKeyPress = IsVisibleOplataCheckBoxKeyPress
    end
  end
end
