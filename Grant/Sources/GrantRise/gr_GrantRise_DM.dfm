object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 634
  Top = 218
  Height = 467
  Width = 317
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = UpdateTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 120
    Top = 128
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = UpdateTransaction
    Left = 32
    Top = 64
    poSQLINT64ToBCD = True
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = UpdateTransaction
    Left = 32
    Top = 144
    poSQLINT64ToBCD = True
  end
  object UpdateTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    AfterStart = UpdateTransactionAfterStart
    Left = 120
    Top = 176
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 224
    Top = 64
  end
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 224
    Top = 144
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = UpdateTransaction
    Left = 32
    Top = 360
  end
  object DSet3: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = UpdateTransaction
    Left = 32
    Top = 248
    poSQLINT64ToBCD = True
  end
  object DSource3: TDataSource
    DataSet = DSet3
    Left = 224
    Top = 248
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39113.404820057900000000
    ReportOptions.LastChange = 39152.659979016200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 160
    Top = 368
    Datasets = <
      item
        DataSet = DBDataset
        DataSetName = 'DBDataset'
      end
      item
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
      end
      item
        Name = 'DATEP'
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
        DataSetName = 'DBDataset1'
        KeepTogether = True
        RowCount = 0
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 710.551640000000000000
          Height = 22.677165350000000000
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
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 60.472480000000000000
        Width = 604.724800000000000000
        object Memo1: TfrxMemoView
          Left = 442.205010000000000000
          Top = 3.779530000000001000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#] '#1079' [TotalPages#]')
        end
      end
      object MasterData2: TfrxMasterData
        Height = 22.677180000000000000
        Top = 245.669450000000000000
        Width = 604.724800000000000000
        DataSet = DBDataset
        DataSetName = 'DBDataset'
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[DBDataset."TIN"]')
        end
        object Memo3: TfrxMemoView
          Left = 151.181200000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[DBDataset."FIO"]')
        end
        object Memo4: TfrxMemoView
          Left = 453.543600000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Memo.Strings = (
            '[DBDataset."SUMMA"]')
        end
      end
      object Header1: TfrxHeader
        Height = 22.677180000000000000
        Top = 200.315090000000000000
        Width = 604.724800000000000000
        object Memo5: TfrxMemoView
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1048#1053#1053)
        end
        object Memo6: TfrxMemoView
          Left = 151.181200000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1060#1030#1054)
        end
        object Memo7: TfrxMemoView
          Left = 453.543600000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
        end
      end
    end
  end
  object DBDataset: TfrxDBDataset
    UserName = 'DBDataset'
    CloseDataSource = False
    FieldAliases.Strings = (
      'TIN=TIN'
      'FIO=FIO'
      'SUMMA=SUMMA')
    DataSet = DSet3
    Left = 224
    Top = 368
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 224
    Top = 312
  end
end
