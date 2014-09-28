object DM: TDM
  OldCreateOrder = False
  Left = 157
  Top = 121
  Height = 739
  Width = 1025
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 72
    Top = 14
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 152
    Top = 14
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 72
    Top = 70
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 152
    Top = 70
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38789.428188472200000000
    ReportOptions.LastChange = 40298.564504629600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      'month, year, last_month:string;'
      'last_value, count_value,last_value_w, count_value_w:double;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   last_value:=0;'
      '   count_value:=0;'
      '   last_value_w:=0;'
      '   count_value_w:=0;'
      '   last_month:='#39#39';'
      'end;'
      ''
      'procedure GroupHeader2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure GroupFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure frxReport1OnStartReport(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure frxReport1OnStopReport(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure MasterData3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (last_month<><ReportUPSVODSUMOTPUSK."MONTHS">)'
      '    then'
      '    begin'
      '        last_value:=<ReportUPSVODSUMOTPUSK."NACH_OTP">;'
      '        count_value:=count_value+last_value;'
      '        Memo32.Memo.Clear;'
      
        '        Memo32.Memo.add(FormatFloat('#39'#,##0.00'#39',<ReportUPSVODSUMO' +
        'TPUSK."NACH_OTP">));'
      '    end'
      '    else'
      '     Memo32.Memo.Clear;'
      ''
      '    if (last_month<><ReportUPSVODSUMOTPUSK."MONTHS">{)}) then'
      '    begin'
      '        last_value_w:=<ReportUPSVODSUMOTPUSK."NACH_OTP_WOMAN">;'
      '        count_value_w:=count_value_w+last_value_w;'
      '        Memo33.Memo.Clear;'
      
        '        Memo33.Memo.add(FormatFloat('#39'#,##0.00'#39',<ReportUPSVODSUMO' +
        'TPUSK."NACH_OTP_WOMAN">));'
      '    end'
      '    else'
      '     Memo33.Memo.Clear;'
      ''
      '    last_month:=<ReportUPSVODSUMOTPUSK."MONTHS">;'
      ''
      'end;'
      ''
      'procedure Header3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   last_value:=0;'
      '   count_value:=0;'
      '   last_value_w:=0;'
      '   count_value_w:=0;'
      '   last_month:='#39#39';'
      'end;'
      ''
      'procedure MasterData4OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if  (last_month<><ReportUPSVODPODOHODNALOG."MONTHS">) then'
      '    begin'
      '        last_value:=<ReportUPSVODPODOHODNALOG."POD_NALOG">;'
      '        count_value:=count_value+last_value;'
      '        Memo268.Memo.Clear;'
      
        '        Memo268.Memo.add(FormatFloat('#39'#,##0.00'#39',<ReportUPSVODPOD' +
        'OHODNALOG."POD_NALOG">));'
      '    end'
      '    else'
      '     Memo268.Memo.Clear;'
      ''
      '    if  (last_month<><ReportUPSVODPODOHODNALOG."MONTHS">) then'
      '    begin'
      
        '        last_value_w:=<ReportUPSVODPODOHODNALOG."POD_NALOG_WOMAN' +
        '">;'
      '        count_value_w:=count_value_w+last_value_w;'
      '        Memo269.Memo.Clear;'
      
        '        Memo269.Memo.add(FormatFloat('#39'#,##0.00'#39',<ReportUPSVODPOD' +
        'OHODNALOG."POD_NALOG_WOMAN">));'
      '    end'
      '    else'
      '     Memo269.Memo.Clear;'
      ''
      '    last_month:=<ReportUPSVODPODOHODNALOG."MONTHS">;'
      ''
      'end;'
      ''
      'procedure ReportTitle4OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   last_value:=0;'
      '   count_value:=0;'
      '   last_value_w:=0;'
      '   count_value_w:=0;'
      '   last_month:='#39#39';'
      'end;'
      ''
      'procedure MasterData15OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (last_month<><ReportUPSVODSUMOTPUSK."MONTHS">)'
      '    then'
      '    begin'
      '        last_value:=<ReportUPSVODSUMOTPUSK."NACH_OTP">;'
      '        count_value:=count_value+last_value;'
      '        Memo310.Memo.Clear;'
      
        '        Memo310.Memo.add(FormatFloat('#39'#,##0.00'#39',<ReportUPSVODSUM' +
        'OTPUSK."NACH_OTP">));'
      '    end'
      '    else'
      '     Memo310.Memo.Clear;'
      ''
      '    if (last_month<><ReportUPSVODSUMOTPUSK."MONTHS">) then'
      '    begin'
      '        last_value_w:=<ReportUPSVODSUMOTPUSK."NACH_OTP_WOMAN">;'
      '        count_value_w:=count_value_w+last_value_w;'
      '        Memo311.Memo.Clear;'
      
        '        Memo311.Memo.add(FormatFloat('#39'#,##0.00'#39',<ReportUPSVODSUM' +
        'OTPUSK."NACH_OTP_WOMAN">));'
      '    end'
      '    else'
      '     Memo311.Memo.Clear;'
      ''
      '    last_month:=<ReportUPSVODSUMOTPUSK."MONTHS">;'
      ''
      'end;'
      ''
      'procedure Header12OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   last_value:=0;'
      '   count_value:=0;'
      '   last_value_w:=0;'
      '   count_value_w:=0;'
      '   last_month:='#39#39';'
      'end;'
      ''
      'procedure MasterData16OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (last_month<><ReportUPSVODPODOHODNALOG."MONTHS">)'
      '    then'
      '    begin'
      '        last_value:=<ReportUPSVODPODOHODNALOG."POD_NALOG">;'
      '        count_value:=count_value+last_value;'
      '        Memo353.Memo.Clear;'
      
        '        Memo353.Memo.add(FormatFloat('#39'#,##0.00'#39',<ReportUPSVODPOD' +
        'OHODNALOG."POD_NALOG">));'
      '    end'
      '    else'
      '     Memo353.Memo.Clear;'
      ''
      '    if (last_month<><ReportUPSVODPODOHODNALOG."MONTHS">) then'
      '    begin'
      
        '        last_value_w:=<ReportUPSVODPODOHODNALOG."POD_NALOG_WOMAN' +
        '">;'
      '        count_value_w:=count_value_w+last_value_w;'
      '        Memo354.Memo.Clear;'
      
        '        Memo354.Memo.add(FormatFloat('#39'#,##0.00'#39',<ReportUPSVODPOD' +
        'OHODNALOG."POD_NALOG_WOMAN">));'
      '    end'
      '    else'
      '     Memo354.Memo.Clear;'
      ''
      '    last_month:=<ReportUPSVODPODOHODNALOG."MONTHS">;'
      'end;'
      ''
      'procedure Memo117OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Memo162OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure MasterData8OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure MasterData11OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure MasterData20OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure MasterData23OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnStartReport = 'frxReport1OnStartReport'
    OnStopReport = 'frxReport1OnStopReport'
    Left = 312
    Top = 22
    Datasets = <
      item
        DataSet = ReportMain
        DataSetName = 'ReportMain'
      end
      item
        DataSet = ReportUPSVODALLSOTRUDR
        DataSetName = 'ReportUPSVODALLSOTRUDR'
      end
      item
        DataSet = ReportUPSVODALLSOTRUDS
        DataSetName = 'ReportUPSVODALLSOTRUDS'
      end
      item
        DataSet = ReportUPSVODCHISLACCEPT
        DataSetName = 'ReportUPSVODCHISLACCEPT'
      end
      item
        DataSet = ReportUPSVODCHISLDISMISS
        DataSetName = 'ReportUPSVODCHISLDISMISS'
      end
      item
        DataSet = ReportUPSVODCHISLPERSONCATR
        DataSetName = 'ReportUPSVODCHISLPERSONCATR'
      end
      item
        DataSet = ReportUPSVODCHISLPERSONCATS
        DataSetName = 'ReportUPSVODCHISLPERSONCATS'
      end
      item
        DataSet = ReportUPSVODCHISLPERSR
        DataSetName = 'ReportUPSVODCHISLPERSR'
      end
      item
        DataSet = ReportUPSVODCHISLPERSS
        DataSetName = 'ReportUPSVODCHISLPERSS'
      end
      item
        DataSet = ReportUPSVODEXTSOVMR
        DataSetName = 'ReportUPSVODEXTSOVMR'
      end
      item
        DataSet = ReportUPSVODEXTSOVMS
        DataSetName = 'ReportUPSVODEXTSOVMS'
      end
      item
        DataSet = ReportUPSVODFUNDALLR
        DataSetName = 'ReportUPSVODFUNDALLR'
      end
      item
        DataSet = ReportUPSVODFUNDALLS
        DataSetName = 'ReportUPSVODFUNDALLS'
      end
      item
        DataSet = ReportUPSVODFUNDSONCAT
        DataSetName = 'ReportUPSVODFUNDSONCAT'
      end
      item
        DataSet = ReportUPSVODFUNDSUD
        DataSetName = 'ReportUPSVODFUNDSUD'
      end
      item
        DataSet = ReportUPSVODFUNDSZP
        DataSetName = 'ReportUPSVODFUNDSZP'
      end
      item
        DataSet = ReportUPSVODFUNDWTR
        DataSetName = 'ReportUPSVODFUNDWTR'
      end
      item
        DataSet = ReportUPSVODFUNDWTS
        DataSetName = 'ReportUPSVODFUNDWTS'
      end
      item
        DataSet = ReportUPSVODONWORKERSR
        DataSetName = 'ReportUPSVODONWORKERSR'
      end
      item
        DataSet = ReportUPSVODONWORKERSS
        DataSetName = 'ReportUPSVODONWORKERSS'
      end
      item
        DataSet = ReportUPSVODONWORKEXT
        DataSetName = 'ReportUPSVODONWORKEXT'
      end
      item
        DataSet = ReportUPSVODPODOHODNALOG
        DataSetName = 'ReportUPSVODPODOHODNALOG'
      end
      item
        DataSet = ReportUPSVODPROGULR
        DataSetName = 'ReportUPSVODPROGULR'
      end
      item
        DataSet = ReportUPSVODPROGULS
        DataSetName = 'ReportUPSVODPROGULS'
      end
      item
        DataSet = ReportUPSVODRASHNACH
        DataSetName = 'ReportUPSVODRASHNACH'
      end
      item
        DataSet = ReportUPSVODRASHNEO
        DataSetName = 'ReportUPSVODRASHNEO'
      end
      item
        DataSet = ReportUPSVODRASHPOCH
        DataSetName = 'ReportUPSVODRASHPOCH'
      end
      item
        DataSet = ReportUPSVODRASHPPS
        DataSetName = 'ReportUPSVODRASHPPS'
      end
      item
        DataSet = ReportUPSVODSUMOTPUSK
        DataSetName = 'ReportUPSVODSUMOTPUSK'
      end
      item
        DataSet = ReportUPSVODWORKERSOVM
        DataSetName = 'ReportUPSVODWORKERSOVM'
      end
      item
        DataSet = ReportUPSVODWORKERZP
        DataSetName = 'ReportUPSVODWORKERZP'
      end
      item
        DataSet = ReportUPSVODWORKREASON
        DataSetName = 'ReportUPSVODWORKREASON'
      end>
    Variables = <
      item
        Name = 'REPORT_DATE'
        Value = #39'31.03.2006'#39
      end
      item
        Name = 'FONT_SIZE'
        Value = '10'
      end
      item
        Name = 'Upper_Name'
        Value = Null
      end
      item
        Name = 'U_NAME'
        Value = Null
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
        Height = 95.338590000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        Stretched = True
        object Memo1: TfrxMemoView
          Top = 31.559060000000000000
          Width = 718.110236220000000000
          Height = 26.677180000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1074#1110#1090' [ReportMain."PERIODS"]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Width = 718.110236220000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportMain."FIRM_NAME"]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Top = 64.252010000000000000
          Width = 718.110236220000000000
          Height = 22.677180000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1060' '#1054' '#1053' '#1044' '#1048'   '#1047' '#1040' '#1056' '#1054' '#1041' '#1030' '#1058' '#1053' '#1054' '#1031'   '#1055' '#1051' '#1040' '#1058' '#1048)
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 72.472448270000000000
        ParentFont = False
        Top = 642.520100000000000000
        Width = 718.110700000000000000
        AllowSplit = True
        Stretched = True
        object Memo4: TfrxMemoView
          Top = 18.897650000000000000
          Width = 718.110000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1092#1086#1085#1076#1110#1074' '#1047'/'#1055' '#1079#1072' '#1082#1072#1090#1077#1075#1086#1088#1110#1103#1084#1080)
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Top = 49.133870470000030000
          Width = 415.748031500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1082#1072#1090#1077#1075#1086#1088#1110#1111)
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 566.929500000000000000
          Top = 49.133870470000030000
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1086#1087#1083#1072#1090#1080' ('#1079#1072' '#1088#1110#1082')')
          VAlign = vaCenter
        end
        object Memo512: TfrxMemoView
          Left = 415.748300000000000000
          Top = 49.133902200000080000
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1086#1087#1083#1072#1090#1080' ('#1084#1110#1089'.)')
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338604650000000000
        ParentFont = False
        Top = 737.008350000000000000
        Width = 718.110700000000000000
        DataSet = ReportUPSVODFUNDSONCAT
        DataSetName = 'ReportUPSVODFUNDSONCAT'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo29: TfrxMemoView
          Width = 415.748031500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight]
          Memo.Strings = (
            '[ReportUPSVODFUNDSONCAT."NAME_CAT"]')
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 566.929500000000000000
          Top = 0.000014650000025540
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSONCAT."FUND_PAY_Y"]')
          VAlign = vaCenter
        end
        object Memo513: TfrxMemoView
          Left = 415.748300000000000000
          Top = 0.000046379999957935
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSONCAT."FUND_PAY"]')
          VAlign = vaCenter
        end
      end
      object Header2: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 95.244094490000000000
        ParentFont = False
        Top = 827.717070000000000000
        Visible = False
        Width = 718.110700000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          Top = 18.897637799999980000
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1058#1072#1073#1083#1080#1094#1103' '#1074#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1089#1091#1084#1080' '#1074#1110#1076#1087#1091#1089#1082#1085#1080#1093':')
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Top = 49.133858270000020000
          Width = 110.000000000000000000
          Height = 46.015770000000000000
          Visible = False
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 369.790000000000000000
          Top = 49.133858270000020000
          Width = 348.320000000000000000
          Height = 22.677165350000000000
          Visible = False
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042' '#1084#1080#1085#1091#1083#1080#1093' '#1087#1077#1088#1110#1086#1076#1072#1093)
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 110.000000000000000000
          Top = 49.133858270000020000
          Width = 260.000000000000000000
          Height = 22.677165350000000000
          Visible = False
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086' '#1074#1110#1076#1087#1091#1089#1082#1085#1080#1093)
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 110.000000000000000000
          Top = 71.811023620000010000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          Visible = False
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072' '#1087#1077#1088#1110#1086#1076)
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 239.790000000000000000
          Top = 71.811023620000010000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          Visible = False
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1046#1110#1085#1082#1080)
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 479.790000000000000000
          Top = 71.811023620000010000
          Width = 119.160000000000000000
          Height = 23.433070870000000000
          Visible = False
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072' '#1087#1077#1088#1110#1086#1076)
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 598.950000000000000000
          Top = 71.811023620000010000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          Visible = False
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1046#1110#1085#1082#1080)
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 369.790000000000000000
          Top = 71.811023620000010000
          Width = 110.000000000000000000
          Height = 23.433070870000000000
          Visible = False
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
      end
      object MasterData3: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.680000000000000000
        ParentFont = False
        Top = 944.882500000000000000
        Visible = False
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData3OnBeforePrint'
        DataSet = ReportUPSVODSUMOTPUSK
        DataSetName = 'ReportUPSVODSUMOTPUSK'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo27: TfrxMemoView
          Width = 110.000000000000000000
          Height = 22.680000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODSUMOTPUSK."MONTHS"]')
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 110.000000000000000000
          Width = 130.000000000000000000
          Height = 22.680000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportUPSVODSUMOTPUSK."NACH_OTP"]')
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 239.790000000000000000
          Width = 130.000000000000000000
          Height = 22.680000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportUPSVODSUMOTPUSK."NACH_OTP_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 369.790000000000000000
          Width = 110.000000000000000000
          Height = 22.680000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODSUMOTPUSK."MONTHS_OLD"]')
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 479.790000000000000000
          Width = 119.160000000000000000
          Height = 22.680000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODSUMOTPUSK."NACH_OTP_OLD"]')
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 598.950000000000000000
          Width = 119.160000000000000000
          Height = 22.680000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODSUMOTPUSK."NACH_OTP_OLD_WOMAN"]')
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 1073.386520000000000000
        Width = 718.110700000000000000
        object Memo54: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
        object Memo810: TfrxMemoView
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Date]')
          ParentFont = False
        end
        object Memo811: TfrxMemoView
          Left = 83.149660000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Time]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338604650000000000
        ParentFont = False
        Top = 782.362710000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo9: TfrxMemoView
          Left = 566.929500000000000000
          Top = 0.000014650000025540
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDSONCAT."FUND_PAY_Y">,MasterData2)]')
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Width = 415.748031500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo514: TfrxMemoView
          Left = 415.748300000000000000
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDSONCAT."FUND_PAY">,MasterData2)]')
          VAlign = vaCenter
        end
      end
      object Footer2: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 990.236860000000000000
        Visible = False
        Width = 718.110700000000000000
        Stretched = True
        object Memo48: TfrxMemoView
          Width = 110.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1057#1068#1054#1043#1054)
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 110.000000000000000000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[count_value]')
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 239.790000000000000000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[count_value_w]')
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 479.790000000000000000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODSUMOTPUSK."NACH_OTP_OLD">,MasterData3)]')
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 598.950000000000000000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODSUMOTPUSK."NACH_OTP_OLD_WOMAN">,MasterData3)]')
          VAlign = vaCenter
        end
        object Memo463: TfrxMemoView
          Left = 369.790000000000000000
          Width = 110.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 447.086911970000000000
        ParentFont = False
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        DataSet = ReportUPSVODFUNDSZP
        DataSetName = 'ReportUPSVODFUNDSZP'
        RowCount = 0
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 393.070866140000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."FUND_PAY_WORK_1"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Top = 230.551268980000000000
          Width = 268.346483540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1054#1089#1085#1086#1074#1085#1080#1081' '#1092#1086#1085#1076' ('#1084#1110#1089'.):')
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Top = 381.732371340000000000
          Width = 268.346495750000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1050#1086#1084#1087#1077#1085#1089#1072#1094#1110#1081#1085#1080#1081' '#1092#1086#1085#1076' ('#1084#1110#1089'.):')
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Top = 287.244182360000000000
          Width = 268.346507950000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1044#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1092#1086#1085#1076' ('#1084#1110#1089'.):')
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 393.071120000000000000
          Top = 230.551181102362000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."OSNOV_FUND_PAY_WORK"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 393.071120000000000000
          Top = 306.141732283465000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."DOP_FUND_PAY_WORK_Y"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 393.071120000000000000
          Top = 381.732371340000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."KOMPEN_FUND_PAY_WORK"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Width = 272.126013540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1060#1086#1085#1076' '#1079#1072' '#1084#1110#1089#1103#1094#1100' ('#1085#1072#1088#1072#1093#1086#1074#1072#1085#1086' '#1087#1086' '#1092#1072#1082#1090#1091'):')
          VAlign = vaCenter
        end
        object Memo335: TfrxMemoView
          Left = 393.071120000000000000
          Top = 173.858267716535000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."MAT_POM"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo343: TfrxMemoView
          Left = 18.897650000000000000
          Top = 64.251997800000000000
          Width = 245.669303540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1047#1072' '#1085#1072#1089#1090#1091#1087#1085#1110' '#1087#1077#1088#1110#1086#1076#1080':')
          VAlign = vaCenter
        end
        object Memo344: TfrxMemoView
          Top = 173.858355590000000000
          Width = 268.346483540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1072' '#1076#1086#1087#1086#1084#1086#1075#1072' ('#1084#1110#1089'.):')
          VAlign = vaCenter
        end
        object Memo345: TfrxMemoView
          Left = 393.071120000000000000
          Top = 154.960705590000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."FUND_PAY_WORK_Y"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo346: TfrxMemoView
          Left = 393.071120000000000000
          Top = 211.653543307087000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."MAT_POM_YEAR_W"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo347: TfrxMemoView
          Top = 192.755993390000000000
          Width = 268.346483540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1072' '#1076#1086#1087#1086#1084#1086#1075#1072' '#1079#1072' '#1088#1110#1082':')
          VAlign = vaCenter
        end
        object Memo348: TfrxMemoView
          Left = 393.071120000000000000
          Top = 192.755905511811000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."MAT_POM_Y"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo349: TfrxMemoView
          Top = 211.653631180000000000
          Width = 268.346483540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' '#1079#1072' '#1088#1110#1082':')
          VAlign = vaCenter
        end
        object Memo350: TfrxMemoView
          Top = 249.448906770000000000
          Width = 268.346483540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          VAlign = vaCenter
        end
        object Memo351: TfrxMemoView
          Left = 393.071120000000000000
          Top = 249.448818897638000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."OSNOV_FUND_PAY_WORK_Y"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo375: TfrxMemoView
          Top = 268.346544570000000000
          Width = 268.346483540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080':')
          VAlign = vaCenter
        end
        object Memo376: TfrxMemoView
          Left = 393.071120000000000000
          Top = 268.346456692913000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."Osnov_Fund_Pay_Work_WY"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo377: TfrxMemoView
          Top = 306.141820160000000000
          Width = 268.346507950000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1082' '#1088#1110#1082':')
          VAlign = vaCenter
        end
        object Memo378: TfrxMemoView
          Left = 393.071120000000000000
          Top = 287.244094490000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."DOP_FUND_PAY_WORK"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo379: TfrxMemoView
          Top = 325.039457950000000000
          Width = 268.346507950000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082'):')
          VAlign = vaCenter
        end
        object Memo380: TfrxMemoView
          Left = 393.071120000000000000
          Top = 325.039370080000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."DOP_FUND_PAY_WORK_WY"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo389: TfrxMemoView
          Top = 343.937095750000000000
          Width = 268.346507950000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1047#1072' '#1085#1077#1074#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1080#1081' '#1095#1072#1089':')
          VAlign = vaCenter
        end
        object Memo421: TfrxMemoView
          Left = 393.071120000000000000
          Top = 343.937007874016000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."DOP_FUND_PAY_WORK_NY"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo425: TfrxMemoView
          Top = 362.834733540000000000
          Width = 268.346507950000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1047#1072' '#1085#1077#1074#1110#1076#1087#1088'. '#1095#1072#1089' ('#1078#1110#1085#1082#1080'):')
          VAlign = vaCenter
        end
        object Memo426: TfrxMemoView
          Left = 393.071120000000000000
          Top = 362.834645669291000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."DOP_FUND_PAY_WORK_NWY"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo427: TfrxMemoView
          Top = 400.630009129999900000
          Width = 268.346495750000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          VAlign = vaCenter
        end
        object Memo428: TfrxMemoView
          Left = 393.071120000000000000
          Top = 400.629933459999900000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."KOMPEN_FUND_PAY_WORK_Y"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo429: TfrxMemoView
          Top = 419.527646929999900000
          Width = 268.346495750000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082'):')
          VAlign = vaCenter
        end
        object Memo466: TfrxMemoView
          Left = 393.071120000000000000
          Top = 419.527559060000100000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."KOMPEN_FUND_PAY_WORK_WY"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo789: TfrxMemoView
          Top = 22.677179999999990000
          Width = 64.251863540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1030#1079' '#1085#1080#1093':')
          VAlign = vaCenter
        end
        object Memo790: TfrxMemoView
          Left = 18.897650000000000000
          Top = 41.574829999999990000
          Width = 370.393793540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1060#1086#1085#1076' '#1086#1087#1083#1072#1090#1080' '#1087#1088#1072#1094#1110' '#1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1090#1072' '#1087#1086#1087#1077#1088#1076#1085#1110#1081' '#1084#1110#1089#1103#1094#1110':')
          VAlign = vaCenter
        end
        object Memo791: TfrxMemoView
          Top = 86.929190000000000000
          Width = 264.566953540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1060#1086#1085#1076' '#1086#1087#1083#1072#1090#1080' '#1087#1088#1072#1094#1110' '#1079#1075#1110#1076#1085#1086' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080':')
          VAlign = vaCenter
        end
        object Memo792: TfrxMemoView
          Left = 18.897650000000000000
          Top = 109.606370000000000000
          Width = 317.480373540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1053#1072#1076#1110#1081#1096#1083#1086' '#1110#1079' '#1087#1086#1087#1077#1088#1076#1085#1110#1093' '#1087#1077#1088#1110#1086#1076#1110#1074' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1110#1074':')
          VAlign = vaCenter
        end
        object Memo793: TfrxMemoView
          Left = 18.897650000000000000
          Top = 132.283550000000000000
          Width = 374.173323540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1030#1079' '#1085#1080#1093' '#1074#1110#1076#1087#1091#1089#1082#1085#1080#1093' '#1074' '#1087#1086#1087#1077#1088#1077#1076#1085#1110#1093' '#1087#1077#1088#1110#1086#1076#1072#1093' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1110#1074':')
          VAlign = vaCenter
        end
        object Memo794: TfrxMemoView
          Left = 393.071120000000000000
          Top = 41.574803150000010000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."FUND_PAY_WORK"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo795: TfrxMemoView
          Left = 393.071120000000000000
          Top = 64.251968500000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."FUND_PAY_WORK_5"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo796: TfrxMemoView
          Left = 393.071120000000000000
          Top = 86.929133859999970000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."FUND_PAY_WORK_2"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo797: TfrxMemoView
          Left = 393.071120000000000000
          Top = 109.606370000000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."FUND_PAY_WORK_6"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo798: TfrxMemoView
          Left = 393.071120000000000000
          Top = 132.283464570000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."FUND_PAY_WORK_7"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo799: TfrxMemoView
          Top = 154.960730000000000000
          Width = 268.346483540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1060#1086#1085#1076' '#1086#1087#1083#1072#1090#1080' '#1087#1088#1072#1094#1110' '#1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          VAlign = vaCenter
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      PrintOnPreviousPage = True
      object Header3: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 81.763791730000000000
        ParentFont = False
        Top = 215.433210000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'Header3OnBeforePrint'
        Stretched = True
        object Memo64: TfrxMemoView
          Top = 9.102350000000000000
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1058#1072#1073#1083#1080#1094#1103' '#1074#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1087#1088#1080#1073#1091#1090#1082#1086#1074#1086#1075#1086' '#1087#1086#1076#1072#1090#1082#1091':')
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Top = 34.897650000000000000
          Width = 110.000000000000000000
          Height = 46.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 369.790000000000000000
          Top = 34.897650000000000000
          Width = 348.598425200000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1042' '#1084#1080#1085#1091#1083#1080#1093' '#1087#1077#1088#1110#1086#1076#1072#1093)
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 110.000000000000000000
          Top = 34.897650000000000000
          Width = 260.000000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1090#1088#1080#1084#1072#1085#1086' '#1087#1088#1080#1073#1091#1090#1082'. '#1087#1086#1076#1072#1090#1082#1091' '#1079#1072' '#1087#1077#1088#1110#1086#1076)
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 110.000000000000000000
          Top = 58.330720869999600000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072' '#1087#1077#1088#1110#1086#1076)
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 239.790000000000000000
          Top = 58.330720869999600000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1046#1110#1085#1082#1080)
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 479.790000000000000000
          Top = 58.330720869999600000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072' '#1087#1077#1088#1110#1086#1076)
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 598.950000000000000000
          Top = 58.330720869999600000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1046#1110#1085#1082#1080)
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 369.790000000000000000
          Top = 58.330720870000000000
          Width = 110.000000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
      end
      object MasterData4: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.433070870000000000
        ParentFont = False
        Top = 321.260050000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData4OnBeforePrint'
        DataSet = ReportUPSVODPODOHODNALOG
        DataSetName = 'ReportUPSVODPODOHODNALOG'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo267: TfrxMemoView
          Width = 110.000000000000000000
          Height = 23.433070870000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODPODOHODNALOG."MONTHS"]')
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo268: TfrxMemoView
          Left = 110.000000000000000000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportUPSVODPODOHODNALOG."POD_NALOG"]')
          VAlign = vaCenter
        end
        object Memo269: TfrxMemoView
          Left = 239.790000000000000000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportUPSVODPODOHODNALOG."POD_NALOG_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo270: TfrxMemoView
          Left = 369.790000000000000000
          Width = 110.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODPODOHODNALOG."MONTHS_OLD"]')
          VAlign = vaCenter
        end
        object Memo271: TfrxMemoView
          Left = 479.790000000000000000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODPODOHODNALOG."POD_NALOG_OLD"]')
          VAlign = vaCenter
        end
        object Memo272: TfrxMemoView
          Left = 598.950000000000000000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODPODOHODNALOG."POD_NALOG_WOMAN_OLD"]')
          VAlign = vaCenter
        end
      end
      object Footer3: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 366.614410000000000000
        Width = 718.101251175000100000
        Stretched = True
        object Memo68: TfrxMemoView
          Width = 110.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1057#1068#1054#1043#1054)
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 110.000000000000000000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[count_value]')
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 239.790000000000000000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[count_value_w]')
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 369.790000000000000000
          Width = 110.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 479.790000000000000000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODPODOHODNALOG."POD_NALOG_OLD">,MasterData4)]')
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 598.950000000000000000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODPODOHODNALOG."POD_NALOG_WOMAN_OLD">,MasterData' +
              '4)]')
          VAlign = vaCenter
        end
      end
      object Header4: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 92.661441730000000000
        ParentFont = False
        Top = 411.968770000000000000
        Width = 718.101251175000100000
        object Memo86: TfrxMemoView
          Top = 4.881880000000020000
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1041#1091#1083#1086' '#1085#1077#1103#1074#1086#1082' '#1110' '#1087#1088#1086#1075#1091#1083#1110#1074' ('#1076#1083#1103' '#1082#1086#1085#1090#1088#1086#1083#1102'):')
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Top = 34.456710000000000000
          Width = 83.149606300000000000
          Height = 58.204731730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 241.889920000000000000
          Top = 34.456710000000000000
          Width = 98.267709210000000000
          Height = 58.204731730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1102#1076#1077#1081)
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 83.149660000000000000
          Top = 34.456710000000000000
          Width = 158.740032990000000000
          Height = 58.204731730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1091#1089#1090#1082#1080' ('#1079' '#1085#1080#1093' '#1085#1072#1074#1095#1072#1083#1100#1085#1080#1093') ('#1074' '#1088#1086#1073#1086#1095#1080#1093' '#1076#1085#1103#1093')')
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 340.157700000000000000
          Top = 34.456710000000000000
          Width = 90.708663860000000000
          Height = 58.204731730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1110#1082#1072#1088#1085#1103#1085#1110
            '('#1074' '#1088#1086#1073#1086#1095#1080#1093' '#1076#1085#1103#1093')')
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 430.866420000000000000
          Top = 34.456710000000000000
          Width = 86.929133860000000000
          Height = 58.204731730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1102#1076#1077#1081)
          VAlign = vaCenter
        end
        object Memo834: TfrxMemoView
          Left = 517.795610000000000000
          Top = 34.393695910000000000
          Width = 113.385843860000000000
          Height = 58.204731730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1091#1089#1090#1082#1080' '#1073#1077#1079' '#1086#1087#1083#1072#1090#1080' ('#1074' '#1088#1086#1073#1086#1095#1080#1093' '#1076#1085#1103#1093')')
          VAlign = vaCenter
        end
        object Memo835: TfrxMemoView
          Left = 631.181510000000000000
          Top = 34.393695910000000000
          Width = 86.929133860000000000
          Height = 58.204731730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1102#1076#1077#1081)
          VAlign = vaCenter
        end
      end
      object MasterData5: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 529.134200000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODPROGULS
        DataSetName = 'ReportUPSVODPROGULS'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo90: TfrxMemoView
          Width = 83.149606300000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODPROGULS."MONTHS"]')
          VAlign = vaCenter
        end
        object Memo91: TfrxMemoView
          Left = 83.149660000000000000
          Width = 159.779302990000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.Strings = (
            
              '[ReportUPSVODPROGULS."OTPUSKA"] ([ReportUPSVODPROGULS."OTPUSKA_U' +
              'CHEB"])')
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 241.889920000000000000
          Width = 97.133819210000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.Strings = (
            
              '[ReportUPSVODPROGULS."PEOPLES"] ([ReportUPSVODPROGULS."PEOPLES_U' +
              'CHEB"])')
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 340.157700000000000000
          Width = 90.708663860000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODPROGULS."BOLNICH"]')
          VAlign = vaCenter
        end
        object Memo100: TfrxMemoView
          Left = 430.866420000000000000
          Width = 86.929133860000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODPROGULS."PEOPLE_BOLNICH"]')
          VAlign = vaCenter
        end
        object Memo836: TfrxMemoView
          Left = 517.795610000000000000
          Width = 113.385843860000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODPROGULS."OTPUSKA_BEZ_OPLATI"]')
          VAlign = vaCenter
        end
        object Memo837: TfrxMemoView
          Left = 631.181510000000000000
          Width = 86.929133860000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODPROGULS."PEOPLES_BEZ_OPLATI"]')
          VAlign = vaCenter
        end
      end
      object PageFooter2: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 1088.504640000000000000
        Width = 718.101251175000100000
        object Memo172: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
        object Memo812: TfrxMemoView
          Left = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Date] ')
          ParentFont = False
        end
        object Memo813: TfrxMemoView
          Left = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Time]')
          ParentFont = False
        end
      end
      object MasterData24: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 76.000000000000000000
        ParentFont = False
        Top = 604.724800000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODALLSOTRUDS
        DataSetName = 'ReportUPSVODALLSOTRUDS'
        RowCount = 0
        object Memo81: TfrxMemoView
          Width = 400.000000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1073#1088#1072#1083#1080' '#1074#1110#1076#1087#1091#1089#1090#1082#1080':')
          VAlign = vaCenter
        end
        object Memo209: TfrxMemoView
          Left = 397.700990000000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODALLSOTRUDS."COUNT_OTPUSK"]')
          VAlign = vaCenter
        end
        object Memo211: TfrxMemoView
          Left = 397.700990000000000000
          Top = 23.433070870000100000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODALLSOTRUDS."COUNT_OTPUSK_UCHEB"]')
          VAlign = vaCenter
        end
        object Memo212: TfrxMemoView
          Left = 397.700990000000000000
          Top = 46.866141730000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODALLSOTRUDS."COUNT_BOLNICH"]')
          VAlign = vaCenter
        end
        object Memo213: TfrxMemoView
          Top = 23.433070870000100000
          Width = 400.000000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1073#1088#1072#1083#1080' '#1085#1072#1074#1095'. '#1074#1110#1076#1087#1091#1089#1090#1082#1080':')
          VAlign = vaCenter
        end
        object Memo217: TfrxMemoView
          Top = 46.866141730000000000
          Width = 400.000000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1073#1088#1072#1083#1080' '#1083#1110#1082#1072#1088#1085#1103#1085#1110':')
          VAlign = vaCenter
        end
      end
      object Footer9: TfrxFooter
        Height = 7.559060000000000000
        Top = 574.488560000000000000
        Width = 718.101251175000100000
        Stretched = True
        object Line3: TfrxLineView
          Width = 718.110000000000000000
          Frame.Typ = [ftTop]
        end
      end
      object MasterData30: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 65.007888670000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.101251175000100000
        DataSet = ReportMain
        DataSetName = 'ReportMain'
        RowCount = 0
        object Memo3: TfrxMemoView
          Left = 48.000000000000000000
          Top = 18.897650000000000000
          Width = 200.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1057#1091#1084#1072' '#1083#1110#1082#1072#1088#1085#1103#1085#1080#1093' ('#1084#1110#1089'.):')
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 247.937007870000000000
          Top = 18.897650000000000000
          Width = 261.921276930000000000
          Height = 23.433070870000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."SUM_BOLNICH"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo467: TfrxMemoView
          Left = 48.000000000000000000
          Top = 37.795287800000000000
          Width = 200.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          VAlign = vaCenter
        end
        object Memo468: TfrxMemoView
          Left = 247.937007870000000000
          Top = 37.795287800000000000
          Width = 261.921276930000000000
          Height = 23.433070870000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."SUM_BOLNICH_Y"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
      end
      object MasterData33: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 86.929190000000000000
        ParentFont = False
        Top = 105.826840000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODFUNDSUD
        DataSetName = 'ReportUPSVODFUNDSUD'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 247.937007870000000000
          Width = 261.921276930000000000
          Height = 23.433070870000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSUD."POD_NALOG"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 247.937007870000000000
          Top = 18.897637800000000000
          Width = 261.921276930000000000
          Height = 23.433070870000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSUD."POD_NALOG_WOMEN"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 48.000000000000000000
          Width = 200.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1055#1088#1080#1073#1091#1090#1082#1086#1074#1080#1081' '#1087#1086#1076#1072#1090#1086#1082' ('#1084#1110#1089'.):')
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 48.000000000000000000
          Top = 18.897637800000000000
          Width = 200.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1084#1110#1089'.):')
          VAlign = vaCenter
        end
        object Memo469: TfrxMemoView
          Left = 247.937007870000000000
          Top = 37.795275590000000000
          Width = 261.921276930000000000
          Height = 23.433070870000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSUD."POD_NALOG_Y"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo470: TfrxMemoView
          Left = 48.000000000000000000
          Top = 37.795275590000000000
          Width = 200.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          VAlign = vaCenter
        end
        object Memo471: TfrxMemoView
          Left = 247.937007870000000000
          Top = 56.692913390000000000
          Width = 261.921276930000000000
          Height = 23.433070870000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSUD."POD_NALOG_YW"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo472: TfrxMemoView
          Left = 48.000000000000000000
          Top = 56.692913390000000000
          Width = 200.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1088#1110#1082'):')
          VAlign = vaCenter
        end
      end
      object Header25: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 73.763791730000000000
        ParentFont = False
        Top = 702.992580000000000000
        Width = 718.101251175000100000
        object Memo838: TfrxMemoView
          Top = 8.661409999999930000
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1073#1091#1083#1086' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074' '#1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079' '#1087#1086#1095#1072#1090#1082#1091' '#1088#1086#1082#1091':')
          VAlign = vaCenter
        end
        object Memo839: TfrxMemoView
          Top = 34.456709999999900000
          Width = 340.157646300000000000
          Height = 39.307081730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1095#1080#1085#1072)
          VAlign = vaCenter
        end
        object Memo840: TfrxMemoView
          Left = 340.157700000000000000
          Top = 34.393688579999900000
          Width = 188.976382830000000000
          Height = 18.897637800000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1064#1090#1072#1090#1085#1080#1093' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074)
        end
        object Memo841: TfrxMemoView
          Left = 340.157700000000000000
          Top = 53.291326380000000000
          Width = 94.488250000000000000
          Height = 20.409443940000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086' '#1086#1089#1110#1073)
        end
        object Memo842: TfrxMemoView
          Left = 434.645950000000000000
          Top = 53.291326380000000000
          Width = 94.488250000000000000
          Height = 20.409443940000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047' '#1085#1080#1093' '#1078#1110#1085#1086#1082)
        end
        object Memo843: TfrxMemoView
          Left = 529.134200000000000000
          Top = 34.393688579999900000
          Width = 188.976382830000000000
          Height = 18.897637800000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074)
        end
        object Memo844: TfrxMemoView
          Left = 529.134200000000000000
          Top = 53.291326380000000000
          Width = 94.488250000000000000
          Height = 20.409443940000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086' '#1086#1089#1110#1073)
        end
        object Memo845: TfrxMemoView
          Left = 623.622450000000000000
          Top = 53.291326380000000000
          Width = 94.488250000000000000
          Height = 20.409443940000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047' '#1085#1080#1093' '#1078#1110#1085#1086#1082)
        end
      end
      object MasterData40: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 20.409443940000000000
        ParentFont = False
        Top = 801.260360000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODCHISLDISMISS
        DataSetName = 'ReportUPSVODCHISLDISMISS'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo846: TfrxMemoView
          Width = 340.157646300000000000
          Height = 20.409431730000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportUPSVODCHISLDISMISS."NAME_DISMISSION"] ')
          VAlign = vaCenter
        end
        object Memo847: TfrxMemoView
          Left = 340.157700000000000000
          Width = 94.488250000000000000
          Height = 20.409443940000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLDISMISS."SHTAT_DISMISS"] ')
        end
        object Memo848: TfrxMemoView
          Left = 434.645950000000000000
          Width = 94.488250000000000000
          Height = 20.409443940000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLDISMISS."SHTAT_WOMEN_DISMISS"] ')
        end
        object Memo849: TfrxMemoView
          Left = 529.134200000000000000
          Width = 94.488250000000000000
          Height = 20.409443940000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLDISMISS."ALL_DISMISS"] ')
        end
        object Memo850: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 20.409443940000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLDISMISS."ALL_WOMEN_DISMISS"] ')
        end
      end
      object Footer19: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 20.409443940000000000
        ParentFont = False
        Top = 842.835190000000000000
        Width = 718.101251175000100000
        object Memo851: TfrxMemoView
          Width = 340.157646300000000000
          Height = 20.409431730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1058#1054#1043#1054': ')
          VAlign = vaCenter
        end
        object Memo852: TfrxMemoView
          Left = 340.157700000000000000
          Width = 94.488250000000000000
          Height = 20.409443940000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[sum(<ReportUPSVODCHISLDISMISS."SHTAT_DISMISS"> ,MasterData40)]')
        end
        object Memo853: TfrxMemoView
          Left = 434.645950000000000000
          Width = 94.488250000000000000
          Height = 20.409443940000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              '[sum(<ReportUPSVODCHISLDISMISS."SHTAT_WOMEN_DISMISS"> ,MasterDat' +
              'a40)]')
        end
        object Memo854: TfrxMemoView
          Left = 529.134200000000000000
          Width = 94.488250000000000000
          Height = 20.409443940000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[sum(<ReportUPSVODCHISLDISMISS."ALL_DISMISS"> ,MasterData40)]')
        end
        object Memo855: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 20.409443940000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              '[sum(<ReportUPSVODCHISLDISMISS."ALL_WOMEN_DISMISS"> ,MasterData4' +
              '0)]')
        end
      end
      object Header26: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 73.763791730000000000
        ParentFont = False
        Top = 884.410020000000000000
        Width = 718.101251175000100000
        object Memo856: TfrxMemoView
          Top = 8.661410000000050000
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1081#1085#1103#1090#1086' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074' '#1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079' '#1087#1086#1095#1072#1090#1082#1091' '#1088#1086#1082#1091':')
          VAlign = vaCenter
        end
        object Memo858: TfrxMemoView
          Top = 34.393688580000000000
          Width = 362.834762830000000000
          Height = 18.897637800000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1064#1090#1072#1090#1085#1080#1093' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074)
        end
        object Memo859: TfrxMemoView
          Top = 53.291326380000000000
          Width = 177.637910000000000000
          Height = 20.409443940000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086' '#1086#1089#1110#1073)
        end
        object Memo860: TfrxMemoView
          Left = 177.637848980000000000
          Top = 53.291326380000000000
          Width = 185.196970000000000000
          Height = 20.409443940000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047' '#1085#1080#1093' '#1078#1110#1085#1086#1082)
        end
        object Memo861: TfrxMemoView
          Left = 362.834880000000000000
          Top = 34.393688580000000000
          Width = 355.275702830000000000
          Height = 18.897637800000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074)
        end
        object Memo862: TfrxMemoView
          Left = 362.834880000000000000
          Top = 53.291326380000000000
          Width = 173.858380000000000000
          Height = 20.409443940000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086' '#1086#1089#1110#1073)
        end
        object Memo863: TfrxMemoView
          Left = 536.693260000000000000
          Top = 53.291326380000000000
          Width = 181.417440000000000000
          Height = 20.409443940000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047' '#1085#1080#1093' '#1078#1110#1085#1086#1082)
        end
      end
      object MasterData41: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 20.409443940000000000
        ParentFont = False
        Top = 982.677800000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODCHISLACCEPT
        DataSetName = 'ReportUPSVODCHISLACCEPT'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo865: TfrxMemoView
          Width = 177.637910000000000000
          Height = 20.409443940000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLACCEPT."SHTAT_ACCEPT"] ')
        end
        object Memo866: TfrxMemoView
          Left = 177.637848980000000000
          Width = 185.196970000000000000
          Height = 20.409443940000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLACCEPT."SHTAT_WOMEN_ACCEPT"] ')
        end
        object Memo867: TfrxMemoView
          Left = 362.834880000000000000
          Width = 173.858380000000000000
          Height = 20.409443940000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLACCEPT."ALL_ACCEPT"] ')
        end
        object Memo868: TfrxMemoView
          Left = 536.693260000000000000
          Width = 181.417440000000000000
          Height = 20.409443940000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLACCEPT."ALL_WOMEN_ACCEPT"] ')
        end
      end
      object Footer20: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 5.291323940000000000
        ParentFont = False
        Top = 1024.252630000000000000
        Width = 718.101251175000100000
      end
    end
    object Page3: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      PrintOnPreviousPage = True
      object MasterData6: TfrxMasterData
        Height = 859.370310630000000000
        Top = 18.897650000000000000
        Width = 718.101251175000100000
        AllowSplit = True
        DataSet = ReportUPSVODCHISLPERSS
        DataSetName = 'ReportUPSVODCHISLPERSS'
        RowCount = 0
        Stretched = True
        object Memo96: TfrxMemoView
          Width = 337.889763780000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1057#1087#1080#1089#1086#1095#1085#1072' '#1095#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 348.094488190000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SPISOK_CNT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo103: TfrxMemoView
          Top = 18.897637800000000000
          Width = 337.889763780000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          Left = 348.094488190000000000
          Top = 18.897637800000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SPISOK_CNT_WOMEN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo109: TfrxMemoView
          Top = 105.826791180000000000
          Width = 337.706710000000000000
          Height = 18.900000000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1057#1077#1088#1077#1076#1085#1103' '#1095#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' '#1096#1090#1072#1090#1085#1086#1075#1086' '#1087#1077#1088#1089#1086#1085#1072#1083#1091' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 348.125770000000000000
          Top = 105.826791180000000000
          Width = 197.669266930000000000
          Height = 18.900000000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SRED_PER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Top = 200.314992360000000000
          Width = 511.565090000000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1063#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' '#1092#1110#1079'. '#1086#1089#1086#1073', '#1103#1082#1110' '#1087#1088#1072#1094#1102#1102#1090#1100' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' ('#1090#1088#1091#1076#1086#1074#1110#1081' '#1091#1075#1086#1076#1110')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo112: TfrxMemoView
          Left = 348.094488190000000000
          Top = 219.212630160000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."WORKERS_DOG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo115: TfrxMemoView
          Top = 124.724428980000000000
          Width = 337.706710000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Left = 348.125770000000000000
          Top = 124.724428980000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SRED_PER_WOMAN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo121: TfrxMemoView
          Top = 275.905543540000000000
          Width = 511.565090000000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1063#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' '#1092#1110#1079'. '#1086#1089#1086#1073', '#1103#1082#1110' '#1087#1088#1072#1094#1102#1102#1090#1100' '#1087#1086' '#1082#1086#1085#1090#1088#1072#1082#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          Left = 348.094488190000000000
          Top = 294.803181340000000000
          Width = 197.669266930000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."WORKERS_CONTRACT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo127: TfrxMemoView
          Top = 419.527585910000000000
          Width = 337.889763780000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1045#1082#1074#1110#1074#1072#1083#1077#1085#1090' '#1087#1086#1074#1085#1086#1111' '#1079#1072#1081#1085#1103#1090#1086#1089#1090#1110' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo128: TfrxMemoView
          Left = 348.094488190000000000
          Top = 419.527585910000000000
          Width = 197.669266930000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."FULL_ZAN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo129: TfrxMemoView
          Top = 438.425223700000000000
          Width = 337.889763780000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo130: TfrxMemoView
          Left = 348.094488190000000000
          Top = 438.425223700000000000
          Width = 197.669266930000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."FULL_ZAN_WOMAN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Top = 343.937034720000000000
          Width = 575.817100000000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              #1063#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' '#1092#1110#1079'. '#1086#1089#1086#1073', '#1103#1082#1110' '#1087#1088#1072#1094#1102#1102#1090#1100' '#1110' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' ('#1090#1088#1091#1076#1086#1074#1110#1081' '#1091#1075#1086#1076 +
              #1110'), '#1110' '#1087#1086' '#1082#1086#1085#1090#1088#1072#1082#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo515: TfrxMemoView
          Top = 37.795275590000000000
          Width = 337.889763780000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo516: TfrxMemoView
          Left = 348.094488190000000000
          Top = 37.795275590000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SPISOK_CNT_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo517: TfrxMemoView
          Top = 143.622066770000000000
          Width = 337.706710000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo518: TfrxMemoView
          Left = 348.125770000000000000
          Top = 143.622066770000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SRED_PER_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo519: TfrxMemoView
          Top = 219.212630160000000000
          Width = 337.889763780000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1047#1072' '#1079#1074#1110#1090#1085#1110#1081' '#1084#1110#1089#1103#1094#1100' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo520: TfrxMemoView
          Left = 348.094488190000000000
          Top = 241.889920000000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."WORKERS_DOG_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo521: TfrxMemoView
          Top = 241.889920000000000000
          Width = 337.889763780000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1047#1072' '#1087#1077#1088#1110#1086#1076' '#1079' '#1087#1086#1095#1072#1090#1082#1091' '#1088#1086#1082#1091':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo522: TfrxMemoView
          Top = 294.803340000000000000
          Width = 337.889763780000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1047#1072' '#1079#1074#1110#1090#1085#1110#1081' '#1084#1110#1089#1103#1094#1100' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo523: TfrxMemoView
          Left = 348.094488190000000000
          Top = 313.700990000000000000
          Width = 197.669266930000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."WORKERS_CONTRACT_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo524: TfrxMemoView
          Top = 313.701148660000000000
          Width = 337.889763780000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1047#1072' '#1087#1077#1088#1110#1086#1076' '#1079' '#1087#1086#1095#1072#1090#1082#1091' '#1088#1086#1082#1091':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo525: TfrxMemoView
          Left = 348.094488190000000000
          Top = 362.834880000000000000
          Width = 197.669266930000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."WORKERS_DOG_CONT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo526: TfrxMemoView
          Top = 362.835038660000000000
          Width = 337.889763780000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1047#1072' '#1079#1074#1110#1090#1085#1110#1081' '#1084#1110#1089#1103#1094#1100' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 348.094488190000000000
          Top = 381.732530000000000000
          Width = 197.669266930000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."WORKERS_DOG_CONT_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo527: TfrxMemoView
          Top = 381.732688660000000000
          Width = 337.889763780000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1047#1072' '#1087#1077#1088#1110#1086#1076' '#1079' '#1087#1086#1095#1072#1090#1082#1091' '#1088#1086#1082#1091':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo528: TfrxMemoView
          Top = 457.323130000000000000
          Width = 337.889763780000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo529: TfrxMemoView
          Left = 348.094488190000000000
          Top = 457.323130000000000000
          Width = 197.669266930000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."FULL_ZAN_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo582: TfrxMemoView
          Top = 60.472480000000000000
          Width = 337.889763780000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1088#1110#1082'):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo583: TfrxMemoView
          Left = 348.094488190000000000
          Top = 60.472480000000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SPISOK_CNT_WOMAN_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo684: TfrxMemoView
          Top = 166.299212600000000000
          Width = 337.706710000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1088#1110#1082'):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo685: TfrxMemoView
          Left = 348.125770000000000000
          Top = 166.299320000000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SRED_PER_WOMAN_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo688: TfrxMemoView
          Top = 495.118430000000000000
          Width = 337.706710000000000000
          Height = 45.356710000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              #1057#1077#1088#1077#1076#1085#1100#1086#1089#1087#1080#1089#1086#1095#1085#1072' '#1095#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' '#1096#1090#1072#1090#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074'-'#1110#1085#1074#1072#1083#1110#1076#1110#1074' ('#1084 +
              #1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo689: TfrxMemoView
          Left = 348.125770000000000000
          Top = 525.354670000000000000
          Width = 197.669266930000000000
          Height = 18.900000000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SHTAT_INV"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo690: TfrxMemoView
          Top = 544.252307800000000000
          Width = 337.706710000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo691: TfrxMemoView
          Left = 348.125770000000000000
          Top = 544.252307800000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SHTAT_INV_WOMEN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo692: TfrxMemoView
          Top = 563.149945590000000000
          Width = 337.706710000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo693: TfrxMemoView
          Left = 348.125770000000000000
          Top = 563.149945590000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SHTAT_INV_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo694: TfrxMemoView
          Top = 585.827091420000000000
          Width = 337.706710000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1088#1110#1082'):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo695: TfrxMemoView
          Left = 348.125770000000000000
          Top = 585.827198820000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SHTAT_INV_WOMEN_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo800: TfrxMemoView
          Top = 616.063390000000000000
          Width = 337.706710000000000000
          Height = 45.356710000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              #1057#1077#1088#1077#1076#1085#1100#1086#1089#1087#1080#1089#1086#1095#1085#1072' '#1095#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' '#1096#1090#1072#1090#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074'-'#1087#1077#1085#1089#1110#1086#1085#1077#1088#1110#1074' ' +
              '('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo801: TfrxMemoView
          Left = 347.716760000000000000
          Top = 638.740570000000000000
          Width = 197.669266930000000000
          Height = 18.900000000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SHTAT_PENS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo802: TfrxMemoView
          Top = 661.417750000000000000
          Width = 337.706710000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo803: TfrxMemoView
          Top = 680.315400000000000000
          Width = 337.706710000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo804: TfrxMemoView
          Top = 702.992580000000000000
          Width = 337.706710000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1088#1110#1082'):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo805: TfrxMemoView
          Left = 347.716760000000000000
          Top = 661.417750000000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SHTAT_PENS_WOMEN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo806: TfrxMemoView
          Left = 347.716760000000000000
          Top = 680.315400000000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SHTAT_PENS_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo807: TfrxMemoView
          Left = 347.716760000000000000
          Top = 702.992580000000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SHTAT_PENS_WOMEN_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo857: TfrxMemoView
          Top = 733.228820000000000000
          Width = 337.706710000000000000
          Height = 45.356710000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074', '#1097#1086' '#1079#1085#1072#1093#1086#1076#1103#1090#1100#1089#1103' '#1091' '#1074#1110#1076#1087#1091#1089#1090#1094#1110' '#1087#1086' '#1076#1086#1075#1083#1103#1076#1091' ' +
              #1079#1072' '#1076#1080#1090#1080#1085#1086#1102' ('#1084#1110#1089'.): ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo864: TfrxMemoView
          Left = 347.716760000000000000
          Top = 740.787880000000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SPISOK_DEKR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo871: TfrxMemoView
          Top = 782.362697790000000000
          Width = 337.889763780000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo872: TfrxMemoView
          Left = 348.094488190000000000
          Top = 782.362697790000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSS."SPISOK_DEKR_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData7: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 997.795920000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODCHISLPERSONCATS
        DataSetName = 'ReportUPSVODCHISLPERSONCATS'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo138: TfrxMemoView
          Width = 415.748031500000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSONCATS."CATEGORY_NAME"]')
          VAlign = vaCenter
        end
        object Memo139: TfrxMemoView
          Left = 566.929133860000000000
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSONCATS."SRED_CHISL_Y"]')
          VAlign = vaCenter
        end
        object Memo531: TfrxMemoView
          Left = 415.748031500000000000
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSONCATS."SRED_CHISL"]')
          VAlign = vaCenter
        end
      end
      object PageFooter3: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677165350000000000
        ParentFont = False
        Top = 1126.299940000000000000
        Width = 718.101251175000100000
        object Memo173: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
        object Memo814: TfrxMemoView
          Left = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Date] ')
          ParentFont = False
        end
        object Memo815: TfrxMemoView
          Left = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Time]')
          ParentFont = False
        end
      end
      object Header5: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 76.251978270000000000
        ParentFont = False
        Top = 899.528140000000000000
        Width = 718.101251175000100000
        Stretched = True
        object Memo133: TfrxMemoView
          Top = 7.559047800000029000
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1095#1080#1089#1077#1083#1100#1085#1086#1089#1090#1110' '#1087#1077#1088#1089#1086#1085#1072#1083#1091' '#1079#1072' '#1082#1072#1090#1077#1075#1086#1088#1110#1103#1084#1080)
          VAlign = vaCenter
        end
        object Memo135: TfrxMemoView
          Left = 566.929133860000000000
          Top = 30.236208270000000000
          Width = 151.181102360000000000
          Height = 46.015770000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1077#1088#1077#1076#1085#1103' '#1095#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' ('#1088#1110#1082')')
          VAlign = vaCenter
        end
        object Memo136: TfrxMemoView
          Top = 30.236208270000000000
          Width = 415.748031500000000000
          Height = 46.015770000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1082#1072#1090#1077#1075#1086#1088#1110#1111)
          VAlign = vaCenter
        end
        object Memo530: TfrxMemoView
          Left = 415.748031500000000000
          Top = 30.236208270000000000
          Width = 151.181102360000000000
          Height = 46.015770000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1077#1088#1077#1076#1085#1103' '#1095#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' ('#1084#1110#1089'.)')
          VAlign = vaCenter
        end
      end
      object Footer5: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 1043.150280000000000000
        Width = 718.101251175000100000
        Stretched = True
        object Memo76: TfrxMemoView
          Left = 566.929133860000000000
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODCHISLPERSONCATS."SRED_CHISL_Y">,MasterData7)]')
          VAlign = vaCenter
        end
        object Memo465: TfrxMemoView
          Width = 415.748031500000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo532: TfrxMemoView
          Left = 415.748031500000000000
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODCHISLPERSONCATS."SRED_CHISL">,MasterData7)]')
          VAlign = vaCenter
        end
      end
    end
    object Page4: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      PrintOnPreviousPage = True
      object PageFooter4: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677165350000000000
        ParentFont = False
        Top = 1035.591220000000000000
        Width = 718.101251175000100000
        object Memo174: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
        object Memo816: TfrxMemoView
          Left = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Date] ')
          ParentFont = False
        end
        object Memo817: TfrxMemoView
          Left = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Time]')
          ParentFont = False
        end
      end
      object Header7: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 73.795300000000000000
        ParentFont = False
        Top = 340.157700000000000000
        Width = 718.101251175000100000
        object Memo175: TfrxMemoView
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1087#1086#1076#1110#1083' '#1096#1090#1072#1090#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074' '#1079#1072' '#1088#1086#1079#1084#1110#1088#1072#1084#1080' '#1079#1072#1088#1086#1073#1110#1090#1085#1086#1111' '#1087#1083#1072#1090#1080':')
          VAlign = vaCenter
        end
        object Memo176: TfrxMemoView
          Top = 40.000000000000000000
          Width = 718.110236220000000000
          Height = 22.677180000000000000
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportMain."PERIODS"]')
          ParentFont = False
        end
      end
      object MasterData9: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 438.425480000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODWORKERZP
        DataSetName = 'ReportUPSVODWORKERZP'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo178: TfrxMemoView
          Width = 83.149606300000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1074#1110#1076)
          VAlign = vaCenter
        end
        object Memo181: TfrxMemoView
          Left = 83.149660000000000000
          Width = 86.929133860000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODWORKERZP."MIN_VAL"]')
          VAlign = vaCenter
        end
        object Memo186: TfrxMemoView
          Left = 170.078850000000000000
          Width = 64.251968503937000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086)
          VAlign = vaCenter
        end
        object Memo191: TfrxMemoView
          Left = 234.330860000000000000
          Width = 112.470000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODWORKERZP."MAX_VAL"]')
          VAlign = vaCenter
        end
        object Memo177: TfrxMemoView
          Left = 346.803340000000000000
          Width = 64.251968500000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            ':')
          VAlign = vaCenter
        end
        object Memo179: TfrxMemoView
          Left = 411.055350000000000000
          Width = 61.606186930000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODWORKERZP."COUNT_WORKER"]')
          VAlign = vaCenter
        end
      end
      object MasterData26: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 52.000000000000000000
        ParentFont = False
        Top = 483.779840000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODONWORKERSS
        DataSetName = 'ReportUPSVODONWORKERSS'
        RowCount = 0
        Stretched = True
        object Memo218: TfrxMemoView
          Top = 4.000000000000000000
          Width = 462.236366930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1042#1089#1100#1075#1086' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1087#1086#1074#1085#1110#1089#1090#1102' '#1074#1110#1076#1087#1088#1072#1094#1102#1074#1072#1083#1080' '#1087#1077#1088#1110#1086#1076':')
          VAlign = vaCenter
        end
        object Memo219: TfrxMemoView
          Left = 476.882190000000000000
          Top = 4.000000000000000000
          Width = 103.181016930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODONWORKERSS."WORKER_FULL"]')
          VAlign = vaCenter
        end
        object Memo284: TfrxMemoView
          Top = 27.433070870000000000
          Width = 478.236366930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            
              #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1096#1090#1072#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1087#1086#1074#1085#1110#1089#1090#1102' '#1074#1110#1076#1087#1088#1072#1094#1102#1074#1072#1083#1080' '#1087#1077#1088#1110#1086 +
              #1076':')
          VAlign = vaCenter
        end
        object Memo381: TfrxMemoView
          Left = 476.882190000000000000
          Top = 27.433070870000000000
          Width = 103.181016930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODONWORKERSS."WORKER_SHTAT_FULL"]')
          VAlign = vaCenter
        end
      end
      object MasterData29: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 559.370440000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODONWORKEXT
        DataSetName = 'ReportUPSVODONWORKEXT'
        RowCount = 0
        Stretched = True
        object Memo246: TfrxMemoView
          Width = 375.527646930000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1096#1090#1072#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1086#1090#1088#1080#1084#1072#1083#1080' '#1079'/'#1087' '#1074#1110#1076)
          VAlign = vaCenter
        end
        object Memo251: TfrxMemoView
          Left = 378.173470000000000000
          Width = 100.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODONWORKEXT."MIN_PAY"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo252: TfrxMemoView
          Left = 478.205010000000000000
          Width = 24.251968500000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086)
          VAlign = vaCenter
        end
        object Memo253: TfrxMemoView
          Left = 510.457020000000000000
          Width = 100.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODONWORKEXT."MAX_PAY"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo481: TfrxMemoView
          Left = 610.488560000000000000
          Width = 12.251968500000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            ':')
          VAlign = vaCenter
        end
        object Memo482: TfrxMemoView
          Left = 622.740570000000000000
          Width = 96.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODONWORKEXT."WORKER_SHTAT_MINZP"]')
          VAlign = vaCenter
        end
      end
      object Header22: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 152.504020000000000000
        ParentFont = False
        Top = 604.724800000000000000
        Visible = False
        Width = 718.101251175000100000
        Stretched = True
        object Memo599: TfrxMemoView
          Top = 16.000000000000000000
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1058#1072#1073#1083#1080#1094#1103' '#1086#1073#1083#1110#1082#1091' '#1092#1086#1085#1076#1091' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1072#1084#1080)
          VAlign = vaCenter
        end
        object Memo600: TfrxMemoView
          Top = 42.456710000000000000
          Width = 574.488096220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1079#1072' '#1090#1080#1078#1076#1077#1085#1100' ('#1074' '#1075#1086#1076#1080#1085#1072#1093') '#1087#1088#1080' 5 '#1088#1086#1073#1086#1095#1080#1093' '#1076#1085#1103#1093' : ')
          VAlign = vaCenter
        end
        object Memo601: TfrxMemoView
          Left = 578.268090000000000000
          Top = 42.456710000000000000
          Width = 137.196786930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportMain."WEEK_5DAY"]')
          VAlign = vaCenter
        end
        object Memo602: TfrxMemoView
          Top = 83.811070000000000000
          Width = 83.149606300000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
        object Memo603: TfrxMemoView
          Left = 215.433210000000000000
          Top = 83.811070000000000000
          Width = 147.401574800000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1079#1072' '#1084#1110#1089#1103#1094#1100' ('#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085')')
          VAlign = vaCenter
        end
        object Memo604: TfrxMemoView
          Left = 83.149660000000000000
          Top = 83.811070000000000000
          Width = 68.031496060000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050'-'#1090#1100' '#1088#1086#1073'. '#1076#1085#1110#1074)
          VAlign = vaCenter
        end
        object Memo605: TfrxMemoView
          Left = 362.834880000000000000
          Top = 83.811070000000000000
          Width = 219.212598430000000000
          Height = 45.000000000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1090#1088#1072#1090#1080' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' ('#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085')')
          VAlign = vaCenter
        end
        object Memo606: TfrxMemoView
          Left = 151.181200000000000000
          Top = 83.811070000000000000
          Width = 64.251968500000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1063#1080#1089#1077#1083#1100#1085' '#1087#1077#1088#1089'.')
          VAlign = vaCenter
        end
        object Memo607: TfrxMemoView
          Left = 582.047620000000000000
          Top = 83.811070000000000000
          Width = 136.062992130000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085)
          VAlign = vaCenter
        end
        object Memo608: TfrxMemoView
          Left = 362.834880000000000000
          Top = 129.165430000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1091#1089#1090#1082#1080)
          VAlign = vaCenter
        end
        object Memo609: TfrxMemoView
          Left = 468.661720000000000000
          Top = 129.165430000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1110#1082#1072#1088#1085#1103#1085#1110)
          VAlign = vaCenter
        end
      end
      object MasterData37: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 778.583180000000000000
        Visible = False
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData23OnBeforePrint'
        DataSet = ReportUPSVODFUNDALLS
        DataSetName = 'ReportUPSVODFUNDALLS'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo610: TfrxMemoView
          Width = 83.149603860000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDALLS."MONTHS"]')
          VAlign = vaCenter
        end
        object Memo611: TfrxMemoView
          Left = 83.149660000000000000
          Width = 68.031496060000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDALLS."DAYS"]')
          VAlign = vaCenter
        end
        object Memo612: TfrxMemoView
          Left = 362.834880000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDALLS."POTERI_TIME_OTP_ALL"]')
          VAlign = vaCenter
        end
        object Memo613: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.062992130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDALLS."OTRABOTANO_ALL"]')
          VAlign = vaCenter
        end
        object Memo614: TfrxMemoView
          Left = 468.661720000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDALLS."POTERI_TIME_BOLN_ALL"]')
          VAlign = vaCenter
        end
        object Memo615: TfrxMemoView
          Left = 151.181200000000000000
          Width = 64.251968500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDALLS."WORKERS_ALL"]')
          VAlign = vaCenter
        end
        object Memo616: TfrxMemoView
          Left = 215.433210000000000000
          Width = 147.401574800000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDALLS."FUND_TIME_ALL"]')
          VAlign = vaCenter
        end
      end
      object Footer16: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 151.842610000000000000
        ParentFont = False
        Top = 823.937540000000000000
        Visible = False
        Width = 718.101251175000100000
        object Memo617: TfrxMemoView
          Width = 83.149606300000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1057#1068#1054#1043#1054)
          VAlign = vaCenter
        end
        object Memo618: TfrxMemoView
          Left = 83.149660000000000000
          Width = 68.031496060000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDALLS."DAYS">,MasterData37)]')
          VAlign = vaCenter
        end
        object Memo648: TfrxMemoView
          Left = 362.834880000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDALLS."POTERI_TIME_OTP_ALL">,MasterData37)]')
          VAlign = vaCenter
        end
        object Memo649: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.062992130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDALLS."OTRABOTANO_ALL">,MasterData37)]')
          VAlign = vaCenter
        end
        object Memo650: TfrxMemoView
          Left = 468.661720000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODFUNDALLS."POTERI_TIME_BOLN_ALL">,MasterData37)' +
              ']')
          VAlign = vaCenter
        end
        object Memo651: TfrxMemoView
          Left = 151.181200000000000000
          Width = 64.251968500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[AVG(<ReportUPSVODFUNDALLS."WORKERS_ALL">,MasterData37)]')
          VAlign = vaCenter
        end
        object Memo652: TfrxMemoView
          Left = 215.433210000000000000
          Width = 147.401574800000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDALLS."FUND_TIME_ALL">,MasterData37)]')
          VAlign = vaCenter
        end
        object Memo653: TfrxMemoView
          Top = 41.574829999999900000
          Width = 332.598176220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085' ('#1079#1072' '#1087#1077#1088#1110#1086#1076'):')
          VAlign = vaCenter
        end
        object Memo654: TfrxMemoView
          Left = 332.598640000000000000
          Top = 41.574829999999900000
          Width = 249.448892130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDALLS."OtRABOTANO_ALL">,MasterData37)]')
          VAlign = vaCenter
        end
        object Memo655: TfrxMemoView
          Top = 67.590600000000100000
          Width = 332.598176220000000000
          Height = 38.456710000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085' '#1078#1110#1085#1082#1072#1084#1080' ('#1079#1072' '#1087#1077#1088#1110#1086#1076'):')
          VAlign = vaCenter
        end
        object Memo656: TfrxMemoView
          Left = 332.598640000000000000
          Top = 67.590600000000000000
          Width = 249.448892130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODFUNDALLS."OTRABOTANO_WOMEN_ALL">,MasterData37)' +
              ']')
          VAlign = vaCenter
        end
      end
      object Header6: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 136.724490000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.101251175000100000
        Stretched = True
        object Memo77: TfrxMemoView
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1058#1072#1073#1083#1080#1094#1103' '#1086#1073#1083#1110#1082#1091' '#1092#1086#1085#1076#1091' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1096#1090#1072#1090#1085#1080#1084#1080' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1072#1084#1080)
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Top = 26.456710000000000000
          Width = 574.488096220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1079#1072' '#1090#1080#1078#1076#1077#1085#1100' ('#1074' '#1075#1086#1076#1080#1085#1072#1093') '#1087#1088#1080' 5 '#1088#1086#1073#1086#1095#1080#1093' '#1076#1085#1103#1093' : ')
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 578.268090000000000000
          Top = 26.456710000000000000
          Width = 137.196786930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportMain."WEEK_5DAY"]')
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Top = 68.031540000000100000
          Width = 83.149606300000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 215.433210000000000000
          Top = 68.031540000000100000
          Width = 147.401574800000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1079#1072' '#1084#1110#1089#1103#1094#1100' ('#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085')')
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          Left = 83.149660000000000000
          Top = 68.031540000000100000
          Width = 68.031496060000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050'-'#1090#1100' '#1088#1086#1073'. '#1076#1085#1110#1074)
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 362.834880000000000000
          Top = 68.031539999999900000
          Width = 219.212598430000000000
          Height = 45.000000000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1090#1088#1072#1090#1080' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' ('#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085')')
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 151.181200000000000000
          Top = 68.031539999999900000
          Width = 64.251968500000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1063#1080#1089#1077#1083#1100#1085' '#1087#1077#1088#1089'.')
          VAlign = vaCenter
        end
        object Memo107: TfrxMemoView
          Left = 582.047620000000000000
          Top = 68.031540000000100000
          Width = 136.062992130000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085)
          VAlign = vaCenter
        end
        object Memo108: TfrxMemoView
          Left = 362.834880000000000000
          Top = 113.385900000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1091#1089#1090#1082#1080)
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Left = 468.661720000000000000
          Top = 113.385900000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1110#1082#1072#1088#1085#1103#1085#1110)
          VAlign = vaCenter
        end
      end
      object MasterData8: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 177.637910000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODFUNDWTS
        DataSetName = 'ReportUPSVODFUNDWTS'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo114: TfrxMemoView
          Width = 83.149606300000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDWTS."MONTHS"]')
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 83.149660000000000000
          Width = 68.031496060000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDWTS."DAYS"]')
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 362.834880000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDWTS."POTERI_TIME_OTP"]')
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.062992130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDWTS."OBRABOTANO"]')
          VAlign = vaCenter
        end
        object Memo143: TfrxMemoView
          Left = 468.661720000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDWTS."POTERI_TIME_BOLN"]')
          VAlign = vaCenter
        end
        object Memo148: TfrxMemoView
          Left = 151.181200000000000000
          Width = 64.251968500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDWTS."WORKERS"]')
          VAlign = vaCenter
        end
        object Memo149: TfrxMemoView
          Left = 215.433210000000000000
          Width = 147.401574800000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDWTS."FUND_TIME"]')
          VAlign = vaCenter
        end
      end
      object Footer6: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 95.149660000000000000
        ParentFont = False
        Top = 222.992270000000000000
        Width = 718.101251175000100000
        object Memo150: TfrxMemoView
          Width = 83.149606300000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1057#1068#1054#1043#1054)
          VAlign = vaCenter
        end
        object Memo152: TfrxMemoView
          Top = 34.456710000000000000
          Width = 332.598176220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085' ('#1079#1072' '#1087#1077#1088#1110#1086#1076'):')
          VAlign = vaCenter
        end
        object Memo155: TfrxMemoView
          Left = 83.149660000000000000
          Width = 68.031496060000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDWTS."DAYS">,MasterData8)]')
          VAlign = vaCenter
        end
        object Memo156: TfrxMemoView
          Left = 362.834880000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDWTS."POTERI_TIME_OTP">,MasterData8)]')
          VAlign = vaCenter
        end
        object Memo161: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.062992130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDWTS."OBRABOTANO">,MasterData8)]')
          VAlign = vaCenter
        end
        object Memo162: TfrxMemoView
          Left = 468.661720000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDWTS."POTERI_TIME_BOLN">,MasterData8)]')
          VAlign = vaCenter
        end
        object Memo163: TfrxMemoView
          Left = 151.181200000000000000
          Width = 64.251968500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[AVG(<ReportUPSVODFUNDWTS."WORKERS">,MasterData8)]')
          VAlign = vaCenter
        end
        object Memo164: TfrxMemoView
          Left = 215.433210000000000000
          Width = 147.401574800000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDWTS."FUND_TIME">,MasterData8)]')
          VAlign = vaCenter
        end
        object Memo168: TfrxMemoView
          Left = 332.598640000000000000
          Top = 34.456710000000000000
          Width = 249.448892130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDWTS."OBRABOTANO">,MasterData8)]')
          VAlign = vaCenter
        end
        object Memo586: TfrxMemoView
          Top = 56.692950000000000000
          Width = 332.598176220000000000
          Height = 38.456710000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085' '#1078#1110#1085#1082#1072#1084#1080' ('#1079#1072' '#1087#1077#1088#1110#1086#1076'):')
          VAlign = vaCenter
        end
        object Memo587: TfrxMemoView
          Left = 332.598640000000000000
          Top = 56.692950000000000000
          Width = 249.448892130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDWTS."Obrabotano_Woman">,MasterData8)]')
          VAlign = vaCenter
        end
      end
    end
    object Page5: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle2: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 149.606370000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo194: TfrxMemoView
          Width = 718.110236220000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1044' '#1054' '#1042' '#1030' '#1044' '#1050' '#1040'   '#8470'   1')
          ParentFont = False
        end
        object Memo193: TfrxMemoView
          Top = 30.236240000000000000
          Width = 374.173228350000000000
          Height = 23.200000000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1072#1094#1102#1102#1090#1100' '#1079#1072' '#1089#1091#1084#1110#1089#1085#1080#1094#1090#1074#1086#1084' ('#1079#1086#1074#1085#1110#1096#1085#1077'):')
          VAlign = vaCenter
        end
        object Memo195: TfrxMemoView
          Left = 374.173470000000000000
          Top = 30.236240000000000000
          Width = 188.976377950000000000
          Height = 23.200000000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODONWORKERSS."WORKER_EXT_SOVM"] '#1095#1086#1083'.')
          VAlign = vaCenter
        end
        object Memo196: TfrxMemoView
          Top = 52.913420000000000000
          Width = 374.173228346457000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1086#1087#1083#1072#1090#1080' '#1087#1088#1072#1094#1110' '#1089#1091#1084#1110#1089#1085#1080#1082#1110#1074':')
          VAlign = vaCenter
        end
        object Memo197: TfrxMemoView
          Left = 374.173470000000000000
          Top = 52.913420000000000000
          Width = 188.976377950000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODONWORKEXT."FUNDS_SOVM"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo198: TfrxMemoView
          Top = 75.590600000000000000
          Width = 374.173228350000000000
          Height = 22.000000000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1087#1083#1072#1090#1080' '#1095#1086#1088#1085#1086#1073#1080#1083#1100#1094#1103#1084':')
          VAlign = vaCenter
        end
        object Memo199: TfrxMemoView
          Left = 374.173470000000000000
          Top = 75.590600000000000000
          Width = 188.976377950000000000
          Height = 22.000000000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODONWORKEXT."DOPLAT_CHERNOBIL"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo200: TfrxMemoView
          Top = 98.267780000000000000
          Width = 374.173228350000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1072' '#1076#1086#1087#1086#1084#1086#1075#1072' '#1091' '#1089#1082#1083#1072#1076#1110' '#1060#1054#1055':')
          VAlign = vaCenter
        end
        object Memo201: TfrxMemoView
          Left = 374.173470000000000000
          Top = 98.267780000000000000
          Width = 188.976377950000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODONWORKEXT."MAT_POM_V_FOP"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo187: TfrxMemoView
          Top = 124.000000000000000000
          Width = 374.173228350000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1072' '#1076#1086#1087#1086#1084#1086#1075#1072' '#1085#1077' '#1074' '#1089#1082#1083#1072#1076#1110' '#1060#1054#1055':')
          VAlign = vaCenter
        end
        object Memo188: TfrxMemoView
          Left = 374.173470000000000000
          Top = 124.000000000000000000
          Width = 188.976377950000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODONWORKEXT."MAT_POM_VNE_FOP"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
      end
      object Header8: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 123.464610870000000000
        ParentFont = False
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        object Memo202: TfrxMemoView
          Top = 20.000000000000000000
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1044#1083#1103' '#1082#1086#1085#1090#1088#1086#1083#1102':')
          VAlign = vaCenter
        end
        object Memo120: TfrxMemoView
          Top = 54.015770000000000000
          Width = 83.149606300000000000
          Height = 69.360000000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
        object Memo123: TfrxMemoView
          Left = 434.645950000000000000
          Top = 54.015770000000000000
          Width = 284.598456930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1086#1087#1083#1072#1090#1080' '#1087#1088#1072#1094#1110' ('#1090#1080#1089'. '#1075#1088#1085'.)')
          VAlign = vaCenter
        end
        object Memo124: TfrxMemoView
          Left = 83.149660000000000000
          Top = 54.015770000000000000
          Width = 351.496062990000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050'-'#1090#1100' '#1089#1091#1084#1110#1089#1085#1080#1082#1110#1074)
          VAlign = vaCenter
        end
        object Memo125: TfrxMemoView
          Left = 434.645950000000000000
          Top = 77.448840870000000000
          Width = 139.842519690000000000
          Height = 46.015770000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1057#1068#1054#1043#1054)
          VAlign = vaCenter
        end
        object Memo126: TfrxMemoView
          Left = 83.149660000000000000
          Top = 77.448840870000000000
          Width = 178.000000000000000000
          Height = 46.015770000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072' '#1087#1077#1088#1096#1077' '#1095#1080#1089#1083#1086' '#1084#1110#1089#1103#1094#1103)
          VAlign = vaCenter
        end
        object Memo131: TfrxMemoView
          Left = 260.787570000000000000
          Top = 77.448840870000000000
          Width = 173.858267720000000000
          Height = 46.015770000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072' '#1086#1089#1090#1072#1085#1077' '#1095#1080#1089#1083#1086' '#1084#1110#1089#1103#1094#1103)
          VAlign = vaCenter
        end
        object Memo132: TfrxMemoView
          Left = 574.488560000000000000
          Top = 77.448840870000000000
          Width = 143.622047240000000000
          Height = 46.015770000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1072#1090'. '#1076#1086#1087#1086#1084#1086#1075#1072)
          VAlign = vaCenter
        end
      end
      object MasterData10: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.340000000000000000
        ParentFont = False
        Top = 377.953000000000000000
        Width = 718.110700000000000000
        DataSet = ReportUPSVODWORKERSOVM
        DataSetName = 'ReportUPSVODWORKERSOVM'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo206: TfrxMemoView
          Width = 83.149606300000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODWORKERSOVM."MONTHS"]')
          VAlign = vaCenter
        end
        object Memo207: TfrxMemoView
          Left = 83.149660000000000000
          Width = 177.637682990000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODWORKERSOVM."COUNT_SOVM_FIRST"]')
          VAlign = vaCenter
        end
        object Memo208: TfrxMemoView
          Left = 434.645950000000000000
          Width = 139.842519690000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODWORKERSOVM."FUND_ALL"]')
          VAlign = vaCenter
        end
        object Memo210: TfrxMemoView
          Left = 574.488560000000000000
          Width = 143.622047240000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODWORKERSOVM."FUND_MATH_HELP"]')
          VAlign = vaCenter
        end
        object Memo140: TfrxMemoView
          Left = 260.787570000000000000
          Width = 173.858152990000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODWORKERSOVM."COUNT_SOVM_LAST"]')
          VAlign = vaCenter
        end
      end
      object Header9: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 168.504020000000000000
        ParentFont = False
        Top = 445.984540000000000000
        Width = 718.110700000000000000
        object Memo214: TfrxMemoView
          Top = 28.000000000000000000
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1058#1072#1073#1083#1080#1094#1103' '#1086#1073#1083#1110#1082#1091' '#1092#1086#1085#1076#1091' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1079#1086#1074#1085#1110#1096#1085#1110#1084#1080' '#1089#1091#1084#1110#1089#1085#1080#1082#1072#1084#1080)
          VAlign = vaCenter
        end
        object Memo215: TfrxMemoView
          Top = 54.456710000000000000
          Width = 574.488096220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1079#1072' '#1090#1080#1078#1076#1077#1085#1100' ('#1074' '#1075#1086#1076#1080#1085#1072#1093') '#1087#1088#1080' 5 '#1088#1086#1073#1086#1095#1080#1093' '#1076#1085#1103#1093' : ')
          VAlign = vaCenter
        end
        object Memo216: TfrxMemoView
          Left = 578.268090000000000000
          Top = 54.456710000000000000
          Width = 137.196786930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportMain."WEEK_5DAY"]')
          VAlign = vaCenter
        end
        object Memo141: TfrxMemoView
          Top = 99.811070000000000000
          Width = 83.149606300000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
        object Memo142: TfrxMemoView
          Left = 215.433210000000000000
          Top = 99.811070000000000000
          Width = 147.401574800000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1079#1072' '#1084#1110#1089#1103#1094#1100' ('#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085')')
          VAlign = vaCenter
        end
        object Memo144: TfrxMemoView
          Left = 83.149660000000000000
          Top = 99.811070000000000000
          Width = 68.031496060000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050'-'#1090#1100' '#1088#1086#1073'. '#1076#1085#1110#1074)
          VAlign = vaCenter
        end
        object Memo145: TfrxMemoView
          Left = 362.834880000000000000
          Top = 99.811070000000000000
          Width = 219.212598430000000000
          Height = 45.000000000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1090#1088#1072#1090#1080' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' ('#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085')')
          VAlign = vaCenter
        end
        object Memo146: TfrxMemoView
          Left = 151.181200000000000000
          Top = 99.811070000000000000
          Width = 64.251968500000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1063#1080#1089#1077#1083#1100#1085' '#1087#1077#1088#1089'.')
          VAlign = vaCenter
        end
        object Memo147: TfrxMemoView
          Left = 582.047620000000000000
          Top = 99.811070000000000000
          Width = 136.062992130000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085)
          VAlign = vaCenter
        end
        object Memo151: TfrxMemoView
          Left = 362.834880000000000000
          Top = 145.165430000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1091#1089#1090#1082#1080)
          VAlign = vaCenter
        end
        object Memo153: TfrxMemoView
          Left = 468.661720000000000000
          Top = 145.165430000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1110#1082#1072#1088#1085#1103#1085#1110)
          VAlign = vaCenter
        end
      end
      object MasterData11: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 24.094451570000000000
        ParentFont = False
        Top = 638.740570000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData11OnBeforePrint'
        DataSet = ReportUPSVODEXTSOVMS
        DataSetName = 'ReportUPSVODEXTSOVMS'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo220: TfrxMemoView
          Width = 83.149603860000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODEXTSOVMS."MONTHS"]')
          VAlign = vaCenter
        end
        object Memo221: TfrxMemoView
          Left = 83.149660000000000000
          Width = 68.031496060000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODEXTSOVMS."DAYS"]')
          VAlign = vaCenter
        end
        object Memo222: TfrxMemoView
          Left = 362.834880000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODEXTSOVMS."POTERI_TIME_OTP"]')
          VAlign = vaCenter
        end
        object Memo224: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.062992130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODEXTSOVMS."OBRABOTANO"]')
          VAlign = vaCenter
        end
        object Memo229: TfrxMemoView
          Left = 468.661720000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODEXTSOVMS."POTERI_TIME_BOLN"]')
          VAlign = vaCenter
        end
        object Memo230: TfrxMemoView
          Left = 151.181200000000000000
          Width = 64.251968500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODEXTSOVMS."WORKERS"]')
          VAlign = vaCenter
        end
        object Memo231: TfrxMemoView
          Left = 215.433210000000000000
          Width = 147.401574800000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODEXTSOVMS."FUND_TIME"]')
          VAlign = vaCenter
        end
      end
      object Footer8: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 114.047310000000000000
        ParentFont = False
        Top = 684.094930000000000000
        Width = 718.110700000000000000
        object Memo234: TfrxMemoView
          Width = 83.149606300000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1057#1068#1054#1043#1054)
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 83.149660000000000000
          Width = 68.031496060000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODEXTSOVMS."DAYS">,MasterData11)]')
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 362.834880000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODEXTSOVMS."POTERI_TIME_OTP">,MasterData11)]')
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.062992130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODEXTSOVMS."OBRABOTANO">,MasterData11)]')
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 468.661720000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODEXTSOVMS."POTERI_TIME_BOLN">,MasterData11)]')
          VAlign = vaCenter
        end
        object Memo154: TfrxMemoView
          Left = 151.181200000000000000
          Width = 64.251968500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[AVG(<ReportUPSVODEXTSOVMS."WORKERS">,MasterData11)]')
          VAlign = vaCenter
        end
        object Memo157: TfrxMemoView
          Left = 215.433210000000000000
          Width = 147.401574800000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODEXTSOVMS."FUND_TIME">,MasterData11)]')
          VAlign = vaCenter
        end
        object Memo657: TfrxMemoView
          Top = 34.015770000000000000
          Width = 332.598176220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085' ('#1079#1072' '#1087#1077#1088#1110#1086#1076'):')
          VAlign = vaCenter
        end
        object Memo658: TfrxMemoView
          Left = 332.598640000000000000
          Top = 34.015770000000000000
          Width = 249.448892130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODEXTSOVMS."OBRABOTANO">,MasterData11)]')
          VAlign = vaCenter
        end
        object Memo659: TfrxMemoView
          Top = 60.031539999999900000
          Width = 332.598176220000000000
          Height = 38.456710000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085' '#1078#1110#1085#1082#1072#1084#1080' ('#1079#1072' '#1087#1077#1088#1110#1086#1076'):')
          VAlign = vaCenter
        end
        object Memo660: TfrxMemoView
          Left = 332.598640000000000000
          Top = 60.031539999999900000
          Width = 249.448892130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODEXTSOVMS."OTRABOTANO_WOMEN">,MasterData11)]')
          VAlign = vaCenter
        end
      end
      object PageFooter5: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677165354330700000
        ParentFont = False
        Top = 857.953310000000000000
        Width = 718.110700000000000000
        object Memo242: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
        object Memo818: TfrxMemoView
          Left = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Date] ')
          ParentFont = False
        end
        object Memo819: TfrxMemoView
          Left = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Time]')
          ParentFont = False
        end
      end
      object Footer4: TfrxFooter
        Top = 423.307360000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Line1: TfrxLineView
          Width = 718.110000000000000000
          Frame.Typ = [ftTop]
        end
      end
    end
    object Page6: TfrxReportPage
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData13: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 302.362216930000000000
        ParentFont = False
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        DataSet = ReportUPSVODFUNDSZP
        DataSetName = 'ReportUPSVODFUNDSZP'
        RowCount = 0
        Stretched = True
        object Memo282: TfrxMemoView
          Left = 253.228510000000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."FUND_PAY_WORK"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo283: TfrxMemoView
          Top = 94.488188980000000000
          Width = 226.771653540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1054#1089#1085#1086#1074#1085#1080#1081' '#1092#1086#1085#1076' ('#1084#1110#1089'.):')
          VAlign = vaCenter
        end
        object Memo287: TfrxMemoView
          Top = 245.669291340000000000
          Width = 226.771665750000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1050#1086#1084#1087#1077#1085#1089#1072#1094#1110#1081#1085#1080#1081' '#1092#1086#1085#1076' ('#1084#1110#1089'.):')
          VAlign = vaCenter
        end
        object Memo288: TfrxMemoView
          Top = 151.181102360000000000
          Width = 226.771677950000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1044#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1092#1086#1085#1076' ('#1084#1110#1089'.):')
          VAlign = vaCenter
        end
        object Memo289: TfrxMemoView
          Left = 253.228510000000000000
          Top = 94.488188980000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."OSNOV_FUND_PAY_WORK"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo290: TfrxMemoView
          Left = 253.228510000000000000
          Top = 151.181102360000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."DOP_FUND_PAY_WORK"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo291: TfrxMemoView
          Left = 253.228510000000000000
          Top = 245.669291340000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."KOMPEN_FUND_PAY_WORK"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo292: TfrxMemoView
          Width = 226.771653540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1060#1086#1085#1076' '#1086#1087#1083#1072#1090#1080' '#1087#1088#1072#1094#1110' ('#1084#1110#1089'.):')
          VAlign = vaCenter
        end
        object Memo485: TfrxMemoView
          Left = 253.228510000000000000
          Top = 18.897637800000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."FUND_PAY_WORK_Y"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo486: TfrxMemoView
          Top = 18.897637800000000000
          Width = 226.771653540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          VAlign = vaCenter
        end
        object Memo487: TfrxMemoView
          Top = 37.795275590000000000
          Width = 226.771653540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1072' '#1076#1086#1087#1086#1084#1086#1075#1072' ('#1084#1110#1089'.):')
          VAlign = vaCenter
        end
        object Memo488: TfrxMemoView
          Left = 253.228510000000000000
          Top = 37.795275590000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."MAT_POM"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo489: TfrxMemoView
          Left = 253.228510000000000000
          Top = 56.692913390000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."MAT_POM_Y"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo490: TfrxMemoView
          Top = 56.692913390000000000
          Width = 226.771653540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1072' '#1076#1086#1087#1086#1084#1086#1075#1072' '#1079#1072' '#1088#1110#1082':')
          VAlign = vaCenter
        end
        object Memo491: TfrxMemoView
          Left = 253.228510000000000000
          Top = 75.590551180000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."MAT_POM_YEAR_W"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo492: TfrxMemoView
          Top = 75.590551180000000000
          Width = 226.771653540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' '#1079#1072' '#1088#1110#1082':')
          VAlign = vaCenter
        end
        object Memo493: TfrxMemoView
          Top = 113.385826770000000000
          Width = 226.771653540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          VAlign = vaCenter
        end
        object Memo494: TfrxMemoView
          Left = 253.228510000000000000
          Top = 113.385826770000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."OSNOV_FUND_PAY_WORK_Y"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo495: TfrxMemoView
          Top = 132.283464570000000000
          Width = 226.771653540000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080':')
          VAlign = vaCenter
        end
        object Memo496: TfrxMemoView
          Left = 253.228510000000000000
          Top = 132.283464570000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."Osnov_Fund_Pay_Work_WY"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo497: TfrxMemoView
          Top = 170.078740160000000000
          Width = 226.771677950000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1082' '#1088#1110#1082':')
          VAlign = vaCenter
        end
        object Memo498: TfrxMemoView
          Left = 253.228510000000000000
          Top = 170.078740160000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."DOP_FUND_PAY_WORK_Y"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo499: TfrxMemoView
          Top = 188.976377950000000000
          Width = 226.771677950000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082'):')
          VAlign = vaCenter
        end
        object Memo500: TfrxMemoView
          Left = 253.228510000000000000
          Top = 188.976377950000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."DOP_FUND_PAY_WORK_WY"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo501: TfrxMemoView
          Top = 207.874015750000000000
          Width = 226.771677950000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1047#1072' '#1085#1077#1074#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1080#1081' '#1095#1072#1089':')
          VAlign = vaCenter
        end
        object Memo502: TfrxMemoView
          Left = 253.228510000000000000
          Top = 207.874015750000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."DOP_FUND_PAY_WORK_NY"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo503: TfrxMemoView
          Top = 226.771653540000000000
          Width = 226.771677950000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1047#1072' '#1085#1077#1074#1110#1076#1087#1088'. '#1095#1072#1089' ('#1078#1110#1085#1082#1080'):')
          VAlign = vaCenter
        end
        object Memo504: TfrxMemoView
          Left = 253.228510000000000000
          Top = 226.771653540000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."DOP_FUND_PAY_WORK_NWY"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo505: TfrxMemoView
          Top = 264.566929130000000000
          Width = 226.771665750000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          VAlign = vaCenter
        end
        object Memo506: TfrxMemoView
          Left = 253.228510000000000000
          Top = 264.566929130000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."KOMPEN_FUND_PAY_WORK_Y"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo507: TfrxMemoView
          Top = 283.464566930000000000
          Width = 226.771665750000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082'):')
          VAlign = vaCenter
        end
        object Memo508: TfrxMemoView
          Left = 253.228510000000000000
          Top = 283.464566930000000000
          Width = 261.921259840000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."KOMPEN_FUND_PAY_WORK_WY"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
      end
      object Header10: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 72.472448270000000000
        ParentFont = False
        Top = 540.472790000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo293: TfrxMemoView
          Top = 18.897637800000000000
          Width = 718.110000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1092#1086#1085#1076#1110#1074' '#1047'/'#1055' '#1079#1072' '#1082#1072#1090#1077#1075#1086#1088#1110#1103#1084#1080)
          VAlign = vaCenter
        end
        object Memo295: TfrxMemoView
          Top = 49.133858270000000000
          Width = 415.748031500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1082#1072#1090#1077#1075#1086#1088#1110#1111)
          VAlign = vaCenter
        end
        object Memo296: TfrxMemoView
          Left = 566.929500000000000000
          Top = 49.133858270000000000
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1086#1087#1083#1072#1090#1080' ('#1079#1072' '#1088#1110#1082')')
          VAlign = vaCenter
        end
        object Memo509: TfrxMemoView
          Left = 415.748300000000000000
          Top = 49.133889999999900000
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1086#1087#1083#1072#1090#1080' ('#1084#1110#1089'.)')
          VAlign = vaCenter
        end
      end
      object MasterData14: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338604650000000000
        ParentFont = False
        Top = 634.961040000000000000
        Width = 718.110700000000000000
        DataSet = ReportUPSVODFUNDSONCAT
        DataSetName = 'ReportUPSVODFUNDSONCAT'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo298: TfrxMemoView
          Width = 415.748031500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight]
          Memo.Strings = (
            '[ReportUPSVODFUNDSONCAT."NAME_CAT"]')
          VAlign = vaCenter
        end
        object Memo299: TfrxMemoView
          Left = 566.929500000000000000
          Top = 0.000014650000025540
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSONCAT."FUND_PAY_Y"]')
          VAlign = vaCenter
        end
        object Memo510: TfrxMemoView
          Left = 415.748300000000000000
          Top = 0.000046379999957935
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODFUNDSONCAT."FUND_PAY"]')
          VAlign = vaCenter
        end
      end
      object Header11: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 95.244094490000000000
        ParentFont = False
        Top = 725.669760000000000000
        Width = 718.110700000000000000
        object Memo297: TfrxMemoView
          Top = 18.897637795275600000
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1058#1072#1073#1083#1080#1094#1103' '#1074#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1089#1091#1084#1080' '#1074#1110#1076#1087#1091#1089#1082#1085#1080#1093':')
          VAlign = vaCenter
        end
        object Memo300: TfrxMemoView
          Top = 49.133858267716500000
          Width = 110.000000000000000000
          Height = 46.015770000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
        object Memo301: TfrxMemoView
          Left = 369.790000000000000000
          Top = 49.133858267716500000
          Width = 348.320000000000000000
          Height = 22.677165350000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042' '#1084#1080#1085#1091#1083#1080#1093' '#1087#1077#1088#1110#1086#1076#1072#1093)
          VAlign = vaCenter
        end
        object Memo302: TfrxMemoView
          Left = 110.000000000000000000
          Top = 49.133858270000000000
          Width = 260.000000000000000000
          Height = 22.677165350000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086' '#1074#1110#1076#1087#1091#1089#1082#1085#1080#1093)
          VAlign = vaCenter
        end
        object Memo303: TfrxMemoView
          Left = 110.000000000000000000
          Top = 71.811023622047300000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072' '#1087#1077#1088#1110#1086#1076)
          VAlign = vaCenter
        end
        object Memo304: TfrxMemoView
          Left = 239.790000000000000000
          Top = 71.811023622047300000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1046#1110#1085#1082#1080)
          VAlign = vaCenter
        end
        object Memo305: TfrxMemoView
          Left = 479.790000000000000000
          Top = 71.811023622047300000
          Width = 119.160000000000000000
          Height = 23.433070870000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072' '#1087#1077#1088#1110#1086#1076)
          VAlign = vaCenter
        end
        object Memo306: TfrxMemoView
          Left = 598.950000000000000000
          Top = 71.811023622047300000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1046#1110#1085#1082#1080)
          VAlign = vaCenter
        end
        object Memo307: TfrxMemoView
          Left = 369.790000000000000000
          Top = 71.811023622047300000
          Width = 110.000000000000000000
          Height = 23.433070870000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
      end
      object MasterData15: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 842.835190000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData15OnBeforePrint'
        DataSet = ReportUPSVODSUMOTPUSK
        DataSetName = 'ReportUPSVODSUMOTPUSK'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo309: TfrxMemoView
          Width = 110.000000000000000000
          Height = 22.677165350000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODSUMOTPUSK."MONTHS"]')
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo310: TfrxMemoView
          Left = 110.000000000000000000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportUPSVODSUMOTPUSK."NACH_OTP"]')
          VAlign = vaCenter
        end
        object Memo311: TfrxMemoView
          Left = 239.790000000000000000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportUPSVODSUMOTPUSK."NACH_OTP_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo312: TfrxMemoView
          Left = 369.790000000000000000
          Width = 110.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODSUMOTPUSK."MONTHS_OLD"]')
          VAlign = vaCenter
        end
        object Memo313: TfrxMemoView
          Left = 479.790000000000000000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODSUMOTPUSK."NACH_OTP_OLD"]')
          VAlign = vaCenter
        end
        object Memo314: TfrxMemoView
          Left = 598.950000000000000000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODSUMOTPUSK."NACH_OTP_OLD_WOMAN"]')
          VAlign = vaCenter
        end
      end
      object PageFooter7: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 971.339210000000000000
        Width = 718.110700000000000000
        object Memo315: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
        object Memo820: TfrxMemoView
          Left = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Date] ')
          ParentFont = False
        end
        object Memo821: TfrxMemoView
          Left = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Time]')
          ParentFont = False
        end
      end
      object Footer10: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338604650000000000
        ParentFont = False
        Top = 680.315400000000000000
        Width = 718.110700000000000000
        object Memo317: TfrxMemoView
          Width = 415.748031500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo318: TfrxMemoView
          Left = 566.929500000000000000
          Top = 0.000014650000025540
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDSONCAT."FUND_PAY_Y">,MasterData14)]')
          VAlign = vaCenter
        end
        object Memo511: TfrxMemoView
          Left = 415.748300000000000000
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDSONCAT."FUND_PAY">,MasterData14)]')
          VAlign = vaCenter
        end
      end
      object Footer11: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 888.189550000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo319: TfrxMemoView
          Width = 110.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1057#1068#1054#1043#1054)
          VAlign = vaCenter
        end
        object Memo326: TfrxMemoView
          Left = 110.000000000000000000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[count_value]')
          VAlign = vaCenter
        end
        object Memo327: TfrxMemoView
          Left = 239.790000000000000000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[count_value_w]')
          VAlign = vaCenter
        end
        object Memo328: TfrxMemoView
          Left = 479.790000000000000000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODSUMOTPUSK."NACH_OTP_OLD">,MasterData15)]')
          VAlign = vaCenter
        end
        object Memo329: TfrxMemoView
          Left = 598.950000000000000000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODSUMOTPUSK."NACH_OTP_OLD_WOMAN">,MasterData15)]')
          VAlign = vaCenter
        end
        object Memo464: TfrxMemoView
          Left = 369.790000000000000000
          Width = 110.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
      end
      object ReportTitle4: TfrxReportTitle
        Height = 136.063080000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle4OnBeforePrint'
        Stretched = True
        object Memo275: TfrxMemoView
          Top = 73.133890000000000000
          Width = 718.110236220000000000
          Height = 22.677180000000000000
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1074#1110#1090' [ReportMain."PERIODS"]')
          ParentFont = False
        end
        object Memo276: TfrxMemoView
          Width = 718.110236220000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportMain."FIRM_NAME"]')
          ParentFont = False
        end
        object Memo277: TfrxMemoView
          Top = 105.826840000000000000
          Width = 718.110236220000000000
          Height = 22.677180000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1060' '#1054' '#1053' '#1044' '#1048'   '#1047' '#1040' '#1056' '#1054' '#1041' '#1030' '#1058' '#1053' '#1054' '#1031'   '#1055' '#1051' '#1040' '#1058' '#1048)
          ParentFont = False
        end
        object Memo278: TfrxMemoView
          Top = 34.015770000000000000
          Width = 718.110236220000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1077#1072#1083#1100#1085#1080#1081' '#1079#1074#1110#1090' ('#1076#1083#1103' '#1087#1077#1088#1077#1074#1110#1088#1082#1080')')
          ParentFont = False
        end
      end
    end
    object Page7: TfrxReportPage
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      PrintOnPreviousPage = True
      object Header12: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 108.440971730000000000
        ParentFont = False
        Top = 192.756030000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'Header12OnBeforePrint'
        Stretched = True
        object Memo308: TfrxMemoView
          Top = 31.999999999999900000
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1058#1072#1073#1083#1080#1094#1103' '#1074#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1087#1088#1080#1073#1091#1090#1082#1086#1074#1086#1075#1086' '#1087#1086#1076#1072#1090#1082#1091':')
          VAlign = vaCenter
        end
        object Memo316: TfrxMemoView
          Top = 61.574829999999710000
          Width = 110.000000000000000000
          Height = 46.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
        object Memo320: TfrxMemoView
          Left = 369.790000000000000000
          Top = 61.574829999999710000
          Width = 348.598425200000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1042' '#1084#1080#1085#1091#1083#1080#1093' '#1087#1077#1088#1110#1086#1076#1072#1093)
          VAlign = vaCenter
        end
        object Memo321: TfrxMemoView
          Left = 110.000000000000000000
          Top = 61.574829999999710000
          Width = 260.000000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1090#1088#1080#1084#1072#1085#1086' '#1087#1088#1080#1073#1091#1090#1082'. '#1087#1086#1076#1072#1090#1082#1091' '#1079#1072' '#1087#1077#1088#1110#1086#1076)
          VAlign = vaCenter
        end
        object Memo322: TfrxMemoView
          Left = 110.000000000000000000
          Top = 85.007900869999600000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072' '#1087#1077#1088#1110#1086#1076)
          VAlign = vaCenter
        end
        object Memo323: TfrxMemoView
          Left = 239.790000000000000000
          Top = 85.007900869999600000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1046#1110#1085#1082#1080)
          VAlign = vaCenter
        end
        object Memo324: TfrxMemoView
          Left = 479.790000000000000000
          Top = 85.007900869999600000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072' '#1087#1077#1088#1110#1086#1076)
          VAlign = vaCenter
        end
        object Memo325: TfrxMemoView
          Left = 598.950000000000000000
          Top = 85.007900869999600000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1046#1110#1085#1082#1080)
          VAlign = vaCenter
        end
        object Memo334: TfrxMemoView
          Left = 369.790000000000000000
          Top = 85.007900869999600000
          Width = 110.000000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
      end
      object MasterData16: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.433070870000000000
        ParentFont = False
        Top = 325.039580000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData16OnBeforePrint'
        DataSet = ReportUPSVODPODOHODNALOG
        DataSetName = 'ReportUPSVODPODOHODNALOG'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        object Memo352: TfrxMemoView
          Width = 110.000000000000000000
          Height = 23.433070870000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODPODOHODNALOG."MONTHS"]')
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo353: TfrxMemoView
          Left = 110.000000000000000000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportUPSVODPODOHODNALOG."POD_NALOG"]')
          VAlign = vaCenter
        end
        object Memo354: TfrxMemoView
          Left = 239.790000000000000000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportUPSVODPODOHODNALOG."POD_NALOG_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo355: TfrxMemoView
          Left = 369.790000000000000000
          Width = 110.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODPODOHODNALOG."MONTHS_OLD"]')
          VAlign = vaCenter
        end
        object Memo356: TfrxMemoView
          Left = 479.790000000000000000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODPODOHODNALOG."POD_NALOG_OLD"]')
          VAlign = vaCenter
        end
        object Memo357: TfrxMemoView
          Left = 598.950000000000000000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODPODOHODNALOG."POD_NALOG_WOMAN_OLD"]')
          VAlign = vaCenter
        end
      end
      object Footer12: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 370.393940000000000000
        Width = 718.101251175000100000
        Stretched = True
        object Memo358: TfrxMemoView
          Width = 110.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1057#1068#1054#1043#1054)
          VAlign = vaCenter
        end
        object Memo359: TfrxMemoView
          Left = 110.000000000000000000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[count_value]')
          VAlign = vaCenter
        end
        object Memo360: TfrxMemoView
          Left = 239.790000000000000000
          Width = 130.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[count_value_w]')
          VAlign = vaCenter
        end
        object Memo361: TfrxMemoView
          Left = 369.790000000000000000
          Width = 110.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo362: TfrxMemoView
          Left = 479.790000000000000000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODPODOHODNALOG."POD_NALOG_OLD">,MasterData16)]')
          VAlign = vaCenter
        end
        object Memo363: TfrxMemoView
          Left = 598.950000000000000000
          Width = 119.160000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODPODOHODNALOG."POD_NALOG_WOMAN_OLD">,MasterData' +
              '16)]')
          VAlign = vaCenter
        end
      end
      object Header13: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 104.220501730000000000
        ParentFont = False
        Top = 415.748300000000000000
        Width = 718.101251175000100000
        object Memo364: TfrxMemoView
          Top = 20.000000000000000000
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1041#1091#1083#1086' '#1085#1077#1103#1074#1086#1082' '#1110' '#1087#1088#1086#1075#1091#1083#1110#1074' ('#1076#1083#1103' '#1082#1086#1085#1090#1088#1086#1083#1102'):')
          VAlign = vaCenter
        end
        object Memo365: TfrxMemoView
          Top = 57.354359999999800000
          Width = 83.149606300000000000
          Height = 46.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
        object Memo366: TfrxMemoView
          Left = 434.645950000000000000
          Top = 57.354359999999800000
          Width = 109.606299210000000000
          Height = 46.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1102#1076#1077#1081)
          VAlign = vaCenter
        end
        object Memo367: TfrxMemoView
          Left = 83.149660000000000000
          Top = 57.354359999999800000
          Width = 351.496062990000000000
          Height = 46.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1091#1089#1090#1082#1080' ('#1079' '#1085#1080#1093' '#1085#1072#1074#1095#1072#1083#1100#1085#1080#1093')'
            '('#1074' '#1076#1085#1103#1093')')
          VAlign = vaCenter
        end
        object Memo368: TfrxMemoView
          Left = 544.252320000000000000
          Top = 57.354359999999800000
          Width = 86.929133860000000000
          Height = 46.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1110#1082#1072#1088#1085#1103#1085#1110
            '('#1074' '#1076#1085#1103#1093')')
          VAlign = vaCenter
        end
        object Memo369: TfrxMemoView
          Left = 631.181510000000000000
          Top = 57.354359999999800000
          Width = 86.929133860000000000
          Height = 46.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1102#1076#1077#1081)
          VAlign = vaCenter
        end
      end
      object MasterData17: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 544.252320000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODPROGULR
        DataSetName = 'ReportUPSVODPROGULR'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo370: TfrxMemoView
          Width = 83.149606300000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODPROGULR."MONTHS"]')
          VAlign = vaCenter
        end
        object Memo371: TfrxMemoView
          Left = 83.149660000000000000
          Width = 352.535332990000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.Strings = (
            
              '[ReportUPSVODPROGULR."OTPUSKA"] ([ReportUPSVODPROGULR."OTPUSKA_U' +
              'CHEB"])')
          VAlign = vaCenter
        end
        object Memo372: TfrxMemoView
          Left = 434.645950000000000000
          Width = 108.472409210000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.Strings = (
            
              '[ReportUPSVODPROGULR."PEOPLES"] ([ReportUPSVODPROGULR."PEOPLES_U' +
              'CHEB"])')
          VAlign = vaCenter
        end
        object Memo373: TfrxMemoView
          Left = 544.252320000000000000
          Width = 86.929133860000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODPROGULR."BOLNICH"]')
          VAlign = vaCenter
        end
        object Memo374: TfrxMemoView
          Left = 631.181510000000000000
          Width = 86.929133860000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODPROGULR."PEOPLE_BOLNICH"]')
          VAlign = vaCenter
        end
      end
      object PageFooter8: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677165354330700000
        ParentFont = False
        Top = 748.346940000000000000
        Width = 718.101251175000100000
        object Memo430: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
        object Memo822: TfrxMemoView
          Left = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Date] ')
          ParentFont = False
        end
        object Memo823: TfrxMemoView
          Left = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Time]')
          ParentFont = False
        end
      end
      object MasterData25: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 76.000000000000000000
        ParentFont = False
        Top = 612.283860000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODALLSOTRUDR
        DataSetName = 'ReportUPSVODALLSOTRUDR'
        RowCount = 0
        object Memo92: TfrxMemoView
          Width = 400.000000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1073#1088#1072#1083#1080' '#1074#1110#1076#1087#1091#1089#1090#1082#1080':')
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 397.700990000000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODALLSOTRUDR."COUNT_OTPUSK"]')
          VAlign = vaCenter
        end
        object Memo101: TfrxMemoView
          Left = 397.700990000000000000
          Top = 23.433070870000100000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODALLSOTRUDR."COUNT_OTPUSK_UCHEB"]')
          VAlign = vaCenter
        end
        object Memo102: TfrxMemoView
          Left = 397.700990000000000000
          Top = 46.866141730000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODALLSOTRUDR."COUNT_BOLNICH"]')
          VAlign = vaCenter
        end
        object Memo104: TfrxMemoView
          Top = 23.433070869999900000
          Width = 400.000000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1073#1088#1072#1083#1080' '#1085#1072#1074#1095'. '#1074#1110#1076#1087#1091#1089#1090#1082#1080':')
          VAlign = vaCenter
        end
        object Memo105: TfrxMemoView
          Top = 46.866141730000000000
          Width = 400.000000000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1073#1088#1072#1083#1080' '#1083#1110#1082#1072#1088#1085#1103#1085#1110':')
          VAlign = vaCenter
        end
      end
      object Footer13: TfrxFooter
        Top = 589.606680000000000000
        Width = 718.101251175000100000
        Stretched = True
        object Line4: TfrxLineView
          Width = 718.110000000000000000
          Frame.Typ = [ftTop]
        end
      end
      object MasterData31: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 42.330708670000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.101251175000100000
        DataSet = ReportMain
        DataSetName = 'ReportMain'
        RowCount = 0
        object Memo61: TfrxMemoView
          Left = 48.000000000000000000
          Width = 200.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1057#1091#1084#1072' '#1083#1110#1082#1072#1088#1085#1103#1085#1080#1093' ('#1084#1110#1089'.):')
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 247.937007870000000000
          Width = 261.921276930000000000
          Height = 23.433070870000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."SUM_BOLNICH"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 48.000000000000000000
          Top = 18.897637800000000000
          Width = 200.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          VAlign = vaCenter
        end
        object Memo473: TfrxMemoView
          Left = 247.937007870000000000
          Top = 18.897637800000000000
          Width = 261.921276930000000000
          Height = 23.433070870000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSZP."SUM_BOLNICH_Y"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
      end
      object MasterData34: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 86.929190000000000000
        ParentFont = False
        Top = 83.149660000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODFUNDSUD
        DataSetName = 'ReportUPSVODFUNDSUD'
        RowCount = 0
        object Memo67: TfrxMemoView
          Left = 247.937007870000000000
          Width = 261.921276930000000000
          Height = 23.433070870000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSUD."POD_NALOG"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 247.937007870000000000
          Top = 18.897637800000000000
          Width = 261.921276930000000000
          Height = 23.433070870000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSUD."POD_NALOG_WOMEN"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 48.000000000000000000
          Width = 200.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1055#1088#1080#1073#1091#1090#1082#1086#1074#1080#1081' '#1087#1086#1076#1072#1090#1086#1082' ('#1084#1110#1089'.):')
          VAlign = vaCenter
        end
        object Memo474: TfrxMemoView
          Left = 48.000000000000000000
          Top = 18.897637800000000000
          Width = 200.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1084#1110#1089'.):')
          VAlign = vaCenter
        end
        object Memo475: TfrxMemoView
          Left = 247.937007870000000000
          Top = 37.795275590000000000
          Width = 261.921276930000000000
          Height = 23.433070870000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSUD."POD_NALOG_Y"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo476: TfrxMemoView
          Left = 48.000000000000000000
          Top = 37.795275590000000000
          Width = 200.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          VAlign = vaCenter
        end
        object Memo483: TfrxMemoView
          Left = 247.937007870000000000
          Top = 56.692913390000000000
          Width = 261.921276930000000000
          Height = 23.433070870000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDSUD."POD_NALOG_YW"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo484: TfrxMemoView
          Left = 48.000000000000000000
          Top = 56.692913390000000000
          Width = 200.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportQuery'
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1088#1110#1082'):')
          VAlign = vaCenter
        end
      end
    end
    object Page8: TfrxReportPage
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      PrintOnPreviousPage = True
      object MasterData18: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 587.338651020000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.101251175000100000
        AllowSplit = True
        DataSet = ReportUPSVODCHISLPERSR
        DataSetName = 'ReportUPSVODCHISLPERSR'
        RowCount = 0
        Stretched = True
        object Memo254: TfrxMemoView
          Width = 337.889763779528000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1057#1087#1080#1089#1086#1095#1085#1072' '#1095#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo255: TfrxMemoView
          Left = 348.094488188976000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."SPISOK_CNT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo256: TfrxMemoView
          Top = 18.897637800000000000
          Width = 337.889763780000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo257: TfrxMemoView
          Left = 348.094488190000000000
          Top = 18.897637800000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."SPISOK_CNT_WOMEN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo258: TfrxMemoView
          Top = 105.826791180000000000
          Width = 337.889763780000000000
          Height = 18.900000000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1057#1077#1088#1077#1076#1085#1103' '#1095#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' '#1087#1077#1088#1089#1086#1085#1072#1083#1091' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo259: TfrxMemoView
          Left = 348.094488190000000000
          Top = 105.826791180000000000
          Width = 197.669266930000000000
          Height = 18.900000000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."SRED_PER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo260: TfrxMemoView
          Top = 200.314992360000000000
          Width = 511.565090000000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1063#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' '#1092#1110#1079'. '#1086#1089#1086#1073', '#1103#1082#1110' '#1087#1088#1072#1094#1102#1102#1090#1100' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' ('#1090#1088#1091#1076#1086#1074#1110#1081' '#1091#1075#1086#1076#1110')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo273: TfrxMemoView
          Left = 348.094488190000000000
          Top = 219.212630160000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."WORKERS_DOG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo274: TfrxMemoView
          Top = 124.724428980000000000
          Width = 337.889763780000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo285: TfrxMemoView
          Left = 348.094488190000000000
          Top = 124.724428980000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."SRED_PER_WOMAN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo286: TfrxMemoView
          Top = 275.905511811024000000
          Width = 511.565090000000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1063#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' '#1092#1110#1079'. '#1086#1089#1086#1073', '#1103#1082#1110' '#1087#1088#1072#1094#1102#1102#1090#1100' '#1087#1086' '#1082#1086#1085#1090#1088#1072#1082#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo382: TfrxMemoView
          Left = 348.094488190000000000
          Top = 294.803149606299000000
          Width = 197.669266930000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."WORKERS_CONTRACT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo383: TfrxMemoView
          Top = 419.527559060000000000
          Width = 337.706710000000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1045#1082#1074#1110#1074#1072#1083#1077#1085#1090' '#1087#1086#1074#1085#1086#1111' '#1079#1072#1081#1085#1103#1090#1086#1089#1090#1110' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo384: TfrxMemoView
          Left = 348.094488190000000000
          Top = 419.527559055118000000
          Width = 197.669266930000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."FULL_ZAN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo385: TfrxMemoView
          Top = 438.425196850394000000
          Width = 337.889763780000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo386: TfrxMemoView
          Left = 348.094488190000000000
          Top = 438.425196850394000000
          Width = 197.669266930000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."FULL_ZAN_WOMAN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo387: TfrxMemoView
          Top = 343.937007874016000000
          Width = 575.817100000000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              #1063#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' '#1092#1110#1079'. '#1086#1089#1086#1073', '#1103#1082#1110' '#1087#1088#1072#1094#1102#1102#1090#1100' '#1110' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' ('#1090#1088#1091#1076#1086#1074#1110#1081' '#1091#1075#1086#1076 +
              #1110'), '#1110' '#1087#1086' '#1082#1086#1085#1090#1088#1072#1082#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo388: TfrxMemoView
          Top = 37.795275590000000000
          Width = 337.889763780000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo533: TfrxMemoView
          Left = 348.094488190000000000
          Top = 37.795275590000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."SPISOK_CNT_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo534: TfrxMemoView
          Top = 143.622066770000000000
          Width = 337.889763780000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo535: TfrxMemoView
          Left = 348.094488190000000000
          Top = 143.622066770000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."SRED_PER_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo536: TfrxMemoView
          Top = 219.212630160000000000
          Width = 337.889763780000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1047#1072' '#1079#1074#1110#1090#1085#1110#1081' '#1084#1110#1089#1103#1094#1100' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo537: TfrxMemoView
          Left = 348.094488190000000000
          Top = 241.889920000000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."WORKERS_DOG_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo538: TfrxMemoView
          Top = 241.889920000000000000
          Width = 337.889763780000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1047#1072' '#1087#1077#1088#1110#1086#1076' '#1079' '#1087#1086#1095#1072#1090#1082#1091' '#1088#1086#1082#1091':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo539: TfrxMemoView
          Top = 294.803149606299000000
          Width = 337.889763780000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1047#1072' '#1079#1074#1110#1090#1085#1110#1081' '#1084#1110#1089#1103#1094#1100' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo540: TfrxMemoView
          Left = 348.094488190000000000
          Top = 313.700787401575000000
          Width = 197.669266930000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."WORKERS_CONTRACT_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo541: TfrxMemoView
          Top = 313.700787401575000000
          Width = 337.889763780000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1047#1072' '#1087#1077#1088#1110#1086#1076' '#1079' '#1087#1086#1095#1072#1090#1082#1091' '#1088#1086#1082#1091':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo542: TfrxMemoView
          Left = 348.094488190000000000
          Top = 362.834645669291000000
          Width = 197.669266930000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."WORKERS_DOG_CONT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo543: TfrxMemoView
          Top = 362.834645669291000000
          Width = 337.889763780000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1047#1072' '#1079#1074#1110#1090#1085#1110#1081' '#1084#1110#1089#1103#1094#1100' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo544: TfrxMemoView
          Left = 348.094488190000000000
          Top = 381.732283464567000000
          Width = 197.669266930000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."WORKERS_DOG_CONT_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo545: TfrxMemoView
          Top = 381.732283464567000000
          Width = 337.889763780000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1047#1072' '#1087#1077#1088#1110#1086#1076' '#1079' '#1087#1086#1095#1072#1090#1082#1091' '#1088#1086#1082#1091':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo546: TfrxMemoView
          Top = 457.322834650000000000
          Width = 337.889763780000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo547: TfrxMemoView
          Left = 348.094488190000000000
          Top = 457.322834645669000000
          Width = 197.669266930000000000
          Height = 18.897637800000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."FULL_ZAN_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo584: TfrxMemoView
          Top = 60.472480000000000000
          Width = 337.889763780000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1088#1110#1082'):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo585: TfrxMemoView
          Left = 348.094488190000000000
          Top = 60.472480000000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."SPISOK_CNT_WOMAN_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo686: TfrxMemoView
          Top = 166.299320000000000000
          Width = 337.706710000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1088#1110#1082'):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo687: TfrxMemoView
          Left = 348.125770000000000000
          Top = 166.299427400000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."SRED_PER_WOMAN_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo696: TfrxMemoView
          Top = 483.779840000000000000
          Width = 337.889763780000000000
          Height = 37.797650000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              #1057#1077#1088#1077#1076#1085#1100#1086#1089#1087#1080#1089#1086#1095#1085#1072' '#1095#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' '#1096#1090#1072#1090#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074'-'#1110#1085#1074#1072#1083#1110#1076#1110#1074' ('#1084 +
              #1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo697: TfrxMemoView
          Left = 348.094488190000000000
          Top = 502.677490000000000000
          Width = 197.669266930000000000
          Height = 18.900000000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."SHTAT_INV"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo698: TfrxMemoView
          Top = 521.575127800000000000
          Width = 337.889763780000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1084#1110#1089'.):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo784: TfrxMemoView
          Left = 348.094488190000000000
          Top = 521.575127800000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."SHTAT_INV_WOMEN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo785: TfrxMemoView
          Top = 540.472765590000000000
          Width = 337.889763780000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1079#1072' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo786: TfrxMemoView
          Left = 348.094488190000000000
          Top = 540.472765590000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."SHTAT_INV_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo787: TfrxMemoView
          Top = 563.150018820000000000
          Width = 337.706710000000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1046#1110#1085#1082#1080' ('#1088#1110#1082'):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo788: TfrxMemoView
          Left = 348.125770000000000000
          Top = 563.150126220000000000
          Width = 197.669266930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSR."SHTAT_INV_WOMEN_Y"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData19: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 744.567410000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODCHISLPERSONCATR
        DataSetName = 'ReportUPSVODCHISLPERSONCATR'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo390: TfrxMemoView
          Width = 415.748031500000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft]
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSONCATR."CATEGORY_NAME"]')
          VAlign = vaCenter
        end
        object Memo391: TfrxMemoView
          Left = 566.929133860000000000
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSONCATR."SRED_CHISL_Y"]')
          VAlign = vaCenter
        end
        object Memo549: TfrxMemoView
          Left = 415.748300000000000000
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODCHISLPERSONCATR."SRED_CHISL"]')
          VAlign = vaCenter
        end
      end
      object PageFooter9: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677165354330700000
        ParentFont = False
        Top = 873.071430000000000000
        Width = 718.101251175000100000
        object Memo419: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
        object Memo824: TfrxMemoView
          Left = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Date] ')
          ParentFont = False
        end
        object Memo825: TfrxMemoView
          Left = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Time]')
          ParentFont = False
        end
      end
      object Header15: TfrxHeader
        Height = 92.692950000000000000
        Top = 627.401980000000000000
        Width = 718.101251175000100000
        object Memo420: TfrxMemoView
          Top = 18.897637795275700000
          Width = 718.110236220000000000
          Height = 27.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1095#1080#1089#1077#1083#1100#1085#1086#1089#1090#1110' '#1087#1077#1088#1089#1086#1085#1072#1083#1091' '#1079#1072' '#1082#1072#1090#1077#1075#1086#1088#1110#1103#1084#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo422: TfrxMemoView
          Left = 567.086890000000000000
          Top = 49.133858270000100000
          Width = 151.181102360000000000
          Height = 46.015770000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1077#1088#1077#1076#1085#1103' '#1095#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' ('#1088#1110#1082')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo423: TfrxMemoView
          Top = 49.133858270000100000
          Width = 415.748031496063000000
          Height = 46.015770000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1082#1072#1090#1077#1075#1086#1088#1110#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo548: TfrxMemoView
          Left = 415.748300000000000000
          Top = 49.133889999999900000
          Width = 151.181102360000000000
          Height = 46.015770000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1077#1088#1077#1076#1085#1103' '#1095#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' ('#1084#1110#1089'.)')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer15: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 789.921770000000000000
        Width = 718.101251175000100000
        object Memo424: TfrxMemoView
          Left = 566.929133860000000000
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODCHISLPERSONCATR."SRED_CHISL_Y">,MasterData19)]')
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Width = 415.748031496063000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          VAlign = vaCenter
        end
        object Memo550: TfrxMemoView
          Left = 415.748031500000000000
          Width = 151.181102360000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODCHISLPERSONCATR."SRED_CHISL">,MasterData19)]')
          VAlign = vaCenter
        end
      end
    end
    object Page9: TfrxReportPage
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      PrintOnPreviousPage = True
      object PageFooter10: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677165354330700000
        ParentFont = False
        Top = 990.236860000000000000
        Width = 718.101251175000100000
        object Memo223: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
        object Memo826: TfrxMemoView
          Left = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Date] ')
          ParentFont = False
        end
        object Memo827: TfrxMemoView
          Left = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Time]')
          ParentFont = False
        end
      end
      object Header16: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 52.913420000000000000
        ParentFont = False
        Top = 377.953000000000000000
        Width = 718.101251175000100000
        object Memo225: TfrxMemoView
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1087#1086#1076#1110#1083' '#1096#1090#1072#1090#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074' '#1079#1072' '#1088#1086#1079#1084#1110#1088#1072#1084#1080' '#1079#1072#1088#1086#1073#1110#1090#1085#1086#1111' '#1087#1083#1072#1090#1080':')
          VAlign = vaCenter
        end
        object Memo226: TfrxMemoView
          Top = 24.000000000000000000
          Width = 718.110236220000000000
          Height = 22.677180000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportMain."PERIODS"]')
          ParentFont = False
        end
      end
      object MasterData21: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 453.543600000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODWORKERZP
        DataSetName = 'ReportUPSVODWORKERZP'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo227: TfrxMemoView
          Width = 83.149606300000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1074#1110#1076)
          VAlign = vaCenter
        end
        object Memo228: TfrxMemoView
          Left = 83.149660000000000000
          Width = 86.929133860000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODWORKERZP."MIN_VAL"]')
          VAlign = vaCenter
        end
        object Memo232: TfrxMemoView
          Left = 170.078850000000000000
          Width = 64.251968503937000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086)
          VAlign = vaCenter
        end
        object Memo233: TfrxMemoView
          Left = 234.330860000000000000
          Width = 112.472440940000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODWORKERZP."MAX_VAL"]')
          VAlign = vaCenter
        end
        object Memo235: TfrxMemoView
          Left = 346.803340000000000000
          Width = 64.251968500000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            ':')
          VAlign = vaCenter
        end
        object Memo236: TfrxMemoView
          Left = 411.055350000000000000
          Width = 61.606186930000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODWORKERZP."COUNT_WORKER"]')
          VAlign = vaCenter
        end
      end
      object MasterData28: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 574.488560000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODONWORKEXT
        DataSetName = 'ReportUPSVODONWORKEXT'
        RowCount = 0
        Stretched = True
        object Memo237: TfrxMemoView
          Width = 375.527646930000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1096#1090#1072#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1086#1090#1088#1080#1084#1072#1083#1080' '#1079'/'#1087' '#1074#1110#1076)
          VAlign = vaCenter
        end
        object Memo238: TfrxMemoView
          Left = 378.173470000000000000
          Width = 100.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODONWORKEXT."MIN_PAY"]')
          VAlign = vaCenter
        end
        object Memo239: TfrxMemoView
          Left = 478.205010000000000000
          Width = 24.251968500000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086)
          VAlign = vaCenter
        end
        object Memo240: TfrxMemoView
          Left = 502.457020000000000000
          Width = 100.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODONWORKEXT."MAX_PAY"]')
          VAlign = vaCenter
        end
        object Memo241: TfrxMemoView
          Left = 602.488560000000000000
          Width = 16.251968500000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            ':')
          VAlign = vaCenter
        end
        object Memo244: TfrxMemoView
          Left = 618.740570000000000000
          Width = 100.000000000000000000
          Height = 23.338590000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODONWORKEXT."WORKER_SHTAT_MINZP"]')
          VAlign = vaCenter
        end
      end
      object Header21: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 136.724490000000000000
        ParentFont = False
        Top = 619.842920000000000000
        Width = 718.101251175000100000
        Stretched = True
        object Memo619: TfrxMemoView
          Top = 7.559060000000040000
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1058#1072#1073#1083#1080#1094#1103' '#1086#1073#1083#1110#1082#1091' '#1092#1086#1085#1076#1091' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1072#1084#1080)
          VAlign = vaCenter
        end
        object Memo620: TfrxMemoView
          Top = 34.015770000000000000
          Width = 574.488096220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1079#1072' '#1090#1080#1078#1076#1077#1085#1100' ('#1074' '#1075#1086#1076#1080#1085#1072#1093') '#1087#1088#1080' 5 '#1088#1086#1073#1086#1095#1080#1093' '#1076#1085#1103#1093' : ')
          VAlign = vaCenter
        end
        object Memo621: TfrxMemoView
          Left = 578.268090000000000000
          Top = 34.015770000000000000
          Width = 137.196786930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportMain."WEEK_5DAY"]')
          VAlign = vaCenter
        end
        object Memo622: TfrxMemoView
          Top = 68.031540000000200000
          Width = 83.149606300000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
        object Memo623: TfrxMemoView
          Left = 215.433210000000000000
          Top = 68.031540000000200000
          Width = 147.401574800000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1079#1072' '#1084#1110#1089#1103#1094#1100' ('#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085')')
          VAlign = vaCenter
        end
        object Memo624: TfrxMemoView
          Left = 83.149660000000000000
          Top = 68.031540000000200000
          Width = 68.031496060000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050'-'#1090#1100' '#1088#1086#1073'. '#1076#1085#1110#1074)
          VAlign = vaCenter
        end
        object Memo625: TfrxMemoView
          Left = 362.834880000000000000
          Top = 68.031539999999900000
          Width = 219.212598430000000000
          Height = 45.000000000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1090#1088#1072#1090#1080' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' ('#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085')')
          VAlign = vaCenter
        end
        object Memo626: TfrxMemoView
          Left = 151.181200000000000000
          Top = 68.031539999999900000
          Width = 64.251968500000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1063#1080#1089#1077#1083#1100#1085' '#1087#1077#1088#1089'.')
          VAlign = vaCenter
        end
        object Memo627: TfrxMemoView
          Left = 582.047620000000000000
          Top = 68.031540000000200000
          Width = 136.062992130000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085)
          VAlign = vaCenter
        end
        object Memo628: TfrxMemoView
          Left = 362.834880000000000000
          Top = 113.385900000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1091#1089#1090#1082#1080)
          VAlign = vaCenter
        end
        object Memo629: TfrxMemoView
          Left = 468.661720000000000000
          Top = 113.385900000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1110#1082#1072#1088#1085#1103#1085#1110)
          VAlign = vaCenter
        end
      end
      object MasterData36: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 778.583180000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODFUNDALLR
        DataSetName = 'ReportUPSVODFUNDALLR'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo630: TfrxMemoView
          Width = 83.149606300000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDALLR."MONTHS"]')
          VAlign = vaCenter
        end
        object Memo631: TfrxMemoView
          Left = 83.149660000000000000
          Width = 68.031496060000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDALLR."DAYS"]')
          VAlign = vaCenter
        end
        object Memo632: TfrxMemoView
          Left = 362.834880000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDALLR."POTERI_TIME_OTP_ALL"]')
          VAlign = vaCenter
        end
        object Memo633: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.062992130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDALLR."OTRABOTANO_ALL"]')
          VAlign = vaCenter
        end
        object Memo634: TfrxMemoView
          Left = 468.661720000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDALLR."POTERI_TIME_BOLN_ALL"]')
          VAlign = vaCenter
        end
        object Memo635: TfrxMemoView
          Left = 151.181200000000000000
          Width = 64.251968500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDALLR."WORKERS_ALL"]')
          VAlign = vaCenter
        end
        object Memo636: TfrxMemoView
          Left = 215.433210000000000000
          Width = 147.401574800000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDALLR."FUND_TIME_ALL"]')
          VAlign = vaCenter
        end
      end
      object Footer18: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 103.811070000000000000
        ParentFont = False
        Top = 823.937540000000000000
        Width = 718.101251175000100000
        object Memo637: TfrxMemoView
          Width = 83.149606300000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1057#1068#1054#1043#1054)
          VAlign = vaCenter
        end
        object Memo638: TfrxMemoView
          Top = 34.456710000000000000
          Width = 332.598176220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085' ('#1079#1072' '#1087#1077#1088#1110#1086#1076'):')
          VAlign = vaCenter
        end
        object Memo639: TfrxMemoView
          Left = 83.149660000000000000
          Width = 68.031496060000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDALLR."DAYS">,MasterData36)]')
          VAlign = vaCenter
        end
        object Memo640: TfrxMemoView
          Left = 362.834880000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDALLR."POTERI_TIME_OTP_ALL">,MasterData36)]')
          VAlign = vaCenter
        end
        object Memo641: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.062992130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDALLR."OTRABOTANO_ALL">,MasterData36)]')
          VAlign = vaCenter
        end
        object Memo642: TfrxMemoView
          Left = 468.661720000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODFUNDALLR."POTERI_TIME_BOLN_ALL">,MasterData36)' +
              ']')
          VAlign = vaCenter
        end
        object Memo643: TfrxMemoView
          Left = 151.181200000000000000
          Width = 64.251968500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[AVG(<ReportUPSVODFUNDALLR."WORKERS_ALL">,MasterData36)]')
          VAlign = vaCenter
        end
        object Memo644: TfrxMemoView
          Left = 215.433210000000000000
          Width = 147.401574800000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDALLR."FUND_TIME_ALL">,MasterData36)]')
          VAlign = vaCenter
        end
        object Memo645: TfrxMemoView
          Left = 332.598640000000000000
          Top = 34.456710000000000000
          Width = 249.448892130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDALLR."OTRABOTANO_ALL">,MasterData36)]')
          VAlign = vaCenter
        end
        object Memo646: TfrxMemoView
          Top = 60.472480000000000000
          Width = 332.598176220000000000
          Height = 38.456710000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085' '#1078#1110#1085#1082#1072#1084#1080' ('#1079#1072' '#1087#1077#1088#1110#1086#1076'):')
          VAlign = vaCenter
        end
        object Memo647: TfrxMemoView
          Left = 332.598640000000000000
          Top = 60.472480000000000000
          Width = 249.448892130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODFUNDALLR."OTRABOTANO_WOMEN_ALL">,MasterData36)' +
              ']')
          VAlign = vaCenter
        end
      end
      object MasterData27: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 53.322820000000000000
        ParentFont = False
        Top = 498.897960000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODONWORKERSR
        DataSetName = 'ReportUPSVODONWORKERSR'
        RowCount = 0
        Stretched = True
        object Memo477: TfrxMemoView
          Top = 4.000000000000000000
          Width = 462.236366930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            #1042#1089#1100#1075#1086' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1087#1086#1074#1085#1110#1089#1090#1102' '#1074#1110#1076#1087#1088#1072#1094#1102#1074#1072#1083#1080' '#1087#1077#1088#1110#1086#1076':')
          VAlign = vaCenter
        end
        object Memo478: TfrxMemoView
          Left = 476.882190000000000000
          Top = 4.000000000000000000
          Width = 103.181016930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODONWORKERSR."WORKER_FULL"]')
          VAlign = vaCenter
        end
        object Memo479: TfrxMemoView
          Top = 27.433070869999900000
          Width = 478.236366930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Memo.Strings = (
            
              #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1096#1090#1072#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1087#1086#1074#1085#1110#1089#1090#1102' '#1074#1110#1076#1087#1088#1072#1094#1102#1074#1072#1083#1080' '#1087#1077#1088#1110#1086 +
              #1076':')
          VAlign = vaCenter
        end
        object Memo480: TfrxMemoView
          Left = 476.882190000000000000
          Top = 27.433070869999900000
          Width = 103.181016930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODONWORKERSR."WORKER_SHTAT_FULL"]')
          VAlign = vaCenter
        end
      end
      object Header14: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 156.724490000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.101251175000100000
        Stretched = True
        object Memo392: TfrxMemoView
          Top = 24.000000000000000000
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1058#1072#1073#1083#1080#1094#1103' '#1086#1073#1083#1110#1082#1091' '#1092#1086#1085#1076#1091' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1096#1090#1072#1090#1085#1080#1084#1080' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1072#1084#1080)
          VAlign = vaCenter
        end
        object Memo393: TfrxMemoView
          Top = 50.456710000000000000
          Width = 574.488096220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1079#1072' '#1090#1080#1078#1076#1077#1085#1100' ('#1074' '#1075#1086#1076#1080#1085#1072#1093') '#1087#1088#1080' 5 '#1088#1086#1073#1086#1095#1080#1093' '#1076#1085#1103#1093' : ')
          VAlign = vaCenter
        end
        object Memo394: TfrxMemoView
          Left = 578.268090000000000000
          Top = 50.456710000000000000
          Width = 137.196786930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            '[ReportMain."WEEK_5DAY"]')
          VAlign = vaCenter
        end
        object Memo395: TfrxMemoView
          Top = 88.031539999999900000
          Width = 83.149606300000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
        object Memo396: TfrxMemoView
          Left = 215.433210000000000000
          Top = 88.031539999999900000
          Width = 147.401574800000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1079#1072' '#1084#1110#1089#1103#1094#1100' ('#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085')')
          VAlign = vaCenter
        end
        object Memo397: TfrxMemoView
          Left = 83.149660000000000000
          Top = 88.031539999999900000
          Width = 68.031496060000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050'-'#1090#1100' '#1088#1086#1073'. '#1076#1085#1110#1074)
          VAlign = vaCenter
        end
        object Memo398: TfrxMemoView
          Left = 362.834880000000000000
          Top = 88.031539999999900000
          Width = 219.212598430000000000
          Height = 45.000000000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1090#1088#1072#1090#1080' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' ('#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085')')
          VAlign = vaCenter
        end
        object Memo399: TfrxMemoView
          Left = 151.181200000000000000
          Top = 88.031539999999900000
          Width = 64.251968500000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1063#1080#1089#1077#1083#1100#1085' '#1087#1077#1088#1089'.')
          VAlign = vaCenter
        end
        object Memo400: TfrxMemoView
          Left = 582.047620000000000000
          Top = 88.031539999999900000
          Width = 136.062992130000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085)
          VAlign = vaCenter
        end
        object Memo401: TfrxMemoView
          Left = 362.834880000000000000
          Top = 133.385900000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1091#1089#1090#1082#1080)
          VAlign = vaCenter
        end
        object Memo402: TfrxMemoView
          Left = 468.661720000000000000
          Top = 133.385900000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1110#1082#1072#1088#1085#1103#1085#1110)
          VAlign = vaCenter
        end
      end
      object MasterData20: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 200.315090000000000000
        Width = 718.101251175000100000
        DataSet = ReportUPSVODFUNDWTR
        DataSetName = 'ReportUPSVODFUNDWTR'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo403: TfrxMemoView
          Width = 83.149606300000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDWTR."MONTHS"]')
          VAlign = vaCenter
        end
        object Memo404: TfrxMemoView
          Left = 83.149660000000000000
          Width = 68.031496060000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDWTR."DAYS"]')
          VAlign = vaCenter
        end
        object Memo405: TfrxMemoView
          Left = 362.834880000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDWTR."POTERI_TIME_OTP"]')
          VAlign = vaCenter
        end
        object Memo406: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.062992130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDWTR."OBRABOTANO"]')
          VAlign = vaCenter
        end
        object Memo407: TfrxMemoView
          Left = 468.661720000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDWTR."POTERI_TIME_BOLN"]')
          VAlign = vaCenter
        end
        object Memo408: TfrxMemoView
          Left = 151.181200000000000000
          Width = 64.251968500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDWTR."WORKERS"]')
          VAlign = vaCenter
        end
        object Memo409: TfrxMemoView
          Left = 215.433210000000000000
          Width = 147.401574800000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODFUNDWTR."FUND_TIME"]')
          VAlign = vaCenter
        end
      end
      object Footer14: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 107.811070000000000000
        ParentFont = False
        Top = 245.669450000000000000
        Width = 718.101251175000100000
        Stretched = True
        object Memo410: TfrxMemoView
          Width = 83.149606300000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1057#1068#1054#1043#1054)
          VAlign = vaCenter
        end
        object Memo411: TfrxMemoView
          Top = 34.456710000000000000
          Width = 332.598176220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085' ('#1079#1072' '#1087#1077#1088#1110#1086#1076'):')
          VAlign = vaCenter
        end
        object Memo412: TfrxMemoView
          Left = 83.149660000000000000
          Width = 68.031496060000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDWTR."DAYS">,MasterData20)]')
          VAlign = vaCenter
        end
        object Memo413: TfrxMemoView
          Left = 362.834880000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDWTR."POTERI_TIME_OTP">,MasterData20)]')
          VAlign = vaCenter
        end
        object Memo414: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.062992130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDWTR."OBRABOTANO">,MasterData20)]')
          VAlign = vaCenter
        end
        object Memo415: TfrxMemoView
          Left = 468.661720000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDWTR."POTERI_TIME_BOLN">,MasterData20)]')
          VAlign = vaCenter
        end
        object Memo416: TfrxMemoView
          Left = 151.181200000000000000
          Width = 64.251968500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[AVG(<ReportUPSVODFUNDWTR."WORKERS">,MasterData20)]')
          VAlign = vaCenter
        end
        object Memo417: TfrxMemoView
          Left = 215.433210000000000000
          Width = 147.401574800000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDWTR."FUND_TIME">,MasterData20)]')
          VAlign = vaCenter
        end
        object Memo418: TfrxMemoView
          Left = 332.598640000000000000
          Top = 34.456710000000000000
          Width = 249.448892130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDWTR."OBRABOTANO">,MasterData20)]')
          VAlign = vaCenter
        end
        object Memo588: TfrxMemoView
          Top = 60.472480000000000000
          Width = 332.598176220000000000
          Height = 38.456710000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085' '#1078#1110#1085#1082#1072#1084#1080' ('#1079#1072' '#1087#1077#1088#1110#1086#1076'):')
          VAlign = vaCenter
        end
        object Memo589: TfrxMemoView
          Left = 332.598640000000000000
          Top = 60.472480000000000000
          Width = 249.448892130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODFUNDWTR."Obrabotano_Woman">,MasterData20)]')
          VAlign = vaCenter
        end
      end
    end
    object Page10: TfrxReportPage
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle5: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 149.070810000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo279: TfrxMemoView
          Width = 718.110236220000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1044' '#1054' '#1042' '#1030' '#1044' '#1050' '#1040'   '#8470'   1')
          ParentFont = False
        end
        object Memo280: TfrxMemoView
          Top = 30.236240000000000000
          Width = 374.173228350000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1072#1094#1102#1102#1090#1100' '#1079#1072' '#1089#1091#1084#1110#1089#1085#1080#1094#1090#1074#1086#1084' ('#1079#1086#1074#1085#1110#1096#1085#1077'):')
          VAlign = vaCenter
        end
        object Memo281: TfrxMemoView
          Left = 374.173470000000000000
          Top = 30.236240000000000000
          Width = 188.976377950000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODONWORKERSR."WORKER_EXT_SOVM"] '#1095#1086#1083'.')
          VAlign = vaCenter
        end
        object Memo330: TfrxMemoView
          Top = 52.913420000000000000
          Width = 374.173228346457000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1086#1087#1083#1072#1090#1080' '#1087#1088#1072#1094#1110' '#1089#1091#1084#1110#1089#1085#1080#1082#1110#1074':')
          VAlign = vaCenter
        end
        object Memo331: TfrxMemoView
          Left = 374.173470000000000000
          Top = 52.913420000000000000
          Width = 188.976377950000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODONWORKEXT."FUNDS_SOVM"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo332: TfrxMemoView
          Top = 75.590600000000000000
          Width = 374.173228346457000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1087#1083#1072#1090#1080' '#1095#1086#1088#1085#1086#1073#1080#1083#1100#1094#1103#1084':')
          VAlign = vaCenter
        end
        object Memo333: TfrxMemoView
          Left = 374.173470000000000000
          Top = 75.590600000000000000
          Width = 188.976377950000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODONWORKEXT."DOPLAT_CHERNOBIL"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo189: TfrxMemoView
          Top = 100.000000000000000000
          Width = 374.173228350000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1072' '#1076#1086#1087#1086#1084#1086#1075#1072' '#1091' '#1089#1082#1083#1072#1076#1110' '#1060#1054#1055':')
          VAlign = vaCenter
        end
        object Memo190: TfrxMemoView
          Left = 374.173470000000000000
          Top = 100.000000000000000000
          Width = 188.976377950000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODONWORKEXT."MAT_POM_V_FOP"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
        object Memo192: TfrxMemoView
          Top = 125.732220000000000000
          Width = 374.173228350000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1072' '#1076#1086#1087#1086#1084#1086#1075#1072' '#1085#1077' '#1074' '#1089#1082#1083#1072#1076#1110' '#1060#1054#1055':')
          VAlign = vaCenter
        end
        object Memo294: TfrxMemoView
          Left = 374.173470000000000000
          Top = 125.732220000000000000
          Width = 188.976377950000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODONWORKEXT."MAT_POM_VNE_FOP"] '#1075#1088#1085'.')
          VAlign = vaCenter
        end
      end
      object Header17: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 119.464610870000000000
        ParentFont = False
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        object Memo336: TfrxMemoView
          Top = 16.000000000000000000
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1044#1083#1103' '#1082#1086#1085#1090#1088#1086#1083#1102':')
          VAlign = vaCenter
        end
        object Memo337: TfrxMemoView
          Top = 50.015770000000000000
          Width = 83.149606300000000000
          Height = 69.360000000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
        object Memo338: TfrxMemoView
          Left = 434.645950000000000000
          Top = 50.015770000000000000
          Width = 284.598456930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1086#1087#1083#1072#1090#1080' '#1087#1088#1072#1094#1110' ('#1090#1080#1089'. '#1075#1088#1085'.)')
          VAlign = vaCenter
        end
        object Memo339: TfrxMemoView
          Left = 83.149660000000000000
          Top = 50.015770000000000000
          Width = 351.496062990000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050'-'#1090#1100' '#1089#1091#1084#1110#1089#1085#1080#1082#1110#1074)
          VAlign = vaCenter
        end
        object Memo340: TfrxMemoView
          Left = 434.645950000000000000
          Top = 73.448840870000000000
          Width = 139.842519690000000000
          Height = 46.015770000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1057#1068#1054#1043#1054)
          VAlign = vaCenter
        end
        object Memo341: TfrxMemoView
          Left = 83.149660000000000000
          Top = 73.448840870000000000
          Width = 178.000000000000000000
          Height = 46.015770000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072' '#1087#1077#1088#1096#1077' '#1095#1080#1089#1083#1086' '#1084#1110#1089#1103#1094#1103)
          VAlign = vaCenter
        end
        object Memo342: TfrxMemoView
          Left = 260.787570000000000000
          Top = 73.448840870000000000
          Width = 173.858267720000000000
          Height = 46.015770000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072' '#1086#1089#1090#1072#1085#1077' '#1095#1080#1089#1083#1086' '#1084#1110#1089#1103#1094#1103)
          VAlign = vaCenter
        end
        object Memo431: TfrxMemoView
          Left = 574.488560000000000000
          Top = 73.448840870000000000
          Width = 143.622047240000000000
          Height = 46.015770000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1072#1090'. '#1076#1086#1087#1086#1084#1086#1075#1072)
          VAlign = vaCenter
        end
      end
      object MasterData22: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 370.393940000000000000
        Width = 718.110700000000000000
        DataSet = ReportUPSVODWORKERSOVM
        DataSetName = 'ReportUPSVODWORKERSOVM'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo432: TfrxMemoView
          Width = 83.149606300000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODWORKERSOVM."MONTHS"]')
          VAlign = vaCenter
        end
        object Memo433: TfrxMemoView
          Left = 83.149660000000000000
          Width = 177.637682990000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODWORKERSOVM."COUNT_SOVM_FIRST"]')
          VAlign = vaCenter
        end
        object Memo434: TfrxMemoView
          Left = 434.645950000000000000
          Width = 139.842519690000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODWORKERSOVM."FUND_ALL"]')
          VAlign = vaCenter
        end
        object Memo435: TfrxMemoView
          Left = 574.488560000000000000
          Width = 143.622047240000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODWORKERSOVM."FUND_MATH_HELP"]')
          VAlign = vaCenter
        end
        object Memo436: TfrxMemoView
          Left = 260.787570000000000000
          Width = 173.858152990000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODWORKERSOVM."COUNT_SOVM_LAST"]')
          VAlign = vaCenter
        end
      end
      object Header18: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 152.504020000000000000
        ParentFont = False
        Top = 438.425480000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo437: TfrxMemoView
          Top = 16.000000000000000000
          Width = 718.110236220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1058#1072#1073#1083#1080#1094#1103' '#1086#1073#1083#1110#1082#1091' '#1092#1086#1085#1076#1091' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1079#1086#1074#1085#1110#1096#1085#1110#1084#1080' '#1089#1091#1084#1110#1089#1085#1080#1082#1072#1084#1080)
          VAlign = vaCenter
        end
        object Memo438: TfrxMemoView
          Top = 42.456710000000000000
          Width = 574.488096220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1079#1072' '#1090#1080#1078#1076#1077#1085#1100' ('#1074' '#1075#1086#1076#1080#1085#1072#1093') '#1087#1088#1080' 5 '#1088#1086#1073#1086#1095#1080#1093' '#1076#1085#1103#1093' : ')
          VAlign = vaCenter
        end
        object Memo439: TfrxMemoView
          Left = 578.268090000000000000
          Top = 42.456710000000000000
          Width = 137.196786930000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[ReportMain."WEEK_5DAY"]')
          VAlign = vaCenter
        end
        object Memo440: TfrxMemoView
          Top = 83.811070000000000000
          Width = 83.149606300000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          VAlign = vaCenter
        end
        object Memo441: TfrxMemoView
          Left = 215.433210000000000000
          Top = 83.811070000000000000
          Width = 147.401574800000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' '#1079#1072' '#1084#1110#1089#1103#1094#1100' ('#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085')')
          VAlign = vaCenter
        end
        object Memo442: TfrxMemoView
          Left = 83.149660000000000000
          Top = 83.811070000000000000
          Width = 68.031496060000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050'-'#1090#1100' '#1088#1086#1073'. '#1076#1085#1110#1074)
          VAlign = vaCenter
        end
        object Memo443: TfrxMemoView
          Left = 362.834880000000000000
          Top = 83.811070000000000000
          Width = 219.212598430000000000
          Height = 45.000000000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1090#1088#1072#1090#1080' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091' ('#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085')')
          VAlign = vaCenter
        end
        object Memo444: TfrxMemoView
          Left = 151.181200000000000000
          Top = 83.811070000000000000
          Width = 64.251968500000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1063#1080#1089#1077#1083#1100#1085' '#1087#1077#1088#1089'.')
          VAlign = vaCenter
        end
        object Memo445: TfrxMemoView
          Left = 582.047620000000000000
          Top = 83.811070000000000000
          Width = 136.062992130000000000
          Height = 68.692950000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085)
          VAlign = vaCenter
        end
        object Memo446: TfrxMemoView
          Left = 362.834880000000000000
          Top = 129.165430000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1091#1089#1090#1082#1080)
          VAlign = vaCenter
        end
        object Memo447: TfrxMemoView
          Left = 468.661720000000000000
          Top = 129.165430000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1051#1110#1082#1072#1088#1085#1103#1085#1110)
          VAlign = vaCenter
        end
      end
      object MasterData23: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 23.338590000000000000
        ParentFont = False
        Top = 612.283860000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData23OnBeforePrint'
        DataSet = ReportUPSVODEXTSOVMR
        DataSetName = 'ReportUPSVODEXTSOVMR'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo448: TfrxMemoView
          Width = 83.149603860000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODEXTSOVMR."MONTHS"]')
          VAlign = vaCenter
        end
        object Memo449: TfrxMemoView
          Left = 83.149660000000000000
          Width = 68.031496060000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODEXTSOVMR."DAYS"]')
          VAlign = vaCenter
        end
        object Memo450: TfrxMemoView
          Left = 362.834880000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODEXTSOVMR."POTERI_TIME_OTP"]')
          VAlign = vaCenter
        end
        object Memo451: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.062992130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODEXTSOVMR."OBRABOTANO"]')
          VAlign = vaCenter
        end
        object Memo452: TfrxMemoView
          Left = 468.661720000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODEXTSOVMR."POTERI_TIME_BOLN"]')
          VAlign = vaCenter
        end
        object Memo453: TfrxMemoView
          Left = 151.181200000000000000
          Width = 64.251968500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODEXTSOVMR."WORKERS"]')
          VAlign = vaCenter
        end
        object Memo454: TfrxMemoView
          Left = 215.433210000000000000
          Width = 147.401574800000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODEXTSOVMR."FUND_TIME"]')
          VAlign = vaCenter
        end
      end
      object Footer17: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 114.047310000000000000
        ParentFont = False
        Top = 657.638220000000000000
        Width = 718.110700000000000000
        object Memo455: TfrxMemoView
          Width = 83.149606300000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1057#1068#1054#1043#1054)
          VAlign = vaCenter
        end
        object Memo456: TfrxMemoView
          Left = 83.149660000000000000
          Width = 68.031496060000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODEXTSOVMR."DAYS">,MasterData23)]')
          VAlign = vaCenter
        end
        object Memo457: TfrxMemoView
          Left = 362.834880000000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODEXTSOVMR."POTERI_TIME_OTP">,MasterData23)]')
          VAlign = vaCenter
        end
        object Memo458: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.062992130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODEXTSOVMR."OBRABOTANO">,MasterData23)]')
          VAlign = vaCenter
        end
        object Memo459: TfrxMemoView
          Left = 468.661720000000000000
          Width = 113.385826770000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODEXTSOVMR."POTERI_TIME_BOLN">,MasterData23)]')
          VAlign = vaCenter
        end
        object Memo460: TfrxMemoView
          Left = 151.181200000000000000
          Width = 64.251968500000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[AVG(<ReportUPSVODEXTSOVMR."WORKERS">,MasterData23)]')
          VAlign = vaCenter
        end
        object Memo461: TfrxMemoView
          Left = 215.433210000000000000
          Width = 147.401574800000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODEXTSOVMR."FUND_TIME">,MasterData23)]')
          VAlign = vaCenter
        end
        object Memo661: TfrxMemoView
          Top = 37.795300000000000000
          Width = 332.598176220000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085' ('#1079#1072' '#1087#1077#1088#1110#1086#1076'):')
          VAlign = vaCenter
        end
        object Memo662: TfrxMemoView
          Left = 332.598640000000000000
          Top = 37.795300000000000000
          Width = 249.448892130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODEXTSOVMR."OBRABOTANO">,MasterData23)]')
          VAlign = vaCenter
        end
        object Memo663: TfrxMemoView
          Top = 63.811070000000000000
          Width = 332.598176220000000000
          Height = 38.456710000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1083#1102#1076#1080#1085#1086'-'#1075#1086#1076#1080#1085' '#1078#1110#1085#1082#1072#1084#1080' ('#1079#1072' '#1087#1077#1088#1110#1086#1076'):')
          VAlign = vaCenter
        end
        object Memo664: TfrxMemoView
          Left = 332.598640000000000000
          Top = 63.811070000000000000
          Width = 249.448892130000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportUPSVODEXTSOVMR."OTRABOTANO_WOMEN">,MasterData23)]')
          VAlign = vaCenter
        end
      end
      object PageFooter11: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677165354330700000
        ParentFont = False
        Top = 831.496600000000000000
        Width = 718.110700000000000000
        object Memo462: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
        object Memo828: TfrxMemoView
          Left = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Date] ')
          ParentFont = False
        end
        object Memo829: TfrxMemoView
          Left = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Time]')
          ParentFont = False
        end
      end
      object Footer7: TfrxFooter
        Top = 415.748300000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Line2: TfrxLineView
          Width = 718.110000000000000000
          Frame.Typ = [ftTop]
        end
      end
    end
    object Page11: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle3: TfrxReportTitle
        Height = 141.354391730000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo243: TfrxMemoView
          Top = 31.559060000000000000
          Width = 1046.929346220000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1074#1110#1090' [ReportMain."periods"]')
          ParentFont = False
        end
        object Memo245: TfrxMemoView
          Top = 3.779530000000000000
          Width = 1046.929346220000000000
          Height = 26.677180000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1096#1090#1072#1090#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074' '#1110' '#1079#1086#1074#1085#1110#1096#1085#1110#1093' '#1089#1091#1084#1110#1089#1085 +
              #1080#1082#1110#1074)
          ParentFont = False
        end
        object Memo158: TfrxMemoView
          Top = 82.488250000000000000
          Width = 45.354330710000000000
          Height = 58.866141730000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo159: TfrxMemoView
          Left = 45.354330710000000000
          Top = 82.488250000000000000
          Width = 45.354330710000000000
          Height = 58.866141730000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1076' '#1086#1087#1083)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo160: TfrxMemoView
          Left = 90.708663860000000000
          Top = 82.488250000000000000
          Width = 279.685039370000000000
          Height = 58.866141730000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1074#1080#1076#1091' '#1086#1087#1083#1072#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo165: TfrxMemoView
          Left = 423.307360000000000000
          Top = 82.488250000000000000
          Width = 207.874015750000000000
          Height = 35.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1096#1090#1072#1090#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo166: TfrxMemoView
          Left = 631.181510000000000000
          Top = 82.488250000000000000
          Width = 207.874015750000000000
          Height = 35.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1079#1086#1074#1085#1110#1096#1085#1110#1093' '#1089#1091#1084#1110#1089#1085#1080#1082#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo167: TfrxMemoView
          Left = 839.055660000000000000
          Top = 82.488250000000000000
          Width = 207.874015750000000000
          Height = 35.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo169: TfrxMemoView
          Left = 423.307360000000000000
          Top = 117.921320870000000000
          Width = 102.047244090000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo170: TfrxMemoView
          Left = 525.354670000000000000
          Top = 117.921320870000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1079' '#1085#1080#1093' '#1078#1110#1085#1086#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo171: TfrxMemoView
          Left = 631.181510000000000000
          Top = 117.921320870000000000
          Width = 102.047244090000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo203: TfrxMemoView
          Left = 733.228820000000000000
          Top = 117.921320870000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1079' '#1085#1080#1093' '#1078#1110#1085#1086#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo204: TfrxMemoView
          Left = 839.055660000000000000
          Top = 117.921320870000000000
          Width = 102.047244090000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo205: TfrxMemoView
          Left = 941.102970000000000000
          Top = 117.921320870000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1079' '#1085#1080#1093' '#1078#1110#1085#1086#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo597: TfrxMemoView
          Left = 370.393940000000000000
          Top = 82.393700790000000000
          Width = 52.913205200000000000
          Height = 58.866141730000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1089#1090'. '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData12: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 17.007874020000000000
        ParentFont = False
        Top = 264.567100000000000000
        Width = 1046.929810000000000000
        DataSet = ReportUPSVODRASHNACH
        DataSetName = 'ReportUPSVODRASHNACH'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo247: TfrxMemoView
          Left = 525.354670000000000000
          Width = 105.826771650000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNACH."NACHISL_SHTAT_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo248: TfrxMemoView
          Left = 733.228820000000000000
          Width = 105.826771650000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNACH."NACHISL_EXT_SOVM_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo249: TfrxMemoView
          Left = 839.055660000000000000
          Width = 102.047244090000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNACH."ITOGO"]')
          VAlign = vaCenter
        end
        object Memo250: TfrxMemoView
          Left = 941.102970000000000000
          Width = 105.826771650000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNACH."ITOGO_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo261: TfrxMemoView
          Left = 631.181510000000000000
          Width = 102.047244090000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNACH."NACHISL_EXT_SOVM_ALL"]')
          VAlign = vaCenter
        end
        object Memo262: TfrxMemoView
          Left = 423.307360000000000000
          Width = 102.047244090000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNACH."NACHISL_SHTAT_ALL"]')
          VAlign = vaCenter
        end
        object Memo263: TfrxMemoView
          Left = 90.708720000000000000
          Width = 279.685039370000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          Memo.Strings = (
            '[ReportUPSVODRASHNACH."NAME_VID_OPLAT"]')
          VAlign = vaCenter
        end
        object Memo264: TfrxMemoView
          Left = 45.354360000000000000
          Width = 45.354330710000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNACH."VID"]')
          VAlign = vaCenter
        end
        object Memo265: TfrxMemoView
          Width = 45.354330710000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNACH."FUND"]')
          VAlign = vaCenter
        end
        object Memo598: TfrxMemoView
          Left = 370.393940000000000000
          Width = 52.913205200000000000
          Height = 17.007874015748000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODRASHNACH."NAME_WORK_REASON"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter6: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677165350000000000
        ParentFont = False
        Top = 725.669760000000000000
        Width = 1046.929810000000000000
        object Memo266: TfrxMemoView
          Left = 963.780150000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
        object Memo830: TfrxMemoView
          Left = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Date] ')
          ParentFont = False
        end
        object Memo831: TfrxMemoView
          Left = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Time]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 17.007874020000000000
        ParentFont = False
        Top = 347.716760000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo69: TfrxMemoView
          Left = 90.708720000000000000
          Width = 332.598425200000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1079#1072' '#1092#1086#1085#1076#1086#1084)
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 525.354670000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNACH."NACHISL_SHTAT_WOMAN">,MasterData12)]')
          VAlign = vaCenter
        end
        object Memo134: TfrxMemoView
          Left = 733.228820000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODRASHNACH."NACHISL_EXT_SOVM_WOMAN">,MasterData1' +
              '2)]')
          VAlign = vaCenter
        end
        object Memo137: TfrxMemoView
          Left = 839.055660000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNACH."ITOGO">,MasterData12)]')
          VAlign = vaCenter
        end
        object Memo180: TfrxMemoView
          Left = 941.102970000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNACH."ITOGO_WOMAN">,MasterData12)]')
          VAlign = vaCenter
        end
        object Memo182: TfrxMemoView
          Left = 631.181510000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODRASHNACH."NACHISL_EXT_SOVM_ALL">,MasterData12)' +
              ']')
          VAlign = vaCenter
        end
        object Memo183: TfrxMemoView
          Left = 423.307360000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNACH."NACHISL_SHTAT_ALL">,MasterData12)]')
          VAlign = vaCenter
        end
        object Memo184: TfrxMemoView
          Left = 45.354360000000000000
          Width = 45.354330710000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo185: TfrxMemoView
          Width = 45.354330710000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNACH."FUND"]')
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Top = 219.212740000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportUPSVODRASHNACH."FUND"'
      end
      object Header19: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 104.220501730000000000
        ParentFont = False
        Top = 389.291590000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo551: TfrxMemoView
          Top = 11.338590000000000000
          Width = 1046.929346220000000000
          Height = 34.236240000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1096#1090#1072#1090#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074' '#1110' '#1079#1086#1074#1085#1110#1096#1085#1110#1093' '#1089#1091#1084#1110#1089#1085 +
              #1080#1082#1110#1074' '#1079#1072' '#1085#1077#1074#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1080#1081' '#1095#1072#1089)
          ParentFont = False
        end
        object Memo552: TfrxMemoView
          Top = 45.354360000000000000
          Width = 45.354330710000000000
          Height = 58.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076)
          VAlign = vaCenter
        end
        object Memo553: TfrxMemoView
          Left = 45.354330710000000000
          Top = 45.354360000000000000
          Width = 45.354330710000000000
          Height = 58.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1076' '#1086#1087#1083)
          VAlign = vaCenter
        end
        object Memo554: TfrxMemoView
          Left = 90.708663860000000000
          Top = 45.354360000000000000
          Width = 279.685005200000000000
          Height = 58.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1074#1080#1076#1091' '#1086#1087#1083#1072#1090)
          VAlign = vaCenter
        end
        object Memo555: TfrxMemoView
          Left = 423.307360000000000000
          Top = 45.354360000000000000
          Width = 207.874015750000000000
          Height = 35.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1096#1090#1072#1090#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074)
          VAlign = vaCenter
        end
        object Memo556: TfrxMemoView
          Left = 631.181510000000000000
          Top = 45.354360000000000000
          Width = 207.874015750000000000
          Height = 35.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1079#1086#1074#1085#1110#1096#1085#1110#1093' '#1089#1091#1084#1110#1089#1085#1080#1082#1110#1074)
          VAlign = vaCenter
        end
        object Memo557: TfrxMemoView
          Left = 839.055660000000000000
          Top = 45.354360000000000000
          Width = 207.874015750000000000
          Height = 35.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          VAlign = vaCenter
        end
        object Memo558: TfrxMemoView
          Left = 423.307360000000000000
          Top = 80.787430870000000000
          Width = 102.047244090000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          VAlign = vaCenter
        end
        object Memo559: TfrxMemoView
          Left = 525.354670000000000000
          Top = 80.787430870000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1079' '#1085#1080#1093' '#1078#1110#1085#1086#1082)
          VAlign = vaCenter
        end
        object Memo560: TfrxMemoView
          Left = 631.181510000000000000
          Top = 80.787430870000000000
          Width = 102.047244090000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          VAlign = vaCenter
        end
        object Memo561: TfrxMemoView
          Left = 733.228820000000000000
          Top = 80.787430870000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1079' '#1085#1080#1093' '#1078#1110#1085#1086#1082)
          VAlign = vaCenter
        end
        object Memo562: TfrxMemoView
          Left = 839.055660000000000000
          Top = 80.787430870000000000
          Width = 102.047244090000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          VAlign = vaCenter
        end
        object Memo563: TfrxMemoView
          Left = 941.102970000000000000
          Top = 80.787430870000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1079' '#1085#1080#1093' '#1078#1110#1085#1086#1082)
          VAlign = vaCenter
        end
        object Memo595: TfrxMemoView
          Left = 370.393940000000000000
          Top = 45.354360000000000000
          Width = 52.913205200000000000
          Height = 58.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1089#1090'. '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080)
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Top = 517.795610000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportUPSVODRASHNEO."FUND"'
      end
      object GroupFooter2: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 17.007874015748000000
        ParentFont = False
        Top = 646.299630000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo573: TfrxMemoView
          Left = 90.708720000000000000
          Width = 332.598425200000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1079#1072' '#1092#1086#1085#1076#1086#1084)
          VAlign = vaCenter
        end
        object Memo574: TfrxMemoView
          Left = 525.354670000000000000
          Width = 105.826771650000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNEO."NACHISL_SHTAT_WOMAN">,MasterData32)]')
          VAlign = vaCenter
        end
        object Memo575: TfrxMemoView
          Left = 733.228820000000000000
          Width = 105.826771650000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODRASHNEO."NACHISL_EXT_SOVM_WOMAN">,MasterData32' +
              ')]')
          VAlign = vaCenter
        end
        object Memo576: TfrxMemoView
          Left = 839.055660000000000000
          Width = 102.047244090000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNEO."ITOGO">,MasterData32)]')
          VAlign = vaCenter
        end
        object Memo577: TfrxMemoView
          Left = 941.102970000000000000
          Width = 105.826771650000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNEO."ITOGO_WOMAN">,MasterData32)]')
          VAlign = vaCenter
        end
        object Memo578: TfrxMemoView
          Left = 631.181510000000000000
          Width = 102.047244090000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNEO."NACHISL_EXT_SOVM_ALL">,MasterData32)]')
          VAlign = vaCenter
        end
        object Memo579: TfrxMemoView
          Left = 423.307360000000000000
          Width = 102.047244090000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNEO."NACHISL_SHTAT_ALL">,MasterData32)]')
          VAlign = vaCenter
        end
        object Memo580: TfrxMemoView
          Left = 45.354360000000000000
          Width = 45.354330710000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo581: TfrxMemoView
          Width = 45.354330710000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNEO."FUND"]')
          VAlign = vaCenter
        end
      end
      object MasterData32: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 17.007874020000000000
        ParentFont = False
        Top = 563.149970000000000000
        Width = 1046.929810000000000000
        DataSet = ReportUPSVODRASHNEO
        DataSetName = 'ReportUPSVODRASHNEO'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo564: TfrxMemoView
          Left = 525.354670000000000000
          Width = 105.826771650000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNEO."NACHISL_SHTAT_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo565: TfrxMemoView
          Left = 733.228820000000000000
          Width = 105.826771650000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNEO."NACHISL_EXT_SOVM_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo566: TfrxMemoView
          Left = 839.055660000000000000
          Width = 102.047244090000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNEO."ITOGO"]')
          VAlign = vaCenter
        end
        object Memo567: TfrxMemoView
          Left = 941.102970000000000000
          Width = 105.826771650000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNEO."ITOGO_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo568: TfrxMemoView
          Left = 631.181510000000000000
          Width = 102.047244090000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNEO."NACHISL_EXT_SOVM_ALL"]')
          VAlign = vaCenter
        end
        object Memo569: TfrxMemoView
          Left = 423.307360000000000000
          Width = 102.047244090000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNEO."NACHISL_SHTAT_ALL"]')
          VAlign = vaCenter
        end
        object Memo570: TfrxMemoView
          Left = 90.708720000000000000
          Width = 279.685039370000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          Memo.Strings = (
            '[ReportUPSVODRASHNEO."NAME_VID_OPLAT"]')
          VAlign = vaCenter
        end
        object Memo571: TfrxMemoView
          Left = 45.354360000000000000
          Width = 45.354330710000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNEO."VID"]')
          VAlign = vaCenter
        end
        object Memo572: TfrxMemoView
          Width = 45.354330710000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNEO."FUND"]')
          VAlign = vaCenter
        end
        object Memo596: TfrxMemoView
          Left = 370.393940000000000000
          Width = 52.913205200000000000
          Height = 17.007874015748000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODRASHNEO."NAME_WORK_REASON"]')
          VAlign = vaCenter
        end
      end
      object GroupFooter3: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 17.007874020000000000
        ParentFont = False
        Top = 306.141930000000000000
        Width = 1046.929810000000000000
        object Memo666: TfrxMemoView
          Left = 90.708720000000000000
          Width = 332.598425200000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1079#1072' '#1074#1080#1076#1086#1084' '#1086#1087#1083#1072#1090#1080)
          VAlign = vaCenter
        end
        object Memo667: TfrxMemoView
          Left = 525.354670000000000000
          Width = 105.826771650000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNACH."NACHISL_SHTAT_WOMAN">,MasterData12)]')
          VAlign = vaCenter
        end
        object Memo668: TfrxMemoView
          Left = 733.228820000000000000
          Width = 105.826771650000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODRASHNACH."NACHISL_EXT_SOVM_WOMAN">,MasterData1' +
              '2)]')
          VAlign = vaCenter
        end
        object Memo669: TfrxMemoView
          Left = 839.055660000000000000
          Width = 102.047244090000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNACH."ITOGO">,MasterData12)]')
          VAlign = vaCenter
        end
        object Memo670: TfrxMemoView
          Left = 941.102970000000000000
          Width = 105.826771650000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNACH."ITOGO_WOMAN">,MasterData12)]')
          VAlign = vaCenter
        end
        object Memo671: TfrxMemoView
          Left = 631.181510000000000000
          Width = 102.047244090000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODRASHNACH."NACHISL_EXT_SOVM_ALL">,MasterData12)' +
              ']')
          VAlign = vaCenter
        end
        object Memo672: TfrxMemoView
          Left = 423.307360000000000000
          Width = 102.047244090000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNACH."NACHISL_SHTAT_ALL">,MasterData12)]')
          VAlign = vaCenter
        end
        object Memo673: TfrxMemoView
          Left = 45.354360000000000000
          Width = 45.354330710000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNACH."VID"]')
          VAlign = vaCenter
        end
        object Memo674: TfrxMemoView
          Width = 45.354330710000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNACH."FUND"]')
          VAlign = vaCenter
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Top = 241.889920000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportUPSVODRASHNACH."VID"'
      end
      object GroupHeader4: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Top = 540.472790000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportUPSVODRASHNEO."VID"'
      end
      object GroupFooter4: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 17.007874015748000000
        ParentFont = False
        Top = 604.724800000000000000
        Width = 1046.929810000000000000
        object Memo675: TfrxMemoView
          Left = 90.708720000000000000
          Width = 332.598425200000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1079#1072' '#1074#1080#1076#1086#1084' '#1086#1087#1083#1072#1090#1080)
          VAlign = vaCenter
        end
        object Memo676: TfrxMemoView
          Left = 525.354670000000000000
          Width = 105.826771650000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNEO."NACHISL_SHTAT_WOMAN">,MasterData32)]')
          VAlign = vaCenter
        end
        object Memo677: TfrxMemoView
          Left = 733.228820000000000000
          Width = 105.826771650000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODRASHNEO."NACHISL_EXT_SOVM_WOMAN">,MasterData32' +
              ')]')
          VAlign = vaCenter
        end
        object Memo678: TfrxMemoView
          Left = 839.055660000000000000
          Width = 102.047244090000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNEO."ITOGO">,MasterData32)]')
          VAlign = vaCenter
        end
        object Memo679: TfrxMemoView
          Left = 941.102970000000000000
          Width = 105.826771650000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNEO."ITOGO_WOMAN">,MasterData32)]')
          VAlign = vaCenter
        end
        object Memo680: TfrxMemoView
          Left = 631.181510000000000000
          Width = 102.047244090000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNEO."NACHISL_EXT_SOVM_ALL">,MasterData32)]')
          VAlign = vaCenter
        end
        object Memo681: TfrxMemoView
          Left = 423.307360000000000000
          Width = 102.047244090000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHNEO."NACHISL_SHTAT_ALL">,MasterData32)]')
          VAlign = vaCenter
        end
        object Memo682: TfrxMemoView
          Left = 45.354360000000000000
          Width = 45.354330710000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNEO."VID"]')
          VAlign = vaCenter
        end
        object Memo683: TfrxMemoView
          Width = 45.354330710000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHNEO."FUND"]')
          VAlign = vaCenter
        end
      end
    end
    object Page12: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      PrintOnPreviousPage = True
      object MasterData38: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 17.007874020000000000
        ParentFont = False
        Top = 226.771800000000000000
        Width = 1046.929810000000000000
        DataSet = ReportUPSVODRASHPPS
        DataSetName = 'ReportUPSVODRASHPPS'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo699: TfrxMemoView
          Left = 525.354670000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPPS."NACHISL_SHTAT_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo700: TfrxMemoView
          Left = 733.228820000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPPS."NACHISL_EXT_SOVM_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo701: TfrxMemoView
          Left = 839.055660000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPPS."ITOGO"]')
          VAlign = vaCenter
        end
        object Memo702: TfrxMemoView
          Left = 941.102970000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPPS."ITOGO_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo703: TfrxMemoView
          Left = 631.181510000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPPS."NACHISL_EXT_SOVM_ALL"]')
          VAlign = vaCenter
        end
        object Memo704: TfrxMemoView
          Left = 423.307360000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPPS."NACHISL_SHTAT_ALL"]')
          VAlign = vaCenter
        end
        object Memo705: TfrxMemoView
          Left = 90.708720000000000000
          Width = 279.685039370000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          Memo.Strings = (
            '[ReportUPSVODRASHPPS."NAME_VID_OPLAT"]')
          VAlign = vaCenter
        end
        object Memo706: TfrxMemoView
          Left = 45.354360000000000000
          Width = 45.354330710000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPPS."VID"]')
          VAlign = vaCenter
        end
        object Memo707: TfrxMemoView
          Width = 45.354330710000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPPS."FUND"]')
          VAlign = vaCenter
        end
        object Memo708: TfrxMemoView
          Left = 370.393940000000000000
          Width = 52.913205200000000000
          Height = 17.007874020000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODRASHPPS."NAME_WORK_REASON"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter5: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 17.007874020000000000
        ParentFont = False
        Top = 309.921460000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo709: TfrxMemoView
          Left = 90.708720000000000000
          Width = 332.598425200000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1079#1072' '#1092#1086#1085#1076#1086#1084)
          VAlign = vaCenter
        end
        object Memo710: TfrxMemoView
          Left = 525.354670000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPPS."NACHISL_SHTAT_WOMAN">,MasterData38)]')
          VAlign = vaCenter
        end
        object Memo711: TfrxMemoView
          Left = 733.228820000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODRASHPPS."NACHISL_EXT_SOVM_WOMAN">,MasterData38' +
              ')]')
          VAlign = vaCenter
        end
        object Memo712: TfrxMemoView
          Left = 839.055660000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPPS."ITOGO">,MasterData38)]')
          VAlign = vaCenter
        end
        object Memo713: TfrxMemoView
          Left = 941.102970000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPPS."ITOGO_WOMAN">,MasterData38)]')
          VAlign = vaCenter
        end
        object Memo714: TfrxMemoView
          Left = 631.181510000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPPS."NACHISL_EXT_SOVM_ALL">,MasterData38)]')
          VAlign = vaCenter
        end
        object Memo715: TfrxMemoView
          Left = 423.307360000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPPS."NACHISL_SHTAT_ALL">,MasterData38)]')
          VAlign = vaCenter
        end
        object Memo716: TfrxMemoView
          Left = 45.354360000000000000
          Width = 45.354330710000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo717: TfrxMemoView
          Width = 45.354330710000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPPS."FUND"]')
          VAlign = vaCenter
        end
      end
      object GroupHeader5: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Top = 181.417440000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportUPSVODRASHPPS."FUND"'
      end
      object GroupFooter6: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 17.007874020000000000
        ParentFont = False
        Top = 268.346630000000000000
        Width = 1046.929810000000000000
        object Memo718: TfrxMemoView
          Left = 90.708720000000000000
          Width = 332.598425200000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1079#1072' '#1074#1080#1076#1086#1084' '#1086#1087#1083#1072#1090#1080)
          VAlign = vaCenter
        end
        object Memo719: TfrxMemoView
          Left = 525.354670000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPPS."NACHISL_SHTAT_WOMAN">,MasterData38)]')
          VAlign = vaCenter
        end
        object Memo720: TfrxMemoView
          Left = 733.228820000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODRASHPPS."NACHISL_EXT_SOVM_WOMAN">,MasterData38' +
              ')]')
          VAlign = vaCenter
        end
        object Memo721: TfrxMemoView
          Left = 839.055660000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPPS."ITOGO">,MasterData38)]')
          VAlign = vaCenter
        end
        object Memo722: TfrxMemoView
          Left = 941.102970000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPPS."ITOGO_WOMAN">,MasterData38)]')
          VAlign = vaCenter
        end
        object Memo723: TfrxMemoView
          Left = 631.181510000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPPS."NACHISL_EXT_SOVM_ALL">,MasterData38)]')
          VAlign = vaCenter
        end
        object Memo724: TfrxMemoView
          Left = 423.307360000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPPS."NACHISL_SHTAT_ALL">,MasterData38)]')
          VAlign = vaCenter
        end
        object Memo725: TfrxMemoView
          Left = 45.354360000000000000
          Width = 45.354330710000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPPS."VID"]')
          VAlign = vaCenter
        end
        object Memo726: TfrxMemoView
          Width = 45.354330710000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPPS."FUND"]')
          VAlign = vaCenter
        end
      end
      object GroupHeader6: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Top = 204.094620000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportUPSVODRASHPPS."VID"'
      end
      object Header23: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 126.897681730000000000
        ParentFont = False
        Top = 351.496290000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo727: TfrxMemoView
          Top = 11.338590000000000000
          Width = 1046.929346220000000000
          Height = 45.574830000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1087#1086#1075#1086#1076#1080#1085#1085#1086#1111' '#1086#1087#1083#1072#1090#1080' '#1087#1088#1072#1094#1110' '#1096#1090#1072#1090#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090 +
              #1085#1080#1082#1110#1074' '#1110' '#1079#1086#1074#1085#1110#1096#1085#1110#1093' '#1089#1091#1084#1110#1089#1085#1080#1082#1110#1074' '
            #1079#1072' '#1088#1072#1093#1091#1085#1086#1082' '#1073#1102#1076#1078#1077#1090#1085#1080#1093' '#1082#1086#1096#1090#1110#1074)
          ParentFont = False
        end
        object Memo728: TfrxMemoView
          Top = 68.031540000000100000
          Width = 45.354330710000000000
          Height = 58.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076)
          VAlign = vaCenter
        end
        object Memo729: TfrxMemoView
          Left = 45.354330710000000000
          Top = 68.031540000000100000
          Width = 45.354330710000000000
          Height = 58.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1076' '#1086#1087#1083)
          VAlign = vaCenter
        end
        object Memo730: TfrxMemoView
          Left = 90.708663860000000000
          Top = 68.031540000000100000
          Width = 279.685005200000000000
          Height = 58.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1074#1080#1076#1091' '#1086#1087#1083#1072#1090)
          VAlign = vaCenter
        end
        object Memo731: TfrxMemoView
          Left = 423.307360000000000000
          Top = 68.031540000000100000
          Width = 207.874015750000000000
          Height = 35.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1096#1090#1072#1090#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074)
          VAlign = vaCenter
        end
        object Memo732: TfrxMemoView
          Left = 631.181510000000000000
          Top = 68.031540000000100000
          Width = 207.874015750000000000
          Height = 35.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1079#1086#1074#1085#1110#1096#1085#1110#1093' '#1089#1091#1084#1110#1089#1085#1080#1082#1110#1074)
          VAlign = vaCenter
        end
        object Memo733: TfrxMemoView
          Left = 839.055660000000000000
          Top = 68.031540000000100000
          Width = 207.874015750000000000
          Height = 35.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          VAlign = vaCenter
        end
        object Memo734: TfrxMemoView
          Left = 423.307360000000000000
          Top = 103.464610870000000000
          Width = 102.047244090000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          VAlign = vaCenter
        end
        object Memo735: TfrxMemoView
          Left = 525.354670000000000000
          Top = 103.464610870000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1079' '#1085#1080#1093' '#1078#1110#1085#1086#1082)
          VAlign = vaCenter
        end
        object Memo736: TfrxMemoView
          Left = 631.181510000000000000
          Top = 103.464610870000000000
          Width = 102.047244090000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          VAlign = vaCenter
        end
        object Memo737: TfrxMemoView
          Left = 733.228820000000000000
          Top = 103.464610870000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1079' '#1085#1080#1093' '#1078#1110#1085#1086#1082)
          VAlign = vaCenter
        end
        object Memo738: TfrxMemoView
          Left = 839.055660000000000000
          Top = 103.464610870000000000
          Width = 102.047244090000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          VAlign = vaCenter
        end
        object Memo739: TfrxMemoView
          Left = 941.102970000000000000
          Top = 103.464610870000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1079' '#1085#1080#1093' '#1078#1110#1085#1086#1082)
          VAlign = vaCenter
        end
        object Memo740: TfrxMemoView
          Left = 370.393940000000000000
          Top = 68.031540000000100000
          Width = 52.913205200000000000
          Height = 58.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1089#1090'. '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080)
          VAlign = vaCenter
        end
      end
      object MasterData39: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 17.007874020000000000
        ParentFont = False
        Top = 548.031850000000000000
        Width = 1046.929810000000000000
        DataSet = ReportUPSVODRASHPOCH
        DataSetName = 'ReportUPSVODRASHPOCH'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo741: TfrxMemoView
          Left = 525.354670000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPOCH."NACHISL_SHTAT_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo742: TfrxMemoView
          Left = 733.228820000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPOCH."NACHISL_EXT_SOVM_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo743: TfrxMemoView
          Left = 839.055660000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPOCH."ITOGO"]')
          VAlign = vaCenter
        end
        object Memo744: TfrxMemoView
          Left = 941.102970000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPOCH."ITOGO_WOMAN"]')
          VAlign = vaCenter
        end
        object Memo745: TfrxMemoView
          Left = 631.181510000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPOCH."NACHISL_EXT_SOVM_ALL"]')
          VAlign = vaCenter
        end
        object Memo746: TfrxMemoView
          Left = 423.307360000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPOCH."NACHISL_SHTAT_ALL"]')
          VAlign = vaCenter
        end
        object Memo747: TfrxMemoView
          Left = 90.708720000000000000
          Width = 279.685039370000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          Memo.Strings = (
            '[ReportUPSVODRASHPOCH."NAME_VID_OPLAT"]')
          VAlign = vaCenter
        end
        object Memo748: TfrxMemoView
          Left = 45.354360000000000000
          Width = 45.354330710000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPOCH."VID"]')
          VAlign = vaCenter
        end
        object Memo749: TfrxMemoView
          Width = 45.354330710000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPOCH."FUND"]')
          VAlign = vaCenter
        end
        object Memo750: TfrxMemoView
          Left = 370.393940000000000000
          Width = 52.913205200000000000
          Height = 17.007874020000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODRASHPOCH."NAME_WORK_REASON"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter7: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 17.007874020000000000
        ParentFont = False
        Top = 631.181510000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo751: TfrxMemoView
          Left = 90.708720000000000000
          Width = 332.598425200000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1079#1072' '#1092#1086#1085#1076#1086#1084)
          VAlign = vaCenter
        end
        object Memo752: TfrxMemoView
          Left = 525.354670000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPOCH."NACHISL_SHTAT_WOMAN">,MasterData39)]')
          VAlign = vaCenter
        end
        object Memo753: TfrxMemoView
          Left = 733.228820000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODRASHPOCH."NACHISL_EXT_SOVM_WOMAN">,MasterData3' +
              '9)]')
          VAlign = vaCenter
        end
        object Memo754: TfrxMemoView
          Left = 839.055660000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPOCH."ITOGO">,MasterData39)]')
          VAlign = vaCenter
        end
        object Memo755: TfrxMemoView
          Left = 941.102970000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPOCH."ITOGO_WOMAN">,MasterData39)]')
          VAlign = vaCenter
        end
        object Memo756: TfrxMemoView
          Left = 631.181510000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODRASHPOCH."NACHISL_EXT_SOVM_ALL">,MasterData39)' +
              ']')
          VAlign = vaCenter
        end
        object Memo757: TfrxMemoView
          Left = 423.307360000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPOCH."NACHISL_SHTAT_ALL">,MasterData39)]')
          VAlign = vaCenter
        end
        object Memo758: TfrxMemoView
          Left = 45.354360000000000000
          Width = 45.354330710000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo759: TfrxMemoView
          Width = 45.354330710000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPOCH."FUND"]')
          VAlign = vaCenter
        end
      end
      object GroupHeader7: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Top = 502.677490000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportUPSVODRASHPOCH."FUND"'
      end
      object GroupFooter8: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 17.007874020000000000
        ParentFont = False
        Top = 589.606680000000000000
        Width = 1046.929810000000000000
        object Memo760: TfrxMemoView
          Left = 90.708720000000000000
          Width = 332.598425200000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1079#1072' '#1074#1080#1076#1086#1084' '#1086#1087#1083#1072#1090#1080)
          VAlign = vaCenter
        end
        object Memo761: TfrxMemoView
          Left = 525.354670000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPOCH."NACHISL_SHTAT_WOMAN">,MasterData39)]')
          VAlign = vaCenter
        end
        object Memo762: TfrxMemoView
          Left = 733.228820000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODRASHPOCH."NACHISL_EXT_SOVM_WOMAN">,MasterData3' +
              '9)]')
          VAlign = vaCenter
        end
        object Memo763: TfrxMemoView
          Left = 839.055660000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPOCH."ITOGO">,MasterData39)]')
          VAlign = vaCenter
        end
        object Memo764: TfrxMemoView
          Left = 941.102970000000000000
          Width = 105.826771650000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPOCH."ITOGO_WOMAN">,MasterData39)]')
          VAlign = vaCenter
        end
        object Memo765: TfrxMemoView
          Left = 631.181510000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[SUM(<ReportUPSVODRASHPOCH."NACHISL_EXT_SOVM_ALL">,MasterData39)' +
              ']')
          VAlign = vaCenter
        end
        object Memo766: TfrxMemoView
          Left = 423.307360000000000000
          Width = 102.047244090000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportUPSVODRASHPOCH."NACHISL_SHTAT_ALL">,MasterData39)]')
          VAlign = vaCenter
        end
        object Memo767: TfrxMemoView
          Left = 45.354360000000000000
          Width = 45.354330710000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPOCH."VID"]')
          VAlign = vaCenter
        end
        object Memo768: TfrxMemoView
          Width = 45.354330710000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportUPSVODRASHPOCH."FUND"]')
          VAlign = vaCenter
        end
      end
      object GroupHeader8: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Top = 525.354670000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportUPSVODRASHPOCH."VID"'
      end
      object PageFooter13: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677165350000000000
        ParentFont = False
        Top = 710.551640000000000000
        Width = 1046.929810000000000000
        object Memo769: TfrxMemoView
          Left = 963.780150000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
        object Memo832: TfrxMemoView
          Left = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Date] ')
          ParentFont = False
        end
        object Memo833: TfrxMemoView
          Left = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Time]')
          ParentFont = False
        end
      end
      object Header24: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 138.236271730000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo771: TfrxMemoView
          Top = 79.370130000000290000
          Width = 45.354330710000000000
          Height = 58.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1086#1085#1076)
          VAlign = vaCenter
        end
        object Memo772: TfrxMemoView
          Left = 45.354330710000000000
          Top = 79.370130000000290000
          Width = 45.354330710000000000
          Height = 58.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1076' '#1086#1087#1083)
          VAlign = vaCenter
        end
        object Memo773: TfrxMemoView
          Left = 90.708663860000000000
          Top = 79.370130000000290000
          Width = 279.685005200000000000
          Height = 58.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1074#1080#1076#1091' '#1086#1087#1083#1072#1090)
          VAlign = vaCenter
        end
        object Memo774: TfrxMemoView
          Left = 423.307360000000000000
          Top = 79.370130000000290000
          Width = 207.874015750000000000
          Height = 35.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1096#1090#1072#1090#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074)
          VAlign = vaCenter
        end
        object Memo775: TfrxMemoView
          Left = 631.181510000000000000
          Top = 79.370130000000290000
          Width = 207.874015750000000000
          Height = 35.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1079#1086#1074#1085#1110#1096#1085#1110#1093' '#1089#1091#1084#1110#1089#1085#1080#1082#1110#1074)
          VAlign = vaCenter
        end
        object Memo776: TfrxMemoView
          Left = 839.055660000000000000
          Top = 79.370130000000290000
          Width = 207.874015750000000000
          Height = 35.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          VAlign = vaCenter
        end
        object Memo777: TfrxMemoView
          Left = 423.307360000000000000
          Top = 114.803200870000000000
          Width = 102.047244090000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          VAlign = vaCenter
        end
        object Memo778: TfrxMemoView
          Left = 525.354670000000000000
          Top = 114.803200870000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1079' '#1085#1080#1093' '#1078#1110#1085#1086#1082)
          VAlign = vaCenter
        end
        object Memo779: TfrxMemoView
          Left = 631.181510000000000000
          Top = 114.803200870000000000
          Width = 102.047244090000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          VAlign = vaCenter
        end
        object Memo780: TfrxMemoView
          Left = 733.228820000000000000
          Top = 114.803200870000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1079' '#1085#1080#1093' '#1078#1110#1085#1086#1082)
          VAlign = vaCenter
        end
        object Memo781: TfrxMemoView
          Left = 839.055660000000000000
          Top = 114.803200870000000000
          Width = 102.047244090000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          VAlign = vaCenter
        end
        object Memo782: TfrxMemoView
          Left = 941.102970000000000000
          Top = 114.803200870000000000
          Width = 105.826771650000000000
          Height = 23.338590000000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1079' '#1085#1080#1093' '#1078#1110#1085#1086#1082)
          VAlign = vaCenter
        end
        object Memo783: TfrxMemoView
          Left = 370.393940000000000000
          Top = 79.370130000000290000
          Width = 52.913205200000000000
          Height = 58.866141730000000000
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1089#1090'. '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080)
          VAlign = vaCenter
        end
        object Memo770: TfrxMemoView
          Top = 15.118112680000000000
          Width = 1046.929346220000000000
          Height = 49.354360000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1096#1090#1072#1090#1085#1080#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074' '#1110' '#1079#1086#1074#1085#1110#1096#1085#1110#1093' '#1089#1091#1084#1110#1089#1085 +
              #1080#1082#1110#1074' '
            #1055#1055#1057' '#1079#1072' '#1088#1072#1093#1091#1085#1086#1082' '#1073#1102#1076#1078#1077#1090#1085#1080#1093' '#1082#1086#1096#1090#1110#1074)
          ParentFont = False
        end
      end
    end
    object Page13: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      PrintOnPreviousPage = True
      object Header20: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 62.362234020000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo590: TfrxMemoView
          Left = 309.921460000000000000
          Top = 7.559060000000000000
          Width = 453.543307090000000000
          Height = 34.236240000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1087#1110#1076#1089#1090#1072#1074' '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080)
          ParentFont = False
        end
        object Memo591: TfrxMemoView
          Left = 207.874150000000000000
          Top = 45.354360000000000000
          Width = 438.425265200000000000
          Height = 17.007874020000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo592: TfrxMemoView
          Left = 646.299630000000000000
          Top = 45.354360000000000000
          Width = 207.874015750000000000
          Height = 17.007874020000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1082#1086#1088#1086#1095#1077#1085#1072' '#1085#1072#1079#1074#1072)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData35: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 17.007874020000000000
        ParentFont = False
        Top = 105.826840000000000000
        Width = 1046.929810000000000000
        DataSet = ReportUPSVODWORKREASON
        DataSetName = 'ReportUPSVODWORKREASON'
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo593: TfrxMemoView
          Left = 207.874015750000000000
          Width = 438.425265200000000000
          Height = 17.007874015748000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportUPSVODWORKREASON."NAME_FULL"]')
          VAlign = vaCenter
        end
        object Memo594: TfrxMemoView
          Left = 646.299630000000000000
          Width = 207.874015750000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportUPSVODWORKREASON."NAME_short"]')
          VAlign = vaCenter
        end
      end
      object PageFooter12: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 185.196970000000000000
        Width = 1046.929810000000000000
        object Memo665: TfrxMemoView
          Left = 963.780150000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
        object Memo808: TfrxMemoView
          Left = 11.338590000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Date] ')
          ParentFont = False
        end
        object Memo809: TfrxMemoView
          Left = 105.826840000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Time]')
          ParentFont = False
        end
      end
    end
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 386
    Top = 78
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 384
    Top = 22
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 442
    Top = 78
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 440
    Top = 22
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 308
    Top = 78
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object SetkaDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 244
    Top = 14
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object BaseDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 243
    Top = 67
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportMain: TfrxDBDataset
    UserName = 'ReportMain'
    CloseDataSource = False
    DataSet = MainDataSet
    Left = 67
    Top = 178
  end
  object MainDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 67
    Top = 123
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODFUNDSZP: TfrxDBDataset
    UserName = 'ReportUPSVODFUNDSZP'
    CloseDataSource = False
    DataSet = DsUPSVODFUNDSZP
    Left = 243
    Top = 178
  end
  object DsUPSVODFUNDSZP: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 243
    Top = 123
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODFUNDSONCAT: TfrxDBDataset
    UserName = 'ReportUPSVODFUNDSONCAT'
    CloseDataSource = False
    DataSet = DsUPSVODFUNDSONCAT
    Left = 395
    Top = 178
  end
  object DsUPSVODFUNDSONCAT: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 395
    Top = 123
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODSUMOTPUSK: TfrxDBDataset
    UserName = 'ReportUPSVODSUMOTPUSK'
    CloseDataSource = False
    DataSet = DsUPSVODSUMOTPUSK
    Left = 563
    Top = 178
  end
  object DsUPSVODSUMOTPUSK: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 563
    Top = 123
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODPODOHODNALOG: TfrxDBDataset
    UserName = 'ReportUPSVODPODOHODNALOG'
    CloseDataSource = False
    DataSet = DsUPSVODPODOHODNALOG
    Left = 739
    Top = 178
  end
  object DsUPSVODPODOHODNALOG: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 739
    Top = 123
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODPROGULS: TfrxDBDataset
    UserName = 'ReportUPSVODPROGULS'
    CloseDataSource = False
    DataSet = DsUPSVODPROGULS
    Left = 67
    Top = 282
  end
  object DsUPSVODPROGULS: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 67
    Top = 227
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODALLSOTRUDS: TfrxDBDataset
    UserName = 'ReportUPSVODALLSOTRUDS'
    CloseDataSource = False
    DataSet = DsUPSVODALLSOTRUDS
    Left = 243
    Top = 282
  end
  object DsUPSVODALLSOTRUDS: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 243
    Top = 227
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODCHISLPERSS: TfrxDBDataset
    UserName = 'ReportUPSVODCHISLPERSS'
    CloseDataSource = False
    DataSet = DsUPSVODCHISLPERSS
    Left = 395
    Top = 282
  end
  object DsUPSVODCHISLPERSS: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 395
    Top = 227
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODCHISLPERSONCATS: TfrxDBDataset
    UserName = 'ReportUPSVODCHISLPERSONCATS'
    CloseDataSource = False
    DataSet = DsUPSVODCHISLPERSONCATS
    Left = 563
    Top = 282
  end
  object DsUPSVODCHISLPERSONCATS: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 563
    Top = 227
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODFUNDWTS: TfrxDBDataset
    UserName = 'ReportUPSVODFUNDWTS'
    CloseDataSource = False
    DataSet = DsUPSVODFUNDWTS
    Left = 739
    Top = 282
  end
  object DsUPSVODFUNDWTS: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 739
    Top = 227
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODWORKERZP: TfrxDBDataset
    UserName = 'ReportUPSVODWORKERZP'
    CloseDataSource = False
    DataSet = DsUPSVODWORKERZP
    Left = 67
    Top = 402
  end
  object DsUPSVODWORKERZP: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 67
    Top = 347
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODONWORKERSS: TfrxDBDataset
    UserName = 'ReportUPSVODONWORKERSS'
    CloseDataSource = False
    DataSet = DsUPSVODONWORKERSS
    Left = 243
    Top = 402
  end
  object DsUPSVODONWORKERSS: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 243
    Top = 347
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODONWORKEXT: TfrxDBDataset
    UserName = 'ReportUPSVODONWORKEXT'
    CloseDataSource = False
    DataSet = DsUPSVODONWORKEXT
    Left = 403
    Top = 402
  end
  object DsUPSVODONWORKEXT: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 395
    Top = 347
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODWORKERSOVM: TfrxDBDataset
    UserName = 'ReportUPSVODWORKERSOVM'
    CloseDataSource = False
    DataSet = DsUPSVODWORKERSOVM
    Left = 563
    Top = 402
  end
  object DsUPSVODWORKERSOVM: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 563
    Top = 347
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODEXTSOVMS: TfrxDBDataset
    UserName = 'ReportUPSVODEXTSOVMS'
    CloseDataSource = False
    DataSet = DsUPSVODEXTSOVMS
    Left = 739
    Top = 402
  end
  object DsUPSVODEXTSOVMS: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 739
    Top = 347
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODCHISLPERSR: TfrxDBDataset
    UserName = 'ReportUPSVODCHISLPERSR'
    CloseDataSource = False
    DataSet = DsUPSVODCHISLPERSR
    Left = 75
    Top = 506
  end
  object DsUPSVODCHISLPERSR: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 75
    Top = 451
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DsUPSVODALLSOTRUDR: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 243
    Top = 459
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODALLSOTRUDR: TfrxDBDataset
    UserName = 'ReportUPSVODALLSOTRUDR'
    CloseDataSource = False
    DataSet = DsUPSVODALLSOTRUDR
    Left = 243
    Top = 514
  end
  object DsUPSVODCHISLPERSONCATR: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 563
    Top = 459
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODCHISLPERSONCATR: TfrxDBDataset
    UserName = 'ReportUPSVODCHISLPERSONCATR'
    CloseDataSource = False
    DataSet = DsUPSVODCHISLPERSONCATR
    Left = 563
    Top = 514
  end
  object DsUPSVODFUNDWTR: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 723
    Top = 459
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODFUNDWTR: TfrxDBDataset
    UserName = 'ReportUPSVODFUNDWTR'
    CloseDataSource = False
    DataSet = DsUPSVODFUNDWTR
    Left = 723
    Top = 514
  end
  object ReportUPSVODONWORKERSR: TfrxDBDataset
    UserName = 'ReportUPSVODONWORKERSR'
    CloseDataSource = False
    DataSet = DsUPSVODONWORKERSR
    Left = 403
    Top = 514
  end
  object DsUPSVODONWORKERSR: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 403
    Top = 459
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODEXTSOVMR: TfrxDBDataset
    UserName = 'ReportUPSVODEXTSOVMR'
    CloseDataSource = False
    DataSet = DsUPSVODEXTSOVMR
    Left = 75
    Top = 610
  end
  object DsUPSVODEXTSOVMR: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 75
    Top = 555
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DsUPSVODPROGULR: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 243
    Top = 563
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODPROGULR: TfrxDBDataset
    UserName = 'ReportUPSVODPROGULR'
    CloseDataSource = False
    DataSet = DsUPSVODPROGULR
    Left = 243
    Top = 618
  end
  object DsUPSVODRASHNACH: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 403
    Top = 571
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODRASHNACH: TfrxDBDataset
    UserName = 'ReportUPSVODRASHNACH'
    CloseDataSource = False
    DataSet = DsUPSVODRASHNACH
    Left = 403
    Top = 626
  end
  object DsUPSVODRASHNEO: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 563
    Top = 571
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODRASHNEO: TfrxDBDataset
    UserName = 'ReportUPSVODRASHNEO'
    CloseDataSource = False
    DataSet = DsUPSVODRASHNEO
    Left = 563
    Top = 626
  end
  object ReportUPSVODFUNDSUD: TfrxDBDataset
    UserName = 'ReportUPSVODFUNDSUD'
    CloseDataSource = False
    DataSet = DsUPSVODFUNDSUD
    Left = 723
    Top = 626
  end
  object DsUPSVODFUNDSUD: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 723
    Top = 571
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODWORKREASON: TfrxDBDataset
    UserName = 'ReportUPSVODWORKREASON'
    CloseDataSource = False
    DataSet = DsUPSVODWORKREASON
    Left = 899
    Top = 66
  end
  object DsUPSVODWORKREASON: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 899
    Top = 11
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODFUNDALLR: TfrxDBDataset
    UserName = 'ReportUPSVODFUNDALLR'
    CloseDataSource = False
    DataSet = DsUPSVODFUNDALLR
    Left = 899
    Top = 186
  end
  object DsUPSVODFUNDALLR: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 899
    Top = 131
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODFUNDALLS: TfrxDBDataset
    UserName = 'ReportUPSVODFUNDALLS'
    CloseDataSource = False
    DataSet = DsUPSVODFUNDALLS
    Left = 899
    Top = 306
  end
  object DsUPSVODFUNDALLS: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 899
    Top = 251
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DsUPSVODRASHPPS: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 899
    Top = 371
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODRASHPPS: TfrxDBDataset
    UserName = 'ReportUPSVODRASHPPS'
    CloseDataSource = False
    DataSet = DsUPSVODRASHPPS
    Left = 899
    Top = 426
  end
  object DsUPSVODRASHPOCH: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 899
    Top = 507
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODRASHPOCH: TfrxDBDataset
    UserName = 'ReportUPSVODRASHPOCH'
    CloseDataSource = False
    DataSet = DsUPSVODRASHPOCH
    Left = 899
    Top = 562
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
    Left = 832
    Top = 624
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 912
    Top = 640
  end
  object ReportUPSVODCHISLDISMISS: TfrxDBDataset
    UserName = 'ReportUPSVODCHISLDISMISS'
    CloseDataSource = False
    DataSet = DsUPSVODCHISLDISMISS
    Left = 555
    Top = 66
  end
  object DsUPSVODCHISLDISMISS: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 555
    Top = 11
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DsUPSVODCHISLACCEPT: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 723
    Top = 19
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportUPSVODCHISLACCEPT: TfrxDBDataset
    UserName = 'ReportUPSVODCHISLACCEPT'
    CloseDataSource = False
    DataSet = DsUPSVODCHISLACCEPT
    Left = 723
    Top = 74
  end
end
