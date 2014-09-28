object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 170
  Height = 314
  Width = 445
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
    ReportOptions.LastChange = 39123.593796469910000000
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
        Value = #39'02.09.2005'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      OnBeforePrint = 'ReportTitle1OnBeforePrint'
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 291.023810000000000000
        Width = 1046.929810000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo2: TfrxMemoView
          Width = 226.770000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'FIO'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 226.771800000000000000
          Width = 80.030000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'BIRTH_DATE'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."BIRTH_DATE"]')
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 306.803340000000000000
          Width = 130.740000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ZVANIE'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."ZVANIE"]')
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 437.543600000000000000
          Width = 167.181200000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'STEPEN'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."STEPEN"]')
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 907.087200000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'POCHET'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."POCHET"]')
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 755.906000000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'AKAD'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."AKAD"]')
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 604.724800000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'SPEC'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."SPEC"]')
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 26.897650000000000000
        ParentFont = False
        Top = 241.889920000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."SHTAT"'
        object Memo22: TfrxMemoView
          Top = 4.000000000000000000
          Width = 1048.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."SHTAT"]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 102.488250000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo8: TfrxMemoView
          Left = 904.000000000000000000
          Width = 143.622140000000000000
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
        object Memo13: TfrxMemoView
          Top = 37.795300000000000000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1087#1080#1089#1086#1082)
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Top = 56.692949999999990000
          Width = 1046.929810000000000000
          Height = 22.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1079#1072#1089#1083#1091#1078#1077#1085#1080#1093' '#1087#1088#1086#1092#1077#1089#1086#1088#1110#1074' '#1090#1072' '#1074#1080#1082#1083#1072#1076#1072#1095#1110#1074)
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Top = 75.590600000000000000
          Width = 1046.929810000000000000
          Height = 22.897650000000000000
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
        object Memo21: TfrxMemoView
          Left = 952.000000000000000000
          Top = 20.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470'6')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 37.795300000000000000
        ParentFont = False
        Top = 181.417440000000000000
        Width = 1046.929810000000000000
        ReprintOnNewPage = True
        object Memo1: TfrxMemoView
          Width = 226.771800000000000000
          Height = 37.795300000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'. '#1030'. '#1041'.')
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 226.771800000000000000
          Width = 80.031540000000000000
          Height = 37.795300000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103)
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 306.803340000000000000
          Width = 130.740260000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103)
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 437.543600000000000000
          Width = 167.181200000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1095#1077#1085#1080#1081' '#1089#1090#1091#1087#1110#1085#1100)
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 907.087200000000000000
          Width = 139.842610000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1095#1077#1089#1085#1077' '#1079#1074#1072#1085#1085#1103)
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 755.906000000000000000
          Width = 151.181200000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1040#1082#1072#1076#1077#1084#1080#1095#1085#1077' '#1074#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103)
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 604.724800000000000000
          Width = 151.181200000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1091#1079#1100#1082#1072' '#1089#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100)
          VAlign = vaCenter
        end
      end
      object Memo15: TfrxMemoView
        Top = 14.897650000000000000
        Width = 738.929810000000000000
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
        Top = 370.393940000000000000
        Width = 1046.929810000000000000
        object Memo10: TfrxMemoView
          Left = 992.000000000000000000
          Width = 51.779530000000000000
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
    Left = 344
    Top = 8
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 352
    Top = 72
  end
end
