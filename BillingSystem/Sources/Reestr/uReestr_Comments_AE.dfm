object frm_comments_ae: Tfrm_comments_ae
  Left = 595
  Top = 303
  Width = 363
  Height = 238
  Caption = #1047#1084#1110#1085#1080#1090#1080'/'#1044#1086#1076#1072#1090#1080
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
  object OkButton: TcxButton
    Left = 166
    Top = 171
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 259
    Top = 171
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 0
    Width = 337
    Height = 161
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object Comment_label: TLabel
      Left = 8
      Top = 8
      Width = 50
      Height = 13
      Caption = #1050#1086#1084#1077#1085#1090#1072#1088
      Transparent = True
    end
    object Memo1: TcxMemo
      Left = 8
      Top = 24
      Width = 321
      Height = 129
      Properties.MaxLength = 2000
      TabOrder = 0
    end
  end
end
