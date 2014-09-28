inherited FormPRK_SP_PLAN_NABORA_Edit: TFormPRK_SP_PLAN_NABORA_Edit
  Left = 296
  Top = 192
  Caption = 'FormPRK_SP_PLAN_NABORA_Edit'
  ClientHeight = 408
  ClientWidth = 566
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Width = 566
    Height = 408
  end
  inherited cxButtonOK: TcxButton
    Left = 347
    Top = 364
    TabOrder = 11
  end
  inherited cxButtonCansel: TcxButton
    Left = 450
    Top = 364
    TabOrder = 12
  end
  inherited cxLabelFormCaption: TcxLabel
    Width = 566
    TabOrder = 13
    Caption = ' '#1044#1086#1076#1072#1090#1080
  end
  inherited cxButtonCloseForm: TcxButton
    Left = 543
    TabOrder = 14
  end
  object cxLabelCnFaculSpec: TcxLabel [5]
    Left = 12
    Top = 30
    Width = 244
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
  object cxButtonEditCnFaculSpec: TcxButtonEdit [6]
    Left = 22
    Top = 54
    Width = 260
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditCnFaculSpecPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Text = 'cxButtonEditCnFaculSpec'
    OnKeyPress = cxButtonEditCnFaculSpecKeyPress
  end
  object cxLabelCnKatStud: TcxLabel [7]
    Left = 286
    Top = 29
    Width = 244
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
  object cxButtonEditCnKatStud: TcxButtonEdit [8]
    Left = 296
    Top = 54
    Width = 260
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditCnKatStudPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Text = 'cxButtonEditCnKatStud'
    OnKeyPress = cxButtonEditCnKatStudKeyPress
  end
  object cxLabelPlanValue: TcxLabel [9]
    Left = 12
    Top = 310
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
    TabOrder = 17
  end
  object cxTextEditPlanValue: TcxTextEdit [10]
    Left = 178
    Top = 309
    Width = 103
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
    TabOrder = 10
    Text = 'cxTextEditPlanValue'
    DragCursor = crIBeam
    OnKeyPress = cxTextEditPlanValueKeyPress
  end
  object cxLabelCnFormStud: TcxLabel [11]
    Left = 12
    Top = 82
    Width = 244
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
  object cxButtonEditCnFormStud: TcxButtonEdit [12]
    Left = 22
    Top = 105
    Width = 260
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditCnFormStudPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Text = 'cxButtonEditCnFormStud'
    OnKeyPress = cxButtonEditCnFormStudKeyPress
  end
  object cxLabelGodNabora: TcxLabel [13]
    Left = 286
    Top = 82
    Width = 244
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
  object cxButtonEditGodNabora: TcxButtonEdit [14]
    Left = 296
    Top = 105
    Width = 260
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditGodNaboraPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
    Text = 'cxButtonEditGodNabora'
    OnKeyPress = cxButtonEditGodNaboraKeyPress
  end
  object cxLabelDergZakaz: TcxLabel [15]
    Left = 12
    Top = 131
    Width = 244
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
  object cxButtonEditDergZakaz: TcxButtonEdit [16]
    Left = 22
    Top = 154
    Width = 260
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditDergZakazPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Text = 'cxButtonEditDergZakaz'
    OnKeyPress = cxButtonEditDergZakazKeyPress
  end
  object cxLabelKurs: TcxLabel [17]
    Left = 286
    Top = 131
    Width = 244
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
    TabOrder = 21
  end
  object cxButtonEditKurs: TcxButtonEdit [18]
    Left = 296
    Top = 154
    Width = 260
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditKursPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    Text = 'cxButtonEditKurs'
    OnKeyPress = cxButtonEditKursKeyPress
  end
  object cxButtonEditSrokOb: TcxButtonEdit [19]
    Left = 22
    Top = 203
    Width = 260
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditSrokObPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
    Text = 'cxButtonEditSrokOb'
    OnKeyPress = cxButtonEditSrokObKeyPress
  end
  object cxLabelSrokOb: TcxLabel [20]
    Left = 12
    Top = 180
    Width = 244
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
    TabOrder = 22
  end
  object cxLabelVID_DII: TcxLabel [21]
    Left = 12
    Top = 227
    Width = 244
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
    TabOrder = 23
  end
  object cxButtonEditVID_DII: TcxButtonEdit [22]
    Left = 22
    Top = 249
    Width = 260
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditVID_DIIPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 8
    Text = 'cxButtonEditVID_DII'
    OnKeyPress = cxButtonEditSrokObKeyPress
  end
  object cxLabelNPK: TcxLabel [23]
    Left = 286
    Top = 180
    Width = 244
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
    TabOrder = 24
  end
  object cxButtonEditNPK: TcxButtonEdit [24]
    Left = 296
    Top = 203
    Width = 260
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditNPKPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
    Text = 'cxButtonEditNPK'
    OnKeyPress = cxButtonEditSrokObKeyPress
  end
  object cxLabelDateBeg: TcxLabel [25]
    Left = 12
    Top = 280
    Width = 166
    Height = 19
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.LabelStyle = cxlsRaised
    Properties.ShadowedColor = clBtnShadow
    Properties.Transparent = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    TabOrder = 25
  end
  object cxDateEditDateBeg: TcxDateEdit [26]
    Left = 177
    Top = 278
    Width = 105
    Height = 21
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = 16776176
    TabOrder = 9
  end
  inherited ActionListKlassSpravEdit: TActionList
    Left = 264
    Top = 356
    inherited ActionOK: TAction
      OnExecute = ActionOKExecute
    end
  end
end
