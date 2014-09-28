object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 170
  Height = 271
  Width = 405
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
    EngineOptions.ConvertNulls = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 39337.812177372680000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 200
    Datasets = <
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
      end>
    Variables = <
      item
        Name = ' User Category'
        Value = Null
      end
      item
        Name = 'PDateForm'
        Value = #39'01.09.2005'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 20.002950000000000000
        ParentFont = False
        Top = 388.000000000000000000
        Width = 1046.920361175000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        KeepChild = True
        RowCount = 0
        Stretched = True
        object Memo5: TfrxMemoView
          Left = 179.910000000000000000
          Top = 0.002913390000003347
          Width = 108.380000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_CANDIDAT_P"]')
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 288.290000000000000000
          Top = 0.002913390000003347
          Width = 108.380000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_DOCTOR_P"]')
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 396.670000000000000000
          Top = 0.002913390000003347
          Width = 108.380000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_DOCENT_P"]')
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 505.050000000000000000
          Top = 0.002913390000003347
          Width = 108.094488190000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_PROFESSOR_P"]')
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Top = 0.002949999999998454
          Width = 40.629870000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 105.332430000000000000
          Top = 0.002949999999998454
          Width = 74.522350000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SHTAT"]')
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 40.632430000000000000
          Top = 0.002949999999998454
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL"]')
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 721.800000000000000000
          Width = 106.960000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_DOCTOR_NP"]')
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 613.420000000000000000
          Width = 108.380000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_CANDIDAT_NP"]')
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 828.764488190000000000
          Width = 108.380000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_DOCENT_NP"]')
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 937.144488190000000000
          Width = 109.780000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_PROFESSOR_NP"]')
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 88.692950000000000000
        ParentFont = False
        Top = 16.000000000000000000
        Width = 1046.920361175000000000
        object Memo43: TfrxMemoView
          Left = 904.000000000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [date]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Top = 45.795300000000000000
          Width = 1048.063700000000000000
          Height = 42.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1063#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' '#1085#1072#1091#1082#1086#1074#1086'-'#1087#1077#1076#1072#1075#1086#1075#1110#1095#1085#1080#1093' '#1082#1072#1076#1088#1110#1074)
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Width = 548.031850000000000000
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
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 18.897650000000000000
        ParentFont = False
        Top = 348.000000000000000000
        Width = 1046.920361175000000000
        Condition = 'ReportDsetData."NAME_DEPARTMENT"'
        ReprintOnNewPage = True
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 1046.920000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 165.826840000000000000
        ParentFont = False
        Top = 164.000000000000000000
        Width = 1046.920361175000000000
        Stretched = True
        object Memo4: TfrxMemoView
          Left = 179.905511810000000000
          Top = 18.897637800000010000
          Width = 216.755905510000000000
          Height = 37.795275590000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            #1090#1110', '#1097#1086' '#1084#1072#1102#1090#1100' '#1085#1072#1091#1082#1086#1074#1080#1081' '#1089#1090#1091#1087#1110#1085#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 179.905511810000000000
          Width = 433.511811020000000000
          Height = 18.897637800000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            #1055#1077#1076#1072#1075#1086#1075#1110#1095#1085#1110' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Width = 40.629870000000000000
          Height = 56.692913390000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 105.332430000000000000
          Width = 74.522350000000000000
          Height = 56.692913390000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047' '#1085#1080#1093' '#1096#1090#1072#1090#1085#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 396.670000000000000000
          Top = 18.897650000000000000
          Width = 216.750000000000000000
          Height = 37.795275590000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1090#1110', '#1097#1086' '#1084#1072#1102#1090#1100' '#1091#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 40.632430000000000000
          Width = 64.700000000000000000
          Height = 56.692913390000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
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
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 179.910000000000000000
          Top = 56.692913390000000000
          Width = 108.380000000000000000
          Height = 85.039370080000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1072#1085#1076#1080#1076#1072#1090#1072' '#1085#1072#1091#1082)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 288.290000000000000000
          Top = 56.692913390000000000
          Width = 108.380000000000000000
          Height = 85.039370080000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086#1082#1090#1086#1088#1072' '#1085#1072#1091#1082)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 613.417322830000000000
          Width = 433.500000000000000000
          Height = 18.897637800000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1091#1082#1086#1074#1086'-'#1087#1077#1076#1072#1075#1086#1075#1110#1095#1085#1110' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 396.670000000000000000
          Top = 56.692913390000000000
          Width = 108.380000000000000000
          Height = 85.039370080000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086#1094#1077#1085#1090#1072)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 505.050000000000000000
          Top = 56.692913390000000000
          Width = 108.094488190000000000
          Height = 85.039370080000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1086#1092#1077#1089#1086#1088#1072)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Top = 56.692949999999990000
          Width = 40.629870000000000000
          Height = 85.039370080000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 105.332430000000000000
          Top = 56.692949999999990000
          Width = 74.522350000000000000
          Height = 85.039370080000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 40.632430000000000000
          Top = 56.692949999999990000
          Width = 64.700000000000000000
          Height = 85.039370080000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 613.420000000000000000
          Top = 18.900000000000010000
          Width = 215.340000000000000000
          Height = 37.795275590000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            #1090#1110', '#1097#1086' '#1084#1072#1102#1090#1100' '#1085#1072#1091#1082#1086#1074#1080#1081' '#1089#1090#1091#1087#1110#1085#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 828.764488190000000000
          Top = 18.900000000000010000
          Width = 218.160000000000000000
          Height = 37.795275590000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1090#1110', '#1097#1086' '#1084#1072#1102#1090#1100' '#1091#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 721.800000000000000000
          Top = 56.690000000000000000
          Width = 106.960000000000000000
          Height = 85.039370080000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086#1082#1090#1086#1088#1072' '#1085#1072#1091#1082)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 613.420000000000000000
          Top = 56.690000000000000000
          Width = 108.380000000000000000
          Height = 85.039370080000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1072#1085#1076#1080#1076#1072#1090#1072' '#1085#1072#1091#1082)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 828.764488190000000000
          Top = 56.690000000000000000
          Width = 108.380000000000000000
          Height = 85.039370080000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086#1094#1077#1085#1090#1072)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 937.144488190000000000
          Top = 56.690000000000000000
          Width = 109.780000000000000000
          Height = 85.039370080000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1086#1092#1077#1089#1086#1088#1072)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 468.000000000000000000
        Width = 1046.920361175000000000
        object Memo88: TfrxMemoView
          Left = 968.000000000000000000
          Width = 80.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
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
  object WorkReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.ConvertNulls = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 39337.812177372680000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 344
    Datasets = <
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
      end>
    Variables = <
      item
        Name = ' User Category'
        Value = Null
      end
      item
        Name = 'PDateForm'
        Value = #39'01.09.2005'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 20.002950000000000000
        ParentFont = False
        Top = 388.000000000000000000
        Width = 1046.920361175000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        KeepChild = True
        RowCount = 0
        Stretched = True
        object Memo5: TfrxMemoView
          Left = 179.910000000000000000
          Top = 0.002913390000003347
          Width = 108.380000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_CANDIDAT_P"]')
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 288.290000000000000000
          Top = 0.002913390000003347
          Width = 108.380000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_DOCTOR_P"]')
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 396.670000000000000000
          Top = 0.002913390000003347
          Width = 108.380000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_DOCENT_P"]')
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 505.050000000000000000
          Top = 0.002913390000003347
          Width = 108.094488190000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_PROFESSOR_P"]')
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Top = 0.002949999999998454
          Width = 40.629870000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 105.332430000000000000
          Top = 0.002949999999998454
          Width = 74.522350000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SHTAT"]')
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 40.632430000000000000
          Top = 0.002949999999998454
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL"]')
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 721.800000000000000000
          Width = 106.960000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_DOCTOR_NP"]')
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 613.420000000000000000
          Width = 108.380000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_CANDIDAT_NP"]')
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 828.764488190000000000
          Width = 108.380000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_DOCENT_NP"]')
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 937.144488190000000000
          Width = 109.780000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_PROFESSOR_NP"]')
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 88.692950000000000000
        ParentFont = False
        Top = 16.000000000000000000
        Width = 1046.920361175000000000
        object Memo43: TfrxMemoView
          Left = 904.000000000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [date]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Top = 45.795300000000000000
          Width = 1048.063700000000000000
          Height = 42.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1063#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100' '#1085#1072#1091#1082#1086#1074#1086'-'#1087#1077#1076#1072#1075#1086#1075#1110#1095#1085#1080#1093' '#1082#1072#1076#1088#1110#1074)
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Width = 548.031850000000000000
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
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 18.897650000000000000
        ParentFont = False
        Top = 348.000000000000000000
        Width = 1046.920361175000000000
        Condition = 'ReportDsetData."NAME_DEPARTMENT"'
        ReprintOnNewPage = True
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 1046.920000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 165.826840000000000000
        ParentFont = False
        Top = 164.000000000000000000
        Width = 1046.920361175000000000
        Stretched = True
        object Memo4: TfrxMemoView
          Left = 179.905511810000000000
          Top = 18.897637800000010000
          Width = 216.755905510000000000
          Height = 37.795275590000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            #1090#1110', '#1097#1086' '#1084#1072#1102#1090#1100' '#1085#1072#1091#1082#1086#1074#1080#1081' '#1089#1090#1091#1087#1110#1085#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 179.905511810000000000
          Width = 433.511811020000000000
          Height = 18.897637800000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            #1055#1077#1076#1072#1075#1086#1075#1110#1095#1085#1110' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Width = 40.629870000000000000
          Height = 56.692913390000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 105.332430000000000000
          Width = 74.522350000000000000
          Height = 56.692913390000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047' '#1085#1080#1093' '#1096#1090#1072#1090#1085#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 396.670000000000000000
          Top = 18.897650000000000000
          Width = 216.750000000000000000
          Height = 37.795275590000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1090#1110', '#1097#1086' '#1084#1072#1102#1090#1100' '#1091#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 40.632430000000000000
          Width = 64.700000000000000000
          Height = 56.692913390000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
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
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 179.910000000000000000
          Top = 56.692913390000000000
          Width = 108.380000000000000000
          Height = 85.039370080000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1072#1085#1076#1080#1076#1072#1090#1072' '#1085#1072#1091#1082)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 288.290000000000000000
          Top = 56.692913390000000000
          Width = 108.380000000000000000
          Height = 85.039370080000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086#1082#1090#1086#1088#1072' '#1085#1072#1091#1082)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 613.417322830000000000
          Width = 433.500000000000000000
          Height = 18.897637800000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1091#1082#1086#1074#1086'-'#1087#1077#1076#1072#1075#1086#1075#1110#1095#1085#1110' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 396.670000000000000000
          Top = 56.692913390000000000
          Width = 108.380000000000000000
          Height = 85.039370080000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086#1094#1077#1085#1090#1072)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 505.050000000000000000
          Top = 56.692913390000000000
          Width = 108.094488190000000000
          Height = 85.039370080000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1086#1092#1077#1089#1086#1088#1072)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Top = 56.692949999999990000
          Width = 40.629870000000000000
          Height = 85.039370080000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 105.332430000000000000
          Top = 56.692949999999990000
          Width = 74.522350000000000000
          Height = 85.039370080000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 40.632430000000000000
          Top = 56.692949999999990000
          Width = 64.700000000000000000
          Height = 85.039370080000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 613.420000000000000000
          Top = 18.900000000000010000
          Width = 215.340000000000000000
          Height = 37.795275590000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            #1090#1110', '#1097#1086' '#1084#1072#1102#1090#1100' '#1085#1072#1091#1082#1086#1074#1080#1081' '#1089#1090#1091#1087#1110#1085#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 828.764488190000000000
          Top = 18.900000000000010000
          Width = 218.160000000000000000
          Height = 37.795275590000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1090#1110', '#1097#1086' '#1084#1072#1102#1090#1100' '#1091#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 721.800000000000000000
          Top = 56.690000000000000000
          Width = 106.960000000000000000
          Height = 85.039370080000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086#1082#1090#1086#1088#1072' '#1085#1072#1091#1082)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 613.420000000000000000
          Top = 56.690000000000000000
          Width = 108.380000000000000000
          Height = 85.039370080000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1072#1085#1076#1080#1076#1072#1090#1072' '#1085#1072#1091#1082)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 828.764488190000000000
          Top = 56.690000000000000000
          Width = 108.380000000000000000
          Height = 85.039370080000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086#1094#1077#1085#1090#1072)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 937.144488190000000000
          Top = 56.690000000000000000
          Width = 109.780000000000000000
          Height = 85.039370080000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1086#1092#1077#1089#1086#1088#1072)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 468.000000000000000000
        Width = 1046.920361175000000000
        object Memo88: TfrxMemoView
          Left = 968.000000000000000000
          Width = 80.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
      end
    end
  end
  object WorkDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 344
    Top = 53
    poSQLINT64ToBCD = True
    poAskRecordCount = True
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
    Left = 200
    Top = 176
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 272
    Top = 176
  end
end
