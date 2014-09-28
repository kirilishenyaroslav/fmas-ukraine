object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 170
  Height = 290
  Width = 440
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
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38706.462171944400000000
    ReportOptions.LastChange = 40284.613797534720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var PLine:integer=0;'
      '       groupNo, pageGroupNo: Integer;'
      '       list_plan: array of Variant;'
      '       list_fact: array of Variant;'
      '       list_vac: array of Variant;'
      '       list_vac_q: array of Variant;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  PLine:=0;'
      ''
      'end;'
      ''
      'procedure Memo25OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  inc(PLine);'
      'end;'
      ''
      'procedure GroupFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if not Engine.FinalPass then'
      '       begin'
      '              SetLength(list_plan, groupNo+1);'
      '              SetLength(list_fact, groupNo+1);'
      '              SetLength(list_vac, groupNo+1);'
      '              SetLength(list_vac_q, groupNo+1);'
      
        '              list_plan[groupNo] := <SUM(<ReportDsetData."RATE_C' +
        'OUNT_PLAN">,MasterData1)>;'
      
        '              list_fact[groupNo] := <SUM(<ReportDsetData."RATE_C' +
        'OUNT_FACT">,MasterData1)>;'
      
        '              list_vac[groupNo] := <SUM(<ReportDsetData."RATE_CO' +
        'UNT_VAC">,MasterData1)>;'
      
        '              list_vac_q[groupNo] := <SUM(<ReportDsetData."RATE_' +
        'COUNT_VAC_Q">,MasterData1)>;'
      '       end;'
      '       inc(groupNo);'
      'end;'
      ''
      'procedure PageFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   groupNo := 0;'
      '   pagegroupNo := 0;'
      'end;'
      ''
      'procedure Memo44OnBeforePrint(Sender: TfrxComponent);'
      'var'
      '    s: Double;'
      'begin'
      '       if Engine.FinalPass then'
      '       begin'
      '               if list_plan[groupNo] = Null then s := 0'
      '               else s := list_plan[groupNo];'
      '               Memo44.Text := FormatFloat('#39'##0.00'#39', s);'
      '       end;'
      'end;'
      ''
      'procedure Memo18OnBeforePrint(Sender: TfrxComponent);'
      'var'
      '    s: Double;'
      'begin'
      '       if Engine.FinalPass then'
      '       begin'
      '               if list_fact[groupNo] = Null then s := 0'
      '               else s := list_fact[groupNo];'
      '               Memo18.Text := FormatFloat('#39'##0.00'#39', s);'
      ''
      '       end;'
      'end;'
      ''
      'procedure Memo21OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Memo21OnBeforePrint(Sender: TfrxComponent);'
      'var'
      '    s: Double;'
      'begin'
      '       if Engine.FinalPass then'
      '       begin'
      '               if list_vac[groupNo] = Null then s := 0'
      '               else s := list_vac[groupNo];'
      '               Memo21.Text := FormatFloat('#39'##0.00'#39', s);'
      '       end;'
      'end;'
      ''
      'procedure Memo22OnBeforePrint(Sender: TfrxComponent);'
      'var'
      '    s: Double;'
      'begin'
      '       if Engine.FinalPass then'
      '       begin'
      '               if list_vac_Q[groupNo] = Null then s := 0'
      '               else s := list_vac_q[groupNo];'
      '               Memo22.Text := FormatFloat('#39'##0.00'#39', s);'
      '       end;'
      'end;'
      ''
      'procedure GroupHeader4OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    inc(pageGroupNo);'
      'end;'
      ''
      'procedure Page1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure GroupFooter2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
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
    Variables = <>
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
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 76.401596770000000000
        ParentFont = False
        Top = 139.842610000000000000
        Width = 1046.929810000000000000
        ReprintOnNewPage = True
        object Memo1: TfrxMemoView
          Top = 0.385826769999994200
          Width = 34.779530000000000000
          Height = 76.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470
            #1079'.'#1087'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 34.779530000000000000
          Top = 0.385826769999994200
          Width = 50.000000000000000000
          Height = 76.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1076)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 84.779530000000000000
          Top = 0.385826769999994200
          Width = 462.574830000000000000
          Height = 76.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072'/'#1060#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 627.401574800000000000
          Top = 0.385826769999994200
          Width = 103.559055120000000000
          Height = 76.015770000000000000
          OnBeforePrint = 'GroupRateCountMemoOnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1083#1072#1085#1086#1074#1072' '#1082#1110#1083#1100#1082#1110#1089#1090#1100
            #1089#1090#1072#1074#1086#1082' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 547.275590549999900000
          Top = 0.385826769999994200
          Width = 80.125984250000000000
          Height = 76.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1077#1088#1089#1086#1085#1072#1083)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 839.433070870000000000
          Top = 0.377952759999999400
          Width = 100.913385830000000000
          Height = 75.968503940000000000
          OnBeforePrint = 'GroupRateCountMemoOnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1074#1072#1082#1072#1085#1090#1085#1080#1093
            #1089#1090#1072#1074#1086#1082' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 940.126181970000000000
          Top = 0.377952759999999400
          Width = 105.015770000000000000
          Height = 75.968503940000000000
          OnBeforePrint = 'GroupRateCountMemoOnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1074#1072#1082#1072#1085#1090#1085#1080#1093' '#1089#1090#1072#1074#1086#1082' '#1079' '#1091#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084' '#1089#1091#1084#1110#1097#1077#1085#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 730.960629920000000000
          Top = 0.377952759999999400
          Width = 108.094488190000000000
          Height = 76.015770000000000000
          OnBeforePrint = 'GroupRateCountMemoOnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1072#1082#1090#1080#1095#1085#1086' '#1079#1072#1081#1085#1103#1090#1086' '#1089#1090#1072#1074#1086#1082)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 62.015770000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo17: TfrxMemoView
          Top = 34.015770000000010000
          Width = 1046.929810000000000000
          Height = 24.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1040#1050#1040#1053#1057#1030#1031' '#1064#1058#1040#1058#1053#1054#1043#1054' '#1056#1054#1047#1050#1051#1040#1044#1059' '#1085#1072' [CUR_DATE]')
          ParentFont = False
        end
      end
      object Child1: TfrxChild
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 498.897960000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'Child1OnBeforePrint'
        object Memo32: TfrxMemoView
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 52.913420000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            ':')
          ParentFont = False
        end
      end
      object Memo16: TfrxMemoView
        Top = 14.897650000000000000
        Width = 904.441560000000000000
        Height = 18.897650000000000000
        DataSetName = 'ReportDsetGlobalData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[ReportDsetData."FIRM_NAME"]')
        ParentFont = False
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 578.268090000000000000
        Width = 1046.929810000000000000
        object Memo10: TfrxMemoView
          Left = 791.684910000000000000
          Width = 252.315090000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#] '#1079' [TotalPages#]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1088#1091#1082#1091': ')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 94.488250000000000000
          Width = 79.370130000000000000
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
        object Memo33: TfrxMemoView
          Left = 181.417440000000000000
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
      object GroupHeader2: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 238.110390000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."NAME_DEPARTMENT_UPPER"'
        Stretched = True
        object Memo13: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT_UPPER"]')
          ParentFont = False
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."NAME_DEPARTMENT"'
        Stretched = True
        object Memo49: TfrxMemoView
          Left = 37.795300000000000000
          Width = 1009.134510000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsUnderline]
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT"]')
          ParentFont = False
        end
      end
      object GroupHeader4: TfrxGroupHeader
        Height = 19.779530000000000000
        Top = 321.260050000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'GroupHeader4OnBeforePrint'
        Condition = 'ReportDsetData."POST_NAME"'
        Stretched = True
        object Memo8: TfrxMemoView
          Left = 0.220470000000000000
          Width = 34.779530000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[pageGroupNo]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 86.000000000000000000
          Width = 461.574830000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."POST_NAME"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 730.929190000000000000
          Width = 108.094512600000000000
          Height = 16.000000000000000000
          OnBeforePrint = 'Memo18OnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 35.000000000000000000
          Width = 50.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."POST_CODE"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 547.275590550000000000
          Width = 80.125984251968500000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_TYPE_POST"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 839.433246610000000000
          Width = 100.535433070000000000
          Height = 16.000000000000000000
          OnBeforePrint = 'Memo21OnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 940.346651970000000000
          Width = 105.015770000000000000
          Height = 16.000000000000000000
          OnBeforePrint = 'Memo22OnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 627.401574800000000000
          Width = 103.559055120000000000
          Height = 16.000000000000000000
          OnBeforePrint = 'Memo44OnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 17.133858270000000000
        Top = 411.968770000000000000
        Visible = False
        Width = 1046.929810000000000000
        OnBeforePrint = 'GroupFooter1OnBeforePrint'
        Stretched = True
        object Memo11: TfrxMemoView
          Left = 730.960629920000000000
          Top = 1.000000000000000000
          Width = 109.606299212598400000
          Height = 15.874015750000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[SUM(<ReportDsetData."RATE_COUNT_FACT">,MasterData1)]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 839.433246610000000000
          Top = 1.133858270000019000
          Width = 100.535433070000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[SUM(<ReportDsetData."RATE_COUNT_VAC">,MasterData1)]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 940.346456690000000000
          Top = 1.133858270000019000
          Width = 105.070866140000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[SUM(<ReportDsetData."RATE_COUNT_VAC_Q">,MasterData1)]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 627.401980000000000000
          Top = 1.133858270000019000
          Width = 102.047239210000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[SUM(<ReportDsetData."RATE_COUNT_PLAN">,MasterData1)]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 27.472448270000000000
        Top = 362.834880000000000000
        Width = 1046.929810000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo14: TfrxMemoView
          Left = 0.220470000000000000
          Width = 34.779530000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 35.000000000000000000
          Width = 592.629921260000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.Strings = (
            '                             [ReportDsetData."SMETA_TITLE"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 730.960629920000000000
          Top = -0.000004880000005869
          Width = 108.094488190000000000
          Height = 15.874015750000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."RATE_COUNT_FACT"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 839.433246610000000000
          Top = 0.133858270000018800
          Width = 100.535433070000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."RATE_COUNT_VAC"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 940.346456690000000000
          Width = 105.070866140000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."RATE_COUNT_VAC_Q"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 627.401980000000000000
          Top = 0.377952760000027800
          Width = 102.047239210000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."RATE_COUNT_PLAN"]')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 453.543600000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo35: TfrxMemoView
          Left = 730.960629920000000000
          Width = 109.606299210000000000
          Height = 15.874015750000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            '[SUM(<ReportDsetData."RATE_COUNT_FACT">,MasterData1)]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 839.433246610000000000
          Width = 100.535433070000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[SUM(<ReportDsetData."RATE_COUNT_VAC">,MasterData1)]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 940.346456690000000000
          Width = 105.070866140000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[SUM(<ReportDsetData."RATE_COUNT_VAC_Q">,MasterData1)]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 627.401980000000000000
          Width = 102.047244090000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            '[SUM(<ReportDsetData."RATE_COUNT_PLAN">,MasterData1)]')
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
    Left = 328
    Top = 8
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
end
