object Print_DM: TPrint_DM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 262
  Top = 110
  Height = 220
  Width = 629
  object DataBase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'lc_ctype=win1251'
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 64
    Top = 24
  end
  object DSetSetup: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    SHORT_NAME,'
      '    HEADER_POST,'
      '    GLBUHG_POST_SHORT'
      'FROM'
      '    Z_SETUP')
    Left = 160
    Top = 24
    poSQLINT64ToBCD = True
  end
  object DSetGrSheet: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      '    UV_PRINT_SHEETONE'
      '    ('
      '    3,2'
      '    ) ')
    Left = 16
    Top = 112
    poSQLINT64ToBCD = True
  end
  object DSourceGrSheet: TDataSource
    DataSet = DSetGrSheet
    Left = 120
    Top = 112
  end
  object DSetSheet: TpFIBDataSet
    Database = DataBase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      '    UV_PRINT_SHEETONE_DATA'
      '    ('
      '    ?ID_GRSHEET'
      '    ) ')
    DataSource = DSourceGrSheet
    Left = 200
    Top = 112
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 288
    Top = 112
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbPageSetup, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38376.450218854200000000
    ReportOptions.LastChange = 40541.472734363400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      ''
      'end.')
    OnGetValue = frxReportGetValue
    OnAfterPrintReport = frxReportAfterPrintReport
    OnStartReport = 'frxReportOnStartReport'
    OnStopReport = 'frxReportOnStopReport'
    Left = 424
    Top = 8
    Datasets = <
      item
        DataSet = frxDBDSetSetup
        DataSetName = 'frxDBDSetSetup'
      end
      item
        DataSet = frxDBDSetSheet
        DataSetName = 'frxDBDSetSheet'
      end
      item
        DataSet = frxDBDSetGrSheet
        DataSetName = 'frxDBDSetGrSheet'
      end>
    Variables = <
      item
        Name = 'RFromMonth'
        Value = #39#1075#1088#1091#1076#1077#1085#1100' 2010 '#1088'.'#39
      end
      item
        Name = 'NumPredpr'
        Value = '2'
      end
      item
        Name = 'RDateBeg'
        Value = #39'29.12.2010'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 20.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = []
        Height = 192.756030000000000000
        ParentFont = False
        Top = 294.803340000000000000
        Width = 642.520100000000000000
        DataSet = frxDBDSetSheet
        DataSetName = 'frxDBDSetSheet'
        KeepChild = True
        RowCount = 0
        StartNewPage = True
      end
      object Footer1: TfrxFooter
        Height = 162.519790000000000000
        Top = 510.236550000000000000
        Width = 642.520100000000000000
        Stretched = True
        object Memo48: TfrxMemoView
          Left = 137.940260000000000000
          Top = 75.590600000000000000
          Width = 374.597910000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1042#1110#1076#1086#1084#1110#1089#1090#1100' '#1089#1082#1083#1072#1074)
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 136.063080000000000000
          Top = 124.724490000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1042#1110#1076#1086#1084#1110#1089#1090#1100' '#1087#1077#1088#1077#1074#1110#1088#1080#1074)
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 287.244280000000000000
          Top = 98.267779999999900000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089', '#1087#1088#1110#1079#1074#1080#1097#1077', '#1110#1085#1110#1094#1110#1072#1083#1080')')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 306.141930000000000000
          Top = 143.622140000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089', '#1087#1088#1110#1079#1074#1080#1097#1077', '#1110#1085#1110#1094#1110#1072#1083#1080')')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Width = 393.071120000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1091#1089#1100#1086#1075#1086' '#1087#1086' '#1089#1090#1086#1088'.:')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 393.071120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Top = 18.897650000000000000
          Width = 393.071120000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1056#1072#1079#1086#1084':')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 393.071120000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 472.441250000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
        end
        object Memo69: TfrxMemoView
          Left = 472.441250000000000000
          Top = 18.897650000000100000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        Height = 139.842610000000000000
        ParentFont = False
        Top = 94.488250000000000000
        Visible = False
        Width = 642.520100000000000000
        Stretched = True
        object Memo59: TfrxMemoView
          Left = 170.078850000000000000
          Top = 41.574830000000000000
          Width = 120.944960000000000000
          Height = 45.354360000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103', '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110)
        end
        object Memo60: TfrxMemoView
          Top = 41.574830000000000000
          Width = 37.795300000000000000
          Height = 45.354360000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1088#1103#1076#1082#1086#1074#1080#1081' '#8470' ('#1090#1072#1073#1077#1083#1100#1085#1080#1081')')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 37.795300000000000000
          Top = 41.574830000000000000
          Width = 71.811070000000000000
          Height = 45.354360000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1094#1077#1093#1091' ('#1074#1099#1076#1076#1099#1083#1091')')
        end
        object Memo62: TfrxMemoView
          Left = 393.071120000000000000
          Top = 41.574830000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
        end
        object Memo63: TfrxMemoView
          Left = 472.441250000000000000
          Top = 41.574830000000000000
          Width = 86.929190000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1087#1080#1089' '#1087#1088#1086' '#1086#1076#1077#1088#1078#1072#1085#1085#1103)
        end
        object Memo64: TfrxMemoView
          Left = 559.370440000000000000
          Top = 41.574830000000000000
          Width = 83.149660000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1084#1110#1090#1082#1080)
        end
        object Memo65: TfrxMemoView
          Left = 548.031850000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1089#1090#1086#1088#1110#1085#1082#1072' [Page#]')
        end
        object Memo79: TfrxMemoView
          Top = 86.929190000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 37.795300000000000000
          Top = 86.929190000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 109.606370000000000000
          Top = 86.929190000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3')
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 170.078850000000000000
          Top = 86.929190000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Left = 264.567100000000000000
          Top = 86.929190000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '5')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 351.496290000000000000
          Top = 86.929190000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '6')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 109.606370000000000000
          Top = 41.574830000000000000
          Width = 60.472480000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1086#1084#1077#1088' '#1087#1083#1072#1090#1110#1078#1085#1086#1111' '#1074#1110#1076#1086#1084#1086#1089#1090#1110' ')
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 733.228820000000000000
        Width = 642.520100000000000000
        PrintOnFirstPage = False
        PrintOnLastPage = False
        object Memo66: TfrxMemoView
          Width = 393.071120000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1091#1089#1100#1086#1075#1086' '#1087#1086' '#1089#1090#1086#1088'.:')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 472.441250000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
        end
        object Memo68: TfrxMemoView
          Left = 393.071120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 52.913420000000000000
        Top = 18.897650000000000000
        Width = 642.520100000000000000
        object Memo2: TfrxMemoView
          Left = 18.897650000000000000
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AllowHTMLTags = True
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1090#1072#1074#1085#1080#1081' '#1072#1088#1082#1091#1096' '#1076#1086' '#1076#1086#1076#1072#1090#1082#1072' '#8470'  [RFromMonth]')
        end
      end
    end
  end
  object frxDBDSetSetup: TfrxDBDataset
    UserName = 'frxDBDSetSetup'
    CloseDataSource = False
    DataSet = DSetSetup
    Left = 520
    Top = 8
  end
  object frxDBDSetGrSheet: TfrxDBDataset
    UserName = 'frxDBDSetGrSheet'
    CloseDataSource = False
    DataSet = DSetGrSheet
    Left = 424
    Top = 72
  end
  object frxDBDSetSheet: TfrxDBDataset
    UserName = 'frxDBDSetSheet'
    CloseDataSource = False
    DataSet = DSetSheet
    Left = 520
    Top = 72
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 328
    Top = 32
  end
  object frxXLSExport: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 240
    Top = 24
  end
end
