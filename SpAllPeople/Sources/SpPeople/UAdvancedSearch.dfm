object AdvancedSearchForm: TAdvancedSearchForm
  Left = 364
  Top = 202
  BorderStyle = bsDialog
  Caption = #1055#1086#1096#1091#1082
  ClientHeight = 159
  ClientWidth = 232
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
  object SearchGroup: TGroupBox
    Left = 8
    Top = 8
    Width = 217
    Height = 121
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1087#1086#1096#1091#1082#1091
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 173
      Height = 13
      Caption = #1055#1086#1096#1091#1082' '#1087#1086' '#1087#1086#1076#1072#1090#1082#1086#1074#1086#1084#1091' '#1082#1086#1076#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 72
      Width = 192
      Height = 13
      Caption = #1055#1086#1096#1091#1082' '#1087#1086' '#1082#1086#1083#1080#1096#1085#1100#1086#1084#1091' '#1087#1088#1110#1079#1074#1080#1097#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TinSearchBtn: TRadioButton
      Left = 8
      Top = 42
      Width = 17
      Height = 17
      Checked = True
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      TabStop = True
      OnClick = TinSearchBtnClick
    end
    object OldFamiliaSearchBtn: TRadioButton
      Left = 8
      Top = 90
      Width = 17
      Height = 17
      TabOrder = 1
      OnClick = OldFamiliaSearchBtnClick
    end
  end
  object OldFamEdit: TcxMaskEdit
    Left = 32
    Top = 96
    Width = 185
    Height = 21
    Enabled = False
    Properties.CharCase = ecUpperCase
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '['#39#39#39#39#1072'-'#1103#1111#1110#1108#1040'-'#1071#1031#1030#1028']+'
    Properties.MaxLength = 0
    TabOrder = 2
  end
  object TinSearchEdit: TcxMaskEdit
    Left = 32
    Top = 48
    Width = 185
    Height = 21
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d'
    Properties.MaxLength = 0
    TabOrder = 1
  end
  object SelectBtn: TcxButton
    Left = 49
    Top = 136
    Width = 129
    Height = 20
    Action = SelectAction
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object ActionList1: TActionList
    Left = 160
    object SelectAction: TAction
      Caption = #1055#1086#1096#1091#1082
      ShortCut = 13
      OnExecute = SelectActionExecute
    end
    object CancelAction: TAction
      Caption = 'CancelAction'
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
end
