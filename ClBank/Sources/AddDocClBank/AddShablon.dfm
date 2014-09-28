object frmAddShablon: TfrmAddShablon
  Left = 464
  Top = 343
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1096#1072#1073#1083#1086#1085#1086#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  ClientHeight = 438
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxRSCustormer: TGroupBox
    Left = 0
    Top = 175
    Width = 433
    Height = 83
    Caption = #1056'\'#1057' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object LabelMFO_: TLabel
      Left = 8
      Top = 40
      Width = 65
      Height = 13
      Caption = 'LabelMFO_'
    end
    object LabelRS_: TLabel
      Left = 232
      Top = 40
      Width = 56
      Height = 13
      Caption = 'LabelRS_'
    end
    object cxButtonEditRSPost: TcxButtonEdit
      Left = 8
      Top = 16
      Width = 417
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditRSPostPropertiesButtonClick
      Style.Color = 15204351
      TabOrder = 0
    end
    object cxTextEditMFOPost: TcxTextEdit
      Left = 8
      Top = 56
      Width = 201
      Height = 21
      Properties.ReadOnly = True
      Style.Color = 15204351
      TabOrder = 1
    end
    object cxTextEditPSPost: TcxTextEdit
      Left = 226
      Top = 56
      Width = 201
      Height = 21
      Properties.ReadOnly = True
      Style.Color = 15204351
      TabOrder = 2
    end
  end
  object GroupBoxNote: TGroupBox
    Left = 0
    Top = 299
    Width = 433
    Height = 74
    Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object cxMemoNote: TcxMemo
      Left = 2
      Top = 15
      Width = 429
      Height = 57
      ParentFont = False
      Properties.MaxLength = 255
      Properties.WordWrap = False
      Style.Color = 15204351
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
    end
  end
  object RadioGroupTypeDoc: TRadioGroup
    Left = -1
    Top = 84
    Width = 434
    Height = 41
    Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      #1055#1088#1080#1093#1086#1076' '
      #1056#1072#1089#1093#1086#1076)
    ParentFont = False
    TabOrder = 3
  end
  object GroupBoxSumma: TGroupBox
    Left = 0
    Top = 257
    Width = 433
    Height = 44
    Caption = #1057#1091#1084#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object cxMaskEditSumma: TcxCalcEdit
      Left = 8
      Top = 16
      Width = 417
      Height = 21
      EditValue = 0.000000000000000000
      Properties.Precision = 15
      Style.Color = 15204351
      TabOrder = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 419
    Width = 451
    Height = 19
    Panels = <>
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 373
    Width = 451
    Height = 46
    Align = alBottom
    TabOrder = 8
    object ButtonOk: TButton
      Left = 264
      Top = 12
      Width = 75
      Height = 25
      Caption = #1054#1082
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = ButtonOkClick
    end
    object ButtonClose: TButton
      Left = 344
      Top = 12
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = ButtonCloseClick
    end
  end
  object GroupBoxRSLeman: TGroupBox
    Left = 0
    Top = 129
    Width = 433
    Height = 44
    Caption = #1053#1072#1096' '#1056'\'#1057' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object cxButtonEditRSNative: TcxButtonEdit
      Left = 8
      Top = 13
      Width = 417
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditRSNativePropertiesButtonClick
      Style.Color = 15204351
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 2
    Width = 433
    Height = 40
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1096#1072#1073#1083#1086#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 42
    Width = 433
    Height = 39
    Caption = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1096#1072#1073#1083#1086#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object cxTextEditName: TcxTextEdit
    Left = 2
    Top = 16
    Width = 423
    Height = 21
    Properties.MaxLength = 100
    Properties.ReadOnly = False
    Style.Color = 15204351
    TabOrder = 1
  end
  object cxTextEditShortName: TcxTextEdit
    Left = 2
    Top = 56
    Width = 423
    Height = 21
    Properties.MaxLength = 20
    Properties.ReadOnly = False
    Style.Color = 15204351
    TabOrder = 2
  end
  object pFIBDataSetNameSCH: TpFIBDataSet
    Database = Database
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select '#39#1052#1060#1054' '#39'||pub_sp_bank.mfo||'#39' -'#1041#1040#1053#1050' '#39'||pub_sp_bank.name_mfo'
      
        '||'#39' '#1056'\'#1057' '#39'||pub_sp_cust_rate_acc.rate_account   MFO,pub_sp_custom' +
        'er.name_customer'
      
        'from pub_sp_cust_rate_acc ,pub_sp_bank ,pub_sys_data,pub_sp_cust' +
        'omer'
      'where pub_sp_bank.id_bank=pub_sp_cust_rate_acc.id_bank'
      'and pub_sp_cust_rate_acc.id_rate_account=:param_acc'
      'and pub_sp_customer.id_customer=pub_sp_cust_rate_acc.id_customer')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 292
    Top = 168
    poSQLINT64ToBCD = True
  end
  object pFIBStoredProcAll: TpFIBStoredProc
    Database = Database
    Transaction = TransactionWrite
    Left = 156
    Top = 207
  end
  object pFIBDataSet_post: TpFIBDataSet
    Database = Database
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select *'
      'from pub_sp_customer'
      'where pub_sp_customer.id_customer=:param_cust')
    Left = 292
    Top = 203
    poSQLINT64ToBCD = True
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = TransactionRead
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 156
    Top = 141
  end
  object TransactionRead: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 188
    Top = 140
  end
  object TransactionWrite: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 156
    Top = 173
  end
  object ActionList1: TActionList
    Left = 200
    Top = 327
    object ActionAdd: TAction
      Caption = 'ActionAdd'
      ShortCut = 121
      OnExecute = ActionAddExecute
    end
  end
  object pFIBDataSetShablon: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from CLBANK_INI_SHABLON_VIEW'
      'where CLBANK_INI_SHABLON_VIEW.id_shablon=:param_shablon')
    Left = 292
    Top = 136
    poSQLINT64ToBCD = True
  end
end
