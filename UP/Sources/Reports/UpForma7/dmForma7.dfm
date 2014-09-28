object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 170
  Height = 314
  Width = 427
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
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 39125.542089293980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Child1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
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
    Variables = <
      item
        Name = ' User Category'
        Value = Null
      end
      item
        Name = 'PDateForm'
        Value = #39'28.12.2005'#39
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
      object ReportTitle1: TfrxReportTitle
        Height = 120.944960000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo11: TfrxMemoView
          Left = 892.000000000000000000
          Top = 21.102350000000000000
          Width = 155.622140000000000000
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
        object Memo14: TfrxMemoView
          Left = 952.441560000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470'7')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 448.000000000000000000
          Top = 41.795300000000000000
          Width = 184.063700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1085#1085#1110)
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Top = 60.472479999999990000
          Width = 1096.063700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1089#1090#1072#1090#1080#1089#1090#1080#1095#1085#1086#1111' '#1079#1074#1110#1090#1085#1086#1089#1090#1110' '#1087#1086' '#1082#1072#1092#1077#1076#1088#1072#1084', '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1091', '#1042#1053#1047#1091)
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Top = 79.370130000000000000
          Width = 1096.063700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1085#1072' [ReportDsetData."LOC_DATE_CHECK"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 56.692950000000000000
        ParentFont = False
        Top = 260.787570000000000000
        Width = 1046.929810000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 403.250000000000000000
          Top = 37.795300000000170000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataField = 'CNT_ALL'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL"]')
        end
        object Memo2: TfrxMemoView
          Left = 403.250000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_MAN'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_MAN"]')
        end
        object Memo3: TfrxMemoView
          Left = 403.250000000000000000
          Top = 18.897650000000170000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_WOMAN'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_WOMAN"]')
        end
        object Memo4: TfrxMemoView
          Left = 558.210000000000000000
          Top = 37.795300000000170000
          Width = 60.740000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_AGE_BETW_15_AND_34"]')
        end
        object Memo5: TfrxMemoView
          Left = 679.420000000000000000
          Top = 37.795300000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataField = 'CNT_ALL_AGE_BETW_50_AND_54'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_AGE_BETW_50_AND_54"]')
        end
        object Memo6: TfrxMemoView
          Left = 739.890000000000000000
          Top = 37.795300000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataField = 'CNT_ALL_AGE_BETW_55_AND_59'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_AGE_BETW_55_AND_59"]')
        end
        object Memo7: TfrxMemoView
          Left = 558.210000000000000000
          Width = 60.740000000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_MAN_AGE_BETW_15_AND_34"]')
        end
        object Memo8: TfrxMemoView
          Left = 679.420000000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_MAN_AGE_BETW_50_AND_54'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_MAN_AGE_BETW_50_AND_54"]')
        end
        object Memo9: TfrxMemoView
          Left = 739.890000000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_MAN_AGE_BETW_55_AND_59'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_MAN_AGE_BETW_55_AND_59"]')
        end
        object Memo16: TfrxMemoView
          Left = 558.210000000000000000
          Top = 18.897650000000170000
          Width = 60.740000000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_WOMAN_AGE_BETW_15_AND_34"]')
        end
        object Memo17: TfrxMemoView
          Left = 679.420000000000000000
          Top = 18.897650000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_WOMAN_AGE_BETW_50_AND_54'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_WOMAN_AGE_BETW_50_AND_54"]')
        end
        object Memo18: TfrxMemoView
          Left = 739.890000000000000000
          Top = 18.897650000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_WOMAN_AGE_BETW_55_AND_59'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_WOMAN_AGE_BETW_55_AND_59"]')
        end
        object Memo19: TfrxMemoView
          Left = 800.360000000000000000
          Top = 37.795300000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataField = 'CNT_ALL_PENS_AGE'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_PENS_AGE"]')
        end
        object Memo20: TfrxMemoView
          Left = 800.360000000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_MAN_PENS_AGE'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_MAN_PENS_AGE"]')
        end
        object Memo21: TfrxMemoView
          Left = 800.360000000000000000
          Top = 18.897650000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_WOMAN_PENS_AGE'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_WOMAN_PENS_AGE"]')
        end
        object Memo22: TfrxMemoView
          Left = 921.300000000000000000
          Top = 37.795300000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataField = 'CNT_ALL_STEPEN_EDU_3_4'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_STEPEN_EDU_3_4"]')
        end
        object Memo23: TfrxMemoView
          Left = 921.300000000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_MAN_STEPEN_EDU_3_4'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_MAN_STEPEN_EDU_3_4"]')
        end
        object Memo24: TfrxMemoView
          Left = 921.300000000000000000
          Top = 18.897650000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_WOMAN_STEPEN_EDU_3_4'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_WOMAN_STEPEN_EDU_3_4"]')
        end
        object Memo26: TfrxMemoView
          Left = 860.830000000000000000
          Top = 37.795300000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataField = 'CNT_ALL_STEPEN_EDU_1_2'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_STEPEN_EDU_1_2"]')
        end
        object Memo27: TfrxMemoView
          Left = 860.830000000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_MAN_STEPEN_EDU_1_2'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_MAN_STEPEN_EDU_1_2"]')
        end
        object Memo28: TfrxMemoView
          Left = 860.830000000000000000
          Top = 18.897650000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_WOMAN_STEPEN_EDU_1_2'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_WOMAN_STEPEN_EDU_1_2"]')
        end
        object Memo29: TfrxMemoView
          Left = 482.620000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1095#1086#1083#1086#1074#1110#1095#1072)
        end
        object Memo30: TfrxMemoView
          Left = 482.620000000000000000
          Top = 18.897650000000170000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1078#1110#1085#1086#1095#1072)
        end
        object Memo31: TfrxMemoView
          Width = 403.250000000000000000
          Height = 56.692950000000000000
          StretchMode = smMaxHeight
          DataField = 'NAME_DEPARTMENT'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT"]')
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 482.620000000000000000
          Top = 37.795300000000170000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
        end
        object Memo44: TfrxMemoView
          Left = 618.950000000000000000
          Top = 37.795300000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataField = 'CNT_ALL_AGE_BETW_15_AND_24'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_AGE_BETW_15_AND_24"]')
        end
        object Memo45: TfrxMemoView
          Left = 618.950000000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_MAN_AGE_BETW_15_AND_24'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_MAN_AGE_BETW_15_AND_24"]')
        end
        object Memo46: TfrxMemoView
          Left = 618.950000000000000000
          Top = 18.897650000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_WOMAN_AGE_BETW_15_AND_24'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_WOMAN_AGE_BETW_15_AND_24"]')
        end
        object Memo48: TfrxMemoView
          Left = 981.770000000000000000
          Top = 37.800000000000130000
          Width = 65.160000000000000000
          Height = 18.897650000000000000
          Color = 15790320
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_STEPEN"]')
        end
        object Memo49: TfrxMemoView
          Left = 1122.150000000000000000
          Top = 37.795300000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataField = 'CNT_ALL_PENS_AGE'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_PENS_AGE"]')
        end
        object Memo50: TfrxMemoView
          Left = 1122.150000000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_MAN_PENS_AGE'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_MAN_PENS_AGE"]')
        end
        object Memo51: TfrxMemoView
          Left = 1122.150000000000000000
          Top = 18.897650000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_WOMAN_PENS_AGE'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_WOMAN_PENS_AGE"]')
        end
        object Memo52: TfrxMemoView
          Left = 1243.090000000000000000
          Top = 37.795300000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataField = 'CNT_ALL_STEPEN_EDU_3_4'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_STEPEN_EDU_3_4"]')
        end
        object Memo53: TfrxMemoView
          Left = 1243.090000000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_MAN_STEPEN_EDU_3_4'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_MAN_STEPEN_EDU_3_4"]')
        end
        object Memo54: TfrxMemoView
          Left = 1243.090000000000000000
          Top = 18.897650000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_WOMAN_STEPEN_EDU_3_4'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_WOMAN_STEPEN_EDU_3_4"]')
        end
        object Memo55: TfrxMemoView
          Left = 1182.620000000000000000
          Top = 37.795300000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataField = 'CNT_ALL_STEPEN_EDU_1_2'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_STEPEN_EDU_1_2"]')
        end
        object Memo56: TfrxMemoView
          Left = 1182.620000000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_MAN_STEPEN_EDU_1_2'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_MAN_STEPEN_EDU_1_2"]')
        end
        object Memo57: TfrxMemoView
          Left = 1182.620000000000000000
          Top = 18.897650000000170000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_WOMAN_STEPEN_EDU_1_2'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_WOMAN_STEPEN_EDU_1_2"]')
        end
        object Memo58: TfrxMemoView
          Left = 981.770000000000000000
          Width = 65.160000000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_MAN_STEPEN"]')
        end
        object Memo59: TfrxMemoView
          Left = 981.770000000000000000
          Top = 18.900000000000030000
          Width = 65.160000000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_WOMAN_STEPEN"]')
        end
      end
      object Header1: TfrxHeader
        Height = 37.800000000000000000
        Top = 200.315090000000000000
        Width = 1046.929810000000000000
        ReprintOnNewPage = True
        object Memo33: TfrxMemoView
          Left = 403.250000000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
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
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 618.950000000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
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
            '15 - 24')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 679.420000000000000000
          Width = 60.472480000000000000
          Height = 37.795300000000000000
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
            '50 - 54')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 739.890000000000000000
          Width = 60.472480000000000000
          Height = 37.795300000000000000
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
            '55 - 59')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 800.360000000000000000
          Width = 60.472480000000000000
          Height = 37.795300000000000000
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
            #1055#1077#1085#1089'. '#1074#1110#1082#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 921.300000000000000000
          Top = 18.900000000000010000
          Width = 60.472480000000000000
          Height = 18.900000000000000000
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
            'III, IV '#1089#1090'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 860.830000000000000000
          Top = 18.900000000000010000
          Width = 60.472480000000000000
          Height = 18.900000000000000000
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
            'I, II '#1089#1090'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 482.620000000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
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
            #1057#1090#1072#1090#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Width = 403.250000000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
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
            #1055#1110#1076#1088#1086#1079#1076#1110#1083)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 558.210000000000100000
          Top = 18.897650000000000000
          Width = 60.740000000000000000
          Height = 18.897650000000000000
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
            #1074#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 558.210000000000100000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '15 - 34')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 860.830000000000000000
          Width = 120.940000000000000000
          Height = 18.900000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1089#1074#1110#1090#1072)
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 981.770000000000000000
          Width = 65.160000000000000000
          Height = 37.800000000000000000
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
            #1047' '#1074#1095#1077#1085'. '#1089#1090#1091#1087#1077#1085#1077#1084)
          ParentFont = False
        end
      end
      object Memo25: TfrxMemoView
        Top = 18.677180000000000000
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
        Height = 20.000000000000000000
        Top = 377.953000000000000000
        Width = 1046.929810000000000000
        object Memo10: TfrxMemoView
          Left = 992.000000000000000000
          Width = 52.000000000000000000
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
    Left = 336
    Top = 8
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 344
    Top = 64
  end
end
