object frmSearchSch: TfrmSearchSch
  Left = 311
  Top = 232
  ActiveControl = Edit1
  BorderStyle = bsDialog
  Caption = #1055#1086#1096#1091#1082' '#1088#1072#1093#1091#1085#1082#1072
  ClientHeight = 115
  ClientWidth = 349
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
    Top = 74
    Width = 349
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 184
      Top = 8
      Width = 75
      Height = 25
      Caption = #1047#1085#1072#1081#1090#1080
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 264
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
    Width = 349
    Height = 74
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 127
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1050#1086#1076' '#1076#1083#1103' '#1087#1086#1096#1091#1082#1091
    end
    object Edit1: TEdit
      Left = 152
      Top = 32
      Width = 177
      Height = 24
      Color = clInfoBk
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Left = 40
    Top = 82
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 27
      OnExecute = Action2Execute
    end
  end
end
