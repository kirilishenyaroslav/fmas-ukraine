object DM: TDM
  OldCreateOrder = False
  Left = 224
  Top = 310
  Height = 582
  Width = 755
  object DB: TpFIBDatabase
    DefaultTransaction = TransactionR
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object TransactionR: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 96
    Top = 8
  end
  object TransactionW: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 192
    Top = 8
  end
  object DSetPeriodType: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    DataSource = DSourceTempletOrPeriod
    Left = 26
    Top = 184
    poSQLINT64ToBCD = True
  end
  object DSourceTimeSheet: TDataSource
    DataSet = DSetTimeSheet
    Left = 139
    Top = 315
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = TransactionW
    Left = 200
    Top = 72
  end
  object DSetTempletOrPeriod: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 24
    Top = 128
    poSQLINT64ToBCD = True
  end
  object DSourceTempletOrPeriod: TDataSource
    DataSet = DSetTempletOrPeriod
    Left = 144
    Top = 128
  end
  object DSetTimeSheet: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    DataSource = DSourcePeriodType
    Left = 19
    Top = 315
    poSQLINT64ToBCD = True
  end
  object DSourcePeriodType: TDataSource
    DataSet = DSetPeriodType
    Left = 144
    Top = 184
  end
  object DSetTypeTsh: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    DataSource = DSourcePeriodType
    Left = 48
    Top = 344
    poSQLINT64ToBCD = True
  end
  object DSourceTypeTsh: TDataSource
    DataSet = DSetTypeTsh
    Left = 136
    Top = 344
  end
  object DsetCalendar: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 280
    Top = 128
    poSQLINT64ToBCD = True
  end
  object DSourceCalendar: TDataSource
    DataSet = DsetCalendar
    Left = 344
    Top = 128
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 336
    Top = 208
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40406.594982905100000000
    ReportOptions.LastChange = 40491.634640289300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var PageIndex:integer=0;'
      ''
      ''
      'procedure Memo17OnAfterData(Sender: TfrxComponent);'
      'var k,p:integer;'
      'begin'
      '  p:=MemoNum.value;'
      '  k:=MemoNum.value mod 2;'
      '  if k=0 then'
      '  begin'
      
        '    MemoNum.color:=$00F1F2F3;      Memo36.color:=$00F1F2F3;     ' +
        'Memo56.color:=$00F1F2F3;      Memo76.color:=$00F1F2F3;'
      
        '    Memo17.color:=$00F1F2F3;       Memo37.color:=$00F1F2F3;     ' +
        'Memo57.color:=$00F1F2F3;      Memo77.color:=$00F1F2F3;'
      
        '    Memo18.color:=$00F1F2F3;       Memo38.color:=$00F1F2F3;     ' +
        'Memo58.color:=$00F1F2F3;      Memo78.color:=$00F1F2F3;'
      
        '    Memo19.color:=$00F1F2F3;       Memo39.color:=$00F1F2F3;     ' +
        'Memo59.color:=$00F1F2F3;      Memo79.color:=$00F1F2F3;'
      
        '    Memo20.color:=$00F1F2F3;       Memo40.color:=$00F1F2F3;     ' +
        'Memo60.color:=$00F1F2F3;      Memo80.color:=$00F1F2F3;'
      
        '    Memo21.color:=$00F1F2F3;       Memo41.color:=$00F1F2F3;     ' +
        'Memo61.color:=$00F1F2F3;      Memo81.color:=$00F1F2F3;'
      
        '    Memo22.color:=$00F1F2F3;       Memo42.color:=$00F1F2F3;     ' +
        'Memo62.color:=$00F1F2F3;      Memo82.color:=$00F1F2F3;'
      
        '    Memo23.color:=$00F1F2F3;       Memo43.color:=$00F1F2F3;     ' +
        'Memo63.color:=$00F1F2F3;      Memo83.color:=$00F1F2F3;'
      
        '    Memo24.color:=$00F1F2F3;       Memo44.color:=$00F1F2F3;     ' +
        'Memo64.color:=$00F1F2F3;      Memo84.color:=$00F1F2F3;'
      
        '    Memo25.color:=$00F1F2F3;       Memo45.color:=$00F1F2F3;     ' +
        'Memo65.color:=$00F1F2F3;      Memo85.color:=$00F1F2F3;'
      
        '    Memo26.color:=$00F1F2F3;       Memo46.color:=$00F1F2F3;     ' +
        'Memo66.color:=$00F1F2F3;      Memo86.color:=$00F1F2F3;'
      
        '    Memo27.color:=$00F1F2F3;       Memo47.color:=$00F1F2F3;     ' +
        'Memo67.color:=$00F1F2F3;      Memo87.color:=$00F1F2F3;'
      
        '    Memo28.color:=$00F1F2F3;       Memo48.color:=$00F1F2F3;     ' +
        'Memo68.color:=$00F1F2F3;      Memo88.color:=$00F1F2F3;'
      
        '    Memo29.color:=$00F1F2F3;       Memo49.color:=$00F1F2F3;     ' +
        'Memo69.color:=$00F1F2F3;      Memo89.color:=$00F1F2F3;'
      
        '    Memo30.color:=$00F1F2F3;       Memo50.color:=$00F1F2F3;     ' +
        'Memo70.color:=$00F1F2F3;'
      
        '    Memo31.color:=$00F1F2F3;       Memo51.color:=$00F1F2F3;     ' +
        'Memo71.color:=$00F1F2F3;'
      
        '    Memo32.color:=$00F1F2F3;       Memo52.color:=$00F1F2F3;     ' +
        'Memo72.color:=$00F1F2F3;'
      
        '    Memo33.color:=$00F1F2F3;       Memo53.color:=$00F1F2F3;     ' +
        'Memo73.color:=$00F1F2F3;'
      
        '    Memo34.color:=$00F1F2F3;       Memo54.color:=$00F1F2F3;     ' +
        'Memo74.color:=$00F1F2F3;'
      
        '    Memo35.color:=$00F1F2F3;       Memo55.color:=$00F1F2F3;     ' +
        'Memo75.color:=$00F1F2F3;'
      '  end'
      '  else'
      '  begin'
      
        '    MemoNum.color:=clWindow;      Memo36.color:=clWindow;     Me' +
        'mo56.color:=clWindow;      Memo76.color:=clWindow;'
      
        '    Memo17.color:=clWindow;       Memo37.color:=clWindow;     Me' +
        'mo57.color:=clWindow;      Memo77.color:=clWindow;'
      
        '    Memo18.color:=clWindow;       Memo38.color:=clWindow;     Me' +
        'mo58.color:=clWindow;      Memo78.color:=clWindow;'
      
        '    Memo19.color:=clWindow;       Memo39.color:=clWindow;     Me' +
        'mo59.color:=clWindow;      Memo79.color:=clWindow;'
      
        '    Memo20.color:=clWindow;       Memo40.color:=clWindow;     Me' +
        'mo60.color:=clWindow;      Memo80.color:=clWindow;'
      
        '    Memo21.color:=clWindow;       Memo41.color:=clWindow;     Me' +
        'mo61.color:=clWindow;      Memo81.color:=clWindow;'
      
        '    Memo22.color:=clWindow;       Memo42.color:=clWindow;     Me' +
        'mo62.color:=clWindow;      Memo82.color:=clWindow;'
      
        '    Memo23.color:=clWindow;       Memo43.color:=clWindow;     Me' +
        'mo63.color:=clWindow;      Memo83.color:=clWindow;'
      
        '    Memo24.color:=clWindow;       Memo44.color:=clWindow;     Me' +
        'mo64.color:=clWindow;      Memo84.color:=clWindow;'
      
        '    Memo25.color:=clWindow;       Memo45.color:=clWindow;     Me' +
        'mo65.color:=clWindow;      Memo85.color:=clWindow;'
      
        '    Memo26.color:=clWindow;       Memo46.color:=clWindow;     Me' +
        'mo66.color:=clWindow;      Memo86.color:=clWindow;'
      
        '    Memo27.color:=clWindow;       Memo47.color:=clWindow;     Me' +
        'mo67.color:=clWindow;      Memo87.color:=clWindow;'
      
        '    Memo28.color:=clWindow;       Memo48.color:=clWindow;     Me' +
        'mo68.color:=clWindow;      Memo88.color:=clWindow;'
      
        '    Memo29.color:=clWindow;       Memo49.color:=clWindow;     Me' +
        'mo69.color:=clWindow;      Memo89.color:=clWindow;'
      
        '    Memo30.color:=clWindow;       Memo50.color:=clWindow;     Me' +
        'mo70.color:=clWindow;'
      
        '    Memo31.color:=clWindow;       Memo51.color:=clWindow;     Me' +
        'mo71.color:=clWindow;'
      
        '    Memo32.color:=clWindow;       Memo52.color:=clWindow;     Me' +
        'mo72.color:=clWindow;'
      
        '    Memo33.color:=clWindow;       Memo53.color:=clWindow;     Me' +
        'mo73.color:=clWindow;'
      
        '    Memo34.color:=clWindow;       Memo54.color:=clWindow;     Me' +
        'mo74.color:=clWindow;'
      
        '    Memo35.color:=clWindow;       Memo55.color:=clWindow;     Me' +
        'mo75.color:=clWindow;'
      '  end;'
      'end;'
      ''
      'procedure ReportOnStartReport(Sender: TfrxComponent);'
      'begin'
      '  PageIndex:=-1;'
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if (PageIndex=-1) then PageIndex:=1 ;'
      'end;'
      ''
      'procedure Page2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if (PageIndex>=<TotalPages#>/2) then PageIndex:=2 ;'
      'end;'
      ''
      ''
      'procedure Memo1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  Memo1.text:='#39#1089#1090#1086#1088'. '#39'+inttostr(PageIndex)+'#39' '#1079' [TotalPages#]'#39';'
      '  PageIndex:=PageIndex+2'
      'end;'
      ''
      ''
      ''
      ''
      'procedure Memo180OnAfterData(Sender: TfrxComponent);'
      'var k,p:integer;'
      'begin'
      '  p:=Memo180.value;'
      '  k:=Memo180.value mod 2;'
      '  if k=0 then'
      '  begin'
      
        '    Memo166.color:=$00F1F2F3;       Memo167.color:=$00F1F2F3;   ' +
        ' Memo140.color:=$00F1F2F3;       Memo168.color:=$00F1F2F3;'
      
        '    Memo169.color:=$00F1F2F3;       Memo170.color:=$00F1F2F3;   ' +
        ' Memo171.color:=$00F1F2F3;       Memo172.color:=$00F1F2F3;'
      
        '    Memo173.color:=$00F1F2F3;       Memo174.color:=$00F1F2F3;   ' +
        ' Memo175.color:=$00F1F2F3;       Memo176.color:=$00F1F2F3;'
      
        '    Memo177.color:=$00F1F2F3;       Memo178.color:=$00F1F2F3;   ' +
        ' Memo180.color:=$00F1F2F3;'
      '  end'
      '  else'
      '  begin'
      
        '    Memo166.color:=clWindow;       Memo167.color:=clWindow;    M' +
        'emo140.color:=clWindow;       Memo168.color:=clWindow;'
      
        '    Memo169.color:=clWindow;       Memo170.color:=clWindow;    M' +
        'emo171.color:=clWindow;       Memo172.color:=clWindow;'
      
        '    Memo173.color:=clWindow;       Memo174.color:=clWindow;    M' +
        'emo175.color:=clWindow;       Memo176.color:=clWindow;'
      
        '    Memo177.color:=clWindow;       Memo178.color:=clWindow;    M' +
        'emo180.color:=clWindow;'
      '  end;'
      'end;'
      'procedure Memo182OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '    Memo182.text:='#39#1089#1090#1086#1088'. '#39'+inttostr(PageIndex)+'#39' '#1079' [TotalPages#]' +
        #39';'
      '  PageIndex:=PageIndex+2'
      'end;'
      ''
      'begin'
      'end.')
    OnGetValue = ReportGetValue
    OnStartReport = 'ReportOnStartReport'
    Left = 335
    Top = 256
    Datasets = <
      item
        DataSet = DBDataset1
        DataSetName = 'DBDataset1'
      end
      item
        DataSet = DBDatasetInfo
        DataSetName = 'DBDatasetinfo'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Color = clWhite
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 52.913420000000000000
        ParentFont = False
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        DataSet = DBDataset1
        DataSetName = 'DBDataset1'
        RowCount = 0
        object Memo17: TfrxMemoView
          Left = 30.236240000000000000
          Width = 102.047310000000000000
          Height = 52.913420000000000000
          DataField = 'TN'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset1."TN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoNum: TfrxMemoView
          Width = 30.236240000000000000
          Height = 52.913420000000000000
          OnAfterData = 'Memo17OnAfterData'
          DataField = 'INDEXNUM'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."INDEXNUM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 132.283550000000000000
          Width = 37.795300000000000000
          Height = 52.913420000000000000
          DataField = 'SEX'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."SEX"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 170.078850000000000000
          Width = 257.008040000000000000
          Height = 52.913420000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset1."Caption"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 427.086890000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D1'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D1"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 427.086890000000000000
          Top = 13.228346460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T1'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 427.086890000000000000
          Top = 26.456710000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D16'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D16"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 427.086890000000000000
          Top = 39.685056460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T16'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T16"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 451.653550630000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D2'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D2"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 451.653550630000000000
          Top = 13.228346460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 451.653550630000000000
          Top = 26.456710000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D17'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D17"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 451.653550630000000000
          Top = 39.685056460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T17'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T17"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 476.220780000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D3'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D3"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 476.220780000000000000
          Top = 13.228346460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T3'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T3"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 476.220780000000000000
          Top = 26.456710000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D18'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D18"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 476.220780000000000000
          Top = 39.685056460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T18'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T18"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 500.787440630000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D4'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D4"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 500.787440630000000000
          Top = 13.228346460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T4'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T4"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 500.787440630000000000
          Top = 26.456710000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D19'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D19"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 500.787440630000000000
          Top = 39.685056460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T19'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T19"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 525.354670000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D5'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D5"]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 525.354670000000000000
          Top = 13.228346460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T5'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T5"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 525.354670000000000000
          Top = 26.456710000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D20'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D20"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 525.354670000000000000
          Top = 39.685056460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T20'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T20"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 549.921330630000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D6'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D6"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 549.921330630000000000
          Top = 13.228346460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T6'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T6"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 549.921330630000000000
          Top = 26.456710000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D21'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D21"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 549.921330630000000000
          Top = 39.685056460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T21'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T21"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 574.488560000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D7'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D7"]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 574.488560000000000000
          Top = 13.228346460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T7'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T7"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 574.488560000000000000
          Top = 26.456710000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D22'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D22"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 574.488560000000000000
          Top = 39.685056460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T22'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T22"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 599.055220630000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D8'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D8"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 599.055220630000000000
          Top = 13.228346460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T8'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T8"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 599.055220630000000000
          Top = 26.456710000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D23'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D23"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 599.055220630000000000
          Top = 39.685056460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T23'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T23"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 623.622450000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D9'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D9"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 623.622450000000000000
          Top = 13.228346460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T9'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T9"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 623.622450000000000000
          Top = 26.456710000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D24'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D24"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 623.622450000000000000
          Top = 39.685056460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T24'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T24"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 648.189110630000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D10'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D10"]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 648.189110630000000000
          Top = 13.228346460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T10'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T10"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 648.189110630000000000
          Top = 26.456710000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D25'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D25"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 648.189110630000000000
          Top = 39.685056460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T25'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T25"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 672.756340000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D11'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D11"]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 672.756340000000000000
          Top = 13.228346460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T11'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T11"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 672.756340000000000000
          Top = 26.456710000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D26'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D26"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 672.756340000000000000
          Top = 39.685056460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T26'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T26"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 697.323000630000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D12'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D12"]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 697.323000630000000000
          Top = 13.228346460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T12'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T12"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 697.323000630000000000
          Top = 26.456710000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D27'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D27"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 697.323000630000000000
          Top = 39.685056460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T27'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T27"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 721.890230000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D13'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D13"]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 721.890230000000000000
          Top = 13.228346460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T13'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T13"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 721.890230000000000000
          Top = 26.456710000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D28'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D28"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 721.890230000000000000
          Top = 39.685056460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T28'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T28"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 746.456890630000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D14'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D14"]')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 746.456890630000000000
          Top = 13.228346460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T14'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T14"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 746.456890630000000000
          Top = 26.456710000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D29'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D29"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 746.456890630000000000
          Top = 39.685056460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T29'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T29"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 771.024120000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D15'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D15"]')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Left = 771.024120000000000000
          Top = 13.228346460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T15'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T15"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 771.024120000000000000
          Top = 26.456710000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D30'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D30"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 771.024120000000000000
          Top = 39.685056460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T30'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T30"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 795.590780630000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 795.590780630000000000
          Top = 13.228346460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 795.590780630000000000
          Top = 26.456710000000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'D31'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."D31"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 795.590780630000000000
          Top = 39.685056460000000000
          Width = 24.566929130000000000
          Height = 13.228346460000000000
          DataField = 'T31'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."T31"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 820.158010000000000000
          Width = 37.795300000000000000
          Height = 52.913420000000000000
          DataField = 'WORK_DAY'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."WORK_DAY"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 857.953310000000000000
          Width = 37.795300000000000000
          Height = 52.913420000000000000
          DataField = 'WORK_HOURS'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."WORK_HOURS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 895.748610000000000000
          Width = 37.795300000000000000
          Height = 52.913420000000000000
          DataField = 'WORK_HOURS_OVERTIME'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."WORK_HOURS_OVERTIME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 933.543910000000000000
          Width = 37.795300000000000000
          Height = 52.913420000000000000
          DataField = 'WORK_HOURS_NIGHT'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."WORK_HOURS_NIGHT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 971.339210000000000000
          Width = 37.795300000000000000
          Height = 52.913420000000000000
          DataField = 'WORK_HOURS_HOL'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."WORK_HOURS_HOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          Left = 1009.134510000000000000
          Width = 37.795300000000000000
          Height = 52.913420000000000000
          DataField = 'WORK_HOURS_OUTPUT'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."WORK_HOURS_OUTPUT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Height = 52.913420000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line4: TfrxLineView
          Left = 1046.929133858270000000
          Height = 52.913420000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
      end
      object PageFooter1: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 544.252320000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxSysMemoView
          Left = 952.441560000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Memo183: TfrxMemoView
          Left = 3.779530000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            ' [DBDatasetinfo."PRINT_CAPTION"]     [DATE_PRINT]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 238.110390000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo3: TfrxMemoView
          Left = -0.000000000000000210
          Top = 120.944960000000000000
          Width = 30.236240000000000000
          Height = 90.708720000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'N'
            #1087'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 30.236240000000000000
          Top = 120.944960000000000000
          Width = 102.047310000000000000
          Height = 90.708720000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1058#1072#1073#1077#1083#1100#1085#1080#1081' '#1085#1086#1084#1077#1088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 132.283550000000000000
          Top = 120.944960000000000000
          Width = 37.795300000000000000
          Height = 90.708720000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090#1072#1090#1100
            '('#1095'/'#1078')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 170.078850000000000000
          Top = 120.944960000000000000
          Width = 257.008040000000000000
          Height = 90.708720000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1055'. '#1030'. '#1041'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 427.086614170000000000
          Top = 120.944960000000000000
          Width = 393.070866140000000000
          Height = 13.228346460000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1084#1110#1090#1082#1080' '#1087#1088#1086' '#1103#1074#1082#1080' '#1090#1072' '#1085#1077#1103#1074#1082#1080' '#1079#1072' '#1095#1080#1089#1083#1072#1084#1080' '#1084#1110#1089#1103#1094#1103' ('#1075#1086#1076#1080#1085#1080')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 820.157480310000000000
          Top = 120.944960000000000000
          Width = 226.771653540000000000
          Height = 13.228346460000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1074#1072#1085#1086' '#1079#1072' '#1084#1110#1089#1103#1094#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 857.952755910000000000
          Top = 134.173306460000000000
          Width = 188.976377950000000000
          Height = 13.228346460000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1075#1086#1076#1080#1085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 895.748031500000000000
          Top = 147.401670000000000000
          Width = 151.181102360000000000
          Height = 13.228346460000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1079' '#1085#1080#1093)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 820.157480310000000000
          Top = 134.173306460000000000
          Width = 37.795300000000000000
          Height = 77.480314960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1085#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 857.952755910000000000
          Top = 147.401670000000000000
          Width = 37.795275590000000000
          Height = 64.251968500000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1074#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 895.748031500000000000
          Top = 160.629999370000000000
          Width = 37.795275590000000000
          Height = 51.023622050000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1085#1072#1076#1091#1088#1086#1095#1085#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 933.543307090000000000
          Top = 160.629999370000000000
          Width = 37.795275590000000000
          Height = 51.023622050000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1085#1110#1095#1085#1080#1093)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 971.338582680000000000
          Top = 160.629999370000000000
          Width = 37.795275590000000000
          Height = 51.023622050000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1089#1074#1103#1090#1082#1086#1074#1080#1093)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 1009.133858270000000000
          Top = 160.629999370000000000
          Width = 37.795275590000000000
          Height = 51.023622050000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1074#1080#1093#1110#1076#1085#1080#1093)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo91: TfrxMemoView
          Left = 795.590551180000000000
          Top = 134.173306460000000000
          Width = 24.566929130000000000
          Height = 28.346424960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo92: TfrxMemoView
          Left = 771.023622050000000000
          Top = 134.173306460000000000
          Width = 24.566929130000000000
          Height = 28.346424960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '15')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 746.456692910000000000
          Top = 134.173306460000000000
          Width = 24.566929130000000000
          Height = 28.346424960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '14')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 721.890198270000000000
          Top = 134.173306460000000000
          Width = 24.566929130000000000
          Height = 28.346424960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '13')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 697.323269140000000000
          Top = 134.173306460000000000
          Width = 24.566929130000000000
          Height = 28.346424960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '12')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Left = 672.756340000000000000
          Top = 134.173306460000000000
          Width = 24.566929130000000000
          Height = 28.346424960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '11')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 476.220748270000000000
          Top = 134.173306460000000000
          Width = 24.566929130000000000
          Height = 28.346424960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 451.653819140000000000
          Top = 134.173306460000000000
          Width = 24.566929130000000000
          Height = 28.346424960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 427.086890000000000000
          Top = 134.173306460000000000
          Width = 24.566929130000000000
          Height = 28.346424960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo100: TfrxMemoView
          Left = 549.921259840000000000
          Top = 134.173306460000000000
          Width = 24.566929130000000000
          Height = 28.346424960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo101: TfrxMemoView
          Left = 525.354330710000000000
          Top = 134.173306460000000000
          Width = 24.566929130000000000
          Height = 28.346424960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo102: TfrxMemoView
          Left = 500.787401570000000000
          Top = 134.173306460000000000
          Width = 24.566929130000000000
          Height = 28.346424960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo103: TfrxMemoView
          Left = 623.622418270000000000
          Top = 134.173306460000000000
          Width = 24.566929130000000000
          Height = 28.346424960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '9')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo104: TfrxMemoView
          Left = 599.055489140000000000
          Top = 134.173306460000000000
          Width = 24.566929130000000000
          Height = 28.346424960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '8')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo105: TfrxMemoView
          Left = 574.488560000000000000
          Top = 134.173306460000000000
          Width = 24.566929130000000000
          Height = 28.346424960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '7')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          Left = 648.188976380000000000
          Top = 134.173306460000000000
          Width = 24.566929130000000000
          Height = 28.346424960000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '10')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo107: TfrxMemoView
          Left = 427.086890000000000000
          Top = 162.519790000000000000
          Width = 24.566929130000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '16')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo108: TfrxMemoView
          Left = 451.653543310000000000
          Top = 162.519790000000000000
          Width = 24.566929130000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '17')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo109: TfrxMemoView
          Left = 476.220780000000000000
          Top = 162.519790000000000000
          Width = 24.566929130000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '18')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 500.787433310000000000
          Top = 162.519790000000000000
          Width = 24.566929130000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '19')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 525.354670000000000000
          Top = 162.519790000000000000
          Width = 24.566929130000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '20')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo112: TfrxMemoView
          Left = 549.921323310000000000
          Top = 162.519790000000000000
          Width = 24.566929130000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '21')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Left = 574.488560000000000000
          Top = 162.519790000000000000
          Width = 24.566929130000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '22')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Left = 599.055213310000000000
          Top = 162.519790000000000000
          Width = 24.566929130000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '23')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo115: TfrxMemoView
          Left = 623.622450000000000000
          Top = 162.519790000000000000
          Width = 24.566929130000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '24')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Left = 648.189103310000000000
          Top = 162.519790000000000000
          Width = 24.566929130000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '25')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 672.756340000000000000
          Top = 162.519790000000000000
          Width = 24.566929130000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '26')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 697.322993310000000000
          Top = 162.519790000000000000
          Width = 24.566929130000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '27')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 721.890230000000000000
          Top = 162.519790000000000000
          Width = 24.566929130000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '28')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo120: TfrxMemoView
          Left = 746.456883310000000000
          Top = 162.519790000000000000
          Width = 24.566929130000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '29')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo121: TfrxMemoView
          Left = 771.024120000000000000
          Top = 162.519790000000000000
          Width = 24.566929130000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '30')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          Left = 795.590773310000000000
          Top = 162.519790000000000000
          Width = 24.566929130000000000
          Height = 49.133858270000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '31')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = -0.000000000000000210
          Top = 120.944960000000000000
          Width = 1046.929810000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line2: TfrxLineView
          Left = -0.000000000000000210
          Top = 120.944960000000000000
          Height = 117.165430000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line5: TfrxLineView
          Left = 1046.929810000000000000
          Top = 120.944960000000000000
          Height = 117.165430000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Memo2: TfrxMemoView
          Align = baCenter
          Left = 368.504175000000000000
          Width = 309.921460000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1040#1041#1045#1051#1068' '#1054#1041#1051#1048#1050#1059' '#1056#1054#1041#1054#1063#1054#1043#1054' '#1063#1040#1057#1059)
          ParentFont = False
        end
        object Memo185: TfrxMemoView
          Left = 468.661720000000000000
          Top = 34.015770000000000000
          Width = 158.740260000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo186: TfrxMemoView
          Left = 786.142240000000000000
          Top = 49.133890000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1079)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo187: TfrxMemoView
          Left = 786.142240000000000000
          Top = 34.015770000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1074#1110#1090#1085#1080#1081' '#1087#1077#1088#1110#1086#1076)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo188: TfrxMemoView
          Left = 468.661720000000000000
          Top = 64.252010000000000000
          Width = 158.740260000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDatasetinfo."ID"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo189: TfrxMemoView
          Left = 105.826840000000000000
          Top = 34.015770000000000000
          Width = 362.834880000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1096#1072#1073#1083#1086#1085#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo190: TfrxMemoView
          Left = 105.826840000000000000
          Top = 64.252010000000000000
          Width = 362.834880000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDatasetinfo."NAME_TEMPLATE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo191: TfrxMemoView
          Left = 627.401980000000000000
          Top = 34.015770000000000000
          Width = 158.740260000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1088#1091#1082#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo192: TfrxMemoView
          Left = 627.401980000000000000
          Top = 64.252010000000000000
          Width = 158.740260000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DATE_PRINT]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo193: TfrxMemoView
          Left = 865.512370000000000000
          Top = 49.133890000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo194: TfrxMemoView
          Left = 786.142240000000000000
          Top = 64.252010000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDatasetinfo."DATE_BEG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo195: TfrxMemoView
          Left = 865.512370000000000000
          Top = 64.252010000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDatasetinfo."DATE_END"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 128.504020000000000000
        ParentFont = False
        Top = 393.071120000000000000
        Width = 1046.929810000000000000
        object Memo16: TfrxMemoView
          Top = 22.677180000000000000
          Width = 517.795610000000000000
          Height = 105.826840000000000000
          AllowHTMLTags = True
          DataSet = DBDatasetInfo
          DataSetName = 'DBDatasetinfo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              '<b>'#1042#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1072' '#1086#1089#1086#1073#1072'</b>                   [DBDatasetinfo."POS' +
              'T_RESPONSIBLE"]'
            ''
            
              '"__"__________20__'#1088'.                 <u>                </u>  [D' +
              'BDatasetinfo."FIO_RESPONSIBLE"]'
            '                                                        ('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          Left = 529.134200000000000000
          Top = 22.677180000000000000
          Width = 514.016080000000000000
          Height = 105.826840000000000000
          AllowHTMLTags = True
          DataSet = DBDatasetInfo
          DataSetName = 'DBDatasetinfo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              '<b>'#1050#1077#1088#1110#1074#1085#1080#1082' '#1089#1090#1088#1091#1082#1090#1091#1088#1085#1086#1075#1086' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1091'</b>              [DBDataseti' +
              'nfo."POST_HEAD"]'
            ''
            
              '"__"__________20__'#1088'.                                       <u>  ' +
              '              </u>  [DBDatasetinfo."FIO_HEAD"]'
            
              '                                                                ' +
              '                    ('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
        end
      end
    end
    object Page2: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      OnBeforePrint = 'Page2OnBeforePrint'
      object Header2: TfrxHeader
        Height = 177.637910000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo124: TfrxMemoView
          Left = 37.795300000000000000
          Top = 7.559060000000000000
          Width = 68.031540000000000000
          Height = 139.842531890000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1085#1077#1103#1074#1086#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo125: TfrxMemoView
          Left = 975.118740000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 170.078850000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1082#1083#1072#1076', '#1090#1072#1088#1080#1092#1085#1072' '#1089#1090#1072#1074#1082#1072', '#1075#1088#1085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo126: TfrxMemoView
          Left = 105.826840000000000000
          Top = 7.559060000000000000
          Width = 869.291900000000000000
          Height = 18.897650000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1079' '#1087#1088#1080#1095#1080#1085' '#1079#1072' '#1084#1110#1089#1103#1094#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo127: TfrxMemoView
          Left = 105.826840000000000000
          Top = 26.456710000000000000
          Width = 75.590600000000000000
          Height = 120.944881890000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1086#1089#1085#1086#1074#1085#1072' '#1090#1072' '#1076#1086#1076#1072#1090#1082#1086#1074#1072' '#1074#1110#1076#1087#1091#1089#1090#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo128: TfrxMemoView
          Left = 181.417440000000000000
          Top = 26.456710000000000000
          Width = 75.590600000000000000
          Height = 120.944881890000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1074#1110#1076#1087#1091#1089#1090#1082#1080' '#1091' '#1079#1074#39#1103#1079#1082#1091' '#1079' '#1085#1072#1074#1095#1072#1085#1085#1103#1084', '#1090#1074#1086#1088#1095#1110', '#1074' '#1086#1073#1086#1074'. '#1087#1086#1088#1103#1076#1082#1091' '#1090#1072' '#1110#1085#1096#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo129: TfrxMemoView
          Left = 257.008040000000000000
          Top = 26.456710000000000000
          Width = 71.811070000000000000
          Height = 120.944881890000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1074#1110#1076#1087#1091#1089#1090#1082#1080' '#1073#1077#1079' '#1079#1073#1077#1088#1077#1078#1077#1085#1085#1103' '#1079'/'#1087' '#1079#1072' '#1079#1075#1086#1076#1086#1102' '#1089#1090#1086#1088#1110#1085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo130: TfrxMemoView
          Left = 328.819110000000000000
          Top = 26.456710000000000000
          Width = 71.811070000000000000
          Height = 120.944881890000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1074#1110#1076#1087#1091#1089#1090#1082#1080' '#1073#1077#1079' '#1079#1073#1077#1088#1077#1078#1077#1085#1085#1103' '#1079'/'#1087' '#1085#1072' '#1087#1088#1080#1087#1080#1085#1077#1085#1085#1103' '#1088#1086#1073#1110#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo131: TfrxMemoView
          Left = 400.630180000000000000
          Top = 26.456710000000000000
          Width = 71.811070000000000000
          Height = 120.944881890000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1077#1088#1077#1074#1086#1076' '#1085#1072' '#1085#1077#1087#1086#1074#1085#1080#1081' '#1088#1086#1073#1086#1095#1080#1081' '#1076#1077#1085#1100' ('#1090#1080#1078#1076#1077#1085#1100')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo132: TfrxMemoView
          Left = 472.441250000000000000
          Top = 26.456710000000000000
          Width = 71.811070000000000000
          Height = 120.944881890000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1090#1080#1084#1095#1072#1089#1086#1074#1099#1081' '#1087#1077#1088#1077#1074#1086#1076' '#1085#1072' '#1110#1085#1096#1110' '#1087#1110#1076#1087#1088#1080#1108#1084#1089#1090#1074#1086'  ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo133: TfrxMemoView
          Left = 544.252320000000000000
          Top = 26.456710000000000000
          Width = 71.811070000000000000
          Height = 120.944881890000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1086#1089#1090#1086#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo134: TfrxMemoView
          Left = 616.063390000000000000
          Top = 26.456710000000000000
          Width = 71.811070000000000000
          Height = 120.944881890000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1086#1075#1091#1083#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo135: TfrxMemoView
          Left = 687.874460000000000000
          Top = 26.456710000000000000
          Width = 71.811070000000000000
          Height = 120.944881890000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1089#1090#1088#1072#1081#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo136: TfrxMemoView
          Left = 759.685530000000000000
          Top = 26.456710000000000000
          Width = 71.811070000000000000
          Height = 120.944881890000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1090#1080#1084#1095#1072#1089#1086#1074#1072' '#1085#1077#1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1110#1089#1090#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo137: TfrxMemoView
          Left = 831.496600000000000000
          Top = 26.456710000000000000
          Width = 71.811070000000000000
          Height = 120.944881890000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1110#1085#1096#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo138: TfrxMemoView
          Left = 903.307670000000000000
          Top = 26.456710000000000000
          Width = 71.811070000000000000
          Height = 120.944881890000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo139: TfrxMemoView
          Left = 37.795300000000000000
          Top = 147.401670000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1075#1086#1076#1080#1085#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo141: TfrxMemoView
          Left = 37.795300000000000000
          Top = 162.519790000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1085#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo142: TfrxMemoView
          Left = 105.826840000000000000
          Top = 147.401670000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1086#1076#1080' 8-10')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo143: TfrxMemoView
          Left = 105.826840000000000000
          Top = 162.519790000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1085#1110'/'#1075#1086#1076'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo144: TfrxMemoView
          Left = 181.417440000000000000
          Top = 147.401670000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '11-15,17,22')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo146: TfrxMemoView
          Left = 257.008040000000000000
          Top = 147.401670000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1086#1076#1080' 18')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo148: TfrxMemoView
          Left = 328.819110000000000000
          Top = 147.401670000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1086#1076#1080' 19')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo150: TfrxMemoView
          Left = 400.630180000000000000
          Top = 147.401670000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1086#1076#1080' 20')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo152: TfrxMemoView
          Left = 472.441250000000000000
          Top = 147.401670000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1086#1076#1080' 21')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo154: TfrxMemoView
          Left = 544.252320000000000000
          Top = 147.401670000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1086#1076#1080' 23')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo156: TfrxMemoView
          Left = 616.063390000000000000
          Top = 147.401670000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1086#1076#1080' 24')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo158: TfrxMemoView
          Left = 687.874460000000000000
          Top = 147.401670000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1086#1076#1080' 25')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo160: TfrxMemoView
          Left = 759.685530000000000000
          Top = 147.401670000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1086#1076#1080' 26-27')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo162: TfrxMemoView
          Left = 831.496600000000000000
          Top = 147.401670000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1086#1076#1080' 28-30')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo164: TfrxMemoView
          Left = 903.307670000000000000
          Top = 147.401670000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo145: TfrxMemoView
          Left = 181.417440000000000000
          Top = 162.519790000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1085#1110'/'#1075#1086#1076'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo147: TfrxMemoView
          Left = 257.008040000000000000
          Top = 162.519790000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1085#1110'/'#1075#1086#1076'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo149: TfrxMemoView
          Left = 328.819110000000000000
          Top = 162.519790000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1085#1110'/'#1075#1086#1076'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo151: TfrxMemoView
          Left = 400.630180000000000000
          Top = 162.519790000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1085#1110'/'#1075#1086#1076'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo153: TfrxMemoView
          Left = 472.441250000000000000
          Top = 162.519790000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1085#1110'/'#1075#1086#1076'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo155: TfrxMemoView
          Left = 544.252320000000000000
          Top = 162.519790000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1085#1110'/'#1075#1086#1076'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo157: TfrxMemoView
          Left = 616.063390000000000000
          Top = 162.519790000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1085#1110'/'#1075#1086#1076'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo159: TfrxMemoView
          Left = 687.874460000000000000
          Top = 162.519790000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1085#1110'/'#1075#1086#1076'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo161: TfrxMemoView
          Left = 759.685530000000000000
          Top = 162.519790000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1085#1110'/'#1075#1086#1076'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo163: TfrxMemoView
          Left = 831.496600000000000000
          Top = 162.519790000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1085#1110'/'#1075#1086#1076'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo165: TfrxMemoView
          Left = 903.307670000000000000
          Top = 162.519790000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1085#1110'/'#1075#1086#1076'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line6: TfrxLineView
          Top = 7.559060000000000000
          Width = 1046.929810000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line7: TfrxLineView
          Top = 7.559060000000000000
          Height = 166.299320000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line8: TfrxLineView
          Left = 1046.929810000000000000
          Top = 7.559060000000000000
          Height = 170.078850000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Memo181: TfrxMemoView
          Top = 7.559060000000000000
          Width = 37.795300000000000000
          Height = 170.078850000000000000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'N'
            #1087'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData3: TfrxMasterData
        Height = 52.913385830000000000
        Top = 219.212740000000000000
        Width = 1046.929810000000000000
        DataSet = DBDataset1
        DataSetName = 'DBDataset1'
        RowCount = 0
        object Memo166: TfrxMemoView
          Left = 37.795300000000000000
          Width = 68.031540000000000000
          Height = 52.913385830000000000
          DataField = 'ABSENCE_HOUR_AND_DAY'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."ABSENCE_HOUR_AND_DAY"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo167: TfrxMemoView
          Left = 105.826840000000000000
          Width = 75.590553620000000000
          Height = 52.913385830000000000
          DataField = 'KOD_8'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."KOD_8"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo140: TfrxMemoView
          Left = 181.417440000000000000
          Width = 75.590553620000000000
          Height = 52.913385826771700000
          DataField = 'KOD_11'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."KOD_11"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo168: TfrxMemoView
          Left = 257.008040000000000000
          Width = 71.811023620000000000
          Height = 52.913385826771700000
          DataField = 'KOD_18'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."KOD_18"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo169: TfrxMemoView
          Left = 328.819110000000000000
          Width = 71.811023620000000000
          Height = 52.913385826771700000
          DataField = 'KOD_19'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."KOD_19"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo170: TfrxMemoView
          Left = 400.630180000000000000
          Width = 71.811023620000000000
          Height = 52.913385826771700000
          DataField = 'KOD_20'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."KOD_20"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo171: TfrxMemoView
          Left = 472.441250000000000000
          Width = 71.811023620000000000
          Height = 52.913385826771700000
          DataField = 'KOD_21'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."KOD_21"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo172: TfrxMemoView
          Left = 544.252320000000000000
          Width = 71.811023620000000000
          Height = 52.913385826771700000
          DataField = 'KOD_23'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."KOD_23"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo173: TfrxMemoView
          Left = 616.063390000000000000
          Width = 71.811023620000000000
          Height = 52.913385826771700000
          DataField = 'KOD_24'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."KOD_24"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo174: TfrxMemoView
          Left = 687.874460000000000000
          Width = 71.811023620000000000
          Height = 52.913385826771700000
          DataField = 'KOD_25'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."KOD_25"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo175: TfrxMemoView
          Left = 759.685530000000000000
          Width = 71.811023620000000000
          Height = 52.913385826771700000
          DataField = 'KOD_26'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."KOD_26"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo176: TfrxMemoView
          Left = 831.496600000000000000
          Width = 71.811023620000000000
          Height = 52.913385826771700000
          DataField = 'KOD_28'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."KOD_28"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo177: TfrxMemoView
          Left = 903.307670000000000000
          Width = 71.811023620000000000
          Height = 52.913385826771700000
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo178: TfrxMemoView
          Left = 975.118740000000000000
          Width = 71.811070000000000000
          Height = 52.913385830000000000
          DataField = 'OKLAD'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."OKLAD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line9: TfrxLineView
          Height = 52.913420000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line10: TfrxLineView
          Left = 1046.929810000000000000
          Height = 52.913420000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Memo180: TfrxMemoView
          Width = 37.795300000000000000
          Height = 52.913385830000000000
          OnAfterData = 'Memo180OnAfterData'
          DataField = 'INDEXNUM'
          DataSet = DBDataset1
          DataSetName = 'DBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset1."INDEXNUM"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary2: TfrxReportSummary
        Height = 162.519790000000000000
        Top = 332.598640000000000000
        Width = 1046.929810000000000000
        object Memo179: TfrxMemoView
          Left = 71.811070000000000000
          Top = 34.015770000000000000
          Width = 608.504330000000000000
          Height = 105.826840000000000000
          AllowHTMLTags = True
          DataSet = DBDatasetInfo
          DataSetName = 'DBDatasetinfo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            
              '<b>'#1055#1088#1072#1094#1110#1074#1085#1080#1082' '#1082#1072#1076#1088#1086#1074#1086#1111' '#1089#1083#1091#1078#1073#1080' </b>                               ' +
              '         [DBDatasetinfo."POST_PERSONNEL"]'
            ''
            
              '"__"__________20__'#1088'.                                            ' +
              '         <u>                </u>            [DBDatasetinfo."FIO_' +
              'PERSONNEL"]'
            
              '                                                                ' +
              '                            ('#1087#1110#1076#1087#1080#1089')'
            ' ')
          ParentFont = False
        end
      end
      object PageFooter2: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 517.795610000000000000
        Width = 1046.929810000000000000
        object Memo182: TfrxSysMemoView
          Left = 952.441560000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo182OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Memo184: TfrxMemoView
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            ' [DBDatasetinfo."PRINT_CAPTION"]     [DATE_PRINT]')
          ParentFont = False
        end
      end
    end
  end
  object DBDataset1: TfrxDBDataset
    UserName = 'DBDataset1'
    CloseDataSource = False
    DataSet = DSetTimeSheet
    Left = 336
    Top = 304
  end
  object DSetPrintInfo: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    DataSource = DSourcePeriodType
    Left = 296
    Top = 256
    poSQLINT64ToBCD = True
  end
  object DBDatasetInfo: TfrxDBDataset
    UserName = 'DBDatasetinfo'
    CloseDataSource = False
    DataSet = DSetPrintInfo
    Left = 336
    Top = 352
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = TransactionW
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    DataSource = DSourcePeriodType
    Left = 429
    Top = 57
    poSQLINT64ToBCD = True
  end
  object DsetHistory: TpFIBDataSet
    Database = DB
    Transaction = TransactionR
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    DataSource = DSourceTempletOrPeriod
    Left = 41
    Top = 424
    poSQLINT64ToBCD = True
  end
  object DSourceHistory: TDataSource
    DataSet = DsetHistory
    Left = 129
    Top = 424
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 478
    Top = 213
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 477
    Top = 316
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
    Left = 521
    Top = 137
  end
end
