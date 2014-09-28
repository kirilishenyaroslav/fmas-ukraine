object frmInputProv: TfrmInputProv
  Left = 326
  Top = 272
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080' '#1087#1088#1086#1074#1086#1076#1082#1091
  ClientHeight = 198
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 371
    Height = 157
    Align = alClient
    TabOrder = 0
    object cxRadioButton1: TcxRadioButton
      Left = 40
      Top = 32
      Width = 273
      Height = 17
      Caption = #1056#1086#1073#1086#1095#1080#1081' '#1088#1072#1093#1091#1085#1086#1082' '#1074' '#1076#1077#1073#1077#1090#1110
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object cxRadioButton2: TcxRadioButton
      Left = 40
      Top = 64
      Width = 201
      Height = 17
      Caption = #1056#1086#1073#1086#1095#1080#1081' '#1088#1072#1093#1091#1085#1086#1082' '#1074' '#1082#1088#1077#1076#1080#1090#1110
      TabOrder = 1
    end
    object cxRadioButton3: TcxRadioButton
      Left = 40
      Top = 96
      Width = 113
      Height = 17
      Caption = #1047#1072' '#1096#1072#1073#1083#1086#1085#1086#1084
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 157
    Width = 371
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 208
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object ActionList1: TActionList
    Left = 24
    Top = 168
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = cxButton1Click
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 27
      OnExecute = cxButton2Click
    end
  end
end
