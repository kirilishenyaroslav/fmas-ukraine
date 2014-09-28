inherited FormPRK_SP_PLAN_CEL_NABOR_Edit: TFormPRK_SP_PLAN_CEL_NABOR_Edit
  Caption = 'FormPRK_SP_PLAN_CEL_NABOR_Edit'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxLabelFormCaption: TcxLabel
    Caption = ' '#1044#1086#1076#1072#1090#1080
  end
  object cxLabelCel_Zamovnik: TcxLabel [5]
    Left = 16
    Top = 35
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
  object cxButtonEditCel_Zamovnik: TcxButtonEdit [6]
    Left = 19
    Top = 65
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
    Properties.OnButtonClick = cxButtonEditCel_ZamovnikPropertiesButtonClick
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    Text = 'cxButtonEditCel_Zamovnik'
    OnKeyPress = cxButtonEditCel_ZamovnikKeyPress
  end
  object cxLabelPlanValue: TcxLabel [7]
    Left = 16
    Top = 100
    Width = 170
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
    TabOrder = 6
  end
  object cxTextEditPlanValue: TcxTextEdit [8]
    Left = 197
    Top = 100
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
    Text = 'cxTextEditPlanValue'
    DragCursor = crIBeam
    OnKeyPress = cxTextEditPlanValueKeyPress
  end
  inherited ActionListKlassSpravEdit: TActionList
    inherited ActionOK: TAction
      OnExecute = ActionOKExecute
    end
  end
end
