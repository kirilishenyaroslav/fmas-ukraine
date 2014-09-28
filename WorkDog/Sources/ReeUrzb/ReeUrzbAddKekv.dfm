object frmAddKekv: TfrmAddKekv
  Left = 692
  Top = 359
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1085#1085#1103' '#1050#1045#1050#1042#1072
  ClientHeight = 223
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = -3
    Top = -2
    Width = 517
    Height = 189
    TabOrder = 0
    object lblKosht: TLabel
      Left = 10
      Top = 15
      Width = 90
      Height = 13
      Caption = #1050#1086#1076' '#1082#1086#1096#1090#1086#1088#1080#1089#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblRz: TLabel
      Left = 10
      Top = 50
      Width = 88
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1088#1086#1079#1076#1110#1083#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSt: TLabel
      Left = 10
      Top = 85
      Width = 79
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1089#1090#1072#1090#1090#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblKEKV: TLabel
      Left = 10
      Top = 120
      Width = 66
      Height = 13
      Caption = #1050#1086#1076' '#1050#1045#1050#1042#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblKoshtText: TLabel
      Left = 132
      Top = 15
      Width = 155
      Height = 13
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1082#1086#1096#1090#1086#1088#1080#1089#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblRzText: TLabel
      Left = 132
      Top = 50
      Width = 136
      Height = 13
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1088#1086#1079#1076#1110#1083#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblStText: TLabel
      Left = 132
      Top = 85
      Width = 127
      Height = 13
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1089#1090#1072#1090#1090#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblKEKVText: TLabel
      Left = 132
      Top = 120
      Width = 131
      Height = 13
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1050#1045#1050#1042#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSum: TLabel
      Left = 304
      Top = 167
      Width = 31
      Height = 13
      Caption = #1057#1091#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxButtonEdit_name_smet: TcxButtonEdit
      Left = 132
      Top = 30
      Width = 377
      Height = 21
      TabStop = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxButtonEditKoshtPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
    object cxButtonEdit_name_kekv: TcxButtonEdit
      Left = 132
      Top = 135
      Width = 377
      Height = 21
      TabStop = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxButtonEdit_name_kekvPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object CurrencyEdit_sum_smet: TCurrencyEdit
      Left = 361
      Top = 162
      Width = 146
      Height = 21
      AutoSize = False
      Color = clMoneyGreen
      DisplayFormat = ',0.00 ;-,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnKeyDown = CurrencyEdit_sum_smetKeyDown
      OnKeyPress = CurrencyEdit_sum_smetKeyPress
    end
    object cxMaskEdit_kod_smeti: TcxMaskEdit
      Left = 10
      Top = 30
      Width = 105
      Height = 21
      ParentFont = False
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
      OnExit = cxMaskEdit_kod_smetiExit
      OnKeyDown = cxMaskEdit_kod_smetiKeyDown
    end
    object cxMaskEdit_n_razd: TcxMaskEdit
      Left = 10
      Top = 65
      Width = 105
      Height = 21
      ParentFont = False
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 3
      OnExit = cxMaskEdit_n_razdExit
      OnKeyDown = cxMaskEdit_n_razdKeyDown
    end
    object cxMaskEdit_n_stat: TcxMaskEdit
      Left = 10
      Top = 100
      Width = 105
      Height = 21
      ParentFont = False
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 4
      OnExit = cxMaskEdit_n_statExit
      OnKeyDown = cxMaskEdit_n_statKeyDown
    end
    object cxMaskEdit_kekv: TcxMaskEdit
      Left = 10
      Top = 135
      Width = 105
      Height = 21
      ParentFont = False
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 5
      OnExit = cxMaskEdit_kekvExit
      OnKeyDown = cxMaskEdit_kekvKeyDown
    end
    object cxTextEdit_name_razd: TcxTextEdit
      Left = 132
      Top = 65
      Width = 377
      Height = 21
      TabStop = False
      ParentFont = False
      Style.Color = clMoneyGreen
      TabOrder = 6
    end
    object cxTextEdit_stat: TcxTextEdit
      Left = 132
      Top = 98
      Width = 377
      Height = 21
      TabStop = False
      ParentFont = False
      Style.Color = clMoneyGreen
      TabOrder = 8
    end
  end
  object grp2: TGroupBox
    Left = -2
    Top = 182
    Width = 516
    Height = 41
    TabOrder = 1
    object cxButton_ok: TcxButton
      Left = 268
      Top = 9
      Width = 91
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = cxButton_okClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E0000000100000000000000000000FFFF
        FF0000FF000000840000C8D0D40084848400FFFFFF0000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000040404040404
        0404040404040404040404040404040404040404040404040404040404040404
        0404040404040404040404040404040400040404040404040404040404040400
        0300040404040404040404040404000302030004040404040404040404000202
        0202030004040404040404040002020505020203000404040404040405020504
        0405020203000404040404040405040404040502020300040404040404040404
        0404040502020300040404040404040404040404050202000404040404040404
        0404040404050200040404040404040404040404040405040404040404040404
        0404040404040404040404040404040404040404040404040404}
      UseSystemPaint = False
    end
    object cxButton_cancel: TcxButton
      Left = 376
      Top = 9
      Width = 91
      Height = 25
      Cancel = True
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = cxButton_cancelClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E0000000100000000000000000000FFFF
        FF00C8D0D4000000FF0000008400848484000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020404050202020202020404020202020204040405
        0202020204040502020202020204040405020204040402020202020202020404
        0405040404020202020202020202020404040404020202020202020202020202
        0403040502020202020202020202020404040404050202020202020202020404
        0402040404050202020202020204040402020204040405020202020204040402
        0202020204040402020202020404020202020202020404020202020202020202
        0202020202020202020202020202020202020202020202020202}
      UseSystemPaint = False
    end
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = pFIBDatabase
    Transaction = pFIBTransactionRead
    Left = 128
    Top = 160
  end
  object pFIBDatabase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = pFIBTransactionRead
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 6
    Top = 158
  end
  object pFIBTransactionRead: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TARollback
    Left = 46
    Top = 158
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TARollback
    Left = 87
    Top = 159
  end
  object pFIBDataSet_default_smet: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from   mbook_ini_data')
    Left = 9
    Top = 192
    poSQLINT64ToBCD = True
  end
  object pFIBDataSet_kekv: TpFIBDataSet
    Database = pFIBDatabase
    Transaction = pFIBTransactionRead
    SelectSQL.Strings = (
      'select *'
      'from pub_spr_kekv_info(:id_kekv, :actual_date)')
    Left = 46
    Top = 191
    poSQLINT64ToBCD = True
  end
  object pFIBDataSet_smeta: TpFIBDataSet
    Database = pFIBDatabase
    Transaction = pFIBTransactionRead
    SelectSQL.Strings = (
      'select *'
      'from PUB_SPR_SMETA_INFO(:id_smeta)')
    Left = 86
    Top = 192
    poSQLINT64ToBCD = True
  end
  object pFIBDataSet_razd_st: TpFIBDataSet
    Database = pFIBDatabase
    Transaction = pFIBTransactionRead
    SelectSQL.Strings = (
      'select *'
      'from pub_spr_razd_st_info(:id_razd_st_in)')
    Left = 128
    Top = 192
    poSQLINT64ToBCD = True
  end
  object pFIBDataSet_stat: TpFIBDataSet
    Database = pFIBDatabase
    Transaction = pFIBTransactionRead
    SelectSQL.Strings = (
      'select *'
      'from  pub_get_name_st_by_kod(:num_razd,:num_st,:actual_date)')
    Left = 168
    Top = 194
    poSQLINT64ToBCD = True
  end
  object ds1: TDataSource
    DataSet = pFIBDataSet_stat
    Left = 174
    Top = 158
  end
end
