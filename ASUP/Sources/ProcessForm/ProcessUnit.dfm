object ProcessForm: TProcessForm
  Left = 194
  Top = 107
  Cursor = crHourGlass
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1063#1077#1082#1072#1081#1090#1077', '#1087#1088#1086#1094#1077#1089#1089' '#1090#1088#1080#1074#1072#1108'...'
  ClientHeight = 84
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 32
    Width = 78
    Height = 13
    Caption = #1047#1072#1083#1080#1096#1080#1083#1086#1089#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LeftLabel: TLabel
    Left = 104
    Top = 32
    Width = 13
    Height = 13
    Caption = '---'
  end
  object Progress: TProgressBar
    Left = 16
    Top = 8
    Width = 305
    Height = 16
    Step = 1
    TabOrder = 0
  end
  object CancelButton: TBitBtn
    Left = 119
    Top = 52
    Width = 106
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 1
    OnClick = CancelButtonClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888880888888888808880908888888889888999088888880888899998888880
      9888889990888809888888899908809988888888999009988888888889999988
      8888888880999088888888880999990888888800999889908888809999888899
      0888899998888889908889998888888889888888888888888888}
  end
end
