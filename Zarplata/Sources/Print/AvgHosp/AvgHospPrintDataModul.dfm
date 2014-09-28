object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 757
  Top = 197
  Height = 438
  Width = 380
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password='
      'user_name=Sysdba'
      'sql_role_name=')
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
    DotMatrixReport = False
    EngineOptions.ConvertNulls = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 41418.661161863430000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo13OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      ' if (<ReportDsetGlobalData."AVG_SUM1">=0) then'
      '  ShowMessage('#39#1057#1088#1077#1076#1085#1077#1077' '#1091' '#1088#1072#1073#1086#1090#1085#1080#1082#1072':'#39'+#13+'
      '               VarToStr(<ReportDsetGlobalData."TN1">)+'#39' - '#39'+'
      '               VarToStr(<ReportDsetGlobalData."FIO1">)+#13+'
      '               '#39#1088#1072#1074#1085#1086' 0!!!'#39');'
      'end;'
      ''
      'procedure Memo61OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      ' if (<ReportDsetGlobalData."AVG_SUM2">=0) then'
      '  ShowMessage('#39#1057#1088#1077#1076#1085#1077#1077' '#1091' '#1088#1072#1073#1086#1090#1085#1080#1082#1072':'#39'+#13+'
      '               VarToStr(<ReportDsetGlobalData."TN2">)+'#39' - '#39'+'
      '               VarToStr(<ReportDsetGlobalData."FIO2">)+#13+'
      '               '#39#1088#1072#1074#1085#1086' 0!!!'#39');'
      'end;'
      ''
      'procedure Memo31OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' if VarToStr(<ReportDSetFSSPredprTerms."IS_FIVE_DAYS1">)='#39#39' then'
      '    TfrxMemoView(Sender).Frame.Typ := 0'
      
        ' else TfrxMemoView(Sender).Frame.Typ :=ftTop + ftRight + ftLeft ' +
        '+ ftBottom;'
      'end;'
      ''
      'procedure Memo32OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' if VarToStr(<ReportDSetFSSPredprTerms."DATE_BEG1">)='#39#39' then'
      '   begin'
      '    TfrxMemoView(Sender).Frame.Typ := 0;'
      '    TfrxMemoView(Sender).Text := '#39#39';'
      '   end'
      
        ' else TfrxMemoView(Sender).Frame.Typ :=ftTop + ftRight + ftLeft ' +
        '+ ftBottom;'
      'end;'
      ''
      'procedure Memo33OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' if VarToStr(<ReportDSetFSSPredprTerms."HOSP_DAYS1">)='#39#39' then'
      '   begin'
      '    TfrxMemoView(Sender).Frame.Typ := 0;'
      '    TfrxMemoView(Sender).Text := '#39#39';'
      '   end'
      
        ' else TfrxMemoView(Sender).Frame.Typ :=ftTop + ftRight + ftLeft ' +
        '+ ftBottom;'
      'end;'
      ''
      'procedure Memo34OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' if VarToStr(<ReportDSetFSSPredprTerms."HOSP_SUM1">)='#39#39' then'
      '   begin'
      '    TfrxMemoView(Sender).Frame.Typ := 0;'
      '    TfrxMemoView(Sender).Text := '#39#39';'
      '   end'
      
        ' else TfrxMemoView(Sender).Frame.Typ :=ftTop + ftRight + ftLeft ' +
        '+ ftBottom;'
      'end;'
      ''
      'procedure Memo81OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '   if VarToStr(<ReportDSetFSSPredprTerms."IS_FIVE_DAYS2">)='#39#39' th' +
        'en'
      '      TfrxMemoView(Sender).Frame.Typ := 0'
      
        '   else TfrxMemoView(Sender).Frame.Typ :=ftTop + ftRight + ftLef' +
        't + ftBottom;'
      'end;'
      ''
      'procedure Memo82OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   if VarToStr(<ReportDSetFSSPredprTerms."DATE_BEG2">)='#39#39' then'
      '   begin'
      '    TfrxMemoView(Sender).Frame.Typ := 0;'
      '    TfrxMemoView(Sender).Text := '#39#39';'
      '   end'
      
        ' else TfrxMemoView(Sender).Frame.Typ :=ftTop + ftRight + ftLeft ' +
        '+ ftBottom;'
      'end;'
      ''
      'procedure Memo83OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' if VarToStr(<ReportDSetFSSPredprTerms."HOSP_DAYS2">)='#39#39' then'
      '   begin'
      '    TfrxMemoView(Sender).Frame.Typ := 0;'
      '    TfrxMemoView(Sender).Text := '#39#39';'
      '   end'
      
        ' else TfrxMemoView(Sender).Frame.Typ :=ftTop + ftRight + ftLeft ' +
        '+ ftBottom;'
      'end;'
      ''
      'procedure Memo84OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' if VarToStr(<ReportDSetFSSPredprTerms."HOSP_SUM2">)='#39#39' then'
      '   begin'
      '    TfrxMemoView(Sender).Frame.Typ := 0;'
      '    TfrxMemoView(Sender).Text := '#39#39';'
      '   end'
      
        ' else TfrxMemoView(Sender).Frame.Typ :=ftTop + ftRight + ftLeft ' +
        '+ ftBottom;'
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 168
    Datasets = <
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
      end
      item
        DataSet = ReportDSetFSSPredpr
        DataSetName = 'ReportDSetFSSPredpr'
      end
      item
        DataSet = ReportDSetFSSPredprTerms
        DataSetName = 'ReportDSetFSSPredprTerms'
      end
      item
        DataSet = ReportDSetGlobalData
        DataSetName = 'ReportDsetGlobalData'
      end
      item
        DataSet = ReportDSetSetup
        DataSetName = 'ReportDsetSetup'
      end>
    Variables = <
      item
        Name = ' User Category'
        Value = Null
      end
      item
        Name = 'PPeriod'
        Value = #39'10/2006'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 305.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      ColumnWidth = 95.000000000000000000
      Frame.Style = fsDot
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        DataSet = ReportDSetGlobalData
        DataSetName = 'ReportDsetGlobalData'
        KeepChild = True
        KeepFooter = True
        KeepHeader = True
        KeepTogether = True
        RowCount = 0
        Stretched = True
      end
      object DetailData1: TfrxDetailData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 219.212740000000000000
        Width = 718.110700000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        KeepFooter = True
        KeepHeader = True
        KeepTogether = True
        RowCount = 0
        object Memo3: TfrxMemoView
          Left = 215.433210000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."SUMMA1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 136.063080000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DAY_CLOCK1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo1: TfrxSysMemoView
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[LINE#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[P_KOD_SETUP1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 593.386210000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."SUMMA2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 514.016080000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DAY_CLOCK2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo4: TfrxSysMemoView
          Left = 377.953000000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[LINE#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 434.645950000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[P_KOD_SETUP2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          Left = 359.055350000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        KeepChild = True
        object Memo10: TfrxMemoView
          Left = 215.433210000000000000
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
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 136.063080000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[HEADER_DAY_CLOCK1]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1087'/'#1087)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1077#1088#1110#1086#1076)
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 593.386210000000000000
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
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 514.016080000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[HEADER_DAY_CLOCK2]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 377.953000000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1087'/'#1087)
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 434.645950000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1077#1088#1110#1086#1076)
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 359.055350000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
      end
      object Footer1: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 56.692950000000000000
        ParentFont = False
        Top = 260.787570000000000000
        Width = 718.110700000000000000
        KeepChild = True
        Stretched = True
        object Memo13: TfrxMemoView
          Top = 18.897650000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          OnAfterPrint = 'Memo13OnAfterPrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1057#1077#1088#1077#1076#1085#1110#1081' '#1092#1072#1082#1090'. '#1079#1072#1088#1086#1073#1110#1090#1086#1082': [ReportDsetGlobalData."AVG_SUM1"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 215.433210000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetGlobalData."SUM_ALL1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 136.063080000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[P_SUM_DAYCLOCK1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1075#1072#1083#1086#1084':')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Top = 37.795300000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Memo.Strings = (
            
              #1042#1080#1076' '#1086#1087#1077#1088#1072#1094#1110#1111': [ReportDsetGlobalData."KOD_VIDOPL1"] - [ReportDset' +
              'GlobalData."NAME_VIDOPL1"]')
        end
        object Memo61: TfrxMemoView
          Left = 377.953000000000000000
          Top = 18.897650000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          OnAfterPrint = 'Memo61OnAfterPrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1057#1077#1088#1077#1076#1085#1110#1081' '#1092#1072#1082#1090'. '#1079#1072#1088#1086#1073#1110#1090#1086#1082': [ReportDsetGlobalData."AVG_SUM2"]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 593.386210000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetGlobalData."SUM_ALL2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 514.016080000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[P_SUM_DAYCLOCK2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 377.953000000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1075#1072#1083#1086#1084':')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 377.953000000000000000
          Top = 37.795300000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Memo.Strings = (
            
              #1042#1080#1076' '#1086#1087#1077#1088#1072#1094#1110#1111': [ReportDsetGlobalData."KOD_VIDOPL2"] - [ReportDset' +
              'GlobalData."NAME_VIDOPL2"]')
        end
        object Line5: TfrxLineView
          Left = 359.055350000000000000
          Height = 56.692950000000000000
          StretchMode = smMaxHeight
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
      end
      object DetailData2: TfrxDetailData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 396.850650000000000000
        Width = 718.110700000000000000
        DataSet = ReportDSetFSSPredpr
        DataSetName = 'ReportDSetFSSPredpr'
        KeepFooter = True
        KeepHeader = True
        KeepTogether = True
        RowCount = 0
        object Memo16: TfrxMemoView
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[HEADER_IS_FIVE_DAYS1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DAY_CLOCK_HOSP1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 268.346630000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetFSSPredpr."HOSP_SUM1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 117.165430000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetGlobalData."PERCENT1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 173.858380000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetFSSPredpr."AVG_REAL1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 377.953000000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[HEADER_IS_FIVE_DAYS2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 415.748300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DAY_CLOCK_HOSP2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 646.299630000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetFSSPredpr."HOSP_SUM2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 495.118430000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetGlobalData."PERCENT2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 551.811380000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetFSSPredpr."AVG_REAL2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line7: TfrxLineView
          Left = 359.055350000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
      end
      object Header2: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 34.015770000000000000
        ParentFont = False
        Top = 340.157700000000000000
        Width = 718.110700000000000000
        KeepChild = True
        object Memo18: TfrxMemoView
          Width = 37.795300000000000000
          Height = 34.015770000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 34.015770000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[HEADER_DAY_CLOCK_HOSP1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 268.346630000000000000
          Width = 71.811070000000000000
          Height = 34.015770000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1085#1072#1088#1072#1093#1086#1074#1072#1085#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 117.165430000000000000
          Width = 56.692950000000000000
          Height = 34.015770000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '% '#1076#1086#1087#1086#1084#1086#1075#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 173.858380000000000000
          Width = 94.488250000000000000
          Height = 34.015770000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1084#1110#1088' '#1076#1077#1085'./'#1075#1086#1076'. '#1076#1086#1087#1086#1084#1086#1075#1080)
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 377.953000000000000000
          Width = 37.795300000000000000
          Height = 34.015770000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 415.748300000000000000
          Width = 79.370130000000000000
          Height = 34.015770000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[HEADER_DAY_CLOCK_HOSP2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 646.299630000000000000
          Width = 71.811070000000000000
          Height = 34.015770000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1085#1072#1088#1072#1093#1086#1074#1072#1085#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 495.118430000000000000
          Width = 56.692950000000000000
          Height = 34.015770000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '% '#1076#1086#1087#1086#1084#1086#1075#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 551.811380000000000000
          Width = 94.488250000000000000
          Height = 34.015770000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1084#1110#1088' '#1076#1077#1085'./'#1075#1086#1076'. '#1076#1086#1087#1086#1084#1086#1075#1080)
          ParentFont = False
        end
        object Line6: TfrxLineView
          Left = 359.055350000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
      end
      object Footer2: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 26.456710000000000000
        ParentFont = False
        Top = 438.425480000000000000
        Width = 718.110700000000000000
        KeepChild = True
        object Memo23: TfrxMemoView
          Left = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM_DAY_CLOCK_HOSP1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1059)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 268.346630000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDSetFSSPredpr."HOSP_SUM1">,DetailData2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 117.165430000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 173.858380000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 415.748300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM_DAY_CLOCK_HOSP2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 377.953000000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1059)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 646.299630000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDSetFSSPredpr."HOSP_SUM2">,DetailData2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 495.118430000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 551.811380000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Line8: TfrxLineView
          Left = 359.055350000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
      end
      object DetailData3: TfrxDetailData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 487.559370000000000000
        Width = 718.110700000000000000
        DataSet = ReportDSetFSSPredprTerms
        DataSetName = 'ReportDSetFSSPredprTerms'
        KeepChild = True
        KeepFooter = True
        KeepHeader = True
        KeepTogether = True
        RowCount = 0
        object Memo31: TfrxMemoView
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo31OnBeforePrint'
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[HEADER_IS_FIVE_DAYS_TERMS1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 37.795300000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo32OnBeforePrint'
          DataSet = ReportDSetFSSPredprTerms
          DataSetName = 'ReportDSetFSSPredprTerms'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              '[ReportDSetFSSPredprTerms."DATE_BEG1"] - [ReportDSetFSSPredprTer' +
              'ms."DATE_END1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 192.756030000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo33OnBeforePrint'
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DAY_CLOCK_HOSP_TERMS1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 264.567100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo34OnBeforePrint'
          DataSet = ReportDSetFSSPredprTerms
          DataSetName = 'ReportDSetFSSPredprTerms'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetFSSPredprTerms."HOSP_SUM1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 377.953000000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo81OnBeforePrint'
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[HEADER_IS_FIVE_DAYS_TERMS2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 415.748300000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo82OnBeforePrint'
          DataSet = ReportDSetFSSPredprTerms
          DataSetName = 'ReportDSetFSSPredprTerms'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            
              '[ReportDSetFSSPredprTerms."DATE_BEG2"] - [ReportDSetFSSPredprTer' +
              'ms."DATE_END2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 570.709030000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo83OnBeforePrint'
          DataSet = ReportDSetFSSPredpr
          DataSetName = 'ReportDSetFSSPredpr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DAY_CLOCK_HOSP_TERMS2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo84OnBeforePrint'
          DataSet = ReportDSetFSSPredprTerms
          DataSetName = 'ReportDSetFSSPredprTerms'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetFSSPredprTerms."HOSP_SUM2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line9: TfrxLineView
          Left = 359.055350000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 113.385900000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Condition = 'ReportDsetGlobalData."ID"'
        KeepTogether = True
        Stretched = True
        object Memo1: TfrxMemoView
          Top = 18.897650000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            
              #1083'/'#1083' '#8470'[ReportDsetGlobalData."SERIA1"] [ReportDsetGlobalData."NOME' +
              'R1"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 75.590600000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1058#1072#1073'. '#8470)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 56.692950000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1087#1088#1086' '#1086#1073#1095#1080#1089#1083#1077#1085#1085#1103' '#1089#1077#1088#1077#1076#1085#1100#1086#1111' '#1079'-'#1090#1080' '#1076#1083#1103' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1072' '#1074#1080#1087#1083#1072#1090' '#1087#1086)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Top = 37.795300000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1079)
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Top = 94.488250000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            
              #1055#1110#1076#1088#1086#1079#1076#1110#1083': [ReportDsetGlobalData."KOD_DEPARTMENT1"] - [ReportDse' +
              'tGlobalData."NAME_DEPARTMENT1"]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 136.063080000000000000
          Top = 18.897650000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            ' ([P_TYPE_HOSPLIST1])')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 52.913420000000000000
          Top = 75.590600000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetGlobalData."TN1"] - [ReportDsetGlobalData."FIO1"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo38: TfrxMemoView
          Left = 11.338590000000000000
          Top = 37.795300000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetGlobalData."DATE_BEG1"]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 83.149660000000000000
          Top = 37.795300000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Memo.Strings = (
            #1087#1086)
        end
        object Memo40: TfrxMemoView
          Left = 98.267780000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            ' [ReportDsetGlobalData."DATE_END1"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 283.464750000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          HAlign = haRight
          Memo.Strings = (
            '[<PPeriod>]')
        end
        object Memo42: TfrxMemoView
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDSetSetup
          DataSetName = 'ReportDsetSetup'
          Memo.Strings = (
            '[ReportDsetSetup."SHORT_NAME"]')
        end
        object Memo43: TfrxMemoView
          Left = 377.953000000000000000
          Top = 18.897650000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            
              #1083'/'#1083' '#8470'[ReportDsetGlobalData."SERIA2"] [ReportDsetGlobalData."NOME' +
              'R2"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 377.953000000000000000
          Top = 75.590600000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1058#1072#1073'. '#8470)
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 377.953000000000000000
          Top = 56.692950000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1087#1088#1086' '#1086#1073#1095#1080#1089#1083#1077#1085#1085#1103' '#1089#1077#1088#1077#1076#1085#1100#1086#1111' '#1079'-'#1090#1080' '#1076#1083#1103' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1072' '#1074#1080#1087#1083#1072#1090' '#1087#1086)
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 377.953000000000000000
          Top = 37.795300000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1079)
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 377.953000000000000000
          Top = 94.488250000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            
              #1055#1110#1076#1088#1086#1079#1076#1110#1083': [ReportDsetGlobalData."KOD_DEPARTMENT2"] - [ReportDse' +
              'tGlobalData."NAME_DEPARTMENT2"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 514.016080000000000000
          Top = 18.897650000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            ' ([P_TYPE_HOSPLIST2])')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 430.866420000000000000
          Top = 75.590600000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetGlobalData."TN2"] - [ReportDsetGlobalData."FIO2"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo50: TfrxMemoView
          Left = 389.291590000000000000
          Top = 37.795300000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetGlobalData."DATE_BEG2"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 461.102660000000000000
          Top = 37.795300000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Memo.Strings = (
            #1087#1086)
        end
        object Memo52: TfrxMemoView
          Left = 476.220780000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            ' [ReportDsetGlobalData."DATE_END2"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 661.417750000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          HAlign = haRight
          Memo.Strings = (
            '[<PPeriod>]')
        end
        object Memo54: TfrxMemoView
          Left = 377.953000000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDSetSetup
          DataSetName = 'ReportDsetSetup'
          Memo.Strings = (
            '[ReportDsetSetup."SHORT_NAME"]')
        end
        object Line2: TfrxLineView
          Left = 359.055350000000000000
          Height = 113.385900000000000000
          StretchMode = smMaxHeight
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 30.236240000000000000
        Top = 529.134200000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          Top = 30.236240000000000000
          Width = 718.110700000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line10: TfrxLineView
          Left = 359.055350000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
        object Memo85: TfrxMemoView
          Top = 3.779530000000020000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1056#1077#1082#1090#1086#1088' ______________')
        end
        object Memo87: TfrxMemoView
          Left = 166.078850000000000000
          Top = 3.779530000000020000
          Width = 174.000000000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1043#1086#1083'. '#1073#1091#1093#1075#1072#1083#1090#1077#1088' __________')
        end
        object Memo86: TfrxMemoView
          Left = 377.953000000000000000
          Top = 3.779530000000020000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1056#1077#1082#1090#1086#1088' ______________')
        end
        object Memo88: TfrxMemoView
          Left = 544.031850000000000000
          Top = 3.779530000000020000
          Width = 174.000000000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1043#1086#1083'. '#1073#1091#1093#1075#1072#1083#1090#1077#1088' __________')
        end
      end
    end
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Z_HOSP_LIST_DATA'
      '    (144312) ')
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
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_COUNT_AVG_PAYMENT_HOSP(?BEG_KOD_SETUP,6,?ID_MAN_' +
        'HOSP)')
    DataSource = DSourceGlobalData
    Left = 40
    Top = 184
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 168
    Top = 188
  end
  object DSetSetup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      '')
    Left = 40
    Top = 88
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDSetSetup: TfrxDBDataset
    UserName = 'ReportDsetSetup'
    CloseDataSource = False
    DataSet = DSetSetup
    Left = 172
    Top = 96
  end
  object DSourceGlobalData: TDataSource
    DataSet = DSetGlobalData
    Left = 272
    Top = 268
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 48
  end
  object DSetFSSPredpr: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_COUNT_AVG_PAYMENT_HOSP(?BEG_KOD_SETUP,6,?ID_MAN_' +
        'HOSP)')
    DataSource = DSourceGlobalData
    Left = 40
    Top = 238
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDSetFSSPredpr: TfrxDBDataset
    UserName = 'ReportDSetFSSPredpr'
    CloseDataSource = False
    DataSet = DSetFSSPredpr
    Left = 168
    Top = 236
  end
  object DSetFSSPredprTerms: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_COUNT_AVG_PAYMENT_HOSP(?BEG_KOD_SETUP,6,?ID_MAN_' +
        'HOSP)')
    DataSource = DSourceGlobalData
    Left = 40
    Top = 286
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDSetFSSPredprTerms: TfrxDBDataset
    UserName = 'ReportDSetFSSPredprTerms'
    CloseDataSource = False
    DataSet = DSetFSSPredprTerms
    Left = 168
    Top = 284
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 272
    Top = 16
  end
  object frxRTFExport1: TfrxRTFExport
    ExportNotPrintable = True
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 272
    Top = 72
  end
  object DataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_COUNT_AVG_PAYMENT_HOSP(?BEG_KOD_SETUP,6,?ID_MAN_' +
        'HOSP)')
    Left = 48
    Top = 342
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
end
