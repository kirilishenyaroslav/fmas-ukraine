object frmAccounts_AE: TfrmAccounts_AE
  Left = 573
  Top = 288
  Width = 468
  Height = 333
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1091
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
    Top = 258
    Width = 460
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 280
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1086#1095#1072#1090#1080
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 368
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1080#1093#1110#1076
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 460
    Height = 258
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 12
      Width = 99
      Height = 16
      Caption = #1053#1086#1084#1077#1088' '#1088#1072#1093#1091#1085#1082#1072
    end
    object Label3: TLabel
      Left = 10
      Top = 44
      Width = 31
      Height = 16
      Caption = #1055'.'#1030'.'#1041'.'
    end
    object Label5: TLabel
      Left = 10
      Top = 131
      Width = 58
      Height = 16
      Caption = #1055#1086#1084#1080#1083#1082#1080
    end
    object EdAccNum: TcxTextEdit
      Left = 160
      Top = 8
      Width = 241
      Height = 24
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = clMenu
      TabOrder = 0
    end
    object EdNote: TcxMemo
      Left = 8
      Top = 144
      Width = 441
      Height = 105
      Properties.MaxLength = 250
      Properties.ReadOnly = True
      Style.Color = clWindow
      TabOrder = 1
    end
    object cxTextEdit1: TcxTextEdit
      Left = 160
      Top = 40
      Width = 241
      Height = 24
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = clMenu
      TabOrder = 2
    end
    object cxProgressBar1: TcxProgressBar
      Left = 8
      Top = 104
      Width = 441
      Height = 24
      TabOrder = 3
    end
    object Label_period: TcxLabel
      Left = 8
      Top = 74
      Width = 385
      Height = 20
      AutoSize = False
      TabOrder = 4
      Caption = #1055#1077#1088#1080#1086#1076' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 408
    Top = 24
  end
end
