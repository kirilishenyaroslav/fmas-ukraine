object FEditPart: TFEditPart
  Left = 435
  Top = 259
  Width = 328
  Height = 153
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
  object cxGroupBox11: TcxGroupBox
    Left = 0
    Top = -1
    Width = 310
    Height = 41
    Alignment = alTopLeft
    Caption = #1055#1088#1086#1073#1077#1075
    TabOrder = 0
    TabStop = False
    object cxTextEdit10: TcxMaskEdit
      Left = 6
      Top = 15
      Width = 299
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?'
      Properties.MaxLength = 0
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 80
    Width = 312
    Height = 35
    Align = alBottom
    TabOrder = 2
    object cxButton1: TcxButton
      Left = 146
      Top = 6
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1085#1103#1090#1100
      TabOrder = 0
      OnClick = Action1Execute
    end
    object cxButton2: TcxButton
      Left = 226
      Top = 6
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object GroupBoxProp: TcxGroupBox
    Left = 0
    Top = 39
    Width = 310
    Height = 41
    Alignment = alTopLeft
    Caption = #1053#1072#1076#1073#1072#1074#1082#1072
    TabOrder = 1
    TabStop = False
    object EditBtn: TcxButtonEdit
      Left = 6
      Top = 14
      Width = 299
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      Properties.OnButtonClick = EditBtnPropertiesButtonClick
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Left = 57
    Top = 82
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 13
      OnExecute = Action2Execute
    end
    object Action1: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
      OnExecute = Action1Execute
    end
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 27
      OnExecute = cxButton2Click
    end
  end
end
