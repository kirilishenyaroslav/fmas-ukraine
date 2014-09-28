object frmGetPosForm: TfrmGetPosForm
  Left = 834
  Top = 348
  ActiveControl = CheckCode
  BorderStyle = bsDialog
  Caption = #1050#1088#1080#1090#1077#1088#1110#1081' '#1076#1083#1103' '#1087#1086#1096#1091#1082#1091
  ClientHeight = 172
  ClientWidth = 430
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
    Top = 136
    Width = 430
    Height = 36
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 269
      Top = 4
      Width = 75
      Height = 25
      Caption = #1047#1085#1072#1081#1090#1080
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 347
      Top = 4
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 136
    Align = alClient
    TabOrder = 0
    object CheckCode: TcxRadioButton
      Left = 24
      Top = 32
      Width = 113
      Height = 17
      Caption = #1050#1086#1076' '#1073#1102#1076#1078#1077#1090#1091
      TabOrder = 2
      TabStop = True
      OnClick = CheckCodeClick
    end
    object CheckTitle: TcxRadioButton
      Left = 24
      Top = 83
      Width = 182
      Height = 17
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1091
      TabOrder = 3
      TabStop = True
      OnClick = CheckTitleClick
    end
    object EdTitle: TcxTextEdit
      Left = 216
      Top = 80
      Width = 201
      Height = 24
      TabStop = False
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object EdCode: TcxMaskEdit
      Left = 216
      Top = 29
      Width = 121
      Height = 24
      TabStop = False
      Enabled = False
      Properties.EditMask = '!99999;1;_'
      Properties.MaxLength = 0
      Style.Color = clInfoBk
      TabOrder = 0
      Text = '     '
    end
  end
  object ActionList1: TActionList
    Left = 8
    Top = 104
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
