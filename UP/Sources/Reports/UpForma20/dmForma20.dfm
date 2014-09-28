object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 170
  Height = 282
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
    TimeoutAction = TARollback
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
    ReportOptions.LastChange = 39137.808966828700000000
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
        Name = 'PTerm'
        Value = #39#1074' '#1090#1077#1088#1084#1110#1085' '#1079' 01.09.2005 '#1087#1086' 31.01.2006'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Height = 161.795300000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        ReprintOnNewPage = True
        Stretched = True
        object Memo6: TfrxMemoView
          Left = 45.354360000000000000
          Top = 124.000000000000000000
          Width = 241.008040000000000000
          Height = 37.795300000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'. '#1030'. '#1041'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 286.362400000000000000
          Top = 124.000000000000000000
          Width = 109.165430000000000000
          Height = 37.795300000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 395.527830000000000000
          Top = 124.000000000000000000
          Width = 218.078850000000000000
          Height = 37.795300000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1095#1077#1085#1080#1081' '#1089#1090#1091#1087#1110#1085#1100', '
            #1074#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo2: TfrxSysMemoView
          Top = 124.000000000000000000
          Width = 45.354360000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1087'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 666.520100000000000000
          Top = 124.000000000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1085#1072#1082#1072#1079#1091
            #1044#1072#1090#1072' '#1085#1072#1082#1072#1079#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 949.984850000000000000
          Top = 124.000000000000000000
          Width = 96.950000000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1076#1072#1090#1086#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 745.890230000000000000
          Top = 142.897650000000000000
          Width = 68.030000000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1079)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 813.920000000000000000
          Top = 142.897650000000000000
          Width = 68.030000000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 613.606680000000000000
          Top = 124.000000000000000000
          Width = 52.913420000000000000
          Height = 37.795300000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1084#1086#1074#1080' '#1074#1089#1090#1091#1087#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 881.953310000000000000
          Top = 124.000000000000000000
          Width = 68.031540000000000000
          Height = 37.795300000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1083#1072#1085'. '#1076#1072#1090#1072' '#1074#1080#1073#1088#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 745.890230000000000000
          Top = 124.000000000000000000
          Width = 136.060000000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1088#1072#1093#1086#1074#1072#1085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 952.441560000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470'20')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Top = 37.795300000000000000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103)
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Width = 952.441560000000000000
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
        object Memo35: TfrxMemoView
          Top = 56.692950000000000000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            
              #1087#1088#1086' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1090#1077#1088#1084#1110#1085#1086#1074' '#1090#1088#1091#1076#1086#1074#1080#1093' '#1076#1086#1075#1086#1074#1086#1088#1110#1074' '#1087#1088#1086#1092#1077#1089#1086#1088#1089#1100#1082#1086'-'#1074#1080#1082#1083#1072#1076#1072#1094 +
              #1100#1082#1086#1075#1086' '#1089#1082#1083#1072#1076#1091)
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 903.307670000000000000
          Top = 18.897650000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [CUR_DATE]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Top = 75.590599999999990000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            
              #1074' '#1090#1077#1088#1084#1080#1085' '#1079' [ReportDsetData."LOC_DATE_BEG"] '#1087#1086' [ReportDsetData."L' +
              'OC_DATE_END"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.900000000000000000
        Top = 204.094620000000000000
        Width = 1046.929810000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        PrintIfDetailEmpty = True
        RowCount = 0
        StartNewPage = True
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 553.574670000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT_UPPER"]')
          ParentFont = False
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 553.570000000000000000
          Width = 493.360000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsUnderline]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object DetailData1: TfrxDetailData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 245.669450000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'DetailData1OnBeforePrint'
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 45.350000000000000000
          Width = 241.010000000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
        end
        object Memo3: TfrxMemoView
          Left = 286.360000000000000000
          Width = 109.170000000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_POST"]')
        end
        object Memo4: TfrxMemoView
          Left = 395.527830000000000000
          Width = 218.078850000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."STEP"]'
            '[ReportDsetData."ZVAN"]')
        end
        object Memo5: TfrxMemoView
          Left = 666.520100000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ORDER_NUM"]'
            '[ReportDsetData."ORDER_DATE"]')
        end
        object Memo20: TfrxMemoView
          Left = 949.980000000000000000
          Width = 96.950000000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop, ftBottom]
        end
        object Memo26: TfrxMemoView
          Left = 745.890230000000000000
          Width = 68.030000000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ACCEPT_COND_DATE_BEG"]')
        end
        object Memo27: TfrxMemoView
          Left = 813.920000000000000000
          Width = 68.030000000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ACCEPT_COND_DATE_END"]')
        end
        object Memo28: TfrxMemoView
          Left = 613.606680000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              '[ReportDsetData."NAME_ACCEPT_COND"][ReportDsetData."YEAR_ACCEPT_' +
              'COND"]')
        end
        object Memo29: TfrxMemoView
          Left = 881.950000000000000000
          Width = 68.030000000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ACCEPT_COND_DATE_END"]')
        end
        object Memo13: TfrxMemoView
          Width = 45.350000000000000000
          Height = 15.120000000000000000
          OnBeforePrint = 'Memo8OnBeforePrint'
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 321.260050000000000000
        Width = 1046.929810000000000000
        object Memo10: TfrxMemoView
          Left = 992.000000000000000000
          Width = 48.000000000000000000
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
    Left = 200
    Top = 176
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 272
    Top = 176
  end
end
