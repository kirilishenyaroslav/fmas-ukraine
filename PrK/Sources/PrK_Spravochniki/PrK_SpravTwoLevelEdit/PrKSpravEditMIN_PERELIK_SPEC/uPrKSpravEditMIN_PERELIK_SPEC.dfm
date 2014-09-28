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
  object ClearMinPereilkPrimBtn: TcxButton [15]
    Left = 317
    Top = 54
    Width = 21
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnClick = ClearMinPereilkPrimBtnClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF0732DE0732DEFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FF0732DE
      0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732
      DE0732DEFF00FFFF00FFFF00FF0732DE0732DD0732DE0732DEFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF
      0534ED0732DF0732DE0732DEFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DDFF
      00FF0732DD0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF0732DD0633E60633E60633E90732DCFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0633E307
      32E30534EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF0732DD0534ED0533E90434EF0434F5FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0434F40534EF0533EBFF
      00FFFF00FF0434F40335F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF0335FC0534EF0434F8FF00FFFF00FFFF00FFFF00FF0335FC0335FBFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FCFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB
      0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF0335FBFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    UseSystemPaint = False
  end
  inherited ActionListKlassSpravEdit: TActionList
    Top = 237
  end
end
