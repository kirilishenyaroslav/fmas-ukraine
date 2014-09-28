inherited FormPrKSpravEditOCENKA: TFormPrKSpravEditOCENKA
  Left = 432
  Top = 199
  ClientHeight = 358
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Height = 358
  end
  inherited cxLabelKod: TcxLabel
    Top = 250
    TabOrder = 15
  end
  inherited cxTextEditKod: TcxTextEdit
    Top = 249
    TabOrder = 14
  end
  inherited cxButtonOK: TcxButton
    Left = 119
    Top = 324
    TabOrder = 18
  end
  inherited cxButtonCansel: TcxButton
    Top = 324
    TabOrder = 19
  end
  inherited cxLabelFormCaption: TcxLabel
    Caption = ' '#1044#1086#1076#1072#1090#1080
  end
  inherited cxLabelNPP: TcxLabel
    Top = 284
    TabOrder = 17
    Caption = 'cxLabelNPP'
  end
  inherited cxTextEditNPP: TcxTextEdit
    Top = 283
    TabOrder = 16
  end
  object cxCheckBoxIsSpivbesida: TcxCheckBox [13]
    Left = 26
    Top = 146
    Width = 30
    Height = 21
    Cursor = crHandPoint
    ParentColor = False
    ParentFont = False
    Properties.Alignment = taCenter
    Properties.DisplayUnchecked = 'False'
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    Style.TransparentBorder = True
    TabOrder = 6
  end
  object cxSpinEditOcenka: TcxSpinEdit [14]
    Left = 195
    Top = 216
    Width = 121
    Height = 21
    Properties.MaxValue = 10000.000000000000000000
    Style.BorderStyle = ebsUltraFlat
    Style.Color = 16776176
    Style.Shadow = False
    TabOrder = 13
  end
  object cxLabelOcenka: TcxLabel [15]
    Left = 61
    Top = 216
    Width = 129
    Height = 19
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.LabelStyle = cxlsRaised
    Properties.ShadowedColor = clBtnShadow
    Properties.Transparent = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    TabOrder = 12
    Caption = 'cxLabelOcenka'
  end
  object cxCheckBoxIsZalik: TcxCheckBox [16]
    Left = 178
    Top = 146
    Width = 30
    Height = 21
    Cursor = crHandPoint
    ParentColor = False
    ParentFont = False
    Properties.Alignment = taCenter
    Properties.DisplayUnchecked = 'False'
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    Style.TransparentBorder = True
    TabOrder = 8
  end
  object cxLabelIsSpivbesida: TcxLabel [17]
    Left = 56
    Top = 146
    Width = 119
    Height = 19
    AutoSize = False
    ParentFont = False
    Properties.LabelStyle = cxlsRaised
    Properties.ShadowedColor = clBtnShadow
    Properties.Transparent = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    Style.TransparentBorder = True
    TabOrder = 7
  end
  object cxLabelIsZalik: TcxLabel [18]
    Left = 208
    Top = 146
    Width = 119
    Height = 19
    AutoSize = False
    ParentFont = False
    Properties.LabelStyle = cxlsRaised
    Properties.ShadowedColor = clBtnShadow
    Properties.Transparent = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    Style.TransparentBorder = True
    TabOrder = 9
  end
  object cxCheckBoxIsNegative: TcxCheckBox [19]
    Left = 26
    Top = 178
    Width = 30
    Height = 21
    Cursor = crHandPoint
    ParentColor = False
    ParentFont = False
    Properties.Alignment = taCenter
    Properties.DisplayUnchecked = 'False'
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    Style.TransparentBorder = True
    TabOrder = 10
  end
  object cxLabelIsNegative: TcxLabel [20]
    Left = 56
    Top = 178
    Width = 119
    Height = 19
    AutoSize = False
    ParentFont = False
    Properties.LabelStyle = cxlsRaised
    Properties.ShadowedColor = clBtnShadow
    Properties.Transparent = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    Style.TransparentBorder = True
    TabOrder = 11
  end
end
