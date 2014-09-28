object DM: TDM
  OldCreateOrder = False
  Left = 249
  Top = 72
  Height = 232
  Width = 427
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
    Left = 168
    Top = 43
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 93
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 168
    Top = 92
  end
  object DSourceData: TDataSource
    DataSet = DSetData
    Left = 360
    Top = 52
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38702.345258599490000000
    ReportOptions.LastChange = 38775.049788402780000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      ' DateNow:String;'
      ' Month :string;'
      ' NameV  :String;'
      ''
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
        Value = #39'28.12.2005'#39
      end
      item
        Name = 'Month'
        Value = #39#1073#1077#1088#1077#1079#1077#1085#1100#39
      end>
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
        Height = 132.283550000000000000
        ParentFont = False
        Top = 16.000000000000000000
        Width = 980.410081999999900000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Width = 512.976500000000000000
          Height = 22.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[NameV]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 779.905999999999900000
          Width = 186.992270000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [DateNow]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 283.464750000000000000
          Top = 65.133889999999990000
          Width = 457.323130000000000000
          Height = 41.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1087#1080#1089#1086#1082' '#1076#1085#1110#1074' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
            '[Month]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 872.000000000000000000
          Top = 20.000000000000000000
          Width = 94.900000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470'33')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 376.000000000000000000
        Width = 980.410081999999900000
        object Memo5: TfrxMemoView
          Left = 872.410020000000000000
          Width = 94.488249999999990000
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
        Height = 52.913420000000000000
        Top = 168.000000000000000000
        Width = 980.410081999999900000
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 963.780150000000000000
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 45.354360000000010000
          Width = 963.779525120000000000
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 44.020000000000000000
          Top = 7.559059999999988000
          Width = 292.360000000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1041)
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559059999999988000
          Width = 40.240000000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 336.378170000000000000
          Top = 7.559059999999988000
          Width = 94.488250000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1089#1090#1072#1074#1072' '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080)
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 430.866420000000000000
          Top = 7.559059999999988000
          Width = 188.976377952756000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 619.842920000000000000
          Top = 7.559059999999988000
          Width = 238.110243543307000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1088#1086#1079#1076#1110#1083)
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 857.953310000000000000
          Top = 7.559059999999988000
          Width = 109.606299212598000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103)
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 37.795300000000000000
        Top = 280.000000000000000000
        Width = 980.410081999999900000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo13: TfrxMemoView
          Left = 44.020000000000000000
          Width = 292.360000000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 3.779530000000000000
          Width = 40.240000000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 336.378170000000000000
          Width = 94.488250000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_SOVMEST_SHORT"]')
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 430.866420000000000000
          Width = 188.976377950000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."POST_NAME"]')
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 619.842920000000000000
          Width = 238.110243540000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."DEPARTMENT_NAME"]')
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 857.953310000000000000
          Width = 109.606299210000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."BIRTH_DAY"]')
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
    Left = 272
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 272
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
    Left = 272
    Top = 96
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 139
    poSQLINT64ToBCD = True
  end
  object ReportDSetGlobalData: TfrxDBDataset
    UserName = 'ReportDsetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 168
    Top = 140
  end
end
