object SetPropAktForm: TSetPropAktForm
  Left = 291
  Top = 243
  BorderStyle = bsDialog
  Caption = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
  ClientHeight = 563
  ClientWidth = 755
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 9
    Top = 106
    Width = 740
    Height = 415
    Caption = #1047#1072#1082#1083#1102#1095#1085#1072' '#1095#1072#1089#1090#1080#1085#1072' '#1079#1074#1110#1090#1091
    TabOrder = 0
    object Label1: TLabel
      Left = 27
      Top = 165
      Width = 135
      Height = 21
      Caption = '[ORG_NAME_1]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 378
      Top = 165
      Width = 135
      Height = 21
      Caption = '[ORG_NAME_2]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 33
      Top = 336
      Width = 109
      Height = 19
      Caption = #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100' '#1055#1030#1041
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 34
      Top = 390
      Width = 76
      Height = 19
      Caption = #1044#1072#1090#1072' '#1090#1072' '#1095#1072#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 417
      Top = 390
      Width = 81
      Height = 19
      Caption = #1057#1090#1086#1088'. X '#1110#1079' Y'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object cxTypeForm: TcxTextEdit
      Left = 32
      Top = 357
      Width = 697
      Height = 32
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
    end
  end
  object MemoFooter2: TcxMemo
    Left = 25
    Top = 302
    Width = 715
    Height = 126
    Lines.Strings = (
      '')
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Times New Roman'
    Style.Font.Style = []
    TabOrder = 1
  end
  object cxButton1: TcxButton
    Left = 572
    Top = 528
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 659
    Top = 528
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object MemoFooter1: TcxMemo
    Left = 25
    Top = 134
    Width = 715
    Height = 126
    Lines.Strings = (
      '')
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Times New Roman'
    Style.Font.Style = []
    TabOrder = 4
  end
  object GroupBox2: TGroupBox
    Left = 9
    Top = 8
    Width = 740
    Height = 89
    Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111
    TabOrder = 5
    object cxMemoReportHeader: TcxMemo
      Left = 16
      Top = 24
      Width = 713
      Height = 57
      Lines.Strings = (
        '')
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = []
      TabOrder = 0
    end
  end
  object DB: TpFIBDatabase
    DefaultTransaction = Transaction
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 14
    Top = 524
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 54
    Top = 524
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = Transaction
    Left = 95
    Top = 525
  end
end
