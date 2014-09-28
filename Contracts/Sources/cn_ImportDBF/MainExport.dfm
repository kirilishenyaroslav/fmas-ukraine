object frmMainForm: TfrmMainForm
  Left = 315
  Top = 170
  Width = 468
  Height = 326
  Caption = #1042#1088#1077#1084#1077#1085#1085#1099#1081' '#1079#1072#1073#1086#1088' '#1076#1072#1085#1085#1099#1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object bar: TGauge
    Left = 2
    Top = 240
    Width = 439
    Height = 25
    BackColor = clMoneyGreen
    Progress = 0
  end
  object GaugeAll: TGauge
    Left = 2
    Top = 192
    Width = 439
    Height = 25
    BackColor = clMoneyGreen
    Progress = 0
  end
  object Label1: TLabel
    Left = 8
    Top = 176
    Width = 144
    Height = 13
    Caption = #1054#1073#1097#1080#1081' '#1087#1088#1086#1094#1077#1085#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
  end
  object Label2: TLabel
    Left = 8
    Top = 224
    Width = 192
    Height = 13
    Caption = #1055#1088#1086#1094#1077#1085#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1076#1072#1095#1080
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 280
    Width = 460
    Height = 19
    Panels = <>
  end
  object cxButton1: TcxButton
    Left = 0
    Top = 0
    Width = 137
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083' '#1085#1072#1089#1090#1088#1077#1082'...'
    TabOrder = 1
    Visible = False
    OnClick = cxButton1Click
  end
  object cxLabelIniFile: TcxLabel
    Left = 4
    Top = 28
    Width = 0
    Height = 4
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Caption = ''
  end
  object Section: TComboBox
    Left = 144
    Top = 0
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = 'Sections'
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 24
    Width = 441
    Height = 151
    TabOrder = 4
    object MemoLog: TMemo
      Left = 2
      Top = 15
      Width = 437
      Height = 134
      Align = alClient
      Color = clInfoBk
      TabOrder = 0
    end
  end
  object cxButton2: TcxButton
    Left = 304
    Top = 0
    Width = 137
    Height = 25
    Caption = #1057#1090#1072#1088#1090'!!!!!!'
    TabOrder = 5
    OnClick = cxButton2Click
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 144
  end
  object OpenDialogIni: TOpenDialog
    Filter = '*.*|*.ini'
    Left = 144
    Top = 32
  end
  object RxMemoryDataSection: TRxMemoryData
    FieldDefs = <
      item
        Name = 'RxSection'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'RXRun'
        DataType = ftString
        Size = 3
      end>
    Left = 112
    Top = 32
  end
  object DBIbx: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=tpfibdataset'
      'lc_ctype=win1251')
    DefaultTransaction = FIBTrans
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 112
    Top = 96
  end
  object FIBTrans: TpFIBTransaction
    DefaultDatabase = DBIbx
    TimeoutAction = TARollback
    Left = 144
    Top = 96
  end
  object FIBSProc: TpFIBStoredProc
    Database = DBIbx
    Transaction = FIBTrans
    Left = 144
    Top = 128
  end
  object HTable: THalcyonDataSet
    AutoFlush = False
    Exclusive = False
    LargeIntegerAs = asLargeInt
    LockProtocol = Default
    TranslateASCII = True
    UseDeleted = True
    UserID = 0
    Left = 80
    Top = 96
  end
end
