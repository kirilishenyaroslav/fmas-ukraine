object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 170
  Height = 306
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
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38687.397620613400000000
    ReportOptions.LastChange = 39106.595130381900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '       NATIONALITY:String;'
      '       FIRM_NAME:String;'
      '       CUR_DATE:String;'
      '       TotalMan:Integer;'
      '       ShtatMan:Integer;'
      '       REGARD_NAME:String;'
      'procedure Memo13OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '       Inc(TotalMan);'
      '       if <ReportDsetData."ID_REASON">=1 then Inc(ShtatMan);'
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  TotalMan:=0;'
      '  ShtatMan:=0;'
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
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
        Name = 'CUR_DATE'
        Value = #39'20.12.2005'#39
      end
      item
        Name = 'FIRM_NAME'
        Value = #39#1044#1054#1053#1045#1062#1068#1050#1048#1049' '#1053#1040#1062#1030#1054#1053#1040#1051#1068#1053#1048#1049' '#1059#1053#1030#1042#1045#1056#1057#1048#1058#1045#1058#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo1: TfrxMemoView
          Top = 19.779530000000000000
          Width = 1046.740260000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1055#1048#1057#1054#1050)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Width = 801.260360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[FIRM_NAME]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 888.189550000000000000
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
        object Memo2: TfrxMemoView
          Left = 0.157700000000000000
          Top = 42.456710000000000000
          Width = 1045.953000000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1084#1072#1102#1090#1100' [REGARD_NAME]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 26.456710000000000000
        ParentFont = False
        Top = 309.921460000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo13: TfrxMemoView
          Left = 34.460000000000000000
          Top = 3.779530000000022000
          Width = 240.570000000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo13OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'FRDataSet'
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
        end
        object Memo14: TfrxMemoView
          Left = 449.764070000000000000
          Top = 3.779530000000022000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[ReportDsetData."POST_NAME"]')
        end
        object Memo18: TfrxMemoView
          Top = 3.779530000000022000
          Width = 34.460000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[Line#]')
        end
        object Memo6: TfrxMemoView
          Left = 275.020000000000000000
          Top = 3.779530000000022000
          Width = 80.250000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[ReportDsetData."WORK_REASON"]')
        end
        object Memo11: TfrxMemoView
          Left = 355.275820000000000000
          Top = 3.779530000000022000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[ReportDsetData."DATE_BIRTH"]')
        end
        object Memo12: TfrxMemoView
          Left = 665.197280000000000000
          Top = 3.779530000000022000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."REGARDS"]')
        end
        object Memo15: TfrxMemoView
          Left = 884.410020000000000000
          Top = 3.779530000000022000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[ReportDsetData."YEAR_REGARD"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 42.677180000000000000
        ParentFont = False
        Top = 117.165430000000000000
        Width = 1046.929810000000000000
        object Memo7: TfrxMemoView
          Top = 3.779529999999994000
          Width = 34.456710000000000000
          Height = 37.800000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 34.456710000000000000
          Top = 3.779529999999994000
          Width = 240.567100000000000000
          Height = 37.800000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1030#1041)
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 449.764070000000000000
          Top = 3.779529999999994000
          Width = 215.433210000000000000
          Height = 37.800000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 275.023810000000000000
          Top = 3.779529999999994000
          Width = 80.252010000000000000
          Height = 37.800000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1089#1090#1072#1074#1072' '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080)
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 665.197280000000000000
          Top = 3.779529999999994000
          Width = 219.212740000000000000
          Height = 37.800000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1076' '#1079#1074#1072#1085#1085#1103)
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 355.275820000000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 37.800000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078'.')
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 884.410020000000000000
          Top = 3.779529999999994000
          Width = 162.519790000000000000
          Height = 37.800000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1110#1082' '#1085#1072#1075#1086#1088#1086#1076#1078'.')
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 268.346630000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."DEPARTMENT_NAME_UPPER"'
        ReprintOnNewPage = True
        object Memo21: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsUnderline]
          Frame.Color = clSilver
          Memo.Strings = (
            '[ReportDsetData."DEPARTMENT_NAME_UPPER"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 442.205010000000000000
        Width = 1046.929810000000000000
        object Memo17: TfrxMemoView
          Left = 948.662030000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[Page#]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 396.850650000000000000
        Width = 1046.929810000000000000
        object Memo16: TfrxMemoView
          Left = 79.370130000000000000
          Width = 107.464750000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1042#1089#1100#1075#1086': [TotalMan]')
        end
        object Memo23: TfrxMemoView
          Left = 192.000000000000000000
          Width = 168.000000000000000000
          Height = 18.900000000000000000
          OnAfterPrint = 'Memo23OnAfterPrint'
          OnBeforePrint = 'Memo23OnBeforePrint'
          Memo.Strings = (
            '('#1079' '#1085#1080#1093' '#1096#1090#1072#1090#1085#1080#1093':[ShtatMan])')
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 28.000000000000000000
        ParentFont = False
        Top = 219.212740000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."WORK_REASON"'
        object Memo22: TfrxMemoView
          Top = 4.000000000000000000
          Width = 1048.031540000000000000
          Height = 16.000000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WORK_REASON_FULL"]')
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
    Left = 280
    Top = 176
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 208
    Top = 176
  end
end
