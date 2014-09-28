object frmEditDef: TfrmEditDef
  Left = 377
  Top = 237
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1087#1088#1086#1094#1077#1085#1090#1072#1084' '#1074#1110#1076#1088#1072#1093#1091#1074#1072#1085#1100
  ClientHeight = 228
  ClientWidth = 386
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
    Top = 187
    Width = 386
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 224
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 304
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
    Width = 386
    Height = 187
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 30
      Top = 34
      Width = 196
      Height = 16
      Caption = #1052#1110#1085#1110#1084#1072#1083#1100#1085#1072' '#1089#1091#1084#1072' '#1087#1088#1086#1084#1110#1078#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 30
      Top = 74
      Width = 213
      Height = 16
      Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072' '#1089#1091#1084#1072' '#1087#1088#1086#1084#1110#1078#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 30
      Top = 118
      Width = 305
      Height = 16
      Caption = #1042#1110#1076#1089#1086#1090#1086#1082' '#1074#1110#1076#1088#1072#1093#1091#1074#1072#1085#1100' '#1079#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxCalcEdit1: TcxCalcEdit
      Left = 254
      Top = 32
      Width = 121
      Height = 24
      EditValue = '0'
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxCalcEdit2: TcxCalcEdit
      Left = 254
      Top = 72
      Width = 121
      Height = 24
      EditValue = '0'
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object cxCalcEdit3: TcxCalcEdit
      Left = 256
      Top = 144
      Width = 121
      Height = 24
      EditValue = '0'
      Style.Color = clInfoBk
      TabOrder = 2
    end
  end
end
