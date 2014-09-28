object frmKorr: TfrmKorr
  Left = 194
  Top = 147
  BorderStyle = bsDialog
  Caption = #1050#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1110#1103
  ClientHeight = 436
  ClientWidth = 817
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 409
    Height = 65
    Alignment = alTopLeft
    Caption = #1044#1077#1073#1077#1090
    TabOrder = 0
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 8
      Top = 32
      Width = 73
      Height = 21
      DataBinding.DataField = 'NUM_SCH_DB'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 88
      Top = 32
      Width = 313
      Height = 21
      DataBinding.DataField = 'NAME_SCH_DB'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 16
      Width = 49
      Height = 17
      TabOrder = 2
      Caption = #1056#1072#1093#1091#1085#1086#1082
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 408
    Top = 0
    Width = 409
    Height = 65
    Alignment = alTopLeft
    Caption = #1050#1088#1077#1076#1080#1090
    TabOrder = 1
    object cxDBTextEdit5: TcxDBTextEdit
      Left = 8
      Top = 32
      Width = 73
      Height = 21
      DataBinding.DataField = 'NUM_SCH_KR'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
    object cxDBTextEdit6: TcxDBTextEdit
      Left = 88
      Top = 32
      Width = 313
      Height = 21
      DataBinding.DataField = 'NAME_SCH_KR'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object cxLabel3: TcxLabel
      Left = 8
      Top = 16
      Width = 49
      Height = 17
      TabOrder = 2
      Caption = #1056#1072#1093#1091#1085#1086#1082
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 64
    Width = 409
    Height = 337
    Alignment = alTopLeft
    Caption = #1044#1077#1073#1077#1090#1086#1074#1099#1081' '#1076#1086#1075#1086#1074#1086#1088
    TabOrder = 2
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 8
      Top = 144
      Width = 153
      Height = 21
      DataBinding.DataField = 'DB_NAME_TIP_DOG'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
    object cxDBTextEdit7: TcxDBTextEdit
      Left = 176
      Top = 144
      Width = 65
      Height = 21
      DataBinding.DataField = 'DB_N_DOG'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object cxLabel2: TcxLabel
      Left = 160
      Top = 144
      Width = 19
      Height = 17
      TabOrder = 2
      Caption = #8470
    end
    object cxDBTextEdit8: TcxDBTextEdit
      Left = 256
      Top = 144
      Width = 73
      Height = 21
      DataBinding.DataField = 'DB_D_DOG'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 3
    end
    object cxLabel4: TcxLabel
      Left = 240
      Top = 144
      Width = 19
      Height = 17
      TabOrder = 4
      Caption = #1086#1090
    end
    object cxDBTextEdit9: TcxDBTextEdit
      Left = 328
      Top = 144
      Width = 73
      Height = 21
      DataBinding.DataField = 'DB_REGEST_NUM'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 5
    end
    object cxDBTextEdit10: TcxDBTextEdit
      Left = 72
      Top = 168
      Width = 329
      Height = 21
      DataBinding.DataField = 'DB_NAME_CUSTOMER'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 6
    end
    object cxLabel5: TcxLabel
      Left = 8
      Top = 168
      Width = 66
      Height = 17
      TabOrder = 7
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    end
    object cxDBMemo1: TcxDBMemo
      Left = 8
      Top = 208
      Width = 393
      Height = 41
      DataBinding.DataField = 'DB_DOG_NOTE'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 8
    end
    object cxLabel6: TcxLabel
      Left = 8
      Top = 192
      Width = 53
      Height = 17
      TabOrder = 9
      Caption = #1055#1110#1076#1089#1090#1072#1074#1072
    end
    object cxDBTextEdit15: TcxDBTextEdit
      Left = 8
      Top = 264
      Width = 137
      Height = 21
      DataBinding.DataField = 'DB_SUMMA'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 10
    end
    object cxDBTextEdit16: TcxDBTextEdit
      Left = 152
      Top = 264
      Width = 121
      Height = 21
      DataBinding.DataField = 'DB_SUM_PAY'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 11
    end
    object cxDBTextEdit17: TcxDBTextEdit
      Left = 280
      Top = 264
      Width = 121
      Height = 21
      DataBinding.DataField = 'DB_SUM_FULFIL'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 12
    end
    object cxLabel11: TcxLabel
      Left = 8
      Top = 248
      Width = 34
      Height = 17
      TabOrder = 13
      Caption = #1057#1091#1084#1072
    end
    object cxLabel12: TcxLabel
      Left = 152
      Top = 248
      Width = 45
      Height = 17
      TabOrder = 14
      Caption = #1054#1087#1083#1072#1090#1072
    end
    object cxLabel13: TcxLabel
      Left = 280
      Top = 248
      Width = 63
      Height = 17
      TabOrder = 15
      Caption = #1042#1080#1082#1086#1085#1072#1085#1085#1103
    end
    object cxLabel17: TcxLabel
      Left = 8
      Top = 288
      Width = 39
      Height = 17
      TabOrder = 16
      Caption = #1057#1074#1103#1079#1100
    end
    object cxDBTextEdit21: TcxDBTextEdit
      Left = 8
      Top = 304
      Width = 393
      Height = 21
      DataBinding.DataField = 'DB_LINK'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 17
    end
    object cxGroupBox5: TcxGroupBox
      Left = 8
      Top = 16
      Width = 393
      Height = 121
      Alignment = alTopLeft
      Caption = #1056#1077#1082#1074#1110#1079#1080#1090#1080' '#1082#1086#1096#1090#1086#1088#1080#1089#1072
      TabOrder = 18
      object cxDBTextEdit23: TcxDBTextEdit
        Left = 64
        Top = 20
        Width = 49
        Height = 21
        DataBinding.DataField = 'DB_SMETA'
        DataBinding.DataSource = DataSource1
        Style.Color = clMoneyGreen
        TabOrder = 0
      end
      object cxDBTextEdit24: TcxDBTextEdit
        Left = 120
        Top = 20
        Width = 265
        Height = 21
        DataBinding.DataField = 'DB_SMETA_TITLE'
        DataBinding.DataSource = DataSource1
        Style.Color = clMoneyGreen
        TabOrder = 1
      end
      object cxDBTextEdit25: TcxDBTextEdit
        Left = 64
        Top = 44
        Width = 49
        Height = 21
        DataBinding.DataField = 'DB_RAZD'
        DataBinding.DataSource = DataSource1
        Style.Color = clMoneyGreen
        TabOrder = 2
      end
      object cxDBTextEdit26: TcxDBTextEdit
        Left = 120
        Top = 44
        Width = 265
        Height = 21
        DataBinding.DataField = 'DB_RAZD_TITLE'
        DataBinding.DataSource = DataSource1
        Style.Color = clMoneyGreen
        TabOrder = 3
      end
      object cxDBTextEdit27: TcxDBTextEdit
        Left = 64
        Top = 68
        Width = 49
        Height = 21
        DataBinding.DataField = 'DB_STAT'
        DataBinding.DataSource = DataSource1
        Style.Color = clMoneyGreen
        TabOrder = 4
      end
      object cxDBTextEdit28: TcxDBTextEdit
        Left = 120
        Top = 68
        Width = 265
        Height = 21
        DataBinding.DataField = 'DB_ST_TITLE'
        DataBinding.DataSource = DataSource1
        Style.Color = clMoneyGreen
        TabOrder = 5
      end
      object cxDBTextEdit29: TcxDBTextEdit
        Left = 120
        Top = 92
        Width = 265
        Height = 21
        DataBinding.DataField = 'DB_KEKV_TITLE'
        DataBinding.DataSource = DataSource1
        Style.Color = clMoneyGreen
        TabOrder = 6
      end
      object cxDBTextEdit30: TcxDBTextEdit
        Left = 64
        Top = 92
        Width = 49
        Height = 21
        DataBinding.DataField = 'DB_KEKV'
        DataBinding.DataSource = DataSource1
        Style.Color = clMoneyGreen
        TabOrder = 7
      end
      object cxLabel19: TcxLabel
        Left = 8
        Top = 21
        Width = 58
        Height = 17
        TabOrder = 8
        Caption = #1050#1086#1096#1090#1086#1088#1080#1089
      end
      object cxLabel20: TcxLabel
        Left = 23
        Top = 45
        Width = 41
        Height = 17
        TabOrder = 9
        Caption = #1056#1086#1079#1076#1110#1083
      end
      object cxLabel21: TcxLabel
        Left = 22
        Top = 67
        Width = 42
        Height = 17
        TabOrder = 10
        Caption = #1057#1090#1072#1090#1090#1103
      end
      object cxLabel22: TcxLabel
        Left = 29
        Top = 93
        Width = 36
        Height = 17
        TabOrder = 11
        Caption = #1050#1045#1050#1042
      end
    end
  end
  object cxGroupBox4: TcxGroupBox
    Left = 408
    Top = 64
    Width = 409
    Height = 337
    Alignment = alTopLeft
    Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1099#1081' '#1076#1086#1075#1086#1074#1086#1088
    TabOrder = 3
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 8
      Top = 144
      Width = 153
      Height = 21
      DataBinding.DataField = 'KR_NAME_TIP_DOG'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
    object cxDBTextEdit11: TcxDBTextEdit
      Left = 176
      Top = 144
      Width = 65
      Height = 21
      DataBinding.DataField = 'KR_N_DOG'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object cxLabel7: TcxLabel
      Left = 160
      Top = 144
      Width = 19
      Height = 17
      TabOrder = 2
      Caption = #8470
    end
    object cxDBTextEdit12: TcxDBTextEdit
      Left = 256
      Top = 144
      Width = 73
      Height = 21
      DataBinding.DataField = 'KR_D_DOG'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 3
    end
    object cxLabel8: TcxLabel
      Left = 240
      Top = 144
      Width = 19
      Height = 17
      TabOrder = 4
      Caption = #1086#1090
    end
    object cxDBTextEdit13: TcxDBTextEdit
      Left = 328
      Top = 144
      Width = 73
      Height = 21
      DataBinding.DataField = 'KR_REGEST_NUM'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 5
    end
    object cxDBTextEdit14: TcxDBTextEdit
      Left = 72
      Top = 168
      Width = 329
      Height = 21
      DataBinding.DataField = 'KR_NAME_CUSTOMER'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 6
    end
    object cxLabel9: TcxLabel
      Left = 8
      Top = 168
      Width = 66
      Height = 17
      TabOrder = 7
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    end
    object cxDBMemo2: TcxDBMemo
      Left = 8
      Top = 208
      Width = 393
      Height = 41
      DataBinding.DataField = 'KR_DOG_NOTE'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 8
    end
    object cxLabel10: TcxLabel
      Left = 8
      Top = 192
      Width = 53
      Height = 17
      TabOrder = 9
      Caption = #1055#1110#1076#1089#1090#1072#1074#1072
    end
    object cxLabel14: TcxLabel
      Left = 8
      Top = 248
      Width = 34
      Height = 17
      TabOrder = 10
      Caption = #1057#1091#1084#1072
    end
    object cxDBTextEdit18: TcxDBTextEdit
      Left = 8
      Top = 264
      Width = 137
      Height = 21
      DataBinding.DataField = 'KR_SUMMA'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 11
    end
    object cxLabel15: TcxLabel
      Left = 152
      Top = 248
      Width = 45
      Height = 17
      TabOrder = 12
      Caption = #1054#1087#1083#1072#1090#1072
    end
    object cxDBTextEdit19: TcxDBTextEdit
      Left = 152
      Top = 264
      Width = 121
      Height = 21
      DataBinding.DataField = 'KR_SUM_PAY'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 13
    end
    object cxLabel16: TcxLabel
      Left = 280
      Top = 248
      Width = 63
      Height = 17
      TabOrder = 14
      Caption = #1042#1080#1082#1086#1085#1072#1085#1085#1103
    end
    object cxDBTextEdit20: TcxDBTextEdit
      Left = 280
      Top = 264
      Width = 121
      Height = 21
      DataBinding.DataField = 'KR_SUM_FULFIL'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 15
    end
    object cxLabel18: TcxLabel
      Left = 8
      Top = 288
      Width = 39
      Height = 17
      TabOrder = 16
      Caption = #1057#1074#1103#1079#1100
    end
    object cxDBTextEdit22: TcxDBTextEdit
      Left = 8
      Top = 304
      Width = 393
      Height = 21
      DataBinding.DataField = 'KR_LINK'
      DataBinding.DataSource = DataSource1
      Style.Color = clMoneyGreen
      TabOrder = 17
    end
    object cxGroupBox6: TcxGroupBox
      Left = 8
      Top = 16
      Width = 393
      Height = 121
      Alignment = alTopLeft
      Caption = #1056#1077#1082#1074#1110#1079#1080#1090#1080' '#1082#1086#1096#1090#1086#1088#1080#1089#1072
      TabOrder = 18
      object cxDBTextEdit31: TcxDBTextEdit
        Left = 64
        Top = 20
        Width = 49
        Height = 21
        DataBinding.DataField = 'KR_SMETA'
        DataBinding.DataSource = DataSource1
        Style.Color = clMoneyGreen
        TabOrder = 0
      end
      object cxDBTextEdit32: TcxDBTextEdit
        Left = 120
        Top = 20
        Width = 265
        Height = 21
        DataBinding.DataField = 'KR_SMETA_TITLE'
        DataBinding.DataSource = DataSource1
        Style.Color = clMoneyGreen
        TabOrder = 1
      end
      object cxDBTextEdit33: TcxDBTextEdit
        Left = 64
        Top = 44
        Width = 49
        Height = 21
        DataBinding.DataField = 'KR_RAZD'
        DataBinding.DataSource = DataSource1
        Style.Color = clMoneyGreen
        TabOrder = 2
      end
      object cxDBTextEdit34: TcxDBTextEdit
        Left = 120
        Top = 44
        Width = 265
        Height = 21
        DataBinding.DataField = 'KR_RAZD_TITLE'
        DataBinding.DataSource = DataSource1
        Style.Color = clMoneyGreen
        TabOrder = 3
      end
      object cxDBTextEdit35: TcxDBTextEdit
        Left = 64
        Top = 68
        Width = 49
        Height = 21
        DataBinding.DataField = 'KR_STAT'
        DataBinding.DataSource = DataSource1
        Style.Color = clMoneyGreen
        TabOrder = 4
      end
      object cxDBTextEdit36: TcxDBTextEdit
        Left = 120
        Top = 68
        Width = 265
        Height = 21
        DataBinding.DataField = 'KR_ST_TITLE'
        DataBinding.DataSource = DataSource1
        Style.Color = clMoneyGreen
        TabOrder = 5
      end
      object cxDBTextEdit37: TcxDBTextEdit
        Left = 120
        Top = 92
        Width = 265
        Height = 21
        DataBinding.DataField = 'KR_KEKV_TITLE'
        DataBinding.DataSource = DataSource1
        Style.Color = clMoneyGreen
        TabOrder = 6
      end
      object cxDBTextEdit38: TcxDBTextEdit
        Left = 64
        Top = 92
        Width = 49
        Height = 21
        DataBinding.DataField = 'KR_KEKV'
        DataBinding.DataSource = DataSource1
        Style.Color = clMoneyGreen
        TabOrder = 7
      end
      object cxLabel23: TcxLabel
        Left = 8
        Top = 21
        Width = 58
        Height = 17
        TabOrder = 8
        Caption = #1050#1086#1096#1090#1086#1088#1080#1089
      end
      object cxLabel24: TcxLabel
        Left = 23
        Top = 45
        Width = 41
        Height = 17
        TabOrder = 9
        Caption = #1056#1086#1079#1076#1110#1083
      end
      object cxLabel25: TcxLabel
        Left = 22
        Top = 67
        Width = 42
        Height = 17
        TabOrder = 10
        Caption = #1057#1090#1072#1090#1090#1103
      end
      object cxLabel26: TcxLabel
        Left = 29
        Top = 93
        Width = 36
        Height = 17
        TabOrder = 11
        Caption = #1050#1045#1050#1042
      end
    end
  end
  object cxButton1: TcxButton
    Left = 704
    Top = 408
    Width = 107
    Height = 25
    Cancel = True
    Caption = #1047#1072#1082#1088#1080#1090#1080
    Default = True
    TabOrder = 4
    OnClick = cxButton1Click
  end
  object DataSet: TpFIBDataSet
    Database = frmPayFulfil.pFIBDatabase1
    Transaction = frmPayFulfil.pFIBTransaction1
    SelectSQL.Strings = (
      'select * from PROC_DOG_DT_DOC_PAY_FULFIL_SELK(:ID_PROV)')
    Left = 96
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    DataSet = DataSet
    Left = 128
  end
end
