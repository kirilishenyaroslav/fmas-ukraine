object DataModul_EXP_SER: TDataModul_EXP_SER
  OldCreateOrder = False
  Left = 524
  Top = 241
  Height = 344
  Width = 453
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 16
  end
  object DataSet_Read: TpFIBDataSet
    Database = Database
    Transaction = Transaction_Read
    Left = 208
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DataSet_Report: TpFIBDataSet
    Database = Database
    Transaction = Transaction_Read
    Left = 208
    Top = 80
    poSQLINT64ToBCD = True
  end
  object Transaction_Read: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TACommit
    Left = 112
    Top = 16
  end
  object Transaction_write: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 112
    Top = 80
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1047#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
    ReportOptions.CreateDate = 40163.544235925900000000
    ReportOptions.LastChange = 42042.682507615740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 16
    Top = 168
    Datasets = <
      item
        DataSet = DBDataset
        DataSetName = 'DBDataset'
      end
      item
        DataSet = DBDataset_Rashfr
        DataSetName = 'DBDataset_Rashfr'
      end>
    Variables = <
      item
        Name = 'DATE_BEG'
        Value = #39'01.01.2009'#39
      end
      item
        Name = 'DATE_END'
        Value = #39'25.12.2009'#39
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
      Frame.Width = 0.500000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1074#1110#1090' '#1087#1088#1086' '#1077#1082#1089#1087#1086#1088#1090' '#1087#1086#1089#1083#1091#1075)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079' [DATE_BEG] '#1087#1086' [DATE_END]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 642.419312530000000000
          Width = 75.590600000000000000
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
        object Memo7: TfrxMemoView
          Top = 3.779530000000020000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Date]   [TIME]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        DataSet = DBDataset
        DataSetName = 'DBDataset'
        RowCount = 0
        object Memo3: TfrxMemoView
          Left = 52.913420000000000000
          Width = 551.811380000000000000
          Height = 18.897650000000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.Strings = (
            ' [DBDataset."NAME_COUNTRY"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'SUMM'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."SUMM"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<DBDataset."SUMM">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 510.236550000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.Strings = (
            #1042#1057#1068#1054#1043#1054':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 18.897650000000000000
        Top = 139.842610000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          Left = 52.913420000000000000
          Width = 551.811380000000000000
          Height = 18.897650000000000000
          Color = clBtnFace
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1082#1088#1072#1111#1085#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Color = clBtnFace
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072' '#1087#1086#1089#1083#1091#1075)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1079'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter2: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        object Memo16: TfrxMemoView
          Left = 642.419312530000000000
          Width = 75.590600000000000000
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
        object Memo17: TfrxMemoView
          Top = 3.779530000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Date]   [TIME]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        DataSet = DBDataset_Rashfr
        DataSetName = 'DBDataset_Rashfr'
        RowCount = 0
        Stretched = True
        object Memo18: TfrxMemoView
          Left = 52.913420000000000000
          Width = 551.811380000000000000
          Height = 18.897650000000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.Strings = (
            ' [DBDataset_Rashfr."FIO"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset_Rashfr."SUMM"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[Line]')
          ParentFont = False
        end
      end
      object Footer2: TfrxFooter
        Height = 18.897650000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo21: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<DBDataset_Rashfr."SUMM">,MasterData2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 510.236550000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.Strings = (
            #1042#1057#1068#1054#1043#1054':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header2: TfrxHeader
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo15: TfrxMemoView
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079' [DATE_BEG] '#1087#1086' [DATE_END]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 52.913420000000000000
          Top = 68.031540000000000000
          Width = 551.811380000000000000
          Height = 18.897650000000000000
          Color = clBtnFace
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1055#1030#1041' '#1089#1090#1091#1076#1077#1085#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 604.724800000000000000
          Top = 68.031540000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Color = clBtnFace
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072' '#1087#1086#1089#1083#1091#1075)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Top = 68.031540000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1079'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1079#1072' '#1055#1030#1041' '#1076#1086' '#1079#1074#1110#1090#1091' '#1087#1088#1086' '#1077#1082#1089#1087#1086#1088#1090' '#1087#1086#1089#1083#1091#1075)
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 128.504020000000000000
        Width = 718.110700000000000000
        Condition = 'DBDataset_Rashfr."NAME_COUNTRY"'
        Stretched = True
        object Memo27: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Color = clBtnFace
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            ' [DBDataset_Rashfr."NAME_COUNTRY"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 211.653680000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo29: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<DBDataset_Rashfr."SUMM">,MasterData2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 457.323130000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.Strings = (
            #1042#1057#1068#1054#1043#1054' '#1047#1040' '#1050#1056#1040#1031#1053#1054#1070':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Width = 457.323130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 72
    Top = 168
  end
  object DBDataset: TfrxDBDataset
    UserName = 'DBDataset'
    CloseDataSource = False
    DataSet = DataSet_Report
    Left = 128
    Top = 168
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = Transaction_write
    Left = 288
    Top = 16
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 80
    Top = 216
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 136
    Top = 216
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 224
    Top = 216
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 16
    Top = 216
  end
  object DataSet_Rashfr: TpFIBDataSet
    Database = Database
    Transaction = Transaction_Read
    Left = 288
    Top = 80
    poSQLINT64ToBCD = True
  end
  object DBDataset_Rashfr: TfrxDBDataset
    UserName = 'DBDataset_Rashfr'
    CloseDataSource = False
    DataSet = DataSet_Rashfr
    Left = 216
    Top = 168
  end
end
