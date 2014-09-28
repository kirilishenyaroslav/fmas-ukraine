object DM: TDM
  OldCreateOrder = False
  Left = 419
  Top = 183
  Height = 327
  Width = 433
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
    ReportOptions.CreateDate = 38687.397620613400000000
    ReportOptions.LastChange = 39106.501141851850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
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
        Name = 'CUR_DATE'
        Value = #39'29.12.2005'#39
      end
      item
        Name = 'DATE_BEG'
        Value = #39'01.12.2005'#39
      end
      item
        Name = 'DATE_END'
        Value = #39'31.12.2005'#39
      end
      item
        Name = 'FIRM_NAME'
        Value = #39#1044#1054#1053#1045#1062#1068#1050#1048#1049' '#1053#1040#1062#1030#1054#1053#1040#1051#1068#1053#1048#1049' '#1059#1053#1030#1042#1045#1056#1057#1048#1058#1045#1058#39
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 1009.134510000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 407.102660000000000000
          Top = 19.779530000000000000
          Width = 194.929190000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1087#1080#1089#1086#1082' '#1087#1088#1072#1094#1102#1102#1095#1080#1093)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 3.779530000000000000
          Width = 529.102660000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[ReportDsetData."NAME_PRED"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 846.614720000000000000
          Top = 26.456710000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [ReportDsetData."CUR_DATE"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 846.614720000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470'28')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baCenter
          Left = 282.441095000000000000
          Top = 45.795300000000000000
          Width = 444.252320000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1079#1072' [ReportDsetData."NAME_NATIONALITY"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 26.456710000000000000
        Top = 238.110390000000000000
        Width = 1009.134510000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo13: TfrxMemoView
          Left = 36.460000000000000000
          Top = 3.779529999999994000
          Width = 212.989530000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'FRDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 343.040000000000000000
          Top = 3.779529999999994000
          Width = 182.310000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[ReportDsetData."POST_NAME"]')
        end
        object Memo18: TfrxMemoView
          Top = 3.779529999999994000
          Width = 36.460000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[Line#]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 249.448980000000000000
          Top = 3.779529999999994000
          Width = 93.590470000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."BIRTH_DATE"]')
        end
        object Memo10: TfrxMemoView
          Left = 525.354670000000100000
          Top = 3.779529999999994000
          Width = 332.598640000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[ReportDsetData."HOME_ADR"]')
        end
        object Memo23: TfrxMemoView
          Left = 857.953310000000000000
          Top = 3.779529999999994000
          Width = 148.910000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."HOME_PHONE"]  [ReportDsetData."WORK_PPHONE"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 113.385900000000000000
        Width = 1009.134510000000000000
        Stretched = True
        object Memo7: TfrxMemoView
          Top = 3.779529999999994000
          Width = 36.460000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 36.460000000000000000
          Top = 3.779529999999994000
          Width = 212.989530000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1041'.')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 343.040000000000000000
          Top = 3.779529999999994000
          Width = 182.310000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 249.448980000000000000
          Top = 3.779529999999994000
          Width = 93.590470000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078'.')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 525.354670000000100000
          Top = 3.779529999999994000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1084'. '#1072#1076#1088#1077#1089#1072)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 861.732840000000000000
          Top = 3.779529999999994000
          Width = 148.910000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1077#1083#1077#1092#1086#1085)
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 196.535560000000000000
        Width = 1009.134510000000000000
        AllowSplit = True
        Condition = 'ReportDsetData."NAME_FACULTY"'
        Stretched = True
        object Memo21: TfrxMemoView
          Width = 1006.866710000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_FACULTY"]')
          ParentFont = False
          SuppressRepeated = True
        end
        object Memo26: TfrxMemoView
          Left = 492.000000000000000000
          Width = 514.866710000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_CAFEDRA"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 20.000000000000000000
        Top = 325.039580000000000000
        Width = 1009.134510000000000000
        AllowSplit = True
        Stretched = True
        object Memo3: TfrxMemoView
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1042#1089#1100#1075#1086' '#1092#1110#1079'. '#1086#1089#1110#1073':')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 120.944960000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Color = clSilver
          Memo.Strings = (
            '[ReportDsetData."PEOPLE_TOTAL"]')
        end
        object Memo12: TfrxMemoView
          Left = 264.567100000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1044#1086#1082#1090#1086#1088#1110#1074' '#1085#1072#1091#1082', '#1087#1088#1086#1092#1077#1089#1086#1088#1110#1074':')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 457.323130000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = clSilver
          Memo.Strings = (
            '[ReportDsetData."PROF_COUNT"]')
        end
        object Memo16: TfrxMemoView
          Left = 578.268090000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1050#1072#1085#1076#1080#1076#1072#1090#1110#1074' '#1085#1072#1091#1082', '#1076#1086#1094#1077#1085#1090#1110#1074':')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 774.803650000000000000
          Width = 232.066710000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = clSilver
          Memo.Strings = (
            '[ReportDsetData."CANDIDATE_COUNT"]')
        end
        object Line4: TfrxLineView
          Width = 1006.866710000000000000
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Top = 18.897650000000000000
          Width = 1006.866710000000000000
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 366.614410000000000000
        Width = 1009.134510000000000000
        object Memo25: TfrxMemoView
          Left = 894.236240000000000000
          Width = 115.433210000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1086#1088'. [Page#]')
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
    Left = 296
    Top = 192
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 360
    Top = 144
  end
end
