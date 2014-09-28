object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 212
  Top = 445
  Height = 276
  Width = 342
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = UpdateTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = UpdateTransaction
    Left = 24
    Top = 56
    poSQLINT64ToBCD = True
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39610.506029594900000000
    ReportOptions.LastChange = 39612.585313171290000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 232
    Top = 24
    Datasets = <
      item
        DataSet = ReportDBDSet
        DataSetName = 'ReportDBDSet'
      end
      item
        DataSet = ReportDBDSetFoundationData
        DataSetName = 'ReportDBDSetFoundationData'
      end>
    Variables = <
      item
        Name = ' User Category'
        Value = Null
      end
      item
        Name = 'PSumAll'
        Value = #39#1089#1110#1084' '#1090#1080#1089#1103#1095' '#1096#1110#1089#1090#1089#1086#1090' '#1089#1110#1084' '#1075#1088#1085'. 84 '#1082#1086#1087'.'#39
      end
      item
        Name = 'KodSetup1'
        Value = '2007'
      end
      item
        Name = 'KodSetup2'
        Value = '2008'
      end>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 483.779840000000000000
        Width = 718.110700000000000000
        DataSet = ReportDBDSet
        DataSetName = 'ReportDBDSet'
        RowCount = 0
        object Memo1: TfrxMemoView
          Width = 80.125984251968500000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDBDSet."MONTH"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 159.874015750000000000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataField = 'SUMMA2'
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDBDSet."SUMMA2"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 239.622047240000000000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataField = 'SUMMA3'
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDBDSet."SUMMA3"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 319.370078740000000000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataField = 'SUMMA4'
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDBDSet."SUMMA4"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 399.118110240000000000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataField = 'SUMMA5'
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDBDSet."SUMMA5"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 478.866141730000000000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataField = 'SUMMA6'
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDBDSet."SUMMA6"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 80.125984250000000000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataField = 'SUMMA1'
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDBDSet."SUMMA1"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 558.614173230000000000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDBDSet."SUMMA7"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 638.362204720000000000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[ReportDBDSet."SUMMA8"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 317.480520000000000000
        Top = 608.504330000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            
              #1044#1086#1074#1110#1076#1082#1072' '#1074#1080#1076#1072#1085#1072' '#1085#1072' '#1087#1110#1076#1089#1090#1072#1074#1110' '#1086#1089#1086#1073#1086#1074#1080#1093' '#1088#1072#1093#1091#1085#1082#1110#1074' '#1079#1072' [KodSetup1] - [K' +
              'odSetup2] '#1088#1086#1082#1080)
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 98.267780000000000000
          Top = 98.267780000000030000
          Width = 381.732530000000000000
          Height = 117.165430000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            
              #1050#1077#1088#1110#1074#1085#1080#1082'                                         <u>            ' +
              '                               </u>                             ' +
              '                        '
            
              #1043#1086#1083#1086#1074#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088'                     <u>                      ' +
              '                    </u>'
            ''
            
              #1042#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088'          <u>                           ' +
              '               </u>')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Top = 98.267780000000030000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1052'.'#1055'.')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 464.882190000000000000
          Top = 79.370130000000030000
          Width = 257.008040000000000000
          Height = 22.677180000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '<u>([ReportDBDSetFoundationData."DIRECTOR"])</u>')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 532.913730000000000000
          Top = 94.488249999999990000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1110#1079#1074#1080#1097#1077)
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 476.220780000000000000
          Top = 113.385900000000000000
          Width = 241.889920000000000000
          Height = 22.677180000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '<u>([ReportDBDSetFoundationData."GLBUHG"])</u>')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 540.472790000000000000
          Top = 128.504020000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1110#1079#1074#1080#1097#1077)
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 476.220780000000000000
          Top = 154.960730000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '(                                               )')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Top = 215.433210000000000000
          Width = 718.110700000000000000
          Height = 102.047310000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            
              #1059' '#1076#1086#1074#1110#1076#1082#1091' '#1085#1077' '#1074#1082#1083#1102#1095#1077#1085#1110' '#1074#1080#1087#1083#1072#1090#1080' '#1086#1076#1085#1086#1088#1072#1079#1086#1074#1086#1075#1086' '#1093#1072#1088#1072#1082#1090#1077#1088#1091', '#1085#1077' '#1086#1073#1091#1084#1086#1074#1083 +
              #1077#1085#1110' '#1076#1110#1102#1095#1086#1102' '#1089#1080#1089#1090#1077#1084#1086#1102' '#1086#1087#1083#1072#1090#1080' '#1087#1088#1072#1094#1110', '#1087#1077#1088#1077#1083#1110#1082' '#1103#1082#1080#1093' '#1079#1072#1090#1074#1077#1088#1076#1078#1091#1108#1090#1100#1089#1103' '#1050#1072 +
              #1073#1110#1085#1077#1090#1086#1084' '#1052#1110#1085#1110#1089#1090#1088#1110#1074' '#1059#1082#1088#1072#1111#1085#1080', '#1072' '#1090#1072#1082#1086#1078' '#1089#1091#1084#1080' '#1084#1072#1090#1077#1088#1110#1072#1083#1100#1085#1086#1111' '#1076#1086#1087#1086#1084#1086#1075#1080', '#1097 +
              #1086' '#1085#1072#1076#1072#1102#1090#1100#1089#1103' '#1086#1076#1080#1085' '#1088#1072#1079' '#1087#1088#1086#1090#1103#1075#1086#1084' '#1082#1072#1083#1077#1085#1076#1072#1088#1085#1086#1075#1086' '#1088#1086#1082#1091' '#1074' '#1075#1088#1072#1085#1080#1094#1103#1093' '#1087#1088#1086#1078#1080 +
              #1090#1082#1086#1074#1086#1075#1086' '#1084#1110#1085#1110#1084#1091#1084#1091' '#1110' '#1085#1072' '#1103#1082#1110' '#1085#1077' '#1085#1072#1088#1072#1093#1086#1074#1091#1108#1090#1100#1089#1103' '#1079#1073#1110#1088' '#1085#1072' '#1079#1072#1075#1072#1083#1100#1085#1086#1086#1073#1086#1074#39 +
              #1103#1079#1082#1086#1074#1077' '#1087#1077#1085#1089#1110#1081#1085#1077' '#1089#1090#1088#1072#1093#1091#1074#1072#1085#1085#1103'.'
            
              #1057#1073#1110#1088' '#1085#1072' '#1086#1073#1086#1074#39#1103#1079#1082#1086#1074#1077' '#1087#1077#1085#1089#1110#1081#1085#1077' '#1089#1090#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1087#1088#1086#1074#1086#1076#1080#1074#1089#1103' '#1074' '#1084#1077#1078#1072#1093' '#1084#1072#1082#1089 +
              #1080#1084#1072#1083#1100#1085#1086#1111' '#1074#1077#1083#1080#1095#1080#1085#1080' '#1092#1072#1082#1090#1080#1095#1085#1080#1093' '#1074#1080#1090#1088#1072#1090' '#1085#1072' '#1086#1087#1083#1072#1090#1091' '#1087#1088#1072#1094#1110' '#1079#1075#1110#1076#1085#1086' '#1079' '#1079#1072#1082#1086 +
              #1085#1086#1076#1072#1074#1089#1090#1074#1086#1084'.')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 52.913420000000000000
        Top = 408.189240000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Top = 34.015769999999980000
          Width = 80.125984251968500000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1110)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 80.125984250000000000
          Top = 34.015769999999980000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
        end
        object Memo13: TfrxMemoView
          Left = 159.874015750000000000
          Top = 34.015769999999980000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
        end
        object Memo14: TfrxMemoView
          Left = 239.622047244094000000
          Top = 34.015769999999980000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
        end
        object Memo15: TfrxMemoView
          Left = 319.370078740158000000
          Top = 34.015769999999980000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
        end
        object Memo16: TfrxMemoView
          Left = 399.118110236220000000
          Top = 34.015769999999980000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
        end
        object Memo17: TfrxMemoView
          Left = 478.866141730000000000
          Top = 34.015770000000030000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
        end
        object Memo18: TfrxMemoView
          Left = 558.614173230000000000
          Top = 34.015770000000030000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
        end
        object Memo42: TfrxMemoView
          Top = 11.338590000000010000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072' '#1079#1072#1088#1086#1073#1110#1090#1082#1091' '#1079' '#1088#1086#1079#1096#1080#1092#1088#1091#1074#1072#1085#1085#1103#1084' ('#1075#1088#1085'.)')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 638.362204720000000000
          Top = 34.015770000000030000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 525.354670000000100000
        Width = 718.110700000000000000
        object Memo40: TfrxMemoView
          Width = 80.125984250000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 80.125984250000000000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
        end
        object Memo21: TfrxMemoView
          Left = 159.874015750000000000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
        end
        object Memo22: TfrxMemoView
          Left = 239.622047244094000000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
        end
        object Memo23: TfrxMemoView
          Left = 319.370078740158000000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
        end
        object Memo24: TfrxMemoView
          Left = 399.118110236220000000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
        end
        object Memo25: TfrxMemoView
          Left = 478.866141730000000000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
        end
        object Memo26: TfrxMemoView
          Left = 558.614173230000000000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
        end
        object Memo27: TfrxMemoView
          Left = 638.362204720000000000
          Width = 79.748031500000000000
          Height = 18.897650000000000000
          DataSet = ReportDBDSet
          DataSetName = 'ReportDBDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 328.819110000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 37.795300000000000000
          Width = 680.315400000000000000
          Height = 56.692950000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1044#1086#1076#1072#1090#1086#1082
            #1076#1086' '#1087'. 6 '#1055#1086#1088#1103#1076#1082#1091' '#1087#1086#1076#1072#1085#1085#1103' '#1090#1072' '#1086#1092#1086#1088#1084#1083#1077#1085#1085#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074
            #1076#1083#1103' '#1087#1088#1080#1079#1085#1072#1095#1077#1085#1085#1103' ('#1087#1077#1088#1077#1088#1072#1093#1091#1085#1082#1091') '#1087#1077#1085#1089#1110#1081
            #1074#1110#1076#1087#1086#1074#1099#1076#1085#1086' '#1076#1086' '#1047#1072#1082#1086#1085#1091' '#1059#1082#1088#1072#1111#1085#1080' "'#1055#1088#1086' '#1087#1077#1085#1089#1110#1081#1085#1077' '#1079#1072#1073#1077#1079#1087#1077#1095#1077#1085#1085#1103'"')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Top = 56.692950000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDBDSetFoundationData."FULL_NAME_FIRM"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Top = 86.929190000000010000
          Width = 718.110700000000000000
          Height = 56.692950000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1044#1054#1042#1030#1044#1050#1040' '#1055#1056#1054' '#1047#1040#1056#1054#1041#1030#1058#1054#1050'             '
            #1044#1051#1071' '#1054#1041#1063#1048#1057#1051#1045#1053#1053#1071' '#1055#1045#1053#1057#1030#1031' '#8470'   _______')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo30: TfrxMemoView
          Top = 173.858380000000000000
          Width = 718.110700000000000000
          Height = 113.385900000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1064#1058#1040#1052#1055
            #1086#1088#1075#1072#1085#1091', '#1097#1086' '#1074#1080#1076#1072#1074' '#1076#1086#1074#1110#1076#1082#1091
            ''
            #1042#1080#1076#1072#1085#1072'  [ReportDBDSetFoundationData."FIO"]'
            ''
            
              #1087#1088#1086' '#1090#1077', '#1097#1086' '#1081#1086#1075#1086' ('#1111#1111') '#1079#1072#1088#1086#1073#1110#1090#1086#1082', '#1103#1082#1080#1081' '#1074#1088#1072#1093#1086#1074#1091#1108#1090#1100#1089#1103' '#1087#1088#1080' '#1086#1073#1095#1080#1089#1083#1077#1085#1085#1110 +
              ' '#1087#1077#1085#1089#1110#1111', '#1089#1082#1083#1072#1074)
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Top = 294.803340000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.Strings = (
            '[PSumAll]')
          ParentFont = False
        end
      end
    end
  end
  object ReportDBDSet: TfrxDBDataset
    UserName = 'ReportDBDSet'
    CloseDataSource = False
    DataSet = DSet
    Left = 112
    Top = 56
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 224
    Top = 88
  end
  object ReportDBDSetFoundationData: TfrxDBDataset
    UserName = 'ReportDBDSetFoundationData'
    CloseDataSource = False
    DataSet = DSetFoundationData
    Left = 48
    Top = 176
  end
  object DSetFoundationData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    UpdateTransaction = UpdateTransaction
    Left = 40
    Top = 112
    poSQLINT64ToBCD = True
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = UpdateTransaction
    Left = 144
    Top = 112
  end
  object UpdateTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 200
    Top = 176
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 264
    Top = 152
  end
end
