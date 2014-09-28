object frmST_PAY: TfrmST_PAY
  Left = 551
  Top = 363
  Width = 223
  Height = 94
  Caption = 'frmST_PAY'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pFIBStoredProc: TpFIBStoredProc
    Left = 96
  end
  object pFIBDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    DOC_NOMER_COMBO,'
      '    DATE_DOC,'
      '    SUMMA,'
      '    NOTE'
      'FROM'
      '    ST_TMP_DOC_SELECT '
      'ORDER BY DATE_DOC'
      '')
    Left = 64
    poSQLINT64ToBCD = True
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = pFIBDataSet
    Left = 32
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38532.975292777800000000
    ReportOptions.LastChange = 38547.941046909700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  summa :Variant;'
      '  summa_period :Variant;'
      '  summa_dolg :Variant;'
      ''
      'procedure MemoPayPeriodOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'if <frxDBDataset1."SUMMA"> <= summa  then'
      '  begin'
      '    if (summa=0.00) then'
      '      begin'
      '           MemoPayPeriod.Text :='#39'0,00'#39';'
      '      end'
      '      else'
      '      begin'
      '           MemoPayPeriod.Text :=<frxDBDataset1."SUMMA">;'
      '      end;'
      '//    MemoPayPeriod.Text :=<frxDBDataset1."SUMMA">;'
      '    summa_period:=<frxDBDataset1."SUMMA">;'
      '    summa:=summa-<frxDBDataset1."SUMMA">;'
      '  end'
      '  else'
      '  begin'
      '    if (summa=0.00) then'
      '      begin'
      '           MemoPayPeriod.Text :='#39'0,00'#39';'
      '      end'
      '      else'
      '      begin'
      '           MemoPayPeriod.Text :=summa;'
      '      end;'
      '    summa_period:=summa;'
      '    summa:=0.00;'
      '  end;'
      'end;'
      ''
      'procedure Memo7OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<frxDBDataset1."SUMMA"> - summa_period=0.00) then'
      '      begin'
      '          TfrxMemoView(Sender).Text:= '#39'0,00'#39';'
      '      end'
      '      else'
      '      begin'
      
        '          TfrxMemoView(Sender).Text:= <frxDBDataset1."SUMMA"> - ' +
        'summa_period;'
      '      end;'
      
        '//   TfrxMemoView(Sender).Text:= <frxDBDataset1."SUMMA"> - summa' +
        '_period;'
      
        '   summa_dolg:=summa_dolg+<frxDBDataset1."SUMMA"> - summa_period' +
        ';'
      'end;'
      ''
      'procedure Memo11OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  TfrxMemoView(Sender).Text:= summa_dolg;'
      'end;'
      ''
      'procedure Memo12OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if  summa_dolg>0 then'
      '    begin'
      '       TfrxMemoView(Sender).Text:=<PAYCONF1>+'#39' '#1087#1086' '#39'+<DATEOPL>;'
      '    end'
      '    else'
      '    begin'
      '       TfrxMemoView(Sender).Text:=<PAYCONF1>+'#39' '#39'+<PAYCONF2>+'#39'.'#39';'
      '    end;'
      'end;'
      ''
      ''
      'begin'
      '  summa:=<SUMOPL>;'
      '  summa:=summa-0;'
      '  summa_dolg:=0.00;'
      'end.')
    OnPrintReport = frxReportPrintReport
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = 'DATEOPL'
        Value = #39'01.09.1999'#39
      end
      item
        Name = 'NAMEREP0'
        Value = #39#1056#1072#1089#1095#1077#1090' '#1085#1072#39
      end
      item
        Name = 'NAMEREP'
        Value = #39#1056#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072' '#1089#1091#1084#1084#1099' '#1082' '#1086#1087#1083#1072#1090#1077#39
      end
      item
        Name = 'NAMEREP1'
        Value = #39#1079#1072' '#1074#1077#1089#1100' '#1087#1077#1088#1080#1086#1076' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103#39
      end
      item
        Name = 'NAMEREP2'
        Value = #39'('#1087#1088#1080#1083#1086#1078#1077#1085#1080#1077' '#1082' '#1089#1087#1088#1072#1074#1082#1077' '#1086#1073' '#1086#1087#1083#1072#1090#1077')'#39
      end
      item
        Name = 'BEGDATE'
        Value = #39#1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072#39
      end
      item
        Name = 'ENDDATE'
        Value = #39#1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072#39
      end
      item
        Name = 'SUMMONTH'
        Value = #39#1057#1091#1084#1084#1072' '#1086#1087#1083#1072#1090#1099' '#1074' '#1084#1077#1089#1103#1094', '#1075#1088#1085#39
      end
      item
        Name = 'PERSENT'
        Value = #39#1055#1088#1086#1094#1077#1085#1090' '#1086#1087#1083#1072#1090#1099', %'#39
      end
      item
        Name = 'SUMSUB'
        Value = #39#1057#1091#1084#1084#1072' '#1078#1080#1083#1080#1097#1085#1086#1081' '#1089#1091#1073#1089#1080#1076#1080#1080', '#1075#1088#1085#39
      end
      item
        Name = 'CNTMONTH'
        Value = #39#1050#1086#1083'-'#1074#1086' '#1084#1077#1089#1103#1094#1077#1074#39
      end
      item
        Name = 'ALLPERIOD'
        Value = #39#1048#1090#1086#1075#1086' '#1079#1072' '#1087#1077#1088#1080#1086#1076', '#1075#1088#1085#39
      end
      item
        Name = 'SUMPAY'
        Value = #39#1055#1086#1089#1090#1091#1087#1080#1074#1096#1072#1103' '#1089#1091#1084#1084#1072', '#1075#1088#1085#39
      end
      item
        Name = 'SUMDOLG'
        Value = #39#1057#1091#1084#1084#1072' '#1082' '#1086#1087#1083#1072#1090#1077', '#1075#1088#1085#39
      end
      item
        Name = 'ALL'
        Value = #39#1048#1090#1086#1075#1086' '#1079#1072' '#1074#1077#1089#1100' '#1087#1077#1088#1080#1086#1076' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103#39
      end
      item
        Name = 'PAYCONF1'
        Value = #39#1054#1087#1083#1072#1095#1077#1085#1086#39
      end
      item
        Name = 'PAYCONF2'
        Value = #39#1087#1086#1083#1085#1086#1089#1090#1100#1102#39
      end
      item
        Name = 'BUHG'
        Value = #39#1041#1091#1093#1075#1072#1083#1090#1077#1088#39
      end
      item
        Name = 'ORG'
        Value = #39#1044#1054#1053#1045#1062#1050#1048#1049' '#1053#1040#1062#1048#1054#1053#1040#1051#1068#1053#1067#1049' '#1059#1053#1048#1042#1045#1056#1057#1048#1058#1045#1058#39
      end
      item
        Name = 'OTGOTD'
        Value = #39#1057#1058#1059#1044#1043#1054#1056#1054#1044#1054#1050#39
      end
      item
        Name = 'FIO'
        Value = #39#1065#1045#1043#1051#1054#1042' '#1044#1052#1048#1058#1056#1054' I'#1043#1054#1056#1054#1042#1048#1063#39
      end
      item
        Name = 'NUMBER'
        Value = #39#8470#39
      end
      item
        Name = 'SUMOPL'
        Value = #39'0'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 27.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 20.000000000000000000
      BottomMargin = 20.000000000000000000
      OnAfterPrint = 'Page1OnAfterPrint'
      object ReportTitle1: TfrxReportTitle
        Height = 132.283550000000000000
        Top = 18.897650000000000000
        Width = 653.858690000000000000
        object Memo16: TfrxMemoView
          Align = baCenter
          Left = 177.637910000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          CharSpacing = 2.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ORG]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Align = baCenter
          Left = 177.637910000000000000
          Top = 18.897650000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          CharSpacing = 2.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[OTGOTD]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Align = baCenter
          Left = 287.244280000000000000
          Top = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[NAMEREP]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Align = baCenter
          Left = 287.244280000000000000
          Top = 71.811070000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[NAMEREP1]  [NUMBER]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Align = baCenter
          Left = 287.244280000000000000
          Top = 86.929190000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[NAMEREP2]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Top = 113.385900000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold, fsItalic, fsUnderline]
          Memo.Strings = (
            '[FIO]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 253.228510000000000000
        Width = 653.858690000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo1: TfrxMemoView
          Align = baLeft
          Width = 71.811016300000000000
          Height = 15.118120000000000000
          DataField = 'BEG_DATE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."BEG_DATE"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baLeft
          Left = 71.811016300000000000
          Width = 71.811016300000000000
          Height = 15.118120000000000000
          DataField = 'END_DATE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."END_DATE"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baLeft
          Left = 143.622032600000000000
          Width = 83.149611180000000000
          Height = 15.118120000000000000
          DataField = 'PAY_SUM'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."PAY_SUM"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Left = 226.771643780000000000
          Width = 64.251975830000000000
          Height = 15.118120000000000000
          DataField = 'PERCENT'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."PERCENT"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          Left = 291.023619610000000000
          Width = 94.488201180000000000
          Height = 15.118120000000000000
          DataField = 'SUM_SUBS'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."SUM_SUBS"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Left = 385.511820790000000000
          Width = 49.133858270000000000
          Height = 15.118120000000000000
          DataField = 'CNT_MONTH'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."CNT_MONTH"]')
          ParentFont = False
        end
        object MemoKatPay: TfrxMemoView
          Align = baLeft
          Left = 434.645679060000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."SUMMA"]')
          ParentFont = False
        end
        object MemoPayPeriod: TfrxMemoView
          Align = baLeft
          Left = 510.236230240000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'MemoPayPeriodOnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Left = 585.826781420000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo7OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 18.897650000000000000
        Top = 211.653680000000000000
        Width = 653.858690000000000000
        Stretched = True
        object Memo20: TfrxMemoView
          Align = baLeft
          Width = 71.811016300000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[BEGDATE]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          Left = 71.811016300000000000
          Width = 71.811016300000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ENDDATE]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          Left = 143.622032600000000000
          Width = 83.149611180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[SUMMONTH]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          Left = 226.771643780000000000
          Width = 64.251975830000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[PERSENT]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Align = baLeft
          Left = 291.023619610000000000
          Width = 94.488201180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[SUMSUB]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Align = baLeft
          Left = 385.511820790000000000
          Width = 49.133858270000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[CNTMONTH]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Align = baLeft
          Left = 434.645679060000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ALLPERIOD]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Align = baLeft
          Left = 510.236230240000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[SUMPAY]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Align = baLeft
          Left = 585.826781420000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[SUMDOLG]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 98.267780000000000000
        Top = 328.819110000000000000
        Width = 653.858690000000000000
        object Memo8: TfrxMemoView
          Width = 434.645950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[ALL]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          Left = 434.645950000000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          Left = 510.236501180000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[SUMOPL]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          Left = 585.827052360000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo11OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Align = baLeft
          Top = 41.574830000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[DATEOPL]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Align = baLeft
          Top = 79.370130000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[BUHG]')
          ParentFont = False
        end
      end
      object Memo29: TfrxMemoView
        Align = baLeft
        Top = 15.118120000000000000
        Width = 113.385900000000000000
        Height = 45.354360000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[NAMEREP0]'
          '[Date]')
        ParentFont = False
      end
    end
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Top = 32
  end
  object pFIBDataSet3: TpFIBDataSet
    Left = 64
    Top = 32
    poSQLINT64ToBCD = True
  end
end
