inherited FormPRK_SP_CEL_ZAMOVNIK_Edit: TFormPRK_SP_CEL_ZAMOVNIK_Edit
  Caption = 'FormPRK_SP_CEL_ZAMOVNIK_Edit'
  ClientHeight = 276
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Height = 276
  end
  inherited cxButtonOK: TcxButton
    TabOrder = 3
  end
  inherited cxButtonCansel: TcxButton
    TabOrder = 4
  end
  inherited cxLabelFormCaption: TcxLabel
    TabOrder = 5
    Caption = ' '#1044#1086#1076#1072#1090#1080
  end
  inherited cxButtonCloseForm: TcxButton
    TabOrder = 6
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
    TabOrder = 7
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
    TabOrder = 0
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
    TabOrder = 8
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
    TabOrder = 1
    Text = 'cxTextEditShortName'
    DragCursor = crIBeam
  end
  object cxLabelCustomers: TcxLabel [9]
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
    TabOrder = 9
  end
  object cxButtonEditCustomers: TcxButtonEdit [10]
    Left = 26
    Top = 164
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
    Properties.OnButtonClick = cxButtonEditCustomersPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Text = 'cxButtonEditCustomers'
    OnKeyDown = cxButtonEditCustomersKeyDown
    OnKeyPress = cxButtonEditCustomersKeyPress
  end
  inherited ActionListKlassSpravEdit: TActionList
    inherited ActionOK: TAction
      OnExecute = ActionOKExecute
    end
  end
end
