object fmWaite: TfmWaite
  Left = 346
  Top = 333
  BorderStyle = bsNone
  Caption = 'fmWaite'
  ClientHeight = 112
  ClientWidth = 307
  Color = 16776176
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 307
    Height = 112
    Align = alClient
    Alignment = alTopLeft
    CaptionBkColor = 16776176
    Color = clInfoBk
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 46
      Height = 19
      Caption = 'Label1'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Animate1: TAnimate
      Left = 16
      Top = 27
      Width = 272
      Height = 60
      Active = True
      CommonAVI = aviCopyFile
      StopFrame = 20
    end
    object cxProgressBar1: TcxProgressBar
      Left = 16
      Top = 88
      Width = 273
      Height = 21
      Properties.BeginColor = clMoneyGreen
      Properties.BarBevelOuter = cxbvRaised
      Properties.EndColor = 16776176
      Properties.BarStyle = cxbsGradientLEDs
      Properties.PeakValue = 100
      TabOrder = 1
    end
  end
end
