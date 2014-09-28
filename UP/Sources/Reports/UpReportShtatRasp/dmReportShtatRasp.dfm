object DM: TDM
  OldCreateOrder = False
  Left = 813
  Top = 299
  Height = 276
  Width = 428
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
    DataSet = DSetData
    Left = 200
    Top = 116
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
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38789.428188472200000000
    ReportOptions.LastChange = 39146.616157581020000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      'List, List_Sv, List_Zan, List_Otkl: TStringList;'
      'i: Integer;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <KodSm>='#39'-255'#39' then Memo44.Text:='#39#39';'
      'end;'
      ''
      'procedure GroupHeader2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Engine.FinalPass then'
      '  begin'
      '      if StrToFloat(List[i])<>0 then'
      '      Memo51.Text := FormatFloat('#39'0.000'#39',StrToFloat(List[i]))'
      '      else  Memo51.Text:='#39#39';'
      '      if StrToFloat(List_Sv[i])<>0 then'
      '      Memo52.Text := FormatFloat('#39'0.000'#39',StrToFloat(List_Sv[i]))'
      '      else  Memo52.Text:='#39#39';'
      '      if StrToFloat(List_Zan[i])<>0 then'
      
        '      Memo53.Text := FormatFloat('#39'0.000'#39',StrToFloat(List_Zan[i])' +
        ')'
      '      else  Memo53.Text:='#39#39';'
      '      if StrToFloat(List_Otkl[i])<>0 then'
      
        '      Memo54.Text := FormatFloat('#39'0.000'#39',StrToFloat(List_Otkl[i]' +
        '))'
      '      else  Memo54.Text:='#39#39';'
      '  end'
      'end;'
      ''
      'procedure GroupFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  List.Add(FloatToStr(<SUM(<ReportDsetData."KOL_STAVOK">,MasterD' +
        'ata1)>));'
      
        '  List_Sv.Add(FloatToStr(<SUM(<ReportDsetData."KOL_STAVOK_SV">,M' +
        'asterData1)>));'
      
        '  List_Zan.Add(FloatToStr(<SUM(<ReportDsetData."KOL_STAVOK_ZAN">' +
        ',MasterData1)>));'
      
        '  List_Otkl.Add(FloatToStr(<ReportDsetData."KOL_STAVOK_SHTAT">-<' +
        'SUM(<ReportDsetData."KOL_STAVOK">,MasterData1)>-<SUM(<ReportDset' +
        'Data."KOL_STAVOK_ZAN">,MasterData1)>));'
      '  Inc(i);'
      'end;'
      ''
      'procedure frxReport1OnStartReport(Sender: TfrxComponent);'
      'begin'
      '    List := TStringList.Create;'
      '    List_Sv := TStringList.Create;'
      '    List_Zan := TStringList.Create;'
      '    List_Otkl := TStringList.Create;'
      'end;'
      ''
      'procedure frxReport1OnStopReport(Sender: TfrxComponent);'
      'begin'
      '   List.Free;'
      '   List_Sv.Free;'
      '   List_Zan.Free;'
      '   List_Otkl.Free;'
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    i := 0;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnStartReport = 'frxReport1OnStartReport'
    OnStopReport = 'frxReport1OnStopReport'
    Left = 200
    Datasets = <
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      OnBeforePrint = 'Page1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        Height = 121.133890000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo1: TfrxMemoView
          Top = 35.338590000000010000
          Width = 1057.102970000000000000
          Height = 22.677180000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1048#1050#1054#1053#1040#1053#1053#1071' '#1064#1058#1040#1058#1053#1054#1043#1054' '#1056#1054#1047#1050#1051#1040#1044#1059' '#1053#1040' [Cur_Date]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Width = 482.614410000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetData."FIRM_NAME"]'
            '')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Top = 83.149660000000000000
          Width = 1045.764380000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          HAlign = haCenter
          Memo.Strings = (
            '[NameTypePost]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Top = 64.252010000000000000
          Width = 1051.433520000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."SMETA_NAME"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 38.897650000000000000
        ParentFont = False
        Top = 328.819110000000000000
        Width = 1046.929810000000000000
        OnAfterCalcHeight = 'GroupHeader1OnAfterCalcHeight'
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        AllowSplit = True
        Condition = '<ReportDsetData."NAME_CAFEDRA">'
        Stretched = True
        object Memo2: TfrxMemoView
          Width = 1047.653990000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_FACULTY"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 20.000000000000000000
          Width = 1047.653990000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_CAFEDRA"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 81.130000000000000000
        ParentFont = False
        Top = 427.086890000000000000
        Width = 1046.929810000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo11: TfrxMemoView
          Left = 133.417256930000000000
          Width = 30.236203390000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."WORK_REASON"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Top = 29.133855830000010000
          Width = 133.417256930000000000
          Height = 12.000000000000000000
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATE_BEG"] - [ReportDsetData."DATE_END"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Top = 41.129999999999990000
          Width = 133.417256930000000000
          Height = 40.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NUM_DATE_ORDER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 163.653460310000000000
          Width = 34.015728500000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."UCH_STEPEN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 196.535330550000000000
          Width = 38.929133860000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."UCH_ZVANIE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 235.464447320000000000
          Width = 56.692913390000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."OKLAD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 292.157355830000000000
          Width = 63.496062990000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."OKLAD_BASE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 355.275590550000000000
          Width = 65.007874020000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOD_SM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 420.661417320000000000
          Width = 64.251968500000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."OKLAD_PPS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 484.760000000000000000
          Width = 64.250000000000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOEFF_PPS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 547.210000000000000000
          Width = 64.090000000000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOD_SM_PPS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 680.570000000000000000
          Width = 71.060000000000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOL_STAVOK"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 610.330000000000000000
          Width = 71.060000000000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 751.690000000000000000
          Width = 71.060000000000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOL_STAVOK_SV"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 820.820000000000000000
          Width = 74.830000000000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOL_STAVOK_ZAN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 893.510000000000000000
          Width = 70.930000000000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 964.440000000000000000
          Width = 82.490000000000000000
          Height = 81.130000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."COMMENT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Width = 133.420000000000000000
          Height = 29.130000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."FIO"] '
            '([ReportDsetData."TN"])')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 608.504330000000000000
        Width = 1046.929810000000000000
        object Memo56: TfrxMemoView
          Left = 967.559680000000000000
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
      end
      object Header1: TfrxHeader
        Height = 105.830000000000000000
        Top = 200.315090000000000000
        Width = 1046.929810000000000000
        AllowSplit = True
        Stretched = True
        object Memo57: TfrxMemoView
          Width = 235.622120470000000000
          Height = 105.826771650000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1087#1086#1089#1072#1076#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 235.464566930000000000
          Width = 375.307176930000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1082#1083#1072#1076)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 235.464566930000000000
          Top = 26.456692909999990000
          Width = 56.755912830000000000
          Height = 79.370078740000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 610.393700790000000000
          Width = 354.551227480000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1082#1072#1079#1085#1080#1082#1080' '#1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1096#1090#1072#1090#1085#1086#1075#1086' '#1088#1086#1079#1082#1083#1072#1076#1091', '#1089#1090#1072#1074#1086#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 820.819420000000000000
          Top = 26.456692909999990000
          Width = 74.834648110000000000
          Height = 79.370078740000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1080#1084#1095#1072#1089#1086
            #1074#1086' '#1079#1072#1081#1085#1103#1090#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 893.512370000000000000
          Top = 26.456692909999990000
          Width = 70.929143620000000000
          Height = 79.370078740000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1093#1080#1083#1077#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 964.441560000000000000
          Width = 82.488203620000000000
          Height = 105.826771650000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1084#1110#1090#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 292.157480310000000000
          Top = 26.456692909999990000
          Width = 318.582752830000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1074' '#1090'.'#1095'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 292.157480310000000000
          Top = 52.913385830000010000
          Width = 128.503937010000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1075'. '#1079' '#1085#1072#1082'. '#1052#1054#1053#1059)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 420.661417320000000000
          Top = 52.913385830000010000
          Width = 189.448862830000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1075'. '#1087#1086#1089#1090'. 992')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 292.157480310000000000
          Top = 79.370078740000000000
          Width = 64.251968500000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 355.401670000000000000
          Top = 79.370078740000000000
          Width = 68.031498500000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1096#1090'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 420.661417320000000000
          Top = 79.370078740000000000
          Width = 64.251968500000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 547.212740000000000000
          Top = 79.370078740000000000
          Width = 64.094502830000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1096#1090'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 484.756030000000000000
          Top = 79.370078740000000000
          Width = 64.251968500000000000
          Height = 26.456692910000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1077#1092'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 751.685220000000000000
          Top = 26.456692909999990000
          Width = 71.055118110000000000
          Height = 79.370078740000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1080#1084#1095#1072#1089#1086
            #1074#1086' '#1074#1110#1083#1100#1085#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 680.567100000000000000
          Top = 26.456692909999990000
          Width = 71.055118110000000000
          Height = 79.370078740000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1072#1082#1090#1080#1095#1085#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 610.330860000000000000
          Top = 26.456692909999990000
          Width = 71.055118110000000000
          Height = 79.370078740000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1075#1110#1076#1085#1086' '#1064#1056)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 16.000000000000000000
        Top = 532.913730000000000000
        Visible = False
        Width = 1046.929810000000000000
        OnBeforePrint = 'GroupFooter1OnBeforePrint'
        Stretched = True
        object Memo5: TfrxMemoView
          Width = 235.464566930000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_POST"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 235.464566930000000000
          Width = 56.692913390000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."OKLAD_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 292.157480310000000000
          Width = 64.251968500000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."BASE_OKLAD_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 355.275590550000000000
          Width = 68.031496060000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOD_SM_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 420.661417320000000000
          Width = 64.251968500000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."OKLAD_PPS_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 484.760000000000000000
          Width = 64.250000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOEFF_PPS_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 549.210000000000000000
          Width = 60.090000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOD_SM_PPS_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 610.330000000000000000
          Width = 71.060000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOL_STAVOK_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 681.390000000000000000
          Width = 71.060000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<ReportDsetData."KOL_STAVOK">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 751.690000000000000000
          Width = 71.055118110000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<ReportDsetData."KOL_STAVOK_SV">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 822.750000000000000000
          Width = 70.834645670000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<ReportDsetData."KOL_STAVOK_ZAN">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 893.510000000000000000
          Width = 70.930000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            
              '[<ReportDsetData."KOL_STAVOK_SHTAT">-<SUM(<ReportDsetData."KOL_S' +
              'TAVOK">,MasterData1)>-<SUM(<ReportDsetData."KOL_STAVOK_ZAN">,Mas' +
              'terData1)>]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 964.440000000000000000
          Width = 82.490000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 16.000000000000000000
        ParentFont = False
        Top = 389.291590000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'GroupHeader2OnBeforePrint'
        AllowSplit = True
        Condition = '<ReportDsetData."ID_POST_SAL">'
        Stretched = True
        object Memo41: TfrxMemoView
          Width = 235.464566930000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_POST"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 235.464566930000000000
          Width = 56.692913390000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."OKLAD_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 292.157480310000000000
          Width = 64.251968500000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."BASE_OKLAD_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 355.275590550000000000
          Width = 68.031496060000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOD_SM_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 420.661417320000000000
          Width = 64.251968500000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."OKLAD_PPS_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 484.760000000000000000
          Width = 64.250000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOEFF_PPS_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 549.210000000000000000
          Width = 60.090000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOD_SM_PPS_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 610.330000000000000000
          Width = 71.060000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."KOL_STAVOK_SHTAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 681.390000000000000000
          Width = 71.060000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 751.690000000000000000
          Width = 71.055118110000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 822.750000000000000000
          Width = 70.834645670000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 893.510000000000000000
          Width = 70.930000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 964.440000000000000000
          Width = 82.490000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportQuery'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
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
    Left = 272
    Top = 112
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
  object DSetSr2: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'DELETE FROM SHTAT_MFUND_TABLE where Id_Session=:Id_Sess')
    Transaction = ReadTransaction
    Left = 352
    Top = 64
  end
  object DSetSr1: TpFIBDataSet
    Database = DB
    Transaction = WriteTransaction
    Left = 352
    poSQLINT64ToBCD = True
  end
  object DSetTypePost: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 176
    poSQLINT64ToBCD = True
  end
end
