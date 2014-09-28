object fmPiTypeDocAdd: TfmPiTypeDocAdd
  Left = 550
  Top = 273
  Width = 551
  Height = 249
  Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103' '#1090#1080#1087#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel4: TcxLabel
    Left = 8
    Top = 12
    Width = 185
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = #1053#1072#1079#1074#1072' '#1090#1080#1087#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object MemoName: TcxMemo
    Left = 8
    Top = 35
    Width = 513
    Height = 89
    Lines.Strings = (
      '')
    Style.Color = clWindow
    TabOrder = 1
  end
  object OkButton: TcxButton
    Left = 346
    Top = 166
    Width = 75
    Height = 25
    Caption = 'OkButton'
    TabOrder = 2
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 442
    Top = 166
    Width = 75
    Height = 25
    Caption = #1042#1080#1081#1090#1080
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object LabelKod1DF: TcxLabel
    Left = 8
    Top = 139
    Width = 116
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taLeftJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = #1054#1079#1085#1072#1082#1072' '#1076#1086#1093#1086#1076#1072
  end
  object ButtonEditProp: TcxButtonEdit
    Left = 130
    Top = 136
    Width = 383
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taLeftJustify
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.MaskKind = emkRegExpr
    Properties.MaxLength = 0
    Properties.ReadOnly = False
    Properties.OnButtonClick = ButtonEditPropPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 5
  end
  object ActionList1: TActionList
    Left = 408
    Top = 88
    object ActionSave: TAction
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      ShortCut = 121
    end
    object ActionExit: TAction
      Caption = #1042#1080#1081#1090#1080
      ShortCut = 27
    end
  end
end
