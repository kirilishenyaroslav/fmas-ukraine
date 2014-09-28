object DM: TDM
  OldCreateOrder = False
  Left = 645
  Height = 658
  Width = 408
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
    ReportOptions.LastChange = 41298.558771550900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 168
    Datasets = <
      item
        DataSet = ReportDSetAdditionalData
        DataSetName = 'ReportDSetAdditionalData'
      end
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
      end>
    Variables = <
      item
        Name = ' User Category'
        Value = Null
      end
      item
        Name = 'PPeriod'
        Value = #39#1043#1088#1091#1076#1077#1085#1100' 2012 '#1088'.'#39
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
      OnBeforePrint = 'Page1OnBeforePrint'
      object Memo1: TfrxMemoView
        Align = baCenter
        Left = -37.795300000000000000
        Width = 718.110700000000000000
        Height = 19.377240000000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HAlign = haRight
        Memo.Strings = (
          #1056#1077#1108#1089#1090#1088' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1108#1076#1080#1085#1086#1075#1086' '#1089#1086#1094#1110#1072#1083#1100#1085#1086#1075#1086' '#1074#1085#1077#1089#1082#1091' '#1079#1072' [PPeriod]')
        ParentFont = False
      end
      object Memo2: TfrxMemoView
        Top = 75.590600000000000000
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
        Top = 94.488250000000000000
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
        Top = 75.590600000000000000
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
          '[ReportDsetData."SUMMA_ALL"]')
        ParentFont = False
      end
      object Memo5: TfrxMemoView
        Left = 234.330860000000000000
        Top = 94.488250000000000000
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
          '[ReportDsetData."SUMMA_OVER"]')
        ParentFont = False
      end
      object Memo6: TfrxMemoView
        Top = 113.385900000000000000
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
      object Memo8: TfrxMemoView
        Left = 234.330860000000000000
        Top = 113.385900000000000000
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
          '[ReportDsetData."SUMMA_NOT_TAXATION"]')
        ParentFont = False
      end
      object Memo10: TfrxMemoView
        Top = 151.181200000000000000
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
      object Memo12: TfrxMemoView
        Left = 234.330860000000000000
        Top = 151.181200000000000000
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
          '[ReportDsetData."SUMMA_P3"]')
        ParentFont = False
        VAlign = vaBottom
      end
      object Line1: TfrxLineView
        Top = 211.653680000000000000
        Width = 642.520100000000000000
        Frame.Typ = [ftTop]
      end
      object Memo22: TfrxMemoView
        Top = 132.283550000000000000
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
      object Memo23: TfrxMemoView
        Left = 234.330860000000000000
        Top = 132.283550000000000000
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
          '[ReportDsetData."SUMMA_P3_SUB_ZERO"]')
        ParentFont = False
      end
      object Memo7: TfrxMemoView
        Left = -3.779530000000000000
        Top = 222.992270000000000000
        Width = 113.385900000000000000
        Height = 45.354360000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        VAlign = vaCenter
      end
      object Memo9: TfrxMemoView
        Left = 109.606370000000000000
        Top = 222.992270000000000000
        Width = 98.267780000000000000
        Height = 45.354360000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086)
        VAlign = vaCenter
      end
      object Memo11: TfrxMemoView
        Left = 207.874150000000000000
        Top = 222.992270000000000000
        Width = 86.929190000000000000
        Height = 45.354360000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1042#1110#1076#1089#1086#1090#1086#1082' '
          #1091#1090#1088#1080#1084#1072#1085#1086#1075#1086' '#1028#1057#1042)
        VAlign = vaCenter
      end
      object Memo13: TfrxMemoView
        Left = 294.803340000000000000
        Top = 222.992270000000000000
        Width = 105.826840000000000000
        Height = 45.354360000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1057#1091#1084#1072' '#1091#1090#1088#1080#1084#1072#1085#1086#1075#1086' '#1028#1057#1042)
        VAlign = vaCenter
      end
      object Memo14: TfrxMemoView
        Left = 400.630180000000000000
        Top = 222.992270000000000000
        Width = 120.944960000000000000
        Height = 45.354360000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1042#1110#1076#1089#1086#1090#1086#1082' '
          #1085#1072#1088#1072#1093#1086#1074#1072#1085#1086#1075#1086' '#1028#1057#1042)
        VAlign = vaCenter
      end
      object Memo15: TfrxMemoView
        Left = 521.575140000000000000
        Top = 222.992270000000000000
        Width = 120.944960000000000000
        Height = 45.354360000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1057#1091#1084#1072' '#1085#1072#1088#1072#1093#1086#1074#1072#1085#1086#1075#1086' '#1028#1057#1042)
        VAlign = vaCenter
      end
      object Memo16: TfrxMemoView
        Left = -3.779530000000000000
        Top = 268.346630000000000000
        Width = 113.385900000000000000
        Height = 37.795300000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1047#1072#1088#1086#1073#1110#1090#1085#1072' '#1087#1083#1072#1090#1072)
        VAlign = vaCenter
      end
      object Memo19: TfrxMemoView
        Left = 109.606370000000000000
        Top = 268.346630000000000000
        Width = 98.267780000000000000
        Height = 18.897650000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDsetData."SUMMA_P3_UCH_ST_NOT"]')
        VAlign = vaCenter
      end
      object Memo17: TfrxMemoView
        Left = 109.606370000000000000
        Top = 287.244280000000000000
        Width = 98.267780000000000000
        Height = 18.897650000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDsetData."SUMMA_P3_UCH_ST"]')
        VAlign = vaCenter
      end
      object Memo18: TfrxMemoView
        Left = 207.874150000000000000
        Top = 268.346630000000000000
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
      object Memo20: TfrxMemoView
        Left = 207.874150000000000000
        Top = 287.244280000000000000
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
      object Memo21: TfrxMemoView
        Left = 294.803340000000000000
        Top = 268.346630000000000000
        Width = 105.826840000000000000
        Height = 18.897650000000000000
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[<ReportDsetData."SUMMA_P3_UCH_ST_NOT">*0.036]')
        VAlign = vaCenter
      end
      object Memo24: TfrxMemoView
        Left = 294.803340000000000000
        Top = 287.244280000000000000
        Width = 105.826840000000000000
        Height = 18.897650000000000000
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[<ReportDsetData."SUMMA_P3_UCH_ST">*0.061]')
        VAlign = vaCenter
      end
      object Memo25: TfrxMemoView
        Left = 400.630180000000000000
        Top = 268.346630000000000000
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
        Left = 400.630180000000000000
        Top = 287.244280000000000000
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
        Left = 521.575140000000000000
        Top = 268.346630000000000000
        Width = 120.944960000000000000
        Height = 18.897650000000000000
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[<ReportDsetData."SUMMA_P3_UCH_ST_NOT">*<ReportDSetAdditionalDat' +
            'a."ESN_R">/100]')
        VAlign = vaCenter
      end
      object Memo28: TfrxMemoView
        Left = 521.575140000000000000
        Top = 287.244280000000000000
        Width = 120.944960000000000000
        Height = 18.897650000000000000
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[<ReportDsetData."SUMMA_P3_UCH_ST">*<ReportDSetAdditionalData."E' +
            'SN_R">/100]')
        VAlign = vaCenter
      end
      object Memo29: TfrxMemoView
        Left = -3.779530000000000000
        Top = 306.141930000000000000
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
        Left = 109.606370000000000000
        Top = 306.141930000000000000
        Width = 98.267780000000000000
        Height = 22.677180000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDsetData."SUMMA_P3_UCH_ST_NOT_INV"]')
        VAlign = vaCenter
      end
      object Memo31: TfrxMemoView
        Left = 109.606370000000000000
        Top = 328.819110000000000000
        Width = 98.267780000000000000
        Height = 26.456710000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDsetData."SUMMA_P3_UCH_ST_INV"]')
        VAlign = vaCenter
      end
      object Memo32: TfrxMemoView
        Left = 207.874150000000000000
        Top = 306.141930000000000000
        Width = 86.929190000000000000
        Height = 22.677180000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
        Left = 294.803340000000000000
        Top = 306.141930000000000000
        Width = 105.826840000000000000
        Height = 22.677180000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[<ReportDsetData."SUMMA_P3_UCH_ST_NOT_INV">*0.036]')
        VAlign = vaCenter
      end
      object Memo34: TfrxMemoView
        Left = 400.630180000000000000
        Top = 306.141930000000000000
        Width = 120.944960000000000000
        Height = 22.677180000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
        Left = 521.575140000000000000
        Top = 306.141930000000000000
        Width = 120.944960000000000000
        Height = 22.677180000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[<ReportDsetData."SUMMA_P3_UCH_ST_NOT_INV">*<ReportDSetAdditiona' +
            'lData."ESN_INV">/100]')
        VAlign = vaCenter
      end
      object Memo36: TfrxMemoView
        Left = 207.874150000000000000
        Top = 328.819110000000000000
        Width = 86.929190000000000000
        Height = 26.456710000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
        Left = 294.803340000000000000
        Top = 328.819110000000000000
        Width = 105.826840000000000000
        Height = 26.456710000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[<ReportDsetData."SUMMA_P3_UCH_ST_INV">*0.061]')
        VAlign = vaCenter
      end
      object Memo38: TfrxMemoView
        Left = 400.630180000000000000
        Top = 328.819110000000000000
        Width = 120.944960000000000000
        Height = 26.456710000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
        Left = 521.575140000000000000
        Top = 328.819110000000000000
        Width = 120.944960000000000000
        Height = 26.456710000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[<ReportDsetData."SUMMA_P3_UCH_ST_INV">*<ReportDSetAdditionalDat' +
            'a."ESN_INV">/100]')
        VAlign = vaCenter
      end
      object Memo40: TfrxMemoView
        Left = -3.779530000000000000
        Top = 355.275820000000000000
        Width = 113.385900000000000000
        Height = 37.795275590000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1051#1080#1089#1090#1080' '#1090#1080#1084#1095#1072#1089#1086#1074#1086#1111' '#1085#1077#1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1086#1089#1090#1110)
        VAlign = vaCenter
      end
      object Memo41: TfrxMemoView
        Left = 109.606370000000000000
        Top = 355.275820000000000000
        Width = 98.267780000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDsetData."SUMMA_P6_INV_NOT"]')
        VAlign = vaCenter
      end
      object Memo42: TfrxMemoView
        Left = 207.874150000000000000
        Top = 355.275820000000000000
        Width = 86.929190000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
        Left = 294.803340000000000000
        Top = 355.275820000000000000
        Width = 105.826840000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[<ReportDsetData."SUMMA_P6_INV_NOT">*0.02]')
        VAlign = vaCenter
      end
      object Memo44: TfrxMemoView
        Left = 400.630180000000000000
        Top = 355.275820000000000000
        Width = 120.944960000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
        Left = 521.575140000000000000
        Top = 355.275820000000000000
        Width = 120.944960000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[<ReportDsetData."SUMMA_P6_INV_NOT">*<ReportDSetAdditionalData."' +
            'ESN_LL">/100]')
        VAlign = vaCenter
      end
      object Memo46: TfrxMemoView
        Left = -3.779530000000000000
        Top = 393.071120000000000000
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
        Left = 109.606370000000000000
        Top = 393.071120000000000000
        Width = 98.267780000000000000
        Height = 71.811070000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDsetData."SUMMA_P6_INV"]')
        VAlign = vaCenter
      end
      object Memo48: TfrxMemoView
        Left = 207.874150000000000000
        Top = 393.071120000000000000
        Width = 86.929190000000000000
        Height = 71.811070000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
        Left = 294.803340000000000000
        Top = 393.071120000000000000
        Width = 105.826840000000000000
        Height = 71.811070000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[<ReportDsetData."SUMMA_P6_INV">*0.02]')
        VAlign = vaCenter
      end
      object Memo50: TfrxMemoView
        Left = 400.630180000000000000
        Top = 393.071120000000000000
        Width = 120.944960000000000000
        Height = 71.811070000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
        Left = 521.575140000000000000
        Top = 393.071120000000000000
        Width = 120.944960000000000000
        Height = 71.811070000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[<ReportDsetData."SUMMA_P6_INV">*<ReportDSetAdditionalData."ESN_' +
            'INV">/100]')
        VAlign = vaCenter
      end
      object Memo52: TfrxMemoView
        Left = -3.779530000000000000
        Top = 464.882190000000000000
        Width = 113.385900000000000000
        Height = 37.795300000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1044#1086#1075#1086#1074#1086#1075#1072' '#1043#1055#1061)
        VAlign = vaCenter
      end
      object Memo53: TfrxMemoView
        Left = 109.606370000000000000
        Top = 464.882190000000000000
        Width = 98.267780000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDsetData."SUMMA_P3_DOG_PIDRYD"]')
        VAlign = vaCenter
      end
      object Memo54: TfrxMemoView
        Left = 207.874150000000000000
        Top = 464.882190000000000000
        Width = 86.929190000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
        Left = 294.803340000000000000
        Top = 464.882190000000000000
        Width = 105.826840000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[<ReportDsetData."SUMMA_P3_DOG_PIDRYD">*0.026]')
        VAlign = vaCenter
      end
      object Memo56: TfrxMemoView
        Left = 400.630180000000000000
        Top = 464.882190000000000000
        Width = 120.944960000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
        Left = 521.575140000000000000
        Top = 464.882190000000000000
        Width = 120.944960000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[<ReportDsetData."SUMMA_P3_DOG_PIDRYD">*<ReportDSetAdditionalDat' +
            'a."ESN_DP">/100]')
        VAlign = vaCenter
      end
      object Memo58: TfrxMemoView
        Left = -3.779530000000000000
        Top = 502.677490000000000000
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
        Left = 109.606370000000000000
        Top = 502.677490000000000000
        Width = 98.267780000000000000
        Height = 18.897650000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
          
            '[<ReportDsetData."SUMMA_P3_UCH_ST">+<ReportDsetData."SUMMA_P3_UC' +
            'H_ST_NOT">+<ReportDsetData."SUMMA_P3_UCH_ST_INV">+<ReportDsetDat' +
            'a."SUMMA_P3_UCH_ST_NOT_INV">+<ReportDsetData."SUMMA_P6_INV">+<Re' +
            'portDsetData."SUMMA_P6_INV_NOT">+<ReportDsetData."SUMMA_P3_DOG_P' +
            'IDRYD">]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo60: TfrxMemoView
        Left = 207.874150000000000000
        Top = 502.677490000000000000
        Width = 86.929190000000000000
        Height = 18.897650000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        VAlign = vaCenter
      end
      object Memo62: TfrxMemoView
        Left = 400.630180000000000000
        Top = 502.677490000000000000
        Width = 120.944960000000000000
        Height = 18.897650000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        VAlign = vaCenter
      end
      object Line2: TfrxLineView
        Top = 551.811380000000000000
        Width = 642.520100000000000000
        Frame.Typ = [ftTop]
      end
      object Memo64: TfrxMemoView
        Top = 574.488560000000000000
        Width = 136.062992130000000000
        Height = 37.795300000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        VAlign = vaCenter
      end
      object Memo65: TfrxMemoView
        Left = 136.063080000000000000
        Top = 574.488560000000000000
        Width = 94.488250000000000000
        Height = 37.795300000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086)
        VAlign = vaCenter
      end
      object Memo66: TfrxMemoView
        Left = 230.551330000000000000
        Top = 574.488560000000000000
        Width = 105.826840000000000000
        Height = 37.795300000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1042#1110#1076#1089#1086#1090#1086#1082' '
          #1091#1090#1088#1080#1084#1072#1085#1086#1075#1086' '#1028#1057#1042)
        VAlign = vaCenter
      end
      object Memo67: TfrxMemoView
        Left = 336.378170000000000000
        Top = 574.488560000000000000
        Width = 105.826840000000000000
        Height = 37.795300000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1057#1091#1084#1072' '#1091#1090#1088#1080#1084#1072#1085#1086#1075#1086' '#1028#1057#1042)
        VAlign = vaCenter
      end
      object Memo68: TfrxMemoView
        Top = 612.283860000000000000
        Width = 136.062992130000000000
        Height = 37.795300000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1047#1072#1088#1086#1073#1110#1090#1085#1072' '#1087#1083#1072#1090#1072)
        VAlign = vaCenter
      end
      object Memo69: TfrxMemoView
        Top = 650.079160000000000000
        Width = 136.062992130000000000
        Height = 37.795275590000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1051#1080#1089#1090#1080' '#1090#1080#1084#1095#1072#1089#1086#1074#1086#1111' '#1085#1077#1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1086#1089#1090#1110)
        VAlign = vaCenter
      end
      object Memo70: TfrxMemoView
        Top = 687.874460000000000000
        Width = 136.062992130000000000
        Height = 37.795300000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1044#1086#1075#1086#1074#1086#1075#1072' '#1043#1055#1061)
        VAlign = vaCenter
      end
      object Memo73: TfrxMemoView
        Left = 230.551330000000000000
        Top = 612.283860000000000000
        Width = 105.826840000000000000
        Height = 18.897650000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDSetAdditionalData."PERCENT_SOC_SINGLE"]%')
        VAlign = vaCenter
      end
      object Memo74: TfrxMemoView
        Left = 230.551330000000000000
        Top = 631.181510000000000000
        Width = 105.826840000000000000
        Height = 18.897650000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDSetAdditionalData."PERCENT_SOC_SCIENCE"]%')
        VAlign = vaCenter
      end
      object Memo77: TfrxMemoView
        Left = 136.063080000000000000
        Top = 650.079160000000000000
        Width = 94.488250000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDsetData."SUMMA_P6"]')
        VAlign = vaCenter
      end
      object Memo78: TfrxMemoView
        Left = 230.551330000000000000
        Top = 650.079160000000000000
        Width = 105.826840000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDSetAdditionalData."PERCENT_DFSS_SINGLE"]%')
        VAlign = vaCenter
      end
      object Memo80: TfrxMemoView
        Left = 136.063080000000000000
        Top = 687.874460000000000000
        Width = 94.488250000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDsetData."SUMMA_P3_DOG_PIDRYD"]')
        VAlign = vaCenter
      end
      object Memo81: TfrxMemoView
        Left = 230.551330000000000000
        Top = 687.874460000000000000
        Width = 105.826840000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDSetAdditionalData."PERCENT_SINGLE_GR_PR_DOG"]%')
        VAlign = vaCenter
      end
      object Memo83: TfrxMemoView
        Top = 725.669760000000000000
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
      object Memo85: TfrxMemoView
        Left = 230.551330000000000000
        Top = 725.669760000000000000
        Width = 105.826840000000000000
        Height = 18.897650000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        VAlign = vaCenter
      end
      object Memo87: TfrxMemoView
        Top = 771.024120000000000000
        Width = 136.063080000000000000
        Height = 37.795300000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        VAlign = vaCenter
      end
      object Memo88: TfrxMemoView
        Left = 136.063080000000000000
        Top = 771.024120000000000000
        Width = 94.488250000000000000
        Height = 37.795300000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086)
        VAlign = vaCenter
      end
      object Memo89: TfrxMemoView
        Left = 230.551330000000000000
        Top = 771.024120000000000000
        Width = 105.826840000000000000
        Height = 37.795300000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1042#1110#1076#1089#1086#1090#1086#1082' '
          #1091#1090#1088#1080#1084#1072#1085#1086#1075#1086' '#1028#1057#1042)
        VAlign = vaCenter
      end
      object Memo90: TfrxMemoView
        Left = 336.378170000000000000
        Top = 771.024120000000000000
        Width = 105.826840000000000000
        Height = 37.795300000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1057#1091#1084#1072' '#1091#1090#1088#1080#1084#1072#1085#1086#1075#1086' '#1028#1057#1042)
        VAlign = vaCenter
      end
      object Memo91: TfrxMemoView
        Top = 808.819420000000000000
        Width = 136.063080000000000000
        Height = 18.897650000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1047#1072#1088#1086#1073#1110#1090#1085#1072' '#1087#1083#1072#1090#1072)
        VAlign = vaCenter
      end
      object Memo92: TfrxMemoView
        Top = 846.614720000000000000
        Width = 136.063080000000000000
        Height = 37.795275590000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1051#1080#1089#1090#1080' '#1090#1080#1084#1095#1072#1089#1086#1074#1086#1111' '#1085#1077#1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1086#1089#1090#1110)
        VAlign = vaCenter
      end
      object Memo95: TfrxMemoView
        Left = 230.551330000000000000
        Top = 808.819420000000000000
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
      object Memo96: TfrxMemoView
        Left = 230.551330000000000000
        Top = 827.717070000000000000
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
      object Memo99: TfrxMemoView
        Left = 136.063080000000000000
        Top = 846.614720000000000000
        Width = 94.488250000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDsetData."SUMMA_P6_INV_NOT"]')
        VAlign = vaCenter
      end
      object Memo100: TfrxMemoView
        Left = 230.551330000000000000
        Top = 846.614720000000000000
        Width = 105.826840000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDSetAdditionalData."ESN_LL"]%')
        VAlign = vaCenter
      end
      object Memo102: TfrxMemoView
        Top = 922.205320000000000000
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
      object Memo104: TfrxMemoView
        Left = 230.551330000000000000
        Top = 922.205320000000000000
        Width = 105.826840000000000000
        Height = 18.897650000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        VAlign = vaCenter
      end
      object Memo106: TfrxMemoView
        Top = 884.410020000000000000
        Width = 136.062992130000000000
        Height = 37.795300000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1044#1086#1075#1086#1074#1086#1075#1072' '#1043#1055#1061)
        VAlign = vaCenter
      end
      object Memo107: TfrxMemoView
        Left = 136.063080000000000000
        Top = 884.410020000000000000
        Width = 94.488250000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDsetData."SUMMA_P3_DOG_PIDRYD"]')
        VAlign = vaCenter
      end
      object Memo108: TfrxMemoView
        Left = 230.551330000000000000
        Top = 884.410020000000000000
        Width = 105.826840000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[ReportDSetAdditionalData."ESN_DP"]%')
        VAlign = vaCenter
      end
      object Memo110: TfrxMemoView
        Top = 827.717070000000000000
        Width = 136.063080000000000000
        Height = 18.897650000000000000
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          #1055#1088#1072#1094#1102#1102#1095#1110' '#1110#1085#1074#1072#1083#1110#1076#1080)
      end
      object Memo61: TfrxMemoView
        Left = 294.803340000000000000
        Top = 502.677490000000000000
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
          
            '[<ReportDsetData."SUMMA_P3_UCH_ST_NOT">*<ReportDSetAdditionalDat' +
            'a."PERCENT_SOC_SINGLE">/100+<ReportDsetData."SUMMA_P3_UCH_ST">*<' +
            'ReportDSetAdditionalData."PERCENT_SOC_SCIENCE">/100+<ReportDsetD' +
            'ata."SUMMA_P3_UCH_ST_NOT_INV">*<ReportDSetAdditionalData."PERCEN' +
            'T_SOC_SINGLE">/100+<ReportDsetData."SUMMA_P3_UCH_ST_INV">*<Repor' +
            'tDSetAdditionalData."PERCENT_SOC_SCIENCE">/100+<ReportDsetData."' +
            'SUMMA_P6_INV">*<ReportDSetAdditionalData."PERCENT_DFSS_SINGLE">/' +
            '100+<ReportDsetData."SUMMA_P6_INV_NOT">*<ReportDSetAdditionalDat' +
            'a."PERCENT_DFSS_SINGLE">/100+<ReportDsetData."SUMMA_P3_DOG_PIDRY' +
            'D">*<ReportDSetAdditionalData."PERCENT_SINGLE_GR_PR_DOG">/100]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo63: TfrxMemoView
        Left = 521.575140000000000000
        Top = 502.677490000000000000
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
          
            '[<ReportDsetData."SUMMA_P3_UCH_ST_NOT">*<ReportDSetAdditionalDat' +
            'a."ESN_R">/100+<ReportDsetData."SUMMA_P3_UCH_ST">*<ReportDSetAdd' +
            'itionalData."ESN_R">/100+<ReportDsetData."SUMMA_P3_UCH_ST_NOT_IN' +
            'V">*<ReportDSetAdditionalData."ESN_INV">/100+<ReportDsetData."SU' +
            'MMA_P3_UCH_ST_INV">*<ReportDSetAdditionalData."ESN_INV">/100+<Re' +
            'portDsetData."SUMMA_P6_INV_NOT">*<ReportDSetAdditionalData."ESN_' +
            'LL">/100+<ReportDsetData."SUMMA_P6_INV">*<ReportDSetAdditionalDa' +
            'ta."ESN_INV">/100+<ReportDsetData."SUMMA_P3_DOG_PIDRYD">*<Report' +
            'DSetAdditionalData."ESN_DP">/100]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo71: TfrxMemoView
        Left = 136.063080000000000000
        Top = 612.283860000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[<ReportDsetData."SUMMA_P3_UCH_ST_NOT">+<ReportDsetData."SUMMA_P' +
            '3_UCH_ST_NOT_INV">]')
        VAlign = vaCenter
      end
      object Memo72: TfrxMemoView
        Left = 136.063080000000000000
        Top = 631.181510000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[<ReportDsetData."SUMMA_P3_UCH_ST">+<ReportDsetData."SUMMA_P3_UC' +
            'H_ST_INV">]')
        VAlign = vaCenter
      end
      object Memo75: TfrxMemoView
        Left = 136.063080000000000000
        Top = 725.669760000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
          
            '[<ReportDsetData."SUMMA_P3_UCH_ST_NOT">+<ReportDsetData."SUMMA_P' +
            '3_UCH_ST_NOT_INV">+<ReportDsetData."SUMMA_P3_UCH_ST">+<ReportDse' +
            'tData."SUMMA_P3_UCH_ST_INV">+<ReportDsetData."SUMMA_P6">+<Report' +
            'DsetData."SUMMA_P3_DOG_PIDRYD">]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo76: TfrxMemoView
        Left = 336.378170000000000000
        Top = 612.283860000000000000
        Width = 105.826840000000000000
        Height = 18.897650000000000000
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[(<ReportDsetData."SUMMA_P3_UCH_ST_NOT">+<ReportDsetData."SUMMA_' +
            'P3_UCH_ST_NOT_INV">)*<ReportDSetAdditionalData."PERCENT_SOC_SING' +
            'LE">/100]')
        VAlign = vaCenter
      end
      object Memo79: TfrxMemoView
        Left = 336.378170000000000000
        Top = 631.181510000000000000
        Width = 105.826840000000000000
        Height = 18.897650000000000000
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[(<ReportDsetData."SUMMA_P3_UCH_ST">+<ReportDsetData."SUMMA_P3_U' +
            'CH_ST_INV">)*<ReportDSetAdditionalData."PERCENT_SOC_SCIENCE">/10' +
            '0]')
        VAlign = vaCenter
      end
      object Memo82: TfrxMemoView
        Left = 336.378170000000000000
        Top = 650.079160000000000000
        Width = 105.826840000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[<ReportDsetData."SUMMA_P6">*<ReportDSetAdditionalData."PERCENT_' +
            'DFSS_SINGLE">/100]')
        VAlign = vaCenter
      end
      object Memo84: TfrxMemoView
        Left = 336.378170000000000000
        Top = 687.874460000000000000
        Width = 105.826840000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[<ReportDsetData."SUMMA_P3_DOG_PIDRYD">*<ReportDSetAdditionalDat' +
            'a."PERCENT_SINGLE_GR_PR_DOG">/100]')
        VAlign = vaCenter
      end
      object Memo86: TfrxMemoView
        Left = 336.378170000000000000
        Top = 725.669760000000000000
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
          
            '[(<ReportDsetData."SUMMA_P3_UCH_ST_NOT">+<ReportDsetData."SUMMA_' +
            'P3_UCH_ST_NOT_INV">)*<ReportDSetAdditionalData."PERCENT_SOC_SING' +
            'LE">/100+(<ReportDsetData."SUMMA_P3_UCH_ST">+<ReportDsetData."SU' +
            'MMA_P3_UCH_ST_INV">)*<ReportDSetAdditionalData."PERCENT_SOC_SCIE' +
            'NCE">/100+<ReportDsetData."SUMMA_P6">*<ReportDSetAdditionalData.' +
            '"PERCENT_DFSS_SINGLE">/100+<ReportDsetData."SUMMA_P3_DOG_PIDRYD"' +
            '>*<ReportDSetAdditionalData."PERCENT_SINGLE_GR_PR_DOG">/100]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo93: TfrxMemoView
        Left = 136.063080000000000000
        Top = 808.819420000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[<ReportDsetData."SUMMA_P3_UCH_ST_NOT">+<ReportDsetData."SUMMA_P' +
            '3_UCH_ST">]')
        VAlign = vaCenter
      end
      object Memo94: TfrxMemoView
        Left = 136.063080000000000000
        Top = 827.717070000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[<ReportDsetData."SUMMA_P3_UCH_ST_NOT_INV">+<ReportDsetData."SUM' +
            'MA_P3_UCH_ST_INV">+<ReportDsetData."SUMMA_P6_INV">]')
        VAlign = vaCenter
      end
      object Memo97: TfrxMemoView
        Left = 336.378170000000000000
        Top = 808.819420000000000000
        Width = 105.826840000000000000
        Height = 18.897650000000000000
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[(<ReportDsetData."SUMMA_P3_UCH_ST_NOT">+<ReportDsetData."SUMMA_' +
            'P3_UCH_ST">)*<ReportDSetAdditionalData."ESN_R">/100]')
        VAlign = vaCenter
      end
      object Memo98: TfrxMemoView
        Left = 336.378170000000000000
        Top = 827.717070000000000000
        Width = 105.826840000000000000
        Height = 18.897650000000000000
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[(<ReportDsetData."SUMMA_P3_UCH_ST_NOT_INV">+<ReportDsetData."SU' +
            'MMA_P3_UCH_ST_INV">+<ReportDsetData."SUMMA_P6_INV">)*<ReportDSet' +
            'AdditionalData."ESN_INV">/100]')
        VAlign = vaCenter
      end
      object Memo101: TfrxMemoView
        Left = 336.378170000000000000
        Top = 846.614720000000000000
        Width = 105.826840000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[<ReportDsetData."SUMMA_P6_INV_NOT">*<ReportDSetAdditionalData."' +
            'ESN_LL">/100]')
        VAlign = vaCenter
      end
      object Memo103: TfrxMemoView
        Left = 336.378170000000000000
        Top = 884.410020000000000000
        Width = 105.826840000000000000
        Height = 37.795300000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haRight
        Memo.Strings = (
          
            '[<ReportDsetData."SUMMA_P3_DOG_PIDRYD">*<ReportDSetAdditionalDat' +
            'a."ESN_DP">/100]')
        VAlign = vaCenter
      end
      object Memo105: TfrxMemoView
        Left = 136.063080000000000000
        Top = 922.205320000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
          
            '[<ReportDsetData."SUMMA_P3_UCH_ST_NOT">+<ReportDsetData."SUMMA_P' +
            '3_UCH_ST">+<ReportDsetData."SUMMA_P3_UCH_ST_NOT_INV">+<ReportDse' +
            'tData."SUMMA_P3_UCH_ST_INV">+<ReportDsetData."SUMMA_P6_INV_NOT">' +
            '+<ReportDsetData."SUMMA_P3_DOG_PIDRYD">+<ReportDsetData."SUMMA_P' +
            '6_INV">]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo109: TfrxMemoView
        Left = 336.378170000000000000
        Top = 922.205320000000000000
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
          
            '[(<ReportDsetData."SUMMA_P3_UCH_ST_NOT">+<ReportDsetData."SUMMA_' +
            'P3_UCH_ST">)*<ReportDSetAdditionalData."ESN_R">/100+(<ReportDset' +
            'Data."SUMMA_P3_UCH_ST_NOT_INV">+<ReportDsetData."SUMMA_P3_UCH_ST' +
            '_INV">+<ReportDsetData."SUMMA_P6_INV">)*<ReportDSetAdditionalDat' +
            'a."ESN_INV">/100+<ReportDsetData."SUMMA_P6_INV_NOT">*<ReportDSet' +
            'AdditionalData."ESN_LL">/100+<ReportDsetData."SUMMA_P3_DOG_PIDRY' +
            'D">*<ReportDSetAdditionalData."ESN_DP">/100]')
        ParentFont = False
        VAlign = vaCenter
      end
    end
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 43
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
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
    Database = DB
    Transaction = ReadTransaction
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
  object DSetAdditionalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 176
    poSQLINT64ToBCD = True
  end
  object ReportDSetAdditionalData: TfrxDBDataset
    UserName = 'ReportDSetAdditionalData'
    CloseDataSource = False
    DataSet = DSetAdditionalData
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
