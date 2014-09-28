object DM: TDM
  OldCreateOrder = False
  Left = 264
  Top = 201
  Height = 275
  Width = 356
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 40
    Top = 60
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 59
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 184
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 168
    Top = 180
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 115
    poSQLINT64ToBCD = True
  end
  object ReportDSetGlobalData: TfrxDBDataset
    UserName = 'ReportDsetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 168
    Top = 116
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 256
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 256
    Top = 60
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 256
    Top = 116
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38702.345258599500000000
    ReportOptions.LastChange = 38978.408690138890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 168
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
        Name = 'DateNow'
        Value = #39'27.12.2005'#39
      end
      item
        Name = 'DateBeg'
        Value = #39'27.12.2005'#39
      end
      item
        Name = 'DateEnd'
        Value = #39'27.12.2005'#39
      end>
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
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Height = 108.283550000000000000
        ParentFont = False
        Top = 16.000000000000000000
        Width = 1046.920361175000000000
        object Memo4: TfrxMemoView
          Top = 41.133890000000000000
          Width = 1049.323130000000000000
          Height = 67.149660000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1087#1080#1089#1086#1082' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1074#1080#1073#1091#1083#1080' '#1095#1077#1088#1077#1079' '#1089#1084#1077#1088#1090#1100
            '[PTerm]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 884.000000000000000000
          Width = 162.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470'23')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 884.000000000000000000
          Top = 20.000000000000000000
          Width = 162.490000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [Date]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Width = 482.614410000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[NameV]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 384.000000000000000000
        Width = 1046.920361175000000000
        object Memo5: TfrxMemoView
          Left = 952.000000000000000000
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
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 34.015770000000000000
        ParentFont = False
        Top = 288.000000000000000000
        Width = 1046.920361175000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo13: TfrxMemoView
          Left = 52.000000000000000000
          Width = 276.820000000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDSetData."FIO"]')
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 328.820000000000000000
          Width = 66.490000000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDSetData."WORK_REASON"]')
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 395.310000000000000000
          Width = 232.060000000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDSetData."POST_NAME"]')
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 627.370000000000000000
          Width = 156.940000000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDSetData."UCH_ZVANIE"]'
            '[ReportDSetData."UCH_STEPEN"]'
            '')
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 784.320000000000000000
          Width = 99.390000000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDSetData."DATE_DISM"]')
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 884.000000000000000000
          Width = 162.100000000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Width = 52.000000000000000000
          Height = 34.020000000000000000
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 28.000000000000000000
        Top = 240.000000000000000000
        Width = 1046.920361175000000000
        Condition = 'ReportDsetData."NAME_CAFEDRA"'
        object Memo2: TfrxMemoView
          Align = baCenter
          Left = -0.271959412500151000
          Top = 4.000000000000000000
          Width = 1047.464280000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_CAFEDRA"]')
          ParentFont = False
          SuppressRepeated = True
        end
      end
      object Header1: TfrxHeader
        Height = 34.020000000000000000
        Top = 184.000000000000000000
        Width = 1046.920361175000000000
        object Memo21: TfrxMemoView
          Width = 328.820000000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1041'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 328.819110000000000000
          Width = 66.488250000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1089#1090#1072#1074#1072' '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 395.307360000000000000
          Width = 232.063080000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
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
        object Memo25: TfrxMemoView
          Left = 627.370440000000000000
          Width = 156.940000000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103','
            #1074#1095#1077#1085#1080#1081' '#1089#1090#1091#1087#1110#1085#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 784.320000000000000000
          Width = 99.390000000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1079#1074#1110#1083#1100#1085#1077#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 884.000000000000000000
          Width = 162.100000000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1084#1110#1090#1082#1072)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
end
