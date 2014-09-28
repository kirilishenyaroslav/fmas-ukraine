object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 170
  Height = 313
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
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38687.397620613400000000
    ReportOptions.LastChange = 41674.496925243050000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '       FIRM_NAME:String;'
      '       CUR_DATE:String;'
      '       PROPERTY_NAME: String;'
      '       SCIENCE: String;'
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
        Name = 'AGE'
        Value = '21'
      end
      item
        Name = 'CUR_YEAR'
        Value = '2005'
      end
      item
        Name = 'CUR_DATE'
        Value = #39'21.12.2005'#39
      end
      item
        Name = 'FIRM_NAME'
        Value = #39#1044#1054#1053#1045#1062#1068#1050#1048#1049' '#1053#1040#1062#1030#1054#1053#1040#1051#1068#1053#1048#1049' '#1059#1053#1030#1042#1045#1056#1057#1048#1058#1045#1058#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 100.031540000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = -0.173160000000000000
          Top = 42.236240000000000000
          Width = 718.457020000000000000
          Height = 42.677180000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1091#1095#1077#1085#1080#1093', '#1103#1082#1110' '#1084#1072#1102#1090#1100' '#1085#1072#1091#1082'. '#1089#1090#1091#1087#1110#1085#1100'/'#1079#1074#1072#1085#1085#1103)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Width = 546.803340000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[FIRM_NAME]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072':[CUR_DATE]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 359.055350000000000000
        Width = 718.110700000000000000
        AllowSplit = True
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo13: TfrxMemoView
          Left = 45.000000000000000000
          Width = 200.670000000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          DataSetName = 'FRDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 245.669450000000000000
          Width = 170.078850000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[ReportDsetData."REGARDS_STEP"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 415.748300000000000000
          Width = 166.299320000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[ReportDsetData."REGARDS_ZVAN"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.063080000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[ReportDsetData."SCIENCE_SPEC"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Width = 45.000000000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Line#]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 143.622140000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo7: TfrxMemoView
          Top = 3.779529999999990000
          Width = 45.000000000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
        end
        object Memo8: TfrxMemoView
          Left = 45.000000000000000000
          Top = 3.779529999999990000
          Width = 200.670000000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1041'.')
        end
        object Memo9: TfrxMemoView
          Left = 245.669450000000000000
          Top = 3.779529999999990000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1095'. '#1089#1090#1091#1087#1110#1085#1100', '#1088#1110#1082' '#1087#1088#1080#1089#1074'.')
        end
        object Memo10: TfrxMemoView
          Left = 415.748300000000000000
          Top = 3.779529999999990000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1095'. '#1079#1074#1072#1085#1085#1103', '#1088#1110#1082' '#1087#1088#1080#1089#1074'.')
        end
        object Memo12: TfrxMemoView
          Left = 582.047620000000000000
          Top = 3.779529999999990000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1091#1082#1086#1074#1072' '#1089#1087#1077#1094'-'#1090#1100)
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 18.897650000000000000
        ParentFont = False
        Top = 275.905690000000000000
        Width = 718.110700000000000000
        Condition = 'ReportDsetData."DISPLAY_2"'
        Stretched = True
        object Memo21: TfrxMemoView
          Width = 718.110236220000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."DEPARTMENT_NAME_UPPER"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        AllowSplit = True
        Condition = 'ReportDsetData."DISPLAY_1"'
        Stretched = True
        object Memo22: TfrxMemoView
          Width = 718.110236220000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."DEPARTMENT_NAME"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 442.205010000000000000
        Width = 718.110700000000000000
        object Memo23: TfrxMemoView
          Left = 623.622450000000000000
          Top = 3.779530000000020000
          Width = 94.488250000000000000
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
      object GroupHeader3: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 28.000000000000000000
        ParentFont = False
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        Condition = 'ReportDsetData."WORK_REASON"'
        object Memo2: TfrxMemoView
          Top = 4.000000000000000000
          Width = 718.110236220472000000
          Height = 16.000000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WORK_REASON"]')
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
    Left = 192
    Top = 176
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 264
    Top = 176
  end
end
