inherited FormPrKSpravEditTYPE_DOP_DOK: TFormPrKSpravEditTYPE_DOP_DOK
  Left = 306
  Top = 168
  ClientHeight = 394
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Height = 394
  end
  inherited cxLabelName: TcxLabel
    Top = 149
    TabOrder = 10
  end
  inherited cxLabelShortName: TcxLabel
    Top = 202
    TabOrder = 11
  end
  inherited cxLabelKod: TcxLabel
    Top = 285
    TabOrder = 12
  end
  inherited cxTextEditName: TcxTextEdit
    Top = 174
    TabOrder = 3
  end
  inherited cxTextEditShortName: TcxTextEdit
    Top = 227
    TabOrder = 4
  end
  inherited cxTextEditKod: TcxTextEdit
    Top = 284
    TabOrder = 6
  end
  inherited cxButtonOK: TcxButton
    Top = 357
    TabOrder = 8
  end
  inherited cxButtonCansel: TcxButton
    Top = 357
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
    Top = 319
    TabOrder = 15
    Caption = 'cxLabelNPP'
  end
  inherited cxTextEditNPP: TcxTextEdit
    Top = 318
    TabOrder = 7
  end
  object cxLabelISPIT_VEDOM_TYPE: TcxLabel [13]
    Left = 16
    Top = 53
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
  object cxButtonEditISPIT_VEDOM_TYPE: TcxButtonEdit [14]
    Left = 26
    Top = 78
    Width = 290
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditISPIT_VEDOM_TYPEPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Text = 'cxButtonEditISPIT_VEDOM_TYPE'
    OnKeyPress = cxButtonEditISPIT_VEDOM_TYPEKeyPress
  end
  object cxCheckBoxIsOCENKA: TcxCheckBox [15]
    Left = 26
    Top = 29
    Width = 30
    Height = 21
    Cursor = crHandPoint
    ParentColor = False
    ParentFont = False
    Properties.Alignment = taCenter
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = cxCheckBoxIsOCENKAPropertiesChange
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    Style.TransparentBorder = True
    TabOrder = 0
  end
  object cxLabelIS_OCENKA: TcxLabel [16]
    Left = 56
    Top = 29
    Width = 232
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
  object cxLabelPredm: TcxLabel [17]
    Left = 16
    Top = 100
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
  object cxButtonEditPredm: TcxButtonEdit [18]
    Left = 26
    Top = 125
    Width = 290
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditPredmPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Text = 'cxButtonEditPredm'
    OnKeyPress = cxButtonEditISPIT_VEDOM_TYPEKeyPress
  end
  object cxCheckBoxIsNoRozpiska: TcxCheckBox [19]
    Left = 26
    Top = 260
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
    TabOrder = 5
  end
  object cxLabelIsNoRozpiska: TcxLabel [20]
    Left = 56
    Top = 260
    Width = 232
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
    TabOrder = 19
  end
  inherited ActionListKlassSpravEdit: TActionList
    Top = 342
  end
end
