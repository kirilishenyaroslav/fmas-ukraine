object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 170
  Height = 257
  Width = 346
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
    ReportOptions.CreateDate = 39167.623648113400000000
    ReportOptions.LastChange = 39307.487463645800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var i    : integer;'
      '    s    : string;'
      '    ss   : string;'
      'procedure Memo21OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <ReportDsetData."OUT_FIO_UA"> = s then'
      '  begin'
      '      memo20.memo.text := '#39#39';'
      '    //  memo22.memo.text := '#39#39';'
      '  end else'
      '  begin'
      '      i    := i + 1;'
      '      memo20.memo.text := intToStr(<i>);'
      '  //    ss := <ReportDsetData."OUT_POST_NAME">;'
      '  //    memo22.memo.text :=ss;'
      '  end;'
      '  s := <ReportDsetData."OUT_FIO_UA">;'
      'end;'
      ''
      'procedure rttTitleOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  s    := '#39#39';'
      '  i    := 0;'
      'end;'
      ''
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
    Variables = <>
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
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object rttTitle: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 86.929190000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'rttTitleOnBeforePrint'
        object Memo9: TfrxMemoView
          Top = 22.677180000000000000
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."CITY"] ')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Top = 45.354360000000000000
          Width = 1046.929810000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1082#1080' '#1087#1086' '#1074#1110#1076#1087#1091#1089#1090#1082#1072#1093)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Align = baCenter
          Left = 0.000000000000044298
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."FIRM_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 5.669291340000000000
        ParentFont = False
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo20: TfrxMemoView
          Align = baLeft
          Width = 30.135452530000000000
          Height = 5.669291338582680000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Line#]')
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          Left = 79.269310800000000000
          Width = 166.299190630000000000
          Height = 5.669291338582680000
          OnBeforePrint = 'Memo21OnBeforePrint'
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."OUT_FIO_UA"]')
          SuppressRepeated = True
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          Left = 245.568501430000000000
          Width = 308.031522910000000000
          Height = 5.669291338582680000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."OUT_POST_NAME"]')
        end
        object Memo25: TfrxMemoView
          Align = baLeft
          Left = 789.064591270000000000
          Width = 129.259842520000000000
          Height = 5.669291338582680000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[(<ReportDsetData."Period_Str">)]')
        end
        object Memo27: TfrxMemoView
          Align = baLeft
          Left = 918.324433790000000000
          Width = 128.503937010000000000
          Height = 5.669291338582680000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."OUT_HOLIDAY_NAME"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Left = 693.442544030000000000
          Width = 44.976377950000000000
          Height = 5.669291338582680000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."OUT_Sovm_Type_PERS"]')
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Align = baLeft
          Left = 553.600024340000000000
          Width = 139.842519690000000000
          Height = 5.669291338582680000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."Sovm_Department_Name"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Align = baLeft
          Left = 738.418921980000000000
          Width = 50.645669290000000000
          Height = 5.669291338582680000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."OUT_DAYS_COUNT_TEXT"]')
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          Left = 30.135452530000000000
          Width = 49.133858270000000000
          Height = 5.669291338582680000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."OUT_TN"]')
          SuppressRepeated = True
        end
      end
      object pgfPages: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 347.716760000000000000
        Width = 1046.929810000000000000
        object Memo5: TfrxMemoView
          Align = baRight
          Left = 952.441560000000100000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          VAlign = vaCenter
        end
      end
      object grhDepartment: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 7.559055118110240000
        ParentFont = False
        Top = 249.448980000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."OUT_DEPARTMENT_NAME"'
        Stretched = True
        object Memo23: TfrxMemoView
          Width = 544.252088110000000000
          Height = 7.559055118110240000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."OUT_DEPARTMENT_NAME_UPPER"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 544.252320000000000000
          Width = 502.677258110000000000
          Height = 7.559055118110240000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."OUT_DEPARTMENT_NAME"]')
          ParentFont = False
        end
      end
      object grhTypePers: TfrxGroupHeader
        Height = 7.559055120000000000
        Top = 219.212740000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."OUT_NAME_TYPE_PERS"'
        StartNewPage = True
        Stretched = True
        object Memo4: TfrxMemoView
          Width = 1046.929133860000000000
          Height = 7.559055120000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."OUT_NAME_TYPE_PERS"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 28.346456690000000000
        ParentFont = False
        Top = 166.299320000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Align = baLeft
          Left = 789.064615680000000000
          Width = 129.259842520000000000
          Height = 28.346456692913400000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072' '#1103#1082#1080#1081' '#1087#1077#1088#1110#1086#1076' '#1085#1072#1076#1072#1108#1090#1100#1089#1103' '#1074#1110#1076#1087#1091#1089#1090#1082#1072)
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Align = baLeft
          Left = 738.418946390000000000
          Width = 50.645669290000000000
          Height = 28.346456692913400000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100
            #1082#1072#1083'. '#1076#1085#1110#1074)
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Align = baLeft
          Width = 30.135452530000000000
          Height = 28.346456690000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470
            #1087'/'#1087)
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Left = 79.269305920000000000
          Width = 166.299190630000000000
          Height = 28.346456692913400000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103', '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110)
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Align = baLeft
          Left = 245.568496550000000000
          Width = 308.031522910000000000
          Height = 28.346456690000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1081#1084#1072#1085#1072' '#1087#1086#1089#1072#1076#1072)
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Align = baLeft
          Left = 918.324458200000000000
          Width = 128.503937010000000000
          Height = 28.346456692913400000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1084#1110#1090#1082#1072)
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 553.700787400000000000
          Width = 184.818897640000000000
          Height = 13.228346456692900000
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1110#1089#1085#1080#1094#1090#1074#1086)
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Align = baLeft
          Left = 553.600019460000000000
          Top = 13.228346456692890000
          Width = 139.842548980000000000
          Height = 15.118110240000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1088#1086#1079#1076#1110#1083)
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Align = baLeft
          Left = 693.442568440000000000
          Top = 13.228346456692890000
          Width = 44.976377950000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1080#1087' '#1087#1077#1088#1089)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Align = baLeft
          Left = 30.135452530000000000
          Width = 49.133853390000000000
          Height = 28.346456690000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1053)
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
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 128
    Top = 117
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object PDFExport: TfrxPDFExport
    UseFileCache = True
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 272
    Top = 168
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 192
    Top = 168
  end
end
