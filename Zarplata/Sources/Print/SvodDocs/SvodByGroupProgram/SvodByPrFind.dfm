object FSvodByGroupFind: TFSvodByGroupFind
  Left = 371
  Top = 282
  BorderStyle = bsDialog
  Caption = #1050#1088#1080#1090#1077#1088#1110#1081' '#1076#1083#1103' '#1087#1086#1096#1091#1082#1091
  ClientHeight = 83
  ClientWidth = 430
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
  object Panel1: TPanel
    Left = 0
    Top = 47
    Width = 430
    Height = 36
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 264
      Top = 4
      Width = 75
      Height = 25
      Caption = #1047#1085#1072#1081#1090#1080
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 342
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
    Height = 47
    Align = alClient
    TabOrder = 0
    object cxMaskEdit1: TcxMaskEdit
      Left = 16
      Top = 17
      Width = 401
      Height = 24
      TabStop = False
      Properties.MaxLength = 0
      Style.Color = clInfoBk
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Left = 30
    Top = 47
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 27
      OnExecute = cxButton2Click
    end
  end
end
