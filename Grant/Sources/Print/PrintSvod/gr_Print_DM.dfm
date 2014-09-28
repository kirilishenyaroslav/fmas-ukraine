object DM: TDM
  OldCreateOrder = False
  Left = 742
  Top = 118
  Height = 442
  Width = 270
  object DB: TpFIBDatabase
    DBName = 'D:\WORK\FULL_DB\Alchevsk\FULL_DB.IB'
    DBParams.Strings = (
      'sql_role_name=')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 16
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 80
  end
  object DataSet: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 112
    Top = 16
    poSQLINT64ToBCD = True
  end
  object Report: TfrxReport
    Version = '3.15'
    DataSetName = 'UserDataSet'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39113.404820057900000000
    ReportOptions.LastChange = 39135.449795682870000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 112
    Top = 80
    Datasets = <
      item
        DataSet = DBDataset
        DataSetName = 'DBDataset'
      end
      item
        DataSet = DBDataset1
        DataSetName = 'DBDataset1'
      end>
    Variables = <
      item
        Name = ' Variables'
        Value = Null
      end
      item
        Name = 'TYPE'
        Value = Null
      end
      item
        Name = 'FSUMMA'
        Value = Null
      end
      item
        Name = 'NSUMMA'
        Value = Null
      end
      item
        Name = 'USUMMA'
        Value = Null
      end
      item
        Name = 'SUMMA'
        Value = Null
      end
      item
        Name = 'FIRM'
        Value = Null
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 30.000000000000000000
      RightMargin = 20.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 18.897650000000000000
        Top = 18.897650000000000000
        Width = 604.724800000000000000
        object Memo8: TfrxMemoView
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1044#1072#1090#1072': [Date]')
        end
      end
      object MasterData1: TfrxMasterData
        Height = 34.015755350000000000
        Top = 143.622140000000000000
        Width = 604.724800000000000000
        DataSet = DBDataset1
        DataSetName = 'DBDataset1'
        KeepTogether = True
        RowCount = 0
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999990000
          Width = 710.551640000000000000
          Height = 22.677165350000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[FIRM]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 22.677180000000000000
        Top = 370.393940000000000000
        Width = 604.724800000000000000
        DataSet = DBDataset
        DataSetName = 'DBDataset'
        KeepChild = True
        RowCount = 0
        object Memo4: TfrxMemoView
          Left = 453.543600000000000000
          Width = 151.181200000000000000
          Height = 22.677165350000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."SUMMA"]')
        end
        object Memo3: TfrxMemoView
          Left = 317.480520000000000000
          Width = 136.063080000000000000
          Height = 22.677180000000000000
          DataField = 'KOD_VIDOPL'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."KOD_VIDOPL"]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 279.685220000000000000
        Width = 604.724800000000000000
        Condition = 'DBDataset."ID_DEPARTMENT"'
        object Memo2: TfrxMemoView
          Width = 317.480520000000000000
          Height = 22.677180000000000000
          DataField = 'NAME_FULL'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Memo.Strings = (
            '[DBDataset."NAME_FULL"]')
        end
        object Line1: TfrxLineView
          Width = 604.724800000000000000
          Frame.Typ = [ftTop]
        end
      end
      object Header1: TfrxHeader
        Height = 56.692950000000000000
        Top = 200.315090000000000000
        Width = 604.724800000000000000
        object Memo13: TfrxMemoView
          Left = 400.630180000000000000
          Top = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1075#1072#1083#1100#1085#1072)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 317.480520000000000000
          Top = 34.015770000000000000
          Width = 136.063080000000000000
          Height = 22.677165350000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1076)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 453.543600000000000000
          Top = 34.015770000000000000
          Width = 151.181200000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Top = 34.015770000000000000
          Width = 317.480520000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1072#1082#1091#1083#1100#1090#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 79.370130000000000000
          Top = 7.559060000000000000
          Width = 143.622140000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1047#1074#1077#1076#1077#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1079#1072' ')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 234.330860000000000000
          Top = 7.559060000000000000
          Width = 151.181200000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm  yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.Strings = (
            '[<Date>]')
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 325.039580000000000000
        Width = 604.724800000000000000
        Condition = 'DBDataset."P1"'
        object Memo12: TfrxMemoView
          Left = 113.385900000000000000
          Top = 3.779530000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[TYPE]')
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 415.748300000000000000
        Width = 604.724800000000000000
        object Memo9: TfrxMemoView
          Left = 453.543600000000000000
          Width = 151.181200000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<FSUMMA>,MasterData2)]')
        end
        object Memo20: TfrxMemoView
          Left = 147.401670000000000000
          Top = 3.779530000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1056#1072#1079#1086#1084':')
        end
      end
      object Footer1: TfrxFooter
        Height = 192.756030000000000000
        Top = 461.102660000000000000
        Width = 604.724800000000000000
        object Memo11: TfrxMemoView
          Left = 75.590600000000000000
          Top = 3.779530000000020000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1056#1072#1079#1086#1084':')
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 22.677180000000000000
          Width = 340.157700000000000000
          Height = 22.677180000000000000
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103':')
        end
        object Memo15: TfrxMemoView
          Left = 453.543600000000000000
          Top = 45.354360000000000000
          Width = 151.181200000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<NSUMMA>,MasterData2)]')
        end
        object Memo16: TfrxMemoView
          Left = 113.385900000000000000
          Top = 79.370130000000000000
          Width = 340.157700000000000000
          Height = 22.677180000000000000
          Memo.Strings = (
            #1059#1090#1088#1080#1084#1072#1085#1085#1103':')
        end
        object Memo17: TfrxMemoView
          Left = 453.543600000000000000
          Top = 102.047310000000000000
          Width = 151.181200000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<USUMMA>,MasterData2)]')
        end
        object Memo18: TfrxMemoView
          Left = 113.385900000000000000
          Top = 132.283550000000000000
          Width = 340.157700000000000000
          Height = 22.677180000000000000
          Memo.Strings = (
            #1044#1086' '#1089#1087#1083#1072#1090#1080':')
        end
        object Memo19: TfrxMemoView
          Left = 453.543600000000000000
          Top = 154.960730000000000000
          Width = 151.181200000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<SUMMA>,MasterData2)]')
        end
        object Line2: TfrxLineView
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 60.472480000000000000
        Width = 604.724800000000000000
        object Memo1: TfrxMemoView
          Left = 442.205010000000000000
          Top = 3.779530000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#] '#1079' [TotalPages#]')
        end
      end
    end
  end
  object DBDataset: TfrxDBDataset
    UserName = 'DBDataset'
    CloseDataSource = False
    FieldAliases.Strings = (
      'SUMMA=SUMMA'
      'KOD_VIDOPL=KOD_VIDOPL'
      'NAME_FULL=NAME_FULL'
      'P1=P1'
      'ID_DEPARTMENT=ID_DEPARTMENT'
      'NAME_VIDOPL=NAME_VIDOPL')
    DataSet = DataSet
    Left = 184
    Top = 80
  end
  object DataSet1: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    SelectSQL.Strings = (
      'SELECT FIRM_NAME_FULL FROM Z_SETUP')
    Left = 184
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DBDataset1: TfrxDBDataset
    UserName = 'DBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FIRM_NAME_FULL=FIRM_NAME_FULL')
    DataSet = DataSet1
    Left = 112
    Top = 136
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 184
    Top = 136
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 32
    Top = 136
  end
end
