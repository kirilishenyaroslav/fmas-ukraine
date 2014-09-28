inherited FormPrKSpravEditSROK_OB: TFormPrKSpravEditSROK_OB
  Left = 296
  Top = 169
  Caption = 'FormPrKSpravEditSROK_OB'
  ClientHeight = 305
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Height = 305
  end
  inherited cxLabelKod: TcxLabel
    Left = 118
    Top = 195
  end
  inherited cxTextEditKod: TcxTextEdit
    Top = 194
  end
  inherited cxButtonOK: TcxButton
    Top = 259
  end
  inherited cxButtonCansel: TcxButton
    Top = 259
  end
  inherited cxLabelFormCaption: TcxLabel
    Caption = ' '#1044#1086#1076#1072#1090#1080
  end
  inherited cxLabelNPP: TcxLabel
    Left = 62
    Top = 225
    Caption = 'cxLabelNPP'
  end
  inherited cxTextEditNPP: TcxTextEdit
    Top = 224
  end
  object cxLabelYearsKolvo: TcxLabel [13]
    Left = 16
    Top = 142
    Width = 175
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
    Caption = 'cxLabelYearsKolvo'
  end
  object cxSpinEditYearsKolvo: TcxSpinEdit [14]
    Left = 195
    Top = 143
    Width = 121
    Height = 21
    Properties.MaxValue = 20.000000000000000000
    Style.BorderStyle = ebsUltraFlat
    Style.Color = 16776176
    Style.Shadow = False
    TabOrder = 13
  end
  object cxLabelMonthesKolvo: TcxLabel [15]
    Left = 25
    Top = 167
    Width = 166
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
    Caption = 'cxLabelMonthesKolvo'
  end
  object cxSpinEditMonthesKolvo: TcxSpinEdit [16]
    Left = 195
    Top = 168
    Width = 121
    Height = 21
    Properties.MaxValue = 11.000000000000000000
    Style.BorderStyle = ebsUltraFlat
    Style.Color = 16776176
    Style.Shadow = False
    TabOrder = 15
  end
end
