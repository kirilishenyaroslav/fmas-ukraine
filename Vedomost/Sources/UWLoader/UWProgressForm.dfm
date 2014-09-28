object fmUWProgressForm: TfmUWProgressForm
  Left = 351
  Top = 297
  Cursor = crHourGlass
  BorderIcons = []
  BorderStyle = bsToolWindow
  BorderWidth = 2
  ClientHeight = 110
  ClientWidth = 416
  Color = clBtnFace
  Constraints.MaxHeight = 148
  Constraints.MaxWidth = 428
  Constraints.MinHeight = 148
  Constraints.MinWidth = 428
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 328
    Top = 56
    Width = 89
    Height = 33
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = '0 c.'
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 0
    Width = 416
    Height = 17
    Align = alTop
    TabOrder = 1
  end
  object ProgressBar2: TProgressBar
    Left = 0
    Top = 93
    Width = 416
    Height = 17
    Align = alBottom
    TabOrder = 2
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 384
    Top = 24
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 352
    Top = 24
  end
end
