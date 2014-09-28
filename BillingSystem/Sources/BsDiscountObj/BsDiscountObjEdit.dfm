object frmGroupObjEdit: TfrmGroupObjEdit
  Left = 286
  Top = 116
  Width = 381
  Height = 184
  BorderIcons = [biSystemMenu]
  Caption = 'frmGroupObjEdit'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object chRootObject: TcxCheckBox
    Left = 232
    Top = 11
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1050#1086#1088#1077#1085#1077#1074#1080#1081' '#1086#1073#1108#39#1082#1090
    TabOrder = 2
  end
  object NameObjEdit: TcxTextEdit
    Left = 96
    Top = 40
    Width = 257
    Height = 21
    TabOrder = 4
  end
  object NameComment: TcxTextEdit
    Left = 96
    Top = 72
    Width = 257
    Height = 21
    TabOrder = 6
  end
  object btnOk: TcxButton
    Left = 83
    Top = 108
    Width = 75
    Height = 25
    Caption = #1043#1072#1088#1072#1079#1076
    TabOrder = 7
    OnClick = btnOkClick
  end
  object btnCancel: TcxButton
    Left = 195
    Top = 108
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 8
    OnClick = btnCancelClick
  end
  object lblNameObj: TcxLabel
    Left = 8
    Top = 40
    Width = 79
    Height = 17
    TabOrder = 3
    Caption = #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1091
  end
  object lblComment: TcxLabel
    Left = 8
    Top = 72
    Width = 55
    Height = 17
    TabOrder = 5
    Caption = #1055#1088#1080#1084#1110#1090#1082#1072
  end
  object lblKodObj: TcxLabel
    Left = 8
    Top = 10
    Width = 67
    Height = 17
    TabOrder = 0
    Caption = #1050#1086#1076' '#1086#1073#39#1108#1082#1090#1072
  end
  object KodEdit: TcxTextEdit
    Left = 96
    Top = 10
    Width = 65
    Height = 21
    TabOrder = 1
    OnKeyPress = KodEditKeyPress
  end
end
