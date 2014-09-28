inherited FormPrKSpravEditPREIM_KAT_ForAdd: TFormPrKSpravEditPREIM_KAT_ForAdd
  Left = 633
  Top = 142
  Caption = 'FormPrKSpravEditPREIM_KAT_ForAdd'
  ClientHeight = 482
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Height = 482
  end
  object Bevel1: TBevel [1]
    Left = 0
    Top = 240
    Width = 345
    Height = 9
  end
  inherited cxLabelName: TcxLabel
    TabOrder = 11
  end
  inherited cxLabelShortName: TcxLabel
    TabOrder = 12
  end
  inherited cxLabelKod: TcxLabel
    TabOrder = 13
  end
  inherited cxTextEditKod: TcxTextEdit
    TabOrder = 3
  end
  inherited cxButtonOK: TcxButton
    Top = 441
    TabOrder = 9
  end
  inherited cxButtonCansel: TcxButton
    Top = 441
    TabOrder = 10
  end
  inherited cxLabelFormCaption: TcxLabel
    TabOrder = 14
    Caption = ' '#1044#1086#1076#1072#1090#1080
  end
  inherited cxButtonCloseForm: TcxButton
    TabOrder = 15
  end
  inherited cxLabelNPP: TcxLabel
    TabOrder = 16
    Caption = 'cxLabelNPP'
  end
  inherited cxTextEditNPP: TcxTextEdit
    TabOrder = 4
  end
  inherited cxCheckBoxIS_FIZL_LGOTA: TcxCheckBox
    TabOrder = 2
  end
  inherited cxLabelIS_FIZL_LGOTA: TcxLabel
    TabOrder = 17
  end
  object cxLabelNameSecLev: TcxLabel [16]
    Left = 16
    Top = 258
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
    TabOrder = 18
  end
  object cxTextEditNameSecLev: TcxTextEdit [17]
    Left = 26
    Top = 283
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
    Top = 311
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
  object cxTextEditShortNameSecLev: TcxTextEdit [19]
    Left = 26
    Top = 336
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
  object cxTextEditKodSecLev: TcxTextEdit [20]
    Left = 195
    Top = 374
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
    TabOrder = 7
    Text = 'cxTextEditKod'
    DragCursor = crIBeam
    OnKeyPress = cxTextEditKodKeyPress
  end
  object cxLabelKodSecLev: TcxLabel [21]
    Left = 16
    Top = 375
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
    TabOrder = 20
  end
  object cxLabelNPPSecLev: TcxLabel [22]
    Left = 16
    Top = 409
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
    TabOrder = 21
    Visible = False
    Caption = 'cxLabelNPP'
  end
  object cxTextEditNppSecLev: TcxTextEdit [23]
    Left = 195
    Top = 408
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
    Text = 'cxTextEditNpp'
    Visible = False
    DragCursor = crIBeam
    OnKeyPress = cxTextEditKodKeyPress
  end
  inherited ActionListKlassSpravEdit: TActionList
    Left = 8
    Top = 424
  end
end
