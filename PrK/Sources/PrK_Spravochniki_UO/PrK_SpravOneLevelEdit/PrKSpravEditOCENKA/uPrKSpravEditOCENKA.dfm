inherited FormPrKSpravEditOCENKA: TFormPrKSpravEditOCENKA
  Left = 547
  Top = 196
  ClientHeight = 325
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Height = 325
  end
  inherited cxLabelName: TcxLabel
    TabOrder = 8
  end
  inherited cxLabelShortName: TcxLabel
    TabOrder = 9
  end
  inherited cxLabelKod: TcxLabel
    Top = 202
    TabOrder = 10
  end
  inherited cxTextEditKod: TcxTextEdit
    Top = 201
    TabOrder = 4
  end
  inherited cxButtonOK: TcxButton
    Top = 284
    TabOrder = 6
  end
  inherited cxButtonCansel: TcxButton
    Top = 284
    TabOrder = 7
  end
  inherited cxLabelFormCaption: TcxLabel
    TabOrder = 11
    Caption = ' '#1044#1086#1076#1072#1090#1080
  end
  inherited cxButtonCloseForm: TcxButton
    TabOrder = 12
  end
  inherited cxLabelNPP: TcxLabel
    Top = 236
    TabOrder = 13
    Caption = 'cxLabelNPP'
  end
  inherited cxTextEditNPP: TcxTextEdit
    Top = 235
    TabOrder = 5
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
    TabOrder = 2
  end
  object cxSpinEditOcenka: TcxSpinEdit [14]
    Left = 195
    Top = 176
    Width = 121
    Height = 21
    Properties.MaxValue = 12.000000000000000000
    Style.BorderStyle = ebsUltraFlat
    Style.Color = 16776176
    Style.Shadow = False
    TabOrder = 3
  end
  object cxLabelOcenka: TcxLabel [15]
    Left = 53
    Top = 175
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
    TabOrder = 14
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
    TabOrder = 15
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
    TabOrder = 16
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
    TabOrder = 17
  end
end
