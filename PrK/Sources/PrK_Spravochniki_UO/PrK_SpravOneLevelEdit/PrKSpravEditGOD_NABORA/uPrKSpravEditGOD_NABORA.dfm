inherited FormPrKSpravEditGOD_NABORA: TFormPrKSpravEditGOD_NABORA
  Left = 322
  Top = 200
  ClientHeight = 327
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Height = 327
  end
  inherited cxLabelName: TcxLabel
    TabOrder = 8
  end
  inherited cxLabelShortName: TcxLabel
    TabOrder = 9
  end
  inherited cxLabelKod: TcxLabel
    Top = 201
    TabOrder = 10
  end
  inherited cxTextEditKod: TcxTextEdit
    Top = 200
    TabOrder = 4
  end
  inherited cxButtonOK: TcxButton
    Top = 283
    TabOrder = 6
  end
  inherited cxButtonCansel: TcxButton
    Top = 283
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
    Top = 235
    TabOrder = 13
    Caption = 'cxLabelNPP'
  end
  inherited cxTextEditNPP: TcxTextEdit
    Top = 234
    TabOrder = 5
  end
  object cxLabelDateBeg: TcxLabel [13]
    Left = 16
    Top = 142
    Width = 149
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
    TabOrder = 14
  end
  object cxLabelDateEnd: TcxLabel [14]
    Left = 182
    Top = 142
    Width = 140
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
    TabOrder = 15
  end
  object cxDateEditDateEnd: TcxDateEdit [15]
    Left = 195
    Top = 168
    Width = 121
    Height = 21
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = 16776176
    TabOrder = 3
  end
  object cxDateEditDateBeg: TcxDateEdit [16]
    Left = 26
    Top = 168
    Width = 121
    Height = 21
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = 16776176
    TabOrder = 2
  end
  inherited ActionListKlassSpravEdit: TActionList
    Top = 232
  end
end
