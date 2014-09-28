object frmGetBuRests: TfrmGetBuRests
  Left = 280
  Top = 171
  Width = 565
  Height = 238
  Caption = 
    #1056#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1082#1088#1077#1076#1080#1090#1086#1088#1089#1100#1082#1086#1111'/'#1076#1077#1073#1110#1090#1086#1088#1089#1100#1082#1086#1102' '#1079#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1086#1089#1090#1110' '#1087#1086' '#1073#1102#1076#1078#1077#1090#1072 +
    #1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 170
    Width = 557
    Height = 41
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 192
      Top = 8
      Width = 265
      Height = 25
      Caption = #1055#1086#1095#1072#1090#1080' '#1087#1088#1086#1094#1077#1089
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 464
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 170
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 36
      Width = 164
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1056#1086#1079#1088#1072#1093#1091#1074#1072#1090#1080' '#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxDateEdit1: TcxDateEdit
      Left = 184
      Top = 32
      Width = 121
      Height = 24
      ParentFont = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
    end
    object Panel5: TPanel
      Left = 120
      Top = 72
      Width = 321
      Height = 65
      Caption = #1063#1077#1082#1072#1081#1090#1077', '#1081#1076#1077' '#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = CalcTransaction
    DefaultUpdateTransaction = CalcTransaction
    SQLDialect = 3
    Timeout = 0
    UseRepositories = []
    WaitForRestoreConnect = 0
    Left = 8
    Top = 178
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 40
    Top = 178
  end
  object CalcTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 72
    Top = 178
  end
end
