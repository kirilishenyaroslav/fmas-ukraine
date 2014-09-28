inherited FormPUB_SP_SPEC_Edit: TFormPUB_SP_SPEC_Edit
  Left = 316
  Top = 201
  Caption = 'FormPUB_SP_SPEC_Edit'
  ClientHeight = 406
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Height = 406
  end
  inherited cxLabelName: TcxLabel
    TabOrder = 7
  end
  inherited cxLabelShortName: TcxLabel
    TabOrder = 8
  end
  inherited cxLabelKod: TcxLabel
    Top = 303
    TabOrder = 9
  end
  inherited cxTextEditKod: TcxTextEdit
    Top = 302
    TabOrder = 3
  end
  inherited cxButtonOK: TcxButton
    Top = 369
    TabOrder = 5
  end
  inherited cxButtonCansel: TcxButton
    Top = 369
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
    Top = 337
    TabOrder = 12
    Caption = 'cxLabelNPP'
  end
  inherited cxTextEditNPP: TcxTextEdit
    Top = 336
    TabOrder = 4
  end
  object cxLabelUSpec: TcxLabel [13]
    Left = 16
    Top = 194
    Width = 297
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
    TabOrder = 13
    Caption = 'cxLabelUSpec'
  end
  object cxButtonEditUSpec: TcxButtonEdit [14]
    Left = 26
    Top = 219
    Width = 290
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = False
    Properties.OnButtonClick = cxButtonEditUSpecPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Text = 'cxButtonEditUSpec'
    OnKeyPress = cxButtonEditUSpecKeyPress
  end
  object cxTextEditFullName: TcxTextEdit [15]
    Left = 26
    Top = 165
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
    TabOrder = 14
    Text = 'cxTextEditFullName'
    DragCursor = crIBeam
  end
  object cxLabelFullName: TcxLabel [16]
    Left = 16
    Top = 140
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
  object cxButtonEditMova: TcxButtonEdit [17]
    Left = 26
    Top = 272
    Width = 290
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = False
    Properties.OnButtonClick = cxButtonEditMovaPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 16
    Text = 'cxButtonEditMova'
    OnKeyPress = cxButtonEditUSpecKeyPress
  end
  object cxLabelMova: TcxLabel [18]
    Left = 16
    Top = 247
    Width = 297
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
    Caption = 'cxLabelMova'
  end
  inherited ActionListKlassSpravEdit: TActionList
    Top = 240
  end
end
