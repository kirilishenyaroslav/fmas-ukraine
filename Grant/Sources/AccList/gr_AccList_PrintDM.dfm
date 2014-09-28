object PrintDM: TPrintDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 491
  Top = 5
  Height = 422
  Width = 412
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbFind, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1047#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
    ReportOptions.CreateDate = 38447.623025902800000000
    ReportOptions.LastChange = 38778.538763680600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure DetailData3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 130
    Top = 1
    Datasets = <
      item
        DataSet = frxDSetGlobalData
        DataSetName = 'frxDSetGlobalData'
      end
      item
        DataSet = frxDSetSystemData
        DataSetName = 'frxDSetSystemData'
      end
      item
        DataSet = frxUserDataSet
        DataSetName = 'frxUserDataSet'
      end>
    Variables = <
      item
        Name = 'P_PERIOD'
        Value = #39#1078#1086#1074#1090#1077#1085#1100' 2005 '#1088#1086#1082#1091#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 305.000000000000000000
      PaperSize = 256
      LeftMargin = 28.300000000000000000
      RightMargin = 6.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      PrintIfEmpty = False
      object Header1: TfrxHeader
        Height = 36.897650000000000000
        Top = 120.944960000000000000
        Width = 664.063420999999900000
        object Memo1: TfrxMemoView
          Left = 341.953000000000000000
          Top = 20.999999999999990000
          Width = 57.590600000000000000
          Height = 15.897650000000000000
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 20.999999999999990000
          Width = 27.456710000000000000
          Height = 15.897650000000000000
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 26.574830000000000000
          Top = 20.999999999999990000
          Width = 24.236240000000000000
          Height = 15.897650000000000000
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1057)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 50.692950000000000000
          Top = 20.999999999999990000
          Width = 25.236240000000000000
          Height = 15.897650000000000000
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1054)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 76.149660000000000000
          Top = 20.999999999999990000
          Width = 181.752950000000000000
          Height = 15.897650000000000000
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1076' '#1086#1087#1077#1088#1072#1094#1110#1111)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 601.606680000000000000
          Top = 20.999999999999990000
          Width = 61.590600000000000000
          Height = 15.897650000000000000
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 257.567100000000000000
          Top = 20.999999999999990000
          Width = 45.354360000000000000
          Height = 15.897650000000000000
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1085#1110)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 424.748300000000000000
          Top = 20.999999999999990000
          Width = 26.236240000000000000
          Height = 15.897650000000000000
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1054)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 451.205010000000000000
          Top = 20.999999999999990000
          Width = 151.178120000000000000
          Height = 15.897650000000000000
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1076' '#1086#1087#1077#1088#1072#1094#1110#1111)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 400.630180000000000000
          Top = 20.999999999999990000
          Width = 23.929190000000000000
          Height = 15.897650000000000000
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1057)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Width = 399.630180000000000000
          Height = 20.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 400.630180000000000000
          Width = 262.567100000000000000
          Height = 20.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1090#1088#1080#1084#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 302.362400000000000000
          Top = 20.787401570000000000
          Width = 39.307086614173200000
          Height = 15.897650000000000000
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1084#1077#1090#1072)
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 49.133890000000000000
        Top = 219.212740000000000000
        Width = 664.063420999999900000
        object Memo14: TfrxMemoView
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
        end
        object Memo15: TfrxMemoView
          Left = 257.787570000000000000
          Width = 141.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[P_SUM_NAR]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 400.630180000000000000
          Width = 201.315090000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '('#1059#1090#1088#1080#1084#1072#1085#1086')')
        end
        object Memo17: TfrxMemoView
          Left = 68.031540000000000000
          Width = 189.976500000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '('#1053#1072#1088#1072#1093#1086#1074#1072#1085#1086')')
        end
        object Memo18: TfrxMemoView
          Top = 22.677179999999990000
          Width = 661.417750000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1044#1086' '#1074#1080#1087#1083#1072#1090#1080': [P_VIPLATA]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 601.700758110000000000
          Width = 61.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[P_SUM_UD]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = -0.000000000000000210
          Top = 41.574830000000020000
          Width = 661.417750000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          Frame.Width = 1.500000000000000000
        end
      end
      object MasterData1: TfrxMasterData
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Width = 664.063420999999900000
        DataSet = frxDSetGlobalData
        DataSetName = 'frxDSetGlobalData'
        KeepTogether = True
        RowCount = 0
        Stretched = True
        object Memo20: TfrxMemoView
          Top = 18.897650000000000000
          Width = 661.417750000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDSetGlobalData
          DataSetName = 'frxDSetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDSetSystemData."SHORT_NAME"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Width = 661.417750000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            '[P_ACCLIST_TYPE]')
        end
        object Memo22: TfrxMemoView
          Top = 37.795300000000000000
          Width = 661.417750000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1080#1081' '#1083#1080#1089#1090#1086#1082' '#1079#1072' <b>[P_PERIOD]</b>')
        end
        object Memo23: TfrxMemoView
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = frxDSetGlobalData
          DataSetName = 'frxDSetGlobalData'
          Memo.Strings = (
            #1057#1090#1091#1076#1077#1085#1090':')
        end
        object Memo24: TfrxMemoView
          Left = 60.472480000000000000
          Top = 56.692950000000000000
          Width = 600.945270000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[P_STUDENT]')
          ParentFont = False
        end
      end
      object DetailData3: TfrxDetailData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 181.417440000000000000
        Width = 664.063420999999900000
        OnBeforePrint = 'DetailData3OnBeforePrint'
        DataSet = frxUserDataSet
        DataSetName = 'frxUserDataSet'
        RowCount = 0
        Stretched = True
        object Memo30: TfrxMemoView
          Left = 341.953000000000000000
          Width = 57.590600000000000000
          Height = 15.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[N_SUMMA]')
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Width = 27.456710000000000000
          Height = 15.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[N_CODE_DEPARTMENT]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 26.574830000000000000
          Width = 24.236240000000000000
          Height = 15.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[N_KOD_SETUP_3]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 50.692950000000000000
          Width = 25.236240000000000000
          Height = 15.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[N_KOD_VIDOPL]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 76.149660000000000000
          Width = 181.752950000000000000
          Height = 15.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[N_NAME_VIDOPL]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 601.606680000000000000
          Width = 61.590600000000000000
          Height = 15.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[U_SUMMA]')
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 257.567100000000000000
          Width = 45.354360000000000000
          Height = 15.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[N_DAY_CLOCK]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 303.378170000000000000
          Width = 38.354360000000000000
          Height = 15.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 424.748300000000000000
          Width = 26.236240000000000000
          Height = 15.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[U_KOD_VIDOPL]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 451.205010000000000000
          Width = 151.178120000000000000
          Height = 15.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[U_NAME_VIDOPL]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 400.630180000000000000
          Width = 23.929190000000000000
          Height = 15.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[U_KOD_SETUP_3]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 302.362400000000000000
          Width = 38.692950000000000000
          Height = 15.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxUserDataSet
          DataSetName = 'frxUserDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[N_KOD_SMETA]')
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDSetGlobalData: TfrxDBDataset
    UserName = 'frxDSetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 130
    Top = 59
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 250
    Top = 1
  end
  object frxUserDataSet: TfrxUserDataSet
    UserName = 'frxUserDataSet'
    Left = 122
    Top = 128
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 338
    Top = 1
  end
  object DSetAccUdList: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSource
    Left = 34
    Top = 161
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSetAccNarList: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSource
    Left = 34
    Top = 112
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 26
    Top = 58
    poSQLINT64ToBCD = True
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 27
    Top = 1
  end
  object DSetSystemData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 35
    Top = 210
    poSQLINT64ToBCD = True
  end
  object frxDSetSystemData: TfrxDBDataset
    UserName = 'frxDSetSystemData'
    CloseDataSource = False
    DataSet = DSetSystemData
    Left = 138
    Top = 210
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = UdateTransaction
    Left = 280
    Top = 112
  end
  object UdateTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 288
    Top = 184
  end
  object DSource: TDataSource
    DataSet = DSetGlobalData
    Left = 200
    Top = 176
  end
  object frxDSetAccNarList: TfrxDBDataset
    UserName = 'frxDSetAccNarList'
    CloseDataSource = False
    DataSet = DSetAccNarList
    Left = 232
    Top = 64
  end
  object DSetSmetaList: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSource
    Left = 32
    Top = 280
    poSQLINT64ToBCD = True
  end
  object frxDSetSmetaList: TfrxDBDataset
    UserName = 'frxDSetSmetaList'
    CloseDataSource = False
    DataSet = DSetSmetaList
    Left = 136
    Top = 280
  end
  object DSetSheets: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSource
    Left = 32
    Top = 336
    poSQLINT64ToBCD = True
  end
  object frxDSetSheets: TfrxDBDataset
    UserName = 'frxDSetSheets'
    CloseDataSource = False
    DataSet = DSetSheets
    Left = 136
    Top = 336
  end
end
