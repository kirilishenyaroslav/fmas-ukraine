object frmScrView: TfrmScrView
  Left = 192
  Top = 103
  Width = 552
  Height = 399
  Caption = #1050#1086#1087#1080#1103' '#1101#1082#1088#1072#1085#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 544
    Height = 344
    HorzScrollBar.Smooth = True
    HorzScrollBar.Tracking = True
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    Align = alClient
    TabOrder = 0
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 105
      Height = 105
      AutoSize = True
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 344
    Width = 544
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 135
      Top = 2
      Width = 107
      Height = 25
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Default = True
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 0
      Top = 2
      Width = 129
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' jpg...'
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.jpg'
    Filter = #1050#1072#1088#1090#1080#1085#1082#1080' Jpeg(*.jpg)|*.jpg|'#1042#1089#1077' '#1092#1072#1081#1083#1099'(*.*)|*.*'
    Left = 208
    Top = 216
  end
end
