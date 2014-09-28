object frmPrintCountPlaces: TfrmPrintCountPlaces
  Left = 445
  Top = 377
  Width = 240
  Height = 128
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 16
  end
  object pFIBDataSetPrintCountPlaces: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from ST_DT_PRINT_COUNT_PLACES')
    Left = 104
    Top = 16
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 40
    Top = 16
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    DataSet = pFIBDataSetPrintCountPlaces
    Left = 160
    Top = 16
  end
  object frxDesigner: TfrxDesigner
    Restrictions = []
    Left = 192
    Top = 16
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38464.542178171300000000
    ReportOptions.LastChange = 38464.609694710650000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 160
    Top = 48
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
      end>
    Variables = <
      item
        Name = 'BUILDS'
        Value = #39#1054#1073#1097#1077#1078#1080#1090#1080#1077' '#8470#39
      end
      item
        Name = 'NAMEROOM'
        Value = #39#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1086#1084#1085#1072#1090#1099#39
      end
      item
        Name = 'COUNTINROOM'
        Value = #39#1052#1077#1089#1090' '#1074' '#1082#1086#1084#1085'.'#39
      end
      item
        Name = 'COUNTROOM'
        Value = #39#1050#1086#1083'-'#1074#1086' '#1082#1086#1084#1085#1072#1090#39
      end
      item
        Name = 'COUNTALLROOM'
        Value = #39#1042#1089#1077#1075#1086' '#1082#1086#1084#1085#1072#1090#39
      end
      item
        Name = 'COUNTPLACES'
        Value = #39#1050#1086#1083'-'#1074#1086' '#1082#1086#1081#1082#1086'-'#1084#1077#1089#1090#39
      end
      item
        Name = 'COUNTALLPLACES'
        Value = #39#1042#1089#1077#1075#1086' '#1082#1086#1081#1082#1086'-'#1084#1077#1089#1090#39
      end
      item
        Name = 'NAMEREPORT'
        Value = #39#1050#1086#1083#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1086#1084#1085#1072#1090' '#1080' '#1082#1086#1081#1082#1086' '#1084#1077#1089#1090' '#1074' '#1089#1090#1091#1076#1075#1086#1088#1086#1076#1082#1077#39
      end
      item
        Name = 'SUMMARYREPORT'
        Value = #39#1054#1073#1097#1077#1077' '#1095#1080#1089#1083#1086' '#1082#1086#1081#1082#1086'-'#1084#1077#1089#1090' '#1087#1086' '#1089#1090#1091#1076#1075#1086#1088#1086#1076#1082#1091' - '#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 25.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 661.417750000000000000
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[NAMEREPORT]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559059999999999000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[Date]')
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Height = 19.677180000000000000
        ParentFont = False
        Top = 215.433210000000000000
        Width = 661.417750000000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Top = 0.779529999999994100
          Width = 122.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'SHORT_NAME'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset."SHORT_NAME"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 122.488250000000000000
          Top = 0.779529999999994100
          Width = 200.314967950000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'NAME_ROOM'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset."NAME_ROOM"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 322.803340000000000000
          Top = 0.779529999999994100
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'MAX_COUNT_PEOPLE'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset."MAX_COUNT_PEOPLE"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 368.157700000000000000
          Top = 0.779529999999994100
          Width = 64.913297950000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'MAX_COUNT_ROOM'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset."MAX_COUNT_ROOM"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 433.409710000000000000
          Top = 0.779529999999994100
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ALL_ROOM'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset."ALL_ROOM"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 512.779840000000000000
          Top = 0.779529999999994100
          Width = 71.810996770000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'COUNT_PLACE'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset."COUNT_PLACE"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 585.504330000000000000
          Top = 0.779529999999994100
          Width = 70.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ALL_COUNT_PLACES'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset."ALL_COUNT_PLACES"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 17.677180000000000000
        Top = 173.858380000000000000
        Width = 661.417750000000000000
        Stretched = True
        object Memo8: TfrxMemoView
          Top = 0.779529999999994100
          Width = 122.488188980000000000
          Height = 16.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[BUILDS]')
        end
        object Memo9: TfrxMemoView
          Left = 122.488250000000000000
          Width = 200.314960630000000000
          Height = 17.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[NAMEROOM]')
        end
        object Memo10: TfrxMemoView
          Left = 322.803340000000000000
          Width = 45.354330710000000000
          Height = 17.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[COUNTINROOM]')
        end
        object Memo11: TfrxMemoView
          Left = 368.157700000000000000
          Width = 65.007874020000000000
          Height = 17.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[COUNTROOM]')
        end
        object Memo12: TfrxMemoView
          Left = 433.409710000000000000
          Width = 79.370130000000000000
          Height = 17.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[COUNTALLROOM]')
        end
        object Memo13: TfrxMemoView
          Left = 513.559370000000000000
          Width = 71.811023620000000000
          Height = 17.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[COUNTPLACES]')
        end
        object Memo14: TfrxMemoView
          Left = 585.724800000000000000
          Width = 70.913385830000000000
          Height = 17.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[COUNTALLPLACES]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 294.803340000000000000
        Width = 661.417750000000000000
        object Memo17: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUMMARYREPORT]')
        end
      end
    end
  end
end
