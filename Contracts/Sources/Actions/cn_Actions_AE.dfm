object frmActions_AE: TfrmActions_AE
  Left = 403
  Top = 231
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmActions_AE'
  ClientHeight = 139
  ClientWidth = 306
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
    Left = 118
    Top = 105
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 211
    Top = 105
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
    Height = 97
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
    object ShortNameLabel: TLabel
      Left = 8
      Top = 8
      Width = 79
      Height = 13
      Caption = 'ShortNameLabel'
      Transparent = True
    end
    object Name_Edit: TcxTextEdit
      Left = 8
      Top = 62
      Width = 281
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 100
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = Name_EditKeyPress
    end
    object ShortName_Edit: TcxTextEdit
      Left = 8
      Top = 22
      Width = 107
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 20
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = ShortName_EditKeyPress
    end
  end
end
