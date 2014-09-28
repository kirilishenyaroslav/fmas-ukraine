object frmShortCut_AE: TfrmShortCut_AE
  Left = 745
  Top = 364
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmShortCut_AE'
  ClientHeight = 98
  ClientWidth = 212
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TcxButton
    Left = 14
    Top = 65
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 107
    Top = 65
    Width = 85
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 209
    Height = 57
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
    object Name_Edit: THotKey
      Left = 8
      Top = 24
      Width = 177
      Height = 19
      HotKey = 27
      Modifiers = []
      TabOrder = 0
    end
  end
end
