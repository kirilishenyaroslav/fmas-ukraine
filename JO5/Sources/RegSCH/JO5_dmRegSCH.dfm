object dmRegSCH: TdmRegSCH
  OldCreateOrder = False
  Left = 287
  Top = 283
  Height = 278
  Width = 339
  object DB: TpFIBDatabase
    DBName = 'E:\Alex\GOVERMENT\DB\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 16
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 16
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 80
    poSQLINT64ToBCD = True
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 240
    Top = 80
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 136
    poSQLINT64ToBCD = True
  end
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 240
    Top = 136
  end
  object spcSchet: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 32
    Top = 88
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 184
    Top = 16
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbFind, pbPageSetup, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38652.554073344900000000
    ReportOptions.LastChange = 39932.468137291700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' if ((<DBDataset."OUT_ID_SCH"> < 0)'
      ' and (<DBDataset."OUT_HAS_CHILDREN_BOOLEAN"> = 1)) then begin'
      '  TfrxMemoView(Sender).Visible := False;'
      '  TfrxMemoView(Sender).Height  := 0;'
      '  Exit;'
      ' end'
      ' else TfrxMemoView(Sender).Visible := True;'
      ''
      ' if <DBDataset."OUT_HAS_CHILDREN_BOOLEAN"> = 1 then begin'
      '  TfrxMemoView(Sender).Color      := $00E2E2E2;'
      '  TfrxMemoView(Sender).Font.Style := fsBold;'
      ' end'
      ' else begin'
      '  TfrxMemoView(Sender).Color      := clNone;'
      '  TfrxMemoView(Sender).Font.Style := nil;'
      ' end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 96
    Top = 184
    Datasets = <
      item
        DataSet = DBDataset
        DataSetName = 'DBDataset'
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
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 347.716760000000000000
        Width = 718.110700000000000000
        DataSet = DBDataset
        DataSetName = 'DBDataset'
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_SCH_NUMBER'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_SCH_NUMBER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 79.370130000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_SCH_TITLE'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."OUT_SCH_TITLE"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 559.370440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_DB_SALDO_CUR'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_DB_SALDO_CUR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_KR_SALDO_CUR'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_KR_SALDO_CUR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 480.000310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_KR_SUMMA'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_KR_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 400.630180000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_DB_SUMMA'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_DB_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 321.260050000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_KR_SALDO_INPUT'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_KR_SALDO_INPUT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 241.889920000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_DB_SALDO_INPUT'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_DB_SALDO_INPUT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        Height = 56.692950000000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Width = 79.370130000000000000
          Height = 56.692950000000000000
          Color = 13092807
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 79.370130000000000000
          Width = 162.519790000000000000
          Height = 56.692950000000000000
          Color = 13092807
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1095#1077#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 241.889920000000000000
          Width = 158.740260000000000000
          Height = 37.795300000000000000
          Color = 13092807
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1074#1089#1090#1091#1087#1080#1090#1077#1083#1100#1085#1086#1077)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 321.260050000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Color = 15000804
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 241.889920000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Color = 15000804
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 400.630180000000000000
          Width = 158.740260000000000000
          Height = 37.795300000000000000
          Color = 13092807
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1073#1086#1088#1086#1090#1099)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 480.000310000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Color = 15000804
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 400.630180000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Color = 15000804
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 37.795300000000000000
          Color = 13092807
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1082#1086#1085#1077#1094' '#1084#1077#1089#1103#1094#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 638.740570000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Color = 15000804
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 559.370440000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Color = 15000804
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 188.976377950000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo21: TfrxMemoView
          Left = 128.504020000000000000
          Top = 60.472440940000000000
          Width = 529.134200000000000000
          Height = 64.252010000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'times new roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1044#1074#1080#1078#1077#1085#1080#1077' '#1089#1088#1077#1076#1089#1090#1074' '#1087#1086' '#1089#1095#1077#1090#1072#1084' '#1079#1072#1088#1072#1073#1086#1090#1085#1086#1081' '#1087#1083#1072#1090#1099' '#1080' '#1089#1090#1080#1087#1077#1085#1076#1080#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 143.622140000000000000
          Top = 132.283464570000000000
          Width = 498.897960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'times new roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1079#1072' [Period]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          Width = 98.267780000000000000
          Height = 79.370130000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Visa]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 128.504020000000000000
          Width = 529.134200000000000000
          Height = 56.692950000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1081' '#1086#1088#1076#1077#1088':  [Order]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 427.086890000000000000
        Width = 718.110700000000000000
        object Memo20: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1089#1090#1088'. [<Page#>] '#1080#1079' [<TotalPages#>]')
          VAlign = vaCenter
        end
      end
    end
  end
  object DBDataset: TfrxDBDataset
    UserName = 'DBDataset'
    CloseDataSource = False
    DataSource = DSource1
    Left = 144
    Top = 184
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 32
    Top = 192
  end
  object dstBuffer: TRxMemoryData
    FieldDefs = <>
    Left = 32
    Top = 143
    object fldSCH_NUMBER: TStringField
      FieldName = 'SCH_NUMBER'
      Size = 60
    end
    object fldSCH_TITLE: TStringField
      FieldName = 'SCH_TITLE'
      Size = 120
    end
    object fldSCH_ERROR: TStringField
      FieldName = 'SCH_ERROR'
      Size = 255
    end
  end
end
