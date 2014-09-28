object WhatsNewForm: TWhatsNewForm
  Left = 457
  Top = 312
  BorderStyle = bsDialog
  Caption = #1065#1086' '#1085#1086#1074#1086#1075#1086
  ClientHeight = 461
  ClientWidth = 532
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 513
    Height = 377
    Shape = bsFrame
    Style = bsRaised
  end
  object Bevel2: TBevel
    Left = 8
    Top = 384
    Width = 513
    Height = 25
  end
  object Label1: TLabel
    Left = 16
    Top = 392
    Width = 225
    Height = 13
    Caption = #1044#1086#1085#1077#1094#1100#1082#1080#1081' '#1085#1072#1094#1110#1086#1085#1072#1083#1100#1085#1080#1081' '#1091#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object MemoInfo: TMemo
    Left = 15
    Top = 16
    Width = 497
    Height = 361
    Color = 16776176
    Lines.Strings = (
      'MemoInfo')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object cxButton1: TcxButton
    Left = 408
    Top = 424
    Width = 75
    Height = 25
    Caption = #1042#1080#1081#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = cxButton1Click
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
  end
end
