object frmPrintConfigure: TfrmPrintConfigure
  Left = 364
  Top = 298
  BorderStyle = bsDialog
  Caption = #1050#1086#1085#1092#1110#1075#1091#1088#1072#1094#1110#1103' '#1076#1088#1091#1082#1091
  ClientHeight = 117
  ClientWidth = 404
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
  object Panel1: TPanel
    Left = 0
    Top = 76
    Width = 404
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
    Width = 404
    Height = 76
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 11
      Width = 219
      Height = 13
      Caption = #1044#1072#1090#1072' '#1074#1080#1073#1086#1088#1091' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1111' '#1087#1086' '#1072#1085#1072#1083#1110#1090#1080#1094#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxDateEdit1: TcxDateEdit
      Left = 248
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object cxCheckBox1: TcxCheckBox
      Left = 24
      Top = 40
      Width = 361
      Height = 21
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1090#1110#1083#1100#1082#1080' '#1088#1086#1079#1076#1110#1083' '#1087#1110#1076' '#1082#1091#1088#1089#1086#1088#1086#1084
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
  end
end
