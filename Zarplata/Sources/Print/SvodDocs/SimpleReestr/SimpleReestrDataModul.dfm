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
    ReportOptions.LastChange = 41997.828997280100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var FlagPrintGroupFooter:boolean=False;'
      ''
      'procedure GroupFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    FlagPrintGroupFooter:=True;'
      'end;'
      ''
      'procedure PageFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    PageFooter1.Visible := not FlagPrintGroupFooter;'
      '    FlagPrintGroupFooter:=False;'
      'end;'
      ''
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
      end>
    Variables = <
      item
        Name = ' User Category'
        Value = Null
      end
      item
        Name = 'PPeriod'
        Value = #39#1050#1074#1110#1090#1077#1085#1100' 2005 '#1088'.'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object GroupHeader1: TfrxGroupHeader
        Height = 95.811070000000000000
        Top = 94.488250000000000000
        Width = 718.110700000000000000
        Condition = 'ReportDsetData."KOD_SCH"'
        KeepChild = True
        KeepTogether = True
        ReprintOnNewPage = True
        StartNewPage = True
        Stretched = True
        object Memo1: TfrxMemoView
          Top = 51.000000000000000000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            
              ' '#1056#1072#1093#1091#1085#1086#1082':  <b>[ReportDsetData."KOD_SCH"] - [ReportDsetData."NAME' +
              '_SCH"]</b>')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 491.338900000000000000
          Top = 76.913420000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Top = 76.913420000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1087#1087'.')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 68.031540000000000000
          Top = 76.913420000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1072#1073'. '#1085#1086#1084#1077#1088)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 162.519790000000000000
          Top = 76.913420000000000000
          Width = 328.819110000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1110#1079#1074#1080#1097#1077', '#1030#1084#39#1103', '#1055#1086'-'#1073#1072#1090#1100#1082#1086#1074#1110)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Width = 715.812530000000000000
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
        object Memo18: TfrxMemoView
          Left = 83.149660000000000000
          Top = 26.456710000000000000
          Width = 517.795610000000000000
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
          Left = 600.945270000000000000
          Top = 26.456710000000000000
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
        object Memo19: TfrxMemoView
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
        object Line1: TfrxLineView
          Top = 48.133890000000000000
          Width = 719.890230000000000000
          Frame.Typ = [ftTop]
        end
        object Memo26: TfrxMemoView
          Left = 578.268090000000000000
          Top = 77.590600000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1084#1077#1090#1072)
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 646.299630000000000000
          Top = 77.590600000000000000
          Width = 72.031540000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1088#1086#1079#1076#1110#1083)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 211.653680000000000000
        Width = 718.110700000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        object Memo6: TfrxMemoView
          Left = 60.370130000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
        end
        object Memo7: TfrxMemoView
          Left = 68.015770000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
        end
        object Memo8: TfrxMemoView
          Left = 570.709030000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
        end
        object Memo3: TfrxMemoView
          Left = 491.338900000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'SUMMA'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."SUMMA"]')
        end
        object SysMemo1: TfrxSysMemoView
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[LINE#]')
        end
        object Memo4: TfrxMemoView
          Left = 75.590600000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'TN'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."TN"]')
        end
        object Memo5: TfrxMemoView
          Left = 154.960730000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
        end
        object Memo9: TfrxMemoView
          Left = 162.606370000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
        end
        object Memo10: TfrxMemoView
          Left = 170.078850000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DataField = 'FIO'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
        end
        object Memo24: TfrxMemoView
          Left = 578.268090000000000000
          Width = 68.252010000000000000
          Height = 18.897650000000000000
          DataField = 'KOD_SMETA'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."KOD_SMETA"]')
        end
        object Memo25: TfrxMemoView
          Left = 646.299630000000000000
          Width = 72.252010000000000000
          Height = 18.897650000000000000
          DataField = 'KOD_SMETA'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."KOD_SMETA"]')
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 68.031540000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupFooter1OnBeforePrint'
        object SysMemo3: TfrxSysMemoView
          Left = 578.268090000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."SUMMA">,MasterData1)]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 710.551640000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
        end
        object Memo20: TfrxMemoView
          Width = 578.268090000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1047#1072#1075#1072#1083#1086#1084':')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 27.677180000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataField = 'DIRECTOR_POST'
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetGlobalData."DIRECTOR_POST"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Top = 50.354360000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataField = 'GLBUHG_POST'
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetGlobalData."GLBUHG_POST"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 453.543600000000000000
          Top = 28.456710000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataField = 'DIRECTOR'
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetGlobalData."DIRECTOR"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 453.543600000000000000
          Top = 47.354360000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataField = 'GLBUHG'
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetGlobalData."GLBUHG"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 268.346630000000000000
          Top = 42.795300000000000000
          Width = 181.417440000000000000
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Left = 268.346630000000000000
          Top = 65.472480000000000000
          Width = 181.417440000000000000
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'PageFooter1OnBeforePrint'
        object SysMemo4: TfrxSysMemoView
          Left = 631.181510000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."SUMMA">,MasterData1)]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 710.551640000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
        end
        object Memo15: TfrxMemoView
          Width = 631.181510000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1047#1072#1075#1072#1083#1086#1084' '#1087#1086' '#1083#1080#1089#1090#1091':')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 15.118120000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo28: TfrxMemoView
          Left = 3.779530000000000000
          Width = 706.772110000000000000
          Height = 11.338590000000000000
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
