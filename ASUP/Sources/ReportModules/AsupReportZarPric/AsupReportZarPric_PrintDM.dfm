object DM: TDM
  OldCreateOrder = False
  Left = 387
  Top = 128
  Height = 230
  Width = 259
  object DB: TpFIBDatabase
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
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbFind, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38687.397620613400000000
    ReportOptions.LastChange = 38761.919175717590000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 168
    Datasets = <
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
      end
      item
        DataSet = ReportDSetGlobalData
        DataSetName = 'ReportDsetGlobalData'
      end>
    Variables = <
      item
        Name = 'CUR_DATE'
        Value = #39'16.12.2005'#39
      end
      item
        Name = 'DATE_BEG'
        Value = #39'01.09.2005'#39
      end
      item
        Name = 'DATE_END'
        Value = #39'31.12.2005'#39
      end
      item
        Name = 'FIRM_NAME'
        Value = #39#1044#1054#1053#1045#1062#1068#1050#1048#1049' '#1053#1040#1062#1030#1054#1053#1040#1051#1068#1053#1048#1049' '#1059#1053#1030#1042#1045#1056#1057#1048#1058#1045#1058#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 279.400000000000000000
      PaperHeight = 215.900000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 96.031540000000010000
        Top = 16.000000000000000000
        Width = 980.410081999999900000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 334.740445999999900000
          Top = 27.779530000000000000
          Width = 310.929190000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1087#1080#1089#1086#1082' '#1079#1072#1088#1077#1108#1089#1090#1088#1086#1074#1072#1085#1080#1093' '#1085#1072#1082#1072#1079#1110#1074)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000001000
          Width = 388.787570000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[FIRM_NAME]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 827.717070000000000000
          Top = 2.236239999999999000
          Width = 152.740000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [MASH_DATE]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baCenter
          Left = 331.811256000000000000
          Top = 54.456710000000000000
          Width = 316.787570000000000000
          Height = 26.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            ' '#1085#1072' [CUR_DATE] '#1088'.')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 228.000000000000000000
        Width = 980.410081999999900000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        AllowSplit = True
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo13: TfrxMemoView
          Left = 66.459999999999990000
          Width = 236.350000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NUM_ORDER"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Width = 66.459999999999990000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 302.800000000000000000
          Width = 395.590000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NOTE"]')
        end
        object Memo23: TfrxMemoView
          Left = 698.390000000000000000
          Width = 282.020000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 37.800000000000000000
        Top = 132.000000000000000000
        Width = 980.410081999999900000
        object Memo7: TfrxMemoView
          Width = 66.456710000000000000
          Height = 37.800000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 66.456710000000000000
          Width = 236.346630000000000000
          Height = 37.800000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1080#1081' '#1085#1086#1084#1077#1088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 302.803340000000000000
          Width = 395.590600000000000000
          Height = 37.800000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1088#1086#1090#1082#1080#1081' '#1079#1084#1110#1089#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 698.390000000000000000
          Width = 282.020000000000000000
          Height = 37.800000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1088#1086#1079#1076#1110#1083' '#1088#1086#1079#1089#1080#1083#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 308.000000000000000000
        Width = 980.410081999999900000
        object Memo32: TfrxMemoView
          Left = 867.496600000000000000
          Width = 111.401670000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1057#1090#1086#1088'. [Page#]')
        end
      end
    end
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 88
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 168
    Top = 92
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
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
end
