object DM: TDM
  OldCreateOrder = False
  Left = 419
  Top = 183
  Height = 306
  Width = 384
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
    Left = 128
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
    ReportOptions.LastChange = 38715.541902476900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      ' DateNow:String;'
      ' NameV  :String;'
      'begin'
      ''
      'end.')
    Left = 200
    Datasets = <
      item
        DataSetName = 'FRDataSet'
      end>
    Variables = <
      item
        Name = 'NameV'
        Value = #39#1044#1054#1053#1045#1062#1068#1050#1048#1049' '#1053#1040#1062#1030#1054#1053#1040#1051#1068#1053#1048#1049' '#1059#1053#1030#1042#1045#1056#1057#1048#1058#1045#1058#39
      end
      item
        Name = 'DateNow'
        Value = '29.12.2005'
      end>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 279.400000000000000000
      PaperHeight = 215.900000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Height = 79.370130000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 980.410081999999900000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Width = 366.614410000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[NameV]'
            #1040#1057#1059' '#1042#1059#1047)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 755.906000000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1055#1086#1090#1086#1095#1085#1072' '#1076#1072#1090#1072' [DateNow]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 264.567100000000000000
          Top = 18.897650000000000000
          Width = 453.543600000000000000
          Height = 52.913420000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1087#1080#1089#1086#1082' '#1087#1077#1085#1089#1080#1086#1085#1077#1088#1110#1074
            #1044#1086#1085#1077#1094#1100#1082#1080#1081' '#1053#1072#1094#1110#1086#1085#1072#1083#1100#1085#1080#1081' '#1059#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 381.732530000000000000
        Width = 980.410081999999900000
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
      end
      object PageHeader1: TfrxPageHeader
        Height = 102.047310000000000000
        Top = 120.944960000000000000
        Width = 980.410081999999900000
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 967.559680000000000000
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 102.047310000000000000
          Width = 967.559055120000000000
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 33.897659690000000000
          Top = 7.559060000000003000
          Width = 297.416350740000000000
          Height = 90.708720000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1041)
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559060000000003000
          Width = 30.118129690000000000
          Height = 90.708720000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 331.314190350000000000
          Top = 7.559060000000003000
          Width = 94.118975350000000000
          Height = 90.708720000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1076#1077#1090#1080#1085#1092#1110#1082#1072#1110#1081#1085#1080#1081' '#1085#1086#1084#1077#1088)
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 425.433345620000000000
          Top = 7.559060000000003000
          Width = 101.281106240000000000
          Height = 90.708720000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103)
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 527.160102710000000000
          Top = 7.559060000000003000
          Width = 342.747446040000000000
          Height = 90.708720000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1084#1072#1096#1085#1103' '#1072#1076#1088#1077#1089#1072)
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 869.907728690000000000
          Top = 7.559060000000003000
          Width = 100.393423760000000000
          Height = 90.708720000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1087#1088#1080#1081#1086#1084#1072' ('#1086#1092#1086#1088#1084#1083#1077#1085#1085#1103' '#1087#1077#1085#1089#1110#1111')')
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 36.461966670000000000
        Top = 283.464750000000000000
        Width = 980.410081999999900000
        DataSetName = 'FRDataSet'
        RowCount = 0
        Stretched = True
        object Memo13: TfrxMemoView
          Left = 34.015770000000000000
          Width = 297.448818900000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[FRDataSet."FIO_PENTION"]')
        end
        object Memo14: TfrxMemoView
          Left = 3.779530000000000000
          Width = 30.236240000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[Line#]')
        end
        object Memo15: TfrxMemoView
          Left = 329.952755910000000000
          Width = 94.110236220000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[FRDataSet."TIN_NUM"]')
        end
        object Memo16: TfrxMemoView
          Left = 426.218309940000000000
          Width = 101.194039370000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[FRDataSet."DATE_BIRTH"]')
        end
        object Memo17: TfrxMemoView
          Left = 527.790353330000000000
          Width = 342.824146980000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[FRDataSet."ADRES"]')
        end
        object Memo12: TfrxMemoView
          Left = 870.415276660000000000
          Width = 101.658792650000000000
          Height = 34.015748030000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[FRDataSet."DATE_START_PENTION"]')
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
    Left = 224
    Top = 176
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 288
    Top = 176
  end
end
