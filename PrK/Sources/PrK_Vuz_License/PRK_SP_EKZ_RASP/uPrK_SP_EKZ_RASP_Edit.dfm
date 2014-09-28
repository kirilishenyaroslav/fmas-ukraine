inherited FormPrK_SP_EKZ_RASP_Edit: TFormPrK_SP_EKZ_RASP_Edit
  Left = 425
  Top = 197
  Caption = 'FormPrK_SP_EKZ_RASP_Edit'
  ClientHeight = 226
  ClientWidth = 346
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Width = 346
    Height = 226
  end
  inherited cxButtonOK: TcxButton
    Top = 185
  end
  inherited cxButtonCansel: TcxButton
    Top = 185
  end
  inherited cxLabelFormCaption: TcxLabel
    Caption = ' '#1044#1086#1076#1072#1090#1080
  end
  object cxLabelEKZ_DATE: TcxLabel [5]
    Left = 16
    Top = 86
    Width = 149
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
  object cxDateEditEKZ_DATE: TcxDateEdit [6]
    Left = 26
    Top = 112
    Width = 143
    Height = 21
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = 16776176
    TabOrder = 5
  end
  object cxLabelNamePredm: TcxLabel [7]
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
    TabOrder = 6
  end
  object cxTextEditNamePredm: TcxTextEdit [8]
    Left = 29
    Top = 55
    Width = 290
    Height = 24
    Cursor = crIBeam
    AutoSize = False
    Enabled = False
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
    Text = 'cxTextEditNamePredm'
    DragCursor = crIBeam
  end
  inherited ActionListKlassSpravEdit: TActionList
    Top = 174
    inherited ActionOK: TAction
      OnExecute = ActionOKExecute
    end
  end
end
