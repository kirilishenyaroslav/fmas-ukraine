object DM: TDM
  OldCreateOrder = False
  Left = 379
  Top = 137
  Height = 378
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
    EngineOptions.ConvertNulls = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 39119.626186689810000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 200
    Top = 16
    Datasets = <
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
      end
      item
        DataSet = ReportDSetGlobalData
        DataSetName = 'ReportDsetGlobalData'
      end>
    Variables = <>
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      PrintOnPreviousPage = True
      object PageHeader1: TfrxPageHeader
        Height = 18.897650000000000000
        Top = 136.063080000000000000
        Width = 1009.134510000000000000
        PrintOnFirstPage = False
        object Memo1: TfrxMemoView
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [ReportDsetGlobalData."CUR_DATE"]')
        end
        object Memo2: TfrxMemoView
          Left = 789.921770000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1086#1088'. [<Page>] '#1079' [<TotalPages>]')
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 1009.134510000000000000
        object Memo3: TfrxMemoView
          Left = 862.425170000000000000
          Top = 43.779530000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [ReportDsetGlobalData."CUR_DATE"]')
        end
        object Memo4: TfrxMemoView
          Left = 789.921770000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          Visible = False
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1086#1088'. [<Page>] '#1079' [<TotalPages>]')
        end
        object Memo5: TfrxMemoView
          Left = 910.866730000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470'30')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 41.574830000000000000
          Width = 1001.575450000000000000
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
        object Memo32: TfrxMemoView
          Top = 68.031540000000010000
          Width = 1005.354980000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1096#1090#1072#1090#1085#1080#1093' '#1055#1042#1057', '#1097#1086' '#1085#1077' '#1084#1072#1102#1090#1100' '#1074#1095#1077#1085#1086#1075#1086' '#1089#1090#1091#1087#1110#1085#1103', '#1074#1095#1077#1085#1086#1075#1086' '#1079#1074#1072#1085#1085#1103)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 272.126160000000000000
        Width = 1009.134510000000000000
        DataSet = ReportDSetGlobalData
        DataSetName = 'ReportDsetGlobalData'
        KeepTogether = True
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
        object Memo8: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Color = 13882323
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetGlobalData."R_NAME_DEP"]')
        end
      end
      object DetailData1: TfrxDetailData
        Height = 18.897650000000000000
        Top = 313.700990000000000000
        Width = 1009.134510000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo9: TfrxMemoView
          Width = 266.744230000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
        end
        object Memo10: TfrxMemoView
          Left = 464.882190000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."COUNT_STAVKA"]')
        end
        object Memo11: TfrxMemoView
          Left = 517.795610000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_ACCEPT_COND"]')
        end
        object Memo12: TfrxMemoView
          Left = 604.724800000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDSetDataPeople."ACCEPT_COND_DATE_END"]')
        end
        object Memo13: TfrxMemoView
          Left = 684.094930000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."AGE"]')
        end
        object Memo14: TfrxMemoView
          Left = 718.110700000000000000
          Width = 113.381410000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."PENSION_DATE"]')
        end
        object Memo15: TfrxMemoView
          Left = 831.491880000000000000
          Width = 177.642820000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo42: TfrxMemoView
          Left = 304.539530000000000000
          Width = 160.338590000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_POST"]')
        end
        object Memo44: TfrxMemoView
          Left = 267.212598425196900000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_SHORT_REASON"]')
          VAlign = vaCenter
        end
      end
      object DetailData2: TfrxDetailData
        Height = 18.897650000000000000
        Top = 396.850650000000000000
        Width = 1009.134510000000000000
        DataSetName = 'ReportDSetDataPosts'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        object Memo16: TfrxMemoView
          Width = 273.260360000000000000
          Height = 18.897650000000000000
          DataSetName = 'ReportDSetDataPosts'
          Frame.Typ = [ftLeft]
          HAlign = haRight
        end
        object Memo17: TfrxMemoView
          Left = 284.598950000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSetName = 'ReportDSetDataPosts'
          HAlign = haRight
        end
        object Memo18: TfrxMemoView
          Left = 405.543910000000000000
          Width = 112.250000000000000000
          Height = 18.897650000000000000
          DataSetName = 'ReportDSetDataPosts'
          Frame.Typ = [ftRight]
          HAlign = haRight
        end
        object Memo21: TfrxMemoView
          Left = 273.260360000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            ':')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 394.205320000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            ':')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 18.897650000000000000
        Top = 355.275820000000000000
        Width = 1009.134510000000000000
        object Memo19: TfrxMemoView
          Width = 273.260360000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haRight
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
        end
        object Memo20: TfrxMemoView
          Left = 284.598950000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1110#1093)
        end
        object Memo23: TfrxMemoView
          Left = 273.260360000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            ':')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 394.205320000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            ':')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 405.543910000000000000
          Width = 112.250000000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1077#1085#1089#1110#1081#1085#1086#1075#1086' '#1074#1110#1082#1091)
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 438.425480000000000000
        Width = 1009.134510000000000000
        object Memo26: TfrxMemoView
          Width = 273.260000000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086':')
        end
        object Memo27: TfrxMemoView
          Left = 284.598950000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Visible = False
          Color = 15000804
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDSetDataPosts."CNT_ALL">,DetailData2)]')
        end
        object Memo28: TfrxMemoView
          Left = 273.260360000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            ':')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 394.205320000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            ':')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 405.543910000000000000
          Width = 112.250000000000000000
          Height = 18.897650000000000000
          Visible = False
          Color = 15000804
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDSetDataPosts."CNT_PENSION">,DetailData2)]')
        end
      end
      object Header2: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 34.015770000000000000
        ParentFont = False
        Top = 215.433210000000000000
        Width = 1009.134510000000000000
        ReprintOnNewPage = True
        object Memo33: TfrxMemoView
          Width = 266.744230000000000000
          Height = 34.015770000000010000
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1041'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 464.882190000000000000
          Width = 52.913420000000000000
          Height = 34.015770000000000000
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090#1072#1074#1082#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 517.795610000000000000
          Width = 86.929190000000000000
          Height = 34.015770000000000000
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1084#1086#1074#1080' '#1074#1089#1090#1091#1087#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 604.724800000000000000
          Width = 79.370130000000000000
          Height = 34.015770000000000000
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 684.094930000000000000
          Width = 34.015770000000000000
          Height = 34.015770000000000000
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 718.110700000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1074#1080#1087#1086#1074#1085#1077#1085#1085#1103' '#1087#1077#1085#1089#1110#1081#1085#1086#1075#1086' '#1074#1110#1082#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 831.496600000000000000
          Width = 177.637910000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1084#1110#1090#1082#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 304.539530000000000000
          Width = 160.338590000000000000
          Height = 34.020000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 267.212598430000000000
          Width = 37.795300000000000000
          Height = 34.015748030000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1089#1085'.'#1088#1086#1073'.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 64.252010000000000000
        Top = 517.795610000000000000
        Width = 1009.134510000000000000
        object Memo40: TfrxMemoView
          Left = 90.708720000000000000
          Top = 41.574830000000020000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          Visible = False
          DataField = 'HEADER_POST'
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetGlobalData."HEADER_POST"]')
        end
        object Memo41: TfrxMemoView
          Left = 642.520100000000000000
          Top = 41.574830000000020000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          Visible = False
          DataField = 'HEADER_FIO'
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Memo.Strings = (
            '[ReportDsetGlobalData."HEADER_FIO"]')
        end
      end
      object Memo7: TfrxMemoView
        Top = 18.677180000000000000
        Width = 812.441560000000000000
        Height = 18.897650000000000000
        DataSet = ReportDSetGlobalData
        DataSetName = 'ReportDsetGlobalData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[ReportDsetGlobalData."NAME_PRED"]')
        ParentFont = False
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
    DataSource = DataSource1
    Left = 40
    Top = 181
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 115
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
  object DataSource1: TDataSource
    DataSet = DSetGlobalData
    Left = 112
    Top = 184
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
    Left = 248
    Top = 232
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 192
    Top = 232
  end
end
