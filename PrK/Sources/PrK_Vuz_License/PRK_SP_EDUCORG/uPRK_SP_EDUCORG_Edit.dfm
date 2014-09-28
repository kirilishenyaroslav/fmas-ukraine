inherited FormPRK_SP_EDUCORG_Edit: TFormPRK_SP_EDUCORG_Edit
  Caption = 'FormPRK_SP_EDUCORG_Edit'
  ClientHeight = 308
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Height = 308
  end
  inherited cxButtonOK: TcxButton
    Top = 263
  end
  inherited cxButtonCansel: TcxButton
    Top = 263
  end
  inherited cxLabelFormCaption: TcxLabel
    Caption = ' '#1044#1086#1076#1072#1090#1080
  end
  object cxLabelName: TcxLabel [5]
    Left = 16
    Top = 34
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
    TabOrder = 4
  end
  object cxTextEditName: TcxTextEdit [6]
    Left = 26
    Top = 59
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
  object cxLabelShortName: TcxLabel [7]
    Left = 16
    Top = 87
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
    TabOrder = 6
  end
  object cxTextEditShortName: TcxTextEdit [8]
    Left = 26
    Top = 112
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
    TabOrder = 7
    Text = 'cxTextEditShortName'
    DragCursor = crIBeam
  end
  object cxLabelTYPE: TcxLabel [9]
    Left = 16
    Top = 139
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
  object cxButtonEditTYPE: TcxButtonEdit [10]
    Left = 26
    Top = 163
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
    Properties.OnButtonClick = cxButtonEditTYPEPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 9
    Text = 'cxButtonEditTYPE'
    OnKeyPress = cxButtonEditTYPEKeyPress
  end
  object cxLabelPLACE: TcxLabel [11]
    Left = 16
    Top = 191
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
    TabOrder = 10
  end
  object cxButtonEditPLACE: TcxButtonEdit [12]
    Left = 26
    Top = 216
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
    Properties.OnButtonClick = cxButtonEditPLACEPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
    Text = 'cxButtonEditPLACE'
    OnKeyPress = cxButtonEditPLACEKeyPress
  end
  inherited ActionListKlassSpravEdit: TActionList
    Left = 8
    Top = 257
    inherited ActionOK: TAction
      OnExecute = ActionOKExecute
    end
  end
end
