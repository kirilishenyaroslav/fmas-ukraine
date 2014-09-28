object fmAddForm: TfmAddForm
  Left = 582
  Top = 413
  BorderStyle = bsDialog
  Caption = #1030#1084#1087#1086#1088#1090#1091#1074#1072#1090#1080
  ClientHeight = 195
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 442
    Height = 153
    Align = alTop
  end
  object BoxKodSetup: TcxGroupBox
    Left = 0
    Top = 48
    Width = 441
    Height = 33
    Alignment = alTopLeft
    TabOrder = 0
    object MonthesList: TcxComboBox
      Left = 8
      Top = 8
      Width = 148
      Height = 21
      TabOrder = 0
    end
    object YearSpinEdit: TcxSpinEdit
      Left = 160
      Top = 8
      Width = 57
      Height = 21
      TabOrder = 1
      Value = 2000
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 96
    Width = 441
    Height = 41
    Alignment = alTopLeft
    TabOrder = 1
    object EditVidOpl: TcxButtonEdit
      Left = 8
      Top = 10
      Width = 60
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d?'
      Properties.MaxLength = 0
      Properties.OnButtonClick = EditVidOplPropertiesButtonClick
      TabOrder = 0
      OnExit = EditVidOplExit
    end
    object LabelVidOplData: TcxLabel
      Left = 64
      Top = 10
      Width = 369
      Height = 21
      AutoSize = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 1
      Caption = ''
    end
  end
  object cxButton1: TcxButton
    Left = 240
    Top = 160
    Width = 75
    Height = 25
    Caption = #1030#1084#1087#1086#1088#1090#1091#1074#1072#1090#1080
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 328
    Top = 160
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object LabelKodSetup: TcxLabel
    Left = 8
    Top = 33
    Width = 81
    Height = 17
    TabOrder = 4
  end
  object LabelVidOpl: TcxLabel
    Left = 8
    Top = 80
    Width = 71
    Height = 17
    TabOrder = 5
    Caption = #1042#1080#1076' '#1086#1087#1077#1088#1072#1094#1110#1111
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Width = 192
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
    Caption = #1056#1077#1075#1110#1089#1090#1088#1072#1094#1110#1081#1085#1080#1081' '#1085#1086#1084#1077#1088' '#1085#1072#1082#1072#1079#1091': '
  end
  object LabelNumOrder: TcxDBLabel
    Left = 200
    Top = 8
    Width = 96
    Height = 17
    DataBinding.DataField = 'num_order'
    DataBinding.DataSource = DM.DSourceMain
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
  end
end
