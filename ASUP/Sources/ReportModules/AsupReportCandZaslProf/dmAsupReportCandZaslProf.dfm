object DM: TDM
  OldCreateOrder = False
  Left = 494
  Top = 89
  Height = 236
  Width = 325
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
    Top = 43
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 152
    Top = 43
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      '')
    Left = 40
    Top = 96
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 152
    Top = 92
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
    ReportOptions.LastChange = 39036.956151793980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 152
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
        Name = ' User Category'
        Value = Null
      end
      item
        Name = 'PSpisok'
        Value = #39#1057#1055#1048#1057#1054#1050' '#1050#1040#1053#1044#1048#1044#1040#1058#1030#1042' '#1053#1040#1059#1050#39
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
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 160.472480000000000000
        Top = 16.000000000000000000
        Width = 1046.920361175000000000
        object Memo7: TfrxMemoView
          Width = 590.110000000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[NameV]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 888.000000000000000000
          Top = 20.000000000000000000
          Width = 156.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470' 13')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 465.460180590000000000
          Top = 128.000000000000000000
          Width = 20.000000000000000000
          Height = 24.000000000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1085#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Align = baCenter
          Left = 1.460180587499849000
          Top = 80.000000000000000000
          Width = 1044.000000000000000000
          Height = 48.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057' '#1055' '#1048' '#1057' '#1054' '#1050
            #1082#1072#1085#1076#1080#1076#1072#1090#1110#1074' '#1074' '#1079#1072#1089#1083#1091#1078#1077#1085#1110' '#1087#1088#1086#1092#1077#1089#1086#1088#1080)
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 888.000000000000000000
          Width = 156.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072' : [date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 488.000000000000000000
          Top = 128.000000000000000000
          Width = 76.000000000000000000
          Height = 24.000000000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[dates]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 564.000000000000000000
          Top = 128.000000000000000000
          Width = 20.000000000000000000
          Height = 24.000000000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1088'.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 36.000000000000000000
        Top = 236.000000000000000000
        Width = 1046.920361175000000000
        ReprintOnNewPage = True
        Stretched = True
        object Memo14: TfrxMemoView
          Left = 37.000000000000000000
          Width = 257.990000000000000000
          Height = 34.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1055#1030#1041)
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 492.610000000000000000
          Width = 80.390000000000000000
          Height = 34.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1042#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103)
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 422.610000000000000000
          Width = 70.000000000000000000
          Height = 34.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1042#1095'. '#1089#1090#1091#1087#1110#1085#1100)
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 294.990000000000000000
          Width = 127.622140000000000000
          Height = 34.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Width = 37.000000000000000000
          Height = 34.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 573.000000000000000000
          Width = 72.000000000000000000
          Height = 34.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1087#1088#1080#1089#1074'. '#1074#1095'. '#1079#1074#1072#1085'.')
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 645.000000000000000000
          Width = 75.000000000000000000
          Height = 34.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1074#1089#1090'. '#1085#1072' '#1087#1086#1089#1072#1076#1091)
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 844.380000000000000000
          Width = 78.160000000000000000
          Height = 34.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1074#1089#1090'. '#1074' '#1042#1053#1047)
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 720.000000000000000000
          Width = 124.380000000000000000
          Height = 17.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1089#1090#1072#1078' '#1088#1086#1073'. '#1085#1072' '#1087#1086#1089#1072#1076#1110)
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 720.000000000000000000
          Top = 17.000000000000000000
          Width = 41.460000000000000000
          Height = 17.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '10-15')
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 761.460000000000000000
          Top = 17.000000000000000000
          Width = 41.460000000000000000
          Height = 17.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '16-20')
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 802.920000000000000000
          Top = 17.000000000000000000
          Width = 41.460000000000000000
          Height = 17.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '>20')
        end
        object Memo3: TfrxMemoView
          Left = 922.540000000000000000
          Width = 124.380000000000000000
          Height = 17.000000000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1089#1090#1072#1078' '#1088#1086#1073'. '#1074' '#1042#1053#1047)
        end
        object Memo6: TfrxMemoView
          Left = 922.540000000000000000
          Top = 17.000000000000000000
          Width = 41.460000000000000000
          Height = 17.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '20-25')
        end
        object Memo19: TfrxMemoView
          Left = 964.000000000000000000
          Top = 17.000000000000000000
          Width = 41.460000000000000000
          Height = 17.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '26-30')
        end
        object Memo23: TfrxMemoView
          Left = 1005.460000000000000000
          Top = 17.000000000000000000
          Width = 41.460000000000000000
          Height = 17.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '>30')
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 372.000000000000000000
        Width = 1046.920361175000000000
        object Memo4: TfrxMemoView
          Left = 942.677490000000000000
          Width = 103.433210000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.900000000000000000
        Top = 292.000000000000000000
        Width = 1046.920361175000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo8: TfrxMemoView
          Left = 37.000000000000000000
          Width = 257.990000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Width = 0.500000000000000000
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 573.000000000000000000
          Width = 72.000000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATA_ZVAN"]')
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Width = 37.000000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 422.610000000000000000
          Width = 70.000000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_REGARD_STEPEN"]')
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 294.990000000000000000
          Width = 127.620000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_POST"]')
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 492.610000000000000000
          Width = 80.390000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_REGARD_ZVANIE"]')
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 645.000000000000000000
          Width = 75.000000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATE_VST_POST"]')
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 720.000000000000000000
          Width = 41.460000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."STAJ_10_15"]')
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 761.460000000000000000
          Width = 41.460000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."STAJ_16_20"]')
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 964.000000000000000000
          Width = 41.460000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."STAJ_26_30"]')
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 1005.460000000000000000
          Width = 41.460000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."STAJ_30_MORE"]')
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 802.920000000000000000
          Width = 41.460000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."STAJ_20_MORE"]')
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 844.380000000000000000
          Width = 78.160000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATA_VSTUP"]')
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 922.540000000000000000
          Width = 41.460000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."STAJ_20_25"]')
          VAlign = vaCenter
        end
      end
    end
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 264
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 264
    Top = 48
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 264
    Top = 96
  end
  object ReportDSetGlobalData: TfrxDBDataset
    UserName = 'ReportDsetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 152
    Top = 148
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 147
    poSQLINT64ToBCD = True
  end
end
