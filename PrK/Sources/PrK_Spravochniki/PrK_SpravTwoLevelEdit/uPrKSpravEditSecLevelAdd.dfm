inherited FormPrKSpravEditSecLevelAdd: TFormPrKSpravEditSecLevelAdd
  Left = 334
  Top = 201
  Caption = 'FormPrKSpravEditSecLevelAdd'
  ClientHeight = 457
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Height = 457
  end
  object Bevel1: TBevel [1]
    Left = 0
    Top = 216
    Width = 345
    Height = 9
  end
  inherited cxLabelName: TcxLabel
    Width = 297
    TabOrder = 10
  end
  inherited cxLabelShortName: TcxLabel
    Width = 297
    TabOrder = 11
  end
  inherited cxLabelKod: TcxLabel
    Left = 16
    Width = 166
    TabOrder = 12
  end
  inherited cxButtonOK: TcxButton
    Top = 414
    TabOrder = 8
  end
  inherited cxButtonCansel: TcxButton
    Top = 414
    TabOrder = 9
  end
  inherited cxLabelFormCaption: TcxLabel
    TabOrder = 13
    Caption = ' '#1044#1086#1076#1072#1090#1080
  end
  inherited cxButtonCloseForm: TcxButton
    TabOrder = 14
  end
  inherited cxLabelNPP: TcxLabel
    Left = 16
    Width = 166
    TabOrder = 15
    Caption = 'cxLabelNPP'
  end
  object cxLabelNameSecLev: TcxLabel [14]
    Left = 16
    Top = 234
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
    TabOrder = 16
  end
  object cxTextEditNameSecLev: TcxTextEdit [15]
    Left = 26
    Top = 259
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
    TabOrder = 4
    Text = 'cxTextEditName'
    DragCursor = crIBeam
  end
  object cxLabelShortNameSecLev: TcxLabel [16]
    Left = 16
    Top = 287
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
    TabOrder = 17
  end
  object cxTextEditShortNameSecLev: TcxTextEdit [17]
    Left = 26
    Top = 312
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
    TabOrder = 5
    Text = 'cxTextEditShortName'
    DragCursor = crIBeam
  end
  object cxLabelKodSecLev: TcxLabel [18]
    Left = 16
    Top = 351
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
    TabOrder = 18
  end
  object cxTextEditKodSecLev: TcxTextEdit [19]
    Left = 195
    Top = 350
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
    TabOrder = 6
    Text = 'cxTextEditKod'
    DragCursor = crIBeam
    OnKeyPress = cxTextEditKodKeyPress
  end
  object cxLabelNPPSecLev: TcxLabel [20]
    Left = 16
    Top = 385
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
    TabOrder = 19
    Visible = False
    Caption = 'cxLabelNPP'
  end
  object cxTextEditNppSecLev: TcxTextEdit [21]
    Left = 195
    Top = 384
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
    Text = 'cxTextEditNpp'
    Visible = False
    DragCursor = crIBeam
    OnKeyPress = cxTextEditKodKeyPress
  end
  inherited ActionListKlassSpravEdit: TActionList
    Left = 0
    Top = 384
  end
end
