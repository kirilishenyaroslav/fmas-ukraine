inherited FormPrKSpravEditMIN_TYPE_NAPR: TFormPrKSpravEditMIN_TYPE_NAPR
  Left = 323
  Top = 192
  Caption = 'FormPrKSpravEditMIN_TYPE_NAPR'
  ClientHeight = 288
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Height = 288
  end
  inherited cxLabelName: TcxLabel
    TabOrder = 7
  end
  inherited cxLabelShortName: TcxLabel
    TabOrder = 8
  end
  inherited cxLabelKod: TcxLabel
    Left = 16
    Top = 171
    Width = 172
    TabOrder = 9
  end
  inherited cxTextEditKod: TcxTextEdit
    Top = 170
    TabOrder = 3
  end
  inherited cxButtonOK: TcxButton
    Top = 240
    TabOrder = 5
  end
  inherited cxButtonCansel: TcxButton
    Top = 240
    TabOrder = 6
  end
  inherited cxLabelFormCaption: TcxLabel
    TabOrder = 10
    Caption = ' '#1044#1086#1076#1072#1090#1080
  end
  inherited cxButtonCloseForm: TcxButton
    TabOrder = 11
  end
  inherited cxLabelNPP: TcxLabel
    Left = 16
    Top = 200
    Width = 172
    TabOrder = 12
    Caption = 'cxLabelNPP'
  end
  inherited cxTextEditNPP: TcxTextEdit
    Top = 199
    TabOrder = 4
  end
  object cxLabelSHIFR: TcxLabel [13]
    Left = 16
    Top = 142
    Width = 172
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
    TabOrder = 13
  end
  object cxTextEditSHIFR: TcxTextEdit [14]
    Left = 195
    Top = 141
    Width = 121
    Height = 24
    Cursor = crIBeam
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.MaxLength = 10
    Style.BorderStyle = ebs3D
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.Shadow = True
    TabOrder = 2
    Text = 'cxTextEditSHIFR'
    DragCursor = crIBeam
  end
  inherited ActionListKlassSpravEdit: TActionList
    Top = 232
  end
end
