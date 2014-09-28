object frmEditSaldo: TfrmEditSaldo
  Left = 616
  Top = 123
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1089#1072#1083#1100#1076#1086' '#1073#1072#1083#1072#1085#1089#1086#1074#1086#1075#1086' '#1088#1072#1093#1091#1085#1082#1091
  ClientHeight = 223
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label3: TLabel
    Left = 48
    Top = 93
    Width = 129
    Height = 33
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1042#1079#1103#1090#1100' '#1085#1072' '#1073#1072#1083#1083#1072#1085#1089' '#1074' '#1076#1077#1073#1077#1090#1077
    WordWrap = True
  end
  object Label4: TLabel
    Left = 48
    Top = 133
    Width = 129
    Height = 33
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1042#1079#1103#1090#1100' '#1085#1072' '#1073#1072#1083#1083#1072#1085#1089' '#1074' '#1082#1088#1077#1076#1080#1090#1077
    WordWrap = True
  end
  object Label5: TLabel
    Left = 48
    Top = 58
    Width = 129
    Height = 33
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1042#1079#1103#1090#1100' '#1085#1072' '#1073#1072#1083#1083#1072#1085#1089' '#1074' '#1082#1088#1077#1076#1080#1090#1077
    WordWrap = True
  end
  object Label6: TLabel
    Left = 48
    Top = 18
    Width = 129
    Height = 33
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1042#1079#1103#1090#1100' '#1085#1072' '#1073#1072#1083#1083#1072#1085#1089' '#1074' '#1076#1077#1073#1077#1090#1077
    WordWrap = True
  end
  object Label9: TLabel
    Left = 46
    Top = 92
    Width = 129
    Height = 33
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1073#1072#1083#1083#1072#1085#1089' '#1074' '#1076#1077#1073#1077#1090#1077
    WordWrap = True
  end
  object Label10: TLabel
    Left = 46
    Top = 132
    Width = 129
    Height = 33
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1073#1072#1083#1083#1072#1085#1089' '#1074' '#1082#1088#1077#1076#1080#1090#1077
    WordWrap = True
  end
  object Label13: TLabel
    Left = 46
    Top = 172
    Width = 129
    Height = 33
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1054#1073#1086#1088#1086#1090#1099' '#1087#1086' '#1076#1077#1073#1077#1090#1091
    WordWrap = True
  end
  object Label14: TLabel
    Left = 46
    Top = 204
    Width = 129
    Height = 33
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1054#1073#1086#1088#1086#1090#1099' '#1087#1086' '#1082#1088#1077#1076#1080#1090#1091
    WordWrap = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 176
    Width = 451
    Height = 47
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 368
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 176
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 209
      Height = 33
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1042#1079#1103#1090#1080' '#1085#1072' '#1073#1072#1083#1072#1085#1089' '#1074' '#1082#1088#1077#1076#1080#1090#1110
      WordWrap = True
    end
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 209
      Height = 33
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1042#1079#1103#1090#1080' '#1085#1072' '#1073#1072#1083#1072#1085#1089' '#1074' '#1076#1077#1073#1077#1090#1110
      WordWrap = True
    end
    object Label7: TLabel
      Left = 16
      Top = 132
      Width = 201
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1042#1093#1110#1076#1085#1077' '#1089#1072#1083#1100#1076#1086' '#1074' '#1082#1088#1077#1076#1080#1090#1110' '
      WordWrap = True
    end
    object Label8: TLabel
      Left = 16
      Top = 92
      Width = 201
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1042#1093#1110#1076#1085#1077' '#1089#1072#1083#1100#1076#1086' '#1074' '#1076#1077#1073#1077#1090#1110
      WordWrap = True
    end
    object DB_VALUE: TcxCalcEdit
      Left = 220
      Top = 20
      Width = 217
      Height = 24
      EditValue = 0.000000000000000000
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object KR_VALUE: TcxCalcEdit
      Left = 220
      Top = 56
      Width = 217
      Height = 24
      EditValue = 0.000000000000000000
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 1
    end
  end
  object MAIN_DB_VALUE: TcxCalcEdit
    Left = 220
    Top = 93
    Width = 217
    Height = 24
    EditValue = 0.000000000000000000
    Enabled = False
    Style.Color = clInfoBk
    TabOrder = 2
  end
  object MAIN_KR_VALUE: TcxCalcEdit
    Left = 220
    Top = 133
    Width = 217
    Height = 24
    EditValue = 0.000000000000000000
    Enabled = False
    Style.Color = clInfoBk
    TabOrder = 3
  end
  object ActionList1: TActionList
    Left = 24
    Top = 182
    object Enter: TAction
      Caption = 'Enter'
      ShortCut = 13
      OnExecute = EnterExecute
    end
    object Esc: TAction
      Caption = 'Esc'
      ShortCut = 27
      OnExecute = EscExecute
    end
  end
end
