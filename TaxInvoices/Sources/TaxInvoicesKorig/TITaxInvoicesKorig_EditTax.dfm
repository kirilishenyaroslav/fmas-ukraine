object TaxInvoicesKorigTaxForm: TTaxInvoicesKorigTaxForm
  Left = 362
  Top = 313
  BorderStyle = bsDialog
  Caption = #1047#1084#1110#1085#1080#1090#1080' '#1055#1044#1042
  ClientHeight = 126
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 168
    Top = 8
    Width = 112
    Height = 20
    Caption = #1047#1084#1110#1085#1080#1090#1080' '#1055#1044#1042
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TaxLabel: TLabel
    Left = 56
    Top = 48
    Width = 151
    Height = 16
    Caption = #1089#1091#1084#1072' '#1055#1044#1042' '#1085#1072#1082#1083#1072#1076#1085#1086#1111
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object YesButton: TcxButton
    Left = 256
    Top = 88
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 0
    OnClick = YesButtonClick
  end
  object CancelButton: TcxButton
    Left = 344
    Top = 88
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object TaxCurrencyEdit: TcxCurrencyEdit
    Left = 216
    Top = 48
    Width = 161
    Height = 21
    TabOrder = 2
  end
end
