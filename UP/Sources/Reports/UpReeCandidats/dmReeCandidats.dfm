object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 170
  Height = 322
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
    EngineOptions.ConvertNulls = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 39835.739640289350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var PLine:integer=0;'
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
        Name = ' User Category'
        Value = Null
      end
      item
        Name = 'PSpisok'
        Value = #39#1057#1055#1048#1057#1054#1050' '#1050#1040#1053#1044#1048#1044#1040#1058#1030#1042' '#1053#1040#1059#1050#39
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
        Height = 72.472480000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo6: TfrxMemoView
          Align = baCenter
          Top = 34.015770000000010000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1055#1048#1057#1054#1050'  '#1050#1040#1053#1044#1048#1044#1040#1058#1030#1042'  '#1053#1040#1059#1050)
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 71.811070000000000000
        ParentFont = False
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        Stretched = True
        object Memo14: TfrxMemoView
          Left = 30.236240000000000000
          Width = 245.669450000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1041'.')
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 547.370440000000000000
          Width = 105.826840000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103', '
            #1076#1072#1090#1072' '#1087#1088#1080#1089#1074'.')
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 423.307360000000000000
          Width = 124.063080000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1095'. '#1089#1090#1091#1087#1110#1085#1100', '#8470' '#1076#1080#1087#1083'.')
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 275.905690000000000000
          Width = 147.401670000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Width = 30.236240000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #8470)
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 653.197280000000000000
          Width = 64.913420000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1084#1110#1090#1082#1080)
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 442.205010000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 699.213050000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
        object Memo13: TfrxMemoView
          Left = 676.535870000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1089#1090#1088'.')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 34.015770000000010000
        ParentFont = False
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        Condition = 'ReportDsetData."NAME_DEPARTMENT"'
        KeepTogether = True
        object Memo5: TfrxMemoView
          Width = 328.818878110000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT_UPPER"]')
          ParentFont = False
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 328.819110000000000000
          Width = 389.291358110000000000
          Height = 30.236240000000000000
          DataField = 'NAME_DEPARTMENT'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT"]')
          ParentFont = False
          SuppressRepeated = True
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 359.055350000000000000
        Width = 718.110700000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo8: TfrxMemoView
          Left = 562.488560000000000000
          Top = 3.779530000000022000
          Width = 102.047310000000000000
          Height = 11.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[ReportDsetData."ALL_UCH_ZVANIE"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 427.086890000000000000
          Top = 3.779530000000022000
          Width = 131.626110000000000000
          Height = 11.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[ReportDsetData."ALL_UCH_STEPEN"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 275.905690000000000000
          Top = 3.779530000000022000
          Width = 151.181200000000000000
          Height = 11.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[ReportDsetData."NAME_POST"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[Pline]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 664.535870000000000000
          Top = 3.779530000000022000
          Width = 53.574830000000000000
          Height = 11.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 30.236240000000000000
          Width = 245.669450000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          ParentFont = False
        end
      end
      object Memo3: TfrxMemoView
        Left = 575.779530000000000000
        Top = 12.440940000000000000
        Width = 143.622140000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haRight
        Memo.Strings = (
          #1052#1072#1096'. '#1076#1072#1090#1072': [CUR_DATE]')
        ParentFont = False
      end
      object GroupHeader2: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 34.015770000000010000
        ParentFont = False
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        Condition = 'ReportDsetData."FIRM_NAME"'
        object Memo7: TfrxMemoView
          Left = 113.385900000000000000
          Width = 487.559138110000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetData."FIRM_NAME"]')
          ParentFont = False
          SuppressRepeated = True
          VAlign = vaCenter
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
    Left = 264
    Top = 176
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 192
    Top = 176
  end
end
