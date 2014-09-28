object frmAddDocClBank: TfrmAddDocClBank
  Left = 474
  Top = 340
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'frmAddDocClBank'
  ClientHeight = 503
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxDateDoc: TGroupBox
    Left = 0
    Top = 0
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
      Style.Color = 15204351
      TabOrder = 0
    end
  end
  object GroupBoxDateVip: TGroupBox
    Left = 216
    Top = 0
    Width = 233
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
      Style.Color = 15204351
      TabOrder = 0
    end
  end
  object GroupBoxRSCustormer: TGroupBox
    Left = 0
    Top = 171
    Width = 449
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
    Top = 335
    Width = 449
    Height = 105
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
      Width = 445
      Height = 88
      Align = alClient
      ParentFont = False
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
    Top = 40
    Width = 450
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
    TabOrder = 2
  end
  object GroupBoxNumberDoc: TGroupBox
    Left = 0
    Top = 81
    Width = 449
    Height = 44
    Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object cxMaskEditNumdoc: TcxMaskEdit
      Left = 8
      Top = 16
      Width = 417
      Height = 21
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 10
      Properties.ReadOnly = False
      Style.Color = 15204351
      TabOrder = 0
    end
  end
  object GroupBoxSumma: TGroupBox
    Left = 0
    Top = 253
    Width = 449
    Height = 84
    Caption = #1057#1091#1084#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object Label1: TLabel
      Left = 1
      Top = 16
      Width = 61
      Height = 13
      Caption = #1091' '#1085#1072#1094'.'#1074#1072#1083'.'
    end
    object Label2: TLabel
      Left = 1
      Top = 40
      Width = 50
      Height = 13
      Caption = #1091' '#1074#1072#1083#1102#1090#1110
    end
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 44
      Height = 13
      Caption = #1074#1072#1083#1102#1090#1072
    end
    object ValutaLabel: TLabel
      Left = 68
      Top = 64
      Width = 357
      Height = 13
      AutoSize = False
      Caption = 'ValutaLabel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxMaskEditSumma: TcxCalcEdit
      Left = 60
      Top = 16
      Width = 129
      Height = 21
      EditValue = 0.000000000000000000
      Properties.Precision = 15
      Style.Color = 15204351
      TabOrder = 0
    end
    object ValutacxCalcEdit: TcxCalcEdit
      Left = 60
      Top = 40
      Width = 129
      Height = 21
      Style.Color = 15204351
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 192
      Top = 13
      Width = 129
      Height = 25
      Caption = #1087#1077#1088#1077#1088#1072#1093'.'#1079' '#1075#1088#1085' '#1074' '#1074#1072#1083'.'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 192
      Top = 42
      Width = 129
      Height = 25
      Caption = #1087#1077#1088#1077#1088#1072#1093'. '#1079' '#1074#1072#1083'. '#1074' '#1075#1088#1085'.'
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object GroupBox1: TGroupBox
      Left = 324
      Top = 10
      Width = 121
      Height = 55
      TabOrder = 4
      object Label4: TLabel
        Left = 8
        Top = 8
        Width = 107
        Height = 26
        Caption = #1072#1082#1090#1091#1072#1083#1100#1085#1080#1081' '#1082#1091#1088#1089' '#13#10#1085#1072' '#1076#1072#1090#1091' '#1074#1080#1087'. '#1076#1086#1082'.:'
      end
      object Label5: TLabel
        Left = 5
        Top = 36
        Width = 113
        Height = 13
        AutoSize = False
        Caption = '1 '#1075#1088#1085'. = '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 484
    Width = 451
    Height = 19
    Panels = <>
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 438
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
    Top = 125
    Width = 449
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
      Properties.OnButtonClick = cxButtonEditRSLemanPropertiesButtonClick
      Style.Color = 15204351
      TabOrder = 0
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
    Left = 352
    Top = 52
    poSQLINT64ToBCD = True
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
    Left = 352
    Top = 124
    poSQLINT64ToBCD = True
  end
  object pFIBStoredProcAll: TpFIBStoredProc
    Database = Database
    Transaction = TransactionWrite
    Left = 72
    Top = 123
  end
  object pFIBDataSet_post: TpFIBDataSet
    Database = Database
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select *'
      'from pub_sp_customer'
      'where pub_sp_customer.id_customer=:param_cust')
    Left = 328
    Top = 223
    poSQLINT64ToBCD = True
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
      ShortCut = 121
      OnExecute = ActionAddExecute
    end
  end
  object pFIBDataSetShablon: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from CLBANK_INI_SHABLON_VIEW'
      'where CLBANK_INI_SHABLON_VIEW.id_shablon=:param_shablon')
    Left = 72
    Top = 184
    poSQLINT64ToBCD = True
  end
end
