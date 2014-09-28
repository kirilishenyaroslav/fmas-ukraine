inherited FormPrKSpravEditMIN_PERELIK_SPEC: TFormPrKSpravEditMIN_PERELIK_SPEC
  Left = 351
  Top = 188
  Caption = 'FormPrKSpravEditMIN_PERELIK_SPEC'
  ClientHeight = 322
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Height = 322
  end
  inherited cxLabelName: TcxLabel
    Top = 78
    TabOrder = 7
  end
  inherited cxLabelShortName: TcxLabel
    Top = 131
    TabOrder = 8
  end
  inherited cxLabelKod: TcxLabel
    Top = 192
    TabOrder = 9
  end
  inherited cxTextEditName: TcxTextEdit
    Top = 103
    TabOrder = 1
  end
  inherited cxTextEditShortName: TcxTextEdit
    Top = 156
    TabOrder = 2
  end
  inherited cxTextEditKod: TcxTextEdit
    Top = 191
    TabOrder = 3
  end
  inherited cxButtonOK: TcxButton
    Top = 274
    TabOrder = 5
  end
  inherited cxButtonCansel: TcxButton
    Top = 274
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
    Top = 226
    TabOrder = 12
    Caption = 'cxLabelNPP'
  end
  inherited cxTextEditNPP: TcxTextEdit
    Top = 225
    TabOrder = 4
  end
  object cxLabelMinPerelikPrim: TcxLabel [13]
    Left = 16
    Top = 29
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
    TabOrder = 13
  end
  object cxButtonEditMinPerelikPrim: TcxButtonEdit [14]
    Left = 26
    Top = 54
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
    Properties.OnButtonClick = cxButtonEditMinPerelikPrimPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Text = 'cxButtonEditMinPerelikPrim'
    OnKeyPress = cxButtonEditMinPerelikPrimKeyPress
  end
  inherited ActionListKlassSpravEdit: TActionList
    Top = 237
  end
end
