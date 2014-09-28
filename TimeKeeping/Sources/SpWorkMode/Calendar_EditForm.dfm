object FormEditCalendar: TFormEditCalendar
  Left = 514
  Top = 244
  Width = 232
  Height = 125
  Caption = 'FormEditCalendar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 57
    Width = 224
    Height = 41
    Align = alBottom
    TabOrder = 0
    object ButtonOK: TcxButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'ButtonOK'
      TabOrder = 0
    end
    object ButtonCancel: TcxButton
      Left = 112
      Top = 8
      Width = 75
      Height = 25
      Caption = 'ButtonCancel'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 224
    Height = 57
    Align = alClient
    TabOrder = 1
    object EditHOURS: TcxMaskEdit
      Left = 64
      Top = 16
      Width = 81
      Height = 21
      TabOrder = 0
      Text = 'EditHOURS'
    end
  end
end
