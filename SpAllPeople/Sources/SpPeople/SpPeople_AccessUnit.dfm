object AccessForm: TAccessForm
  Left = 379
  Top = 377
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1044#1086#1089#1090#1091#1087' '#1076#1086' '#1076#1072#1085#1080#1093' '#1092#1110#1079'.'#1086#1089#1086#1073#1080
  ClientHeight = 151
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object LabSeria: TLabel
    Left = 16
    Top = 62
    Width = 35
    Height = 16
    Caption = #1057#1077#1088#1110#1103
  end
  object LabNomer: TLabel
    Left = 16
    Top = 88
    Width = 43
    Height = 16
    Caption = #1053#1086#1084#1077#1088
  end
  object LabText: TLabel
    Left = 16
    Top = 6
    Width = 223
    Height = 48
    Caption = 
      #1044#1083#1103' '#1076#1086#1089#1090#1091#1087#1091' '#1076#1086' '#1076#1072#1085#1080#1093' '#1094#1110#1108#1111' '#1092#1110#1079#1080#1095#1085#1086#1111' '#1086#1089#1086#1073#1080' '#1074#1082#1072#1078#1110#1090#1100' '#1089#1077#1088#1110#1102' '#1090#1072' '#1085#1086#1084#1077#1088' ' +
      #1110#1110' '#1087#1072#1089#1087#1086#1088#1090#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object SeriaEdit: TcxMaskEdit
    Left = 72
    Top = 60
    Width = 97
    Height = 24
    Hint = #1042#1074#1077#1076#1110#1090#1100' '#1089#1077#1088#1110#1102' '#1087#1072#1089#1087#1086#1088#1090#1091' '#1092#1110#1079#1080#1095#1085#1086#1111' '#1086#1089#1086#1073#1080
    Properties.CharCase = ecUpperCase
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '['#1072'-'#1103#1108#1110#1111#1040'-'#1071#1030#1031#1028'A-Za-z0-9]+'
    Properties.MaxLength = 0
    TabOrder = 0
  end
  object NomerEdit: TcxMaskEdit
    Left = 72
    Top = 84
    Width = 97
    Height = 24
    Hint = #1042#1074#1077#1076#1110#1090#1100' '#1085#1086#1084#1077#1088' '#1087#1072#1089#1087#1086#1088#1090#1091' '#1092#1110#1079#1080#1095#1085#1086#1111' '#1086#1089#1086#1073#1080
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '[0-9]+'
    Properties.MaxLength = 0
    TabOrder = 1
  end
  object CancelButton: TcxButton
    Left = 136
    Top = 117
    Width = 97
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object OkButton: TcxButton
    Left = 17
    Top = 117
    Width = 97
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    ModalResult = 1
    TabOrder = 2
    OnClick = OkButtonClick
  end
end
