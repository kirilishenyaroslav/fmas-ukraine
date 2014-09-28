object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 170
  Height = 295
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
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 37965.713841435200000000
    ReportOptions.LastChange = 39141.696153240740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var PLine:integer=0;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  PLine:=0;'
      'end;'
      ''
      'procedure Memo12OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  inc(Pline);'
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
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'T'
        Value = #39#1074#1089#1110' '#1076#1072#1090#1080' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103#39
      end
      item
        Name = 'DEP_NAME'
        Value = #39#1044#1042#1055' '#171#1059#1082#1088#1087#1088#1086#1084#1074#1086#1076#1095#1086#1088#1084#1077#1090#187#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 279.400000000000000000
      PaperHeight = 215.900000000000000000
      PaperSize = 1
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 152.695300000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 980.400633174999700000
        OnBeforePrint = 'OnBeforePrint'
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 2.625486587499836000
          Top = 42.900000000000000000
          Width = 975.149660000000000000
          Height = 88.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1055#1048#1057#1054#1050' '
            #1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074' [ReportDsetData."FIRM_NAME"],'
            #1103#1082#1110' '#1086#1076#1077#1088#1078#1072#1083#1080' '#1087#1088#1077#1084#1110#1111' '#1095#1080' '#1084#1072#1090#1077#1088#1110#1072#1083#1100#1085#1091' '#1076#1086#1087#1086#1084#1086#1075#1091
            
              #1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079' [ReportDsetData."LOC_DATE_BEG"] '#1087#1086' [ReportDsetData."' +
              'LOC_DATE_END"] '#1088#1088'.')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 828.881880000000000000
          Width = 146.738120000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072' [CUR_DATE]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 20.031508260000000000
        ParentFont = False
        Top = 332.598640000000000000
        Width = 980.400633174999700000
        OnAfterCalcHeight = 'OnAfterCalcHeight'
        OnBeforePrint = 'OnBeforePrint'
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo8: TfrxMemoView
          Width = 52.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo8OnBeforePrint'
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 52.000000000000000000
          Width = 209.350000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 261.100000000000000000
          Width = 178.100000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            '[ReportDsetData."NAME_POST"]')
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 439.200000000000000000
          Width = 86.100000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."DATE_AWARD_BON"]')
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 525.300000000000000000
          Width = 106.100000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."TYPE_DOC_PR_AWARD_BON"]')
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 631.400000000000000000
          Width = 78.400000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."SUMMA_BON"]')
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 709.800000000000000000
          Width = 86.100000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."DATE_AWARD_HELP"]')
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 795.900000000000000000
          Width = 106.100000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."TYPE_DOC_PR_AWARD_HELP"]')
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 902.000000000000000000
          Width = 78.400000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."SUMMA_HELP"]')
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 411.968770000000000000
        Width = 980.400633174999700000
        object Memo18: TfrxMemoView
          Left = 916.000000000000000000
          Width = 60.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            ' [Page#]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 37.795300000000000000
        ParentFont = False
        Top = 230.551330000000000000
        Width = 980.400633174999700000
        object Memo2: TfrxMemoView
          Width = 52.000000000000000000
          Height = 37.795275590000000000
          HAlign = haCenter
          Memo.Strings = (
            #8470
            #1087'/'#1087)
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 52.000000000000000000
          Width = 209.354360000000000000
          Height = 37.795275590000000000
          HAlign = haCenter
          Memo.Strings = (
            #1055#1030#1041)
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 261.102350000000000000
          Width = 178.100000000000000000
          Height = 37.795275590000000000
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 439.200000000000000000
          Top = 18.900000000000010000
          Width = 86.100000000000000000
          Height = 18.900000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072)
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 525.300000000000000000
          Top = 18.900000000000010000
          Width = 106.100000000000000000
          Height = 18.900000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1082#1091#1084#1077#1085#1090)
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 631.400000000000000000
          Top = 18.900000000000010000
          Width = 78.400000000000000000
          Height = 18.900000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 439.200000000000000000
          Width = 270.600000000000000000
          Height = 18.900000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1077#1084#1110#1103)
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 709.800000000000000000
          Width = 270.600000000000000000
          Height = 18.900000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1052#1072#1090'. '#1076#1086#1087#1086#1084#1086#1075#1072)
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 709.800000000000000000
          Top = 18.900000000000010000
          Width = 86.100000000000000000
          Height = 18.900000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072)
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 795.900000000000000000
          Top = 18.900000000000010000
          Width = 106.100000000000000000
          Height = 18.900000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1082#1091#1084#1077#1085#1090)
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 902.000000000000000000
          Top = 18.900000000000010000
          Width = 77.900000000000000000
          Height = 18.900000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.900000000000000000
        Top = 291.023810000000000000
        Width = 980.400633174999700000
        Condition = 'ReportDsetData."NAME_DEPARTMENT_UPPER"'
        Stretched = True
        object Memo4: TfrxMemoView
          Align = baCenter
          Left = 1.412981587499856000
          Width = 977.574670000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT_UPPER"]')
          ParentFont = False
          SuppressRepeated = True
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
    Left = 272
    Top = 168
  end
end
