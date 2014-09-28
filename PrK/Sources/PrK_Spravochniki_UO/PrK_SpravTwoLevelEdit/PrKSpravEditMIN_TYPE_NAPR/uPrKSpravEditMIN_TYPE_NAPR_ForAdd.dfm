inherited FormPrKSpravEditMIN_TYPE_NAPR_ForAdd: TFormPrKSpravEditMIN_TYPE_NAPR_ForAdd
  Left = 341
  Top = 108
  Caption = 'FormPrKSpravEditMIN_TYPE_NAPR_ForAdd'
  ClientHeight = 495
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Height = 495
  end
  object Bevel1: TBevel [1]
    Left = 1
    Top = 232
    Width = 343
    Height = 9
  end
  inherited cxLabelName: TcxLabel
    TabOrder = 12
  end
  inherited cxLabelShortName: TcxLabel
    TabOrder = 13
  end
  inherited cxLabelKod: TcxLabel
    TabOrder = 14
  end
  inherited cxButtonOK: TcxButton
    Top = 450
    TabOrder = 10
  end
  inherited cxButtonCansel: TcxButton
    Top = 450
    TabOrder = 11
  end
  inherited cxLabelFormCaption: TcxLabel
    TabOrder = 15
    Caption = ' '#1044#1086#1076#1072#1090#1080
  end
  inherited cxButtonCloseForm: TcxButton
    TabOrder = 16
  end
  inherited cxLabelNPP: TcxLabel
    TabOrder = 17
    Caption = 'cxLabelNPP'
  end
  inherited cxLabelSHIFR: TcxLabel
    TabOrder = 18
  end
  object cxLabelNameSecLev: TcxLabel [16]
    Left = 16
    Top = 250
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
    TabOrder = 19
  end
  object cxTextEditNameSecLev: TcxTextEdit [17]
    Left = 26
    Top = 275
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
    Style.Shadow = True
    TabOrder = 5
    Text = 'cxTextEditName'
    DragCursor = crIBeam
  end
  object cxLabelShortNameSecLev: TcxLabel [18]
    Left = 16
    Top = 303
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
    TabOrder = 20
  end
  object cxTextEditShortNameSecLev: TcxTextEdit [19]
    Left = 26
    Top = 328
    Width = 290
    Height = 24
    Cursor = crIBeam
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Vert = taVCenter
    Properties.MaxLength = 30
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
    TabOrder = 6
    Text = 'cxTextEditShortName'
    DragCursor = crIBeam
  end
  object cxLabelKodSecLev: TcxLabel [20]
    Left = 16
    Top = 386
    Width = 173
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
    TabOrder = 21
  end
  object cxTextEditKodSecLev: TcxTextEdit [21]
    Left = 195
    Top = 385
    Width = 121
    Height = 24
    Cursor = crIBeam
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.MaxLength = 9
    Style.BorderStyle = ebs3D
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.Shadow = True
    TabOrder = 8
    Text = 'cxTextEditKod'
    DragCursor = crIBeam
    OnKeyPress = cxTextEditKodKeyPress
  end
  object cxLabelNPPSecLev: TcxLabel [22]
    Left = 16
    Top = 416
    Width = 173
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
    TabOrder = 22
    Visible = False
    Caption = 'cxLabelNPP'
  end
  object cxTextEditNppSecLev: TcxTextEdit [23]
    Left = 195
    Top = 415
    Width = 121
    Height = 24
    Cursor = crIBeam
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.MaxLength = 9
    Style.BorderStyle = ebs3D
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.Shadow = True
    TabOrder = 9
    Text = 'cxTextEditNpp'
    Visible = False
    DragCursor = crIBeam
    OnKeyPress = cxTextEditKodKeyPress
  end
  object cxLabelSHIFRSecLev: TcxLabel [24]
    Left = 16
    Top = 358
    Width = 173
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
    TabOrder = 23
  end
  object cxTextEditSHIFRSecLev: TcxTextEdit [25]
    Left = 195
    Top = 357
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
    TabOrder = 7
    Text = 'cxTextEditSHIFRSecLev'
    DragCursor = crIBeam
  end
  inherited ActionListKlassSpravEdit: TActionList
    Top = 448
  end
end
