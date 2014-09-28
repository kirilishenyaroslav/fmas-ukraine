object DM: TDM
  OldCreateOrder = False
  Left = 469
  Top = 539
  Height = 316
  Width = 364
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
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
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39604.616261018500000000
    ReportOptions.LastChange = 40662.603039629630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      
        'procedure AppStyle(Memo: TfrxMemoView; App: Boolean; Center: Boo' +
        'lean = False);'
      'begin'
      '    if App then'
      '       begin'
      '               Memo.Font.Style := fsBold;'
      '               if Center then'
      '                      Memo.HAlign := haCenter;'
      '               Memo.Color := $F0F0F0;'
      '       end'
      '       else'
      '       begin'
      '               Memo.Font.Style := 0;'
      '               if Center then'
      '                       Memo.HAlign := haLeft;'
      '               Memo.Color := clWhite;'
      '       end'
      'end;'
      ''
      ''
      'procedure Memo1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure ReportOnStartReport(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Memo5OnBeforePrint(Sender: TfrxComponent);'
      'var pl, fc, diff: Variant;'
      'begin'
      '  { pl:=<ReportDsetData."kol_stavok">;'
      '   fc:=<ReportDsetData."Rate_Count_Fact_Q">;'
      '   diff:=pl-fc;'
      '   memo5.Text:=diff;    }'
      'end;'
      ''
      'procedure Memo51OnBeforePrint(Sender: TfrxComponent);'
      'var post_name, print_post_name: string;'
      'begin'
      ''
      
        '{[IIF(<ReportShrFio."NAME_POST"> <><ReportDsetData."POST_NAME">+' +
        #39' '#39'+<ReportDsetData."ADD_NAME">,<ReportShrFio."NAME_POST">,'#39#39')]}'
      '{  if <ReportDsetData."ADD_NAME"> <> '#39#39' then'
      
        '       post_name := <ReportDsetData."POST_NAME">+'#39' '#39' + '#39' '#39'+<Repo' +
        'rtDsetData."ADD_NAME">'
      '  else post_name := <ReportDsetData."POST_NAME">;'
      '  if <ReportShrFio."NAME_POST"> <> post_name then'
      '       print_post_name := <ReportShrFio."NAME_POST">'
      '  else print_post_name := '#39#39';'
      
        '  Memo51.Text := '#39'   '#39' + <ReportShrFio."FIO"> + '#39' ('#1058#1053' '#39' + IntToS' +
        'tr(<ReportShrFio."TN">) + '#39') <i>'#39' + print_post_name + '#39'</i>'#39';'
      '}'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnStartReport = 'ReportOnStartReport'
    Left = 200
    Datasets = <
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
      end
      item
        DataSet = ReportShrFio
        DataSetName = 'ReportShrFio'
      end>
    Variables = <
      item
        Name = 'UseColumn5'
        Value = 'False'
      end
      item
        Name = 'Act_Date'
        Value = #39'09.06.2008'#39
      end
      item
        Name = 'PostTotals'
        Value = 'False'
      end
      item
        Name = 'DepartmentTotals'
        Value = 'False'
      end
      item
        Name = 'SmetaTotals'
        Value = 'False'
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
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 18.897637800000000000
        ParentFont = False
        Top = 291.023810000000000000
        Width = 718.110700000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        PrintIfDetailEmpty = True
        RowCount = 0
        object Memo1: TfrxMemoView
          Align = baLeft
          Width = 443.000000000000000000
          Height = 18.897637800000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."POST_NAME"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 442.204724410000000000
          Width = 83.149606299212600000
          Height = 18.897637800000000000
          DataSetName = 'Data'
          DisplayFormat.FormatStr = '%.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."KOL_STAVOK"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 525.354330710000000000
          Width = 105.826771650000000000
          Height = 18.897637800000000000
          DataSetName = 'Data'
          DisplayFormat.FormatStr = '%.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."RATE_COUNT_FACT_Q"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Align = baRight
          Left = 631.181566140000000000
          Width = 86.929133860000000000
          Height = 18.897637800000000000
          OnBeforePrint = 'Memo5OnBeforePrint'
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[<ReportDsetData."KOL_STAVOK">-<ReportDsetData."RATE_COUNT_FACT_' +
              'Q">]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.000000000000000000
        ParentFont = False
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        Condition = 'ReportDsetData."LOC_ID_DEPARTMENT"'
        Stretched = True
        object Memo2: TfrxMemoView
          Align = baClient
          Width = 718.110700000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          Color = 14737632
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              #1055#1110#1076#1088#1086#1079#1076#1110#1083': [ReportDsetData."Name_Cafedra"] [IIF(<ReportDsetData.' +
              '"DEPARTMENT_CODE"> <> '#39#39' , '#39'('#39'+<ReportDsetData."DEPARTMENT_CODE"' +
              '>+'#39')'#39','#39#39')]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 20.000000000000000000
        Top = 207.874150000000000000
        Width = 718.110700000000000000
        Condition = 'ReportDsetData."SMETA_TITLE"'
        Stretched = True
        object Memo9: TfrxMemoView
          Align = baClient
          Width = 718.110700000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              #1041#1102#1076#1078#1077#1090': [ReportDsetData."SMETA_TITLE"] ([ReportDsetData."SMETA_K' +
              'OD"])')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 47.000000000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        object Memo12: TfrxMemoView
          Align = baLeft
          Top = 22.000000000000000000
          Width = 443.000000000000000000
          Height = 25.000000000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          Color = 14737632
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1054#1057#1040#1044#1040)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 442.205010000000000000
          Top = 21.921259840000000000
          Width = 83.149606299212600000
          Height = 24.944881890000000000
          Color = 14737632
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1051#1040#1053)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 525.354330708661000000
          Top = 21.921259840000000000
          Width = 105.826771653543000000
          Height = 24.944881890000000000
          Color = 14737632
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1040#1050#1058)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 631.181102362205100000
          Top = 21.921259840000000000
          Width = 86.929133858267700000
          Height = 24.944881890000000000
          Color = 14737632
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1030#1044#1061#1048#1051#1045#1053#1053#1071)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 62.000000000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo49: TfrxMemoView
          Top = 12.000000000000000000
          Width = 718.110700000000000000
          Height = 35.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            
              #1057#1050#1054#1056#1054#1063#1045#1053#1040' '#1060#1054#1056#1052#1040' '#1042#1048#1050#1054#1053#1040#1053#1053#1071' '#1064#1058#1040#1058#1053#1054#1043#1054' '#1056#1054#1047#1050#1051#1040#1044#1059' '#1053#1040' [ReportDsetData."' +
              'Out_Date_Beg"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 18.897650000000000000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        DataSet = ReportShrFio
        DataSetName = 'ReportShrFio'
        RowCount = 0
        Stretched = True
        object Memo51: TfrxMemoView
          Width = 442.960629920000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo51OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            
              '    [ReportShrFio."FIO"] ('#1058#1053' [ReportShrFio."TN"])  <i>[IIF(<Repo' +
              'rtShrFio."NAME_POST"> <><ReportDsetData."FULL_POST_NAME">,<Repor' +
              'tShrFio."NAME_POST">,'#39#39')]</i>')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 525.354330708661000000
          Width = 105.826771653543000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[ReportShrFio."KOL_STAVOK"][IIF(<ReportShrFio."TEMPFREE">='#39'T'#39','#39' ' +
              '('#1090#1080#1084#1095'. '#1074#1110#1083#1100#1085#1086')'#39','#39#39')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Align = baRight
          Left = 631.181566140000000000
          Width = 86.929133860000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 442.204724410000000000
          Width = 83.149606299212600000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 593.386210000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Top = 3.779530000000022000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1088#1091#1082#1091': [ReportDsetData."Cur_Date"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 536.693260000000000000
          Top = 3.779530000000022000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
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
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 374.173470000000000000
        Visible = False
        Width = 718.110700000000000000
      end
      object ReportSummary1: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 548.031849999999900000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          Width = 442.960629920000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1047#1072#1075#1072#1083#1100#1085#1080#1081' '#1087#1110#1076#1089#1091#1084#1086#1082':')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 525.354330710000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."RATE_COUNT_FACT_Q">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 442.204724410000000000
          Width = 83.149606299212600000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."KOL_STAVOK">)]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Align = baRight
          Left = 631.181566140000000000
          Width = 86.929133860000000000
          Height = 18.897637800000000000
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[SUM(<ReportDsetData."KOL_STAVOK"> - <ReportDsetData."RATE_COUNT' +
              '_FACT_Q">, MasterData1)]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 419.527830000000000000
        Width = 718.110700000000000000
        object Memo16: TfrxMemoView
          Top = 3.779530000000022000
          Width = 442.960629920000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1056#1072#1079#1086#1084' '#1079#1072' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1086#1084':')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 525.354330710000000000
          Top = 3.779530000000022000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."RATE_COUNT_FACT_Q">, MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 442.204724410000000000
          Top = 3.779530000000022000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."KOL_STAVOK">)]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Align = baRight
          Left = 631.181566140000000000
          Top = 3.779530000000022000
          Width = 86.929133860000000000
          Height = 18.897637800000000000
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[SUM(<ReportDsetData."KOL_STAVOK"> - <ReportDsetData."RATE_COUNT' +
              '_FACT_Q">, MasterData1)]')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 464.882190000000000000
        Width = 718.110700000000000000
        object Memo23: TfrxMemoView
          Top = 3.779530000000022000
          Width = 442.960629920000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1056#1072#1079#1086#1084' '#1079#1072' '#1073#1102#1076#1078#1077#1090#1086#1084' ([ReportDsetData."SMETA_KOD"]):')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 525.354330710000000000
          Top = 3.779530000000022000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."RATE_COUNT_FACT_Q">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 442.204724410000000000
          Top = 3.779530000000022000
          Width = 83.149606299212600000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."KOL_STAVOK">)]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Align = baRight
          Left = 631.181566140000000000
          Top = 3.779530000000022000
          Width = 86.929133860000000000
          Height = 18.897637800000000000
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[SUM(<ReportDsetData."KOL_STAVOK"> - <ReportDsetData."RATE_COUNT' +
              '_FACT_Q">, MasterData1)]')
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
    Left = 208
    Top = 176
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 272
    Top = 184
  end
  object ReportShrFio: TfrxDBDataset
    UserName = 'ReportShrFio'
    CloseDataSource = False
    DataSet = ShrFioSet
    Left = 40
    Top = 200
  end
  object ShrFioSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSource
    Left = 136
    Top = 184
    poSQLINT64ToBCD = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object DSource: TDataSource
    DataSet = DSetData
    Left = 112
    Top = 232
  end
end
