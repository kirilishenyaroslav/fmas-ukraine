object DM: TDM
  OldCreateOrder = False
  Left = 419
  Top = 183
  Height = 305
  Width = 426
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
  object ReportDSetGlobalData: TfrxDBDataset
    UserName = 'ReportDsetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 200
    Top = 180
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
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38702.345258599490000000
    ReportOptions.LastChange = 39144.570450104170000000
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
      end
      item
        DataSet = ReportDSetGlobalData
        DataSetName = 'ReportDsetGlobalData'
      end>
    Variables = <
      item
        Name = 'NameV'
        Value = #39#1044#1054#1053#1045#1062#1068#1050#1048#1049' '#1053#1040#1062#1030#1054#1053#1040#1051#1068#1053#1048#1049' '#1059#1053#1030#1042#1045#1056#1057#1048#1058#1045#1058#39
      end
      item
        Name = 'Kvartal'
        Value = #39'(I   '#1082#1074#1072#1088#1090#1072#1083' 2005 '#1088#1088')'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Height = 100.944960000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Width = 466.362400000000000000
          Height = 26.015770000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetData."NAME_PRED"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 46.015770000000010000
          Width = 717.008350000000000000
          Height = 27.149660000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1087#1080#1089#1086#1082' '#1110#1085#1074#1072#1083#1110#1076#1110#1074' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 236.000000000000000000
          Top = 76.000000000000000000
          Width = 88.787570000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 324.787570000000000000
          Top = 76.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetData."DATE_BEG"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 404.157700000000000000
          Top = 76.000000000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1087#1086)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 426.834880000000000000
          Top = 76.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetData."DATE_END"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 564.000000000000000000
          Width = 152.740000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [ReportDsetData."CUR_DATE"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 332.598640000000000000
        Width = 680.315400000000000000
        object Memo5: TfrxMemoView
          Left = 884.410020000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1057#1090#1086#1088#1110#1085#1082#1072' [Page#]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 603.779840000000000000
          Width = 77.417440000000000000
          Height = 18.897650000000000000
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
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 44.672950000000000000
        ParentFont = False
        Top = 143.622140000000000000
        Width = 680.315400000000000000
        object Memo6: TfrxMemoView
          Left = 58.236240000000000000
          Top = 0.200469999999995700
          Width = 266.803340000000000000
          Height = 44.472480000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1041'.')
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Top = 0.200469999999995700
          Width = 58.236240000000000000
          Height = 44.472480000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 325.039580000000000000
          Top = 0.200469999999995700
          Width = 113.385900000000000000
          Height = 44.472480000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1074#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1103' '#1110#1085#1074#1072#1083#1110#1076#1085#1086#1089#1090#1110)
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 438.425480000000000000
          Top = 0.200469999999995700
          Width = 120.944960000000000000
          Height = 44.472480000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090#1088#1086#1082' '#1076#1110#1111' '#1110#1085#1074#1072#1083#1110#1076#1085#1086#1089#1090#1110)
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 559.370440000000000000
          Top = 0.200469999999995700
          Width = 119.842610000000000000
          Height = 44.472480000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1084#1110#1090#1082#1072)
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 249.448980000000000000
        Width = 680.315400000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo13: TfrxMemoView
          Left = 58.236240000000000000
          Width = 266.802820000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Width = 58.240000000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 325.043290000000000000
          Width = 113.390000000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."DATEVST"]')
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 438.423290000000000000
          Width = 120.943760000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."RANGEINVALID"]')
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 559.367049999999900000
          Width = 119.837650000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
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
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 179
    poSQLINT64ToBCD = True
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
    Left = 288
    Top = 184
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 360
    Top = 192
  end
end
