object FFACTOR_EDIT: TFFACTOR_EDIT
  Left = 419
  Top = 280
  Width = 351
  Height = 161
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 332
    Height = 41
    Alignment = alTopLeft
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1085#1072#1076#1073#1072#1074#1082#1080
    TabOrder = 0
    TabStop = False
    object cxMaskEdit1: TcxMaskEdit
      Left = 5
      Top = 15
      Width = 321
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 88
    Width = 335
    Height = 35
    Align = alBottom
    TabOrder = 2
    object cxButton1: TcxButton
      Left = 170
      Top = 6
      Width = 75
      Height = 25
      Action = Action1
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 250
      Top = 6
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 44
    Width = 332
    Height = 41
    Alignment = alTopLeft
    Caption = #1042#1077#1083#1080#1095#1080#1085#1072' '#1085#1072#1076#1073#1072#1074#1082#1080
    TabOrder = 1
    TabStop = False
    object cxMaskEdit2: TcxMaskEdit
      Left = 5
      Top = 15
      Width = 321
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '.+'
      Properties.MaxLength = 0
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Left = 72
    Top = 85
    object Action1: TAction
      Caption = #1055#1088#1080#1085#1103#1090#1100
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 13
      OnExecute = Action2Execute
    end
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 27
      OnExecute = cxButton2Click
    end
  end
end
