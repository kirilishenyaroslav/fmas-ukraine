object ImportBankDataOtrNaklForm: TImportBankDataOtrNaklForm
  Left = 467
  Top = 353
  BorderStyle = bsDialog
  Caption = #1047#1084#1110#1085#1080#1090#1080' '#1076#1072#1090#1091' '#1086#1090#1088#1080#1084#1072#1085#1085#1103' '#1086#1090#1088#1080#1084#1072#1085#1086#1111' '#1087#1086#1076#1072#1090#1082#1086#1074#1086#1111' '#1085#1072#1082#1083#1072#1076#1085#1086#1111
  ClientHeight = 176
  ClientWidth = 478
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 478
    Height = 41
    Align = alTop
    Caption = #1047#1084#1110#1085#1080#1090#1080' '#1076#1072#1090#1091' '#1086#1090#1088#1080#1084#1072#1085#1085#1103' '#1086#1090#1088#1080#1084#1072#1085#1086#1111' '#1087#1086#1076#1072#1090#1082#1086#1074#1086#1111' '#1085#1072#1082#1083#1072#1076#1085#1086#1111
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 478
    Height = 80
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 104
      Top = 32
      Width = 120
      Height = 16
      Caption = #1076#1072#1090#1072' '#1086#1090#1088#1080#1084#1072#1085#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DateOtrNaklDateEdit: TcxDateEdit
      Left = 232
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
    end
  end
  object YesButton: TcxButton
    Left = 296
    Top = 144
    Width = 75
    Height = 25
    Caption = #1047#1084#1110#1085#1080#1090#1080
    Default = True
    TabOrder = 2
    OnClick = YesButtonClick
  end
  object CancelButton: TcxButton
    Left = 384
    Top = 144
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = CancelButtonClick
  end
end
