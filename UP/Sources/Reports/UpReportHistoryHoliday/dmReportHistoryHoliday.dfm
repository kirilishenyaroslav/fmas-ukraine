object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 124
  Height = 295
  Width = 370
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 56
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 117
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 128
    Top = 117
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 128
    Top = 56
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 128
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.ConvertNulls = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 41185.485973055550000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo16OnBeforePrint(Sender: TfrxComponent);'
      'var i:Integer;'
      'str,c,res:string;'
      ''
      'begin'
      ''
      
        '    if VarToStr(<ReportDsetData."HIST_HOLIDAY_STR">)='#39#39' then exi' +
        't'
      '    else'
      '    begin'
      '    str:=<ReportDsetData."HIST_HOLIDAY_STR">;'
      ''
      '    res:='#39#39';'
      '    for i:=1 to length(str) do'
      '    begin'
      '       c:=copy(str,i,1);'
      '       if c='#39'#'#39' then'
      '       begin'
      '           res:=res+#13#10;'
      '       end'
      '       else res:=res+c;'
      '    end;'
      '   memo16.clear;'
      '   memo16.text:=res;'
      '   end;'
      'end;'
      ''
      'procedure Memo8OnBeforePrint(Sender: TfrxComponent);'
      'var i:Integer;'
      'str,c,res:string;'
      'begin'
      ''
      '    if VarToStr(<ReportDsetData."NAME_POST">)='#39#39' then exit'
      '    else'
      '    begin'
      '    str:=<ReportDsetData."NAME_POST">;'
      ''
      '    res:='#39#39';'
      '    for i:=1 to length(str) do'
      '    begin'
      '       c:=copy(str,i,1);'
      '       if c='#39'#'#39' then'
      '       begin'
      '           res:=res+#13#10;'
      '       end'
      '       else res:=res+c;'
      '    end;'
      '   memo8.clear;'
      '   memo8.text:=res;'
      '   end;'
      'end;'
      ''
      'procedure Memo11OnBeforePrint(Sender: TfrxComponent);'
      'var i:Integer;'
      'str,c,res:string;'
      'begin'
      '    if VarToStr(<ReportDsetData."HOLIDAY_STR">)='#39#39' then exit'
      '    else'
      '    begin'
      '    str:=<ReportDsetData."HOLIDAY_STR">;'
      ''
      '    res:='#39#39';'
      '    for i:=1 to length(str) do'
      '    begin'
      '       c:=copy(str,i,1);'
      '       if c='#39'#'#39' then'
      '       begin'
      '           res:=res+#13#10;'
      '       end'
      '       else res:=res+c;'
      '    end;'
      '   memo11.clear;'
      '   memo11.text:=res;'
      '   end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 200
    Datasets = <
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
      end>
    Variables = <
      item
        Name = ' User Category'
        Value = Null
      end
      item
        Name = 'PTerm'
        Value = #39#1074' '#1090#1077#1088#1084#1110#1085' '#1079' 01.09.2005 '#1087#1086' 31.01.2006'#39
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
      object ReportTitle1: TfrxReportTitle
        Height = 99.149660000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1030' '#1053' '#1060' '#1054' '#1056' '#1052' '#1040' '#1062' '#1030' '#1071'   '#1055' '#1056' '#1054'   '#1042' '#1030' '#1044' '#1055' '#1059' '#1057' '#1058' '#1050' '#1048)
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."FIRM_NAME"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Top = 68.031540000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            
              #1079'  [ReportDsetData."PERIOD_BEG"]   '#1087#1086'   [ReportDsetData."PERIOD_' +
              'END"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Height = 41.574830000000000000
        ParentFont = False
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo6: TfrxMemoView
          Left = 45.354360000000000000
          Top = 0.000000000000003386
          Width = 180.535560000000000000
          Height = 37.795300000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'. '#1030'. '#1041'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 225.889920000000000000
          Top = 0.000000000000003386
          Width = 207.433210000000000000
          Height = 37.795300000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072'/'#1089#1090#1072#1074#1082#1072', '#1076#1078#1077#1088#1077#1083#1086' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo2: TfrxSysMemoView
          Top = 0.000000000000003386
          Width = 45.354360000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1087'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 590.929500000000000000
          Width = 128.504020000000000000
          Height = 37.795300000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1089#1090#1086#1088#1110#1103' '#1079#1072' '#1074#1110#1076#1087#1091#1089#1090#1082#1086#1102)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 432.189240000000000000
          Width = 158.740260000000000000
          Height = 37.795300000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1091#1089#1090#1082#1072)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 26.459060000000000000
        Top = 351.496290000000000000
        Width = 718.110700000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo4: TfrxMemoView
          Top = -0.000000000000012323
          Width = 45.350000000000000000
          Height = 18.899530000000000000
          OnBeforePrint = 'Memo8OnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line#].')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 45.354360000000000000
          Width = 180.537520000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 226.771800000000000000
          Width = 203.658250000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo8OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_POST"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 430.866420000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo11OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."Holiday_str"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 589.606680000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo16OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."Hist_Holiday_Str"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 438.425480000000000000
        Width = 718.110700000000000000
        object Memo23: TfrxMemoView
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1088#1091#1082#1091': [Date]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 542.235930000000000000
          Top = -0.000000000000006800
          Width = 172.724490000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1089#1090#1086#1088'. [Page#] '#1110#1079' [TotalPages#]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 37.795300000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        Condition = 'ReportDsetData."DISPLAY_2"'
        Stretched = True
        object Memo2: TfrxMemoView
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Color = 14544110
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetData."Name_Faculty"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 26.456710000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        Condition = 'ReportDsetData."DISPLAY_1"'
        Stretched = True
        object Memo3: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 14544110
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetData."Name_Cafedra"]')
          ParentFont = False
        end
      end
    end
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 200
    Top = 59
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 200
    Top = 116
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 200
    Top = 168
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
    Left = 264
    Top = 168
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
    Top = 112
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 272
    Top = 56
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 272
  end
end
