object DM: TDM
  OldCreateOrder = False
  Left = 138
  Top = 135
  Height = 276
  Width = 326
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
    Top = 43
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
    Top = 48
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 256
    Top = 96
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 37965.713841435200000000
    ReportOptions.LastChange = 38805.586384548610000000
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
    Left = 168
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
        Height = 82.900000000000000000
        ParentFont = False
        Top = 16.000000000000000000
        Width = 980.400633174999700000
        OnBeforePrint = 'OnBeforePrint'
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 204.200316587499900000
          Top = 50.900000000000010000
          Width = 572.000000000000000000
          Height = 28.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1091#1089#1090#1082#1080', '#1097#1086' '#1074#1088#1072#1093#1086#1074#1091#1102#1090#1100#1089#1103' '#1076#1086' '#1089#1087#1077#1094#1089#1090#1072#1078#1091' '#1079#1072' [year] '#1088#1110#1082)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 848.000000000000000000
          Width = 131.620000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072' [date]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 848.000000000000000000
          Top = 16.000000000000000000
          Width = 132.000000000000000000
          Height = 16.000000000000000000
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470'62')
        end
        object Memo16: TfrxMemoView
          Width = 480.000000000000000000
          Height = 16.000000000000000000
          Memo.Strings = (
            '[NameV]')
        end
      end
      object MasterData1: TfrxMasterData
        Height = 40.000000000000000000
        Top = 220.000000000000000000
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
          Left = 3.779530000000000000
          Width = 52.000000000000000000
          Height = 40.000000000000000000
          OnBeforePrint = 'Memo8OnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 55.779530000000000000
          Top = 20.000000000000000000
          Width = 332.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo13: TfrxMemoView
          Left = 388.000000000000000000
          Width = 272.000000000000000000
          Height = 40.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."DEP_POST"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 660.000000000000000000
          Width = 228.000000000000000000
          Height = 40.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."STAJ_KOD"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 888.000000000000000000
          Width = 48.000000000000000000
          Height = 40.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."CALC_MONTH"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 936.000000000000000000
          Width = 44.000000000000000000
          Height = 40.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."CALC_DAYS"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 56.000000000000000000
          Width = 332.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          Memo.Strings = (
            '[ReportDsetData."TIN"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 320.000000000000000000
        Width = 980.400633174999700000
        object Memo18: TfrxMemoView
          Left = 888.000000000000000000
          Width = 84.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Memo.Strings = (
            #1057#1090#1086#1088'. [Page#]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 40.000000000000000000
        Top = 160.000000000000000000
        Width = 980.400633174999700000
        object Memo2: TfrxMemoView
          Left = 4.000000000000000000
          Width = 52.000000000000000000
          Height = 40.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 56.000000000000000000
          Width = 332.000000000000000000
          Height = 40.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1041'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 388.220470000000000000
          Width = 272.000000000000000000
          Height = 40.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1072#1092#1077#1076#1088#1072', '#1087#1086#1089#1072#1076#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 660.220470000000000000
          Width = 228.000000000000000000
          Height = 40.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1087#1077#1094#1089#1090#1072#1078)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 888.000000000000000000
          Width = 48.000000000000000000
          Height = 40.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1084#1110#1089'.')
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 936.000000000000000000
          Width = 44.000000000000000000
          Height = 40.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1085'.')
          VAlign = vaCenter
        end
      end
    end
  end
end
