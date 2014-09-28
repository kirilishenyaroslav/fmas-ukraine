object frmCreateSmByShablon: TfrmCreateSmByShablon
  Left = 309
  Top = 211
  Width = 534
  Height = 301
  Caption = #1057#1090#1074#1086#1088#1077#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1091' '#1079#1072' '#1096#1072#1073#1083#1086#1085#1086#1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 526
    Height = 113
    Align = alTop
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1085#1086#1074#1086#1075#1086' '#1073#1102#1076#1078#1077#1090#1091
    TabOrder = 0
    object Label1: TLabel
      Left = 21
      Top = 22
      Width = 40
      Height = 13
      Caption = #1041#1102#1076#1078#1077#1090
    end
    object Label2: TLabel
      Left = 21
      Top = 51
      Width = 75
      Height = 13
      Caption = #1041#1102#1076#1078#1077#1090#1085#1080#1081' '#1088#1110#1082
    end
    object Label6: TLabel
      Left = 21
      Top = 83
      Width = 50
      Height = 13
      Caption = #1050#1086#1084#1077#1085#1090#1072#1088
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 109
      Top = 22
      Width = 393
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxSpinEdit1: TcxSpinEdit
      Left = 111
      Top = 51
      Width = 121
      Height = 21
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object cxTextEdit1: TcxTextEdit
      Left = 111
      Top = 81
      Width = 386
      Height = 21
      Style.Color = clInfoBk
      TabOrder = 2
      Text = #1053#1086#1074#1080#1081' '#1074#1072#1088#1110#1072#1085#1090
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 233
    Width = 526
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 352
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 432
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 113
    Width = 526
    Height = 120
    Align = alClient
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1073#1072#1079#1086#1074#1086#1075#1086' '#1073#1102#1076#1078#1077#1090#1091
    TabOrder = 2
    object Label3: TLabel
      Left = 21
      Top = 22
      Width = 40
      Height = 13
      Caption = #1041#1102#1076#1078#1077#1090
    end
    object Label5: TLabel
      Left = 21
      Top = 51
      Width = 120
      Height = 13
      Caption = #1050#1086#1077#1092#1110#1094#1110#1108#1085#1090' '#1087#1077#1088#1077#1088#1072#1093#1091#1085#1082#1091
    end
    object cxButtonEdit2: TcxButtonEdit
      Left = 109
      Top = 22
      Width = 393
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxCalcEdit1: TcxCalcEdit
      Left = 146
      Top = 48
      Width = 118
      Height = 21
      EditValue = '1'
      Style.Color = clInfoBk
      TabOrder = 1
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 216
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 64
    Top = 216
  end
  object pFIBDataSet1: TpFIBDataSet
    Left = 96
    Top = 216
    poSQLINT64ToBCD = True
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 136
    Top = 217
  end
end
