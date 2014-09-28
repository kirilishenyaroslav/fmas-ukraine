object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 679
  Top = 287
  Height = 675
  Width = 601
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 40
    Top = 43
  end
  object DSetCategoryGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 134
    poSQLINT64ToBCD = True
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.ConvertNulls = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 41304.474194155090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 168
    Top = 65535
    Datasets = <
      item
        DataSet = ReportDBDSetFoundationData
        DataSetName = 'ReportDBDSetFoundationData'
      end
      item
        DataSet = ReportDSetAdditionalData
        DataSetName = 'ReportDSetAdditionalData'
      end>
    Variables = <
      item
        Name = ' User Category'
        Value = Null
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 20.000000000000000000
      TopMargin = 20.000000000000000000
      BottomMargin = 20.000000000000000000
      LargeDesignHeight = True
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 925.984850000000000000
        ParentFont = False
        Top = 98.267780000000000000
        Width = 642.520100000000000000
        DataSet = ReportDBDSetFoundationData
        DataSetName = 'ReportDBDSetFoundationData'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 30.236240000000000000
          Top = 11.338590000000000000
          Width = 604.724800000000000000
          Height = 49.133890000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDBDSetFoundationData
          DataSetName = 'ReportDBDSetFoundationData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            
              #1047#1074#1110#1090' '#1079#1072' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084#1080' '#1108#1076#1080#1085#1086#1075#1086' '#1089#1086#1094#1110#1072#1083#1100#1085#1086#1075#1086' '#1074#1085#1077#1089#1082#1091' '#1079#1072'  [PKOD_SETUP' +
              ']'
            
              '[ReportDBDSetFoundationData."SCH_NUMBER"] - [ReportDBDSetFoundat' +
              'ionData."SCH_NAME"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 64.252010000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1085#1072#1088#1072#1093#1086#1074#1072#1085#1086'  ')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 83.149660000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1055#1077#1088#1077#1074#1080#1097#1077#1085#1085#1103'     ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 234.330860000000000000
          Top = 64.252010000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."SUMMA_ALL"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 234.330860000000000000
          Top = 83.149660000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."SUMMA_OVER"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 102.047310000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1053#1077' '#1086#1087#1086#1076#1072#1090#1082#1086#1074#1091#1108#1090#1100#1089#1103)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 234.330860000000000000
          Top = 102.047310000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."SUMMA_NOT_TAXATION"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Top = 139.842610000000000000
          Width = 234.330860000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1041#1072#1079#1072' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '
            #1077#1076#1080#1085#1086#1075#1086' '#1089#1086#1094#1110#1072#1083#1100#1085#1086#1075#1086' '#1074#1085#1077#1089#1082#1091' ('#1028#1057#1042')')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 234.330860000000000000
          Top = 139.842610000000000000
          Width = 222.992270000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."SUMMA_P3"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo10: TfrxMemoView
          Top = 120.944960000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1110#1076#39#1108#1084#1085#1072' '#1089#1091#1084#1072)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 234.330860000000000000
          Top = 120.944960000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."SUMMA_P3_SUB_ZERO"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 196.535560000000000000
          Width = 642.520100000000000000
          Frame.Typ = [ftTop]
        end
        object Memo12: TfrxMemoView
          Top = 207.874150000000000000
          Width = 113.385900000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 113.385900000000000000
          Top = 207.874150000000000000
          Width = 98.267780000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086)
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 211.653680000000000000
          Top = 207.874150000000000000
          Width = 86.929190000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1089#1086#1090#1086#1082' '
            #1091#1090#1088#1080#1084#1072#1085#1086#1075#1086' '#1028#1057#1042)
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 298.582870000000000000
          Top = 207.874150000000000000
          Width = 105.826840000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072' '#1091#1090#1088#1080#1084#1072#1085#1086#1075#1086' '#1028#1057#1042)
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 404.409710000000000000
          Top = 207.874150000000000000
          Width = 120.944960000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1089#1086#1090#1086#1082' '
            #1085#1072#1088#1072#1093#1086#1074#1072#1085#1086#1075#1086' '#1028#1057#1042)
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 525.354670000000000000
          Top = 207.874150000000000000
          Width = 120.944960000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072' '#1085#1072#1088#1072#1093#1086#1074#1072#1085#1086#1075#1086' '#1028#1057#1042)
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Top = 253.228510000000000000
          Width = 113.385900000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1088#1086#1073#1110#1090#1085#1072' '#1087#1083#1072#1090#1072)
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 113.385900000000000000
          Top = 253.228510000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT"]')
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 113.385900000000000000
          Top = 272.126160000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."SUMMA_P3_UCH_ST"]')
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 211.653680000000000000
          Top = 253.228510000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."PERCENT_SOC_SINGLE"]%')
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 211.653680000000000000
          Top = 272.126160000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."PERCENT_SOC_SCIENCE"]%')
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 298.582870000000000000
          Top = 253.228510000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT">*<ReportDSetA' +
              'dditionalData."PERCENT_SOC_SINGLE">/100]')
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 298.582870000000000000
          Top = 272.126160000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST">*<ReportDSetAddit' +
              'ionalData."PERCENT_SOC_SCIENCE">/100]')
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 404.409710000000000000
          Top = 253.228510000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."ESN_R"]%')
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 404.409710000000000000
          Top = 272.126160000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."ESN_R"]%')
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 525.354670000000000000
          Top = 253.228510000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT">*<ReportDSetA' +
              'dditionalData."ESN_R">/100]')
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 525.354670000000000000
          Top = 272.126160000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST">*<ReportDSetAddit' +
              'ionalData."ESN_R">/100]')
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Top = 291.023810000000000000
          Width = 113.385900000000000000
          Height = 49.133890000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1088#1086#1073#1110#1090#1085#1072' '#1087#1083#1072#1090#1072' '
            '('#1087#1088#1072#1094#1102#1102#1095#1110' '#1110#1085#1074#1072#1083#1110#1076#1080')')
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 113.385900000000000000
          Top = 291.023810000000000000
          Width = 98.267780000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT_INV"]')
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 113.385900000000000000
          Top = 313.700990000000000000
          Width = 98.267780000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_INV"]')
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 211.653680000000000000
          Top = 291.023810000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."PERCENT_SOC_SINGLE"]%')
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 298.582870000000000000
          Top = 291.023810000000000000
          Width = 105.826840000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT_INV">*<ReportD' +
              'SetAdditionalData."PERCENT_SOC_SINGLE">/100]')
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 404.409710000000000000
          Top = 291.023810000000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."ESN_INV"]%')
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 525.354670000000000000
          Top = 291.023810000000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT_INV">*<ReportD' +
              'SetAdditionalData."ESN_INV">/100]')
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 211.653680000000000000
          Top = 313.700990000000000000
          Width = 86.929190000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."PERCENT_SOC_SCIENCE"]%')
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 298.582870000000000000
          Top = 313.700990000000000000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_INV">*<ReportDSetA' +
              'dditionalData."PERCENT_SOC_SCIENCE">/100')
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 404.409710000000000000
          Top = 313.700990000000000000
          Width = 120.944960000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."ESN_INV"]%')
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 525.354670000000000000
          Top = 313.700990000000000000
          Width = 120.944960000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_INV">*<ReportDSetA' +
              'dditionalData."ESN_INV">/100]')
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Top = 340.157700000000000000
          Width = 113.385900000000000000
          Height = 37.795275590000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1080#1089#1090#1080' '#1090#1080#1084#1095#1072#1089#1086#1074#1086#1111' '#1085#1077#1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1086#1089#1090#1110)
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 113.385900000000000000
          Top = 340.157700000000000000
          Width = 98.267780000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."SUMMA_P6_INV_NOT"]')
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 211.653680000000000000
          Top = 340.157700000000000000
          Width = 86.929190000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."PERCENT_DFSS_SINGLE"]%')
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 298.582870000000000000
          Top = 340.157700000000000000
          Width = 105.826840000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P6_INV_NOT">*<ReportDSetAddi' +
              'tionalData."PERCENT_DFSS_SINGLE">/100]')
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 404.409710000000000000
          Top = 340.157700000000000000
          Width = 120.944960000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."ESN_LL"]%')
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 525.354670000000000000
          Top = 340.157700000000000000
          Width = 120.944960000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P6_INV_NOT">*<ReportDSetAddi' +
              'tionalData."ESN_LL">/100]')
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Top = 377.953000000000000000
          Width = 113.385900000000000000
          Height = 71.811070000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1080#1089#1090#1080' '#1090#1080#1084#1095#1072#1089#1086#1074#1086#1111' '#1085#1077#1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1086#1089#1090#1110
            '('#1087#1088#1072#1094#1102#1102#1095#1110' '#1110#1085#1074#1072#1083#1110#1076#1080')')
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 113.385900000000000000
          Top = 377.953000000000000000
          Width = 98.267780000000000000
          Height = 71.811070000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."SUMMA_P6_INV"]')
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 211.653680000000000000
          Top = 377.953000000000000000
          Width = 86.929190000000000000
          Height = 71.811070000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."PERCENT_DFSS_SINGLE"]%')
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 298.582870000000000000
          Top = 377.953000000000000000
          Width = 105.826840000000000000
          Height = 71.811070000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P6_INV">*<ReportDSetAddition' +
              'alData."PERCENT_DFSS_SINGLE">/100]')
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 404.409710000000000000
          Top = 377.953000000000000000
          Width = 120.944960000000000000
          Height = 71.811070000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."ESN_INV"]%')
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 525.354670000000000000
          Top = 377.953000000000000000
          Width = 120.944960000000000000
          Height = 71.811070000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P6_INV">*<ReportDSetAddition' +
              'alData."ESN_INV">/100]')
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Top = 449.764070000000000000
          Width = 113.385900000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1075#1086#1074#1086#1075#1072' '#1043#1055#1061)
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 113.385900000000000000
          Top = 449.764070000000000000
          Width = 98.267780000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."SUMMA_P3_DOG_PIDRYD"]')
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 211.653680000000000000
          Top = 449.764070000000000000
          Width = 86.929190000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."PERCENT_SINGLE_GR_PR_DOG"]%')
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 298.582870000000000000
          Top = 449.764070000000000000
          Width = 105.826840000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_DOG_PIDRYD">*<ReportDSetA' +
              'dditionalData."PERCENT_SINGLE_GR_PR_DOG">/100]')
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 404.409710000000000000
          Top = 449.764070000000000000
          Width = 120.944960000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."ESN_DP"]%')
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 525.354670000000000000
          Top = 449.764070000000000000
          Width = 120.944960000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_DOG_PIDRYD">*<ReportDSetA' +
              'dditionalData."ESN_DP">/100]')
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Top = 487.559370000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1056#1072#1079#1086#1084)
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 113.385900000000000000
          Top = 487.559370000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST">+<ReportDBDSetFou' +
              'ndationData."SUMMA_P3_UCH_ST_NOT">+<ReportDBDSetFoundationData."' +
              'SUMMA_P3_UCH_ST_INV">+<ReportDBDSetFoundationData."SUMMA_P3_UCH_' +
              'ST_NOT_INV">+<ReportDBDSetFoundationData."SUMMA_P6_INV">+<Report' +
              'DBDSetFoundationData."SUMMA_P6_INV_NOT">+<ReportDBDSetFoundation' +
              'Data."SUMMA_P3_DOG_PIDRYD">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 211.653680000000000000
          Top = 487.559370000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 404.409710000000000000
          Top = 487.559370000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 536.693260000000000000
          Width = 642.520100000000000000
          Frame.Typ = [ftTop]
        end
        object Memo62: TfrxMemoView
          Left = 3.779530000000000000
          Top = 559.370440000000000000
          Width = 136.062992130000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 139.842610000000000000
          Top = 559.370440000000000000
          Width = 94.488250000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086)
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 234.330860000000000000
          Top = 559.370440000000000000
          Width = 105.826840000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1089#1086#1090#1086#1082' '
            #1091#1090#1088#1080#1084#1072#1085#1086#1075#1086' '#1028#1057#1042)
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 340.157700000000000000
          Top = 559.370440000000000000
          Width = 105.826840000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072' '#1091#1090#1088#1080#1084#1072#1085#1086#1075#1086' '#1028#1057#1042)
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 3.779530000000000000
          Top = 597.165740000000000000
          Width = 136.062992130000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1088#1086#1073#1110#1090#1085#1072' '#1087#1083#1072#1090#1072)
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 3.779530000000000000
          Top = 634.961040000000000000
          Width = 136.062992130000000000
          Height = 37.795275590000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1080#1089#1090#1080' '#1090#1080#1084#1095#1072#1089#1086#1074#1086#1111' '#1085#1077#1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1086#1089#1090#1110)
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 3.779530000000000000
          Top = 672.756340000000000000
          Width = 136.062992130000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1075#1086#1074#1086#1075#1072' '#1043#1055#1061)
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 234.330860000000000000
          Top = 597.165740000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."PERCENT_SOC_SINGLE"]%')
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 234.330860000000000000
          Top = 616.063390000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."PERCENT_SOC_SCIENCE"]%')
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 139.842610000000000000
          Top = 634.961040000000000000
          Width = 94.488250000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."SUMMA_P6"]')
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 234.330860000000000000
          Top = 634.961040000000000000
          Width = 105.826840000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."PERCENT_DFSS_SINGLE"]%')
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 139.842610000000000000
          Top = 672.756340000000000000
          Width = 94.488250000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."SUMMA_P3_DOG_PIDRYD"]')
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 234.330860000000000000
          Top = 672.756340000000000000
          Width = 105.826840000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."PERCENT_SINGLE_GR_PR_DOG"]%')
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 3.779530000000000000
          Top = 710.551640000000000000
          Width = 136.062992130000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1056#1072#1079#1086#1084)
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 234.330860000000000000
          Top = 710.551640000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 3.779530000000000000
          Top = 755.906000000000000000
          Width = 136.063080000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 139.842610000000000000
          Top = 755.906000000000000000
          Width = 94.488250000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086)
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 234.330860000000000000
          Top = 755.906000000000000000
          Width = 105.826840000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1089#1086#1090#1086#1082' '
            #1091#1090#1088#1080#1084#1072#1085#1086#1075#1086' '#1028#1057#1042)
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 340.157700000000000000
          Top = 755.906000000000000000
          Width = 105.826840000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072' '#1091#1090#1088#1080#1084#1072#1085#1086#1075#1086' '#1028#1057#1042)
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 3.779530000000000000
          Top = 793.701300000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1088#1086#1073#1110#1090#1085#1072' '#1087#1083#1072#1090#1072)
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 3.779530000000000000
          Top = 831.496600000000000000
          Width = 136.063080000000000000
          Height = 37.795275590000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1080#1089#1090#1080' '#1090#1080#1084#1095#1072#1089#1086#1074#1086#1111' '#1085#1077#1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1086#1089#1090#1110)
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 234.330860000000000000
          Top = 793.701300000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."ESN_R"]%')
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 234.330860000000000000
          Top = 812.598950000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."ESN_INV"]%')
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 139.842610000000000000
          Top = 831.496600000000000000
          Width = 94.488250000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."SUMMA_P6_INV_NOT"]')
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 234.330860000000000000
          Top = 831.496600000000000000
          Width = 105.826840000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."ESN_LL"]%')
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 3.779530000000000000
          Top = 907.087200000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1056#1072#1079#1086#1084)
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          Left = 234.330860000000000000
          Top = 907.087200000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          Left = 3.779530000000000000
          Top = 869.291900000000000000
          Width = 136.062992130000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1075#1086#1074#1086#1075#1072' '#1043#1055#1061)
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 139.842610000000000000
          Top = 869.291900000000000000
          Width = 94.488250000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."SUMMA_P3_DOG_PIDRYD"]')
          VAlign = vaCenter
        end
        object Memo91: TfrxMemoView
          Left = 234.330860000000000000
          Top = 869.291900000000000000
          Width = 105.826840000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetAdditionalData."ESN_DP"]%')
          VAlign = vaCenter
        end
        object Memo92: TfrxMemoView
          Left = 3.779530000000000000
          Top = 812.598950000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1072#1094#1102#1102#1095#1110' '#1110#1085#1074#1072#1083#1110#1076#1080)
        end
        object Memo93: TfrxMemoView
          Left = 298.582870000000000000
          Top = 487.559370000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT">*<ReportDSetA' +
              'dditionalData."PERCENT_SOC_SINGLE">/100+<ReportDBDSetFoundationD' +
              'ata."SUMMA_P3_UCH_ST">*<ReportDSetAdditionalData."PERCENT_SOC_SC' +
              'IENCE">/100+<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT_INV' +
              '">*<ReportDSetAdditionalData."PERCENT_SOC_SINGLE">/100+<ReportDB' +
              'DSetFoundationData."SUMMA_P3_UCH_ST_INV">/100+<ReportDBDSetFound' +
              'ationData."SUMMA_P6_INV_NOT">*<ReportDSetAdditionalData."PERCENT' +
              '_DFSS_SINGLE">/100+<ReportDBDSetFoundationData."SUMMA_P6_INV">*<' +
              'ReportDSetAdditionalData."PERCENT_SOC_SCIENCE">/100+<ReportDBDSe' +
              'tFoundationData."SUMMA_P3_DOG_PIDRYD">*<ReportDSetAdditionalData' +
              '."PERCENT_SINGLE_GR_PR_DOG">/100]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 525.354670000000000000
          Top = 487.559370000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT">*<ReportDSetA' +
              'dditionalData."ESN_R">/100+<ReportDBDSetFoundationData."SUMMA_P3' +
              '_UCH_ST">*<ReportDSetAdditionalData."ESN_R">/100+<ReportDBDSetFo' +
              'undationData."SUMMA_P3_UCH_ST_NOT_INV">*<ReportDSetAdditionalDat' +
              'a."ESN_INV">/100+<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_IN' +
              'V">*<ReportDSetAdditionalData."ESN_INV">/100+<ReportDBDSetFounda' +
              'tionData."SUMMA_P6_INV_NOT">*<ReportDSetAdditionalData."ESN_LL">' +
              '/100+<ReportDBDSetFoundationData."SUMMA_P6_INV">*<ReportDSetAddi' +
              'tionalData."ESN_INV">/100+<ReportDBDSetFoundationData."SUMMA_P3_' +
              'DOG_PIDRYD">*<ReportDSetAdditionalData."ESN_DP">/100]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 139.842610000000000000
          Top = 597.165740000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT">+<ReportDBDSe' +
              'tFoundationData."SUMMA_P3_UCH_ST_NOT_INV">]')
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Left = 139.842610000000000000
          Top = 616.063390000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST">+<ReportDBDSetFou' +
              'ndationData."SUMMA_P3_UCH_ST_INV">]')
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 139.842610000000000000
          Top = 710.551640000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT">+<ReportDBDSe' +
              'tFoundationData."SUMMA_P3_UCH_ST_NOT_INV">+<ReportDBDSetFoundati' +
              'onData."SUMMA_P3_UCH_ST">+<ReportDBDSetFoundationData."SUMMA_P3_' +
              'UCH_ST_INV">+<ReportDBDSetFoundationData."SUMMA_P6">+<ReportDBDS' +
              'etFoundationData."SUMMA_P3_DOG_PIDRYD">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 340.157700000000000000
          Top = 597.165740000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[(<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT">+<ReportDBDS' +
              'etFoundationData."SUMMA_P3_UCH_ST_NOT_INV">)*<ReportDSetAddition' +
              'alData."PERCENT_SOC_SINGLE">/100]')
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 340.157700000000000000
          Top = 616.063390000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[(<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST">+<ReportDBDSetFo' +
              'undationData."SUMMA_P3_UCH_ST_INV">)*<ReportDSetAdditionalData."' +
              'PERCENT_SOC_SCIENCE">/100]')
          VAlign = vaCenter
        end
        object Memo100: TfrxMemoView
          Left = 340.157700000000000000
          Top = 634.961040000000000000
          Width = 105.826840000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P6">*<ReportDSetAdditionalDa' +
              'ta."PERCENT_DFSS_SINGLE">/100]')
          VAlign = vaCenter
        end
        object Memo101: TfrxMemoView
          Left = 340.157700000000000000
          Top = 672.756340000000000000
          Width = 105.826840000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_DOG_PIDRYD">*<ReportDSetA' +
              'dditionalData."PERCENT_SINGLE_GR_PR_DOG">/100]')
          VAlign = vaCenter
        end
        object Memo102: TfrxMemoView
          Left = 340.157700000000000000
          Top = 710.551640000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[(<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT">+<ReportDBDS' +
              'etFoundationData."SUMMA_P3_UCH_ST_NOT_INV">)*<ReportDSetAddition' +
              'alData."PERCENT_SOC_SINGLE">/100+(<ReportDBDSetFoundationData."S' +
              'UMMA_P3_UCH_ST">+<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_IN' +
              'V">)*<ReportDSetAdditionalData."PERCENT_SOC_SCIENCE">/100+<Repor' +
              'tDBDSetFoundationData."SUMMA_P6">*<ReportDSetAdditionalData."PER' +
              'CENT_DFSS_SINGLE">/100+<ReportDBDSetFoundationData."SUMMA_P3_DOG' +
              '_PIDRYD">*<ReportDSetAdditionalData."PERCENT_SINGLE_GR_PR_DOG">/' +
              '100]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo103: TfrxMemoView
          Left = 139.842610000000000000
          Top = 793.701300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT">+<ReportDBDSe' +
              'tFoundationData."SUMMA_P3_UCH_ST">]')
          VAlign = vaCenter
        end
        object Memo104: TfrxMemoView
          Left = 139.842610000000000000
          Top = 812.598950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT_INV">+<ReportD' +
              'BDSetFoundationData."SUMMA_P3_UCH_ST_INV">+<ReportDBDSetFoundati' +
              'onData."SUMMA_P6_INV">]')
          VAlign = vaCenter
        end
        object Memo105: TfrxMemoView
          Left = 340.157700000000000000
          Top = 793.701300000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[(<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT">+<ReportDBDS' +
              'etFoundationData."SUMMA_P3_UCH_ST">)*<ReportDSetAdditionalData."' +
              'ESN_R">/100]')
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          Left = 340.157700000000000000
          Top = 812.598950000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[(<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT_INV">+<Report' +
              'DBDSetFoundationData."SUMMA_P3_UCH_ST_INV">+<ReportDBDSetFoundat' +
              'ionData."SUMMA_P6_INV">)*<ReportDSetAdditionalData."ESN_INV">/10' +
              '0]')
          VAlign = vaCenter
        end
        object Memo107: TfrxMemoView
          Left = 340.157700000000000000
          Top = 831.496600000000000000
          Width = 105.826840000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P6_INV_NOT">*<ReportDSetAddi' +
              'tionalData."ESN_LL">/100]')
          VAlign = vaCenter
        end
        object Memo108: TfrxMemoView
          Left = 340.157700000000000000
          Top = 869.291900000000000000
          Width = 105.826840000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_DOG_PIDRYD">*<ReportDSetA' +
              'dditionalData."ESN_DP">/100]')
          VAlign = vaCenter
        end
        object Memo109: TfrxMemoView
          Left = 139.842610000000000000
          Top = 907.087200000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT">+<ReportDBDSe' +
              'tFoundationData."SUMMA_P3_UCH_ST">+<ReportDBDSetFoundationData."' +
              'SUMMA_P3_UCH_ST_NOT_INV">+<ReportDBDSetFoundationData."SUMMA_P3_' +
              'UCH_ST_INV">+<ReportDBDSetFoundationData."SUMMA_P6_INV_NOT">+<Re' +
              'portDBDSetFoundationData."SUMMA_P3_DOG_PIDRYD">+<ReportDBDSetFou' +
              'ndationData."SUMMA_P6_INV">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 340.157700000000000000
          Top = 907.087200000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[(<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT">+<ReportDBDS' +
              'etFoundationData."SUMMA_P3_UCH_ST">)*<ReportDSetAdditionalData."' +
              'ESN_R">/100+(<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_NOT_IN' +
              'V">+<ReportDBDSetFoundationData."SUMMA_P3_UCH_ST_INV">+<ReportDB' +
              'DSetFoundationData."SUMMA_P6_INV">)*<ReportDSetAdditionalData."E' +
              'SN_INV">/100+<ReportDBDSetFoundationData."SUMMA_P6_INV_NOT">*<Re' +
              'portDSetAdditionalData."ESN_LL">/100+<ReportDBDSetFoundationData' +
              '."SUMMA_P3_DOG_PIDRYD">*<ReportDSetAdditionalData."ESN_DP">/100]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 18.897650000000000000
        Top = 18.897650000000000000
        Width = 642.520100000000000000
        object Memo112: TfrxMemoView
          Width = 646.299630000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Date]  [Time]')
        end
      end
    end
  end
  object ReportDSetCategoryGroup: TfrxDBDataset
    UserName = 'ReportDSetCategoryGroup'
    CloseDataSource = False
    DataSet = DSetCategoryGroup
    Left = 168
    Top = 134
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 43
  end
  object DSetFoundationData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 41
    Top = 88
    poSQLINT64ToBCD = True
  end
  object ReportDBDSetFoundationData: TfrxDBDataset
    UserName = 'ReportDBDSetFoundationData'
    CloseDataSource = False
    DataSet = DSetFoundationData
    Left = 168
    Top = 89
  end
  object DSetPropPaymGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 180
    poSQLINT64ToBCD = True
  end
  object ReportDsetPropPaymGroup: TfrxDBDataset
    UserName = 'ReportDsetPropPaymGroup'
    CloseDataSource = False
    DataSet = DSetPropPaymGroup
    Left = 168
    Top = 180
  end
  object DSourceFoundationData: TDataSource
    DataSet = DSetFoundationData
    Left = 304
    Top = 88
  end
  object DSetUDGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 226
    poSQLINT64ToBCD = True
  end
  object ReportDSetUDGroup: TfrxDBDataset
    UserName = 'ReportDSetUDGroup'
    CloseDataSource = False
    DataSet = DSetUDGroup
    Left = 168
    Top = 226
  end
  object DSetNotPodNalGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 271
    poSQLINT64ToBCD = True
  end
  object ReportDSetNotPodNalGroup: TfrxDBDataset
    UserName = 'ReportDSetNotPodNalGroup'
    CloseDataSource = False
    DataSet = DSetNotPodNalGroup
    Left = 168
    Top = 271
  end
  object DsetGrSheet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 316
    poSQLINT64ToBCD = True
  end
  object ReportDsetGrSheet: TfrxDBDataset
    UserName = 'ReportDsetGrSheet'
    CloseDataSource = False
    DataSet = DsetGrSheet
    Left = 168
    Top = 316
  end
  object DsetDolg: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 361
    poSQLINT64ToBCD = True
  end
  object ReportDsetDolg: TfrxDBDataset
    UserName = 'ReportDsetDolg'
    CloseDataSource = False
    DataSet = DsetDolg
    Left = 168
    Top = 361
  end
  object ReportUserDSet: TfrxUserDataSet
    RangeEnd = reCount
    RangeEndCount = 1
    UserName = 'ReportUserDSet'
    Left = 304
    Top = 136
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 312
    Top = 216
  end
  object DSetShifr: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 416
    poSQLINT64ToBCD = True
  end
  object ReportDSetShifr: TfrxDBDataset
    UserName = 'ReportDSetShifr'
    CloseDataSource = False
    DataSet = DSetShifr
    Left = 168
    Top = 416
  end
  object frxUserDataSet: TfrxUserDataSet
    UserName = 'frxUserDataSet'
    Left = 450
    Top = 391
  end
  object DSetNar: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    BufferChunks = 100
    DataSource = DSourceFoundationData
    Left = 384
    Top = 326
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DsetUtr: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    BufferChunks = 100
    DataSource = DSourceFoundationData
    Left = 390
    Top = 421
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSetNp6: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    BufferChunks = 100
    DataSource = DSourceFoundationData
    Left = 40
    Top = 465
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDSetAdditionalData: TfrxDBDataset
    UserName = 'ReportDSetAdditionalData'
    CloseDataSource = False
    DataSet = DSetAdditionalData
    Left = 168
    Top = 512
  end
  object DSetAdditionalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 512
    poSQLINT64ToBCD = True
  end
end
