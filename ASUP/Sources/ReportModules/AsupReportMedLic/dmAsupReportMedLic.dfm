object DM: TDM
  OldCreateOrder = False
  Left = 75
  Top = 180
  Height = 349
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
    Left = 152
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
    Left = 152
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
    Left = 152
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
    EngineOptions.ConvertNulls = False
    EngineOptions.DoublePass = True
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 39027.765051539350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'begin'
      ''
      'end.')
    Left = 152
    Datasets = <
      item
        DataSet = ReportDsetActData
        DataSetName = 'ReportDsetActData'
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
        Height = 220.472480000000000000
        Top = 16.000000000000000000
        Width = 1046.920361175000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo3: TfrxMemoView
          Width = 131.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[date]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baCenter
          Left = 294.404830587499900000
          Top = 105.795300000000000000
          Width = 458.110700000000000000
          Height = 34.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1074#1080#1079#1085#1072#1095#1077#1085#1085#1103' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090#1110#1074' '#1086#1089#1110#1073', '#1103#1082#1110' '#1087#1110#1076#1083#1103#1075#1072#1102#1090#1100' '#1087#1077#1088#1110#1086#1076#1080#1095#1085#1080#1084' ('#1087#1086#1087#1077#1088#1077 +
              #1076#1085#1110#1084')'
            #1084#1077#1076#1080#1095#1085#1080#1084' '#1086#1075#1083#1103#1076#1072#1084' '#1074#1110#1076' ______________________ [year] '#1088#1086#1082#1091)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 836.000000000000000000
          Width = 208.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1076#1072#1090#1086#1082' 4')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Align = baCenter
          Left = 451.460180587499800000
          Top = 76.000000000000000000
          Width = 144.000000000000000000
          Height = 28.000000000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1040#1050#1058)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 836.000000000000000000
          Top = 16.000000000000000000
          Width = 208.000000000000000000
          Height = 36.000000000000000000
          Memo.Strings = (
            #1076#1086' '#1055#1086#1083#1086#1078#1077#1085#1085#1103' '#1086' '#1084#1077#1076#1080#1095#1085#1080#1093' '#1086#1075#1083#1103#1076#1072#1093
            #1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074' '#1087#1077#1074#1085#1080#1093' '#1082#1072#1090#1077#1075#1086#1088#1110#1081)
        end
        object Memo37: TfrxMemoView
          Top = 152.000000000000000000
          Width = 1044.000000000000000000
          Height = 64.000000000000000000
          Memo.Strings = (
            #1052#1085#1086#1102', ('#1055#1030#1041' '#1083#1110#1082#1072#1088#1103' '#1087#1086' '#1054#1050#1043', '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1057#1045#1057' )'
            
              #1091' '#1087#1088#1080#1089#1091#1090#1085#1086#1089#1090#1110' [ReportDsetGlobalData."prorector"], '#1085#1072#1095'. '#1074#1110#1076#1076#1110#1083#1091' '#1086 +
              #1093#1088'. '#1087#1088#1072#1094#1110' [ReportDsetGlobalData."nach_otd_ohr_truda"] '#1081' '#1087#1088#1077#1076#1089#1090'. ' +
              #1087#1088#1086#1092#1089#1087#1110#1083#1082#1080' [ReportDsetGlobalData."predstav_pk"]'
            
              #1079#1088#1086#1073#1083#1077#1085#1077' '#1074#1080#1079#1085#1072#1095#1077#1085#1085#1103' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090#1110#1074' '#1086#1089#1110#1073' '#1087#1086' [ReportDsetGlobalData."' +
              'name_customer"]'
            #1052#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074#1072' '#1086#1089#1074#1110#1090#1080' '#1110' '#1085#1072#1091#1082#1080' '#1059#1082#1088#1072#1111#1085#1080)
        end
        object Line1: TfrxLineView
          Left = 288.000000000000000000
          Top = 164.000000000000000000
          Width = 316.000000000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
      object Header1: TfrxHeader
        Height = 50.000000000000000000
        Top = 296.000000000000000000
        Width = 1046.920361175000000000
        ReprintOnNewPage = True
        Stretched = True
        object Memo14: TfrxMemoView
          Width = 302.500000000000000000
          Height = 50.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1094#1077#1093#1091', '#1076#1110#1083#1103#1085#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 770.120000000000000000
          Width = 97.690000000000000000
          Height = 50.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1077#1088#1110#1086#1076#1080#1095#1085#1110#1089#1090#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 618.500000000000000000
          Width = 151.622140000000000000
          Height = 50.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1087#1091#1085#1082#1090#1091' '#1076#1086#1076#1072#1090#1082#1072' 1-2 '#1085#1072#1082#1072#1079#1091' '#1052'3 555')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 302.500000000000000000
          Width = 120.000000000000000000
          Height = 50.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1086#1092#1077#1089#1110#1103
            '('#1087#1086#1089#1072#1076#1072')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 422.500000000000000000
          Width = 196.000000000000000000
          Height = 50.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1064#1082#1110#1076#1083#1080#1074#1080#1081' '#1085#1077#1089#1087#1088#1080#1103#1090#1083#1080#1074#1080#1081' '#1092#1072#1082#1090#1086#1088)
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 868.000000000000000000
          Width = 178.920000000000000000
          Height = 33.000000000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082'. '#1086#1089#1110#1073', '#1097#1086' '#1087#1110#1076#1083#1103#1075'. '
            #1084#1077#1076#1086#1075#1083#1103#1076#1091' '#1074' 2005 '#1088'.')
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 868.000000000000000000
          Top = 33.000000000000000000
          Width = 181.460000000000000000
          Height = 17.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1074#1089#1100#1086#1075#1086', '#1079#1086#1082#1088#1077#1084#1072' '#1078#1110#1085#1086#1082)
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 448.000000000000000000
        Width = 1046.920361175000000000
        object Memo4: TfrxMemoView
          Left = 966.677490000000000000
          Width = 79.433210000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.900000000000000000
        Top = 368.000000000000000000
        Width = 1046.920361175000000000
        DataSet = ReportDsetActData
        DataSetName = 'ReportDsetActData'
        RowCount = 0
        Stretched = True
        object Memo8: TfrxMemoView
          Width = 302.500000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetActData."NAME_CAFEDRA"]')
          ParentFont = False
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 422.500000000000000000
          Width = 196.000000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetActData."NAME_FACTOR"]')
          ParentFont = False
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 618.500000000000000000
          Width = 151.620000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetActData."NAME_PRILOG"]')
          ParentFont = False
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 302.500000000000000000
          Width = 120.000000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetActData."NAME_POST"]')
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 958.730000000000000000
          Width = 90.730000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetActData."ID_MED_W"]')
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 868.000000000000000000
          Width = 90.730000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetActData."ID_MED"]')
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 770.120000000000000000
          Width = 97.690000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetActData."PERIOD"]')
          SuppressRepeated = True
        end
      end
    end
  end
  object DSetDep: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 256
    Top = 180
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSourceData: TDataSource
    DataSet = DSetData
    Left = 256
    Top = 252
  end
  object DSetActData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 251
    poSQLINT64ToBCD = True
  end
  object ReportDsetActData: TfrxDBDataset
    UserName = 'ReportDsetActData'
    CloseDataSource = False
    DataSet = DSetActData
    Left = 144
    Top = 252
  end
end
