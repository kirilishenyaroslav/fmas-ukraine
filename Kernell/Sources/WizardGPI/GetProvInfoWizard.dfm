object frmProvInfoWizard: TfrmProvInfoWizard
  Left = 295
  Top = 214
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1052#1072#1089#1090#1077#1088' '#1074#1099#1089#1090#1072#1074#1083#1077#1085#1080#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1087#1086' '#1087#1088#1086#1074#1086#1076#1082#1077
  ClientHeight = 286
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 15
    Top = 189
    Width = 84
    Height = 16
    Caption = #1050#1086#1076' '#1079#1072#1090#1088#1072#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object InfoPanel: TPanel
    Left = 0
    Top = 0
    Width = 668
    Height = 230
    Align = alClient
    TabOrder = 0
    object Bevel1: TBevel
      Left = 8
      Top = 32
      Width = 322
      Height = 194
    end
    object Bevel2: TBevel
      Left = 337
      Top = 32
      Width = 326
      Height = 193
    end
    object lbDBtitle: TLabel
      Left = 137
      Top = 13
      Width = 46
      Height = 16
      Caption = #1044#1077#1073#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSchDb: TLabel
      Left = 15
      Top = 37
      Width = 112
      Height = 16
      Caption = #1057#1095#1077#1090' '#1073#1072#1083#1083#1072#1085#1089#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSchkr: TLabel
      Left = 345
      Top = 37
      Width = 112
      Height = 16
      Caption = #1057#1095#1077#1090' '#1073#1072#1083#1083#1072#1085#1089#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbKRtitle: TLabel
      Left = 481
      Top = 13
      Width = 54
      Height = 16
      Caption = #1050#1088#1077#1076#1080#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSmDb: TLabel
      Left = 15
      Top = 85
      Width = 58
      Height = 16
      Caption = #1041#1102#1076#1078#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbRzDb: TLabel
      Left = 15
      Top = 111
      Width = 56
      Height = 16
      Caption = #1056#1072#1079#1076#1077#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbStDb: TLabel
      Left = 15
      Top = 138
      Width = 52
      Height = 16
      Caption = #1057#1090#1072#1090#1100#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSmKr: TLabel
      Left = 345
      Top = 85
      Width = 58
      Height = 16
      Caption = #1041#1102#1076#1078#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbRzKr: TLabel
      Left = 345
      Top = 111
      Width = 56
      Height = 16
      Caption = #1056#1072#1079#1076#1077#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbStKr: TLabel
      Left = 345
      Top = 138
      Width = 52
      Height = 16
      Caption = #1057#1090#1072#1090#1100#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbKVDb: TLabel
      Left = 15
      Top = 165
      Width = 84
      Height = 16
      Caption = #1050#1086#1076' '#1079#1072#1090#1088#1072#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbKVKr: TLabel
      Left = 345
      Top = 165
      Width = 84
      Height = 16
      Caption = #1050#1086#1076' '#1079#1072#1090#1088#1072#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbAnDb: TLabel
      Left = 15
      Top = 197
      Width = 85
      Height = 16
      Caption = #1040#1085#1072#1083#1080#1090#1080#1082#1072' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbAnKr: TLabel
      Left = 348
      Top = 196
      Width = 85
      Height = 16
      Caption = #1040#1085#1072#1083#1080#1090#1080#1082#1072' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edDBSchNum: TcxTextEdit
      Left = 209
      Top = 37
      Width = 110
      Height = 21
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInactiveCaptionText
      TabOrder = 0
    end
    object edDBSchTitle: TcxTextEdit
      Left = 121
      Top = 59
      Width = 198
      Height = 21
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInactiveCaptionText
      TabOrder = 1
    end
    object edKrSchTitle: TcxTextEdit
      Left = 454
      Top = 59
      Width = 198
      Height = 21
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInactiveCaptionText
      TabOrder = 2
    end
    object edKrSchNum: TcxTextEdit
      Left = 542
      Top = 37
      Width = 110
      Height = 21
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInactiveCaptionText
      TabOrder = 3
    end
    object edDBSm: TcxTextEdit
      Left = 108
      Top = 85
      Width = 211
      Height = 21
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.Color = clInactiveCaptionText
      TabOrder = 4
    end
    object edDBRz: TcxTextEdit
      Left = 108
      Top = 111
      Width = 211
      Height = 21
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.Color = clInactiveCaptionText
      TabOrder = 5
    end
    object edDbSt: TcxTextEdit
      Left = 108
      Top = 138
      Width = 211
      Height = 21
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.Color = clInactiveCaptionText
      TabOrder = 6
    end
    object edKrSm: TcxTextEdit
      Left = 442
      Top = 85
      Width = 211
      Height = 21
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.Color = clInactiveCaptionText
      TabOrder = 7
    end
    object edKrSt: TcxTextEdit
      Left = 442
      Top = 138
      Width = 211
      Height = 21
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.Color = clInactiveCaptionText
      TabOrder = 8
    end
    object edKrRz: TcxTextEdit
      Left = 442
      Top = 111
      Width = 211
      Height = 21
      TabStop = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.Color = clInactiveCaptionText
      TabOrder = 9
    end
    object edDBKV: TcxTextEdit
      Left = 108
      Top = 165
      Width = 211
      Height = 21
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = clInactiveCaptionText
      TabOrder = 10
    end
    object edKrKV: TcxTextEdit
      Left = 442
      Top = 165
      Width = 211
      Height = 21
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = clInactiveCaptionText
      TabOrder = 11
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 230
    Width = 668
    Height = 56
    Align = alBottom
    TabOrder = 1
    object BackButton: TcxButton
      Left = 351
      Top = 19
      Width = 99
      Height = 25
      Caption = #1053#1072#1079#1072#1076
      TabOrder = 1
      TabStop = False
      Visible = False
      DropDownMenu = PopupMenu1
      Kind = cxbkDropDownButton
    end
    object OKButton: TcxButton
      Left = 455
      Top = 19
      Width = 89
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      TabStop = False
      OnClick = OKButtonClick
    end
    object CloseButton: TcxButton
      Left = 551
      Top = 19
      Width = 105
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 2
      TabStop = False
      OnClick = CloseButtonClick
    end
  end
  object EdDbAN: TcxTextEdit
    Left = 108
    Top = 194
    Width = 211
    Height = 21
    TabStop = False
    Properties.ReadOnly = True
    Style.Color = clInactiveCaptionText
    TabOrder = 2
  end
  object EdKrAn: TcxTextEdit
    Left = 443
    Top = 194
    Width = 211
    Height = 21
    TabStop = False
    Properties.ReadOnly = True
    Style.Color = clInactiveCaptionText
    TabOrder = 3
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 56
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 88
    Top = 8
    object N1: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1089#1080#1089#1090#1077#1084#1099' '#1091#1095#1077#1090#1072
      ShortCut = 16433
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1075#1083#1072#1074#1085#1086#1075#1086' '#1089#1095#1077#1090#1072
      ShortCut = 16434
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1089#1095#1077#1090#1072' '#1076#1083#1103' '#1082#1086#1088#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1080#1080
      ShortCut = 16435
      OnClick = N3Click
    end
    object N5: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1073#1102#1076#1078#1077#1090#1072
      ShortCut = 16436
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1088#1072#1079#1076#1077#1083#1072
      ShortCut = 16437
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1089#1090#1072#1090#1100#1080
      ShortCut = 16438
      OnClick = N7Click
    end
    object N4: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1082#1086#1076#1072' '#1079#1072#1090#1088#1072#1090
      ShortCut = 16439
      OnClick = N4Click
    end
  end
  object ActionList1: TActionList
    Left = 120
    Top = 8
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 16397
      OnExecute = Action1Execute
    end
  end
end
