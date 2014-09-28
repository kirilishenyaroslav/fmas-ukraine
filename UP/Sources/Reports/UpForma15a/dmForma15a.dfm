object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 170
  Height = 294
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
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38706.462171944400000000
    ReportOptions.LastChange = 39109.690760625000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var PLine:integer=0;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  PLine:=0;'
      'end;'
      ''
      'procedure Memo25OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  inc(PLine);'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 200
    Datasets = <
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 34.015770000000000000
        ParentFont = False
        Top = 173.858380000000000000
        Width = 1046.929810000000000000
        ReprintOnNewPage = True
        object Memo1: TfrxMemoView
          Left = 37.795300000000000000
          Width = 302.362400000000000000
          Height = 34.015770000000000000
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1041'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 340.157700000000000000
          Width = 94.488250000000000000
          Height = 34.015770000000000000
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 434.645950000000000000
          Width = 71.811070000000000000
          Height = 34.015770000000000000
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1087#1088'. '#1076#1086' '#1042#1053#1047)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 506.457020000000000000
          Width = 173.858380000000000000
          Height = 34.015770000000000000
          DataSetName = 'ReportDSetDataPeople'
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
        object Memo5: TfrxMemoView
          Left = 680.315400000000000000
          Width = 188.976500000000000000
          Height = 34.015770000000000000
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 869.291900000000000000
          Width = 177.637910000000000000
          Height = 34.015770000000000000
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1095#1077#1085#1080#1081' '#1089#1090#1091#1087#1110#1085#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Width = 37.795300000000000000
          Height = 34.015770000000000000
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo12: TfrxMemoView
          Left = 896.440940000000000000
          Top = 18.897650000000000000
          Width = 151.181200000000000000
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
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470'15a')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
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
            #1057' '#1055' '#1048' '#1057' '#1054' '#1050)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Top = 60.472480000000000000
          Width = 1046.929810000000000000
          Height = 22.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086#1082#1090#1086#1088#1110#1074', '#1087#1088#1086#1092#1077#1089#1086#1088#1110#1074)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Width = 881.764380000000000000
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
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 434.645950000000000000
        Width = 1046.929810000000000000
        object Memo27: TfrxMemoView
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
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 355.275820000000000000
        Width = 1046.929810000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        KeepTogether = True
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
        object Memo21: TfrxMemoView
          Left = 37.795300000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 340.157700000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."BIRTH_DATE"]')
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 434.645950000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATE_CAME"]')
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 506.457020000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Memo.Strings = (
            '[ReportDsetData."NAME_POST"]')
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 680.315400000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Memo.Strings = (
            '[ReportDsetData."ALL_UCH_ZVANIE"]')
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 869.291900000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Memo.Strings = (
            '[ReportDsetData."ALL_UCH_STEPEN"]')
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo25OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          HAlign = haCenter
          Memo.Strings = (
            '[PLine]')
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 230.551330000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."WORK_REASON_FULL"'
        Stretched = True
        object Memo22: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WORK_REASON_FULL"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 272.126160000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."NAME_DEPARTMENT_UPPER"'
        Stretched = True
        object Memo23: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT_UPPER"]')
          ParentFont = False
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 313.700990000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."NAME_DEPARTMENT"'
        object Memo8: TfrxMemoView
          Left = 37.795300000000000000
          Width = 1009.134510000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsUnderline]
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT"]')
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
    Left = 272
    Top = 168
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 208
    Top = 184
  end
end
