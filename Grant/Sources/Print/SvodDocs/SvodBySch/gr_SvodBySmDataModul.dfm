object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 570
  Top = 232
  Height = 470
  Width = 412
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = UpdateTransaction
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
  object DSetCategoryGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 134
    poSQLINT64ToBCD = True
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.ConvertNulls = False
    EngineOptions.DoublePass = True
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 39594.640643969910000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Footer5OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' if (<PSumRazbalans>='#39' '#39') then Footer5.Visible:=False'
      '  else Footer5.Visible:=True;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 168
    Datasets = <
      item
        DataSet = ReportDSetCategoryGroup
        DataSetName = 'ReportDSetCategoryGroup'
      end
      item
        DataSet = ReportDBDSetFoundationData
        DataSetName = 'ReportDBDSetFoundationData'
      end
      item
        DataSet = ReportDsetPropPaymGroup
        DataSetName = 'ReportDsetPropPaymGroup'
      end
      item
        DataSet = ReportDSetUDGroup
        DataSetName = 'ReportDSetUDGroup'
      end
      item
        DataSet = ReportDSetNotPodNalGroup
        DataSetName = 'ReportDSetNotPodNalGroup'
      end
      item
        DataSet = ReportDsetGrSheet
        DataSetName = 'ReportDsetGrSheet'
      end
      item
        DataSet = ReportDsetDolg
        DataSetName = 'ReportDsetDolg'
      end
      item
        DataSet = ReportUserDSet
        DataSetName = 'ReportUserDSet'
      end>
    Variables = <
      item
        Name = ' User Category'
        Value = Null
      end
      item
        Name = 'PSumBalans'
        Value = '2148220,58'
      end
      item
        Name = 'PSumGr'
        Value = '2148220,58'
      end
      item
        Name = 'PSumBalans'
        Value = '2148220,58'
      end
      item
        Name = 'PSumRazbalans'
        Value = #39' '#39
      end
      item
        Name = 'PSumVopl'
        Value = Null
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 25.000000000000000000
      RightMargin = 15.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Header1: TfrxHeader
        Height = 38.574830000000000000
        Top = 200.315090000000000000
        Width = 642.520100000000000000
        object Memo5: TfrxMemoView
          Top = 18.897650000000000000
          Width = 509.236550000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetCategoryGroup
          DataSetName = 'ReportDSetCategoryGroup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072' '#1082#1072#1090#1077#1075#1086#1088#1110#1103#1084#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 517.795275590000000000
          Top = 18.897650000000000000
          Width = 85.795300000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetCategoryGroup
          DataSetName = 'ReportDSetCategoryGroup'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 510.236220470000000000
          Top = 18.897650000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            ':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line11: TfrxLineView
          Width = 604.945270000000000000
          Frame.Typ = [ftTop]
        end
        object Memo54: TfrxMemoView
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDBDSetFoundationData
          DataSetName = 'ReportDBDSetFoundationData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1086#1084#1110#1089#1090#1100' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1090#1072' '#1091#1090#1088#1080#1084#1072#1085#1100' '#1079#1072' [PKOD_SETUP]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 298.582870000000000000
        Width = 642.520100000000000000
        object Memo16: TfrxMemoView
          Width = 509.236550000000000000
          Height = 15.118120000000000000
          DataSet = ReportDSetCategoryGroup
          DataSetName = 'ReportDSetCategoryGroup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 517.795275590000000000
          Width = 85.795300000000000000
          Height = 15.118120000000000000
          DataSet = ReportDSetCategoryGroup
          DataSetName = 'ReportDSetCategoryGroup'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDSetCategoryGroup."SUM_ALL">,DetailData1)]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 510.236550000000000000
          Width = 7.559060000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.Strings = (
            ':')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 34.015770000000000000
        Top = 143.622140000000000000
        Width = 642.520100000000000000
        DataSet = ReportDBDSetFoundationData
        DataSetName = 'ReportDBDSetFoundationData'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo9: TfrxMemoView
          Top = 7.559059999999988000
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDBDSetFoundationData
          DataSetName = 'ReportDBDSetFoundationData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            
              '[ReportDBDSetFoundationData."SCH_NUMBER"] - [ReportDBDSetFoundat' +
              'ionData."SCH_NAME"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 15.118120000000000000
        Top = 260.787570000000000000
        Width = 642.520100000000000000
        DataSet = ReportDSetCategoryGroup
        DataSetName = 'ReportDSetCategoryGroup'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 509.236550000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDSetCategoryGroup
          DataSetName = 'ReportDSetCategoryGroup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[ReportDSetCategoryGroup."NAME_CATEGORY"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 517.795275590000000000
          Width = 85.795300000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDSetCategoryGroup
          DataSetName = 'ReportDSetCategoryGroup'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetCategoryGroup."SUM_ALL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 510.236550000000000000
          Width = 7.559060000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            ':')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header3: TfrxHeader
        Height = 30.236240000000000000
        Top = 570.709030000000000000
        Width = 642.520100000000000000
        object Line2: TfrxLineView
          Width = 604.945270000000000000
          Frame.Typ = [ftTop]
        end
        object Memo13: TfrxMemoView
          Top = 11.338589999999950000
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1090#1088#1080#1084#1072#1085#1085#1103)
          ParentFont = False
        end
        object Line9: TfrxLineView
          Top = 30.236239999999950000
          Width = 604.945270000000000000
          Frame.Typ = [ftTop]
        end
      end
      object DetailData3: TfrxDetailData
        Height = 15.118120000000000000
        Top = 623.622450000000000000
        Width = 642.520100000000000000
        DataSet = ReportDSetUDGroup
        DataSetName = 'ReportDSetUDGroup'
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo10: TfrxMemoView
          Left = 445.984540000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataField = 'KOD_VO'
          DataSet = ReportDSetUDGroup
          DataSetName = 'ReportDSetUDGroup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDSetUDGroup."KOD_VO"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 521.575140000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataField = 'SUMMA'
          DataSet = ReportDSetUDGroup
          DataSetName = 'ReportDSetUDGroup'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetUDGroup."SUMMA"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Width = 438.425480000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataField = 'NAME_VO'
          DataSet = ReportDSetUDGroup
          DataSetName = 'ReportDSetUDGroup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[ReportDSetUDGroup."NAME_VO"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 514.016080000000000000
          Width = 7.559060000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.Strings = (
            ':')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 438.425480000000000000
          Width = 7.559060000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.Strings = (
            ':')
          ParentFont = False
        end
      end
      object Footer2: TfrxFooter
        Height = 15.118120000000000000
        Top = 661.417750000000000000
        Width = 642.520100000000000000
        object Memo20: TfrxMemoView
          Left = 521.575140000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DataSet = ReportDSetUDGroup
          DataSetName = 'ReportDSetUDGroup'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDSetUDGroup."SUMMA">,DetailData3)]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Width = 514.016080000000000000
          Height = 15.118120000000000000
          DataSet = ReportDSetUDGroup
          DataSetName = 'ReportDSetUDGroup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 514.016080000000000000
          Width = 7.559060000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.Strings = (
            ':')
          ParentFont = False
        end
      end
      object Header4: TfrxHeader
        Height = 34.015770000000000000
        Top = 340.157700000000000000
        Width = 642.520100000000000000
        object Line3: TfrxLineView
          Top = 6.779530000000079000
          Width = 604.945270000000000000
          Frame.Typ = [ftTop]
        end
        object Memo22: TfrxMemoView
          Top = 11.338590000000010000
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1042' '#1090#1086#1084#1091' '#1095#1080#1089#1083#1110' '#1089#1091#1084#1080', '#1079#1072' '#1074#1080#1076#1072#1084#1080' '#1086#1087#1077#1088#1072#1094#1110#1081)
          ParentFont = False
        end
        object Line8: TfrxLineView
          Top = 34.015769999999980000
          Width = 604.945270000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
      object DetailData4: TfrxDetailData
        Height = 15.118120000000000000
        Top = 438.425480000000000000
        Width = 642.520100000000000000
        DataSet = ReportDSetNotPodNalGroup
        DataSetName = 'ReportDSetNotPodNalGroup'
        KeepHeader = True
        RowCount = 0
        object Memo23: TfrxMemoView
          Left = 75.590600000000000000
          Width = 437.929500000000000000
          Height = 15.118120000000000000
          DataSet = ReportDSetNotPodNalGroup
          DataSetName = 'ReportDSetNotPodNalGroup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.Strings = (
            '[ReportDSetNotPodNalGroup."NAME_VIDOPL"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 522.330708660000000000
          Width = 81.259842520000000000
          Height = 15.118120000000000000
          DataField = 'SUMMA'
          DataSet = ReportDSetNotPodNalGroup
          DataSetName = 'ReportDSetNotPodNalGroup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.Strings = (
            '[ReportDSetNotPodNalGroup."SUMMA"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 514.016080000000000000
          Width = 7.559060000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          HAlign = haRight
          Memo.Strings = (
            ':')
          ParentFont = False
        end
      end
      object Header5: TfrxHeader
        Height = 26.456710000000000000
        Top = 699.213050000000000000
        Width = 642.520100000000000000
        object Line5: TfrxLineView
          Top = 3.779530000000022000
          Width = 604.945270000000000000
          Frame.Typ = [ftTop]
        end
        object Memo35: TfrxMemoView
          Top = 7.338589999999954000
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1086#1084#1086#1089#1090#1110)
          ParentFont = False
        end
        object Line10: TfrxLineView
          Top = 26.456710000000040000
          Width = 604.945270000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
      object DetailData5: TfrxDetailData
        Height = 15.897650000000000000
        Top = 748.346940000000000000
        Width = 642.520100000000000000
        DataSet = ReportDsetGrSheet
        DataSetName = 'ReportDsetGrSheet'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        object Memo27: TfrxMemoView
          Width = 514.236550000000000000
          Height = 15.118120000000000000
          DataField = 'NAME_TYPE_SHEET'
          DataSet = ReportDsetGrSheet
          DataSetName = 'ReportDsetGrSheet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[ReportDsetGrSheet."NAME_TYPE_SHEET"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 521.575140000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DataField = 'SUMMA'
          DataSet = ReportDsetGrSheet
          DataSetName = 'ReportDsetGrSheet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetGrSheet."SUMMA"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 514.016080000000000000
          Width = 7.559060000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          HAlign = haRight
          Memo.Strings = (
            ':')
          ParentFont = False
        end
      end
      object Footer4: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 786.142240000000000000
        Width = 642.520100000000000000
        object Memo30: TfrxMemoView
          Width = 514.236550000000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetGrSheet
          DataSetName = 'ReportDsetGrSheet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          Memo.Strings = (
            #1044#1086' '#1074#1080#1087#1083#1072#1090#1080':')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 521.575140000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetGrSheet
          DataSetName = 'ReportDsetGrSheet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetGrSheet."SUMMA">,DetailData5)]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 514.016080000000000000
          Width = 7.559060000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          HAlign = haRight
          Memo.Strings = (
            ':')
          ParentFont = False
        end
      end
      object Header6: TfrxHeader
        Height = 7.559060000000000000
        Top = 823.937540000000000000
        Width = 642.520100000000000000
        object Line6: TfrxLineView
          Left = -3.779530000000000000
          Top = 3.779530000000022000
          Width = 608.724800000000000000
          Frame.Typ = [ftTop]
        end
      end
      object DetailData6: TfrxDetailData
        Height = 18.897650000000000000
        Top = 854.173780000000000000
        Width = 642.520100000000000000
        DataSet = ReportDsetDolg
        DataSetName = 'ReportDsetDolg'
        KeepHeader = True
        RowCount = 0
        object Memo32: TfrxMemoView
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetDolg
          DataSetName = 'ReportDsetDolg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1041#1086#1088#1075': ')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 45.354360000000000000
          Width = 672.756340000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Memo.Strings = (
            '[ReportDsetDolg."SUMMA"]')
        end
      end
      object DetailData7: TfrxDetailData
        Top = 895.748610000000000000
        Width = 642.520100000000000000
        DataSet = ReportUserDSet
        DataSetName = 'ReportUserDSet'
        KeepFooter = True
        RowCount = 0
      end
      object Footer5: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 45.354360000000000000
        ParentFont = False
        Top = 918.425790000000000000
        Width = 642.520100000000000000
        OnBeforePrint = 'Footer5OnBeforePrint'
        object Memo34: TfrxMemoView
          Top = 15.118119999999980000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[<PSumRazBalans>]')
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 18.897650000000000000
        Top = 18.897650000000000000
        Width = 642.520100000000000000
        object SysMemo1: TfrxSysMemoView
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[DATE]')
        end
        object Line7: TfrxLineView
          Top = 16.897650000000000000
          Width = 604.945270000000000000
          Frame.Typ = [ftTop]
        end
      end
      object Footer6: TfrxFooter
        Height = 25.897650000000000000
        Top = 521.575140000000000000
        Width = 642.520100000000000000
        object Memo26: TfrxMemoView
          Top = 7.000000000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSetFoundationData
          DataSetName = 'ReportDBDSetFoundationData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086': [ReportDBDSetFoundationData."SUM_ALL"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 340.157700000000000000
          Top = 7.000000000000000000
          Width = 263.433210000000000000
          Height = 18.897650000000000000
          DataSet = ReportDSetCategoryGroup
          DataSetName = 'ReportDSetCategoryGroup'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            
              #1079' '#1085#1080#1093' '#1092#1086#1085#1076' '#1074#1080#1090#1088#1072#1090': [SUM(<ReportDSetCategoryGroup."SUM_ALL">,Deta' +
              'ilData1)]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 98.267780000000000000
        Width = 642.520100000000000000
        Condition = 'ReportDBDSetFoundationData."SCH_NUMBER"'
        StartNewPage = True
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 30.236240000000000000
        Top = 986.457330000000000000
        Width = 642.520100000000000000
        object Memo3: TfrxMemoView
          Left = 37.795300000000000000
          Top = 11.338590000000070000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100' _______________________')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 396.850650000000000000
        Width = 642.520100000000000000
        Condition = 'ReportDSetNotPodNalGroup."ID_VOPL_GROUP"'
        object Memo4: TfrxMemoView
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDSetNotPodNalGroup."NAME_GROUP"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Width = 604.945270000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo7: TfrxMemoView
          Left = 521.575140000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[PSumVopl]')
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 476.220780000000000000
        Width = 642.520100000000000000
        object Memo56: TfrxMemoView
          Left = 522.330708660000000000
          Top = 3.779530000000022000
          Width = 81.259842520000000000
          Height = 15.118120000000000000
          DataSet = ReportDSetNotPodNalGroup
          DataSetName = 'ReportDSetNotPodNalGroup'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDSetNotPodNalGroup."SUMMA">,DetailData4)]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Top = 3.779530000000022000
          Width = 513.520100000000000000
          Height = 15.118120000000000000
          DataSet = ReportDSetNotPodNalGroup
          DataSetName = 'ReportDSetNotPodNalGroup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 514.016080000000000000
          Top = 3.779530000000022000
          Width = 7.559060000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.Strings = (
            ':')
          ParentFont = False
        end
      end
    end
  end
  object ReportDSetCategoryGroup: TfrxDBDataset
    UserName = 'ReportDSetCategoryGroup'
    CloseDataSource = False
    DataSet = DSetCategoryGroup
    Left = 168
    Top = 134
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 43
  end
  object DSetFoundationData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 89
    poSQLINT64ToBCD = True
  end
  object ReportDBDSetFoundationData: TfrxDBDataset
    UserName = 'ReportDBDSetFoundationData'
    CloseDataSource = False
    DataSet = DSetFoundationData
    Left = 168
    Top = 89
  end
  object DSetPropPaymGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 180
    poSQLINT64ToBCD = True
  end
  object ReportDsetPropPaymGroup: TfrxDBDataset
    UserName = 'ReportDsetPropPaymGroup'
    CloseDataSource = False
    DataSet = DSetPropPaymGroup
    Left = 168
    Top = 180
  end
  object DSourceFoundationData: TDataSource
    DataSet = DSetFoundationData
    Left = 304
    Top = 88
  end
  object DSetUDGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 226
    poSQLINT64ToBCD = True
  end
  object ReportDSetUDGroup: TfrxDBDataset
    UserName = 'ReportDSetUDGroup'
    CloseDataSource = False
    DataSet = DSetUDGroup
    Left = 168
    Top = 226
  end
  object DSetNotPodNalGroup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourcePropPaymGroup
    Left = 40
    Top = 271
    poSQLINT64ToBCD = True
  end
  object ReportDSetNotPodNalGroup: TfrxDBDataset
    UserName = 'ReportDSetNotPodNalGroup'
    CloseDataSource = False
    DataSet = DSetNotPodNalGroup
    Left = 168
    Top = 271
  end
  object DsetGrSheet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 316
    poSQLINT64ToBCD = True
  end
  object ReportDsetGrSheet: TfrxDBDataset
    UserName = 'ReportDsetGrSheet'
    CloseDataSource = False
    DataSet = DsetGrSheet
    Left = 168
    Top = 316
  end
  object DsetDolg: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceFoundationData
    Left = 40
    Top = 361
    poSQLINT64ToBCD = True
  end
  object ReportDsetDolg: TfrxDBDataset
    UserName = 'ReportDsetDolg'
    CloseDataSource = False
    DataSet = DsetDolg
    Left = 168
    Top = 361
  end
  object ReportUserDSet: TfrxUserDataSet
    RangeEnd = reCount
    RangeEndCount = 1
    UserName = 'ReportUserDSet'
    Left = 304
    Top = 136
  end
  object UpdateTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 296
    Top = 304
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = UpdateTransaction
    Left = 296
    Top = 208
  end
  object DSourcePropPaymGroup: TDataSource
    DataSet = DSetPropPaymGroup
    Left = 296
    Top = 256
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 296
    Top = 368
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 296
    Top = 40
  end
end
