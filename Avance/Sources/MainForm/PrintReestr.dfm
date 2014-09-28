object frmPrintReestr: TfrmPrintReestr
  Left = 492
  Top = 288
  Width = 391
  Height = 189
  Caption = 'frmPrintReestr'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 6
    Top = 6
    Width = 363
    Height = 99
  end
  object LabelNameReport: TcxLabel
    Left = 12
    Top = 12
    Width = 213
    Height = 17
    AutoSize = False
    TabOrder = 0
    Caption = #1053#1072#1079#1074#1072' '#1079#1074#1110#1090#1091
  end
  object TextEditName: TcxTextEdit
    Left = 12
    Top = 36
    Width = 337
    Height = 21
    TabOrder = 1
  end
  object LabelPeriodFrom: TcxLabel
    Left = 12
    Top = 68
    Width = 51
    Height = 17
    TabOrder = 2
    Caption = #1055#1077#1088#1110#1086#1076' '#1079
  end
  object LabelPeriodTo: TcxLabel
    Left = 201
    Top = 68
    Width = 20
    Height = 17
    TabOrder = 3
    Caption = #1076#1086
  end
  object DateEditFrom: TcxDateEdit
    Left = 70
    Top = 65
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object DateEditTo: TcxDateEdit
    Left = 228
    Top = 65
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object ButtonPrint: TcxButton
    Left = 176
    Top = 120
    Width = 86
    Height = 25
    Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080
    TabOrder = 6
    OnClick = ButtonPrintClick
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
  object ButtonClose: TcxButton
    Left = 272
    Top = 120
    Width = 83
    Height = 25
    Caption = #1047#1072#1082#1088#1080#1090#1080
    TabOrder = 7
    OnClick = ButtonCloseClick
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
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 112
  end
  object DataSetReestr: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    SelectSQL.Strings = (
      'SELECT * FROM J4_SELECT_AVANCE_DOCS('#39'01.01.2011'#39','#39'31.12.2011'#39',1)')
    Left = 40
    Top = 112
    poSQLINT64ToBCD = True
    object DataSetReestrNAME_PRED: TFIBStringField
      FieldName = 'NAME_PRED'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetReestrDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object DataSetReestrNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 120
      EmptyStrToNull = True
    end
    object DataSetReestrSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetReestrFIO_DOC: TFIBStringField
      FieldName = 'FIO_DOC'
      Size = 150
      EmptyStrToNull = True
    end
    object DataSetReestrTIN: TFIBStringField
      FieldName = 'TIN'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetReestrTN: TFIBIntegerField
      FieldName = 'TN'
    end
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 72
    Top = 112
  end
  object FormStorage1: TFormStorage
    Active = False
    UseRegistry = True
    StoredProps.Strings = (
      'TextEditName.Text')
    StoredValues = <>
    Left = 321
    Top = 16
  end
  object ReportReestr: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38391.444342870400000000
    ReportOptions.LastChange = 40897.658213159720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'begin'
      ''
      'end.')
    Left = 128
    Top = 8
    Datasets = <
      item
        DataSet = DBDatasetReestr
        DataSetName = 'DatasetReestr'
      end>
    Variables = <
      item
        Name = 'OS_SCH'
        Value = #39#1059#1089#1110' '#1086#1089#1085#1086#1074#1085#1110' '#1088#1072#1093#1091#1085#1082#1080#39
      end
      item
        Name = 'KOR_SCH'
        Value = #39#1041#1077#1079' '#1086#1073#1084#1077#1078#1077#1085#1085#1103' '#1085#1072' '#1082#1086#1088#1077#1089#1087#1086#1085#1076#1091#1102#1095#1110' '#1088#1072#1093#1091#1085#1082#1080#39
      end
      item
        Name = 'DATE_BEGIN'
        Value = #39'06.05.2011'#39
      end
      item
        Name = 'DATE_END'
        Value = #39'23.05.2011'#39
      end
      item
        Name = 'SUMMA'
        Value = #39#1041#1077#1079' '#1086#1073#1084#1077#1078#1077#1085#1085#1103' '#1085#1072' '#1057#1059#1052#1059' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#39
      end
      item
        Name = 'FIO'
        Value = #39#1041#1077#1079' '#1086#1073#1084#1077#1078#1077#1085#1085#1103' '#1085#1072' '#1055#1030#1041#39
      end
      item
        Name = 'NOTE'
        Value = #39#1041#1077#1079' '#1086#1073#1084#1077#1078#1077#1085#1085#1103' '#1085#1072' '#1055#1030#1044#1057#1058#1040#1042#1059#39
      end
      item
        Name = 'RRR'
        Value = #39#1044#1045#1041#1045#1058#1054#1042#1030' '#1090#1072' '#1050#1056#1045#1044#1048#1058#1054#1042#1030' '#1076#1086#1082#1091#1084#1077#1085#1090#1080#39
      end
      item
        Name = 'not'
        Value = #39#1047#1072' '#1090#1072#1082#1080#1093' '#1091#1084#1086#1074' '#1092#1110#1083#1100#1090#1088#1072#1094#1110#1111' '#1044#1040#1053#1048#1061' '#1053#1045#1052#1040#1028#39
      end
      item
        Name = 'pr'
        Value = '1'
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 6.000000000000000000
      RightMargin = 6.000000000000000000
      TopMargin = 4.000000000000000000
      BottomMargin = 4.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 138.141620000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 748.346940000000000000
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 37.905380000000000000
          Top = 28.881880000000000000
          Width = 681.512060000000000000
          Height = 24.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1045#1028#1057#1058#1056' '#1040#1042#1040#1053#1057#1054#1042#1048#1061' '#1047#1042#1030#1058#1030#1042)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 37.795300000000000000
          Top = 52.913420000000000000
          Width = 681.512060000000000000
          Height = 24.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '([name_report])')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 37.795300000000000000
          Top = 75.590599999999990000
          Width = 681.512060000000000000
          Height = 24.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079' [date_beg]'#1088'. '#1076#1086' [date_end]'#1088'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000001000
          Width = 506.457020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[DatasetReestr."NAME_PRED"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 21.794990000000000000
        ParentFont = False
        Top = 313.700990000000000000
        Width = 748.346940000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = DBDatasetReestr
        DataSetName = 'DatasetReestr'
        RowCount = 0
        Stretched = True
        object Memo4: TfrxMemoView
          Left = 572.425172440000000000
          Width = 175.370130000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DatasetReestr."SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 126.992128420000000000
          Width = 100.535433070000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DatasetReestr."DATE_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 229.417325270000000000
          Width = 341.291338580000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DatasetReestr."FIO_DOC"] ('#1090#1072#1073' '#8470' [DatasetReestr."TN"])')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Width = 122.708720000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DatasetReestr."NUM_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 71.401360000000000000
        ParentFont = False
        Top = 181.417440000000000000
        Width = 748.346940000000000000
        object Memo22: TfrxMemoView
          Left = 572.425170000000000000
          Top = 32.503710000000010000
          Width = 175.370130000000000000
          Height = 38.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072', '#1075#1088#1085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 126.992125980000000000
          Top = 51.401360000000010000
          Width = 100.535433070000000000
          Height = 20.000000000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1086#1082'-'#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 229.417322830000000000
          Top = 32.503710000000010000
          Width = 341.291338580000000000
          Height = 38.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1041'. ('#1090#1072#1073'. '#1085#1086#1084#1077#1088')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 3.779530000000000000
          Top = 32.503710000000010000
          Width = 224.283550000000000000
          Height = 20.000000000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1040#1074#1072#1085#1089#1086#1074#1080#1081' '#1079#1074#1110#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 3.779527560000000000
          Top = 51.401360000000010000
          Width = 122.708720000000000000
          Height = 20.000000000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 565.307050000000000000
          Top = 2.165120000000002000
          Width = 178.488250000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1086#1088'. [PAGE#] '#1079' [TotalPages#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 72.913420000000000000
        ParentFont = False
        Top = 396.850650000000000000
        Width = 748.346940000000000000
        object Memo30: TfrxMemoView
          Left = 3.779530000000000000
          Width = 568.252010000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1079#1072' '#1088#1077#1108#1089#1090#1088#1086#1084' : ')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 572.031540000000000000
          Width = 175.590600000000000000
          Height = 20.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<DatasetReestr."SUMMA">,MasterData1)]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 7.559060000000000000
          Top = 49.133890000000010000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1055#1088#1086#1074#1110#1076#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 158.740260000000000000
          Top = 49.133890000000010000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 325.039580000000000000
          Top = 49.133890000000010000
          Width = 419.527830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[fio]')
          ParentFont = False
        end
      end
    end
  end
  object DBDatasetReestr: TfrxDBDataset
    UserName = 'DatasetReestr'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NAME_PRED=NAME_PRED'
      'DATE_DOC=DATE_DOC'
      'NUM_DOC=NUM_DOC'
      'SUMMA=SUMMA'
      'FIO_DOC=FIO_DOC'
      'TIN=TIN'
      'TN=TN')
    DataSet = DataSetReestr
    Left = 168
    Top = 8
  end
end
