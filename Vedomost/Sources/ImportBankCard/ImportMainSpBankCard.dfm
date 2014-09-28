object fmImportMainSpBankCard: TfmImportMainSpBankCard
  Left = 305
  Top = 113
  Width = 525
  Height = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  DesignSize = (
    517
    494)
  PixelsPerInch = 96
  TextHeight = 13
  object GaugeAll: TGauge
    Left = 2
    Top = 376
    Width = 513
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    BackColor = clMoneyGreen
    Progress = 0
  end
  object bar: TGauge
    Left = 2
    Top = 424
    Width = 513
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    BackColor = clMoneyGreen
    Progress = 0
  end
  object cxMemo: TcxMemo
    Left = 0
    Top = 0
    Width = 517
    Height = 353
    Align = alTop
    Properties.ReadOnly = True
    Style.Color = 15204351
    TabOrder = 0
  end
  object Section: TComboBox
    Left = 368
    Top = 8
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'Sections'
    Visible = False
  end
  object cxButton1: TcxButton
    Left = 216
    Top = 461
    Width = 139
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'cxButton1'
    Default = True
    TabOrder = 2
    OnClick = cxButton1Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000420B0000420B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1BBAD6947316947316947316947
      31694731694731694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFD1BBADF2ECE8EDE4DFE7DBD4E1D2C9DBC9BFDBC9BF694731FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1BBAD0086C10086C10086C10086
      C10086C1DECDC4694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFD1BBAD0097DE5FE3FF00D6FF00C4EE0097DEE4D7CF694731FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1BBADCDF0FF0097DE00D6FF0097
      DECDF0FFEAE0D9694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFD1BBADFFFFFF00ABFA5FE3FF0097DEF5F0EDEFE8E3694731D1BBAD694731
      694731694731694731694731694731694731D1BBADFFFFFFCDF0FF0097DECDF0
      FFD1BBAD694731694731D1BBADF2ECE8EDE4DFE7DBD4E1D2C9DBC9BFDBC9BF69
      4731D1BBADFFFFFFFFFFFFFFFFFFFFFFFFD1BBADD1BBADFF00FFD1BBADF8F4F2
      F2ECE80021ADE7DBD4E1D2C9DECDC4694731D1BBADD1BBADD1BBADD1BBAD9830
      00D1BBADFF00FFFF00FFD1BBADFDFCFB0021AD2152E70021ADEAE0D9E4D7CF69
      4731FF00FFFF00FFFF00FF983000E4A582983000FF00FFFF00FFD1BBAD1839DE
      6373E72152E72152E70021ADEAE0D9694731FF00FFFF00FF983000E4A582D087
      5FB45E2F983000FF00FFD1BBADFFFFFF1839DE6373E70021ADF5F0EDEFE8E369
      4731FF00FF983000B45E2FD0875FD0875FD0875FB45E2F983000D1BBADFFFFFF
      FFFFFF1839DEFFFFFFFAF8F6F5F0ED694731FF00FFFF00FFFF00FFB45E2FD087
      5F983000FF00FFFF00FFD1BBADFFFFFFFFFFFFFFFFFFFFFFFFD1BBAD69473169
      4731FF00FFFF00FFFF00FFB45E2F983000FF00FFFF00FFFF00FFD1BBADFFFFFF
      FFFFFFFFFFFFFFFFFFD1BBADD1BBADFF00FFFF00FFFF00FFB45E2FD0875F9830
      00FF00FFFF00FFFF00FFD1BBADD1BBADD1BBADD1BBADD1BBADD1BBADFF00FFB4
      5E2FB45E2FB45E2F983000983000FF00FFFF00FFFF00FFFF00FF}
    UseSystemPaint = False
  end
  object cxButton2: TcxButton
    Left = 368
    Top = 460
    Width = 137
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = 'cxButton2'
    TabOrder = 3
    OnClick = cxButton2Click
    Glyph.Data = {
      32040000424D3204000000000000360000002800000014000000110000000100
      180000000000FC030000120B0000120B00000000000000000000C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4B54A009C31009C3100C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4B54A00FFEFA5FFEFA55A31185A3118C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4B54A00FFEFA5FFEFA5FFE78CFFE78C313131313131C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      FF6331B54A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65A3131319C31009C31
      00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF31FFFF6331B5
      4A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65AFF9C00FF9C639C3100C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331B54A00FFEF
      A5FFEFA5000000080808FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4080808C8D0D4C8D0D4FF6331B54A00FFEFA5FFEFA5
      FFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4000000000000C8D0D4C8D0D4FF6331B54A00F7FFFFFFDE84FFDE84FF
      DE84FFDE84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000
      FFFFCE000000000000000000000000B54A00F7FFFFFFEFA5FFDE84FFDE84FFDE
      84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4000000FFFFCEFFFFCEFF
      FFBDFFC65AFFA510FF9C00B54A00F7FFFFFFEFA5FFDE84FFDE84FFCE63FFC65A
      FF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000FFFFCE0000000000
      00000000080808B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF
      9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4080808000000C8D0D4C8D0D4
      FF6331B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C31
      00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4FF31FFFF6331C6
      5A00C65A00FFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C009C3100C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD6
      73C65A00C65A00CE6363FFCE63FFC65AFF9C00FF9C009C3100C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD673FFD673
      FFD673C65A00C65A00CE6363FF9C00FF9C009C3100C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFDE84FFDE84FFDE84FFDE84FF
      DE84FFDE84C65A00C65A00C65A009C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4FF6331FF6331FF6331FF6331FF6331FF6331FF63
      31FF6331FF6331FF6331FF6331C8D0D4C8D0D4C8D0D4}
    UseSystemPaint = False
  end
  object cxLabel1: TcxLabel
    Left = 5
    Top = 356
    Width = 380
    Height = 17
    AutoSize = False
    TabOrder = 4
  end
  object cxLabel2: TcxLabel
    Left = 5
    Top = 404
    Width = 380
    Height = 17
    AutoSize = False
    TabOrder = 5
  end
  object cxButton3: TcxButton
    Left = 8
    Top = 464
    Width = 161
    Height = 25
    Caption = 'cxButton3'
    TabOrder = 6
    Visible = False
    OnClick = cxButton3Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000830F0000830F00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A99B9B9B9B
      9B9B9B9B9B9B9B9B9B9B9B9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFA6A8A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF737373696969656563929391FFFFFFAF
      AFAFAFAFAFAFAFAFFFFFFF7B7B754F4F4F545454545454FF00FFFF00FF737373
      93979793979775777590918EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B7B755B5C
      5C787B7B606161545454FF00FF737373939797ADB5B56667665F5F5F77777777
      77777777777777777171715A5A586869697F8282707171545454FF00FF737373
      ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5A2A8A86AA4
      7708B518767878565757FF00FF737373D2D2D2988D91997C809A797BAA8186AA
      7F86AA7E86AD828AA77F859D7C7F8B7D7A5E9063787A7A575858FF00FF737373
      D2D2D2855A62956B6D8A6969896D6D876B6B866A6A886E6D8A706F8D6A699363
      6A9C6C819397975C5D5DFF00FF737373D2D2D26F4952583F415F4C4C74696972
      67677166667166667166665E424254393C8A72749397976C6D6DFF00FF737373
      ADB5B57E686A757272A6A8A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9B6E5F
      61988989ADB5B56C6D6DFF00FFFF00FF7373738E81818F8485A6A8A9FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF9B9B9B8473748F85856C6D6DFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFA6A8A9FFFFFFFFFFFFFFFFFFA6A8A99B9B9B9B9B9BFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A9FFFFFFFF
      FFFFFFFFFFA6A8A9FFFFFF9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFA6A8A9FFFFFFFCFCFCFFFFFFA6A8A99B9B9BFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A99B9B9B9B
      9B9B9B9B9B9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    UseSystemPaint = False
  end
  object DS: TpFIBDataSet
    Left = 40
    Top = 8
    poSQLINT64ToBCD = True
  end
  object Tr: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 40
    Top = 56
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=sysdba')
    DefaultTransaction = Tr
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 72
    Top = 136
  end
  object RxSection: TRxMemoryData
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
    Top = 16
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 184
    Top = 32
  end
  object HTable: THalcyonDataSet
    AutoFlush = False
    Exclusive = False
    LargeIntegerAs = asLargeInt
    LockProtocol = Default
    TranslateASCII = True
    UseDeleted = True
    UserID = 0
    Left = 32
    Top = 128
  end
  object SProc: TpFIBStoredProc
    Left = 104
    Top = 136
  end
  object TWr: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 136
  end
  object ActionList1: TActionList
    Left = 256
    Top = 112
    object SlectLang: TAction
      Caption = 'SlectLang'
      ShortCut = 24652
      OnExecute = SlectLangExecute
    end
  end
  object DSError: TpFIBDataSet
    Database = DB
    Transaction = Tr
    SelectSQL.Strings = (
      'select * from PUB_SP_BANKCARD_PEOPLE_BUFF_PR(1)')
    Left = 264
    Top = 272
    poSQLINT64ToBCD = True
    object DSErrorTIN: TFIBStringField
      FieldName = 'TIN'
      Size = 10
      EmptyStrToNull = True
    end
    object DSErrorCOMENT: TFIBStringField
      FieldName = 'COMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object DSErrorBIRTHDAY: TFIBDateField
      FieldName = 'BIRTHDAY'
    end
    object DSErrorFAMILIYA: TFIBStringField
      FieldName = 'FAMILIYA'
      EmptyStrToNull = True
    end
    object DSErrorIMYA: TFIBStringField
      FieldName = 'IMYA'
      EmptyStrToNull = True
    end
    object DSErrorOTCHESTVO: TFIBStringField
      FieldName = 'OTCHESTVO'
      EmptyStrToNull = True
    end
    object DSErrorNAME_USER_IMP: TFIBStringField
      FieldName = 'NAME_USER_IMP'
      Size = 255
      EmptyStrToNull = True
    end
    object DSErrorLIC_SCH: TFIBStringField
      FieldName = 'LIC_SCH'
      Size = 16
      EmptyStrToNull = True
    end
    object DSErrorN_COMMENT: TFIBStringField
      FieldName = 'N_COMMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object DSErrorTIME_IMPORT: TFIBDateTimeField
      FieldName = 'TIME_IMPORT'
    end
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39014.380323333300000000
    ReportOptions.LastChange = 39014.411770636570000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 312
    Top = 272
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        object Memo2: TfrxMemoView
          Width = 676.535870000000000000
          Height = 79.370130000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1084#1080#1083#1082#1080' '#1087#1088#1080' '#1087#1088#1086#1074#1077#1076#1077#1085#1085#1110' '#1110#1084#1087#1086#1088#1090#1091
            #1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' [name_dog]'
            #1074#1110#1076' [frxDBDataset1."TIME_IMPORT"]'
            #1055#1088#1086#1074#1086#1076#1080#1074' '#1110#1084#1087#1086#1088#1090' [frxDBDataset1."NAME_USER_IMP"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 37.795300000000000000
        Top = 222.992270000000000000
        Width = 680.315400000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo3: TfrxMemoView
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."LIC_SCH"]')
        end
        object Memo4: TfrxMemoView
          Left = 117.165430000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."TIN"]')
        end
        object Memo5: TfrxMemoView
          Left = 215.433210000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."FAMILIYA"]')
        end
        object Memo6: TfrxMemoView
          Left = 525.354670000000100000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."OTCHESTVO"]')
        end
        object Memo7: TfrxMemoView
          Left = 370.393940000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."IMYA"]')
        end
        object Memo8: TfrxMemoView
          Top = 18.897650000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."COMENT"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 321.260050000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          Left = 600.844482530000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Width = 593.386210000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            
              #1051#1072#1073'."'#1052#1086#1076#1077#1083'.'#1087#1088#1086#1094'.'#1092#1080#1085'.'#1084#1077#1085#1077#1076#1078'."'#1044#1086#1085#1053#1059'. '#1047#1072#1082#1072#1079' '#8470' 2 '#1086#1090' 24.10.2006 (U[id' +
              '_user][comp]DT [DATE][TIME])  '#1056#1072#1079#1088#1072#1073#1086#1090#1072#1083' '#1092#1086#1088#1084#1091' '#1043#1072#1074#1088#1080#1083#1102#1082' '#1040'.'#1043'.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 37.795300000000000000
        Top = 124.724490000000000000
        Width = 680.315400000000000000
        object Memo9: TfrxMemoView
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1086#1082)
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 117.165430000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1076#1077#1085#1090'. '#1085#1086#1084#1077#1088)
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 215.433210000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1110#1079#1074#1080#1097#1077)
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 370.393940000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1084#39#1103)
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 525.354670000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086' '#1073#1072#1090#1100#1082#1086#1074#1110)
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Top = 18.897650000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1084#1080#1083#1082#1072)
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = DSError
    Left = 224
    Top = 272
  end
end
