object frmPlanBeforeRest: TfrmPlanBeforeRest
  Left = 386
  Top = 303
  BorderStyle = bsDialog
  Caption = #1047#1072#1083#1080#1096#1082#1080' '#1079#1072' '#1087#1086#1087#1077#1088#1077#1076#1085#1110#1081' '#1087#1077#1088#1110#1086#1076
  ClientHeight = 139
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 98
    Width = 398
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 312
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 398
    Height = 98
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 25
      Width = 172
      Height = 16
      Caption = #1047#1072#1083#1080#1096#1086#1082' '#1087#1086' '#1082#1072#1089'. '#1086#1073#1083#1110#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 9
      Top = 58
      Width = 168
      Height = 16
      Caption = #1047#1072#1083#1080#1096#1086#1082' '#1087#1086' '#1092#1110#1085'.'#1086#1073#1083#1110#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object KassaValue: TcxCalcEdit
      Left = 187
      Top = 24
      Width = 195
      Height = 24
      EditValue = '0'
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object FinanceValue: TcxCalcEdit
      Left = 187
      Top = 56
      Width = 195
      Height = 24
      EditValue = '0'
      Style.Color = clInfoBk
      TabOrder = 1
    end
  end
end
