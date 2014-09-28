object DM: TDM
  OldCreateOrder = False
  Left = 392
  Top = 283
  Height = 378
  Width = 448
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
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39512.537311736100000000
    ReportOptions.LastChange = 39528.741393761570000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 200
    Datasets = <
      item
        DataSet = RepDSetFac
        DataSetName = 'RepDSetFac'
      end
      item
        DataSet = RepDSetRoot
        DataSetName = 'RepDSetRoot'
      end
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
      end
      item
        DataSet = ReportDsetDetail
        DataSetName = 'ReportDsetDetail'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 189.784786670000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 548.031850000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1060' '#8470' 3')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 75.590600000000000000
          Width = 714.331170000000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1064#1090#1072#1090#1085#1080#1081' '#1088#1086#1079#1082#1083#1072#1076' '#1074#1080#1082#1083#1072#1076#1072#1095#1110#1074)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 41.574830000000000000
          Width = 714.331170000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."FIRM_NAME"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 506.457020000000000000
          Top = 128.504020000000000000
          Width = 60.472480000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1085#1072' '#1076#1072#1090#1091':')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 566.929500000000000000
          Top = 128.504020000000000000
          Width = 147.401670000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[ReportDsetData."LOC_DATE_CHECK"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 37.795275590000000000
        Top = 566.929499999999900000
        Width = 718.110700000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo22: TfrxMemoView
          Left = 37.795275590000000000
          Width = 215.433112360000000000
          Height = 37.795275590000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 253.228346460000000000
          Width = 94.488152360000000000
          Height = 37.795275590000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_POST"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 347.716535430000000000
          Width = 75.590551180000000000
          Height = 37.795275590000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."STAVKA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 563.149606299999900000
          Width = 151.181102360000000000
          Height = 37.795275590000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATE_BEG"] - '
            '[ReportDsetData."DATE_END"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 423.307086610000000000
          Width = 56.692852360000010000
          Height = 37.795275590000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."SHTAT_SOVM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 480.000000000000000000
          Width = 83.149606300000000000
          Height = 37.795275590000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ACCEPT_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Width = 37.795275590551200000
          Height = 37.795275590000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NUMBER_PERS"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 1050.709340000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 642.419312533333000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 125.616883340000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo5: TfrxMemoView
          Width = 37.795275590000000000
          Height = 125.616883340000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1088#1103#1076#1086#1082' '#8470)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 37.795275590000000000
          Width = 215.433070870000000000
          Height = 125.616883340000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103', '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 253.228346460000000000
          Width = 94.488152360000000000
          Height = 125.616883340000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 347.716535430000000000
          Width = 75.590551181102400000
          Height = 125.616883340000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1074#1072#1085#1090#1072#1078#1077#1085#1085#1103)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 563.149606300000000000
          Width = 151.181102362205000000
          Height = 125.616883340000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1077#1088#1084#1110#1085' '#1076#1086#1075#1086#1074#1086#1088#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 423.307086614173000000
          Width = 56.692852360000000000
          Height = 125.616883340000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1064#1090#1072#1090'./'#1074#1085#1091#1090#1088'./'#1079#1086#1074#1085'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 480.000000000000000000
          Width = 83.149606299212600000
          Height = 125.616883340000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1076' '#1090#1088#1091#1076#1086#1074#1086#1075#1086' '#1076#1086#1075#1086#1074#1086#1088#1091)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 34.015770000000010000
        Top = 461.102660000000000000
        Width = 718.110700000000000000
        Condition = 'ReportDsetData."id_fac_department"'
        StartNewPage = True
        Stretched = True
        object Memo16: TfrxMemoView
          Top = 3.779530000000022000
          Width = 714.331170000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_FACULTY"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 26.456710000000000000
        Top = 517.795610000000000000
        Width = 718.110700000000000000
        Condition = 'ReportDsetData."loc_id_department"'
        StartNewPage = True
        Stretched = True
        object Memo18: TfrxMemoView
          Width = 714.331170000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_CAFEDRA"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 105.826840000000000000
        Top = 627.401980000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Top = 26.456709999999930000
          Width = 86.929190000000000000
          Height = 79.370130000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1057#1090#1072#1074#1086#1082' '#1087#1086' '#1082#1072#1092#1077#1076#1088#1110':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 86.929190000000000000
          Top = 26.456709999999930000
          Width = 166.299212600000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1083#1077#1082#1090#1086#1088#1089#1100#1082#1080#1093)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 86.929190000000000000
          Top = 52.913419999999970000
          Width = 166.299212600000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1072#1089#1080#1089#1090#1077#1085#1090#1089#1100#1082#1080#1093)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 86.929190000000000000
          Top = 79.370130000000010000
          Width = 166.299212600000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1074#1089#1100#1086#1075#1086)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Width = 86.929190000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 86.929190000000000000
          Width = 166.299212600000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 253.228510000000000000
          Width = 170.078740160000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1074#1080#1076#1110#1083#1077#1085#1086)
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 423.307086610000000000
          Width = 139.842519690000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1088#1086#1079#1087#1086#1076#1110#1083#1077#1085#1086)
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 563.149606299999900000
          Width = 151.181102360000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1074#1072#1082#1072#1085#1089#1110#1111)
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 253.228510000000000000
          Top = 26.456709999999930000
          Width = 170.078740160000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetDetail."STAVOK_LECTORS_PLAN"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 423.307086610000000000
          Top = 26.456709999999930000
          Width = 139.842519690000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetDetail."STAVOK_LECTORS_FACT"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 563.149606299999900000
          Top = 26.456709999999930000
          Width = 151.181102360000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetDetail."STAVOK_LECTORS_VAC"]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 253.228510000000000000
          Top = 52.913419999999970000
          Width = 170.078740160000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetDetail."STAVOK_ASIST_PLAN"]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 423.307086610000000000
          Top = 52.913419999999970000
          Width = 139.842519690000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetDetail."STAVOK_ASIST_FACT"]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 563.149606299999900000
          Top = 52.913419999999970000
          Width = 151.181102360000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetDetail."STAVOK_ASIST_VAC"]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 253.228510000000000000
          Top = 79.370130000000010000
          Width = 170.078740160000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetDetail."STAVOK_ALL_PLAN"]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 423.307086610000000000
          Top = 79.370130000000010000
          Width = 139.842519690000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetDetail."STAVOK_ALL_FACT"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 563.149606299999900000
          Top = 79.370130000000010000
          Width = 151.181102360000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetDetail."STAVOK_ALL_VAC"]')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 105.826840000000000000
        Top = 755.906000000000000000
        Width = 718.110700000000000000
        object Memo41: TfrxMemoView
          Top = 26.456710000000040000
          Width = 86.929190000000000000
          Height = 79.370130000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1057#1090#1072#1074#1086#1082' '#1087#1086' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1091':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 86.929190000000000000
          Top = 26.456709999999930000
          Width = 166.299212600000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1083#1077#1082#1090#1086#1088#1089#1100#1082#1080#1093)
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 86.929190000000000000
          Top = 52.913419999999970000
          Width = 166.299212600000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1072#1089#1080#1089#1090#1077#1085#1090#1089#1100#1082#1080#1093)
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 86.929190000000000000
          Top = 79.370130000000010000
          Width = 166.299212600000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1074#1089#1100#1086#1075#1086)
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Width = 86.929190000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 86.929190000000000000
          Width = 166.299212600000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 253.228510000000000000
          Width = 170.078740160000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1074#1080#1076#1110#1083#1077#1085#1086)
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 423.307086610000000000
          Width = 139.842519690000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1088#1086#1079#1087#1086#1076#1110#1083#1077#1085#1086)
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 563.149606300000000000
          Width = 151.181102360000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1074#1072#1082#1072#1085#1089#1110#1111)
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 253.228510000000000000
          Top = 26.456710000000040000
          Width = 170.078740160000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetFac."STAVOK_LECTORS_PLAN"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 423.307086610000000000
          Top = 26.456710000000040000
          Width = 139.842519690000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetFac."STAVOK_LECTORS_FACT"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 563.149606299999900000
          Top = 26.456710000000040000
          Width = 151.181102360000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetFac."STAVOK_LECTORS_VAC"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 253.228510000000000000
          Top = 52.913419999999970000
          Width = 170.078740160000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetFac."STAVOK_ASIST_PLAN"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 423.307086610000000000
          Top = 52.913419999999970000
          Width = 139.842519690000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetFac."STAVOK_ASIST_FACT"]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 563.149606299999900000
          Top = 52.913419999999970000
          Width = 151.181102360000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetFac."STAVOK_ASIST_VAC"]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 253.228510000000000000
          Top = 79.370130000000010000
          Width = 170.078740160000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetFac."STAVOK_ALL_PLAN"]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 423.307086610000000000
          Top = 79.370130000000010000
          Width = 139.842519690000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetFac."STAVOK_ALL_FACT"]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 563.149606299999900000
          Top = 79.370130000000010000
          Width = 151.181102360000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetFac."STAVOK_ALL_VAC"]')
          ParentFont = False
        end
      end
      object GroupFooter3: TfrxGroupFooter
        Height = 105.826840000000000000
        Top = 884.410020000000000000
        Width = 718.110700000000000000
        object Memo59: TfrxMemoView
          Top = 26.456710000000040000
          Width = 86.929190000000000000
          Height = 79.370130000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1057#1090#1072#1074#1086#1082' '#1087#1086' '#1091#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090#1091':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 86.929190000000000000
          Top = 26.456709999999930000
          Width = 166.299212600000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1083#1077#1082#1090#1086#1088#1089#1100#1082#1080#1093)
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 86.929190000000000000
          Top = 52.913419999999970000
          Width = 166.299212600000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1072#1089#1080#1089#1090#1077#1085#1090#1089#1100#1082#1080#1093)
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 86.929190000000000000
          Top = 79.370130000000010000
          Width = 166.299212600000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1074#1089#1100#1086#1075#1086)
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Width = 86.929190000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 86.929190000000000000
          Width = 166.299212600000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 253.228510000000000000
          Width = 170.078740160000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1074#1080#1076#1110#1083#1077#1085#1086)
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 423.307086610000000000
          Width = 139.842519690000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1088#1086#1079#1087#1086#1076#1110#1083#1077#1085#1086)
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 563.149606300000000000
          Width = 151.181102360000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1074#1072#1082#1072#1085#1089#1110#1111)
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 253.228510000000000000
          Top = 26.456710000000040000
          Width = 170.078740160000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetRoot."STAVOK_LECTORS_PLAN"]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 423.307086610000000000
          Top = 26.456710000000040000
          Width = 139.842519690000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetRoot."STAVOK_LECTORS_FACT"]')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 563.149606299999900000
          Top = 26.456710000000040000
          Width = 151.181102360000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetRoot."STAVOK_LECTORS_VAC"]')
          ParentFont = False
        end
        object Memo71: TfrxMemoView
          Left = 253.228510000000000000
          Top = 52.913419999999970000
          Width = 170.078740160000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetRoot."STAVOK_ASIST_PLAN"]')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 423.307086610000000000
          Top = 52.913419999999970000
          Width = 139.842519690000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetRoot."STAVOK_ASIST_FACT"]')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 563.149606299999900000
          Top = 52.913419999999970000
          Width = 151.181102360000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetRoot."STAVOK_ASIST_VAC"]')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 253.228510000000000000
          Top = 79.370130000000010000
          Width = 170.078740160000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetRoot."STAVOK_ALL_PLAN"]')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 423.307086610000000000
          Top = 79.370130000000010000
          Width = 139.842519690000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetRoot."STAVOK_ALL_FACT"]')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 563.149606299999900000
          Top = 79.370130000000010000
          Width = 151.181102360000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[RepDSetRoot."STAVOK_ALL_VAC"]')
          ParentFont = False
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 415.748300000000000000
        Visible = False
        Width = 718.110700000000000000
        Condition = 'ReportDsetData."id_root_department"'
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
  object ReportDsetDetail: TfrxDBDataset
    UserName = 'ReportDsetDetail'
    CloseDataSource = False
    DataSet = DSetDataDetail
    Left = 208
    Top = 168
  end
  object DSetDataDetail: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourseDetail
    Left = 128
    Top = 173
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSourseDetail: TDataSource
    DataSet = DSetData
    Left = 32
    Top = 168
  end
  object RepDSetFac: TfrxDBDataset
    UserName = 'RepDSetFac'
    CloseDataSource = False
    DataSet = DSetFac
    Left = 208
    Top = 224
  end
  object DSetFac: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourseFac
    Left = 128
    Top = 229
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSourseFac: TDataSource
    DataSet = DSetData
    Left = 32
    Top = 224
  end
  object RepDSetRoot: TfrxDBDataset
    UserName = 'RepDSetRoot'
    CloseDataSource = False
    DataSet = DSetRoot
    Left = 208
    Top = 280
  end
  object DSetRoot: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourseRoot
    Left = 128
    Top = 285
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSourseRoot: TDataSource
    DataSet = DSetData
    Left = 32
    Top = 280
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
    Left = 272
    Top = 168
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 272
    Top = 224
  end
end
