object DM: TDM
  OldCreateOrder = False
  Left = 535
  Top = 51
  Height = 408
  Width = 495
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 72
  end
  object DSetMain: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    UpdateTransaction = TransactionWrite
    SelectSQL.Strings = (
      'SELECT * FROM JO5_DOC_MAIN_S')
    Left = 168
    Top = 8
    poSQLINT64ToBCD = True
  end
  object DSourceMain: TDataSource
    DataSet = DSetMain
    Left = 104
    Top = 8
  end
  object TransactionWrite: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 120
  end
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 168
    Top = 104
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = DSetMain
    Left = 104
    Top = 248
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = pFIBDataSet2
    Left = 184
    Top = 240
  end
  object pFIBDataSet2: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT * FROM JO5_DOC_MAIN_S')
    Left = 184
    Top = 200
    poSQLINT64ToBCD = True
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40130.598218680600000000
    ReportOptions.LastChange = 40133.566966979170000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 144
    Top = 296
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <>
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
        Height = 91.968563330000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Align = baCenter
          Left = 147.401670000000000000
          Top = 10.078746670000000000
          Width = 423.307360000000000000
          Height = 66.771696670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1082#1091#1084#1077#1085#1090' '#1079#1072#1083#1080#1096#1082#1110#1074' '#1087#1086
            '"[Period]"')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 3.779530000000001000
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[Date]')
        end
      end
      object Header1: TfrxHeader
        Height = 56.692950000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        object Memo14: TfrxMemoView
          Top = 37.795300000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Color = clInactiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1086#1082)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 128.504020000000000000
          Top = 37.795300000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Color = clInactiveCaption
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1041#1091#1076#1078#1077#1090)
        end
        object Memo16: TfrxMemoView
          Left = 257.008040000000000000
          Top = 37.795300000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Color = clInactiveCaption
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1056#1086#1079#1076#1110#1083)
        end
        object Memo17: TfrxMemoView
          Left = 381.732530000000000000
          Top = 37.795300000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Color = clInactiveCaption
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1057#1090#1072#1090#1090#1103)
        end
        object Memo18: TfrxMemoView
          Left = 506.457020000000000000
          Top = 37.795300000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Color = clInactiveCaption
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1050#1045#1050#1042)
        end
        object Memo19: TfrxMemoView
          Left = 631.181510000000000000
          Top = 37.795300000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = clInactiveCaption
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1057#1091#1084#1072)
        end
        object Memo4: TfrxMemoView
          Left = 162.519790000000000000
          Width = 449.764070000000000000
          Height = 37.795300000000000000
          Color = clGradientInactiveCaption
          DataField = 'COMENT'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."COMENT"]')
        end
        object Memo5: TfrxMemoView
          Width = 162.519790000000000000
          Height = 37.795300000000000000
          Color = clGradientInactiveCaption
          DataField = 'FULL_NAME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."FULL_NAME"]')
        end
        object Memo6: TfrxMemoView
          Left = 612.283860000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Color = clGradientInactiveCaption
          DataField = 'DATE_REG'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."DATE_REG"]')
        end
        object Memo9: TfrxMemoView
          Left = 612.283860000000000000
          Top = 18.897650000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Color = clGradientInactiveCaption
          DataField = 'SUMM'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."SUMM"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 328.819110000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 563.149970000000100000
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1089#1090#1088'. [<Page#>] '#1080#1079' [TotalPages#]')
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object Memo7: TfrxMemoView
          Width = 128.503937010000000000
          Height = 18.897650000000000000
          DataField = 'SCH_NUMBER'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset2."SCH_NUMBER"]')
        end
        object Memo8: TfrxMemoView
          Left = 128.504020000000000000
          Width = 128.503937010000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset2."SMETA_KOD"]')
        end
        object Memo10: TfrxMemoView
          Left = 257.008040000000000000
          Width = 124.724407010000000000
          Height = 18.897650000000000000
          DataField = 'RAZD_NUM'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset2."RAZD_NUM"]')
        end
        object Memo11: TfrxMemoView
          Left = 381.732530000000000000
          Width = 124.724407010000000000
          Height = 18.897650000000000000
          DataField = 'STAT_NUM'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset2."STAT_NUM"]')
        end
        object Memo12: TfrxMemoView
          Left = 506.457020000000000000
          Width = 124.724407010000000000
          Height = 18.897650000000000000
          DataField = 'KEKV_KODE'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset2."KEKV_KODE"]')
        end
        object Memo13: TfrxMemoView
          Left = 631.181510000000000000
          Width = 86.929190000000010000
          Height = 18.897650000000000000
          DataField = 'SALDO'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset2."SALDO"]')
        end
      end
    end
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 16
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = TransactionWrite
    Left = 40
    Top = 176
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 304
    Top = 272
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      'SELECT * FROM JO5_Saldo_Doc_S(?ID_DOC) order by DATE_PERIOD')
    Left = 168
    Top = 56
    poSQLINT64ToBCD = True
  end
end
