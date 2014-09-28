inherited FormPRK_SP_VUZ_LICENCE_Edit: TFormPRK_SP_VUZ_LICENCE_Edit
  Left = 579
  Top = 144
  Caption = 'FormPRK_SP_VUZ_LICENCE_Edit'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxButtonOK: TcxButton
    TabOrder = 4
  end
  inherited cxButtonCansel: TcxButton
    TabOrder = 5
  end
  inherited cxLabelFormCaption: TcxLabel
    TabOrder = 6
    Caption = ' '#1044#1086#1076#1072#1090#1080
  end
  inherited cxButtonCloseForm: TcxButton
    TabOrder = 7
  end
  object cxLabelShifr: TcxLabel [5]
    Left = 16
    Top = 30
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
    TabOrder = 8
  end
  object cxButtonEditShifr: TcxButtonEdit [6]
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
    Properties.OnButtonClick = cxButtonEditShifrPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Text = 'cxButtonEditShifr'
    OnKeyPress = cxButtonEditShifrKeyPress
  end
  object cxLabelNameObuchKat: TcxLabel [7]
    Left = 16
    Top = 82
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
    TabOrder = 9
  end
  object cxButtonEditNameObuchKateg: TcxButtonEdit [8]
    Left = 26
    Top = 107
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
    Properties.OnButtonClick = cxButtonEditNameObuchKategPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Text = 'cxButtonEditNameObuchKateg'
    OnKeyPress = cxButtonEditNameObuchKategKeyPress
  end
  object cxLabelLicenseDateEnd: TcxLabel [9]
    Left = 24
    Top = 168
    Width = 161
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
    TabOrder = 10
  end
  object cxDateEditLicenseDateEnd: TcxDateEdit [10]
    Left = 194
    Top = 170
    Width = 121
    Height = 21
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = 16776176
    TabOrder = 3
  end
  object cxTextEditLicenseValue: TcxTextEdit [11]
    Left = 195
    Top = 136
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
    TabOrder = 2
    Text = 'cxTextEditLicenseValue'
    DragCursor = crIBeam
    OnKeyPress = cxTextEditLicenseValueKeyPress
  end
  object cxLabelLicenseValue: TcxLabel [12]
    Left = 24
    Top = 137
    Width = 158
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
    TabOrder = 11
  end
  inherited ActionListKlassSpravEdit: TActionList
    inherited ActionOK: TAction
      OnExecute = ActionOKExecute
    end
  end
end
