object SimpleDM: TSimpleDM
  OldCreateOrder = False
  Left = 645
  Height = 658
  Width = 408
  object SimpleDB: TpFIBDatabase
    DefaultTransaction = RTransaction
    DefaultUpdateTransaction = RTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
  end
  object RTransaction: TpFIBTransaction
    DefaultDatabase = SimpleDB
    TimeoutAction = TARollback
    Left = 40
    Top = 43
  end
  object SimpleReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.ConvertNulls = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 42031.706115648150000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = SimpleReportGetValue
    Left = 168
    Datasets = <
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
      end
      item
        DataSet = ReportDSetGlobalData
        DataSetName = 'ReportDsetGlobalData'
      end
      item
        DataSet = UserDSet
        DataSetName = 'UserDSet'
      end>
    Variables = <
      item
        Name = ' User Category'
        Value = Null
      end
      item
        Name = 'PPeriod'
        Value = #39#1063#1077#1088#1074#1077#1085#1100' 2010 '#1088'.'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 113.385900000000000000
        Width = 1046.929810000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        object Memo3: TfrxMemoView
          Left = 520.818897640000000000
          Width = 109.606299210000000000
          Height = 18.897650000000000000
          DataSet = UserDSet
          DataSetName = 'UserDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."SUMMA_FACT"]')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[LINE#]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 41.574830000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = UserDSet
          DataSetName = 'UserDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."TN"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 117.165430000000000000
          Width = 328.062992125984000000
          Height = 18.897650000000000000
          DataSet = UserDSet
          DataSetName = 'UserDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 445.228346460000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = UserDSet
          DataSetName = 'UserDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."PERIOD"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 740.031496060000000000
          Width = 109.606299210000000000
          Height = 18.897650000000000000
          DataSet = UserDSet
          DataSetName = 'UserDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."SUMMA_RAZN"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 630.425196850000000000
          Width = 109.606299210000000000
          Height = 18.897650000000000000
          DataSet = UserDSet
          DataSetName = 'UserDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."SUMMA_NAR"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 849.637795280000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          DataSet = UserDSet
          DataSetName = 'UserDSet'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALLDAY"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 947.905511810000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          DataSet = UserDSet
          DataSetName = 'UserDSet'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."FACT_DAY"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 70.811070000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 520.818897640000000000
          Top = 51.913420000000000000
          Width = 109.606299210000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1072#1082#1090#1080#1095'. '#1089#1091#1084#1072)
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Top = 51.913420000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1087#1087'.')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 41.574830000000000000
          Top = 51.913420000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1072#1073'. '#8470)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 117.165430000000000000
          Top = 51.913420000000000000
          Width = 328.062992130000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1110#1079#1074#1080#1097#1077', '#1030#1084#39#1103', '#1055#1086'-'#1073#1072#1090#1100#1082#1086#1074#1110)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Width = 1044.631640000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1056#1077#1108#1089#1090#1088': <b>"[ReportDsetGlobalData."NAME_VOPL_PROP"]"</b>')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 83.149660000000000000
          Top = 26.456710000000000000
          Width = 846.614720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[PPeriod]')
          ParentFont = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 929.764380000000000000
          Top = 26.456692913385830000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          HAlign = haRight
          Memo.Strings = (
            #1089#1090#1086#1088'. [PAGE#] ')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Top = 26.456710000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[Date]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 445.228346460000000000
          Top = 52.133890000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1077#1088#1110#1086#1076)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 849.637795280000000000
          Top = 51.779527560000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1072#1083'.'#1076#1085'.'#1091' '#1084#1110#1089'.')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 740.031496060000000000
          Top = 51.779527560000000000
          Width = 109.606299210000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1110#1079#1085#1080#1094#1103)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 947.905511810000000000
          Top = 51.779527560000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086)
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 630.425196850000000000
          Top = 51.779527560000000000
          Width = 109.606299210000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072' '#1076#1083#1103' '#1085#1072#1088'.')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 154.960730000000000000
        Width = 1046.929810000000000000
        object SysMemo3: TfrxSysMemoView
          Left = 520.818897640000000000
          Width = 109.606299210000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."SUMMA_FACT">,MasterData1)]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Width = 520.818897637795000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1047#1072#1075#1072#1083#1086#1084':')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 630.425196850000000000
          Width = 109.606299210000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."SUMMA_NAR">,MasterData1)]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 740.031496060000000000
          Width = 109.606299210000000000
          Height = 18.897650000000000000
          DataSet = UserDSet
          DataSetName = 'UserDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."SUMMA_RAZN">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object SimpleDesigner: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 43
  end
  object DSetData: TpFIBDataSet
    Database = SimpleDB
    Transaction = RTransaction
    Left = 40
    Top = 240
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    Left = 168
    Top = 241
  end
  object DSetGlobalData: TpFIBDataSet
    Database = SimpleDB
    Transaction = RTransaction
    Left = 40
    Top = 107
    poSQLINT64ToBCD = True
  end
  object ReportDSetGlobalData: TfrxDBDataset
    UserName = 'ReportDsetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 168
    Top = 108
  end
  object UserDSet: TfrxUserDataSet
    UserName = 'UserDSet'
    Left = 256
    Top = 8
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 328
    Top = 8
  end
  object DSetAddData: TpFIBDataSet
    Database = SimpleDB
    Transaction = RTransaction
    Left = 40
    Top = 176
    poSQLINT64ToBCD = True
  end
  object ReportDSetAddData: TfrxDBDataset
    UserName = 'ReportDSetAddData'
    CloseDataSource = False
    DataSet = DSetAddData
    Left = 168
    Top = 176
  end
  object DataSourceInput: TDataSource
    Left = 168
    Top = 294
  end
  object DSetInput: TRxMemoryData
    FieldDefs = <>
    ObjectView = True
    Left = 40
    Top = 294
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'DSetInput'
    CloseDataSource = False
    DataSource = DataSourceInput
    Left = 280
    Top = 294
  end
end
