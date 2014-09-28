object frmST_PAY: TfrmST_PAY
  Left = 569
  Top = 288
  Width = 247
  Height = 124
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
      '    ST_TMP_DOC_SELECT(:param_session) '
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
    ReportOptions.LastChange = 39345.418345520800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  dolg_summa:Variant;'
      ''
      'procedure Memo12OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if  dolg_summa>0 then'
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
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <REC>>=25 then'
      '    begin'
      '      Page1.BottomMargin:=55;'
      '    end;'
      'end;'
      ''
      'procedure Memo18OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <ST_MAIN_PEOPLE>='#39#39' then'
      '    Memo18.Text:='#39#39';'
      'end;'
      ''
      'begin'
      '  dolg_summa:= <DOLG_OPL>;'
      'end.')
    OnPrintReport = frxReportPrintReport
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = 'NAMEREP0'
        Value = #39#1056#1072#1089#1095#1077#1090' '#1085#1072#39
      end
      item
        Name = 'DATEOPL'
        Value = #39'01.06.2006'#39
      end
      item
        Name = 'ALL_SUM_CAP'
        Value = #39#1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072' '#1086#1087#1083#1072#1090#1099' '#1079#1072' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1077':'#39
      end
      item
        Name = 'NUM'
        Value = #39#8470' '#1087'/'#1087#39
      end
      item
        Name = 'DOC'
        Value = #39#1044#1086#1082#1091#1084#1077#1085#1090' '#8470#39
      end
      item
        Name = 'SUM'
        Value = #39#1057#1091#1084#1084#1072' '#1075#1088#1085#39
      end
      item
        Name = 'OSN_DOC'
        Value = #39#1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072#39
      end
      item
        Name = 'ITOGO'
        Value = #39#1048#1090#1086#1075#1086':'#39
      end
      item
        Name = 'ALL_SUM'
        Value = #39#1042#1089#1077#1075#1086':'#39
      end
      item
        Name = 'OPL_SUM'
        Value = #39#1054#1087#1083#1072#1095#1077#1085#1086':'#39
      end
      item
        Name = 'NEED_OPL'
        Value = #39#1050' '#1086#1087#1083#1072#1090#1077':'#39
      end
      item
        Name = 'DOLG'
        Value = #39#1044#1086#1083#1075':'#39
      end
      item
        Name = 'OSN'
        Value = 
          #39#1065#1045#1043#1051#1054#1042' '#1057#1045#1056#1043#1045#1049' '#1057#1045#1056#1043#1045#1045#1042#1048#1063' '#1076#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1086' '#1087#1088#1086#1078#1080#1074#1072#1077#1090' '#1074'  , ,'#1091#1083'. '#1076'. c ' +
          '01.09.2001 '#1087#1086' 01.06.2006'#39
      end
      item
        Name = 'BUHG'
        Value = #39#1041#1091#1093#1075#1072#1083#1090#1077#1088#39
      end
      item
        Name = 'DIR'
        Value = #39#1044#1080#1088#1077#1082#1090#1086#1088' '#1089#1090#1091#1076#1075#1086#1088#1086#1076#1082#1072#39
      end
      item
        Name = 'ORG'
        Value = #39#1044#1086#1085#1077#1094#1100#1082#1080#1081' '#1085#1072#1094#1110#1086#1085#1072#1083#1100#1085#1080#1081' '#1091#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090#39
      end
      item
        Name = 'OTGOTD'
        Value = #39#1057#1090#1091#1076#1084'i'#1089#1090#1077#1095#1082#1086#39
      end
      item
        Name = 'NUMBER'
        Value = #39#1057#1087#1088#1072#1074#1082#1072'  '#8470' 100193'#39
      end
      item
        Name = 'REAL_NEED_OPL'
        Value = #39'2464,58'#39
      end
      item
        Name = 'DOLG_OPL'
        Value = #39'0'#39
      end
      item
        Name = 'GRN'
        Value = #39#1075#1088#1085#39
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
        Name = 'REC'
        Value = #39'32'#39
      end
      item
        Name = 'ST_MAIN_PEOPLE'
        Value = #39#1048'.'#1043'. '#1055#1072#1083#1082#1080#1085#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 27.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 15.000000000000000000
      BottomMargin = 15.000000000000000000
      OnBeforePrint = 'Page1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        Height = 154.960730000000000000
        Top = 18.897650000000000000
        Width = 653.858690000000000000
        OnAfterPrint = 'ReportTitle1OnAfterPrint'
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
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 83.149660000000000000
          Width = 650.079160000000000000
          Height = 34.015770000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[OSN]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          Top = 120.944960000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[ALL_SUM_CAP]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Align = baLeft
          Left = 151.181200000000000000
          Top = 120.944960000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[REAL_NEED_OPL] [GRN]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Align = baCenter
          Left = 287.244280000000000000
          Top = 49.133889999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[NUMBER]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 275.905690000000000000
        Width = 653.858690000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Align = baLeft
          Width = 37.795246300000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Line].')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baLeft
          Left = 37.795246300000000000
          Width = 188.976446300000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.Strings = (
            '[frxDBDataset1."DOC_NOMER_COMBO"],'
            #1086#1090' [frxDBDataset1."DATE_DOC"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baLeft
          Left = 226.771692600000000000
          Width = 83.149611180000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
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
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."SUMMA"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Left = 309.921303780000000000
          Width = 336.378135830000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
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
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.Strings = (
            '[frxDBDataset1."NOTE"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 18.897650000000000000
        Top = 234.330860000000000000
        Width = 653.858690000000000000
        Stretched = True
        object Memo20: TfrxMemoView
          Align = baLeft
          Width = 37.795246300000000000
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
            '[NUM]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          Left = 37.795246300000000000
          Width = 188.976446300000000000
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
            '[DOC]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          Left = 226.771692600000000000
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
            '[SUM]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          Left = 309.921303780000000000
          Width = 336.378135830000000000
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
            '[OSN_DOC]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 162.519790000000000000
        Top = 393.071120000000000000
        Width = 653.858690000000000000
        object Memo12: TfrxMemoView
          Align = baLeft
          Top = 94.488249999999990000
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
        object Memo9: TfrxMemoView
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[ALL_SUM]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 37.795300000000000000
          Top = 22.677180000000020000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[NEED_OPL]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 37.795300000000000000
          Top = 41.574830000000020000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[OPL_SUM]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Top = 71.811069999999970000
          Width = 415.748300000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
        end
        object Memo14: TfrxMemoView
          Left = 37.795300000000000000
          Top = 75.590599999999990000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[DOLG]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Top = 143.622140000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[BUHG]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Top = 117.165430000000000000
          Width = 453.543600000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo18OnBeforePrint'
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[DIR]                   [ST_MAIN_PEOPLE]')
          ParentFont = False
        end
        object MemoNEED_OPL: TfrxMemoView
          Left = 226.771800000000000000
          Top = 22.677180000000020000
          Width = 83.149660000000000000
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
          Memo.Strings = (
            '[REAL_NEED_OPL]')
          ParentFont = False
        end
        object MemoOPL_SUM: TfrxMemoView
          Left = 226.771800000000000000
          Top = 41.574830000000020000
          Width = 83.149660000000000000
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
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
          ParentFont = False
        end
        object MemoSUM_DOLG: TfrxMemoView
          Left = 226.771800000000000000
          Top = 75.590599999999990000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[DOLG_OPL]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 309.921460000000000000
          Top = 22.677180000000020000
          Width = 113.385900000000000000
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
            '[GRN]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 309.921460000000000000
          Top = 41.574830000000020000
          Width = 113.385900000000000000
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
            '[GRN]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 309.921460000000000000
          Top = 75.590599999999990000
          Width = 113.385900000000000000
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
            '[GRN]')
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
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 313.700990000000000000
        Width = 653.858690000000000000
        object Memo6: TfrxMemoView
          Align = baLeft
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[ITOGO]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 226.771800000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
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
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Align = baLeft
          Left = 309.921460000000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
        end
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
  object Database: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 144
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TACommit
    Left = 176
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 144
    Top = 32
  end
  object ActionList1: TActionList
    Left = 177
    Top = 29
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 57412
      OnExecute = Action1Execute
    end
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Top = 64
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 32
    Top = 64
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 64
    Top = 64
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
    Left = 96
    Top = 64
  end
end
