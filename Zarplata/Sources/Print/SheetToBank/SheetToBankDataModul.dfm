object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 662
  Top = 141
  Height = 280
  Width = 412
  object DB: TpFIBDatabase
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
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = True
    EngineOptions.ConvertNulls = False
    EngineOptions.DoublePass = True
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 40240.699793078690000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var List:TStringList;'
      '    i:integer;'
      '    LastSum:real;'
      '    PageSum:real;'
      '    LSum:real;'
      '    PSum:real;'
      ''
      'procedure ReportOnStartReport(Sender: TfrxComponent);'
      'begin'
      '  List := TStringList.Create;'
      ''
      '  PageSum := 0;'
      '  LastSum := 0;'
      'end;'
      ''
      'procedure ReportOnStopReport(Sender: TfrxComponent);'
      'begin'
      '  List.Free;'
      'end;'
      ''
      'procedure PageFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Engine.FinalPass then'
      '  begin'
      '    PSum:=StrToFloat(List[i]);'
      '    Memo6.Text:='#39'[PSum]'#39';'
      '  end'
      '  else List.Add(FloatToStr(PageSum));'
      ''
      '  inc(i);'
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'var LastPageSum:real;'
      '    BeforeLastPageSum:real;'
      'begin'
      '  dec(i);'
      ''
      '  if (Engine.FinalPass) then'
      '  begin'
      '     LSum:=StrToFloat(List[i]);'
      '     Memo26.Text:='#39'[LSum]'#39';'
      '     LastPageSum := StrToFloat(List[i]);'
      '     if LastPageSum = 0 then'
      '     begin'
      '        BeforeLastPageSum := StrToFloat(List[i-1]);'
      '        BeforeLastPageSum := BeforeLastPageSum - LastSum;'
      '        List[i-1] := FloatToStr(BeforeLastPageSum);'
      '        Memo26.Text:='#39'[LastSum]'#39';'
      '     end;'
      '  end;'
      ''
      '  i:=0;'
      'end;'
      ''
      'procedure Header1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  PageSum:=0;'
      'end;'
      ''
      'procedure Memo2OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  if not Engine.FinalPass then'
      '  begin'
      '       PageSum := PageSum + <ReportDsetData."SUMMA">;'
      '       LastSum := <ReportDsetData."SUMMA">;'
      '  end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    OnStartReport = 'ReportOnStartReport'
    OnStopReport = 'ReportOnStopReport'
    Left = 168
    Datasets = <
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
      end
      item
        DataSet = ReportDSetGlobalData
        DataSetName = 'ReportDsetGlobalData'
      end
      item
        DataSet = ReportDSetSetup
        DataSetName = 'ReportDSetSetup'
      end>
    Variables = <
      item
        Name = 'BANK_NAME'
        Value = #39#1055#1056#1054#1052#1048#1053#1042'('#1044')'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 23.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 264.567100000000000000
        Width = 668.976810000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 45.354360000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataField = 'FIO'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 589.606680000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          OnAfterPrint = 'Memo2OnAfterPrint'
          DataField = 'SUMMA'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."SUMMA"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 430.866420000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataField = 'TIN'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."TIN"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 309.921460000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          DataField = 'ACCT_CARD'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ACCT_CARD"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 510.236550000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataField = 'TN'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."TN"]')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[LINE#]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 41.574830000000000000
        Top = 200.315090000000000000
        Width = 668.976810000000000000
        OnBeforePrint = 'Header1OnBeforePrint'
        ReprintOnNewPage = True
        object Memo12: TfrxMemoView
          Left = 45.354360000000000000
          Top = 22.677179999999990000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'. '#1030'. '#1041'.')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 589.606680000000000000
          Top = 22.677179999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 430.866420000000000000
          Top = 22.677179999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1076'. '#1085#1086#1084#1077#1088)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 309.921460000000000000
          Top = 22.677179999999990000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1087#1083#1072#1089#1090'. '#1082#1072#1088#1090#1082#1080)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 510.236550000000000000
          Top = 22.677179999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1072#1073'. '#8470)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Top = 22.677179999999990000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #8470' '#1087'.'#1087'.')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 453.543600000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1089#1090#1086#1088'. [PAGE#] '#1079' [TOTALPAGES#]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 215.433210000000000000
        Top = 302.362400000000000000
        Width = 668.976810000000000000
        object Memo26: TfrxMemoView
          Left = 434.645950000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haRight
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1030#1058#1054#1043#1054':')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Width = 668.976810000000000000
          Frame.Typ = [ftTop]
        end
        object Memo10: TfrxMemoView
          Left = 158.740260000000000000
          Top = 22.677180000000020000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[SUM(<ReportDsetData."SUMMA">,MasterData1)]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Top = 22.677180000000020000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086' '#1076#1086' '#1079#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103':')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 52.913420000000000000
          Top = 41.574830000000020000
          Width = 608.504330000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[PSummaStr]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Top = 94.488249999999990000
          Width = 668.976810000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetSetup
          DataSetName = 'ReportDSetSetup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              '[ReportDSetSetup."NAME_MANEG"] _________________ [ReportDSetSetu' +
              'p."DIRECTOR"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Top = 136.063080000000000000
          Width = 668.976810000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetSetup
          DataSetName = 'ReportDSetSetup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              '[ReportDSetSetup."GLBUHG_POST"] _________________ [ReportDSetSet' +
              'up."GLAV_BUHG"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Top = 177.637910000000000000
          Width = 364.176500000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1041#1091#1093#1075#1072#1083#1090#1077#1088' <u>                      </u>')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 120.944960000000000000
        Top = 18.897650000000000000
        Width = 668.976810000000000000
        object Memo20: TfrxMemoView
          Top = 41.574830000000000000
          Width = 668.976810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1042#1110#1076#1086#1084#1110#1089#1090#1100' '#1079#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1079#1072#1088#1086#1073#1110#1090#1085#1086#1111' '#1087#1083#1072#1090#1080' '#1090#1072' '#1089#1090#1080#1087#1077#1085#1076#1110#1111' '#1085#1072' '#1057#1050#1056' '#1089#1087#1110#1074#1088 +
              #1086#1073#1110#1090#1085#1080#1082#1110#1074)
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = -3.779530000000000000
          Top = 60.472479999999990000
          Width = 668.976810000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1079#1072' [PPERIOD] '#1074#1110#1076#1087#1086#1074#1110#1076#1085#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1087#1088#1086' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1086'-'#1082#1072#1089#1086#1074#1077' '#1086#1073#1089#1083#1091#1075#1086 +
              #1074#1091#1074#1072#1085#1085#1103#1084)
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Top = 79.370130000000000000
          Width = 668.976810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1087#1110#1076#1087#1088#1080#1108#1084#1089#1090#1074#1072' '#1087#1086' '#1074#1080#1087#1083#1072#1090#1110' '#1079#1072#1088#1086#1073#1110#1090#1085#1086#1111' '#1087#1083#1072#1090#1080' '#1079' '#1074#1080#1082#1086#1088#1080#1089#1090#1072#1085#1085#1103#1084' '#1087#1083#1072#1089#1090#1080#1082 +
              #1086#1074#1080#1093' '#1082#1072#1088#1090)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Top = 22.677180000000000000
          Width = 668.976810000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetSetup
          DataSetName = 'ReportDSetSetup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDSetSetup."FIRM_NAME_FULL"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Width = 480.000310000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[BANK_NAME]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 438.425480000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1056#1077#1108#1089#1090#1088' '#8470' [ReportDsetGlobalData."ID_REESTR"] [PDATE_PERIOD]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Top = 102.047310000000000000
          Width = 668.976810000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            
              '[ReportDsetGlobalData."NUMBER_SCH"] [ReportDsetGlobalData."NAME_' +
              'SCH"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.456710000000000000
        Top = 578.268090000000000000
        Width = 668.976810000000000000
        OnBeforePrint = 'PageFooter1OnBeforePrint'
        PrintOnLastPage = False
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1030#1058#1054#1043#1054':')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Width = 668.976810000000000000
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 570.709030000000000000
          Top = 3.779530000000022000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haRight
          ParentFont = False
        end
      end
    end
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
    Top = 88
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
  object DSetSetup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 187
    poSQLINT64ToBCD = True
  end
  object ReportDSetSetup: TfrxDBDataset
    UserName = 'ReportDSetSetup'
    CloseDataSource = False
    DataSet = DSetSetup
    Left = 168
    Top = 188
  end
  object frxXLSExport: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 336
    Top = 32
  end
end
