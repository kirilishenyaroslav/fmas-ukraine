object DM: TDM
  OldCreateOrder = False
  Left = 419
  Top = 183
  Height = 270
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
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 37965.713841435200000000
    ReportOptions.LastChange = 39125.608147766200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo10OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <ReportDsetData."BIRTH_DATE">='#39'01.01.3000'#39' then'
      '       Memo10.Visible:=false'
      '  else'
      '       Memo10.Visible:= true;'
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
        Height = 100.661410000000000000
        Top = 18.897650000000000000
        Width = 1009.134510000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 19.118274999999980000
          Top = 26.900000000000000000
          Width = 970.897960000000000000
          Height = 72.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1087#1080#1089#1086#1082' '#1076#1110#1090#1077#1081' '#1096#1090#1072#1090#1085#1080#1093' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074
            #1091' '#1074#1110#1094#1110' [ReportDsetData."VOZRAST"] '#1088#1086#1082#1110#1074' '#1090#1072' '#1084#1077#1085#1096)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 840.000000000000000000
          Width = 162.456710000000000000
          Height = 23.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [ReportDsetData."CUR_DATE"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Width = 540.472790000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[ReportDsetData."NAME_PRED"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 40.000000000000000000
        Top = 143.622140000000000000
        Width = 1009.134510000000000000
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Width = 52.000000000000000000
          Height = 40.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1087'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 55.779530000000000000
          Width = 300.000000000000000000
          Height = 40.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1030#1041' '#1076#1080#1090#1080#1085#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 355.779530000000000000
          Width = 90.000000000000000000
          Height = 40.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 445.780000000000000000
          Width = 246.220000000000000000
          Height = 40.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1030#1041' '#1073#1072#1090#1100#1082#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 692.000000000000000000
          Width = 318.015770000000000000
          Height = 40.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1040#1076#1088#1077#1089#1072)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 20.000000000000000000
        Top = 245.669450000000000000
        Width = 1009.134510000000000000
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
          Left = 3.779530000000000000
          Width = 52.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 55.779530000000000000
          Width = 300.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO_REB"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 355.779530000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo10OnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."BIRTH_DATE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 445.780000000000000000
          Width = 246.220000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO_RODIT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 692.000000000000000000
          Width = 318.015770000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."ADR"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 325.039580000000000000
        Width = 1009.134510000000000000
        object Memo2: TfrxMemoView
          Left = 958.456710000000000000
          Width = 48.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
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
end
