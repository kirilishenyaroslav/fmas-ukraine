object frmStAnaliticInfo: TfrmStAnaliticInfo
  Left = 450
  Top = 318
  ActiveControl = cxButtonEdit1
  BorderStyle = bsDialog
  Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1086' '#1072#1085#1072#1083#1110#1090#1080#1094#1110
  ClientHeight = 179
  ClientWidth = 447
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
    Top = 138
    Width = 447
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 352
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
    Width = 447
    Height = 138
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 132
      Height = 16
      Caption = #1047#1085#1072#1095#1077#1085#1085#1103' '#1072#1085#1072#1083#1110#1090#1080#1082#1080
    end
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 236
      Height = 16
      Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1082#1091' '#1072#1082#1090#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1111
    end
    object Label3: TLabel
      Left = 24
      Top = 99
      Width = 262
      Height = 16
      Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1072#1082#1090#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1111
      Visible = False
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 40
      Top = 28
      Width = 393
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxDateEdit1: TcxDateEdit
      Left = 312
      Top = 64
      Width = 121
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object cxDateEdit2: TcxDateEdit
      Left = 312
      Top = 96
      Width = 121
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 2
      Visible = False
    end
  end
  object ActionList1: TActionList
    Left = 16
    Top = 138
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
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 16397
      OnExecute = Action3Execute
    end
  end
end
