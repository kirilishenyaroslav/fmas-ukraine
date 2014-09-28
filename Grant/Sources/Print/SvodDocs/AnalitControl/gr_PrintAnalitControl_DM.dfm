object DM: TDM
  OldCreateOrder = False
  Left = 951
  Top = 131
  Height = 281
  Width = 242
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1047#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
    ReportOptions.CreateDate = 39825.734949189800000000
    ReportOptions.LastChange = 40605.028233298610000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure ReportOnStartReport(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    OnStartReport = 'ReportOnStartReport'
    Left = 96
    Top = 72
    Datasets = <
      item
        DataSet = DBDataset
        DataSetName = 'DBDataset'
      end
      item
        DataSet = DBDataset1
        DataSetName = 'DBDataset1'
      end
      item
        DataSet = DBDataSetS
        DataSetName = 'DBDataSetS'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'DATEP'
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
      PrintIfEmpty = False
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 17.007874020000000000
        ParentFont = False
        Top = 275.905690000000000000
        Width = 1046.929810000000000000
        DataSet = DBDataset
        DataSetName = 'DBDataset'
        RowCount = 0
        Stretched = True
        object Memo6: TfrxMemoView
          ShiftMode = smDontShift
          Left = 26.456710000000000000
          Width = 60.472480000000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataField = 'SHIFR'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."SHIFR"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 86.929190000000000000
          Width = 253.228265910000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataField = 'FIO'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."FIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 857.953310000000000000
          Width = 64.251968500000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataField = 'SUM_UTRIM'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."SUM_UTRIM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 922.205320000000000000
          Width = 64.251968500000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataField = 'SUM_VIPL'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."SUM_VIPL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 789.921770000000000000
          Width = 68.031498500000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataField = 'SUM_NARAH'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."SUM_NARAH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 340.157700000000000000
          Width = 64.251968500000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."SUM_GRANT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 404.409710000000000000
          Width = 60.472438500000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataField = 'SUM_PREMIA'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."SUM_PREMIA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 464.882190000000000000
          Width = 60.472438500000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataField = 'SUM_MP'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."SUM_MP"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 525.354670000000000000
          Width = 64.251968500000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataField = 'SUM_OTHER'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."SUM_OTHER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 589.606680000000000000
          Width = 75.590558500000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataField = 'SUM_PNALOG'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."SUM_PNALOG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 665.197280000000000000
          Width = 60.472438500000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataField = 'SUM_PROFS'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."SUM_PROFS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 725.669760000000000000
          Width = 64.251968500000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataField = 'SUM_OTHER_UDERG'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."SUM_OTHER_UDERG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          ShiftMode = smDontShift
          Width = 26.456710000000000000
          Height = 17.007874020000000000
          OnBeforePrint = 'Memo6OnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 986.457330000000000000
          Width = 60.472438500000000000
          Height = 17.007874020000000000
          StretchMode = smMaxHeight
          DataField = 'DOLG'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."DOLG"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Top = 162.519790000000000000
        Width = 1046.929810000000000000
        Condition = 'DBDataset."DEP_NAME"'
        StartNewPage = True
      end
      object GroupHeader2: TfrxGroupHeader
        Top = 185.196970000000000000
        Width = 1046.929810000000000000
        Condition = 'DBDataset."KURS"'
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 45.354360000000000000
        Top = 207.874150000000000000
        Width = 1046.929810000000000000
        Condition = 'DBDataset."DEP_CHILD_NAME"'
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 857.953310000000000000
          Top = 18.897650000000000000
          Width = 64.251968500000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1090#1088#1080#1084#1072#1085#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 922.205320000000000000
          Top = 18.897650000000000000
          Width = 64.251968500000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1087#1083#1072#1095#1077#1085#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 26.456710000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1064#1048#1060#1056)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 86.929190000000000000
          Top = 18.897650000000000000
          Width = 253.228510000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1030#1054)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Width = 718.110407090000000000
          Height = 18.897650000000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              '[DBDataset."DEP_NAME"]: '#1075#1088#1091#1087#1072' "[DBDataset."DEP_CHILD_NAME"]" [DB' +
              'Dataset."KURS"] '#1082#1091#1088#1089)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 340.157700000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090#1080#1087#1077#1085#1076#1110#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 404.409710000000000000
          Top = 18.897650000000000000
          Width = 60.472438500000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1085#1072#1075#1086#1088#1086#1076#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 464.882190000000000000
          Top = 18.897650000000000000
          Width = 60.472438500000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1087#1086#1084#1086#1075#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 525.354670000000000000
          Top = 18.897650000000000000
          Width = 64.251968500000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1085#1096#1110' '#1085#1072#1088#1072#1093'.')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 589.606680000000000000
          Top = 18.897650000000000000
          Width = 75.590558500000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1076#1072#1090#1086#1082' '#1079' '#1076#1086#1093#1086#1076#1110#1074)
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 665.197280000000000000
          Top = 18.897650000000000000
          Width = 60.472438500000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1086#1092#1074#1085#1077#1089#1086#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 725.669760000000000000
          Top = 18.897650000000000000
          Width = 64.251968500000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1085#1097#1110' '#1091#1090#1088#1080#1084#1072#1085#1085#1103)
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 789.921770000000000000
          Top = 18.897650000000000000
          Width = 68.031498500000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Top = 18.897650000000000000
          Width = 26.456710000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 986.457330000000000000
          Top = 18.897650000000000000
          Width = 60.472438500000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1041#1086#1088#1075)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        Height = 24.566934020000000000
        ParentFont = False
        Top = 317.480520000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo33: TfrxMemoView
          Left = 340.157700000000000000
          Width = 64.252010000000000000
          Height = 24.566934020000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataset."SUM_GRANT">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Width = 340.157700000000000000
          Height = 24.566934020000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086':')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 404.409710000000000000
          Width = 60.472480000000000000
          Height = 24.566934020000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataset."SUM_PREMIA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 464.882190000000000000
          Width = 60.472480000000000000
          Height = 24.566934020000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataset."SUM_MP">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 525.354670000000000000
          Width = 64.252010000000000000
          Height = 24.566934020000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataset."SUM_OTHER">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 589.606680000000000000
          Width = 75.590600000000000000
          Height = 24.566934020000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataset."SUM_PNALOG">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 665.197280000000000000
          Width = 60.472480000000000000
          Height = 24.566934020000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataset."SUM_PROFS">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 725.669760000000000000
          Width = 64.252010000000000000
          Height = 24.566934020000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataset."SUM_OTHER_UDERG">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 789.921770000000000000
          Width = 68.031540000000000000
          Height = 24.566934020000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataset."SUM_NARAH">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 857.953310000000000000
          Width = 64.252010000000000000
          Height = 24.566934020000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataset."SUM_UTRIM">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 922.205320000000000000
          Width = 64.252010000000000000
          Height = 24.566934020000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataset."SUM_VIPL">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 986.457330000000000000
          Width = 60.472480000000000000
          Height = 24.566934020000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataset."DOLG">)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 37.795300000000000000
        Top = 102.047310000000000000
        Width = 1046.929810000000000000
        ReprintOnNewPage = True
        object Memo11: TfrxMemoView
          Top = 18.897650000000000000
          Width = 548.031850000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1042#1110#1076#1086#1084#1110#1089#1090#1100' '#1072#1085#1072#1083#1110#1090#1080#1095#1085#1086#1075#1086' '#1082#1086#1085#1090#1088#1086#1083#1102' '#1079#1072' [DATEP]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 593.386210000000000000
          Top = 18.897650000000000000
          Width = 453.543600000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset1."SHORT_NAME"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
      end
    end
    object Page2: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object GroupHeader5: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 30.236240000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        Condition = 'DBDataset."DEP_NAME"'
        StartNewPage = True
        Stretched = True
        object Memo13: TfrxMemoView
          Left = 857.953310000000000000
          Top = -0.000000000000000056
          Width = 64.251968500000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1090#1088#1080#1084#1072#1085#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 922.205320000000000000
          Top = -0.000000000000000056
          Width = 64.251968500000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1087#1083#1072#1095#1077#1085#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Top = -0.000000000000000056
          Width = 340.157700000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1072#1082#1091#1083#1100#1090#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 340.157700000000000000
          Top = -0.000000000000000056
          Width = 64.252010000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090#1080#1087#1077#1085#1076#1110#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 404.409710000000000000
          Top = -0.000000000000000056
          Width = 60.472438500000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1085#1072#1075#1086#1088#1086#1076#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 464.882190000000000000
          Top = -0.000000000000000056
          Width = 60.472438500000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1087#1086#1084#1086#1075#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 525.354670000000000000
          Top = -0.000000000000000056
          Width = 64.251968500000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1085#1096#1110' '#1085#1072#1088#1072#1093'.')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 589.606680000000000000
          Top = -0.000000000000000056
          Width = 75.590558500000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1076#1072#1090#1086#1082' '#1079' '#1076#1086#1093#1086#1076#1110#1074)
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 665.197280000000000000
          Top = -0.000000000000000056
          Width = 60.472438500000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1086#1092#1074#1085#1077#1089#1086#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 725.669760000000000000
          Top = -0.000000000000000056
          Width = 64.251968500000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1085#1097#1110' '#1091#1090#1088#1080#1084#1072#1085#1085#1103)
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 789.921770000000000000
          Top = -0.000000000000000056
          Width = 68.031498500000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 986.457330000000000000
          Top = -0.000000000000000056
          Width = 60.472438500000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1041#1086#1088#1075)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData3: TfrxMasterData
        Height = 28.346464020000000000
        Top = 71.811070000000000000
        Width = 1046.929810000000000000
        DataSet = DBDataSetS
        DataSetName = 'DBDataSetS'
        RowCount = 0
        Stretched = True
        object Memo56: TfrxMemoView
          Left = 340.157700000000000000
          Top = -0.000000000000000111
          Width = 64.251968500000000000
          Height = 28.346464020000000000
          StretchMode = smMaxHeight
          DataSet = DBDataSetS
          DataSetName = 'DBDataSetS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataSetS."SUM_GRANT_F"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 404.409710000000000000
          Top = -0.000000000000000111
          Width = 60.472438500000000000
          Height = 28.346464020000000000
          StretchMode = smMaxHeight
          DataSet = DBDataSetS
          DataSetName = 'DBDataSetS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataSetS."SUM_PREMIA_F"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 464.882190000000000000
          Top = -0.000000000000000111
          Width = 60.472480000000000000
          Height = 28.346464020000000000
          DataSet = DBDataSetS
          DataSetName = 'DBDataSetS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataSetS."SUM_MP_F"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 525.354670000000000000
          Top = -0.000000000000000111
          Width = 64.252010000000000000
          Height = 28.346464020000000000
          DataSet = DBDataSetS
          DataSetName = 'DBDataSetS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataSetS."SUM_OTHER_F"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 589.606680000000000000
          Top = -0.000000000000000111
          Width = 75.590600000000000000
          Height = 28.346464020000000000
          DataSet = DBDataSetS
          DataSetName = 'DBDataSetS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataSetS."SUM_PNALOG_F"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 665.197280000000000000
          Top = -0.000000000000000111
          Width = 60.472480000000000000
          Height = 28.346464020000000000
          DataSet = DBDataSetS
          DataSetName = 'DBDataSetS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataSetS."SUM_PROFS_F"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 725.669760000000000000
          Top = -0.000000000000000111
          Width = 64.252010000000000000
          Height = 28.346464020000000000
          DataSet = DBDataSetS
          DataSetName = 'DBDataSetS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataSetS."SUM_OTHER_UDERG_F"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 789.921770000000000000
          Top = -0.000000000000000111
          Width = 68.031540000000000000
          Height = 28.346464020000000000
          DataSet = DBDataSetS
          DataSetName = 'DBDataSetS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataSetS."SUM_NARAH_F"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 857.953310000000000000
          Top = -0.000000000000000111
          Width = 64.252010000000000000
          Height = 28.346464020000000000
          DataSet = DBDataSetS
          DataSetName = 'DBDataSetS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataSetS."SUM_UTRIM_F"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 922.205320000000000000
          Top = -0.000000000000000111
          Width = 64.252010000000000000
          Height = 28.346464020000000000
          DataSet = DBDataSetS
          DataSetName = 'DBDataSetS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataSetS."SUM_VIPL_F"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 986.457330000000000000
          Top = -0.000000000000000111
          Width = 60.472480000000000000
          Height = 28.346464020000000000
          DataSet = DBDataSetS
          DataSetName = 'DBDataSetS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataSetS."DOLG_F"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Top = -0.000000000000000111
          Width = 340.157658500000000000
          Height = 28.346464020000000000
          StretchMode = smMaxHeight
          DataSet = DBDataSetS
          DataSetName = 'DBDataSetS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataSetS."DEP_NAME_F"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter3: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 32.125994020000000000
        ParentFont = False
        Top = 124.724490000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo68: TfrxMemoView
          Left = 340.157700000000000000
          Top = -0.000000000000000111
          Width = 64.252010000000000000
          Height = 32.125994020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataSetS."SUM_GRANT_F">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Top = -0.000000000000000111
          Width = 340.157700000000000000
          Height = 32.125994020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086':')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 404.409710000000000000
          Top = -0.000000000000000111
          Width = 60.472480000000000000
          Height = 32.125994020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataSetS."SUM_PREMIA_F">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 464.882190000000000000
          Top = -0.000000000000000111
          Width = 60.472480000000000000
          Height = 32.125994020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataSetS."SUM_MP_F">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 525.354670000000000000
          Top = -0.000000000000000111
          Width = 64.252010000000000000
          Height = 32.125994020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataSetS."SUM_OTHER_F">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 589.606680000000000000
          Top = -0.000000000000000111
          Width = 75.590600000000000000
          Height = 32.125994020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataSetS."SUM_PNALOG_F">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 665.197280000000000000
          Top = -0.000000000000000111
          Width = 60.472480000000000000
          Height = 32.125994020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataSetS."SUM_PROFS_F">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 725.669760000000000000
          Top = -0.000000000000000111
          Width = 64.252010000000000000
          Height = 32.125994020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataSetS."SUM_OTHER_UDERG_F">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 789.921770000000000000
          Top = -0.000000000000000111
          Width = 68.031540000000000000
          Height = 32.125994020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataSetS."SUM_NARAH_F">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 857.953310000000000000
          Top = -0.000000000000000111
          Width = 64.252010000000000000
          Height = 32.125994020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataSetS."SUM_UTRIM_F">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 922.205320000000000000
          Top = -0.000000000000000111
          Width = 64.252010000000000000
          Height = 32.125994020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataSetS."SUM_VIPL_F">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 986.457330000000000000
          Top = -0.000000000000000111
          Width = 60.472480000000000000
          Height = 32.125994020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<DBDataSetS."DOLG_F">)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object DBDataset: TfrxDBDataset
    UserName = 'DBDataset'
    CloseDataSource = False
    DataSet = DataSet
    Left = 168
    Top = 72
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 24
    Top = 128
  end
  object DB: TpFIBDatabase
    DBName = '127.0.0.1:E:\'#1041#1040#1047#1067' '#1044#1040#1053#1053#1067#1061'\Rabota\FULL_DB.IB'
    DBParams.Strings = (
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 16
  end
  object DataSet: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    SelectSQL.Strings = (
      '')
    Left = 96
    Top = 16
    poSQLINT64ToBCD = True
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 24
    Top = 72
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 128
  end
  object DataSet1: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    SelectSQL.Strings = (
      '')
    Left = 168
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DBDataset1: TfrxDBDataset
    UserName = 'DBDataset1'
    CloseDataSource = False
    DataSet = DataSet1
    Left = 96
    Top = 128
  end
  object DataSetS: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    SelectSQL.Strings = (
      'SELECT * From GR_ANALIT_CONTROL_FAC('#39'190'#39')')
    Left = 24
    Top = 184
    poSQLINT64ToBCD = True
  end
  object DBDataSetS: TfrxDBDataset
    UserName = 'DBDataSetS'
    CloseDataSource = False
    DataSet = DataSetS
    Left = 96
    Top = 184
  end
end
