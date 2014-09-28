object DM: TDM
  OldCreateOrder = False
  Left = 419
  Top = 183
  Height = 325
  Width = 416
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
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39139.532652071800000000
    ReportOptions.LastChange = 41822.412453159720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var cnt_man, cnt_woman:Integer;'
      ''
      'procedure Memo4OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   memo4.clear;'
      '   memo4.text:=IntToStr(cnt_man);'
      'end;'
      ''
      'procedure Memo13OnBeforePrint(Sender: TfrxComponent);'
      'var id_sex:Integer;'
      'begin'
      '    id_sex:=<ReportDsetData."OUT_ID_SEX">;'
      '    if (id_sex=1) then cnt_man:=cnt_man+1'
      '    else cnt_woman:=cnt_woman+1;'
      'end;'
      ''
      'procedure Memo20OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  memo20.clear;'
      '  memo20.Text:=IntToStr(cnt_woman);'
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
      Font.Height = -16
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
      object ReportTitle1: TfrxReportTitle
        Height = 102.047310000000000000
        Top = 18.897650000000000000
        Width = 1009.134510000000000000
        object Memo2: TfrxMemoView
          Width = 1009.133997400000000000
          Height = 34.015770000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_PRED"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 49.133890000000000000
          Width = 1009.134510000000000000
          Height = 41.574830000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1087#1080#1089#1086#1082' '
            
              #1087#1088#1072#1094#1102#1102#1095#1080#1093'  '#1087#1077#1085#1089#1110#1086#1085#1077#1088#1110#1074' '#1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079' [ReportDsetData."DATE_BEG"] '#1087 +
              #1086' [ReportDsetData."DATE_END"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 238.110390000000000000
        Width = 1009.134510000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo12: TfrxMemoView
          Width = 34.015770000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 34.015770000000000000
          Width = 219.212740000000000000
          Height = 22.677180000000000000
          OnBeforePrint = 'Memo13OnBeforePrint'
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO_PENTION"]')
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 325.039580000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."TIN_NUM"]')
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 400.630180000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATE_BIRTH"]')
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 476.220780000000000000
          Width = 366.614410000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."ADRES"]')
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 842.835190000000000000
          Width = 83.149660000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."DATE_WORK_BEG"]')
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 925.984850000000000000
          Width = 83.149660000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_TYPE_PENS"]')
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 253.228510000000000000
          Width = 71.811070000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."TYPE_POST_SHORT_NAME"]')
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 400.630180000000000000
        Width = 1009.134510000000000000
        object Memo1: TfrxMemoView
          Left = 733.128032530000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1089#1090#1086#1088'. [Page#] '#1110#1079' [TotalPages#]')
        end
        object Memo23: TfrxMemoView
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1088#1091#1082#1091': [ReportDsetData."CUR_DATE"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 34.015770000000000000
        ParentFont = False
        Top = 143.622140000000000000
        Width = 1009.134510000000000000
        object Memo5: TfrxMemoView
          Width = 34.015770000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 34.015770000000000000
          Width = 219.212740000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103', '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110)
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 325.039580000000000000
          Width = 75.590600000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1076#1077#1085#1090'. '#1085#1086#1084#1077#1088)
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 400.630180000000000000
          Width = 75.590600000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103)
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 476.220780000000000000
          Width = 366.614410000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1084#1072#1096#1085#1103' '#1072#1076#1088#1077#1089#1072)
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 842.835190000000000000
          Width = 83.149660000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1087#1088#1080#1079#1085#1072'-'
            #1095#1077#1085#1085#1103' '#1087#1077#1085#1089#1110#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 925.984850000000000000
          Width = 83.149660000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1080#1087' '#1087#1077#1085#1089#1110#1111)
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 253.228510000000000000
          Width = 71.811070000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091)
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 56.692950000000000000
        Top = 321.260050000000000000
        Width = 1009.134510000000000000
        object Memo4: TfrxMemoView
          Left = 94.488250000000000000
          Top = 34.015770000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."CNT_MAN"]')
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 41.574830000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1058#1054#1043#1054':')
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 188.976500000000000000
          Top = 34.015770000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          OnBeforePrint = 'Memo20OnBeforePrint'
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."CNT_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 94.488250000000000000
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1063#1086#1083#1086#1074#1110#1082#1080)
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 188.976500000000000000
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1046#1110#1085#1082#1080)
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
    Left = 280
    Top = 176
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 200
    Top = 232
  end
end
