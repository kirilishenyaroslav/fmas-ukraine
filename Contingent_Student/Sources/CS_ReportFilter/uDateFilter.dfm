object fmDateFilter: TfmDateFilter
  Left = 531
  Top = 298
  Width = 214
  Height = 162
  Caption = 'fmDateFilter'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 105
    Width = 198
    Height = 19
    Panels = <>
  end
  object cxButtonEnter: TcxButton
    Left = 8
    Top = 72
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    Default = True
    TabOrder = 1
    OnClick = cxButtonEnterClick
  end
  object cxButtonCancel: TcxButton
    Left = 104
    Top = 72
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 2
    OnClick = cxButtonCancelClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 177
    Height = 41
    TabOrder = 3
    object cxLabel1: TcxLabel
      Left = 8
      Top = 16
      Width = 22
      Height = 17
      TabOrder = 0
      Caption = #1053#1072
    end
    object cxDateEditbegin: TcxDateEdit
      Left = 30
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
end
