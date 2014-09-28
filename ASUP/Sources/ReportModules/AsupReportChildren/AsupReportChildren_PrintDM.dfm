object DM: TDM
  OldCreateOrder = False
  Left = 487
  Top = 172
  Height = 262
  Width = 285
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
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
    Top = 59
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 136
    Top = 59
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
    Left = 136
    Top = 116
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 224
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 224
    Top = 48
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 224
    Top = 96
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
    ReportOptions.LastChange = 38771.939767974540000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      ' DateNow:String;'
      ' NameV  :String;'
      'begin'
      ''
      'end.')
    Left = 136
    Datasets = <
      item
        DataSet = ReportDSetData
        DataSetName = 'ReportDSetData'
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
        Height = 120.283550000000000000
        ParentFont = False
        Top = 16.000000000000000000
        Width = 980.410081999999900000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Width = 544.976500000000000000
          Height = 22.015770000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[ReportDsetGlobalData."FIRM_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 775.905999999999900000
          Width = 202.992270000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [DateNow]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 264.567100000000000000
          Top = 18.897650000000000000
          Width = 453.543600000000000000
          Height = 71.149660000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1087#1080#1089#1086#1082' '#1076#1110#1090#1077#1081' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074' '
            '[ReportDsetGlobalData."FIRM_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 360.000000000000000000
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
            #1057#1090#1086#1088'. [Page#]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 48.913420000000000000
        Top = 156.000000000000000000
        Width = 980.410081999999900000
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 967.559680000000000000
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 45.354360000000010000
          Width = 967.559055120000000000
          Frame.Typ = [ftTop]
        end
        object Memo7: TfrxMemoView
          Left = 3.780000000000000000
          Top = 7.559059999999988000
          Width = 49.920000000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 53.700990000000000000
          Top = 7.559059999999988000
          Width = 381.000000000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1041'. '#1076#1080#1090#1080#1085#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 434.700000000000000000
          Top = 7.559059999999988000
          Width = 114.267780000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 548.970000000000000000
          Top = 7.559059999999988000
          Width = 421.000000000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1041'. '#1073#1072#1090#1100#1082#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 37.795300000000000000
        Top = 264.000000000000000000
        Width = 980.410081999999900000
        DataSet = ReportDSetData
        DataSetName = 'ReportDSetData'
        RowCount = 0
        Stretched = True
        object Memo14: TfrxMemoView
          Left = 3.779530000000000000
          Width = 49.920000000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 53.700990000000000000
          Width = 381.000000000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO_CHILD"]')
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 434.700000000000000000
          Width = 114.267780000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."DATE_BIRTH"]')
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 548.970000000000000000
          Width = 421.000000000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO_MAN"]')
          VAlign = vaCenter
        end
      end
    end
  end
  object ReportDSetData: TfrxDBDataset
    UserName = 'ReportDSetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 136
    Top = 176
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 176
    poSQLINT64ToBCD = True
  end
end
