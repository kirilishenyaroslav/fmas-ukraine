object KodTovarAddForm: TKodTovarAddForm
  Left = 568
  Top = 268
  BorderStyle = bsDialog
  Caption = 'KodTovarAddForm'
  ClientHeight = 157
  ClientWidth = 564
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
  object InsertPanel: TPanel
    Left = 0
    Top = 0
    Width = 564
    Height = 157
    Align = alClient
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 376
      Top = 120
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      Default = True
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 464
      Top = 120
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object NumKodTovarTextEdit: TcxTextEdit
      Left = 144
      Top = 16
      Width = 385
      Height = 24
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Text = 'NumKodTovarTextEdit'
    end
    object NameKodTovarTextEdit: TcxTextEdit
      Left = 144
      Top = 64
      Width = 385
      Height = 24
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Text = 'NameKodTovarTextEdit'
    end
    object NumKodTovarLabel: TcxLabel
      Left = 24
      Top = 24
      Width = 36
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Caption = #1050#1086#1076
    end
    object NameKodTovarLabel: TcxLabel
      Left = 24
      Top = 64
      Width = 119
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
    end
  end
end
