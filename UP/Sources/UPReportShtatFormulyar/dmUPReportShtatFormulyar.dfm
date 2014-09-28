object DM: TDM
  OldCreateOrder = False
  Left = 392
  Top = 283
  Height = 305
  Width = 345
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
    EngineOptions.ConvertNulls = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 39500.609293611110000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      '{procedure Memo11OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' if (<ReportDsetData."SHTAT">='#39'T'#39') then Memo11.Text:='#39#1064#39';'
      ' if (<ReportDsetData."SHTAT">='#39'F'#39') then Memo11.Text:='#39#1057#39';'
      ''
      'end;    }'
      '{procedure MasterData2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."RUS_IMYA">='#39#39') and (<CardDS."IMYA">='#39#39')'
      '    then MasterData2.Visible:=false'
      '    else MasterData2.Visible:=true;'
      'end;}'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      object MasterData2: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 60.472460470000000000
        ParentFont = False
        Top = 464.882190000000000000
        Width = 1046.920361175000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
        object Memo59: TfrxMemoView
          Left = 937.323440000000000000
          Top = 30.236240000000010000
          Width = 109.606321180000000000
          Height = 30.236220470000000000
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATE_END_BONUS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 827.717070000000000000
          Top = 30.236240000000010000
          Width = 109.606321180000000000
          Height = 30.236220470000000000
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATE_BEG_BONUS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 718.110700000000000000
          Top = 30.236240000000010000
          Width = 109.606321180000000000
          Height = 30.236220470000000000
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATE_ORDER_BONUS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 616.063390000000000000
          Top = 30.236240000000010000
          Width = 102.047310000000000000
          Height = 30.236220470000000000
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NUM_ORDER_BONUS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Top = 30.236240000000010000
          Width = 374.173470000000000000
          Height = 30.236220470000000000
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."PERCENT"]')
          ParentFont = False
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 374.173470000000000000
          Top = 30.236240000000010000
          Width = 102.047310000000000000
          Height = 30.236220470000000000
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATE_ORDER_BONUS_BEG"]')
          ParentFont = False
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 937.323440000000000000
          Width = 109.606321180000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ACCEPT_DATE_END"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 827.717070000000000000
          Width = 109.606321180000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ACCEPT_DATE_BEG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 718.110700000000000000
          Width = 109.606321180000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATE_ORDER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 616.063390000000000000
          Width = 102.047310000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NUM_ORDER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 476.220780000000000000
          Width = 139.842610000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[ReportDsetData."NAME_ACCEPT_COND"]')
          ParentFont = False
          SuppressRepeated = True
        end
        object Memo37: TfrxMemoView
          Left = 173.102362200000000000
          Width = 200.315090000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_POST"]')
          ParentFont = False
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 374.173470000000000000
          Width = 102.047310000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."date_beg_post"]')
          ParentFont = False
          SuppressRepeated = True
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 117.606370000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.920361175000000000
        object Memo57: TfrxMemoView
          Left = 904.000000000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [date]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Top = 34.015770000000010000
          Width = 1046.929810000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1064#1090#1072#1090#1085#1080#1081' '#1092#1086#1088#1084#1091#1083#1103#1088)
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 491.338900000000000000
          Top = 75.590600000000000000
          Width = 264.567100000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetData."LOC_DATE_CHECK"]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 449.764070000000000000
          Top = 75.590600000000000000
          Width = 37.795300000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1085#1072)
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 60.480000000000000000
        ParentFont = False
        Top = 196.535560000000000000
        Width = 1046.920361175000000000
        ReprintOnNewPage = True
        object Memo6: TfrxMemoView
          Width = 60.472480000000000000
          Height = 30.240000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1082#1072#1088#1090#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Top = 30.239999999999900000
          Width = 60.472480000000000000
          Height = 30.240000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1072#1073'. '#8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 60.472480000000000000
          Width = 112.504020000000000000
          Height = 60.470000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'. '#1030'. '#1041'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 172.980000000000000000
          Width = 65.133890000000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 238.110390000000000000
          Width = 34.015770000000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1057#1090#1072#1090#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 272.126160000000000000
          Width = 102.047310000000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 374.173470000000000000
          Width = 102.047310000000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1095#1077#1085#1080#1081' '#1089#1090#1091#1087#1110#1085#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 476.220780000000000000
          Width = 83.149660000000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1080#1089#1094#1080#1087#1083#1110#1085#1072', '#1103#1082#1091' '#1074#1080#1082#1083#1072#1076#1072#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 559.370440000000000000
          Width = 26.456710000000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1064'/'#1057)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 585.827150000000000000
          Width = 50.236240000000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1094'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 636.063390000000000000
          Width = 55.590538980000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1085#1086#1079#1077#1084#1085#1110' '#1084#1086#1074#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 789.921770000000000000
          Width = 147.400000000000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1089#1074#1110#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 937.320000000000000000
          Width = 51.811008980000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1074#1110#1076#1082#1080' '#1087#1088#1080#1081#1096#1086#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 989.130000000000000000
          Width = 58.708658980000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1040#1082#1072#1076'. '#1074#1095'. '#1079#1074#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 691.653990000000000000
          Width = 49.133828980000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 740.787880000000000000
          Width = 49.133828980000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090'. '#1074'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 691.653990000000000000
          Top = 15.118119999999890000
          Width = 26.456648980000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 718.110700000000000000
          Top = 15.118119999999890000
          Width = 22.677118980000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1084)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 740.787880000000000000
          Top = 15.118119999999890000
          Width = 26.456648980000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 767.244590000000000000
          Top = 15.118119999999890000
          Width = 22.677118980000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1084)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 937.323440000000000000
          Top = 30.236239999999900000
          Width = 109.606321180000000000
          Height = 30.236240000000000000
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 827.717070000000000000
          Top = 30.236239999999900000
          Width = 109.606321180000000000
          Height = 30.236240000000000000
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 718.110700000000000000
          Top = 30.236240000000010000
          Width = 109.606321180000000000
          Height = 30.236240000000000000
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1085#1072#1082'. '#1087#1088#1086' '#1074#1089#1090#1091#1087' '#1085#1072' '#1087#1086#1089'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 616.063390000000000000
          Top = 30.236240000000010000
          Width = 102.047310000000000000
          Height = 30.236240000000000000
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1085#1072#1082'. '#1087#1088#1086' '#1074#1089#1090#1091#1087' '#1085#1072' '#1087#1086#1089'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 476.220780000000000000
          Top = 30.236240000000010000
          Width = 139.842610000000000000
          Height = 30.236240000000000000
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1084#1086#1074#1080' '#1074#1089#1090#1091#1087#1091' '#1085#1072' '#1087#1086#1089#1072#1076#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 172.980000000000000000
          Top = 30.236240000000010000
          Width = 201.190000000000000000
          Height = 30.236240000000000000
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 374.173470000000000000
          Top = 30.236240000000010000
          Width = 102.047310000000000000
          Height = 30.236240000000000000
          DataSetName = 'ReportDSetMovings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1074#1089#1090#1091#1087#1091' '#1085#1072' '#1087#1086#1089#1072#1076#1091)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Memo61: TfrxMemoView
        Top = 14.897650000000000000
        Width = 952.441560000000000000
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 20.000000000000000000
        ParentFont = False
        Top = 585.827150000000000000
        Width = 1046.920361175000000000
        object Memo56: TfrxMemoView
          Left = 1141.418060000000000000
          Top = 11.559370000000060000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1089#1090#1086#1088'. [<Page>] '#1079' [<TotalPages>]')
        end
        object Memo54: TfrxMemoView
          Left = 969.133890000000000000
          Width = 74.677180000000000000
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
      object GroupHeader2: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 325.039580000000000000
        Width = 1046.920361175000000000
        Condition = 'ReportDsetData."NAME_FACULTY"'
        object Memo22: TfrxMemoView
          Align = baCenter
          Left = -0.004724412500150988
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDepartments'
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
      object GroupHeader4: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 366.614410000000000000
        Width = 1046.920361175000000000
        Condition = 'ReportDsetData."NAME_CAFEDRA"'
        object Memo58: TfrxMemoView
          Align = baCenter
          Left = -0.004724412500150988
          Top = 3.779530000000022000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDepartments'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_CAFEDRA"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 30.236240000000000000
        Top = 411.968770000000000000
        Width = 1046.920361175000000000
        Condition = 'ReportDsetData."CARD_NUMBER"'
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataField = 'CARD_NUMBER'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CARD_NUMBER"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 15.118119999999920000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataField = 'TN'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."TN"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 60.472480000000000000
          Width = 112.504020000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 172.976500000000000000
          Width = 65.133890000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."BIRTH_DATE"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 238.110390000000000000
          Width = 34.015770000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataField = 'NAME_SEX'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_SEX"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 272.126160000000000000
          Width = 102.047310000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataField = 'ZVANIE'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.Strings = (
            '[ReportDsetData."ZVANIE"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 374.173470000000000000
          Width = 102.047310000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataField = 'STEPEN'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.Strings = (
            '[ReportDsetData."STEPEN"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 476.220780000000000000
          Width = 83.149660000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataField = 'DISCIPLINE'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          Memo.Strings = (
            '[ReportDsetData."DISCIPLINE"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 559.370440000000000000
          Width = 26.456710000000000000
          Height = 30.236240000000000000
          OnBeforePrint = 'Memo11OnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."IS_POST_MAIN"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 585.827150000000000000
          Width = 50.240000000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataField = 'NATIONALITY'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NATIONALITY"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 636.063390000000000000
          Width = 55.590600000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataField = 'FLANGS'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.Strings = (
            '[ReportDsetData."FLANGS"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 789.921770000000000000
          Width = 147.400000000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.Strings = (
            '[ReportDsetData."EDUCATION"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 937.320000000000000000
          Width = 51.810000000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataField = 'CAME_FROM'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.Strings = (
            '[ReportDsetData."CAME_FROM"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 989.130000000000000000
          Width = 58.710000000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataField = 'AKAD'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.Strings = (
            '[ReportDsetData."AKAD"]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 691.653990000000000000
          Width = 26.456648980000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataField = 'STAJ_ALL_YEARS'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."STAJ_ALL_YEARS"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 718.110700000000000000
          Width = 22.677118980000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataField = 'STAJ_ALL_MONTH'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."STAJ_ALL_MONTH"]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 740.787880000000000000
          Width = 26.456648980000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataField = 'STAJ_FIRM_YEARS'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."STAJ_FIRM_YEARS"]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 767.244590000000000000
          Width = 22.677118980000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataField = 'STAJ_FIRM_MONTH'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."STAJ_FIRM_MONTH"]')
          ParentFont = False
        end
      end
      object GroupHeader5: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 279.685220000000000000
        Width = 1046.920361175000000000
        Condition = 'ReportDsetData."NAME_TYPE_POST"'
        object Memo62: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_TYPE_POST"]')
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
    Left = 192
    Top = 184
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 264
    Top = 184
  end
end
