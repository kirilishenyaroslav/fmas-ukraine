object DM: TDM
  OldCreateOrder = False
  Left = 392
  Top = 283
  Height = 299
  Width = 418
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
    ReportOptions.CreateDate = 37965.713841435200000000
    ReportOptions.LastChange = 39574.788830474530000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo8OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<ReportDsetData."NUMB">=0) then'
      '    begin'
      '        Memo8.Frame.Typ :=ftLeft + ftRight;'
      '        Memo8.Text:='#39#39';'
      '    end'
      '    else Memo8.Frame.Typ :=ftLeft + ftRight+{ftBottom+}ftTop;'
      '    if  (<ReportDsetData."NUMB">=5) then'
      '    begin'
      '        Memo8.Frame.Typ :=ftLeft + ftRight+ftBottom;'
      '        Memo8.Text:='#39#39';'
      '    end'
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
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 81.102350000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo3: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 34.015770000000010000
          Width = 1046.457330000000000000
          Height = 24.881880000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1055#1048#1057#1054#1050' '#1055#1056#1040#1062#1070#1070#1063#1048#1061' '#1030#1053#1042#1040#1051#1030#1044#1030#1042)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo12: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."FIRM_NAME"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 692.976500000000000000
          Top = 62.204700000000000000
          Width = 351.464750000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            
              #1079#1072' '#1087#1077#1088#1110#1086#1076' [ReportDsetData."LOC_DATE_CHECK"] - [ReportDsetData."L' +
              'OC_DATE_END"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 125.574830000000000000
        ParentFont = False
        Top = 124.724490000000000000
        Width = 1046.929810000000000000
        object Memo4: TfrxMemoView
          Width = 44.550000000000000000
          Height = 125.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1088#1103#1076#1082'. '#8470)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 44.550000000000000000
          Width = 280.672820000000000000
          Height = 125.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103', '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 325.222820000000000000
          Width = 77.431880000000010000
          Height = 125.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1086#1084#1077#1088
            #1087#1077#1085#1089#1110#1081#1085#1086#1075#1086
            #1087#1086#1089#1074#1110#1076#1095#1077#1085#1085#1103)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 444.229530000000000000
          Width = 219.212598430000000000
          Height = 76.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1077#1088#1084#1110#1085', '#1085#1072' '#1103#1082#1080#1081' '#1074#1089#1090#1072#1085#1086#1074#1083#1077#1085#1072
            #1110#1085#1074#1072#1083#1110#1076#1085#1110#1090#1100', '#1076#1072#1090#1072' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 444.229530000000000000
          Top = 76.015770000000000000
          Width = 111.447650000000000000
          Height = 49.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1079' ('#1076#1076'.'#1084#1084'.'#1088#1088#1088#1088')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 555.677180000000000000
          Top = 76.015770000000000000
          Width = 107.668120000000000000
          Height = 49.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086' ('#1076#1076'.'#1084#1084'.'#1088#1088#1088#1088')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 833.424150000000000000
          Top = 0.425169999999994300
          Width = 92.550000000000000000
          Height = 125.149660000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1102#1074#1072#1074' '#1087#1086#1074#1085#1080#1093' '#1084#1110#1089#1103#1094#1110#1074' '#1079#1072' '#1087#1077#1088#1110#1086#1076)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 402.519685040000000000
          Width = 41.574803150000000000
          Height = 125.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1043#1088#1091#1087#1072)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 663.307086610000000000
          Width = 170.078740160000000000
          Height = 125.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1084#1072#1096#1085#1103' '#1072#1076#1088#1077#1089#1072', '#1090#1077#1083#1077#1092#1086#1085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 925.984850000000000000
          Width = 119.055118110000000000
          Height = 125.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072' '#1087#1086#1089#1072#1076#1110)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 69.133890000000000000
        Top = 374.173470000000000000
        Width = 1046.929810000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo10: TfrxMemoView
          Left = 44.550000000000000000
          Width = 280.818897640000000000
          Height = 20.000000000000000000
          StretchMode = smActualHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 325.222820000000000000
          Width = 77.480314960000000000
          Height = 20.000000000000000000
          StretchMode = smActualHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DOCUMENT"]')
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 402.654700000000000000
          Width = 41.574803150000000000
          Height = 20.000000000000000000
          StretchMode = smActualHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."INV_GROOP"]')
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 444.094488190000000000
          Width = 111.496062990000000000
          Height = 20.000000000000000000
          StretchMode = smActualHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATE_BEG"]')
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 555.590551180000100000
          Width = 107.716535430000000000
          Height = 20.000000000000000000
          StretchMode = smActualHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATE_END_STR"]')
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 663.307086610000000000
          Width = 170.078740160000000000
          Height = 20.000000000000000000
          StretchMode = smActualHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ADRESS_HOME"]')
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 833.385826770000000000
          Width = 92.598425200000000000
          Height = 20.000000000000000000
          StretchMode = smActualHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WORK_MONTHS"]')
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 925.984850000000000000
          Width = 119.055118110000000000
          Height = 20.000000000000000000
          StretchMode = smActualHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_POST"]')
          VAlign = vaCenter
        end
        object SysMemo1: TfrxSysMemoView
          Width = 44.598425200000000000
          Height = 20.031496060000000000
          StretchMode = smActualHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[LINE#]')
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 502.677490000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          Left = 985.480520000000000000
          Width = 55.559060000000000000
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
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 18.897650000000000000
        ParentFont = False
        Top = 332.598640000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."NAME_DEPARTMENT"'
        Stretched = True
        object Memo9: TfrxMemoView
          Width = 1045.039370080000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT"]')
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Top = 309.921460000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."NAME_TYPE_POST"'
        Stretched = True
        object Memo8: TfrxMemoView
          Width = 1045.039370080000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsUnderline]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_TYPE_POST"]')
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
    Left = 216
    Top = 184
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 288
    Top = 184
  end
end
