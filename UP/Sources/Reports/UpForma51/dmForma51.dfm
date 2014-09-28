object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 170
  Height = 304
  Width = 345
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 128
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 200
    Top = 116
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 56
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 128
    Top = 56
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.ConvertNulls = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 39129.763690312500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 200
    Datasets = <
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
        Name = 'PDateForm'
        Value = #39'01.01.2005'#39
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
      object ReportTitle1: TfrxReportTitle
        Height = 132.724490000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo11: TfrxMemoView
          Left = 885.102350000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [CUR_DATE]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 952.441560000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470'51')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Top = 45.795300000000000000
          Width = 1096.063700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1074#1110#1090#1085#1110' '#1076#1072#1085#1085#1110)
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Top = 64.472480000000000000
          Width = 1096.063700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1086' '#1089#1077#1088#1077#1076#1085#1110#1081' '#1074#1110#1082' '#1074#1080#1082#1083#1072#1076#1072#1095#1110#1074' '#1087#1086' '#1082#1072#1092#1077#1076#1088#1072#1084', '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1091', '#1042#1053#1047#1091)
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Top = 83.370130000000000000
          Width = 1096.063700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1085#1072' [ReportDsetData."LOC_DATE_CHECK"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 309.921460000000000000
        Width = 1046.929810000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        KeepChild = True
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 37.795300000000000000
          Width = 740.787880000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'NAME_DEPARTMENT'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT"]')
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 778.583180000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'AVG_AGE_ALL'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."AVG_AGE_ALL"]')
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 937.323440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."AVG_AGE_DOC_PROF"]')
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 857.953310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."AVG_AGE_CAND_DOC"]')
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 30.236240000000000000
        ParentFont = False
        Top = 211.653680000000000000
        Width = 1046.929810000000000000
        ReprintOnNewPage = True
        object Memo39: TfrxMemoView
          Left = 778.583180000000000000
          Width = 79.370103150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1110#1093' ('#1064')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 857.953310000000000000
          Width = 79.370103150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1082#1090'. '#1085'., '#1087#1088#1086#1092#1077#1089'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 937.323440000000000000
          Width = 79.370103150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1072#1085#1076'. '#1085'., '#1076#1086#1094#1077#1085#1090'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 37.795300000000000000
          Width = 740.787853150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1091)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Memo25: TfrxMemoView
        Top = 18.677180000000000000
        Width = 768.441560000000000000
        Height = 18.897650000000000000
        DataSetName = 'ReportDsetGlobalData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[ReportDsetData."FIRM_NAME"]')
        ParentFont = False
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 427.086890000000000000
        Width = 1046.929810000000000000
        object Memo3: TfrxMemoView
          Left = 992.000000000000000000
          Width = 52.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 16.000000000000000000
        Top = 351.496290000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo4: TfrxMemoView
          Left = 37.795300000000000000
          Width = 741.921586930000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 778.582677170000000000
          Width = 79.370078740000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[AVG(<ReportDsetData."AVG_AGE_ALL">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 857.952755910000000000
          Width = 79.370078740000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[AVG(<ReportDsetData."AVG_AGE_CAND_DOC">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 937.322834650000000000
          Width = 79.370078740000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[AVG(<ReportDsetData."AVG_AGE_DOC_PROF">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 264.567100000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."NAME_DEPARTMENT_UPPER"'
        object Memo5: TfrxMemoView
          Left = 37.795300000000000000
          Width = 982.677800000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT_UPPER"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 200
    Top = 59
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 272
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 272
    Top = 56
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 272
    Top = 112
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 117
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 128
    Top = 117
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object PDFExp: TfrxPDFExport
    UseFileCache = True
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 200
    Top = 168
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 264
    Top = 168
  end
end
