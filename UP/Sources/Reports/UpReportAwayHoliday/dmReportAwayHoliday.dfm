object DM: TDM
  OldCreateOrder = False
  Left = 323
  Top = 138
  Height = 255
  Width = 355
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 117
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 56
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
    TimeoutAction = TACommit
    Left = 128
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39844.638798819400000000
    ReportOptions.LastChange = 39848.728191909720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var i    : integer;'
      '    s    : string;'
      '    kaf_i   : integer;'
      '    fac_i   : integer;'
      '    vnz_i   : integer;'
      ''
      'procedure ReportTitle2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    s    := '#39#39';'
      '    i    := 0;'
      '    vnz_i:=0;'
      'end;'
      ''
      ''
      ''
      'procedure Memo5OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <ReportDsetData."OUT_FIO_UA"> = s then'
      '  begin'
      '      memo5.memo.text := '#39#39';'
      '  end else'
      '  begin'
      '      i    := i + 1;'
      '      kaf_i:=kaf_i+1;'
      '      fac_i:=fac_i+1;'
      '      vnz_i:=vnz_i+1;'
      '      memo5.memo.text := intToStr(<i>);'
      '  //    ss := <ReportDsetData."OUT_POST_NAME">;'
      '  //    memo22.memo.text :=ss;'
      '  end;'
      '  s := <ReportDsetData."OUT_FIO_UA">;'
      'end;'
      ''
      'procedure Memo7OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Memo32OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    memo32.memo.text :=Inttostr(kaf_i);'
      'end;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   kaf_i  := 0;'
      'end;'
      ''
      'procedure GroupHeader2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   fac_i  := 0;'
      'end;'
      ''
      'procedure Memo33OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    memo33.memo.text :=Inttostr(fac_i);'
      'end;'
      ''
      'procedure Memo34OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   memo34.memo.text :=Inttostr(vnz_i);'
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
      object ReportTitle2: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 120.944960000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'ReportTitle2OnBeforePrint'
        object Memo3: TfrxMemoView
          Top = 45.354360000000000000
          Width = 1046.929133860000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1074#1077#1076#1077#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1087#1088#1086' '#1074#1110#1076#1082#1083#1080#1082#1080' '#1090#1072' '#1087#1077#1088#1077#1085#1086#1089#1080' '#1074#1110#1076#1087#1091#1089#1090#1086#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Top = 71.811070000000000000
          Width = 1046.929133860000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            
              #1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079' [ReportDsetData."DATE_BEG"] '#1087#1086' [ReportDsetData."DATE' +
              '_END"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 884.410020000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [CUR_DATE]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Top = 18.897650000000000000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."FIRM_NAME"]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 17.007874020000000000
        ParentFont = False
        Top = 377.953000000000000000
        Width = 1046.929810000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo5: TfrxMemoView
          Align = baLeft
          ShiftMode = smDontShift
          Width = 30.135452530000000000
          Height = 17.007874020000000000
          OnBeforePrint = 'Memo5OnBeforePrint'
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Line#]')
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          ShiftMode = smDontShift
          Left = 30.135452530000000000
          Width = 215.433070870000000000
          Height = 17.007874020000000000
          OnBeforePrint = 'Memo21OnBeforePrint'
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."OUT_FIO_UA"]')
          SuppressRepeated = True
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          ShiftMode = smDontShift
          Left = 245.568523400000000000
          Width = 181.417322830000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."OUT_POST_NAME"]')
        end
        object Memo8: TfrxMemoView
          Align = baLeft
          ShiftMode = smDontShift
          Left = 764.976719690000000000
          Width = 95.244072520000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            
              '[(<ReportDsetData."REAL_PERIOD_END">)] ([(<ReportDsetData."AWAY_' +
              'PERIOD_END">)] )')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          ShiftMode = smDontShift
          Left = 967.559055120000000000
          Width = 79.370078740157500000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."Reason"]')
          ParentFont = False
          WordBreak = True
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          ShiftMode = smDontShift
          Left = 576.378265200000000000
          Width = 92.598425200000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."PLAN_PERIOD_END"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          ShiftMode = smDontShift
          Left = 483.779840000000000000
          Width = 92.598425200000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."PLAN_PERIOD_BEG"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Align = baLeft
          ShiftMode = smDontShift
          Left = 668.976690400000000000
          Width = 96.000029290000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            
              '[ReportDsetData."REAL_PERIOD_BEG"] ([ReportDsetData."AWAY_PERIOD' +
              '_BEG"])')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 427.086890000000000000
          Width = 56.692950000000000000
          Height = 17.007866690000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_WORK_REASON"]')
        end
        object Memo36: TfrxMemoView
          Left = 859.842519690000000000
          Width = 107.716535430000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."Out_Order"]')
        end
      end
      object PageFooter2: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 582.047620000000000000
        Width = 1046.929810000000000000
        object Memo14: TfrxMemoView
          Align = baRight
          Left = 952.441560000000100000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 17.007874020000000000
        ParentFont = False
        Top = 336.378170000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = 'ReportDsetData."OUT_DEPARTMENT_NAME"'
        Stretched = True
        object Memo2: TfrxMemoView
          Width = 1046.929133860000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."OUT_DEPARTMENT_NAME"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 17.007874020000000000
        Top = 294.803340000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'GroupHeader2OnBeforePrint'
        Condition = 'ReportDsetData."OUT_DEPARTMENT_NAME_UPPER"'
        Stretched = True
        object Memo17: TfrxMemoView
          Width = 1046.929133860000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."OUT_DEPARTMENT_NAME_UPPER"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 28.346456690000000000
        ParentFont = False
        Top = 200.315090000000000000
        Width = 1046.929810000000000000
        object Memo20: TfrxMemoView
          Align = baLeft
          Width = 30.135452530000000000
          Height = 28.346456690000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470
            #1087'/'#1087)
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          Left = 30.135452530000000000
          Width = 215.433080630000000000
          Height = 28.346456690000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103', '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110)
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          Left = 245.568533160000000000
          Width = 181.417278900000000000
          Height = 28.346456690000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1081#1084#1072#1085#1072' '#1087#1086#1089#1072#1076#1072)
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          Left = 859.842475750000000000
          Width = 107.716528110000000000
          Height = 28.346456690000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1086#1084#1077#1088'/'#1076#1072#1090#1072' '#1087#1088#1086#1077#1082#1090#1091
            #1053#1086#1084#1077#1088'/'#1076#1072#1090#1072' '#1085#1072#1082#1072#1079#1091)
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 485.669247400000000000
          Width = 184.818897640000000000
          Height = 13.228346460000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1087#1083#1072#1085#1086#1074#1072#1085#1072' '#1074#1110#1076#1087#1091#1089#1090#1082#1072)
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Align = baLeft
          Left = 483.779840000000000000
          Top = 13.228346460000010000
          Width = 92.598425200000000000
          Height = 15.118110240000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047' ')
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 578.267672600000000000
          Top = 13.228346460000010000
          Width = 92.598425200000000000
          Height = 15.118110240000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086)
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 670.866097800000000000
          Width = 188.976377950000000000
          Height = 13.228346460000000000
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1077#1088#1077#1085#1086#1089'/'#1074#1110#1076#1082#1083#1080#1082' '#1074#1110#1076#1087#1091#1089#1090#1082#1080)
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 670.866097800000000000
          Top = 13.228346460000010000
          Width = 94.488188980000000000
          Height = 15.118110240000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047)
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 765.354286770000000000
          Top = 13.228346460000010000
          Width = 94.488188980000000000
          Height = 15.118110240000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086)
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 427.086890000000000000
          Width = 56.692950000000000000
          Height = 28.346456690000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1089#1090'. '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080)
        end
        object Memo35: TfrxMemoView
          Left = 967.559680000000000000
          Width = 79.370130000000000000
          Height = 28.346456690000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1084#1110#1090#1082#1072)
          VAlign = vaCenter
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 17.007874020000000000
        Top = 253.228510000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."Name_Type_Post"'
        StartNewPage = True
        object Memo28: TfrxMemoView
          Width = 1046.929133860000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."Name_Type_Post"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 17.007874020000000000
        Top = 419.527830000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo29: TfrxMemoView
          Width = 136.062992130000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086' '#1087#1086' '#1082#1072#1092#1077#1076#1088#1110':')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 136.063080000000000000
          Width = 910.866053860000000000
          Height = 17.007874020000000000
          OnBeforePrint = 'Memo32OnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 17.007874020000000000
        Top = 461.102660000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo30: TfrxMemoView
          Width = 136.063006770000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086' '#1087#1086' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1091':')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 136.063080000000000000
          Width = 910.866141730000000000
          Height = 17.007874020000000000
          OnBeforePrint = 'Memo33OnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 17.007874020000000000
        Top = 540.472790000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo31: TfrxMemoView
          Width = 136.062992130000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086' '#1087#1086' '#1042#1053#1047':')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 136.063080000000000000
          Width = 910.866141730000000000
          Height = 17.007874020000000000
          OnBeforePrint = 'Memo34OnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
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
  object PDFExp: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 272
    Top = 168
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
end
