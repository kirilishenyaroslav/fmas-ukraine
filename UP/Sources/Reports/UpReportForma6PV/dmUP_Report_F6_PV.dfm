object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 124
  Height = 308
  Width = 380
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 56
  end
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
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 128
    Top = 117
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 128
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
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38706.462171944400000000
    ReportOptions.LastChange = 41298.721856412030000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var PLine:integer=0;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  PLine:=0;'
      'end;'
      ''
      'procedure Memo25OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  inc(PLine);'
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
      end
      item
        DataSet = ReportDsPension
        DataSetName = 'ReportDsPension'
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
        Height = 103.590600000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo17: TfrxMemoView
          Top = 71.811070000000000000
          Width = 718.110236220000000000
          Height = 28.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074' '#1079#1072' '#1103#1082#1110#1089#1085#1080#1084' '#1089#1082#1083#1072#1076#1086#1084' '#1085#1072' [CUR_DATE]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Top = 7.338590000000000000
          Width = 718.110236220000000000
          Height = 52.913420000000000000
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
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 918.425790000000000000
        Width = 718.110700000000000000
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
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 631.181510000000000000
        ParentFont = False
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        object Memo4: TfrxMemoView
          Width = 491.338900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '1. '#1054#1073#1083#1110#1082#1086#1074#1072' '#1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1096#1090#1072#1090#1085#1080#1093' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074' '#1085#1072' '#1082#1110#1085#1077#1094#1100' '#1088#1086#1082#1091', '#1091#1089#1100#1086#1075#1086)
          VAlign = vaBottom
        end
        object Memo5: TfrxMemoView
          Top = 22.677180000000000000
          Width = 491.338900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1079' '#1085#1080#1093':'
            
              '1.2. '#1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1087#1088#1080#1081#1085#1103#1090#1110' '#1085#1072' '#1091#1084#1086#1074#1072#1093' '#1085#1077#1087#1086#1074#1085#1086#1075#1086' '#1088#1086#1073 +
              #1086#1095#1086#1075#1086' '#1076#1085#1103' ('#1090#1080#1078#1085#1103')')
          VAlign = vaBottom
        end
        object Memo6: TfrxMemoView
          Top = 56.692950000000000000
          Width = 491.338900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '1.3. '#1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1088#1072#1094#1102#1102#1095#1080#1093' '#1091' '#1074#1110#1094#1110' ('#1088#1086#1082#1110#1074'):'
            '     -15-35')
          VAlign = vaBottom
        end
        object Memo7: TfrxMemoView
          Top = 90.708720000000000000
          Width = 491.338900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '     -51-55')
          VAlign = vaBottom
        end
        object Memo8: TfrxMemoView
          Top = 113.385900000000000000
          Width = 491.338900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '     -55-59')
          VAlign = vaBottom
        end
        object Memo9: TfrxMemoView
          Top = 136.063080000000000000
          Width = 491.338900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            
              '1.4. '#1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1084#1072#1102#1089#1090#1100' '#1074#1080#1097#1091' '#1086#1089#1074#1110#1090#1091' '#1079#1072' '#1086#1089#1074#1110#1090#1085#1110#1084#1080' ' +
              ' '#1088#1110#1074#1085#1103#1084#1080':'
            '     - '#1085#1077#1087#1086#1074#1085#1072' '#1090#1072' '#1073#1072#1079#1086#1074#1072' '#1074#1080#1097#1072' '#1086#1089#1074#1110#1090#1072)
          VAlign = vaBottom
        end
        object Memo11: TfrxMemoView
          Top = 170.078850000000000000
          Width = 491.338900000000000000
          Height = 22.677165350000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '     - '#1087#1086#1074#1085#1072' '#1074#1080#1097#1072' '#1086#1089#1074#1110#1090#1072)
          VAlign = vaBottom
        end
        object Memo12: TfrxMemoView
          Top = 192.756030000000000000
          Width = 491.338900000000000000
          Height = 22.677165350000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '1.5. '#1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1086#1090#1088#1080#1084#1091#1102#1090#1100' '#1087#1077#1085#1089#1110#1102', '#1091#1089#1100#1086#1075#1086)
          VAlign = vaBottom
        end
        object Memo13: TfrxMemoView
          Top = 215.433210000000000000
          Width = 491.338900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1091' '#1090#1086#1084#1091' '#1095#1080#1089#1083#1110':'
            '     - '#1079#1072' '#1074#1080#1089#1083#1091#1075#1091' '#1088#1086#1082#1110#1074)
          VAlign = vaBottom
        end
        object Memo14: TfrxMemoView
          Top = 249.448980000000000000
          Width = 491.338900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '     - '#1079#1072' '#1074#1110#1082#1086#1084)
          VAlign = vaBottom
        end
        object Memo15: TfrxMemoView
          Top = 272.126160000000000000
          Width = 491.338900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '     - '#1087#1086' '#1110#1085#1074#1072#1083#1110#1076#1085#1086#1089#1090#1110', '#1091#1089#1100#1086#1075#1086)
          VAlign = vaBottom
        end
        object Memo18: TfrxMemoView
          Top = 294.803340000000000000
          Width = 491.338900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '            '#1079' '#1085#1080#1093' '#1030#1030#1030' '#1075#1088#1091#1087#1080)
          VAlign = vaBottom
        end
        object Memo19: TfrxMemoView
          Top = 408.189240000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '2. '#1030#1079' '#1079#1072#1075#1072#1083#1100#1085#1086#1111' '#1082#1110#1083#1100#1082#1086#1089#1090#1110' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074':')
          VAlign = vaBottom
        end
        object Memo20: TfrxMemoView
          Top = 430.866420000000000000
          Width = 491.338900000000000000
          Height = 22.677165350000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            
              '2.1. '#1047#1085#1072#1093#1086#1076#1103#1090#1100#1089#1103' '#1091' '#1074#1110#1076#1087#1091#1089#1090#1094#1110' '#1091' '#1079#1074#39#1103#1079#1082#1091' '#1079' '#1074#1072#1075#1110#1090#1085#1110#1089#1090#1102' '#1090#1072' '#1087#1086#1083#1086#1075#1072#1084#1080',' +
              ' '#1091#1089#1100#1086#1075#1086)
          VAlign = vaBottom
        end
        object Memo21: TfrxMemoView
          Top = 453.543600000000000000
          Width = 491.338900000000000000
          Height = 34.015748030000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            
              '2.2. '#1047#1085#1072#1093#1086#1076#1103#1090#1100#1089#1103' '#1091' '#1074#1110#1076#1087#1091#1089#1090#1094#1110' '#1087#1086' '#1076#1086#1075#1083#1103#1076#1091' '#1079#1072' '#1076#1080#1090#1080#1085#1086#1102' '#1076#1086' '#1076#1086#1089#1103#1075#1085#1077#1085#1085#1103 +
              ' '#1085#1077#1102' '#1074#1110#1082#1091', '
            #1074#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086#1075#1086' '#1095#1080#1085#1085#1080#1084' '#1079#1072#1082#1086#1085#1086#1076#1072#1074#1089#1090#1074#1086#1084', '#1091#1089#1100#1086#1075#1086':')
          VAlign = vaBottom
        end
        object Memo22: TfrxMemoView
          Top = 487.559370000000000000
          Width = 491.338900000000000000
          Height = 34.015748030000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            
              '2.3. '#1055#1088#1086#1078#1080#1074#1072#1102#1090#1100' '#1085#1072' '#1090#1077#1088#1080#1090#1086#1088#1110#1111' '#1110#1085#1096#1080#1093' '#1088#1077#1075#1110#1086#1085#1110#1074' ('#1040#1056' '#1050#1088#1080#1084', '#1086#1073#1083#1072#1089#1090#1077#1081', ' +
              #1084'.'#1050#1080#1108#1074#1072', '
            #1084'. '#1057#1077#1074#1072#1089#1090#1086#1087#1086#1083#1103', '#1087#1086#1079#1072' '#1084#1077#1078#1072#1084#1080' '#1059#1082#1088#1072#1111#1085#1080'):')
          VAlign = vaBottom
        end
        object Memo24: TfrxMemoView
          Top = 521.575140000000000000
          Width = 491.338900000000000000
          Height = 22.677165350000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '2.4. '#1052#1072#1102#1090#1100' '#1085#1072#1091#1082#1086#1074#1080#1081' '#1089#1090#1091#1087#1110#1085#1100)
          VAlign = vaBottom
        end
        object Memo25: TfrxMemoView
          Left = 491.338900000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_MAN"]')
          VAlign = vaBottom
        end
        object Memo26: TfrxMemoView
          Left = 491.338900000000000000
          Top = 22.677180000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_NEPOLN"]')
          VAlign = vaBottom
        end
        object Memo27: TfrxMemoView
          Left = 491.338900000000000000
          Top = 56.692950000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_YEARS_1"]')
          VAlign = vaBottom
        end
        object Memo29: TfrxMemoView
          Left = 491.338900000000000000
          Top = 113.385900000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_YEARS_3"]')
          VAlign = vaBottom
        end
        object Memo30: TfrxMemoView
          Left = 491.338900000000000000
          Top = 136.063080000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_NOTFULL_EDUC"]')
          VAlign = vaBottom
        end
        object Memo31: TfrxMemoView
          Left = 491.338900000000000000
          Top = 170.078850000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_FULL_EDUC"]')
          VAlign = vaBottom
        end
        object Memo32: TfrxMemoView
          Left = 491.338900000000000000
          Top = 192.756030000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_PENSION"]')
          VAlign = vaBottom
        end
        object Memo33: TfrxMemoView
          Left = 491.338900000000000000
          Top = 215.433210000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_PENSION_VISLUGA"]')
          VAlign = vaBottom
        end
        object Memo34: TfrxMemoView
          Left = 491.338900000000000000
          Top = 249.448980000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_PENSION_VOZRAST"]')
          VAlign = vaBottom
        end
        object Memo35: TfrxMemoView
          Left = 491.338900000000000000
          Top = 272.126160000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_PENSION_INVALID"]')
          VAlign = vaBottom
        end
        object Memo36: TfrxMemoView
          Left = 491.338900000000000000
          Top = 294.803340000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_PENSION_INVAL_3"]')
          VAlign = vaBottom
        end
        object Memo37: TfrxMemoView
          Left = 491.338900000000000000
          Top = 430.866420000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          VAlign = vaBottom
        end
        object Memo38: TfrxMemoView
          Left = 491.338900000000000000
          Top = 453.543600000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_DEKRET"]')
          VAlign = vaBottom
        end
        object Memo39: TfrxMemoView
          Left = 491.338900000000000000
          Top = 487.559370000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_MIGR"]')
          VAlign = vaBottom
        end
        object Memo40: TfrxMemoView
          Left = 491.338900000000000000
          Top = 521.575140000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_STEPEN"]')
          VAlign = vaBottom
        end
        object Memo41: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_WOMAN"]')
          VAlign = vaBottom
        end
        object Memo42: TfrxMemoView
          Left = 604.724800000000000000
          Top = 22.677180000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_WOMAN_NEPOLN"]')
          VAlign = vaBottom
        end
        object Memo43: TfrxMemoView
          Left = 604.724800000000000000
          Top = 56.692950000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WOMAN_YEARS_1"]')
          VAlign = vaBottom
        end
        object Memo44: TfrxMemoView
          Left = 604.724800000000000000
          Top = 90.708720000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WOMAN_YEARS_2"]')
          VAlign = vaBottom
        end
        object Memo46: TfrxMemoView
          Left = 604.724800000000000000
          Top = 136.063080000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WOMAN_NOTFULL_EDUC"]')
          VAlign = vaBottom
        end
        object Memo47: TfrxMemoView
          Left = 604.724800000000000000
          Top = 170.078850000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WOMAN_FULL_EDUC"]')
          VAlign = vaBottom
        end
        object Memo48: TfrxMemoView
          Left = 604.724800000000000000
          Top = 192.756030000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WOMAN_PENSION"]')
          VAlign = vaBottom
        end
        object Memo49: TfrxMemoView
          Left = 604.724800000000000000
          Top = 215.433210000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WOMAN_PENSION_VISLUGA"]')
          VAlign = vaBottom
        end
        object Memo50: TfrxMemoView
          Left = 604.724800000000000000
          Top = 249.448980000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WOMAN_PENSION_VOZRAST"]')
          VAlign = vaBottom
        end
        object Memo51: TfrxMemoView
          Left = 604.724800000000000000
          Top = 272.126160000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WOMAN_PENSION_INVALID"]')
          VAlign = vaBottom
        end
        object Memo52: TfrxMemoView
          Left = 604.724800000000000000
          Top = 294.803340000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WOMAN_PENSION_INVAL_3"]')
          VAlign = vaBottom
        end
        object Memo53: TfrxMemoView
          Left = 604.724800000000000000
          Top = 430.866420000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WOMAN_RODY"]')
          VAlign = vaBottom
        end
        object Memo54: TfrxMemoView
          Left = 604.724800000000000000
          Top = 453.543600000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WOMAN_DEKRET"]')
          VAlign = vaBottom
        end
        object Memo55: TfrxMemoView
          Left = 604.724800000000000000
          Top = 487.559370000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_WOMEN_MIGR"]')
          VAlign = vaBottom
        end
        object Memo56: TfrxMemoView
          Left = 604.724800000000000000
          Top = 521.575140000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          VAlign = vaBottom
        end
        object Memo23: TfrxMemoView
          Top = 317.480520000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '1.5'#1072'. '#1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1086#1090#1088#1080#1084#1091#1102#1090#1100' '#1087#1077#1085#1089#1110#1102)
          VAlign = vaBottom
        end
        object Memo57: TfrxMemoView
          Top = 340.157700000000000000
          Width = 491.338900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '     - '#1079#1072' '#1074#1110#1082#1086#1084' ('#1079#1072' '#1076#1072#1085#1080#1084#1080' '#1087#1088#1086' '#1074#1110#1082')')
          VAlign = vaBottom
        end
        object Memo58: TfrxMemoView
          Left = 491.338900000000000000
          Top = 340.157700000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_PENSION_VOZRAST_2"]')
          VAlign = vaBottom
        end
        object Memo59: TfrxMemoView
          Left = 604.724800000000000000
          Top = 340.157700000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WOMAN_PENSION_VOZRAST_2"]')
          VAlign = vaBottom
        end
        object Memo60: TfrxMemoView
          Top = 362.834880000000000000
          Width = 491.338900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '     - '#1087#1086' '#1110#1085#1074#1072#1083#1110#1076#1085#1086#1089#1090#1110', '#1091#1089#1100#1086#1075#1086' ('#1079#1072' '#1076#1072#1085#1080#1084#1080' '#1087#1088#1086' '#1110#1085#1074#1072#1083#1110#1076#1085#1110#1089#1090#1100')')
          VAlign = vaBottom
        end
        object Memo61: TfrxMemoView
          Top = 385.512060000000000000
          Width = 491.338900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '            '#1079' '#1085#1080#1093' '#1030#1030#1030' '#1075#1088#1091#1087#1080)
          VAlign = vaBottom
        end
        object Memo62: TfrxMemoView
          Left = 491.338900000000000000
          Top = 362.834880000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_PENSION_INVALID_I"]')
          VAlign = vaBottom
        end
        object Memo63: TfrxMemoView
          Left = 491.338900000000000000
          Top = 385.512060000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."ALL_PENSION_INVALID_3_I"]')
          VAlign = vaBottom
        end
        object Memo64: TfrxMemoView
          Left = 604.724800000000000000
          Top = 362.834880000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WOMAN_PENSION_INVALID_I"]')
          VAlign = vaBottom
        end
        object Memo65: TfrxMemoView
          Left = 604.724800000000000000
          Top = 385.512060000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WOMAN_PENSION_INVALID_3_I"]')
          VAlign = vaBottom
        end
        object Memo28: TfrxMemoView
          Left = 491.338900000000000000
          Top = 90.708720000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          VAlign = vaBottom
        end
        object Memo45: TfrxMemoView
          Left = 604.724800000000000000
          Top = 113.385900000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          VAlign = vaBottom
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        object Memo1: TfrxMemoView
          Width = 491.338900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1087#1086#1082#1072#1079#1085#1080#1082#1110#1074)
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 491.338900000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086', '#1086#1089#1110#1073)
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1079' '#1085#1080#1093' '#1078#1110#1085#1082#1080)
          VAlign = vaCenter
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 209.973333333333300000
      PaperHeight = 296.926000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 35.559060000000000000
        Top = 18.897650000000000000
        Width = 718.009912533333300000
        object Memo75: TfrxMemoView
          Top = 7.559060000000000000
          Width = 718.110236220000000000
          Height = 28.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074' '#1091' '#1088#1086#1079#1088#1110#1079#1110' '#1090#1080#1087#1110#1074' '#1087#1077#1085#1089#1110#1081)
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 26.456710000000000000
        ParentFont = False
        Top = 113.385900000000000000
        Width = 718.009912533333300000
        ReprintOnNewPage = True
        object Memo66: TfrxMemoView
          Width = 491.338900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1090#1080#1087#1091' '#1087#1077#1085#1089#1110#1111)
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 491.338900000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086', '#1086#1089#1110#1073)
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1079' '#1085#1080#1093' '#1078#1110#1085#1082#1080)
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 207.874150000000000000
        Width = 718.009912533333300000
        object Memo69: TfrxMemoView
          Width = 491.338900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086': ')
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 491.338900000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Sum(<ReportDSPension."ALL_PENSION">, MasterData2)]')
          VAlign = vaBottom
        end
        object Memo71: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Sum(<ReportDSPension."WOMAN_PENSION">, MasterData2)]')
          VAlign = vaBottom
        end
      end
      object MasterData2: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 162.519790000000000000
        Width = 718.009912533333300000
        DataSet = ReportDsPension
        DataSetName = 'ReportDsPension'
        RowCount = 0
        object Memo72: TfrxMemoView
          Width = 491.338900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDSPension."Name_Pension_Type"]')
          VAlign = vaBottom
        end
        object Memo73: TfrxMemoView
          Left = 491.338900000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDSPension."ALL_PENSION"]')
          VAlign = vaBottom
        end
        object Memo74: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDSPension."WOMAN_PENSION"]')
          VAlign = vaBottom
        end
      end
      object PageFooter2: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 291.023810000000000000
        Width = 718.009912533333300000
        object Memo76: TfrxMemoView
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
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 200
    Top = 116
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
    Left = 200
    Top = 176
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 280
    Top = 176
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
  object DsPension: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 176
    poSQLINT64ToBCD = True
  end
  object ReportDsPension: TfrxDBDataset
    UserName = 'ReportDsPension'
    CloseDataSource = False
    DataSet = DsPension
    Left = 128
    Top = 176
  end
end
