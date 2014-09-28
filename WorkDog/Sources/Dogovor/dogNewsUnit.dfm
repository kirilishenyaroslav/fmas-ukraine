object dogNewsForm: TdogNewsForm
  Left = 431
  Top = 332
  Width = 726
  Height = 555
  Caption = #1057#1087#1080#1089#1086#1082' '#1079#1084#1110#1085
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 487
    Width = 718
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    OnResize = Panel1Resize
    object cxButton1: TcxButton
      Left = 405
      Top = 8
      Width = 99
      Height = 25
      Cancel = True
      Caption = #1047#1072#1082#1088#1080#1090#1080
      Default = True
      TabOrder = 0
      OnClick = cxButton1Click
    end
  end
  object cxMemo1: TcxMemo
    Left = 0
    Top = 0
    Width = 702
    Height = 161
    Align = alCustom
    Properties.ReadOnly = True
    Properties.ScrollBars = ssBoth
    TabOrder = 1
  end
  object WebBrowser1: TWebBrowser
    Left = 32
    Top = 184
    Width = 593
    Height = 150
    TabOrder = 2
    ControlData = {
      4C0000004A3D0000810F00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end
