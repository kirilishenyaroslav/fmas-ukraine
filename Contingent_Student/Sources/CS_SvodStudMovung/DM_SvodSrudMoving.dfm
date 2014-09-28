object DM: TDM
  OldCreateOrder = False
  Left = 553
  Top = 297
  Height = 301
  Width = 494
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 128
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSet
    Left = 200
    Top = 108
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 56
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 128
    Top = 56
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 200
    Top = 59
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
    Top = 56
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 280
    Top = 112
  end
  object DSetDataReport: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 352
    Top = 125
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 336
    Top = 64
  end
  object PDFExp: TfrxPDFExport
    UseFileCache = True
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 336
    Top = 8
  end
  object DataSetInfo: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DataSource
    Left = 112
    Top = 165
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDsetDataInfo: TfrxDBDataset
    UserName = 'ReportDsetDataInfo'
    CloseDataSource = False
    DataSet = DataSetInfo
    Left = 208
    Top = 164
  end
  object DataSourceInfo: TDataSource
    DataSet = DataSetInfo
    Left = 32
    Top = 168
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 120
    Top = 112
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = DSet
    Left = 40
    Top = 120
  end
  object Report: TfrxReport
    Version = '3.15'
    DataSetName = 'frxDBDatasetRX'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38448.688970509300000000
    ReportOptions.LastChange = 41226.615087569400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure MemoBuildsOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."BUILDS"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."BUILDSTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."BUILDSTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      'procedure MemoName_FakOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."Name_Fak"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."Name_FakTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."Name_FakTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      'procedure MemoKursOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."Kurs"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."KursTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."KursTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      'procedure MemoCat_PayOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."Cat_Pay"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."Cat_PayTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."Cat_PayTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      'procedure MemoType_liveOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."Type_live"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."Type_liveTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."Type_liveTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      'procedure MemoClass_liveOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."Class_live"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."Class_liveTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."Class_liveTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <Page#>=1 then PageHeader1.visible:=false'
      '  else PageHeader1.visible:=true;'
      'end;'
      ''
      'procedure MemoName_GroupOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."NAME_GROUP"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."NAME_GROUPTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."NAME_GROUPTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 208
    Top = 8
    Datasets = <
      item
        DataSetName = 'frxDBDatasetMasterRX'
      end>
    Variables = <
      item
        Name = 'VBUILDS'
        Value = #39#1054#1073#1097#1077#1078#1080#1090#1080#1077#39
      end
      item
        Name = 'VFAK'
        Value = #39#1060#1072#1082#1091#1083#1100#1090#1077#1090#39
      end
      item
        Name = 'VKURS'
        Value = #39#1050#1091#1088#1089#39
      end
      item
        Name = 'VCATPAY'
        Value = #39#1050#1072#1090#1077#1075#1086#1088#1103' '#1086#1087#1083#1072#1090#1099#39
      end
      item
        Name = 'VTYPELIVE'
        Value = #39#1058#1080#1087' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103#39
      end
      item
        Name = 'VCLASSLIVE'
        Value = #39#1050#1083#1072#1089#1089' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103#39
      end
      item
        Name = 'VCNT'
        Value = #39#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086#39
      end
      item
        Name = 'VNAMEREPORT'
        Value = #39#1057#1074#1086#1076#1085#1072#1103' '#1092#1086#1088#1084#1072' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1087#1088#1086#1078#1080#1074#1072#1102#1097#1080#1093#39
      end
      item
        Name = 'VALL'
        Value = #39#1059#1089#1100#1086#1075#1086#39
      end
      item
        Name = 'VPAGE'
        Value = #39#1090#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 20.000000000000000000
      TopMargin = 30.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 241.889920000000000000
        Width = 971.339210000000000000
        DataSetName = 'frxDBDatasetMasterRX'
        PrintIfDetailEmpty = True
        RowCount = 0
        object MemoBuilds: TfrxMemoView
          Align = baLeft
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'MemoBuildsOnBeforePrint'
          DataSetName = 'frxDBDatasetMasterRX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."BUILDS"]')
          ParentFont = False
        end
        object MemoName_Fak: TfrxMemoView
          Align = baLeft
          Left = 75.590551180000000000
          Width = 188.976377950000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'MemoName_FakOnBeforePrint'
          DataSetName = 'frxDBDatasetMasterRX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."NAME_FAK"]')
          ParentFont = False
        end
        object MemoKurs: TfrxMemoView
          Align = baLeft
          Left = 264.566929130000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'MemoKursOnBeforePrint'
          DataSetName = 'frxDBDatasetMasterRX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."KURS"] ')
          ParentFont = False
        end
        object MemoCat_Pay: TfrxMemoView
          Align = baLeft
          Left = 359.055125430000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'MemoCat_PayOnBeforePrint'
          DataSetName = 'frxDBDatasetMasterRX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."CAT_PAY"]')
          ParentFont = False
        end
        object MemoType_live: TfrxMemoView
          Align = baLeft
          Left = 510.236227790000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          Visible = False
          OnBeforePrint = 'MemoType_liveOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."TYPE_LIVE"]')
          ParentFont = False
        end
        object MemoClass_live: TfrxMemoView
          Align = baLeft
          Left = 661.417330150000000000
          Width = 215.433063540000000000
          Height = 18.897650000000000000
          Visible = False
          OnBeforePrint = 'MemoClass_liveOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."CLASS_LIVE"]')
          ParentFont = False
        end
        object MemoCNT: TfrxMemoView
          Align = baLeft
          Left = 876.850393690000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetMasterRX."CNT"] ')
          ParentFont = False
        end
        object MemoName_Group: TfrxMemoView
          Align = baLeft
          Left = 306.141732280000000000
          Width = 52.913393150000000000
          Height = 18.897650000000000000
          Visible = False
          OnBeforePrint = 'MemoName_GroupOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."NAME_GROUP"] ')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 18.897650000000000000
        Top = 200.315090000000000000
        Width = 971.339210000000000000
        object MemoTitleBuilds: TfrxMemoView
          Align = baLeft
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[VBUILDS]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleName_Fak: TfrxMemoView
          Align = baLeft
          Left = 75.590551180000000000
          Width = 188.976377950000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[VFAK]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleKurs: TfrxMemoView
          Align = baLeft
          Left = 264.566929130000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[VKURS]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleCat_Pay: TfrxMemoView
          Align = baLeft
          Left = 359.055125430000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[VCATPAY]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleType_Live: TfrxMemoView
          Align = baLeft
          Left = 510.236227790000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[VTYPELIVE]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleClass_Live: TfrxMemoView
          Align = baLeft
          Left = 661.417330150000000000
          Width = 215.433063540000000000
          Height = 18.897650000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[VCLASSLIVE]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleCNT: TfrxMemoView
          Align = baLeft
          Left = 876.850393690000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[VCNT]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleName_Group: TfrxMemoView
          Align = baLeft
          Left = 306.141732280000000000
          Width = 52.913393150000000000
          Height = 18.897650000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1043#1088#1091#1087#1087#1072)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 321.260050000000000000
        Width = 971.339210000000000000
        object MemoSumBuilds: TfrxMemoView
          Align = baLeft
          Left = 0.377952755905512000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
        end
        object MemoSumName_Fak: TfrxMemoView
          Align = baLeft
          Left = 75.968503935905510000
          Width = 188.976377950000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftTop, ftBottom]
        end
        object MemoSumKurs: TfrxMemoView
          Align = baLeft
          Left = 264.944881885905500000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftTop, ftBottom]
        end
        object MemoSumCat_pay: TfrxMemoView
          Align = baLeft
          Left = 359.433078185905500000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftTop, ftBottom]
        end
        object MemoSumType_Live: TfrxMemoView
          Align = baLeft
          Left = 510.614180545905500000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          Visible = False
          Frame.Typ = [ftTop, ftBottom]
        end
        object MemoSumClass_Live: TfrxMemoView
          Align = baLeft
          Left = 661.795282905905500000
          Width = 215.433063540000000000
          Height = 18.897650000000000000
          Visible = False
          Frame.Typ = [ftTop, ftBottom]
        end
        object Memo17: TfrxMemoView
          Align = baLeft
          Width = 0.377952755905512000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight]
        end
        object MemoSumCNT: TfrxMemoView
          Align = baLeft
          Left = 877.228346445905500000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1042#1057#1045#1043#1054':[SUM(<frxDBDatasetMasterRX."CNT">,MasterData1)] ')
          ParentFont = False
        end
        object MemoSumName_Group: TfrxMemoView
          Align = baLeft
          Left = 306.519685035905500000
          Width = 52.913393150000000000
          Height = 18.897650000000000000
          Visible = False
          Frame.Typ = [ftTop, ftBottom]
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 117.165430000000000000
        Width = 971.339210000000000000
        OnBeforePrint = 'PageHeader1OnBeforePrint'
        object Memo3: TfrxMemoView
          Left = 869.291900000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[VPAGE].[Page#]')
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 76.692950000000000000
        Top = 18.897650000000000000
        Width = 971.339210000000000000
        object Memo7: TfrxMemoView
          Align = baLeft
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          HAlign = haCenter
          Memo.Strings = (
            '[Date]')
        end
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 347.669605000000000000
          Top = 45.133890000000000000
          Width = 276.000000000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1079#1072' '#1087#1077#1088#1080#1086#1076' c [DATEBEGIN] '#1087#1086' [DATEEND]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baCenter
          Left = 400.630180000000000000
          Top = 26.456710000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1074#1086#1076#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1087#1086' '#1085#1072#1088#1091#1096#1080#1090#1077#1083#1103#1084)
          ParentFont = False
        end
      end
    end
  end
end
