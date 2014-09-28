inherited FormPrKSpravEditFobProt: TFormPrKSpravEditFobProt
  Left = 327
  Top = 225
  ClientHeight = 363
  ClientWidth = 344
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Width = 344
    Height = 363
  end
  inherited cxLabelName: TcxLabel
    TabOrder = 8
  end
  inherited cxLabelShortName: TcxLabel
    TabOrder = 9
  end
  inherited cxLabelKod: TcxLabel
    Top = 247
    TabOrder = 10
  end
  inherited cxTextEditKod: TcxTextEdit
    Top = 246
    TabOrder = 4
  end
  inherited cxButtonOK: TcxButton
    Top = 320
    TabOrder = 6
  end
  inherited cxButtonCansel: TcxButton
    Top = 320
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
    Top = 281
    TabOrder = 13
    Caption = 'cxLabelNPP'
  end
  inherited cxTextEditNPP: TcxTextEdit
    Top = 280
    TabOrder = 5
  end
  object cxTextEditVinitPadeg: TcxTextEdit [13]
    Left = 26
    Top = 163
    Width = 290
    Height = 24
    Cursor = crIBeam
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Vert = taVCenter
    Properties.MaxLength = 100
    Style.BorderStyle = ebs3D
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.Shadow = True
    TabOrder = 2
    Text = 'cxTextEditVinitPadeg'
    DragCursor = crIBeam
  end
  object cxLabelVinitPadeg: TcxLabel [14]
    Left = 16
    Top = 138
    Width = 274
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
  object cxLabelRoditPadeg: TcxLabel [15]
    Left = 15
    Top = 187
    Width = 274
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
  object cxTextEditRoditPadeg: TcxTextEdit [16]
    Left = 25
    Top = 212
    Width = 290
    Height = 24
    Cursor = crIBeam
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Vert = taVCenter
    Properties.MaxLength = 100
    Style.BorderStyle = ebs3D
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.Shadow = True
    TabOrder = 3
    Text = 'cxTextEditRoditPadeg'
    DragCursor = crIBeam
  end
  inherited ActionListKlassSpravEdit: TActionList
    Top = 256
  end
end
