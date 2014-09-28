object frmWorkWithDublicate: TfrmWorkWithDublicate
  Left = 258
  Top = 200
  Width = 923
  Height = 562
  Caption = #1054#1073#1088#1086#1073#1082#1072' '#1110#1089#1085#1091#1102#1095#1080#1093' '#1076#1072#1085#1085#1080#1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 509
    Width = 915
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 416
    Width = 897
    Height = 57
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object cxButtonReplace: TcxButton
      Left = 8
      Top = 16
      Width = 100
      Height = 25
      Caption = #1047#1084#1110#1085#1080#1090#1080
      TabOrder = 0
      Visible = False
    end
    object cxButtonReplaceAll: TcxButton
      Left = 107
      Top = 16
      Width = 100
      Height = 25
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1074#1089#1110
      TabOrder = 1
      Visible = False
    end
    object cxButtonIgnor: TcxButton
      Left = 344
      Top = 16
      Width = 100
      Height = 25
      Caption = #1030#1075#1085#1086#1088#1091#1074#1072#1090#1080
      TabOrder = 2
      OnClick = cxButtonIgnorClick
    end
    object cxButtonIgnorAll: TcxButton
      Left = 443
      Top = 16
      Width = 100
      Height = 25
      Caption = #1030#1075#1085#1086#1088#1091#1074#1072#1090#1080' '#1074#1089#1110
      TabOrder = 3
      OnClick = cxButtonIgnorAllClick
    end
    object cxButtonAdd: TcxButton
      Left = 676
      Top = 16
      Width = 100
      Height = 25
      Caption = #1044#1086#1076#1072#1090#1080
      TabOrder = 4
      OnClick = cxButtonAddClick
    end
    object cxButtonAddAll: TcxButton
      Left = 775
      Top = 16
      Width = 100
      Height = 25
      Caption = #1044#1086#1076#1072#1090#1080' '#1074#1089#1110
      TabOrder = 5
      OnClick = cxButtonAddAllClick
    end
  end
  object StatusBar2: TStatusBar
    Left = 0
    Top = 490
    Width = 915
    Height = 19
    Panels = <>
  end
  object GroupBoxDb: TGroupBox
    Left = 0
    Top = 1
    Width = 449
    Height = 417
    Caption = #1044#1072#1085#1110' '#1074' '#1041#1044
    TabOrder = 0
    object GroupBoxDateDoc: TGroupBox
      Left = 5
      Top = 12
      Width = 217
      Height = 41
      Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object cxDateEditDoc: TcxDateEdit
        Left = 8
        Top = 16
        Width = 200
        Height = 21
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 0
      end
    end
    object GroupBoxDateVip: TGroupBox
      Left = 221
      Top = 12
      Width = 217
      Height = 41
      Caption = #1044#1072#1090#1072' '#1074#1099#1087#1080#1089#1082#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object cxDateEditDateVip: TcxDateEdit
        Left = 8
        Top = 16
        Width = 200
        Height = 21
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 0
      end
    end
    object GroupBoxRSCustormer: TGroupBox
      Left = 5
      Top = 183
      Width = 433
      Height = 83
      Caption = #1056'\'#1057' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
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
      Left = 5
      Top = 307
      Width = 433
      Height = 105
      Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object cxMemoNote: TcxMemo
        Left = 2
        Top = 15
        Width = 429
        Height = 88
        Align = alClient
        ParentFont = False
        Properties.ReadOnly = True
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
      Left = 4
      Top = 52
      Width = 434
      Height = 41
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Columns = 2
      Enabled = False
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
      TabOrder = 4
    end
    object GroupBoxNumberDoc: TGroupBox
      Left = 5
      Top = 93
      Width = 433
      Height = 44
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object cxMaskEditNumdoc: TcxMaskEdit
        Left = 8
        Top = 16
        Width = 417
        Height = 21
        Properties.MaskKind = emkRegExpr
        Properties.MaxLength = 10
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 0
      end
    end
    object GroupBoxSumma: TGroupBox
      Left = 5
      Top = 265
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
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 0
      end
    end
    object GroupBoxRSLeman: TGroupBox
      Left = 5
      Top = 137
      Width = 433
      Height = 44
      Caption = #1053#1072#1096' '#1056'\'#1057' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
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
        Style.Color = 15204351
        TabOrder = 0
      end
    end
  end
  object GroupBoxBuff: TGroupBox
    Left = 447
    Top = 1
    Width = 449
    Height = 417
    Caption = #1044#1072#1085#1110' '#1074' '#1073#1091#1092#1077#1088#1110
    TabOrder = 4
    object GroupBoxDateDocBuff: TGroupBox
      Left = 5
      Top = 12
      Width = 217
      Height = 41
      Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object cxDateEditBuff: TcxDateEdit
        Left = 8
        Top = 16
        Width = 200
        Height = 21
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 0
      end
    end
    object GroupBoxDateVipBuff: TGroupBox
      Left = 221
      Top = 12
      Width = 217
      Height = 41
      Caption = #1044#1072#1090#1072' '#1074#1099#1087#1080#1089#1082#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object cxDateEditDateVipBuff: TcxDateEdit
        Left = 8
        Top = 16
        Width = 200
        Height = 21
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 0
      end
    end
    object GroupBoxRSCustormerBuff: TGroupBox
      Left = 5
      Top = 183
      Width = 433
      Height = 83
      Caption = #1056'\'#1057' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object LabelMFO_Buff: TLabel
        Left = 8
        Top = 40
        Width = 65
        Height = 13
        Caption = 'LabelMFO_'
      end
      object LabelRS_Buff: TLabel
        Left = 232
        Top = 40
        Width = 56
        Height = 13
        Caption = 'LabelRS_'
      end
      object cxButtonEditRSPostBuff: TcxButtonEdit
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
        Style.Color = 15204351
        TabOrder = 0
      end
      object cxTextEditMFOPostBuff: TcxTextEdit
        Left = 8
        Top = 56
        Width = 201
        Height = 21
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 1
      end
      object cxTextEditPSPostBuff: TcxTextEdit
        Left = 226
        Top = 56
        Width = 201
        Height = 21
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 2
      end
    end
    object GroupBoxNoteBuff: TGroupBox
      Left = 5
      Top = 307
      Width = 433
      Height = 105
      Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object cxMemoNoteBuff: TcxMemo
        Left = 2
        Top = 15
        Width = 429
        Height = 88
        Align = alClient
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 15204351
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 0
      end
    end
    object RadioGroupTypeDocBuff: TRadioGroup
      Left = 4
      Top = 52
      Width = 434
      Height = 41
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Columns = 2
      Enabled = False
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
      TabOrder = 4
    end
    object GroupBoxNumberDocBuff: TGroupBox
      Left = 5
      Top = 93
      Width = 433
      Height = 44
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object cxMaskEditNumdocBuff: TcxMaskEdit
        Left = 8
        Top = 16
        Width = 417
        Height = 21
        Properties.MaskKind = emkRegExpr
        Properties.MaxLength = 10
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 0
      end
    end
    object GroupBoxSummaBuff: TGroupBox
      Left = 5
      Top = 265
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
      object cxMaskEditSummaBuff: TcxCalcEdit
        Left = 8
        Top = 16
        Width = 417
        Height = 21
        EditValue = 0.000000000000000000
        Properties.Precision = 15
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 0
      end
    end
    object GroupBoxRSLemanBuff: TGroupBox
      Left = 5
      Top = 137
      Width = 433
      Height = 44
      Caption = #1053#1072#1096' '#1056'\'#1057' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object cxButtonEditRSNativeBuff: TcxButtonEdit
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
        Style.Color = 15204351
        TabOrder = 0
      end
    end
  end
  object pFIBDataSetEditDoc: TpFIBDataSet
    Database = Database
    Transaction = TransactionRead
    SelectSQL.Strings = (
      
        'select distinct native_cust.id_customer as native_id_customer,na' +
        'tive_cust.name_customer as native_name_customer,'
      
        #39#1052#1060#1054' '#39'||native_bank.mfo||'#39' -'#1041#1040#1053#1050' '#39'||native_bank.name_mfo native_' +
        'MFO,'
      
        #39#1056'\'#1057' '#39'||native_acc.rate_account native_rate_account,native_acc.i' +
        'd_rate_account native_id_account,'
      
        'p_acc.id_rate_account as p_id_account,p_acc.rate_account as p_ra' +
        'te_account,'
      
        'p_cust.id_customer as p_cust,p_cust.name_customer as p_name_cust' +
        ','
      #39#1052#1060#1054' '#39'||p_bank.mfo||'#39' -'#1041#1040#1053#1050' '#39'||p_bank.name_mfo p_MFO,'
      'clbank_buff.*'
      
        'from pub_sp_customer native_cust,pub_sp_bank native_bank,pub_sp_' +
        'cust_rate_acc native_acc,'
      
        'pub_sp_cust_rate_acc p_acc,pub_sp_customer p_cust,pub_sp_bank p_' +
        'bank,'
      'clbank_buff'
      'where native_acc.id_customer=native_cust.id_customer'
      'and native_bank.id_bank=native_acc.id_bank'
      'and clbank_buff.id_account_native=native_acc.id_rate_account'
      'and clbank_buff.id_account_customer=p_acc.id_rate_account'
      'and p_acc.id_customer=p_cust.id_customer'
      'and p_bank.id_bank=p_acc.id_bank'
      'and clbank_buff.id_doc=:param_doc')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 105
    Top = 89
    poSQLINT64ToBCD = True
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = Database
    Transaction = TransactionWrite
    Left = 72
    Top = 123
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = TransactionRead
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 72
    Top = 57
  end
  object TransactionRead: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 104
    Top = 56
  end
  object TransactionWrite: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 72
    Top = 89
  end
  object ActionList1: TActionList
    Left = 176
    Top = 319
    object ActionAdd: TAction
      Caption = 'ActionAdd'
      ShortCut = 16397
    end
  end
  object pFIBDataSetWorkDublicate: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from CLBANK_FIND_DUBLICATE(:ID_KEY_LOCAL,:IN_BANK)')
    Left = 40
    Top = 352
    poSQLINT64ToBCD = True
  end
  object pFIBDataSetEditDocBuff: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from  CLBANK_SELECT_BUFF(:ID_KEY_LOCAL,:IN_BANK)')
    Left = 532
    Top = 340
    poSQLINT64ToBCD = True
  end
  object pFIBDataSetIgnor: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select * from  CLBANK_FIND_DUBLICATE_BUFF(:ID_KEY_LOCAL,:ID_BANK' +
        ')')
    Left = 560
    Top = 432
    poSQLINT64ToBCD = True
  end
end
