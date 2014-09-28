object DM: TDM
  OldCreateOrder = False
  Left = 138
  Top = 135
  Height = 276
  Width = 413
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
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 59
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 184
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 168
    Top = 180
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 115
    poSQLINT64ToBCD = True
  end
  object ReportDSetGlobalData: TfrxDBDataset
    UserName = 'ReportDsetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 168
    Top = 116
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 256
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 256
    Top = 48
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 256
    Top = 96
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38789.428188472200000000
    ReportOptions.LastChange = 38959.593012152780000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <KodSm>='#39'-255'#39' then Memo44.Text:='#39#39';'
      'end;'
      ''
      'begin'
      ''
      'end.')
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
        Name = 'REPORT_DATE'
        Value = #39'31.03.2006'#39
      end
      item
        Name = 'FONT_SIZE'
        Value = '10'
      end
      item
        Name = 'Upper_Name'
        Value = Null
      end
      item
        Name = 'U_NAME'
        Value = Null
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
      OnBeforePrint = 'Page1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        Height = 121.133890000000000000
        Top = 16.000000000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo1: TfrxMemoView
          Top = 35.338590000000010000
          Width = 1057.102970000000000000
          Height = 22.677180000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1048#1050#1054#1053#1040#1053#1053#1071' '#1064#1058#1040#1058#1053#1054#1043#1054' '#1056#1054#1047#1050#1051#1040#1044#1059' '#1053#1040' [date]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Width = 482.614410000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[NameV]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Top = 83.149660000000000000
          Width = 1045.764380000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          HAlign = haCenter
          Memo.Strings = (
            '[NameTypePost]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Top = 64.252010000000000000
          Width = 1051.433520000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."SMETA_NAME"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 38.897650000000000000
        ParentFont = False
        Top = 320.000000000000000000
        Width = 1046.929810000000000000
        OnAfterCalcHeight = 'GroupHeader1OnAfterCalcHeight'
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        AllowSplit = True
        Condition = '<ReportDsetData."NAME_CAFEDRA">'
        Stretched = True
        object Memo2: TfrxMemoView
          Width = 1047.653990000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_FACULTY"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 20.000000000000000000
          Width = 1047.653990000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_CAFEDRA"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 81.130000000000000000
        ParentFont = False
        Top = 416.000000000000000000
        Width = 1046.929810000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo11: TfrxMemoView
          Left = 133.417256930000000000
          Width = 30.236203390000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."WORK_REASON"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Top = 29.133855830000010000
          Width = 133.417256930000000000
          Height = 12.000000000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATE_BEG"] - [ReportDsetData."DATE_END"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Top = 41.129999999999990000
          Width = 133.417256930000000000
          Height = 40.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NUM_DATE_ORDER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 163.653460310000000000
          Width = 34.015728500000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."UCH_STEPEN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 196.535330550000000000
          Width = 38.929133860000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."UCH_ZVANIE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 235.464447320000000000
          Width = 56.692913390000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."OKLAD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 292.157355830000000000
          Width = 63.496062990000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."OKLAD_BASE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 355.275590550000000000
          Width = 65.007874020000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOD_SM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 420.661417320000000000
          Width = 64.251968500000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."OKLAD_PPS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 484.760000000000000000
          Width = 64.250000000000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOEFF_PPS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 547.210000000000100000
          Width = 64.090000000000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOD_SM_PPS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 680.570000000000000000
          Width = 71.060000000000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOL_STAVOK"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 610.330000000000000000
          Width = 71.060000000000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 751.690000000000000000
          Width = 71.060000000000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOL_STAVOK_SV"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 820.820000000000000000
          Width = 74.830000000000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOL_STAVOK_ZAN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 893.510000000000000000
          Width = 70.930000000000010000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 964.440000000000000000
          Width = 82.490000000000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."COMMENT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Width = 133.420000000000000000
          Height = 29.130000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."FIO"] '
            '([ReportDsetData."TN"])')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 556.000000000000000000
        Width = 1046.929810000000000000
        object Memo56: TfrxMemoView
          Left = 967.559680000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 16.000000000000000000
        Top = 380.000000000000000000
        Width = 1046.929810000000000000
        Condition = '<ReportDsetData."NAME_POST">'
        Stretched = True
        object Memo41: TfrxMemoView
          Width = 235.464566930000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_POST"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 235.464566930000000000
          Width = 56.692913390000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."OKLAD_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 292.157480310000000000
          Width = 64.251968500000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."BASE_OKLAD_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 355.275590550000000000
          Width = 68.031496060000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOD_SM_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 420.661417320000000000
          Width = 64.251968500000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."OKLAD_PPS_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 484.760000000000000000
          Width = 64.250000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOEFF_PPS_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 549.210000000000000000
          Width = 60.090000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOD_SM_PPS_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 610.330000000000000000
          Width = 71.060000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOL_STAVOK_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 681.390000000000000000
          Width = 71.060000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOL_STAVOK_SUM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 751.690000000000000000
          Width = 71.055118110000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOL_STAVOK_SV_SUM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 822.750000000000000000
          Width = 70.834645670000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOL_STAVOK_ZAN_SUM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 893.510000000000000000
          Width = 70.930000000000010000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            
              '[<ReportDsetData."KOL_STAVOK_SHTAT">-<ReportDsetData."KOL_STAVOK' +
              '_SUM">-<ReportDsetData."KOL_STAVOK_ZAN_SUM">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 964.440000000000000000
          Width = 82.490000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 105.830000000000000000
        Top = 196.000000000000000000
        Width = 1046.929810000000000000
        AllowSplit = True
        Stretched = True
        object Memo57: TfrxMemoView
          Width = 235.622120470000000000
          Height = 105.826771650000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1087#1086#1089#1072#1076#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 235.464566930000000000
          Width = 375.307176930000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1082#1083#1072#1076)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 235.464566930000000000
          Top = 26.456692910000020000
          Width = 56.755912830000000000
          Height = 79.370078740000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 610.393700790000000000
          Width = 354.551227480000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1082#1072#1079#1085#1080#1082#1080' '#1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1096#1090#1072#1090#1085#1086#1075#1086' '#1088#1086#1079#1082#1083#1072#1076#1091', '#1089#1090#1072#1074#1086#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 820.819420000000000000
          Top = 26.456692910000020000
          Width = 74.834648110000000000
          Height = 79.370078740000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1080#1084#1095#1072#1089#1086
            #1074#1086' '#1079#1072#1081#1085#1103#1090#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 893.512370000000000000
          Top = 26.456692910000020000
          Width = 70.929143620000000000
          Height = 79.370078740000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1093#1080#1083#1077#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 964.441560000000000000
          Width = 82.488203619999990000
          Height = 105.826771650000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1084#1110#1090#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 292.157480310000000000
          Top = 26.456692910000020000
          Width = 318.582752830000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1074' '#1090'.'#1095'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 292.157480310000000000
          Top = 52.913385829999980000
          Width = 128.503937010000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1075'. '#1079' '#1085#1072#1082'. '#1052#1054#1053#1059)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 420.661417320000000000
          Top = 52.913385829999980000
          Width = 189.448862830000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1075'. '#1087#1086#1089#1090'. 992')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 292.157480310000000000
          Top = 79.370078740000000000
          Width = 64.251968500000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 355.401670000000000000
          Top = 79.370078740000000000
          Width = 68.031498500000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1096#1090'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 420.661417320000000000
          Top = 79.370078740000000000
          Width = 64.251968500000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 547.212740000000100000
          Top = 79.370078740000000000
          Width = 64.094502830000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1096#1090'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 484.756030000000000000
          Top = 79.370078740000000000
          Width = 64.251968500000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1077#1092'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 751.685220000000000000
          Top = 26.456692910000020000
          Width = 71.055118110000000000
          Height = 79.370078740000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1080#1084#1095#1072#1089#1086
            #1074#1086' '#1074#1110#1083#1100#1085#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 680.567100000000000000
          Top = 26.456692910000020000
          Width = 71.055118110000000000
          Height = 79.370078740000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1072#1082#1090#1080#1095#1085#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 610.330860000000000000
          Top = 26.456692910000020000
          Width = 71.055118110000000000
          Height = 79.370078740000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1075#1110#1076#1085#1086' '#1064#1056)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object DSetSr1: TpFIBDataSet
    Database = DB
    Transaction = WriteTransaction
    Left = 256
    Top = 152
    poSQLINT64ToBCD = True
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 336
    Top = 48
  end
  object DSetSr2: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'DELETE FROM SHTAT_MFUND_TABLE where Id_Session=:Id_Sess')
    Transaction = ReadTransaction
    Left = 336
  end
end
