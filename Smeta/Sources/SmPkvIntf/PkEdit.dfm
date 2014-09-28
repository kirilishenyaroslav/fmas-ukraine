object frmSmPkvEdit: TfrmSmPkvEdit
  Left = 312
  Top = 204
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1087#1088#1086#1075#1088#1072#1084#1110' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
  ClientHeight = 312
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 271
    Width = 483
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 400
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 483
    Height = 271
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 13
      Width = 117
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1050#1086#1076
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 117
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
    end
    object Label4: TLabel
      Left = 8
      Top = 88
      Width = 117
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1050#1060#1050
    end
    object Label5: TLabel
      Left = 8
      Top = 112
      Width = 117
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1050#1042#1050
    end
    object Label6: TLabel
      Left = 26
      Top = 228
      Width = 95
      Height = 32
      Alignment = taRightJustify
      Caption = #1050#1086#1076' '#1074#1080#1090#1088#1072#1090' '#1079#1072' '#1079#1072#1084#1086#1074#1095#1077#1085#1085#1103#1084
      WordWrap = True
    end
    object edSmPKVKod: TcxTextEdit
      Left = 128
      Top = 10
      Width = 161
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object edSmPKVTitle: TcxTextEdit
      Left = 128
      Top = 37
      Width = 337
      Height = 24
      Properties.MaxLength = 500
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object cxRadioGroup1: TcxRadioGroup
      Left = 128
      Top = 142
      Width = 329
      Height = 73
      ItemIndex = 0
      Properties.Items = <
        item
          Caption = #1054#1089#1085#1086#1074#1085#1080#1081' '#1092#1086#1085#1076
        end
        item
          Caption = #1057#1087#1077#1094#1082#1086#1096#1090#1080
        end
        item
          Caption = #1057#1087#1077#1094#1082#1086#1096#1090#1080'('#1082#1086#1084#1091#1085#1072#1083#1100#1085#1110' '#1087#1083#1072#1090#1077#1078#1110')'
        end>
      TabOrder = 2
      Visible = False
      Caption = #1058#1080#1087' '#1082#1086#1096#1090#1110#1074
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 128
      Top = 231
      Width = 329
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 3
    end
    object KFK_TEXT: TcxTextEdit
      Left = 128
      Top = 82
      Width = 161
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 4
    end
    object KVK_TEXT: TcxTextEdit
      Left = 128
      Top = 106
      Width = 161
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 5
    end
  end
end
